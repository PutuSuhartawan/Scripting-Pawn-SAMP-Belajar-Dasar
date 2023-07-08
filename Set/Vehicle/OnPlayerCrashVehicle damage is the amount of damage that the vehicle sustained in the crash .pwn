





public OnPlayerCrashVehicle(playerid, vehicleid, Float:damage)
{
	if(damage > 150.0 && ExBJck[playerid] == 0)
	{
	    VehicleInfo[vehicleid][vCrash] = 1;
    	SetVehicleParams(vehicleid, VEHICLE_ENGINE, false);
    	GameTextForPlayer(playerid, "~r~Engine Damaged", 2000, 3);
        //ApplyAnimationEx(playerid, "CRACK", "crckdeth1", 4.1, 0, 0, 0, 1, 0);
        //GivePlayerHealth(playerid, -80);
	}
	else if(damage > 150.0 && ExBJck[playerid] == 1)
	{
	    VehicleInfo[vehicleid][vCrash] = 1;
    	SetVehicleParams(vehicleid, VEHICLE_ENGINE, false);
    	GameTextForPlayer(playerid, "~r~Engine Damaged", 2000, 3);
        RemovePlayerFromVehicle(playerid);
        //ApplyAnimationEx(playerid, "CRACK", "crckdeth1", 4.1, 0, 0, 0, 1, 0);
        //GivePlayerHealth(playerid, -17);
	}
	return 1;
}



/*

The code you provided is a function called OnPlayerCrashVehicle. This function is called when a player crashes their vehicle. The function takes three parameters:

playerid is the ID of the player who crashed the vehicle.
vehicleid is the ID of the vehicle that was crashed.
Float:damage is the amount of damage that the vehicle sustained in the crash.
The function first checks if the amount of damage is greater than 150. If it is, then the function sets the vCrash property of the VehicleInfo array for the vehicle to 1. This indicates that the vehicle has been crashed. The function then sets the engine property of the vehicle to false, which disables the engine. The function then displays a text message to the player indicating that the engine has been damaged.

If the player is also wearing a bulletproof jacket (ExBJck[playerid] == 1), then the function removes the player from the vehicle. The function then displays another text message to the player indicating that they have been ejected from the vehicle.

Finally, the function returns 1. This indicates that the function has successfully processed the crash.

The reason why the code is written this way is to provide a more realistic and immersive experience for the player. When a player crashes their vehicle in real life, the engine will often be damaged. This can cause the vehicle to stop running, and it can also be dangerous for the driver. The code in this function simulates this behavior by disabling the engine of the vehicle when it is crashed.

The code also displays text messages to the player to inform them of the status of their vehicle. This helps the player to understand what has happened and what they need to do next.
*/
