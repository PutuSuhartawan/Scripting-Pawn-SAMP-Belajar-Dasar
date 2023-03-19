inventory trunk system for vehicles in a SA-MP server:

PAWN
Copy code
// Define constants for vehicle trunk size and inventory item IDs
#define TRUNK_SIZE 30
#define ITEM_GUN 1
#define ITEM_AMMO 2
#define ITEM_DRUGS 3

// Structure to store player inventory data
new PlayerInventory[MAX_PLAYERS][TRUNK_SIZE];

// Function to add an item to a player's inventory
stock AddItemToInventory(playerid, itemid, amount)
{
    for (new i = 0; i < TRUNK_SIZE; i++)
    {
        if (PlayerInventory[playerid][i][0] == 0)
        {
            // Item slot is empty, add new item
            PlayerInventory[playerid][i][0] = itemid;
            PlayerInventory[playerid][i][1] = amount;
            return i;
        }
        else if (PlayerInventory[playerid][i][0] == itemid)
        {
            // Item already exists in inventory, increase amount
            PlayerInventory[playerid][i][1] += amount;
            return i;
        }
    }
    // Inventory is full, cannot add item
    return -1;
}

// Function to remove an item from a player's inventory
stock RemoveItemFromInventory(playerid, itemid, amount)
{
    for (new i = 0; i < TRUNK_SIZE; i++)
    {
        if (PlayerInventory[playerid][i][0] == itemid)
        {
            // Item exists in inventory, remove specified amount
            if (PlayerInventory[playerid][i][1] >= amount)
            {
                PlayerInventory[playerid][i][1] -= amount;
                if (PlayerInventory[playerid][i][1] == 0)
                {
                    // Item amount is now zero, remove from inventory
                    PlayerInventory[playerid][i][0] = 0;
                }
                return i;
            }
            else
            {
                // Item amount is less than specified amount, cannot remove
                return -1;
            }
        }
    }
    // Item not found in inventory, cannot remove
    return -1;
}

// Function to open the vehicle trunk inventory for a player
stock OpenVehicleTrunk(playerid, vehicleid)
{
    new inventoryid = CreatePlayerTextDraw(playerid, 320.0, 160.0, "Vehicle Trunk");
    // Add items from vehicle trunk to player inventory
    for (new i = 0; i < TRUNK_SIZE; i++)
    {
        new itemid = GetVehicleTrunkItem(vehicleid, i);
        if (itemid != 0)
        {
            AddItemToInventory(playerid, itemid, 1);
        }
    }
    return inventoryid;
}

// Function to close the vehicle trunk inventory for a player
stock CloseVehicleTrunk(playerid, vehicleid, inventoryid)
{
    // Remove items from player inventory and add to vehicle trunk
    for (new i = 0; i < TRUNK_SIZE; i++)
    {
        new itemid = PlayerInventory[playerid][i][0];
        if (itemid != 0)
        {
            RemoveItemFromInventory(playerid, itemid, 1);
            SetVehicleTrunkItem(vehicleid, i, itemid);
        }
    }
    DestroyPlayerTextDraw(playerid, inventoryid);
    return 1;
}

// Example usage in a command to open and close the vehicle trunk inventory

script for a trunk system that can be used with SAMP:

pawn
Copy code
CMD:trunk(playerid, params[])
{
    new vehicleid, playervehicle, i, itemid, itemcount;

    if(!IsPlayerInAnyVehicle(playerid))
    {
        SendClientMessage(playerid, COLOR_RED, "You are not in a vehicle.");
        return 1;
    }

    vehicleid = GetPlayerVehicleID(playerid);
    playervehicle = IsValidVehicle(vehicleid);

    if(!playervehicle)
    {
        SendClientMessage(playerid, COLOR_RED, "You are not in a valid vehicle.");
        return 1;
    }

    if(!IsVehicleEmpty(vehicleid))
    {
        SendClientMessage(playerid, COLOR_RED, "The vehicle trunk is not empty.");
        return 1;
    }

    for(i = 0; i < MAX_PLAYER_ITEMS; i++)
    {
        if(PlayerInfo[playerid][pInventory][i][0] == -1)
            break;

        itemid = PlayerInfo[playerid][pInventory][i][0];
        itemcount = PlayerInfo[playerid][pInventory][i][1];

        PlayerInfo[playerid][pInventory][i][0] = -1;
        PlayerInfo[playerid][pInventory][i][1] = 0;

        SetVehicleData(vehicleid, VEHICLE_ITEMS, i, itemid);
        SetVehicleData(vehicleid, VEHICLE_ITEMS_COUNT, i, itemcount);
    }

    SendClientMessage(playerid, COLOR_GREEN, "All items have been put into the vehicle trunk.");
    return 1;
}
This script checks if the player is in a valid vehicle and if the vehicle's trunk is empty before transferring the items from the player's inventory to the vehicle's trunk. The items are stored in the vehicle's data using the SetVehicleData function.

This is just a basic example of a trunk system script, and it can be expanded upon and customized to fit the needs of your specific server.
