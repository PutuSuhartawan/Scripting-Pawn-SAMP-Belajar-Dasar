#include <a_samp>
#include <streamer>
#include <foreach>
#include <a_mysql>
#include <sscanf2>
#include <Pawn.CMD>
#include <timestamptodate>
#include <progress2>
#include <TOTP>
#include <sampvoice>
#include <md5>
#include <zonaname>
#include <Pawn.RakNet>
#define MAILER_URL "Comingsson"
#include <mailer>
#include <nex-ac>
#include <mxdate>
#include <crashdetect>
#include <time>
#include <Pawn.Regex>
#include <mxdate>
#include <profiler>
#include <discord-connector>
#include    <YSI\y_iterate>     // by Y_Less - http://forum.sa-mp.com/showthread.php?t=570884
#include    <sqlitei>          // by Slice - http://forum.sa-mp.com/showthread.php?t=303682
//

#define GetPlayerUseListitem(%0) 		g_player_listitem_use[%0]
#define SetPlayerUseListitem(%0,%1) 	g_player_listitem_use[%0] = %1

new g_player_listitem_use[MAX_PLAYERS] = {-1, ...};

#define SetPlayerListitemValue(%0,%1,%2) 	g_player_listitem[%0][%1] = %2
#define GetPlayerListitemValue(%0,%1) 		g_player_listitem[%0][%1]


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


//
#define GetPlayerNameEx(%0) PlayerInfo[%0][pName]
#define Name(%1) 										PlayerInfo[%1][pName]
#define MAX_IP_ADRESS     								40
#define GameTextForPlayer1(%0,%1,%2,%3)           		format(String, 144, %2,%3) && GameTextForPlayer(String, 2000, 1)
#define GetDistanceBetweenPoints(%0,%1,%2,%3,%4,%5) 	(floatsqroot(floatpower(%3-%0,2.0)+floatpower(%4-%1,2.0)+floatpower(%5-%2,2.0)))
#define SCMF(%0,%1,%2,%3)           					format(format_string, 144, %2,%3) && SendClientMessage(%0, %1, format_string)
#define PlayerToPoint%5(%0,%1,%2,%3,%4) 				IsPlayerInRangeOfPoint%5(%1,%0,%2,%3,%4)
#define epublic:%0(%1)									forward public %0(%1); public %0(%1)
#define RandomEx(%0,%1) 								random(%1 - %0) + %0
#define Send(%0,%1,%2) 									SendClientMessage(%0,%1,%2)
#define MAXSUMMASAMP 									999999999
#define SCM SendClientMessage


enum pInfo
{
	// global
	pID, pName[MAX_PLAYER_NAME], pIP[16], pPassword[33], pass_salt[6], pMail[64], pPodtvMail, pIpReg[16], pIp[16], pReferal, pLogin, Float: pHP, Float: pSatiety, Float: pThirst, pSex, pSkin, pCash, pBank, pLevel, pExp, pSetSpawn, pMember, pRank, pLeader, pJob,
	pDrugs, pUdut, pDrugDep, pPatron, pMetall, pHackBank, pBanki, pUseCar, pProducts[3], pNumber, pSummaNumber, pSatietyBarActive, pZakon, pWanted, pfWarn, pMuted, pPayCheck, pUpdPlayer[5], pInGameSeconds, pInGameAFKSeconds, pInGameHourSeconds, pClock, pFreeRoulet, pSupport,
	pCheckGoogle, pPrison, pMestoPrison, pGun[13], pAmmo[13], pBolnica, pFrSkin, pLicenses[5], pGunSkill[6], pText, pHeals, pRouble, pVip, pVipTime, pPromo, pReffund[64], pHotel, pMask, pClip, pInfSatiety, pRepairKit, pElecVote, pBoombox, pHelm, pComponent,
	pGPCI[40],Neon, pDutyPln, pDutyJne, pJne, pDutyDaging, pDutyMiner, pDutyKuli, pSemenKuli, pPemotong, pPln, pMiner, pStaterpack, pTali, pDutyIkan, pIkan, pPlatinum, pPaket, pBox,
	//Keluar dari posisi  Float: PosX, Float: PosY, Float: PosZ, Float: Angle, Interior, VirtualWorld,

	// admins
	pAdminKey[16], pAdmRep, pAdmRepDay, pAdmKick, pAdmBan, pAdmWarn, pAdmPrison, pAdmMute, pDataNaz[32],
	// local
	pObject, Text3D:pDText, pWarn, pFamily, pFamilyRang, pDrugMarkID, pDrugMarkAmount, pDrugPickup, pDrunk, pMoneyCase


	// PlayerInfo[playerid][pProducts][0] - telepon
	// PlayerInfo[playerid][pProducts][1] - buku telepon
};
new PlayerInfo[MAX_PLAYERS][pInfo];

enum cINFO // Tuning
{
	cID, cCost, cType[32], cName[32]
};
new TuneCost[MAX_PLAYERS], NewColor[MAX_PLAYERS][2];

enum wInfo
{
	wID, wReasonWarn[32], wAdminWarn[32], wWarnDate, wUnWarnDate
};
new WarnInfo[MAX_PLAYERS][3][wInfo];

new gangenter[10];

enum numInfo
{
	nID, plID, numName[64], nNumber
};
new NumberInfo[MAX_PLAYERS][MAX_NUMBER][numInfo];

#define MAX_FRACTIONS 24

enum frInfo
{
    fName[32], Float:fSpawn[4], fInt, fVw, fSkin[10], fSkinKolvo, fRankMax, fLevel, fBank[3], fTag[16], fSalary[16]
};
new FracInfo[MAX_FRACTIONS][frInfo];

new FracRank[MAX_FRACTIONS][16][40];


public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
switch(dialogid)
	{
case 7617:
		{
		    if(!response) return 1;

		    new to_player = GetPlayerUseListitem(playerid);
		    new fr_id = GetPlayerListitemValue(playerid, listitem);

		    if(admin_level[to_player] > 0) SetPVarInt(playerid,"mklr_admin", 1);
			SetPVarInt(playerid, "IDLeaders", fr_id);
			SetPVarInt(playerid, "IDLeadersPlayer", to_player);
			format(MySQLStr, 96, "SELECT * FROM `accounts` WHERE `pLeader` = %d", fr_id);
			mysql_tquery(mMysql, MySQLStr, "OnMySQL_Query","iis", playerid, 17, to_player);
	    }
      
      
        case 0:
		        {
		            mysql_format(mMysql, MySQLStr, 188, "UPDATE `accounts` SET `pMember`= 0,`pfWarn`= 0,`pLeader`= 0,`pRank`= 0 WHERE `pID` = %i", sql_id);
					mysql_tquery(mMysql, MySQLStr);

					SCMF(playerid, 0x6BB3FFAA, "Offline: Anda memecat seorang pemain %s pecahan!", GetPlayerNameBySqlID(sql_id));

					ShowPlayerOfflineMembers(playerid);
		        }
			
			case 183:
	    {
	        if(!response) return DeletePVar(playerid, "aUninviteID"), DeletePVar(playerid, "aUninviteReason");
			new str[32];
			new paramsplayers = GetPVarInt(playerid, "aUninviteID");
			GetPVarString(playerid, "aUninviteReason", str, sizeof(str));

    		format(format_string, sizeof(format_string), "[A] Admin %s[%d] melepas pemimpin %s[%d] dengan fraksi %s. Alasan: %s", Name(playerid), playerid, Name(paramsplayers), paramsplayers, FracInfo[PlayerInfo[paramsplayers][pMember]][fName], str), SendAdminMessage(COLOR_GREY, format_string);
			SCMF(paramsplayers, 0x6BB3FFAA, "Admin %s(%i) dihapus otoritas kepemimpinan Anda (%s). Alasan: %s", Name(playerid), playerid, FracInfo[PlayerInfo[paramsplayers][pMember]][fName], str);
    		SCMF(playerid, 0x6BB3FFAA, "Anda dipecat %s(%i) dari organisasi (%s). Alasan: %s", Name(paramsplayers), paramsplayers, FracInfo[PlayerInfo[paramsplayers][pMember]][fName], str);

    		PlayerInfo[paramsplayers][pLeader] = 0;
	    	PlayerInfo[paramsplayers][pSetSpawn] = 1;
	    	PlayerInfo[paramsplayers][pMember] = 0;
	    	PlayerInfo[paramsplayers][pRank] = 0;
	    	PlayerInfo[paramsplayers][pfWarn] = 0;
			form_fraction[paramsplayers] = 0;

			SavePlayerFraction(paramsplayers);
			SetPlayerSkinEx(paramsplayers, PlayerInfo[paramsplayers][pSkin]);
			SetPlayerToTeamColor(paramsplayers);
			return DeletePVar(playerid, "aUninviteID"), DeletePVar(playerid, "aUninviteReason");
		}
		
		
      }
      
      
  }
  
  
