//DEFINES
#define YSI_NO_OPTIMISATION_MESSAGE
#define YSI_NO_VERSION_CHECK
#define YSI_NO_CACHE_MESSAGE
#define YSI_NO_MODE_CACHE
#if !defined isnull
    #define isnull(%1) ((!(%1[0])) || (((%1[0]) == '\1') && (!(%1[1]))))
#endif
#define MAX_DIALOG_ITEMS                (512 + 1)

//INCLUDES


#include <a_samp>
//#define FIXES_OnPlayerText 0
#define FIXES_GetMaxPlayersMsg 0
#define FIXES_ServerVarMsg 0  
//#define FIXES_OnPlayerKeyStateChange 0                                          
#define FIX_GetServerVarAsString 0                                      
#define FIX_GetServerVarAsFloat  0                                       
#define FIX_GetServerVarAsInt    0                                      
#define FIX_GetServerVarAsBool   0
#define FIX_IS_FILTERSCRIPT 0




#include <fixes>
#include <sscanf2>


 // untuk membuat log
#include <dini> // this is for saving data of dini database  * @update    : 16th Sep 2008
#include <sprintf>
 //important for timer set
#include <streamer>
#include "../include/gl_messages.inc"
#include <core>
#include <float>
//#include "../include/gl_spawns.inc"
#include "../include/gl_common.inc"
#include "../include/vehicleutil.inc"
#include <a_npc>
#include "../include/SpikeStrip.inc"
#include "mapping/Idlewood_Projects.pwn"
#include "mapping/AuctionMart.pwn"


//#include "features/AuctionSystem.pwn"
#include <yom_buttons>
#include <data>
#include <textdraws>
#include <zcmd> // untuk membuat script command CMD
#include <gangzones.inc>

//#define _ALS_OnFilterScriptInit

 // untuk supaya bisa pake progress bar sekarang tahun. Progress Bar 2.0.3 tahun 2015
#include <a_mysql> // MySQL plugin R41-4
#include <timerfix.inc>
//#include <YSI_Storage\y_ini>
#include <YSI_Data\y_iterate>
#include <progress2>
#include <foreach>// color with string

//#include <_ALS_OnFilterScriptInit>
#include "player/vehicle/header.inc"




//#define tabsize 0

//============ DEFINE THE PATH OF FILE

#define DINI_PATH        "Users/%s.ini" // source from folder .ini file in scriptfiles
#define FILTERSCRIPT
#define COL_EASY "{FFF1AF}"
#define COL_WHITE "{FFFFFF}"
#define COL_BLACK "{0E0101}"
#define COL_GREY "{C3C3C3}"
#define COL_GREEN "{6EF83C}"
#define COL_RED "{F81414}"
#define COL_YELLOW "{F3FF02}"
#define COL_ORANGE "{FFAF00}"
#define COL_LIME "{B7FF00}"
#define COL_CYAN "{00FFEE}"            
#define COL_LIGHTBLUE "{00C0FF}"
#define COL_BLUE "{0049FF}"
#define COL_MAGENTA "{F300FF}"
#define COL_VIOLET "{B700FF}"
#define COL_PINK "{FF00EA}"
#define COL_MARONE "{A90202}"
#define COL_CMD "{B8FF02}"
#define COL_PARAM "{3FCD02}"
#define COL_SERVER "{AFE7FF}"
#define COL_VALUE "{A3E4FF}"
#define COL_RULE "{F9E8B7}"
#define COL_RULE2 "{FBDF89}"
#define COL_RWHITE "{FFFFFF}"
#define COL_LGREEN "{C9FFAB}"
#define COL_LRED "{FFA1A1}"
#define COL_LRED2 "{C77D87}" 


