
enum bInfo
{
    bOwner[32], bMessage[32], bOwned, Float:bEntranceX, Float:bEntranceY, Float:bEntranceZ, Float:bExitX, Float:bExitY, Float:bExitZ, Float:bBarX, Float:bBarY, Float:bBarZ,
    bInterior, bProducts, bVirtualWorld, bBuyPrice, bPrice, bEntranceCost, bMoney, bMoneyLimit, bRaschet, bLocked, bMafia, bType, bSlet, bOplata, bArenda,
	bUpdMusic, bUpdHeal, bUpdSub,
	bSklad, bSotrud,
    bPhone, bProcent,
    //
    bPickup, Text3D: bLabel, bEntranceArea, bExitArea, bPickupHeal, bActors, bText
};
new BizzInfo[MAX_BIZZ][bInfo];




stock PlayerEnterToBizz(playerid, b)
{
    SetPVarInt(playerid, "next_area", gettime() + 3);

    if(BizzInfo[b][bType] == 9)
    {
        //if(!PlayerInfo[playerid][pLicenses][0]) return SCM(playerid, COLOR_GREY, "Anda tidak memiliki hak.");

	    SetPlayerUseListitem(playerid, BizzInfo[b][bVirtualWorld]);

	    player_enter_biz[playerid] = b;

	    return SPD(playerid, 3871, DIALOG_STYLE_MSGBOX, "Dealer mobil", "{ffffff}Apakah Anda ingin masuk??", "Ya", "Tidak");
    }

	if(b == 77 || b == 79) SCM(playerid, COLOR_YELLOW, "Untuk penggunaan dadu: {FFFFFF}/dice");

	SetPPos(playerid, BizzInfo[b][bExitX], BizzInfo[b][bExitY], BizzInfo[b][bExitZ], 0.0, BizzInfo[b][bInterior], BizzInfo[b][bVirtualWorld], true);

	if(BizzInfo[b][bUpdMusic]) PlayerPlaySound(playerid, 6401, BizzInfo[b][bExitX], BizzInfo[b][bExitY], BizzInfo[b][bExitZ]);

    return player_enter_biz[playerid] = b;
}

stock UpdatePlayerName(playerid)
{
	new new_nick[MAX_PLAYER_NAME + 12];

	new mobile_text[6];

	format(mobile_text, 6, IsPlayerMobile(playerid) ? ("[M] ") : ("[PC] "));

	new status_text[6];

	format(status_text, 6, admin_level[playerid] ? ("[A] ") : PlayerInfo[playerid][pSupport] ? ("[S] ") : PlayerInfo[playerid][pLeader] ? ("[L] ") : IsVIP(playerid) ? ("[V] ") : (""));

    strins(new_nick, mobile_text, strlen(new_nick));
    strins(new_nick, status_text, strlen(new_nick));
    strins(new_nick, GetPlayerNameEx(playerid), strlen(new_nick));

	printf("%s %i", new_nick, SetPlayerName(playerid, new_nick));
}

stock AddPlayerNotify(playerid, text[])
{
	format(format_string, 244, "INSERT INTO `notifications` (`user_id`, `text`) VALUES (%i, '%s');", GetPlayerAccountID(playerid), text);
	mysql_tquery(mMysql, format_string);
}

stock AddPlayerNotifyBySQL(sql_id, text[])
{
	format(format_string, 244, "INSERT INTO `notifications` (`user_id`, `text`) VALUES (%i, '%s');", sql_id, text);
	mysql_tquery(mMysql, format_string);
}

stock ShowPlayerNearPlayers(playerid, dialogid)
{
	new str[48], count = 0;

	String = "";

	foreach(Player, i)
	{
	    if(i == playerid) continue;

	    if(!ProxDetectorS(15.0, playerid, i)) continue;

	    format(str, 48, "%i. %s[%i]\n", count, GetPlayerNameEx(i), i);
	    strcat(String, str);

	    SetPlayerListitemValue(playerid, count++, i);
	}

	if(count == 0) return SCM(playerid, COLOR_GREY, "Tidak ada pemain di dekatnya.");

	return SPD(playerid, dialogid, DIALOG_STYLE_LIST, "Daftar pemain terdekat", String, "Pilih", "Kembali");
}

stock AddAdminLog(playerid, text[])
{
	mysql_format(mMysql, format_string, 244, "INSERT INTO `admin_log` (`user_id`,`action`) VALUES (%i,'%e');", GetPlayerAccountID(playerid), text);
	mysql_tquery(mMysql, format_string);
}

stock GetVehicleShopPrice(model)
{
    for(new x; x < 3; x++)
		for(new i, z = sizeof as_vehicle_info[]; i < z; i++)
   	 		if(model == as_vehicle_info[x][i][0]) return as_vehicle_info[x][i][1];

	return 0;
}

stock ShowPlayerHouseLodgers(playerid)
{
	new h_id = GetPlayerHouse(playerid);

    String = "";

    new str[46], lodger_name[MAX_PLAYER_NAME];

	for(new i; i < MAX_HOUSE_LODGERS; i++)
	{
	    if(strlen(house_lodgers[h_id][i]) < 4) lodger_name = "Gratis";
	    else format(lodger_name, MAX_PLAYER_NAME,  house_lodgers[h_id][i]);

	    format(str, 46, "%i. %s\n", i + 1, lodger_name);
	    strcat(String, str);
	}

	return SPD(playerid, 1283, DIALOG_STYLE_LIST, "Daftar penyewa", String, "Pilih", "Kembali");
}

stock IsPlayerGovermentWork(playerid)
{
	if((IsACop(playerid) || IsAMedic(playerid) || IsAArmy(playerid) || PlayerInfo[playerid][pMember] == FRACTION_NEWS || PlayerInfo[playerid][pMember] == FRACTION_MAYOR) && form_fraction[playerid]) return 1;

	return 0;
}

stock CreatePlayer3DFamily(playerid)
{
	new f_id = GetPlayerData(playerid, pFamily);

    format(format_string, 64, "{%s}%s {FFFFFF}Family", family_chat_color_low[ family_info[f_id][f_color] ], family_info[f_id][f_name]);
	family_player_3d[playerid] = CreateDynamic3DTextLabel(format_string, -1, 0.0,0.0,0.07, 10.0, playerid);
}


stock UpdateGraffitiGang(g_id)
{
    switch(graffiti_fraction[g_id])
	{
		case FRACTION_GROVE: SetDynamicObjectMaterial(graffiti_objects[g_id], 0, 1490, "tags2_lalae", "grove", 0);
		case FRACTION_BALLAS: SetDynamicObjectMaterial(graffiti_objects[g_id], 0, 1529, "tags_latemple", "temple", 0);
		case FRACTION_RIFA: SetDynamicObjectMaterial(graffiti_objects[g_id], 0, 1526, "tags_larifa", "rifa", 0);
		case FRACTION_AZTEC: SetDynamicObjectMaterial(graffiti_objects[g_id], 0, 1531, "tags_laazteca", "aztecas", 0);
		case FRACTION_MARA_SALVATRUCHA: SetDynamicObjectMaterial(graffiti_objects[g_id], 0, 1530, "tags_lamara_salvatrucha", "mara_salvatrucha", 0);
	}

	return 1;
}

stock PlayerStopRestyleGraffiti(playerid)
{
    for(new i; i < 2; i++) TextDrawHideForPlayer(playerid, graffiti_global_td[i]);
	PlayerTextDrawHide(playerid, graffiti_player_td[playerid]);

    graffiti_player_id[playerid] = -1;
	DeletePVar(playerid,"ColorFire");
}

stock SetPPos(playerid, Float: x, Float: y, Float: z, Float: a, int, world, bool: freeze)
{
    if(freeze) TogglePlayerControllableEx(playerid, 0);

	SetPlayerPos(playerid, x, y, z);
	SetPlayerFacingAngle(playerid, a);

	SetPlayerInterior(playerid, int);
	SetPlayerVirtualWorld(playerid, world);

	SetCameraBehindPlayer(playerid);

	if(freeze) SetTimerEx("ClearFreeze", 1000, false, "d", playerid);

	return 1;
}

stock CreatePlayeDrugMark(playerid)
{
    if(PlayerInfo[playerid][pDrugMarkAmount] == 0) return 0;

	new s_id = PlayerInfo[playerid][pDrugMarkID];

	new Float: x = stash_pos[s_id][0],
	    Float: y = stash_pos[s_id][1],
	    Float: z = stash_pos[s_id][2];

	PlayerInfo[playerid][pDrugPickup] = CreateDynamicPickup(1279, 23, x, y, z, 0, 0, playerid);

	return 1;
}

stock DeletePlayerDrugMark(playerid, bool: is_take = false)
{
	if(PlayerInfo[playerid][pDrugMarkAmount] == 0) return 0;

	if(is_take)
	{
	    new amount = PlayerInfo[playerid][pDrugMarkAmount];

	    PlayerInfo[playerid][pDrugs] += amount;

	    if(PlayerInfo[playerid][pDrugs] + amount > GetPlayerBackpackLimit(playerid)) PlayerInfo[playerid][pDrugs] = GetPlayerBackpackLimit(playerid);

	    OnPlayerUpdateAccountsPer(playerid, "pDrugs", PlayerInfo[playerid][pDrugs]);

	    PlayerInfo[playerid][pDrugMarkAmount] = 0;

	    OnPlayerUpdateAccountsPer(playerid, "pDrugMarkAmount", 0);

	    ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 6.1, 0, 0, 0, 0, 0,1);

	    format(format_string, 64, "%s mengambil sesuatu dari lantai", GetPlayerNameEx(playerid));
	    ProxDetector(20.0, playerid, format_string, 0xDD90FFFF,0xDD90FFAA,0xDD90FFAA,0xDD90FFAA,0xDD90FFAA);

		SetPlayerChatBubble(playerid, "mengambil sesuatu dari lantai", 0xDD90FFFF, 20.0, 10000);

		SCMF(playerid, COLOR_GREEN, "Anda menemukan bookmark dengan %i kolom obat-obatan.", amount);
	}

	DestroyDynamicPickup(PlayerInfo[playerid][pDrugPickup]);

	return 1;
}

stock UpdatePlayerQuestData(playerid)
{
    //if(!(5 <= DayOfWeak() <= 7)) return 0;

	new q_id = player_quest_info[playerid][quest_id];
	new q_status = player_quest_info[playerid][quest_status];

	switch(q_id)
	{
	    case GQUEST_TYPE_CARJACK:
	    {
	        if(q_status == 1)
	        {
		        new rand = quest_vehicle_number;

		        new Float: x = quest_veh_pos[rand][0],
		            Float: y = quest_veh_pos[rand][1],
		            Float: z = quest_veh_pos[rand][2],
		            Float: a = quest_veh_pos[rand][3];

				new rand_model = random(sizeof quest_veh_model);

		        new vehicleid = CreateVehicle(quest_veh_model[rand_model], x, y, z, a, random(128), random(128), 300);

                GetVehicleParamsEx(vehicleid,engine,lights,alarm,doors,bonnet,boot,objective);
                SetVehicleParamsEx(vehicleid,engine,lights,alarm,0,bonnet,boot,objective);

                VehInfo[vehicleid][vStatus] = 2;
                Fuell[vehicleid] = 50;

		        quest_vehicle_owner[vehicleid] = playerid;
		        player_quest_info[playerid][quest_vehicle_id] = vehicleid;

		        quest_vehicle_number++;
		        if(quest_vehicle_number == sizeof quest_veh_pos) quest_vehicle_number = 0;
		    }
	    }
	    case GQUEST_TYPE_DRUGMARK:
	    {
	        if(q_status == 1)
	        {
	            new rand = random(sizeof stash_pos);

				player_quest_info[playerid][quest_progress] = rand;
	        }
	    }
	    case GQUEST_TYPE_MONEY, GQUEST_TYPE_MATS:
	    {
	        if(q_status == 1)
	        {
		        new vehicleid = CreateVehicle(440, 2001.8138,-1129.3904,25.4555,359.2681, random(128), random(128), 300);

                GetVehicleParamsEx(vehicleid,engine,lights,alarm,doors,bonnet,boot,objective);
                SetVehicleParamsEx(vehicleid,engine,lights,alarm,0,bonnet,boot,objective);

	            VehInfo[vehicleid][vStatus] = 2;
	            Fuell[vehicleid] = 50;

		        quest_vehicle_owner[vehicleid] = playerid;
		        player_quest_info[playerid][quest_vehicle_id] = vehicleid;
			}
	    }
	}
}


stock PlayerWinPlayerDice(winner, loser, value_1, winner_dice, loser_dice)
{
    new percent = value_1 / 100,
		cash = value_1;

    new b_id = player_enter_biz[winner];

	GiveBusinessMoney(b_id, percent, 0);

	SCM(winner, 0x66CC33FF, "Selamat, kamu menang!");
	GivePlayerMoneyEx(winner, cash, "Dadu (menang)");

	SCM(loser, 0xFF5533FF, "Maaf kamu kalah");
	GivePlayerMoneyEx(loser, -value_1, "Game dadu (hilang)");

	format(format_string, 32, "Jatuh: %d", winner_dice);
	SetPlayerChatBubble(winner, format_string, 0x66CC33FF, 20.0, 2000);

	format(format_string, 32, "Jatuh: %d", loser_dice);
	SetPlayerChatBubble(loser, format_string, 0xFF5533FF, 20.0, 2000);
}



public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{

	case 63:
	    {
	        if(!response) return 1;

	        if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return 1;

	        new bizz = GetPlayerUseListitem(playerid);

	        if(PlayerInfo[playerid][pCash] < BizzInfo[bizz][bEntranceCost]) return Send(playerid, -1, "Anda tidak punya cukup uang untuk masuk.");

			GivePlayerMoneyEx(playerid, -BizzInfo[bizz][bEntranceCost], "entri bisnis"),

	        GiveBusinessMoney(bizz, BizzInfo[bizz][bEntranceCost], 0);

	        SetPVarInt(playerid, "EntranceOplataBizz", bizz);

			PlayerEnterToBizz(playerid, bizz);
    	}

}

