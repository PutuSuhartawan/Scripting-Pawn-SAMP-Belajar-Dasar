	if(strcmp(cmd, "/spec", true) == 0 || strcmp(cmd, "/recon", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        if(PlayerInfo[playerid][pAdmin] <= 1)
			{
				SendClientMessage(playerid, COLOR_GREY, "   You are not authorized to use that command !");
				return 1;
			}
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_WHITE, "USAGE: /spec [playerid/off]");
				return 1;
			}
			giveplayerid = ReturnUser(tmp);
			if(IsPlayerNPC(giveplayerid)) return 1;
			if(strcmp("off", tmp, true, strlen(tmp)) == 0)
			{
			    if(GetPlayerState(playerid) != PLAYER_STATE_SPECTATING)
			    {
			        SendClientMessage(playerid, COLOR_GREY, "   You are not spectating anyone !");
					return 1;
			    }
			    if(adminduty[playerid] == 1)
		        {
	               SetPlayerColor(playerid, FLASH);
			    }
			    else
			    {
	               SetPlayerToTeamColor(playerid);
			    }
			    SetPlayerHealth(playerid, PlayerInfo[playerid][pHealth]);
				SetPlayerArmour(playerid, PlayerInfo[playerid][pArmor]);
				SetPlayerVirtualWorld(playerid, PlayerInfo[playerid][pVirtualWorld]);
				SetPlayerInterior(playerid, PlayerInfo[playerid][pInt]);
			    SetPlayerPos(playerid, PlayerInfo[playerid][pSPos_x], PlayerInfo[playerid][pSPos_y], PlayerInfo[playerid][pSPos_z]);
				SetPlayerFacingAngle(playerid, PlayerInfo[playerid][pSPos_r]);
				SendClientMessage(playerid, COLOR_WHITE, "You are no longer spectating.");
			    TogglePlayerSpectating(playerid, 0);
			    SpectatedID[playerid] = INVALID_PLAYER_ID;
			    SpectateType[playerid] = ADMIN_SPEC_TYPE_NONE;
			    HidePM[playerid] = 0;
			    CanTalk[playerid] = 1;
				PhoneOnline[playerid] = 0;
				ResetPlayerAdminWeaponsEx(playerid);
			    return 1;
			}
			if(IsPlayerConnected(giveplayerid))
			{
				if(GetPlayerState(playerid) != PLAYER_STATE_SPECTATING)
				{
                    new Float:playersArrmor;
			        new Float:playersHealth;
			        GetPlayerHealth(playerid, playersHealth);
				    GetPlayerArmour(playerid, playersArrmor);
				    PlayerInfo[playerid][pHealth] = playersHealth;
					PlayerInfo[playerid][pArmor] = playersArrmor;
					PlayerInfo[playerid][pInt] = GetPlayerInterior(playerid);
					GetPlayerPos(playerid, Playerx[playerid], Playery[playerid], Playerz[playerid]);
					GetPlayerFacingAngle(playerid, PlayerInfo[playerid][pSPos_r]);
					PlayerInfo[playerid][pSPos_x] = Playerx[playerid];
				    PlayerInfo[playerid][pSPos_y] = Playery[playerid];
				    PlayerInfo[playerid][pSPos_z] = Playerz[playerid];
				}
				SetPlayerVirtualWorld(playerid, GetPlayerVirtualWorld(giveplayerid));
				SetPlayerInterior(playerid, GetPlayerInterior(giveplayerid));
				TogglePlayerSpectating(playerid, 1);
				SpectatedID[playerid] = giveplayerid;
				HidePM[playerid] = 1;
				CanTalk[playerid] = 1;
				PhoneOnline[playerid] = 1;
				if(IsPlayerInAnyVehicle(giveplayerid))
				{
				    PlayerSpectateVehicle(playerid, GetPlayerVehicleID(giveplayerid));
				    SpectateType[playerid] = ADMIN_SPEC_TYPE_VEHICLE;
				}
				else
				{
				    PlayerSpectatePlayer(playerid, giveplayerid);
				    SpectateType[playerid] = ADMIN_SPEC_TYPE_PLAYER;
				}
			}
			else
			{
			    SendClientMessage(playerid, COLOR_GREY, "   That player isn't active !");
			    return 1;
			}
	    }
	    return 1;
	}
  
  
public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid)
{
	if(!newinteriorid)
	{
	    SetPVarInt(playerid, "InGarage", 0);
	}
    new x = 0;
	while(x != MAX_PLAYERS) //new spectate code
	{
	    if(IsPlayerConnected(x) && GetPlayerState(x) == PLAYER_STATE_SPECTATING && SpectatedID[x] == playerid)
   		{
   		    PlayerSpectatePlayer(x,playerid);
   		    SetPlayerVirtualWorld(x, newinteriorid);
			SetPlayerInterior(x, newinteriorid);
		}
		x++;
	}
}


