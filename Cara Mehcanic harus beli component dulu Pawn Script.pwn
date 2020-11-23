
#include <a_samp> //
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
    pComponent, // component setiap user untuk bahan upgrade kendaraan yang ada.
    pFishes,    // ikan yang sedang di bawa.
    Coba, // Storing the ip of the player
        Logged, // Players logged in or not variable
        IsRegistered //checks if the player is registered or not.
};

new pInfo[MAX_PLAYERS][PlayerInfo];


SavePlayer(playerid) // ini adalah fungsi callback saveplayer untuk simpan data ke mysql
{
    // fungsi untuk save player data
    SendClientMessage(playerid, -1, "MySQL di coba untuk simpan");
    pInfo[playerid][pInterior] = GetPlayerInterior(playerid);
    pInfo[playerid][pWord] = GetPlayerVirtualWorld(playerid);

    if(pInfo[playerid][Logged] == 1)
    // checks if the player is logged
    {
        // stock simpan data player
        new Query[500];
        format(Query, 500, "UPDATE `playerdata` SET `admin` = '%d', `score` = '%d', `money` = '%i',`component` = '%i', `kills` = '%d', `deaths` = '%d', `posisiorang` = '%s', `posisimobil` = '%s', `pword` = '%s', `pinterior` = '%s' WHERE `id` = '%d' LIMIT 1",
        pInfo[playerid][pAdmin],
        pInfo[playerid][pScore],
        pInfo[playerid][pMoney],
        pInfo[playerid][pComponent],
        pInfo[playerid][pKills],
        pInfo[playerid][pDeaths],
        pInfo[playerid][pPosisiTerakhir],
        pInfo[playerid][pPosisiMobil],
        pInfo[playerid][pWord],
        pInfo[playerid][pInterior],
        pInfo[playerid][ID]);

        mysql_query(MySQL:g_Sql,Query, bool:true);

        SendClientMessage(playerid, -1, "MySQL data uang anda telah di update :)");

        
            
        for(new i; i < 13; i++) // looping through all weapon slots (0 - 12)
        {
            new
            weaponid,
            ammo;

            // koding nyimpan senjata
            //GetPlayerWeaponData(playerid, slot, weapons, ammo)
            GetPlayerWeaponData(playerid, i, weaponid, ammo); // get weaponid and ammo

            if(!weaponid) continue; // don't insert if there's no weapon in this slot
            new savesenjata[500];
            format(savesenjata, 500, "INSERT INTO player_weapons VALUES (%d, %d, %d) ON DUPLICATE KEY UPDATE ammo = %d;", pInfo[playerid][ID], weaponid, ammo, ammo);
            mysql_query(MySQL:g_Sql, savesenjata[499],bool:true); // parallel queries
            
            //SendClientMessage(playerid, -1, savesenjata);
            return 1;
        }


        new loaddataplayer[200];
        format(loaddataplayer, sizeof(Query), "SELECT * FROM `playerdata` WHERE `id` COLLATE latin1_general_cs = '%i' LIMIT 1", pInfo[playerid][ID]);
        mysql_query(MySQL:g_Sql, loaddataplayer[199], bool:true);

        
        // simpan posisi mobil.
        GetVehiclePos(mobilplayer1[playerid], Float:pInfo[playerid][pMx], Float:pInfo[playerid][pMy], Float:pInfo[playerid][pMz]);

        new kordinatmobil[500];
        format(kordinatmobil, 500, "UPDATE `playerdata` SET `pmx` = '%f',`pmy` = '%f',`pmz` = '%f' WHERE `id` = '%i' LIMIT 1", Float:pInfo[playerid][pMx], Float:pInfo[playerid][pMy], Float:pInfo[playerid][pMz], pInfo[playerid][ID]);
        mysql_query(MySQL:g_Sql, kordinatmobil[499], bool:true);
        SendClientMessage(playerid, -1, kordinatmobil);
        
        printf("Mobil pindah posisi ke %f, %f, %f ke pemilik ID %i", Float:pInfo[playerid][pMx], Float:pInfo[playerid][pMy], Float:pInfo[playerid][pMz], pInfo[playerid][ID]);
    
        //this basically gets the variables and stores it to the players special identifier called "ID".


        // fungsi untuk simpan posisi orang saat save data player


        GetPlayerPos(playerid, Float:pInfo[playerid][pPx], Float:pInfo[playerid][pPy], Float:pInfo[playerid][pPz]);

        new simpanorang[500];
        format(simpanorang, 500, "UPDATE `playerdata` SET `ppx` = '%f',`ppy` = '%f',`ppz` = '%f' WHERE `id` = '%d' LIMIT 1",
        pInfo[playerid][pPx], pInfo[playerid][pPy], pInfo[playerid][pPz], pInfo[playerid][ID]);
        //mysql_query(MySQL:handle, const query[], bool:use_cache = true)
        mysql_query(MySQL:g_Sql,simpanorang, bool:true);


        new lokasidisimpan[500];
        format(lokasidisimpan, 500, "Disimpan pada posisi %f, %f, %f", pInfo[playerid][pPx], pInfo[playerid][pPy], pInfo[playerid][pPz] );
        SendClientMessage(playerid, -1, lokasidisimpan);

    }

    // batas bila player sudah login
    return 1;
}