stock LoadBizz()
{
	new Cache: result = mysql_query(mMysql, "SELECT * FROM `bizz`", true);

    new rows = cache_num_rows();

	if(!rows) return 1;

    for(new i; i < rows; i++)
	{
	    cache_get_value_name(i, "bOwner", BizzInfo[i][bOwner], 32);
	    cache_get_value_name(i, "bMessage", BizzInfo[i][bMessage], 32);
	    cache_get_value_name_int(i, "bOwned", BizzInfo[i][bOwned]);

		cache_get_value_name_float(i, "bEntranceX", BizzInfo[i][bEntranceX]);
		cache_get_value_name_float(i, "bEntranceY", BizzInfo[i][bEntranceY]);
	    cache_get_value_name_float(i, "bEntranceZ", BizzInfo[i][bEntranceZ]);
	    cache_get_value_name_float(i, "bExitX", BizzInfo[i][bExitX]);
	    cache_get_value_name_float(i, "bExitY", BizzInfo[i][bExitY]);
	    cache_get_value_name_float(i, "bExitZ", BizzInfo[i][bExitZ]);
	    cache_get_value_name_float(i, "bBarX", BizzInfo[i][bBarX]);
	    cache_get_value_name_float(i, "bBarY", BizzInfo[i][bBarY]);
	    cache_get_value_name_float(i, "bBarZ", BizzInfo[i][bBarZ]);

	    cache_get_value_name_int(i, "bInterior", BizzInfo[i][bInterior]);
	    cache_get_value_name_int(i, "bProducts", BizzInfo[i][bProducts]);
	    cache_get_value_name_int(i, "bVirtualWorld", BizzInfo[i][bVirtualWorld]);
	    cache_get_value_name_int(i, "bBuyPrice", BizzInfo[i][bBuyPrice]);
	    cache_get_value_name_int(i, "bPrice", BizzInfo[i][bPrice]);
	    cache_get_value_name_int(i, "bEntranceCost", BizzInfo[i][bEntranceCost]);
	    cache_get_value_name_int(i, "bMoney", BizzInfo[i][bMoney]);
	    cache_get_value_name_int(i, "bRaschet", BizzInfo[i][bRaschet]);
	    cache_get_value_name_int(i, "bLocked", BizzInfo[i][bLocked]);
	    cache_get_value_name_int(i, "bMafia", BizzInfo[i][bMafia]);
	    cache_get_value_name_int(i, "bType", BizzInfo[i][bType]);
	    cache_get_value_name_int(i, "bSlet", BizzInfo[i][bSlet]);
	    cache_get_value_name_int(i, "bOplata", BizzInfo[i][bOplata]);
	    cache_get_value_name_int(i, "bArenda", BizzInfo[i][bArenda]);
	    cache_get_value_name_int(i, "bUpdMusic", BizzInfo[i][bUpdMusic]);
	    cache_get_value_name_int(i, "bSotrud", BizzInfo[i][bSotrud]);
	    cache_get_value_name_int(i, "bUpdHeal", BizzInfo[i][bUpdHeal]);
	    cache_get_value_name_int(i, "bUpdSub", BizzInfo[i][bUpdSub]);
	    cache_get_value_name_int(i, "bSklad", BizzInfo[i][bSklad]);
	    cache_get_value_name_int(i, "bPhone", BizzInfo[i][bPhone]);
	    cache_get_value_name_int(i, "bProcent", BizzInfo[i][bProcent]);

		if(BizzInfo[i][bEntranceX] == 0.0) continue;

        if(BizzInfo[i][bOplata] == 0) BizzInfo[i][bOplata] = 15;

		if(BizzInfo[i][bOwned] == 1)
		{
			if(BizzInfo[i][bUpdHeal] != 0) CreateHealsBizz(i);
			if(BizzInfo[i][bSotrud] != 0) CreateActorsBizz(i);
		}

		AddStaticPickup(19132, 23, BizzInfo[i][bEntranceX], BizzInfo[i][bEntranceY], BizzInfo[i][bEntranceZ]);
		CreatePickup(19132, 23, BizzInfo[i][bExitX], BizzInfo[i][bExitY], BizzInfo[i][bExitZ],BizzInfo[i][bVirtualWorld]);

		BizzInfo[i][bLabel] = Create3DTextLabel("",0x00D900FF,BizzInfo[i][bEntranceX], BizzInfo[i][bEntranceY], BizzInfo[i][bEntranceZ],10.0,0,1);

		UpdateBizzLabelText(i);

		//
	    switch(BizzInfo[i][bType])
		{
		    case 1:
		    {
		        Create3DTextLabel("Masuk '/drink'", 0xDC900CFF, BizzInfo[i][bBarX], BizzInfo[i][bBarY], BizzInfo[i][bBarZ]+0.5, 10.0, BizzInfo[i][bVirtualWorld], 1);
                BizzInfo[i][bPickup] = CreatePickup(19823, 23, BizzInfo[i][bBarX], BizzInfo[i][bBarY], BizzInfo[i][bBarZ], BizzInfo[i][bVirtualWorld]);
                CreateDynamicMapIcon(BizzInfo[i][bEntranceX], BizzInfo[i][bEntranceY], BizzInfo[i][bEntranceZ], i == 77 ? 43 : i == 79 ? 44 : 49, -1, 0, -1, -1);
		    }
		    case 2:
		    {
		        Create3DTextLabel("Masuk '/eat'", 0xDC900CFF,BizzInfo[i][bBarX], BizzInfo[i][bBarY], BizzInfo[i][bBarZ]+0.5,10.0,BizzInfo[i][bVirtualWorld],1);
		   		BizzInfo[i][bPickup] = CreateDynamicCP(BizzInfo[i][bBarX],BizzInfo[i][bBarY],BizzInfo[i][bBarZ],1,BizzInfo[i][bVirtualWorld],BizzInfo[i][bInterior], -1, 10.0);
            	CreateDynamicMapIcon(BizzInfo[i][bEntranceX], BizzInfo[i][bEntranceY], BizzInfo[i][bEntranceZ], 10, -1, 0, -1, -1);
		    }
		    case 3:
		    {
		        Create3DTextLabel("Masuk '/buy'", 0xDC900CFF,BizzInfo[i][bBarX], BizzInfo[i][bBarY], BizzInfo[i][bBarZ]+0.5,10.0,BizzInfo[i][bVirtualWorld],1);
            	BizzInfo[i][bPickup] = CreatePickup(1274, 23, BizzInfo[i][bBarX],BizzInfo[i][bBarY],BizzInfo[i][bBarZ],BizzInfo[i][bVirtualWorld]);
            	CreateDynamicMapIcon(BizzInfo[i][bEntranceX], BizzInfo[i][bEntranceY], BizzInfo[i][bEntranceZ], 8, -1, 0, -1, -1);
		    }
		    case 4:
		    {
				// Biro iklan
				Create3DTextLabel("Masuk '/advert'", 0xDC900CFF,BizzInfo[i][bBarX], BizzInfo[i][bBarY], BizzInfo[i][bBarZ]+0.5,10.0,BizzInfo[i][bVirtualWorld],1);
            	BizzInfo[i][bPickup] = CreatePickup(1274, 23, BizzInfo[i][bBarX],BizzInfo[i][bBarY],BizzInfo[i][bBarZ],BizzInfo[i][bVirtualWorld]);
				CreateDynamicMapIcon(BizzInfo[i][bEntranceX], BizzInfo[i][bEntranceY], BizzInfo[i][bEntranceZ], 12, -1, 0, -1, -1);

				//Create3DTextLabel("Informasi untuk Pengiklan", 0x1A8FA9FF, 2209.8484,1612.7736,999.9654+0.65, 15.0, BizzInfo[i][bVirtualWorld], 1); // ADVERT LABEL
		    }
		    case 5:
		    {
		        Create3DTextLabel("Penempatan kerja", 0xDC900CFF,BizzInfo[i][bBarX], BizzInfo[i][bBarY], BizzInfo[i][bBarZ]+0.5,10.0,BizzInfo[i][bVirtualWorld],1);
		        BizzInfo[i][bPickup] = CreatePickup(1275, 23, BizzInfo[i][bBarX],BizzInfo[i][bBarY],BizzInfo[i][bBarZ],BizzInfo[i][bVirtualWorld]);
		        CreateDynamicMapIcon(BizzInfo[i][bEntranceX], BizzInfo[i][bEntranceY], BizzInfo[i][bEntranceZ], 55, -1, 0, -1, -1);

	        	CreateTaxiVehiclesForBizz(i);
   			}
   			case 6:
   			{
   			    Create3DTextLabel("/clothes", 0xDC900CFF, BizzInfo[i][bBarX], BizzInfo[i][bBarY], BizzInfo[i][bBarZ]+0.5,10.0,BizzInfo[i][bVirtualWorld],1);
		        BizzInfo[i][bPickup] = CreatePickup(1275, 23, BizzInfo[i][bBarX], BizzInfo[i][bBarY], BizzInfo[i][bBarZ], BizzInfo[i][bVirtualWorld]);
		        CreateDynamicMapIcon(BizzInfo[i][bEntranceX], BizzInfo[i][bEntranceY], BizzInfo[i][bEntranceZ], 45, -1, 0, -1, -1);
   			}
   			case 7:
   			{
   			    Create3DTextLabel("/buy", 0xDC900CFF, BizzInfo[i][bBarX], BizzInfo[i][bBarY], BizzInfo[i][bBarZ]+0.5,10.0,BizzInfo[i][bVirtualWorld],1);
		        BizzInfo[i][bPickup] = CreatePickup(1274, 23, BizzInfo[i][bBarX], BizzInfo[i][bBarY], BizzInfo[i][bBarZ], BizzInfo[i][bVirtualWorld]);
		        CreateDynamicMapIcon(BizzInfo[i][bEntranceX], BizzInfo[i][bEntranceY], BizzInfo[i][bEntranceZ], 20, -1, 0, -1, -1);
			}
			case 8:
			{
                BizzInfo[i][bPickup] = CreatePickup(2061, 23, BizzInfo[i][bBarX], BizzInfo[i][bBarY], BizzInfo[i][bBarZ], BizzInfo[i][bVirtualWorld]);
			    CreateDynamicMapIcon(BizzInfo[i][bEntranceX], BizzInfo[i][bEntranceY], BizzInfo[i][bEntranceZ], 6, -1, 0, -1, -1);
			}
			case 9:
			{
			    CreateDynamicMapIcon(BizzInfo[i][bEntranceX], BizzInfo[i][bEntranceY], BizzInfo[i][bEntranceZ], 55, -1, 0, -1, -1);
			}
			case 13:
			{
			    CreateDynamicMapIcon(BizzInfo[i][bEntranceX], BizzInfo[i][bEntranceY], BizzInfo[i][bEntranceZ], 35, -1, 0, -1, -1);
			}
			case 14:
			{
                CreateDynamicMapIcon(BizzInfo[i][bEntranceX], BizzInfo[i][bEntranceY], BizzInfo[i][bEntranceZ], 27, -1, 0, -1, -1);
			}
			case 23:
			{
			    Create3DTextLabel("Daftar untuk\nAcara", 0xDC900CFF, BizzInfo[i][bBarX], BizzInfo[i][bBarY], BizzInfo[i][bBarZ]+0.5,10.0,BizzInfo[i][bVirtualWorld],1);
		        BizzInfo[i][bPickup] = CreatePickup(1239, 23, BizzInfo[i][bBarX], BizzInfo[i][bBarY], BizzInfo[i][bBarZ], BizzInfo[i][bVirtualWorld]);
		        CreateDynamicMapIcon(BizzInfo[i][bEntranceX], BizzInfo[i][bEntranceY], BizzInfo[i][bEntranceZ], 20, -1, 0, -1, -1);
			}
		}
		//
		BizzInfo[i][bEntranceArea] = CreateDynamicSphere(BizzInfo[i][bEntranceX], BizzInfo[i][bEntranceY], BizzInfo[i][bEntranceZ],1);
		BizzInfo[i][bExitArea] = CreateDynamicSphere(BizzInfo[i][bExitX], BizzInfo[i][bExitY], BizzInfo[i][bExitZ],1,BizzInfo[i][bVirtualWorld]);
		TotalBizz++;
	}

	cache_delete(result);

    for(new i; i < rows; i++)
	{
	    if(BizzInfo[i][bSlet] != 0)
	    {
	        new bizz = i;

		    format(format_string, 96, "DELETE FROM `bizz_stats` WHERE `bID` = %d", bizz);
			mysql_tquery(mMysql, format_string);

			format(format_string, 144, "UPDATE `accounts` SET `pBank` = `pBank` + %i WHERE `pName` = '%s'", BizzInfo[bizz][bBuyPrice] / 2, BizzInfo[i][bOwner]);
			mysql_tquery(mMysql, format_string);

			new sql_id = GetPlayerSqlIDByName(BizzInfo[i][bOwner]);

		    AddPlayerNotifyBySQL(sql_id, "Bisnis Anda dijual tanpa pembayaran.");

		    BizzInfo[bizz][bOwned] = 0, BizzInfo[bizz][bLocked] = 0, BizzInfo[bizz][bPrice] = 50, BizzInfo[bizz][bMoney] = 0, BizzInfo[bizz][bRaschet] = 0, BizzInfo[bizz][bUpdSub] = 0, BizzInfo[bizz][bUpdMusic] = 0;
			BizzInfo[bizz][bOplata] = 0, BizzInfo[bizz][bEntranceCost] = 0, BizzInfo[bizz][bSlet] = 0, BizzInfo[bizz][bUpdHeal] = 0, BizzInfo[bizz][bSklad] = 1000;
			BizzInfo[bizz][bPhone] = 0, BizzInfo[bizz][bProcent] = 0, BizzInfo[bizz][bSotrud] = 0;

			strmid(BizzInfo[bizz][bOwner], "None", 0, strlen("None"), 32);

			SaveBizz(bizz);
		}
	}

	return printf("[MySQL R41-3]: Bisnis dimuat: %i pcs.", TotalBizz);
}

