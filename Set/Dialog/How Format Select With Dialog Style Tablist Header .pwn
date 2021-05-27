
enum E_ITEM_STRUCT
{
  I_NAME[16],
  I_NAME_COUNT[8],
  bool: I_COMBINATION
};


new const get_item_type[7][E_ITEM_STRUCT] =
                                            {
                                              {"Free Slot",   "or Empty",  false},
                                              {"Money",    "$",  true},
                                              {"VehicleGas",      "liter",  false},
                                              {"Medkit",   "pcs",  true},
                                              {"Material",     "kg",   true},
                                              {"Voucher",   "pcs",  true},
                                              {"Drugs", "gram",  true}
                                            };


stock CreateVehicleLabel(vehicleid, text[], color, Float:x, Float:y, Float:z, Float:drawdistance, testlos = 0, worldid = -1, interiorid = -1, playerid = -1, Float:streamdistance = STREAMER_3D_TEXT_LABEL_SD)
{
  if(IsValidVehicle(vehicleid))
  {
    SetVehicleData(vehicleid, V_LABEL, CreateDynamic3DTextLabel(text, color, x, y, z, drawdistance, INVALID_PLAYER_ID, vehicleid, testlos, worldid, interiorid, playerid, streamdistance));
  }
  return 1;
}

stock fGetAroundPlayerVehicleID(playerid, &f_vID, Float: f_rad = 10.0,world=0)
{
    new Float: f_pos[3], Float: f_newdis, Float: f_olddis = 0x7F800000;
    GetPlayerPos(playerid, f_pos[0], f_pos[1], f_pos[2]), f_vID = 0;
    for(new f = GetVehiclePoolSize(); f != 0; f--)
  {
        f_newdis = GetVehicleDistanceFromPoint(f, f_pos[0], f_pos[1], f_pos[2]);
        if(f_newdis == 0)continue;
        if(world>0){if(GetVehicleVirtualWorld(f)!=pInfo[playerid][pWorld])continue;}
        if(f_newdis <= f_rad && f_newdis < f_olddis)f_olddis = f_newdis, f_vID = f;
    }
    return f_vID?true:false;
}

stock GetAroundNearPlayerCarID(playerid, &f_vID, Float: f_rad = 9000.0,world=0)
{
    new Float: f_pos[3], Float: f_newdis, Float: f_olddis = 0x7F800000;
    GetPlayerPos(playerid, f_pos[0], f_pos[1], f_pos[2]), f_vID = 0;
    for(new f = GetVehiclePoolSize(); f != 0; f--)
  {
        f_newdis = GetVehicleDistanceFromPoint(f, f_pos[0], f_pos[1], f_pos[2]);
        if(f_newdis == 0)continue;
        if(world>0){if(GetVehicleVirtualWorld(f)!=pInfo[playerid][pWorld])continue;}
        if(f_newdis <= f_rad && f_newdis < f_olddis)f_olddis = f_newdis, f_vID = f;
    }
    return f_vID?true:false;
}




// ---------------------------------------------------
stock SetVehicleParamsInit(vehicleid)
{
  GetVehicleParamsEx
  (
    vehicleid,
    g_vehicle_params[vehicleid][V_ENGINE],
    g_vehicle_params[vehicleid][V_LIGHTS],
    g_vehicle_params[vehicleid][V_ALARM],
    g_vehicle_params[vehicleid][V_LOCK],
    g_vehicle_params[vehicleid][V_BONNET],
    g_vehicle_params[vehicleid][V_BOOT],
    g_vehicle_params[vehicleid][V_OBJECTIVE]
  );
}

stock GetVehicleParam(vehicleid, E_VEHICLE_PARAMS_STRUCT:paramid)
{
  SetVehicleParamsInit(vehicleid);
  return g_vehicle_params[vehicleid][paramid];
}