//LoginCallBack
publics: OnPlayerLoadAccounts(playerid)
{
	new rows;
	cache_get_row_count(rows);
	//
	if(rows)
	{
	    static result_string[256];

		// Memuat akun
		cache_get_value_name(0, "promo", PlayerInfo[playerid][pPromo], 64);
     	cache_get_value_name(0, "pMail", PlayerInfo[playerid][pMail], 64);
     	cache_get_value_name(0, "pIpReg", PlayerInfo[playerid][pIpReg], 16);
     	cache_get_value_name(0, "pIp", PlayerInfo[playerid][pIp], 16);
        cache_get_value_float(0, "pSatiety", PlayerInfo[playerid][pSatiety]);
        cache_get_value_float(0, "pThirst", PlayerInfo[playerid][pThirst]);
        cache_get_value_int(0, "pMoneyCase", PlayerInfo[playerid][pMoneyCase]);
     	cache_get_value_int(0, "pSex", PlayerInfo[playerid][pSex]);
     	cache_get_value_int(0, "pSkin", PlayerInfo[playerid][pSkin]);
     	cache_get_value_int(0, "pCash", PlayerInfo[playerid][pCash]);
     	cache_get_value_int(0, "pBank", PlayerInfo[playerid][pBank]);
     	cache_get_value_int(0, "pElecVote", PlayerInfo[playerid][pElecVote]);
     	cache_get_value_int(0, "pLevel", PlayerInfo[playerid][pLevel]);
     	cache_get_value_int(0, "pInGameSeconds", PlayerInfo[playerid][pInGameSeconds]);
     	cache_get_value_int(0, "pInGameAFKSeconds", PlayerInfo[playerid][pInGameAFKSeconds]);
        cache_get_value_int(0, "pInGameHourSeconds", PlayerInfo[playerid][pInGameHourSeconds]);
     	cache_get_value_int(0, "pExp", PlayerInfo[playerid][pExp]);
     	cache_get_value_int(0, "pSetSpawn", PlayerInfo[playerid][pSetSpawn]);
     	cache_get_value_int(0, "pMember", PlayerInfo[playerid][pMember]);
     	cache_get_value_int(0, "pClock", PlayerInfo[playerid][pClock]);
     	cache_get_value_int(0, "pBoombox", PlayerInfo[playerid][pBoombox]);
     	cache_get_value_int(0, "pComponent", PlayerInfo[playerid][pComponent]);
     	cache_get_value_int(0, "pRank", PlayerInfo[playerid][pRank]);
     	cache_get_value_int(0, "pLeader", PlayerInfo[playerid][pLeader]);
     	cache_get_value_int(0, "pFreeRoulet", PlayerInfo[playerid][pFreeRoulet]);
     	cache_get_value_int(0, "pReferal", PlayerInfo[playerid][pReferal]);
     	cache_get_value_int(0, "pJob", PlayerInfo[playerid][pJob]);
     	cache_get_value_int(0, "pDrugs", PlayerInfo[playerid][pDrugs]);
     	cache_get_value_int(0, "pDrugDep", PlayerInfo[playerid][pDrugDep]);
     	cache_get_value_int(0, "pPatron", PlayerInfo[playerid][pPatron]);
     	cache_get_value_int(0, "pMetall", PlayerInfo[playerid][pMetall]);
     	cache_get_value_int(0, "pMask", PlayerInfo[playerid][pMask]);
     	cache_get_value_int(0, "pStaterpack", PlayerInfo[playerid][pStaterpack]);
     	cache_get_value_int(0, "pTali", PlayerInfo[playerid][pTali]);
     	cache_get_value_int(0, "pUdut", PlayerInfo[playerid][pUdut]);
     	cache_get_value_int(0, "pClip", PlayerInfo[playerid][pClip]);
     	cache_get_value_int(0, "pUseCar", PlayerInfo[playerid][pUseCar]);
     	cache_get_value_int(0, "pNumber", PlayerInfo[playerid][pNumber]);
     	cache_get_value_int(0, "pSummaNumber", PlayerInfo[playerid][pSummaNumber]);
     	cache_get_value_int(0, "pSatietyBarActive", PlayerInfo[playerid][pSatietyBarActive]);
     	cache_get_value_int(0, "pZakon", PlayerInfo[playerid][pZakon]);
     	cache_get_value_int(0, "pRepairKit", PlayerInfo[playerid][pRepairKit]);
     	cache_get_value_int(0, "pCheckGoogle", PlayerInfo[playerid][pCheckGoogle]);
     	cache_get_value_int(0, "pPrison", PlayerInfo[playerid][pPrison]);
     	cache_get_value_int(0, "pMestoPrison", PlayerInfo[playerid][pMestoPrison]);
     	cache_get_value_int(0, "pBolnica", PlayerInfo[playerid][pBolnica]);
     	cache_get_value_int(0, "pFrSkin", PlayerInfo[playerid][pFrSkin]);
     	cache_get_value_name(0, "pCodeGoogle", pCodeGoogle[playerid], 17);
     	cache_get_value_int(0, "pWanted", PlayerInfo[playerid][pWanted]);
     	cache_get_value_int(0, "pfWarn", PlayerInfo[playerid][pfWarn]);
     	cache_get_value_int(0, "pMuted", PlayerInfo[playerid][pMuted]);
     	cache_get_value_int(0, "pPayCheck", PlayerInfo[playerid][pPayCheck]);
     	cache_get_value_int(0, "pPodtvMail", PlayerInfo[playerid][pPodtvMail]);
     	cache_get_value_int(0, "pText", PlayerInfo[playerid][pText]);
		cache_get_value_int(0, "pHeals", PlayerInfo[playerid][pHeals]);
		cache_get_value_int(0, "pRouble", PlayerInfo[playerid][pRouble]);
		cache_get_value_int(0, "pVip", PlayerInfo[playerid][pVip]);
		cache_get_value_int(0, "pVipTime", PlayerInfo[playerid][pVipTime]);
		cache_get_value_int(0, "pInfSatiety", PlayerInfo[playerid][pInfSatiety]);
		cache_get_value_int(0, "pHotel", PlayerInfo[playerid][pHotel]);
		cache_get_value_int(0, "pDrugMarkID", PlayerInfo[playerid][pDrugMarkID]);
		cache_get_value_int(0, "pDrugMarkAmount", PlayerInfo[playerid][pDrugMarkAmount]);
        cache_get_value_name(0, "pProducts",String), sscanf(String, "p<,>a<i>[3]", PlayerInfo[playerid][pProducts]);
        cache_get_value_name(0, "pGunSkill",String), sscanf(String, "p<,>a<i>[6]", PlayerInfo[playerid][pGunSkill]);
        cache_get_value_name(0, "pLicenses",String), sscanf(String, "p<,>a<i>[4]", PlayerInfo[playerid][pLicenses]);
     	cache_get_value_name(0, "pGun",String), sscanf(String, "p<,>a<i>[13]", PlayerInfo[playerid][pGun]);
     	cache_get_value_name(0, "pAmmo",String), sscanf(String, "p<,>a<i>[13]", PlayerInfo[playerid][pAmmo]);
     	cache_get_value_name(0, "pUpdPlayer",String), sscanf(String, "p<,>a<i>[5]", PlayerInfo[playerid][pUpdPlayer]);
     	cache_get_value_int(0, "family", PlayerInfo[playerid][pFamily]);
     	cache_get_value_int(0, "family_rang", PlayerInfo[playerid][pFamilyRang]);
     	cache_get_value_int(0, "warehouse_quest_id", player_quest_info[playerid][quest_id]);
     	cache_get_value_int(0, "warehouse_quest_status", player_quest_info[playerid][quest_status]);
     	cache_get_value_int(0, "warehouse_quest_progress", player_quest_info[playerid][quest_progress]);
     	cache_get_value_int(0, "warehouse_quest_block", player_quest_info[playerid][quest_block]);

        cache_get_value_int(0, "b_quest_id", beg_quest_info[playerid][b_quest_id]);
        cache_get_value_int(0, "b_quest_status", beg_quest_info[playerid][b_quest_status]);
        cache_get_value_int(0, "b_quest_progress", beg_quest_info[playerid][b_quest_progress]);
 

     	//

     	cache_get_value_name(0, "cModel",result_string);
		sscanf(result_string, "p<,>a<i>[3]", CarInfo[playerid][cModel]);

     	cache_get_value_name(0, "cColor1",result_string);
		sscanf(result_string, "p<,>a<i>[3]", CarInfo[playerid][cColor1]);

		cache_get_value_name(0, "cColor2",result_string);
		sscanf(result_string, "p<,>a<i>[3]", CarInfo[playerid][cColor2]);

		cache_get_value_name(0, "cNumber",result_string);
		sscanf(result_string, "p<,>a<s[9]>[3]", VehicleNumberPlate[playerid]);

		cache_get_value_name(0, "cLock",result_string);
		sscanf(result_string, "p<,>a<i>[3]", CarInfo[playerid][cLock]);

		cache_get_value_name(0, "cFuel",result_string);
		sscanf(result_string, "p<,>a<f>[3]", CarInfo[playerid][cFuel]);

		cache_get_value_name(0, "cCost",result_string);
		sscanf(result_string, "p<,>a<i>[3]", CarInfo[playerid][cCost]);

		cache_get_value_name(0, "cProbeg",result_string);
		sscanf(result_string, "p<,>a<f>[3]", CarInfo[playerid][cProbeg]);

		cache_get_value_name(0, "cHeal",result_string);
		sscanf(result_string, "p<,>a<f>[3]", CarInfo[playerid][cHeal]);

		cache_get_value_name(0, "cDamagePanel",result_string);
		sscanf(result_string, "p<,>a<i>[3]", CarInfo[playerid][cDamagePanel]);

		cache_get_value_name(0, "cDamageDoors",result_string);
		sscanf(result_string, "p<,>a<i>[3]", CarInfo[playerid][cDamageDoors]);

		cache_get_value_name(0, "cDamageLights",result_string);
		sscanf(result_string, "p<,>a<i>[3]", CarInfo[playerid][cDamageLights]);

		cache_get_value_name(0, "cDamageTires",result_string);
		sscanf(result_string, "p<,>a<i>[3]", CarInfo[playerid][cDamageTires]);

     	cache_get_value_name(0, "cWheels",result_string);
		sscanf(result_string, "p<,>a<i>[3]", CarInfo[playerid][cWheels]);

		cache_get_value_name(0, "cSpoiler",result_string);
		sscanf(result_string, "p<,>a<i>[3]", CarInfo[playerid][cSpoiler]);

     	cache_get_value_name(0, "cBumper1",result_string);
		sscanf(result_string, "p<,>a<i>[3]", CarInfo[playerid][cBumper1]);

		cache_get_value_name(0, "cBumper2",result_string);
		sscanf(result_string, "p<,>a<i>[3]", CarInfo[playerid][cBumper2]);

		cache_get_value_name(0, "cNitro",result_string);
		sscanf(result_string, "p<,>a<i>[3]", CarInfo[playerid][cNitro]);

		cache_get_value_name(0, "cHydrawlic",result_string);
		sscanf(result_string, "p<,>a<i>[3]", CarInfo[playerid][cHydrawlic]);

		cache_get_value_name(0, "cHood",result_string);
		sscanf(result_string, "p<,>a<i>[3]", CarInfo[playerid][cHood]);

		cache_get_value_name(0, "cRoof",result_string);
		sscanf(result_string, "p<,>a<i>[3]", CarInfo[playerid][cRoof]);

		cache_get_value_name(0, "cSideskirt",result_string);
		sscanf(result_string, "p<,>a<i>[3]", CarInfo[playerid][cSideskirt]);

		cache_get_value_name(0, "cLamps",result_string);
		sscanf(result_string, "p<,>a<i>[3]", CarInfo[playerid][cLamps]);

		cache_get_value_name(0, "cExhaust",result_string);
		sscanf(result_string, "p<,>a<i>[3]", CarInfo[playerid][cExhaust]);

		cache_get_value_name(0, "cStereo",result_string);
		sscanf(result_string, "p<,>a<i>[3]", CarInfo[playerid][cStereo]);

		cache_get_value_name(0, "cVentRight",result_string);
		sscanf(result_string, "p<,>a<i>[3]", CarInfo[playerid][cVentRight]);

		cache_get_value_name(0, "cVentLeft",result_string);
		sscanf(result_string, "p<,>a<i>[3]", CarInfo[playerid][cVentLeft]);

		cache_get_value_name(0, "cSost",result_string);
		sscanf(result_string, "p<,>a<i>[3]", CarInfo[playerid][cSost]);

		cache_get_value_name(0, "cPaintJobs",result_string);
		sscanf(result_string, "p<,>a<i>[3]", CarInfo[playerid][cPaintJobs]);

		new tune_string[MAX_PLAYER_VEHICLES][32];

		cache_get_value_name(0, "engine_tune", result_string);
		SplitString(result_string, tune_string, '|');
		for(new i; i < MAX_PLAYER_VEHICLES; i++) sscanf(tune_string[i], "p<,>a<i>[5]",player_engine_tune[playerid][i]);

		cache_get_value_name(0, "brake_tune", result_string);
		SplitString(result_string, tune_string, '|');
		for(new i; i < MAX_PLAYER_VEHICLES; i++) sscanf(tune_string[i], "p<,>a<i>[5]",player_brake_tune[playerid][i]);

     	cache_get_value_name(0, "car_park", result_string);
		SplitString(result_string, tune_string, '|');
		for(new i; i < MAX_PLAYER_VEHICLES; i++) sscanf(tune_string[i], "p<,>a<f>[4]",player_car_park[playerid][i]);
		

     	for(new i; i < MAX_PLAYER_VEHICLES; i++)
     	{
     	    new bool: need_save = false;

	     	if(CarInfo[playerid][cModel][i] != 0 && player_car_park[playerid][i][0] == 0.0)
	     	{
	     	    new rand = random(sizeof default_park_pos);

	     	    player_car_park[playerid][i][0] = default_park_pos[rand][0];
	     	    player_car_park[playerid][i][1] = default_park_pos[rand][1];
	     	    player_car_park[playerid][i][2] = default_park_pos[rand][2];
	     	    player_car_park[playerid][i][3] = 0.0;

	     	    need_save = true;
	     	}

	     	if(need_save) SavePlayerCarPark(playerid);
		}

		new last_date[16];
		cache_get_value_name(0, "pOnline", last_date, 16);

		//

		new now_date = getdate(), last_curdate;

		cache_get_value_int(0, "last_curdate", last_curdate);

		if(last_curdate != now_date)
		{
			format(format_string, 144, "INSERT INTO `online_log` (`user_id`,`day`,`play_time`,`afk_time`) VALUES (%i,'%s',%i,%i);", GetPlayerAccountID(playerid), last_date, PlayerInfo[playerid][pInGameSeconds], PlayerInfo[playerid][pInGameAFKSeconds]);
		    mysql_tquery(mMysql, format_string);

			PlayerInfo[playerid][pInGameSeconds] = PlayerInfo[playerid][pInGameAFKSeconds] = 0;

		    format(format_string, 244, "UPDATE `accounts` SET `pInGameSeconds` = 0, `pInGameAFKSeconds` = 0, `last_curdate` = %i, `pOnline` = '%02i.%02i.%i' WHERE `pID` = %i", now_date, day, month, year, GetPlayerAccountID(playerid));
		    mysql_tquery(mMysql, format_string);

		    OnPlayerUpdateAdminPer(playerid, "pAdmRepDay", 0);
		    OnPlayerUpdateSupportPer(playerid, "reports_day", 0);
		}

		//

		new hour, minute, second;

		gettime(hour, minute, second);

		new last_hour;

		cache_get_value_int(0, "last_hour", last_hour);

		if(hour != last_hour)
		{
			PlayerInfo[playerid][pInGameHourSeconds] = 0;

		    format(format_string, 188, "UPDATE `accounts` SET `pInGameHourSeconds` = 0, `last_hour` = %i WHERE `pID` = %i", hour, GetPlayerAccountID(playerid));
		    mysql_tquery(mMysql, format_string);
		}

        //new f_id = GetPlayerData(playerid, pFamily);
		//if(f_id != -1) CreatePlayer3DFamily(playerid);

		foreach(new i : capture_zone_list)
		{
		    if(PlayerInfo[playerid][pMember] != GZInfo[i][gFraction] && PlayerInfo[playerid][pMember] != GZInfo[i][gAttack]) continue;

			for(new j; j < 9; j++) TextDrawShowForPlayer(playerid, GZInfo[i][gTD][j]);

			break;
		}

		if(BW_INFO[bw_time] != 0 && (PlayerInfo[playerid][pMember] == BW_INFO[bw_attack] || PlayerInfo[playerid][pMember] == BW_INFO[bw_owner]))
		{
		    for(new j; j < 8; j++) TextDrawShowForPlayer(playerid, BW_INFO[bw_td][j]);
		}

		if(PlayerInfo[playerid][pLevel] > 1 && election_status && !PlayerInfo[playerid][pElecVote])
		{
			SCM(playerid, 0xa86cfcFF, "Perhatian! {FFFFFF}Negara mengadakan pemilihan presiden!");
			SCM(playerid, -1, "Anda dapat memilih di gedung Pemerintah {D4D4D4}(/gps > gedung > Administrasi Presiden)");
		}

		CreatePlayeDrugMark(playerid);

		UpdatePlayerQuestData(playerid);

  		format(MySQLStr, 96, "SELECT * FROM `warninfo` WHERE `plID` = %d", PlayerInfo[playerid][pID]); // LoadWarns
		mysql_tquery(mMysql, MySQLStr, "LoadMyWarns", "d", playerid);
		//
 		LoadAccounts(playerid);
  	}
  	else Send(playerid, COLOR_GREY, "Telah terjadi kesalahan kritis, beri tahu administrasi server.");
  	return 1;
}