public OnPlayerStateChange(playerid, newstate, oldstate)
{
	new string[128];
	if(newstate == PLAYER_STATE_DRIVER || newstate == PLAYER_STATE_PASSENGER)
	{
	    //new newcar = GetPlayerVehicleID(playerid);
	    ShowSpeed[playerid] = 1;
	 	/*if(GetVehicleModel(newcar) != 509 && GetVehicleModel(newcar) != 481)  // BMX & Bike
	    {
	        RadioChoose(playerid, Radio[newcar]);
		}*/
	}
	/*if(newstate == PLAYER_STATE_DRIVER || newstate == PLAYER_STATE_PASSENGER)
	{
		new vehicleid = GetPlayerVehicleID(playerid),
			playingid = v_VehicleInfo[vehicleid][RadioPlaying];
		#if USE_TEXTDRAW_SET == 2
			new string[50];
			format(string,sizeof(string),"Listening to: ~n~~w~%s",r_RadioInfo[playingid][r_Name]);
			TextDrawSetString(v_VehicleInfo[vehicleid][r_Draw],string);
		#else
			TextDrawSetString(v_VehicleInfo[vehicleid][r_Draw],r_RadioInfo[playingid][r_Name]);
		#endif
		TextDrawShowForPlayer(playerid,v_VehicleInfo[vehicleid][r_Draw]);
		SetPVarInt(playerid,"ID_HideRadioTextdraw",SetTimerEx("HideRadioTextdraw",,false,"ii",playerid,vehicleid));
		PlayAudioStreamForPlayer(playerid,r_RadioInfo[playingid][r_Link]);
		SetPVarInt(playerid,"ID_OldVehicle",vehicleid);
		return 1;
	}
	if(oldstate == PLAYER_STATE_DRIVER || oldstate == PLAYER_STATE_PASSENGER)
	{
		new vehicleid = GetPVarInt(playerid,"ID_OldVehicle"),
			timer = GetPVarInt(playerid,"ID_HideRadioTextdraw");
		if(timer != -1)
		{
			TextDrawHideForPlayer(playerid,v_VehicleInfo[vehicleid][r_Draw]);
			KillTimer(timer);
		}
		StopAudioStreamForPlayer(playerid);
	}*/
	/*if(newstate == PLAYER_STATE_DRIVER || newstate == PLAYER_STATE_PASSENGER)
	{
	    new gastext[41];
	    new vid = GetPlayerVehicleID(playerid);
     	format(gastext, sizeof(gastext), "Vehicle Fuel : %d%", Gas[vid]);
        TextDrawSetString(GasAmount, gastext);
        TextDrawShowForPlayer(playerid, GasAmount);
	}
		if(oldstate == PLAYER_STATE_DRIVER || oldstate == PLAYER_STATE_PASSENGER)
	{
		TextDrawHideForPlayer(playerid, GasAmount);
	}
		if(newstate == PLAYER_STATE_PASSENGER)*/
	{
		if(GetPlayerVehicleID(playerid) == NPCBlueBus)
		{
		    SetPlayerVirtualWorld(playerid, 2);
		    SetPlayerPos(playerid, 2021.9740,2235.6626,2103.9536);
		    SetPlayerFacingAngle(playerid, 355.3504);
		    SetCameraBehindPlayer(playerid);
		    SetPlayerInterior(playerid, 1);
		    BusID[playerid] = 1;
		    GameTextForPlayer(playerid, "~w~Bus A-1", 3000, 1);
		    costtimer = SetTimerEx("CostTimer", 30000, 1, "d", playerid);
			SendClientMessage(playerid, -1,"You have entered the bus - Please take a seat");
		    BusCost[playerid] += 20;
		}
		else if(GetPlayerVehicleID(playerid) == NPCBlackBus)
		{
            SetPlayerVirtualWorld(playerid, 3);
		    SetPlayerPos(playerid, 2021.9740,2235.6626,2103.9536);
		    SetPlayerFacingAngle(playerid, 355.3504);
		    SetCameraBehindPlayer(playerid);
		    SetPlayerInterior(playerid, 1);
		    BusID[playerid] = 2;
		    GameTextForPlayer(playerid, "~w~Bus A-2", 3000, 1);
		    SendClientMessage(playerid, -1,"You have entered the bus - Please take a seat");
		    costtimer = SetTimerEx("CostTimer", 30000, 1, "d", playerid);
		    BusCost[playerid] += 20;
		}
	}
	if(newstate == PLAYER_STATE_DRIVER || newstate == PLAYER_STATE_PASSENGER)
    {
        if(SobeitCheck1[playerid] == 1 && PlayerInfo[playerid][pAdmin] == 0)
	    {
            if(HasBanned[playerid] == 0)
            {
		        format(string, sizeof(string), "{AA3333}[BotCmd] {FFFF00}%s has been banned by Solihin_Nurdin", PlayerName(playerid));
				SendClientMessageToAll(COLOR_YELLOW, string);
				format(string, sizeof(string), "{AA3333}[Reason] {FFFF00}Ilegal Program Detected (Cheater)");
		        SendClientMessageToAll(COLOR_YELLOW, string);
				format(string, sizeof(string), "[BOT]Solihin_Nurdin");
				strmid(PlayerInfo[playerid][pBanAdmin], string, 0, strlen(string), 255);
				format(string, sizeof(string), "Ilegal Program Detected (Cheater)");
		        strmid(PlayerInfo[playerid][pBanReason], string, 0, strlen(string), 255);
			    new FileName[126];
				format(FileName, sizeof(FileName), "Banip/%s.ini", PlayerInfo[playerid][pIP]);
				if(!dini_Exists(FileName))
				{
					dini_Create(FileName);
					dini_Set(FileName, "Name", PlayerName(playerid));
			    }
				PlayerInfo[playerid][pBand] = 3;
				HasBanned[playerid] = 1;
				SetTimerEx("DelayedKick", 500, false, "i", playerid);
			}
		}
		SobeitCheck1[playerid] = 1;
	    SetTimerEx("SobeitDone", 1000, false, "i", playerid);
    }
    if(newstate == PLAYER_STATE_DRIVER)
	{
 		new vehicleid = GetPlayerVehicleID(playerid);
		GetVehicleParamsEx(vehicleid,engine,lights,alarm,doors,bonnet,boot,objective);
		if(engine == VEHICLE_PARAMS_OFF || engine == VEHICLE_PARAMS_UNSET)
		{
        	SetVehicleParamsEx(vehicleid,VEHICLE_PARAMS_OFF,VEHICLE_PARAMS_OFF,alarm,doors,bonnet,boot,objective);
        	SendClientMessage(playerid, COLOR_YELLOW, "[VEHICLE] Gunakan '/en' atau 'LALT' untuk menghidupkan mesin");
        	UnLockCar(vehicleid);
		}
		if(togtextdraw[playerid] == 1)
		{
			TextDrawShowForPlayer(playerid, spedbox1);
			TextDrawShowForPlayer(playerid, spedbox2);
			TextDrawShowForPlayer(playerid, Speedom[playerid]);
			TextDrawShowForPlayer(playerid, Healthveh[playerid]);
			TextDrawShowForPlayer(playerid, Speedveh[playerid]);
			TextDrawShowForPlayer(playerid, Fuelveh[playerid]);
		}
		SetPlayerArmedWeapon(playerid, 0);
	}
	if(oldstate == PLAYER_STATE_DRIVER)
	{
		new model = GetVehicleModel(gLastCar[playerid]);
	    if(IsACopCar(gLastCar[playerid]) || IsAHelicopter(gLastCar[playerid]) ||  model == 457)
		{
			SetPlayerWeapons(playerid);
		}
		if(GetVehicleModel(gLastCar[playerid]) == 437)
	    {
			SetVehicleToRespawn(gLastCar[playerid]);
			CP[playerid] = 0;
			PlayerInfo[playerid][pBSRoute] = 0;
			DisablePlayerCheckpoint(playerid);
			SendClientMessage(playerid, COLOR_WHITE,"Radio : Kamu telah gagal bekerja karena turun dari Bus.");
		}
		if(togtextdraw[playerid] == 1)
		{
			TextDrawHideForPlayer(playerid, spedbox1);
			TextDrawHideForPlayer(playerid, spedbox2);
			TextDrawHideForPlayer(playerid, Speedom[playerid]);
			TextDrawHideForPlayer(playerid, Healthveh[playerid]);
			TextDrawHideForPlayer(playerid, Speedveh[playerid]);
			TextDrawHideForPlayer(playerid, Fuelveh[playerid]);
		}
	}
	if(newstate == PLAYER_STATE_DRIVER)
	{
        if(GetPlayerVehicleID(playerid) >= PizzaBike[0] && GetPlayerVehicleID(playerid) <= PizzaBike[2])
		{
			if(PlayerInfo[playerid][pPRoute] == 1)
			{
				switch(PlayerInfo[playerid][pPizza])
				    {
				    case 1:
						{
							SetPlayerCheckpoint(playerid,2384.8545,-1346.4927,24.3511, 3.0);
							SendClientMessage(playerid, COLOR_WHITE,"< Pizza-Bike Radio : Take the Bike to the Next House to Deliver their Pizza >");
						}
					case 2:
					    {
							SetPlayerCheckpoint(playerid,2230.8303,-1285.8970,25.3672, 3.0);
							SendClientMessage(playerid, COLOR_WHITE,"< Pizza-Bike Radio : Take the Bike to the Next House to Deliver Their Pizza >");
						}
					case 3:
					    {
					        SetPlayerCheckpoint(playerid,2086.1628,-1185.8599,25.5327, 3.0);
							SendClientMessage(playerid, COLOR_WHITE,"< Pizza-Bike Radio : Take the Bike to the Next House to Deliver Their Pizza >");
						}
					case 4:
					    {
					        SetPlayerCheckpoint(playerid,1246.5656,-1101.0764,26.6719, 3.0);
							SendClientMessage(playerid, COLOR_WHITE,"< Pizza-Bike Radio : Take the Bike to the Next House to Deliver Their Pizza >");
						}
					case 5:
					    {
					        SetPlayerCheckpoint(playerid,961.8271,-1825.1824,13.3194, 3.0);
					        SendClientMessage(playerid, COLOR_WHITE,"< Pizza-Bike Radio : Take the Bike to the Next House to Deliver Their Pizza >");
					    }
					case 6:
					    {
					        SetPlayerCheckpoint(playerid,2695.2781,-2018.0885,13.5292, 3.0);
							SendClientMessage(playerid, COLOR_WHITE,"< Pizza-Bike Radio : Take the Bike to the Next House to Deliver Their Pizza >");
						}
					case 7:
					    {
					        SetPlayerCheckpoint(playerid,2114.3188,-1774.2660,13.3923, 3.0);
					        SendClientMessage(playerid, COLOR_WHITE,"< Pizza-Bike Radio : Take the Pizza-Bike Back to the HQ and Park it to Take your Paycheck >");
							CP[playerid] = 1703;
						}
					}
				}
			}
		}
	if (newstate == 2)
	{
	    if (oldstate == 1)
	    {
	        new
				vID = GetPlayerVehicleID(playerid);
	    	if (IsRentableCar(vID))
	    	{
				if (!IsRentedCar(vID))
				{
				    new
						String[128];
				    format(String, 128, "~p~~n~rent cost: ~b~%d~n~~w~type ~b~/rentcar~n~~w~to exit it type~n~~p~/exitrental", RENT_COST);
				    GameTextForPlayer(playerid, String, 30000, 4);
				    SendClientMessage(playerid, COLOR_YELLOW,"Type {3399CC}/rentcar{FFFFFF} to rent this car");
				    SendClientMessage(playerid, -1, "Type {3399CC}/exitrental{FFFFFF} to exit this rental car.");
				    TogglePlayerControllable(playerid, 0);
				}
				else if (IsRentedCar(vID))
				{
				    if (GetPVarInt(playerid, "CarRentID") == vID)
				    {
			    		return SendClientMessage(playerid, -1, "{3399CC}Welcome{FFFFFF} to your rented car.");
					}
					else if (GetPVarInt(playerid, "CarRentID") != vID)
					{
						new
							String[128];
						format(String, 128, "This vehicle is rented by: {3399CC}%s{FFFFFF}", RentedBy[vID]);
						SendClientMessage(playerid, -1, String);
	    				SendClientMessage(playerid, -1, "Use {3399CC}/exitrental{FFFFFF} to exit this vehicle.");
       					return 1;
					}
				}
			}
		}
	}
	if(newstate == PLAYER_STATE_DRIVER || newstate == PLAYER_STATE_PASSENGER)
    {
        new newcar = GetPlayerVehicleID(playerid);
        if(Radio[newcar] == 1)
		{
			PlayAudioStreamForPlayer(playerid, lsradio);
		}
		if(GetPlayerWeapon(playerid) == 24 || GetPlayerWeapon(playerid) == 23)
		{
		    SetPlayerArmedWeapon(playerid, 0);
		}
		new x = 0;
		while(x != MAX_PLAYERS)
		{
	    	if(IsPlayerConnected(x) && GetPlayerState(x) == PLAYER_STATE_SPECTATING && SpectatedID[x] == playerid)
   			{
   		    	PlayerSpectateVehicle(x,newcar);
			}
			x++;
		}
    }
	if(newstate == PLAYER_STATE_ONFOOT)
	{
	    new x = 0;
	    //RadioChoose(playerid, 255);
		while(x != MAX_PLAYERS)
		{
	    	if(IsPlayerConnected(x) && GetPlayerState(x) == PLAYER_STATE_SPECTATING && SpectatedID[x] == playerid)
   			{
   		    	PlayerSpectatePlayer(x,playerid);
			}
			x++;
		}
	    if(TransportDuty[playerid] > 0)
		{
		    if(TransportDuty[playerid] == 1)
			{
		        TaxiDrivers -= 1;
			}
			else if(TransportDuty[playerid] == 2)
			{
			    BusDrivers -= 1;
			}
			TransportDuty[playerid] = 0;
			JobDuty[playerid] = 0;
			format(string, sizeof(string), "* You are now Off Duty and earned $%d.", TransportMoney[playerid]);
			SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
			PlayerInfo[playerid][pCash] = PlayerInfo[playerid][pCash]+TransportMoney[playerid];
			GivePlayerMoney(playerid, TransportMoney[playerid]);
			TransportValue[playerid] = 0; TransportMoney[playerid] = 0;
			SetPlayerToTeamColor(playerid);
			PlayerPlaySound(playerid,1055,0.0,0.0,0.0);
		}
		if(TransportCost[playerid] > 0 && TransportDriver[playerid] < 999)
		{
		    if(IsPlayerConnected(TransportDriver[playerid]))
			{
			    TransportMoney[TransportDriver[playerid]] += TransportCost[playerid];
			    TransportTime[TransportDriver[playerid]] = 0;
			    TransportCost[TransportDriver[playerid]] = 0;
			    format(string, sizeof(string), "~w~The ride cost~n~~r~$%d",TransportCost[playerid]);
			    GameTextForPlayer(playerid, string, 5000, 1);
			    format(string, sizeof(string), "~w~Passenger left the taxi~n~~g~Earned $%d",TransportCost[playerid]);
			    GameTextForPlayer(TransportDriver[playerid], string, 5000, 1);
			    PlayerInfo[playerid][pCash] = PlayerInfo[playerid][pCash]-TransportCost[playerid];
				GivePlayerMoney(playerid, -TransportCost[playerid]);
				TransportCost[playerid] = 0;
				TransportTime[playerid] = 0;
				TransportDriver[playerid] = 999;
				PlayerPlaySound(playerid,1083,0.0,0.0,0.0);
			}
		}
		/*new oldcar = gLastCar[playerid];
		if(oldcar >= Trucks[0] && oldcar <= Trucks[4])
		{
		    if(PlayerInfo[playerid][pJob] == 19)
		    {
			    if(CP[playerid] >= 1340 && CP[playerid] <= 1347)
				{
					DisablePlayerCheckpoint(playerid);
					CP[playerid] = 0;
					SendClientMessage(playerid, -1,"    To finish delivery, get back in the truck.");
				}
			}
		}*/
	}
	if(newstate == PLAYER_STATE_PASSENGER) // TAXI & BUSSES
	{
	    new name[MAX_PLAYER_NAME];
	    GetPlayerName(playerid, name, sizeof(name));
	    new vehicleid = GetPlayerVehicleID(playerid);
	    ////foreach(Player, i)
        for(new i; i<MAX_PLAYERS; i++)
	    {
	        if(IsPlayerConnected(i))
	        {
	            if(IsPlayerInVehicle(i, vehicleid) && GetPlayerState(i) == 2 && TransportDuty[i] > 0)
	            {
	                if(PlayerInfo[playerid][pCash] < TransportValue[i])
	                {
	                    format(string, sizeof(string), "* You need $%d to enter.", TransportValue[i]);
						SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
						RemovePlayerFromVehicle(playerid);
	                }
	                else
	                {
	                    if(TransportDuty[i] == 1)
	                    {
	                        format(string, sizeof(string), "* You paid $%d to the Taxi Driver.", TransportValue[i]);
							SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
							if(UsingMask[i] == 1)
							{
							    format(string, sizeof(string), "* Mask %d has entered your taxi.", PlayerInfo[i][pMask]);
							}
							else
							{
								format(string, sizeof(string), "* %s has entered your taxi.", name);
							}
							SendClientMessage(i, COLOR_LIGHTBLUE, string);
							TransportTime[i] = 1;
	                    	TransportTime[playerid] = 1;
	                    	TransportCost[playerid] = TransportValue[i];
	                    	TransportCost[i] = TransportValue[i];
	                    	TransportDriver[playerid] = i;
	                    }
	                    else if(TransportDuty[i] == 2)
	                    {
	                        format(string, sizeof(string), "* You paid $%d to the Bus Driver.", TransportValue[i]);
							SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
							if(UsingMask[i] == 1)
							{
							    format(string, sizeof(string), "* Mask %d has entered your bus.", PlayerInfo[i][pMask]);
							}
							else
							{
								format(string, sizeof(string), "* %s has entered your bus.", name);
							}
							SendClientMessage(i, COLOR_LIGHTBLUE, string);
	                    }
						PlayerInfo[playerid][pCash] = PlayerInfo[playerid][pCash]-TransportValue[i];
						GivePlayerMoney(playerid, - TransportValue[i]);
						TransportMoney[i] += TransportValue[i];
	                }
	            }
	            if(GetVehicleModel(vehicleid) == 437 && GetPlayerState(i) == 2)
	            {
                    if(PlayerInfo[playerid][pCash] < 30)
	                {
						SendClientMessage(playerid, COLOR_LIGHTBLUE, "* You need $30 to enter.");
						RemovePlayerFromVehicle(playerid);
	                }
	                else
	                {
	                    if(CP[i] > 4999 && CP[i] < 5017)
	                    {
							SendClientMessage(playerid, COLOR_LIGHTBLUE, "* You paid $30 to the Bus Driver.");
							if(UsingMask[i] == 1)
							{
							    format(string, sizeof(string), "* Mask %d has entered your bus.",PlayerInfo[i][pMask]);
							}
							else
							{
								format(string, sizeof(string), "* %s has entered your bus.", name);
							}
							SendClientMessage(i, COLOR_LIGHTBLUE, string);
							PlayerInfo[playerid][pCash] -=30;
						    GivePlayerMoney(playerid, -30);
						    PlayerInfo[i][pCash] +=30;
						    GivePlayerMoney(i, 30);
	                    }
					}
				}
	        }
	    }
	}
	if(newstate == PLAYER_STATE_WASTED) //PLAYER DIES
	{
	    if(PlayerInfo[playerid][pJailed] == 0)
	    {
			if(PlayerInfo[playerid][pInjured] == 0)
			{
			    PlayerInfo[playerid][pInjured] = 1;
			}
	    }
		else
		{
   			PlayerInfo[playerid][pInjured] = 0;
		}
	}
	if(newstate == PLAYER_STATE_DRIVER)
	{
		if(GetPlayerVehicleID(playerid) >= LicCar[0] && GetPlayerVehicleID(playerid) <= LicCar[1])
		{
		    if(DrivingTest[playerid] == 1)
			{
				SendClientMessage(playerid, COLOR_WHITE, "   INFO: Go though the checkpoints to finish the test.");
				SendClientMessage(playerid,COLOR_LIGHTBLUE,"|| To pass the test, go though the designated area's, without banging up the car to badly. ||");
		 		SetPlayerCheckpoint(playerid, 1971.5177,-1930.0858,13.3958, 5.0);
				DrivingStep[playerid] = 1;
			}
			else
			{
   				SendClientMessage(playerid, COLOR_LIGHTRED, "  You are not taking the driving test !");
			    RemovePlayerFromVehicle(playerid);
			    TogglePlayerControllable(playerid, 1);
			}
		}
	}
	if(newstate == PLAYER_STATE_DRIVER)
	{
		if(GetPlayerVehicleID(playerid) >= SailingCar[0] && GetPlayerVehicleID(playerid) <= SailingCar[1])
		{
		    if(SailingTest[playerid] == 1)
			{
				SendClientMessage(playerid, COLOR_WHITE, "   INFO: Go though the checkpoints to finish the test.");
				SendClientMessage(playerid,COLOR_LIGHTBLUE,"|| To pass the test, go though the designated area's, without damaging the boat to badly. ||");
		 		SetPlayerCheckpoint(playerid, 112.0620,-1837.4271,-0.0493, 5.0);
				SailingStep[playerid] = 1;
			}
			else
			{
   				SendClientMessage(playerid, COLOR_LIGHTRED, "  You are not taking the Sailing test !");
			    RemovePlayerFromVehicle(playerid);
			    TogglePlayerControllable(playerid, 1);
			}
		}
	}
	if(oldstate == PLAYER_STATE_ONFOOT && newstate == PLAYER_STATE_DRIVER)
	{
	    new Float:V1X, Float:V1Y, Float:V1Z;
		new newcar = GetPlayerVehicleID(playerid);
		new Model = GetVehicleModel(newcar);
		new oldcar = gLastCar[playerid];
		new type = FactionInfo[PlayerInfo[playerid][pMember]][FactionType];
		if(Radio[newcar] == 1)
		{
	       StopAudioStreamForPlayer(playerid);
		}
		if(IsABoat(newcar))
		{
		    if(PlayerInfo[playerid][pBoatLic] < 1 && SailingTest[playerid] == 0)
			{
			    SendClientMessage(playerid, COLOR_GREY, "   You don't know how to Sail yet, so you left the Boat !");
			    RemovePlayerFromVehicle(playerid);
			}
		}
		else
		{
			if(PlayerInfo[playerid][pCarLic] < 1)
			{
				SendClientMessage(playerid, COLOR_GREY, "You don't have a Driving License - Take care of the Cops [You can obtain one at the DMV]");
			}
		}
		/*if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 525)
		{
			GameTextForPlayer(playerid, "~w~press ~r~~k~~TOGGLE_SUBMISSIONS~~w~ to tow a car.", 3000, 4);
		}*/
		if(GetPlayerVehicleID(playerid) >= Trashmaster[0] && GetPlayerVehicleID(playerid) <= Trashmaster[1])
		{
            if(PlayerInfo[playerid][pJobdelay] != 0)
            {
		    	SendClientMessage(playerid, COLOR_WHITE, "Kamu tidak bisa bekerja hingga Waktu Delay kamu habis");
		    	GetPlayerPos(playerid, V1X, V1Y, V1Z);
		        SetPlayerPos(playerid, V1X, V1Y, V1Z+2);
		        PlayerPlaySound(playerid, 1130, V1X, V1Y, V1Z+2);
		        ClearAnimations(playerid);
	    	}
	    	else
	    	{
		    	if(PlayerInfo[playerid][pTRoute] == 0)
			    {
			    	SendClientMessage(playerid, COLOR_WHITE, "Trash-Master Radio : Type /loadtrash to start your Working Route");
		    	}
			}
		}
		if(GetPlayerVehicleID(playerid) >= PizzaBike[0] && GetPlayerVehicleID(playerid) <= PizzaBike [2])
		{
      		if(PlayerInfo[playerid][pJobdelay] != 0)
            {
			    SendClientMessage(playerid, COLOR_WHITE, "Kamu tidak bisa bekerja hingga Waktu Delay kamu habis");
			    GetPlayerPos(playerid, V1X, V1Y, V1Z);
		        SetPlayerPos(playerid, V1X, V1Y, V1Z+2);
		        PlayerPlaySound(playerid, 1130, V1X, V1Y, V1Z+2);
		        ClearAnimations(playerid);
	    	}
	    	else
	    	{
		    	if(PlayerInfo[playerid][pPRoute] == 0)
			    {
			        SendClientMessage(playerid, COLOR_WHITE, "Pizza-Bike Radio : Type /startpizza to start Delivering Pizza to The houses");
	      		}
			}
		 }
		/*if(GetPlayerVehicleID(playerid) >= Trucks[0] && GetPlayerVehicleID(playerid) <= Trucks[4])
		{
		    SendClientMessage(playerid, -1, "   Type /loadtruck to load the goods on your truck.");
		}*/
		if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 519)
		{
			GameTextForPlayer(playerid, "~w~use ~r~(/int)ercom~w~ to speak with your passengers.", 3000, 4);
		}
		if(IsACopCar(newcar))
		{
		if(type == 1) { }
		    else{ SendClientMessage(playerid, COLOR_GREY, "You don't have the keys for this vehicle [Hint : LSPD-SASD-FBI Vehicles]"); ClearAnimations(playerid); }
		}
		if(IsANGCar(newcar))
		{
		if(type == 3) { }
		    else{ SendClientMessage(playerid, COLOR_GREY, "You don't have the Keys for this vehicle [Hint : DoC Members Vehicles]"); ClearAnimations(playerid); }
		}
		else if(IsANewsCar(newcar))
		{
		   if(type == 7) { }
		    else { SendClientMessage(playerid,COLOR_GREY,"   You don't have the keys for this vehicle [SA-News Agency Vehicles]"); ClearAnimations(playerid); }
		}
		else if(IsABus(newcar))
		{
	    	if(PlayerInfo[playerid][pLevel] < 2)
	    	{
            	SendClientMessage(playerid, COLOR_YELLOW,"Minimal Level 2 untuk bekerja sebagai Supir Bus !");
            	RemovePlayerFromVehicle(playerid);
            	return 1;
			}
		    ShowPlayerDialog(playerid, 69, DIALOG_STYLE_LIST, "Los Santos Bus Company" , "Rute A (800$)\nRute B (1,000$)\nRute C (2,000$)", "Select", "Cancel");
		}
		else if(IsAnAmbulance(newcar))
		{
		    if(type == 8) { }
		    else { SendClientMessage(playerid,COLOR_GREY,"   You don't have the keys for this vehicle [E.M.S Vehicles]!"); ClearAnimations(playerid); }
		}
		/*else if(newcar >= SSVehicles[0] && newcar <= SSVehicles[5])
		{
		   	if(!(PlayerInfo[playerid][pMember] == 7))
			{
		        SendClientMessage(playerid,COLOR_GREY,"   You don't have the keys for this vehicle [Secret Service Vehicles]!");
				ClearAnimations(playerid);
			}
		}
		else if(newcar >= Trucks[0] && newcar <= Trucks[4])
		{
		    if(PlayerInfo[playerid][pJob] == 19)
		    {
				if(CP[playerid] == 0 && TruckGoods[newcar] == 0)
				{
					if(TruckGoods[newcar] == 1)
					{
						SetPlayerCheckpoint(playerid, 1499.6423,-1589.6134,13.3828, 3.0);
			 			CP[playerid] = 1340;
					}
					if(TruckGoods[newcar] == 2)
					{
					    SetPlayerCheckpoint(playerid, 1194.1232,-1323.2413,13.3984, 3.0);
					    CP[playerid] = 1341;
					}
					if(TruckGoods[newcar] == 3)
					{
					    SetPlayerCheckpoint(playerid, 816.3569,-1391.6063,13.4065, 3.0);
					    CP[playerid] = 1342;
					}
					if(TruckGoods[newcar] == 4)
					{
					    SetPlayerCheckpoint(playerid, 481.9336,-1499.8834,20.3204, 3.0);
					    CP[playerid] = 1343;
					}
					if(TruckGoods[newcar] == 5)
					{
						SetPlayerCheckpoint(playerid, 1360.2253,-1279.8677,13.3828, 3.0);
						CP[playerid] = 1344;
					}
					if(TruckGoods[newcar] == 6)
					{
					    SetPlayerCheckpoint(playerid, 1099.5890,-1210.1484,17.3746, 3.0);
					    CP[playerid] = 1345;
					}
					if(TruckGoods[newcar] == 7)
					{
					    SetPlayerCheckpoint(playerid, 1361.7418,-1650.9559,13.3828, 3.0);
					    CP[playerid] = 1346;
					}
					if(TruckGoods[newcar] == 8)
					{
					    SetPlayerCheckpoint(playerid, 1897.3386,-1866.8689,13.1412, 3.0);
					    CP[playerid] = 1347;
					}
				}
				else
				{
				    SendClientMessage(playerid, COLOR_GRAD2, "  This truck is loaded, but you already have an active checkpoint");
				    SendClientMessage(playerid, -1, "   To finish this delivery, lose the old checkpoint first or destroy it(/dcp)");
				}
			}
			else
			{
			    SendClientMessage(playerid,COLOR_GREY,"   You're not a trucker!");
				RemovePlayerFromVehicle(playerid);
			}
		}*/
////////CARS
		if(oldcar != PlayerVehicleID1[playerid])
		{
		    UnLockCar(oldcar);
		}
		else if(oldcar != PlayerVehicleID2[playerid])
		{
		    UnLockCar(oldcar);
		}
		else if(oldcar != PlayerVehicleID3[playerid])
		{
		    UnLockCar(oldcar);
		}
		else if(oldcar != PlayerVehicleID4[playerid])
		{
		    UnLockCar(oldcar);
		}
		else if(oldcar != PlayerVehicleID5[playerid])
		{
		    UnLockCar(oldcar);
		}
		new Float:playerhp;
		if(VehicleInfo[newcar][VehicleDealership] == 1)
		{
			if(newcar == PlayerVehicleID1[playerid] || newcar == PlayerVehicleID2[playerid] || newcar == PlayerVehicleID3[playerid] || newcar == PlayerVehicleID4[playerid] || newcar == PlayerVehicleID5[playerid])
			{
				format(string,sizeof(string),"	You are the owner of this %s.",vehName[Model-400]);
				SendClientMessage(playerid,COLOR_GREY,string);
				return 1;
			}
			else
			{
				if(VehicleInfo[newcar][VehicleLock] == 2)
			   	{
					if(VehicleInfo[newcar][VehicleLocked] == 1)
					{
						GetVehiclePos(newcar,V1X,V1Y,V1Z);
						SetPlayerPos(playerid, V1X,V1Y,V1Z+2);
						RemovePlayerFromVehicle(playerid);
						ClearAnimations(playerid);
						GetPlayerHealth(playerid,playerhp);
						SetPlayerHealth(playerid,playerhp-15.0);
						GameTextForPlayer(playerid, "~r~STUNNED", 4000, 3);
						if(pBody[playerid][5] == 0) pBody[playerid][5] = 16;
						if(pBody[playerid][6] == 0) pBody[playerid][6] = 16;
					}
	       			else
					{
						format(string,sizeof(string),"	Warning: This Vehicle Is Owned By: %s.",VehicleInfo[newcar][VehicleOwner]);
						SendClientMessage(playerid,COLOR_GREY,string);
					}
				}
                if(VehicleInfo[newcar][VehicleLock] == 1)
			   	{
					if(VehicleInfo[newcar][VehicleLocked] == 1)
					{
						GetVehiclePos(newcar,V1X,V1Y,V1Z);
						SetPlayerPos(playerid, V1X,V1Y,V1Z+2);
						RemovePlayerFromVehicle(playerid);
						ClearAnimations(playerid);
						GameTextForPlayer(playerid, "~r~LOCKED", 4000, 3);
					}
	       			else
					{
						format(string,sizeof(string),"	Warning: This Vehicle Is Owned By: %s.",VehicleInfo[newcar][VehicleOwner]);
						SendClientMessage(playerid,COLOR_GREY,string);
					}
				}
			}
		}
		for(new i = 0; i < sizeof(CarInfo); i++)
		{
			if(CarInfo[i][CarID] == newcar)
			{
				if(CarInfo[i][DealerShipCar] == 1)
				{
					new carstring[256];
					format(carstring,sizeof(carstring),"Would you like to buy this %s ?\n This vehicles costs $%d",vehName[CarInfo[i][CarModel]-400],CarInfo[i][CarPrice]);
					ShowPlayerDialog(playerid, 9001, DIALOG_STYLE_MSGBOX, "For Sale!", carstring, "Buy", "Cancel");
					TempCarID[playerid] = i;
					UnLockCar(i);
					RemovePlayerFromVehicle(playerid);
				}
			}
		}
		if(Model == 427 && !IsACop(playerid)) // enforcer armor exploit fix
    	{
			SetPlayerArmour(playerid, StoreArmour[playerid]);
			PlayerInfo[playerid][pArmor] = StoreArmour[playerid];
		}
		gLastCar[playerid] = newcar;
	}
	return 1;
}


