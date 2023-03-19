script for saving and loading player positions in a MySQL database:


pawn
Copy code
#include <mysql>
#include <sscanf2>

new mysql:db;

// Connect to the MySQL database
public OnGameModeInit()
{
    db = mysql_connect("localhost", "username", "password", "database");
    if(!mysql_ping(db)) printf("Connected to MySQL database.");
    else printf("Failed to connect to MySQL database.");
    return 1;
}

// Save the player's position to the database
public OnPlayerDisconnect(playerid, reason)
{
    new Float:pos[3];
    GetPlayerPos(playerid, pos[0], pos[1], pos[2]);
    mysql_query(db, "UPDATE player_data SET pos_x=%f, pos_y=%f, pos_z=%f WHERE playerid=%d", pos[0], pos[1], pos[2], playerid);
    return 1;
}

// Load the player's position from the database
public OnPlayerSpawn(playerid)
{
    new Float:pos[3];
    mysql_query(db, "SELECT pos_x, pos_y, pos_z FROM player_data WHERE playerid=%d", playerid);
    mysql_store_result(db);
    mysql_fetch_row(db);
    sscanf(mysql_fetch_field_row(db, 0), "f", &pos[0]);
    sscanf(mysql_fetch_field_row(db, 1), "f", &pos[1]);
    sscanf(mysql_fetch_field_row(db, 2), "f", &pos[2]);
    SetPlayerPos(playerid, pos[0], pos[1], pos[2]);
    return 1;
}
This script connects to a MySQL database using the mysql plugin and saves the player's position when they disconnect from the server, and loads their position when they spawn. The position data is stored in a table named player_data with columns playerid, pos_x, pos_y, and pos_z.

Note that this is just a basic example and may need to be modified to suit your specific needs. You'll also need to have the mysql plugin installed and configured correctly in your SA-MP server.
