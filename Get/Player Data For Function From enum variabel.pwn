
#define SEM(%0,%1) SendClientMessage(%0,0xBFC0C200,%1) // notif for error message
//native SEM(playerid, yourstring[]);
#define GetPlayerData(%0,%1) 	pInfo[%0][%1]		  
//native GetPlayerData(playerid, PlayerInfo);					
#define AddPlayerData(%0,%1,%2,%3) pInfo[%0][%1] %2= %3
//native AddPlayerData(playerid, PlayerInfo, plusorminus, value);
#define GetPlayerMoneyEx(%0)	GetPlayerData(%0, pMoney) 			// money SQL from selecting ID player 
//native GetPlayerMoneyEx(playerid, pMoney);

#define GetItemInfo(%0,%1)    get_item_type[%0][%1]
//native GetItemInfo(vehicleid, trunkslot, enumstrunkstructur);
																

// ------------------------------------------
#define GetOwnableCarData(%0,%1)    get_ownable_car[%0][%1]
//native GetOwnableCarData(vehicleid, OC_SQL_ID);
#define SetOwnableCarData(%0,%1,%2)   get_ownable_car[%0][%1] = %2
//native SetOwnableCarData(vehicleid, OC_SQL_ID, new value);
#define AddOwnableCarData(%0,%1,%2,%3)  get_ownable_car[%0][%1] %2= %3
//native AddOwnableCarData(vehicleid, OC_SQL_ID, plus,new value);
#define IsOwnableCarOwned(%0)     (GetOwnableCarData(%0, OC_OWNER_ID) > 0)
//native IsOwnableCarOwned(vehicleid);
// ------------------------------------------


#define GetVehicleData(%0,%1)   get_vehicle_data[%0][%1]
//native GetVehicleData(vehicleid, V_ACTION_ID);
// ------------------------------------------
#define GetTrunkData(%0,%1,%2)      get_vehicle_trunk[%0][%1][%2]
//native GetTrunkData(vehicleid, trunkslot, enumstrunkstructur);
#define SetTrunkData(%0,%1,%2,%3)     get_vehicle_trunk[%0][%1][%2] = %3
//native SetTrunkData(vehicleid, trunkslot, enumstrunkstructur, newvalueenumdata);
#define AddTrunkData(%0,%1,%2,%3,%4)  get_vehicle_trunk[%0][%1][%2] %3= %4
//native AddTrunkData(vehicleid, trunkslot, enumstrunkstructur, plusorminus,newvalueenumdata);
#define IsTrunkFreeSlot(%0,%1)      !GetTrunkData(%0, %1, TRUNK_SQL_ID)
//native IsTrunkFreeSlot(vehicleid, trunkslot, TRUNK_SQL_ID);




enum VEHICLE_STRUCTUR
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
// ------------------------------------------
enum ENUM_OWNABLE_CAR_STRUCTUR
{
  OC_SQL_ID,      // id dalam basis
  OC_OWNER_ID,    // id pemilik
  OC_OWNER_NAME[21],  // nama pemilik
  OC_NUMBER[8],   // nomor kendaraan
  OC_MODEL_ID,    // model
  OC_COLOR_1,     // warna 1
  OC_COLOR_2,     // warna 2
  OC_PAINTJOBID,      // warna 1
  OC_COMPID,
  OC_SPOILER,
  OC_NITRO,
  OC_LAMPS,
  OC_SIDES,
  OC_HOOD,
  OC_EXHAUST,
  OC_WHEELS,
  OC_RBUMP,
  OC_FBUMP,
  OC_VENTS,
  OC_ROOF,
  Float: OC_POS_X,  // posisi kendaraan
  Float: OC_POS_Y,  // posisi kendaraan
  Float: OC_POS_Z,  // posisi kendaraan
  Float: OC_ANGLE,  // posisi kendaraan (sudut rotasi)
  OC_World,
  OC_Int,
  bool: OC_KEY_IN,  // adalah kunci yang dimasukkan
  OC_CREATE,  // waktu pembuatan
  Float: OC_FUEL,            // bahan bakar
  OC_PT_ENGINE,       // performance tuning mesinnya
  OC_PT_BRAKE,        // performance tuning rem
  OC_PT_STABILITY,    // performance tuning keberlanjutan
};