stock CreateHealsBizz(i)
{
	new interior = BizzInfo[i][bInterior];

	if(BizzInfo[i][bType] == 1) // bar
	{
	    switch(interior)
		{
		    case 1: BizzInfo[i][bPickupHeal] = CreateDynamicPickup(1318, 23, -786.7233,488.8760,1376.1953, BizzInfo[i][bVirtualWorld]);
		    case 2: BizzInfo[i][bPickupHeal] = CreateDynamicPickup(1318, 23, 1200.7405,12.1441,1000.9219, BizzInfo[i][bVirtualWorld]);
		    case 3: BizzInfo[i][bPickupHeal] = CreateDynamicPickup(1318, 23, -2677.6082,1398.6493,906.4609, BizzInfo[i][bVirtualWorld]);
		    case 11: BizzInfo[i][bPickupHeal] = CreateDynamicPickup(1318, 23, 491.5939,-82.7722,998.7578, BizzInfo[i][bVirtualWorld]);
		    case 17: BizzInfo[i][bPickupHeal] = CreateDynamicPickup(1318, 23, 502.9492,-14.6566,1000.6797, BizzInfo[i][bVirtualWorld]);
		    case 18: BizzInfo[i][bPickupHeal] = CreateDynamicPickup(1318, 23, -222.5450,1410.8459,27.7734, BizzInfo[i][bVirtualWorld]);
		}
	}
	if(BizzInfo[i][bType] == 2) // snack bar
	{
	    switch(interior)
	    {
	        case 1: BizzInfo[i][bPickupHeal] = CreateDynamicPickup(1318, 23, -786.4971,488.7927,1376.1953, BizzInfo[i][bVirtualWorld]);
	        case 4: BizzInfo[i][bPickupHeal] = CreateDynamicPickup(1318, 23, 438.9160,-81.5603,999.5547, BizzInfo[i][bVirtualWorld]);
	        case 5: BizzInfo[i][bPickupHeal] = CreateDynamicPickup(1318, 23, 367.3802,-119.0688,1001.4922, BizzInfo[i][bVirtualWorld]);
	        case 9: BizzInfo[i][bPickupHeal] = CreateDynamicPickup(1318, 23, 364.9475,-5.8251,1001.8516, BizzInfo[i][bVirtualWorld]);
	        case 10: BizzInfo[i][bPickupHeal] = CreateDynamicPickup(1318, 23, 382.3647,-56.8820,1001.5151, BizzInfo[i][bVirtualWorld]);
         	case 17: BizzInfo[i][bPickupHeal] = CreateDynamicPickup(1318, 23, 380.7557,-181.9169,1000.6401, BizzInfo[i][bVirtualWorld]);//1240 ID OBJECT
         	default: printf("[ERROR] Telah terjadi kesalahan. 'stock CreateHealsBizz'. Perawatan penjemputan tidak dimuat untuk bisnis. ID BIZZ: %d", i);
         }
	}
	if(BizzInfo[i][bType] == 3) // 24/7
	{
	    switch(interior)
	    {
	        case 4: BizzInfo[i][bPickupHeal] = CreateDynamicPickup(1318, 23, -34.5024,-30.2199,1003.5573, BizzInfo[i][bVirtualWorld]);
	        case 6: BizzInfo[i][bPickupHeal] = CreateDynamicPickup(1318, 23, -32.7999,-56.7634,1003.5469, BizzInfo[i][bVirtualWorld]);
	        case 10: BizzInfo[i][bPickupHeal] = CreateDynamicPickup(1318, 23, -10.6784,-30.9386,1003.5494, BizzInfo[i][bVirtualWorld]);
	        case 16: BizzInfo[i][bPickupHeal] = CreateDynamicPickup(1318, 23, -32.4647,-140.4834,1003.5469, BizzInfo[i][bVirtualWorld]);
	        case 17: BizzInfo[i][bPickupHeal] = CreateDynamicPickup(1318, 23, -21.2251,-186.4886,1003.5469, BizzInfo[i][bVirtualWorld]);
	        case 18: BizzInfo[i][bPickupHeal] = CreateDynamicPickup(1318, 23, -34.2687,-91.1953,1003.5469, BizzInfo[i][bVirtualWorld]);
			default: printf("[ERROR] Telah terjadi kesalahan. 'stock CreateHealsBizz'. Perawatan penjemputan tidak dimuat untuk bisnis. ID BIZZ: %d", i);
		}
	}
	if(BizzInfo[i][bType] == 4) BizzInfo[i][bPickupHeal] = CreateDynamicPickup(1318, 23, 2196.8489,1607.1462,999.9691, BizzInfo[i][bVirtualWorld]);
	if(BizzInfo[i][bType] == 5) BizzInfo[i][bPickupHeal] = CreateDynamicPickup(1318, 23, 2196.8489,1607.1462,999.9691, BizzInfo[i][bVirtualWorld]);
	if(BizzInfo[i][bType] == 6)
	{
	    switch(interior)
	    {
	        case 5: BizzInfo[i][bPickupHeal] = CreateDynamicPickup(1318, 23, 202.5274,-12.2672,1001.2109, BizzInfo[i][bVirtualWorld]);
	        case 14: BizzInfo[i][bPickupHeal] = CreateDynamicPickup(1318, 23, 216.1705,-155.4952,1000.5234, BizzInfo[i][bVirtualWorld]);
	        case 15: BizzInfo[i][bPickupHeal] = CreateDynamicPickup(1318, 23, 217.9161,-102.6065,1005.2578, BizzInfo[i][bVirtualWorld]);
	        case 18: BizzInfo[i][bPickupHeal] = CreateDynamicPickup(1318, 23, 176.7920,-88.1884,1001.8047, BizzInfo[i][bVirtualWorld]);
     	}
 	}
	return 1;
}
stock ResetHousesPrice(hClass,hPriceMin,hPriceMax) {
	new count;
	if(hPriceMax-hPriceMin < 1) return 0;
	for(new i; i < MAX_HOUSES; i++) {
		if(HouseInfo[i][hKlass] != hClass) continue;
		new diap = (hPriceMax-hPriceMin)/1000,
			price = hPriceMin+(random(diap)*1000);
		HouseInfo[i][hValue] = price;
		SaveHouse(i);
		count++;
	}
	return count;
}
cmd:resetprice(playerid,params[])
{
	if(admin_level[playerid] < 1) return true;
	if(sscanf(params, "idd", params[0], params[1], params[2]) || params[1] >= params[2]) return Send(playerid, -1,"/resetprice [rumah kelas] [harga minimum] [harga maksimum]");
	SCMF(playerid,0x27C400FF,"Anda telah berhasil menginstal %d rumah negara biaya dari %d sebelumnya %d",ResetHousesPrice(params[0], params[1], params[2]),params[1], params[2]);
	return true;
}
stock GetPlayerID(playername[])
{
	foreach(Player, i) if(strcmp(PlayerInfo[i][pName], playername, true) == 0) return i;

	return INVALID_PLAYER_ID;
}
stock CreateActorsBizz(i)
{
	new interior = BizzInfo[i][bInterior];

	if(BizzInfo[i][bType] == 1) // bar
	{
	    switch(interior)
		{
		    case 1: BizzInfo[i][bActors] = CreateActor(91, -784.5922,498.3217,1371.7422,0.1644);
		    case 2: BizzInfo[i][bActors] = CreateActor(87, 1214.7377,-15.2607,1000.9219,358.7856);
		    case 3: BizzInfo[i][bActors] = CreateActor(63, -2655.5066,1412.4023,906.2734,271.0095);
		    case 11: BizzInfo[i][bActors] = CreateActor(69, 496.8440,-77.5612,998.7651,358.0309);
		    case 17: BizzInfo[i][bActors] = CreateActor(11, 501.8483,-20.8332,1000.6797,86.2663);
		    case 18: BizzInfo[i][bActors] = CreateActor(10, -223.3060,1405.1404,27.7734,91.3216);
		    default: printf("[ERROR] Telah terjadi kesalahan. 'stock CreateActorsBizz'. Aktor tidak dimuat untuk bisnis. ID BIZZ: %d", i);
		}
	}
	if(BizzInfo[i][bType] == 2) // snack bar
	{
	    switch(interior)
	    {
	        case 1: BizzInfo[i][bActors] = CreateActor(91, -784.5922,498.3217,1371.7422,0.1644);
	        case 4: BizzInfo[i][bActors] = CreateActor(155, 450.5215,-82.2323,999.5547,181.6908);
	        case 5: BizzInfo[i][bActors] = CreateActor(167, 375.5833,-117.2786,1001.4922,178.6384);
	        case 9: BizzInfo[i][bActors] = CreateActor(155, 369.5509,-4.4928,1001.8589,182.4795);
	        case 10: BizzInfo[i][bActors] = CreateActor(205, 375.7364,-65.8493,1001.5078,179.7224);
         	case 17: BizzInfo[i][bActors] = CreateActor(155, 380.6586,-187.8838,1000.6328,90.4031);
         	default: printf("[ERROR] Telah terjadi kesalahan. 'stock CreateActorsBizz'. Aktor tidak dimuat untuk bisnis. ID BIZZ: %d", i);
         }
	}
	if(BizzInfo[i][bType] == 3) // 24/7
	{
	    switch(interior)
	    {
	        case 4: BizzInfo[i][bActors] = CreateActor(172, -30.8155,-30.7026,1003.5573,1.3787);
	        case 6: BizzInfo[i][bActors] = CreateActor(192, -23.6125,-57.3142,1003.5469,359.5404);
	        case 10: BizzInfo[i][bActors] = CreateActor(172, 2.0674,-30.7005,1003.5494,0.4595);
	        case 16: BizzInfo[i][bActors] = CreateActor(194, -22.2422,-140.3134,1003.5469,1.8382);
	        case 17: BizzInfo[i][bActors] = CreateActor(172, -29.0401,-186.7603,1003.5469,4.1359);
	        case 18: BizzInfo[i][bActors] = CreateActor(172, -27.8572,-91.3221,1003.5469,359.9995);
			default: printf("[ERROR] Telah terjadi kesalahan. 'stock CreateActorsBizz'. Aktor tidak dimuat untuk bisnis. ID BIZZ: %d", i);
		}
	}
	if(BizzInfo[i][bType] == 4) BizzInfo[i][bActors] = CreateActor(172, 2209.5188,1607.2764,1000.2167,34.4669);
	if(BizzInfo[i][bType] == 5) BizzInfo[i][bActors] = CreateActor(142, 2162.5081,1598.3326,999.9697,357.9260);
	if(BizzInfo[i][bType] == 6)
	{
	    switch(interior)
	    {
	        case 15: BizzInfo[i][bActors] = CreateActor(195, 207.5692,-98.7054,1005.2578,179.8526);
	        case 5: BizzInfo[i][bActors] = CreateActor(211, 204.8536,-8.2241,1001.2109,267.7932);
	        case 18: BizzInfo[i][bActors] = CreateActor(211, 161.3196,-81.1918,1001.8047,178.8031);
	        case 14: BizzInfo[i][bActors] = CreateActor(211, 204.1976,-157.8300,1000.5234,179.8523);
	        default: printf("[ERROR] Telah terjadi kesalahan. 'stock CreateActorsBizz'. Aktor tidak dimuat untuk bisnis. ID BIZZ: %d", i);
     	}
 	}
 	SetActorVirtualWorld(BizzInfo[i][bActors], BizzInfo[i][bVirtualWorld]);
	return 1;
}

epublic: LoadEnters()
{
    new rows;
	cache_get_row_count(rows);
	new EntersText[2] = { 0x6495EDFF, 0xF7ED00FF };
	if(!rows) return print("[MySQL R41-3]: Tidak ada pickup untuk diunduh!");

 	for(new i = 1; i <= rows; i++)
	{
	 	cache_get_value_name_int(i-1, "pickID", EntersInfo[i][pickID]);
		cache_get_value_name_float(i-1, "pickX", EntersInfo[i][pickX]);
		cache_get_value_name_float(i-1, "pickY", EntersInfo[i][pickY]);
		cache_get_value_name_float(i-1, "pickZ", EntersInfo[i][pickZ]);
		cache_get_value_name_int(i-1, "pickM", EntersInfo[i][pickM]);
		cache_get_value_name_int(i-1, "pickT", EntersInfo[i][pickT]);
		cache_get_value_name_int(i-1, "pickI", EntersInfo[i][pickI]);
		cache_get_value_name_int(i-1, "pickV", EntersInfo[i][pickV]);
		cache_get_value_name_float(i-1, "pickPosX", EntersInfo[i][pickPosX]);
		cache_get_value_name_float(i-1, "pickPosY", EntersInfo[i][pickPosY]);
		cache_get_value_name_float(i-1, "pickPosZ", EntersInfo[i][pickPosZ]);
		cache_get_value_name_float(i-1, "pickPosA", EntersInfo[i][pickPosA]);
		cache_get_value_name_int(i-1, "pickPosI", EntersInfo[i][pickPosI]);
		cache_get_value_name_int(i-1, "pickPosV", EntersInfo[i][pickPosV]);
		cache_get_value_name(i-1, "pickName", EntersInfo[i][pickName], 32);
		cache_get_value_name_int(i-1, "IconIDM", EntersInfo[i][IconIDM]);
		cache_get_value_name_int(i-1, "pickColor", EntersInfo[i][pickColor]);

		EntersInfo[i][pickPickup] = CreatePickup(EntersInfo[i][pickM], 1, EntersInfo[i][pickX], EntersInfo[i][pickY], EntersInfo[i][pickZ],EntersInfo[i][pickV]);
		EntersInfo[i][pickText] = CreateDynamic3DTextLabel(EntersInfo[i][pickName], EntersText[EntersInfo[i][pickColor]], EntersInfo[i][pickX], EntersInfo[i][pickY], EntersInfo[i][pickZ] + 0.6, 8.0, INVALID_PLAYER_ID,INVALID_VEHICLE_ID,1, EntersInfo[i][pickV], EntersInfo[i][pickI]);
		if(EntersInfo[i][IconIDM] != 0) CreateDynamicMapIcon(EntersInfo[i][pickX], EntersInfo[i][pickY], EntersInfo[i][pickZ],EntersInfo[i][IconIDM],0, 0, -1, -1, 150.0);
		TotalEnters++;
 	}
	return printf("[MySQL R41-3]: Pickup dimuat: %i pcs.", TotalEnters);
}


publics: SendPlayerRobCopNotify(rob_id)
{
    SendMessageToRobPlayers(rob_id, 0xffff00ff, "SMS: Panggilan polisi telah tiba di stasiun, keluar lebih cepat! | Pengirim: Ujang");
    return true;
}

stock ShowPlayerAutoSchoolQuestions(playerid)
{
	new try_id = 0;

	SEARCH_QUEST:

	new rand = random(sizeof gExamQuestions);

	try_id++;

	if(try_id == 1000) return SCM(playerid, COLOR_GREY, "Kesalahan pencarian pertanyaan.");

	if(gExamAlreadyAnswered[playerid][rand]) goto SEARCH_QUEST;

	SetPlayerUseListitem(playerid, rand);

	String = "";

	strcat(String, gExamQuestions[rand]);
	strcat(String, "\n");

	strcat(String, gExamAnswers[rand][0]);
	strcat(String, "\n");

	strcat(String, gExamAnswers[rand][1]);
	strcat(String, "\n");

	strcat(String, gExamAnswers[rand][2]);
	strcat(String, "\n");

	strcat(String, gExamAnswers[rand][3]);
	strcat(String, "\n");

	format(format_string, 64, "Pertanyaan: %i/5", GetPVarInt(playerid, "question_number") + 1);
	return SPD(playerid, 8719, DIALOG_STYLE_LIST, format_string, String, "Pilih", "");
}

stock GivePlayerAmmoBox(playerid)
{
    if(GetPVarInt(playerid, "take_mats")) return 0;

	SCM(playerid, -1, "Jika Anda ingin melempar kotak itu dari tangan Anda, gunakan: /drop");

    SetPVarInt(playerid, "take_mats", 1);

    SetPlayerAttachedObject(playerid, 7, 2358, 1,0.11,0.36,0.0,0.0,90.0);

    ApplyAnimation(playerid,"CARRY","liftup",1.0,0,1,1,0,0,1);
	SetTimerEx("PlayerUseCarryAnim", 1500, false, "i", playerid);

    return 1;
}

stock GetPlayerHospitalID(playerid)
{
	switch(GetPlayerVirtualWorld(playerid))
	{
	    case 6: return 0;
		case 8: return 1;
		case 9: return 2;
	}

	return 0;
}

stock RemovePlayerAmmoBox(playerid, bool: dont_use_anim = false)
{
	if(!GetPVarInt(playerid, "take_mats")) return 0;

    DeletePVar(playerid, "take_mats");

    SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);

    if(!dont_use_anim) ApplyAnimation(playerid,"CARRY","putdwn",4.0,0,1,1,0,0,1);

    RemovePlayerAttachedObject(playerid, 7);

    return 1;
}
stock UpdateArmyWarehouse3D(army_id)
{
	new a_id = GetArmyLowID(army_id);

    format(format_string, 64, "Logam: %i/200000\nKartrid: %i/200000",  FracInfo[army_id][fBank][0],  FracInfo[army_id][fBank][1]);
    return UpdateDynamic3DTextLabelText(army_warehouse_3d[a_id], -1, format_string);
}

stock GetArmyLowID(army_id)
{
	switch(army_id)
	{
	    case FRACTION_ARMY_LS: return 0;
	    case FRACTION_ARMY_SF: return 1;
	    case FRACTION_ARMY_LV: return 2;
	}

	return -1;
}

stock UpdateShipAmmo(ammo_amount, metall_amount)
{
    ship_metall_amount += metall_amount;
    ship_ammo_amount += ammo_amount;

    format(format_string, 64, "Status gudang:\nKartrid: %i\nLogam: %i", ship_ammo_amount, ship_metall_amount);
    UpdateDynamic3DTextLabelText(ship_ammo_3d, -1, format_string);
}

stock UpdateBizzLabelText(b)
{
	String = "";

    if(BizzInfo[b][bOwned] == 0)
    {
        format(String, 244, "{FFFF00}%s[%i]\n{66CC00}Dijual\nHarga: {FFCD00}%d$\n{66CC00}Kontrol: {0099FF}%s\n{66CC00}/belitoko untuk pembelian",BizzInfo[b][bMessage],b,BizzInfo[b][bBuyPrice], GetMafiaName(BizzInfo[b][bMafia]));
    }
    else
    {
        if(BizzInfo[b][bEntranceCost] == 0) format(String, 244, "{FFFF00}%s[%i]\n{ffffff}Pemilik: {0099FF}%s\n{ffffff}Kontrol: {0099FF}%s\n{66CC00}Login: {FF9900}Gratis", BizzInfo[b][bMessage],b, BizzInfo[b][bOwner], GetMafiaName(BizzInfo[b][bMafia]));
		else format(String, 244, "{FFFF00}%s[%i]\n{ffffff}Pemilik: {0099FF}%s\n{ffffff}Kontrol: {0099FF}%s\n{66CC00}Login: {FF9900}%d$", BizzInfo[b][bMessage],b, BizzInfo[b][bOwner], GetMafiaName(BizzInfo[b][bMafia]), BizzInfo[b][bEntranceCost]);
	}
	Update3DTextLabelText(BizzInfo[b][bLabel], 0x00D900FF, String);
}


