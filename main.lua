local running = true
local sleepInt = false
local sleepTime = 0
SelectedMonitor = tostring(SelectedMonitor)
shell.run("clear")
print("Starting main...")
print("Finding Monitors...")
local monitors = dofile("findMonitors.lua")
if monitors[1] == false then
    print("Could not find monitor. Please attach at least 1 monitor to this pc.")
    do return end
end

if monitors[2] == false then
    print("Found 1 monitor! Using that monitor to display stored items...")
    SelectedMonitor = monitors[1]
else
print("Found monitors! Please select a monitor to display stored items from following found monitors:")
for i,value in pairs(monitors) do
    if value ~= false then
    print(value)
    end
    SelectedMonitor = tostring(io.read())
end
end
print(SelectedMonitor, "selected to display stored items.")
print("Initialising monitor...")
print("Succesfully initialised script!")
print("Set a script loop speed in seconds(less than 32):")

while sleepInt == false do
    sleepTime = tonumber(io.read())
    if type(sleepTime) ~= "number" then
    print("Invalid input. Please enter a number less than 32 to set loop speed in seconds:")  
    else
        sleepInt = true
        break 
    end 
end
print("Succesfully initialised code! Looping in "..sleepTime.." seconds!")
sleep(sleepTime)

while running == true do
    shell.run("clear")
    print("Looping script...")
    print("Initialising monitor...")
    dofile"storedMonitor.lua"(SelectedMonitor)
    print("Succesfully looped script! Looping again in ",sleepTime, " seconds!")
    sleep(sleepTime)
end