forward CarCheck();
public CarCheck()
{
	new string[128];
	//foreach(Player, j)
    for(new j = 0; j < MAX_PLAYERS; j++)
	{
	    if(IsPlayerConnected(j))
	    {
			if(PlayerInfo[j][pCash] < 0)
			{
			    if(MoneyMessage[j]==0)
			    {
				    format(string, sizeof(string), "You are in debt, you have till next Pay Check to get: $%d or police will arrest you.", PlayerInfo[j][pCash]);
					SendClientMessage(j, COLOR_LIGHTRED, string);
					MoneyMessage[j] = 1;
				}
			}
			else
			{
			    MoneyMessage[j] = 0;
			}
		}
	}
	return 1;
}


public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
    new clicked[MAX_PLAYER_NAME];
    GetPlayerName(clickedplayerid, clicked, sizeof(clicked));
	if(PlayerInfo[playerid][pAdmin] > 1)
	{
	    if(GetPlayerState(playerid) != PLAYER_STATE_SPECTATING)
		{
  			PlayerInfo[playerid][pInt] = GetPlayerInterior(playerid);
	    	GetPlayerHealth(playerid, PlayerInfo[playerid][pHealth]);
			GetPlayerArmour(playerid, PlayerInfo[playerid][pArmor]);
			GetPlayerPos(playerid, PlayerInfo[playerid][pSPos_x], PlayerInfo[playerid][pSPos_y], PlayerInfo[playerid][pSPos_z]);
			GetPlayerFacingAngle(playerid, PlayerInfo[playerid][pSPos_r]);
		}
		SetPlayerVirtualWorld(playerid, GetPlayerVirtualWorld(clickedplayerid));
		SetPlayerInterior(playerid, GetPlayerInterior(clickedplayerid));
		TogglePlayerSpectating(playerid, 1);
		SpectatedID[playerid] = clickedplayerid;
		HidePM[playerid] = 1;
		PhoneOnline[playerid] = 1;
		if(IsPlayerInAnyVehicle(clickedplayerid))
		{
	  		PlayerSpectateVehicle(playerid, GetPlayerVehicleID(clickedplayerid));
		    SpectateType[playerid] = ADMIN_SPEC_TYPE_VEHICLE;
		}
		else
		{
  			PlayerSpectatePlayer(playerid, clickedplayerid);
	    	SpectateType[playerid] = ADMIN_SPEC_TYPE_PLAYER;
		}
	}
	return 1;
}


  
  
