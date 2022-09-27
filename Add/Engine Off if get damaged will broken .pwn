
public OnVehicleDamageStatusUpdate(vehicleid, playerid)
{
	new Float:healveh;
 	GetVehicleHealth(vehicleid, healveh);
  	if(healveh < 1000)
	{
		SetVehicleHealth(vehicleid,1000);
	}
	if(GetVehicleParam(vehicleid, V_ENGINE) == VEHICLE_PARAM_ON && GetPlayerData(playerid, P_IMPROVEMENTS) < 4)
	{
 		SetVehicleParam(vehicleid, V_ENGINE, VEHICLE_PARAM_OFF);
 		GameTextForPlayer(playerid, "~r~~h~engine off", 4000, 6);

		new Float: veh_health;

		GetVehicleHealth(vehicleid, veh_health);

		if(IsAOwnableCar(vehicleid))
		{
			SetVehicleData(vehicleid, V_HEALTH, veh_health);

			if(veh_health < 300.0)
			{
				SetVehicleData(vehicleid, V_HEALTH, 300.0);
			}
		}

		switch(GetVehicleData(vehicleid, V_ACTION_TYPE))
		{
			case VEHICLE_ACTION_TYPE_DRIVING_SCH, VEHICLE_ACTION_TYPE_BUS_DRIVER:
			{
				new Float: health = GetPVarFloat(playerid, "car_damage");

				health -= floatabs((health - veh_health));

				SetPVarFloat(playerid, "car_damage", health);
			}
		}
	}
    return 1;
}
