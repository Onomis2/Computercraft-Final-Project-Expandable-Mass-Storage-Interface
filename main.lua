local running = true
SelectedMonitor = tostring(SelectedMonitor)
shell.run("clear")
print("Starting main...")
print("Finding Monitors...")
local monitors = dofile("findMonitors.lua")
if monitors then
    print("Found monitors! Please select a monitor to display stored items from following found monitors:")
    for i,value in pairs(monitors) do
        print(value)
    end
        SelectedMonitor = tostring(io.read())
    print(SelectedMonitor, "selected to display stored items.")
else
    print("Error: No monitors found. Did you attach any to the pc?")
end
print("Initialising monitor...")
dofile "storedMonitor.lua"(SelectedMonitor)
print("Succesfully initialised script! Looping it in 10 seconds!")
sleep(10)
while running == true do
    shell.run("clear")
    print("Looping script...")
    print("Initialising monitor...")
    dofile("storedMonitor.lua")
    print("Succesfully looped script! Looping again in 10 seconds!")
    sleep(10)
end
