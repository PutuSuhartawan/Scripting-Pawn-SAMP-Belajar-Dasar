To save and load the last spawn point of a player in your SA-MP gamemode, you can use the following script:


scss
Copy code
// Define a structure to store spawn data
new SpawnData[MAX_PLAYERS];

// Save the last spawn point of a player
public OnPlayerSpawn(playerid)
{
    SpawnData[playerid].x = GetPlayerPos(playerid, X);
    SpawnData[playerid].y = GetPlayerPos(playerid, Y);
    SpawnData[playerid].z = GetPlayerPos(playerid, Z);
    SpawnData[playerid].interior = GetPlayerInterior(playerid);
    SpawnData[playerid].world = GetPlayerVirtualWorld(playerid);
    return 1;
}

// Load the last spawn point of a player
public OnPlayerRequestClass(playerid, classid)
{
    // Set the player's spawn point to the saved location
    SetPlayerPos(playerid, SpawnData[playerid].x, SpawnData[playerid].y, SpawnData[playerid].z);
    SetPlayerInterior(playerid, SpawnData[playerid].interior);
    SetPlayerVirtualWorld(playerid, SpawnData[playerid].world);
    return 1;
}
This script defines a SpawnData structure that stores the position, interior, and virtual world of each player's last spawn point. In the OnPlayerSpawn callback, the script saves the spawn point data for each player. In the OnPlayerRequestClass callback, the script sets the player's spawn point to the saved location.

You can add this script to your gamemode and it will automatically save and load the last spawn point of each player. Note that if a player has never spawned before, their spawn point will default to the server's default spawn point.
