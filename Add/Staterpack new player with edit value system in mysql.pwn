example script for a starter pack system for new players, where the items and quantities can be edited in a MySQL database:

pawn
Copy code
new mysql;
new host[] = "localhost", user[] = "root", password[] = "password", database[] = "sampdb";

enum
{
    ITEM_WEAPON_DEAGLE,
    ITEM_WEAPON_SHOTGUN,
    ITEM_WEAPON_MP5,
    ITEM_ITEM_HEALTH,
    ITEM_ITEM_ARMOUR,
    NUM_STARTER_ITEMS
};

new starter_items[NUM_STARTER_ITEMS][2] =
{
    { ITEM_WEAPON_DEAGLE, 1 },
    { ITEM_WEAPON_SHOTGUN, 1 },
    { ITEM_WEAPON_MP5, 1 },
    { ITEM_ITEM_HEALTH, 3 },
    { ITEM_ITEM_ARMOUR, 1 }
};

public OnGameModeInit()
{
    mysql = mysql_init();
    if (!mysql_real_connect(mysql, host, user, password, database, 0, NULL, 0))
    {
        printf("Error connecting to database: %s", mysql_error(mysql));
        return 0;
    }
    printf("Connected to database.");
    return 1;
}

public OnPlayerConnect(playerid)
{
    new query[128], result;
    format(query, sizeof(query), "SELECT is_new_player FROM player_data WHERE playerid = %d", playerid);
    mysql_query(mysql, query);
    mysql_store_result(mysql);
    if (mysql_num_rows(result) == 0)
    {
        printf("Error retrieving player data for player %d.", playerid);
        return 0;
    }
    new is_new_player;
    mysql_fetch_field(result, "is_new_player", is_new_player);
    if (is_new_player)
    {
        for (new i = 0; i < NUM_STARTER_ITEMS; i++)
        {
            GivePlayerItem(playerid, starter_items[i][0], starter_items[i][1]);
        }
        format(query, sizeof(query), "UPDATE player_data SET is_new_player = 0 WHERE playerid = %d", playerid);
        mysql_query(mysql, query);
    }
    return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
    new command[32];
    if (sscanf(cmdtext, "/setitemvalue %s", command))
    {
        new itemid, value;
        if (sscanf(command, "%d:%d", itemid, value) != 2)
        {
            SendClientMessage(playerid, -1, "Usage: /setitemvalue itemid:value");
            return 1;
        }
        new query[128];
        format(query, sizeof(query), "UPDATE starter_pack_items SET value = %d WHERE itemid = %d", value, itemid);
        mysql_query(mysql, query);
        SendClientMessage(playerid, -1, "Item value updated.");
        return 1;
    }
    return 0;
}
This script assumes that there is a MySQL table named starter_pack_items with the columns itemid and value, where itemid corresponds to the item ID in the GivePlayerItem function, and value corresponds to the quantity of the item given to new players.

When a player connects to the server, the OnPlayerConnect function checks if the player is new by retrieving the is_new_player flag from the player_data table. If the player is new, the script gives them the items and quantities specified in the starter_items array, 
