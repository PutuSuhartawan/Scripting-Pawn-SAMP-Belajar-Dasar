
public EngineStatus(playerid)
{
		new vehicleid = GetPlayerVehicleID(playerid);
		new engine = (GetVehicleParam(vehicleid, V_ENGINE) ^ VEHICLE_PARAM_ON);
		if(GetVehicleParam(vehicleid, V_ENGINE) == VEHICLE_PARAM_OFF)
		{
			new rand = random(3);
			if(rand == 0)
			{
				SetVehicleParam(vehicleid, V_ENGINE, engine);
				InfoTD_MSG(playerid, 4000, "Engine ~g~START");
				SetTimerEx("Engine", 4000, false, "i", playerid);
			}
			if(rand == 1)
			{
				InfoTD_MSG(playerid, 4000, "Engine ~r~CAN'T START");
				SetTimerEx("EngineStatus", 1000, false, "i", playerid);
			}
			if(rand == 2)
			{
				SetVehicleParam(vehicleid, V_ENGINE, engine);
				InfoTD_MSG(playerid, 4000, "Engine ~g~START");
				SetTimerEx("Engine", 1000, false, "i", playerid);
			}
		}
		return 1;
}

CMD:engine(playerid, params[])
{
	new vehicleid = GetPlayerVehicleID(playerid);
	if(!IsABike(vehicleid))
	{
		if(!IsPlayerDriver(playerid))
			return SendClientMessage(playerid, 0xCECECEFF, "Anda tidak sedang mengemudi");
        new Float:healveh;
	    GetVehicleHealth(vehicleid, healveh);
	    if(healveh < 350)
			return SendClientMessage(playerid, -1, "Transportasi Anda rusak, {F81414}hubungi mekanik /call");


        if(IsAOwnableCar(vehicleid))
		{
			new index = GetVehicleData(vehicleid, V_ACTION_ID);
			if(!GetOwnableCarData(index, OC_KEY_IN))
			{
				return GameTextForPlayer(playerid, "~r~ Use:key", 15000, 1);
			}
		}
		Action(playerid, "Mencoba Menyalakan Mesin", _, false);
		GameTextForPlayer(playerid, "~g~ Starting Dalam 4Detik", 5200, 1);

		if(GetVehicleData(vehicleid, V_FUEL) <= 0.0)
			return GameTextForPlayer(playerid, "~r~no fuel", 4000, 1);


		new vehicleid = GetPlayerVehicleID(playerid);
        new engine = (GetVehicleParam(vehicleid, V_ENGINE) ^ VEHICLE_PARAM_ON);
		SetVehicleParam(vehicleid, V_ENGINE, engine);
		if(GetVehicleParam(vehicleid, V_ENGINE) == VEHICLE_PARAM_ON)
		{
		SetVehicleParam(vehicleid, V_ENGINE, VEHICLE_PARAM_OFF);
        InfoTD_MSG(playerid, 4000, "Engine ~r~OFF");
        SetTimerEx("EngineStatus", 4000, false, "i", playerid);
		}
		else if(GetVehicleParam(vehicleid, V_ENGINE) == VEHICLE_PARAM_OFF)
		{
        InfoTD_MSG(playerid, 4000, "Starting Engine...");
		SetTimerEx("EngineStatus", 3000, false, "id", playerid, vehicleid);
	    }
	}
	return 1;
}
ALT:engine:en;


