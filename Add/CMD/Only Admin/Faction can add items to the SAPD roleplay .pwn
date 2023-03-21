updated version of the script where only players in the admin faction can add items to the SAPD roleplay:

scss
Copy code
// Define the admin faction ID
#define ADMIN_FACTION_ID 1


unction that you can use to add a gun to the SAPD locker:

scss
Copy code
// Function to add a gun to the SAPD locker
AddGunToLocker(gunid, ammo)
{
    // Check if the gun is already in the locker
    for(new i = 0; i < MAX_GUNS; i++)
    {
        if(sapdLockerData.guns[i].gunid == gunid)
        {
            // Gun is already in the locker, so just add the ammo
            sapdLockerData.guns[i].ammo += ammo;
            return;
        }
    }
// If the gun is not in the locker, find an empty slot and add it
for(new i = 0; i < MAX_GUNS; i++)
{
if(sapdLockerData.guns[i].gunid == 0)
{
// Found an empty slot, add the gun
sapdLockerData.guns[i].gunid = gunid;
sapdLockerData.guns[i].ammo = ammo;
return;
}
}

c
Copy code
// If no empty slots were found, display an error message
printf("SAPD locker is full. Cannot add gun.");
}

// Code to call the AddGunToLocker function
new gunid = 5; // Example gun ID
new ammo = 50; // Example ammo amount

AddGunToLocker(gunid, ammo); // Call the function to add the gun to the locker.

// Function to check if a player is in the admin faction
IsPlayerInAdminFaction(playerid)
{
    new playerfaction = GetPlayerFaction(playerid);
    return (playerfaction == ADMIN_FACTION_ID);
}

// Command handler for adding a new item to the SAPD inventory
CMD:additem(playerid, params[])
{
    // Check if the player is in the admin faction
    if(!IsPlayerInAdminFaction(playerid))
    {
        SendClientMessage(playerid, COLOR_RED, "Only admin faction members can add items to the SAPD inventory!");
        return 1;
    }

    // Add the item to the inventory
    new itemid, itemname[32], quantity;
    sscanf(params, "isi", itemid, itemname, quantity);
    AddItemToInventory(itemid, itemname, quantity);
    SaveInventoryDataToFile();
    SendClientMessage(playerid, COLOR_YELLOW, "New item added to the inventory!");
    return 1;
}

// Command handler for removing an item from the SAPD inventory
CMD:removeitem(playerid, params[])
{
    // Check if the player is in the admin faction
    if(!IsPlayerInAdminFaction(playerid))
    {
        SendClientMessage(playerid, COLOR_RED, "Only admin faction members can remove items from the SAPD inventory!");
        return 1;
    }

    // Remove the item from the inventory
    new itemid;
    sscanf(params, "i", itemid);
    RemoveItemFromInventory(itemid);
    SaveInventoryDataToFile();
    SendClientMessage(playerid, COLOR_YELLOW, "Item removed from the inventory!");
    return 1;
}

// Command handler for updating the quantity of an item in the SAPD inventory
CMD:updateitemquantity(playerid, params[])
{
    // Check if the player is in the admin faction
    if(!IsPlayerInAdminFaction(playerid))
    {
        SendClientMessage(playerid, COLOR_RED, "Only admin faction members can update the quantity of items in the SAPD inventory!");
        return 1;
    }

    // Update the item quantity in the inventory
    new itemid, quantity;
    sscanf(params, "ii", itemid, quantity);
    UpdateItemQuantityInInventory(itemid, quantity);
    SaveInventoryDataToFile();
    SendClientMessage(playerid, COLOR_YELLOW, "Item quantity updated!");
    return 1;
}
In this updated version of the script, the IsPlayerInAdminFaction function checks whether a player is in the admin faction based on their faction ID, which is defined at the top of the script. The additem, removeitem, and updateitemquantity command handlers all check if the player is in the admin faction before allowing them to modify the SAPD inventory. If the player is not in the admin faction, they receive an error message and the inventory is not modified.
