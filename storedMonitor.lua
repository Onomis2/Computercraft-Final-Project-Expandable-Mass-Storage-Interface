return function(selectedMonitorStorage)

    local monitorStorage = peripheral.wrap(selectedMonitorStorage)
    local monitorSize = monitorStorage.getSize()
    local parseY = 1
    local parseX = 1
    local removeMinecraft = ""

    function CalculateRows(input)
        if input > 0 then
            return math.floor((input - 1) / 20) + 1
        else
            return 0
        end
    end

    function MakeReadableNumber(count)
        if count > 999999 then
            count = math.floor(count / 1000000) .. "M"
        elseif count > 999 then
            count = math.floor(count / 1000) .. "K"
        end
        return count
    end
    function MakeReadableString(name,rows)
        name = name:gsub("_", " ")
        removeMinecraft = string.find(name, ":")
        name = string.sub(name, removeMinecraft + 1)
        if string.len(name) > (monitorSize/CalculateRows(monitorSize)) - 4 then
            name = string.sub(name, 1, (monitorSize/CalculateRows(monitorSize))-6) .. ".."
        end
        return name
    end

    print("Starting item count")
    local items = dofile("countItems.lua")
    print("Sorting counted items...")

    local sortedItems = {}
    for itemName, itemCount in pairs(items) do
        table.insert(sortedItems, {name = itemName, count = itemCount})
    end
    table.sort(sortedItems, function(a, b)
        return a.count > b.count
    end)

    print("Displaying sorted items...")
    monitorStorage.clear()
    for _, item in pairs(sortedItems) do
        if item.count > 0 then
            count = MakeReadableNumber(item.count)
            name = MakeReadableString(item.name)
            monitorStorage.setCursorPos(parseX, parseY)
            monitorStorage.setTextColor(130)
            monitorStorage.write(count)
            monitorStorage.setTextColor(256)
            monitorStorage.setCursorPos(parseX + 4, parseY)
            monitorStorage.write(name)
            monitorStorage.setCursorPos(parseX - 10,10)
            monitorStorage.write(parseX)
            if parseX < monitorSize-1 then
                    parseX = parseX + monitorSize/CalculateRows(monitorSize)
            end
            if parseX > monitorSize then
                parseX = 1
                parseY = parseY + 1
            end
        end
    end
    print("Executed script succesfully!")
end