script using the Streamer Plugin for creating 3D text labels on vehicles:

pawn
Copy code
#include <streamer.h>

new Text3D:vehicleLabel[MAX_VEHICLES];

// Callback function when the vehicle is streamed in
public OnVehicleStreamIn(vehicleid, forplayerid)
{
    new modelid = GetVehicleModel(vehicleid);
    new Float:pos[3], Float:rot[3];
    GetVehiclePos(vehicleid, pos[0], pos[1], pos[2]);
    GetVehicleZAngle(vehicleid, rot[0], rot[1], rot[2]);
    // Create the 3D text label on the vehicle
    vehicleLabel[vehicleid] = CreateDynamic3DTextLabel("Vehicle ID: " + vehicleid, COLOR_WHITE, pos[0], pos[1], pos[2], 20.0, 0, true, modelid, 0, forplayerid, -1);
}

// Callback function when the vehicle is streamed out
public OnVehicleStreamOut(vehicleid, forplayerid)
{
    // Destroy the 3D text label on the vehicle
    DestroyDynamic3DTextLabel(vehicleLabel[vehicleid]);
}

// Command for setting the text label on a vehicle
CMD:vehlabel(playerid, params[])
{
    new vehicleid = GetPlayerVehicleID(playerid);
    if(vehicleid != INVALID_VEHICLE_ID)
    {
        new modelid = GetVehicleModel(vehicleid);
        new Float:pos[3], Float:rot[3];
        GetVehiclePos(vehicleid, pos[0], pos[1], pos[2]);
        GetVehicleZAngle(vehicleid, rot[0], rot[1], rot[2]);
        // Destroy the previous 3D text label on the vehicle
        DestroyDynamic3DTextLabel(vehicleLabel[vehicleid]);
        // Create the new 3D text label on the vehicle
        vehicleLabel[vehicleid] = CreateDynamic3DTextLabel(params, COLOR_WHITE, pos[0], pos[1], pos[2], 20.0, 0, true, modelid, 0, playerid, -1);
        SendClientMessage(playerid, COLOR_WHITE, "Vehicle label set to: " + params);
    }
    else
    {
        SendClientMessage(playerid, COLOR_RED, "You are not in a vehicle.");
    }
    return 1;
}
In this script, the OnVehicleStreamIn and OnVehicleStreamOut callback functions are used to create and destroy 3D text labels on streamed-in vehicles. The vehlabel command is used to set the text label on the vehicle the player is currently in, and the previous label is destroyed before the new one is created. The vehicleLabel array is used to keep track of the labels created for each vehicle.
