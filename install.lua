function Download()
    shell.run("wget https://raw.githubusercontent.com/Onomis2/Computercraft-Final-Project-Expandable-Mass-Storage-Interface/main/countItems.lua")
    shell.run("wget https://raw.githubusercontent.com/Onomis2/Computercraft-Final-Project-Expandable-Mass-Storage-Interface/main/findBarrel.lua")
    shell.run("wget https://raw.githubusercontent.com/Onomis2/Computercraft-Final-Project-Expandable-Mass-Storage-Interface/main/findCentralStorage.lua")
    shell.run("wget https://raw.githubusercontent.com/Onomis2/Computercraft-Final-Project-Expandable-Mass-Storage-Interface/main/findMonitors.lua")
    shell.run("wget https://raw.githubusercontent.com/Onomis2/Computercraft-Final-Project-Expandable-Mass-Storage-Interface/main/install.lua")
    shell.run("wget https://raw.githubusercontent.com/Onomis2/Computercraft-Final-Project-Expandable-Mass-Storage-Interface/main/items.json")
    shell.run("wget https://raw.githubusercontent.com/Onomis2/Computercraft-Final-Project-Expandable-Mass-Storage-Interface/main/main.lua")
    shell.run("wget https://raw.githubusercontent.com/Onomis2/Computercraft-Final-Project-Expandable-Mass-Storage-Interface/main/storedMonitor.lua")
end

print("Type \"run\" to immediatly execute code after installation")
local run = tostring(io.read())
if run == "run" then
    print("Succesfully installed. Running code in 5 seconds...")
    sleep(5)
    shell.run("main.lua")
else
    print("Succesfully installed. Run main.lua to execute the code.")
end