#define SEM(%0,%1) SendClientMessage(%0,0xBFC0C200,%1) // notif for error message
//native SEM(playerid, yourstring[]);
#define GetPlayerData(%0,%1)    pInfo[%0][%1]         
//native GetPlayerData(playerid, PlayerInfo);                   
#define AddPlayerData(%0,%1,%2,%3) pInfo[%0][%1] %2= %3
//native AddPlayerData(playerid, PlayerInfo, plusorminus, value);
#define GetPlayerMoneyEx(%0)    GetPlayerData(%0, pMoney)           // money SQL from selecting ID player 
//native GetPlayerMoneyEx(playerid, pMoney);

#define GetItemInfo(%0,%1)    get_item_type[%0][%1]
//native GetItemInfo(vehicleid, trunkslot, enumstrunkstructur);
                                                                

// ------------------------------------------
#define GetOwnableCarData(%0,%1)    get_ownable_car[%0][%1]
//native GetOwnableCarData(vehicleid, OC_SQL_ID);
#define SetOwnableCarData(%0,%1,%2)   get_ownable_car[%0][%1] = %2
//native SetOwnableCarData(vehicleid, OC_SQL_ID, new value);
#define AddOwnableCarData(%0,%1,%2,%3)  get_ownable_car[%0][%1] %2= %3
//native AddOwnableCarData(vehicleid, OC_SQL_ID, plus,new value);
#define IsOwnableCarOwned(%0)     (GetOwnableCarData(%0, OC_OWNER_ID) > 0)
//native IsOwnableCarOwned(vehicleid);
// ------------------------------------------


#define GetVehicleData(%0,%1)   get_vehicle_data[%0][%1]
//native GetVehicleData(vehicleid, V_ACTION_ID);
// ------------------------------------------
#define GetTrunkData(%0,%1,%2)      get_vehicle_trunk[%0][%1][%2]
//native GetTrunkData(vehicleid, trunkslot, enumstrunkstructur);
#define SetTrunkData(%0,%1,%2,%3)     get_vehicle_trunk[%0][%1][%2] = %3
//native SetTrunkData(vehicleid, trunkslot, enumstrunkstructur, newvalueenumdata);
#define AddTrunkData(%0,%1,%2,%3,%4)  get_vehicle_trunk[%0][%1][%2] %3= %4
//native AddTrunkData(vehicleid, trunkslot, enumstrunkstructur, plusorminus,newvalueenumdata);
#define IsTrunkFreeSlot(%0,%1)      !GetTrunkData(%0, %1, TRUNK_SQL_ID)
//native IsTrunkFreeSlot(vehicleid, trunkslot, TRUNK_SQL_ID);



// ------------------------------------------
#define GPS_STATUS_ON true
#define GPS_STATUS_OFF  false

// ------------------------------------------
// ------------------------------------------
#define GetPlayerGPSInfo(%0,%1)   g_player_gps[%0][%1]
#define SetPlayerGPSInfo(%0,%1,%2)  g_player_gps[%0][%1] = %2

// ------------------------------------------


#define COLOR_ME        0xC2A2DAFF
#define COLOR_ERROR     0xFF0000FF
#define COLOR_GREEN     0x008000FF
#define COLOR_AQUAGREEN     0x03D687FF
#define COLOR_RED 0xFF0000FF
#define COLOR_LIGHTRED 0xFF6347AA // 0xB33C3CAA
#define COLOR_LIGHTBLUE 0x33CCFFAA
#define COLOR_BLUE 0x1ED5C7FF
#define COLOR_YELLOW 0xFFFF00AA
#define COLOR_ORANGE 0xFFFF8000
#define COLOR_PURPLE 0xFF400080
#define COLOR_LBLUE 0xFF0080FF
#define COLOR_WHITE 0xFFFFFFFF
#define COLOR_BLACK 0xFF000000
#define COLOR_CYAN 0xFF00FFFF
#define COLOR_PINK 0xFFFF00FF
#define COLOR_BROWN 0xFF6A0000
#define COLOR_LPURPLE 0xFF8080C0
#define COLOR_LGREEN 0x9ACD32AA
#define COLOR_GRAY 0xFF676767
#define COLOR_DARKGOLD 0x808000AA
#define COLOR_AQUA 0x00FFFFFF
#define COLOR_RUSAK 0x01FCFFC8
#define COLOR_NORMAL_PLAYER 0xFFBB7777


