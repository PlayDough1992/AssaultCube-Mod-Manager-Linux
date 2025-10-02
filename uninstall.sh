#!/bin/bash
# AssaultCube Mod Manager Uninstaller

INSTALL_DIR="/opt/assaultcube-mod-manager"
DESKTOP_FILE="/usr/share/applications/assaultcube-mod-manager.desktop"
BIN_LINK="/usr/local/bin/acmm"

echo "Uninstalling AssaultCube Mod Manager..."

# Check if running as root
if [ "$EUID" -ne 0 ]; then
    echo "This uninstaller requires administrator privileges."
    echo "Please run with sudo or as root."
    exit 1
fi

# Remove files
rm -rf "$INSTALL_DIR"
rm -f "$DESKTOP_FILE"
rm -f "$BIN_LINK"

# Remove icon files
echo "Removing icon files..."
ICON_SIZES="16 24 32 48 64 128 256 512"
for size in $ICON_SIZES; do
    ICON_DIR="/usr/share/icons/hicolor/${size}x${size}/apps"
    rm -f "$ICON_DIR/acmm-icon.png"
done
rm -f /usr/share/pixmaps/acmm-icon.png

# Update icon cache
if command -v gtk-update-icon-cache >/dev/null 2>&1; then
    gtk-update-icon-cache /usr/share/icons/hicolor >/dev/null 2>&1 || true
fi

# Update desktop database
if command -v update-desktop-database >/dev/null 2>&1; then
    update-desktop-database /usr/share/applications
fi

echo "AssaultCube Mod Manager has been uninstalled."
