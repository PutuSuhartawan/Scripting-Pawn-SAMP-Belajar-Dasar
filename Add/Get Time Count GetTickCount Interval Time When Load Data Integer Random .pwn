GetTickCount()

public OnPlayerConnect(playerid)
{
    new count = GetTickCount();
    //Rest of OnPlayerConnect
    printf("Time taken to execute OnPlayerConnect: %d", GetTickCount() - count);
    return 1;
}

new gPlayerAllowedTick[MAX_PLAYERS];
 
OnPlayerInteractWithServer(playerid)
{
    if(tickcount() - gPlayerAllowedTick[playerid] > 10000)
    // This only works when the current tick minus the last tick is above 10000.
    // In other words, it only works when the interval between the actions is over 10 seconds.
    {
        DoTheThingThePlayerRequested();
        gPlayerAllowedTick[playerid] = tickcount(); // Update the tick count with the latest time.
 
        return 1;
    }
    else
    {
        SendClientMessage(playerid, -1, "You are not allowed to do that yet!");
 
        return 0;
    }
}

new
    gPlayerStopWatchTick[MAX_PLAYERS];
 
StartPlayerRace(playerid)
{
    gPlayerStopWatchTick[playerid] = tickcount();
}
 
OnPlayerFinishRace(playerid)
{
    new
        interval,
        str[128];
 
    interval = tickcount() - gPlayerStopWatchTick[playerid];
 
    format(str, 128, "You took %d milliseconds to do that", interval);
    SendClientMessage(playerid, -1, str);
}



stock SaveAllServers()
{
	new time = GetTickCount();

    SaveHouseAll();
    SaveBizzAll();
    SaveABizzAll();
    return printf("[MySQL R41-3]: Semua data server berhasil disimpan untuk %d ms.", GetTickCount()-time);
}


stock CheckPlayerFlood(playerid, bool:inc = true, max_rate = MAX_FLOOD_RATE, rate_inc = FLOOD_RATE_INC, kick_rate = FLOOD_RATE_KICK)
{
	new tick = GetTickCount();

	AddPlayerAntiFloodData(playerid, AF_RATE, +, inc ? rate_inc : 0);
	AddPlayerAntiFloodData(playerid, AF_RATE, -, (GetTickCount() - GetPlayerAntiFloodData(playerid, AF_LAST_TICK)));
	SetPlayerAntiFloodData(playerid, AF_LAST_TICK, tick);

	if(GetPlayerAntiFloodData(playerid, AF_RATE) < 0)
		SetPlayerAntiFloodData(playerid, AF_RATE, 0);

	if(GetPlayerAntiFloodData(playerid, AF_RATE) >= max_rate)
	{
		if(GetPlayerAntiFloodData(playerid, AF_RATE) >= kick_rate)
		{
			KickD(playerid, "Kamu ditendang karena banyak bacot.");
		}
		return 1;
	}
	return 0;
}


SetPlayerSpawn(playerid)
{
	if(IsPlayerConnected(playerid))
	{
		if(pData[playerid][pGender] == 0)
		{
			TogglePlayerControllable(playerid,0);
			SetPlayerHealth(playerid, 100.0);
			SetPlayerArmour(playerid, 0.0);
			SetPlayerPos(playerid, 1716.1129, -1880.0715, -10.0);
			InterpolateCameraPos(playerid, 1330.757080, -1732.019042, 23.432754, 1484.328125, -1716.528442, 23.261428, 20000);
			InterpolateCameraLookAt(playerid, 1335.739990, -1732.224365, 23.073688, 1483.968627, -1721.461547, 23.993165, 19000);
			SetPlayerVirtualWorld(playerid, 0);
			ShowPlayerDialog(playerid, DIALOG_AGE, DIALOG_STYLE_INPUT, "Tanggal Lahir", "Masukan tanggal lahir (Tgl/Bulan/Tahun): 15/04/1998", "Enter", "Batal");
		}
		else
		{
			SetPlayerColor(playerid, COLOR_WHITE);
			if(pData[playerid][pHBEMode] == 1) //simple
			{
				PlayerTextDrawShow(playerid, DigiHunger[playerid]);
				PlayerTextDrawShow(playerid, DigiEnergi[playerid]);
				PlayerTextDrawShow(playerid, DigiBladdy[playerid]);
				for(new txd; txd < 9; txd++)
				{
					TextDrawShowForPlayer(playerid, DGhudchar[txd]);
				}
			}
			if(pData[playerid][pHBEMode] == 2) //modern
			{
				ShowPlayerProgressBar(playerid, pData[playerid][hungrybar]);
				ShowPlayerProgressBar(playerid, pData[playerid][energybar]);
				ShowPlayerProgressBar(playerid, pData[playerid][bladdybar]);
				TextDrawShowForPlayer(playerid, CharBox);
				PlayerTextDrawSetPreviewModel(playerid, HBEO[playerid], GetPlayerSkin(playerid));
				PlayerTextDrawShow(playerid, HBEO[playerid]);
				for(new txd; txd < 5; txd++)
				{
					TextDrawShowForPlayer(playerid, HudChar[txd]);
				}
			}
			if(pData[playerid][pTDMode] == 1) //simple
			{
				TextDrawShowForPlayer(playerid, DigiHP[playerid]);
				TextDrawShowForPlayer(playerid, DigiAP[playerid]);
				for(new idx; idx < 5; idx++)
				{
					TextDrawShowForPlayer(playerid, DigiHPTD[idx]);
				}
				TextDrawShowForPlayer(playerid, TextDate);
				TextDrawShowForPlayer(playerid, TextTime);
				TextDrawShowForPlayer(playerid, TDTime[0]);
				TextDrawShowForPlayer(playerid, TDTime[1]);
				TextDrawShowForPlayer(playerid, ServerName);
			}
			if(pData[playerid][pTDMode] == 2) //bar
			{
				ShowPlayerProgressBar(playerid, pData[playerid][BarHp]);
				ShowPlayerProgressBar(playerid, pData[playerid][BarArmour]);

				PlayerTextDrawShow(playerid, PreviuwModelBarHp[playerid]);
				PlayerTextDrawShow(playerid, PreviewModelBarArmour[playerid]);
				PlayerTextDrawShow(playerid, BoxBarArmour[playerid]);
				PlayerTextDrawShow(playerid, BoxBarHp[playerid]);
				TextDrawShowForPlayer(playerid, TextDate);
				TextDrawShowForPlayer(playerid, TextTime);
				TextDrawShowForPlayer(playerid, TDTime[0]);
				TextDrawShowForPlayer(playerid, TDTime[1]);
				TextDrawShowForPlayer(playerid, ServerName);
			}
			SetPlayerSkin(playerid, pData[playerid][pSkin]);
			if(pData[playerid][pOnDuty] >= 1)
			{
				SetPlayerSkin(playerid, pData[playerid][pFacSkin]);
				SetFactionColor(playerid);
			}
			if(pData[playerid][pAdminDuty] > 0)
			{
				SetPlayerColor(playerid, COLOR_RED);
			}
			new count = random(1500);
		SendClientMessageEx(playerid, COLOR_ARWIN, "NOTE: "WHITE_E"Server memerlukan waktu "YELLOW_E"%d miliseconds "WHITE_E"untuk memuat data char anda", count);
			SetTimerEx("SpawnTimer", 6000, false, "i", playerid);
		}
	}
}


