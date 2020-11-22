
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
    pFishes,    // ikan yang sedang di bawa.
    Coba, // Storing the ip of the player
        Logged, // Players logged in or not variable
        IsRegistered //checks if the player is registered or not.
};

new pInfo[MAX_PLAYERS][PlayerInfo];


stock ToggleHood(vehicleid, toggle)
{
    GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
    SetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, toggle, boot, objective);
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
    return 1;
}

CMD:hood(playerid, params[])
{
    new closestcar = GetClosestCar(playerid, INVALID_VEHICLE_ID);
    if(isnull(params)) return SendClientMessage(playerid, COLOR_LIGHTRED, "[Usage:] /hood [buka/tutup]");
    if(!strcmp(params, "buka", true))
    {
            ToggleHood(closestcar, VEHICLE_PARAMS_ON);
    }
    if(!strcmp(params, "tutup", true))
    {
            ToggleHood(closestcar, VEHICLE_PARAMS_OFF);
    }

    
    return 1;
}


CMD:joinjob(playerid, params[])
{
    
    if(isnull(params)) return SendClientMessage(playerid, COLOR_LIGHTRED, "[Usage:] /joinjob [mechanic/turis/polisi]");
    if(!strcmp(params, "mechanic", true))
    {
        if(IsPlayerInRangeOfPoint(playerid, Float:4.0, 2141.9475,-1728.9771,13.5592))
        {
            if(pInfo[playerid][pJobMechanic] == 1)
            {
                GameTextForPlayer(playerid, "Anda sudah mendaftar mechanic sebelumnya", 5000, 5);
            }
            else
            {
                pInfo[playerid][pJobMechanic] = 1;
                SendClientMessage(playerid, -1, "* Anda join sebagai mechanic");

                new Query[500];
                format(Query, 500, "UPDATE `playerdata` SET `JobMechanic` = '%i' WHERE `id` = '%d' LIMIT 1",
                pInfo[playerid][pJobMechanic],
                pInfo[playerid][ID]);

                mysql_query(MySQL:g_Sql,Query, bool:true);

                GameTextForPlayer(playerid, "Selamat Bekerja Sebagai Mechanic", 5000, 1);
            }
        }
        

    }
    
    return 1;

}

CMD:quitjob(playerid, params[])
{
    
    if(isnull(params)) return SendClientMessage(playerid, COLOR_LIGHTRED, "[Usage:] /joinjob [mechanic/turis/polisi]");
    if(!strcmp(params, "mechanic", true))
    {
        if(IsPlayerInRangeOfPoint(playerid, Float:4.0, 2141.9475,-1728.9771,13.5592))
        {
            if(pInfo[playerid][pJobMechanic] == 1)
            {
                GameTextForPlayer(playerid, "Anda kini sudah bukan staff mechanic lagi", 5000, 6);
                pInfo[playerid][pJobMechanic] = 0;

                new Query[500];
                format(Query, 500, "UPDATE `playerdata` SET `JobMechanic` = '%i' WHERE `id` = '%d' LIMIT 1",
                pInfo[playerid][pJobMechanic],
                pInfo[playerid][ID]);

                mysql_query(MySQL:g_Sql,Query, bool:true);

            }
            
        }
        

    }
    
    return 1;

}


CMD:setvehhealth(playerid, params[])
{
    extract params -> new Float:health;
    new vehicleid = GetClosestCar(playerid, INVALID_VEHICLE_ID);
    SetVehicleHealth(vehicleid, Float:health);
    if(IsPlayerInAnyVehicle(playerid))
    {
        
        SendClientMessage(playerid, -1, "Kesehatan mesin di rubah");
    }
    else return GameTextForPlayer(playerid, "Anda memperbaiki dari luar mobil", 5000, 4);
}



new DutyMechanic[MAX_PLAYERS];

CMD:jobduty(playerid)
{
    //pInfo[playerid][pJobMechanic] = 1;
    if(pInfo[playerid][pJobMechanic] == 1)
    {
        if(DutyMechanic[playerid] == 0)
        {
            SetPlayerColor(playerid, COLOR_LGREEN);
            SendClientMessage(playerid, -1, "* Anda on duty sebagai mechanic");
            DutyMechanic[playerid] = 1;
            new ObjKunciInggris = SetPlayerAttachedObject(playerid, 0, 19627, 6, 0.079376, 0.037070, 0.007706, 181.482910, 0.000000, 0.000000, 1.000000, 1.000000, 1.000000);
            SetPlayerSkin(playerid, 122);
            GameTextForPlayer(playerid, "Anda Mekanik", 5000, 1);
        }
        else if(DutyMechanic[playerid] == 1)
        {
            DutyMechanic[playerid] = 0;
            SendClientMessage(playerid, -1, "* Anda off duty sebagai mechanic");
            SetPlayerColor(playerid, COLOR_WHITE);
            RemovePlayerAttachedObject(playerid, 0);
            SetPlayerSkin(playerid, pInfo[playerid][pSkin]);
            GameTextForPlayer(playerid, "Off duty Mekanik", 5000, 1);
        }
    }
    if(pInfo[playerid][pJobMechanic] == 0)
    {
        GameTextForPlayer(playerid, "Anda harus join mechanic terlebih dulu", 5000, 3);
    }

    return 1;
}
