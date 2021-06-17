
public playerneeded()
{
	for(new i; i<MAX_PLAYERS; i++)
	{
	    if(IsPlayerConnected(i))
        {
            if(gPlayerLogged[i] == 1)
            {
			    new string[64];
			    new nxtlevel = PlayerInfo[i][pLevel]+1;
			    new expamount = nxtlevel*levelexp;
			    new Float:playerhp, Float:playerarmor;
			    GetPlayerHealth(i, playerhp);
			    GetPlayerArmour(i, playerarmor);
			    
			    // HUD
				format(string,sizeof(string),"$%d" ,PlayerInfo[i][pCash]);
				TextDrawSetString(Uang[i], string);
				
				format(string,sizeof(string),"%d%" ,PlayerInfo[i][pEnergy]);
				TextDrawSetString(Lapar[i], string);
				
				format(string,sizeof(string),"Coin: %d" ,PlayerInfo[i][pGoldCoin]);
				TextDrawSetString(Coin[i], string);
				
				format(string,sizeof(string),"%.1f" ,playerhp);
				TextDrawSetString(Myhealth[i], string);
				
				format(string,sizeof(string),"%.1f" ,playerarmor);
				TextDrawSetString(Myarmor[i], string);
				
				if(UsingMask[i] == 1)
				{
				    for(new p=0; p<MAX_PLAYERS; p++)
	   			    {
	   		    	    if(IsPlayerConnected(p))
	   		    	    {
			   			    ShowPlayerNameTagForPlayer(p, i, false);
					    }
				    }
				}
				
				if(PlayerPaintballing[i] != 0)
	            {
					if((event == 2) || (event == 4))
					{
			            if(!IsPlayerInRangeOfPoint(i,100.0,-369.2361,2248.3127,42.4844))
			            {
			                SendClientMessage(i, COLOR_YELLOW, "[WARNING] Tetap berada di wilayah event !");
			                new rand = random(sizeof(PaintballSpawns));
				            SetPlayerPos(i, PaintballSpawns[rand][0], PaintballSpawns[rand][1], PaintballSpawns[rand][2]);
				            SetPlayerInterior(i, 0);
							SetPlayerVirtualWorld(i, 69);
			            }
		            }
		            else if((event == 5))
					{
			            if(!IsPlayerInRangeOfPoint(i,300.0,-1042.7937,1063.5323,1346.3610))
			            {
			                SendClientMessage(i, COLOR_YELLOW, "[WARNING] Tetap berada di wilayah event !");
			                if(PlayerWarTeam[i] == 0)
							{
								SetPlayerPos(i, -973.7012,1060.9987,1345.6740);
								SetPlayerInterior(i, 10);
								SetPlayerVirtualWorld(i, 69);
							}
			                else if(PlayerWarTeam[i] == 1)
							{
								SetPlayerPos(i, -1131.2798, 1057.8960, 1346.4175);
								SetPlayerInterior(i, 10);
								SetPlayerVirtualWorld(i, 69);
							}
			            }
		            }
	            }
	            if(gPlayerSpawned[i] == 1)
	            {
		            if(PlayerInfo[i][pInactive] == 1)
					{
		                if(!IsPlayerInRangeOfPoint(i,20.0,-766.6410,68.5012,1001.5612) && GetPlayerInterior(i) != 7)
				        {
                            SetPlayerInterior(i, 7);
							SetPlayerVirtualWorld(i, 7);
							SetPlayerPos(i, -766.6410,68.5012,1001.5612 );
							SendClientMessage(i, COLOR_LIGHTBLUE, "[WARNING] Tetap berada di wilayah newbie spawn !");
				        }
		            }
	            }
	            if(PlayerInfo[i][pJob] == 7 && JobDuty[i] == 1)
	            {
	                if(!IsPlayerInRangeOfPoint(i, 28.0,1607.6606,-2164.7157,13.5619) && !IsPlayerInRangeOfPoint(i, 35.0,2453.5039,-2713.4714,3.1648))
					{
					    SendClientMessage(i, COLOR_LIGHTBLUE, "[MECHANIC HQ] You are now Off Duty from your Mechanic Job and will not receive calls anymore.");
				        JobDuty[i] = 0;
				        SetPlayerToTeamColor(i);
				        Mechanics -= 1;
					}
                }
                if(PlayerInfo[i][pJailed] == 2 && !IsPlayerInRangeOfPoint(i, 75.0,1836.0410, -1721.6979, 5202.5859))
                {
                    Pause(i);
       				SetPlayerInterior(i, 5);
					SetPlayerPos(i, 1836.0410, -1721.6979, 5202.5859);
                	SetPlayerFacingAngle(i, 250.0000);
					TogglePlayerControllable(i, 1);
					SetCameraBehindPlayer(i);
				}
				if(PlayerInfo[i][pDonateTime] > 0)
				{
				    PlayerInfo[i][pDonateTime]--;
				}
				if(PlayerInfo[i][pDonateTime] != 0 && PlayerInfo[i][pDonateTime] < 2)
			    {
			        PlayerInfo[i][pDonateTime] = 0;
			        PlayerInfo[i][pDonateRank] = 0;
			        SendClientMessage(i, COLOR_YELLOW, "[INFO] Paket VIP kamu telah Expired, Terima kasih sudah Berdonasi.");
				}
	            if(PlayerInfo[i][pOnDuty] == 1)
		        {
			        if(PlayerInfo[i][pDutyTime] > 0)
			        {
			            PlayerInfo[i][pDutyTime] --;
			        }
			        if(PlayerInfo[i][pDutyTime] != 0 && PlayerInfo[i][pDutyTime] < 2)
			        {
			            PlayerInfo[i][pDutyTime] = 3600;
			            FacPayCheck(i);
			        }
		        }
		        if(JobDuty[i] == 1)
		        {
			        if(PlayerInfo[i][pJobtime] > 0)
			        {
			            PlayerInfo[i][pJobtime] --;
			        }
			        if(PlayerInfo[i][pJobtime] != 0 && PlayerInfo[i][pJobtime] < 2)
			        {
			            PlayerInfo[i][pJobtime] = 300;
			            JobPayCheck(i);
			        }
		        }
				if(PlayerInfo[i][pExp] >= expamount)
				{
					format(string, sizeof(string), "~r~Level up~n~~w~level %d", nxtlevel);
					PlayerPlaySound(i, 1052, 0.0, 0.0, 0.0);
					PlayerInfo[i][pLevel]++;
					PlayerInfo[i][gPupgrade] = PlayerInfo[i][gPupgrade]+1;
					PlayerInfo[i][pExp] = 0;
					format(string, sizeof(string), "You became level %d, type /claim.", nxtlevel);
					SendClientMessage(i, COLOR_YELLOW, string);
					format(string, sizeof(string), "You have %d claim points remaining.",PlayerInfo[i][gPupgrade]);
					SendClientMessage(i, COLOR_YELLOW, string);
				}
				if(PlayerInfo[i][pJobdelay] > 0)
		        {
		            PlayerInfo[i][pJobdelay] --;
		        }
		        if(PlayerInfo[i][pJobdelay] != 0 && PlayerInfo[i][pJobdelay] < 2)
		        {
		            PlayerInfo[i][pJobdelay] = 0;
		            SendClientMessage(i, COLOR_YELLOW, "DISPATCH: Waktu Delay kamu telah habis, kini kamu dapat bekerja kembali");
		        }
		        if(PlayerInfo[i][pPayDay] > 0)
		        {
		            PlayerInfo[i][pPayDay] --;
		        }
		        if(PlayerInfo[i][pPayDay] != 0 && PlayerInfo[i][pPayDay] < 2)
		        {
		            PayDay(i);
		        }
	            if(PlayerInfo[i][pPainEffect] > 0)
	            {
		            PlayerInfo[i][pPainEffect] --;
		        }
		        if(PlayerInfo[i][pPainEffect] != 0 && PlayerInfo[i][pPainEffect] < 2)
		        {
		            PlayerInfo[i][pPainEffect] = 0;
		            SendClientMessage(i, COLOR_YELLOW, "[BODY] Efek Painkiller kamu telah habis.");
		        }
		        if(PlayerInfo[i][pBandageEffect] > 0)
	            {
		            PlayerInfo[i][pBandageEffect] --;
		        }
		        if(PlayerInfo[i][pBandageEffect] != 0 && PlayerInfo[i][pBandageEffect] < 2)
		        {
		            PlayerInfo[i][pBandageEffect] = 0;
		            SendClientMessage(i, COLOR_YELLOW, "[BODY] Perban yang ada ditubuh kamu sudah basah dan terlepas.");
		        }
		        if(Switter[i] == 1)
		        {
                    PlayerInfo[i][pInternetPack] --;
                    if(PlayerInfo[i][pInternetPack] != 0 && PlayerInfo[i][pInternetPack] < 5)
			        {
			            PlayerInfo[i][pInternetPack] = 0;
			            Switter[i] = 0;
			            SendClientMessage(i, COLOR_YELLOW, "S.M.S: Paket Internet kamu telah habis | Sender : L.S Service (111)");
			        }
		        }
			}
		}
	}
	return 1;
}