epublic: LoadAtms()
{
    new rows;
	cache_get_row_count(rows);

	if(!rows) return print("[MySQL R41-3]: Tidak ada ATM untuk diunduh");

 	for(new i = 1; i <= rows; i++)
	{
	    cache_get_value_name_int(i-1, "aID", AtmsInfo[i][aID]);
	    cache_get_value_name_int(i-1, "aActive", AtmsInfo[i][aActive]);
	    cache_get_value_name_int(i-1, "aMoney", AtmsInfo[i][aMoney]);

	    cache_get_value_name_float(i-1, "aObjectPosX", AtmsInfo[i][aObjectPosX]);
	    cache_get_value_name_float(i-1, "aObjectPosY", AtmsInfo[i][aObjectPosY]);
	    cache_get_value_name_float(i-1, "aObjectPosZ", AtmsInfo[i][aObjectPosZ]);
	    cache_get_value_name_float(i-1, "aObjectPosA", AtmsInfo[i][aObjectPosA]);

	    AtmsInfo[i][aObject] = CreateDynamicObject(2754, AtmsInfo[i][aObjectPosX], AtmsInfo[i][aObjectPosY], AtmsInfo[i][aObjectPosZ], 0.00000000,0.00000000, AtmsInfo[i][aObjectPosA]);

	    SetObjectMaterialText(AtmsInfo[i][aObject], " ATM", 2, 60,"Arial", 30, 0, 0xFF000000, 0x80FFFF00, 0);
        CreateDynamic3DTextLabel("{6495ED}Klik: \'Spasi\'", -1, AtmsInfo[i][aObjectPosX], AtmsInfo[i][aObjectPosY], AtmsInfo[i][aObjectPosZ] + 1.2, 5,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 0);

	    AtmsInfo[i][aAreaEnters] = CreateDynamicSphere(AtmsInfo[i][aObjectPosX], AtmsInfo[i][aObjectPosY], AtmsInfo[i][aObjectPosZ], 1.2);
        UpdateCollectorAmount(i, 50);
	    TotalAtms++;
 	}
 	return printf("[MySQL R41-3]: ATM dimuat: %i pcs.", TotalAtms);
}
epublic: LoadOthers()
{
	new rows;
	cache_get_row_count(rows);

	if(!rows) return print("[MySQL R41-3]: Tidak ada data untuk diunduh");

    cache_get_value_name_int(0, "election_status", election_status);

    cache_get_value_name_int(0, "bonus_exp", bonus_exp);
    cache_get_value_name_int(0, "bonus_donate", bonus_donate);

    if(bonus_exp || bonus_donate) SendRconCommand(SERVER_NAME_BONUS);
	else SendRconCommand(SERVER_NAME);

    if(election_status) StartElecation();

    tzer[0] = CreateDynamicPickup(1275,23,2182.8667,-2253.4536,14.7750,0);//job1
    tzer[1] = CreateDynamicPickup(1275,23,-467.0607,-71.2344,60.1902,0);//job2
    tzer[2] = CreateDynamicPickup(1575,23,2559.2061,-1287.2175,1044.1250,0);
	tzer[3] = CreateDynamicPickup(1575,23,2551.1902,-1287.2198,1044.1250,0);
	tzer[4] = CreateDynamicPickup(1575,23,2543.1052,-1287.2198,1044.1250,0);
	tzer[5] = CreateDynamicPickup(1575,23,2543.0447,-1300.0944,1044.1250,0);
	tzer[6] = CreateDynamicPickup(1575,23,2551.0505,-1300.0936,1044.1250,0);
	tzer[7] = CreateDynamicPickup(1575,23,2559.0759,-1300.0935,1044.1250,0);
	tzer[8] = CreateDynamicPickup(1275,23,396.2727,-2074.5969,7.8359,0);
	tJob3 = CreateDynamicPickup(1275,23,2567.9734,-1282.8855,1044.1250,0);
    zavodd[0] = CreateDynamicPickup(1318,23,-1006.7512,-696.2361,32.0078,0,0,-1,100.0);
    zavodd[1] = CreateDynamicPickup(1318,23,2577.3020,-1289.9539,1044.1250,0,2,-1,100.0);
    CreateDynamic3DTextLabel("Pabrik grosir\n{FF6347}Login",0x27C400FF,-1006.7512,-696.2361,32.0078,20.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,1,-1,-1);
    CreateDynamic3DTextLabel("Pabrik grosir\n{FF6347}Keluar",0x27C400FF,2577.3020,-1289.9539,1044.1250,20.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,1,-1,-1);
	return print("[MySQL R41-3]: Informasi lain yang diunggah");
}



CMD:setbizprice(playerid, params[])
{
	if(admin_level[playerid] == 0) return 1;

    for(new i; i < MAX_BIZZ; i++)
	{
        if(!PlayerToPoint(10.0, playerid, BizzInfo[i][bEntranceX], BizzInfo[i][bEntranceY], BizzInfo[i][bEntranceZ])) continue;

        if(sscanf(params, "i",params[0])) return Send(playerid, -1, "Masuk: /setbizprice [price]");

		if(!(1 <= params[0] <= 10000000))
		    return SCM(playerid, COLOR_GREY, "Masukkan harga dari 1 hingga 10.000.000");

		BizzInfo[i][bBuyPrice] = params[0];

        SaveBizzPer(i, "bBuyPrice", params[0]);

        return SCMF(playerid, COLOR_GREEN, "Anda telah mengubah nilai bisnis %i pada rp%i", i, params[0]);
	}

	return SCM(playerid, COLOR_GREY, "Tidak ada bisnis di dekat Anda.");
}


CMD:abiz(playerid, params[])
{
    if(admin_level[playerid] < 7 || !admin_logged[playerid]) return 1;
	if(sscanf(params, "d",params[0])) return Send(playerid, -1, "Masuk: /abiz [biznumber]");
	if(params[0] > TotalBizz || params[0] < 0) return Send(playerid, -1, "Tidak ada bisnis yang ditemukan dengan ID ini.");

    SetPVarInt(playerid, "next_area", gettime() + 3);

	SetPlayerInterior(playerid, 0), SetPlayerVirtualWorld(playerid, 0);
	SetPlayerPos(playerid, BizzInfo[params[0]][bEntranceX] + 2.0, BizzInfo[params[0]][bEntranceY] + 2.0, BizzInfo[params[0]][bEntranceZ]);
	return SCMF(playerid, -1, "Anda telah diteleport ke bisnis {FFE569}%s(%d).", BizzInfo[params[0]][bMessage], params[0]);
}
CMD:afuel(playerid, params[])
{
    if(admin_level[playerid] < 7 || !admin_logged[playerid]) return 1;
	if(sscanf(params, "d",params[0])) return Send(playerid, -1, "Masuk: /afuel [fuelnumber]");
	if(params[0] > TotalABizz || params[0] <= 0) return Send(playerid, -1, "Tidak ada SPBU dengan ID ini ditemukan.");

	SetPlayerInterior(playerid, 0), SetPlayerVirtualWorld(playerid,0);
	SetPlayerPos(playerid, BizzAInfo[params[0]][aAreaFillX], BizzAInfo[params[0]][aAreaFillY], BizzAInfo[params[0]][aAreaFillZ]);
	return SCMF(playerid, -1, "Anda telah diteleportasi ke SPBU {FFE569}%s(%d).", BizzAInfo[params[0]][aMessage], params[0]);
}
CMD:ahouse(playerid, params[])
{
    if(admin_level[playerid] < 7 || !admin_logged[playerid]) return 1;
	if(sscanf(params, "d",params[0])) return Send(playerid, -1, "Masuk: /ahouse [housenumber]");
	if(params[0] > MAX_HOUSES-1 || params[0] <= 0) return Send(playerid, -1, "Tidak ada rumah dengan ID ini ditemukan.");

	SetPlayerInterior(playerid, 0), SetPlayerVirtualWorld(playerid,0);
	SetPlayerPos(playerid, HouseInfo[params[0]][hEntrancex], HouseInfo[params[0]][hEntrancey], HouseInfo[params[0]][hEntrancez]);
	return SCMF(playerid, -1, "Anda dipindahkan ke rumah {FFE569}%d.", params[0]);
}

CMD:freeze(playerid, params[])
{
    if(admin_level[playerid] < 2 || !admin_logged[playerid]) return 1;

    new to_player, toggle;

    if(sscanf(params, "ui",to_player, toggle)) return Send(playerid, -1, "Masuk: /freeze [id] [0 - membeku, 1 - mencairkan es]");

	if(!(0 <= toggle <= 1)) return Send(playerid, -1, "Masuk: /freeze [id] [0 - membeku, 1 - mencairkan es]");

	TogglePlayerControllable(to_player, toggle);

	SCMF(playerid, -1, "Kamu adalah %s pemain %s.", toggle ? ("dicairkan") : ("membeku"), GN(to_player));
	SCMF(to_player, -1, "Administrator %s %s Kamu.", Name(playerid), toggle ? ("membeku") : ("dicairkan"));

	return 1;
}

CMD:givegun(playerid, params[])
{
    if(admin_level[playerid] < 9 || !admin_logged[playerid]) return Send(playerid, -1, "CMD ini hanya untuk Owner Server Yadi Mangyadi saja");
    if(sscanf(params, "ddd",params[0],params[1],params[2])) return Send(playerid, -1, "Masuk: /givegun [id] [id lengan] [ammo]");
	if(params[2] < 1 || params[2] > 5000) return Send(playerid, -1, "Anda tidak boleh membagikan kurang dari 1 dan lebih dari 1000 putaran!");
	GivePlayerWeapon(params[0],params[1],params[2]);

	SCMF(playerid, -1, "Anda memberi pemain %s[%d] senjata sementara {1A8FA9}%s (%d Jumlah.)", Name(params[0]), params[0], weapname[params[1]], params[2]);
	SCMF(params[0], -1, "Administrator %s[%d] memberimu senjata sementara {1A8FA9}%s (%d Jumlah.)", Name(playerid), playerid, weapname[params[1]], params[2]);
	//format(String, sizeof(String), "~y~<CMD> ~w~%s[%d] gave gun %s to the player %s[%d]", Name(playerid), playerid, weapname[params[1]], Name(params[0]), params[0]), AdminChatMessage(String);

	return 1;
}

CMD:key(playerid)
{
	new car_id = GetPlayerUseHomeCar(playerid);

	if(car_id == -1)
	    return SCM(playerid, COLOR_GREY, "Anda tidak berada dalam transportasi pribadi.");

    player_car_keys[playerid][car_id] = !player_car_keys[playerid][car_id];

	new vehicleid = GetPlayerVehicleID(playerid);

    GetVehicleParamsEx(vehicleid,engine,lights,alarm,doors,bonnet,boot,objective);
    if(!player_car_keys[playerid][car_id]) SetVehicleParamsEx(vehicleid,0,lights,alarm,doors,bonnet,boot,objective);

	SCMF(playerid, -1, "Kamu adalah %s kunci.", player_car_keys[playerid][car_id] ? ("dimasukkan") : ("ditarik keluar"));

	return 1;
}


CMD:lock(playerid, params[])
{
    if(sscanf(params,"d",params[0])) return Send(playerid,-1, "Gunakan: /lock [jenis] (1 - Mobil rumah 2 - Mobil sewaan 3 - Transportasi kerja)");

	switch(params[0])
	{
		case 1:
		{
		    for(new i; i < MAX_PLAYER_VEHICLES; i++)
		    {
		        new vehicleid = player_home_car[playerid][i];

				if(vehicleid == INVALID_VEHICLE_ID) continue;

			    new Float:cx,Float:cy,Float:cz;
				GetVehiclePos(vehicleid, cx, cy, cz);
				if(!PlayerToPoint(5.0, playerid, cx, cy, cz)) continue;

				GetVehicleParamsEx(vehicleid,engine,lights,alarm,doors,bonnet,boot,objective);

				if(doors == 0)
				{
				    if(lights == 0) SetVehicleParamsEx(vehicleid,engine,1,alarm,1,bonnet,boot,objective);
					else SetVehicleParamsEx(vehicleid,engine,0,alarm,1,bonnet,boot,objective);
					GameTextForPlayer(playerid, "~w~CAR ~r~LOCK", 1000, 3);
					CarInfo[playerid][cLock][i] = 1;
				}
				else
				{
				    if(lights == 0) SetVehicleParamsEx(vehicleid,engine,1,alarm,0,bonnet,boot,objective);
					else SetVehicleParamsEx(vehicleid,engine,0,alarm,0,bonnet,boot,objective);
					GameTextForPlayer(playerid, "~w~CAR ~g~UNLOCK", 1000, 3);
					CarInfo[playerid][cLock][i] = 0;
				}

				SetPlayerChatBubble(playerid, !doors ? ("pintu mobil tertutup") : ("membuka pintu mobil"),COLOR_PURPLE,30.0,10000);

				PlayerPlaySoundEx(24600, cx, cy, cz);
				SetTimerEx("LightOff", 1000, false, "dd", playerid, vehicleid);

				return 1;
			}

			return Send(playerid,COLOR_GREY,"Anda terlalu jauh dari mobil pribadi Anda.");
		}
		case 2:
		{
			if(rent_vehicle_id[playerid] == INVALID_VEHICLE_ID) return Send(playerid, COLOR_GREY, "Anda tidak memiliki kunci transportasi yang disewa!");

			new Float:cx,Float:cy,Float:cz;
			GetVehiclePos(rent_vehicle_id[playerid], cx, cy, cz);

			if(PlayerToPoint(4.0, playerid, cx, cy, cz))
			{
				GetVehicleParamsEx(rent_vehicle_id[playerid],engine,lights,alarm,doors,bonnet,boot,objective);

				if(doors == 0)
				{
					GameTextForPlayer(playerid, "~w~CAR ~r~LOCK", 1000, 3);
					SetVehicleParamsEx(rent_vehicle_id[playerid],engine,lights,alarm,1,bonnet,boot,objective);
				}
				else
				{
					GameTextForPlayer(playerid, "~w~CAR ~g~UNLOCK", 1000, 3);
					SetVehicleParamsEx(rent_vehicle_id[playerid],engine,lights,alarm,0,bonnet,boot,objective);
				}

				SetPlayerChatBubble(playerid, !doors ? ("pintu mobil tertutup") : ("membuka pintu mobil"),COLOR_PURPLE,30.0,10000);

				PlayerPlaySoundEx(24600, cx, cy, cz);
			}
			else Send(playerid, COLOR_GREY,"Anda terlalu jauh dari mobil sewaan!");
		}
		case 3:
		{
			if(rent_job_vehicle[playerid] == INVALID_VEHICLE_ID) return Send(playerid, COLOR_GREY, "Anda tidak memiliki kunci kendaraan sewaan!");

			new Float:cx,Float:cy,Float:cz;
			GetVehiclePos(rent_job_vehicle[playerid], cx, cy, cz);

			if(PlayerToPoint(4.0, playerid, cx, cy, cz))
			{
				GetVehicleParamsEx(rent_job_vehicle[playerid],engine,lights,alarm,doors,bonnet,boot,objective);

				if(doors == 0)
				{
					GameTextForPlayer(playerid, "~w~CAR ~r~LOCK", 1000, 3);
					SetVehicleParamsEx(rent_job_vehicle[playerid],engine,lights,alarm,1,bonnet,boot,objective);
				}
				else
				{
					GameTextForPlayer(playerid, "~w~CAR ~g~UNLOCK", 1000, 3);
					SetVehicleParamsEx(rent_job_vehicle[playerid],engine,lights,alarm,0,bonnet,boot,objective);
				}

				SetPlayerChatBubble(playerid, !doors ? ("pintu mobil tertutup") : ("membuka pintu mobil"),COLOR_PURPLE,30.0,10000);

				PlayerPlaySoundEx(24600, cx, cy, cz);
			}
			else Send(playerid, COLOR_GREY,"Anda terlalu jauh dari mobil yang bekerja!");
		}
	}
	return true;
}



