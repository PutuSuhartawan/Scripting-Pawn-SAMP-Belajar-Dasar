
new vehicle_driver[MAX_VEHICLES];
new vehicle_rent_owner[MAX_VEHICLES] = { INVALID_PLAYER_ID, ... };


stock RemovePlayerFromVehicleEx(playerid)
{
	if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER && GetPlayerState(playerid) != PLAYER_STATE_PASSENGER) return 0;

	if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	{
		new vehicleid = GetPlayerVehicleID(playerid);

		vehicle_driver[vehicleid] = INVALID_PLAYER_ID;
	}

    new Float: x, Float: y, Float: z;

    GetPlayerPos(playerid, x, y, z);

    return SetPlayerPos(playerid, x + 1.5, y + 1.5, z);
}


public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{

if(ispassenger == 0 && vehicle_driver[vehicleid] != INVALID_PLAYER_ID)
	{
        new Float: x, Float: y, Float: z;

		GetPlayerPos(playerid, x, y, z);
		SetPlayerPos(playerid, x, y, z);

		SPD(playerid, 0000, DIALOG_STYLE_MSGBOX, "Perhatikan", "{FFFFFF}Kendaraan ini sibuk!", "Tutup", "");

		return 0;
	}
}



stock ClearVehicleData(vehicleid)
{
    vehicle_rent_owner[vehicleid] = INVALID_PLAYER_ID;

	vehicle_driver[vehicleid] = INVALID_PLAYER_ID;

	quest_vehicle_owner[vehicleid] = INVALID_PLAYER_ID;
}


CMD:spawncars(playerid)
{
	if(admin_level[playerid] < 6) return 1;

	for(new i; i < MAX_VEHICLES; i++)
	{
	    if(vehicle_driver[i] != INVALID_PLAYER_ID) continue;

	    SetVehicleToRespawn(i);
 	}

	format(format_string, 144, "[A] Administrator %s menelurkan (a) semua transportasi tidak sibuk.", GetPlayerNameEx(playerid));
	return SendClientMessageToAll(COLOR_GREY, format_string);
}


CMD:spawnbikes(playerid)
{
    if(admin_level[playerid] < 4 || !admin_logged[playerid]) return 1;

	new count = 0;

    for(new i; i < MAX_VEHICLES; i++)
    {
		if(VehInfo[i][vStatus] != 2) continue;
		if(GetVehicleModel(i) != 510) continue;
		if(vehicle_driver[i] != INVALID_PLAYER_ID) continue;

		count++;
		SetVehicleToRespawn(i);
    }

	return SCMF(playerid, -1, "Itu melahirkan: %i pcs.", count);
}



CMD:svehrad(playerid, params[])
{
	if(admin_level[playerid] < 4 || !admin_logged[playerid]) return 1;

    if(sscanf(params, "d", params[0])) return SCM(playerid, -1, "Masuk: /svehrad [jarak]");

	if(!(1 <= params[0] <= 50)) return SCM(playerid, COLOR_GREY, "Jarak yang tersedia dari 1 hingga 50.");

    new count = 0;

    new Float: x, Float: y, Float: z;

    for(new i; i < MAX_VEHICLES; i++)
    {
		if(!IsValidVehicle(i)) continue;
		if(vehicle_driver[i] != INVALID_PLAYER_ID) continue;

		GetVehiclePos(i, x, y, z);

        if(GetPlayerDistanceFromPoint(playerid, x, y, z) > params[0]) continue;

		count++;
		SetVehicleToRespawn(i);
    }

	return SCMF(playerid, -1, "Transport yang dibuat telah muncul(%i meter.): %i pcs.", params[0], count);
}