new get_ownable_car[MAX_OWNABLE_CARS][ENUM_OWNABLE_CAR_STRUCTUR];


enum VehicleInfo
{
    VehID,
    item[50],
    amountofitem

};

enum VEHICLE_TRUNK_STRUCTUR
{
  TRUNK_SQL_ID,
  TRUNK_ITEM_TYPE,     // Name of item
  TRUNK_ITEM_AMOUNT,   // value
  TRUNK_ITEM_VALUE     // weigh Kg
};

new get_vehicle_trunk[MAX_VEHICLES][MAX_VEHICLE_TRUNK_SLOTS][VEHICLE_TRUNK_STRUCTUR];



stock GetTrunkFreeSlot(vehicleid, item_type)
{
  new free_slot = -1, comb_slot = -1;
  new bool: comb = GetItemInfo(item_type, I_COMBINATION);

  for(new idx; idx < MAX_VEHICLE_TRUNK_SLOTS; idx ++)
  {
    if(GetTrunkData(vehicleid, idx, VT_ITEM_TYPE) == item_type && comb)
    {
      comb_slot = idx;
    }
    else if(free_slot == -1 && IsTrunkFreeSlot(vehicleid, idx))
    {
      free_slot = idx;
    }
    else continue;
  }
  return comb_slot != -1 ? comb_slot : free_slot;
}



stock GetOwnableCarBySqlID(sql_id, buffer[] = {0, 0, 0})
{
  buffer[2] = INVALID_VEHICLE_ID;
  for(buffer[0] = 1; buffer[0] < MAX_VEHICLES; buffer[0] ++)
  {
    if(!IsAOwnableCar(buffer[0])) continue;
    buffer[1] = GetVehicleData(buffer[0], V_ACTION_ID);

    if(GetOwnableCarData(buffer[1], OC_SQL_ID) != sql_id) continue;

    buffer[2] = buffer[0];
    break;
  }
  return buffer[2];
}



