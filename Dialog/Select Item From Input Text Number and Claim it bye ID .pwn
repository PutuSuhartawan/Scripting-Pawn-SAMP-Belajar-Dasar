
#define MAX_BONE_TABLES (sizeof casino_bone_pos)
#define AntiFloodPlayerInit(%0) 			g_player_flood[%0] = g_flood_default_values

#define GetPlayerAntiFloodData(%0,%1) 		g_player_flood[%0][%1]
#define SetPlayerAntiFloodData(%0,%1,%2)	g_player_flood[%0][%1] = %2
#define AddPlayerAntiFloodData(%0,%1,%2,%3)	g_player_flood[%0][%1] %2= %3
new bones_table_state[MAX_BONE_TABLES];
new bones_table_time[MAX_BONE_TABLES];
new bones_table_bet[MAX_BONE_TABLES];

new Text: bones_global_td[7];
new Text: bones_table_td[MAX_BONE_TABLES][2];

new bones_table_players[MAX_BONE_TABLES][4];
new bones_table_dice[MAX_BONE_TABLES][4];
new bool: bones_player_bet[MAX_BONE_TABLES][4];

new player_bone_table[MAX_PLAYERS];
new player_bone_slot[MAX_PLAYERS];

new croupier_job;
new player_croupier_job[MAX_PLAYERS char];

new casino_info_area[sizeof casino_bone_pos];
//
#define MAX_FLOOD_RATE	(3000)
#define FLOOD_RATE_INC	(1000)
#define FLOOD_RATE_KICK	(5000)
new bool:pDialog[MAX_PLAYERS] ={ false , ... } ;

new const RULETPrizes[][] = {"Exp","Taat hukum","Uang","Rubel","Mobil unik","VIP","Kulit yang unik"}; //nama Vip.
new RULETCarsClassic[] = {404, 405, 410, 419};		//Sama seperti itu
new RULETSkinsClassic[] = {26, 29, 32, 43, 47, 48};//Kulit
#define ROLL_DIALOG 777//Dialog. harus tidak melayani.
#define ROLL_TIMER	20//penundaan antara peralihan
new RollReplace[MAX_PLAYERS],
	RollItem[MAX_PLAYERS];
  
  
new g_player_offer[MAX_PLAYERS][E_PLAYER_OFFER_STURCT];
new const g_offer_default_values[E_PLAYER_OFFER_STURCT] =
{
	INVALID_PLAYER_ID,	// tawaran dikirim ke pemain
	INVALID_PLAYER_ID, 	// tawaran masuk dari pemain
	OFFER_TYPE_NONE, 	// tawaran masuk
	{-1, -1} 			// nilai kalimat yang masuk
};

new cant_make_offer[MAX_PLAYERS];

//

new player_mysql_params[MAX_PLAYERS];
new player_mysql_page[MAX_PLAYERS];

new Text: speed_global_td[25];
new PlayerText: speed_player_td[7][MAX_PLAYERS];

new Text:RedScreen;

new bool: player_news_live[MAX_PLAYERS];


stock GivePlayerBankEx(playerid, amount, reason[])
{
	PlayerInfo[playerid][pBank] += amount;
	OnPlayerUpdateAccountsPer(playerid, "pBank", PlayerInfo[playerid][pBank]);

    if(amount <= -1000 || amount >= 1000)
	{
		format(format_string, 244, "INSERT INTO `money_log` (`user_id`,`amount`,`reason`,`type`) VALUES (%i,%i,'%s ($%i)',1)", GetPlayerAccountID(playerid), amount, reason, PlayerInfo[playerid][pBank]);
		mysql_tquery(mMysql, format_string);
	}

	return 1;
}

forward UPDRulet(playerid);
public UPDRulet(playerid)
{
	if(!IsPlayerConnected(playerid)) return false;
	new string[120+(sizeof(RULETPrizes)*12)];
	strcat(string,"\t{FFFFFF}Hadiah Anda:\n");
	for(new i, z = sizeof(RULETPrizes); i < z; i++){
		strcat(string,"\n");
		strcat(string,(RollItem[playerid] == i)?("{a86cfc}"):("{ffffff}"));
		strcat(string,"\t\t");
		strcat(string,RULETPrizes[i]);
	}
	ShowPlayerDialog(playerid, ROLL_DIALOG, DIALOG_STYLE_MSGBOX, "Roulette scrolling", string, "�k", "");
	if(RollReplace[playerid] > 0 || GetPVarInt(playerid, "roulet_prize_id") != RollItem[playerid])
	{
		RollItem[playerid]++;
		if(RollItem[playerid] >= sizeof(RULETPrizes)) RollItem[playerid] = 0;
		RollReplace[playerid]--;
		SetTimerEx("UPDRulet", (500+(-RollReplace[playerid]*ROLL_TIMER))>25?500+(-RollReplace[playerid]*ROLL_TIMER):25, false, "i", playerid);
		return true;
	}
	return OnPlayerFinishRoll(playerid,RollItem[playerid]);

}

