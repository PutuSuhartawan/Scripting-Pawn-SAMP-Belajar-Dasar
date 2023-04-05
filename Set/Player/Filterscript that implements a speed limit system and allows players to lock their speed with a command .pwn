

 #include <a_samp>
#include <a_mysql> // MySQL plugin R41-4
#include <zcmd>

native IsValidVehicle(vehicleid);

new AktifkanLimitSpeed[MAX_PLAYERS];


// STOCK UNTU SEMUA JENIS FUNGSI YANG AKAN DI PANGGIL

stock SetVehicleSpeedTT(vehicleid, Float:speed)
{
    new Float:x1, Float:y1, Float:z1, Float:x2, Float:y2, Float:z2, Float:a;
    GetVehicleVelocity(vehicleid, x1, y1, z1);
    GetVehiclePos(vehicleid, x2, y2, z2);
    GetVehicleZAngle(vehicleid, a); a = 360 - a;
    x1 = (floatsin(a, degrees) * (speed/100) + floatcos(a, degrees) * 0 + x2) - x2;
    y1 = (floatcos(a, degrees) * (speed/100) + floatsin(a, degrees) * 0 + y2) - y2;
    SetVehicleVelocity(vehicleid, x1, y1, z1);
}

forward Float: GetVehicleSpeed(vehicleid);
public Float: GetVehicleSpeed(vehicleid)
{
	new Float: speed = -1;

	if(vehicleid != INVALID_VEHICLE_ID)
	{
		new Float: x,
			Float: y,
			Float: z,
			Float: angle;

		GetVehicleVelocity(vehicleid, x, y, z);
		GetVehicleZAngle(vehicleid, angle);

		speed = x / floatsin(-angle, degrees);

		speed *= 100.0;
	}


	return speed;
}



public OnPlayerExitVehicle(playerid, vehicleid)
{

	// fungsi untuk hilangkan limit speed saat user keluar dari kendaraaan.
	KillTimer(AktifkanLimitSpeed[playerid]);

	
}

forward lockspeed(playerid, vehicleid);
public lockspeed(playerid, vehicleid)
{
	//GetPVarInt(playerid, "playerid");
	//GetPVarInt(playerid, "pInfo[playerid][pKendaraanDipakai]");
	//GetPVarFloat(playerid, "speed");
	
	
	//SendClientMessage(playerid, -1, "* lockspeed sytem terbaca dan terpanggil");

	if(Float:GetVehicleSpeed(pInfo[playerid][pKendaraanDipakai]) > Float:pInfo[playerid][pKecepatanKendaraan])
	{
		SetVehicleSpeedTT(pInfo[playerid][pKendaraanDipakai], Float:pInfo[playerid][pKecepatanKendaraan]);
		new str[100];
		format(str, 100, "ID kendaraan %i, Kecepatan %f", pInfo[playerid][pKendaraanDipakai], Float:pInfo[playerid][pKecepatanKendaraan]);
		SendClientMessage(playerid, -1, str);
	}
	if(!IsPlayerInAnyVehicle(playerid))
	{
		KillTimer(AktifkanLimitSpeed[playerid]);
		return 1;
	}
}

CMD:limitspeed(playerid, params[])
{
	new vehicleid = GetPlayerVehicleID(playerid);

	extract params -> new Float: speed; else return SendClientMessage(playerid, COLOR_ERROR, "/limitspeed [speed]");
	pInfo[playerid][pKendaraanDipakai]=vehicleid;
	Float:pInfo[playerid][pKecepatanKendaraan]=speed;
	KillTimer(AktifkanLimitSpeed[playerid]);
	AktifkanLimitSpeed[playerid] = SetTimer("lockspeed", 100, true);



	SendClientMessage(playerid, -1, "* speed limit changed");
}


// coba latihan membuat cmd penghilang limit speed.
CMD:unlimitspeed(playerid, params[])
{
	SendClientMessage(playerid, COLOR_ERROR, "* Limit speed kendaraan di hilangkan.");
	KillTimer(AktifkanLimitSpeed[playerid]);
	return 1;



}

CMD:kasispeed(playerid, params[])
{
	

	if(!IsPlayerInAnyVehicle(playerid))
		return SendClientMessage(playerid, -1, "u have to be in a vehicle");

	extract params -> new Float: speed; else return SendClientMessage(playerid, -1, "/setspeed [speed]");

	new vehicleid = GetPlayerVehicleID(playerid);

	SetVehicleSpeedTT(vehicleid, speed);

	SendClientMessage(playerid, -1, "speed changed");

	return 1;
}






CMD:limitspeed(playerid, params[])

{

	new vehicleid = GetPlayerVehicleID(playerid);



	extract params -> new Float: speed; else return SendClientMessage(playerid, -1, "/limitspeed [speed]");

	pInfo[playerid][pKendaraanDipakai]=vehicleid;

	Float:pInfo[playerid][pKecepatanKendaraan]=speed;

	SetTimer("lockspeed", 1000, true);







	SendClientMessage(playerid, -1, "* speed limit changed");

}





forward lockspeed(playerid, vehicleid);

public lockspeed(playerid, vehicleid)

{

	//GetPVarInt(playerid, "playerid");

	//GetPVarInt(playerid, "pInfo[playerid][pKendaraanDipakai]");

	//GetPVarFloat(playerid, "speed");

	

	

	SendClientMessage(playerid, -1, "* lockspeed sytem terbaca dan terpanggil");



	if(Float:GetVehicleSpeed(pInfo[playerid][pKendaraanDipakai]) > Float:pInfo[playerid][pKecepatanKendaraan])

	{

		SetVehicleSpeedTT(pInfo[playerid][pKendaraanDipakai], Float:pInfo[playerid][pKecepatanKendaraan]);

		new str[100];

		format(str, 100, "ID kendaraan %i, Kecepatan %f", pInfo[playerid][pKendaraanDipakai], Float:pInfo[playerid][pKecepatanKendaraan]);

		SendClientMessage(playerid, -1, str);

	}

}