public: LoadOwnableCars()
{
  new rows, vehicleid;
  new Cache: result;

  result = mysql_query(g_Sql, "SELECT oc.*, IFNULL(a.name, 'None') AS owner_name FROM ownable_cars oc LEFT JOIN accounts a ON a.id = oc.owner_id", true);
  rows = cache_num_rows();

  if(rows > MAX_OWNABLE_CARS)
  {
    rows = MAX_OWNABLE_CARS;
    print("[OwnableCars]: WARNINGS DataBase rows over the limit of MAX_OWNABLE_CARS");
  }
  for(new idx; idx < rows; idx ++) 
  {
    SetOwnableCarData(idx, OC_SQL_ID,     cache_get_value_int(idx, "id"));
    SetOwnableCarData(idx, OC_OWNER_ID,   cache_get_value_int(idx, "owner_id"));

    SetOwnableCarData(idx, OC_MODEL_ID,   cache_get_value_int(idx, "model_id"));
    SetOwnableCarData(idx, OC_COLOR_1,    cache_get_value_int(idx, "color_1"));
    SetOwnableCarData(idx, OC_COLOR_2,    cache_get_value_int(idx, "color_2"));

    SetOwnableCarData(idx, OC_POS_X,    cache_get_value_name_float(idx, "pos_x"));
    SetOwnableCarData(idx, OC_POS_Y,    cache_get_value_name_float(idx, "pos_y"));
    SetOwnableCarData(idx, OC_POS_Z,    cache_get_value_name_float(idx, "pos_z"));
    SetOwnableCarData(idx, OC_ANGLE,    cache_get_value_name_float(idx, "angle"));

    SetOwnableCarData(idx, OC_World,    cache_get_value_int(idx, "World"));
    SetOwnableCarData(idx, OC_Int,      cache_get_value_int(idx, "Inter"));

    cache_get_field_content(idx, "number", get_ownable_car[idx][OC_NUMBER], mysql, 8);

    SetOwnableCarData(idx, OC_KEY_IN,     bool: cache_get_value_int(0, "key_in"));

    SetOwnableCarData(idx, OC_CREATE,     cache_get_value_int(0, "create_time"));

    SetOwnableCarData(idx, OC_PT_ENGINE,  cache_get_value_int(0, "pt_engine"));
    SetOwnableCarData(idx, OC_PT_BRAKE,   cache_get_value_int(0, "pt_brake"));
    SetOwnableCarData(idx, OC_PT_STABILITY, cache_get_value_int(0, "pt_stability"));

    SetOwnableCarData(idx, OC_PAINTJOBID,   cache_get_value_int(0, "paintjob"));
    SetOwnableCarData(idx, OC_COMPID,     cache_get_value_int(0, "componentid"));

    SetOwnableCarData(idx, OC_SPOILER,    cache_get_value_int(0, "Spoiler"));
    SetOwnableCarData(idx, OC_NITRO,    cache_get_value_int(0, "Nitro"));
    SetOwnableCarData(idx, OC_LAMPS,    cache_get_value_int(0, "Lamps"));
    SetOwnableCarData(idx, OC_SIDES,    cache_get_value_int(0, "Sides"));
    SetOwnableCarData(idx, OC_HOOD,     cache_get_value_int(0, "Hood"));
    SetOwnableCarData(idx, OC_VENTS,    cache_get_value_int(0, "Vents"));
    SetOwnableCarData(idx, OC_EXHAUST,    cache_get_value_int(0, "Exhaust"));
    SetOwnableCarData(idx, OC_WHEELS,     cache_get_value_int(0, "Wheels"));
    SetOwnableCarData(idx, OC_RBUMP,    cache_get_value_int(0, "RBumper"));
    SetOwnableCarData(idx, OC_FBUMP,    cache_get_value_int(0, "FBumper"));
    SetOwnableCarData(idx, OC_ROOF,     cache_get_value_int(0, "Roof"));

    // ----------------------------------------------------------------------------------------


    if(strlen(GetOwnableCarData(idx, OC_NUMBER)) != 6)
      strmid(get_ownable_car[idx][OC_NUMBER], "------", 0, 8, 8);

    vehicleid = CreateVehicle
    (
      GetOwnableCarData(idx, OC_MODEL_ID),
      GetOwnableCarData(idx, OC_POS_X),
      GetOwnableCarData(idx, OC_POS_Y),
      GetOwnableCarData(idx, OC_POS_Z),
      GetOwnableCarData(idx, OC_ANGLE),
      GetOwnableCarData(idx, OC_COLOR_1),
      GetOwnableCarData(idx, OC_COLOR_2),
      -1,
      0,
      VEHICLE_ACTION_TYPE_OWNABLE_CAR,
      idx
    );
    LinkVehicleToInterior(vehicleid, GetOwnableCarData(idx, OC_Int));
    SetVehicleVirtualWorld(vehicleid, GetOwnableCarData(idx, OC_World));
    if(vehicleid != INVALID_VEHICLE_ID)
    {
      CreateVehicleLabel(vehicleid, GetOwnableCarData(idx, OC_NUMBER), 0xFFFF00EE, 0.0, 0.0, 1.3, 20.0);
      SetVehicleParam(vehicleid, V_LOCK, bool: cache_get_value_int(idx, "status"));
      SetVehicleData(vehicleid, V_MILEAGE, cache_get_value_name_float(idx, "mileage"));
      ChangeVehiclePaintjob(vehicleid, GetOwnableCarData(idx, OC_PAINTJOBID));
      AddVehicleComponent(vehicleid, GetOwnableCarData(idx, OC_COMPID));
      AddVehicleComponent(vehicleid, GetOwnableCarData(idx, OC_SPOILER));
      AddVehicleComponent(vehicleid, GetOwnableCarData(idx, OC_NITRO));
      AddVehicleComponent(vehicleid, GetOwnableCarData(idx, OC_LAMPS));
      AddVehicleComponent(vehicleid, GetOwnableCarData(idx, OC_SIDES));
      AddVehicleComponent(vehicleid, GetOwnableCarData(idx, OC_HOOD));
      AddVehicleComponent(vehicleid, GetOwnableCarData(idx, OC_VENTS));
      AddVehicleComponent(vehicleid, GetOwnableCarData(idx, OC_EXHAUST));
      AddVehicleComponent(vehicleid, GetOwnableCarData(idx, OC_WHEELS));
      AddVehicleComponent(vehicleid, GetOwnableCarData(idx, OC_RBUMP));
      AddVehicleComponent(vehicleid, GetOwnableCarData(idx, OC_FBUMP));
      AddVehicleComponent(vehicleid, GetOwnableCarData(idx, OC_ROOF));
    }
  }
  get_ownable_car_loaded = rows;
  cache_delete(result);

  printf("[OwnableCars]: Mobil pribadi dimuat: %d", get_ownable_car_loaded);
}