stock update_int_mysql(playerid, column[], value)
{
	new query[256];
	mysql_format(mMysql, query, sizeof query, "UPDATE accounts SET %s = '%d' WHERE pID = '%d' LIMIT 1", column, value, PlayerInfo[playerid][pID]);
	mysql_query(mMysql, query);
	return true;
}


stock StartRulet(playerid)
{
	RollReplace[playerid] = 50+random(50);
	RollItem[playerid] = 0;

	new prize_id = -1;

	switch(random(100))
	{
	    case 0..19: prize_id = 0;
	    case 20..39: prize_id = 1;
	    case 40..54: prize_id = 2;
	    case 55..59: prize_id = 3;
	    case 60..69: prize_id = 4;
	    case 70..84: prize_id = 5;
	    case 85..99: prize_id = 6;
	}

	SetPVarInt(playerid, "roulet_prize_id", prize_id);

	UPDRulet(playerid);
}


stock OnPlayerUpdateAdminPer(i, per[], per1) return format(MySQLStr, 188, "UPDATE `admin` SET `%s` = %d WHERE `Name` = '%s' LIMIT 1", per, per1, GetPlayerNameEx(i)), mysql_tquery(mMysql, MySQLStr, "", "");
stock OnPlayerUpdateSupportPer(i, per[], per1) return format(MySQLStr, 188, "UPDATE `supports` SET `%s` = %d WHERE `user_id` = %i LIMIT 1", per, per1, GetPlayerAccountID(i)), mysql_tquery(mMysql, MySQLStr, "", "");

stock OnPlayerUpdateAccountsPer(i, per[], per1) return format(MySQLStr, 144, "UPDATE `accounts` SET `%s` = %d WHERE `pID` = %d LIMIT 1", per, per1, PlayerInfo[i][pID]), mysql_tquery(mMysql, MySQLStr, "", "");
stock SaveABizzPer(i, per[], per1) return format(MySQLStr, 144, "UPDATE `bizz_fuel` SET `%s` = %d WHERE `aID` = %d LIMIT 1", per, per1, i), mysql_tquery(mMysql, MySQLStr, "", "");
stock SaveBizzPer(i, per[], per1)
{
    if(BizzInfo[i][bEntranceX] == 0.0) return 0;

	format(MySQLStr, 144, "UPDATE `bizz` SET `%s` = %d WHERE `bID` = %d LIMIT 1", per, per1, i);
	mysql_tquery(mMysql, MySQLStr);

	return 1;
}