public OnPlayerEnterDynamicArea(playerid, areaid)
{
    foreach(Player, i)
	{
	    if(GetPVarType(i, "BBArea"))
	    {
	        if(areaid == GetPVarInt(i, "BBArea"))
	        {
	            new station[256];
	            GetPVarString(i, "BBStation", station, sizeof(station));
	            if(!isnull(station))
				{
					PlayStream(playerid, station, GetPVarFloat(i, "BBX"), GetPVarFloat(i, "BBY"), GetPVarFloat(i, "BBZ"), 30.0, 1);
				 	SendClientMessage(playerid, -1, "You have entered an boombox area");
	            }
				return 1;
	        }
	    }
	}

    if(GetPVarInt(playerid, "next_area") >= gettime()) return 1;

	if(areaid == mayor_weather_area) SetPlayerWeather(playerid, 12);

	if(areaid == army_vv_enters[0])
	{
	    if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		{
			new vehicleid = GetPlayerVehicleID(playerid);

			SetVehiclePos(vehicleid, 291.2160,1821.9142,17.6406);
			SetVehicleZAngle(vehicleid, 265.9204);
	    }
	    else
	    {
	        SetPlayerPos(playerid, 291.2160,1821.9142,17.6406);
			SetPlayerFacingAngle(playerid, 265.9204);
	    }

	    SetPVarInt(playerid, "next_area", gettime() + 3);
	}

	if(areaid == army_vv_enters[1])
	{
	    if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		{
			new vehicleid = GetPlayerVehicleID(playerid);

			SetVehiclePos(vehicleid, 280.1693,1821.4052,17.6406);
			SetVehicleZAngle(vehicleid, 91.3529);
	    }
	    else
	    {
	        SetPlayerPos(playerid, 280.1693,1821.4052,17.6406);
			SetPlayerFacingAngle(playerid, 91.3529);
	    }

	    SetPVarInt(playerid, "next_area", gettime() + 3);
	}

	if(areaid == army_vv_enters[2])
	{
	    if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		{
			new vehicleid = GetPlayerVehicleID(playerid);

			SetVehiclePos(vehicleid, 349.2613,1793.7356,18.0919);
			SetVehicleZAngle(vehicleid, 236.9679);
	    }
	    else
	    {
	        SetPlayerPos(playerid, 349.2613,1793.7356,18.0919);
			SetPlayerFacingAngle(playerid, 236.9679);
	    }

	    SetPVarInt(playerid, "next_area", gettime() + 3);
	}

	if(areaid == army_vv_enters[3])
	{
	    if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		{
			new vehicleid = GetPlayerVehicleID(playerid);

			SetVehiclePos(vehicleid, 341.7746,1804.3756,18.1475);
			SetVehicleZAngle(vehicleid, 35.5160);
	    }
	    else
	    {
	        SetPlayerPos(playerid, 341.7746,1804.3756,18.1475);
			SetPlayerFacingAngle(playerid, 35.5160);
	    }

	    SetPVarInt(playerid, "next_area", gettime() + 3);
	}

	if(city_zones_id[0] <= areaid <= city_zones_id[2])
	{
	    new index = _:(areaid - city_zones_id[0]);

	    SetPVarInt(playerid, "city_id", index);

	}

	if(quest_area[0] <= areaid <= quest_area[1])
	{
	    ShowPlayerBegQuests(playerid);
	}

	if(areaid == rob_unload_area)
	{
		if(player_rob_id[playerid] == -1) return 1;

		if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return 1;

		new rob_id = player_rob_id[playerid];

		new vehicleid = rob_info[rob_id][r_vehicleid];

		if(GetPlayerVehicleID(playerid) != vehicleid) return 1;

		new amount = rob_info[rob_id][r_loaded];

		if(amount == 0)
		    return SCM(playerid, COLOR_GREY, "Van itu kosong.");

		new reward = 950 * amount;

		new partnerid = GetPlayerRobPartnerID(playerid);

		if(partnerid == INVALID_PLAYER_ID)
		{
		    GivePlayerMoneyEx(playerid, reward, "penjualan furnitur");

		    SCMF(playerid, -1, "Kamu punya {91d29a}$%i "W"untuk penjualan furnitur.", reward);

            player_rob_id[playerid] = -1;
		}
		else
		{
		    GivePlayerMoneyEx(playerid, reward / 2, "penjualan furnitur");
		    GivePlayerMoneyEx(partnerid, reward / 2, "penjualan furnitur");

		    SCMF(playerid, -1, "Kamu punya {91d29a}$%i "W"untuk penjualan furnitur.", reward / 2);
		    SCMF(partnerid, -1, "Kamu punya {91d29a}$%i "W"untuk penjualan furnitur.", reward / 2);

		    player_rob_id[playerid] = player_rob_id[partnerid] = -1;
		}

        DestroyVehicle(vehicleid);

		for(new x; x < 2; x++) rob_info[rob_id][r_player][x] = INVALID_PLAYER_ID;
		rob_info[rob_id][r_vehicleid] = INVALID_VEHICLE_ID;
	}

	if(rob_house_area[0] <= areaid <= rob_house_area[sizeof rob_house_area - 1])
	{
	    if(player_rob_id[playerid] == -1) return 1;

	    new index = _:(areaid - rob_house_area[0]);

	    new h_id = player_enter_home[playerid];

	    if(rob_obj_taked[h_id][index] == true) return 1;

	    SCM(playerid, 0xBC8F8Fff, "Anda telah mendekati subjek yang Anda bisa "W"untuk mencuri{BC8F8F}, gunakan: "W"ALT");
	}

	if(areaid == rob_area)
	{
	    if(!IsAGang(playerid)) return SCM(playerid, COLOR_GREY, "Saya tidak punya apa-apa untuk memberitahu Anda.");

	    if(player_rob_id[playerid] == -1)
	    	SPD(playerid, 1771, DIALOG_STYLE_MSGBOX, "Ujang", ROB_FIRST_TEXT, "Selanjutnya", "Batalkan");
	}

    if(player_quest_info[playerid][quest_id] == GQUEST_TYPE_DRUGMARK && player_quest_info[playerid][quest_status] == 1)
    {
		new mark_id = player_quest_info[playerid][quest_progress];

		if(areaid == stash_quest_area[mark_id])
		{
		    player_quest_info[playerid][quest_status] = 2;

            OnPlayerUpdateAccountsPer(playerid, "warehouse_quest_status", 2);

            ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 6.1, 0, 0, 0, 0, 0,1);

            if(PlayerInfo[playerid][pWanted] < 3)
            {
	            PlayerInfo[playerid][pWanted] = 3;
				SetPlayerCriminal(playerid, "Tidak dikenal", "Tab obat");
				SetPlayerWantedLevel(playerid, 3);
			}

            SetTimerEx("SendPlayerQuestInfoSMS", 2000, false, "ii", playerid, 4);
		}
    }

    if(areaid == getmoney_quest_area)
	{
	    if(player_quest_info[playerid][quest_id] != GQUEST_TYPE_MONEY) return 1;

		new vehicleid = GetPlayerVehicleID(playerid);

		if(vehicleid == INVALID_VEHICLE_ID || playerid != quest_vehicle_owner[vehicleid]) return 1;

		PlayerEndQuests(playerid);

		GivePlayerMoneyEx(playerid, 175000, "pencarian");

		SCM(playerid, -1, "Anda menyelesaikan tugas dan menerima Rp.175.000");

		DestroyVehicle(vehicleid);

		quest_vehicle_owner[vehicleid] = INVALID_PLAYER_ID;
	    player_quest_info[playerid][quest_vehicle_id] = INVALID_VEHICLE_ID;
	}

	if(areaid == jackcar_quest_area)
	{
	    if(player_quest_info[playerid][quest_id] != GQUEST_TYPE_CARJACK) return 1;

		new vehicleid = GetPlayerVehicleID(playerid);

		if(vehicleid == INVALID_VEHICLE_ID || playerid != quest_vehicle_owner[vehicleid]) return 1;

		player_quest_info[playerid][quest_status] = 2;

		OnPlayerUpdateAccountsPer(playerid, "warehouse_quest_status", 2);

		SCM(playerid, -1, "Tugas selesai, buka {71E00B}Penunggang"W".");

		DestroyVehicle(vehicleid);

		quest_vehicle_owner[vehicleid] = INVALID_PLAYER_ID;
	    player_quest_info[playerid][quest_vehicle_id] = INVALID_VEHICLE_ID;
	}

	if(areaid == warehouse_area)
	{
	    if(!IsAGang(playerid)) return SCM(playerid, COLOR_GREY, "Anda bukan anggota geng.");

	    //if(!(5 <= DayOfWeak() <= 7)) return SCM(playerid, COLOR_GREY, "Tidak ada pekerjaan hari ini, datanglah lain kali.");

	    if(player_quest_info[playerid][quest_block] != 0)
	        return SCM(playerid, COLOR_GREY, "Saya belum memiliki pekerjaan untuk Anda.");

	    new q_id = player_quest_info[playerid][quest_id];
	    new q_status = player_quest_info[playerid][quest_status];

	    if(q_id > GQUEST_TYPE_KEYPDSTEAL) return SCM(playerid, COLOR_GREY, "Tidak ada lagi pekerjaan untuk Anda di sini.");

	    if(q_id == 0 && q_status == 0)
		{
		    new member = PlayerInfo[playerid][pMember];
		    format(String, strlen(GQUEST_FIRST_TEXT), GQUEST_FIRST_TEXT, FracInfo[member][fName]);
			SPD(playerid, 9471, DIALOG_STYLE_MSGBOX, "Pertemuan pertama", String, "Jawab", "Batalkan");
		}
		else if(q_status == 0) SPD(playerid, 9471, DIALOG_STYLE_MSGBOX, "Ujang", ""W"Saya punya tugas baru untuk Anda", "Ya", "Tidak");
		else if(q_status == 1) SPD(playerid, 0000, DIALOG_STYLE_MSGBOX, "Ujang", ""W"Anda belum menyelesaikan tugas, pergi dan selesaikan itu.", "Tutup", "");
		else
		{
		    //GivePlayerQuestReward(playerid);

		    player_quest_info[playerid][quest_id]++;
		    player_quest_info[playerid][quest_status] = 0;
		    player_quest_info[playerid][quest_progress] = 0;

		    OnPlayerUpdateAccountsPer(playerid, "warehouse_quest_id", player_quest_info[playerid][quest_id]);
		    OnPlayerUpdateAccountsPer(playerid, "warehouse_quest_status", 0);
		    OnPlayerUpdateAccountsPer(playerid, "warehouse_quest_progress", 0);

		    if(q_id != GQUEST_TYPE_GRAFFITI)
			{
				player_quest_info[playerid][quest_block] = 30;
		    	OnPlayerUpdateAccountsPer(playerid, "warehouse_quest_block", 30);
		    }

		    if(q_id != GQUEST_TYPE_KEYPDSTEAL) SPD(playerid, 0000, DIALOG_STYLE_MSGBOX, "Ujang", quest_text_end[q_id], "Tutup", "");
		    else SPD(playerid, 9475, DIALOG_STYLE_MSGBOX, "Ujang", quest_text_end[q_id], "Selanjutnya", "");
		}
	}

	if(areaid == stash_area)
	{


	    if(PlayerInfo[playerid][pDrugMarkAmount] != 0)
	        return SCM(playerid, COLOR_GREY, "Anda belum mengambil nick terakhir, gunakan: /drugs");

	    SPD(playerid, 7791, DIALOG_STYLE_MSGBOX, "Daftar Produk", "Apakah Anda ingin membeli obat?", "Ya", "Tidak");
	}

    if(quest_frac_area[0] <= areaid <= quest_frac_area[4])
	{
	    if(!IsAGang(playerid)) return 1;

	    new index = _:(areaid - quest_frac_area[0]);

	    if(GetFractionGangID(playerid) != index) return 1;

	    if(player_quest_info[playerid][quest_vehicle_id] != GetPlayerVehicleID(playerid)) return 1;

	    if(player_quest_info[playerid][quest_id] == GQUEST_TYPE_MATS && player_quest_info[playerid][quest_status] == 1)
	    {
	        wh_ammo_gang[index] += 5000;
			wh_drugs_gang[index] += 500;

			format(format_string, 128, "[F] Pemain %s[%i] dikirim ke pangkalan 5000 pt dan 500 g. obat-obatan.", GetPlayerNameEx(playerid), playerid);
			SendFrac(PlayerInfo[playerid][pMember],COLOR_GREEN,format_string);

			DeletePlayerQuestData(playerid);

			PlayerEndQuests(playerid);
	    }
	}

	if(graffiti_area[0] <= areaid <= graffiti_area[MAX_GRAFFITI - 1])
	{
	    if(!IsAGang(playerid)) return 1;

	    new index = _:(areaid - graffiti_area[0]);

	    GameTextForPlayer(playerid, graffiti_colored[index], 3000, 4);

	    if(graffiti_block[index] > gettime())
	        return SCM(playerid, COLOR_GREY, "Pengecatan ulang tidak tersedia dalam satu jam berikutnya.");

	    if(PlayerInfo[playerid][pMember] == graffiti_fraction[index])
	        return SCM(playerid, COLOR_GREY, "Geng Anda sudah memiliki grafiti ini.");

	    PlayerTextDrawTextSize(playerid, graffiti_player_td[playerid], 273.6195, 0.0000);

     	graffiti_player_id[playerid] = index;

	    graffiti_player_progress[playerid] = 0;
	}

	if(areaid == duel_area)
	{
	    if(!IsAGang(playerid))
	        return SCM(playerid, COLOR_GREY, "Tinggalkan, Anda tidak diterima di sini.");

	    new str[46];

	    String = "";

	    for(new i, z = sizeof duel_weapons_id; i < z; i++)
	    {
	        format(str, 46, "%i. %s\n", i + 1, duel_weapons_name[i]);
	        strcat(String, str);
	    }

	    SPD(playerid, 9981, DIALOG_STYLE_LIST, "Pilih senjata pertama Anda", String, "Pilih", "Tutup");
	}

	if(wh_pickup[0] <= areaid <= wh_pickup[sizeof wh_pickup - 1])
	{
	    new index = areaid - wh_pickup[0];

	    if(PlayerInfo[playerid][pMember] != wh_pickup_gang[index])
	        return SCM(playerid, COLOR_GREY, "Anda tidak memiliki akses ke gudang ini..");

		if(PlayerInfo[playerid][pRank] < wh_rang_gang[index])
		    return SCMF(playerid, COLOR_GREY, "Gudang tersedia dari %i peringkat.", wh_rang_gang[index]);

		ShowPlayerWarehouseDialog(playerid);
	}

	if(bike_rent[0] <= areaid <= bike_rent[sizeof bike_rent - 1])
	{
	    if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return 1;

	    SetPlayerUseListitem(playerid, areaid - bike_rent[0]);

	    SPD(playerid, 4378, DIALOG_STYLE_MSGBOX, "Sewa", ""W"Anda yakin ingin menyewa skuter?\nHarga: $50\n{afafaf}- Transport akan hilang jika tidak duduk dalam 40 detik", "Ya", "Tidak");
	}
	
	if(pln_rent[0] <= areaid <= pln_rent[sizeof pln_rent - 1])
    {
	    if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return 1;

	    SetPlayerUseListitem(playerid, areaid - pln_rent[0]);

	    SPD(playerid, 8888, DIALOG_STYLE_MSGBOX, "Kendaraan Motor Gp", ""W"Silakan Klik Ya Untuk Mengambil Kendaraan\n{afafaf}- Transport akan hilang jika tidak duduk dalam 40 detik", "Ya", "Tidak");
	}

    if(player_bone_table[playerid] == -1)
	{
	    if(casino_info_area[0] <= areaid <= casino_info_area[sizeof casino_info_area - 1])
	    {
	        new index = _:(areaid - casino_info_area[0]);
	        return PlayerEnterToBoneTable(playerid, index);
	    }
	}

	if(areaid == hotel_reception_area)
	{
		if(GetPlayerHouse(playerid) != -2) return SCM(playerid, COLOR_GREY, "Anda sudah memiliki rumah.");
		if(GetPlayerHouseLodger(playerid) != -2) return SCM(playerid, COLOR_GREY, "Anda sudah terdaftar di suatu tempat, gunakan: /leavelodger");
	    if(PlayerInfo[playerid][pHotel] != -2) return SCM(playerid, COLOR_GREY, "Anda sudah memiliki kamar hotel.");

	    command_text = "";

	    new str[64], count = 0;

	    for(new i; i < MAX_HOTELS; i++)
	    {
	        if(hotel_info[i][hOwned] == 1) continue;

	        if(count == 20) break;

	        //SetPlayerListitemValue(playerid, count++, i);

	        format(str, 64, "\n[%i] lantai. %i nom. %i, harga: $%i", i + 1, hotel_info[i][hFloor] + 1, hotel_info[i][hNumber], hotel_info[i][hPrice]);
			strcat(command_text, str);

			count++;
	    }

	    strcat(command_text, "\n\nMasukkan angka:");

	    return ShowPlayerDialog(playerid, 4373, DIALOG_STYLE_INPUT, "Daftar kamar yang tersedia", command_text, "Sewa", "Tutup");
	}

    if(hotel_areas[0] <= areaid <= hotel_areas[sizeof hotel_areas - 1])
	{
	    if(player_hotel_id[playerid] != -1) return 1;

	    new index = _:(areaid - hotel_areas[0]);

	    new floor = player_hotel_floor[playerid];

		new h_id = g_entrance_flat[floor][index];

	    new is_owned = hotel_info[h_id][hOwned];

	    if(is_owned == 0) return 1;

	    SetPlayerUseListitem(playerid, h_id);

	    command_text = "";

		new str[64];

	    format(str, 64, "Yg sewa: %s", hotel_info[h_id][hOwner]);
	    strcat(command_text, str);

	    format(str, 32, "\nNomor Hotel: %i", index + 1);
	    strcat(command_text, str);

	    format(str, 16, "\nLantai: %i", floor + 1);
	    strcat(command_text, str);

		return ShowPlayerDialog(playerid, 4872, DIALOG_STYLE_MSGBOX, "Entri angka", command_text, "Masuk", "Tutup");
	}

    if(areaid == race_area)
    {
        if(PlayerInfo[playerid][pLicenses][0] != 1) return Send(playerid,-1,"Anda tidak memiliki SIM.");

        if(race_state != 1) return SCM(playerid, COLOR_GREY, "Pendaftaran saat ini ditutup.");

		if(player_race_reg{playerid}) return SPD(playerid, 1872, DIALOG_STYLE_MSGBOX, "Balapan", "{FFFFFF}Apakah Anda ingin membatalkan balapan", "Ya", "Tidak");

		SPD(playerid, 1871, DIALOG_STYLE_MSGBOX, "Balapan", "{FFFFFF}Anda ingin balapan?", "Ya", "Tidak");
    }
    else if(areaid == hotel_lift)
    {
        ShowPlayerDialog(playerid, 4771, DIALOG_STYLE_INPUT, "Pemilihan lantai", "Masukkan nomor lantai:\n1 hingga 7", "Pilih", "Tutup");
    }
    else if(areaid == family_create_area)
    {
        if(PlayerInfo[playerid][pFamily] != -1) return SCM(playerid, COLOR_GREY, "Anda sudah menjadi anggota keluarga!");

		if(PlayerInfo[playerid][pCash] < 1000000) return SCM(playerid, COLOR_GREY, "Anda tidak memiliki jumlah yang diperlukan: $1.000.000");

		ShowPlayerCreateFamilyDialog(playerid, 0);
    }
    else if(areaid == tune_engine_area)
    {
        new use_car = GetPlayerUseHomeCar(playerid);

        if(use_car == -1) return SCM(playerid, COLOR_GREY, "Anda tidak berada dalam transportasi pribadi.");

		new vehicleid = GetPlayerVehicleID(playerid);

        if(IsABoat(vehicleid) || IsABike(vehicleid) || IsAPlane(vehicleid) || NoPerfomance(vehicleid)) return Send(playerid, 0xafafafff, "Anda tidak dapat menginstal peningkatan pada jenis transportasi ini!");

		ShowPlayerTuneEngine(playerid);
    }
    else if(areaid == tune_brake_area)
    {
        new use_car = GetPlayerUseHomeCar(playerid);

        if(use_car == -1) return SCM(playerid, COLOR_GREY, "Anda tidak berada dalam transportasi pribadi.");

        new vehicleid = GetPlayerVehicleID(playerid);

        if(IsABoat(vehicleid) || IsABike(vehicleid) || IsAPlane(vehicleid) || NoPerfomance(vehicleid)) return Send(playerid, 0xafafafff, "Anda tidak dapat menginstal peningkatan pada jenis transportasi ini!");
        ShowPlayerTuneBrake(playerid);
    }
    else if(areaid == trash_unload)
    {
        if(PlayerInfo[playerid][pJob] != 4) return 1;

        if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return true;//Send(playerid,-1,"pemain tidak mengemudi");

        new vehicleid = GetPlayerVehicleID(playerid);

        if(VehInfo[vehicleid][vFr] != 4) return SendClientMessage(playerid, COLOR_GREY, "Anda tidak berada di truk sampah!");

		new amount = trash_vehicle_amount[vehicleid];

        if(amount <= 0) return SendClientMessage(playerid, COLOR_GREY, "Sampah kosong!");

        new salary = amount * 10;

        new partner_id = GetPlayerInVehicleSeat(vehicleid, 1);
        if(partner_id != INVALID_PLAYER_ID && PlayerInfo[partner_id][pJob] == 4)
        {
            new partner_salary = salary / 2;

			GivePlayerPayCheck(partner_id, partner_salary);

			SCMF(partner_id, -1, "Anda menurunkan truk sampah, diterima: {91d29a}$%i", partner_salary);

			salary /= 2;
        }

        GivePlayerPayCheck(playerid, salary);

		SCMF(playerid, -1, "Anda menurunkan truk sampah, diterima: {91d29a}$%i", salary);

		if(partner_id != INVALID_PLAYER_ID)
		{
		    SendClientMessage(playerid, -1, "Pembayaran dibagi antara Anda dan pasangan!");
		    SendClientMessage(partner_id, -1, "Pembayaran dibagi antara Anda dan pasangan!");
		}
		DisablePlayerCheckpoint(playerid);
		UpdateVehicleTrashInfo(vehicleid, -amount);
    }
    else if(areaid == collector_unload)
    {
        if(PlayerInfo[playerid][pJob] != 5) return 1;

        if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return Send(playerid,-1,"Anda tidak berada dalam mobil koleksi!");

        new vehicleid = GetPlayerVehicleID(playerid);

        if(VehInfo[vehicleid][vFr] != 5) return SendClientMessage(playerid, COLOR_GREY, "Anda bukan mobil pengumpul!");

        new amount = collector_vehicle_amount[vehicleid];

        if(amount <= 0) return SendClientMessage(playerid, COLOR_GREY, "Tidak ada uang di kolektor!");

        new salary = amount * 10;

        new partner_id = GetPlayerInVehicleSeat(vehicleid, 1);
        if(partner_id != INVALID_PLAYER_ID && PlayerInfo[partner_id][pJob] == 5)
        {
            new partner_salary = salary / 2;

			GivePlayerPayCheck(partner_id, partner_salary);

			SCMF(partner_id, -1, "Anda membawa uang, diterima: {91d29a}$%i", partner_salary);

			salary /= 2;
        }

        GivePlayerPayCheck(playerid, salary);

		SCMF(playerid, -1, "Anda membawa uang, diterima: {91d29a}$%i", salary);

		if(partner_id != INVALID_PLAYER_ID)
		{
		    SendClientMessage(playerid, -1, "Pembayaran dibagi antara Anda dan pasangan!");
		    SendClientMessage(partner_id, -1, "Pembayaran dibagi antara Anda dan pasangan!");
		}
		DisablePlayerCheckpoint(playerid);

		UpdateVehicleCollectorInfo(vehicleid, -amount);
    }
    for(new i=1; i <= TotalActor; i++)
	{
		if(areaid == ActorInfo[i][aAreaActors]) return player_enter_actors[playerid] = i;
	}
 	//

  	for(new i=1; i <= TotalAtms; i++)
    {
        if(areaid == AtmsInfo[i][aAreaEnters])
		{
		    if(PlayerInfo[playerid][pJob] == 5 && rent_job_vehicle[playerid] != INVALID_VEHICLE_ID) return 1;

		    SetPlayerUseListitem(playerid, i);

			return MenuAtms(playerid);
		}
	}
	for(new i=1; i <= TotalABizz; i++)
    {
        if(areaid == BizzAInfo[i][aEntranceArea])
		{
		    //GameTextForPlayer(playerid, "~w~use key: ~g~y", 5000, 1);
		    return player_enter_fuel[playerid] = i;
		}
	}

	if(0 <= player_enter_home[playerid] <= MAX_HOUSES-1)
	{
	    new h_id = player_enter_home[playerid];

	    if(areaid != HouseInfo[h_id][hStoreArea]) return 1;

	    ShowPlayerHouseStore(playerid);
	}

	if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
	{
		for(new b; b < TotalBizz; b++)
	    {
	        if(areaid == BizzInfo[b][bEntranceArea])
			{
			    if(BizzInfo[b][bType] == 14) return 1;

			    if(BizzInfo[b][bEntranceCost] > 0 && GetPlayerBizz(playerid) != b && GetPVarInt(playerid, "EntranceOplataBizz") != b)
				{
				    SetPlayerUseListitem(playerid, b);

					format(String, 144, ""W"Penerimaan dibayar dan dibayar {FF9900}%d$\nAnda yakin ingin masuk %s?", BizzInfo[b][bEntranceCost], BizzInfo[b][bMessage]);
					return SPD(playerid, 63, DIALOG_STYLE_MSGBOX, "Login", String, "Ya", "Tidak");
				}

				return PlayerEnterToBizz(playerid, b);
			}

			if(areaid == BizzInfo[b][bExitArea])
			{
		        if(player_reg_pb[playerid] != -1)
		        {
		            GivePlayerMoneyEx(playerid, 2000, "registrasi PB terganggu");

		            SCM(playerid, COLOR_GREY, "Registrasi terputus, uang dikembalikan.");

	                GiveBusinessMoney(b, -500, -1);

		            player_reg_pb[playerid] = -1;
		        }

				SetPVarInt(playerid, "next_area", gettime() + 3);

		    	SetPlayerInterior(playerid,0), SetPlayerVirtualWorld(playerid,0);
				return SetPlayerPos(playerid, BizzInfo[b][bEntranceX], BizzInfo[b][bEntranceY], BizzInfo[b][bEntranceZ]);
			}
		}
	}

	return 1;
}




