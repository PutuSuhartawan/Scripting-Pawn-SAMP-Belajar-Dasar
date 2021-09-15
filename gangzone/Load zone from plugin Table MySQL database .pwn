
#define MAX_ZONES 104

enum E_GZ_STRUCT
{
	gID,
	Float: gPos[4],
	gFraction,
	gTime,
	gAttack,
	gType,
	gDoubleDraw,
	gKills[2],
	Text: gTD[9]
};

new GZInfo[MAX_ZONES][E_GZ_STRUCT];

new player_jobvehicle_time[MAX_PLAYERS];
new player_lecenie[MAX_PLAYERS];
new player_warning_ac[MAX_PLAYERS];
new player_sim_number[MAX_PLAYERS];
new player_route_id[MAX_PLAYERS];
new player_chat_fraction[MAX_PLAYERS];
new player_enter_actors[MAX_PLAYERS];
new player_veh_damage[MAX_PLAYERS];
new player_gos_time[MAX_PLAYERS];
new player_take_player[MAX_PLAYERS];
new player_search_player[MAX_PLAYERS];
new admin_global_chat[MAX_PLAYERS];
new player_gun_obj[MAX_PLAYERS];
new player_use_bizbar[MAX_PLAYERS];
new player_enter_fuel[MAX_PLAYERS];
new player_enter_home[MAX_PLAYERS];
new player_enter_biz[MAX_PLAYERS];
new player_product_id[MAX_PLAYERS];
new rent_vehicle_id[MAX_PLAYERS];
new rent_job_vehicle[MAX_PLAYERS];
new afk_check[MAX_PLAYERS];
new afk_tick[MAX_PLAYERS];
new afk_time[MAX_PLAYERS];
new admin_logged[MAX_PLAYERS];
new admin_level[MAX_PLAYERS];
new form_fraction[MAX_PLAYERS];
new player_job[MAX_PLAYERS];

//
new MySQL:mMysql;
new MySQLStr[1400];
new String[2500];

#define command_text String
//#define ShowPlayerDialogExEx ShowPlayerDialog

#define SPD ShowPlayerDialogEx

native IsValidVehicle(vehicleid);

new Timer;
new ghour = 0;
new counter;
new format_string[244];

#define MAX_HOUSES	700
#define MAX_BIZZ    81
#define MAX_aBIZZ	20
#define MAX_ENSTERS 100
#define MAX_ATMS    50
#define MAX_ACTOR  	50
#define MAX_SCHET   10
#define MAX_NUMBER  15
#define MAX_FAMILY  50

static const Float:cam_start_pos [4] [3] [6] =
{
	{
    	{2225.367919, -1341.228515, 26.527132, 1864.286499, -1511.908691, 160.707336},
    	{2220.424560, -1341.353149, 25.787668, 1860.622192, -1508.632812, 159.789916},
    	{2206.6897,-1344.4692,23.9844, 0.0, 0.0, 0.0}
	},
	{
    	{1705.268432, -576.238891, 39.012908, 1732.554321, -934.871826, 161.531326},
    	{1705.068969, -581.234924, 39.009002, 1729.563598, -938.804077, 160.761276},
    	{1673.0056,-712.7117,68.5703, 0.0, 0.0, 0.0}
	},
	{
    	{85.656761, -1339.051513, 89.242439, 24.335859, -1566.349487, 8.120280},
    	{87.708625, -1343.310302, 87.613655, 28.958576, -1564.447021, 8.224605},
    	{2.0860,-1355.8615,1.0736, 0.0, 0.0, 0.0}
	},
	{
    	{1720.672119, -1695.043334, 123.531272, 1720.672119, -1695.043334, 123.531272},
    	{1718.984619, -1690.368896, 122.981605, 1718.984619, -1690.368896, 122.981605},
    	{1720.2850,-1683.7813,20.2047, 0.0, 0.0, 0.0}
	}
};
static const Float:player_spawn_pos[2][4] =
{
	{1685.4030,-2249.4670,-2.6991}, // spawnpos2
	{1685.4030,-2240.4670,-2.6991} // spawnpos3
};/*
static const Float:test_player_spawn[3][4] =
{
	{1479.2172,-1675.4662,14.0469,182.2887},
	{1511.6725,-1699.2968,14.0469,161.0863},
	{1448.4615,-1703.0165,14.0469,205.5383}
};*/



