script in Pawn for adding 5 health to a player using a command and updating the MySQL database:

cpp
Copy code
#include <a_samp>
#include <mysql>

new MySQL:database;

public OnGameModeInit()
{
    database = mysql_connect("localhost", "root", "password", "database_name");
    if(!mysql_ping(database))
    {
        print("Connected to MySQL database successfully!");
    }
    else
    {
        print("Failed to connect to MySQL database!");
    }
}

public OnPlayerCommandText(playerid, cmdtext[])
{
    if(!strcmp(cmdtext, "/addhealth", true))
    {
        new health = GetPlayerHealth(playerid) + 5;
        SetPlayerHealth(playerid, health);
        mysql_query(database, "UPDATE players SET health = " + health + " WHERE playerid = " + playerid);
        SendClientMessage(playerid, 0xFFFFFFAA, "Your health has been increased by 5!");
        return 1;
    }
    return 0;
}

public OnPlayerConnect(playerid)
{
    mysql_query(database, "INSERT INTO players (playerid, health) VALUES (" + playerid + ", " + GetPlayerHealth(playerid) + ")");
    return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
    mysql_query(database, "DELETE FROM players WHERE playerid = " + playerid);
    return 1;
}

public OnGameModeExit()
{
    mysql_close(database);
    return 1;
}
This script uses the /addhealth command to add 5 health to the player's current health, updates the player's health in the MySQL database, and sends a message to the player informing them that their health has been increased. It also handles adding the player to the database when they connect, removing them from the database when they disconnect, and closing the database connection when the server shuts down. Note that this is just an example script and should be adapted to fit the specific needs of your server.
