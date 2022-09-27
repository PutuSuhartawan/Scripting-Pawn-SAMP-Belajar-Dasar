
stock SellBusiness(playerid, to_player = INVALID_PLAYER_ID, price = 0)
{
	new businessid = GetPlayerBusiness(playerid);

	if(businessid != -1)
	{
		new biz_price = GetBusinessData(businessid, B_PRICE);
		new biz_percent = (biz_price * 30) / 100;
		new biz_improvemnts_price = BusinessImprovementsPrice(businessid);

		if(biz_improvemnts_price)
			biz_improvemnts_price = (biz_improvemnts_price * 60) / 100;

		new query[200],
			fmt_str[200];

		new return_money = (biz_price - biz_percent) + biz_improvemnts_price;

		SetPlayerData(playerid, P_BUSINESS, 		-1);

		SetBusinessData(businessid, B_OWNER_ID, 	0);

		if(to_player == INVALID_PLAYER_ID)
		{
			AddPlayerData(playerid, P_BANK, +, return_money);

			BankLog(playerid, return_money, "Penjualan bisnis");

			SetBusinessData(businessid, B_IMPROVEMENTS, 	0);

			SetBusinessData(businessid, B_PRODS, 			0);
			SetBusinessData(businessid, B_PROD_PRICE,		0);

			SetBusinessData(businessid, B_BALANCE,			0);
			SetBusinessData(businessid, B_RENT_DATE,		0);
			SetBusinessData(businessid, B_ENTER_MUSIC,		0);
			SetBusinessData(businessid, B_LOCK_STATUS,	false);

			BusinessHealthPickupInit(businessid);

			format(query, sizeof query, "UPDATE accounts a,business b SET a.bank=%d,a.business=-1,b.owner_id=0,b.products=0,b.prod_price=0,b.lock=0 WHERE a.id=%d AND b.id=%d", GetPlayerData(playerid, P_BANK), GetPlayerAccountID(playerid), GetBusinessData(businessid, B_SQL_ID));
			mysql_query(mysql, query, false);

			format(query, sizeof query, "DELETE FROM business_gps WHERE bid=%d", businessid);
			mysql_query(mysql, query, false);

			g_business_gps_init = false;

			//format(query, sizeof query, "UPDATE business_profit SET view=0 WHERE bid=%d AND view=1", GetBusinessData(businessid, B_SQL_ID));
			//mysql_query(mysql, query, false);

			GivePlayerMoneyEx(playerid, 0, "Penjualan bisnis ke negara", false, false);
			CallLocalFunction("UpdateBusinessLabel", "i", businessid);

			format(query, sizeof query, "%s (%d) menjual bisnis %d",GetPlayerNameEx(playerid), GetPlayerAccountID(playerid), GetBusinessData(businessid, B_SQL_ID));

			format(fmt_str, sizeof fmt_str, "%s menjual bisnisnya ¹%d negara dibayar {32a44b}($%d)", GetPlayerNameEx(playerid), businessid, return_money);

			TransferCoffersMoney(-return_money, query, fmt_str, true);

			SendClientMessage(playerid, 0x32a44bFF, "Anda menjual bisnis Anda!");

			format(query, sizeof query, "Pajak atas penjualan bisnis berjumlah 30 persen dari nilainya {32a44b}($%d)", biz_percent);
			SendClientMessage(playerid, 0xCECECEFF, query);

			format(query, sizeof query, "60 persen dari biaya upgrade yang dibeli dikembalikan kepada Anda: {CCFF00}$%d", biz_improvemnts_price);
			SendClientMessage(playerid, 0xCECECEFF, query);

			format(query, sizeof query, "Total yang ditransfer ke rekening bank: {1E90FF}$%d", return_money);
			SendClientMessage(playerid, 0xFFFFFFFF, query);
		}
		else
		{
			if(BuyPlayerBusiness(to_player, businessid, true, price) == 1)
			{
				new total_price = price + biz_improvemnts_price;

				format(query, sizeof query, "60 persen dari biaya upgrade yang dibeli dikembalikan kepada Anda: {CCFF00}$%d", biz_improvemnts_price);
				SendClientMessage(playerid, 0xCECECEFF, query);

				format(query, sizeof query, "UPDATE accounts SET money=%d,business=-1 WHERE id=%d LIMIT 1", GetPlayerMoneyEx(playerid)+total_price, GetPlayerAccountID(playerid));
				mysql_query(mysql, query, false);

				format(query, sizeof query, "DELETE FROM business_gps WHERE bid=%d", businessid);
				mysql_query(mysql, query, false);

				g_business_gps_init = false;
				GivePlayerMoneyEx(playerid, total_price, "Menjual bisnis ke pemain", false, false);

				biz_price = price;
				biz_percent = 0;
			}
			else return ;
		}
		format(query, sizeof query, "~g~+$%d~n~+$%d", (biz_price - biz_percent), biz_improvemnts_price);
		GameTextForPlayer(playerid, query, 4000, 1);
	}
}
