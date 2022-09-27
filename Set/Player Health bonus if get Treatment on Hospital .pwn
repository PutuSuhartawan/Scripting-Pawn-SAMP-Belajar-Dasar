
public: HospitalTreatment()
{
	for(new playerid; playerid < MAX_PLAYERS; playerid ++)
	{
		if(!IsPlayerConnected(playerid)) continue;
		else if(!IsPlayerLogged(playerid)) continue;
		else if(GetPlayerData(playerid, P_OCCUPIED_BED) == -1) continue;
		SendClientMessage(playerid, -1, "Sebelum memeriksa radius");
		if(!IsPlayerInRangeOfPoint(playerid, 170.0, 1362.7057,-166.8792,967.5167)) return ClearMedBed(playerid, GetPlayerData(playerid, P_OCCUPIED_BED));
		if(GetPlayerPremium(playerid) <= 0)
		{
		    SendClientMessage(playerid, -1, "Jika anda tidak VIP, maka kami memberikan 1 hp");
			GameTextForPlayer(playerid, "~g~~h~~h~+ 10 HP", 1000, 4);
			SetPlayerChatBubble(playerid, "+1 hp", 0x33CC33FF, 5.0, 1000);
			new Float:gethp;
			GetPlayerHealth(playerid, gethp);
			SetPlayerHealth(playerid, gethp +10);
		}
        if(GetPlayerPremium(playerid) > 1)
		{
		    SendClientMessage(playerid, -1, "Jika anda vip, maka kami berikan 2 hp");
			GameTextForPlayer(playerid, "~g~~h~~h~+ 2 HP", 1000, 4);
			SetPlayerChatBubble(playerid, "+2 hp", 0x33CC33FF, 5.0, 1000);
			new Float:gethp;
			GetPlayerHealth(playerid, gethp);
			SetPlayerHealthEx(playerid, gethp +20);
		}
		new Float:heal;
		GetPlayerHealth(playerid, heal);
		if(heal >= 70.0)
		{

			SendClientMessage(playerid, 0x32a44bFF, "Perawatan selesai");
			SendClientMessage(playerid, -1, "Anda keluar dari rumah sakit");
			ClearMedBed(playerid, GetPlayerData(playerid, P_OCCUPIED_BED));
			SetPlayerChatBubble(playerid, "Habis", 0x32a44bFF, 10.0, 2000);
			new query[90];
			SetPlayerData(playerid, P_HOSPITAL, false);
			mysql_format(mysql, query, sizeof query, "UPDATE accounts SET hospital=0 WHERE id=%d LIMIT 1", GetPlayerAccountID(playerid));
			mysql_query(mysql, query, false);
		    return 1;
		}
	}
	SetTimer("HospitalTreatment", (random(5) + 1) * 1000, false);
	return 1;
}
