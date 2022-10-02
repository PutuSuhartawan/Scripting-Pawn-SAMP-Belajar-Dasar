
stock GivePlayerMoneyEx(playerid, money, description[]="None", bool:save=true, bool:game_text=true)
{
	if(money < 0 && GetPlayerMoneyEx(playerid) < money) return -1;

	new fmt_str[185];
	AddPlayerData(playerid, P_MONEY, +, money);
	GivePlayerMoney(playerid, money);

	format(fmt_str, sizeof fmt_str, "INSERT INTO money_log (uid,uip,time,money,description) VALUES (%d,'%s',%d,%d,'%s')", GetPlayerAccountID(playerid), GetPlayerIpEx(playerid), gettime(), money, description);
	mysql_query(mysql, fmt_str, false);

	if(save) save = false;

	format(fmt_str, sizeof fmt_str, "UPDATE accounts SET money=%d WHERE id=%d LIMIT 1", GetPlayerMoneyEx(playerid), GetPlayerAccountID(playerid));
	mysql_query(mysql, fmt_str, false);

	if(game_text)
	{
		format(fmt_str, sizeof fmt_str, "%s$%d", money < 0 ? ("~r~") : ("~g~+"), money);
		GameTextForPlayer(playerid, fmt_str, 4000, 1);
	}

	return 1;
}