// a code define all dialog line respond
#define           DIALOG_SHOW_GPS               (11)
#define           DIALOG_OPEN_VEHICLE_TRUNK     (12)
#define                     DIALOG_INPUT_BID_AUCTION            (13)
#define                     DIALOG_ACCEPT_AUCTION               (14)
#define                     DIALOG_INPUT_offerINGAUCTION        (15)
#define                     DIALOG_PROSSES_IKLAN                (16)
#define                     DIALOG_GANTI_PW                     (17)
#define                     PILIHAN_LAMPU                       (12312)
#define           RESPONDDIALOGKOSONG                   (543)
#define                     BUYTOYSCOP                          (10153)
#define                     BUYTOYSCOP2                         (10154)
#define                     BUYTOYSCOP3                         (10155)
#define                     MAX_PLAYERTOYS                      (8)

#define WHITE 0xFFFFFFFF


#define MAX_ADMIN_LEVEL 7
#define SETLEVEL_ADMIN 5


enum E_PLAYER_GPS_STRUCT
{
  bool: G_ENABLED,
  Float: G_POS_X,
  Float: G_POS_Y,
  Float: G_POS_Z
};

// ------------------------------------------
new g_player_gps[MAX_PLAYERS][E_PLAYER_GPS_STRUCT];
new
  g_gps_default_values[E_PLAYER_GPS_STRUCT] =
{
  GPS_STATUS_OFF,
  0.0,
  0.0,
  0.0
};

new GPSCP; // chekcpoint of GPS


enum PlayerInfo
{
    ID, // id of the player
    Nick[24],
    PasswordAccount[20], // name of the player
    UCP[20], // merukapak variabel enum untuk nama UCP ketika duty admin
    pAdmin, // admin level of the player
    pSkin,
    pSeconds,
    pMinutes,
    pHours,
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
    pJobMechanic, // untuk informasi termasuk fraksi job mechanic atau tidak
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
    PlayerBar:pLaparBar, // score bar hungry of the player
    PlayerBar:pLoadingBar, // enum untuk bar lapar.
    pStatusLoadingBar, // 
    Float:pKecepatanKendaraan,
    pKendaraanDipakai,
    JoinedAuction, // auction member status
    LastVehicleID, 
    IP[16],
    pBoombox, // nilai integer bahwa ada kepemilikan boombox
    pFishingRod, // kalau dia sudah beli pancingan
    pWorms, // beli umpan.
    pComponent, // component setiap user untuk bahan upgrade kendaraan yang ada.
    pFishes,  // ikan yang sedang di bawa.
    Coba, // Storing the ip of the player
        Logged, // Players logged in or not variable
        IsRegistered //checks if the player is registered or not.
};

new pInfo[MAX_PLAYERS][PlayerInfo];

// ALL STOCK LINE IS WILL BE TAKE FROM HERE
//==================================================================================



stock EnablePlayerGPS(playerid, Float: x, Float: y, Float: z, message[] = "Sir, You have changed your GPS location.")
{
      SetPlayerGPSInfo(playerid, G_POS_X, x);
      SetPlayerGPSInfo(playerid, G_POS_Y, y);
      SetPlayerGPSInfo(playerid, G_POS_Z, z);

      GPSCP = SetPlayerCheckpoint(playerid, x, y, z, 3.0);

    //  SetPlayerMapIcon(playerid, 98, x, y, z, markertype, 0, MAPICON_GLOBAL);

      if(strlen(message))
        SendClientMessage(playerid, 0xFFFF00FF, message);

      SetPlayerGPSInfo(playerid, G_ENABLED, GPS_STATUS_ON);

  return 1;
}