stock PlayerToKvadrat(playerid,Float:min_x,Float:min_y,Float:max_x,Float:max_y)
{
	new Float:xxp,Float:yyp,Float:zzp;
	GetPlayerPos(playerid, xxp, yyp, zzp);
	if((xxp <= max_x && xxp >= min_x) && (yyp <= max_y && yyp >= min_y)) return true;
	return false;
}



stock GetGangZoneColor(g_id)
{
	new zx;

	switch(GZInfo[g_id][gFraction])
	{
		case FRACTION_BALLAS: zx = 0xCC00FFAA;
		case FRACTION_VAGOS: zx = 0xffcd00AA;
		case FRACTION_GROVE: zx = 0x009900AA;
		case FRACTION_AZTEC: zx = 0x00b4e1AA;
		case FRACTION_RIFA: zx = 0x6666ffAA;
		default: zx = 0xFEFEFEAA;
	}

	return zx;
}

stock SaveGZ(idx)
{
	format(MySQLStr, sizeof(MySQLStr), "UPDATE `gangzone` SET `ginfo1` = '%f', `ginfo2` = '%f', `ginfo3` = '%f', `ginfo4` = '%f', `fraction` = '%d' WHERE `id` = '%d'",
	GZInfo[idx][gPos][0], GZInfo[idx][gPos][1],GZInfo[idx][gPos][2],GZInfo[idx][gPos][3],GZInfo[idx][gFraction], idx);
	mysql_query(mMysql, MySQLStr);
	return 1;
}

stock MySQLConnect()
{
    new MySQLOpt: option_id = mysql_init_options();
	mysql_set_option(option_id, AUTO_RECONNECT, true); // it automatically reconnects when loosing connection to mysql server

	mMysql = mysql_connect("localhost", "root", "", "szrp2021", option_id); // sebuah database
    //if(!mysql_errno()) print("Koneksi basis data aktif!");
	//else return print("Koneksi basis data tidak aktif!");

    //mysql_log(ALL);

    LoadVehicles();

	//mysql_tquery(mMysql, "SET NAMES 'cp1251'", "", "");
	mysql_set_charset("cp1251");

    LoadBizz();
	mysql_tquery(mMysql, "SELECT * FROM `taxi_bizz`", "LoadTaxiBizz", "");
    mysql_tquery(mMysql, "SELECT * FROM `dynamicatm`", "LoadATMS", "");
	mysql_tquery(mMysql, "SELECT * FROM `fraction` ORDER BY `fID` ASC", "LoadFractions", "");
	mysql_tquery(mMysql, "SELECT * FROM `bizz_fuel`", "LoadABizz", "");
	mysql_tquery(mMysql, "SELECT * FROM `enters`", "LoadEnters", "");
	mysql_tquery(mMysql, "SELECT * FROM `actors`", "LoadActors", "");
	mysql_tquery(mMysql, "SELECT * FROM `atms`", "LoadAtms", "");
	mysql_tquery(mMysql, "SELECT * FROM `others`", "LoadOthers", "");
	mysql_tquery(mMysql, "SELECT * FROM `gangzone`", "LoadGangZones", "");
	mysql_tquery(mMysql, "SELECT * FROM `anticheats`", "load_anticheat", "");
    mysql_tquery(mMysql, "SELECT * FROM `graffiti`", "LoadGraffiti", "");
    mysql_tquery(mMysql, "SELECT * FROM `elecations`", "LoadElecations", "");
    mysql_tquery(mMysql, "SELECT * FROM `fraction_wh`", "LoadFractionWH", "");
    mysql_tquery(mMysql, "SELECT * FROM `family`", "LoadFamily", "");
    mysql_tquery(mMysql, "SELECT * FROM `house`", "LoadHouse", "");
	mysql_tquery(mMysql, "SELECT * FROM `hotels`", "LoadHotels", "");

    mysql_tquery(mMysql, "UPDATE `accounts` SET `pLogin` = 0");

	// others
	for(new x; x < MAX_HOSPITALS; x++)
	{
	    for(new i; i < MAX_HOSPITAL_BEDS; i++)
		{
			format(String, 144, "Tempat tidur ?: %d\n  Ketentuan:{34c924} gratis"W". \n {bbbbbb}Gunakan:{fde910} ALT", i + 1);
			Koika[x][i] = CreateDynamic3DTextLabel(String,0xFFFFFFFF, LoadKoika[i][0], LoadKoika[i][1], LoadKoika[i][2] - 1.0, 10.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 0, hospital_worlds[x], 8);
		}
	}

	printf("[Unduh mod]: Tempat tidur rumah sakit dimuat: %d", MAX_HOSPITALS);

	SetTimer("Fresh", 1000, true);

	return 1;
}
stock MysqlErrorMessage(playerid)
{
	format(String, sizeof (String), "{FFFFFF}Server saat ini mengalami masalah basis data..\nJika masalah berlanjut dalam beberapa menit, hubungi administrasi.\n\nNomor kesalahan: {CD5555}?%d", mysql_errno());
	SPD(playerid,0,DIALOG_STYLE_MSGBOX,"{E5D81E}Kesalahan kritis",String,"Tutup","");
	KickD(playerid, "Kesalahan kritis! Server menutup koneksi.");
	return 1;
}


