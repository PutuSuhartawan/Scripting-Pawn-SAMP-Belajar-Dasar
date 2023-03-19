

Filterscript that implements a speed limit system and allows players to lock their speed with a command:

pawn
Copy code
new const MAX_SPEED = 90.0; // Maximum speed allowed
new const LOCK_SPEED = 50.0; // Speed at which players can lock their speed

// This function is called when a player enters a vehicle
public OnPlayerStateChange(playerid, newstate, oldstate)
{
    if(newstate == PLAYER_STATE_DRIVER)
    {
        // Set the vehicle's speed limit
        SetVehicleParamsEx(GetPlayerVehicleID(playerid), -1, MAX_SPEED, -1, -1, -1, -1);
    }
}

// This function is called when a player enters a command
public OnPlayerCommandText(playerid, cmdtext[])
{
    new cmd[32], params[64];
    sscanf(cmdtext, "%s %s", cmd, params);

    if(!strcmp(cmd, "/lockspeed"))
    {
        if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER)
        {
            SendClientMessage(playerid, COLOR_RED, "You must be in a vehicle to use this command!");
            return 1;
        }

        if(GetVehicleSpeed(GetPlayerVehicleID(playerid)) > LOCK_SPEED)
        {
            SendClientMessage(playerid, COLOR_RED, "You must be driving below the speed limit to use this command!");
            return 1;
        }

        // Lock the player's speed
        TogglePlayerControllable(playerid, false);
        SendClientMessage(playerid, COLOR_GREEN, "Your speed has been locked. Use /unlockspeed to unlock it.");
    }
    else if(!strcmp(cmd, "/unlockspeed"))
    {
        // Unlock the player's speed
        TogglePlayerControllable(playerid, true);
        SendClientMessage(playerid, COLOR_GREEN, "Your speed has been unlocked.");
    }

    return 0;
}
This script sets a maximum speed limit for all vehicles and checks a player's speed before allowing them to use the /lockspeed command, which locks their speed and prevents them from accelerating or decelerating. The player can unlock their speed at any time by using the /unlockspeed command.

Note that this is a very basic implementation and may not be suitable for all server setups. You may want to add additional checks and safeguards to ensure that the speed limit system is fair and effective, and that players cannot abuse the /lockspeed command in unintended ways.