stock DisablePlayerGPS(playerid)
{
  if(GetPlayerGPSInfo(playerid, G_ENABLED) == GPS_STATUS_ON)
  {
    DisablePlayerCheckpoint(playerid);

    SetPlayerGPSInfo(playerid, G_ENABLED, GPS_STATUS_OFF);
    SendClientMessage(playerid, 0xFFFF00FF, ""COL_RED"GPS:"COL_WHITE" You turn off the GPS device. Good luck sir!");
  }
  return 1;
}


//============ PUBLIC LINE FORWARD LINE=========================

forward UpdatePlayerTimePlayed(playerid);
public UpdatePlayerTimePlayed(playerid)
{


          
          pInfo[playerid][pSeconds]++;
          if(pInfo[playerid][pSeconds] > 60)
          {
            pInfo[playerid][pSeconds] = 0;
            return pInfo[playerid][pMinutes]++;
            SendClientMessage(playerid, 0xFFFF00FF, "debug minute");
          }
          if(pInfo[playerid][pMinutes] > 60)
          {
            pInfo[playerid][pMinutes] = 0;
            return pInfo[playerid][pHours]++;
           
          }
            
      
}



public WaktuServer(playerid, closestcar)
{

  UpdatePlayerTimePlayed(playerid);
  //SendClientMessage(playerid, COLOR_WHITE, "INFO: PlayerTimePlayed has running");

}

    



//------------------------------------------------
public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{

}




public OnPlayerEnterCheckpoint(playerid)
{



}





// on player connect tempat paling bagus menghapus segala object yang di tambah ataupun yang ada.
public OnPlayerRequestSpawn(playerid)
{
    if(IsPlayerNPC(playerid)) return 1; 

    
    //return cmd_spawn(playerid);
    if(!PLAYER_STATE_SPAWNED)
    {
        SpawnPlayer(playerid);
        return 1;
    }
    return 1;
}
    
//------------------------------------------------
public GetRPName(playerid)
{
    new RPName[MAX_PLAYER_NAME], i_pos;
    GetPlayerName(playerid, RPName, MAX_PLAYER_NAME);
    while ((i_pos = strfind(RPName, "_", false, i_pos)) != -1) RPName[i_pos] = ' ';
    return RPName;
}


//----------------------------------------------------------

public OnPlayerRequestClass(playerid, classid)
{
    if(IsPlayerNPC(playerid)) return 1; 
    if(!PLAYER_STATE_SPAWNED)
    {
        SpawnPlayer(playerid);
        return 1;
    }
    

    return 1;
    

}


