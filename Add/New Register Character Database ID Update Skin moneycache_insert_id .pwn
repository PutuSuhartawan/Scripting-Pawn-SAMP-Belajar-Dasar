
stock BuyOwnableCar(playerid, marketid, ownablecar, color_1, color_2)
{
	RemovePlayerFromVehicle(playerid);
    new modelid, query[256], time = gettime();
 	printf("player_cars: %d / player_slots: %d", GetPlayerOwnableCars(playerid), GetPlayerCarSlots(playerid));

	printf("BuyOwnableCar(%d, %d, %d, %d, %d)", playerid, marketid, ownablecar, color_1, color_2);

	if(ownablecar < 1000)
		modelid = car_market_data[marketid][ownablecar][0];
	else
		modelid = ownablecar - 1000;

	if(marketid != 0 && marketid != 2)
	{
		if(GetPlayerHouse(playerid, HOUSE_TYPE_HOME) == -1 &&
		GetPlayerHouse(playerid, HOUSE_TYPE_HOTEL) == -1 &&
		GetPlayerHouse(playerid, HOUSE_TYPE_ROOM) == -1)
		{
			SendClientMessage(playerid, 0xCECECEFF, "Untuk membeli kendaraan dari kelas ini, Anda harus memiliki real estat");
			return -1;
		}
	}
	/*
	if(GetPlayerOwnableCar(playerid) != INVALID_VEHICLE_ID)
	{
		SendClientMessage(playerid, 0xCECECEFF, "Untuk membeli transportasi, Anda harus mengurangi jumlah kendaraan yang sudah spawn dari server dan slot kendaraannya yang dimiliki kosong.");
		return -1;
	}
	*/

	if(GetPlayerMoneyEx(playerid) < GetVehicleInfo(modelid - 400, VI_PRICE)*3)
	{
		SendClientMessage(playerid, 0xCECECEFF, "Tidak cukup uang untuk membeli kendaraan ini");
		return -1;
	}

	GivePlayerMoneyEx(playerid, -GetVehicleInfo(modelid - 400, VI_PRICE)*3, "Membeli kendaraan di dealer mobil", true, true);


	new biz_id = marketid + 27,
	take_prods = random(5) + 6;

	if(GetBusinessData(biz_id, B_PRODS) >= take_prods)
	{
		AddBusinessData(biz_id, B_PRODS, -, take_prods);
		AddBusinessData(biz_id, B_BALANCE, +, (GetVehicleInfo(modelid - 400, VI_PRICE) * 20 / 100));
		AddBusinessData(biz_id, B_BALANCE_DAY, +, (GetVehicleInfo(modelid - 400, VI_PRICE) * 20 / 100));

		format(query, sizeof query, "UPDATE business SET balance=%d WHERE id=%d LIMIT 1", GetBusinessData(biz_id, B_BALANCE), GetBusinessData(biz_id, B_SQL_ID));
		mysql_query(mysql, query, false);


		mysql_format(mysql, query, sizeof query, "INSERT INTO business_profit (bid,uid,uip,time,money,view) VALUES (%d,%d,'%e',%d,%d,%d)", GetBusinessData(biz_id, B_SQL_ID), GetPlayerAccountID(playerid), GetPlayerIpEx(playerid), time, (GetVehicleInfo(modelid - 400, VI_PRICE) * 20 / 100), IsBusinessOwned(biz_id));
		mysql_query(mysql, query, false);
	}

  	TransferCoffersMoney((GetVehicleInfo(modelid - 400, VI_PRICE) * 80 / 100), "Pembelian mobil", "", false);

	new buy_cars_count = cars_after_purchase_count[marketid]++;

	if(buy_cars_count >= 3)
		cars_after_purchase_count[marketid] = 0;

	new Float: pos_x = cars_pos_after_purchase[marketid][buy_cars_count][0];
	new Float: pos_y = cars_pos_after_purchase[marketid][buy_cars_count][1];
	new Float: pos_z = cars_pos_after_purchase[marketid][buy_cars_count][2];
	new Float: angle = cars_pos_after_purchase[marketid][buy_cars_count][3];

	new Cache: result,
		idx;

	idx = GetFreeOwnableCarID();

	SetOwnableCarData(idx, OC_OWNER_ID, 	GetPlayerAccountID(playerid));

	SetOwnableCarData(idx, OC_MODEL_ID, 	modelid);
	SetOwnableCarData(idx, OC_COLOR_1, 		color_1);
	SetOwnableCarData(idx, OC_COLOR_2, 		color_2);

	SetOwnableCarData(idx, OC_POS_X, 		pos_x);
	SetOwnableCarData(idx, OC_POS_Y, 		pos_y);
	SetOwnableCarData(idx, OC_POS_Z, 		pos_z);
	SetOwnableCarData(idx, OC_ANGLE, 		angle);

	strmid(g_ownable_car[idx][OC_NUMBER], "------", 0, 8, 8);

	SetOwnableCarData(idx, OC_KEY_IN, 		false);

	SetOwnableCarData(idx, OC_CREATE, 		gettime());

	SetOwnableCarData(idx, OC_FUEL, 		50.0);

	format(g_ownable_car[idx][OC_OWNER_NAME], 21, GetPlayerNameEx(playerid));
	// ----------------------------------------------------------------------------------------

	new vehicleid = CreateVehicle
	(
		GetOwnableCarData(idx, OC_MODEL_ID),
		GetOwnableCarData(idx, OC_POS_X),
		GetOwnableCarData(idx, OC_POS_Y),
		GetOwnableCarData(idx, OC_POS_Z),
		GetOwnableCarData(idx, OC_ANGLE),
		GetOwnableCarData(idx, OC_COLOR_1),
		GetOwnableCarData(idx, OC_COLOR_2),
		-1,
		0,
		VEHICLE_ACTION_TYPE_OWNABLE_CAR,
		idx
	);
	if(vehicleid != INVALID_VEHICLE_ID)
	{
		CreateVehicleLabel(vehicleid, GetOwnableCarData(idx, OC_NUMBER), 0xFFFF00EE, 0.0, 0.0, 1.3, 20.0);
		SetVehicleParam(vehicleid, V_LOCK, false);

		SetVehicleData(vehicleid, V_MILEAGE, 0.0);
		SetVehicleData(vehicleid, V_FUEL, 50.0);
	}
	SetPlayerData(playerid, P_OWNABLE_CAR, vehicleid);
	format
	(
		query, sizeof query,
		"INSERT INTO ownable_cars \
		(owner_id,model_id,color_1,color_2,pos_x,pos_y,pos_z,angle,create_time) \
		VALUES \
		('%d','%d','%d','%d','%f','%f','%f','%f','%d')",
		GetPlayerAccountID(playerid),
		modelid,
		color_1,
		color_2,
		pos_x,
		pos_y,
		pos_z,
		angle,
		gettime()
	);
	result = mysql_query(mysql, query, true);

	SetOwnableCarData(idx, OC_SQL_ID, cache_insert_id());
	cache_delete(result);

	SendClientMessage(playerid, 0x32a44bFF, "Selamat atas pembelian kendaraan baru Anda.!");
	SendClientMessage(playerid, -1, "Anda dapat meningkatkan mobil Anda! Masuk {ffff00}/car {ffffff} dan tingkatkan sekarang");

	return 1;
}


