-- AssaultCube Ammo Maintainer Mod
-- Maintains ammo at initial levels by monitoring and restoring when changed

print("Ammo Maintainer Mod Started")

-- Initial ammo values
local initial_reserve = nil
local initial_clipped = nil
local monitoring = true

-- Get initial ammo values
function initialize_ammo()
    initial_reserve = get_reserve_ammo()
    initial_clipped = get_clipped_ammo()
    
    if initial_reserve and initial_clipped then
        print("Initial ammo levels captured:")
        print("  Reserve Ammo: " .. initial_reserve)
        print("  Clipped Ammo: " .. initial_clipped)
        return true
    else
        print("Failed to read initial ammo levels")
        return false
    end
end

-- Check and restore ammo if changed
function maintain_ammo()
    if not initial_reserve or not initial_clipped then
        return false
    end
    
    local current_reserve = get_reserve_ammo()
    local current_clipped = get_clipped_ammo()
    
    if not current_reserve or not current_clipped then
        print("Warning: Could not read current ammo levels")
        return false
    end
    
    local changed = false
    
    -- Check reserve ammo
    if current_reserve ~= initial_reserve then
        print("Reserve ammo changed: " .. current_reserve .. " -> " .. initial_reserve)
        if set_reserve_ammo(initial_reserve) then
            changed = true
        else
            print("Failed to restore reserve ammo")
        end
    end
    
    -- Check clipped ammo
    if current_clipped ~= initial_clipped then
        print("Clipped ammo changed: " .. current_clipped .. " -> " .. initial_clipped)
        if set_clipped_ammo(initial_clipped) then
            changed = true
        else
            print("Failed to restore clipped ammo")
        end
    end
    
    if changed then
        print("Ammo levels restored")
    end
    
    return true
end

-- Main mod loop
function main()
    print("Initializing ammo maintainer...")
    
    if not initialize_ammo() then
        print("Mod failed to initialize")
        return
    end
    
    print("Starting ammo monitoring loop...")
    print("Ammo will be maintained at initial levels")
    
    local loop_count = 0
    
    while monitoring do
        if not maintain_ammo() then
            print("Ammo maintenance failed, retrying...")
        end
        
        loop_count = loop_count + 1
        
        -- Status update every 30 seconds (assuming 1 second sleep)
        if loop_count % 30 == 0 then
            print("Ammo maintainer running... (checked " .. loop_count .. " times)")
        end
        
        sleep(1) -- Check every second
    end
    
    print("Ammo maintainer stopped")
end

-- Start the mod
main()