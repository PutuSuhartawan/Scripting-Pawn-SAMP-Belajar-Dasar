To fix the bug in the SetVehicleToRespawn function, you can use a boolean variable to keep track of whether or not the vehicle needs to be respawned.

For example:

cpp
Copy code
new bool:vehicleNeedsRespawn[MAX_VEHICLES];

public OnVehicleDeath(vehicleid, killerid)
{
    // set the flag to indicate that the vehicle needs to be respawned
    vehicleNeedsRespawn[vehicleid] = true;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
    if(strcmp(cmdtext, "/respawnvehicle", true) == 0)
    {
        // respawn the vehicle if the flag is set
        if(vehicleNeedsRespawn[playerVehicle[playerid]] == true)
        {
            SetVehiclePos(playerVehicle[playerid], respawnX, respawnY, respawnZ);
            SetVehicleZAngle(playerVehicle[playerid], respawnAngle);
            vehicleNeedsRespawn[playerVehicle[playerid]] = false; // reset the flag
        }
        return 1;
    }
    return 0;
}
In this example, the OnVehicleDeath function sets the flag for the vehicle to be respawned. Then, when a player uses the "/respawnvehicle" command, the script checks if the flag is set for their current vehicle. If the flag is set, the vehicle is respawned and the flag is reset. If the flag is not set, the vehicle is not respawned.
