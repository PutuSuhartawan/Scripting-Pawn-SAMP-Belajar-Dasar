
//DEFINES
#define YSI_NO_OPTIMISATION_MESSAGE
#define YSI_NO_VERSION_CHECKa
#define YSI_NO_CACHE_MESSAGE
#define YSI_NO_MODE_CACHE
#if !defined isnull
    #define isnull(%1) ((!(%1[0])) || (((%1[0]) == '\1') && (!(%1[1]))))
#endif
#define MAX_DIALOG_ITEMS 				(512 + 1)

//INCLUDES


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
//#include <dini2> // ini simpan data dari player
#include <sprintf>
 //important for timer set
#include <streamer>
#include "../include/gl_messages.inc"
#include <core>
#include <float>
#include "../include/gl_spawns.inc"
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
#include <YSI_Storage\y_ini>
#include <YSI_Data\y_iterate>
#include <progress2>
#include <foreach>// ini color khusus string yang tidak mendukung tanda kurung.


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


#define GetPlayerData(%0,%1) 	pInfo[%0][%1]
#define AddPlayerData(%0,%1,%2,%3) pInfo[%0][%1] %2= %3
#define GetPlayerMoneyEx(%0)	GetPlayerData(%0, pMoney) 			// uang pemain

// a code define all dialog respond
#define 					DIALOG_INPUT_BID_AUCTION			(13)
#define 					DIALOG_ACCEPT_AUCTION				(14)
#define 					DIALOG_INPUT_offerINGAUCTION			(15)
#define 					DIALOG_PROSSES_IKLAN 				(16)
#define 					DIALOG_GANTI_PW 					(17)
#define 					PILIHAN_LAMPU						(12312)
#define                     RESPONDDIALOGKOSONG					(543)
#define						BUYTOYSCOP 					 		(10153)
#define						BUYTOYSCOP2 					 	(10154)
#define						BUYTOYSCOP3 					 	(10155)
#define 					MAX_PLAYERTOYS 						(8)

#define TOTAL_ITEMS         20000
#define SELECTION_ITEMS 	21
#define ITEMS_PER_LINE  	7


#define COLOR_ME 		0xC2A2DAFF
#define COLOR_ERROR 	0xFF0000FF
#define COLOR_GREEN 	0x008000FF
#define COLOR_AQUAGREEN   	0x03D687FF
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


#define DIALOG_BASE_X   	75.0
#define DIALOG_BASE_Y   	130.0
#define DIALOG_WIDTH    	550.0
#define DIALOG_HEIGHT   	180.0
#define SPRITE_DIM_X    	60.0
#define SPRITE_DIM_Y    	70.0


#define WHITE 0xFFFFFFFF


#define MAX_ADMIN_LEVEL 7
#define SETLEVEL_ADMIN 5




#define HOLDING(%0) \
	((newkeys & (%0)) == (%0))


#define PRESSED(%0) \
    (((newkeys & (%0)) == (%0)) && ((oldkeys & (%0)) != (%0)))
    
#define RELEASED(%0) \
    (((newkeys & (%0)) == (%0)) && ((oldkeys & (%0)) != (%0)))


#define dcmd(%1,%2,%3) if (!strcmp((%3)[1], #%1, true, (%2)) && ((((%3)[(%2) + 1] == '\0') && (dcmd_%1(playerid, ""))) || (((%3)[(%2) + 1] == ' ') && (dcmd_%1(playerid, (%3)[(%2) + 2]))))) return 1



#define DropPlayerWeapons 42
#define ResetPlayerWeapons 42


#define PindahinOrangnya    SetPlayerPos


#define CITY_LOS_SANTOS 	0
#define CITY_SAN_FIERRO 	1
#define CITY_LAS_VENTURAS 	2


#define DIALOG_GANTINAMA				36
#define DIALOG_ATTACH_INDEX             13500
#define DIALOG_ATTACH_INDEX_SELECTION   DIALOG_ATTACH_INDEX+1
#define DIALOG_ATTACH_EDITREPLACE       DIALOG_ATTACH_INDEX+2
#define DIALOG_ATTACH_MODEL_SELECTION   DIALOG_ATTACH_INDEX+3
#define DIALOG_ATTACH_BONE_SELECTION    DIALOG_ATTACH_INDEX+4

