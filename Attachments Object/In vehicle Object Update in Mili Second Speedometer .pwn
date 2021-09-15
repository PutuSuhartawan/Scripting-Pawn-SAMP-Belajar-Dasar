// a_vehicle.inc
native CreatePlayerObject(playerid, modelid, Float:X, Float:Y, Float:Z, Float:rX, Float:rY, Float:rZ, Float:DrawDistance = 0.0);


#define VEHICLE_MODEL_INFO_SIZE				1
#define VEHICLE_MODEL_INFO_FRONTSEAT		2
#define VEHICLE_MODEL_INFO_REARSEAT			3
#define VEHICLE_MODEL_INFO_PETROLCAP		4
#define VEHICLE_MODEL_INFO_WHEELSFRONT		5
#define VEHICLE_MODEL_INFO_WHEELSREAR		6
#define VEHICLE_MODEL_INFO_WHEELSMID		7
#define VEHICLE_MODEL_INFO_FRONT_BUMPER_Z	8
#define VEHICLE_MODEL_INFO_REAR_BUMPER_Z	9

// end a_vehicle.inc


#define SPEEDUPDATE 250

new PlayerSpeed[MAX_PLAYERS];
new PlayerSpeedObject[MAX_PLAYERS];
new PlayerSpeedObject2[MAX_PLAYERS];

stock GetPlayerSpeedInt(playerid)
{
	new Float:svx, Float:svy, Float:svz;
	GetVehicleVelocity(GetPlayerVehicleID(playerid),svx,svy,svz);
	new Float:s1 = floatsqroot( ((svx*svx) + (svy*svy) + (svz*svz)) ) * 100;
	new speed = floatround(s1,floatround_round);
	return speed;
}

forward UpdateSpeedo(playerid);
public UpdateSpeedo(playerid)
{
	if(!IsPlayerInAnyVehicle(playerid)) return 0;
	new msg[26];
	new spd =GetPlayerSpeedInt(playerid);
	format(msg,sizeof(msg),"{24FF0A}%i{FFFFFF} km/h",spd);
	SetPlayerObjectMaterialText(playerid,PlayerSpeedObject[playerid], msg, 0,  40, "Quartz MS", 30, 1, -13346097, 0, 2);
	SetPlayerObjectMaterialText(playerid,PlayerSpeedObject2[playerid], msg, 0,  40, "Quartz MS", 30, 1, -13346097, 0, 1);
	SetTimerEx("UpdateSpeedo",SPEEDUPDATE,false,"i",playerid);
	return 1;
}

CMD:speedo(playerid,params[])
{

	if(PlayerSpeed[playerid]==1)
	{
		Info(playerid, "Speedometer off");
		PlayerSpeed[playerid]=0;
		DestroyPlayerObject(playerid,PlayerSpeedObject[playerid]);
		DestroyPlayerObject(playerid,PlayerSpeedObject2[playerid]);
		return 1;
	}
	else if(PlayerSpeed[playerid]==0)
	{
		Info(playerid, "Speedometer on");
		PlayerSpeed[playerid]=1;
		if(GetPlayerState(playerid)==PLAYER_STATE_DRIVER)
		{
			UpdateSpeedo(playerid);
			new vehid = GetPlayerVehicleID(playerid);
			PlayerSpeedObject[playerid] =CreatePlayerObject(playerid, 19327,0.0,0.0,-1000.0,0.0,0.0,0.0,100.0);
			SetPlayerObjectMaterial(playerid, PlayerSpeedObject[playerid], 0, 8487, "ballyswater", "waterclear256", 0x00000000);
			PlayerSpeedObject2[playerid] =CreatePlayerObject(playerid, 19327,0.0,0.0,-1000.0,0.0,0.0,180.0,100.0);
			SetPlayerObjectMaterial(playerid, PlayerSpeedObject2[playerid], 0, 8487, "ballyswater", "waterclear256", 0x00000000);
			AttachSpeedBoard(playerid,vehid);
		}
		return 1;

	}
	return 0;
}

forward AttachSpeedBoard(playerid,vehid);
public AttachSpeedBoard(playerid,vehid)
{
	new Float:X, Float:Y, Float:Z;
	GetVehicleModelInfo(GetVehicleModel(vehid), VEHICLE_MODEL_INFO_SIZE, X, Y, Z);
	new Float:sx, Float:sy,Float:sz;
	GetVehicleModelInfo(GetVehicleModel(vehid), VEHICLE_MODEL_INFO_FRONTSEAT, sx,sy, sz);

	if(IsAMotorBike(vehid) || IsVBike(vehid))
	{
		AttachPlayerObjectToVehicle(playerid, PlayerSpeedObject[playerid] ,vehid, sx-2.5*X, sy ,sz+0.2, 0.000, 0.000, 0.000);
		AttachPlayerObjectToVehicle(playerid, PlayerSpeedObject2[playerid] ,vehid, sx-2.5*X, sy ,sz+0.2, 0.000, 0.000, 180.000);
	}
	else
	{
		AttachPlayerObjectToVehicle(playerid, PlayerSpeedObject[playerid] ,vehid, sx-1.2*X , sy, sz+0.2, 0.000, 0.000, 0.000);
		AttachPlayerObjectToVehicle(playerid, PlayerSpeedObject2[playerid] ,vehid, sx-1.2*X , sy, sz+0.2, 0.000, 0.000, 180.000);
	}
	//else if(vehid == 444 || vehid == 556 || vehid == 557) //monster trucks
	// 	AttachPlayerObjectToVehicle(playerid, PlayerSpeedObject[playerid] ,vehid, 3.0, 0.0 ,0.2, 0.000, 0.000, 0.000);
	// Create Pull Request for specific vehicles
	return 1;
}
stock IsVBike(carid)
{
	switch(GetVehicleModel(carid))
	{
		case 509, 481, 510: return 1;
	}
	return 0;
}

stock IsAMotorBike(carid)
{
	switch(GetVehicleModel(carid))
	{
		case 509, 510, 462, 448, 581, 522, 461, 521, 523, 463, 586, 468, 471: return 1;
	}
	return 0;
}


