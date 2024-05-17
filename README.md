# Expandable Mass Storage Interface (EMSI)
This script is an Expandable Mass Storage Interface (EMSI). It takes data from your chestmonster and displays it all on easy to read monitors. The display counts items by amount, and would display 2 stacks of a block as 128. When value exceed thousands, numbers are abbreviated to K, or to M for millions. Items are displayed on monitors dynamically, The display changes dynamically when you change the size of your monitor.	~~A monitor that shows a graph of how full your storage is is an optional addition.~~

## How to install
1. Place a computer (advanced or simple does not make a difference in functionality as of now).
2. Connect at least 1 monitor, chest and barrel to the computer.
3. Run the code below on the computer:
```
wget run "https://raw.githubusercontent.com/Onomis2/Computercraft-Final-Project-Expandable-Mass-Storage-Interface/main/install.lua
```
4. Run main.lua in the pc or follow the wizard if you entered the run command during the install.
5. Follow the setup wizard on the computer.

## Wizard guide:
Important: when selecting peripherals, make sure to type one of the peripherals from the list 1 to 1 into the console, else it is assumed to be an invalid input.


TLDR:
```Select storage monitor:```
Enter the monitor on which you want to display the items stored in the system
```Select data monitor:```
Enter the monitor on which you want to display information about the system
```Select input barrel:```
Enter the barrel that you want to use to dump your items into the system
```Set script loop in seconds:```
Enter the refresh rate of the system in seconds


RTFM:
If the pc is set up with 1 monitor and 1 barrel it will only prompt you with 1 thing which is "Set script loop in seconds:" enter a number between 0 and 32, when the script finishes one loop, it will wait the number of inputted seconds before starting the next loop. A lower number will increase the update speed on the monitor and barrel, but will decrease game performance. 5 is recommended.

If the pc is set up with multiple monitors and multiple barrels it will first prompt you to "Select storage monitor:" and spits out a list of monitors it found. Type your monitor of choice to display all the items stored in the system on that monitor. Then it will prompt "Select data monitor:" and spits out the same list of monitors it found. Type your monitor of choice to display a graph of how full your storage is onto that monitor. Then it will prompt "Select input barrel:" and spits out a list of barrels it found. Select one of the barrels from the list to assign it as an input interface, any items stored into this barrel will be taken out of the barrel and put into chests by the system. Lastly it will prompt "Set script loop in seconds:". This is the refresh rate of the script and will influence the speed at which it detects input and changes in the system. A lower number will make it faster, but also decreases game performance. A refresh rate of 5 is recommended, but adjust the speed to your needs.

If you enter the same monitor twice the wizard will notice and ask you again to selected a monitor that has not yet been assigned.

## Notes
1. To reach a million you need 300+ double chests all filled with a singulair item, therefore a million is assumed to be the upperlimit in the system.
2. The script will crash if you break chests, barrels, monitors or modems.
3. The data monitor is selectable from the wizard, but will stay empty as this is an unimplemented feature as of yet.