publics: ShowPlayerNofitications(playerid)
{
    new rows;
	cache_get_row_count(rows);

	if(!rows) return 1;

	new text[244];

	for(new i; i < rows; i++)
	{
	    cache_get_value_name(0, "text", text);

	    SCMF(playerid, COLOR_YELLOW, "[Perhatikan] {FFFFFF}%s", text);
	}

	format(format_string, 144, "DELETE FROM `notifications` WHERE `user_id` = %i", GetPlayerAccountID(playerid));
	mysql_tquery(mMysql, format_string);

	return 1;
}

publics: OnPlayerSupport(playerid)
{
	new rows;
	cache_get_row_count(rows);

	if(!rows) return 1;

	Iter_Add(support_list, playerid);

    PlayerInfo[playerid][pSupport] = 1;

 	cache_get_value_int(0, "reports", PlayerInfo[playerid][pAdmRep]);
 	cache_get_value_int(0, "reports_day", PlayerInfo[playerid][pAdmRepDay]);

 	return 1;
}

epublic: OnPlayerAdminAccounts(playerid)
{
	new rows;
	cache_get_row_count(rows);
	//
	if(rows)
	{
	    cache_get_value_name(0, "pAdminKey", PlayerInfo[playerid][pAdminKey], 16);
	    cache_get_value_name(0, "pDataNaz", PlayerInfo[playerid][pDataNaz], 32);

     	cache_get_value_int(0, "pAdmin", admin_level[playerid]);
     	cache_get_value_int(0, "pAdmRep", PlayerInfo[playerid][pAdmRep]);
     	cache_get_value_int(0, "pAdmRepDay", PlayerInfo[playerid][pAdmRepDay]);
     	cache_get_value_int(0, "pAdmKick", PlayerInfo[playerid][pAdmKick]);
     	cache_get_value_int(0, "pAdmBan", PlayerInfo[playerid][pAdmBan]);
     	cache_get_value_int(0, "pAdmWarn", PlayerInfo[playerid][pAdmWarn]);
     	cache_get_value_int(0, "pAdmPrison", PlayerInfo[playerid][pAdmPrison]);
     	cache_get_value_int(0, "pAdmMute", PlayerInfo[playerid][pAdmMute]);

      	admin_level[playerid] = admin_level[playerid];
      	/*if(admin_level[playerid] >= 7) Send(playerid, COLOR_YELLOW, "Anda masuk sebagai manajer proyek.");
      	else SCMF(playerid, COLOR_YELLOW, "Anda masuk sebagai administrator tingkat% d.", admin_level[playerid]);*/
      	ALogin(playerid);

      	for(new x; x < 2; x++) for(new i; i < 10; i++) TextDrawShowForPlayer(playerid, cheat_td[x][i]);
 	}
 	else admin_level[playerid] = 0, admin_logged[playerid] = 0;
}

