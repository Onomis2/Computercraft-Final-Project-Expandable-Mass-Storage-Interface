print("Type \"run\" to immediatly execute code after installation")
local run = tostring(io.read())
print(run)
if run == "run" then
    shell.run(
    "wget run https://github.com/Onomis2/Computercraft-Final-Project-Expandable-Mass-Storage-Interface/main/install.lua")
    print("Succesfully installed. Running code in 5 seconds...")
    sleep(5)
    shell.run("main.lua")
else
    shell.run(
    "wget run https://github.com/Onomis2/Computercraft-Final-Project-Expandable-Mass-Storage-Interface/main/install.lua")
    print("Succesfully installed. Run main.lua to execute the code.")
end
