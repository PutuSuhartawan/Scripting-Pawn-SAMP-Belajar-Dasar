
forward SecondTimer();
public SecondTimer()
{
	new hour, minute, boomboxid, string[128];
	gettime(hour, minute);
	foreach(new i : Player)
	{
	    if(PlayerInfo[i][pLoadShipmentTime] > 1) {
            format(string, sizeof(string), "~g~Loading Shipment...~n~~w~Complete in ~b~%d ~w~seconds...", PlayerInfo[i][pLoadShipmentTime]);
            GameTextForPlayer(i, string, 1000, 5);
            PlayerInfo[i][pLoadShipmentTime] --;
        }
		if(PlayerInfo[i][pJailTime] > 0) {
			format(string, sizeof(string), "~y~Jail Time: ~w~%d", PlayerInfo[i][pJailTime]);
			PlayerTextDrawSetString(i, customHUD[i][1], string);
		}
		if(PlayerInfo[i][pCarrying])
		{
			SetPlayerArmedWeapon(i, 0);
		}
		if(PlayerInfo[i][pLogged] && !PlayerInfo[i][pKicked])
		{
		    AFKCheck(i);
			AntiCarSurf(i);
			BedTime(i);

		    new Float:vhp;
			for(new vehicleid; vehicleid<MAX_VEHICLES;vehicleid++)
			{
				if(GetVehicleModel(vehicleid) == 0) continue; //only returns 0 when vehicle is invalid (not spawned)
				GetVehicleHealth(vehicleid,vhp);
				if(vhp < 300.0) {
					SetVehicleParams(vehicleid, VEHICLE_ENGINE, false);
					SetVehicleHealth(vehicleid, 251.0);
				}
			}
	        if(PlayerInfo[i][pCapturingPoint] >= 0)
			{
				PlayerInfo[i][pCaptureTime]--;

				if(PlayerInfo[i][pCaptureTime] <= 0)
				{
					new Float:x, Float:y, Float:z;

					GetPlayerPos(i, x, y, z);

					if(PointInfo[PlayerInfo[i][pCapturingPoint]][pTime] == 0 && PlayerInfo[i][pPointX] == x && PlayerInfo[i][pPointY] == y && PlayerInfo[i][pPointZ] == z)
					{
						SMA(COLOR_WHITE, "%s attempted to capture %s for %s. It will be theirs in 10 minutes.", GetRPName(i), PointInfo[PlayerInfo[i][pCapturingPoint]][pName], GangInfo[PlayerInfo[i][pGang]][gName]);
						SMA(COLOR_RED, "%s is now redzone!", PointInfo[PlayerInfo[i][pCapturingPoint]][pName]);

						PointInfo[PlayerInfo[i][pCapturingPoint]][pCaptureTime] = 10;
						PointInfo[PlayerInfo[i][pCapturingPoint]][pCapturer] = i;
					}
					else
					{
						SCM(i, COLOR_SYNTAX, "You moved from your position and therefore failed to capture.");
					}

					PlayerInfo[i][pCapturingPoint] = -1;
					PlayerInfo[i][pCaptureTime] = 0;
				}
			}
			
			if(Maskara[i] && !PlayerInfo[i][pAdminDuty])
	    	{
	        	format(string, sizeof(string), "Stranger_%d", MaskaraID[i]);
				SetPlayerName(i, string);
	    	}
	    	if(!Maskara[i] && !PlayerInfo[i][pAdminDuty])
	    	{
				SetPlayerName(i, PlayerInfo[i][pUsername]);
			}

			if(PlayerInfo[i][pLoopAnim] && !PlayerInfo[i][pToggleTextdraws])
			{
				TextDrawShowForPlayer(i, AnimationTD);
		    }
			else
			{
		        TextDrawHideForPlayer(i, AnimationTD);
		    }
			
			/*format(string, sizeof(string), "%d", PlayerInfo[i][pHunger]);
			PlayerTextDrawSetString(i, HungerTD[i][5], string);
			
			format(string, sizeof(string), "%d", PlayerInfo[i][pThirst]);
			PlayerTextDrawSetString(i, HungerTD[i][6], string);

			format(string, sizeof(string), "%d", GetPlayerStamina(i));
			PlayerTextDrawSetString(i, HungerTD[i][8], string);*/
			
			/*format(string, sizeof(string), "%d.0%", GetPlayerStamina(i));
			PlayerTextDrawSetString(i, HungerTD[i][11], string);*/

			format(string, sizeof(string), "%.0f", GetPlayerHealth(i));
			PlayerTextDrawSetString(i, HungerTD[i][0], string);

			format(string, sizeof(string), "%.0f", GetPlayerArmour(i));
			PlayerTextDrawSetString(i, HungerTD[i][21], string);
			
		 	format(string, sizeof(string), "%d", PlayerInfo[i][pThirst]);
			PlayerTextDrawSetString(i, HungerTD[i][23], string);

			format(string, sizeof(string), "%d", PlayerInfo[i][pHunger]);
			PlayerTextDrawSetString(i, HungerTD[i][22], string);

			format(string, sizeof(string), "%d/~r~100", PlayerInfo[i][pPot]);
			PlayerTextDrawSetString(i, InventoryTD[i][70], string);

			format(string, sizeof(string), "%d/~r~50", PlayerInfo[i][pCrack]);
			PlayerTextDrawSetString(i, InventoryTD[i][71], string);

			format(string, sizeof(string), "%d/~r~50", PlayerInfo[i][pToolkit]);
			PlayerTextDrawSetString(i, InventoryTD[i][76], string);

			format(string, sizeof(string), "%d/~r~2", PlayerInfo[i][pVest]);
			PlayerTextDrawSetString(i, InventoryTD[i][76], string);

			format(string, sizeof(string), "%d/~r~50", PlayerInfo[i][pMeth]);
			PlayerTextDrawSetString(i, InventoryTD[i][72], string);

			format(string, sizeof(string), "%d/~r~1", PlayerInfo[i][pBackpack]);
			PlayerTextDrawSetString(i, InventoryTD[i][73], string);

			format(string, sizeof(string), "%d/~r~20", PlayerInfo[i][pGasCan]);
			PlayerTextDrawSetString(i, InventoryTD[i][74], string);

			format(string, sizeof(string), "%d/~r~20", PlayerInfo[i][pPainkillers]);
			PlayerTextDrawSetString(i, InventoryTD[i][69], string);

			format(string, sizeof(string), "%d/~r~10000", PlayerInfo[i][pMaterials]);
			PlayerTextDrawSetString(i, InventoryTD[i][78], string);

            format(string, sizeof(string), "%d/~r~100", PlayerInfo[i][pSeeds]);
			PlayerTextDrawSetString(i, InventoryTD[i][80], string);

			format(string, sizeof(string), "%d/~r~50", PlayerInfo[i][pEphedrine]);
			PlayerTextDrawSetString(i, InventoryTD[i][79], string);

			format(string, sizeof(string), "%d/~r~20", PlayerInfo[i][pMuriaticAcid]);
			PlayerTextDrawSetString(i, InventoryTD[i][82], string);

			format(string, sizeof(string), "%d", PlayerInfo[i][pDirtyCash]);
			PlayerTextDrawSetString(i, InventoryTD[i][83], string);

			format(string, sizeof(string), "%s's ~y~Inventory", GetRPName(i));
			PlayerTextDrawSetString(i, InventoryTD[i][1], string);

			format(string, sizeof(string), "%d/~r~20", PlayerInfo[i][pBakingSoda]);
			PlayerTextDrawSetString(i, InventoryTD[i][81], string);

			format(string, sizeof(string), "%d/~r~20", PlayerInfo[i][pMedkit]);
			PlayerTextDrawSetString(i, InventoryTD[i][68], string);

			format(string, sizeof(string), "%d", PlayerInfo[i][pCash]);
			PlayerTextDrawSetString(i, InventoryTD[i][67], string);

			/*format(string, sizeof(string), "%d", PlayerInfo[i][pCash]);
			PlayerTextDrawSetString(i, MonehTD[i][0], string);

			format(string, sizeof(string), "%i", i);
			PlayerTextDrawSetString(i, MonehTD[i][1], string);*/

			format(string, sizeof(string), "%d/~r~20", PlayerInfo[i][pCigars]);
			PlayerTextDrawSetString(i, InventoryTD[i][66], string);

            format(string, sizeof(string), "%d/~r~8", PlayerInfo[i][pDrink]);
			PlayerTextDrawSetString(i, InventoryTD[i][65], string);

			format(string, sizeof(string), "%d/~r~8", PlayerInfo[i][pFood]);
			PlayerTextDrawSetString(i, InventoryTD[i][64], string);

			format(string, sizeof(string), "%d/~r~20", PlayerInfo[i][pSpraycans]);
			PlayerTextDrawSetString(i, InventoryTD[i][84], string);

			format(string, sizeof(string), "%d/~r~3", PlayerInfo[i][pRepairKit]);
			PlayerTextDrawSetString(i, InventoryTD[i][75], string);

			format(string, sizeof(string), "Pram Dev ID: %d I Level: %d I Players: %d I Ping: %d I SA:MP", i, GetPlayerScore(i), Iter_Count(Player), GetPlayerPing(i));
			PlayerTextDrawSetString(i, NDTRP[i], string);

		   	if(++PlayerInfo[i][pHungerTimer] >= 300 && PlayerInfo[i][pHunger] > 0) // 10 MINUTES
			{
				PlayerInfo[i][pHungerTimer] = 0;
				PlayerInfo[i][pHunger] -= 1;
				if(PlayerInfo[i][pHunger] == 10)
				{
					SendMessage(i, COLOR_GREY, "You hear your stomach rumble, you need to eat. You can die due to starvation");
					ShowTDN(i, "You hear your stomach rumble, you need to eat.");
				}
				if(PlayerInfo[i][pHunger] == 5) // 2 MINUTES
				{
					SendMessage(i, COLOR_GREY, "You fall unconcious due to starvation.");
					SetPlayerHealth(i, 0);
				}
			}
			if(++PlayerInfo[i][pThirstTimer] >= 300 && PlayerInfo[i][pThirst] > 0) // 8 MINUTES
			{
				PlayerInfo[i][pThirstTimer] = 0;
				PlayerInfo[i][pThirst] -= 1;

				if(PlayerInfo[i][pThirst] == 10)
				{
					SendMessage(i, COLOR_GREY, "You are thirsty, you need to drink. You can die due to thirst!");
					ShowTDN(i, "You are thirsty, you need to drink.");
				}
   				if(PlayerInfo[i][pThirst] == 5) // 2 MINUTES
				{
					SendMessage(i, COLOR_GREY, "You fall unconcious due to thirst.");
     				SetPlayerHealth(i, 0);
				}
			}
			if(++PlayerInfo[i][pStressTimer] >= 100000 && PlayerInfo[i][pStress] > 0) // 3 MINUTES
			{
				PlayerInfo[i][pStressTimer] = 0;
				PlayerInfo[i][pStress] -= 1;
				if(PlayerInfo[i][pStress] == 10)
				{
					SendMessage(i, COLOR_GREY, "You hear your brain rumble, you need to eat. You can die due to stress");
				}
				if(PlayerInfo[i][pStress] == 1) // 2 MINUTES
				{
					SendMessage(i, COLOR_GREY, "You fall unconcious due to stress.");
					SetPlayerHealth(i, 0);
				}
			}
			if (PlayerInfo[i][pSpeedTime] > 0)
			{
			    PlayerInfo[i][pSpeedTime]--;
			}
		    if(PlayerInfo[i][pShipment] >= 0)
			{
				if((GetPlayerState(i) == PLAYER_STATE_DRIVER) && (GetVehicleModel(GetPlayerVehicleID(i)) != 414 && GetVehicleModel(GetPlayerVehicleID(i)) != 498))
				{
			    	PlayerInfo[i][pShipment] = -1;
			    	SCM(i, COLOR_SYNTAX, "Shipment cancelled. You went into another vehicle.");
				}
		    }
		
		if(PlayerInfo[i][pGang] >= 0) {
				PlayerTextDrawHide(i, Rolebytd[i]);
				format(string, sizeof(string), "%s ~w~: ~w~%s", GangInfo[PlayerInfo[i][pGang]][gName], GangRanks[PlayerInfo[i][pGang]][PlayerInfo[i][pGangRank]]);
				PlayerTextDrawColor(i, Rolebytd[i], (GangInfo[PlayerInfo[i][pGang]][gColor] & ~0xff) + 0xFF);
				PlayerTextDrawShow(i, Rolebytd[i]);
			} else if(PlayerInfo[i][pFaction] >= 0) {
				PlayerTextDrawHide(i, Rolebytd[i]);
				format(string, sizeof(string), "%s ~w~: ~w~%s", FactionInfo[PlayerInfo[i][pFaction]][fName], FactionRanks[PlayerInfo[i][pFaction]][PlayerInfo[i][pFactionRank]]);
				PlayerTextDrawColor(i, Rolebytd[i], (FactionInfo[PlayerInfo[i][pFaction]][fColor] & ~0xff) + 0xFF);
				PlayerTextDrawShow(i, Rolebytd[i]);
			} /*else {
				PlayerTextDrawHide(i, Rolebytd[i]);
				format(string, sizeof(string), "SB3 Dev : RoleMember");
				PlayerTextDrawColor(i, Rolebytd[i], COLOR_ORANGE);
				PlayerTextDrawShow(i, Rolebytd[i]);
			}*/
			PlayerTextDrawSetString(i, Rolebytd[i], string);

		    if(PlayerInfo[i][pPizzas] > 0 && GetPlayerState(i) == PLAYER_STATE_DRIVER)
			{
				if(GetVehicleModel(GetPlayerVehicleID(i)) == 586)
				{
				    if(PlayerInfo[i][pPizzaTime] < 90)
					{
						PlayerInfo[i][pPizzaTime]++;
					}
				}
				else
				{
				    PlayerInfo[i][pPizzas] = 0;
				    PlayerInfo[i][pCP] = 0;

				    DisablePlayerCheckpoint(i);
				    SCM(i, COLOR_SERVER, "delivery cancelled. You went into another vehicle.");
				}
			}
			else if (PlayerInfo[i][pGraffiti] != -1 && PlayerInfo[i][pGraffitiTime] > 0)
			{
				if (Graffiti_Nearest(i) != PlayerInfo[i][pGraffiti])
				{
				    PlayerInfo[i][pGraffiti] = -1;
            	    PlayerInfo[i][pGraffitiTime] = 0;
				}
				else
				{
	    	        PlayerInfo[i][pGraffitiTime]--; 	

		            if (PlayerInfo[i][pGraffitiTime] < 1)
					{
                        new str[500];
					    strunpack(str, PlayerInfo[i][pGraffitiText]);
	        	        format(GraffitiData[PlayerInfo[i][pGraffiti]][graffitiText], 64, str);

					    GraffitiData[PlayerInfo[i][pGraffiti]][graffitiColor] = PlayerInfo[i][pGraffitiColor];

						Graffiti_Refresh(PlayerInfo[i][pGraffiti]);
					    Graffiti_Save(PlayerInfo[i][pGraffiti]);

					    ClearAnimations(i, 1);
						SendProximityMessage(i, 30.0, COLOR_SERVER, "**{C2A2DA} %s puts their can of spray paint away.", GetRPName(i));

		   	            PlayerInfo[i][pGraffiti] = -1;
		   	            PlayerInfo[i][pGraffitiTime] = 0;
					}
				}
			}
			if(!PlayerInfo[i][pToggleTextdraws])
		    {
			    if(PlayerInfo[i][pGPSOn])
				{
				    PlayerTextDrawSetString(i, PlayerInfo[i][pText][3], GetPlayerZoneName(i));
				}
				if(PlayerInfo[i][pWatchOn])
				{
					if(GetPlayerState(i) == PLAYER_STATE_SPECTATING)
						TextDrawHideForPlayer(i, TimeTD);
					else
					    TextDrawShowForPlayer(i, TimeTD);
				}
				if(!PlayerInfo[i][pToggleHUD])
				{
					if(GetPlayerState(i) == PLAYER_STATE_SPECTATING)
					{
						PlayerTextDrawHide(i, PlayerInfo[i][pText][4]);
					    PlayerTextDrawHide(i, PlayerInfo[i][pText][5]);
					}
					else
					{
					    PlayerTextDrawShow(i, PlayerInfo[i][pText][4]);
					    PlayerTextDrawShow(i, PlayerInfo[i][pText][5]);
					}
				}
			}

		    if(NetStats_PacketLossPercent(i) > 20.0 && gettime() - PlayerInfo[i][pLastDesync] > 120)
	        {
	            SCM(i, COLOR_REALRED, "** WARNING: You are desynced. You are advised to relog once you see this message.");
	            PlayerInfo[i][pLastDesync] = gettime();
	        }

		    if(PlayerInfo[i][pSpectating] != INVALID_PLAYER_ID)
		    {
		        if(GetPlayerInterior(i) != GetPlayerInterior(PlayerInfo[i][pSpectating])) SetPlayerInterior(i, GetPlayerInterior(PlayerInfo[i][pSpectating]));
		        if(GetPlayerVirtualWorld(i) != GetPlayerVirtualWorld(PlayerInfo[i][pSpectating])) SetPlayerVirtualWorld(i, GetPlayerVirtualWorld(PlayerInfo[i][pSpectating]));
		    }
		    if(PlayerInfo[i][pTutorial])
		    {
		        TogglePlayerControllable(i, 0);
		    }
			if(PlayerInfo[i][pAwaitingClothing])
			{
			    SetPlayerClothing(i);
			}
			if(PlayerInfo[i][pDraggedBy] != INVALID_PLAYER_ID)
			{
	    		TeleportToPlayer(i, PlayerInfo[i][pDraggedBy]);
			}
			if(PlayerInfo[i][pDonator] > 0 && gettime() > PlayerInfo[i][pVIPTime])
			{
			    PlayerInfo[i][pDonator] = 0;
			    PlayerInfo[i][pVIPTime] = 0;
			    PlayerInfo[i][pSecondJob] = -1;

			    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET vippackage = 0, viptime = 0, secondjob = -1 WHERE uid = %i", PlayerInfo[i][pID]);
			    mysql_tquery(connectionID, queryBuffer);

			    SCM(i, COLOR_LIGHTRED, "Your donator subscription has expired. You are no longer a VIP.");
			}
			if(PlayerInfo[i][pDonator] < 1 && PlayerInfo[i][pSecondJob] != JOB_NONE)
			{
			    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET secondjob = -1 WHERE uid = %i", PlayerInfo[i][pID]);
			    mysql_tquery(connectionID, queryBuffer);

			    PlayerInfo[i][pSecondJob] = JOB_NONE;
			    SCM(i, COLOR_LIGHTRED, "Your second job has been removed as you don't have a Donator subscription.");
			}
			if(PlayerInfo[i][pFirstAid])
			{
				new
				    Float:health;

				GetPlayerHealth(i, health);

				if((health + 1.0) > 100.0)
				{
				    SetPlayerHealth(i, 100.0);
				    PlayerInfo[i][pFirstAid] = 0;
				}
				else
				{
				    SetPlayerHealth(i, health + 1.0);
				}
			}
			if(PlayerInfo[i][pArmorAid])
			{
				new
				    Float:armor;

				GetPlayerArmour(i, armor);

				if((armor + 1.0) > 100.0)
				{
				    SetPlayerArmour(i, 100.0);
				    PlayerInfo[i][pArmorAid] = 0;
				}
				else
				{
				    SetPlayerArmour(i, armor + 1.0);
				}
			}
			if(PlayerInfo[i][pTazedTime] > 0)
			{
			    PlayerInfo[i][pTazedTime]--;

			    if(!PlayerInfo[i][pTazedTime])
			    {
			        ClearAnimations(i, 1);
			        TogglePlayerControllable(i, 1);
			    }
			}
			if(PlayerInfo[i][pFishTime] > 0)
			{
			    PlayerInfo[i][pFishTime]--;

				if(!IsPlayerAtFishingPlace(i))
				{
				    ClearAnimations(i, 1);
				    RemovePlayerAttachedObject(i, 9);
				    PlayerInfo[i][pFishTime] = 0;
				}
			    else if(PlayerInfo[i][pFishTime] <= 0 && IsPlayerAtFishingPlace(i))
			    {
	          		new rand = Random(1, 100);

					if(1 <= rand <= 20)
	    			{
	 	   				SCM(i, COLOR_SYNTAX, "You reeled in your line and caught nothing...");
					}
					else if(21 <= rand <= 30)
					{
	    				new amount = 2000 + random(1000);

		    			SM(i, COLOR_AQUA, "You reeled in your line and caught a used wallet with $%i inside.", amount);
						GivePlayerCash(i, amount);
					}
					else if(98 <= rand <= 99)
					{
					    new amount = 4000 + random(1000);

					    SM(i, COLOR_AQUA, "You reeled in your line and caught a rare 18th century coin valued at $%i!", amount);
						GivePlayerCash(i, amount);
					}
					else
					{
					    new weight;

					    if(PlayerInfo[i][pUsedBait])
						{
							weight = random(15);
					    }
						else
						{
					        weight = random(10);
	    		        }

	    		        SM(i, COLOR_AQUA, "You reeled in your line and caught a fish weighing %i kg!", weight);
						PlayerInfo[i][pFishWeight] += weight;

						mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET fishweight = %i WHERE uid = %i", PlayerInfo[i][pFishWeight], PlayerInfo[i][pID]);
						mysql_tquery(connectionID, queryBuffer);

						IncreaseJobSkill(i, JOB_FISHERMAN);

	    				if(GetJobLevel(i, JOB_FISHERMAN) < 5)
	    				{
	        				if(PlayerInfo[i][pFishingSkill] < 50) {
	        					SM(i, COLOR_YELLOW, "You need to catch %i more fish in order to level up.", 50 - PlayerInfo[i][pFishingSkill]);
	        				} else if(PlayerInfo[i][pFishingSkill] < 100) {
	        					SM(i, COLOR_YELLOW, "You need to catch %i more fish in order to level up.", 100 - PlayerInfo[i][pFishingSkill]);
	        				} else if(PlayerInfo[i][pFishingSkill] < 200) {
	        					SM(i, COLOR_YELLOW, "You need to catch %i more fish in order to level up.", 200 - PlayerInfo[i][pFishingSkill]);
            				} else if(PlayerInfo[i][pFishingSkill] < 350) {
	        					SM(i, COLOR_YELLOW, "You need to catch %i more fish in order to level up.", 350 - PlayerInfo[i][pFishingSkill]);
							}
						}
						else
						{
						
						}

						if(GetJobLevel(i, JOB_FISHERMAN) == 1)
						{
							if(PlayerInfo[i][pFishWeight] >= 50)
		    		        {
		    		            SCM(i, COLOR_YELLOW, "You have too much fish. You can continue fishing once you sell your load.");
		    		        }
						}
						if(GetJobLevel(i, JOB_FISHERMAN) == 2)
						{
							if(PlayerInfo[i][pFishWeight] >= 100)
		    		        {
		    		            SCM(i, COLOR_YELLOW, "You have too much fish. You can continue fishing once you sell your load.");
		    		        }
						}
						if(GetJobLevel(i, JOB_FISHERMAN) == 3)
						{
							if(PlayerInfo[i][pFishWeight] >= 150)
		    		        {
		    		            SCM(i, COLOR_YELLOW, "You have too much fish. You can continue fishing once you sell your load.");
		    		        }
						}
						if(GetJobLevel(i, JOB_FISHERMAN) == 4)
						{
							if(PlayerInfo[i][pFishWeight] >= 200)
		    		        {
		    		            SCM(i, COLOR_YELLOW, "You have too much fish. You can continue fishing once you sell your load.");
		    		        }
						}
						if(GetJobLevel(i, JOB_FISHERMAN) == 5)
						{
							if(PlayerInfo[i][pFishWeight] >= 250)
		    		        {
		    		            SCM(i, COLOR_YELLOW, "You have too much fish. You can continue fishing once you sell your load.");
		    		        }
						}
					}

					ClearAnimations(i, 1);
					RemovePlayerAttachedObject(i, 9);
			    }
			}
			if(PlayerInfo[i][pOpenGiftCD] > 0)
            {
                PlayerInfo[i][pOpenGiftCD]--;

                if(PlayerInfo[i][pOpenGiftCD] <= 0)
                {
                    SCM(i, COLOR_GREY2, "You can now open a gift.");
                    PlayerInfo[i][pOpenGiftCD] = 0;
                }
            }
			if(PlayerInfo[i][pJailType] > 0)
			{
			    PlayerInfo[i][pJailTime]--; 

			    if(PlayerInfo[i][pJailTime] <= 0)
			    {
			        ResetPlayerWeaponsEx(i);

			        SCM(i, COLOR_GREY2, "Your jail sentence has expired.");
			        SetPlayerPos(i, -491.1122, -513.1991, 25.5178);
					SetPlayerFacingAngle(i, 271.5914);
					SetPlayerInterior(i, 0);
					SetPlayerVirtualWorld(i, 0);
					SetCameraBehindPlayer(i);

					PlayerTextDrawHide(i, customHUD[i][1]);

					PlayerInfo[i][pJailType] = 0;
			        PlayerInfo[i][pJailTime] = 0;
				}
			}
			if(PlayerInfo[i][pBedType] > 0)
			{
			    PlayerInfo[i][pBedTime]--;

			    if(PlayerInfo[i][pBedTime] <= 0)
			    {
			        ResetPlayerWeaponsEx(i);

			        SCM(i, COLOR_GREY2, "You're now free to go.");

					PlayerInfo[i][pBedType] = 0;
			        PlayerInfo[i][pBedTime] = 0;
				}
			}
			if(PlayerInfo[i][pHospital] && PlayerInfo[i][pHospitalTime])
			{
				PlayerInfo[i][pHospitalTime]--;

				if(PlayerInfo[i][pHospitalTime] == 0)
				{
					new rand = random(sizeof(hospitalspawns));
					SetFreezePos(i, hospitalspawns[rand][0], hospitalspawns[rand][1], hospitalspawns[rand][2]);
					SetPlayerFacingAngle(i, hospitalspawns[rand][3]);
   				    SetPlayerInterior(i, 1);
					SetPlayerVirtualWorld(i, PlayerInfo[i][pHospitalType]);
					SetCameraBehindPlayer(i);

					if(!enabledpurge) {
						GivePlayerCash(i, -1500);
						//SCM(i, COLOR_SYNTAX, "Discharged we detuct you $1500");
						SCM(i, COLOR_SYNTAX, "Discharged we deduct you $1500.");
						if(PlayerInfo[i][pDelivered])
						{
							SCM(i, COLOR_DOCTOR, "You have been billed $1500 for your stay. Your items is safed!");
							PlayerInfo[i][pDelivered] = 0;
						}
						else
						{
							SCM(i, COLOR_DOCTOR, "You have been billed $1500 for your stay. Your illegal items have been confiscated by staff.");
							SCM(i, COLOR_LIGHTRED, "(( You have lost 30 minutes of your memory. ))");
						}
					} else SCM(i, COLOR_DOCTOR, "You have been discharged for free for the purge event. (( Type /purgeme to refill your weapons. ))");

					new hospital[32];
					switch(PlayerInfo[i][pHospitalType])
					{
					    case HOSPITAL_COUNTY: strcat(hospital, "All Saints General");
					    case HOSPITAL_ALLSAINTS: strcat(hospital, "County General");
					    case HOSPITAL_SF1: strcat(hospital, "Kerala General Hospital");
					}

					UpdateDynamic3DTextLabelText(InjuredLabel[i], COLOR_DOCTOR, "");


					SetPlayerHealth(i, PlayerInfo[i][pSpawnHealth]);
					SetScriptArmour(i, PlayerInfo[i][pSpawnArmor]);

					PlayerInfo[i][pDirtyCash] = 0;

//					PlayerInfo[i][pBrokenLeg] = 0;
					PlayerInfo[i][pFood] = 0;
					PlayerInfo[i][pDrink] = 0;
					PlayerInfo[i][pHospital] = 0;
		            PlayerInfo[i][pHospitalTime] = 0;
		        }
			}
			if(PlayerInfo[i][pRefuel] != INVALID_VEHICLE_ID)
			{
			    PlayerInfo[i][pRefuelAmount] += 150;
			    vehicleFuel[PlayerInfo[i][pRefuel]]++;

			    if(vehicleFuel[PlayerInfo[i][pRefuel]] >= 100 || PlayerInfo[i][pCash] < PlayerInfo[i][pRefuelAmount] || GetVehicleParams(PlayerInfo[i][pRefuel], VEHICLE_ENGINE))
			    {
			        AddPointMoney(POINT_FUEL, PlayerInfo[i][pRefuelAmount]);
			        GivePlayerCash(i, -PlayerInfo[i][pRefuelAmount]);
			        SM(i, COLOR_AQUA, "You've refilled your vehicle's gas tank for "SVRCLR"$%i{CCFFFF}.", PlayerInfo[i][pRefuelAmount]);

			        PlayerInfo[i][pRefuel] = INVALID_VEHICLE_ID;
			        PlayerInfo[i][pRefuelAmount] = 0;
			    }
			}
			if(PlayerInfo[i][pHarvestTime] > 0)
			{
			    PlayerInfo[i][pHarvestTime]--;

			    if(PlayerInfo[i][pHarvestTime] <= 0)
				{
					if(IsPlayerInHarvestArea(i) && GetPlayerState(i) == PLAYER_STATE_ONFOOT && !PlayerInfo[i][pTazedTime] && !PlayerInfo[i][pCuffed])
				    {
				        SetPlayerAttachedObject(i, 9, 1453, 1, 0.242999, 0.324000, 0.012000, -17.200078, 20.699993, 9.800034, 0.579999, 0.617999, 0.676999);
						SetPlayerSpecialAction(i, SPECIAL_ACTION_CARRY);
						ApplyAnimation(i, "CARRY", "liftup", 4.1, 0, 0, 0, 0, 0, 1);
						PlayerInfo[i][pWheat] = 1;
					}
				}
			}
			if(PlayerInfo[i][pMiningTime] > 0)
			{
			    PlayerInfo[i][pMiningTime]--;

			    if(PlayerInfo[i][pMiningTime] <= 0)
				{
					if(IsPlayerInMiningArea(i) && GetPlayerState(i) == PLAYER_STATE_ONFOOT && !PlayerInfo[i][pTazedTime] && !PlayerInfo[i][pCuffed])
				    {
				        new number = random(20) + 1;

				        PlayerInfo[i][pCP] = CHECKPOINT_MINING;

		                SetPlayerAttachedObject(i, 9, 3929, 1, 0.242999, 0.324000, 0.012000, -17.200078, 20.699993, 9.800034, 0.579999, 0.617999, 0.676999);
						SetPlayerSpecialAction(i, SPECIAL_ACTION_CARRY);

						ApplyAnimation(i, "CARRY", "liftup", 4.1, 0, 0, 0, 0, 0, 1);
						SetPlayerCheckpoint(i, -708.2687, -853.6674, 109.5944, 2.0);//-399.0129,1241.3164,5.6755

						if(1 <= number <= 3)
						{
						    PlayerInfo[i][pMiningRock] = 2;
						    SCM(i, COLOR_AQUA, "You have dug up an old quality stone. Send it to our boss.");
						}
						else if(number == 6)
						{
						    SCM(i, COLOR_AQUA, "You have dug up a 1980's stone. Send it to our boss.");
						    PlayerInfo[i][pMiningRock] = 3;
						}
						else if(number == 2)
						{
						    SCM(i, COLOR_AQUA, "You have dug up a quality metal. Send it to our boss.");
						    PlayerInfo[i][pMiningRock] = 4;
						}
						else if(number == 9 && !PlayerInfo[i][pRareTime])
						{
						    SCM(i, COLOR_AQUA, "Woah, this looks oddly weird to find in the middle of a city, lets show it to the boss.");
						    PlayerInfo[i][pMiningRock] = 5;
						}
						else
						{
						    PlayerInfo[i][pMiningRock] = 1;
	                    	SCM(i, COLOR_AQUA, "You have dug up an ordinary stone. Send it to our boss.");
						}
					}
					else
					{
					    RemovePlayerAttachedObject(i, 9);
					    ClearAnimations(i, 1);
					}
				}
			}
   			if(PlayerInfo[i][pSweeping] && GetVehicleModel(GetPlayerVehicleID(i)) == 574 && GetVehicleSpeed(GetPlayerVehicleID(i)) > 35.0 && !PlayerInfo[i][pAFK])
			{
			    PlayerInfo[i][pSweepTime]--;

			    if(PlayerInfo[i][pSweepTime] <= 0)
			    {
				    new cost = 400 + random(200);

				    if(PlayerInfo[i][pLaborUpgrade] > 0)
					{
						cost += percent(cost, PlayerInfo[i][pLaborUpgrade]);
					}

			        AddToPaycheck(i, cost);

//				    format(string, sizeof(string), "~g~+$%i", cost);
				    GameTextForPlayer(i, string, 5000, 1);

			    	PlayerInfo[i][pSweepEarnings] += cost;
				    PlayerInfo[i][pSweepTime] = 30;
				}
			}
			if(PlayerInfo[i][pConstructionTime] > 0)
			{
			    PlayerInfo[i][pConstructionTime]--;

			    if(PlayerInfo[i][pConstructionTime] <= 0)
				{
					if(IsPlayerInConstructionArea(i) && GetPlayerState(i) == PLAYER_STATE_ONFOOT && !PlayerInfo[i][pTazedTime] && !PlayerInfo[i][pCuffed])
				    {
				        new number = random(20) + 1;

				        PlayerInfo[i][pCP] = CHECKPOINT_CONSTRUCTION;

		                SetPlayerAttachedObject(i, 9, 1265, 1, 0.242999, 0.324000, 0.012000, -17.200078, 20.699993, 9.800034, 0.579999, 0.617999, 0.676999);
						SetPlayerSpecialAction(i, SPECIAL_ACTION_CARRY);

						ApplyAnimation(i, "CARRY", "liftup", 4.1, 0, 0, 0, 0, 0, 1);
						SetPlayerCheckpoint(i, 2076.9275, -2071.7043, 13.5469, 2.0);

						if(1 <= number <= 3)
						{
						    PlayerInfo[i][pConstruction] = 2;
						    SCM(i, COLOR_AQUA, "Drop it to the checkpoint");
						}
						else if(number == 6)
						{
						    SCM(i, COLOR_AQUA, "Drop it to the checkpoint");
						    PlayerInfo[i][pConstruction] = 3;
						}
						else if(number == 2)
						{
						    SCM(i, COLOR_AQUA, "Drop it to the checkpoint");
						    PlayerInfo[i][pConstruction] = 4;
						}
						else if(number == 9)
						{
						    SCM(i, COLOR_AQUA, "Drop it to the checkpoint");
						    PlayerInfo[i][pConstruction] = 5;
						}
						else
						{
						    PlayerInfo[i][pConstruction] = 1;
	                    	SCM(i, COLOR_AQUA, "Drop it to the checkpoint");
						}
					}
					else
					{
					    RemovePlayerAttachedObject(i, 9);
					    ClearAnimations(i, 1);
					}
				}
			}
			if(PlayerInfo[i][pPackageTime] > 0)
			{
			    PlayerInfo[i][pPackageTime]--;

			    if(PlayerInfo[i][pPackageTime] <= 0)
				{
					if(IsPlayerInButcherArea(i) && GetPlayerState(i) == PLAYER_STATE_ONFOOT && !PlayerInfo[i][pTazedTime] && !PlayerInfo[i][pCuffed])
				    {
				        new number = random(20) + 1;

				        PlayerInfo[i][pCP] = CHECKPOINT_BUTCHER;

		                SetPlayerAttachedObject(i, 9, 2805, 6, 0.140999, 0.184999, -0.250000, -23.300001, -6.400006, 12.699996, 0.716000, 0.803000, 0.859999);

						SetPlayerSpecialAction(i, SPECIAL_ACTION_CARRY);

						ApplyAnimation(i, "CARRY", "liftup", 4.1, 0, 0, 0, 0, 0, 1);
						SetPlayerCheckpoint(i, -2158.9900, -263.6255, 36.5156, 2.0);

						if(1 <= number <= 3)
						{
						    PlayerInfo[i][pPackagingMeat] = 2;
						    SCM(i, COLOR_WHITE, "You chopped the meat cleanly.");
						}
						else if(number == 6)
						{
						    SCM(i, COLOR_WHITE, "You chopped the meat cleanly.");
						    PlayerInfo[i][pPackagingMeat] = 3;
						}
						else if(number == 2)
						{
						    SCM(i, COLOR_WHITE, "You chopped the meat cleanly.");
						    PlayerInfo[i][pPackagingMeat] = 4;
						}
						else if(number == 9 && !PlayerInfo[i][pRareTime])
						{
						    SCM(i, COLOR_WHITE, "You chopped the meat perfectly.");
						    PlayerInfo[i][pPackagingMeat] = 5;
						}
						else
						{
						    PlayerInfo[i][pPackagingMeat] = 1;
	                    	SCM(i, COLOR_WHITE, "The meat was done. Drop it off at the marker.");
						}
					}
					else
					{
					    RemovePlayerAttachedObject(i, 9);
					    ClearAnimations(i, 1);
					}
				}
			}
			if(PlayerInfo[i][pTaxiPassenger] != INVALID_PLAYER_ID)
			{
			    if((GetVehicleModel(GetPlayerVehicleID(i)) != 420 && GetVehicleModel(GetPlayerVehicleID(i)) != 438) || !IsPlayerInVehicle(PlayerInfo[i][pTaxiPassenger], GetPlayerVehicleID(i)) || PlayerInfo[i][pTaxiFare] == 0 || PlayerInfo[PlayerInfo[i][pTaxiPassenger]][pCash] < PlayerInfo[i][pTaxiBill])
			    {
			        CancelTaxiRide(i);
			    }
			    else
			    {
			        PlayerInfo[i][pTaxiTime]++;

			        if(PlayerInfo[i][pTaxiTime] >= 15)
			        {
			            PlayerInfo[i][pTaxiTime] = 0;
			            PlayerInfo[i][pTaxiBill] += PlayerInfo[i][pTaxiFare];
					}

					format(string, sizeof(string), "~n~~n~~n~~n~~n~~n~~n~~g~Taxi Meter:~w~ $%i", PlayerInfo[i][pTaxiBill]);
					GameTextForPlayer(i, string, 3000, 3);
			    }
			}
			if(PlayerInfo[i][pMuted] > 0)
			{
			    PlayerInfo[i][pMuted]--;

			    if(PlayerInfo[i][pMuted] <= 0)
			    {
			        SCM(i, COLOR_SERVER, "**"WHITE" You are no longer muted.");
				}
			}
			if(PlayerInfo[i][pVendorTime] > 0)
			{
			    PlayerInfo[i][pVendorTime]--;
			}
			if(PlayerInfo[i][pBarTime] > 0)
			{
			    PlayerInfo[i][pBarTime]--;
			}
			if(PlayerInfo[i][pSpamTime] > 0)
			{
			    PlayerInfo[i][pSpamTime]--;
			}
			if(PlayerInfo[i][pVehicleCount] > 0)
			{
			    PlayerInfo[i][pVehicleCount]--;
			}
			if(PlayerInfo[i][pMechanicCall] > 0)
			{
			    PlayerInfo[i][pMechanicCall]--;
			}
			if(PlayerInfo[i][pTaxiCall] > 0)
			{
			    PlayerInfo[i][pTaxiCall]--;
			}
			if(PlayerInfo[i][pEmergencyCall] > 0)
			{
			    PlayerInfo[i][pEmergencyCall]--;
			}
			if(PlayerInfo[i][pCourierCooldown] > 0)
			{
			    PlayerInfo[i][pCourierCooldown]--;
			}
   			if(PlayerInfo[i][pPizzaCooldown] > 0)
			{
       			PlayerInfo[i][pPizzaCooldown]--;
			}
			if(PlayerInfo[i][pRareTime] > 0)
			{
		    	PlayerInfo[i][pRareTime]--;
			}
   			if(PlayerInfo[i][pDeathCooldown] > 0)
			{
       			PlayerInfo[i][pDeathCooldown]--;
			}
			if(PlayerInfo[i][pDetectiveCooldown] > 0)
			{
       			PlayerInfo[i][pDetectiveCooldown]--;
			}
			if(PlayerInfo[i][pLootTime] > 0)
			{
			    PlayerInfo[i][pLootTime]--;

			    if(IsPlayerInBankRobbery(i) && PlayerInfo[i][pLootTime] <= 0)
			    {
			        new amount = random(500) + 500;

			        ClearAnimations(i, 1);

			        PlayerInfo[i][pRobCash] += amount;
			        PlayerInfo[i][pCP] = CHECKPOINT_ROBBERY;
			        PlayerInfo[i][pLastLoad] = gettime();

					format(string, sizeof(string), "~g~+$%i", amount);
					GameTextForPlayer(i, string, 5000, 1);

			        //SM(i, COLOR_AQUA, "You have looted "WHITE"$%i"REDORANGE" and now have "WHITE"$%i"REDORANGE". You can keep looting or deliver the cash to the "SVRCLR"marker{CCFFFF}.", amount, PlayerInfo[i][pRobCash]);
			        SM(i, COLOR_WHITE, "You have looted "SVRCLR"$%i"WHITE" and now have "SVRCLR"$%i"WHITE". You can keep looting or deliver the cash to the "RED"marker{CCFFFF}.", amount, PlayerInfo[i][pRobCash]);
					SetPlayerCheckpoint(i, 1465.1348, -1010.5063, 26.8438, 3.0);
			    }
				else if((PlayerInfo[i][pRobbingBiz] >= 0 && PlayerInfo[i][pRobbingBiz] == GetInsideBusiness(i)) && PlayerInfo[i][pLootTime] <= 0)
			    {
					if(PlayerInfo[i][pRobCash] >= BusinessInfo[PlayerInfo[i][pRobbingBiz]][bCash])
					{
						SCM(i, COLOR_GREY2, "Your pockets can't hold anymore!");
						PlayerInfo[i][pLootTime] = 0;
						RobberyInfo[rBstarted] = 0;
					} else {
						PlayerInfo[i][pLootTime] = 5;
						SCM(i, COLOR_SYNTAX, "Looting business vault...");
					}

			        new amount = random(500) + 200;

			        PlayerInfo[i][pRobCash] += amount;
			        PlayerInfo[i][pCP] = CHECKPOINT_ROBBERYBIZ;
			        PlayerInfo[i][pLastLoad] = gettime();

					format(string, sizeof(string), "~g~+P%i", amount);
					GameTextForPlayer(i, string, 5000, 1);

			        //SM(i, COLOR_LIGHTBLUE , "You have looted "WHITE"P%i"REDORANGE" and now have "WHITE"P%i"REDORANGE". You can keep looting or deliver the cash to the "SVRCLR"marker{CCFFFF}.", amount, PlayerInfo[i][pRobCash]);
			        SM(i, COLOR_WHITE, "You have looted "SVRCLR"$%i"WHITE" and now have "SVRCLR"$%i"WHITE". You can keep looting or deliver the cash to the "RED"marker{CCFFFF}.", amount, PlayerInfo[i][pRobCash]);
					SetPlayerCheckpoint(i, BusinessInfo[PlayerInfo[i][pRobbingBiz]][bPosX], BusinessInfo[PlayerInfo[i][pRobbingBiz]][bPosY], BusinessInfo[PlayerInfo[i][pRobbingBiz]][bPosZ], 3.0);
			    }
			}
			if(PlayerInfo[i][pFindTime] > 0)
			{
			    PlayerInfo[i][pFindTime]--;

			    if(PlayerInfo[i][pFindTime] == 0)
			    {
			        SetPlayerMarkerForPlayer(i, PlayerInfo[i][pFindPlayer], GetPlayerColor(PlayerInfo[i][pFindPlayer]));
					PlayerInfo[i][pFindPlayer] = INVALID_PLAYER_ID;
				}
			}
			if((PlayerInfo[i][pToggleMusic]) || (PlayerInfo[i][pBoomboxListen] != INVALID_PLAYER_ID && GetNearbyBoombox(i) != PlayerInfo[i][pBoomboxListen]))
			{
				PlayerInfo[i][pBoomboxListen] = INVALID_PLAYER_ID;

				if(PlayerInfo[i][pStreamType] == MUSIC_BOOMBOX)
				{
				    StopAudioStreamForPlayer(i);
				    PlayerInfo[i][pStreamType] = MUSIC_NONE;
				}
			}
			if((!PlayerInfo[i][pToggleMusic]) && ((boomboxid = GetNearbyBoombox(i)) != INVALID_PLAYER_ID && PlayerInfo[i][pBoomboxListen] != boomboxid))
			{
			    PlayerInfo[i][pBoomboxListen] = boomboxid;

			    if(PlayerInfo[i][pStreamType] == MUSIC_NONE)
			    {
			        PlayAudioStreamForPlayer(i, PlayerInfo[boomboxid][pBoomboxURL]);
			        PlayerInfo[i][pStreamType] = MUSIC_BOOMBOX;
			    }
			}
            if(PlayerInfo[i][pPickPlant] != INVALID_PLAYER_ID)
            {
                PlayerInfo[i][pPickTime]--;

                if(PlayerInfo[i][pPickTime] <= 0)
                {
                    new planterid = PlayerInfo[i][pPickPlant];

                    if(!IsPlayerConnected(planterid) || !PlayerInfo[planterid][pLogged] || !PlayerInfo[planterid][pPotPlanted])
                    {
                        SCM(i, COLOR_SYNTAX, "This plant is no longer available to pick.");
					}
					else if(!IsPlayerInRangeOfPoint(i, 3.0, PlayerInfo[planterid][pPotX], PlayerInfo[planterid][pPotY], PlayerInfo[planterid][pPotZ]))
					{
					    SCM(i, COLOR_SYNTAX, "Picking failed. You left the area of the plant.");
					}
					else if(GetPlayerSpecialAction(i) != SPECIAL_ACTION_DUCK)
					{
					    SCM(i, COLOR_SYNTAX, "Picking failed. You must stay crouched when picking a plant.");
					}
					else
					{
					    PlayerInfo[i][pPot] += PlayerInfo[planterid][pPotGrams];

						mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET pot = %i WHERE uid = %i", PlayerInfo[i][pPot], PlayerInfo[i][pID]);
						mysql_tquery(connectionID, queryBuffer);

						SM(i, COLOR_AQUA, "You have harvested %i grams of pot from this plant.", PlayerInfo[planterid][pPotGrams]);
					    DestroyPotPlant(planterid);
					}

					PlayerInfo[i][pPickPlant] = INVALID_PLAYER_ID;
					PlayerInfo[i][pPickTime] = 0;
				}
			}
			if(PlayerInfo[i][pCookMeth] > 0)
			{
                PlayerInfo[i][pCookTime]--;

                if(PlayerInfo[i][pCookTime] <= 0)
                {
                    if(PlayerInfo[i][pEphedrine] <= 0)
                    {
                        SCM(i, COLOR_SYNTAX, "Cooking failed. You have ran out of ephedrine.");
                        ResetCooking(i);
					}
                    else if(PlayerInfo[i][pBakingSoda] <= 0)
                    {
                        SCM(i, COLOR_SYNTAX, "Cooking failed. You have ran out of baking soda.");
                        ResetCooking(i);
					}
					else if(PlayerInfo[i][pMeth] + 1 > GetPlayerCapacity(CAPACITY_METH))
                    {
                        SCM(i, COLOR_SYNTAX, "Cooking failed. You have ran out of inventory space for meth.");
                        ResetCooking(i);
					}
					else
					{
					switch(random(5)) // COOKMETH
					{
				    	case 0:
						{
						    PlayerInfo[i][pEphedrine] -= 1;
							PlayerInfo[i][pMeth] += 1;
							PlayerInfo[i][pCookGrams] += 1;
							PlayerInfo[i][pMuriaticAcid]--;
				    		PlayerInfo[i][pBakingSoda]--;

							SM(i, COLOR_AQUA, "You have successfully cooked %i tweeter of Meth.", PlayerInfo[i][pCookGrams]);
				    		ResetCooking(i);
						}
				    	case 1:
						{
						    PlayerInfo[i][pEphedrine] -= 1;
							PlayerInfo[i][pMeth] += 1;
							PlayerInfo[i][pCookGrams] += 1;
							PlayerInfo[i][pMuriaticAcid]--;
				    		PlayerInfo[i][pBakingSoda]--;
				    		
							SM(i, COLOR_AQUA, "You have successfully cooked %i tweeter of Meth.", PlayerInfo[i][pCookGrams]);
				    		ResetCooking(i);
						}
			  			case 2:
						{
						    PlayerInfo[i][pEphedrine] -= 1;
							PlayerInfo[i][pMeth] += 1;
							PlayerInfo[i][pCookGrams] += 1;
							PlayerInfo[i][pMuriaticAcid]--;
				    		PlayerInfo[i][pBakingSoda]--;
				    		
							SM(i, COLOR_AQUA, "You have successfully cooked %i tweeter of Meth.", PlayerInfo[i][pCookGrams]);
							SM(i, COLOR_AQUA, "I did this for the meth, oh the meth I love the meth!");
				    		ResetCooking(i);
						}
						case 3:
						{
						    PlayerInfo[i][pEphedrine] -= 1;
							PlayerInfo[i][pMuriaticAcid] -= 1;
				    		PlayerInfo[i][pBakingSoda] -= 1;
				    		
			  				new
						    Float:x, Float:y, Float:z;

							GetPlayerPos(i, x, y, z);

							CreateExplosionForPlayer(i, x, y, z, 6, 20.0);
						    DamagePlayer(i, 15);
          					SM(i, COLOR_AQUA, "You have failed to properly cook a pure batch, causing an explosion!");
          					SM(i, COLOR_AQUA, "Science Bitch!");
						    
						    SendProximityMessage(i, 20.0, COLOR_PURPLE, " %s takes the pot off the oven too quickly causing it to explode.", GetRPName(i));
						    ResetCooking(i);
						}
						case 4:
						{
						    PlayerInfo[i][pEphedrine] -= 1;
							PlayerInfo[i][pMuriaticAcid] -= 1;
				    		PlayerInfo[i][pBakingSoda] -= 1;

			  				new
						    Float:x, Float:y, Float:z;

							GetPlayerPos(i, x, y, z);

							CreateExplosionForPlayer(i, x, y, z, 6, 20.0);
						    DamagePlayer(i, 15);
          					SM(i, COLOR_AQUA, "You have failed to properly cook a pure batch, causing an explosion!");
          					SM(i, COLOR_AQUA, "Science Bitch!");

						    SendProximityMessage(i, 20.0, COLOR_PURPLE, " %s takes the pot off the oven too quickly causing it to explode.", GetRPName(i));
						    ResetCooking(i);
						}
					}
					mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET ephedrine = %i, meth = %i, muriaticacid = %i, bakingsoda = %i WHERE uid = %i", PlayerInfo[i][pEphedrine], PlayerInfo[i][pMeth], PlayerInfo[i][pMuriaticAcid], PlayerInfo[i][pBakingSoda], PlayerInfo[i][pID]);
					mysql_tquery(connectionID, queryBuffer);

					if(!PlayerInfo[i][pEphedrine])
					{
					    SM(i, COLOR_LIGHTRED, "You ran out of ephedrine therefore ending your cookoff. You made %i grams of meth from %i grams of ephedrine.", PlayerInfo[i][pCookGrams], PlayerInfo[i][pCookGrams] / 2);
						ResetCooking(i);
				    }
				    else if(!PlayerInfo[i][pMuriaticAcid])
					{
					    SM(i, COLOR_LIGHTRED, "You ran out of muriatic acid therefore ending your cookoff. You made %i grams of meth from %i grams of ephedrine.", PlayerInfo[i][pCookGrams], PlayerInfo[i][pCookGrams] / 2);
						ResetCooking(i);
				    }
   					else if(!PlayerInfo[i][pBakingSoda])
					{
					    SM(i, COLOR_LIGHTRED, "You ran out of baking soda therefore ending your cookoff. You made %i grams of meth from %i grams of ephedrine.", PlayerInfo[i][pCookGrams], PlayerInfo[i][pCookGrams] / 2);
						ResetCooking(i);
				    }
				    else if(PlayerInfo[i][pMeth] >= GetPlayerCapacity(CAPACITY_METH))
                    {
                        SM(i, COLOR_LIGHTRED, "You ran out of inventory space for meth therefore ending your cookoff. You made %i grams of meth from %i grams of ephedrine.", PlayerInfo[i][pCookGrams], PlayerInfo[i][pCookGrams] / 2);
						ResetCooking(i);
				    }
				    else
				    {
				        PlayerInfo[i][pCookTime] = 30;
					}
                }
            }
		}
			if(PlayerInfo[i][pDrugsUsed] >= 4)
			{
			    PlayerInfo[i][pDrugsTime]--;

			    if(PlayerInfo[i][pDrugsTime] <= 0)
			    {
			        SCM(i, COLOR_SERVER, "**"WHITE" You are no longer stoned.");
			        SetPlayerWeather(i, gWeather);

					SetPlayerTime(i, gWorldTime, 0);

			        PlayerInfo[i][pDrugsUsed] = 0;
			        PlayerInfo[i][pDrugsTime] = 0;
			    }
			    else
			    {
			        SetPlayerWeather(i, -66);
			        SetPlayerTime(i, 12, 0);
				}
			}
			if(PlayerInfo[i][pPoisonTime] > 0)
			{
			    new
			        Float:health;
			    GetPlayerHealth(i, health);
			    SetPlayerHealth(i, health - 3.0 < 1.0 ? 1.0 : health - 3.0);
			    PlayerInfo[i][pPoisonTime]--;
			}

			AnticheatCheck(i);

			if(PlayerInfo[i][pGang] >= 0 && !PlayerInfo[i][pBandana])
			{
				new id, gang = PlayerInfo[i][pGang], color;
				if(GangInfo[gang][gColor] == -1 || GangInfo[gang][gColor] == -256)
				{
					color = 0xC8C8C8FF;
				}
				else
				{
					color = GangInfo[gang][gColor];
				}
				if((id = GetNearbyTurf(i)) >= 0 && TurfInfo[id][tTime] == 0 && TurfInfo[id][tCapturer] != INVALID_PLAYER_ID)
				{
					format(string, sizeof(string), "{%06x}%s\n"WHITE"%s", color >>> 8, GangInfo[gang][gName],GangRanks[gang][PlayerInfo[i][pGangRank]]);
					UpdateDynamic3DTextLabelText(PlayerLabel[i], COLOR_WHITE, string);
					PlayerInfo[i][pBandana] = 1;
					SendClientMessage(i, COLOR_WHITE, "Your bandana was enabled automatically as you entered a turf in an active war.");
				}
				if((id = GetNearbyPoint(i, 30.0)) >= 0 && PointInfo[id][pTime] == 0 && PointInfo[id][pCapturer] != INVALID_PLAYER_ID)
				{
					format(string, sizeof(string), "{%06x}%s\n"WHITE"%s", color >>> 8, GangInfo[gang][gName],GangRanks[gang][PlayerInfo[i][pGangRank]]);
					UpdateDynamic3DTextLabelText(PlayerLabel[i], COLOR_WHITE, string);
					PlayerInfo[i][pBandana] = 1;
					SendClientMessage(i, COLOR_WHITE, "Your bandana was enabled automatically as you are in range of an active point.");
				}
			}
			if(!PlayerInfo[i][pBackup] && !IsPlayerBeingFound(i))
			{
				// NAMETAG COLORS, GANG COLORS, BANDANA BADGE
				if(PlayerInfo[i][pJoinedEvent] && EventInfo[eType] == 2)
				{
				    SetPlayerColor(i, (PlayerInfo[i][pEventTeam] == RED_TEAM) ? (0xFF000000) : (0x0000FF00));
				}
				else if(TalpakData[e_bTalpak])
				{
					if(TalpakData[e_iRedPlayerid] == i)
					{
						SetPlayerColor(i, COLOR_RED);
					}
					else if(TalpakData[e_iBluePlayerid] == i)
					{
						SetPlayerColor(i, TEAM_BLUE_COLOR);
					}
				}
				else if(PlayerInfo[i][pJailType] == 2)
				{
				    SetPlayerColor(i, 0xF4A41900);
				}
				else if(PlayerHasJob(i, JOB_TAXIDRIVER) && PlayerInfo[i][pTaxiFare] > 0)
				{
				    SetPlayerColor(i, 0xFFD70000);
				}
				else if(PlayerHasJob(i, JOB_TAXIDRIVER2) && PlayerInfo[i][pTaxiFare] > 0)
				{
				    SetPlayerColor(i, 0xFFD70000);
				}
				else if(PlayerInfo[i][pFaction] >= 0 && PlayerInfo[i][pDuty] && FactionInfo[PlayerInfo[i][pFaction]][fType] != FACTION_HITMAN)
				{
					SetPlayerColor(i, FactionInfo[PlayerInfo[i][pFaction]][fColor] & ~0xff);
				}
				else if(PlayerInfo[i][pGang] >= 0 && PlayerInfo[i][pBandana])
				{
				    SetPlayerColor(i, GangInfo[PlayerInfo[i][pGang]][gColor] & ~0xff);
				}
				else if(PlayerInfo[i][pDonator] > 0 && PlayerInfo[i][pVIPColor])
				{
				    SetPlayerColor(i, 0xC2A2DA00);
				}
          		else if(PlayerInfo[i][pAdmin] > 0 && PlayerInfo[i][pAdminColor])
				{
				    SetPlayerColor(i, 0x0D941700);
				}
				else if(PlayerInfo[i][pAdmin] > 0 && PlayerInfo[i][pAdminDuty])
				{
                    SetPlayerSpecialTag(i, TAG_ADMIN);
				}
   				else if(PlayerInfo[i][pAFK])
				{
					SetPlayerSpecialTag(i, TAG_AFK);
				}
				else
				{
				    SetPlayerColor(i, 0xFFFFFF00);
				    //SetPlayerSpecialTag(i, TAG_NORMAL);
				}
			}
		}
	}
	if((gGMX) && mysql_unprocessed_queries(connectionID) == 0)
	{
	    SendRconCommand("gmx");
		SendRconCommand("reloadfs plamap");
		SendRconCommand("reloadfs donationmap");
		SendRconCommand("reloadfs sfandlv");
	}

	for(new i = 0; i < MAX_ACTORS; i ++)
	{
	    if(IsValidActor(i))
	    {
	        new
	            Float:x,
	            Float:y,
	            Float:z;
	        GetActorPos(i, x, y, z);
	        SetActorPos(i, x, y, z);
	    }
	}
	format(string, sizeof(string), "Marijuana Seeds\n"WHITE"Stock: %i\nPrice: $1,500 per seed\n/getdrug seeds [amount]", gSeedsStock);
	UpdateDynamic3DTextLabelText(gSeedsStockText, COLOR_YELLOW, string);

	format(string, sizeof(string), "Raw Ephedrine\n"WHITE"Stock: %i\nPrice: $2,000 per gram\n/getdrug ephedrine [amount]", gEphedrineStock);
	UpdateDynamic3DTextLabelText(gEphedrineStockText, COLOR_YELLOW, string);

	format(string, sizeof(string), "Crack\n"WHITE"Stock: %i\nPrice: $3,500 per gram\n/getdrug crack [amount]", gCrackStock);
    UpdateDynamic3DTextLabelText(gCrackText, COLOR_YELLOW, string);

	if(Iter_Count(Player) > gPlayerRecord)
	{
		gPlayerRecord = Iter_Count(Player);
		gRecordDate = GetDate();
		SaveServerInfo();
	}
}
