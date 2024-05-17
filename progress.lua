return function(selectedMonitorRequest)
    local monitor = peripheral.wrap(selectedMonitorRequest)
    local peripherals = peripheral.getNames()
    local modems = {}

    for _, name in ipairs(peripherals) do
        if peripheral.getType(name) == "modem" then
            table.insert(modems, peripheral.wrap(name))
        end
    end

    if #modems == 0 then
        print("No modems found")
        return
    end

    print("Modems found: " .. #modems)

    for _, modem in ipairs(modems) do
        local connectedPeripherals = modem.getNamesRemote()
        for _, connectedName in ipairs(connectedPeripherals) do
            if peripheral.getType(connectedName) == "modem" then
                print("Modem " .. modem.getSide() .. " is connected to " .. connectedName)
            end
        end
    end

    local function drawVerticalProgressBar(monitor, usedItems, totalSlots)
        local width, height = monitor.getSize()
        local barHeight = height - 1
        local filledHeight = math.floor((usedItems / (totalSlots * 64)) * barHeight)
        local emptyHeight = barHeight - filledHeight
        local barXPos = math.floor(width / 2)

        for y = 1, filledHeight do
            monitor.setCursorPos(barXPos, height - 1 - y)
            monitor.setBackgroundColor(colors.green)
            monitor.write("     ")
        end

        for y = filledHeight + 1, barHeight do
            monitor.setCursorPos(barXPos, height - y)
            monitor.setBackgroundColor(colors.red)
            monitor.write("     ")
        end

        monitor.setBackgroundColor(colors.black)
    end

    local function countItems(inventory)
        local totalItems = 0
        for slot, item in pairs(inventory) do
            totalItems = totalItems + item.count
        end
        return totalItems
    end

    local function findChestConnectedToModem(modem)
        local connectedPeripherals = modem.getNamesRemote()
        local totalUsedItems, totalSlots = 0, 0
        for _, peripheralName in ipairs(connectedPeripherals) do
            local peripheralType = peripheral.getType(peripheralName)
            if peripheralType == "minecraft:chest" then
                local peripheralObject = peripheral.wrap(peripheralName)
                local inventory = peripheralObject.list()
                totalSlots = totalSlots + peripheralObject.size()
                totalUsedItems = totalUsedItems + countItems(inventory)
            elseif peripheralType == "modem" then
                local subModem = peripheral.wrap(peripheralName)
                local subUsedItems, subSlots = findChestConnectedToModem(subModem)
                totalUsedItems = totalUsedItems + subUsedItems
                totalSlots = totalSlots + subSlots
            end
        end
        return totalUsedItems, totalSlots
    end

    local totalUsedItems, totalSlots = 0, 0
    for _, modem in ipairs(modems) do
        local usedItems, slots = findChestConnectedToModem(modem)
        totalUsedItems = totalUsedItems + usedItems
        totalSlots = totalSlots + slots
    end

    local monitorWidth, monitorHeight = monitor.getSize()

    if monitorWidth < 18 then
        monitor.setTextScale(0.5)
        monitor.clear()
        monitor.setCursorPos(1, 1)
        monitor.write("Monitor must be at least 2 blocks wide")
        return
    elseif monitorHeight < 19 then
        monitor.setTextScale(0.5)
        monitor.clear()
        monitor.setCursorPos(1, 1)
        monitor.write("Monitor must be at least 3 blocks high")
        return
    end

    monitor.setTextScale(0.5)
    monitor.setCursorPos(1, 1)
    monitor.clearLine()
    monitor.setBackgroundColor(colors.black)
    monitor.write("Total items: " .. totalUsedItems)
    drawVerticalProgressBar(monitor, totalUsedItems, totalSlots)
end