

enum VEHICLE_STRUCTUR // was useddd
{
  V_MODELID,
  Float: V_SPAWN_X,
  Float: V_SPAWN_Y,
  Float: V_SPAWN_Z,
  Float: V_SPAWN_ANGLE,
  V_COLOR_1,
  V_COLOR_2,
  V_RESPAWN_DELAY,
  V_ADDSIREN,
  // -------------
  V_ACTION_TYPE,
  V_ACTION_ID,
  // -------------
  V_DRIVER_ID,
  // -------------
  V_LIMIT,
  V_ALARM,
  Float: V_FUEL,
  Float: V_MILEAGE,
  // -------------
  Text3D: V_LABEL,
  // -------------
  Float: V_HEALTH,
  V_LAST_LOAD_TIME,
  V_BAGAGE_AMOUNT_GUN
};

new get_vehicle_data[MAX_VEHICLES][VEHICLE_STRUCTUR];


stock IsPlayerInDealerVehicle(playerid)
{	
			new s; new invehicleid = GetPlayerVehicleID(playerid);
			for( s=1; s<MAX_SALON_SLOT; s++) // dealer vehicle
	        {

					
				 	for(new salon=1; salon<MAX_SALON; salon++)
			        {
			               
			               if(SalonCarIdSlot[salon][s] == invehicleid)
			               {
			               		

			               		SetPVarInt(playerid, "UseIdSalon", salon);
								
								SetPVarInt(playerid, "UseSlotSalon", s);
			               		new sVehSlotDeal = s;
			               		new salonDealID = salon; // dealer vehicle
			               		new st[160];
								format(st,sizeof(st),"Anda yakin ingin membeli nomor tansport %i?\n\nModel: %s\nBiaya: $%i",
								sVehSlotDeal ,NameCars(SalonModelSlot[salonDealID][sVehSlotDeal]),SalonPriseSlot[salonDealID][sVehSlotDeal]);
								ShowPlayerDialog(playerid,64, DIALOG_STYLE_MSGBOX, "Pasar mobil", st, "Beli", "Keluar");
			               		
			               		return true;
			               		//break;
			               }
			               
							
			         }
			}           
		 

	return 0;
	
}


stock IsAOwnableCar(vehicleid)
{
  if(IsValidVehicleID(vehicleid))
  {
    if(GetVehicleData(vehicleid, V_ACTION_TYPE) == VEHICLE_ACTION_TYPE_OWNABLE_CAR)
    {
      return 1;
    }
  }
  return 0;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
  new closestcar = GetClosestCar(playerid, INVALID_VEHICLE_ID);
  new engine, lights, alarm, doors, bonnet, boot, objective;
  GetVehicleParamsEx(closestcar, engine, lights, alarm, doors, bonnet, boot, objective);

  if(IsAOwnableCar(vehicleid) )
  {
    SendClientMessage(playerid, COLOR_LIGHTBLUE, "VEHICLE: "COL_WHITE"Sir wellcome. You are get in ownable vehicle"COL_RED" is special have a database to SQL.");
  }
}
