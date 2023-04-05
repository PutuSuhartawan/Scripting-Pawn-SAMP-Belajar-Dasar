Pawn script that hides and unhides the nametag of players with the visitor status (civilian) when an admin types a command:

pawn
Copy code
new bool:gHideNametags[MAX_PLAYERS];

public OnPlayerConnect(playerid)
{
    // Set default nametag visibility for new players
    if(GetPlayerVisitorStatus(playerid) == VISITOR_CIVILIAN)
    {
        gHideNametags[playerid] = true;
        SetPlayerNametagVisible(playerid, false);
    }
    return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
    if(IsPlayerAdmin(playerid) && strcmp(cmdtext, "/hidenametag", true) == 0)
    {
        gHideNametags[playerid] = true;
        SetPlayerNametagVisible(playerid, false);
        SendClientMessage(playerid, -1, "Nametag hidden.");
        return 1;
    }
    else if(IsPlayerAdmin(playerid) && strcmp(cmdtext, "/unhidenametag", true) == 0)
    {
        gHideNametags[playerid] = false;
        SetPlayerNametagVisible(playerid, true);
        SendClientMessage(playerid, -1, "Nametag unhidden.");
        return 1;
    }
    return 0;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
    // Hide or unhide nametag when player visitor status changes
    if(newstate == PLAYER_STATE_ONFOOT && GetPlayerVisitorStatus(playerid) == VISITOR_CIVILIAN)
    {
        if(gHideNametags[playerid])
            SetPlayerNametagVisible(playerid, false);
        else
            SetPlayerNametagVisible(playerid, true);
    }
    return 1;
}
This script uses a global boolean array gHideNametags to keep track of whether each player with the visitor status (civilian) has their nametag hidden or not. When a player connects, their nametag visibility is set to false by default. When an admin types the /hidenametag command, the player's nametag is hidden and their entry in the gHideNametags array is set to true. When the admin types the /unhidenametag command, the player's nametag is unhidden and their entry in the gHideNametags array is set to false.

The OnPlayerStateChange callback is used to check whether a player's visitor status has changed to civilian and whether their nametag should be hidden or unhidden based on their entry in the gHideNametags array. Note that this callback only checks for changes to the player's visitor status when they are on foot, since that's when their nametag is visible.

Only admins can use the /hidenametag and /unhidenametag commands to hide and unhide nametags, and their own nametag is unaffected by the commands.


Pawn script that hides nametags of all players except admins:

pawn
Copy code
public OnPlayerConnect(playerid)
{
    // Hide nametag for new players
    SetPlayerNametagVisible(playerid, false);
    return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
    // Hide nametag for players who are not admins
    if(newstate == PLAYER_STATE_ONFOOT && !IsPlayerAdmin(playerid))
        SetPlayerNametagVisible(playerid, false);
    return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
    if(IsPlayerAdmin(playerid) && strcmp(cmdtext, "/shownametags", true) == 0)
    {
        // Show nametag for all players
        for(new i = 0; i < MAX_PLAYERS; i++)
            SetPlayerNametagVisible(i, true);
        SendClientMessage(playerid, -1, "Nametags shown.");
        return 1;
    }
    else if(IsPlayerAdmin(playerid) && strcmp(cmdtext, "/hidenametags", true) == 0)
    {
        // Hide nametag for all players except admins
        for(new i = 0; i < MAX_PLAYERS; i++)
        {
            if(!IsPlayerAdmin(i))
                SetPlayerNametagVisible(i, false);
        }
        SendClientMessage(playerid, -1, "Nametags hidden.");
        return 1;
    }
    return 0;
}
This script hides the nametag of every player when they connect to the server. The OnPlayerStateChange callback is used to hide the nametag of players who are not admins when they are on foot. The callback only checks the nametag visibility when the player is on foot because that's when the nametag is most visible.

The script also includes two commands that allow admins to show or hide the nametags of all players at once. The /shownametags command shows the nametag for all players, while the /hidenametags command hides the nametag for all players except admins. The commands use a for loop to iterate through all players and set their nametag visibility accordingly.

Note that in order to use this script, you must have an admin system in place that can correctly identify who is an admin on the server. This script simply uses the IsPlayerAdmin function to check whether a player is an admin or not.
