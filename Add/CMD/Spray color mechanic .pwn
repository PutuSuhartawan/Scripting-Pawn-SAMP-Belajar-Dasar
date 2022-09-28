
CMD:spray(playerid, params[])
{
    if(GetPlayerTeamEx(playerid) != TEAM_MECHANIC)
		return SendClientMessage(playerid, 0xCECECEFF, "Anda bukan organisasi mechanic");
	{
		new string[128], pName[MAX_PLAYER_NAME], mName[MAX_PLAYER_NAME], pID;
	 	GetPlayerName(pID, pName, sizeof(pName));
		GetPlayerName(playerid, mName, sizeof(mName));
		if(sscanf(params, "uii", pID, pick, color)) return SendClientMessage(playerid, -1, "USAGE: /spray [Id/Nama][Warna (1/2)][Warna]");
		if(pick > 2 || pick < 1) return SendClientMessage(playerid, COLOR_RED,"Pilih Antara Angka 1 Dan 2.");
		if(color > 126 || color < 0) return SendClientMessage(playerid, COLOR_RED,"Warna Hanya 0 sampai 126.");
		vehid = GetPlayerVehicleID(pID);
        ChangeVehicleColor( vehid, pick, color);
		format(string, sizeof(string), "%s Mewarnai Kendaraan. Colorpick: {FFFFFF}%d{468CFF}, ColorID: {FFFFFF}%d", mName, pick, color);
		SendClientMessage(pID, COLOR_LIGHTBLUE, string);
		SendClientMessage(pID, COLOR_LIGHTBLUE, "Use /acceptbody untuk menerima.");
		Service[pID][0] = 1;
	}
	return 1;
}
