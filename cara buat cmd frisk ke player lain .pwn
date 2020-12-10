

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
new Player_Frisk[MAX_PLAYERS], friskInvited[MAX_PLAYERS], friskApproved[MAX_PLAYERS]; // variabel yang di butuhkan saat frisk korban.

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


CMD:frisk(playerid, params[])
{
    // saat melakukan frisk ke orang lain
    new str[256];
    new string[256];
    new id, i;
    new Float:X, Float:Y, Float:Z;
    new Player_Weapons[13];
    new Player_Ammos[13];
    //GetPlayerName(playerid, IDPlayerYangFrisk, 20); 

    if(sscanf(params, "u", id)) return SendClientMessage(playerid, COLOR_ERROR, "[Usage:] /frisk [playerid/partofname].");
    GetPlayerPos(id, X, Y, Z);
    if(friskApproved[playerid] == false)
    {
        if(IsPlayerInRangeOfPoint(playerid, 10.0, X, Y, Z))
        {
            friskInvited[id] = true;
            Player_Frisk[id] = playerid;
            format(str, sizeof(str), "Your frisk request has been sent to %s.", GetRPName(id));
            SendClientMessage(playerid, COLOR_YELLOW, str);
            format(str, sizeof(str), "%s has requested to frisk you, /acceptfrisk %d.", GetRPName(playerid), playerid);
            SendClientMessage(id, COLOR_YELLOW, str);
        } else return SendClientMessage(playerid, COLOR_LIGHTRED, "You're not close to that player.");
    }
    else if(friskApproved[playerid] == true)
    {
        if(friskApproved[id] == false) return SendClientMessage(playerid, COLOR_LIGHTRED, "That player has not accepted to be frisked.");
        format(string, sizeof(string), "____________[%s]____________", GetRPName(id));
        SendClientMessage(playerid, COLOR_WHITE, string);
        GetPlayerPos(id, X, Y, Z);
        if(IsPlayerInRangeOfPoint(playerid, 10.0, X, Y, Z))
        {
            for(i = 1;i <= 12;i++)
            {
                GetPlayerWeaponData(id, i, Player_Weapons[i], Player_Ammos[i]);
                if(Player_Weapons[i] != 0 && Player_Ammos[i] != 0)
                {
                    new weaponName[128];
                    GetWeaponName(Player_Weapons[i], weaponName, 128);
                    format(string, 255, "Weapon Name: %s | Weapon Ammo: %d", weaponName, Player_Ammos[i]);
                    SendClientMessage(playerid, -1, string);
                }
            }
            format(string, 255, "Money: $%d", GetPlayerMoney(id));
            SendClientMessage(playerid, -1, string);
            format(string, 255, "Alat Boombox: %d Mesin | Alat Pancingan: Kekuatan %d | Umpan Ikan: %d Cacing | Component Mekanik: %d Bahan | Ikan segar: %dg ", pInfo[id][pBoombox], pInfo[id][pFishingRod], pInfo[id][pWorms], pInfo[id][pComponent], pInfo[id][pFishes]);
            SendClientMessage(playerid, -1, string);
            friskApproved[Player_Frisk[playerid]] = false;
            friskApproved[playerid] = false;
        } else return SendClientMessage(playerid, COLOR_LIGHTRED, "You're not close to that player.");
    }
    return 1;
}

CMD:acceptfrisk(playerid, params[])
{
    new str[256];
    new id;
    
    if(sscanf(params, "u", id)) return SendClientMessage(playerid, COLOR_LIGHTRED, "[Usage:] /acceptfrisk [playerid/partofname].");
    if(friskInvited[playerid] == false) return SendClientMessage(playerid, COLOR_LIGHTRED, "You do not have a pending frisk request.");
    if(id != Player_Frisk[playerid]) return SendClientMessage(playerid, COLOR_LIGHTRED, "That player has not sent you a frisk request.");

    friskApproved[Player_Frisk[playerid]] = true;
    friskApproved[playerid] = true;
    friskInvited[playerid] = false;
    
    format(str, sizeof(str), "You have accepted %s to frisk you.", GetRPName(Player_Frisk[playerid]));
    SendClientMessage(id, COLOR_YELLOW, str);
    
    format(str, sizeof(str), "%s has accepted your frisk request.", GetRPName(playerid));
    SendClientMessage(Player_Frisk[playerid], COLOR_YELLOW, str);

    
    new string[256],i;
    new Player_Weapons[13];
    new Player_Ammos[13];


    format(string, sizeof(string), "____________[%s]____________", GetRPName(playerid));
    SendClientMessage(Player_Frisk[playerid], COLOR_WHITE, string);
    
    for(i = 1;i <= 12;i++)
    {
        GetPlayerWeaponData(playerid, i, Player_Weapons[i], Player_Ammos[i]);
        if(Player_Weapons[i] != 0 && Player_Ammos[i] != 0)
        {
            new weaponName[128];
            GetWeaponName(Player_Weapons[i], weaponName, 128);
            format(string, 255, "Weapon Name: %s | Weapon Ammo: %d", weaponName, Player_Ammos[i]);
            SendClientMessage(Player_Frisk[playerid], -1, string);
        }
    }
    format(string, 255, "Money: $%d", GetPlayerMoney(playerid));
    SendClientMessage(Player_Frisk[playerid], -1, string);
    format(string, 255, "Alat Boombox: %d Mesin | Alat Pancingan: Kekuatan %d | Umpan Ikan: %d Cacing | Component Mekanik: %d Bahan | Ikan segar: %dg ", pInfo[playerid][pBoombox], pInfo[playerid][pFishingRod], pInfo[playerid][pWorms], pInfo[playerid][pComponent], pInfo[playerid][pFishes]);
    SendClientMessage(Player_Frisk[playerid], -1, string);
    


    return 1;
}
