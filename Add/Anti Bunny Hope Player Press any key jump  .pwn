public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{

if((newkeys & KEY_JUMP) && !IsPlayerInAnyVehicle(playerid))
    {
        AntiBunnyHopping[playerid] ++;
        SetTimerEx("SelesaiLoncat", 10000, false, "i", playerid);

        if(AntiBunnyHopping[playerid] == 2)
        {
            ApplyAnimation(playerid, "PED", "BIKE_fall_off", 4.1, 0, 1, 1, 1, 0, 1);
            new string[100], pName[MAX_PLAYER_NAME];
			GetPlayerName(playerid,pName,MAX_PLAYER_NAME);
  		  	format(string,sizeof string,"%s Anda Telah Melakukan Bunny Hopping Mohon Bersabar!!!.",pName);
			SendClientMessage(playerid, 0x8DC43CC8, string);
			GameTextForPlayer(playerid,"~r~Stop Bunny Hopping!",3000,0);
			SetTimerEx("AntiBH", 5000, false, "i", playerid);
        }
    }
    
  }
