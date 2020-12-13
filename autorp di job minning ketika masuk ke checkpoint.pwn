

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
#include <zcmd> // untuk membuat script command CMD
#include <gangzones.inc>

//#define _ALS_OnFilterScriptInit

 // untuk supaya bisa pake progress bar sekarang tahun. Progress Bar 2.0.3 tahun 2015
#include <a_mysql> // MySQL plugin R41-4
#include <YSI_Storage\y_ini>
#include <YSI_Data\y_iterate>
#include <progress2>
#include <foreach>// ini color khusus string yang tidak mendukung tanda kurung.

//#include <_ALS_OnFilterScriptInit>




//#define tabsize 0


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


#define GetPlayerData(%0,%1)    pInfo[%0][%1]
#define AddPlayerData(%0,%1,%2,%3) pInfo[%0][%1] %2= %3
#define GetPlayerMoneyEx(%0)    GetPlayerData(%0, pMoney)           // uang pemain

// ini kumpulan ID dialog yang akan respond
#define                     DIALOG_PROSSES_IKLAN                (16)
#define                     PILIHAN_LAMPU                       (12312)
#define                     RESPONDDIALOGKOSONG                 (543)
#define                     BUYTOYSCOP                          (10153)
#define                     BUYTOYSCOP2                         (10154)
#define                     BUYTOYSCOP3                         (10155)
#define                     MAX_PLAYERTOYS                      (8)

#define TOTAL_ITEMS         20000
#define SELECTION_ITEMS     21
#define ITEMS_PER_LINE      7

#define HEADER_TEXT "Objects"
#define NEXT_TEXT   "Next"
#define PREV_TEXT   "Prev"

#define COLOR_ME        0xC2A2DAFF
#define COLOR_ERROR     0xFF0000FF
#define COLOR_GREEN     0x008000FF
#define COLOR_AQUAGREEN     0x03D687FF
#define COLOR_RED 0xFF0000FF
#define COLOR_LIGHTRED 0xFF6347AA // 0xB33C3CAA
#define COLOR_LIGHTBLUE 0x33CCFFAA

#define COLOR_BLUE 0x1ED5C7FF
#define COLOR_YELLOW 0xFFFFFF00
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


#define DIALOG_BASE_X       75.0
#define DIALOG_BASE_Y       130.0
#define DIALOG_WIDTH        550.0
#define DIALOG_HEIGHT       180.0
#define SPRITE_DIM_X        60.0
#define SPRITE_DIM_Y        70.0


#define WHITE 0xFFFFFFFF


#define MAX_ADMIN_LEVEL 7
#define SETLEVEL_ADMIN 5


// untuk beli senjata

#define     AMMUNATION_SMGS_DIALOG      "\
Weapon\tAmount\tPrice\n\
{FFFFFF}MP5 PUTU\t90\t{FF0000}$3500\n\
{FFFFFF}Acer Predator\t1\t{FF0000}RP. 80.000.000\n\
{FFFFFF}Nvidia RTX\t2080\t{FF0000}RP. 15.000.000\n\
{FFFFFF}RAM 32GB\t2\tRP. 1.000.000\n\
{FFFFFF}Sawnoff\t5000\tRP. 100\n\
{FFFFFF}Pistol\t1000\tRP. 50\n\
{FFFFFF}M4\t1000\tRP. 100\n\
{FFFFFF}MP5\t750\tRP. 200\n\
{FFFFFF}Grenade\t500\tRP. 100\n\
{FFFFFF}Parachute\t1000\tRP. 1900\n\
{FFFFFF}Lorikeet\t5000\tRP. 500\n\
"


#define     PLAYERNEEDHELP_DIALOG   "\
Nama Player\tStatus\tPermohonan\n\
{FFFFFF}Andrew_Wizz\tButuh Pertolongan\t{FF0000}Ada yang bisa bantu sekarang?\n\
{FFFFFF}Wirko_Gangs\tCheater Detected\t{FF0000}Destoring Database of PlayerData\n\
{FFFFFF}Koplo_Koplak\tCheating\t{FF0000}Hacking Admin Status\n\
"

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


#define CITY_LOS_SANTOS     0
#define CITY_SAN_FIERRO     1
#define CITY_LAS_VENTURAS   2


#define DIALOG_GANTINAMA                36
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
    pLaparBar, // score of the player
    Float:pKecepatanKendaraan,
    pKendaraanDipakai,
    IP[16],
    pBoombox, // nilai integer bahwa ada kepemilikan boombox
    pFishingRod, // kalau dia sudah beli pancingan
    pWorms, // beli umpan.
    pComponent, // component setiap user untuk bahan upgrade kendaraan yang ada.
    pFishes,    // ikan yang sedang di bawa.
    Coba, // Storing the ip of the player
        Logged, // Players logged in or not variable
        IsRegistered //checks if the player is registered or not.
};

