# AssaultCube Mod Manager - Linux

A secure mod manager for AssaultCube with advanced memory protection and compiled mod support.

## 🚀 Features

- **Secure Mod Execution**: Compiled Lua mod support (.acml files)
- **Memory Protection**: Advanced MBL framework for intellectual property protection
- **GUI Interface**: User-friendly PyQt5 interface with integrated privilege escalation
- **Desktop Integration**: Applications menu entry and command-line access
- **Professional Installation**: Self-extracting installer with GUI and terminal modes

## 📋 System Requirements

- **Linux Distribution**: Ubuntu 18.04+ / Debian 9+ / Fedora 30+ (or compatible)
- **Architecture**: x86_64 (64-bit)
- **Dependencies**: glibc 2.3.9+ (included in most modern distributions)
- **AssaultCube**: Game must be installed
- **Privileges**: Administrator access required for memory operations

## 🛠️ Installation

### Method 1: GUI Installation (Recommended)
1. Download `ACMM-Linux-Installer.run` from [Releases](../../releases)
2. Double-click the installer file
3. Follow the GUI prompts
4. Enter your password when requested

### Method 2: Terminal Installation
```bash
# Download the installer
wget https://github.com/PlayDough1992/AssaultCube-Mod-Manager-Linux/releases/download/mod/ACMM-Linux-Complete.tar.gz

# Make executable and run
chmod +x ACMM-Linux-Installer.run
bash ACMM-Linux-Installer.run

# Or run with automatic sudo
sudo bash ACMM-Linux-Installer.run
```

## 🎮 Usage

### Launch Methods:
- **Applications Menu**: Find "AssaultCube Mod Manager" in Games category
- **Terminal**: Run `acmm` command from anywhere
- **Direct**: Execute `/opt/assaultcube-mod-manager/ACMM-Linux`

### Basic Workflow:
1. Launch the mod manager
2. Click "Launch Game" to start AssaultCube
3. Click "Connect to Game" once AssaultCube is running
4. Load and execute compiled mods (.acml files)

## 🔧 Installation Details

The installer automatically:
- Installs to `/opt/assaultcube-mod-manager/`
- Creates desktop entry in Applications menu
- Sets up command-line shortcut (`acmm`)
- Installs icons in system directories
- Configures proper permissions

## 🗑️ Uninstallation

```bash
sudo bash /opt/assaultcube-mod-manager/uninstall.sh
```

## 🛡️ Security Features

- **Compiled Mod Protection**: Only executes compiled .acml files
- **Memory Access Control**: Secure process memory manipulation
- **Privilege Escalation**: GUI-based administrator authentication
- **IP Protection**: MBL framework prevents reverse engineering

## 📊 Technical Specifications

- **Package Size**: 99MB (self-contained)
- **Runtime Dependencies**: None (all libraries included)
- **Memory Access Method**: Linux `/proc/pid/mem`
- **GUI Framework**: PyQt5
- **Compilation**: PyInstaller single executable

## 🐛 Troubleshooting

### Common Issues:

**"Permission denied" errors:**
- Ensure you're running with administrator privileges
- Use `sudo acmm` if necessary

**"Game not found" errors:**
- Install AssaultCube from official repositories
- Check that `/usr/games/assaultcube` exists

**"Cannot connect to game" errors:**
- Launch AssaultCube first using the mod manager
- Wait for the game to fully load before connecting

## 📝 License

[Specify your license here - e.g., "Proprietary", "MIT", etc.]

## 🔗 Links

- **AssaultCube Official**: https://assault.cubers.net/
- **Support**: [Create an issue](../../issues)

## 📱 Version

**Current Version**: 1.0 Linux Beta  
**Release Date**: October 2025  
**Compatibility**: Linux x86_64

---
*Built with security and performance in mind for the AssaultCube modding community.*