public: LoadTrunks()
{
  new Cache: result, rows;
  new vehicleid, slot, buffer;

  result = mysql_query(g_Sql, "SELECT * FROM trunkdata ORDER BY owner_id ASC, trunkslotid ASC", true);
  rows = cache_num_rows();

  for(new idx; idx < rows; idx ++)
  {
    vehicleid = GetOwnableCarBySqlID(cache_get_value_int(idx, "owner_id"));
    if(vehicleid != INVALID_VEHICLE_ID)
    {
      for(slot = 0; slot < MAX_VEHICLE_TRUNK_SLOTS; slot ++)
      {
        if(GetTrunkData(vehicleid, slot, TRUNK_SQL_ID)) continue;

        SetTrunkData(vehicleid, slot, TRUNK_SQL_ID,    cache_get_value_int(idx, "id"));
        SetTrunkData(vehicleid, slot, TRUNK_ITEM_TYPE,   cache_get_value_int(idx, "item_type"));
        SetTrunkData(vehicleid, slot, TRUNK_ITEM_AMOUNT,   cache_get_value_int(idx, "amount"));
        SetTrunkData(vehicleid, slot, TRUNK_ITEM_VALUE,  cache_get_value_int(idx, "value"));
      }
      buffer ++;
    }
  }

  cache_delete(result);
  printf("[Trunks]: Item on upload SQL: %d", buffer);
}


stock AddTrunkItem(vehicleid, item_id, amount, value = 0)
{
  if(1 <= item_id <= sizeof(g_item_type)-1)
  {
    new free_slot = GetTrunkFreeSlot(vehicleid, item_id);
    if(free_slot != -1)
    {
      SetTrunkData(vehicleid, free_slot, VT_SQL_ID, 1);

      SetTrunkData(vehicleid, free_slot, VT_ITEM_TYPE, item_id);
      SetTrunkData(vehicleid, free_slot, VT_ITEM_VALUE, value);

      new query[100],
        index,
        oc_id;

      index = GetVehicleData(vehicleid, V_ACTION_ID);
      oc_id = GetOwnableCarData(index, OC_SQL_ID);

      if(!IsTrunkFreeSlot(vehicleid, free_slot))
      {
        AddTrunkData(vehicleid, free_slot, VT_ITEM_AMOUNT, +, amount);

        if((GetTrunkData(vehicleid, free_slot, VT_ITEM_AMOUNT) - amount) == 0)
        {
          mysql_format(MySQL:g_Sql, query, sizeof query, "INSERT INTO trunkdata (oc_id,item_type,amount,value) VALUES (%d,%d,%d,%d)", oc_id, item_id, amount, value);
          mysql_query(MySQL:g_Sql, query, false);
        }
        else
        {
          mysql_format(MySQL:g_Sql, query, sizeof query, "UPDATE trunkdata SET amount='%d' WHERE item_type='%d' AND oc_id='%d' LIMIT 1", GetTrunkData(vehicleid, free_slot, TRUNK_ITEM_AMOUNT), item_id, oc_id);
          mysql_query(MySQL:g_Sql, query, false);
        }
      }

      else
      {
        SetTrunkData(vehicleid, free_slot, VT_ITEM_AMOUNT, amount);

        mysql_format(MySQL:g_Sql, query, sizeof query, "INSERT INTO trunkdata (oc_id,item_type,amount,value) VALUES (%d,%d,%d,%d)", oc_id, item_id, amount, value);
        mysql_query(MySQL:g_Sql, query, false);
      }

      return 1;
    }
    return -1;
  }
  return 0;
}