stock OnPlayerUpdateAccounts(playerid)
{
    if(PlayerInfo[playerid][pLogin] == 0) return 1;

	static string[256];

    MySQLStr = "";

    format(string, 256, "UPDATE `accounts` SET `pSatiety` = '%.3f', `pThirst` = '%.3f', `pSetSpawn` = %d, `pJob` = %d",
 	PlayerInfo[playerid][pSatiety], PlayerInfo[playerid][pThirst], PlayerInfo[playerid][pSetSpawn], PlayerInfo[playerid][pJob]);
	strcat(MySQLStr, string);

	format(string, 188, ", `pPatron` = %d, `pMetall` = %d, `pUseCar` = %d, `pInGameHourSeconds` = %i",
 	PlayerInfo[playerid][pPatron], PlayerInfo[playerid][pMetall], PlayerInfo[playerid][pUseCar], PlayerInfo[playerid][pInGameHourSeconds]);
    strcat(MySQLStr, string);

	format(string, 256, ", `pNumber` = %d, `pSummaNumber` = %d, `pSatietyBarActive` = %d, `pZakon` = %d, `pWanted` = %d, `pfWarn` = %d",
 	PlayerInfo[playerid][pNumber], PlayerInfo[playerid][pSummaNumber], PlayerInfo[playerid][pSatietyBarActive], PlayerInfo[playerid][pZakon], PlayerInfo[playerid][pWanted], PlayerInfo[playerid][pfWarn]);
    strcat(MySQLStr, string);

	format(string, 256, ", `pMuted` = %d, `pUpdPlayer` = '%i,%i,%i,0,0'",
 	PlayerInfo[playerid][pMuted], PlayerInfo[playerid][pUpdPlayer][0], PlayerInfo[playerid][pUpdPlayer][1], PlayerInfo[playerid][pUpdPlayer][2]);
    strcat(MySQLStr, string);

	format(string, 256, ", `pPrison` = %d, `pMestoPrison` = %d, `pBolnica` = %d, `pInGameSeconds` = %i, pInGameAFKSeconds = %i",
 	PlayerInfo[playerid][pPrison], PlayerInfo[playerid][pMestoPrison], PlayerInfo[playerid][pBolnica], PlayerInfo[playerid][pInGameSeconds], PlayerInfo[playerid][pInGameAFKSeconds]);
    strcat(MySQLStr, string);

	if(player_duel_start[playerid] == false)
	{
	    for(new i; i < 13; i++) GetPlayerWeaponData(playerid, i, PlayerInfo[playerid][pGun][i], PlayerInfo[playerid][pAmmo][i]);

		format(string, 128, ", `pGun` = '%i,%i,%i,%i,%i,%i,%i,%i,%i,%i,%i,%i,%i'",
		PlayerInfo[playerid][pGun][0], PlayerInfo[playerid][pGun][1], PlayerInfo[playerid][pGun][2], PlayerInfo[playerid][pGun][3], PlayerInfo[playerid][pGun][4], PlayerInfo[playerid][pGun][5],
	    PlayerInfo[playerid][pGun][6], PlayerInfo[playerid][pGun][7], PlayerInfo[playerid][pGun][8], PlayerInfo[playerid][pGun][9], PlayerInfo[playerid][pGun][10], PlayerInfo[playerid][pGun][11], PlayerInfo[playerid][pGun][12]);
	    strcat(MySQLStr, string);

	   	format(string, 128, ", `pAmmo` = '%i,%i,%i,%i,%i,%i,%i,%i,%i,%i,%i,%i,%i'",
		PlayerInfo[playerid][pAmmo][0], PlayerInfo[playerid][pAmmo][1], PlayerInfo[playerid][pAmmo][2], PlayerInfo[playerid][pAmmo][3], PlayerInfo[playerid][pAmmo][4], PlayerInfo[playerid][pAmmo][5], PlayerInfo[playerid][pAmmo][6],
		PlayerInfo[playerid][pAmmo][7], PlayerInfo[playerid][pAmmo][8], PlayerInfo[playerid][pAmmo][9], PlayerInfo[playerid][pAmmo][10], PlayerInfo[playerid][pAmmo][11], PlayerInfo[playerid][pAmmo][12], PlayerInfo[playerid][pID]);
		strcat(MySQLStr, string);
	}

	format(string, 188, ", `pGunSkill` = '%i,%i,%i,%i,%i,%i', `pText` = %d, `pHeals` = %d, `pFrSkin` = %d",
	PlayerInfo[playerid][pGunSkill][0], PlayerInfo[playerid][pGunSkill][1], PlayerInfo[playerid][pGunSkill][2], PlayerInfo[playerid][pGunSkill][3], PlayerInfo[playerid][pGunSkill][4], PlayerInfo[playerid][pGunSkill][5], PlayerInfo[playerid][pText], PlayerInfo[playerid][pHeals], PlayerInfo[playerid][pFrSkin]);
    strcat(MySQLStr, string);

	format(string, 256, ", `pRouble` = %d, `pVip` = %d, `pVipTime` = %d WHERE `pID` = %d",
	PlayerInfo[playerid][pRouble], PlayerInfo[playerid][pVip], PlayerInfo[playerid][pVipTime], PlayerInfo[playerid][pID]);
    strcat(MySQLStr, string);

	mysql_tquery(mMysql, MySQLStr);

	printf("Panjangnya: %i", strlen(MySQLStr));

    if(GetPlayerBizz(playerid) != -1) SaveBizz(GetPlayerBizz(playerid));
    if(GetPlayerABizz(playerid) != 0) SaveABizz(GetPlayerABizz(playerid));
    if(GetPlayerHouse(playerid) != 0) SaveHouse(GetPlayerHouse(playerid));

	SaveCars(playerid);

	return 1;
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
stock SaveHousePer(i, per[], per1) return format(MySQLStr, 144, "UPDATE `house` SET `%s` = %d WHERE `hID` = %d LIMIT 1", per, per1, i), mysql_tquery(mMysql, MySQLStr, "", "");
/*
epublic: SaveHouse(i)
{
	if(i == -1) return 0;

    format(MySQLStr, sizeof(MySQLStr), "UPDATE `house` SET `hOwner` = '%s', `hOwned` = %d, `hHel` = %d, `hLock` = %d, `hUpdAD` = %d, `hUpdHel` = %d, `hUpdSub` = %d, `hSlet` = %d, `hGarLock` = %d, `hOplata` = %d",
 	HouseInfo[i][hOwner], HouseInfo[i][hOwned], HouseInfo[i][hHel], HouseInfo[i][hLock], HouseInfo[i][hUpdAD], HouseInfo[i][hUpdHel], HouseInfo[i][hUpdSub], HouseInfo[i][hSlet], HouseInfo[i][hGarLock], HouseInfo[i][hOplata]);

	format(MySQLStr, sizeof(MySQLStr), "%s, `hHealpickX` = '%f', `hHealpickY` = '%f', `hHealpickZ` = '%f' WHERE `hID` = %d", MySQLStr, HouseInfo[i][hHealpickX], HouseInfo[i][hHealpickY], HouseInfo[i][hHealpickZ], i);
 	//
    mysql_tquery(mMysql, MySQLStr);
    return 1;
}*/
epublic: SaveHouse(i)
{
	if(i == -1) return 0;

    format(MySQLStr, 444, "UPDATE `house` SET `hOwner` = '%s', `hOwned` = %d, `hHel` = %d, `hLock` = %d, `hUpdAD` = %d, `hUpdHel` = %d, `hUpdSub` = %d, `hUpdStore` = %i, `hSlet` = %d, `hOplata` = %d",
 	HouseInfo[i][hOwner], HouseInfo[i][hOwned], HouseInfo[i][hHel], HouseInfo[i][hLock], HouseInfo[i][hUpdAD], HouseInfo[i][hUpdHel], HouseInfo[i][hUpdSub], HouseInfo[i][hUpdStore], HouseInfo[i][hSlet], HouseInfo[i][hOplata]);

	format(MySQLStr, 444, "%s, `hHealpickX` = %f, `hHealpickY` = %f, `hHealpickZ` = %f , `hValue` = %d WHERE `hID` = %d", MySQLStr, HouseInfo[i][hHealpickX], HouseInfo[i][hHealpickY], HouseInfo[i][hHealpickZ], HouseInfo[i][hValue], HouseInfo[i][hID]);
 	//
    mysql_tquery(mMysql, MySQLStr);
    return 1;
}
epublic: SaveABizz(i)
{
    format(MySQLStr, 344, "UPDATE `bizz_fuel` SET `aOwned` = %d, `aOwner` = '%s', `aMoney` = %d, `aRaschet` = %d, `aSklad` = %d, `aLocked` = %d, `aProducts` = %d, `aPrice` = %d, `aMafia` = %d, `aOplata` = %d, `aSlet` = %d WHERE `aID` = %d",
    BizzAInfo[i][aOwned], BizzAInfo[i][aOwner], BizzAInfo[i][aMoney], BizzAInfo[i][aRaschet], BizzAInfo[i][aSklad], BizzAInfo[i][aLocked], BizzAInfo[i][aProducts], BizzAInfo[i][aPrice], BizzAInfo[i][aMafia], BizzAInfo[i][aOplata], BizzAInfo[i][aSlet], i);

    mysql_tquery(mMysql, MySQLStr);
    return 1;
}
stock SaveBizz(i)
{
	if(BizzInfo[i][bEntranceX] == 0.0) return 0;

    format(MySQLStr, 440, "UPDATE `bizz` SET `bOwned` = %d, `bOwner` = '%s', `bEntranceCost` = %d, `bMoney` = %d, `bRaschet` = %d, `bLocked` = %d, `bProducts` = %d, `bPrice` = %d, `bMafia` = %d, `bSlet` = %d, `bOplata` = %d",
	BizzInfo[i][bOwned], BizzInfo[i][bOwner], BizzInfo[i][bEntranceCost], BizzInfo[i][bMoney], BizzInfo[i][bRaschet], BizzInfo[i][bLocked], BizzInfo[i][bProducts], BizzInfo[i][bPrice], BizzInfo[i][bMafia], BizzInfo[i][bSlet], BizzInfo[i][bOplata]);

	format(MySQLStr, 440, "%s, `bUpdMusic` = %d, `bUpdHeal` = %d, `bUpdSub` = %d, `bSklad` = %d, `bPhone` = %d, `bProcent` = %d, `bSotrud` = %d WHERE `bID` = %d",
 	MySQLStr, BizzInfo[i][bUpdMusic], BizzInfo[i][bUpdHeal], BizzInfo[i][bUpdSub], BizzInfo[i][bSklad], BizzInfo[i][bPhone], BizzInfo[i][bProcent], BizzInfo[i][bSotrud], i);

    mysql_tquery(mMysql, MySQLStr);
    return 1;
}
epublic: SaveFrac(i)
{
	format(MySQLStr, 440, "%s, `fBank0` = %d, `fBank1` = %d, `fBank2` = %d WHERE `fID` = %d",
	MySQLStr, FracInfo[i][fBank][0], FracInfo[i][fBank][1], FracInfo[i][fBank][2], i);

	mysql_tquery(mMysql, MySQLStr, "", "");
	return 1;
}
stock SaveCars(playerid)
{
    if(PlayerInfo[playerid][pLogin] == 0) return 1;

    format(MySQLStr, 1200, "UPDATE `accounts` SET `cModel` = '%i,%i,%i', ",
    CarInfo[playerid][cModel][0], CarInfo[playerid][cModel][1], CarInfo[playerid][cModel][2]);

	format(MySQLStr, 1200, "%s `cSost` = '%i,%i,%i', ", MySQLStr,
    CarInfo[playerid][cSost][0], CarInfo[playerid][cSost][1], CarInfo[playerid][cSost][2]);

    format(MySQLStr, 1200, "%s `cColor1` = '%i,%i,%i', ", MySQLStr,
    CarInfo[playerid][cColor1][0], CarInfo[playerid][cColor1][1], CarInfo[playerid][cColor1][2]);

    format(MySQLStr, 1200, "%s `cColor2` = '%i,%i,%i', ", MySQLStr,
    CarInfo[playerid][cColor2][0], CarInfo[playerid][cColor2][1], CarInfo[playerid][cColor2][2]);

    format(MySQLStr, 1200, "%s `cNumber` = '%s,%s,%s', ", MySQLStr,
    VehicleNumberPlate[playerid][0], VehicleNumberPlate[playerid][1], VehicleNumberPlate[playerid][2]);

    format(MySQLStr, 1200, "%s `cPaintJobs` = '%i,%i,%i', ", MySQLStr,
    CarInfo[playerid][cPaintJobs][0], CarInfo[playerid][cPaintJobs][1], CarInfo[playerid][cPaintJobs][2]);

    format(MySQLStr, 1200, "%s `cLock` = '%i,%i,%i', ", MySQLStr,
    CarInfo[playerid][cLock][0], CarInfo[playerid][cLock][1], CarInfo[playerid][cLock][2]);

    format(MySQLStr, 1200, "%s `cFuel` = '%f,%f,%f', ", MySQLStr,
    CarInfo[playerid][cFuel][0], CarInfo[playerid][cFuel][1], CarInfo[playerid][cFuel][2]);

    format(MySQLStr, 1200, "%s `cCost` = '%i,%i,%i', ", MySQLStr,
    CarInfo[playerid][cCost][0], CarInfo[playerid][cCost][1], CarInfo[playerid][cCost][2]);

    format(MySQLStr, 1200, "%s `cProbeg` = '%f,%f,%f', ", MySQLStr,
    CarInfo[playerid][cProbeg][0], CarInfo[playerid][cProbeg][1], CarInfo[playerid][cProbeg][2]);

    format(MySQLStr, 1200, "%s `cWheels` = '%i,%i,%i', ", MySQLStr,
    CarInfo[playerid][cWheels][0], CarInfo[playerid][cWheels][1], CarInfo[playerid][cWheels][2]);

    format(MySQLStr, 1200, "%s `cSpoiler` = '%i,%i,%i', ", MySQLStr,
    CarInfo[playerid][cSpoiler][0], CarInfo[playerid][cSpoiler][1], CarInfo[playerid][cSpoiler][2]);

    format(MySQLStr, 1200, "%s `cBumper1` = '%i,%i,%i', ", MySQLStr,
    CarInfo[playerid][cBumper1][0], CarInfo[playerid][cBumper1][1], CarInfo[playerid][cBumper1][2]);

    format(MySQLStr, 1200, "%s `cBumper2` = '%i,%i,%i', ", MySQLStr,
    CarInfo[playerid][cBumper2][0], CarInfo[playerid][cBumper2][1], CarInfo[playerid][cBumper2][2]);

    format(MySQLStr, 1200, "%s `cNitro` = '%i,%i,%i', ", MySQLStr,
    CarInfo[playerid][cNitro][0], CarInfo[playerid][cNitro][1], CarInfo[playerid][cNitro][2]);

    format(MySQLStr, 1200, "%s `cHydrawlic` = '%i,%i,%i', ", MySQLStr,
    CarInfo[playerid][cHydrawlic][0], CarInfo[playerid][cHydrawlic][1], CarInfo[playerid][cHydrawlic][2]);

    format(MySQLStr, 1200, "%s `cHood` = '%i,%i,%i', ", MySQLStr,
    CarInfo[playerid][cHood][0], CarInfo[playerid][cHood][1], CarInfo[playerid][cHood][2]);

    format(MySQLStr, 1200, "%s `cRoof` = '%i,%i,%i', ", MySQLStr,
    CarInfo[playerid][cRoof][0], CarInfo[playerid][cRoof][1], CarInfo[playerid][cRoof][2]);

    format(MySQLStr, 1200, "%s `cSideskirt` = '%i,%i,%i', ", MySQLStr,
    CarInfo[playerid][cSideskirt][0], CarInfo[playerid][cSideskirt][1], CarInfo[playerid][cSideskirt][2]);

    format(MySQLStr, 1200, "%s `cLamps` = '%i,%i,%i', ", MySQLStr,
    CarInfo[playerid][cLamps][0], CarInfo[playerid][cLamps][1], CarInfo[playerid][cLamps][2]);

    format(MySQLStr, 1200, "%s `cExhaust` = '%i,%i,%i', ", MySQLStr,
    CarInfo[playerid][cExhaust][0], CarInfo[playerid][cExhaust][1], CarInfo[playerid][cExhaust][2]);

    format(MySQLStr, 1200, "%s `cStereo` = '%i,%i,%i', ", MySQLStr,
    CarInfo[playerid][cStereo][0], CarInfo[playerid][cStereo][1], CarInfo[playerid][cStereo][2]);

    format(MySQLStr, 1200, "%s `cVentRight` = '%i,%i,%i', ", MySQLStr,
    CarInfo[playerid][cVentRight][0], CarInfo[playerid][cVentRight][1], CarInfo[playerid][cVentRight][2]);

    format(MySQLStr, 1200, "%s `cVentLeft` = '%i,%i,%i', ", MySQLStr,
    CarInfo[playerid][cVentLeft][0], CarInfo[playerid][cVentLeft][1], CarInfo[playerid][cVentLeft][2]);

    format(MySQLStr, 1200, "%s `cHeal` = '%f,%f,%f	', ", MySQLStr,
    CarInfo[playerid][cHeal][0], CarInfo[playerid][cHeal][1], CarInfo[playerid][cHeal][2]);

    format(MySQLStr, 1200, "%s `cDamagePanel` = '%i,%i,%i', ", MySQLStr,
    CarInfo[playerid][cDamagePanel][0], CarInfo[playerid][cDamagePanel][1], CarInfo[playerid][cDamagePanel][2]);

    format(MySQLStr, 1200, "%s `cDamageDoors` = '%i,%i,%i', ", MySQLStr,
    CarInfo[playerid][cDamageDoors][0], CarInfo[playerid][cDamageDoors][1], CarInfo[playerid][cDamageDoors][2]);

    format(MySQLStr, 1200, "%s `cDamageLights` = '%i,%i,%i', ", MySQLStr,
    CarInfo[playerid][cDamageLights][0], CarInfo[playerid][cDamageLights][1], CarInfo[playerid][cDamageLights][2]);

    format(MySQLStr, 1200, "%s `cDamageTires` = '%i,%i,%i' WHERE `pID` = %i", MySQLStr,
    CarInfo[playerid][cDamageTires][0], CarInfo[playerid][cDamageTires][1], CarInfo[playerid][cDamageTires][2], GetPlayerAccountID(playerid));

	mysql_tquery(mMysql, MySQLStr);

    return 1;
}

public OnQueryError(errorid, const error[], const callback[], const query[], MySQL:handle)
{
	printf("Kesalahan dalam mysql:ID %d | Kesalahan: %s | Fungsi: %s | Minta: %s", errorid, error, callback, query);
	return 1;
}
publics: OnMySQL_Query(playerid,id,params[])
{
    new rows;
    cache_get_row_count(rows);
    switch(id)
    {
        case 1:
        {
            if(rows) return SPD(playerid, 3, DIALOG_STYLE_INPUT, "Email", ""W"Masukkan alamat email Anda.\nMenggunakannya, Anda dapat memulihkan akses ke akun Anda..\n\n\
			Jika Anda kehilangan kata sandi, Anda dapat memulihkannya di situs {FF0000}https://discord.gg/MmmePkYaxF\n\n"W"Pastikan input sudah benar dan klik 'Selanjutnya'\n\n{FFDAB9}Kotak surat ini sudah ditautkan ke akun lain.", "Selanjutnya", "Lewati");
			else
			{
			    if(GetPVarInt(playerid, "Register"))
			    {
			        mysql_escape_string(params, PlayerInfo[playerid][pMail], 64);
					mysql_format(mMysql, MySQLStr, 144, "UPDATE `accounts` SET `pMail` = '%e' WHERE `pName` = '%e'",PlayerInfo[playerid][pMail], Name(playerid)), mysql_tquery(mMysql, MySQLStr, "", "");
					return PromoReg(playerid);//SPD(playerid,4,DIALOG_STYLE_INPUT,"{7BB7F3}Mengundang Pemain Nick",""W"Jika Anda mengetahui tentang server kami dari teman Anda\nyang bermain di sini, tunjukkan julukannya di bidang di bawah ini\n\n{B8E82A}Ketika Anda mencapai level 5, dia akan menerima hadiah", "Masuk", "Lewati");
				}
				else
				{
				    mysql_escape_string(params, PlayerInfo[playerid][pMail], 64);
				    mysql_format(mMysql, MySQLStr, 144, "UPDATE `accounts` SET `pMail` = '%e' WHERE `pName` = '%e'",PlayerInfo[playerid][pMail], Name(playerid)), mysql_tquery(mMysql, MySQLStr, "", "");

				    pc_cmd_mm(playerid, "");
				    SCMF(playerid, COLOR_ORANGE, "Anda telah berhasil menautkan email Anda: "W"%s", PlayerInfo[playerid][pMail]);
				    Send(playerid, -1, "Anda dapat mengonfirmasi di 'Pengaturan keamanan'");
	   			}
			}
		}
		case 2:
		{
		    if(!rows) return PromoReg(playerid);
			else
			{
				cache_get_value_int(0, "pID", PlayerInfo[playerid][pReferal]);
				SCMF(playerid, -1, "Pemain %s akan menerima hadiah atas kehadiran Anda.", params);
				SPD(playerid,5, DIALOG_STYLE_MSGBOX, "Gender", ""W"Pilih jenis kelamin karakter Anda","Laki-laki","Perempuan");
			}
		}
		case 3:
		{
		    if(!rows) return Send(playerid, -1, "Statistik pendapatan belum dikompilasi.");

			if(rows > 20)
			{
			    new b = GetPVarInt(playerid, "CheckStatsBizz");
				format(MySQLStr, 96, "SELECT * FROM `bizz_stats` WHERE `bID` = %d LIMIT %d,%d", b, rows-20, rows);
				mysql_tquery(mMysql, MySQLStr, "OnMySQL_Query","dd", playerid, 4);
				return 1;
			}

		    String = "";
		    new bDate[16], strg[124], bSumma;

		    strcat(String, "{FFDEAD}Tanggal\t\t\t\tPenghasilan\n\n");
		    for(new i; i < rows; i++)
		    {
     			cache_get_value_name(i, "bData", bDate, 16);
    			cache_get_value_name_int(i, "bSumma", bSumma);

        		format(strg,sizeof(strg),""W"%s\t\t\t%d$\n",bDate,bSumma), strcat(String,strg);
    		}
		   	SPD(playerid,0,DIALOG_STYLE_MSGBOX,"{FFB103}Penghasilan bisnis selama 20 hari", String, "Tutup","");
		   	return 1;
  		}
		case 4:
		{
		    if(!rows) return Send(playerid, -1, "Kesalahan global telah terjadi, mohon informasikan administrasi.");

		    new bDate[16], strg[124], bSumma;

            String = "{FFDEAD}Tanggal\t\t\t\tPenghasilan\n\n";
		    for(new i; i < rows; i++)
		    {
     			cache_get_value_name(i, "bData", bDate, 16);
    			cache_get_value_name_int(i, "bSumma", bSumma);

        		format(strg,sizeof(strg),""W"%s\t\t\t%d$\n",bDate,bSumma), strcat(String,strg);
    		}
    		SetPVarInt(playerid, "CheckStatsBizz", 0);
		   	SPD(playerid,0,DIALOG_STYLE_MSGBOX,"{FFB103}Penghasilan bisnis selama 20 hari", String, "Tutup","");
		   	return 1;
		}
		case 5:
		{
		    if(rows) // jika nomor tersebut sudah ada
			{
			    player_sim_number[playerid] = 111111 + random(888888);

			    format(MySQLStr, 96, "SELECT * FROM `accounts` WHERE `pNumber` = %d", player_sim_number[playerid]);
		    	mysql_tquery(mMysql, MySQLStr, "OnMySQL_Query","iis", playerid, 5, player_sim_number[playerid]);
				return 1;
			}
			new h = player_use_bizbar[playerid];
 		    if(!PlayerToPoint(3, playerid,BizzInfo[h][bBarX], BizzInfo[h][bBarY], BizzInfo[h][bBarZ]) || GetPlayerVirtualWorld(playerid) != BizzInfo[h][bVirtualWorld]) return player_use_bizbar[playerid] = 0;

   			SCMF(playerid, -1, "Nomor ponsel Anda: {03D7FF}%d", player_sim_number[playerid]);
   			PlayerInfo[playerid][pNumber] = player_sim_number[playerid];
   			OnPlayerUpdateAccountsPer(playerid, "pNumber", PlayerInfo[playerid][pNumber]);
      		player_sim_number[playerid] = 0;
   		}
   		case 6:
   		{
   		    if(rows) return SPD(playerid, 62, DIALOG_STYLE_INPUT, "SIM peta", ""W"Masukkan nomor pembelian yang diinginkan:\nNomor ini sudah diambil, coba yang lain\n", "Pilih", "Kembali"), player_sim_number[playerid] = 0;

   		    new h = player_use_bizbar[playerid];
 		    if(!PlayerToPoint(3, playerid,BizzInfo[h][bBarX], BizzInfo[h][bBarY], BizzInfo[h][bBarZ]) || GetPlayerVirtualWorld(playerid) != BizzInfo[h][bVirtualWorld]) return player_use_bizbar[playerid] = 0;

 		    new cena = BizzInfo[h][bPrice]*2;
 		    SCMF(playerid, -1, "Anda membeli nomor telepon baru, nomor baru Anda: {03D7FF}%d", player_sim_number[playerid]), SetPlayerChatBubble(playerid, "membeli kartu SIM",COLOR_NEWS,30.0,10000);

       		GiveBusinessMoney(h, cena, 4);
	    	GivePlayerMoneyEx(playerid, -cena, "pembelian nomor telepon"), PlayerInfo[playerid][pNumber] = player_sim_number[playerid];
	    	OnPlayerUpdateAccountsPer(playerid, "pNumber", PlayerInfo[playerid][pNumber]);
	    	player_sim_number[playerid] = 0, ProductsMenu(playerid);
	    }
	    case 7:
		{
		    if(!rows) return Send(playerid, -1, "Statistik pendapatan belum dikompilasi.");

			if(rows > 20)
			{
			    new b = GetPVarInt(playerid, "CheckStatsABizz");
				format(MySQLStr, 96, "SELECT * FROM `bizz_astats` WHERE `aID` = %d LIMIT %d,%d", b, rows-20, rows);
				mysql_tquery(mMysql, MySQLStr, "OnMySQL_Query","dd", playerid, 8);
				return 1;
			}

		    String = "";
		    new aDate[16], strg[124], aSumma;

		    strcat(String, "{FFDEAD}Tanggal\t\t\t\tHasil\n\n");
		    for(new i; i < rows; i++)
		    {
     			cache_get_value_name(i, "aData", aDate, 16);
    			cache_get_value_name_int(i, "aSumma", aSumma);

        		format(strg,sizeof(strg),""W"%s\t\t\t%d$\n",aDate,aSumma), strcat(String,strg);
    		}
		   	SPD(playerid,0,DIALOG_STYLE_MSGBOX,"{FFB103}Penghasilan SPBU selama 20 hari", String, "Tutup","");
		   	return 1;
  		}
  		case 8:
		{
		    if(!rows) return Send(playerid, -1, "Kesalahan global telah terjadi (#1), mohon informasikan administrasi.");

		    String = "";
		    new aDate[16], strg[124], aSumma;

            strcat(String, "{FFDEAD}Tanggal\t\t\t\tPenghasilan\n\n");
		    for(new i; i < rows; i++)
		    {
     			cache_get_value_name(i, "aData", aDate, 16);
    			cache_get_value_name_int(i, "aSumma", aSumma);

        		format(strg,sizeof(strg),""W"%s\t\t\t%d$\n",aDate,aSumma), strcat(String,strg);
    		}
    		SetPVarInt(playerid, "CheckStatsABizz", 0);
		   	SPD(playerid,0,DIALOG_STYLE_MSGBOX,"{FFB103}Penghasilan SPBU selama 20 hari", String, "Tutup","");
		   	return 1;
		}
		case 9:
		{
		    if(!rows) return Send(playerid, -1, "Tidak ada akun dengan alamat IP ini (login terakhir) ditemukan.");

		    if(rows > 20)
		    {
		        SetPVarInt(playerid, "allrows", rows);
		        format(MySQLStr, 96, "SELECT * FROM `accounts` WHERE `pIp` = '%s' LIMIT %d,%d", params, rows-20, rows);
				mysql_tquery(mMysql, MySQLStr, "OnMySQL_Query","iis", playerid, 10, params);
				return 1;
			}
		    String = "";
		    new lastIP[MAX_IP_ADRESS], Name[24], strg[124];
		    new IpReg[MAX_IP_ADRESS], level;

		    strcat(String, "{FFDEAD}Nama depan\t{FFDEAD}Alamat IP (Login Terakhir)\t{FFDEAD}IP alamatnya(reg.)\t{FFDEAD}Level\n\n");
		    for(new i; i < rows; i++)
		    {
		        cache_get_value_name(i, "pName", Name, 36);
     			cache_get_value_name(i, "pIp", lastIP, MAX_IP_ADRESS);
     			cache_get_value_name(i, "pIpReg", IpReg, MAX_IP_ADRESS);
     			cache_get_value_name_int(i, "pLevel", level);

        		format(strg,sizeof(strg),""W"%s\t%s\t%s\t%d\n",Name, lastIP, IpReg, level), strcat(String, strg);
    		}
		   	SPD(playerid,0,DIALOG_STYLE_MSGBOX,"{FFB103}Informasi Alamat IP", String, "Tutup","");
		   	SCMF(playerid, -1, "Anda ditunjukkan 20 akun terakhir dari alamat IP ini. Total dalam database {FFB103}%d "W"akun dari IP ini.", rows);
		   	return 1;
		}
		case 10:
		{
		    String = "";
		    new lastIP[MAX_IP_ADRESS], Name[24], strg[124];
		    new IpReg[MAX_IP_ADRESS], level;

		    strcat(String, "{FFDEAD}Nama depan\t{FFDEAD}Alamat IP (Login Terakhir)\t{FFDEAD}Alamat IP (reg.)\t{FFDEAD}Level\n\n");
		    for(new i; i < rows; i++)
		    {
		        cache_get_value_name(i, "pName", Name, 36);
     			cache_get_value_name(i, "pIp", lastIP, MAX_IP_ADRESS);
     			cache_get_value_name(i, "pIpReg", IpReg, MAX_IP_ADRESS);
     			cache_get_value_name_int(i, "pLevel", level);

        		format(strg,sizeof(strg),""W"%s\t%s\t%s\t%d\n",Name, lastIP, IpReg, level), strcat(String, strg);
    		}
		   	SPD(playerid,0,DIALOG_STYLE_MSGBOX,"{FFB103}Informasi Alamat IP", String, "Tutup","");
		   	SCMF(playerid, -1, "Anda ditunjukkan 20 akun terakhir dari alamat IP ini. Total dalam database {FFB103}%d "W"akun dari IP ini.", GetPVarInt(playerid, "allrows"));
		   	return 1;
		}
		case 11:
		{
		    if(rows) return SPD(playerid, 103, DIALOG_STYLE_INPUT, "Telepon Delima", ""W"Masukkan nomor pembelian yang diinginkan:\nNomor ini sudah diambil, coba yang lain\n", "Pilih", "Kembali"), Send(playerid, 0xB8B8B8FF, "[Periksa]: Nomor ini ditempati oleh pemain!"), player_sim_number[playerid] = 0;

 		    Send(playerid, 0xB8B8B8FF, "[Periksa]: Jumlah ini tidak ditempati oleh pemain ...");

 		    format(MySQLStr, 96, "SELECT * FROM `bizz` WHERE `bPhone` = %d", player_sim_number[playerid]);
	    	mysql_tquery(mMysql, MySQLStr, "OnMySQL_Query","iis", playerid, 12, player_sim_number[playerid]);
	    	return 1;
	    }
	    case 12:
	    {
	        if(rows) return SPD(playerid, 103, DIALOG_STYLE_INPUT, "Nomor telepon", ""W"Masukkan nomor pembelian yang diinginkan:\nNomor ini sudah diambil, coba yang lain\n", "Pilih", "Kembali"), Send(playerid, 0xB8B8B8FF, "[Periksa]: Jumlah ini ditempati oleh perusahaan!"), player_sim_number[playerid] = 0;

 		    Send(playerid, 0xB8B8B8FF, "[Periksa]: Jumlah ini tidak ditempati oleh perusahaan ...");


 		    Send(playerid, 0xBEF500FF, "Anda membeli nomor ponsel 4 digit untuk perusahaan Anda");
 		    SCMF(playerid, 0xBEF500FF, "Memanggil saluran sekarang dimungkinkan oleh nomor: {03D7FF}%d", player_sim_number[playerid]);
	    	GivePlayerMoneyEx(playerid, -10000, "membeli bus"), BizzInfo[GetPlayerBizz(playerid)][bPhone] = player_sim_number[playerid];
	    	SaveBizzPer(GetPlayerBizz(playerid), "bPhone", BizzInfo[GetPlayerBizz(playerid)][bPhone]);
	    	player_sim_number[playerid] = 0;
	    	return 1;
	    }
		case 17:
		{

			new useplayer = GetPVarInt(playerid, "IDLeadersPlayer");
			new frac = GetPVarInt(playerid, "IDLeaders");

			PlayerInfo[useplayer][pLeader] = frac;
			PlayerInfo[useplayer][pMember] = frac;
			PlayerInfo[useplayer][pJob] = 0;
			PlayerInfo[useplayer][pRank] = FracInfo[frac][fRankMax];
			PlayerInfo[useplayer][pSetSpawn] = 4;


			SCMF(useplayer, 0x6BB3FFAA, "Admin %s(%i) menugaskan Anda untuk mengontrol fraksi %s", Name(playerid), playerid, FracInfo[frac][fName]);
			SCMF(playerid, 0x6BB3FFAA, "Anda menugaskan pemain %s(%i) mengontrol fraksi %s", Name(useplayer), useplayer, FracInfo[frac][fName]);

		    format(String, 188, "[A] Admin %s[%d] pemain yang ditunjuk %s[%d] mengontrol fraksi %s[%d]", Name(playerid), playerid, Name(useplayer), useplayer, FracInfo[frac][fName], frac);
			SendAdminMessage(COLOR_GREY, String);
			form_fraction[useplayer] = PlayerInfo[useplayer][pMember];
			if(PlayerInfo[useplayer][pSex] == 1) PlayerInfo[useplayer][pFrSkin] = FracInfo[frac][fSkin][1];
			else PlayerInfo[useplayer][pFrSkin] = FracInfo[frac][fSkin][0];
			SetPlayerSkinEx(useplayer, PlayerInfo[useplayer][pFrSkin]);
			SetPlayerToTeamColor(useplayer);

			SavePlayerFraction(useplayer);

			DeletePVar(playerid, "IDLeadersPlayer"), DeletePVar(playerid, "IDLeaders");
			return 1;
		}
	   	case 18:
	   	{
	   	    if(!rows) return Send(playerid, COLOR_GREY, "Daftar administrasi kosong.");

	   	    new str[128], names[32], datanazn[32], level, adminkey[12];

	   	    String = "";

	   	    for(new i = 0; i < rows; i++)
	   	    {
	   	        cache_get_value_int(i, "pAdmin", level);
	   	        cache_get_value_name(i, "Name", names, 32);
   	    		cache_get_value_name(i, "pDataNaz", datanazn, 32);
   	    		cache_get_value_name(i, "pAdminKey", adminkey, 12);

   	    		format(str, 128, "%s\t\t%d level\t%s\t%s\n", names, level, datanazn, adminkey);
				strcat(String, str);
			}
			SPD(playerid, 197, DIALOG_STYLE_TABLIST, "{ffff00}Administrator Control Panel offline", String, "Pilih", "Tutup");
			return 1;
		}
		case 22:
		{
		    if(rows >= MAX_NUMBER) return Send(playerid, COLOR_GREY, "Anda dapat memiliki maksimal 15 angka dalam buku catatan.");

		    SCMF(playerid, -1, "{09D6C7}%s "W"telah berhasil ditambahkan ke daftar kontak Anda. Gunakan /book", Name(GetPVarInt(playerid, "nName")));
			format(MySQLStr, 128, "INSERT INTO `book` (`plID`, `nName`, `nNumber`) VALUES (%d,'%s',%d)", PlayerInfo[playerid][pID], Name(GetPVarInt(playerid, "nName")), GetPVarInt(playerid, "SaveNumber")), mysql_tquery(mMysql, MySQLStr, "", "");
			DeletePVar(playerid,"SaveNumber"), SetPVarInt(playerid, "nName", -1);
			return 1;
		}
		case 23:
		{
		    if(!rows) return Send(playerid, COLOR_GREY, "Telah terjadi kesalahan! Akun ini tidak ada....");

			new vig, names[32];
			cache_get_value_name(0, "pName", names, 32);
			cache_get_value_int(0, "pfWarn", vig);

			vig++;
			if(vig >= 3)
			{
			    mysql_format(mMysql, MySQLStr, 188, "UPDATE `accounts` SET `pLeader` = '0',`pfWarn` = '0',`pMember` = '0',`pRank` = '0', `pText` = '4' WHERE `pName` = '%e'", names);
				mysql_tquery(mMysql, MySQLStr, "", "");

                format(String, sizeof(String), "[A] Admin %s[%d] mengambil kepemimpinan fraksi dari pemain %s 3/3 peringatan.", Name(playerid), playerid, names), SendAdminMessage(COLOR_GREY, String);
				SCMF(playerid, 0x6BB3FFAA, "Offline: Anda menembak pemain %s dari kepemimpinan...", names);

				return pc_cmd_offleaders(playerid, "");
			}
			mysql_format(mMysql, MySQLStr, 144, "UPDATE `accounts` SET `pfWarn` = %d, `pText` = '3' WHERE `pName` = '%e'", vig, names), mysql_tquery(mMysql, MySQLStr, "", "");

			format(String, sizeof(String), "[A] Admin %s[%d] mengeluarkan peringatan %d/3 kepada pemimpin %s", Name(playerid), playerid, vig, names), SendAdminMessage(COLOR_GREY, String);
			SCMF(playerid, 0x6BB3FFAA, "Offline: Anda memberi tahu pemimpin %s teguran %d/3...", names, vig);

			return pc_cmd_offleaders(playerid, "");
		}
		case 28:
		{
		    if(!rows) return Send(playerid, COLOR_GREY, "Ada lebih dari satu pemimpin di server!");

		    String = "";
		    new str[144];

            new names[MAX_PLAYER_NAME], leaders, number;

      		for(new i = 0; i < rows; i++)
			{
	   	        cache_get_value_name(i, "pName", names, MAX_PLAYER_NAME);
	   	    	cache_get_value_int(i, "pLeader", leaders);
	   	    	cache_get_value_int(i, "pNumber", number);

	   	        format(str, 144, "{ffffff}%s\t%s\t%s\t%s\n", names, FracInfo[leaders][fName], number ? IntToString(number) : ("Tidak ada nomor"), GetPlayerID(names) == INVALID_PLAYER_ID ? ("{EE4000}Offline") : ("{3CB371}Online"));
				strcat(String, str);
			}
		    SPD(playerid, 204, DIALOG_STYLE_TABLIST, "Para pemimpin", String, "Tutup","");
		    return 1;
   		}
   		case 29:
   		{
   		    if(!rows) return Send(playerid, COLOR_GREY, "Kesalahan global telah terjadi, mohon informasikan administrasi.");

   		    new names[32], leaders, rank, online, level, number;
       		new statusonl[28];

   		    cache_get_value_name(0, "pName", names, 32);
   		    cache_get_value_int(0, "pLevel", level);
   		    cache_get_value_int(0, "pNumber", number);
   	    	cache_get_value_int(0, "pLeader", leaders);
   	    	cache_get_value_int(0, "pRank", rank);
   	    	cache_get_value_int(0, "pLogin", online);

   	    	if(online == 0) statusonl = "{B22222}Offline";
			else statusonl = "{3CB371}Online";

			format(String, sizeof(String), ""W"Nama depan: {1A8FA9}%s\n"W"Status: %s\n"W"Level: %d\n\nOrganisasi: {3CB371}%s\n"W"pekerjaan: {3CB371}%s\n"W"Nomor telepon: {00FFFF}%d", names, statusonl, level, FracInfo[leaders][fName], FracRank[leaders][rank], number);
   	    	SPD(playerid, 9992, DIALOG_STYLE_MSGBOX, "{ffff00}Informasi Pemimpin", String, "Kembali", "");
   	    	return 1;
   	    }
	}
	return 1;
}


CMD:makeleader(playerid, params[])
{
	if(admin_level[playerid] < 5 || !admin_logged[playerid]) return 1;

	if(sscanf(params, "u", params[0])) return Send(playerid, -1,"Masuk: /makeleader [playerid]");
	if(!IsPlayerConnected(params[0])) return Send(playerid, -1,"Pemain sedang offline");//+
	if(PlayerInfo[params[0]][pLogin] == 0) return Send(playerid, -1,"Pemain belum login");//+;
	if(afk_time[params[0]] > 2) return Send(playerid, -1,"Pemain ini AFK.");//+
	if(PlayerInfo[params[0]][pWarn] > 0) return Send(playerid,-1,"Pemain telah Peringatkan");
	if(IsPlayerInAnyVehicle(params[0])) return Send(playerid,COLOR_GREY,"Orang ini di mobil, minta dia keluar");

	SetPlayerUseListitem(playerid, params[0]);

	String = "";

	new str[42];

	new count = 0;

	for(new i = 1; i < MAX_FRACTIONS; i++)
	{
		format(str, 42, "%i. %s\n", i, FracInfo[i][fName]);
		strcat(String, str);

		SetPlayerListitemValue(playerid, count++, i);
	}

	return SPD(playerid, 7617, DIALOG_STYLE_LIST, GetPlayerNameEx(params[0]), String, "Pilih", "Tutup");
}

/* // SQL TABLE FOR FRACTION FACTION
-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 31, 2021 at 06:00 AM
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
-- Database: `ddd`
--

-- --------------------------------------------------------

--
-- Table structure for table `fraction`
--

CREATE TABLE `fraction` (
  `fID` int(11) NOT NULL,
  `fSpawnX` float NOT NULL,
  `fSpawnY` float NOT NULL,
  `fSpawnZ` float NOT NULL,
  `fSpawnFA` float NOT NULL,
  `fInt` int(11) NOT NULL,
  `fVw` int(11) NOT NULL,
  `fName` varchar(32) NOT NULL,
  `fSkin1` int(11) NOT NULL,
  `fSkin2` int(11) NOT NULL,
  `fSkin3` int(11) NOT NULL,
  `fSkin4` int(11) NOT NULL,
  `fSkin5` int(11) NOT NULL,
  `fSkin6` int(11) NOT NULL,
  `fSkin7` int(11) NOT NULL,
  `fSkin8` int(11) NOT NULL,
  `fSkin9` int(11) NOT NULL,
  `fSkinKolvo` int(11) NOT NULL,
  `fRankMax` int(11) NOT NULL,
  `fLevel` int(11) NOT NULL,
  `fMesto0` float NOT NULL,
  `fMesto1` float NOT NULL,
  `fMesto2` float NOT NULL,
  `fBank0` int(11) NOT NULL,
  `fBank1` int(11) NOT NULL,
  `fBank2` int(11) NOT NULL,
  `fTag` varchar(16) NOT NULL,
  `fRankName` varchar(600) NOT NULL DEFAULT '-,-,-,-,-,-,-,-,-,-,-,-,-,-,-',
  `fSalary` varchar(244) NOT NULL DEFAULT '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0'
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

--
-- Dumping data for table `fraction`
--

INSERT INTO `fraction` (`fID`, `fSpawnX`, `fSpawnY`, `fSpawnZ`, `fSpawnFA`, `fInt`, `fVw`, `fName`, `fSkin1`, `fSkin2`, `fSkin3`, `fSkin4`, `fSkin5`, `fSkin6`, `fSkin7`, `fSkin8`, `fSkin9`, `fSkinKolvo`, `fRankMax`, `fLevel`, `fMesto0`, `fMesto1`, `fMesto2`, `fBank0`, `fBank1`, `fBank2`, `fTag`, `fRankName`, `fSalary`) VALUES
(1, 237.011, 78.0775, 1005.04, 0, 6, 1, 'Polisi LS', 306, 280, 29, 281, 307, 302, 288, 285, 71, 9, 14, 2, 1528.51, -1677.67, 5.8906, 3750, 5000, 0, 'LSPD', '-,Kadet,Petugas pelapor,petugas,Sersan,Peneliti,Operatif,Letnan Junior,Letnan,St. Letnan,Wakil Kapten,Kapten,Asisten Chief,Deputy Chief,Chief,', '0,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,0'),
(2, 252.558, 190.762, 1008.17, 269.321, 3, 2, 'FBI', 141, 165, 166, 163, 285, 286, 12, 0, 0, 7, 10, 2, -371.859, 1577, 76.0423, 1250, 5500, 0, 'FBI', '-,Trainee,Agen Junior,Agen DEA,Agen CID,Agen Khusus,Kepala DEA,Kepala CID,Inspektur,Wakil Direktur,Direktur,-,-,-,-,', '0,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,0,0,0,0,0'),
(3, 242.142, 1870.06, 11.4609, 1.0492, 0, 0, 'Angkatan darat', 91, 73, 255, 121, 179, 179, 191, 191, 0, 6, 14, 1, 336.521, 1927.34, 17.6406, 1000000, 1000000, 0, 'СВ', '-,Rekrut,Pribadi,Kopral,Sersan,St. Sersan,Sersan Staf,Letnan Junior,Letnan,St. Letnan,Kapten,Utama,Letnan Kolonel,Kolonel,Jenderal,', '0,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,0'),
(4, 1396.32, -21.025, 2001, 127.093, 3, 2, 'Pemerintah', 17, 228, 59, 98, 57, 76, 187, 141, 150, 5, 13, 2, 357.786, 193.968, 1023.99, 0, 0, 0, 'AP', '-,Trainee,Agen USSS Junior,Agen USSS,Pengacara ,Kepala USSS,Agen SSC,Direktur SSC,Menteri Kesehatan,Menteri Pertahanan,Menteri Kehakiman,Jaksa wilayah,Wakil Presiden,Presiden,-,', '0,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,0,0'),
(5, -648.689, -918.774, 1436.22, 348.28, 8, 6, 'Rumah Sakit Los Santos', 274, 275, 276, 308, 150, 0, 0, 0, 0, 7, 10, 2, 0, 0, 0, 0, 0, 0, 'MCLS', '-,Tertib,Staf medis junior,Staf medis senior,Distrik Dokter,Ahli anestesi,Ahli Bedah Junior,Ahli bedah,Profesor,Kepala Departemen,Kepala Dokter,-,-,-,-,', '0,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,0,0,0,0,0'),
(6, 162.307, -116.807, 1076.59, 178.327, 6, 1, 'Pusat radio', 60, 76, 233, 150, 141, 170, 186, 187, 0, 8, 10, 2, 170.01, -123.223, 1080.63, 0, 0, 0, 'NEWS', '-,Trainee,Teknisi suara,Teknisi suara,Reporter,Terkemuka,Editor,Kepala editor,Direktur teknis,Direktur program,Manajer umum,-,-,-,-,', '0,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,0,0,0,0,0'),
(7, 508.485, -85.5319, 998.961, 1.3339, 11, 1, 'Bandidos MC', 181, 247, 248, 64, 152, 0, 0, 0, 0, 5, 7, 2, 170.01, -123.223, 1080.63, 0, 0, 0, '', '-,Prospect,Member,Road Capitan,Sergeant,Treasurer,Vice-President,President,-,-,-,-,-,-,-,', '0,20000,20000,20000,20000,20000,20000,20000,0,0,0,0,0,0,0,0'),
(8, 1380.77, 96.6296, 1024.56, 92.141, 2, 850, 'East Side Ballas', 102, 103, 104, 143, 0, 0, 0, 0, 0, 4, 10, 2, 0, 0, 0, 1000, 1000, 1000, '', '-,Blood,Dogg,Cracker,Bro,Nigga,Big Nigga,Ganster,Defender,Star,Big Villi,-,-,-,-,', '0,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,0,0,0,0,0'),
(9, 1380.77, 96.6296, 1024.56, 92.141, 4, 5, 'Los Santos Vagos', 108, 109, 110, 56, 30, 2, 294, 184, 0, 8, 10, 2, 0, 0, 0, 1000, 1000, 1000, '', '-,Novato ,Ordinario,Amigo,Verificado,Empresa ,Aproximado ,Invasor,Assesino,Padrino ,Padre,-,-,-,-,', '0,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,0,0,0,0,0'),
(14, -1348.37, 493.612, 11.1953, 0.2144, 0, 0, 'Angkatan laut', 253, 287, 73, 121, 121, 191, 61, 0, 0, 4, 14, 1, 336.521, 1927.34, 17.6406, 1000000, 1000000, 0, 'Angkatan laut', '-,Rekrut,Pribadi,Kopral,Sersan,St. Sersan,Sersan Staf,Letnan Junior,Letnan,St. Letnan,Kapten,Utama,Letnan Kolonel,Kolonel,Jendral,', '0,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,0'),
(12, 1380.77, 96.6296, 1024.56, 92.141, 1, 6, 'Varrios Los Aztecas', 114, 115, 116, 216, 48, 29, 119, 116, 242, 9, 10, 2, 0, 0, 0, 1000, 1000, 0, '', '-, Ladron,Novato,Tirador,Compiche,Nesto,Sablo,Invasor,Tesorerro,Vicarium,Padre,-,-,-,-,', '0,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,0,0,0,0,0'),
(13, 1380.77, 96.6296, 1024.56, 92.141, 4, 8, 'Rifa Gang', 173, 273, 184, 173, 174, 175, 177, 193, 142, 8, 10, 2, 0, 0, 0, 1000, 1000, 1000, '', '-,Outsiders,Baby Gangsta,Homies,Homeboy,Fellas,Dawg,Homeboy,Bloods Killa,Padrino,Padre,-,-,-,-,', '0,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,0,0,0,0,0'),
(16, 2565.49, -1281.56, 2065.37, 92.9351, 1, 1, 'Yakuza Mafia', 117, 169, 120, 123, 122, 122, 0, 0, 0, 6, 10, 2, 0, 0, 0, 1000, 1000, 1000, '', '-,Wakashu,Shatei,Syateigashira,Wakagashira,So-hobuncho,Kambu,Oyaji,Saiko-komon,Oyabun-kobun,Kumite,-,-,-,-,', '0,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,0,0,0,0,0'),
(17, 2565.49, -1281.56, 2065.37, 92.9351, 1, 2, 'Columbian Mafia', 124, 125, 126, 127, 216, 46, 0, 0, 0, 6, 10, 2, 0, 0, 0, 1000, 1000, 1000, '', '-,Mafia,Legado,Probado,Luchador,Comerciante ,Asesino,Capitano,Asesor,Autoridad,Diputato,-,-,-,-,', '0,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,0,0,0,0,0'),
(10, 2565.49, -1281.56, 2065.37, 92.9351, 1, 3, 'Russian Mafia', 111, 112, 113, 12, 0, 0, 0, 0, 0, 3, 10, 2, 0, 0, 0, 1000, 1000, 1000, '', '-,Shnyr,Fraer,Banteng,Tukang jualan,Pencuri,Saudara ipar,Saudara,Pencuri,Seorang pencuri dalam hukum,Wewenang,-,-,-,-,', '0,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,0,0,0,0,0'),
(15, 214.783, 2462.51, 16.4844, 356.867, 0, 0, 'Angkatan Udara', 255, 61, 287, 121, 0, 2, 29, 294, 0, 7, 14, 1, 336.521, 1927.34, 17.6406, 1000000, 1000000, 0, 'ВВС', '-,Recourt,Pribadi,Kopral,Sersan,St. Sersan,Sersan Staf,Letnan Junior,Letnan,St. Letnan,Kapten,Utama,Letnan Kolonel,Kolonel,Jenderal,', '0,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,0'),
(0, 0, 0, -500, 0, 333, 333, 'None', 114, 115, 116, 292, 193, 0, 0, 0, 0, 5, 10, 2, 0, 0, 0, 1000, 1000, 0, '', '-,-,-,-,-,-,-,-,-,-,-,-,-,-,-', '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0'),
(11, 1380.44, 96.6171, 1024.04, 92.141, 3, 891, 'Grove Gang', 105, 106, 107, 144, 65, 270, 269, 0, 0, 7, 10, 2, 0, 0, 0, 1000, 1000, 0, '', '-,Playa,Keramaian,Killa,Yuong G ,Gangsta ,O.G,Mobsta,De King,Legenda ,Mad Dog,-,-,-,-,', '0,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,0,0,0,0,0'),
(20, -648.689, -918.774, 1436.22, 348.28, 8, 8, 'Rumah Sakit San Fierro', 274, 275, 276, 308, 70, 0, 0, 0, 0, 5, 10, 2, 0, 0, 0, 0, 0, 0, 'MCSF', '-,Tertib,Staf medis junior,Staf medis senior,Distrik Dokter,Ahli anestesi,Ahli Bedah Junior,Ahli bedah,Profesor,Kepala Departemen,Kepala Dokter,-,-,-,-,', '0,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,0,0,0,0,0'),
(18, 221.134, 108.306, 1010.22, 274.977, 10, 2, 'Polisi SF', 306, 300, 284, 281, 285, 302, 288, 307, 29, 9, 14, 2, 1528.51, -1677.67, 5.8906, 3750, 5000, 0, 'SFPD', '-,Kadet,Petugas pelapor,petugas,Sersan,Peneliti,Operatif,Letnan Junior,Letnan,St. Letnan,Kapten,Utama,Asisten chief,Wakil Kepala,Chief,', '0,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,0'),
(19, 252.558, 190.762, 1008.17, 269.321, 3, 8, 'Polisi LV', 306, 300, 284, 281, 285, 302, 288, 307, 29, 9, 14, 2, 1528.51, -1677.67, 5.8906, 3750, 5000, 0, 'LVPD', '-,Kadet,Petugas pelapor,petugas,Sersan,Peneliti,Operatif,Letnan Junior,Letnan,St. Letnan,Kapten,Utama,Asisten chief,Wakil Kepala,Chief,', '0,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,0'),
(21, -648.689, -918.774, 1436.22, 348.28, 8, 9, 'Rumah Sakit Las Venturas', 274, 275, 276, 308, 70, 0, 0, 0, 0, 5, 10, 2, 0, 0, 0, 0, 0, 0, 'MCLV', '-,Tertib,Staf medis junior,Staf medis senior,Distrik Dokter,Ahli anestesi,Ahli Bedah Junior,Ahli bedah,Profesor,Kepala Departemen,Kepala Dokter,-,-,-,-,', '0,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,0,0,0,0,0'),
(22, 1647.69, -1809.43, 13.7251, 0, 0, 0, 'Mekanik', 8, 268, 50, 236, 192, 193, 305, 305, 0, 6, 8, 1, 0, 0, 0, 0, 0, 0, 'LSC', '-,Recruit,Mecha Novice,Mecha Junior,Mecha Senior,Mecha HRD,Mecha Leader,Mecha Assisten,Mecha Boss,-,-,-,-,-,-', '0,20000,20000,20000,20000,20000,20000,20000,20000,0,0,0,0,0,0,0'),
(23, 2865.74, -2055.87, 11.1022, 0, 0, 0, 'Gojek Pangkalan', 206, 261, 101, 7, 44, 206, 0, 29, 0, 9, 8, 1, 0, 0, 0, 0, 0, 0, 'LSC', '-,Recruit,Ojek Stay,Ojek Bropoy,Ojek Ggwp,Ojek Anti Php,Ojek Leader,Ojek Antas,Ojek Boss,-,-,-,-,-,-', '0,500,1200,1700,2000,2300,2700,3000,4500,0,0,0,0,0,0,0'),
(1, 237.011, 78.0775, 1005.04, 0, 6, 1, 'Polisi LS', 306, 280, 29, 281, 307, 302, 288, 285, 71, 9, 14, 2, 1528.51, -1677.67, 5.8906, 3750, 5000, 0, 'LSPD', '-,Kadet,Petugas pelapor,petugas,Sersan,Peneliti,Operatif,Letnan Junior,Letnan,St. Letnan,Wakil Kapten,Kapten,Asisten Chief,Deputy Chief,Chief,', '0,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,0'),
(2, 252.558, 190.762, 1008.17, 269.321, 3, 2, 'FBI', 141, 165, 166, 163, 285, 286, 12, 0, 0, 7, 10, 2, -371.859, 1577, 76.0423, 1250, 5500, 0, 'FBI', '-,Trainee,Agen Junior,Agen DEA,Agen CID,Agen Khusus,Kepala DEA,Kepala CID,Inspektur,Wakil Direktur,Direktur,-,-,-,-,', '0,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,0,0,0,0,0'),
(3, 242.142, 1870.06, 11.4609, 1.0492, 0, 0, 'Angkatan darat', 91, 73, 255, 121, 179, 179, 191, 191, 0, 6, 14, 1, 336.521, 1927.34, 17.6406, 1000000, 1000000, 0, 'СВ', '-,Rekrut,Pribadi,Kopral,Sersan,St. Sersan,Sersan Staf,Letnan Junior,Letnan,St. Letnan,Kapten,Utama,Letnan Kolonel,Kolonel,Jenderal,', '0,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,0'),
(4, 1396.32, -21.025, 2001, 127.093, 3, 2, 'Pemerintah', 17, 228, 59, 98, 57, 76, 187, 141, 150, 5, 13, 2, 357.786, 193.968, 1023.99, 0, 0, 0, 'AP', '-,Trainee,Agen USSS Junior,Agen USSS,Pengacara ,Kepala USSS,Agen SSC,Direktur SSC,Menteri Kesehatan,Menteri Pertahanan,Menteri Kehakiman,Jaksa wilayah,Wakil Presiden,Presiden,-,', '0,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,0,0'),
(5, -648.689, -918.774, 1436.22, 348.28, 8, 6, 'Rumah Sakit Los Santos', 274, 275, 276, 308, 150, 0, 0, 0, 0, 7, 10, 2, 0, 0, 0, 0, 0, 0, 'MCLS', '-,Tertib,Staf medis junior,Staf medis senior,Distrik Dokter,Ahli anestesi,Ahli Bedah Junior,Ahli bedah,Profesor,Kepala Departemen,Kepala Dokter,-,-,-,-,', '0,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,0,0,0,0,0'),
(6, 162.307, -116.807, 1076.59, 178.327, 6, 1, 'Pusat radio', 60, 76, 233, 150, 141, 170, 186, 187, 0, 8, 10, 2, 170.01, -123.223, 1080.63, 0, 0, 0, 'NEWS', '-,Trainee,Teknisi suara,Teknisi suara,Reporter,Terkemuka,Editor,Kepala editor,Direktur teknis,Direktur program,Manajer umum,-,-,-,-,', '0,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,0,0,0,0,0'),
(7, 508.485, -85.5319, 998.961, 1.3339, 11, 1, 'Bandidos MC', 181, 247, 248, 64, 152, 0, 0, 0, 0, 5, 7, 2, 170.01, -123.223, 1080.63, 0, 0, 0, '', '-,Prospect,Member,Road Capitan,Sergeant,Treasurer,Vice-President,President,-,-,-,-,-,-,-,', '0,20000,20000,20000,20000,20000,20000,20000,0,0,0,0,0,0,0,0'),
(8, 1380.77, 96.6296, 1024.56, 92.141, 2, 850, 'East Side Ballas', 102, 103, 104, 143, 0, 0, 0, 0, 0, 4, 10, 2, 0, 0, 0, 1000, 1000, 1000, '', '-,Blood,Dogg,Cracker,Bro,Nigga,Big Nigga,Ganster,Defender,Star,Big Villi,-,-,-,-,', '0,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,0,0,0,0,0'),
(9, 1380.77, 96.6296, 1024.56, 92.141, 4, 5, 'Los Santos Vagos', 108, 109, 110, 56, 30, 2, 294, 184, 0, 8, 10, 2, 0, 0, 0, 1000, 1000, 1000, '', '-,Novato ,Ordinario,Amigo,Verificado,Empresa ,Aproximado ,Invasor,Assesino,Padrino ,Padre,-,-,-,-,', '0,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,0,0,0,0,0'),
(14, -1348.37, 493.612, 11.1953, 0.2144, 0, 0, 'Angkatan laut', 253, 287, 73, 121, 121, 191, 61, 0, 0, 4, 14, 1, 336.521, 1927.34, 17.6406, 1000000, 1000000, 0, 'Angkatan laut', '-,Rekrut,Pribadi,Kopral,Sersan,St. Sersan,Sersan Staf,Letnan Junior,Letnan,St. Letnan,Kapten,Utama,Letnan Kolonel,Kolonel,Jendral,', '0,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,0'),
(12, 1380.77, 96.6296, 1024.56, 92.141, 1, 6, 'Varrios Los Aztecas', 114, 115, 116, 216, 48, 29, 119, 116, 242, 9, 10, 2, 0, 0, 0, 1000, 1000, 0, '', '-, Ladron,Novato,Tirador,Compiche,Nesto,Sablo,Invasor,Tesorerro,Vicarium,Padre,-,-,-,-,', '0,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,0,0,0,0,0'),
(13, 1380.77, 96.6296, 1024.56, 92.141, 4, 8, 'Rifa Gang', 173, 273, 184, 173, 174, 175, 177, 193, 142, 8, 10, 2, 0, 0, 0, 1000, 1000, 1000, '', '-,Outsiders,Baby Gangsta,Homies,Homeboy,Fellas,Dawg,Homeboy,Bloods Killa,Padrino,Padre,-,-,-,-,', '0,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,0,0,0,0,0'),
(16, 2565.49, -1281.56, 2065.37, 92.9351, 1, 1, 'Yakuza Mafia', 117, 169, 120, 123, 122, 122, 0, 0, 0, 6, 10, 2, 0, 0, 0, 1000, 1000, 1000, '', '-,Wakashu,Shatei,Syateigashira,Wakagashira,So-hobuncho,Kambu,Oyaji,Saiko-komon,Oyabun-kobun,Kumite,-,-,-,-,', '0,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,0,0,0,0,0'),
(17, 2565.49, -1281.56, 2065.37, 92.9351, 1, 2, 'Columbian Mafia', 124, 125, 126, 127, 216, 46, 0, 0, 0, 6, 10, 2, 0, 0, 0, 1000, 1000, 1000, '', '-,Mafia,Legado,Probado,Luchador,Comerciante ,Asesino,Capitano,Asesor,Autoridad,Diputato,-,-,-,-,', '0,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,0,0,0,0,0'),
(10, 2565.49, -1281.56, 2065.37, 92.9351, 1, 3, 'Russian Mafia', 111, 112, 113, 12, 0, 0, 0, 0, 0, 3, 10, 2, 0, 0, 0, 1000, 1000, 1000, '', '-,Shnyr,Fraer,Banteng,Tukang jualan,Pencuri,Saudara ipar,Saudara,Pencuri,Seorang pencuri dalam hukum,Wewenang,-,-,-,-,', '0,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,0,0,0,0,0'),
(15, 214.783, 2462.51, 16.4844, 356.867, 0, 0, 'Angkatan Udara', 255, 61, 287, 121, 0, 2, 29, 294, 0, 7, 14, 1, 336.521, 1927.34, 17.6406, 1000000, 1000000, 0, 'ВВС', '-,Recourt,Pribadi,Kopral,Sersan,St. Sersan,Sersan Staf,Letnan Junior,Letnan,St. Letnan,Kapten,Utama,Letnan Kolonel,Kolonel,Jenderal,', '0,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,0'),
(0, 0, 0, -500, 0, 333, 333, 'None', 114, 115, 116, 292, 193, 0, 0, 0, 0, 5, 10, 2, 0, 0, 0, 1000, 1000, 0, '', '-,-,-,-,-,-,-,-,-,-,-,-,-,-,-', '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0'),
(11, 1380.44, 96.6171, 1024.04, 92.141, 3, 891, 'Grove Gang', 105, 106, 107, 144, 65, 270, 269, 0, 0, 7, 10, 2, 0, 0, 0, 1000, 1000, 0, '', '-,Playa,Keramaian,Killa,Yuong G ,Gangsta ,O.G,Mobsta,De King,Legenda ,Mad Dog,-,-,-,-,', '0,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,0,0,0,0,0'),
(20, -648.689, -918.774, 1436.22, 348.28, 8, 8, 'Rumah Sakit San Fierro', 274, 275, 276, 308, 70, 0, 0, 0, 0, 5, 10, 2, 0, 0, 0, 0, 0, 0, 'MCSF', '-,Tertib,Staf medis junior,Staf medis senior,Distrik Dokter,Ahli anestesi,Ahli Bedah Junior,Ahli bedah,Profesor,Kepala Departemen,Kepala Dokter,-,-,-,-,', '0,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,0,0,0,0,0'),
(18, 221.134, 108.306, 1010.22, 274.977, 10, 2, 'Polisi SF', 306, 300, 284, 281, 285, 302, 288, 307, 29, 9, 14, 2, 1528.51, -1677.67, 5.8906, 3750, 5000, 0, 'SFPD', '-,Kadet,Petugas pelapor,petugas,Sersan,Peneliti,Operatif,Letnan Junior,Letnan,St. Letnan,Kapten,Utama,Asisten chief,Wakil Kepala,Chief,', '0,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,0'),
(19, 252.558, 190.762, 1008.17, 269.321, 3, 8, 'Polisi LV', 306, 300, 284, 281, 285, 302, 288, 307, 29, 9, 14, 2, 1528.51, -1677.67, 5.8906, 3750, 5000, 0, 'LVPD', '-,Kadet,Petugas pelapor,petugas,Sersan,Peneliti,Operatif,Letnan Junior,Letnan,St. Letnan,Kapten,Utama,Asisten chief,Wakil Kepala,Chief,', '0,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,0'),
(21, -648.689, -918.774, 1436.22, 348.28, 8, 9, 'Rumah Sakit Las Venturas', 274, 275, 276, 308, 70, 0, 0, 0, 0, 5, 10, 2, 0, 0, 0, 0, 0, 0, 'MCLV', '-,Tertib,Staf medis junior,Staf medis senior,Distrik Dokter,Ahli anestesi,Ahli Bedah Junior,Ahli bedah,Profesor,Kepala Departemen,Kepala Dokter,-,-,-,-,', '0,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,0,0,0,0,0'),
(22, 1647.69, -1809.43, 13.7251, 0, 0, 0, 'Mekanik', 8, 268, 50, 236, 192, 193, 305, 305, 0, 6, 8, 1, 0, 0, 0, 0, 0, 0, 'LSC', '-,Recruit,Mecha Novice,Mecha Junior,Mecha Senior,Mecha HRD,Mecha Leader,Mecha Assisten,Mecha Boss,-,-,-,-,-,-', '0,20000,20000,20000,20000,20000,20000,20000,20000,0,0,0,0,0,0,0'),
(23, 2865.74, -2055.87, 11.1022, 0, 0, 0, 'Gojek Pangkalan', 206, 261, 101, 7, 44, 206, 0, 29, 0, 9, 8, 1, 0, 0, 0, 0, 0, 0, 'LSC', '-,Recruit,Ojek Stay,Ojek Bropoy,Ojek Ggwp,Ojek Anti Php,Ojek Leader,Ojek Antas,Ojek Boss,-,-,-,-,-,-', '0,500,1200,1700,2000,2300,2700,3000,4500,0,0,0,0,0,0,0');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 31, 2021 at 06:28 AM
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
-- Database: `ddd`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `pID` int(11) NOT NULL,
  `pName` varchar(32) CHARACTER SET cp1251 COLLATE cp1251_bin NOT NULL,
  `pPassword` varchar(32) CHARACTER SET cp1251 COLLATE cp1251_bin NOT NULL,
  `pass_salt` varchar(6) NOT NULL,
  `pKeyIp` varchar(11) CHARACTER SET cp1251 COLLATE cp1251_bin NOT NULL,
  `pMail` varchar(32) CHARACTER SET cp1251 COLLATE cp1251_bin NOT NULL,
  `pIpReg` varchar(16) CHARACTER SET cp1251 COLLATE cp1251_bin NOT NULL,
  `pIp` varchar(32) CHARACTER SET cp1251 COLLATE cp1251_bin NOT NULL,
  `pOnline` varchar(32) CHARACTER SET cp1251 COLLATE cp1251_bin NOT NULL,
  `pDataReg` varchar(32) CHARACTER SET utf8 NOT NULL,
  `pReferal` int(11) NOT NULL DEFAULT 0,
  `pLogin` int(11) NOT NULL,
  `pSex` int(11) NOT NULL,
  `pHP` float NOT NULL DEFAULT 100,
  `pSatiety` float NOT NULL DEFAULT 100,
  `pThirst` float NOT NULL DEFAULT 100,
  `pSkin` int(11) NOT NULL DEFAULT -1,
  `pCash` int(11) NOT NULL,
  `pBank` int(11) NOT NULL,
  `pLevel` int(11) NOT NULL DEFAULT 1,
  `pExp` int(11) NOT NULL DEFAULT 1,
  `pSetSpawn` int(11) NOT NULL,
  `pMember` int(11) NOT NULL,
  `pRank` int(11) NOT NULL,
  `pLeader` int(11) NOT NULL,
  `pJob` int(11) NOT NULL,
  `pDrugs` int(11) NOT NULL,
  `pPatron` int(11) NOT NULL,
  `pMetall` int(11) NOT NULL,
  `pUseCar` int(11) NOT NULL,
  `pDonatechet` int(11) NOT NULL,
  `pProducts` varchar(16) NOT NULL DEFAULT '0,0,0',
  `pNumber` int(11) NOT NULL,
  `pSummaNumber` int(11) NOT NULL,
  `pSatietyBarActive` int(11) NOT NULL DEFAULT 100,
  `pZakon` int(11) NOT NULL,
  `pWarn` int(11) NOT NULL,
  `pfWarn` int(11) NOT NULL,
  `pWanted` int(11) NOT NULL,
  `pMuted` int(11) NOT NULL,
  `pPayCheck` int(11) NOT NULL,
  `pUpdPlayer` varchar(12) NOT NULL DEFAULT '0,0,0,0,0',
  `pMaxSchet` int(11) NOT NULL,
  `pPodtvMail` int(11) NOT NULL,
  `pCheckIp` int(11) NOT NULL,
  `pCheckGoogle` int(11) NOT NULL,
  `pCodeGoogle` varchar(17) NOT NULL,
  `pPrison` int(11) NOT NULL,
  `pMestoPrison` int(11) NOT NULL,
  `pGun` varchar(64) NOT NULL DEFAULT '0,0,0,0,0,0,0,0,0,0,0,0,0',
  `pAmmo` varchar(64) NOT NULL DEFAULT '0,0,0,0,0,0,0,0,0,0,0,0,0',
  `pBolnica` int(11) NOT NULL,
  `pFrSkin` int(11) NOT NULL,
  `pLicenses` varchar(32) NOT NULL,
  `pGunSkill` varchar(64) NOT NULL,
  `pText` int(11) NOT NULL,
  `pHeals` int(11) NOT NULL,
  `pRouble` int(11) NOT NULL,
  `pVip` int(11) NOT NULL,
  `pVipTime` int(11) NOT NULL,
  `promo` varchar(64) CHARACTER SET utf8 NOT NULL,
  `pRobleCheck` int(11) NOT NULL,
  `family` int(11) NOT NULL DEFAULT -1,
  `family_rang` int(11) NOT NULL,
  `cModel` varchar(32) NOT NULL DEFAULT '0,0,0',
  `cColor1` varchar(32) NOT NULL DEFAULT '0,0,0',
  `cColor2` varchar(32) NOT NULL DEFAULT '0,0,0',
  `cNumber` varchar(46) NOT NULL DEFAULT 'None,None,None',
  `cLock` varchar(16) NOT NULL DEFAULT '0,0,0',
  `cFuel` varchar(32) NOT NULL DEFAULT '100.0,100.0,100.0',
  `cCost` varchar(46) NOT NULL DEFAULT '0,0,0',
  `cProbeg` varchar(46) NOT NULL DEFAULT '0.0,0.0,0.0',
  `cHeal` varchar(46) NOT NULL DEFAULT '1000.0,1000.0,1000.0',
  `cDamagePanel` varchar(32) NOT NULL DEFAULT '0,0,0',
  `cDamageDoors` varchar(32) NOT NULL DEFAULT '0,0,0',
  `cDamageLights` varchar(32) NOT NULL DEFAULT '0,0,0',
  `cDamageTires` varchar(32) NOT NULL DEFAULT '0,0,0',
  `cWheels` varchar(32) NOT NULL DEFAULT '0,0,0',
  `cSpoiler` varchar(32) NOT NULL DEFAULT '0,0,0',
  `cBumper1` varchar(32) NOT NULL DEFAULT '0,0,0',
  `cBumper2` varchar(32) NOT NULL DEFAULT '0,0,0',
  `cNitro` varchar(32) NOT NULL DEFAULT '0,0,0',
  `cHydrawlic` varchar(32) NOT NULL DEFAULT '0,0,0',
  `cHood` varchar(32) NOT NULL DEFAULT '0,0,0',
  `cRoof` varchar(32) NOT NULL DEFAULT '0,0,0',
  `cSideskirt` varchar(32) NOT NULL DEFAULT '0,0,0',
  `cLamps` varchar(32) NOT NULL DEFAULT '0,0,0',
  `cExhaust` varchar(32) NOT NULL DEFAULT '0,0,0',
  `cStereo` varchar(32) NOT NULL DEFAULT '0,0,0',
  `cVentRight` varchar(32) NOT NULL DEFAULT '0,0,0',
  `cVentLeft` varchar(32) NOT NULL DEFAULT '0,0,0',
  `cSost` varchar(32) NOT NULL DEFAULT '100,100,100',
  `cPaintJobs` varchar(32) NOT NULL DEFAULT '255,255,255',
  `engine_tune` varchar(64) NOT NULL DEFAULT '0,0,0,0,0|0,0,0,0,0|0,0,0,0,0',
  `brake_tune` varchar(64) NOT NULL DEFAULT '0,0,0,0,0|0,0,0,0,0|0,0,0,0,0',
  `pHotel` int(11) NOT NULL DEFAULT -1,
  `pDrugMarkAmount` int(11) NOT NULL,
  `pDrugMarkID` int(11) NOT NULL,
  `warehouse_quest_id` int(11) NOT NULL,
  `warehouse_quest_status` int(11) NOT NULL,
  `warehouse_quest_progress` int(11) NOT NULL,
  `warehouse_quest_block` int(11) NOT NULL,
  `car_park` varchar(64) NOT NULL DEFAULT '0.0,0.0,0.0,0.0|0.0,0.0,0.0,0.0|0.0,0.0,0.0,0.0',
  `pMask` int(11) NOT NULL,
  `pClip` int(11) NOT NULL,
  `b_quest_id` int(11) NOT NULL,
  `b_quest_status` int(11) NOT NULL,
  `b_quest_progress` int(11) NOT NULL,
  `pInfSatiety` int(11) NOT NULL,
  `pRepairKit` int(11) NOT NULL,
  `pElecVote` int(11) NOT NULL,
  `pInGameSeconds` int(11) NOT NULL,
  `pInGameAFKSeconds` int(11) NOT NULL,
  `pInGameHourSeconds` int(11) NOT NULL,
  `pClock` int(11) NOT NULL,
  `pFreeRoulet` int(11) NOT NULL,
  `last_curdate` int(11) NOT NULL,
  `last_hour` int(11) NOT NULL,
  `pSupport` int(11) NOT NULL,
  `pDrugDep` int(11) NOT NULL,
  `pMoneyCase` int(11) NOT NULL DEFAULT 1,
  `pVkId` int(11) NOT NULL,
  `pBoombox` int(11) NOT NULL,
  `pComponent` int(11) NOT NULL,
  `PosX` varchar(11) NOT NULL DEFAULT '0.0',
  `PosY` varchar(11) NOT NULL DEFAULT '0.0',
  `PosZ` varchar(11) NOT NULL DEFAULT '0.0',
  `Angle` varchar(11) NOT NULL DEFAULT '0.0',
  `Interior` int(11) NOT NULL DEFAULT 0,
  `VirtualWorld` int(11) NOT NULL DEFAULT 0,
  `pStaterpack` int(11) NOT NULL,
  `pTali` int(11) NOT NULL,
  `pUdut` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;
*/