// STOCK UNTU SEMUA JENIS FUNGSI YANG AKAN DI PANGGIL



stock SetVehicleSpeedTT(vehicleid, Float:speed)

{

    new Float:x1, Float:y1, Float:z1, Float:x2, Float:y2, Float:z2, Float:a;

    GetVehicleVelocity(vehicleid, x1, y1, z1);

    GetVehiclePos(vehicleid, x2, y2, z2);

    GetVehicleZAngle(vehicleid, a); a = 360 - a;

    x1 = (floatsin(a, degrees) * (speed/100) + floatcos(a, degrees) * 0 + x2) - x2;

    y1 = (floatcos(a, degrees) * (speed/100) + floatsin(a, degrees) * 0 + y2) - y2;

    SetVehicleVelocity(vehicleid, x1, y1, z1);

}



forward Float: GetVehicleSpeed(vehicleid);

public Float: GetVehicleSpeed(vehicleid)

{

	new Float: speed = -1;



	if(vehicleid != INVALID_VEHICLE_ID)

	{

		new Float: x,

			Float: y,

			Float: z,

			Float: angle;



		GetVehicleVelocity(vehicleid, x, y, z);

		GetVehicleZAngle(vehicleid, angle);



		speed = x / floatsin(-angle, degrees);



		speed *= 100.0;

	}





	return speed;

}

 



the meaning of this script in English:

This script defines a command /limitspeed that allows a player to set a speed limit for their vehicle. It also defines some functions and timers to check and adjust the vehicle’s speed according to the limit.

CMD:limitspeed(playerid, params[]) is the command handler that takes the player’s id and a parameter that specifies the speed limit in km/h. It checks if the player is in a vehicle and if the parameter is valid. It then stores the vehicle’s id and the speed limit in some variables and sets a timer to call the lockspeed function every second. It also sends a message to the player that the speed limit has changed.
lockspeed(playerid, vehicleid) is the function that is called by the timer. It takes the player’s id and the vehicle’s id as parameters. It sends a message to the player that the lockspeed system is detected and called. It then compares the current speed of the vehicle with the speed limit. If the current speed is higher than the limit, it calls the SetVehicleSpeedTT function to reduce the speed. It also sends a message to the player with the vehicle’s id and speed.
SetVehicleSpeedTT(vehicleid, Float:speed) is a stock function that sets the vehicle’s speed to a given value. It takes the vehicle’s id and the desired speed as parameters. It calculates and sets the vehicle’s velocity based on its position and angle.
GetVehicleSpeed(vehicleid) is a public function that returns the vehicle’s speed in km/h. It takes the vehicle’s id as a parameter. It checks if the vehicle is valid and then gets its velocity components. It calculates and returns the speed using some mathematical formulas.


Here is a possible pawn script for gta samp about lock limit speed with CMD /limitspeed:

// This script uses the speedcap.inc library from https://github.com/blint96/mysantos-main/blob/master/pawno/include/speedcap.inc
// You need to include it in your script before using this code

// Define a constant for the maximum speed limit in km/h
#define MAX_SPEED_LIMIT 200

// Define a variable to store the speed limit for each player
new Float:gPlayerSpeedLimit[MAX_PLAYERS];

// Define a command to set the speed limit for the player's vehicle
CMD:limitspeed(playerid, params[])
{
    // Check if the player is in a vehicle
    if(!IsPlayerInAnyVehicle(playerid))
    {
        SendClientMessage(playerid, COLOR_RED, "You are not in a vehicle.");
        return 1;
    }

    // Check if the player entered a valid parameter
    if(!strlen(params))
    {
        SendClientMessage(playerid, COLOR_WHITE, "Usage: /limitspeed [speed in km/h]");
        return 1;
    }

    // Convert the parameter to a float value
    new Float:speed;
    speed = strval(params);

    // Check if the speed is within the range of 0 to MAX_SPEED_LIMIT
    if(speed < 0.0 || speed > MAX_SPEED_LIMIT)
    {
        SendClientMessage(playerid, COLOR_RED, "Invalid speed. The speed must be between 0 and %d km/h.", MAX_SPEED_LIMIT);
        return 1;
    }

    // Set the speed limit for the player
    gPlayerSpeedLimit[playerid] = speed;

    // Apply the speed limit to the player's vehicle using the SetPlayerSpeedCap macro from speedcap.inc
    SetPlayerSpeedCap(playerid, gPlayerSpeedLimit[playerid] / 3.6);

    // Send a message to the player
    SendClientMessage(playerid, COLOR_GREEN, "You have set your speed limit to %0.1f km/h.", gPlayerSpeedLimit[playerid]);

    return 1;
}

// Define a function to explain every function and macro used in this script
public ExplainFunctions()
{
    // Explain IsPlayerInAnyVehicle
    printf("IsPlayerInAnyVehicle(playerid) returns 1 if the player is in any vehicle, or 0 otherwise.");

    // Explain strlen
    printf("strlen(string[]) returns the length of a string (the number of characters in it).");

    // Explain strval
    printf("strval(string[]) converts a string to a numerical value (integer or float).");

    // Explain SetPlayerSpeedCap
    printf("SetPlayerSpeedCap(playerid, Float:speed) sets the maximum speed that the player's vehicle can reach. It is a macro defined in speedcap.inc as follows:");
    printf("#define SetPlayerSpeedCap(%0,%1) SetVehicleParamsCarDoors(GetPlayerVehicleID(%0),%1,%1,%1,%1)");
}