stock TakeTrunkItem(vehicleid, item_id, amount)
{
  if(1 <= item_id <= sizeof(g_item_type)-1)
  {
    new busy_slot = GetTrunkBusySlot(vehicleid, item_id);

    new query[100],
      index,
      oc_id;

    index = GetVehicleData(vehicleid, V_ACTION_ID);
    oc_id = GetOwnableCarData(index, OC_SQL_ID);

    if(!IsTrunkFreeSlot(vehicleid, busy_slot))
    {
      AddTrunkData(vehicleid, busy_slot, VT_ITEM_AMOUNT, -, amount);

      if(GetTrunkData(vehicleid, busy_slot, VT_ITEM_AMOUNT) >= 0)
      {
        if(!GetTrunkData(vehicleid, busy_slot, VT_ITEM_AMOUNT))
        {
          mysql_format(MySQL:g_Sql, query, sizeof query, "DELETE FROM trunkdata WHERE item_type='%d' AND oc_id='%d'", item_id, oc_id);
          mysql_query(MySQL:g_Sql, query, false);

          RemoveTrunkItem(vehicleid, busy_slot);
        }
        else
        {
          mysql_format(MySQL:g_Sql, query, sizeof query, "UPDATE trunkdata SET amount='%d' WHERE item_type='%d' AND oc_id='%d' LIMIT 1", GetTrunkData(vehicleid, busy_slot, VT_ITEM_AMOUNT), item_id, oc_id);
          mysql_query(MySQL:g_Sql, query, false);
        }
        return 1;
      }
      else
      {
        AddTrunkData(vehicleid, busy_slot, VT_ITEM_AMOUNT, +, amount);
        return -1;
      }
    }
    return -1;
  }
  return 0;
}



stock RemoveTrunkItem(vehicleid, item_slot)
{
  if(!IsTrunkFreeSlot(vehicleid, item_slot))
  {
    SetTrunkData(vehicleid, item_slot, TRUNK_SQL_ID, 0);

    SetTrunkData(vehicleid, item_slot, TRUNK_ITEM_TYPE,  0);
    SetTrunkData(vehicleid, item_slot, TRUNK_ITEM_AMOUNT,  0);
    SetTrunkData(vehicleid, item_slot, TRUNK_ITEM_VALUE,   0);

    return 1;
  }
  return 0;
}



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


stock GetPlayerSpeed(playerid, bool:kmh = true)
{
	new
		Float:xx, 
		Float:yy, 
		Float:zz, 
		Float:pSpeed;

	if(IsPlayerInAnyVehicle(playerid))
	{
		GetVehicleVelocity(GetPlayerVehicleID(playerid), xx, yy, zz);
	}
	else
	{
		GetPlayerVelocity(playerid, xx, yy, zz);
	}

	pSpeed = floatsqroot((xx * xx) + (yy * yy) + (zz * zz));
	return kmh ? floatround((pSpeed * 165.12)) : floatround((pSpeed * 103.9));
}




