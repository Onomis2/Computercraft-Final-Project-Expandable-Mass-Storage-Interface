print("Do you immediatly want to run the code when the install is complete? (type true or false)")
local run = io.read()
if run == true then
    wget run --placeholder
    print("Succesfully installed. Running code in 5 seconds...")
    sleep(5)
    shell.run("main.lua")
else
    wget run --placeholder
    print("Succesfully installed. Run main.lua to execute the code.")
end
    