new pInfo[MAX_PLAYERS][PlayerInfo];

// mulai kerja sebagai minner
new KerjaMiningPickup, LokasiMining;

stock GivePlayerMoneyEx(playerid, money, description[]="None", bool:save=true, bool:game_text=true)
{
    if(money < 0 && GetPlayerMoneyEx(playerid) < money) return -1;

    new fmt_str[185];

    AddPlayerData(playerid, pMoney, +, money);
    GivePlayerMoney(playerid, money);

    /*
    format(fmt_str, sizeof fmt_str, "INSERT INTO money_log (uid,uip,time,money,description) VALUES (%d,'%s',%d,%d,'%s')", GetPlayerAccountID(playerid), GetPlayerIpEx(playerid), gettime(), money, description);
    mysql_query(mysql, fmt_str, false);

    if(save) save = false;

    format(fmt_str, sizeof fmt_str, "UPDATE accounts SET money=%d WHERE id=%d LIMIT 1", GetPlayerMoneyEx(playerid), GetPlayerAccountID(playerid));
    mysql_query(mysql, fmt_str, false);
    */

    if(game_text)
    {
        format(fmt_str, sizeof fmt_str, "%s$%d", money < 0 ? ("~r~") : ("~g~+"), money);
        GameTextForPlayer(playerid, fmt_str, 4000, 1);
    }

    return 1;
}