public OnPlayerPressButton(playerid, buttonid)
{
	if(buttonid == 1)
	{
	    if(IsACop(playerid) || IsAnAgent(playerid))
	    {
	    	if(LSPD_Door[Opened] == 0)
	    	{
	    		MoveDynamicObject(LSPD_Door[ObjectID1], 871.89, 2312.50, 1910.64, 1.50);
	    		MoveDynamicObject(LSPD_Door[ObjectID2], 876.83, 2312.50, 1910.64, 1.50);
	    		LSPD_Door[Opened] = 1; LSPD_Door[TimerID]= SetTimer("PDDoorCheck", 3000, 0);
			}
			else
			{
		    	MoveDynamicObject(LSPD_Door[ObjectID1], 872.87, 2312.50, 1910.64, 1.50);
	    		MoveDynamicObject(LSPD_Door[ObjectID2], 875.87, 2312.50, 1910.64, 1.50);
	    		LSPD_Door[Opened] = 0; KillTimer(LSPD_Door[TimerID]);
			}
		}
		else
		{
			SendClientMessage(playerid, COLOR_GREY, "   You are not a member of the LSPD / SASD !");
			return 1;
		}
	}
	else if(buttonid == 2)
	{
	    if(IsACop(playerid) || IsAnAgent(playerid))
	    {
	    	if(LSPD_Door[Opened] == 0)
	    	{
	    		MoveDynamicObject(LSPD_Door[ObjectID1], 871.89, 2312.50, 1910.64, 1.50);
	    		MoveDynamicObject(LSPD_Door[ObjectID2], 876.83, 2312.50, 1910.64, 1.50);
	    		LSPD_Door[Opened] = 1; LSPD_Door[TimerID]= SetTimer("PDDoorCheck", 3000, 0);
			}
			else
			{
		    	MoveDynamicObject(LSPD_Door[ObjectID1], 872.87, 2312.50, 1910.64, 1.50);
	    		MoveDynamicObject(LSPD_Door[ObjectID2], 875.87, 2312.50, 1910.64, 1.50);
	    		LSPD_Door[Opened] = 0; KillTimer(LSPD_Door[TimerID]);
			}
	    }
	    else
		{
			SendClientMessage(playerid, COLOR_GREY, "   You are not a member of the LSPD / SASD !");
			return 1;
		}
	}
	if(buttonid == 3)
	{
		if(IsPlayerConnected(playerid))
	    {
		    if(Prison_Buttons[CellOpened] == 0)
		    {
		        MoveDynamicObject(Prison_Buttons[PrisonCells1], 1784.705322, -1589.811279, 1633.197510, 1.50);
				MoveDynamicObject(Prison_Buttons[PrisonCells2], 1784.613647, -1549.697021, 1633.197510, 1.50);
			    Prison_Buttons[CellOpened] = 1;
				Prison_Buttons[CellTimerID]= SetTimer("PrisonCellCheck", 30000, 0);
				return 1;
			}
	    	else if(Prison_Buttons[CellOpened] == 1)
			{
			    MoveDynamicObject(Prison_Buttons[PrisonCells1], 1784.705322, -1589.811279, 1637.197510, 1.50);
				MoveDynamicObject(Prison_Buttons[PrisonCells2], 1784.613647, -1549.697021, 1637.217896, 1.50);
				Prison_Buttons[CellOpened] = 0;
				KillTimer(Prison_Buttons[CellTimerID]);
				return 1;
			}
		}
	}
	if(buttonid == 4)
	{
		if(IsPlayerConnected(playerid))
	    {
	        if(IsACop(playerid))
	        {
			    if(DoorOpened==0)
				{
					MoveDynamicObject(door, 859.81, 2325.16, 1910.66, 3);
					chiefdoortimer = SetTimer("ClosePDDoor",3000,0);
					DoorOpened = 1;
				}
				else if(DoorOpened==1)
				{
					MoveDynamicObject(door, 861.31, 2325.16, 1910.66, 3);
					KillTimer(chiefdoortimer);
	  				DoorOpened = 0;
				}
			}
			else
			{
			    return SendClientMessage(playerid, COLOR_GREY, "   You are not a member of the LSPD / SASD !");
			}
		}
	}
	if(buttonid == 5)
	{
		if(IsPlayerConnected(playerid))
	    {
		    if(IsACop(playerid))
	        {
			    if(DoorOpened==0)
				{
					MoveDynamicObject(door, 859.81, 2325.16, 1910.66, 3);
					chiefdoortimer = SetTimer("ClosePDDoor",3000,0);
					DoorOpened = 1;
				}
				else if(DoorOpened==1)
				{
					MoveDynamicObject(door, 861.31, 2325.16, 1910.66, 3);
					KillTimer(chiefdoortimer);
	  				DoorOpened = 0;
				}
			}
			else
			{
			    return SendClientMessage(playerid, COLOR_GREY, "   You are not a member of the LSPD / SASD !");
			}
		}
	}
	return 1;
}

