
#include <a_samp>
#include <zcmd>
#define DIALOG_TRUNK 1//Anda bisa mengganti ID Dialog agar tidak bertabrakan.
#define DIALOG_SLOT1 2
#define DIALOG_SLOT2 3
#define DIALOG_SLOT3 4
#define COLOR_WHITE  0xFFFFFFAA
#define COLOR_CLIENT 0x00B6FFFF
enum pData
{
	pGuns[13],
	pAmmo[13]
};
new PlayerData[MAX_PLAYERS][pData];
enum vehicleData
{
	vehSlotWep[3],
	vehSlotAmmo[3]
};
new VehicleData[MAX_VEHICLES][vehicleData];
new const g_aWeaponSlots[] =
{
	0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 10, 10, 10, 10, 10, 10, 8, 8, 8, 0, 0, 0, 2, 2, 2, 3, 3, 3, 4, 4, 5, 5, 4, 6, 6, 7, 7, 7, 7, 8, 12, 9, 9, 9, 11, 11, 11
};
main()
{
	print("\n----------------------------------");
	print(" Vehicle Weapon Storage Loaded!");
	print("----------------------------------\n");
}
public OnGameModeInit()
{
	return 1;
}
public OnGameModeExit()
{
	return 1;
}
public OnPlayerRequestClass(playerid, classid)
{
	return 1;
}
public OnPlayerConnect(playerid)
{
	return 1;
}
public OnPlayerDisconnect(playerid, reason)
{
	return 1;
}
public OnPlayerText(playerid, text[])
{
	return 1;
}
//Functions
stock GetWeapon(playerid)
{
	new weaponid = GetPlayerWeapon(playerid);
	if (1 <= weaponid <= 46 && PlayerData[playerid][pGuns][g_aWeaponSlots[weaponid]] == weaponid)
 		return weaponid;
	return 0;
}
stock GetDistanceToCar(playerid, veh, Float: posX = 0.0, Float: posY = 0.0, Float: posZ = 0.0) {
	new
	    Float: Floats[2][3];
	if(posX == 0.0 && posY == 0.0 && posZ == 0.0)
	{
		if(!IsPlayerInAnyVehicle(playerid)) GetPlayerPos(playerid, Floats[0][0], Floats[0][1], Floats[0][2]);
		else GetVehiclePos(GetPlayerVehicleID(playerid), Floats[0][0], Floats[0][1], Floats[0][2]);
	}
	else
	{
		Floats[0][0] = posX;
		Floats[0][1] = posY;
		Floats[0][2] = posZ;
	}
	GetVehiclePos(veh, Floats[1][0], Floats[1][1], Floats[1][2]);
	return floatround(floatsqroot((Floats[1][0] - Floats[0][0]) * (Floats[1][0] - Floats[0][0]) + (Floats[1][1] - Floats[0][1]) * (Floats[1][1] - Floats[0][1]) + (Floats[1][2] - Floats[0][2]) * (Floats[1][2] - Floats[0][2])));
}
ResetWeapon(playerid, weaponid)
{
	ResetPlayerWeapons(playerid);
	for (new i = 0; i < 13; i ++)
	{
	    if (PlayerData[playerid][pGuns][i] != weaponid)
		{
	        GivePlayerWeapon(playerid, PlayerData[playerid][pGuns][i], PlayerData[playerid][pAmmo][i]);
		}
		else
		{
            PlayerData[playerid][pGuns][i] = 0;
            PlayerData[playerid][pAmmo][i] = 0;
	    }
	}
	return 1;
}
stock GetClosestCar(playerid, exception = INVALID_VEHICLE_ID) {
    new
		Float: Distance,
		target = -1,
		Float: vPos[3];
	if(!IsPlayerInAnyVehicle(playerid)) GetPlayerPos(playerid, vPos[0], vPos[1], vPos[2]);
	else GetVehiclePos(GetPlayerVehicleID(playerid), vPos[0], vPos[1], vPos[2]);
    for(new v; v < MAX_VEHICLES; v++) if(GetVehicleModel(v) >= 400)
	{
        if(v != exception && (target < 0 || Distance > GetDistanceToCar(playerid, v, vPos[0], vPos[1], vPos[2])))
		{
            target = v;
            Distance = GetDistanceToCar(playerid, v, vPos[0], vPos[1], vPos[2]);
        }
    }
    return target;
}
stock IsPlayerNearBoot(playerid, vehicleid)
{
	static
		Float:fX,
		Float:fY,
		Float:fZ;
	GetVehicleBoot(vehicleid, fX, fY, fZ);
	return (GetPlayerVirtualWorld(playerid) == GetVehicleVirtualWorld(vehicleid)) && IsPlayerInRangeOfPoint(playerid, 3.5, fX, fY, fZ);
}
stock GetVehicleBoot(vehicleid, &Float:x, &Float:y, &Float:z)
{
	if (!GetVehicleModel(vehicleid) || vehicleid == INVALID_VEHICLE_ID)
	    return (x = 0.0, y = 0.0, z = 0.0), 0;
	static
	    Float:pos[7]
	;
	GetVehicleModelInfo(GetVehicleModel(vehicleid), VEHICLE_MODEL_INFO_SIZE, pos[0], pos[1], pos[2]);
	GetVehiclePos(vehicleid, pos[3], pos[4], pos[5]);
	GetVehicleZAngle(vehicleid, pos[6]);
	x = pos[3] - (floatsqroot(pos[1] + pos[1]) * floatsin(-pos[6], degrees));
	y = pos[4] - (floatsqroot(pos[1] + pos[1]) * floatcos(-pos[6], degrees));
 	z = pos[5];
	return 1;
}
public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid == DIALOG_TRUNK)
	{
	    if(response)
	    {
	        if(listitem == 0)
	        {
	            ShowPlayerDialog(playerid, DIALOG_SLOT1, DIALOG_STYLE_LIST, "Storage Slot 1", "Take Weapon\nStore Weapon", "Select", "Cancel");
			}
	        if(listitem == 1)
	        {
	            ShowPlayerDialog(playerid, DIALOG_SLOT2, DIALOG_STYLE_LIST, "Storage Slot 2", "Take Weapon\nStore Weapon", "Select", "Cancel");
			}
	        if(listitem == 2)
	        {
	            ShowPlayerDialog(playerid, DIALOG_SLOT3, DIALOG_STYLE_LIST, "Storage Slot 3", "Take Weapon\nStore Weapon", "Select", "Cancel");
			}
		}
	}
	if(dialogid == DIALOG_SLOT1)
	{
	    if(response)
	    {
	        if(listitem == 0)
	        {
				new closestveh = GetClosestCar(playerid);
				    
				if(VehicleData[closestveh][vehSlotWep][0] == 0)
				    return SendClientMessage(playerid, COLOR_CLIENT, "ERROR: {FFFFFF}Tidak ada senjata pada Slot ini!");
				    
				GivePlayerWeapon(playerid, VehicleData[closestveh][vehSlotWep][0], VehicleData[closestveh][vehSlotAmmo][0]);
				SendClientMessage(playerid, COLOR_CLIENT, "TRUNK: {FFFFFF}Kamu berhasil mengambil senjata dari dalam Weapon Storage!");
				VehicleData[closestveh][vehSlotWep][0] = 0;
				VehicleData[closestveh][vehSlotAmmo][0] = 0;
			}
			if(listitem == 1)
			{
			    new closestveh = GetClosestCar(playerid);
			    if(VehicleData[closestveh][vehSlotWep][0] != 0)
			        return SendClientMessage(playerid, COLOR_CLIENT, "ERROR: {FFFFFF}Sudah ada senjata pada Slot ini!");
			        
				if(!GetPlayerWeapon(playerid))
				    return SendClientMessage(playerid, COLOR_CLIENT, "ERROR: {FFFFFF}Kamu sedang tidak memegang senjata!");
				    
				VehicleData[closestveh][vehSlotWep][0] = GetPlayerWeapon(playerid);
				VehicleData[closestveh][vehSlotAmmo][0] = GetPlayerAmmo(playerid);
				
				
				ResetWeapon(playerid, VehicleData[closestveh][vehSlotWep][0]);
				SendClientMessage(playerid, COLOR_CLIENT, "TRUNK: {FFFFFF}Kamu berhasil menyimpan senjata pada Weapon Storage!");
			}
		}
	}
	if(dialogid == DIALOG_SLOT2)
	{
	    if(response)
	    {
	        if(listitem == 0)
	        {
				new closestveh = GetClosestCar(playerid);
				if(VehicleData[closestveh][vehSlotWep][1] == 0)
				    return SendClientMessage(playerid, COLOR_CLIENT, "ERROR: {FFFFFF}Tidak ada senjata pada Slot ini!");
				GivePlayerWeapon(playerid, VehicleData[closestveh][vehSlotWep][1], VehicleData[closestveh][vehSlotAmmo][1]);
				SendClientMessage(playerid, COLOR_CLIENT, "TRUNK: {FFFFFF}Kamu berhasil mengambil senjata dari dalam Weapon Storage!");
				VehicleData[closestveh][vehSlotWep][1] = 0;
				VehicleData[closestveh][vehSlotAmmo][1] = 0;
			}
			if(listitem == 1)
			{
			    new closestveh = GetClosestCar(playerid);
			    if(VehicleData[closestveh][vehSlotWep][1] != 0)
			        return SendClientMessage(playerid, COLOR_CLIENT, "ERROR: {FFFFFF}Sudah ada senjata pada Slot ini!");
				if(!GetPlayerWeapon(playerid))
				    return SendClientMessage(playerid, COLOR_CLIENT, "ERROR: {FFFFFF}Kamu sedang tidak memegang senjata!");
				VehicleData[closestveh][vehSlotWep][1] = GetPlayerWeapon(playerid);
				VehicleData[closestveh][vehSlotAmmo][1] = GetPlayerAmmo(playerid);
				ResetWeapon(playerid, VehicleData[closestveh][vehSlotWep][1]);
				SendClientMessage(playerid, COLOR_CLIENT, "TRUNK: {FFFFFF}Kamu berhasil menyimpan senjata pada Weapon Storage!");
			}
		}
	}
	if(dialogid == DIALOG_SLOT3)
	{
	    if(response)
	    {
	        if(listitem == 0)
	        {
				new closestveh = GetClosestCar(playerid);
				if(VehicleData[closestveh][vehSlotWep][2] == 0)
				    return SendClientMessage(playerid, COLOR_CLIENT, "ERROR: {FFFFFF}Tidak ada senjata pada Slot ini!");
				GivePlayerWeapon(playerid, VehicleData[closestveh][vehSlotWep][2], VehicleData[closestveh][vehSlotAmmo][2]);
				SendClientMessage(playerid, COLOR_CLIENT, "TRUNK: {FFFFFF}Kamu berhasil mengambil senjata dari dalam Weapon Storage!");
				VehicleData[closestveh][vehSlotWep][2] = 0;
				VehicleData[closestveh][vehSlotAmmo][2] = 0;
			}
			if(listitem == 1)
			{
			    new closestveh = GetClosestCar(playerid);
			    if(VehicleData[closestveh][vehSlotWep][2] != 0)
			        return SendClientMessage(playerid, COLOR_CLIENT, "ERROR: {FFFFFF}Sudah ada senjata pada Slot ini!");
				if(!GetPlayerWeapon(playerid))
				    return SendClientMessage(playerid, COLOR_CLIENT, "ERROR: {FFFFFF}Kamu sedang tidak memegang senjata!");
				VehicleData[closestveh][vehSlotWep][2] = GetPlayerWeapon(playerid);
				VehicleData[closestveh][vehSlotAmmo][2] = GetPlayerAmmo(playerid);
				ResetWeapon(playerid, VehicleData[closestveh][vehSlotWep][2]);
				SendClientMessage(playerid, COLOR_CLIENT, "TRUNK: {FFFFFF}Kamu berhasil menyimpan senjata pada Weapon Storage!");
			}
		}
	}
	return 1;
}
CMD:givewep(playerid, params[])
{
	GivePlayerWeapon(playerid, 24, 100);
	return 1;
}
CMD:trunk(playerid, params[])
{
    for (new i = 1; i != MAX_VEHICLES; i ++) if (IsPlayerNearBoot(playerid, i))
	{
		ShowPlayerDialog(playerid, DIALOG_TRUNK, DIALOG_STYLE_LIST, "Vehicle Trunk", "Weapon Slot 1\nWeapon Slot 2\nWeapon Slot 3", "Select", "Cancel");
	}
	return 1;
}
