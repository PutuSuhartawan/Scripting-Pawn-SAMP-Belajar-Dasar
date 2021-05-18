
GetFreeTrunkID(v, s) {
    new i=1; 
    for(i; i <= 100; i++)
    {
            //i++;
            if(get_vehicle_trunk[v][s][i] == 0) 
            
                if(i != 0)
                { 
                  i++;
                  if(get_vehicle_trunk[v][s][i] == 0) 
                  i+s;
                  return i+GetSVarInt("SlotTrunkUsed");
                }
                
            
          

    }
        
    return i+GetSVarInt("SlotTrunkUsed");
    printf("[TRUNK_ID]: Debug new ID SQL:[%d]", v);
}




stock LoadOCTrunks(playerid, vehicleid)
{
          
          new Cache: result, rows, str[200];
          new slot, buffer, trunkid;
          new VID = CarN[vehicleid][2];
          slot=GetPVarInt(playerid, "SelectedSlot");
          if(VID == 0) return printf("[TRUNK_DEBUG]: Error VID found [0], Please check again is vehicleid:[%d] in type ownablecar.", vehicleid);
          format(str, 200, "SELECT * FROM `trunkdata` WHERE `oc_id`='%d' AND `slot`='%d'", VID, slot);  //ORDER BY oc_id ASC, slot ASC
          result = n_mysql_query(g_Sql, str, true);
          rows = cache_num_rows();
          
          printf("[TRUNK_DEBUG]: Loaded trunk have:[%d row(s)]", rows);
          //VID = GetOwnableCarBySqlID( cache_get_value_int(idx, "oc_id", GetOwnableCarData(vehicleid, OC_SQL_ID) ));
          //v=GetRealIdCar(VID);
          
          
          
          new v=vehicleid;//for(new v=1; v <= MAX_VEHICLES; v ++) 
          {
              if(v != INVALID_VEHICLE_ID)
              {
                  if(CarN[v][2] == VID )
                  {
                            printf("[TRUNK_DEBUG]: Scanning in vehicle id:[%d]", v );
                            new s=slot;//for(new s=1; s <= MAX_TRUNK_SLOTS; s++ )
                            {
                                //if(s >= 1) continue; // not load from slot 0
                                printf("[TRUNK_DEBUG]: Trunk slot selected just at now:[%d]", slot );
                                
                                if (!rows) return 1;
                                for(new idx=1; idx <= rows; idx ++)
                                { 
                                    get_vehicle_trunk[v][s][TRUNK_SLOT] = slot;
                                    //cache_get_value_int(idx, "slot", get_vehicle_trunk[v][s][TRUNK_SLOT] );
                                    printf("[TRUNK_DEBUG]: Try Download SQL VID:[%d] in slot:[%d]", VID, get_vehicle_trunk[v][s][TRUNK_SLOT] );
                                    
                                    if(get_vehicle_trunk[v][s][TRUNK_SLOT] == slot)
                                    {
                                          if (s <= 0) return printf("[TRUNK_DEBUG]: Error invalid slot of trunk. Please ", s);
                                          
                                          cache_get_value_int(idx, "id", get_vehicle_trunk[v][s][TRUNK_SQL_ID] );
                                          cache_get_value_int(idx, "oc_id", get_vehicle_trunk[v][s][TRUNK_OC_ID] );
                                          printf("[TRUNK_DEBUG]: Loading slot in ID:[%d]", s);
                                          printf("[TRUNK_DEBUG]: Scanning in row id:[%d]", idx );
                                          printf("[TRUNK_DEBUG]: Get SQL data process in TrunkID:[%d], VID:[%d]", get_vehicle_trunk[v][s][TRUNK_SQL_ID], get_vehicle_trunk[v][s][TRUNK_OC_ID] );
                                          if(get_vehicle_trunk[v][s][TRUNK_OC_ID] == VID) 
                                          {
                                                trunkid = get_vehicle_trunk[v][s][TRUNK_SQL_ID];
                                                if(trunkid != 0)
                                                {
                                                      if(get_vehicle_trunk[v][s][TRUNK_SQL_ID] == trunkid)
                                                      {
                                                              //if(get_vehicle_trunk[v][s][TRUNK_OC_ID] == VID)
                                                              printf("[TRUNK_DEBUG]: Data trunk was  downloaded from SQL ID:[%d], for VID:[%d]", get_vehicle_trunk[v][s][TRUNK_SQL_ID], VID);
                                                              cache_get_value_int(idx, "item_type", get_vehicle_trunk[v][s][TRUNK_ITEM_TYPE] );
                                                              cache_get_value_int(idx, "amount", get_vehicle_trunk[v][s][TRUNK_ITEM_AMOUNT] );
                                                              cache_get_value_int(idx, "value", get_vehicle_trunk[v][s][TRUNK_ITEM_VALUE] );
                                                              cache_get_value_int(idx, "owner_id", get_vehicle_trunk[v][s][TRUNK_OWNER_ID] );
                                                              printf("[TRUNK_DEBUG]: Item Loaded is SQL id:[%d], Slot:[%d], Type:[%d], Amount:[%d], Value:[%d], In VID:[%d]", get_vehicle_trunk[v][s][TRUNK_SQL_ID], get_vehicle_trunk[v][s][TRUNK_SLOT], get_vehicle_trunk[v][s][TRUNK_ITEM_TYPE], get_vehicle_trunk[v][s][TRUNK_ITEM_AMOUNT], get_vehicle_trunk[v][s][TRUNK_ITEM_VALUE], VID);
                                                            
                                                              buffer ++;
                                                              break;

                                                      }  // end system macthing trunk id
                                          } // system VID maching
                                                

                                          } // end system trunk id
                                    }// end of slot selection system
                                          
                                  }// end check row
                            } // end loop slot    
                  } // end VID matching
                            
              } // end invalid veh id
                 
                          
                               
                        
                    

          }// end max vehicle
              

          cache_delete(result);
          printf("[Trunks]: Item on upload from SQL: %d", buffer);

          return 1;
}


