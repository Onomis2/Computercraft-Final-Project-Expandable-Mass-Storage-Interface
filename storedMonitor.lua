local monitorStorage = peripheral.wrap("top")
while true do
local parse = 0
local chests = dofile("findCentralStorage.lua")
monitorStorage.clear()
for i = 1,table.getn(chests) do
    local chest = peripheral.wrap(chests[i])
    for slot, item in pairs(chest.list()) do
        local _, colonIndex = string.find(item.name, ":")
        local itemName = item.name
        if colonIndex then
            itemName = string.sub(item.name, colonIndex + 1)
        end
        if item.count > 100000 then
            itemCount = strsub(item.count, 3) .. M
        elseif item.count > 100 then
            itemCount = strsub(item.count, 3) .. K
        end
        itemCount = item.count
        itemName = itemName:gsub("_", " ")
        monitorStorage.setCursorPos(1,parse)
        monitorStorage.setTextColor(1)
        monitorStorage.write(itemCount)
        monitorStorage.setCursorPos(5, parse)
        monitorStorage.write(itemName)
        parse = parse + 1
    end
end
sleep(5)
end
