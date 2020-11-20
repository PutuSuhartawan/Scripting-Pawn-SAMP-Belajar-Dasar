
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
#include <zcmd>
#include <gangzones.inc>

//#define _ALS_OnFilterScriptInit

 // untuk supaya bisa pake progress bar sekarang tahun. Progress Bar 2.0.3 tahun 2015
#include <a_mysql> // MySQL plugin R41-4
#include <YSI_Storage\y_ini>
#include <YSI_Data\y_iterate>
#include <progress2>
#include <foreach>// ini color khusus string yang tidak mendukung tanda kurung.



stock ToggleBoot(vehicleid, toggle)
{
	GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
	SetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, toggle, objective);
}

stock ToggleEngine(vehicleid, toggle)
{
	GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
	SetVehicleParamsEx(vehicleid, toggle, lights, alarm, doors, bonnet, boot, objective);
}
stock ToggleDoors(vehicleid, toggle)
{
	GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
	SetVehicleParamsEx(vehicleid, engine, lights, alarm, toggle, bonnet, boot, objective);
}

stock ToggleHood(vehicleid, toggle)
{
	GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
	SetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, toggle, boot, objective);
}



forward WaktuServer(playerid);
public WaktuServer(playerid)
{
	

	if(IsPlayerInAnyVehicle(playerid))
	{
		new Float:health;
		new vehicleid = GetPlayerVehicleID(playerid);
		GetVehicleHealth(vehicleid, Float:health);
		if(health < Float:350.0 )
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

	return 1;
}

public OnGameModeInit()
{
	SetTimer("WaktuServer", 500, true);
}

public OnPlayerUpdate(playerid)
{
	// tidak pakai timer makan disini akan di update terus notifikasi mesin rusak.
}

CMD:setvehhealth(playerid, params[])
{
	if(IsPlayerInAnyVehicle(playerid))
	{
		extract params -> new Float:health;
		new vehicleid = GetPlayerVehicleID(playerid);
		SetVehicleHealth(vehicleid, Float:health);
		SendClientMessage(playerid, -1, "Kesehatan mesin di rubah");
	}
	else return GameTextForPlayer(playerid, "Anda harus dalam mobil", 5000, 4);
}

