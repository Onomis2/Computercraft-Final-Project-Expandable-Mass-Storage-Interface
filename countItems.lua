local itemTemp
local itemsFile = fs.open("items.json", "r")
local itemsData = itemsFile.readAll()
itemsFile.close()
local items = textutils.unserializeJSON(itemsData)
local chests = dofile("findCentralStorage.lua")
local item = {}
for id, itemName in ipairs(items.values) do
    item[itemName] = 0
end
for i = 1,table.getn(chests) do
    local chest = peripheral.wrap(chests[i])
    for slot, itemStored in pairs(chest.list()) do
        for id, itemSource in ipairs(items.values) do
            if itemStored.name == itemSource then
                item[itemStored.name] = item[itemStored.name] + itemStored.count
            end
        end
    end
end
return item