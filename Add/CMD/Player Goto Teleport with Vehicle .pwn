
CMD:goto(playerid, params[])
{
	if(GetPlayerAdminEx(playerid) < 3) return 1;
	if(GetPlayerData(playerid, P_ADMIN_DUTY) == 0) return SendClientMessage(playerid,-1,"{00ff00}Kamu Sedang Tidak OnDuty Admin /aduty untuk OnDuty");

	extract params -> new to_player; else return SendClientMessage(playerid, 0xCECECEFF, "Gunakan: /goto [id pemain]");

	if(!IsPlayerConnected(to_player) || !IsPlayerLogged(to_player))
		return SendClientMessage(playerid, 0xCECECEFF, "Tidak ada pemain seperti itu");

	new Float: x, Float: y, Float: z, interior, virtual_world;
	GetPlayerPos(to_player, x, y, z);
	interior = GetPlayerInterior(to_player);
	virtual_world = GetPlayerVirtualWorld(to_player);

	SetPlayerPosEx(playerid, x + 1, y + 1, z, 0.0, interior, virtual_world, false);
    new vehicleid = GetPlayerVehicleID(playerid);
    if(vehicleid > 0 && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
    {
                SetVehiclePos(vehicleid,  x + 1, y + 1, z);
    }
        
	SetPlayerInHouse(playerid, GetPlayerInHouse(to_player));
	SetPlayerInBiz(playerid, GetPlayerInBiz(to_player));

	SendClientMessage(playerid, -1, "Anda telah diteleportasi");

	new fmt_msg[105];

	if(GetPlayerAdminEx(playerid) <= 5)
	{
		format(fmt_msg, sizeof fmt_msg, "[A] %s %s[%d] teleport ke %s[%d]", admins_rank_name[GetPlayerAdminEx(playerid)], GetPlayerNameEx(playerid), playerid, GetPlayerNameEx(to_player), to_player);
		SendMessageToAdmins(fmt_msg, 0xCECECEFF);
	}

	format(fmt_msg, sizeof fmt_msg, "Teleport ke %s[acc:%d]", GetPlayerNameEx(to_player), GetPlayerAccountID(to_player));
	SendLog(playerid, LOG_TYPE_ADMIN_ACTION, fmt_msg);

	return 1;
}