stock GivePlayerRouletPrize(playerid, item_id, amount)
{
    switch(item_id)
	{
        case 0:
		{
            SCMF(playerid, -1, "Anda mengambil {FF4500}%d"W" Exp.",amount);
            GivePlayerExp(playerid, amount);
        }
        case 1:
		{
            SCMF(playerid, -1, "Anda mengambil {FF4500}%d"W" menurut hukum.", amount);
            PlayerInfo[playerid][pZakon] += amount;
            OnPlayerUpdateAccountsPer(playerid,"pZakon", PlayerInfo[playerid][pZakon]);
        }
        case 2:
		{
            SCMF(playerid, -1, "Anda telah mengambil {43CD80}%d${FFFFFF}, uang untuk menjaring bank.", amount);
            GivePlayerBankEx(playerid, amount, "Hadiah roulette virtual");
        }
        case 3:
		{
            SCMF(playerid, -1, "Anda mengambil {FF4500}%d"W" rubel.", amount);
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
				    if(i > 0 && GetPlayerHouse(playerid) == -1 && PlayerInfo[playerid][pHotel] == -1) return Send(playerid, -1, "Anda tidak memiliki rumah!");

				    is_have_slot = true;
					RuletGiveCar(playerid,i,GetPVarInt(playerid,"RULETdrop"));
					break;
				}
			}

			if(!is_have_slot) SCM(playerid, COLOR_GREY, "Semua slot kendaraan ditempati.");
        }
        case 5:
		{
            if(!IsVIP(playerid))
			{
				new coVIPTypes[][] = {"BRONZE","SILVER","GOLD"};
                PlayerInfo[playerid][pVip] = random(3)+1;
				SCMF(playerid, 0x2eb0ffaa, "Selamat! Anda memenangkan {FF4500}%d Hadiah %s VIP.", amount,coVIPTypes[PlayerInfo[playerid][pVip]-1]);
                OnPlayerUpdateAccountsPer(playerid,"pVip",PlayerInfo[playerid][pVip]);
                PlayerInfo[playerid][pVipTime] = gettime() + (3600 * amount);
            }
            else{
				SCMF(playerid, 0x2eb0ffaa, "Selamat! Anda memenangkan {FF4500}%d Hadiah VIP.", amount);
                PlayerInfo[playerid][pVipTime] += 3600 * amount;
			}
            OnPlayerUpdateAccountsPer(playerid,"pVipTime",PlayerInfo[playerid][pVipTime]);
        }
        case 6:
		{
		    if(GetPlayerSkin(playerid) == PlayerInfo[playerid][pSkin]) SetPlayerSkin(playerid, amount);

            PlayerInfo[playerid][pSkin] = amount;
            SCMF(playerid, -1, "Anda mengambil skin {FF4500}%d", PlayerInfo[playerid][pSkin]);

            OnPlayerUpdateAccountsPer(playerid, "pSkin", amount);
        }
    }

    format(format_string, 188, "DELETE FROM `roulet_prizes` WHERE `item_id` = %i AND `amount` = %i AND `user_id` = %i LIMIT 1", item_id, amount, GetPlayerAccountID(playerid));
    mysql_tquery(mMysql, format_string);

    return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	//Drugs
	switch(dialogid)
	{
case 4762:
		{
		    if(!response) return 1;

            if(strfind(inputtext, "10") != -1)
	        {
	            player_mysql_page[playerid]++;
	            ShowPlayerPrizeList(playerid);
	        }
	        else if(strfind(inputtext, "11") != -1)
	        {
	            player_mysql_page[playerid]--;
	            ShowPlayerPrizeList(playerid);
	        }
			else
			{
			    new select_id = strval(inputtext);
			    new max_rows = GetPlayerUseListitem(playerid);

				if(!(0 <= select_id <= max_rows-1)) return callcmd::priz(playerid);

			    new page = player_mysql_page[playerid];

	    		format(format_string, 96, "SELECT * FROM `roulet_prizes` WHERE `user_id` = %i LIMIT %i, 10", GetPlayerAccountID(playerid), page * 10);
				new Cache: result = mysql_query(mMysql, format_string, true);

				if(cache_num_rows() == 0) return 1;

				new item_id, amount;

		        cache_get_value_name_int(select_id, "item_id", item_id);
		        cache_get_value_name_int(select_id, "amount", amount);

				cache_delete(result);

				GivePlayerRouletPrize(playerid, item_id, amount);
			}
		}
    
 }

stock ShowPlayerPrizeList(playerid)
{
    new page = player_mysql_page[playerid];

    format(format_string, 96, "SELECT * FROM `roulet_prizes` WHERE `user_id` = %i LIMIT %i, 10", GetPlayerAccountID(playerid), page * 10);
	new Cache: result = mysql_query(mMysql, format_string, true);

	new rows = cache_num_rows();

	if(rows == 0) return SCM(playerid, COLOR_GREY, "Anda tidak punya hadiah.");

	static prizes_type[][] = { "EXP", "Ketaatan hukum", "Uang", "Gold", "Transportasi", "VIP", "Pakaian" };
	static prizes_unit[][] = { "unit. ", "unit. ", "$", "DM ", "ID: ", "h. ", "ID: " };

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


CMD:priz(playerid)
{
 	player_mysql_page[playerid] = 0;

	return ShowPlayerPrizeList(playerid);
}

/*
-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 23, 2021 at 10:20 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `asu`
--

-- --------------------------------------------------------

--
-- Table structure for table `roulet_prizes`
--

CREATE TABLE `roulet_prizes` (
  `user_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

*/