CMD:gzcolor(playerid,params[])
{
    if(admin_level[playerid] < 4 || !admin_logged[playerid]) return 1;
//    if(PlayerInfo[playerid][pLogin] == 0) return 1;
	if(sscanf(params,"d",params[0])) return SendClientMessage(playerid, 0xafafafff, "/gzcolor [parameter]");
	for(new i; i < MAX_ZONES;i++)
	{
		if(PlayerToKvadrat(playerid,GZInfo[i][gPos][0], GZInfo[i][gPos][1],GZInfo[i][gPos][2],GZInfo[i][gPos][3]))
		{
			GZInfo[i][gFraction] = params[0];
			GangZoneStopFlashForAll(GZInfo[i][gID]);
			GangZoneHideForAll(GZInfo[i][gID]);
			GangZoneShowForAll(GZInfo[i][gID],GetGangZoneColor(i));
			SaveGZ(i);
			format(format_string,sizeof(format_string),"Zona berhasil dicat ulang.. {afafaf}(id zone:%i/id fraction: %i)",GZInfo[i][gID],params[0]);
			SendClientMessage(playerid, -1, format_string);
			return true;
		}
	}
	return true;
}


CMD:capture(playerid, params[])
{
	if(!IsAGang(playerid)) return Send(playerid, COLOR_GREY, "Hanya tersedia untuk geng.");

	if(PlayerInfo[playerid][pRank] < FracInfo[PlayerInfo[playerid][pMember]][fRankMax]-2) return SCM(playerid, COLOR_GREY, "Luka Anda kecil.");

	if(!strlen(params))
	{
		Send(playerid, -1, "/capture [type(0-1)]");
		return Send(playerid, COLOR_GREY, "Jenis: 0 - daging, 1 - frags");
	}

	new type = strval(params);

	if(!(0 <= type <= 1)) return Send(playerid, COLOR_GREY, "Jenis: 0 - daging, 1 - frags");
	//if(type == 1) return Send(playerid, COLOR_GREY,"Tangkapan untuk pecahan dibekukan sementara");
	new gang_attack = PlayerInfo[playerid][pMember];

	if(IsGangInWar(gang_attack)) return Send(playerid, COLOR_GREY, "Geng Anda sedang berkelahi dengan seseorang.");

	for(new i; i < MAX_ZONES; i++)
	{
		if(!PlayerToKvadrat(playerid,GZInfo[i][gPos][0], GZInfo[i][gPos][1],GZInfo[i][gPos][2],GZInfo[i][gPos][3])) continue;

		if(i == 6 || i == 68 || i == 66 || i == 73 || i == 89)
		    return SCM(playerid, COLOR_GREY, "Dilarang menyerang wilayah utama geng.");

		if(GZInfo[i][gAttack] != 0) return Send(playerid, COLOR_GREY, "Perang sudah terjadi di wilayah ini.");

		new gang_owner = GZInfo[i][gFraction];

		if(gang_owner == gang_attack) return Send(playerid, COLOR_GREY, "Ini adalah wilayah gengmu.");

		if(gang_owner == 0)
		{
		    GZInfo[i][gFraction] = gang_attack;

		    GangZoneHideForAll(GZInfo[i][gID]);
			GangZoneShowForAll(GZInfo[i][gID],GetGangZoneColor(i));

		    return Send(playerid, COLOR_GREY, "Anda telah mengambil kendali atas wilayah tersebut.");
		}

		if(IsGangInWar(gang_owner)) return Send(playerid, COLOR_GREY, "Saat ini, geng Anda berkelahi dengan seseorang.");

		if(GetFractionMemberAmount(gang_attack) < 1) return Send(playerid,COLOR_GREY, "Ada kurang dari 2 orang di geng Anda.!");
		if(GetFractionMemberAmount(gang_owner) < 1) return Send(playerid, COLOR_GREY, "Dalam geng musuh kurang dari 2 orang.");

        GZInfo[i][gAttack] = gang_attack;
        GZInfo[i][gTime] = 420;
		GZInfo[i][gType] = type;
		GZInfo[i][gDoubleDraw] = 0;

		for(new x; x < 2; x++) GZInfo[i][gKills][x] = 0;

        CreateCaptureTD(i);

        TextDrawSetString(GZInfo[i][gTD][3], FracInfo[gang_owner][fName]);
        TextDrawSetString(GZInfo[i][gTD][4], FracInfo[gang_attack][fName]);
        TextDrawSetString(GZInfo[i][gTD][8], IntToString(type));

        foreach(Player, x)
		{
			if(PlayerInfo[x][pMember] != gang_owner && PlayerInfo[x][pMember] != gang_attack) continue;

			for(new j; j < 9; j++) TextDrawShowForPlayer(x, GZInfo[i][gTD][j]);
		}

		Iter_Add(capture_zone_list, i);

		SetTimerEx("CheckGZ", 1000, false, "i", i);

        format(format_string, 96, "Geng Anda telah menyerang wilayah geng %s (Jenis: %s)", FracInfo[gang_owner][fName], type == 0 ? ("Dimiliki") : ("Kosong"));
		SendFrac(gang_attack, 0x4682B4AA, format_string);

		format(format_string, 96, "[Perhatian]: Sebuah geng telah menyerang wilayah Anda %s (Jenis: %s)", FracInfo[gang_attack][fName], type == 0 ? ("Dimiliki") : ("Kosong"));
		SendFrac(GZInfo[i][gFraction], 0x4682B4AA, format_string);

		format(format_string, 96, "%s memprovokasi perang untuk wilayah.", GN(playerid));
		SendFrac(gang_attack, 0x4682B4AA, format_string);
		return SendFrac(GZInfo[i][gFraction], 0x4682B4AA, format_string);
	}

	return Send(playerid, COLOR_GREY, "Anda tidak berada di wilayah geng mana pun.");
}
epublic: CheckGZ(g_id)
{
    GZInfo[g_id][gTime]--;

    GangZoneFlashForAll(GZInfo[g_id][gID], COLOR_RED);

    new gang_owner = GZInfo[g_id][gFraction];
	new gang_attack = GZInfo[g_id][gAttack];

	new type = GZInfo[g_id][gType];

	new str[16];

	format(str, 16, "~n~%s", Convert(GZInfo[g_id][gTime]));
	TextDrawSetString(GZInfo[g_id][gTD][2], str);

	if(type == 0)
	{
	    new members[2];

        foreach(Player, i)
        {
            if(!PlayerToKvadrat(i,GZInfo[g_id][gPos][0], GZInfo[g_id][gPos][1],GZInfo[g_id][gPos][2],GZInfo[g_id][gPos][3])) continue;

            if(PlayerInfo[i][pMember] == gang_owner) members[0]++;
            if(PlayerInfo[i][pMember] == gang_attack) members[1]++;
        }

		TextDrawSetString(GZInfo[g_id][gTD][5], IntToString(members[0]));
		TextDrawSetString(GZInfo[g_id][gTD][6], IntToString(members[1]));
	}

    if(type == 1)
	{
	    TextDrawSetString(GZInfo[g_id][gTD][5], IntToString(GZInfo[g_id][gKills][0]));
		TextDrawSetString(GZInfo[g_id][gTD][6], IntToString(GZInfo[g_id][gKills][1]));
	}

	if(GZInfo[g_id][gTime] == 0)
	{
	    if(type == 0)
	    {
	        new members[2];

	        foreach(Player, i)
	        {
	            if(!PlayerToKvadrat(i,GZInfo[g_id][gPos][0], GZInfo[g_id][gPos][1],GZInfo[g_id][gPos][2],GZInfo[g_id][gPos][3])) continue;

	            if(PlayerInfo[i][pMember] == gang_owner) members[0]++;
	            if(PlayerInfo[i][pMember] == gang_attack) members[1]++;
	        }

	        if(members[0] > members[1]) StopWarGZ(g_id, 1);
	        else if(members[0] < members[1]) StopWarGZ(g_id, 2);
	        else StopWarGZ(g_id, 0);
	    }
	    else
	    {
	        if(GZInfo[g_id][gKills][0] > GZInfo[g_id][gKills][1]) StopWarGZ(g_id, 1);
	        else if(GZInfo[g_id][gKills][0] < GZInfo[g_id][gKills][1]) StopWarGZ(g_id, 2);
	        else StopWarGZ(g_id, 0);
	    }

	    return printf("Perang Wilayah %i berhenti.", g_id);
	}

	return SetTimerEx("CheckGZ", 1000, false, "i", g_id);
}

