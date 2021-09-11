
stock VipNames(playerid)
{
	new vipname[20+1];
	switch(PlayerInfo[playerid][pVip])
	{
	    case 1: vipname= "{CD853F}BRONZE VIP";
		case 2: vipname= "{afafaf}SILVER VIP";
		case 3: vipname= "{ffff00}GOLD VIP";
		default: vipname= "Tidak";
	}
	return vipname;
}


stock IsAMafia(playerid)
{
	switch(PlayerInfo[playerid][pMember])
	{
		case FRACTION_YAKUZA, FRACTION_COLUMBIA, FRACTION_RUMAFIA: return 1;
	}

	return false;
}
stock IsAGang(playerid)
{
	switch(PlayerInfo[playerid][pMember])
	{
		case FRACTION_BALLAS, FRACTION_VAGOS, FRACTION_GROVE, FRACTION_AZTEC, FRACTION_RIFA: return 1;
	}

	return false;
}
stock IsABoat(carid) // air
{
	switch(GetVehicleModel(carid))
	{
		case 472,473,493,595,484,430,452..454,446: return 1;
	}
	return false;
}

stock IsABicycle(carid)
{
    switch(GetVehicleModel(carid))
	{
		case 481,509,510: return 1;
	}
	return false;
}

stock IsABike(carid) // motor
{
	switch(GetVehicleModel(carid))
	{
		case 448,461..463,468,471,481,509,510,521..523,581,586: return 1;
	}
	return false;
}

stock IsAPlane(carid) // pesawat terbang
{
	switch(GetVehicleModel(carid))
	{
		case 592..593,577,511..513,519..520,553,476,460,548,417,487..488,497,563,447,469: return 1;
		default: return false;
	}
	return false;
}
stock CarLicence(carid) // mobil
{
	switch (GetVehicleModel(carid))
	{
		case 400..416,418..424,426..429,431..445,449,451,455,456,458,459,461: return true;
		case 463,466..468,470,471,474,475,477..480,482,483,485,486,489..492,494..496,498..508: return true;
		case 514..518,521..531,533..537,539..547,549..551,554..562,564..568,572..576,578..583,585..589,596..605,609: return true;
	}
	return false;
}

stock IsAMedic(playerid)
{
	switch(form_fraction[playerid])
	{
	    case FRACTION_LSMEDICS, FRACTION_SFMEDICS, FRACTION_LVMEDICS: return 1;
	}

	return 0;
}

stock IsACop(playerid)
{
	switch(form_fraction[playerid])
	{
	    case FRACTION_LSPD, FRACTION_FBI, FRACTION_SFPD, FRACTION_LVPD: return 1;
	}

	return 0;
}
stock IsAArmy(playerid)
{
	switch(PlayerInfo[playerid][pMember])
	{
		case FRACTION_ARMY_LS, FRACTION_ARMY_SF, FRACTION_ARMY_LV: return 1;
	}

	return 0;
}
stock IsAMech(playerid)
{
	switch(PlayerInfo[playerid][pMember])
	{
		case FRACTION_MECHANIK: return 1;
	}

	return 0;
}



@TruckerTimer(playerid);
@TruckerTimer(playerid)
{
	new newcar = GetPlayerVehicleID(playerid);
	TogglePlayerControllable(playerid, true);

	DisablePlayerCheckpoint(playerid);

	switch(pTemp[playerid][pTrucker]) {
		case 0:
		{
			pTemp[playerid][pTrucker] = 1;

			SendClientMessage(playerid, -1, !"Truk dimuat, pergi ke tempat bongkar muat");

			new str[64];
			format(str, sizeof str, "[Jumlah kargo: %d/%i]", pTemp[playerid][pTrucker_Unit], MAX_UNIT);

			if(gruz_3d[newcar] == Text3D:0)
				gruz_3d[newcar] = CreateDynamic3DTextLabel(str, -1, 0.0, 0.0, 0.0, 15.0, INVALID_PLAYER_ID, rent_job_vehicle[playerid]);
			else
				UpdateDynamic3DTextLabelText(gruz_3d[newcar], -1, str);

			new index = sizeof(trucker_checkpoints)-1;
			SetPlayerCheckpoint(playerid, trucker_checkpoints[index][0], trucker_checkpoints[index][1], trucker_checkpoints[index][2], 10.0);
		}
		case 1:
		{
			pTemp[playerid][pTrucker] = -1;
			new money = pTemp[playerid][pTrucker_Unit]*UNIT_PRICE;
			GivePlayerMoneyEx(playerid, money+floatround(money*SALARY_PRECENTAGE), "bongkar muat");
			pTemp[playerid][pTrucker_Unit] = 0;
			///Send(playerid, -1, "Bongkar muat");
			SCMF(playerid,-1,"Bongkar sudah selesai, Anda dapatkan: %d", money+(money*SALARY_PRECENTAGE));
			new str[64];
			format(str, sizeof str, "[Jumlah kargo: %d/%i]", pTemp[playerid][pTrucker_Unit], MAX_UNIT);
			UpdateDynamic3DTextLabelText(gruz_3d[newcar], -1, str);
			SPD(playerid, 231, DIALOG_STYLE_INPUT, !""CAPTION_WAREHOUSE_SELECTION"", !""INFO_WAREHOUSE_SELECTION"", "Selanjutnya", "Batalkan");
		}
	}
	return 1;
}



