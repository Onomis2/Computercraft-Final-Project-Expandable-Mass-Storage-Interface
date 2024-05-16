local barrelFind = peripheral.getNames()
local barrels = {}
local id = 0
local removeMinecraft = ""

for i, name in pairs(barrelFind) do
    if string.find(name, "minecraft:barrel") then
        id = id + 1
        removeMinecraft = string.find(name, ":")
        name = string.sub(name, removeMinecraft + 1)
        barrels[id] = name
    end
end
if id == 0 then
barrels[1] = false
end
if id < 2 then
    barrels[2] = false
end
return barrels