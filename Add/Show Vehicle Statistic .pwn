
public ShowStats(playerid,targetid)
{
    if(IsPlayerConnected(playerid) && IsPlayerConnected(targetid))
	{
		new cash = PlayerInfo[targetid][pCash];
		new atext[20];
		if(PlayerInfo[targetid][pSex] == 1) { atext = "Male"; }
		else if(PlayerInfo[targetid][pSex] == 2) { atext = "Female"; }

	    // get player's faction
        new ftext[32];
		format(ftext,sizeof(ftext),"%s",GetPlayerFactionName(targetid));
		// get player's rank
		new rtext[64];
		format(rtext,sizeof(rtext),"%s",GetPlayerRank(targetid));

        new jtext[20];
        if(PlayerInfo[targetid][pJob] == 1)
		{
			jtext = "Detective";
		}
        else if(PlayerInfo[targetid][pJob] == 2)
		{
			jtext = "Lawyer";
		}
        else if(PlayerInfo[targetid][pJob] == 3)
		{
			jtext = "Whore";
		}
        else if(PlayerInfo[targetid][pJob] == 4)
		{
			jtext = "Drug Dealer";
		}
        else if(PlayerInfo[targetid][pJob] == 5)
		{
			jtext = "Car Jacker";
		}
        else if(PlayerInfo[targetid][pJob] == 6)
		{
			jtext = "News Reporter";
		}
        else if(PlayerInfo[targetid][pJob] == 7)
		{
			jtext = "Mechanic";
		}
        else if(PlayerInfo[targetid][pJob] == 8)
		{
			jtext = "Bodyguard";
		}
        else if(PlayerInfo[targetid][pJob] == 9)
		{
			jtext = "Gun Dealer";
		}
        else if(PlayerInfo[targetid][pJob] == 10)
		{
			jtext = "None";
		}
		else if(PlayerInfo[targetid][pJob] == 11) // Trashman
		{
			jtext = "Trashman";
		}
		else if(PlayerInfo[targetid][pJob] == 12)
		{
			jtext = "Boxer";
		}
        else if(PlayerInfo[targetid][pJob] == 14)
		{
			jtext = "Taxi Driver";
		}
		else if(PlayerInfo[targetid][pJob] == 19)
		{
		    jtext = "Trucker";
		}
		else if(PlayerInfo[targetid][pJob] == 20)
		{
		    jtext = "Pizza-Boy";
		}
		else if(PlayerInfo[targetid][pJob] == 22)
		{
		    jtext = "Mail-Man";
		}
		else if(PlayerInfo[targetid][pJob] == 23)
		{
		    jtext = "Street-Sweeper";
		}
		else if(PlayerInfo[targetid][pJob] == 24)
		{
		    jtext = "Carpenter";
		}
		else if(PlayerInfo[targetid][pJob] == 17)
		{
			jtext = "Smuggler";
		}
        else
		{
			jtext = "None";
		}
		new donatetime[64];
		if(PlayerInfo[targetid][pDonateTime] > 0) format(donatetime, sizeof(donatetime), "%d Seconds Left", PlayerInfo[targetid][pDonateTime]);
		else if(PlayerInfo[targetid][pDonateTime] == 0 && PlayerInfo[targetid][pDonateRank] > 0) donatetime = "Permanent";
		else donatetime = "Nothing";
		new married[32];
		strmid(married, PlayerInfo[targetid][pMarriedTo], 0, strlen(PlayerInfo[targetid][pMarriedTo]), 255);
		new forum[32];
		strmid(forum, PlayerInfo[targetid][pForumName], 0, strlen(PlayerInfo[targetid][pForumName]), 255);
		new age = PlayerInfo[targetid][pAge];
		new ptime = PlayerInfo[targetid][pConnectTime];
		new level = PlayerInfo[targetid][pLevel];
		new exp = PlayerInfo[targetid][pExp];
		new warn = PlayerInfo[targetid][pWarns];
		new delay = PlayerInfo[targetid][pJobdelay];
		new jailtime = PlayerInfo[targetid][pJailTime];
		new pnumber = PlayerInfo[targetid][pPnumber];
		new account = PlayerInfo[targetid][pAccount];
		new nxtlevel = PlayerInfo[targetid][pLevel]+1;
		new expamount = nxtlevel*levelexp;
		new goldcoin = PlayerInfo[targetid][pGoldCoin];
		new points = PlayerInfo[targetid][gPupgrade];
		new hkey = PlayerInfo[targetid][pPhousekey];
		new hkey2 = PlayerInfo[targetid][pPhousekey2];
		new bkey = PlayerInfo[targetid][pPbiskey];
		new bkey2 = PlayerInfo[targetid][pPbiskey2];
		new GarageKey = PlayerInfo[targetid][pGarageKey];
		new GarageKey2 = PlayerInfo[targetid][pGarageKey2];
		new veh1 = PlayerVehicleID1[targetid];
		new veh2 = PlayerVehicleID2[targetid];
		new veh3 = PlayerVehicleID3[targetid];
		new veh4 = PlayerVehicleID4[targetid];
		new veh5 = PlayerVehicleID5[targetid];
		new vehid1[256];
		if(PlayerInfo[targetid][PlayerVehicleModel1] != 0) { strmid(vehid1, vehName[PlayerInfo[targetid][PlayerVehicleModel1]-400], 0, strlen(vehName[PlayerInfo[targetid][PlayerVehicleModel1]-400]), 255); }
		else { vehid1 = "No Vehicle"; }
		new vehid2[256];
		if(PlayerInfo[targetid][PlayerVehicleModel2] != 0) { strmid(vehid2, vehName[PlayerInfo[targetid][PlayerVehicleModel2]-400], 0, strlen(vehName[PlayerInfo[targetid][PlayerVehicleModel2]-400]), 255); }
		else { vehid2 = "No Vehicle"; }
		new vehid3[256];
		if(PlayerInfo[targetid][PlayerVehicleModel3] != 0) { strmid(vehid3, vehName[PlayerInfo[targetid][PlayerVehicleModel3]-400], 0, strlen(vehName[PlayerInfo[targetid][PlayerVehicleModel3]-400]), 255); }
		else { vehid3 = "No Vehicle"; }
		new vehid4[256];
		if(PlayerInfo[targetid][PlayerVehicleModel4] != 0) { strmid(vehid4, vehName[PlayerInfo[targetid][PlayerVehicleModel4]-400], 0, strlen(vehName[PlayerInfo[targetid][PlayerVehicleModel4]-400]), 255); }
		else { vehid4 = "No Vehicle"; }
		new vehid5[256];
		if(PlayerInfo[targetid][PlayerVehicleModel5] != 0) { strmid(vehid5, vehName[PlayerInfo[targetid][PlayerVehicleModel5]-400], 0, strlen(vehName[PlayerInfo[targetid][PlayerVehicleModel5]-400]), 255); }
		else { vehid5 = "No Vehicle"; }
		new viprank[256];
		if(PlayerInfo[targetid][pDonateRank] == 0) viprank = "None";
		if(PlayerInfo[targetid][pDonateRank] == 1) viprank = "Bronze";
		if(PlayerInfo[targetid][pDonateRank] == 2) viprank = "Silver";
		if(PlayerInfo[targetid][pDonateRank] == 3) viprank = "Gold";
		if(PlayerInfo[targetid][pDonateRank] == 4) viprank = "Platinum";
		if(PlayerInfo[targetid][pDonateRank] >= 5) viprank = "Moderator";
		new Float:health;
		new Float:armor;
		GetPlayerHealth(targetid,health);
		GetPlayerArmour(targetid,armor);
		new name[MAX_PLAYER_NAME];
		GetPlayerName(targetid, name, sizeof(name));
		new coordsstring[2048];
		format(coordsstring, sizeof(coordsstring),
		"- %s Stats -\n\nLevel:[%d] - Sex:[%s] - Age:[%d] - Warn:[%d/30]\nCash:[$%d] - Bank:[$%d] - Coin:[%d] - PH:[%d]\nHealth:[%.1f] - Armor:[%.1f] - JobDelay:[%d] - JailTime:[%d] - Claim:[%d]\nEXP:[%d/%d] - PlayingHours:[%d] - Job:[%s] - VIP:[%s] - VIP Time:[%s]\nMarriedTo:[%s] - Organization:[%s] - Rank:[%s]\nHouseID:[%d] - House2ID:[%d] - BusinessID:[%d] - Business2ID:[%d] - GarageID:[%d] - Garage2ID:[%d]\n%s:[%d] - %s:[%d] - %s:[%d] - %s:[%d] - %s:[%d]\nForum Account:[%s]",
		name,level,atext,age,warn,cash,account,goldcoin,pnumber,health,armor,delay,jailtime,points,exp,expamount,ptime,jtext,viprank,donatetime,married,ftext,rtext,hkey,hkey2,bkey,bkey2,GarageKey,GarageKey2,vehid1,veh1,vehid2,veh2,vehid3,veh3,vehid4,veh4,vehid5,veh5,forum);
		ShowPlayerDialog(playerid, 84, DIALOG_STYLE_MSGBOX, "* Stats *", coordsstring, "Select", "Cancel");
	}
}


	if(strcmp(cmd, "/car", true) == 0)
	{
		new carname1[256];
		new carname2[256];
		new carname3[256];
		new carname4[256];
		new carname5[256];
		if(CP[playerid] != 0) return SendClientMessage(playerid, COLOR_GREY, "   You still have Active Checkpoint. - Use /dcp   ");
		if(PlayerInfo[playerid][PlayerVehicleModel1] != 0)
		{
			strmid(carname1, vehName[PlayerInfo[playerid][PlayerVehicleModel1]-400], 0, strlen(vehName[PlayerInfo[playerid][PlayerVehicleModel1]-400]), 255);
		}
		else
		{
			carname1 = "Empty";
		}
		if(PlayerInfo[playerid][PlayerVehicleModel2] != 0)
		{
			strmid(carname2, vehName[PlayerInfo[playerid][PlayerVehicleModel2]-400], 0, strlen(vehName[PlayerInfo[playerid][PlayerVehicleModel2]-400]), 255);
		}
		else
		{
			carname2 = "Empty";
		}
		if(PlayerInfo[playerid][PlayerVehicleModel3] != 0)
		{
			strmid(carname3, vehName[PlayerInfo[playerid][PlayerVehicleModel3]-400], 0, strlen(vehName[PlayerInfo[playerid][PlayerVehicleModel3]-400]), 255);
		}
		else
		{
			carname3 = "Empty";
		}
		if(PlayerInfo[playerid][PlayerVehicleModel4] != 0)
		{
			strmid(carname4, vehName[PlayerInfo[playerid][PlayerVehicleModel4]-400], 0, strlen(vehName[PlayerInfo[playerid][PlayerVehicleModel4]-400]), 255);
		}
		else
		{
			carname4 = "Empty";
		}
		if(PlayerInfo[playerid][PlayerVehicleModel5] != 0)
		{
			strmid(carname5, vehName[PlayerInfo[playerid][PlayerVehicleModel5]-400], 0, strlen(vehName[PlayerInfo[playerid][PlayerVehicleModel5]-400]), 255);
		}
		else
		{
			carname5 = "Empty";
		}
		format(string,sizeof(string),"%s\n%s\n%s\n%s\n%s",carname1,carname2,carname3,carname4,carname5);
		ShowPlayerDialog(playerid,11111,DIALOG_STYLE_LIST,"Trace Vehicle",string,"Trace","Cancel");
		return 1;
	}
    if(strcmp(cmd, "/lock", true) == 0)
    {
        if(IsPlayerConnected(playerid))
        {
			new Float:V1X, Float:V1Y, Float:V1Z;
			GetVehiclePos(PlayerVehicleID1[playerid], V1X, V1Y, V1Z);
			new Float:V2X, Float:V2Y, Float:V2Z;
			GetVehiclePos(PlayerVehicleID2[playerid], V2X, V2Y, V2Z);
			new Float:V3X, Float:V3Y, Float:V3Z;
			GetVehiclePos(PlayerVehicleID3[playerid], V3X, V3Y, V3Z);
			new Float:V4X, Float:V4Y, Float:V4Z;
			GetVehiclePos(PlayerVehicleID4[playerid], V4X, V4Y, V4Z);
			new Float:V5X, Float:V5Y, Float:V5Z;
			GetVehiclePos(PlayerVehicleID5[playerid], V5X, V5Y, V5Z);
			if(IsPlayerInRangeOfPoint(playerid, 4, V1X, V1Y, V1Z))
			{
			  	if(PlayerVehicleID1[playerid] != 0)
	   			{
				   	if(PlayerInfo[playerid][pVehLock1] == 0)
	   			    {
	   			        SendClientMessage(playerid, COLOR_GREY, "   Anda belum membeli kunci untuk kendaraan ini, silahkan beli di toko elektronik.");
						return 1;
	   			    }
					if(PlayerInfo[playerid][pVehLocked1] == 1)
					{
				    	PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
				    	if(UsingMask[playerid] == 1)
				    	{
				    	    format(string, sizeof(string), "* Mask %d telah membuka kunci kendaraan mereka.",PlayerInfo[playerid][pMask]);
				    	}
				    	else
				    	{
				    		format(string, sizeof(string), "* %s telah membuka kunci kendaraan mereka.", RPN(playerid));
						}
				    	UnLockCar(PlayerVehicleID1[playerid]);
						PlayerInfo[playerid][pVehLocked1] = 0;
						ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
						VehicleInfo[PlayerVehicleID1[playerid]][VehicleLock] = PlayerInfo[playerid][pVehLock1];
            			VehicleInfo[PlayerVehicleID1[playerid]][VehicleLocked] = PlayerInfo[playerid][pVehLocked1];
					}
					else
					{
						if(UsingMask[playerid] == 1)
				    	{
				    	    format(string, sizeof(string), "* Mask %d telah mengunci kendaraan mereka.",PlayerInfo[playerid][pMask]);
				    	}
				    	else
				    	{
				    		format(string, sizeof(string), "* %s telah mengunci kendaraan mereka.", RPN(playerid));
						}
				        LockCar(PlayerVehicleID1[playerid]);
						PlayerInfo[playerid][pVehLocked1] = 1;
						ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
				    	PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
						VehicleInfo[PlayerVehicleID1[playerid]][VehicleLock] = PlayerInfo[playerid][pVehLock1];
            			VehicleInfo[PlayerVehicleID1[playerid]][VehicleLocked] = PlayerInfo[playerid][pVehLocked1];
					}
				}
	   		}
			else if(IsPlayerInRangeOfPoint(playerid, 4, V2X, V2Y, V2Z))
			{
			  	if(PlayerVehicleID2[playerid] != 0)
	   			{
				   	if(PlayerInfo[playerid][pVehLock2] == 0)
	   			    {
	   			        SendClientMessage(playerid, COLOR_GREY, "   Anda belum membeli kunci untuk kendaraan ini.");
						return 1;
	   			    }
					if(PlayerInfo[playerid][pVehLocked2] == 1)
					{
				    	PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
				    	if(UsingMask[playerid] == 1)
				    	{
				    	    format(string, sizeof(string), "* Mask %d telah membuka kunci kendaraan mereka.",PlayerInfo[playerid][pMask]);
				    	}
				    	else
				    	{
				    		format(string, sizeof(string), "* %s telah membuka kunci kendaraan mereka.", RPN(playerid));
						}
				    	UnLockCar(PlayerVehicleID2[playerid]);
						PlayerInfo[playerid][pVehLocked2] = 0;
						ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
						VehicleInfo[PlayerVehicleID2[playerid]][VehicleLock] = PlayerInfo[playerid][pVehLock2];
            			VehicleInfo[PlayerVehicleID2[playerid]][VehicleLocked] = PlayerInfo[playerid][pVehLocked2];
					}
					else
					{
						if(UsingMask[playerid] == 1)
				    	{
				    	    format(string, sizeof(string), "* Mask %d telah mengunci kendaraan mereka.",PlayerInfo[playerid][pMask]);
				    	}
				    	else
				    	{
				    		format(string, sizeof(string), "* %s telah mengunci kendaraan mereka.", RPN(playerid));
						}
    					LockCar(PlayerVehicleID2[playerid]);
                        PlayerInfo[playerid][pVehLocked2] = 1;
						ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
				    	PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
						VehicleInfo[PlayerVehicleID2[playerid]][VehicleLock] = PlayerInfo[playerid][pVehLock2];
            			VehicleInfo[PlayerVehicleID2[playerid]][VehicleLocked] = PlayerInfo[playerid][pVehLocked2];
					}
				}
			}
			else if(IsPlayerInRangeOfPoint(playerid, 4, V3X, V3Y, V3Z))
			{
			  	if(PlayerVehicleID3[playerid] != 0)
	   			{
				   	if(PlayerInfo[playerid][pVehLock3] == 0)
	   			    {
	   			        SendClientMessage(playerid, COLOR_GREY, "  Anda belum membeli kunci untuk kendaraan ini.");
						return 1;
	   			    }
					if(PlayerInfo[playerid][pVehLocked3] == 1)
					{
				    	PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
				    	if(UsingMask[playerid] == 1)
				    	{
				    	    format(string, sizeof(string), "* Mask %d telah membuka kunci kendaraan mereka.",PlayerInfo[playerid][pMask]);
				    	}
				    	else
				    	{
				    		format(string, sizeof(string), "* %stelah membuka kunci kendaraan mereka.", RPN(playerid));
						}
				    	UnLockCar(PlayerVehicleID3[playerid]);
                        PlayerInfo[playerid][pVehLocked3] = 0;
						ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
						VehicleInfo[PlayerVehicleID3[playerid]][VehicleLock] = PlayerInfo[playerid][pVehLock3];
            			VehicleInfo[PlayerVehicleID3[playerid]][VehicleLocked] = PlayerInfo[playerid][pVehLocked3];
					}
					else
					{
						if(UsingMask[playerid] == 1)
				    	{
				    	    format(string, sizeof(string), "* Mask %d telah mengunci kendaraan mereka.",PlayerInfo[playerid][pMask]);
				    	}
				    	else
				    	{
				    		format(string, sizeof(string), "* %s telah mengunci kendaraan mereka.", RPN(playerid));
						}
				    	LockCar(PlayerVehicleID3[playerid]);
					    PlayerInfo[playerid][pVehLocked3] = 1;
						ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
				    	PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
						VehicleInfo[PlayerVehicleID3[playerid]][VehicleLock] = PlayerInfo[playerid][pVehLock3];
            			VehicleInfo[PlayerVehicleID3[playerid]][VehicleLocked] = PlayerInfo[playerid][pVehLocked3];
					}
				}
		   	}
			else if(IsPlayerInRangeOfPoint(playerid, 4, V4X, V4Y, V4Z))
			{
			  	if(PlayerVehicleID4[playerid] != 0)
	   			{
				   	if(PlayerInfo[playerid][pVehLock4] == 0)
	   			    {
	   			        SendClientMessage(playerid, COLOR_GREY, "   Anda belum membeli kunci untuk kendaraan ini.");
						return 1;
	   			    }
					if(PlayerInfo[playerid][pVehLocked4] == 1)
					{
				    	PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
				    	if(UsingMask[playerid] == 1)
				    	{
				    	    format(string, sizeof(string), "* Mask %d telah membuka kunci kendaraan mereka.",PlayerInfo[playerid][pMask]);
				    	}
				    	else
				    	{
				    		format(string, sizeof(string), "* %s telah membuka kendaraan mereka.", RPN(playerid));
						}
				    	UnLockCar(PlayerVehicleID4[playerid]);
						PlayerInfo[playerid][pVehLocked4] = 0;
						ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
						VehicleInfo[PlayerVehicleID4[playerid]][VehicleLock] = PlayerInfo[playerid][pVehLock4];
            			VehicleInfo[PlayerVehicleID4[playerid]][VehicleLocked] = PlayerInfo[playerid][pVehLocked4];
					}
					else
					{
						if(UsingMask[playerid] == 1)
				    	{
				    	    format(string, sizeof(string), "* Mask %d telah mengunci kendaraan mereka.",PlayerInfo[playerid][pMask]);
				    	}
				    	else
				    	{
				    		format(string, sizeof(string), "* %s telah mengunci kendaraan mereka.", RPN(playerid));
						}
				    	LockCar(PlayerVehicleID4[playerid]);
					    PlayerInfo[playerid][pVehLocked4] = 1;
						ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
				    	PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
						VehicleInfo[PlayerVehicleID4[playerid]][VehicleLock] = PlayerInfo[playerid][pVehLock4];
            			VehicleInfo[PlayerVehicleID4[playerid]][VehicleLocked] = PlayerInfo[playerid][pVehLocked4];
					}
				}
		   	}
			else if(IsPlayerInRangeOfPoint(playerid, 4, V5X, V5Y, V5Z))
			{
			  	if(PlayerVehicleID5[playerid] != 0)
	   			{
				   	if(PlayerInfo[playerid][pVehLock5] == 0)
	   			    {
	   			        SendClientMessage(playerid, COLOR_GREY, "   Anda belum membeli kunci untuk kendaraan ini.");
						return 1;
	   			    }
					if(PlayerInfo[playerid][pVehLocked5] == 1)
					{
				    	PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
				    	if(UsingMask[playerid] == 1)
				    	{
				    	    format(string, sizeof(string), "* Mask %d telah membuka kunci kendaraan mereka.",PlayerInfo[playerid][pMask]);
				    	}
				    	else
				    	{
				    		format(string, sizeof(string), "* %s telah membuka kunci kendaraan mereka.", PlayerName(playerid));
						}
				    	UnLockCar(PlayerVehicleID5[playerid]);
						PlayerInfo[playerid][pVehLocked5] = 0;
						ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
						VehicleInfo[PlayerVehicleID5[playerid]][VehicleLock] = PlayerInfo[playerid][pVehLock5];
            			VehicleInfo[PlayerVehicleID5[playerid]][VehicleLocked] = PlayerInfo[playerid][pVehLocked5];
					}
					else
					{
						if(UsingMask[playerid] == 1)
				    	{
				    	    format(string, sizeof(string), "* Mask %d telah mengunci kendaraan mereka.",PlayerInfo[playerid][pMask]);
				    	}
				    	else
				    	{
				    		format(string, sizeof(string), "* %s telah mengunci kendaraan mereka.", PlayerName(playerid));
						}
				    	LockCar(PlayerVehicleID5[playerid]);
					    PlayerInfo[playerid][pVehLocked5] = 1;
						ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
				    	PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
						VehicleInfo[PlayerVehicleID5[playerid]][VehicleLock] = PlayerInfo[playerid][pVehLock5];
            			VehicleInfo[PlayerVehicleID5[playerid]][VehicleLocked] = PlayerInfo[playerid][pVehLocked5];
					}
				}
		   	}
			else
			{
			    SendClientMessage(playerid,COLOR_YELLOW,"	Anda tidak berada di dekat kendaraan yang Anda miliki.");
			}
			OnPlayerSave(playerid);
	    }
        return 1;
    }
    if(strcmp(cmd, "/deletevehicle", true) == 0)
	{
		new veh = GetPlayerVehicleID(playerid);
		if(IsPlayerConnected(playerid))
	    {
			if(IsPlayerInRangeOfPoint(playerid,3.0,2100.4421,-1996.7414,13.1055))
			{
				if(IsPlayerInAnyVehicle(playerid))
				{
                    new platveh[64];
		            new FileName[128];
					if(veh == PlayerVehicleID1[playerid])
					{
                        strmid(platveh, PlayerInfo[playerid][PlayerVehicle1Plate], 0, strlen(PlayerInfo[playerid][PlayerVehicle1Plate]), 255);
					    format(FileName, sizeof(FileName), "Chardata/Plat/%s.ini", platveh);
						if(dini_Exists(FileName))
						{
							dini_Remove(FileName);
						}
						ResetPlayerVehicle(playerid, 1);
						OnPlayerSave(playerid);
						format(string, sizeof(string), "Your vehicle have been destroyed and you received 5,000$");
						SendClientMessage(playerid, COLOR_YELLOW, string);
						PlayerInfo[playerid][pCash] += 5000;
					}
					else if(veh == PlayerVehicleID2[playerid])
					{
					    strmid(platveh, PlayerInfo[playerid][PlayerVehicle2Plate], 0, strlen(PlayerInfo[playerid][PlayerVehicle2Plate]), 255);
					    format(FileName, sizeof(FileName), "Chardata/Plat/%s.ini", platveh);
						if(dini_Exists(FileName))
						{
							dini_Remove(FileName);
						}
						ResetPlayerVehicle(playerid, 2);
						OnPlayerSave(playerid);
						format(string, sizeof(string), "Your vehicle have been destroyed and you received 5,000$");
						SendClientMessage(playerid, COLOR_YELLOW, string);
						PlayerInfo[playerid][pCash] += 5000;
					}
					else if(veh == PlayerVehicleID3[playerid])
					{
					    strmid(platveh, PlayerInfo[playerid][PlayerVehicle3Plate], 0, strlen(PlayerInfo[playerid][PlayerVehicle3Plate]), 255);
					    format(FileName, sizeof(FileName), "Chardata/Plat/%s.ini", platveh);
						if(dini_Exists(FileName))
						{
							dini_Remove(FileName);
						}
						ResetPlayerVehicle(playerid, 3);
						OnPlayerSave(playerid);
						format(string, sizeof(string), "Your vehicle have been destroyed and you received 5,000$");
						SendClientMessage(playerid, COLOR_YELLOW, string);
						PlayerInfo[playerid][pCash] += 5000;
					}
					else if(veh == PlayerVehicleID4[playerid])
					{
					    strmid(platveh, PlayerInfo[playerid][PlayerVehicle4Plate], 0, strlen(PlayerInfo[playerid][PlayerVehicle4Plate]), 255);
					    format(FileName, sizeof(FileName), "Chardata/Plat/%s.ini", platveh);
						if(dini_Exists(FileName))
						{
							dini_Remove(FileName);
						}
						ResetPlayerVehicle(playerid, 4);
						OnPlayerSave(playerid);
						format(string, sizeof(string), "Your vehicle have been destroyed and you received 5,000$");
						SendClientMessage(playerid, COLOR_YELLOW, string);
						PlayerInfo[playerid][pCash] += 5000;
					}
					else if(veh == PlayerVehicleID5[playerid])
					{
					    strmid(platveh, PlayerInfo[playerid][PlayerVehicle5Plate], 0, strlen(PlayerInfo[playerid][PlayerVehicle5Plate]), 255);
					    format(FileName, sizeof(FileName), "Chardata/Plat/%s.ini", platveh);
						if(dini_Exists(FileName))
						{
							dini_Remove(FileName);
						}
						ResetPlayerVehicle(playerid, 5);
						OnPlayerSave(playerid);
						format(string, sizeof(string), "Your vehicle have been destroyed and you received 5,000$");
						SendClientMessage(playerid, COLOR_YELLOW, string);
						PlayerInfo[playerid][pCash] += 5000;
					}
					else
					{
						SendClientMessage(playerid,COLOR_GREY,"	You are not in a vehicle that you own.");
					}
				}
				else
				{
					SendClientMessage(playerid,COLOR_GREY,"	You are not driving a vehicle");
				}
			}
			else
			{
				SendClientMessage(playerid,COLOR_GREY,"	You are not at Vehicle Junkyard");
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/buylock", true) == 0)
	{
	    if(BizzInfo[PlayerInfo[playerid][InBusiness]][bType] != 10)
    	{
	        SendClientMessage(playerid, COLOR_GREY, "You are not at A Locks Store!");
	        return 1;
	    }
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			format(string,sizeof(string),"Industrial Lock - 500$\nElectrical Lock - 1000$");
			ShowPlayerDialog(playerid,MAIN_LOCK_DIALOG,DIALOG_STYLE_LIST,"Vehicle Lock Types.",string,"Proceed","Cancel");
		}
		else
		{
		    SendClientMessage(playerid,COLOR_GREY,"	You are not at any Locks Store.");
		}
		return 1;
	}
	if(strcmp(cmd, "/sellvehicle", true) == 0)
	{
		new pvehicleid = GetPlayerVehicleID(playerid);
	    if(IsPlayerConnected(playerid))
	    {
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_WHITE, "{FF0000}Syntax: {FFFFFF} /sellvehicle [playerid/ Username] [price]");
				return 1;
			}
			giveplayerid = ReturnUser(tmp);
			if(giveplayerid == playerid)
			{
				SendClientMessage(playerid, COLOR_GRAD1, "   You cannot do that to yourself !");
				return 1;
			}
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_WHITE, "{FF0000}Syntax: {FFFFFF} /sellvehicle [playerid/ Username] [price]");
				return 1;
			}
			new price = strvalEx(tmp);
 	 		if(IsPlayerConnected(giveplayerid))
	    	{
				if(IsVipCar(pvehicleid) && PlayerInfo[giveplayerid][pDonateRank] == 0)
				{
					SendClientMessage(playerid, COLOR_WHITE, "{FF0000}[WARNING] {FFFFFF}Kamu tidak bisa menjual kendaraan ini kepada Player Non VIP !");
				    return 1;
				}
				if(ProxDetectorS(7.0, playerid, giveplayerid))
				{
					if(IsPlayerInAnyVehicle(playerid))
					{
						if(PlayerVehicleID1[playerid] == pvehicleid)
						{
                            if(Wrecked[PlayerVehicleID1[playerid]] == 0)
                            {
							 	SellVehicleOffer[giveplayerid] = playerid;
			                    SellVehicleOfferTime[giveplayerid] = 60;
			                    SellVehiclePrice[giveplayerid] = price;
	                            SellVehicleSlot[giveplayerid] = 1;
								format(string,sizeof(string),"You have offered to sell your %s to %s for $%d.",vehName[GetVehicleModel(pvehicleid)-400],PlayerName(giveplayerid),price);
								SendClientMessage(playerid,COLOR_YELLOW,string);
								format(string,sizeof(string),"%s has just offered to sell you his %s for $%d, /accept vehicle to buy the vehicle.",PlayerName(playerid),vehName[GetVehicleModel(pvehicleid)-400],price);
								SendClientMessage(giveplayerid,COLOR_YELLOW,string);
							}
							else
							{
							    SendClientMessage(playerid,COLOR_YELLOW, "Kamu tidak bisa menjual kendaraan dalam kondisi rusak");
							}
						}
						else if(PlayerVehicleID2[playerid] == pvehicleid)
						{
						    if(Wrecked[PlayerVehicleID2[playerid]] == 0)
                            {
							 	SellVehicleOffer[giveplayerid] = playerid;
			                    SellVehicleOfferTime[giveplayerid] = 60;
			                    SellVehiclePrice[giveplayerid] = price;
	                            SellVehicleSlot[giveplayerid] = 2;
								format(string,sizeof(string),"You have offered to sell your %s to %s for $%d.",vehName[GetVehicleModel(pvehicleid)-400],PlayerName(giveplayerid),price);
								SendClientMessage(playerid,COLOR_YELLOW,string);
								format(string,sizeof(string),"%s has just offered to sell you his %s for $%d, /accept vehicle to buy the vehicle.",PlayerName(playerid),vehName[GetVehicleModel(pvehicleid)-400],price);
								SendClientMessage(giveplayerid,COLOR_YELLOW,string);
							}
							else
							{
							    SendClientMessage(playerid,COLOR_YELLOW, "Kamu tidak bisa menjual kendaraan dalam kondisi rusak");
							}
						}
						else if(PlayerVehicleID3[playerid] == pvehicleid)
						{
						    if(Wrecked[PlayerVehicleID3[playerid]] == 0)
                            {
							 	SellVehicleOffer[giveplayerid] = playerid;
			                    SellVehicleOfferTime[giveplayerid] = 60;
			                    SellVehiclePrice[giveplayerid] = price;
	                            SellVehicleSlot[giveplayerid] = 3;
								format(string,sizeof(string),"You have offered to sell your %s to %s for $%d.",vehName[GetVehicleModel(pvehicleid)-400],PlayerName(giveplayerid),price);
								SendClientMessage(playerid,COLOR_YELLOW,string);
								format(string,sizeof(string),"%s has just offered to sell you his %s for $%d, /accept vehicle to buy the vehicle.",PlayerName(playerid),vehName[GetVehicleModel(pvehicleid)-400],price);
								SendClientMessage(giveplayerid,COLOR_YELLOW,string);
							}
							else
							{
							    SendClientMessage(playerid,COLOR_YELLOW, "Kamu tidak bisa menjual kendaraan dalam kondisi rusak");
							}
						}
						else if(PlayerVehicleID4[playerid] == pvehicleid)
						{
						    if(Wrecked[PlayerVehicleID4[playerid]] == 0)
                            {
							 	SellVehicleOffer[giveplayerid] = playerid;
			                    SellVehicleOfferTime[giveplayerid] = 60;
			                    SellVehiclePrice[giveplayerid] = price;
	                            SellVehicleSlot[giveplayerid] = 4;
								format(string,sizeof(string),"You have offered to sell your %s to %s for $%d.",vehName[GetVehicleModel(pvehicleid)-400],PlayerName(giveplayerid),price);
								SendClientMessage(playerid,COLOR_YELLOW,string);
								format(string,sizeof(string),"%s has just offered to sell you his %s for $%d, /accept vehicle to buy the vehicle.",PlayerName(playerid),vehName[GetVehicleModel(pvehicleid)-400],price);
								SendClientMessage(giveplayerid,COLOR_YELLOW,string);
							}
							else
							{
							    SendClientMessage(playerid,COLOR_YELLOW, "Kamu tidak bisa menjual kendaraan dalam kondisi rusak");
							}
						}
						else if(PlayerVehicleID5[playerid] == pvehicleid)
						{
						    if(Wrecked[PlayerVehicleID5[playerid]] == 0)
                            {
							 	SellVehicleOffer[giveplayerid] = playerid;
			                    SellVehicleOfferTime[giveplayerid] = 60;
			                    SellVehiclePrice[giveplayerid] = price;
	                            SellVehicleSlot[giveplayerid] = 5;
								format(string,sizeof(string),"You have offered to sell your %s to %s for $%d.",vehName[GetVehicleModel(pvehicleid)-400],PlayerName(giveplayerid),price);
								SendClientMessage(playerid,COLOR_YELLOW,string);
								format(string,sizeof(string),"%s has just offered to sell you his %s for $%d, /accept vehicle to buy the vehicle.",PlayerName(playerid),vehName[GetVehicleModel(pvehicleid)-400],price);
								SendClientMessage(giveplayerid,COLOR_YELLOW,string);
							}
							else
							{
							    SendClientMessage(playerid,COLOR_YELLOW, "Kamu tidak bisa menjual kendaraan dalam kondisi rusak");
							}
						}
						else
						{
						    SendClientMessage(playerid,COLOR_GREY,"	You are not at a vehicle that you own.");
						}
					}
					else
					{
					    SendClientMessage(playerid,COLOR_GREY,"	You are not at any vehicle.");
					}
				}
				else
				{
				    SendClientMessage(playerid,COLOR_GREY,"	You are not near the player.");
				}
			}
			else
			{
			    SendClientMessage(playerid,COLOR_GREY,"	Player Not Connected.");
			}
		}
		return 1;
	}
