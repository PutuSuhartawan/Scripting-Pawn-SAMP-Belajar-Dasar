 script for a food reseller job:

pawn
Copy code
new FoodResellerLocations[][] = 
{
    {100.0, 200.0, 10.0}, // location 1
    {300.0, 400.0, 20.0}, // location 2
    {500.0, 600.0, 30.0}  // location 3
};

new FoodItems[][] =
{
    {"Burger", 10, 5},
    {"Pizza", 15, 8},
    {"Hotdog", 8, 4},
    {"Fries", 5, 2},
    {"Soda", 3, 1}
};

public OnPlayerCommandText(playerid, cmdtext[])
{
    new cmd[32], params[128];
    sscanf(cmdtext, "s[31]s[127]", cmd, params);
    if(!strcmp(cmd, "/foodreseller", true))
    {
        if(GetPlayerTeam(playerid) == TEAM_FOOD_RESELLER)
        {
            new Float:playerPos[3];
            GetPlayerPos(playerid, playerPos[0], playerPos[1], playerPos[2]);
            for(new i = 0; i < sizeof(FoodResellerLocations); i++)
            {
                new Float:locationPos[3];
                locationPos[0] = FoodResellerLocations[i][0];
                locationPos[1] = FoodResellerLocations[i][1];
                locationPos[2] = FoodResellerLocations[i][2];
                if(GetDistanceBetweenPoints3D(playerPos[0], playerPos[1], playerPos[2], locationPos[0], locationPos[1], locationPos[2]) <= 10.0)
                {
                    ShowFoodResellerMenu(playerid);
                    return 1;
                }
            }
            SendClientMessage(playerid, -1, "You are not near any food reseller location.");
        }
        else
        {
            SendClientMessage(playerid, -1, "You are not a food reseller.");
        }
        return 1;
    }
    return 0;
}

