// plugin YSF from https://github.com/IllidanS4/YSF/releases
// please select DL or 37 version plugin first


CMD:desveh(playerid, params[])
{
	if(PlayerInfo[playerid][AdminLevel] >= 8)
	{
		new carid;
		if(sscanf(params, "d", carid)) return SendClientMessage(playerid, TRANSPARENT_RED, "KEGUNAAN: /desveh [carid]");

		//DestroyVehicle(carid);
		SetVehicleDead(carid, true); // this only from plugin
		SendClientMessage(playerid, TRANSPARENT_BLUE, "   You have been destroy vehicle target");
		
	}
	else
	{
		SendClientMessage(playerid, TRANSPARENT_RED, "ERROR: You don't have the privilege to use this command!");
	}
	return 1;
}