public OnPlayerConnect(playerid)
{   
    if(IsPlayerNPC(playerid)) return 1; 

    SelectTextDraw(playerid, COLOR_BLUE);
    SetTimerEx("WaktuServer", 1000, true, "i", playerid);
   



    SetPlayerInterior(playerid, 0);
    SetPlayerVirtualWorld(playerid, 0);
    
    TogglePlayerControllable(playerid, 1);
   
    //ConnectMySQL();
    GetPlayerName(playerid, pInfo[playerid][Nick], 24);
    //gets the player's name and stores it to to your enum pInfo[playerid][Nick]
    GetPlayerIp(playerid, pInfo[playerid][IP], 16); //Gets the IP of the player and stores it to pInfo[playerid][IP]
    // mysql_log( ERROR | WARNING ); // we query the statement above
    // mysql_escape_string(pInfo[playerid][Nick], pInfo[playerid][Nick]); 
    //fopen("logs/pay.log", io_write);


    //mysql_connect_file("mysql.ini");// now we have to escape the name inorder to escape any mysql injections. ([url]http://en.wikipedia.org/wiki/SQL_injection[/url])
    //format(Query, 500, "SELECT `nick` FROM `playerdata` WHERE `nick` COLLATE latin1_general_cs = '%s' LIMIT 1", pInfo[playerid][Nick]); // here we are selecting the name of the player who logged in from the database.
    //mysql_query(g_Sql, Query, true);


    new GetDataFromPlayerConnect[500];
    format(GetDataFromPlayerConnect, 500, "SELECT * FROM `playerdata` WHERE `nick` COLLATE latin1_general_cs = '%s' LIMIT 1", pInfo[playerid][Nick]); // now here check the database if the player has given the proper password.HTTP
    //mysql_query(MySQL:handle, const query[], bool:use_cache = true)
    mysql_query(MySQL:g_Sql, GetDataFromPlayerConnect, bool:true);

    //new datapw[250];
    //format(datapw, sizeof(datapw), "SELECT * FROM `playerdata` WHERE `nick` COLLATE latin1_general_cs = '%s' LIMIT 1", pInfo[playerid][Nick]);
    //mysql_query(g_Sql, datapw);


    cache_get_value_int(0, "id", pInfo[playerid][ID]); 
    cache_get_value_name(0, "password", pInfo[playerid][Sandi], 50);
    cache_get_value_name(0, "UCP", pInfo[playerid][UCP], 20);
    cache_get_value_int(0, "JobMechanic", pInfo[playerid][pJobMechanic]);
    cache_get_value_int(0, "skin", pInfo[playerid][pSkin]);
    cache_get_value_int(0, "component", pInfo[playerid][pComponent]);
    cache_get_value_name_float(0, "ppx", Float:pInfo[playerid][pPx]); 
    cache_get_value_name_float(0, "ppy", Float:pInfo[playerid][pPy]);
    cache_get_value_name_float(0, "ppz", Float:pInfo[playerid][pPz]);
    cache_get_value_name_float(0, "pmx", Float:pInfo[playerid][pMx]); 
    cache_get_value_name_float(0, "pmy", Float:pInfo[playerid][pMy]);
    cache_get_value_name_float(0, "pmz", Float:pInfo[playerid][pMz]);
    cache_get_value_name_float(0, "healthm1", Float:pInfo[playerid][pHealtM1]);
    cache_get_value_int(0, "tipemobil", pInfo[playerid][pTipeMobil]);

    printf("Vehicle ID %d has loaded while user %s connected", pInfo[playerid][pTipeMobil], pInfo[playerid][Nick]);
    return 1;
}

public OnPlayerSpawn(playerid)
{
    if(!IsValidVehicle(VehiclePlayerPrimary[playerid]))
    {
        VehiclePlayerPrimary[playerid] = AddStaticVehicle( pInfo[playerid][pTipeMobil], Float:pInfo[playerid][pMx], Float:pInfo[playerid][pMy], Float:pInfo[playerid][pMz], Float:0.0, -1, -1);
        SetVehicleVirtualWorld(VehiclePlayerPrimary[playerid], 0);
        LinkVehicleToInterior(VehiclePlayerPrimary[playerid], 0);
        SetVehicleHealth(VehiclePlayerPrimary[playerid], Float:pInfo[playerid][pHealtM1]);
        SendClientMessage(playerid, -1, "VEHICLE: Player vehicle has changed for health from SQL and spawned.");
    }
    else
    {
        SendClientMessage(playerid, -1, "VEHICLE: Player vehicle has valid and exist!");
    }

    if(IsPlayerInRangeOfPoint(playerid, Float:6, Float:pInfo[playerid][pMx], Float:pInfo[playerid][pMy], Float:pInfo[playerid][pMz]))
    { // if the player near his vehicle while spawn
        // Automatic enter vehicle sit ID 0
        
        PutPlayerInVehicle(playerid, VehiclePlayerPrimary[playerid], 0);

    }
  


    return 1;
    

    
}
// ini public penting sekali untuk gamemode.
// di public ini juga bisa untuk hapus tapi lebih baik saat player connect.
public OnGameModeInit()
{
    // example change flat doordynamic
	
	 
}


public OnPlayerEnterCheckpoint(playerid)
{
    

}