//---------------------------------------------[New House System]----------------------------//
     	if(strcmp(cmd, "/ahousehelp", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        if(PlayerInfo[playerid][pAdmin] < 1337)
		    {
          SendClientMessage(playerid, COLOR_GRAD2, "You are not authorized to use that command!");
		    }
			SendClientMessage(playerid, COLOR_GREEN,"_______________________________________");
			SendClientMessage(playerid, COLOR_WHITE,"ADMIN HOUSE HELP: type a command for more infomation");
			SendClientMessage(playerid, COLOR_WHITE,"Commands: /houseint /createhouse /deletehouse /houselevel /houseprice /movehouse");
		}
		return 1;
	}
	if(strcmp(cmd, "/sellhouse", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
            new id = PlayerInfo[playerid][pPhousekey];
		    new id2 = PlayerInfo[playerid][pPhousekey2];
			if(id == 0 && id2 == 0)
			{
				SendClientMessage(playerid, GREY, "    You don't own a house.");
				return 1;
			}
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_WHITE, "USAGE: /sellhouse [PlayerID/PartOfName] [price] [1-2]");
				return 1;
			}
			new money;
			giveplayerid = ReturnUser(tmp);
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_WHITE, "USAGE: /sellhouse [PlayerID/PartOfName] [price] [1-2]");
				return 1;
			}
			money = strvalEx(tmp);
			if(money < 1) { SendClientMessage(playerid, COLOR_GREY, "   Price can't be lower than $1!"); return 1; }
			tmp = strtok(cmdtext, idx);
			if (!strlen(tmp)) return SyntaxMessage(playerid, "USAGE: /sellhouse [PlayerID/PartOfName] [price] [1-2]");
			new slot = strval(tmp);
			if (slot < 1 || slot > 2) return SendClientMessage(playerid, GREY, "Slot can't be below 1, or above 2.");
			if (slot == 1)
			{
				if(IsPlayerConnected(giveplayerid))
				{
				    if(giveplayerid != INVALID_PLAYER_ID)
				    {
				        if(PlayerInfo[giveplayerid][pPhousekey] > 0 && PlayerInfo[giveplayerid][pPhousekey2] > 0)
			    		{
							SendClientMessage(playerid, COLOR_GREY, "   This player already own a House!");
							return 1;
			    		}
			    		if(PlayerInfo[giveplayerid][pPhousekey] > 0 && PlayerInfo[giveplayerid][pDonateRank] < 2)
			    		{
							SendClientMessage(playerid, COLOR_GREY, "   This player already own a House!");
							return 1;
			    		}
				        if(ProxDetectorS(8.0, playerid, giveplayerid))
						{
						    if(giveplayerid == playerid) { SendClientMessage(playerid, COLOR_GREY, "   You can't sell House to yourself !"); return 1; }
						    GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
							GetPlayerName(playerid, sendername, sizeof(sendername));
						    format(string, sizeof(string), "* You offered to sell your House to %s for $%d.", giveplayer, money);
							SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
							format(string, sizeof(string), "* %s wants to sell his House to you for $%d, (type /accept house) to accept.", sendername, money);
							SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
							HouseID[giveplayerid] = PlayerInfo[playerid][pPhousekey];
							HouseOffer[giveplayerid] = playerid;
							HousePrice[giveplayerid] = money;
						}
						else
						{
						    SendClientMessage(playerid, COLOR_GREY, "   That player is not near you !");
						}
					}
				}
				else
				{
				    SendClientMessage(playerid, COLOR_GREY, "   That player is Offline !");
				}
			}
			if (slot == 2)
			{
				if(IsPlayerConnected(giveplayerid))
				{
				    if(giveplayerid != INVALID_PLAYER_ID)
				    {
				        if(id2 == 0)
			    		{
							SendClientMessage(playerid, COLOR_GREY, "   You don't own a house 2!");
							return 1;
			    		}
				        if(PlayerInfo[giveplayerid][pPhousekey] > 0 && PlayerInfo[giveplayerid][pPhousekey2] > 0)
			    		{
							SendClientMessage(playerid, COLOR_GREY, "   This player already own a House!");
							return 1;
			    		}
			    		if(PlayerInfo[giveplayerid][pPhousekey] > 0 && PlayerInfo[giveplayerid][pDonateRank] < 2)
			    		{
							SendClientMessage(playerid, COLOR_GREY, "   This player already own a House!");
							return 1;
			    		}
				        if(ProxDetectorS(8.0, playerid, giveplayerid))
						{
						    if(giveplayerid == playerid) { SendClientMessage(playerid, COLOR_GREY, "   You can't sell House to yourself !"); return 1; }
						    GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
							GetPlayerName(playerid, sendername, sizeof(sendername));
						    format(string, sizeof(string), "* You offered to sell your House to %s for $%d.", giveplayer, money);
							SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
							format(string, sizeof(string), "* %s wants to sell his House to you for $%d, (type /accept house) to accept.", sendername, money);
							SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
							HouseID[giveplayerid] = PlayerInfo[playerid][pPhousekey2];
							HouseOffer[giveplayerid] = playerid;
							HousePrice[giveplayerid] = money;
						}
						else
						{
						    SendClientMessage(playerid, COLOR_GREY, "   That player is not near you !");
						}
					}
				}
				else
				{
				    SendClientMessage(playerid, COLOR_GREY, "   That player is Offline !");
				}
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/houseint", true) == 0)
	{
		if(!(PlayerInfo[playerid][pAdmin] >= 1337))
	 	{
            SendClientMessage(playerid, COLOR_GREY, "You are not authorized to use that command!");
		    return 1;
		}
		ShowPlayerDialog(playerid, HOUSES_INT, DIALOG_STYLE_LIST, "House Interiors Categories","Safe Houses\nBurglary Houses", "Select", "Cancel");
		return 1;
	}
	if(strcmp(cmd, "/chouseint", true) == 0)
	{
		if(!(PlayerInfo[playerid][pAdmin] >= 1337))
	 	{
            SendClientMessage(playerid, COLOR_GREY, "You are not authorized to use that command!");
		    return 1;
		}
		ShowPlayerDialog(playerid, CHOUSES_INT, DIALOG_STYLE_LIST, "Custom House Interiors Categories","Custom Interior #1\nCustom Interior #2\nCustom Interior #3\nCustom Interior #4\nCustom Interior #5\nCustom Interior #6\nCustom Interior #7\nCustom Interior #8\nCustom Interior #9\nCustom Interior #10\nCustom Interior #11\nCustom Interior #12", "Select", "Cancel");
		return 1;
	}
	if(strcmp(cmd, "/hupgrade", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
            new id = PlayerInfo[playerid][pPhousekey];
            new id2 = PlayerInfo[playerid][pPhousekey2];
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_WHITE, "USAGE: /hupgrade [name] [1/2]");
				SendClientMessage(playerid, COLOR_GREY, "Available names: Gunlocker");
				SendClientMessage(playerid, COLOR_GREY, "GunLocker = $2,000");
				return 1;
			}
   			if(strcmp(tmp,"gunlocker",true) == 0)
			{
                tmp = strtok(cmdtext, idx);
		        if(!strlen(tmp))
				{
					SendClientMessage(playerid, COLOR_WHITE, "USAGE: /hupgrade [name] [1/2]");
					SendClientMessage(playerid, COLOR_GREY, "Available names: Gunlocker");
					SendClientMessage(playerid, COLOR_GREY, "GunLocker = $2,000");
					return 1;
				}
				new slot = strval(tmp);
				if (slot < 1 || slot > 2) return SendClientMessage(playerid, GREY, "Slot can't be below 1, or above 2.");
				if(slot == 1)
				{
				    if(PlayerInfo[playerid][pPhousekey] >= 1)
				    {
				    	if(PlayerInfo[playerid][pCash] < 2000)
						{
							SendClientMessage(playerid, COLOR_GREY, "   You don't have enough money!");
							return 1;
						}
				    	if(HouseInfo[id][hGL] >= 5)
				    	{
				        	SendClientMessage(playerid, COLOR_GREY, "   Your Gunlocker is at its limit!");
				        	return 1;
				    	}
				    	HouseInfo[id][hGL]++;
				    	format(string, sizeof(string), "You have upgraded your Gunlocker for $2,000, you now have %d slots available [House 1].", HouseInfo[id][hGL]);
				    	SendClientMessage(playerid, COLOR_YELLOW, string);
				    	PlayerInfo[playerid][pCash] -= 2000;
						GivePlayerMoney(playerid,-2000);
						SaveHouse(id);
				    	return 1;
					}
					else
					{
					    SendClientMessage(playerid, COLOR_GREY, "   You don't own a House 2!");
					    return 1;
					}
				}
				else if(slot == 2)
				{
				    if(PlayerInfo[playerid][pPhousekey2] >= 1)
				    {
				    	if(PlayerInfo[playerid][pCash] < 2000)
						{
							SendClientMessage(playerid, COLOR_GREY, "   You don't have enough money!");
							return 1;
						}
				    	if(HouseInfo[id2][hGL] >= 5)
				    	{
				        	SendClientMessage(playerid, COLOR_GREY, "   Your Gunlocker is at its limit!");
				        	return 1;
				    	}
				    	HouseInfo[id2][hGL]++;
				    	format(string, sizeof(string), "You have upgraded your Gunlocker for $2,000, you now have %d slots available [House 2].", HouseInfo[id2][hGL]);
				    	SendClientMessage(playerid, COLOR_YELLOW, string);
				    	PlayerInfo[playerid][pCash] -= 2000;
						GivePlayerMoney(playerid,-2000);
						SaveHouse(id2);
				    	return 1;
					}
					else
					{
					    SendClientMessage(playerid, COLOR_GREY, "   You don't own a House 2!");
					    return 1;
					}
				}
			}
			else
			{
			    SendClientMessage(playerid, COLOR_GREY, "   Invalid upgrade name!");
				return 1;
			}
	    }
	    return 1;
	}
	if(strcmp(cmd, "/evict", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
		{
		    new playername[MAX_PLAYER_NAME];
			new bouse = PlayerInfo[playerid][pPhousekey];
			new bouse2 = PlayerInfo[playerid][pPhousekey2];
			GetPlayerName(playerid, playername, sizeof(playername));
			if(PlayerInfo[playerid][pInjured] == 0)
			{
				tmp = strtok(cmdtext, idx);
				if(!strlen(tmp))
				{
					SendClientMessage(playerid, COLOR_WHITE, "USAGE: /evict [PlayerID/PartOfName] [1/2]");
				}
				new target;
				target = ReturnUser(tmp);
				if (target == playerid)
				{
					SendClientMessage(target, COLOR_GREY, "You can't evict yourself!");
					return 1;
				}
				if(IsPlayerConnected(target))
				{
				    if(target != INVALID_PLAYER_ID)
				    {
                        tmp = strtok(cmdtext, idx);
						if(!strlen(tmp))
						{
							SendClientMessage(playerid, COLOR_WHITE, "USAGE: /evict [PlayerID/PartOfName] [1/2]");
						}
						new slot = strval(tmp);
						if (slot < 1 || slot > 2) return SendClientMessage(playerid, GREY, "Slot can't be below 1, or above 2.");
						if(slot == 1 && bouse != 0 && strcmp(playername, HouseInfo[PlayerInfo[playerid][pPhousekey]][hOwner], true) == 0)
						{
							if(PlayerInfo[target][pPhousekey] == PlayerInfo[playerid][pPhousekey])
							{
								SendClientMessage(target, COLOR_YELLOW, "You have been evicted from the owner of the House!");
								SendClientMessage(playerid, COLOR_LIGHTBLUE, "Player has been evicted.");
								PlayerInfo[target][pPhousekey] = 0;
								return 1;
							}
							else if(PlayerInfo[target][pPhousekey2] == PlayerInfo[playerid][pPhousekey])
							{
								SendClientMessage(target, COLOR_YELLOW, "You have been evicted from the owner of the House!");
								SendClientMessage(playerid, COLOR_LIGHTBLUE, "Player has been evicted.");
								PlayerInfo[target][pPhousekey2] = 0;
								return 1;
							}
							else
							{
							    SendClientMessage(playerid, COLOR_GREY, "Player doesn't rent at your House!");
							    return 1;
							}
						}
						else if(slot == 2 && bouse2 != 0 && strcmp(playername, HouseInfo[PlayerInfo[playerid][pPhousekey2]][hOwner], true) == 0)
						{
							if(PlayerInfo[target][pPhousekey] == PlayerInfo[playerid][pPhousekey2])
							{
								SendClientMessage(target, COLOR_YELLOW, "You have been evicted from the owner of the House!");
								SendClientMessage(playerid, COLOR_LIGHTBLUE, "Player has been evicted.");
								PlayerInfo[target][pPhousekey] = 0;
								return 1;
							}
							else if(PlayerInfo[target][pPhousekey2] == PlayerInfo[playerid][pPhousekey2])
							{
								SendClientMessage(target, COLOR_YELLOW, "You have been evicted from the owner of the House!");
								SendClientMessage(playerid, COLOR_LIGHTBLUE, "Player has been evicted.");
								PlayerInfo[target][pPhousekey2] = 0;
								return 1;
							}
							else
							{
							    SendClientMessage(playerid, COLOR_GREY, "Player doesn't rent at your House!");
							    return 1;
							}
						}
						else
						{
							SendClientMessage(playerid, COLOR_GREY, "You don't own a House!");
							return 1;
						}
					}
				}
			}
			else
			{
				SendClientMessage(playerid, COLOR_GREY, "You cannot to that on this time !");
				return 1;
			}
		}
		return 1;
	}

