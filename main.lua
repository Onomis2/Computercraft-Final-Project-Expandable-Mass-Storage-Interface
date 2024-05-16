--Prompts user about which found peripheral to use
function InitialisePeripheral(file, peripheralName, occupied)
    local peripheralMatch = false
    local selectedPeripheral = ""
    print("Finding", peripheralName.."s...")
    local peripherals = dofile(file)
    
    -- Spits error if there are no periferals found
    if peripherals[1] == false then
        print("Could not find any", peripheralName .. ". Please attach at least one", peripheralName, "to this PC.")
        return
    end

    -- If only one peripheral is found, use it
    if peripherals[2] == false then
        print("Found 1", peripheralName, "! Using that", peripheralName, "to display stored items...")
        selectedPeripheral = peripherals[1]
    else
        -- If more than one peripheral is found, prompt the user to select one
        print("Found multiple", peripheralName .. "s! Please select one to display stored items from the following found", peripheralName .. "s:")
        while not peripheralMatch do
            for i, value in ipairs(peripherals) do
                print(value)
            end
            selectedPeripheral = io.read()
            for i, value in ipairs(peripherals) do
                if selectedPeripheral == value then
                    peripheralMatch = true
                    break
                end
            end
            if not peripheralMatch then
                print("Error selecting", peripheralName .. ". Did you spell it right?")
            end
        end
    end

    print(selectedPeripheral, "selected.")
    print("Initialised", peripheralName, "!")
    return selectedPeripheral
end

local loop = 0
local running = true
local sleepInt = false
local sleepTime = 0
local output = false
local barrelError = true
local inputMatch = false
local outputMatch = false
shell.run("clear")
print("Starting main...")

local selectedMonitorStorage = InitialisePeripheral("findMonitors.lua", "monitor")

local selectedMonitorRequest = InitialisePeripheral("findMonitors.lua", "monitor")

local selectedBarrelInput = InitialisePeripheral("findBarrel.lua", "input")


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
    print("Executing loop",loop.."...")
    print("Initialising monitor...")
    dofile"storedMonitor.lua"(selectedMonitorStorage)
    --print("Checking for input items...")
    --dofile"inputPrototype.lua"(selectedBarrelInput)
    print("Succesfully looped script! Looping again in ",sleepTime, " seconds!")
    loop = loop + 1
    sleep(sleepTime)
end