forward WaktuServer(playerid, closestcar);
public WaktuServer(playerid, closestcar)
{
    
    if(IsPlayerInRangeOfPoint(playerid, Float:15.0, 2152.647216, -1735.895996, 17.400230))
    { 
        MoveDynamicObject(PintuGarasiMechanic, 2152.647216, -1735.895996, 17.400230, Float:2.0,  0.000000, 85.000000, 90.000000);
        // ketika pintu garasi di buka
        if(IsPlayerInAnyVehicle(playerid))
        {
            ToggleHood(GetPlayerVehicleID(playerid), VEHICLE_PARAMS_ON);
        }
        MoveDynamicObject(DongkratMobilMechanic, 2151.989501, -1729.435058, 11.610030+1, Float:0.01, 0.000000, 0.000000, 0.000000);
        // ini dongkrak di naikkan
        MoveDynamicObject(PeneranganMobilMechanic, 2152.0371,-1726.3260,12.9692, Float:0.01, 0.0000,0.0000,4.8428);
        
        //cmd_makan(playerid);
    }
    else

    {
        MoveDynamicObject(PintuGarasiMechanic, 2152.632812, -1733.791625, 14.466965, Float:2.0,  0.599999, 0.899998, 89.599990);
        
        // ini kalau pintu sudah di tutup.
        
        MoveDynamicObject(DongkratMobilMechanic, 2151.9052,-1729.4147,10.7400, Float:0.1,  0.0000,0.9000,0.7433);
        // ini dongkrak di turunkan

        MoveDynamicObject(PeneranganMobilMechanic, 2156.474121, -1734.285278, 12.558380, Float:1.0, 0.000000, 0.000000, 0.000000);
        
    }

    if(IsPlayerInAnyVehicle(playerid))
    {
        new Float:health;
        new vehicleid = GetPlayerVehicleID(playerid);
        GetVehicleHealth(vehicleid, Float:health);
        if(health < 350 )
        {
            if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
            {
                ToggleEngine(vehicleid, VEHICLE_PARAMS_OFF);
                GameTextForPlayer(playerid, "Mesin Mobil Rusak Parah\nHubungi Mechanic Segera", 200, 5);
                PlayerPlaySound(playerid, 1100, 0.0, 0.0, 0.0);
                ToggleHood(vehicleid, VEHICLE_PARAMS_ON);
                cmd_makan(playerid);
                // mesin rusak ketika 350 health
            }
            
        }
    }


    if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 416)
    {
        // pemulihan saat di dalam ambulance
        if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER)
        {
            new Float:HP;
            GetPlayerHealth(playerid, Float:HP);
            SetPlayerHealth(playerid, Float:HP+2);
            GameTextForPlayer(playerid, "Tuan anda sedang di rawat di dalam ambulance.", 500, 5);
            ApplyAnimation(playerid, "CRACK", "crckdeth2",4.0,0,0,0,0,0);
            //SendClientMessage(playerid, COLOR_AQUAGREEN, "* Tuan anda sedang di rawat di dalam ambulance.");
            
            if(HP > 99)
            {
                RemovePlayerFromVehicle(playerid);
                SendClientMessage(playerid, COLOR_AQUAGREEN, "* Tuan anda sembuh dan perawatan berhasil di akhiri.");
                GameTextForPlayer(playerid, "~r~-500", 2000, 6);
            }
        }
    }



    static warna = 0;
    new str[32];
    if(warna == 5) format(str, sizeof(str), "~p~DuniaPutu Corp."), warna = 0;
    if(warna == 4) format(str, sizeof(str), "~y~DuniaPutu Corp."), warna = 5;
    if(warna == 3) format(str, sizeof(str), "~g~DuniaPutu Corp."), warna = 4;
    if(warna == 2) format(str, sizeof(str), "~w~DuniaPutu Corp."), warna = 0; // warna jadi biru saja
    if(warna == 1) format(str, sizeof(str), "~r~DuniaPutu Corp."), warna = 2;
    if(warna == 0) format(str, sizeof(str), "~b~DuniaPutu Corp."), warna = 1;
    TextDrawSetString(UI[0], str);


    new
        string[800],
        month[12],
        date[6];
 
    getdate(date[2], date[1], date[0]);
    gettime(date[3], date[4], date[5]);
 
    switch (date[1]) {
        case 1: month = "Jan";
        case 2: month = "Feb";
        case 3: month = "Mar";
        case 4: month = "Apr";
        case 5: month = "Mei";
        case 6: month = "Jun";
        case 7: month = "Jul";
        case 8: month = "Agt";
        case 9: month = "Sep";
        case 10: month = "Oktober";
        case 11: month = "Nov";
        case 12: month = "Des";
    }
    format(string, sizeof string, "%02d:%02d:%02d", date[3], date[4], date[5]);//jam
    TextDrawSetString(UI[1], string);

    // mengatur jam seperti di realtime ooc
    SetPlayerTime(playerid, date[3], date[4]);

    format(string, sizeof string, "%02d, %s, %d", date[0],month,date[2]);//TGL
    TextDrawSetString(UI[2], string);

    // update data panel kecepatan kendaraan
    new vehicleid = GetPlayerVehicleID(playerid);
    new tekskecepatan[100];
  
    format(tekskecepatan, sizeof(tekskecepatan), "ID Kendaraan %i\nKecepatan : %i KM/h",vehicleid, GetPlayerSpeed(playerid, true));
    TextDrawSetString(Text:panelkecepatankendaraan, tekskecepatan);

    //tambahan sering berkurang energynya
    new Float:NilaiLapar = Float:GetPlayerProgressBarValue(playerid, PlayerBar:pInfo[playerid][pLaparBar]) - Float:0.01;

    SetPlayerProgressBarValue(playerid, PlayerBar:pInfo[playerid][pLaparBar], Float:NilaiLapar);
    //untuk set warna bar dari setiap nilai bar
    if(Float:NilaiLapar > 70.00)
    {
        return SetPlayerProgressBarColour(playerid, PlayerBar:pInfo[playerid][pLaparBar], COLOR_GREEN);
    }
    else if(Float:NilaiLapar > 25.00)
    {
        return SetPlayerProgressBarColour(playerid, PlayerBar:pInfo[playerid][pLaparBar], COLOR_YELLOW);
    }
    if(Float:NilaiLapar < 25.00)
    {
        return SetPlayerProgressBarColour(playerid, PlayerBar:pInfo[playerid][pLaparBar], COLOR_RED);
        TextDrawShowForPlayer(playerid, Text:LayarJadiMerah);
        SetPlayerDrunkLevel(playerid, 99999);
        SetTimer("HilangkanLayarWarnaMerah", 6000, 0);
    }

    // usir pencuri sepeda sewaan
    if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 510)
    {
        if(GetPlayerVehicleID(playerid) != sepedasewaan[playerid])
        {
            RemovePlayerFromVehicle(playerid);
            
            SendClientMessage(playerid, COLOR_AQUAGREEN, "* Manager rental : Anda tidak berhak menggunakan sewaan orang lain");
    
        }
    }

    // usir pencuri sepeda sewaan
    if(IsPlayerInRangeOfPoint(playerid, Float:130.0, Float:-1712.7421,Float:969.1401,Float:26.0941))
    {
        // player masuk ke sebuah green zone rumah sakit
        TextDrawShowForPlayer(playerid, Text:TeksInfoGreenZone);
    }
    else
    {

        TextDrawHideForPlayer(playerid, Text:TeksInfoGreenZone);
    }


    

}

// on player connect tempat paling bagus menghapus segala object yang di tambah ataupun yang ada.