#define BOOST_VEL 1.1 //Aceleration speed. (It must be at least at 1.1, else it will decrease the car speed)
#define MAX_KPH 360 //Ma


// ini untuk menjelaskan variabel baru mysql

#define mysql_fetch_string(%0,%1) cache_get_field_count(%0,%1)
#define mysql_stat(%0,%1) cache_get_field_count(%0,field); \%1=strval(field)

#define mysql_fetch_float(%0,%1) cache_get_field_count(%0,field); \
%1=floatstr(field)
#define mysql_fetch_string(%0,%1) cache_get_field_count(%0,%1)
#define mysql_stat(%0,%1) cache_get_field_count(%0,field); \%1=strval(field)



#define SQL_HOST "localhost" //your destination server
#define SQL_USER "pma" //default user name of wampserver
#define SQL_PASS "" //wampserver has no default password unless you have set one.
#define SQL_DB "putu"//the name of your database






//new main( ) { }

forward WaktuServer(playerid, closestcar);
forward UnFreezeMe();
forward ShowTestDialog();
forward TimedVehicleDeath();
forward UpdateTextTimer();
forward KembalikanMobilPedagangMakanan();



enum PlayerInfo
{
    ID, // id of the player
    Nick[24],
    Sandi[20], // name of the player
    UCP[20], // merukapak variabel enum untuk nama UCP ketika duty admin
    pAdmin, // admin level of the player
    pSkin,
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
    IP[16],
    pBoombox, // nilai integer bahwa ada kepemilikan boombox
    pFishingRod, // kalau dia sudah beli pancingan
    pWorms,	// beli umpan.
    pComponent, // component setiap user untuk bahan upgrade kendaraan yang ada.
    pFishes,	// ikan yang sedang di bawa.
    Coba, // Storing the ip of the player
        Logged, // Players logged in or not variable
        IsRegistered //checks if the player is registered or not.
};

new pInfo[MAX_PLAYERS][PlayerInfo];


// this variabel for vehicle exmpale one slot
new VehiclePlayerPrimary[MAX_PLAYERS], AktifkanLimitSpeed[MAX_PLAYERS]; // get the slot vehicle with limit speed



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

    SetSpawnInfo(0, 0, 0, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 0, 0);
   
    //InterpolateCameraPos(playerid, Float:FromX, Float:FromY, Float:FromZ, Float:ToX, Float:ToY, Float:ToZ, time, cut = CAMERA_CUT)
    InterpolateCameraPos(playerid,  Float:1584.7772, Float:-2155.6304, Float:13.8035, Float:1544.4404, Float:-2281.2668, Float:13.3828, 17000, CAMERA_MOVE); 
    //InterpolateCameraLookAt(playerid, Float:FromX, Float:FromY, Float:FromZ, Float:ToX, Float:ToY, Float:ToZ, time, cut = CAMERA_CUT)
    InterpolateCameraLookAt(playerid,  Float:1584.7772, Float:-2155.6304, Float:13.8035, Float:1494.7446, Float:-2293.4832, Float:18.2991, CAMERA_MOVE);
    
    
    



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



