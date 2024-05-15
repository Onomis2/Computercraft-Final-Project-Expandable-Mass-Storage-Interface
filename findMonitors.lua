local monitorFind = peripheral.getNames()
local monitors = {}
local id = 0

for i, name in pairs(monitorFind) do
    if string.find(name, "monitor") then
        id = id + 1
        monitors[id] = name
    end
end
if id == 0 then
monitors[1] = false
end
if id < 2 then
    monitors[2] = false
end
return monitors