CMD:setbizname(playerid, params[])
{
	if(admin_level[playerid] == 0) return 1;

    for(new i; i < MAX_BIZZ; i++)
	{
        if(!PlayerToPoint(10.0, playerid, BizzInfo[i][bEntranceX], BizzInfo[i][bEntranceY], BizzInfo[i][bEntranceZ])) continue;

        if(!strlen(params)) return Send(playerid, -1, "Masuk: /setbizname [name]");

	    format(BizzInfo[i][bMessage], 48, params);

        mysql_format(mMysql, format_string, 144, "UPDATE `bizz` SET `bMessage` = '%e' WHERE `bID` = %d", params, i);
        mysql_tquery(mMysql, format_string);

        return SCMF(playerid, COLOR_GREEN, "Anda mengubah nama bisnis %i pada %s", i, params);
	}

	return SCM(playerid, COLOR_GREY, "Tidak ada bisnis di dekat Anda.");
}

CMD:setfuelprice(playerid, params[])
{
	if(admin_level[playerid] == 0) return 1;

    for(new i; i < MAX_aBIZZ; i++)
	{
        if(!PlayerToPoint(10.0, playerid, BizzAInfo[i][aAreaFillX], BizzAInfo[i][aAreaFillY], BizzAInfo[i][aAreaFillZ])) continue;

        if(sscanf(params, "i",params[0])) return Send(playerid, -1, "Masuk: /setfuelprice [price]");

		if(!(1 <= params[0] <= 10000000))
		    return SCM(playerid, COLOR_GREY, "Masukkan harga dari 1 hingga 10.000.000");

		BizzAInfo[i][aBuyPrice] = params[0];

        SaveABizzPer(i, "aBuyPrice", params[0]);

        return SCMF(playerid, COLOR_GREEN, "Anda telah mengubah biaya pengisian bahan bakar %i pada rp%i", i, params[0]);
	}

	return SCM(playerid, COLOR_GREY, "Tidak ada bisnis di dekat Anda.");
}

CMD:leave(playerid, params[])
{
    if(IsPlayerInAnyVehicle(playerid)) return Send(playerid, COLOR_GREY, "Fungsi tidak dapat digunakan di dalam mobil!");

    if(player_lecenie[playerid] != -1) return PlayerLeaveHospitalBed(playerid);

	if(player_news_live[playerid])
	{
	    format(format_string, 144, "[R] %s[%i] meninggalkan udara sendirian.", GetPlayerNameEx(playerid), playerid);
        SendFrac(FRACTION_NEWS, COLOR_GREEN, format_string);

	    SCM(playerid, COLOR_WHITE, "Anda meninggalkan siaran sendiri.");
	    player_news_live[playerid] = false;
	}

	if(PlayerInfo[playerid][pJob] != 0)
	{
		format(String, 96, ""W"Apakah Anda yakin ingin meninggalkan pekerjaan '%s'?", NamesJob(playerid));
		SPD(playerid,153,DIALOG_STYLE_MSGBOX, "Pemberhentian kerja", String, "Ya", "Tidak");
	}
	return 1;
}




public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	

}


