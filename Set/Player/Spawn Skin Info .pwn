
// ------------------------------------------
#define GetPlayerData(%0,%1) 	g_player[%0][%1]
#define SetPlayerData(%0,%1,%2)	g_player[%0][%1] = %2
#define AddPlayerData(%0,%1,%2,%3) g_player[%0][%1] %2= %3


// ------------------------------------------
enum E_PLAYER_STRUCT // struktur pemain
{
	P_ACCOUNT_ID, 	// id akun
	float:P_BTC, // jumlah asset BTC
	P_REFER,		// referensi
	P_SEX,			// jenis kelamin pemain
	P_PASSWORD[64], // kata sandi pemain
	P_EMAIL[60 + 1],// email pemain
	bool: P_CONFIRM_EMAIL,// apakah email diverifikasi
	P_SKIN,			// kulit pemain
	P_PASS,         // Paspor
	P_MONEY,		// uang pemain
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
					new sex = GetPlayerSex(playerid);

					switch(sex)
					{
						case 0: SetPlayerData(playerid, P_SKIN, 46);
						default: SetPlayerData(playerid, P_SKIN, 56);
					}
          
        }
        
    }
    
    
 }
 
 
 
public: LoadPlayerData(playerid)
{
	new query[128];
	new Cache: result;
	mysql_format(mysql, query, sizeof query, "SELECT * FROM accounts WHERE id=%d LIMIT 1", GetPlayerAccountID(playerid));
	result = mysql_query(mysql, query);

	if(cache_num_rows())
	{
		new
			buffer = 0,
			time = gettime();

		cache_get_field_content(0, "email", g_player[playerid][P_EMAIL], mysql, 61);
		SetPlayerData(playerid, P_CONFIRM_EMAIL, bool: cache_get_field_content_int(0, "confirm_email"));

		SetPlayerData(playerid, P_REFER, 	cache_get_field_content_int(0, "refer"));
		SetPlayerData(playerid, P_SEX, 		bool: cache_get_field_content_int(0, "sex"));
		SetPlayerData(playerid, P_SKIN, 	cache_get_field_content_int(0, "skin"));
		SetPlayerData(playerid, P_MONEY, 	cache_get_field_content_int(0, "money"));
		SetPlayerData(playerid, P_BANK, 	cache_get_field_content_int(0, "bank"));
		SetPlayerData(playerid, P_ADMIN, 	cache_get_field_content_int(0, "admin"));

		SetPlayerData(playerid, P_DRIVING_A, 	cache_get_field_content_int(0, "driving_a"));
		SetPlayerData(playerid, P_DRIVING_B, 	cache_get_field_content_int(0, "driving_b"));
		SetPlayerData(playerid, P_DRIVING_C, 	cache_get_field_content_int(0, "driving_c"));
		SetPlayerData(playerid, P_DRIVING_D, 	cache_get_field_content_int(0, "driving_d"));
		SetPlayerData(playerid, P_LIC_FLY, 		cache_get_field_content_int(0, "lic_fly"));
		SetPlayerData(playerid, P_LIC_WATER, 	cache_get_field_content_int(0, "lic_water"));
		SetPlayerData(playerid, P_LIC_BIZ, 		cache_get_field_content_int(0, "lic_biz"));
		SetPlayerData(playerid, P_LIC_WEAPON, 	cache_get_field_content_int(0, "lic_weapon"));

		SetPlayerData(playerid, P_SUSPECT, 		cache_get_field_content_int(0, "suspect"));
		SetPlayerData(playerid, P_PHONE, 		cache_get_field_content_int(0, "phone"));
		SetPlayerData(playerid, P_PHONE_BALANCE,cache_get_field_content_int(0, "phone_balance"));
		SetPlayerData(playerid, P_PHONE_COLOR,	cache_get_field_content_int(0, "phone_color"));

		SetPlayerData(playerid, P_LAW_ABIDING,	cache_get_field_content_int(0, "law_abiding"));
		SetPlayerData(playerid, P_IMPROVEMENTS, cache_get_field_content_int(0, "improvements"));
		SetPlayerData(playerid, P_POWER, 		cache_get_field_content_int(0, "power"));

		SetPlayerData(playerid, P_DRUGS, 		cache_get_field_content_int(0, "drugs"));
		SetPlayerData(playerid, P_AMMO, 		cache_get_field_content_int(0, "ammo"));
		SetPlayerData(playerid, P_METALL, 		cache_get_field_content_int(0, "metall"));
		SetPlayerData(playerid, P_WIFE, 		cache_get_field_content_int(0, "wife"));
		SetPlayerData(playerid, P_TEAM, 		cache_get_field_content_int(0, "team"));
		SetPlayerData(playerid, P_SUBDIVISON,	cache_get_field_content_int(0, "subdivison"));
		SetPlayerData(playerid, P_WAGE,			cache_get_field_content_int(0, "wage"));
		SetPlayerData(playerid, P_JOB, 			cache_get_field_content_int(0, "job"));

		SetPlayerData(playerid, P_HOUSE_TYPE,	cache_get_field_content_int(0, "house_type"));
		SetPlayerData(playerid, P_HOUSE_ROOM,	cache_get_field_content_int(0, "house_room"));
		SetPlayerData(playerid, P_HOUSE, 		cache_get_field_content_int(0, "house"));
		SetPlayerData(playerid, P_BUSINESS,		cache_get_field_content_int(0, "business"));
		SetPlayerData(playerid, P_FUEL_ST,		cache_get_field_content_int(0, "fuel_st"));
		SetPlayerData(playerid, P_ADMIN_WARN,		cache_get_field_content_int(0, "admin_warn"));

		SetPlayerData(playerid, P_FIGHT_STYLE_BOXING,		cache_get_field_content_int(0, "fight_1"));
		SetPlayerData(playerid, P_FIGHT_STYLE_KUNGFU,		cache_get_field_content_int(0, "fight_2"));
		SetPlayerData(playerid, P_FIGHT_STYLE_KNEEHEAD,		cache_get_field_content_int(0, "fight_3"));
		SetPlayerData(playerid, P_FIGHT_STYLE_GRABKICK,		cache_get_field_content_int(0, "fight_4"));
		SetPlayerData(playerid, P_FIGHT_STYLE_ELBOW,		cache_get_field_content_int(0, "fight_5"));

		SetPlayerData(playerid, P_PASS_PHOTO,		cache_get_field_content_int(0, "photo"));
		SetPlayerData(playerid, P_PASS,				cache_get_field_content_int(0, "pass"));
		SetPlayerData(playerid, P_PASS_CASH,		cache_get_field_content_int(0, "toll"));
		SetPlayerData(playerid, P_MED_REFERENCE,	cache_get_field_content_int(0, "med"));

		SetPlayerData(playerid, P_LAST_X,	cache_get_field_content_float(0, "last_x"));
		SetPlayerData(playerid, P_LAST_Y,	cache_get_field_content_float(0, "last_y"));
		SetPlayerData(playerid, P_LAST_Z,	cache_get_field_content_float(0, "last_z"));
		SetPlayerData(playerid, P_LAST_FA,	cache_get_field_content_float(0, "last_fa"));


		SetPlayerData(playerid, P_REG_TIME, 	cache_get_field_content_int(0, "reg_time"));
		cache_get_field_content(0, "reg_ip", g_player[playerid][P_REG_IP], mysql, 16);

		buffer = SetPlayerData(playerid, P_LAST_LOGIN_TIME,	cache_get_field_content_int(0, "last_login"));
		SetPlayerData(playerid, P_GAME_FOR_DAY,			cache_get_field_content_int(0, "game_for_day"));
		SetPlayerData(playerid, P_GAME_FOR_DAY_PREV,	cache_get_field_content_int(0, "game_for_day_prev"));

		buffer = GetElapsedTime(time, buffer, CONVERT_TIME_TO_DAYS);
		if(buffer == 1)
		{
			SetPlayerData(playerid, P_GAME_FOR_DAY_PREV, GetPlayerData(playerid, P_GAME_FOR_DAY));
			SetPlayerData(playerid, P_GAME_FOR_DAY, 0);
		}
		else if(buffer > 1)
		{
			SetPlayerData(playerid, P_GAME_FOR_DAY, 0);
			SetPlayerData(playerid, P_GAME_FOR_DAY_PREV, 0);
		}

		SetPlayerSettingData(playerid, S_TEAM_CHAT, 	cache_get_field_content_int(0, "setting1"));
		SetPlayerSettingData(playerid, S_CHANGE_NAME, 	cache_get_field_content_int(0, "setting3"));

		SetPlayerData(playerid, P_WARN, 				cache_get_field_content_int(0, "warn"));
		SetPlayerData(playerid, P_WARN_TIME,			cache_get_field_content_int(0, "warn_time"));
		SetPlayerData(playerid, P_MUTE, 				cache_get_field_content_int(0, "mute"));

		SetPlayerData(playerid, P_SKILL_COLT, 			cache_get_field_content_int(0, "skill_colt"));
		SetPlayerData(playerid, P_SKILL_SDPISTOL,		cache_get_field_content_int(0, "skill_sdpistol"));
		SetPlayerData(playerid, P_SKILL_DEAGLE, 		cache_get_field_content_int(0, "skill_deagle"));
		SetPlayerData(playerid, P_SKILL_SHOTGUN, 		cache_get_field_content_int(0, "skill_shotgun"));
		SetPlayerData(playerid, P_SKILL_MP5, 			cache_get_field_content_int(0, "skill_mp5"));
		SetPlayerData(playerid, P_SKILL_AK47, 			cache_get_field_content_int(0, "skill_ak47"));
		SetPlayerData(playerid, P_SKILL_M4, 			cache_get_field_content_int(0, "skill_m4"));
		SetPlayerData(playerid, P_SKILL_SNIPER_RIFLE, 	cache_get_field_content_int(0, "skill_sniper_rifle"));
		SetPlayerData(playerid, P_SKILL_SAWNOFF, 		cache_get_field_content_int(0, "skill_sawnoff"));
		SetPlayerData(playerid, P_SKILL_COMBAT_SG, 		cache_get_field_content_int(0, "skill_combat_sg"));
		SetPlayerData(playerid, P_SKILL_MICRO_UZI, 		cache_get_field_content_int(0, "skill_micro_uzi"));

		SetPlayerData(playerid, P_DONATE_CURRENT, 		cache_get_field_content_int(0, "donate"));
		SetPlayerData(playerid, P_DONATE_TOTAL, 		cache_get_field_content_int(0, "donate_total"));

		SetPlayerData(playerid, P_OSKIN,		 		cache_get_field_content_int(0, "org_skin"));

		SetPlayerData(playerid, P_SPAWN,		 		cache_get_field_content_int(0, "setting_spawn"));

		SetPlayerData(playerid, P_HOSPITAL,				bool: cache_get_field_content_int(0, "hospital"));

		SetPlayerData(playerid, P_HEALTH,				cache_get_field_content_float(0, "health"));

		SetPlayerData(playerid, P_CAR_SLOTS,			cache_get_field_content_int(0, "car_slots"));

		SetPlayerData(playerid, P_JAIL,					cache_get_field_content_int(0, "jail"));

		SetPlayerData(playerid, P_PREMIUM,				cache_get_field_content_int(0, "premium"));
		SetPlayerData(playerid, P_PREMIUM_DATE,				cache_get_field_content_int(0, "premium_date"));

		SetPlayerData(playerid, P_LOAD_SKILL,			cache_get_field_content_int(0, "load_skill"));
		SetPlayerData(playerid, P_LUMBERG_SKILL,		cache_get_field_content_int(0, "lumberg_skill"));

		SetPlayerData(playerid, P_DEPOSIT,              cache_get_field_content_int(0, "deposit"));

		SetPlayerData(playerid, P_FAMILY,              	cache_get_field_content_int(0, "family"));
		SetPlayerData(playerid, P_FAMILY_RANK,        	cache_get_field_content_int(0, "family_rank"));

		SetPlayerData(playerid, P_FISH_MAS,        		cache_get_field_content_int(0, "fish_mas"));

		SetPlayerData(playerid, P_NEED_EAT,        		cache_get_field_content_int(0, "eat"));
		SetPlayerData(playerid, P_NEED_WATER,        	cache_get_field_content_int(0, "water"));

		SetPlayerData(playerid, P_LEVEL, 	cache_get_field_content_int(0, "score"));
		SetPlayerData(playerid, P_EXP, 		cache_get_field_content_int(0, "exp"));

		SetPlayerData(playerid, P_NEED_EAT,        		cache_get_field_content_int(0, "eat"));
		SetPlayerData(playerid, P_NEED_WATER,        	cache_get_field_content_int(0, "water"));

		SetPlayerData(playerid, P_TRUCK_ROAD,        	cache_get_field_content_int(0, "truck_road"));
		SetPlayerData(playerid, P_TRUCK_WAGE,        	cache_get_field_content_int(0, "truck_wage"));
		SetPlayerData(playerid, P_TRUCK_MILEAGE,        cache_get_field_content_float(0, "truck_mileage"));

		SetPlayerData(playerid, P_GIFTS,        		cache_get_field_content_int(0, "gifts"));

		SetPlayerData(playerid, P_BONUS_GET,        	cache_get_field_content_int(0, "bonusget"));
        SetPlayerData(playerid, P_BONUS_DAY,        	cache_get_field_content_int(0, "loginday"));

        SetPlayerData(playerid, P_TWITTER,              cache_get_field_content_int(0, "twitter"));
        SetPlayerData(playerid, P_FB,                   cache_get_field_content_int(0, "facebook"));
		SetPlayerData(playerid, P_KOUTA,                cache_get_field_content_int(0, "kouta"));
        SetPlayerData(playerid, P_DELAY_HACK,        cache_get_field_content_int(0, "cdhack"));

		SetTimerEx("NeedEatPlayer", 1000*60*20, true, "i", playerid);
		SetTimerEx("NeedWaterPlayer", 1000*60*30, true, "i", playerid);

		SendClientMessageTip(playerid, "Anda tidak terhubung perlindungan Google Authenticator");
		SendClientMessageTip(playerid, "Kami menyarankan untuk menghubungkan jenis perlindungan ini. /mm > Keamanan > Google Authenticator");
		// -------------------------------------------------------------------------
		SelectPlayerSpawn(playerid, 0);
		mysql_format(mysql, query, sizeof query, "UPDATE accounts SET online = '1' WHERE id=%d LIMIT 1", GetPlayerAccountID(playerid));
		mysql_query(mysql, query);
	}
	cache_delete(result);
}


stock GetPlayerSkinEx(playerid)
{
	if(1 <= GetPlayerTeamEx(playerid) <= 8)
	{
	    if(GetPlayerData(playerid, P_ATWORK))
			return GetPlayerData(playerid, P_OSKIN);
		else
		    return GetPlayerData(playerid, P_SKIN);
	}
	else if(9 <= GetPlayerTeamEx(playerid) <= 15)
	    return GetPlayerData(playerid, P_OSKIN);
	else
		return GetPlayerData(playerid, P_SKIN);
}


stock SetPlayerSpawnInit(playerid)
{
	new spawn_id = 0,
		level = GetPlayerData(playerid, P_LEVEL);

	if(1 <= level <= 5)
 		spawn_id = random(2);

	if(6 <= level)
 		spawn_id = 2;

	SetSpawnInfo
	(
		playerid,
		0,
		GetPlayerSkinEx(playerid),
		spawn_pos_data[spawn_id][0], // + random(3),
		spawn_pos_data[spawn_id][1], // + random(3),
		spawn_pos_data[spawn_id][2],
		spawn_pos_data[spawn_id][3],
		0, 0, 0, 0, 0, 0
	);

	return 1;
}