public OnPlayerConnect(playerid)
{   
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
 

    new passworddariuser[500];
    format(passworddariuser, 500, "SELECT * FROM `playerdata` WHERE `nick` COLLATE latin1_general_cs = '%s' LIMIT 1", pInfo[playerid][Nick]); // now here check the database if the player has given the proper password.HTTP
    mysql_query(MySQL:g_Sql, passworddariuser, bool:true);

    
    cache_get_value_int(0, "id", pInfo[playerid][ID]); 
    cache_get_value_name(0, "password", pInfo[playerid][Sandi], 50);
    cache_get_value_name(0, "UCP", pInfo[playerid][UCP], 20);
    cache_get_value_int(0, "JobMechanic", pInfo[playerid][pJobMechanic]);
    cache_get_value_int(0, "component", pInfo[playerid][pComponent]);
    return 1;
}

// ini public penting sekali untuk gamemode.
// di public ini juga bisa untuk hapus tapi lebih baik saat player connect.
public OnGameModeInit()
{
  

    // load teks draw nama server dan waktu server
    
    SetTimer("WaktuServer", 500, true);
    SetTimer("GantiWarna",  5000, true);

    // membuat pekerjaan mining auto rp
    // 
    
    KerjaMiningPickup = CreatePickup(18634, 1, -1698.4553,883.7368,24.8906,0);
    CreateDynamic3DTextLabel("Tulis /kerja\nuntuk bekerja disini.\n sebagai minner", -1, 2122.7329,-1738.5591,13.5644, Float:5.0);

 
}


public OnPlayerEnterCheckpoint(playerid)
{
    if(IsPlayerInCheckpoint(playerid) == LokasiMining)
    {
        ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.1, 0, 1, 1, 1, 1, 1);
        new string[140];
        format(string, sizeof(string), "* %s menggali di antara bebatuan dengan menggunakan palu.", GetRPName(playerid));
        LocalMessage(ACTION_DISTANCE, playerid, ACTION_COLOR, string);
        format(string, sizeof(string), "* Terlihat ada bongkahan logam yang siap di tambang. (( %s ))", GetRPName(playerid));
        LocalMessage(ACTION_DISTANCE, playerid, ACTION_COLOR, string);
        RemovePlayerAttachedObject(playerid, 4);
        DisablePlayerCheckpoint(playerid);

    }
    

}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    if(StatusCrateTerangkat == true)
    {
        if (!HOLDING (KEY_WALK))
        {
            PlayerPlaySound(playerid, 1151, 0.0, 0.0, 10.0);
            //ApplyAnimation(playerid, "MISC", "Idle_Chat_02", 4.1, 0, 0, 0, 0, 0, 0);
            ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.1, 0, 0, 0, 1, 1, 1);
            GameTextForPlayer(playerid, "~r~Tahan Tombol ~n~ALT kiri", 2000, 1);
        }
        if (HOLDING (KEY_WALK))
        {
            PlayerPlaySound(playerid, 1152, 0.0, 0.0, 10.0);
            //ApplyAnimation(playerid, "MISC", "Idle_Chat_02", 4.1, 0, 0, 0, 0, 0, 0);
            //ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.1, 0, 0, 0, 0, 1, 1);
            GameTextForPlayer(playerid, "~g~Bawalah dengan perlahan", 1000, 1);
        }
        if (PRESSED (KEY_JUMP))
        {
            PlayerPlaySound(playerid, 1150, 0.0, 0.0, 10.0);
            //ApplyAnimation(playerid, "MISC", "Idle_Chat_02", 4.1, 0, 0, 0, 0, 0, 0);
            ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.1, 1, 1, 1, 1, 1, 1);
        }
    }
}

CMD:kerja(playerid)
{
    SetPlayerArmedWeapon(playerid, 0);
    GangZoneHideForPlayer(playerid, BlackRadar);

    if(GetPlayerVirtualWorld(playerid) == 0)
    {
        if(GetPlayerInterior(playerid) == 0)
        {

            if(IsPlayerInRangeOfPoint(playerid, Float:3.0, 2122.7329,-1738.5591,13.5644))// mau kerja minner
            {
                SendClientMessage(playerid,COLOR_YELLOW,"Anda dapat ke cekpoint untuk mulai kerja minner.");
                LokasiMining = SetPlayerCheckpoint(playerid, 2116.5764,-1726.5281,15.0132, Float:1.0);
                SetPlayerAttachedObject(playerid, 4, 18634, 6, 0.07, 0.03, 0.04, 0.0, 270.0, 270.0, 1.5, 2.1, 1.8, 0); // attachment linggis untuk minner
                PlayerPlaySound(playerid, 1221, 0.0, 0.0, 10.0);
            }
        }
    }
}