stock CreatePlayerAccount(playerid)
{
	new query[512];
	new Cache: result;

	new time = gettime();

	SetPlayerData(playerid, P_REG_TIME, time);
	SetPlayerData(playerid, P_LAST_LOGIN_TIME, time);

	format(g_player[playerid][P_REG_IP], 16, "%s", GetPlayerIpEx(playerid));
	format(g_player[playerid][P_LAST_IP], 16, "%s", GetPlayerIpEx(playerid));

	mysql_format
	(
		mysql, query, sizeof query,
		"INSERT INTO accounts "\
			"(name,password,email,refer,sex,reg_time,reg_ip,last_ip,last_login) "\
			"VALUES "\
			"('%e',MD5('%e'),'%e',%d,%d,%d,'%e','%e',%d)",
		GetPlayerNameEx(playerid),
		GetPlayerData(playerid, P_PASSWORD),
		GetPlayerData(playerid, P_EMAIL),
		GetPlayerData(playerid, P_REFER),
		GetPlayerData(playerid, P_SEX),
		GetPlayerData(playerid, P_REG_TIME),
		GetPlayerData(playerid, P_REG_IP),
		GetPlayerData(playerid, P_LAST_IP),
		GetPlayerData(playerid, P_LAST_LOGIN_TIME)
	);
	result = mysql_query(mysql, query);

	SetPlayerData(playerid, P_ACCOUNT_ID, cache_insert_id());
	cache_delete(result);

	return GetPlayerAccountID(playerid);
}


public OnPlayerSpawn(playerid)
{
    SetPlayerChatBubble(playerid, "**Datang mengunjungi anda**", 0xFF5533FF, 10.5, 5000);
    SetCameraBehindPlayer(playerid);
	TogglePlayerControllable(playerid, true);
    TogglePlayerSpectating(playerid, false);
	SetPlayerAttachedObject(playerid, 5, 3026, 1,-0.1, -0.1, 0.0, 0.0, 0.0, 0.0, 1, 1, 1, 0xFF00FF00);
    GameTextForPlayer(playerid, "~r~Verfication Complete...", 3000, 3);
    TextDrawHideForPlayer(playerid, TakeDamage[playerid]);
    StopAudioStreamForPlayer (playerid);

	TwData[playerid][LoggedIn] = 1;
	LoadTwitter(playerid);

	CheckPlayerFlood(playerid, true, MAX_FLOOD_RATE, 500, FLOOD_RATE_KICK);
	SetPlayerData(playerid, P_IN_HOUSE, 		-1);
	SetPlayerData(playerid, P_IN_BUSINESS, 		-1);
	SetPlayerData(playerid, P_IN_HOTEL_FLOOR, 	-1);
	SetPlayerData(playerid, P_IN_HOTEL_ROOM, 	-1);

	SetPlayerSkillsInit(playerid);

	if(!IsPlayerLogged(playerid))
	{
	    SendClientMessage(playerid, 0xCECECEFF, "Karakter yang anda pakai terspawnkan. Namun akun ini harus login segera.");
	    //CheckPlayerAccount(playerid, mysql_race[playerid]); // check data login
		if(GetPlayerData(playerid, P_ACCOUNT_STATE) == ACCOUNT_STATE_REG_SKIN)
		{
			//new sex = bool: GetPlayerSex(playerid);

			if(!IsPlayerLogged(playerid))
			{
				if(GetPlayerData(playerid, P_ACCOUNT_STATE) == ACCOUNT_STATE_REG_SKIN)
				{
				    CreatePlayerAccount(playerid);
					new sex = GetPlayerSex(playerid);

					switch(sex)
					{
						case 0: SetPlayerData(playerid, P_SKIN, 46);
						default: SetPlayerData(playerid, P_SKIN, 56);
					}

					new query[90];
					mysql_format(mysql, query, sizeof query, "UPDATE accounts SET skin=%d,last_login=%d WHERE id=%d LIMIT 1", GetPlayerSkinEx(playerid), gettime(), GetPlayerAccountID(playerid));
					mysql_query(mysql, query, false);
					SendClientMessage(playerid, 0xCECECEFF, query);
         }
         
   }