stock GivePlayerRouletPrize(playerid, item_id, amount)
{
    switch(item_id)
	{
        case 0:
		{
            SCMF(playerid, -1, "Kamu mengambil {FF4500}%d"W" Exp.",amount);
            GivePlayerExp(playerid, amount);
        }
        case 1:
		{
            SCMF(playerid, -1, "Kamu mengambil {FF4500}%d"W" taat hukum.", amount);
            PlayerInfo[playerid][pZakon] += amount;
            OnPlayerUpdateAccountsPer(playerid,"pZakon", PlayerInfo[playerid][pZakon]);
        }
        case 2:
		{
            SCMF(playerid, -1, "Kamu mengambil {43CD80}%drp{FFFFFF}, uang di rekening bank.", amount);
            GivePlayerBankEx(playerid, amount, "hadiah roulette virtual");
        }
        case 3:
		{
            SCMF(playerid, -1, "Kamu mengambil {FF4500}%d"W" rubel.", amount);
            PlayerInfo[playerid][pRouble] += amount;
            OnPlayerUpdateAccountsPer(playerid, "pRouble", PlayerInfo[playerid][pRouble]);
        }
        case 4:
		{
            SetPVarInt(playerid,"RULETdrop", amount);

			new bool: is_have_slot = false;

			for(new i; i < MAX_PLAYER_VEHICLES; i++)
			{
				if(!CarInfo[playerid][cModel][i])
				{
				    if(i > 0 && GetPlayerHouse(playerid) == -1 && PlayerInfo[playerid][pHotel] == -1) return Send(playerid, -1, "Anda tidak punya rumah!");

				    is_have_slot = true;
					RuletGiveCar(playerid,i,GetPVarInt(playerid,"RULETdrop"));
					break;
				}
			}

			if(!is_have_slot) SCM(playerid, COLOR_GREY, "Anda memiliki semua slot untuk kendaraan yang ditempati.");
        }
        case 5:
		{
            if(!IsVIP(playerid))
			{
				new coVIPTypes[][] = {"BRONZE","SILVER","GOLD"};
                PlayerInfo[playerid][pVip] = random(3)+1;
				SCMF(playerid, 0x2eb0ffaa, "Selamat! Kamu menang {FF4500}%d jam %s VIP.", amount,coVIPTypes[PlayerInfo[playerid][pVip]-1]);
                OnPlayerUpdateAccountsPer(playerid,"pVip",PlayerInfo[playerid][pVip]);
                PlayerInfo[playerid][pVipTime] = gettime() + (3600 * amount);
            }
            else{
				SCMF(playerid, 0x2eb0ffaa, "Selamat! Kamu menang {FF4500}%d jam VIP.", amount);
                PlayerInfo[playerid][pVipTime] += 3600 * amount;
			}
            OnPlayerUpdateAccountsPer(playerid,"pVipTime",PlayerInfo[playerid][pVipTime]);
        }
        case 6:
		{
		    if(GetPlayerSkin(playerid) == PlayerInfo[playerid][pSkin]) SetPlayerSkin(playerid, amount);

            PlayerInfo[playerid][pSkin] = amount;
            SCMF(playerid, -1, "Anda mengambil kulitnya {FF4500}%d", PlayerInfo[playerid][pSkin]);

            OnPlayerUpdateAccountsPer(playerid, "pSkin", amount);
        }
    }

    format(format_string, 188, "DELETE FROM `roulet_prizes` WHERE `item_id` = %i AND `amount` = %i AND `user_id` = %i LIMIT 1", item_id, amount, GetPlayerAccountID(playerid));
    mysql_tquery(mMysql, format_string);

    return 1;
}
forward IsVehicleOccupied(vehicleid);
public IsVehicleOccupied(vehicleid)
{
	foreach(Player,i)
	{
		if(IsPlayerInVehicle(i,vehicleid)) return true;
	}
	return false;
}