stock SetVehicleParam(vehicleid, E_VEHICLE_PARAMS_STRUCT:paramid, set_value)
{
  SetVehicleParamsInit(vehicleid);
  g_vehicle_params[vehicleid][paramid] = bool: set_value;

  SetVehicleParamsEx
  (
    vehicleid,
    g_vehicle_params[vehicleid][V_ENGINE],
    g_vehicle_params[vehicleid][V_LIGHTS],
    g_vehicle_params[vehicleid][V_ALARM],
    g_vehicle_params[vehicleid][V_LOCK],
    g_vehicle_params[vehicleid][V_BONNET],
    g_vehicle_params[vehicleid][V_BOOT],
    g_vehicle_params[vehicleid][V_OBJECTIVE]
  );
}

/*
IsValidVehicleID(vehicleid)
{
   if(GetVehicleModel(vehicleid)) return 1;
   return 0;
}
*/

CheckCarKey(playerid,key)
{
  if(key<=0)return false;
  if(get_ownable_car[key][Key1]==pInfo[playerid][ID])return true;
  else if(get_ownable_car[key][Key2]==pInfo[playerid][ID])return true;
  else if(get_ownable_car[key][Key3]==pInfo[playerid][ID])return true;
  else if(get_ownable_car[key][Key4]==pInfo[playerid][ID])return true;
  else if(get_ownable_car[key][Key5]==pInfo[playerid][ID])return true;
  if(get_ownable_car[key][OC_OWNER_ID]==pInfo[playerid][ID])return true;
  SCM(playerid,-1,"{AAFFFF}VEHICLE:{FFFFFF} Sir your are not have they key of this vehicle.",1);
  return false;
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
    printf("[TRUNK_DEBUG] Succes remove item in slot:[%i], Now just change item type to:[%i]", item_slot, get_vehicle_trunk[vehicleid][item_slot][TRUNK_ITEM_TYPE]);
        
    return 1;
  }
  return 0;
}



public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
  
  if(dialogid == DIALOG_OPEN_VEHICLE_TRUNK) //If Dialog calling for selecting item in trunk dialog
  {
    new v = pInfo[playerid][LastVehicleID];
    new string[140];
    new targeslot = listitem+1;
    for(new s=1; s <= MAX_TRUNK_SLOTS; s++)
    {
      if(targeslot == s) // dialog select trunk item
      {
        new SlotSelectedInfo[200];
        format( SlotSelectedInfo, sizeof(SlotSelectedInfo), "[TRUNK_DEBUG]Taken from item in slot:[%i], item type:[%i]", s, get_vehicle_trunk[v][s][TRUNK_ITEM_TYPE]);
        printf(SlotSelectedInfo);
        SendClientMessage(playerid, COLOR_YELLOW, SlotSelectedInfo);
        RemoveTrunkItem(v, s);
        break;
      } // if(listitem == s)
      
    } // for(new s=1; s<= MAX_TRUNK_SLOTS; s++)

    /*
    switch(listitem) 
      {
        case 0:
        {
          SendClientMessage(playerid, COLOR_RED, "TRUNK: Item 1");
          //GivePlayerMoney(playerid, -100);
          //return cmd_kegunung(playerid);
        } 
        case 1:
        {
          SendClientMessage(playerid, COLOR_RED,  "TRUNK: Item 2");
          //return cmd_dr(playerid);
        } 
        case 2:
        {
           SendClientMessage(playerid, COLOR_NORMAL_PLAYER,  "TRUNK: Item 3");
           // return cmd_rumahsakit(playerid);
        }
        case 3: SendClientMessage(playerid, COLOR_YELLOW,  "TRUNK: Item 4");
    }
    */
    if(!response)
    {
      
      ToggleBoot(pInfo[playerid][LastVehicleID], VEHICLE_PARAMS_OFF);

      format(string, sizeof(string), "* %s get out from the car", GetRPName(playerid));
      LocalMessage(ACTION_DISTANCE, playerid, COLOR_ME, string);
      LocalMessage(ACTION_DISTANCE, playerid, COLOR_ME, "* You can see the trunk has closed.((Staff of Cityes))");
      
      return cmd_stats(playerid);
    }


    if(response)
    {

      ToggleBoot(pInfo[playerid][LastVehicleID], VEHICLE_PARAMS_OFF);
      SendClientMessage(playerid, COLOR_WHITE, "TRUNK: You take the item");
      PlayerPlaySound(playerid, 1100, 0.0, 0.0, 0.0);
      return 1;
        
    }
  }

}