stock StopWarGZ(g_id, winner)
{
    new gang_owner = GZInfo[g_id][gFraction];
	new gang_attack = GZInfo[g_id][gAttack];

	new winner_id = winner == 2 ? gang_attack : winner == 1 ? gang_owner : 0;

	printf("[GZ] %i %i %i", g_id, winner, winner_id);

	if(winner == 1)
	{
	    format(format_string, 96, "Geng Anda melindungi wilayah dari geng %s", FracInfo[gang_attack][fName]);
		SendFrac(gang_owner, 0x4682B4AA, format_string);

		format(format_string, 96, "Anda tidak dapat menangkap wilayah geng %s", FracInfo[gang_owner][fName]);
		SendFrac(gang_attack, 0x4682B4AA, format_string);
	}
	else if(winner == 2)
	{
	    format(format_string, 96, "Gengmu kehilangan wilayah karena geng %s", FracInfo[gang_attack][fName]);
		SendFrac(gang_owner, 0x4682B4AA, format_string);

		format(format_string, 96, "Gengmu merebut wilayah dari geng %s", FracInfo[gang_owner][fName]);
		SendFrac(gang_attack, 0x4682B4AA, format_string);

		GZInfo[g_id][gFraction] = gang_attack;
	}
	else
	{
	    if(GZInfo[g_id][gDoubleDraw] == 0)
	    {
		    format_string = "Diterbitkan ekstra waktu dalam jumlah 2 menit untuk perang, saat ini skornya sama.";
			SendFrac(gang_owner, 0x4682B4AA, format_string);
			SendFrac(gang_attack, 0x4682B4AA, format_string);

			GZInfo[g_id][gTime] = 120;
			GZInfo[g_id][gDoubleDraw] = 1;

			return SetTimerEx("CheckGZ", 1000, false, "i", g_id);
		}
		else
		{
		    format_string = "Tambah. waktu habis, skor tetap sama, wilayah tetap dengan pertahanan.";
			SendFrac(gang_owner, 0x4682B4AA, format_string);
			SendFrac(gang_attack, 0x4682B4AA, format_string);
		}
	}

	foreach(Player, x)
	{
		if(PlayerInfo[x][pMember] != gang_owner && PlayerInfo[x][pMember] != gang_attack) continue;

		for(new j; j < 9; j++) TextDrawHideForPlayer(x, GZInfo[g_id][gTD][j]);
	}

	Iter_Remove(capture_zone_list, g_id);

	for(new j; j < 9; j++) TextDrawDestroy(GZInfo[g_id][gTD][j]);

	GZInfo[g_id][gAttack] = 0;

	GangZoneStopFlashForAll(GZInfo[g_id][gID]);

	GangZoneHideForAll(GZInfo[g_id][gID]);
	GangZoneShowForAll(GZInfo[g_id][gID],GetGangZoneColor(g_id));
	SaveGZ(g_id);

	foreach(Player, playerid)
	{
	    if(PlayerInfo[playerid][pMember] != winner_id) continue;

	    if(player_quest_info[playerid][quest_id] == GQUEST_TYPE_CAPTURE && player_quest_info[playerid][quest_status] == 1)
        {
            player_quest_info[playerid][quest_progress]++;

            if(player_quest_info[playerid][quest_progress] >= 1)
            {
                player_quest_info[playerid][quest_status] = 2;

                OnPlayerUpdateAccountsPer(playerid, "warehouse_quest_status", 2);

                SetTimerEx("SendPlayerQuestInfoSMS", 15000, false, "ii", playerid, 2);
            }
            else SCMF(playerid, COLOR_YELLOW, "[QUEST] Perang menang: %i/2", player_quest_info[playerid][quest_progress]);
        }
	}

	return 1;
}