stock GivePlayerMoneyEx(playerid, amount, reason[])
{

	PlayerInfo[playerid][pCash] += amount;
	OnPlayerUpdateAccountsPer(playerid, "pCash", PlayerInfo[playerid][pCash]);
    Send(playerid, COLOR_LIME,reason);
    if(PlayerInfo[playerid][pCash] >= 1000000) SetPlayerMoneyCase(playerid);
	else RemovePlayerMoneyCase(playerid);

	if(amount <= -1000 || amount >= 1000)
	{
		format(format_string, 244, "INSERT INTO `money_log` (`user_id`,`amount`,`reason`,`type`) VALUES (%i,%i,'%s (rp%i)',0)", GetPlayerAccountID(playerid), amount, reason, PlayerInfo[playerid][pCash]);
		mysql_tquery(mMysql, format_string);
	}

	return 1;
}


CMD:setvip(playerid, params[])
{
	if(admin_level[playerid] < 9 || !admin_logged[playerid]) return 1;
	if(sscanf(params, "ud", params[0], params[1])) return Send(playerid, -1, "Masuk: /setvip [playerid] [tingkat");
	new amount = params[1];
	if(!IsPlayerConnected(params[0])) return Send(playerid, -1,"Pemain sedang offline");
 	if(PlayerInfo[params[0]][pLogin] == 0) return Send(playerid, -1,"Pemain belum login");
	if(afk_time[params[0]] > 2) return Send(playerid, -1,"Pemain ini di AFK");
	new coVIPTypes[][] = {"BRONZE","SILVER","GOLD"};
 	PlayerInfo[params[0]][pVip] = params[1];
	SCMF(playerid, 0x2eb0ffaa, "Anda telah ganti tingkat dia[%i] ke {FF4500}level %s VIP.", params[0],coVIPTypes[PlayerInfo[params[0]][pVip]-1]);
 	OnPlayerUpdateAccountsPer(params[0],"pVip",PlayerInfo[params[0]][pVip]);
  	
	return true;
}

CMD:setwhitelist(playerid, params[])
{
	if(admin_level[playerid] < 7 || !admin_logged[playerid]) return 1;
	new WhiteName[100], type;
	Send(playerid, -1, "Anda bisa memasukkan type angka 0 untuk blacklist nama tersebut dan sebaliknya angka 1 untuk type whitelist.");
	Send(playerid, -1, "Perlu di ketahui nama yang anda masukkan harus cocok tanda underscore juga membedakan huruf besar dan kecil.");
	if(sscanf(params, "s[100]d", WhiteName, type)) return Send(playerid, -1, "Masuk: /setwhitelist [Nick_Player] [type whitelist]");
	new Whitetypes[][] = {"Blacklist","Whitelist","Superlist"};
	SCMF(playerid, 0xffff00ff, "Anda telah memberi %s ke nama %s", Whitetypes[type], WhiteName);
    new query[512];
    format(query, sizeof(query), "UPDATE `accounts` SET `pWhitelist` = '%d' WHERE `pName` = '%s'", type, WhiteName);
	mysql_tquery(mMysql, query);


 	return 1;
}


stock ShowPlayerPrizeList(playerid)
{
    new page = player_mysql_page[playerid];

    format(format_string, 96, "SELECT * FROM `roulet_prizes` WHERE `user_id` = %i LIMIT %i, 10", GetPlayerAccountID(playerid), page * 10);
	new Cache: result = mysql_query(mMysql, format_string, true);

	new rows = cache_num_rows();

	if(rows == 0) return SCM(playerid, COLOR_GREY, "Anda tidak punya hadiah.");

	static prizes_type[][] = { "EXP", "Ketaatan hukum", "Uang", "Gold", "Transportasi", "VIP", "Pakaian" };
	static prizes_unit[][] = { "unit. ", "unit. ", "rp", "DM ", "ID: ", "h. ", "ID: " };

	new str[96];

	command_text = "";

	new item_id, amount;

	for(new i; i < rows; i++)
	{
        cache_get_value_name_int(i, "item_id", item_id);
        cache_get_value_name_int(i, "amount", amount);

		format(str, 96, "[%i] %s\t%s%i\n", i, prizes_type[item_id], prizes_unit[item_id], amount);
		strcat(command_text, str);
	}

	SetPlayerUseListitem(playerid, rows);

	cache_delete(result);

	if(rows == 10) strcat(command_text, "[10] Halaman selanjutnya\t\n");
	if(page != 0) strcat(command_text, "[11] Halaman sebelumnya\t\n");


	return SPD(playerid, 4762, DIALOG_STYLE_INPUT, "Daftar Hadiah", command_text, "Pilih", "Tutup");
}