public ShowFoodResellerMenu(playerid)
{
    new menu[128], row[128], itemDesc[64];
    for(new i = 0; i < sizeof(FoodItems); i++)
    {
        format(itemDesc, sizeof(itemDesc), "%s ($%d)", FoodItems[i][0], FoodItems[i][1]);
        format(row, sizeof(row), "%d. %s", i+1, itemDesc);
        strcat(menu, row);
        if(i != sizeof(FoodItems)-1)
            strcat(menu, "\n");
    }
    ShowPlayerDialog(playerid, DIALOG_FOOD_RESELLER, DIALOG_STYLE_LIST, "Food Menu", menu, "Buy", "Cancel");
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if(dialogid == DIALOG_FOOD_RESELLER && response)
    {
        if(listitem >= 0 && listitem < sizeof(FoodItems))
        {
            new Float:playerMoney = GetPlayerMoney(playerid);
            if(playerMoney >= FoodItems[listitem][1])
            {
                GivePlayerMoney(playerid, -FoodItems[listitem][1]);
                GivePlayerItem(playerid, FOOD_ITEM_TYPE, FoodItems[listitem][2]);
                SendClientMessage(playerid, -1, "You bought a " + FoodItems[listitem][0] + ".");
            }
            else
            {
                SendClientMessage(playerid, -1, "You don't have enough
                money to buy a " + FoodItems[listitem][0] + ".");
}
}
return 1;
}
return 0;
}

less
Copy code

This script allows players who are in the food reseller team to open a food menu when they are near one of the specified locations. The menu displays a list of available food items, their price, and the amount of health they restore. When a player selects an item and clicks "Buy," their money is deducted and the item is added to their inventory. 

Note that this script assumes the existence of some constants and functions, such a

Here's a more detailed version of the script with additional features:

pawn
Copy code
// Define the locations where food resellers are located
new FoodResellerLocations[][] = 
{
    {100.0, 200.0, 10.0}, // location 1
    {300.0, 400.0, 20.0}, // location 2
    {500.0, 600.0, 30.0}  // location 3
};

// Define the available food items and their properties
new FoodItems[][] =
{
    {"Burger", 10, 5},  // name, price, health restored
    {"Pizza", 15, 8},
    {"Hotdog", 8, 4},
    {"Fries", 5, 2},
    {"Soda", 3, 1}
};

// Define constants for dialog IDs and styles
enum
{
    DIALOG_FOOD_RESELLER = 1
};

enum
{
    DIALOG_STYLE_LIST = 0x01
};

public OnPlayerCommandText(playerid, cmdtext[])
{
    new cmd[32], params[128];
    sscanf(cmdtext, "s[31]s[127]", cmd, params);
    if(!strcmp(cmd, "/foodreseller", true))
    {
        if(GetPlayerTeam(playerid) == TEAM_FOOD_RESELLER)
        {
            // Get the player's current position and check if they are near a food reseller location
            new Float:playerPos[3];
            GetPlayerPos(playerid, playerPos[0], playerPos[1], playerPos[2]);
            for(new i = 0; i < sizeof(FoodResellerLocations); i++)
            {
                new Float:locationPos[3];
                locationPos[0] = FoodResellerLocations[i][0];
                locationPos[1] = FoodResellerLocations[i][1];
                locationPos[2] = FoodResellerLocations[i][2];
                if(GetDistanceBetweenPoints3D(playerPos[0], playerPos[1], playerPos[2], locationPos[0], locationPos[1], locationPos[2]) <= 10.0)
                {
                    ShowFoodResellerMenu(playerid);
                    return 1;
                }
            }
            SendClientMessage(playerid, -1, "You are not near any food reseller location.");
        }
        else
        {
            SendClientMessage(playerid, -1, "You are not a food reseller.");
        }
        return 1;
    }
    return 0;
}

public ShowFoodResellerMenu(playerid)
{
    new menu[128], row[128], itemDesc[64];
    for(new i = 0; i < sizeof(FoodItems); i++)
    {
        format(itemDesc, sizeof(itemDesc), "%s ($%d) (+%d HP)", FoodItems[i][0], FoodItems[i][1], FoodItems[i][2]);
        format(row, sizeof(row), "%d. %s", i+1, itemDesc);
        strcat(menu, row);
        if(i != sizeof(FoodItems)-1)
            strcat(menu, "\n");
    }
    ShowPlayerDialog(playerid, DIALOG_FOOD_RESELLER, DIALOG_STYLE_LIST, "Food Menu", menu, "Buy", "Cancel");
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if(dialogid == DIALOG_FOOD_RESELLER && response)
    {
        if(listitem >= 0 && listitem < sizeof(FoodItems))
        {
            // Check if the player
            
            has enough money to buy the selected item
new Float:playerMoney = GetPlayerMoney(playerid);
if(playerMoney >= FoodItems[listitem][1])
{
// Deduct the price from the player's money and add the item to their inventory
GivePlayerMoney(playerid, -FoodItems[listitem][1]);
GivePlayerItem(playerid, FOOD_ITEM_TYPE, listitem, 1);
SendClientMessage(playerid, -1, "You have bought a %s for $%d.", FoodItems[listitem][0], FoodItems[listitem][1]);
}
else
{
SendClientMessage(playerid, -1, "You don't have enough money to buy a %s.", FoodItems[listitem][0]);
}
}
return 1;
}
return 0;
}

typescript
Copy code

This version of the script includes a command handler for `/foodreseller` that checks if the player is on the food reseller team, and if so, checks if they are near any of the food reseller locations. If the player is near a location, the `ShowFoodResellerMenu()` function is called to display the food menu. 

The food menu is displayed using the `ShowPlayerDialog()` function, with the style set to `DIALOG_STYLE_LIST`. The available food items and their properties are defined in the `FoodItems` array. When the player selects an item and clicks "Buy," the `OnDialogResponse()` function is called, which checks if the player has enough money to buy the selected item, and if so, deducts the price from their money and adds the item to their inventory. 

Note that this script assumes the existence of some constants and functions, such as