public OnPlayerDisconnect(playerid, reason)
{
    //pInfo[playerid][pTipeMobil] = GetVehicleModel(GetPlayerVehicleID(playerid));
    RemovePlayerAttachedObject(playerid, 1);
    RemovePlayerAttachedObject(playerid, 2);
    RemovePlayerAttachedObject(playerid, 3);


    new tekslogininformasi[200];
    format(tekslogininformasi, 200,"* "COL_RED"%s "COL_YELLOW"telah meninggalkan server dengan tenang namun ber IP %s dan beruang"COL_GREEN" %i Rupiah.",
    pInfo[playerid][Nick], pInfo[playerid][IP], pInfo[playerid][pMoney]);
    SendClientMessageToAll(COLOR_YELLOW, tekslogininformasi);
    // ini peenghapusan dari player yang punya ado dan ame
    // kondisi DC playernya
    DestroyDynamic3DTextLabel(ado[playerid]);
    DestroyDynamic3DTextLabel(ame[playerid]);
    amestatus[playerid] = 0;
    adostatus[playerid] = 0;

    

    GetPlayerPos(playerid, pInfo[playerid][pPx], pInfo[playerid][pPy], pInfo[playerid][pPz]);
              


    new Query[500];
    format(Query, 500, "UPDATE `playerdata` SET `ppx` = '%f',`ppy` = '%f',`ppz` = '%f',`money` = '%i' WHERE `id` = '%d' LIMIT 1",
    pInfo[playerid][pPx], pInfo[playerid][pPy], pInfo[playerid][pPz], pInfo[playerid][pMoney],
    pInfo[playerid][ID]);
    //mysql_query(MySQL:handle, const query[], bool:use_cache = true)
    mysql_query(MySQL:g_Sql, Query, bool:true);


    //new Float:mobilx, Float:mobily, Float:mobilz;
    //GetVehiclePos(vehicleid, Float:x, Float:y, Float:z)
    GetVehiclePos(VehiclePlayerPrimary[playerid], Float:pInfo[playerid][pMx], Float:pInfo[playerid][pMy], Float:pInfo[playerid][pMz]);

    //new teksposisimobil[100];
    //format(teksposisimobil, 100, "%f, %f, %f", mobilx, mobily, mobilz);
    //pInfo[playerid][pPosisiMobil] = teksposisimobil[99];



    pInfo[playerid][Mvw1] = GetVehicleVirtualWorld(VehiclePlayerPrimary[playerid]);

    new simpanpword[100];
    format(simpanpword, sizeof(simpanpword), "UPDATE `playerdata` SET `pword` = '%i', `vwm1` = '%i' WHERE `id` = '%d' LIMIT 1", pInfo[playerid][pWord], pInfo[playerid][Mvw1], pInfo[playerid][ID]);
    mysql_query(MySQL:g_Sql, simpanpword, bool:true);

    

    new simpanpinterior[100];
    format(simpanpinterior, sizeof(simpanpinterior), "UPDATE `playerdata` SET `pinterior` = '%i' WHERE `id` = '%d' LIMIT 1",pInfo[playerid][pInterior],pInfo[playerid][ID]);
    mysql_query(MySQL:g_Sql, simpanpinterior, bool:true);

    printf("Di tempat word %i di interior %i ",pInfo[playerid][pWord], pInfo[playerid][pInterior]);



    // ini untuk perintah kasi tau lokasi terakhir kendaraan
    new currentveh;
    currentveh = GetPlayerVehicleID(playerid);
 
    new Float:vehx, Float:vehy, Float:vehz;
    GetVehiclePos(currentveh, vehx, vehy, vehz);
 
    new vehpostext[96];
    format(vehpostext, sizeof(vehpostext), "The current vehicle positions are: %f, %f, %f", vehx, vehy, vehz);
 
    SendClientMessage(playerid, 0xFFFFFFFF, vehpostext);

    //================================================================================
    // this function for get vehicle data status value healt
    new Float:healthmp1; // variabel float for healt
    GetVehicleHealth(VehiclePlayerPrimary[playerid], Float:healthmp1); // with ID car player id get from player connect
     // saving to mysql
    format(Query, 500, "UPDATE `playerdata` SET `healthm1` = '%f' WHERE `id` = '%d' LIMIT 1", Float:healthmp1, pInfo[playerid][ID]);
    mysql_query(MySQL:g_Sql, Query, bool:true);
    
    printf("The vehicle from player %s, with %s in engine value %f was saved on MYSQL_TYPE_LONG", GetRPName(playerid), VehiclePlayerPrimary[playerid], Float:healthmp1);
    // information for console so the owner can be get notif instanly.

    //================================================================================

    format(simpanpinterior, sizeof(simpanpinterior), "UPDATE `playerdata` SET `healthm1` = '%f' WHERE `id` = '%d' LIMIT 1", Float:healthmp1,pInfo[playerid][ID]);
    mysql_query(MySQL:g_Sql, simpanpinterior, bool:true);

    printf("Health kendaraan %i yang tersimpan adalah %f ", VehiclePlayerPrimary[playerid], Float:healthmp1);
    SavePlayer(playerid);

    return 1;
}



