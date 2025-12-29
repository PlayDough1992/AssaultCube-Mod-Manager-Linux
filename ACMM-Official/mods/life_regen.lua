-- AssaultCube Life Regeneration Mod
-- Monitors player health, waits 2.5 seconds after damage, then regenerates 1 HP per cycle

print("Life Regen Mod Started")

-- State variables
local last_health = nil
local damage_taken_time = nil
local regen_active = false
local monitoring = true

-- Wait function (simulated with sleep)
function wait_seconds(seconds)
    sleep(seconds)
end

-- Initialize health tracking
function initialize_health()
    print("[DEBUG] Attempting to read initial health...")
    last_health = get_player_health()
    
    print("[DEBUG] get_player_health() returned: " .. tostring(last_health))
    
    if last_health then
        print("Initial health captured: " .. last_health)
        return true
    else
        print("Failed to read initial health - the health pointer offset may be incorrect for your AssaultCube version")
        print("Current PID and heap base are being used correctly, but the offset may need adjustment")
        return false
    end
end

-- Check if player took damage and handle regeneration
function check_and_regen_health()
    if not last_health then
        return false
    end
    
    local current_health = get_player_health()
    
    if not current_health then
        print("Warning: Could not read current health")
        return false
    end
    
    -- Check if damage was taken (health decreased)
    if current_health < last_health then
        print("Damage taken! Health: " .. current_health .. " (was " .. last_health .. ")")
        damage_taken_time = os.time()
        regen_active = true
    end
    
    -- If player took damage, wait 2.5 seconds before regenerating
    if regen_active and damage_taken_time then
        local time_since_damage = os.time() - damage_taken_time
        
        if time_since_damage >= 2.5 then
            -- 2.5 seconds have passed, start regeneration
            print("2.5 second wait complete, starting regeneration...")
            
            -- Regenerate 1 HP per cycle until we hit 100
            if current_health < 100 then
                local new_health = current_health + 1
                
                if set_player_health(new_health) then
                    current_health = new_health
                    print("Regenerating... Health: " .. current_health)
                else
                    print("Warning: Failed to set health")
                    return false
                end
                
                -- Check if player took new damage during regen - if so, restart the timer
                local check_health = get_player_health()
                if check_health and check_health < current_health then
                    print("New damage taken during regeneration, restarting timer...")
                    damage_taken_time = os.time()
                    return true
                end
            else
                -- Reached 100 HP
                print("Regeneration complete! Health at 100")
                regen_active = false
                damage_taken_time = nil
            end
        end
    end
    
    -- Update last known health for next iteration
    last_health = current_health
    
    return true
end

-- Main mod loop
function main()
    print("Initializing life regeneration...")
    
    if not initialize_health() then
        print("Mod failed to initialize")
        return
    end
    
    print("Starting health monitoring loop...")
    print("The mod will:")
    print("- Monitor your health")
    print("- Detect when you take damage")
    print("- Wait 2.5 seconds after damage")
    print("- Regenerate 1 HP per cycle until 100%")
    
    local loop_count = 0
    
    while monitoring do
        if not check_and_regen_health() then
            print("Health check failed, retrying...")
        end
        
        loop_count = loop_count + 1
        
        -- Status update every 30 seconds
        if loop_count % 30 == 0 then
            local current_health = get_player_health()
            if current_health then
                print("Life regen mod running... (checked " .. loop_count .. " times, current health: " .. current_health .. ")")
            end
        end
        
        wait_seconds(0.1) -- Check every 100ms for responsiveness
    end
    
    print("Life regeneration mod stopped")
end

-- Start the mod
main()
