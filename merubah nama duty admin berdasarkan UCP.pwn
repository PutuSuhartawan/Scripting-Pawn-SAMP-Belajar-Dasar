
#include <a_samp>
//#define FIXES_OnPlayerText 0
#define FIXES_GetMaxPlayersMsg 0
#define FIXES_ServerVarMsg 0                                             
#define FIX_GetServerVarAsString 0                                      
#define FIX_GetServerVarAsFloat  0                                       
#define FIX_GetServerVarAsInt    0                                      
#define FIX_GetServerVarAsBool   0
#define FIX_IS_FILTERSCRIPT 0

#include <fixes>
#include <sscanf2>


 // untuk membuat log
#include <Dini> // ini simpan data dari player
#include <sprintf>
#include <streamer>
#include "../include/gl_messages.inc"
#include <core>
#include <float>
#include "../include/gl_spawns.inc"
#include "../include/gl_common.inc"
#include "../include/vehicleutil.inc"
#include <a_npc>
#include "../include/SpikeStrip.inc"
#include "Idlewood_Projects.pwn"
#include <yom_buttons>
#include <data>
#include <textdraws>
#include <zcmd> // supaya bisa pakai untuk buat cmd mudah tanpa strcmp
#include <gangzones.inc>

//#define _ALS_OnFilterScriptInit

 // untuk supaya bisa pake progress bar sekarang tahun. Progress Bar 2.0.3 tahun 2015
#include <a_mysql> // MySQL plugin R41-4
#include <YSI_Storage\y_ini>
#include <YSI_Data\y_iterate>
#include <progress2>
#include <foreach>// ini color khusus string yang tidak mendukung tanda kurung.



enum PlayerInfo
{
    ID, // id of the player
    Nick[24],
    Sandi[20], // name of the player
    UCP[20], // merukapak variabel enum untuk nama UCP ketika duty admin
    pAdmin, // admin level of the player
    pMoney, //money of the player
    pKills, // Kills of the player
    pDeaths,
    pPosisiTerakhir,
    pPosisiMobil,
    Float:pPx,
    Float:pPy,
    Float:pPz,
    Float:pMx,
    Float:pMy,
    Float:pMz,
    Float:pHealtM1,
    Mvw1,
    Minterior1,
    pSenjata1,
    pPeluru1,
    pTipeMobil,
    pPunyaMobil,
    pWord,
    pInterior, // deaths of the player
    pScore,
    pNeon,
    pLaparBar, // score of the player
    Float:pKecepatanKendaraan,
    pKendaraanDipakai,
    IP[16],
    pBoombox, // nilai integer bahwa ada kepemilikan boombox
    pFishingRod, // kalau dia sudah beli pancingan
    pWorms,	// beli umpan.
    pFishes,	// ikan yang sedang di bawa.
    Coba, // Storing the ip of the player
        Logged, // Players logged in or not variable
        IsRegistered //checks if the player is registered or not.
};

new pInfo[MAX_PLAYERS][PlayerInfo];

// ini parameter induk paling atas untuk siapa yang duty
new OnDuty[MAX_PLAYERS];

public OnPlayerConnect(playerid)
{
	new passworddariuser[500];
    format(passworddariuser, 500, "SELECT * FROM `playerdata` WHERE `nick` COLLATE latin1_general_cs = '%s' LIMIT 1", pInfo[playerid][Nick]); // now here check the database if the player has given the proper password.HTTP
	
	mysql_query(MySQL:g_Sql, passworddariuser, bool:true);


	
	cache_get_value_int(0, "id", pInfo[playerid][ID]); 
	cache_get_value_name(0, "password", pInfo[playerid][Sandi], 50);
	cache_get_value_name(0, "UCP", pInfo[playerid][UCP], 20); // inilah data string nama admin yang di ambil
}



CMD:aduty(playerid, params[])
{

		// ini adalah penentu skin yang di pakek user awalnya
        //new skin = GetPlayerSkin(playerid);
        //new sudahduty;
        //new belumduty;
		//new skorawal = GetPlayerScore(playerid);
   		 // Dsini player tersebut harus lebih dulu /rcon login PW , if the player isnt a rcon admin then this message will be sent to him.
    	
    	//if(!IsPlayerAdmin(playerid)) return SendClientMessage(playerid,-1,"* Tuan belum pakai /rcon login (password). ");
		new teksdikarakteradmin;
		new string[128];
		if(OnDuty[playerid] == 0)
    	{
        	SetPlayerName(playerid, pInfo[playerid][UCP]);
			teksdikarakteradmin = CreatePlayer3DTextLabel(playerid,"Hight Admin",0x01FCFFFF,0.0,0.0,0.0,30.0);
			SetPlayerSkin(playerid,217);
	        SetPlayerHealth(playerid,999999);
	        SetPlayerColor(playerid, 0x01FCFFFF);
	        SetPlayerScore(playerid, GetPlayerScore(playerid) + 9999);
	        
	        ApplyAnimation(playerid,"MEDIC","CPR",4.0,0,0,0,0,0);		
	        format(string, sizeof(string), "* "COL_RED"[ %s ]"COL_GREEN" are is now on duty as an admin (/report for assistance).", GetRPName(playerid));
	        SendClientMessage(playerid, COLOR_SPRINGGREEN, string);
	        GameTextForPlayer(playerid, "~r~ANDA ADMIN SEKARANG", 4000, 1);
	        ShowPlayerDialog(playerid, sewaan, DIALOG_STYLE_TABLIST_HEADERS,"{FFFF00}Daftar pelapor", PLAYERNEEDHELP_DIALOG, "Bantu", "Malas");
	       

       		OnDuty[playerid] = 1;
   		}
 	   	else
   		{	
   			SetPlayerName(playerid, pInfo[playerid][Nick]);
   			DeletePlayer3DTextLabel(teksdikarakteradmin);
	        SetPlayerSkin(playerid,267);
	        SetPlayerHealth(playerid,100);
	        SetPlayerColor(playerid, 0xFFFFFFFF);
	        
	        SetPlayerScore(playerid, GetPlayerScore(playerid) - 9999);
	        SendClientMessage(playerid, COLOR_ERROR, "* You are is now off duty as admin!");
	        ApplyAnimation(playerid,"ped","Crouch_Roll_L",4.0,0,0,0,0,0);

	        OnDuty[playerid] = 0;
    	}




	
		

	return 1;
}
