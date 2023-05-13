l create a dynamic object with material text that is attached to a vehicle:

#include <a_samp>

// This script will create a dynamic object with material text that is attached to a vehicle.

public OnPlayerVehicleEnter(playerid, vehicleid)
{
// Create the dynamic object
object_id = CreateDynamicObject(1001, 10, 10, 0, 0, 0, 0, vehicleid);

Code snippet
// Set the dynamic object's material text
SetObjectMaterialText(object_id, "Damage: 0", 255, 0, 0, 255, 1.0f, 0.0f, 0.0f, 0.0f, 0);

// Attach the dynamic object to the vehicle
AttachToVehicle(object_id, vehicleid, 0, 0, 0, 0, 0);
Use code with caution. Learn more
}

public OnPlayerVehicleExit(playerid, vehicleid)
{
// Destroy the dynamic object
DestroyDynamicObject(object_id);
}

public OnVehicleDamage(playerid, vehicleid, damage)
{
// Get the dynamic object's material text
text = GetObjectMaterialText(object_id);

Code snippet
// Update the dynamic object's material text
SetObjectMaterialText(object_id, "Damage: " + text + damage, 255, 0, 0, 255, 1.0f, 0.0f, 0.0f, 0.0f, 0);
Use code with caution. Learn more
}

This script will create a dynamic object with material text that is attached to a vehicle. The dynamic object will be created when the player enters a vehicle, and it will be destroyed when the player exits a vehicle. The dynamic object's material text will be updated every time the vehicle takes damage.


updated script:

#include <a_samp>

// This script will create a dynamic object with material text that is attached to a vehicle.

public OnPlayerVehicleEnter(playerid, vehicleid)
{
// Create the dynamic object
object_id = CreateDynamicObject(1001, 10, 10, 0, 0, 0, 0, vehicleid);

Code snippet
// Set the dynamic object's material text
SetObjectMaterialText(object_id, "Damage: 0", 255, 0, 0, 255, 1.0f, 0.0f, 0.0f, 0.0f, 0);

// Attach the dynamic object to the vehicle
AttachToVehicle(object_id, vehicleid, 0, 0, 0, 0, 0);

// Create the speedo object
speedo_object_id = CreatePlayerObject(playerid, 19327, 0.0, 0.0, -1000.0, 0.0, 0.0, 0.0, 100.0);

// Set the speedo object's material text
SetPlayerObjectMaterialText(playerid, speedo_object_id, "Speed: 0", 255, 255, 255, 255, 1.0f, 0.0f, 0.0f, 0.0f, 0);

// Attach the speedo object to the vehicle
AttachPlayerObjectToVehicle(playerid, speedo_object_id, vehicleid, 1.2 * GetVehicleModelInfo(GetVehicleModel(vehicleid), VEHICLE_MODEL_INFO_SIZE), 0.0, 0.2, 0.000, 0.000, 0.000);
Use code with caution. Learn more
}

public OnPlayerVehicleExit(playerid, vehicleid)
{
// Destroy the dynamic object
DestroyDynamicObject(object_id);

Code snippet
// Destroy the speedo object
DestroyPlayerObject(playerid, speedo_object_id);
Use code with caution. Learn more
}

public OnVehicleDamage(playerid, vehicleid, damage)
{
// Get the dynamic object's text
text = GetObjectMaterialText(object_id);

Code snippet
// Update the dynamic object's text
SetObjectMaterialText(object_id, "Damage: " + text + damage, 255, 0, 0, 255, 1.0f, 0.0f, 0.0f, 0.0f, 0);
Use code with caution. Learn more
}

public OnPlayerUpdate(playerid)
{
// Get the player's vehicle
vehicleid = GetPlayerVehicleID(playerid);

Code snippet
// If the player is not in a vehicle, do nothing
if (vehicleid == 0)
    return;

// Get the player's speed
Float:svx, Float:svy, Float:svz;
GetVehicleVelocity(vehicleid, svx, svy, svz);
Float:s1 = floatsqroot( ((svx*svx) + (svy*svy) + (svz*svz)) ) * 100;
new speed = floatround(s1, floatround_round);

// Set the speedo object's text
SetPlayerObjectMaterialText(playerid, speedo_object_id, "Speed: " + speed, 255, 255, 255, 255, 1.0f, 0.0f, 0.0f, 0.0f, 0);
Use code with caution. Learn more
}

This script will create a dynamic object with material text that is attached to a vehicle. The dynamic object will show the player's current speed. The dynamic object will be created when the player enters a vehicle, and it will be destroyed when the player exits a vehicle. The dynamic object's text will be updated every time the player's speed changes.