CMD:savemyvehhealt(playerid, params)
{
    GetPlayerPos(playerid, pInfo[playerid][pPx], pInfo[playerid][pPy], pInfo[playerid][pPz]);

    
    //mysql_query(MySQL:handle, const query[], bool:use_cache = true)
    mysql_query(MySQL:g_Sql, "SELECT * FROM `playerdata` ORDER BY `playerdata`.`id` ASC", bool:true);

    new Query[500];
    format(Query, 500, "UPDATE `playerdata` SET `ppx` = '%f',`ppy` = '%f',`ppz` = '%f' WHERE `id` = '%d' LIMIT 1",
    pInfo[playerid][pPx], pInfo[playerid][pPy], pInfo[playerid][pPz],
    pInfo[playerid][ID]);
    mysql_query(MySQL:g_Sql, Query, bool:true);
    
    //================================================================================
    // this function for get vehicle data status value healt
    new Float:healthmp1; // variabel float for healt
    GetVehicleHealth(VehiclePlayerPrimary[playerid], Float:healthmp1); // with ID car player id get from player connect
    // saving to mysql
    format(Query, 500, "UPDATE `playerdata` SET `healthm1` = '%f' WHERE `id` = '%d' LIMIT 1", Float:healthmp1, pInfo[playerid][ID]);
    mysql_query(MySQL:g_Sql, Query, bool:true);
    // notit to the SAMP server console
    printf("The vehicle from player %s, with %s in engine value %f was saved on MYSQL_TYPE_LONG", GetRPName(playerid), VehiclePlayerPrimary[playerid], Float:healthmp1);
    // information for console so the owner can be get notif instanly.

    //================================================================================

    new SaveThePlayerPosition[500];
    format(SaveThePlayerPosition, 500, "SAVED: New position for: %f, %f, %f", pInfo[playerid][pPx], pInfo[playerid][pPy], pInfo[playerid][pPz] );
    SendClientMessage(playerid, -1, SaveThePlayerPosition);
    SavePlayer(playerid);

    pInfo[playerid][pWord] = GetPlayerVirtualWorld(playerid);
    new SaveWordPlayerPosition[200];
    format(SaveWordPlayerPosition, 200, "UPDATE `playerdata` SET `pword` = '%i' WHERE `id` = '%d' LIMIT 1",pInfo[playerid][pWord],pInfo[playerid][ID]);
    mysql_query(MySQL:g_Sql, SaveWordPlayerPosition, bool:true);

    pInfo[playerid][pInterior] = GetPlayerInterior(playerid);
    new SaveInteriorPlayerPosition[200];
    format(SaveInteriorPlayerPosition, 200, "UPDATE `playerdata` SET `pinterior` = '%i' WHERE `id` = '%d' LIMIT 1",pInfo[playerid][pInterior],pInfo[playerid][ID]);
    mysql_query(MySQL:g_Sql, SaveInteriorPlayerPosition, bool:true);

    printf("SAVED: Player Word %i and interior %i from %s", pInfo[playerid][pWord], pInfo[playerid][pInterior], GetRPName(playerid));


    //GetVehiclePos(vehicleid, Float:x, Float:y, Float:z)
    GetVehiclePos(VehiclePlayerPrimary[playerid], Float:pInfo[playerid][pMx], Float:pInfo[playerid][pMy], Float:pInfo[playerid][pMz]);

    new kordinatmobil[500];
    format(kordinatmobil, 500, "UPDATE `playerdata` SET `pmx` = '%f',`pmy` = '%f',`pmz` = '%f' WHERE `id` = '%d' LIMIT 1", Float:pInfo[playerid][pMx], Float:pInfo[playerid][pMy], Float:pInfo[playerid][pMz], pInfo[playerid][ID]);
    mysql_query(MySQL:g_Sql, kordinatmobil, bool:true);
    printf("SAVED: New vehicle position on %f, %f, %f has owned bye ID %i", Float:pInfo[playerid][pMx], Float:pInfo[playerid][pMy], Float:pInfo[playerid][pMz], pInfo[playerid][ID]);
    
    return 1;
}



CMD:setvehhealth(playerid, params[])
{
    extract params -> new Float:health;
    new vehicleid = GetClosestCar(playerid, INVALID_VEHICLE_ID);
    SetVehicleHealth(vehicleid, Float:health);


    //================================================================================
    // this function for get vehicle data status value healt
    new Float:healthmp1; // variabel float for healt
    GetVehicleHealth(VehiclePlayerPrimary[playerid], Float:healthmp1); // with ID car player id get from player connect
    if(vehicleid == VehiclePlayerPrimary[playerid])
    {
        new Query[500];
        // saving to mysql
        format(Query, 500, "UPDATE `playerdata` SET `healthm1` = '%f' WHERE `id` = '%d' LIMIT 1", Float:healthmp1, pInfo[playerid][ID]);
        mysql_query(MySQL:g_Sql, Query, bool:true);
        // notit to the SAMP server console
        printf("The vehicle from player %s, with %s in engine value %f was saved on MYSQL_TYPE_LONG", GetRPName(playerid), VehiclePlayerPrimary[playerid], Float:healthmp1);
        // information for console so the owner can be get notif instanly.
        SendClientMessage(playerid, -1, "ENGINE: Your vehicle health of engine saved on SQL data");

    }
    
    //================================================================================

    if(IsPlayerInAnyVehicle(playerid))
    {
        
        SendClientMessage(playerid, -1, "ENGINE: Your changed the vehicle healt from inside");
        return 1;
    }
    else return GameTextForPlayer(playerid, "ENGINE: Your changed the vehicle healt from outside", 5000, 4);
}