stock GetDistanceToCar(playerid, veh, Float: posX = 0.0, Float: posY = 0.0, Float: posZ = 0.0) {

    new
        Float: Floats[2][3];

    if(posX == 0.0 && posY == 0.0 && posZ == 0.0) {
        if(!IsPlayerInAnyVehicle(playerid)) GetPlayerPos(playerid, Floats[0][0], Floats[0][1], Floats[0][2]);
        else GetVehiclePos(GetPlayerVehicleID(playerid), Floats[0][0], Floats[0][1], Floats[0][2]);
    }
    else {
        Floats[0][0] = posX;
        Floats[0][1] = posY;
        Floats[0][2] = posZ;
    }
    GetVehiclePos(veh, Floats[1][0], Floats[1][1], Floats[1][2]);
    return floatround(floatsqroot((Floats[1][0] - Floats[0][0]) * (Floats[1][0] - Floats[0][0]) + (Floats[1][1] - Floats[0][1]) * (Floats[1][1] - Floats[0][1]) + (Floats[1][2] - Floats[0][2]) * (Floats[1][2] - Floats[0][2])));
}



stock GetClosestCar(playerid, exception = INVALID_VEHICLE_ID) 
{

    new
        Float: Distance,
        target = -1,
        Float: vPos[3];

    if(!IsPlayerInAnyVehicle(playerid)) GetPlayerPos(playerid, vPos[0], vPos[1], vPos[2]);
    else GetVehiclePos(GetPlayerVehicleID(playerid), vPos[0], vPos[1], vPos[2]);

    for(new v; v < MAX_VEHICLES; v++) if(GetVehicleModel(v) >= 400) {
        if(v != exception && (target < 0 || Distance > GetDistanceToCar(playerid, v, vPos[0], vPos[1], vPos[2]))) {
            target = v;
            Distance = GetDistanceToCar(playerid, v, vPos[0], vPos[1], vPos[2]); // Before the rewrite, we'd be running GetPlayerPos 2000 times...
        }
    }
    return target;
}


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
    cache_get_value_int(0, "component", pInfo[playerid][pComponent]);
    return 1;
}



CMD:tambahnos(playerid, params[])
{
    
    if(pInfo[playerid][pComponent] > 5) // kebutuhan untuk modif mobil yaitu NOS nitro
    {
        new closestcar = GetClosestCar(playerid, INVALID_VEHICLE_ID);
        AddVehicleComponent(closestcar, 1010);
        new string[128];
        format(string, 50, "~w~Attaching %i Nitro ...", closestcar);
        GameTextForPlayer(playerid, string, 800, 1);
       
        format(string, sizeof(string), "* %s is trying to attach a Nitro to his Client Vehicle.", GetRPName(playerid));
        SetPlayerChatBubble(playerid, string, COLOR_PURPLE, 100.0, 10000);
        ApplyAnimation(playerid, "MISC","bng_wndw", 4.0,0,0,0,0,0,0);
        pInfo[playerid][pComponent] = pInfo[playerid][pComponent]-200;
        new infopembelian[200];
        format(infopembelian, sizeof(infopembelian), ""COL_LIGHTBLUE"Component"COL_GREEN": Anda menghabiskan 200 component dan kini tersisa %i item.", pInfo[playerid][pComponent]);
        SendClientMessage(playerid,0xFF0000FF, infopembelian);

    }
    else
    {
        GameTextForPlayer(playerid, "Anda sebaiknya beli component terlebih dahulu tuan.", 800, 1);
    }

    return 1;
}


CMD:buycomponent(playerid, params[])
{
    // cmd beli component
    if(IsPlayerInRangeOfPoint(playerid, Float:4.0, 2141.9475,-1728.9771,13.5592))
    {
        if(isnull(params)) return SendClientMessage(playerid, COLOR_GREEN, "[Usage:] /buycomponent (Jumlah bahan component yang akan di beli)");
    
        // fungsi untuk beli component
        extract params -> new Jumlah;
        pInfo[playerid][pComponent] = pInfo[playerid][pComponent] + Jumlah;

        ApplyAnimation(playerid, "INT_SHOP","shop_shelf", 4.1, 0, 0, 0, 0, 0, 0);
      
        new hargacomponent = random(3)*Jumlah;
        pInfo[playerid][pMoney] = pInfo[playerid][pMoney]-hargacomponent;
        ResetPlayerMoney(playerid);
        GivePlayerMoney(playerid, pInfo[playerid][pMoney]);
        SavePlayer(playerid);

        new infopembelian[200];
        format(infopembelian, sizeof(infopembelian), ""COL_LIGHTBLUE"Component"COL_GREEN": Anda telah beli Component Sebanyak %i dengan harga %i$.", Jumlah, hargacomponent);
        SendClientMessage(playerid,0xFF0000FF, infopembelian);

    }
    else
    {
        ApplyAnimation(playerid, "MISC", "SEAT_LR", 4.0,0,0,0,0,0,0);
        GameTextForPlayer(playerid, "Anda perlu ke penjual component mekanik untuk membelinya", 800, 1);
    }
}
