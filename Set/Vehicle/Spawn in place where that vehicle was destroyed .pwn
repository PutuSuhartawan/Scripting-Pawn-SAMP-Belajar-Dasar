 script to set vehicle spawn in place where that vehicle was destroyed:

scss
Copy code
#define MAX_VEHICLES 50

new vehicles[MAX_VEHICLES][4];

public OnVehicleDeath(vehicleid, killerid, weaponid)
{
    // Store destroyed vehicle's position and rotation
    vehicles[vehicleid][0] = GetVehiclePos(vehicleid, vehicles[vehicleid][1], vehicles[vehicleid][2], vehicles[vehicleid][3]);
}

public OnPlayerCommandText(playerid, cmdtext[])
{
    if(!strcmp(cmdtext, "/respawn"))
    {
        // Respawn destroyed vehicles
        for(new i = 0; i < MAX_VEHICLES; i++)
        {
            if(IsValidVehicle(i) && !IsVehicleOccupied(i) && vehicles[i][0] != 0.0)
            {
                new Float:x = vehicles[i][1], Float:y = vehicles[i][2], Float:z = vehicles[i][3];
                new Float:rx, Float:ry, Float:rz;
                GetVehicleZAngle(i, rz);
                CreateVehicle(GetVehicleModel(i), x, y, z, rz, -1, -1, -1);
            }
        }
        SendClientMessage(playerid, 0xFFFFFFAA, "Destroyed vehicles have been respawned.");
        return 1;
    }
    return 0;
}
The OnVehicleDeath callback function stores the position and rotation of the destroyed vehicle in the vehicles array. The OnPlayerCommandText callback function checks for the "/respawn" command and respawns any destroyed vehicles that are not currently occupied by a player. The position and rotation of the destroyed vehicle are used to respawn the new vehicle in the same location.