/* bussines system database mysql

-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 05, 2021 at 08:12 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `szrp2021`
--

-- --------------------------------------------------------

--
-- Table structure for table `bizz`
--

CREATE TABLE `bizz` (
  `bID` int(11) NOT NULL,
  `bOwned` int(11) NOT NULL,
  `bOwner` varchar(32) CHARACTER SET utf8 NOT NULL,
  `bMessage` varchar(64) CHARACTER SET utf8 NOT NULL,
  `bEntranceX` float NOT NULL,
  `bEntranceY` float NOT NULL,
  `bEntranceZ` float NOT NULL,
  `bExitX` float NOT NULL,
  `bExitY` float NOT NULL,
  `bExitZ` float NOT NULL,
  `bBuyPrice` int(11) NOT NULL,
  `bEntranceCost` int(11) NOT NULL,
  `bMoney` int(11) NOT NULL,
  `bRaschet` int(11) NOT NULL,
  `bLocked` int(11) NOT NULL,
  `bInterior` int(11) NOT NULL,
  `bProducts` int(11) NOT NULL,
  `bPrice` int(11) NOT NULL,
  `bBarX` float NOT NULL,
  `bBarY` float NOT NULL,
  `bBarZ` float NOT NULL,
  `bMafia` int(11) NOT NULL,
  `bType` int(11) NOT NULL,
  `bVirtualWorld` int(11) NOT NULL,
  `bOplata` int(11) NOT NULL,
  `bSlet` int(11) NOT NULL,
  `bArenda` int(11) NOT NULL,
  `bUpdMusic` int(11) NOT NULL,
  `bUpdHeal` int(11) NOT NULL,
  `bUpdSub` int(11) NOT NULL,
  `bSotrud` int(11) NOT NULL,
  `bSklad` int(11) NOT NULL,
  `bPhone` int(11) NOT NULL,
  `bProcent` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

--
-- Dumping data for table `bizz`
--

INSERT INTO `bizz` (`bID`, `bOwned`, `bOwner`, `bMessage`, `bEntranceX`, `bEntranceY`, `bEntranceZ`, `bExitX`, `bExitY`, `bExitZ`, `bBuyPrice`, `bEntranceCost`, `bMoney`, `bRaschet`, `bLocked`, `bInterior`, `bProducts`, `bPrice`, `bBarX`, `bBarY`, `bBarZ`, `bMafia`, `bType`, `bVirtualWorld`, `bOplata`, `bSlet`, `bArenda`, `bUpdMusic`, `bUpdHeal`, `bUpdSub`, `bSotrud`, `bSklad`, `bPhone`, `bProcent`) VALUES
(0, 0, 'None', 'Alhambra', 1836.51, -1682.58, 13.345, 493.431, -24.908, 1000.67, 600000, 0, 0, 0, 0, 17, 200, 50, 499.673, -20.6195, 1000.68, 16, 1, 1, 15, 0, 600, 0, 0, 0, 0, 1000, 0, 0),
(1, 0, 'Nikias_Jons', 'PigPen', 2421.59, -1219.51, 25.5444, 1204.72, -13.8504, 1000.92, 400000, 350, 9571, 0, 0, 2, 606, 60, 1215.29, -13.2987, 1000.92, 17, 1, 2, 11, 0, 400, 0, 0, 0, 0, 1000, 0, 0),
(2, 0, 'Sanlou_Han', 'Misty Club', 2455.02, 1500.09, 11.6174, -2636.75, 1402.63, 906.461, 350000, 500, 100384, 384, 0, 3, 188, 50, -2652.82, 1410.16, 906.273, 17, 1, 3, 20, 0, 350, 0, 0, 0, 0, 1000, 0, 0),
(3, 0, 'None', 'Grove Street Bar', 2309.95, -1643.42, 14.8269, 501.918, -67.5654, 998.758, 500000, 0, 0, 0, 0, 11, 190, 50, 497.353, -76.0409, 998.758, 17, 1, 4, 15, 0, 500, 0, 0, 0, 0, 1000, 0, 0),
(4, 0, 'Alan_Lopez', 'Sobrino de Botin', 2269.86, -74.1605, 26.7723, -794.995, 489.28, 1376.2, 300000, 50, 3864, 576, 0, 1, 853, 50, -785.496, 500.074, 1371.74, 17, 2, 5, 18, 0, 300, 0, 0, 0, 0, 1000, 0, 0),
(5, 0, 'None', 'Vinewood Burger', 1199.18, -918.168, 43.1236, 362.817, -75.1131, 1001.51, 500000, 0, 0, 0, 0, 10, 150, 50, 377.075, -67.4374, 1001.51, 17, 2, 6, 15, 0, 500, 0, 0, 0, 0, 1000, 0, 0),
(6, 0, 'None', 'Marina Burger', 810.492, -1616.15, 13.5468, 460.543, -88.6363, 999.555, 650000, 0, 0, 0, 0, 4, 113, 50, 450.445, -83.6521, 999.555, 17, 2, 7, 15, 0, 650, 0, 0, 0, 0, 1000, 0, 0),
(7, 1, 'John_Forest', 'Idlewood Pizza', 2105.48, -1806.37, 13.5546, 372.268, -133.525, 1001.49, 550000, 0, 3456, 0, 0, 5, 178, 200, 375.888, -118.817, 1001.5, 17, 2, 8, 0, 1, 500, 0, 0, 0, 0, 1000, 0, 0),
(8, 0, 'Santiago_Launcher', 'Las Venturas Cluck', 2101.89, 2228.79, 11.0234, 364.977, -11.8434, 1001.85, 300000, 200, 41988, 0, 0, 9, 696, 200, 369.924, -6.01969, 1001.86, 17, 2, 9, 5, 0, 300, 0, 0, 0, 0, 1000, 0, 0),
(9, 1, 'Putu_Suhartawan', 'Marina Cluc', 928.914, -1352.79, 13.3437, 377.132, -193.303, 1000.63, 650000, 12, 0, 0, 0, 17, 200, 50, 379.239, -187.858, 1000.63, 17, 2, 10, 0, 1, 700, 0, 0, 0, 0, 1000, 0, 0),
(10, 0, 'None', 'Idelwood 24/7', 1928.6, -1776.17, 13.5468, -25.9341, -141.561, 1003.55, 900000, 0, 0, 0, 0, 16, 122, 50, -22.1168, -138.629, 1003.55, 17, 3, 11, 15, 0, 950, 0, 0, 0, 0, 1000, 0, 0),
(11, 1, 'Kurt_Knispel', 'Flint 24/7', -78.436, -1170.03, 2.1354, -25.9049, -188.253, 1003.55, 600000, 5000, 168436, 0, 0, 17, 915, 100, -29.0314, -185.128, 1003.55, 17, 3, 12, 0, 1, 700, 0, 0, 0, 0, 1000, 0, 0),
(12, 0, 'Sergiu_Evans', 'Redsands West 24/7', 1599.12, 2221.87, 11.0625, -27.3915, -31.765, 1003.56, 300000, 500, 19736, 0, 0, 4, 533, 100, -31.0013, -29.0204, 1003.56, 17, 3, 13, 14, 0, 300, 0, 0, 0, 0, 1000, 0, 0),
(13, 0, 'None', 'Jizzy', 2507.34, 1242.25, 10.827, -2636.72, 1402.46, 906.461, 450000, 0, 0, 0, 0, 3, 148, 50, -2654.02, 1407.91, 906.277, 17, 1, 14, 15, 0, 500, 0, 0, 0, 0, 1000, 0, 0),
(14, 0, 'None', 'Lil\"Probe\"inn', -89.6103, 1378.24, 10.4697, -229.295, 1401.24, 27.7656, 500000, 0, 0, 0, 0, 18, 574, 50, -224.781, 1404.44, 27.7734, 17, 1, 15, 15, 0, 700, 0, 0, 0, 0, 1000, 0, 0),
(15, 0, 'Jake_Choppa', 'Ghetto Shop', 2424.24, -1742.78, 13.5459, -27.4063, -31.765, 1003.56, 1200000, 125, 262127, 0, 0, 4, 122, 55, -30.8279, -29.0117, 1003.56, 17, 3, 16, 7, 0, 2000, 0, 0, 0, 0, 1000, 0, 0),
(16, 0, 'Vlad_Volckov', 'Whestone Shops', -1562.59, -2733, 48.7435, -27.4605, -58.2737, 1003.55, 120000, 180, 14002, 0, 0, 6, 159, 100, -23.6394, -55.6176, 1003.55, 17, 3, 17, 12, 0, 150, 0, 0, 0, 0, 1000, 0, 0),
(17, 0, 'None', 'AngelPine Shop', -2231.49, -2558.32, 31.9219, -25.9075, -141.559, 1003.55, 130000, 0, 0, 0, 0, 16, 102, 50, -22.1999, -138.628, 1003.55, 17, 3, 18, 15, 0, 170, 0, 0, 0, 0, 1000, 0, 0),
(18, 1, 'Syafiq_DeAngelo', 'Central Store Los Santos', 1352.3, -1759.25, 13.5078, -27.4605, -58.2737, 1003.55, 900000, 5000, 288, 0, 0, 6, 191, 50, -23.6394, -55.6176, 1003.55, 17, 3, 19, 0, 1, 1000, 0, 0, 0, 0, 1000, 0, 0),
(19, 0, 'None', 'Mullholand 24/7', 1000.58, -919.897, 42.3281, -27.4452, -58.2749, 1003.55, 750000, 0, 0, 0, 0, 6, 172, 50, -23.497, -55.6312, 1003.55, 17, 3, 20, 15, 0, 800, 0, 0, 0, 0, 1000, 0, 0),
(20, 0, 'Vinsent_Maison', 'Furniture Shop', 802.163, -574, 16.3359, -25.9017, -188.253, 1003.55, 400000, 100, 10066, 0, 0, 17, 805, 50, -29.135, -185.129, 1003.55, 17, 3, 21, 12, 0, 450, 0, 0, 0, 0, 1000, 0, 0),
(21, 0, 'Joseph_Karlson', 'Grover Shop 24/7', 2637.25, 1129.68, 11.1797, -27.3895, -58.2674, 1003.55, 650000, 30, 672, 0, 0, 6, 188, 50, -23.6291, -55.6169, 1003.55, 17, 3, 22, 18, 0, 860, 0, 0, 0, 0, 1000, 0, 0),
(22, 0, 'Hitachi_Winston', 'Fort Carson Fich Mart', -145.851, 1172.39, 19.75, -25.9983, -188.259, 1003.55, 320000, 500, 8606, 0, 0, 17, 584, 100, -29.2351, -185.128, 1003.55, 17, 3, 23, 5, 0, 320, 0, 0, 0, 0, 1000, 0, 0),
(23, 0, 'Rudy_Grant', 'Store Milk Shop 24/7', -19.1895, 1175.23, 19.5634, 6.0027, -31.7641, 1003.55, 400000, 50, 153025, 1632, 0, 10, 767, 65, 2.0994, -29.0118, 1003.55, 17, 3, 24, 19, 0, 410, 0, 0, 0, 0, 1000, 0, 0),
(24, 0, 'Shon_Metay', 'South store 24/7 \"Four Dragons\"', 2117.47, 896.776, 11.1797, -27.4698, -58.2724, 1003.55, 950000, 150, 20821, 0, 0, 6, 818, 60, -23.5414, -55.6248, 1003.55, 17, 3, 25, 19, 0, 840, 0, 0, 0, 0, 1000, 0, 0),
(25, 0, 'Elik_Bereziuk', 'Montgomery 24/7', 1383.31, 465.533, 20.1919, 6.0438, -31.7673, 1003.55, 350000, 0, 1536, 384, 0, 10, 657, 50, 1.9501, -29.014, 1003.55, 17, 3, 26, 18, 0, 280, 0, 0, 0, 0, 1000, 0, 0),
(26, 0, 'Fernando_Lopez', 'Verona 24/7', 1081.24, -1696.78, 13.5469, -27.4478, -58.2751, 1003.55, 1250000, 100, 35899, 288, 0, 6, 42, 50, -23.564, -55.6275, 1003.55, 17, 3, 27, 19, 0, 680, 0, 0, 0, 0, 1000, 0, 0),
(27, 0, 'Arthur_Slovasky', 'Santa Maria Shop', 388.039, -1897.16, 7.83594, -27.4621, -58.2743, 1003.55, 320000, 0, 0, 0, 0, 6, 2, 100, -23.652, -55.6224, 1003.55, 16, 3, 28, 3, 0, 310, 0, 0, 0, 0, 1000, 0, 0),
(28, 0, 'Emerald_Lacoste', 'Burger Lang', 173.057, 1177.14, 14.7578, 372.315, -133.524, 1001.49, 480000, 30, 241904, 1152, 0, 5, 756, 60, 374.719, -119.589, 1001.5, 16, 2, 29, 5, 0, 480, 0, 0, 0, 0, 1000, 0, 0),
(29, 0, 'Tomas_Malloy', 'Nude Strippers Daily', 2543.24, 1025.24, 10.8203, -229.293, 1401.27, 27.7656, 300000, 50, 0, 0, 0, 18, 200, 50, -224.783, 1403.98, 27.7734, 16, 1, 30, 2, 0, 300, 0, 0, 0, 0, 1000, 0, 0),
(30, 1, 'Chaerul_Irawan', 'Central Club of Los Santos', 1333.43, -1864.38, 13.5469, -2636.72, 1402.46, 906.461, 750000, 0, 0, 0, 0, 3, 200, 50, -2652.83, 1410.4, 906.273, 16, 1, 31, 0, 1, 800, 0, 0, 0, 0, 1000, 0, 0),
(31, 0, 'None', 'Official \"Vagos\" Shop', 2850.95, -1532.52, 11.0991, -25.971, -188.259, 1003.55, 800000, 0, 0, 0, 0, 17, 118, 50, -29.2412, -185.126, 1003.55, 16, 3, 32, 15, 0, 600, 0, 0, 0, 0, 1000, 0, 0),
(32, 1, 'Alexx_Witchler', 'Central Burger Los Santos', 1377.81, -1753.12, 14.1406, 377.055, -193.306, 1000.63, 950000, 3000, 108912, 0, 0, 17, 799, 200, 379.154, -186.603, 1000.63, 16, 2, 33, 0, 1, 1800, 0, 0, 0, 0, 1000, 0, 0),
(33, 0, 'Morrty_Lopez', 'The Well Stacked Pizza', 2331.81, 75.0025, 26.621, 372.32, -133.523, 1001.49, 250000, 100, 224, 0, 0, 5, 155, 100, 373.675, -118.803, 1001.49, 16, 2, 34, 17, 0, 250, 0, 0, 0, 0, 1000, 0, 0),
(34, 0, 'Leonardo_Makiaveli', 'East Las Venturas Store', 2194.94, 1991.08, 12.2969, -27.3208, -58.266, 1003.55, 300000, 100, 6634, 0, 0, 6, 409, 50, -23.5454, -55.6282, 1003.55, 16, 3, 35, 7, 0, 300, 0, 0, 0, 0, 1000, 0, 0),
(35, 1, 'Kenn', 'Shop Near The Station 24/7', 1078.84, -1861.91, 13.5469, -27.3327, -58.2671, 1003.55, 650000, 5000, 168288, 0, 0, 6, 1, 100, -23.4752, -55.6324, 1003.55, 16, 3, 36, 0, 1, 700, 0, 0, 0, 0, 1000, 0, 0),
(36, 0, 'Alen_Mastergan', 'Luxury Gangster Club', 2057.52, -1897.21, 13.5538, 1204.72, -13.8504, 1000.92, 500000, 300, 14262, 0, 0, 2, 793, 70, 1214.96, -13.1083, 1000.92, 16, 1, 37, 5, 0, 500, 0, 0, 0, 0, 1000, 0, 0),
(37, 0, 'None', 'Liqor Mart 24/7', 1848.33, -1871.68, 13.5781, -25.8997, -141.559, 1003.55, 1200000, 0, 0, 0, 0, 16, 190, 50, -22.2596, -138.627, 1003.55, 16, 3, 38, 15, 0, 800, 0, 0, 0, 0, 1000, 0, 0),
(38, 0, 'None', 'Burger Shot LV', 1872.25, 2071.74, 11.0625, 362.882, -75.1792, 1001.51, 200000, 0, 0, 0, 0, 10, 193, 50, 375.568, -67.4347, 1001.51, 16, 2, 39, 15, 0, 200, 0, 0, 0, 0, 1000, 0, 0),
(39, 0, 'Johnny_Cage', 'Dillimore 24/7', 671.063, -519.263, 16.3359, -25.9357, -141.564, 1003.55, 300000, 50, 46210, 480, 0, 16, 558, 50, -22.0575, -138.628, 1003.55, 16, 3, 40, 9, 0, 300, 0, 0, 0, 0, 1000, 0, 0),
(40, 1, 'Carlos_Johnson', 'Dillimore Cluck', 694.982, -500.134, 16.3359, 364.977, -11.8438, 1001.85, 340000, 5000, 5952, 0, 0, 9, 193, 200, 369.583, -6.4147, 1001.86, 16, 2, 41, 0, 1, 350, 0, 0, 0, 0, 1000, 0, 0),
(41, 0, 'Fantomas_Lopez', 'Military Duty 24/7', 663.082, 1716.31, 7.1875, -27.4435, -58.2726, 1003.55, 800000, 100, 46320, 3072, 0, 6, 770, 85, -23.725, -55.6174, 1003.55, 16, 3, 42, 16, 0, 800, 0, 0, 0, 0, 1000, 0, 0),
(42, 0, 'Denzel_White', 'Heartland 24/7', 2292.28, -1722.69, 13.5469, -27.3243, -58.2672, 1003.55, 450000, 350, 34335, 1536, 0, 6, 567, 50, -23.6151, -55.625, 1003.55, 16, 3, 43, 17, 0, 1600, 0, 0, 0, 0, 1000, 0, 0),
(43, 0, 'Kaxa_Edwards', 'Central District Eatery', 2397.89, -1899.2, 13.5469, 460.555, -88.5648, 999.555, 700000, 100, 19214, 0, 0, 4, 82, 120, 452.424, -83.6513, 999.555, 16, 2, 44, 18, 0, 1200, 0, 0, 0, 0, 1000, 0, 0),
(44, 0, 'Daniil_Mironov', 'Lavanderia 24/7', 2473.08, -1922.14, 13.5312, -31.0191, -92.0107, 1003.55, 650000, 50, 4093, 288, 0, 18, 822, 50, -28.2579, -89.9556, 1003.55, 16, 3, 45, 14, 0, 800, 0, 0, 0, 0, 1000, 0, 0),
(45, 0, 'Fred_Brown', 'Vinewood Shop 24/7', 470.813, -1163.54, 67.218, -25.9404, -141.564, 1003.55, 600000, 200, 16354, 3552, 0, 16, 494, 60, -22.2396, -138.626, 1003.55, 16, 3, 46, 14, 0, 700, 0, 0, 0, 0, 1000, 0, 0),
(46, 0, 'Damian_Moore', 'Grover Shop 24/7', 1315.55, -897.683, 39.5781, -27.4148, -58.1739, 1003.55, 750000, 999, 400000, 0, 0, 6, 501, 100, -23.5147, -55.6299, 1003.55, 16, 3, 47, 2, 0, 900, 0, 0, 0, 0, 1000, 0, 0),
(47, 0, 'Joseph_Margaret', 'SuperMarket 24/7', -311.292, 1303.55, 53.6643, -25.9178, -141.561, 1003.55, 400000, 500, 48522, 0, 0, 16, 528, 80, -22.3609, -138.624, 1003.55, 16, 3, 48, 12, 0, 500, 0, 0, 0, 0, 1000, 0, 0),
(48, 0, 'Jeyson_Edward', 'Barber Shop', 2724.46, -2026.53, 13.5547, -25.9493, -188.259, 1003.55, 700000, 0, 26892, 2400, 0, 17, 612, 65, -29.0949, -185.13, 1003.55, 16, 3, 49, 18, 0, 750, 0, 0, 0, 0, 1000, 0, 0),
(49, 0, 'Carl_Wilson', 'City Shop 24/7', 1286.8, -1329.26, 13.5549, -25.8652, -141.549, 1003.55, 900000, 50, 8748, 672, 0, 16, 58, 65, -22.1813, -138.626, 1003.55, 16, 3, 50, 16, 0, 1400, 0, 0, 0, 0, 1000, 0, 0),
(50, 0, 'None', 'Cluck Trucker 24/7', 2169.42, 2795.91, 10.8203, 362.87, -75.1677, 1001.51, 320000, 0, 0, 0, 0, 10, 113, 50, 376.59, -67.435, 1001.51, 16, 2, 51, 15, 0, 400, 0, 0, 0, 0, 1000, 0, 0),
(51, 0, 'Ashton_Cook', 'Shop Truck 24/7', 2150.7, 2733.87, 11.1763, -27.4633, -58.2745, 1003.55, 350000, 100, 2692, 0, 0, 6, 983, 50, -23.5517, -55.6251, 1003.55, 16, 3, 52, 17, 0, 400, 0, 0, 0, 0, 1000, 0, 0),
(52, 0, 'Fernando_Bond', 'Dangerous area 24/7', 1836.51, -1445.01, 13.5962, -30.9961, -92.01, 1003.55, 750000, 100, 145382, 3072, 0, 18, 169, 50, -28.1617, -89.9534, 1003.55, 16, 3, 53, 17, 0, 900, 0, 0, 0, 0, 1000, 0, 0),
(53, 0, 'All_Capone', 'Hude Shop 24/7', 1940, -2115.97, 13.6953, -31.0632, -92.0109, 1003.55, 400000, 50, 201514, 1152, 0, 18, 437, 50, -28.1209, -89.9526, 1003.55, 16, 3, 54, 10, 0, 500, 0, 0, 0, 0, 1000, 0, 0),
(54, 0, 'John_Thompson', 'Club Farior', 1951.45, -2041.29, 13.5469, 501.96, -67.5628, 998.758, 300000, 150, 4337, 0, 0, 11, 663, 50, 498.392, -76.0398, 998.758, 10, 1, 55, 12, 0, 300, 0, 0, 0, 0, 1000, 0, 0),
(55, 0, 'Alex_Monk', 'Central Ghetto Cluck', 2101.2, -1359.52, 23.9844, 372.296, -133.525, 1001.49, 500000, 0, 36990, 0, 0, 5, 500, 90, 373.79, -118.802, 1001.49, 10, 2, 56, 14, 0, 600, 0, 0, 0, 0, 1000, 0, 0),
(56, 0, 'None', 'Grocery store 24/7', 2751.89, -1438.24, 30.4531, -31.0225, -92.0113, 1003.55, 700000, 0, 0, 0, 0, 18, 1000, 50, -28.2215, -89.9542, 1003.55, 10, 3, 57, 15, 0, 1000, 0, 0, 0, 0, 1000, 0, 0),
(57, 0, 'Slava_Novoselov', 'Club 51 LV', 1157.92, 2072.28, 11.0625, 362.876, -75.1722, 1001.51, 200000, 199, 344, 0, 0, 10, 929, 50, 376.551, -67.4343, 1001.51, 10, 2, 59, 17, 0, 600, 0, 0, 0, 0, 1000, 0, 0),
(58, 0, 'Flomil_Lorenzo', 'Amnesia', 693.688, 1967.68, 5.53906, 1204.75, -13.8516, 1000.92, 250000, 500, 2956, 0, 0, 2, 42, 50, 1215.81, -13.351, 1000.92, 0, 1, 60, 18, 0, 300, 0, 0, 0, 0, 1000, 0, 0),
(59, 0, 'None', 'Aztek Eat MC', 2723.67, -2033.87, 13.5472, 460.556, -88.6183, 999.555, 800000, 0, 0, 0, 0, 4, 149, 50, 450.518, -83.6512, 999.555, 0, 2, 62, 15, 0, 300, 0, 0, 0, 0, 1000, 0, 0),
(60, 0, 'None', 'Ballas Chicken', 1852.31, -1145.16, 23.8336, 460.556, -88.6183, 999.555, 550000, 0, 0, 0, 0, 4, 200, 50, 450.518, -83.6512, 999.555, 10, 6, 63, 15, 0, 300, 0, 0, 0, 0, 1000, 0, 0),
(61, 1, 'Frank_Oconnor', 'Ghetto Clothes Binco', 2244.33, -1665.55, 15.4766, 207.663, -111.266, 1005.13, 3800000, 5000, 395110, 0, 0, 15, 200, 50, 217.557, -97.7456, 1005.26, 10, 6, 67, 0, 1, 300, 0, 0, 0, 0, 1000, 0, 0),
(62, 0, 'Ezra_Keisuke', 'Central Clothes Binco', 461.699, -1500.76, 31.0457, 227.473, -8.1696, 1002.21, 1900000, 5000, 102720, 6720, 0, 5, 200, 50, 206.374, -8.1498, 1001.21, 10, 6, 68, 14, 0, 300, 0, 0, 0, 0, 1000, 0, 0),
(63, 0, 'Codya_Diaz', 'Clothes Binco LV', 2090.53, 2224.7, 11.0234, 161.371, -97.1106, 1001.8, 350000, 200, 39376, 0, 0, 18, 200, 50, 161.444, -83.252, 1001.8, 0, 6, 69, 18, 0, 300, 0, 0, 0, 0, 1000, 0, 0),
(64, 0, 'Takashi_Arato', 'Clothes Binco LV', 2435.28, 1655.44, 10.8203, 204.303, -168.861, 1000.52, 350000, 500, 14000, 0, 0, 14, 200, 50, 204.313, -159.35, 1000.52, 0, 6, 70, 4, 0, 300, 0, 0, 0, 0, 1000, 0, 0),
(65, 1, 'Kaneki_Kyoto', 'Hotel', 1310.16, -1366.8, 13.5065, 1665.46, -158.895, 1208.62, 2500000, 5000, 10272, 0, 0, 15, 200, 10000, 2217.37, -1146.41, 1025.8, 0, 13, 0, 0, 1, 300, 0, 0, 0, 0, 1000, 0, 0),
(66, 1, 'Steven_Norten', 'Dealer Ekonomi Kelas 1', 561.961, -1293.72, 17.2482, 2214.59, -1150.6, 0, 3000000, 0, 92368, 0, 0, 15, 192, 50, 2217.37, -1146.41, 1025.8, 10, 9, 0, 0, 1, 300, 0, 0, 0, 0, 1000, 0, 0),
(67, 0, 'Kazu_Yamaguchi', 'Dealer Kelas Ekonomi', 2139.42, -1192.02, 23.9922, 2214.59, -1150.6, 0, 1800000, 0, 500000, 144000, 0, 15, 172, 50, 2217.37, -1146.41, 1025.8, 10, 9, 1, 13, 0, 300, 0, 0, 0, 0, 1000, 0, 0),
(68, 0, 'Nada_Alifa', 'Dealer Kelas Menengah', -1957.34, 297.945, 35.4688, 2214.59, -1150.6, 0, 2000000, 5000, 500000, 4800, 0, 15, 192, 50, 2217.37, -1146.41, 1025.8, 0, 9, 2, 17, 0, 300, 0, 0, 0, 0, 1000, 0, 0),
(69, 0, 'Ricwyk_Wyn', 'Dealer Kelas Tinggi', 1658.47, 2200.35, 10.8203, 2214.59, -1150.6, 0, 3000000, 5000, 800000, 0, 0, 15, 194, 50, 2217.37, -1146.41, 1025.8, 0, 9, 3, 7, 0, 300, 0, 0, 0, 0, 1000, 0, 0),
(70, 0, 'Sektolyr_Hummel', '72', 1111.92, -1795.58, 16.5938, 2160.85, 1602.51, 999.982, 3000000, 0, 808, 0, 0, 1, 200, 228, 2165.28, 1600.1, 999.976, 0, 5, 1, 16, 0, 300, 1, 1, 1, 1, 1000, 5555, 35),
(71, 0, 'null', 'Таксопарк SF', -2442.7, 755.418, 35.1719, 2160.85, 1602.51, 999.982, 3000000, 0, 0, 0, 0, 1, 0, 0, 2165.28, 1600.1, 999.976, 0, 5, 2, 15, 0, 300, 0, 0, 0, 0, 0, 0, 0),
(72, 0, 'null', 'Таксопарк LV', 1629.27, 972.099, 10.8203, 2160.85, 1602.51, 999.982, 3000000, 0, 0, 0, 0, 1, 0, 0, 2165.28, 1600.1, 999.976, 0, 5, 3, 15, 0, 300, 0, 0, 0, 0, 0, 0, 0),
(73, 1, 'Ezra_Keisuke', 'Ammo LS', 1368.09, -1279.82, 13.5469, 315.759, -143.065, 999.602, 3000000, 0, 82080, 0, 0, 7, 200, 4500, 308.149, -140.858, 999.602, 10, 8, 1, 0, 1, 300, 0, 0, 0, 0, 1000, 0, 0),
(74, 0, 'Suroto_Purwanto', 'Ammo SF', -2626.67, 209.323, 4.5955, 315.759, -143.065, 999.602, 3000000, 0, 0, 0, 0, 7, 200, 50, 308.149, -140.858, 999.602, 0, 8, 2, 15, 0, 300, 0, 0, 0, 0, 1000, 0, 0),
(75, 0, 'None', 'Ammo LV', 2158.99, 943.112, 10.8203, 315.759, -143.065, 999.602, 3000000, 0, 0, 0, 0, 7, 200, 50, 308.149, -140.858, 999.602, 10, 8, 3, 15, 0, 300, 0, 0, 0, 0, 1000, 0, 0),
(76, 0, 'None', 'Paint Ball', -2089.11, 84.261, 35.3134, -2170.33, 635.587, 1052.38, 3000000, 0, 0, 0, 0, 1, 172, 50, -2158.92, 640.459, 1052.38, 0, 23, 1, 15, 0, 300, 0, 0, 0, 0, 1000, 0, 0),
(77, 0, 'Adriano_Chilintano', 'Casino Four Dragons', 2019.32, 1007.77, 10.8203, 2023.32, 1166.77, 996.875, 10000000, 5000, 32632, 12576, 0, 10, 158, 350, 1957.88, 1168.16, 992.469, 10, 1, 1, 11, 0, 300, 0, 0, 0, 0, 1000, 0, 0),
(78, 1, 'Fikri_Harisson', 'Perfomance Tune', -2029.82, 433.927, 35.1719, 2023.32, 1166.77, 996.875, 10000000, 5000, 800000, 0, 0, 10, 200, 50, 1957.88, 1168.16, 992.469, 0, 14, 1, 0, 1, 300, 0, 0, 0, 0, 1000, 0, 0),
(79, 0, 'Antonio_Cipriani', 'Dice', 1022.63, -1121.68, 23.8721, 1133.26, -15.4944, 1000.68, 10000000, 5000, 636672, 22464, 0, 12, 752, 350, 1139.48, -3.969, 1000.67, 10, 1, 1, 19, 0, 300, 0, 0, 0, 0, 1000, 0, 0),
(80, 1, 'Sandy_Justin', 'Showroom Motor & Sepeda', 1991.7, -1992.1, 13.5469, 2214.59, -1150.6, 0, 3000000, 5000, 800000, 0, 0, 15, 130, 50, 2217.37, -1146.41, 1025.8, 0, 9, 4, 2, 0, 300, 0, 0, 0, 0, 1000, 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bizz`
--
ALTER TABLE `bizz`
  ADD PRIMARY KEY (`bID`),
  ADD UNIQUE KEY `bID` (`bID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;



*/