public hungerthrist()
{
	for(new playerid; playerid < MAX_PLAYERS; playerid++)
	{
        if(IsPlayerConnected(playerid))
        {
            if(gPlayerLogged[playerid] == 1)
            {
                if(PlayerInfo[playerid][pEnergy] > 1)
                {
	                PlayerInfo[playerid][pEnergy] -= 1;
				}
				else
				{
	                PlayerInfo[playerid][pEnergy] = 0;
				}
				if(PlayerInfo[playerid][pEnergy] < 30 && PlayerInfo[playerid][pEnergy] > 0)
			    {
		            if(PlayerInfo[playerid][pSache] == 0)
		            {
					    ApplyAnimation(playerid,"SWEET","Sweet_injuredloop", 4.0, 1, 0, 0, 0, 0);
					    SendClientMessage(playerid,COLOR_YELLOW,"[BODY] You feel so much pain in your Stomach!");
					    PlayerInfo[playerid][pSache] = 1;
				    }
			    }
			    new Float: playersHP;
				GetPlayerHealth(playerid, playersHP);
			    if(PlayerInfo[playerid][pBandageEffect] == 0)
			    {
				    for (new i = 0; i < 19; i++)
					{
						if(pBody[playerid][i] != 0 && pBody[playerid][i] < 16 || pBody[playerid][i] == 17)
						{
						    if(playersHP < 11)
							{
								SetPlayerHealth(playerid, 10.0);
							}
							else
							{
								SetPlayerHealth(playerid, playersHP - 8.0);
							}
						}
						if(pBody[playerid][i] == 16)
						{
							if(playersHP < 6)
							{
								SetPlayerHealth(playerid, 5.0);
							}
							else
							{
								SetPlayerHealth(playerid, playersHP - 3.0);
							}
							pBody[playerid][i] = 0;
						}
					}
				}
		        if(adminduty[playerid] == 0)
		        {
			        if(PlayerPaintballing[playerid] == 0)
		            {
				        if(PlayerInfo[playerid][pInjured] == 0)
					    {
                            if(PlayerInfo[playerid][pPainEffect] == 0)
                            {
								if(PlayerInfo[playerid][pSache] == 1)
								{
									ApplyAnimation(playerid,"SWEET","Sweet_injuredloop", 4.0, 1, 0, 0, 0, 0);
									SendClientMessage(playerid,COLOR_YELLOW,"[BODY] You feel so much pain in your Stomach!");
									if(playersHP <= 30) { SetPlayerHealth(playerid, 5.0); }
									else { SetPlayerHealth(playerid, playersHP - 30.0); }
								}
							}
						}
					}
				}
			}
		}
	}
	return 1;
}

public StartPaintball()
{
	PaintballRound = 1;
	StartingPaintballRound = 0;
	PaintballWinner = 999;
	PaintballWinnerKills = 0;
	event = 2;
	////foreach(Player, i)
    for(new i; i<MAX_PLAYERS; i++)
	{
	    if(IsPlayerConnected(i))
	    {
	        if(PlayerPaintballing[i] != 0)
	        {
                SetPlayerColor(i, COLOR_BLUE);
	            ResetPlayerWeapons(i);
	            GivePlayerAdminGun(i, 24);
	            GivePlayerAdminGun(i, 25);
	            GivePlayerAdminGun(i, 29);
				SetPlayerHealth(i, 100.0);
				SetPlayerArmour(i, 0.0);
	            TogglePlayerControllable(i, 1);
	            SendClientMessage(i, COLOR_YELLOW, "{AA3333}[EVENT] {FFFF00}Event telah dimulai, Target Kill 15 untuk menang !");
	            GameTextForPlayer(i, "~y~Kill Everyone !", 5000, 0);
	            PlayerPlaySound(i, 1057, 0.0, 0.0, 0.0);
	        }
	    }
	}
	return 1;
}
