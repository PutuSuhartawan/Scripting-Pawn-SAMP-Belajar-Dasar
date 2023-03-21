script that allows players to view information about available vehicles and their prices, speeds, and insurance amounts using a dialog-style tablist. The script includes a command that can be used to open the tablist menu:

javascript
Copy code
new const MAX_VEHICLES = 10; // Maximum number of vehicles available
new const VEHICLE_NAMES[MAX_VEHICLES][] = { "Infernus", "Turismo", "Bullet", "Cheetah", "Elegy", "Jester", "Banshee", "Super GT", "ZR-350", "Comet" }; // Array of vehicle names
new const VEHICLE_PRICES[MAX_VEHICLES] = { 1000000, 950000, 900000, 850000, 800000, 750000, 700000, 650000, 600000, 550000 }; // Array of vehicle prices
new const VEHICLE_SPEEDS[MAX_VEHICLES] = { 250, 240, 230, 220, 210, 200, 190, 180, 170, 160 }; // Array of vehicle speeds
new const VEHICLE_INSURANCES[MAX_VEHICLES] = { 100000, 95000, 90000, 85000, 80000, 75000, 70000, 65000, 60000, 55000 }; // Array of vehicle insurance amounts

// Dialog ID constants
new const DIALOG_TABLIST_ID = 100;
new const DIALOG_INFO_ID = 101;

// Command handler function
CMD:vehicles(playerid)
{
    // Create the tablist dialog
    ShowPlayerDialog(playerid, DIALOG_TABLIST_ID, DIALOG_STYLE_TABLIST,// Add the vehicle names to the dialog tablist
for (new i = 0; i < MAX_VEHICLES; i++)
{
AddTabColumnToDialog(DIALOG_TABLIST_ID, 0, VEHICLE_NAMES[i]);
}

kotlin
Copy code
// Show the dialog to the player
ShowPlayerDialog(playerid, DIALOG_TABLIST_ID, DIALOG_STYLE_TABLIST, "Vehicle List", "Select a vehicle to view more information:", "Select", "Close", "");

return 1;
}

// Dialog response handler function
public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
// Check if the dialog is the tablist dialog
if (dialogid == DIALOG_TABLIST_ID)
{
// Check if the player selected a vehicle
if (response)
{
// Get the selected vehicle information
new vehicleIndex = listitem;
new vehicleName[MAX_VEHICLES];
format(vehicleName, sizeof(vehicleName), "Vehicle Information: %s", VEHICLE_NAMES[vehicleIndex]);
new vehiclePrice[MAX_VEHICLES];
format(vehiclePrice, sizeof(vehiclePrice), "Price: $%d", VEHICLE_PRICES[vehicleIndex]);
new vehicleSpeed[MAX_VEHICLES];
format(vehicleSpeed, sizeof(vehicleSpeed), "Top Speed: %d km/h", VEHICLE_SPEEDS[vehicleIndex]);
new vehicleInsurance[MAX_VEHICLES];
format(vehicleInsurance, sizeof(vehicleInsurance), "Insurance Amount: $%d", VEHICLE_INSURANCES[vehicleIndex]);

kotlin
Copy code
        // Create the vehicle information dialog
        ShowPlayerDialog(playerid, DIALOG_INFO_ID, DIALOG_STYLE_MSGBOX, vehicleName, "", "Close", "", "");
        AddTextColumnToDialog(DIALOG_INFO_ID, 0, vehiclePrice);
        AddTextColumnToDialog(DIALOG_INFO_ID, 0, vehicleSpeed);
        AddTextColumnToDialog(DIALOG_INFO_ID, 0, vehicleInsurance);
        ShowPlayerDialog(playerid, DIALOG_INFO_ID, DIALOG_STYLE_MSGBOX, vehicleName, "", "Close", "", "");
    }
}

return 1;
}
