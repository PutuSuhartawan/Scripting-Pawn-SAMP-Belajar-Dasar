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
      
      }
      
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

*/
