 changing the spawn location of the player to the same place after their character death:

pawn
Copy code
public OnPlayerDeath(playerid, killerid, reason)
{
    // get player's position before they died
    new Float:posX, Float:posY, Float:posZ;
    GetPlayerPos(playerid, posX, posY, posZ);

    // set player's spawn location to the same position
    SetPlayerPos(playerid, posX, posY, posZ);

    // optionally, set player's health and armor to default values
    SetPlayerHealth(playerid, 100.0);
    SetPlayerArmour(playerid, 0);

    return 1;
}
This script will retrieve the position of the player before their death and set their spawn location to the same position. Optionally, it can also set the player's health and armor to default values. You can add this script to your gamemode's script file.
