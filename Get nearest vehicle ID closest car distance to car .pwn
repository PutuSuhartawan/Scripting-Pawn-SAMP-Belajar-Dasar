
stock GetNearestGate(playerid, Float: dist = 10.0)
{
	if(!(0.0 <= dist <= 20.0))
	{
		dist = 10.0;
	}
	//if(dist == 0.0)
	//	dist = FLOAT_INFINITY;

	new gateid = -1;
	new Float: my_dist;

	for(new idx; idx < sizeof g_gate; idx ++)
	{
		if(GetGateData(idx, G_TYPE) == GATE_TYPE_BARRIER_BUTTON) continue;

		my_dist = GetPlayerDistanceFromPoint(playerid, GetGateData(idx, G_OPEN_POS_X), GetGateData(idx, G_OPEN_POS_Y), GetGateData(idx, G_OPEN_POS_Z));
		if(my_dist < dist)
		{
			dist = my_dist,
			gateid = idx;
		}
	}
	return gateid;
}



stock GetNearestBiz(playerid, type, Float: dist = 15.0)
{
	if(dist == 0.0)
		dist = FLOAT_INFINITY;

	new biz_id = -1;
	new Float: my_dist;

	for(new idx; idx < g_business_loaded; idx ++)
	{
	    if(GetBusinessData(idx, B_TYPE) != type) continue;
		my_dist = GetPlayerDistanceFromPoint(playerid, GetBusinessData(idx, B_POS_X), GetBusinessData(idx, B_POS_Y), GetBusinessData(idx, B_POS_Z));
		if(my_dist < dist)
		{
			dist = my_dist,
			biz_id = idx;
		}
	}
	return biz_id;
}



stock GetNearestFuelStation(playerid, Float: dist = 15.0)
{
	if(dist == 0.0)
		dist = FLOAT_INFINITY;

	new stationid = -1;
	new Float: my_dist;

	for(new idx; idx < g_fuel_station_loaded; idx ++)
	{
		my_dist = GetPlayerDistanceFromPoint(playerid, GetFuelStationData(idx, FS_POS_X), GetFuelStationData(idx, FS_POS_Y), GetFuelStationData(idx, FS_POS_Z));
		if(my_dist < dist)
		{
			dist = my_dist,
			stationid = idx;
		}
	}
	return stationid;
}



stock GetNearestVehicleID(playerid, Float: radius = 0.0)
{
	if(radius == 0.0)
		radius = FLOAT_INFINITY;

	new vehicleid = INVALID_VEHICLE_ID;

	new Float: dist;
	new Float: pos_x, Float: pos_y, Float: pos_z;

	GetPlayerPos(playerid, pos_x, pos_y, pos_z);
	for(new idx; idx < MAX_VEHICLES; idx ++)
	{
		if(!IsValidVehicle(idx)) continue;
		if(!IsVehicleStreamedIn(idx, playerid)) continue;

		dist = GetVehicleDistanceFromPoint(idx, pos_x, pos_y, pos_z);
		if(dist < radius)
		{
			radius = dist,
			vehicleid = idx;
		}
	}
	return vehicleid;
}


stock GetDistanceToCar(playerid, veh, Float: posX = 0.0, Float: posY = 0.0, Float: posZ = 0.0) {

  new
      Float: Floats[2][3];

  if(posX == 0.0 && posY == 0.0 && posZ == 0.0) {
    if(!IsPlayerInAnyVehicle(playerid)) GetPlayerPos(playerid, Floats[0][0], Floats[0][1], Floats[0][2]);
    else GetVehiclePos(GetPlayerVehicleID(playerid), Floats[0][0], Floats[0][1], Floats[0][2]);
  }
  else {
    Floats[0][0] = posX;
    Floats[0][1] = posY;
    Floats[0][2] = posZ;
  }
  GetVehiclePos(veh, Floats[1][0], Floats[1][1], Floats[1][2]);
  return floatround(floatsqroot((Floats[1][0] - Floats[0][0]) * (Floats[1][0] - Floats[0][0]) + (Floats[1][1] - Floats[0][1]) * (Floats[1][1] - Floats[0][1]) + (Floats[1][2] - Floats[0][2]) * (Floats[1][2] - Floats[0][2])));
}



stock GetClosestCar(playerid, exception = INVALID_VEHICLE_ID)
{

    new
    Float: Distance,
    target = -1,
    Float: vPos[3];

  if(!IsPlayerInAnyVehicle(playerid)) GetPlayerPos(playerid, vPos[0], vPos[1], vPos[2]);
  else GetVehiclePos(GetPlayerVehicleID(playerid), vPos[0], vPos[1], vPos[2]);

    for(new v; v < MAX_VEHICLES; v++) if(GetVehicleModel(v) >= 400) {
        if(v != exception && (target < 0 || Distance > GetDistanceToCar(playerid, v, vPos[0], vPos[1], vPos[2]))) {
            target = v;
            Distance = GetDistanceToCar(playerid, v, vPos[0], vPos[1], vPos[2]); // Before the rewrite, we'd be running GetPlayerPos 2000 times...
        }
    }
    return target;
}


CMD:fixveh(playerid, params[])
{
    if(GetPlayerAdminEx(playerid) < 1) return 1;
	/*
	extract params -> new to_player; else return SendClientMessage(playerid, 0xCECECEFF, "Gunakan: /fixcar [id pemain]");

	if(!IsPlayerConnected(to_player) || !IsPlayerLogged(to_player))
		return SendClientMessage(playerid, 0xCECECEFF, "Tidak ada pemain seperti itu");

	if(!IsPlayerInAnyVehicle(to_player))
		return SendClientMessage(playerid, 0xCECECEFF, "Pemain harus dalam transportasi");
	*/
	new fmt_text[93],
		vehicleid = GetClosestCar(playerid);//GetAroundNearPlayerCarID(playerid); //GetPlayerVehicleID(to_player);
        SetVehicleHealth(vehicleid, 1000.0);
    	RepairVehicle(vehicleid);
		RepairVehicle(vehicleid);
	 SetVehicleData(vehicleid, V_HEALTH, 1000.0);

	//format(fmt_text, sizeof fmt_text, "Anda memperbaiki transportasi pemain %s", GetPlayerNameEx(to_player));
	//SendClientMessage(playerid, -1, fmt_text);

	//format(fmt_text, sizeof fmt_text, "%s %s memperbaiki transportasi Anda", admins_rank_name[GetPlayerAdminEx(playerid)], GetPlayerNameEx(playerid));
	//SendClientMessage(to_player, -1, fmt_text);

	if(GetPlayerAdminEx(playerid) <= 5)
	{
		//format(fmt_text, sizeof fmt_text, "[A] %s[%d] transportasi pemain tetap %s[%d]", GetPlayerNameEx(playerid), playerid, GetPlayerNameEx(to_player), to_player);
		//SendMessageToAdmins(fmt_text, 0xCECECEFF);
	}

	//format(fmt_text, sizeof fmt_text, "Memperbaiki transportasi %s[acc:%d]", GetPlayerNameEx(to_player), GetPlayerAccountID(to_player));
	//SendLog(playerid, LOG_TYPE_ADMIN_ACTION, fmt_text);

	return 1;
}
