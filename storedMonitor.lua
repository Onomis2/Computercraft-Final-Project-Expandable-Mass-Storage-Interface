return function(SelectedMonitor)
    local monitorStorage = peripheral.wrap(SelectedMonitor)
    local monitorSize = monitorStorage.getSize()
    local parseY = 1
    local parseX = 1
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
            if item.count > 999999 then
                item.count = math.floor(item.count / 1000000) .. "M"
            elseif item.count > 999 then
                item.count = math.floor(item.count / 1000) .. "K"
            end
            item.name = item.name:gsub("_", " ")
            removeMinecraft = string.find(item.name, ":")
            item.name = string.sub(item.name, removeMinecraft + 1)
            if string.len(item.name) > (monitorSize / 2) - 4 then
                item.name = string.sub(item.name, 1, 18) .. ".."
            end
            monitorStorage.setCursorPos(parseX, parseY)
            monitorStorage.setTextColor(130)
            monitorStorage.write(item.count)
            monitorStorage.setTextColor(256)
            monitorStorage.setCursorPos(parseX + 4, parseY)
            monitorStorage.write(item.name)
            if parseX == 1 then
                parseX = 26
            elseif parseX == 26 then
                parseX = 1
                parseY = parseY + 1
            end
        end
    end
    print("Executed script succesfully!\n*")
end