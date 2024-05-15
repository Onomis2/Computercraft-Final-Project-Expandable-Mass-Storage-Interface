local chestFind = peripheral.getNames()
local chests = {}
local id = 0

for i, name in pairs(chestFind) do
    if string.find(name, "minecraft:chest") then
        id = id + 1
        chests[id] = name
    end
end
return chests