CMD:startbet(playerid)
{
	if(PlayerInfo[playerid][pLevel] < 4) return SCM(playerid, COLOR_GREY, "Tersedia dari level 4.");

    if(player_croupier_job{playerid} == 0) return Send(playerid, COLOR_GREY, "Anda bukan croupier.");

    new table_id = player_bone_table[playerid];

	if(table_id == -1) return Send(playerid, COLOR_GREY, "Anda tidak berada di meja apa pun.");

    if(bones_table_state[table_id] != 0) return Send(playerid, COLOR_GREY, "Tunggu sampai permainan berakhir.");

    if(GetBoneTableAmountBet(table_id) < 2) return Send(playerid, COLOR_GREY, "Untuk memulai permainan, 2 pemain atau lebih harus bertaruh.");

	bones_table_state[table_id] = 1;
	bones_table_time[table_id] = 15;

	return SendBoneTableMessage(table_id, "Croupier memulai permainan, hingga 15 detik...");
}

CMD:setbet(playerid)
{
    new table_id = player_bone_table[playerid];
    new slot_id = player_bone_slot[playerid];

	if(table_id == -1) return Send(playerid, COLOR_GREY, "Anda tidak berada di meja apa pun.");

    if(bones_table_state[table_id] != 0) return Send(playerid, COLOR_GREY, "Tunggu hingga game selesai.");

	if(player_croupier_job{playerid} == 1)
	{
	    if(GetBoneTableAmountBet(table_id) != 0) return Send(playerid, COLOR_GREY, "Untuk mengubah taruhan, semua pemain harus membatalkannya.");

	    return SPD(playerid, 3287, DIALOG_STYLE_INPUT, "Ubah jumlah tawaran", "{FFFFFF}Masukkan jumlah taruhan baru:\nDari rp1.000 hingga rp1.000.000", "Edit", "Tutup");
	}

	if(bones_table_bet[table_id] == 0) return Send(playerid, COLOR_GREY, "Croupier belum memasang taruhan.");

	if(bones_player_bet[table_id][slot_id] == true) return Send(playerid, COLOR_GREY, "Anda sudah bertaruh.");

    if(PlayerInfo[playerid][pCash] < bones_table_bet[table_id]) return Send(playerid, COLOR_GREY, "Anda tidak memiliki jumlah yang diperlukan.");

    PlayerInfo[playerid][pCash] -= bones_table_bet[table_id];

    OnPlayerUpdateAccountsPer(playerid, "pCash", PlayerInfo[playerid][pCash]);

    bones_player_bet[table_id][slot_id] = true;

    format(format_string, 96, "{E79833}%s {FFFFFF}bertaruh", PlayerInfo[playerid][pName]);
    return SendBoneTableMessage(table_id, format_string);
}

CMD:apaint(playerid)
{
    if(admin_level[playerid] < 2) return 1;

	if(pb_state != 0) return SCM(playerid, COLOR_GREY, "PB sudah berjalan.");

    StartPaint();

    return SCM(playerid, -1, "Anda meluncurkan PB.");
}

CMD:arace(playerid)
{
	if(admin_level[playerid] < 2) return 1;

	if(race_state != 0) return SCM(playerid, COLOR_GREY, "Balapan sudah berjalan.");

    StartRace();

    return SCM(playerid, -1, "Anda memulai balapan.");
}



// table of zone in database

-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 15, 2021 at 02:11 PM
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
-- Table structure for table `gangzone`
--

CREATE TABLE `gangzone` (
  `id` int(11) NOT NULL,
  `fraction` int(3) NOT NULL,
  `ginfo1` float NOT NULL,
  `ginfo2` float NOT NULL,
  `ginfo3` float NOT NULL,
  `ginfo4` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gangzone`
--

// table of zone in database end
