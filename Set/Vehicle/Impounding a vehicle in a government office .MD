 script for impounding a vehicle in a government office:

pawn
Copy code
#define GOV_OFFICE_X 100.0 // X coordinate of government office
#define GOV_OFFICE_Y 200.0 // Y coordinate of government office
#define GOV_OFFICE_Z 10.0 // Z coordinate of government office

new VehicleID[MAX_VEHICLES]; // Array to store the ID of impounded vehicles

CMD:impound(playerid, params[])
{
    new vehicleid, distance;
    GetPlayerPos(playerid, Float:player_x, Float:player_y, Float:player_z);
    for (vehicleid = 0; vehicleid < MAX_VEHICLES; vehicleid++)
    {
        if (!IsValidVehicle(vehicleid)) continue;
        if (GetVehicleDistanceFromPoint(vehicleid, player_x, player_y, player_z) > 5.0) continue;
        if (VehicleID[vehicleid] != INVALID_VEHICLE_ID) SendClientMessage(playerid, COLOR_WHITE, "This vehicle is already impounded.");
        else
        {
            SendClientMessage(playerid, COLOR_WHITE, "You have impounded this vehicle.");
            VehicleID[vehicleid] = vehicleid;
            SetVehicleToRespawn(vehicleid);
            SetVehicleVirtualWorld(vehicleid, 0);
            SetVehiclePos(vehicleid, GOV_OFFICE_X, GOV_OFFICE_Y, GOV_OFFICE_Z);
        }
        break;
    }
    if (vehicleid == MAX_VEHICLES) SendClientMessage(playerid, COLOR_WHITE, "You are not close enough to any vehicle to impound it.");
    return 1;
}
This script allows players to impound a nearby vehicle by using the /impound command.