CMD:trunk(playerid)
{
  new closestcar = GetClosestCar(playerid, INVALID_VEHICLE_ID);
  new x,y,z, slot;
  GetVehiclePos(closestcar, Float:x, Float:y, Float:z);
  LoadDataOCTrunk(playerid, closestcar);
  new string[200];
  format(string, 200, ""COL_LIGHTBLUE"DEBUG:{FFFFFF} ID vehicle is [{FFAAAA}%i{FFFFFF}], Time to process system trunk.", closestcar); 
  SEM(playerid, string);
   // make new fuction about stock load the trunks data from SQL
  if(!IsPlayerInAnyVehicle(playerid))
  {

    new VID=CarN[closestcar][2];
    format(string, 200, ""COL_LIGHTBLUE"DEBUG:{FFFFFF} Player range of coordinate vehicle SQL[%s] in: %0.1f, %0.1f, %0.1f", VID, Float:x, Float:y, Float:z); 
	SEM(playerid, string);
    if(IsPlayerInRangeOfPoint(playerid, Float:15.0,  Float:x, Float:y, Float:z))
    {

		  
          

    	//if(VID >= 0&&!CheckCarKey(playerid,VID)) return true;
        {

		  	
            pInfo[playerid][LastVehicleID] = closestcar;
            ToggleBoot( GetPlayerData( playerid, LastVehicleID), VEHICLE_PARAMS_ON); 
            
            new string[259];
            format(string, sizeof(string), "* %s walk away to the trunk and open it with both hand.", GetRPName(playerid));
            LocalMessage(ACTION_DISTANCE, playerid, ACTION_COLOR, string);
            LocalMessage(ACTION_DISTANCE, playerid, ACTION_COLOR, "* You can see the trunk has open with key of vehicle.((Staff of Cityes))");


            new DialogTitle[200];
            format(DialogTitle, sizeof(DialogTitle), ""COL_GREEN"Trunk Item Of Vehicle ID ["COL_RED"%d"COL_GREEN"]", closestcar);
            SEM(playerid, "DEBUG: Trunk Item Of Vehicle ID now in show dialog.");

            strunpack(VehiclePlayerPrimary[playerid][item], "Camera SLR x100", 20);
            VehiclePlayerPrimary[playerid][amountofitem] = 3;
            new trunkdataslot1items[1000];
			format(trunkdataslot1items, sizeof(trunkdataslot1items), ""COL_RED"SQL ID\t"""COL_RED"SLOT\t"COL_BLUE"Items\t"COL_GREEN"Amount\t"COL_GREEN"Owner\n");
            // max item id is 6. but in array show 7 because was counted from zero.
			for(new s=1; s<MAX_TRUNK_SLOTS; s++)
            { 
            	format(trunkdataslot1items, sizeof(trunkdataslot1items),
	            " %s "COL_RED"%i \t"COL_RED"%i\t"COL_BLUE" %s\t "COL_RED"%i %s\t"COL_GREEN" %i\n", 
	            trunkdataslot1items, get_vehicle_trunk[closestcar][s][TRUNK_SQL_ID], s, GetItemInfo( get_vehicle_trunk[closestcar][s][TRUNK_ITEM_TYPE], I_NAME), get_vehicle_trunk[closestcar][s][TRUNK_ITEM_AMOUNT], GetItemInfo( get_vehicle_trunk[closestcar][s][TRUNK_ITEM_TYPE], I_NAME_COUNT), get_vehicle_trunk[closestcar][s][TRUNK_OWNER_ID] );
	            printf("[TRUNK]: Slot:[%i], SQL ID:[%d], Item Type:[%d], Amount:[%d], ", s, get_vehicle_trunk[closestcar][s][TRUNK_SQL_ID], get_vehicle_trunk[closestcar][s][TRUNK_ITEM_TYPE],  get_vehicle_trunk[closestcar][s][TRUNK_ITEM_AMOUNT]);
            }
			ToggleBoot(pInfo[playerid][LastVehicleID], VEHICLE_PARAMS_ON);
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


