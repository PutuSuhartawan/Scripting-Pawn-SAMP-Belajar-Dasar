
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

new labelajah[MAX_PLAYERS]; // variabel untuk label yang di buat

public OnPlayerConnect(playerid)
{

}


CMD:labelsaya(playerid, params[])
{
    if(!IsValidDynamicObject(labelajah[playerid]))
    {
        new Float:pos[3];
        GetPlayerPos(playerid, pos[0], pos[1], pos[2]);

        new Float: angle;
        GetPlayerFacingAngle(playerid, angle);

        //object = CreateObject(model,pos[0], pos[1], pos[2], 0, 0, angle);
        // id cadangan lain adalah spray tag 18659
        // modelid label transparan 2659 tapi cadangan sedang 19366 
        labelajah[playerid] = CreateDynamicObject(18659, pos[0], pos[1]+4.0, pos[2], 0.000000, 0.000000, angle); 
        SetDynamicObjectMaterialText(labelajah[playerid], 0, params, 140, "Arial", 80, 1, 0xFFFFFFFF, 0x00000000, 1);
        EditDynamicObject(playerid, labelajah[playerid]);
        SendClientMessage(playerid,0xFF0000FF,"Edit posisi label anda dan tahan SPACE untuk melihat di sekeliling.");
        return 1;
    }
    else return cmd_hapuslabelsaya(playerid);

}

CMD:hapuslabelsaya(playerid)
{
    if(IsValidDynamicObject(labelajah[playerid]))
    {
        DestroyDynamicObject(labelajah[playerid]);
        SendClientMessage(playerid,0xFF0000FF,"Label yang lebih dulu di buat sudah berhasil di hapus.");
        return 1;
    }
    
}

