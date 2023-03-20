script for showing a dialog tablist that displays the required components for a mechanic to fix a vehicle:

scss
Copy code
// Required components for each vehicle model
new g_requiredComponents[][] = {
    {"turismo", "engine, transmission, suspension"},
    {"bullet", "engine, brakes, suspension"},
    {"infernus", "engine, transmission, brakes"},
    {"elegy", "engine, suspension, brakes"},
    {"nrg500", "engine, brakes, tires"},
    {"fcr900", "engine, brakes, suspension"}
};

// Function to show the dialog tablist with required components
public ShowComponentList(playerid, vehicleModel)
{
    new componentName[32], componentList[128];
    for (new i = 0; i < sizeof(g_requiredComponents); i++)
    {
        if (strcmp(vehicleModel, g_requiredComponents[i][0], true) == 0)
        {
            format(componentList, sizeof(componentList), "%s", g_requiredComponents[i][1]);
            break;
        }
    }
    if (!strlen(componentList)) return 0;
    format(componentName, sizeof(componentName), "Required Components for %s", vehicleModel);
    ShowPlayerDialog(playerid, 1, DIALOG_STYLE_TABLIST, componentName, componentList, "Fix Vehicle", "Cancel");
    return 1;
}

// Callback function for dialog response
public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if (dialogid == 1 && response)
    {
        // Player selected "Fix Vehicle"
        new vehicleid = GetPlayerVehicleID(playerid);
        if (vehicleid)
        {
            new vehicleModel[32];
            GetVehicleName(vehicleid, vehicleModel, sizeof(vehicleModel));
            for (new i = 0; i < sizeof(g_requiredComponents); i++)
            {
                if (strcmp(vehicleModel, g_requiredComponents[i][0], true) == 0)
                {
                    // Check if the player has all required components
                    new componentsNeeded[8], numNeeded = 0;
                    format(componentsNeeded, sizeof(componentsNeeded), "%s", g_requiredComponents[i][1]);
                    new component = strtok(componentsNeeded, ",");
                    while (component != NULL)
                    {
                        component = strip(component);
                        if (!PlayerHasItem(playerid, component))
                        {
                            format(componentsNeeded, sizeof(componentsNeeded), "%s, %s", componentsNeeded, component);
                            numNeeded++;
                        }
                        component = strtok(NULL, ",");
                    }
                    if (numNeeded > 0)
                    {
                        SendClientMessage(playerid, COLOR_RED, "You don't have all the required components to fix this vehicle.");
                        ShowComponentList(playerid, vehicleModel);
                    }
                    else
                    {
                        // Remove components from player inventory and fix vehicle
                        component = strtok(g_requiredComponents[i][1], ",");
                        while (component != NULL)
                        {
                            component = strip(component);
                            RemovePlayerItem(playerid, component, 1);
                            component = strtok(NULL, ",");
                        }
                        SendClientMessage(playerid, COLOR_GREEN, "You have successfully fixed the vehicle.");
                        RepairVehicle(vehicleid);
                    }
                    break;
                }
            }
        }
    }
    return 1;
}

// Function to check if a player has a certain item in their inventory
stock PlayerHasItem(playerid, itemname[])
{
    new inventory[128];
    GetPlayerData(playerid, PLAYER_DATA_INVENTORY, inventory, sizeof(inventory));
    new item = strtok(inventory, ",");
    while (item != NULL)
    {
        item = strip(item);
        if (strcmp(item, itemname, true
        
        Copy code
// Function to check if a player has a certain item in their inventory
stock PlayerHasItem(playerid, itemname[])
{
    new inventory[128];
    GetPlayerData(playerid, PLAYER_DATA_INVENTORY, inventory, sizeof(inventory));
    new item = strtok(inventory, ",");
    while (item != NULL)
    {
        item = strip(item);
        if (strcmp(item, itemname, true) == 0)
        {
            return true;
        }
        item = strtok(NULL, ",");
    }
    return false;
}
