stock ShowPlayerOwnedBTC(playerid)
{
	new tmp_btc[1560];
	format
	(
	    tmp_btc,
	    sizeof(tmp_btc),
	    "\n\n{FFFFFF}DabaseID\t\t%d%s\t%s\n\
		{FFFFFF}Balance\t\t%f%s\t%s\n\n",
	    GetPlayerAccountID(playerid), " With status registered",
	    GetSkillBar(playerid),
	    g_player[playerid][P_BTC], " BTC",
		GetSkillBar(GetPlayerData(playerid, P_BTC))
	);
	Dialog(playerid, INVALID_DIALOG_ID, DIALOG_STYLE_MSGBOX, "BTC owned info", tmp_btc, "close", "");

	return 1;
}
