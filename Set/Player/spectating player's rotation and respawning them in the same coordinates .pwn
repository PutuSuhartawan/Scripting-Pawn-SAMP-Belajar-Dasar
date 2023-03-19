 script for setting a player's rotation and respawning them in the same coordinates:

pawn
Copy code
public OnPlayerDeath(playerid, killerid, reason)
{
    new Float:pos[3], Float:rot;
    GetPlayerPos(playerid, pos[0], pos[1], pos[2]);
    rot = GetPlayerFacingAngle(playerid);
    SetPlayerPos(playerid, pos[0], pos[1], pos[2]);
    SetPlayerFacingAngle(playerid, rot);
    SetPlayerHealth(playerid, 100.0);
    SetPlayerArmour(playerid, 0.0);
    TogglePlayerControllable(playerid, true);
    SendClientMessage(playerid, -1, "You have been respawned.");
    return 1;
}
This script handles the OnPlayerDeath event, which is triggered when a player dies. When a player dies, the script retrieves the player's position and rotation using the GetPlayerPos and GetPlayerFacingAngle functions, respectively. Then, it sets the player's position and rotation using the SetPlayerPos and SetPlayerFacingAngle functions. It also restores the player's health and removes any armor they may have had using the SetPlayerHealth and SetPlayerArmour functions. Finally, it enables player control using the TogglePlayerControllable function, sends a message to the player indicating that they have been respawned, and returns 1 to indicate that the event has been handled.