//================== CMD LINE =============================


CMD:addtimeplayed(playerid, params[])
{
  new Hour, Minute, Second;

  if(sscanf(params, "diii", playerid, Hour, Minute, Second)) return SendClientMessage(playerid, COLOR_ERROR, "[USAGE]: /addtimeplayed [playerid hour minute second].");
          pInfo[playerid][pHours] = pInfo[playerid][pHours] + Hour; 
          //SendClientMessage(playerid, COLOR_LBLUE, Hour);
          pInfo[playerid][pMinutes] = strval(pInfo[playerid][pMinutes]) + Minute;
          //SendClientMessage(playerid, COLOR_LBLUE, Minute);
          pInfo[playerid][pSeconds] = strval(pInfo[playerid][pSeconds]) + Second;
          //SendClientMessage(playerid, COLOR_LBLUE, Second);
          
          
      
  new notif[200];
  format(notif, 200, ""COL_LGREEN"TIMEPLAYED:"COL_WHITE" Changed to new: "COL_LRED"%i Hours %i Minutes %i Second", pInfo[playerid][pHours], pInfo[playerid][pMinutes], pInfo[playerid][pSeconds]);
  SendClientMessage(playerid, COLOR_LBLUE, notif);

}


CMD:stats(playerid)
{
	new Float:x,Float:y,Float:z;
	new Float:facing, pekerjaan[50];
	new skinid = GetPlayerSkin(playerid);
	// ini untuk cmd /stats

	//pInfo[playerid][pJobMechanic] = 1; //percobaan ganti string

	if(pInfo[playerid][pJobMechanic] == 1)
	{
		pekerjaan = ""COL_LIGHTBLUE"Mechanic";
	}
	else
	{
		pekerjaan = ""COL_GREEN"Tamu Kota";
	}

    GetPlayerPos(playerid, x, y, z);
    GetPlayerFacingAngle(playerid, facing);

	new infokarakter[1000];
	format(infokarakter, 1000, "Bekerja : [ %s ]"COL_RWHITE" Virtuarl Word di angka : [ %d ]  Interior sekarang di angka : [ %d ] \n Anda pemilik %s terdaftar di kode %i \n kini telah merubah password menjadi "COL_RED"[ %s ] \n Skin ID yang di kenakan Adalah [ %d ] \n "COL_YELLOW"Kordinat sekarang ada di %f, %f, %f dan menghadap ke arah %f. \n Anda dalam status login (%i), "COL_WHITE"Time Played : [ "COL_BLUE"%d hours %d minutes %d seconds "COL_WHITE"]",
	pekerjaan, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid), pInfo[playerid][Nick], pInfo[playerid][ID], pInfo[playerid][PasswordAccount], skinid, x, y, z, facing, pInfo[playerid][Logged], pInfo[playerid][pHours], pInfo[playerid][pMinutes], pInfo[playerid][pSeconds] );
	ShowPlayerDialog(playerid, RESPONDDIALOGKOSONG, DIALOG_STYLE_MSGBOX, "Database Karakter", infokarakter, "Paham", "");

}