CMD:trunk(playerid, params[])
{
  new closestcar = GetClosestCar(playerid, INVALID_VEHICLE_ID);
  new x,y,z;
  GetVehiclePos(closestcar, Float:x, Float:y, Float:z);
  SEM(playerid, "DEBUG: GetClosestCar ID, GetVehiclePos was taken");
  LoadTrunks(); // make new fuction about stock load the trunks data from SQL
  if(!IsPlayerInAnyVehicle(playerid))
  {

    if(IsPlayerInRangeOfPoint(playerid, Float:4.0,  Float:x, Float:y, Float:z))
    {
          
          if(GetPlayerData( playerid, VehID) == closestcar)
          {

            pInfo[playerid][LastVehicleID] = closestcar;
            ToggleBoot( pInfo[playerid][LastVehicleID], VEHICLE_PARAMS_ON);
            new string[259];
            format(string, sizeof(string), "* %s walk away to the trunk and open it with both hand.", GetRPName(playerid));
            LocalMessage(ACTION_DISTANCE, playerid, ACTION_COLOR, string);
            LocalMessage(ACTION_DISTANCE, playerid, ACTION_COLOR, "* You can see the trunk has open with key of vehicle.((Staff of Cityes))");


            new DialogTitle[200];
            format(DialogTitle, sizeof(DialogTitle), ""COL_GREEN"Trunk Item Of Vehicle ID ["COL_RED"%d"COL_GREEN"] Example", closestcar);
            SEM(playerid, "DEBUG: Trunk Item Of Vehicle ID now in show dialog.");

            strunpack(VehiclePlayerPrimary[playerid][item], "Camera SLR x100", 20);
            VehiclePlayerPrimary[playerid][amountofitem] = 3;
            new trunkdataslot1items[1000];
            format(trunkdataslot1items, sizeof(trunkdataslot1items),
             ""COL_RED"Owner\t"COL_BLUE"Items\t"COL_GREEN"Amount\n\
             %s\t%s\t%i\n\
             ", 
            GetRPName(playerid), VehiclePlayerPrimary[playerid][item],  VehiclePlayerPrimary[playerid][amountofitem]);
            ShowPlayerDialog(playerid, DIALOG_OPEN_VEHICLE_TRUNK, DIALOG_STYLE_TABLIST_HEADERS, DialogTitle , trunkdataslot1items, "Take it", "Close");
            /*

            #define     TRUNK_ITEMS "\
            "COL_RED"Owner\tItem\t"COL_GREEN"Amount\n\
            Alif Wahyudi\tHelmet\t1\n\
            Hatsune Miku\tSmartphone\t2\n\
            Putu Suhartawan\tLaptop\t1\n\
            "

            //ShowPlayerDialog(playerid, dialogid, style, caption[], info[], button1[], button2[]);
            new profiftrading = random(1000)+random(2000)-random(1000);
            if(profiftrading > 3000)
            {
              new infosaham[200];
              format(infosaham, sizeof(infosaham), "* Anda dapat profit terjual sangat besar hingga $%i dan pemerintah memberikan reward sebesar $2999", profiftrading);
              SendClientMessage(playerid, COLOR_GREEN, infosaham);
              pInfo[playerid][pMoney] = pInfo[playerid][pMoney]+2999;
              cmd_makan(playerid);
            }
            pInfo[playerid][pMoney] = pInfo[playerid][pMoney]+profiftrading;
            GivePlayerMoney(playerid, profiftrading);
            
            new infosaham[200];
            format(infosaham, sizeof(infosaham), "* Anda dapat profit sebesar $%i", profiftrading);
            SendClientMessage(playerid, COLOR_LGREEN, infosaham);
            GameTextForPlayer(playerid, infosaham, 2000, 1);
            //TextDrawSetString(UI[0], infosaham);

            ApplyAnimation(playerid, "MISC", "SEAT_LR", 4.0,0,0,0,0,0,0);
            new infosaham2[200];
            format(infosaham2, sizeof(infosaham2),""COL_WHITE"KOMPUTER PRIBADI\nTulis /tradingsaham \n"COL_GREEN" Untuk mulai trading\n\n"COL_WHITE"Anda telah mendapatkan $ %i keuntungan\n"COL_LRED"silahkan kembali deposit", profiftrading);
            Update3DTextLabelText( Text3D:HasilTrading, COLOR_WHITE, infosaham2);
            if(profiftrading > 3000)
            {

            }
            */
          }
    
    
      return 1;
    }
    else
    {
      SEM(playerid, "VEHICLE: Need near of the trunk for command like this sir.");
      //SendClientMessage(playerid, COLOR_ERROR, "* Anda harus login di akun saham");
    }
  }
  else
  {
    SEM(playerid, "VEHICLE: Need on foot for trunk of acces the back car.");
    //SendClientMessage(playerid, COLOR_ERROR, "* Anda harus login di akun saham");
  }

  return 1;
}

