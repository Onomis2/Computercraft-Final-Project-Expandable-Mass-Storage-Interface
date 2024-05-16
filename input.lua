return function(selectedBarrelInput)
    local barrel = peripheral.wrap(selectedBarrelInput)
    
    if #barrel.list() > 0 then
        print("Items found in input barrel. Pushing to storage...")
        local chests = dofile("findCentralStorage.lua")
        
        for slot, itemStored in pairs(barrel.list()) do
            local itemTransferred = false
            
            for _, chestName in pairs(chests) do
                local chest = peripheral.wrap(chestName)
                if chest then
                    -- Attempt to push items to the current chest
                    local transferred = barrel.pushItems(chestName, slot)
                    
                    if transferred > 0 then
                        itemTransferred = true
                        break  -- Exit the loop since the item has been transferred
                    end
                end
            end
            
            if not itemTransferred then
                print("Warning: No available space in storage chests for slot " .. slot)
                break  -- Optional: stop processing if storage is full
            end
        end
    else
        print("No items found in input barrel.")
    end
end
