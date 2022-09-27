
stock ShowPlayerOwnedBTC(playerid)
{
	new tmp_btc[1560];
	format
	(
	    tmp_need,
	    sizeof(tmp_need),
	    "\n\n{FFFFFF}DabaseID\t\t%d%s\t%s\n\
		{FFFFFF}BTC\t\t%d%s\t%s\n\n",
	    GetPlayerAccountID(playerid), "Updated",
	    GetSkillBar(GetPlayerData(playerid, P_ACCOUNT_ID)),
	    g_player[playerid][P_BTC], "On Database",
		GetSkillBar(GetPlayerData(playerid, P_BTC))
	);
	Dialog(playerid, INVALID_DIALOG_ID, DIALOG_STYLE_MSGBOX, "BTC owned info", tmp_btc, "close", "");

	return 1;
}