stock LoadOwnableCars()
{
  printf("[OC_DEBUG]: Debug open function");
  new rows, vehicleid, idx=1;
  new Cache:result;

  result = n_mysql_query(g_Sql, "SELECT * FROM `oc.`", true);
  rows = cache_num_rows();
  printf("[OC_DEBUG]: Have found:[%d] row(s) in SQL ", rows);
  /*
  if(rows > MAX_OWNABLE_CARS)
  {
    rows = MAX_OWNABLE_CARS;
    printf("[OwnableCars]: WARNINGS DataBase rows over the limit of MAX_OWNABLE_CARS");
  }
  */
  for(rows=cache_num_rows(); idx<rows; idx++ ) 
  {
            printf("[OC_DEBUG]: Load row:[%d]", idx);

            cache_get_value_int(idx, "id", get_ownable_car[idx][OC_SQL_ID]); 
            cache_get_value_int(idx, "owner_id", get_ownable_car[idx][OC_OWNER_ID]);
          
            cache_get_value_int(idx, "model_id", get_ownable_car[idx][OC_MODEL_ID] );
            
            cache_get_value_int(idx, "color_1", get_ownable_car[idx][OC_COLOR_1] );
            cache_get_value_int(idx, "color_2", get_ownable_car[idx][OC_COLOR_2] );

            cache_get_value_name_float(idx, "pos_x", get_ownable_car[idx][OC_POS_X] );
            cache_get_value_name_float(idx, "pos_y", get_ownable_car[idx][OC_POS_Y] );
            cache_get_value_name_float(idx, "pos_z", get_ownable_car[idx][OC_POS_Z] );
            cache_get_value_name_float(idx, "angle", get_ownable_car[idx][OC_ANGLE] );

            cache_get_value_int(idx, "World", get_ownable_car[idx][OC_World] );
            SetOwnableCarData(idx, OC_Int,      cache_get_value_int(idx, "Inter", get_ownable_car[idx][OC_Int] ));

            //cache_get_field_content(idx, "number", get_ownable_car[idx][OC_NUMBER]);

            SetOwnableCarData(idx, OC_KEY_IN,     bool: cache_get_value_int(0, "key_in", get_ownable_car[idx][OC_KEY_IN] ));

            SetOwnableCarData(idx, OC_CREATE,     cache_get_value_int(0, "create_time", get_ownable_car[idx][OC_CREATE] ));

            SetOwnableCarData(idx, OC_PT_ENGINE,  cache_get_value_int(0, "pt_engine", get_ownable_car[idx][OC_PT_ENGINE] ));
            SetOwnableCarData(idx, OC_PT_BRAKE,   cache_get_value_int(0, "pt_brake", get_ownable_car[idx][OC_PT_BRAKE] ));
            SetOwnableCarData(idx, OC_PT_STABILITY, cache_get_value_int(0, "pt_stability", get_ownable_car[idx][OC_PT_STABILITY] ));

            SetOwnableCarData(idx, OC_PAINTJOBID,   cache_get_value_int(0, "paintjob", get_ownable_car[idx][OC_PAINTJOBID] ));
            SetOwnableCarData(idx, OC_COMPID,     cache_get_value_int(0, "componentid", get_ownable_car[idx][OC_COMPID] ));

            SetOwnableCarData(idx, OC_SPOILER,    cache_get_value_int(0, "Spoiler", get_ownable_car[idx][OC_SPOILER] ));
            SetOwnableCarData(idx, OC_NITRO,    cache_get_value_int(0, "Nitro", get_ownable_car[idx][OC_NITRO] ));
            SetOwnableCarData(idx, OC_LAMPS,    cache_get_value_int(0, "Lamps", get_ownable_car[idx][OC_LAMPS] ));
            SetOwnableCarData(idx, OC_SIDES,    cache_get_value_int(0, "Sides", get_ownable_car[idx][OC_SIDES] ));
            SetOwnableCarData(idx, OC_HOOD,     cache_get_value_int(0, "Hood", get_ownable_car[idx][OC_HOOD] ));
            SetOwnableCarData(idx, OC_VENTS,    cache_get_value_int(0, "Vents", get_ownable_car[idx][OC_VENTS] ));
            SetOwnableCarData(idx, OC_EXHAUST,    cache_get_value_int(0, "Exhaust", get_ownable_car[idx][OC_EXHAUST] ));
            SetOwnableCarData(idx, OC_WHEELS,     cache_get_value_int(0, "Wheels", get_ownable_car[idx][OC_WHEELS] ));
            SetOwnableCarData(idx, OC_RBUMP,    cache_get_value_int(0, "RBumper", get_ownable_car[idx][OC_RBUMP] ));
            SetOwnableCarData(idx, OC_FBUMP,    cache_get_value_int(0, "FBumper", get_ownable_car[idx][OC_FBUMP] ));
            SetOwnableCarData(idx, OC_ROOF,     cache_get_value_int(0, "Roof", get_ownable_car[idx][OC_ROOF] ));
            printf("[OC_DEBUG]: Succes loaded SQL data from VID:[%d], Model[%d], Coordinate[%0.1f],[%0.1f],[%0.1f],[%0.1f], Color[%d][%d].", get_ownable_car[idx][OC_SQL_ID],  get_ownable_car[idx][OC_MODEL_ID], get_ownable_car[idx][OC_POS_X], get_ownable_car[idx][OC_POS_Y], get_ownable_car[idx][OC_POS_Z], get_ownable_car[idx][OC_ANGLE], get_ownable_car[idx][OC_COLOR_1], get_ownable_car[idx][OC_COLOR_2]);
            // ----------------------------------------------------------------------------------------
              //CreateVehicle(vehicletype, Float:x, Float:y, Float:z, Float:rotation, color1, color2, respawn_delay, addsiren=0)
              vehicleid = CreateVehicle( get_ownable_car[idx][OC_MODEL_ID], get_ownable_car[idx][OC_POS_X], get_ownable_car[idx][OC_POS_Y], get_ownable_car[idx][OC_POS_Z], get_ownable_car[idx][OC_ANGLE], get_ownable_car[idx][OC_COLOR_1], get_ownable_car[idx][OC_COLOR_2], 0,0, VEHICLE_ACTION_TYPE_OWNABLE_CAR);
              //get_ownable_car[idx][OC_SQL_ID];
              //get_ownable_car[idx][OC_IDinSvr] = GetRealIdCar(idx);
              get_vehicle_data[vehicleid][V_ACTION_TYPE]=VEHICLE_ACTION_TYPE_OWNABLE_CAR;
              new VID = CarN[vehicleid][2]=get_ownable_car[idx][OC_SQL_ID];
              get_ownable_car[VID][OC_OWNER_ID]=get_ownable_car[idx][OC_OWNER_ID];
              get_ownable_car[VID][OC_MODEL_ID]=get_ownable_car[idx][OC_MODEL_ID];
              get_ownable_car[VID][OC_COLOR_1]=get_ownable_car[idx][OC_COLOR_1];
              get_ownable_car[VID][OC_COLOR_2]=get_ownable_car[idx][OC_COLOR_2];
              get_ownable_car[VID][OC_POS_X]=get_ownable_car[idx][OC_POS_X];
              get_ownable_car[VID][OC_POS_Y]=get_ownable_car[idx][OC_POS_Y];
              get_ownable_car[VID][OC_POS_Z]=get_ownable_car[idx][OC_POS_Z];
              get_ownable_car[VID][OC_ANGLE]=get_ownable_car[idx][OC_ANGLE];
              get_ownable_car[VID][OC_World]=get_ownable_car[idx][OC_World];

              get_vehicle_data[vehicleid][V_SQL_ID] = get_ownable_car[idx][OC_SQL_ID];
              get_ownable_car[idx][OC_IDinSvr] = vehicleid;

              printf("[OWNABLE CAR]: Loaded VID:[%d], owner id:[%d], ID in Server:[%d]", get_ownable_car[idx][OC_SQL_ID],  get_ownable_car[idx][OC_OWNER_ID], vehicleid);
              LinkVehicleToInterior(vehicleid, GetOwnableCarData(idx, OC_Int));
              SetVehicleVirtualWorld(vehicleid, GetOwnableCarData(idx, OC_World));
              if(vehicleid != INVALID_VEHICLE_ID)
              {
              CreateVehicleLabel(vehicleid, GetOwnableCarData(idx, OC_NUMBER), 0xFFFF00EE, 0.0, 0.0, 1.3, 20.0);
              cache_get_value_int(idx, "status", g_vehicle_params[vehicleid][V_LOCK] );
              cache_get_value_name_float(idx, "mileage", g_vehicle_params[vehicleid][V_MILEAGE] );
             
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

  printf("[OwnableCars]: Spawned: [%d vehicle(s)]", get_ownable_car_loaded);
  
}



n_mysql_query(con,query[],bool:cache = true)
{
    if(MySQLconnect==false)return SCMALL(-1,"Saving in MySQL");
    new time = GetTickCount();
  if(cache==true)mysql_query(con ,query);
  else if(cache==false)mysql_query(con ,query,false);
    if(DeBag==true){printf("%s - <Query change in [%i] Mili Second>",query,GetTickCount()-time);}
  return true;
}

SavePlayer(playerid) // ini adalah fungsi callback saveplayer untuk simpan data ke mysql
{
            // fungsi untuk save player data
           // SendClientMessage(playerid, -1, "MySQL di coba untuk simpan");
            pInfo[playerid][pInterior] = GetPlayerInterior(playerid);
            pInfo[playerid][pWorld] = GetPlayerVirtualWorld(playerid);

            if(pInfo[playerid][Logged] == 1)
            // checks if the player is logged
            {
              // stock simpan data player
                new Query[500];
                format(Query, 500, "UPDATE `playerdata` SET `admin` = '%d', `score` = '%d', `money` = '%i',`component` = '%i', `kills` = '%d', `deaths` = '%d', `posisiorang` = '%s', `posisimobil` = '%s', `pWorld` = '%s', `pinterior` = '%s' WHERE `id` = '%d' LIMIT 1",
                pInfo[playerid][pAdmin],
                pInfo[playerid][pScore],
                pInfo[playerid][pMoney],
                pInfo[playerid][pComponent],
                pInfo[playerid][pKills],
                pInfo[playerid][pDeaths],
                pInfo[playerid][pPosisiTerakhir],
                pInfo[playerid][pPosisiMobil],
                pInfo[playerid][pWorld],
                pInfo[playerid][pInterior],
                pInfo[playerid][ID]);

                mysql_query(MySQL:g_Sql,Query, bool:true);

                SendClientMessage(playerid, -1, "MySQL data uang anda telah di update :)");

              
                
            for(new i; i < 13; i++) // looping through all weapon slots (0 - 12)
            {
              new
                weaponid,
                ammo;

                // koding nyimpan senjata
                //GetPlayerWeaponData(playerid, slot, weapons, ammo)
                GetPlayerWeaponData(playerid, i, weaponid, ammo); // get weaponid and ammo

                if(!weaponid) continue; // don't insert if there's no weapon in this slot
                new savesenjata[500];
                format(savesenjata, 500, "INSERT INTO player_weapons VALUES (%d, %d, %d) ON DUPLICATE KEY UPDATE ammo = %d;", pInfo[playerid][ID], weaponid, ammo, ammo);
                mysql_query(MySQL:g_Sql, savesenjata[499],bool:true); // parallel queries
                
                //SendClientMessage(playerid, -1, savesenjata);
                return 1;
            }


            new loaddataplayer[200];
              format(loaddataplayer, sizeof(Query), "SELECT * FROM `playerdata` WHERE `id` COLLATE latin1_general_cs = '%i' LIMIT 1", pInfo[playerid][ID]);
              mysql_query(MySQL:g_Sql, loaddataplayer[199], bool:true);

                
              // simpan posisi mobil.
              GetVehiclePos(VehiclePlayerPrimary[playerid][VehID], Float:pInfo[playerid][pMx], Float:pInfo[playerid][pMy], Float:pInfo[playerid][pMz]);

              new kordinatmobil[500];
              format(kordinatmobil, 500, "UPDATE `playerdata` SET `pmx` = '%f',`pmy` = '%f',`pmz` = '%f' WHERE `id` = '%i' LIMIT 1", Float:pInfo[playerid][pMx], Float:pInfo[playerid][pMy], Float:pInfo[playerid][pMz], pInfo[playerid][ID]);
              mysql_query(MySQL:g_Sql, kordinatmobil[499], bool:true);
              SendClientMessage(playerid, -1, kordinatmobil);
              
              printf("SAVED: New vehicle position on %f, %f, %f has owned bye ID %i", Float:pInfo[playerid][pMx], Float:pInfo[playerid][pMy], Float:pInfo[playerid][pMz], pInfo[playerid][ID]);
            
            //this basically gets the variables and stores it to the players special identifier called "ID".


              // fungsi untuk simpan posisi orang saat save data player


            GetPlayerPos(playerid, Float:pInfo[playerid][pPx], Float:pInfo[playerid][pPy], Float:pInfo[playerid][pPz]);

              new simpanorang[500];
              format(simpanorang, 500, "UPDATE `playerdata` SET `ppx` = '%f',`ppy` = '%f',`ppz` = '%f' WHERE `id` = '%d' LIMIT 1",
              pInfo[playerid][pPx], pInfo[playerid][pPy], pInfo[playerid][pPz], pInfo[playerid][ID]);
              //mysql_query(MySQL:handle, const query[], bool:use_cache = true)
              mysql_query(MySQL:g_Sql,simpanorang, bool:true);


              new lokasidisimpan[500];
              format(lokasidisimpan, 500, "SAVED: New position for: %f, %f, %f", pInfo[playerid][pPx], pInfo[playerid][pPy], pInfo[playerid][pPz] );
              SendClientMessage(playerid, -1, lokasidisimpan);

            }

    // batas bila player sudah login
    return 1;
}


public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
  new message[526+1];
  new string[140];
  new Float:pos[2];
  
  if(dialogid == DIALOG_INPUT_OC_ITEM)
  {
        new str[500], NewSQL_ID;
        new targetOC_ID, slot, item_type, amount, value;
        if(response)
        {


              if(sscanf( inputtext, "iiiii", targetOC_ID, slot, item_type, amount, value)) return SCM(playerid, -1, "USAGE: [targetOC_ID]  [slot] [item_type] [amount] [value]");
              new playa,carid=GetRealIdCar(targetOC_ID);
              SetPVarInt(playerid, "SelectedSlot", slot);
              printf("DEBUG: Checking VID changer from vehicle ID:[%d]", carid);
              ToggleBoot( carid, VEHICLE_PARAMS_ON);
              if(slot >= MAX_TRUNK_SLOTS || slot <= 0) return SCM(playerid, -1, "VEHICLE: Max trunk slot is 3 sir.",1);
              printf("DEBUG: Adding item trunk in slot:[%d]", slot);
              LoadOCTrunks(playerid, carid);
              if(get_vehicle_trunk[carid][slot][TRUNK_SLOT]==slot) return SCM(playerid, -1, "OC_TRUNK: That slot has been used in this vehicle sir. Please remove item from this slot first.",1);
              
              /*
                for(new s=1; s<=10; s++)
                    {
                        if(get_vehicle_trunk[carid][s][TRUNK_SQL_ID]>0)continue;
                        if(get_vehicle_trunk[carid][s][TRUNK_SQL_ID]==slot)
                        {

                        break; 
                        }
                    }
              */
              if(!IsValidVehicle(carid))return SCM(playerid, -1, "VEHICLE: Thats vehicle has not exist sir.",1);
              printf("DEBUG: Slot filter hassben passed sir");
              new VID = targetOC_ID;
              new result = n_mysql_query(g_Sql, "SELECT * FROM `trunkdata`", true); //ORDER BY oc_id ASC, slot ASC
              new rows = cache_num_rows();
              new number=get_vehicle_trunk[carid][slot][TRUNK_SQL_ID];
              for(new v; v<=MAX_VEHICLES; v++) // forward looping increment function
              {
                    for(new slot; slot<=MAX_TRUNK_SLOTS; slot++)
                    {
                     
                      for(new idx; idx <= rows; idx ++)
                          {
                                cache_get_value_int(idx, "id", get_vehicle_trunk[v][slot][TRUNK_SQL_ID] );
                                /*
                                if(get_vehicle_trunk[v][slot][TRUNK_SQL_ID]>0)continue;
                                 number++;
                                if(number != get_vehicle_trunk[v][slot][TRUNK_SQL_ID])
                                number++;
                                printf("[TRUNK]: New id:[%d]", number );
                                if(number != get_vehicle_trunk[v][slot][TRUNK_SQL_ID])
                                {
                                    number++;
                                    if(number != get_vehicle_trunk[v][slot][TRUNK_SQL_ID])
                                    number++;
                                    if(number != get_vehicle_trunk[v][slot][TRUNK_SQL_ID])
                                    NewSQL_ID = number; 
                                    number++;
                                    if(number != get_vehicle_trunk[v][slot][TRUNK_SQL_ID])
                                    NewSQL_ID = number;
                                    number++;
                                    if(number != get_vehicle_trunk[v][slot][TRUNK_SQL_ID])
                                    printf("[TRUNK]: New final SQL id:[%d]", number );

                                    //if(NewSQL_ID ==0 )
                                    break; // find emty slot vehicle ID. with find number primary car player
                               }*/
                          }  
                    }


              }
              
              cache_delete(result);
              NewSQL_ID = GetFreeTrunkID(carid, slot)+1; printf("[TRUNK ID]: New final SQL id:[%d]", NewSQL_ID );
              format(str, sizeof(str), "{FFBBBB}DEBUG: NewSQL_ID: [%i]", NewSQL_ID); SCM(playerid, 0xFFCCCCFF, str);

              if(NewSQL_ID==0)return SCM(playerid, -1, "{FFBBBB}SQL: {FFFFFF}System new ID SQL was failed sir");
              if(NewSQL_ID>=0)printf("{FFBBBB}DEBUG: New id SQL trunk has been found",VID,GetRPName(playerid));
              
              slot, get_vehicle_trunk[carid][slot][TRUNK_ITEM_TYPE] = item_type, get_vehicle_trunk[carid][slot][TRUNK_ITEM_AMOUNT] = amount, get_vehicle_trunk[carid][slot][TRUNK_ITEM_VALUE] = value;
              //get_vehicle_trunk[carid][slot][TRUNK_SQL_ID]=get_vehicle_trunk[carid][slot][TRUNK_SQL_ID]+1;
              if(get_vehicle_trunk[carid][slot][TRUNK_SQL_ID] == NewSQL_ID)
              {

    
                  format(str, sizeof(str), "UPDATE `trunkdata` SET `oc_id`='%d',`slot`='%d',`item_type`='%d',`amount`='%d',`value`='%d',`owner_id`='%d' WHERE `id`='%d'", VID, slot, item_type, amount, value, pInfo[playerid][ID],  NewSQL_ID);
                  n_mysql_query(g_Sql, str); 
                  get_vehicle_trunk[carid][slot][TRUNK_SQL_ID] = NewSQL_ID;
              }
              else
              {
                  format(str, sizeof(str), "INSERT INTO `trunkdata` (`id`, `owner_id`, `oc_id`, `slot`, `item_type`, `amount`, `value`) VALUES ('%d', '%d', '%d', '%d', '%d', '%d', '%d')", NewSQL_ID, pInfo[playerid][ID], VID, slot, item_type, amount, value);
                  n_mysql_query(g_Sql, str); 
                  SetSVarInt("SlotTrunkUsed", NewSQL_ID);
              }
                 

              SCM(playerid,-1,"VEHICLE: You have adding item at this trunk vehicle",2);
              SendClientMessage(playerid,-1, str);
              ToggleBoot( carid, VEHICLE_PARAMS_OFF);
        }
        if(!response)
            {
                  DisablePlayerGPS(playerid);
                  format(string, sizeof(string), "* %s get closed the trunk of vehicle with both hands.", GetRPName(playerid));
                  LocalMessage(ACTION_DISTANCE, playerid, COLOR_ME, string);
                  LocalMessage(ACTION_DISTANCE, playerid, COLOR_ME, "* The trunk look empty now.((Staff of Cityes))");
                  
                  return cmd_stats(playerid);
            }
      return true;
  }
}



CMD:addoctrunkitem(playerid)
{
	
	ShowPlayerDialog(playerid, DIALOG_INPUT_OC_ITEM, DIALOG_STYLE_INPUT, ""COL_WHITE"Please input the trunk data sir", "\n "COL_ORANGE"[targetOC_ID]  [slot] [item_type] [amount] [value]\n\n", "add", "Cancel");
	return 1;
}



CMD:trunk(playerid, params[])
{
  new closestcar = GetClosestCar(playerid, INVALID_VEHICLE_ID);
  new x,y,z, slot;
  GetVehiclePos(closestcar, Float:x, Float:y, Float:z);
  new string[200];
  format(string, 200, ""COL_LIGHTBLUE"DEBUG:{FFFFFF} ID vehicle is [{FFAAAA}%i{FFFFFF}], Time to process system trunk.", closestcar); 
  SEM(playerid, string);
   // make new fuction about stock load the trunks data from SQL
  if(!IsPlayerInAnyVehicle(playerid))
  {

    new VID=CarN[closestcar][2];
    format(string, 200, ""COL_LIGHTBLUE"DEBUG:{FFFFFF} Player range of coordinate vehicle SQL[%s] in: %f, %f, %f", VID, Float:x, Float:y, Float:z); 
	SEM(playerid, string);
    if(IsPlayerInRangeOfPoint(playerid, Float:15.0,  Float:x, Float:y, Float:z))
    {

		  
          

    	if(VID>0&&!CheckCarKey(playerid,VID)) return true;
        {

		  	
            pInfo[playerid][LastVehicleID] = closestcar;
            ToggleBoot( GetPlayerData( playerid, LastVehicleID), VEHICLE_PARAMS_ON); 
            LoadOCTrunks(playerid, closestcar);
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
			
            for(slot = 1; slot < MAX_TRUNK_SLOTS; slot ++)
            {
                
                 format(trunkdataslot1items, sizeof(trunkdataslot1items),
	             ""COL_RED"SQL ID\t"COL_BLUE"Items\t"COL_GREEN"Amount\n\
	             %s\t%s\t%i\n\
	             ", 
	            get_vehicle_trunk[closestcar][slot][TRUNK_SQL_ID], get_vehicle_trunk[closestcar][slot][TRUNK_ITEM_TYPE],  get_vehicle_trunk[closestcar][slot][TRUNK_ITEM_AMOUNT]  );
	            
            }

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


