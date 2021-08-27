//
#define SCM SendClientMessage
#define GetPlayerUseListitem(%0) 		g_player_listitem_use[%0]
#define SetPlayerUseListitem(%0,%1) 	g_player_listitem_use[%0] = %1

new g_player_listitem_use[MAX_PLAYERS] = {-1, ...};

#define SetPlayerListitemValue(%0,%1,%2) 	g_player_listitem[%0][%1] = %2
#define GetPlayerListitemValue(%0,%1) 		g_player_listitem[%0][%1]

new g_player_listitem[MAX_PLAYERS][96];

//

new Float: player_car_park[MAX_PLAYERS][MAX_PLAYER_VEHICLES][4];
//

#define MAX_PLAYER_VEHICLES 3

enum cInfo // taruh dibawahnya
{
	cModel[MAX_PLAYER_VEHICLES],
	cSost[MAX_PLAYER_VEHICLES],
	cColor1[MAX_PLAYER_VEHICLES],
	cColor2[MAX_PLAYER_VEHICLES],
	cPaintJobs[MAX_PLAYER_VEHICLES],
	cLock[MAX_PLAYER_VEHICLES],
	Float:cFuel[MAX_PLAYER_VEHICLES],
	cCost[MAX_PLAYER_VEHICLES],
	Float:cProbeg[MAX_PLAYER_VEHICLES],
	Float: cHeal[MAX_PLAYER_VEHICLES],
	cDamagePanel[MAX_PLAYER_VEHICLES],
	cDamageDoors[MAX_PLAYER_VEHICLES],
	cDamageLights[MAX_PLAYER_VEHICLES],
	cDamageTires[MAX_PLAYER_VEHICLES],
	cWheels[MAX_PLAYER_VEHICLES],
	cSpoiler[MAX_PLAYER_VEHICLES],
	cBumper1[MAX_PLAYER_VEHICLES],
	cBumper2[MAX_PLAYER_VEHICLES],
	cNitro[MAX_PLAYER_VEHICLES],
	cHydrawlic[MAX_PLAYER_VEHICLES],
	cHood[MAX_PLAYER_VEHICLES],
	cRoof[MAX_PLAYER_VEHICLES],
	cSideskirt[MAX_PLAYER_VEHICLES],
	cLamps[MAX_PLAYER_VEHICLES],
	cExhaust[MAX_PLAYER_VEHICLES],
	cStereo[MAX_PLAYER_VEHICLES],
	cVentRight[MAX_PLAYER_VEHICLES],
	cVentLeft[MAX_PLAYER_VEHICLES]
};
new CarInfo[MAX_PLAYERS][cInfo]; // cari ini

GetTuningName(componentid)
{
	new Name[20];
	switch(componentid)
	{
								case 1000..1003,1014..1016,1023,1049,1050,1058,1060,1138,1139,1146,1147,1158,1162..1164: Name = "cSpoiler";
								case 1004,1005,1011,1012: Name = "cHood";
								case 1007,1017,1026,1027,1030,1031,1036,1039..1042,1047,1048,1051,1052,1056,1057,1062,1063,1069,1072,1090,1093..1095,1099,1101,1102,1106..1108,1119..1122,1124,1133,1134,1137: Name = "cSideskirt";
								case 1008..1010: Name = "cNitro";
								case 1013,1024: Name = "cLamps";
								case 1018..1022,1028,1029,1034,1037,1043..1046,1059,1064.1066,1089,1092,1105,1113,1114,1126,1127,1129,1132,1135,1136: Name = "cExhaust";
								case 1025,1073..1085,1096..1098: Name = "cWheels";
								case 1006,1032,1033,1035,1038,1053..1055,1061,1067,1068,1088,1091,1103,1128,1130,1131: Name = "cRoof";
								case 1086: Name = "cStereo";
								case 1087: Name = "cHydraqlic";
								case 1117,1152,1153,1155,1157,1160,1165,1166,1169..1174,1176,1179,1181,1182,1185,1188..1191: Name = "cBumper1";
								case 1140,1141,1148..1151,1154,1156,1159,1161,1167,1168,1175,1177,1178,1180,1183,1184,1186,1187,1192,1193: Name = "cBumper2";
								case 0,1,2: Name = "cPaintJobs";
	}
	return Name;
}
new Float: player_car_park[MAX_PLAYERS][MAX_PLAYER_VEHICLES][4];

new player_home_car[MAX_PLAYERS][MAX_PLAYER_VEHICLES];
new player_car_keys[MAX_PLAYERS][MAX_PLAYER_VEHICLES];

new VehicleNumberPlate[MAX_PLAYERS][MAX_PLAYER_VEHICLES][9];

new engine, lights, alarm, doors, bonnet, boot, objective;

new player_engine_tune[MAX_PLAYERS][MAX_PLAYER_VEHICLES][5];
new player_brake_tune[MAX_PLAYERS][MAX_PLAYER_VEHICLES][5];

stock GetPlayerFreeCarSlot(playerid)
{
	for(new i; i < MAX_PLAYER_VEHICLES; i++) if(CarInfo[playerid][cModel][i] == 0) return i;

	return -1;
}

new VehicleNames[212][] = {
	"Landstalker","Bravura","Buffalo","Linerunner","Perrenial","Sentinel","Dumper","Firetruck","Trashmaster","Stretch","Manana","Infernus",
	"Voodoo","Pony","Mule","Cheetah","Ambulance","Leviathan","Moonbeam","Esperanto","Taxi","Washington","Bobcat","Mr.Whoopee","BF Injection",
	"Hunter","Premier","Enforcer","Securicar","Banshee","Predator","Bus","Rhino","Barracks","Hotknife","Trailer","Previon","Coach","Cabbie",
	"Stallion","Rumpo","RC Bandit","Romero","Packer","Monster","Admiral","Squalo","Seasparrow","Pizzaboy","Tram","Trailer","Turismo","Speeder",
	"Reefer","Tropic","Flatbed","Yankee","Caddy","Solair","Berkley's RC Van","Skimmer","PCJ-600","Faggio","Freeway","RC Barron","RC Raider",
	"Glendale","Oceanic","Sanchez","Sparrow","Patriot","Quad","Coastguard","Dinghy","Hermes","Sabre","Rustler","Zr-350","Walton","Regina",
	"Comet","BMX","Burrito","Camper","Marquis","Baggage","Dozer","Maverick","News Chopper","Rancher","FBI Rancher","Virgo","Greenwood",
	"Jetmax","Hotring","Sandking","Blista Compact","Police Maverick","Boxville","Benson","Mesa","RC Goblin","Hotring A","Hotring B",
	"Bloodring Banger","Rancher","Super GT","Elegant","Journey","Bike","Mountain Bike","Beagle","Cropdust","Stunt","Tanker","RoadTrain",
	"Nebula","Majestic","Buccaneer","Shamal","Hydra","FCR-900","NRG-500","HPV1000","Cement Truck","Tow Truck","Fortune","Cadrona","FBI Truck",
	"Willard","Forklift","Tractor","Combine","Feltzer","Remington","Slamvan","Blade","Freight","Streak","Vortex","Vincent","Bullet","Clover",
	"Sadler","Firetruck","Hustler","Intruder","Primo","Cargobob","Tampa","Sunrise","Merit","Utility","Nevada","Yosemite","Windsor","Monster A",
	"Monster B","Uranus","Jester","Sultan","Stratum","Elegy","Raindance","RC Tiger","Flash","Tahoma","Savanna","Bandito","Freight","Trailer",
	"Kart","Mower","Duneride","Sweeper","Broadway","Tornado","AT-400","DFT-30","Huntley","Stafford","BF-400","Newsvan","Tug","Trailer A","Emperor",
	"Wayfarer","Euros","Hotdog","Club","Trailer B","Trailer C","Andromada","Dodo","RC Cam","Launch","Police Car","Police Car",
	"Police Car","Police Ranger","Picador","S.W.A.T.","Alpha","Phoenix","Glendale","Sadler","L Trailer A","L Trailer B",
	"Stair Trailer","Boxville","Farm Plow","U Trailer"
};
new VehicleComponent[][cINFO] = {
{1000,2200,"Spoiler","Pro"}, {1001,2300,"Spoiler","Win"}, {1002,2500,"Spoiler","Drag"}, {1003,3000,"Spoiler","Alpha"}, {1004,1200,"Hood","Champ Scoop"}, {1005,1500,"Hood","Fury Scoop"}, {1006,1800,"Hood","Roof Scoop"},
{1007,3000,"Sideskirt","Right Sideskirt"}, {1008,2000,"Nitro","5 times"}, {1009,4000,"Nitro","2 times"}, {1010,6000,"Nitro","10 times"}, {1011,2000,"Hood","Race Scoop"}, {1012,2500,"Hood","Worx Scoop"},
{1013,3000,"Lamps","Round Fog"}, {1014,2500,"Spoiler","Champ"}, {1015,2800,"Spoiler","Race"}, {1016,3000,"Spoiler","Worx"}, {1017,3000,"Sideskirt","Left Sideskirt"}, {1018,1500,"Exhaust","Upswept"}, {1019,1800,"Exhaust","Twin"},
{1020,2200,"Exhaust","Large"}, {1021,2500,"Exhaust","Medium"}, {1022,2700,"Exhaust","Small"}, {1023,2500,"Spoiler","Fury"}, {1024,2800,"Lamps","Square Fog"}, {1025,4500,"Wheels","Offroad"}, {1026,2600,"Sideskirt","Right Alien Sideskirt"},
{1027,2800,"Sideskirt","Left Alien Sideskirt"}, {1028,2400,"Exhaust","Alien"}, {1029,2600,"Exhaust","X-Flow"}, {1030,3200,"Sideskirt","Left X-Flow Sideskirt"}, {1031,3100,"Sideskirt","Right X-Flow Sideskirt"}, {1032,2000,"Roof","Alien Roof Vent"},
{1033,2500,"Roof","X-Flow Roof Vent"}, {1034,2500,"Exhaust","Alien"}, {1035,2400,"Roof","X-Flow Roof Vent"}, {1036,2800,"SideSkirt","Right Alien Sideskirt"}, {1037,2250,"Exhaust","X-Flow"}, {1038,2300,"Roof","Alien Roof Vent"}, {1039,2800,"SideSkirt","Left X-Flow Sideskirt"},
{1040,1800,"Roof","Left Alien Sideskirt"}, {1041,2200,"Roof","Right X-Flow Sideskirt"}, {1042,2400,"Roof","Right Chrome Sideskirt"}, {1043,2800,"Exhaust","Slamin"}, {1044,2950,"Exhaust","Chrome"}, {1045,3000,"Exhaust","X-Flow"}, {1046,3100,"Exhaust","Alien"},
{1047,3200,"Sideskirt","Right Alien Sideskirt"}, {1048,3300,"Sideskirt","Right X-Flow Sideskirt"}, {1049,3400,"Spoiler","Alien"}, {1051,4800,"Sideskirt","Left Alien Sideskirt"}, {1052,4500,"Sideskirt","Left X-Flow Sideskirt"},
{1053,2100,"Roof","X-Flow"}, {1054,2100,"Roof","Alien"}, {1054,2100,"Roof","Alien"}, {1055,2500,"Roof","Alien"}, {1053,2500,"Roof","X-Flow"}, {1057,4800,"Sideskirt","Right X-Flow Sideskirt"}, {1058,3800,"Spoiler","Alien"},
{1059,2400,"Exhaust","X-Flow"}, {1060,3400,"Spoiler","X-Flow"}, {1061,2400,"Roof","X-Flow"}, {1062,3100,"Sideskirt","Left Alien Sideskirt"}, {1063,3400,"Sideskirt","Left X-Flow Sideskirt"}, {1064,4200,"Exhaust","Alien"}, {1065,2700,"Exhaust","Alien"},
{1066,2600,"Exhaust","X-Flow"}, {1067,2800,"Roof","Alien"}, {1068,4200,"Roof","X-Flow"}, {1069,3800,"Sideskirt","Right Alien Sideskirt"}, {1070,3200,"Sideskirt","Right X-Flow Sideskirt"}, {1071,4100,"Sideskirt","Left Alien Sideskirt"},
{1072,3500,"Sideskirt","Left X-Flow Sideskirt"}, {1073,2300,"Wheels","Shadow"}, {1074,2400,"Wheels","Mega"}, {1075,2600,"Wheels","Rimshine"}, {1076,2200,"Wheels","Wires"}, {1077,3100,"Wheels","Classic"}, {1078,2900,"Wheels","Twist"},
{1079,3400,"Wheels","Cutter"}, {1080,3200,"Wheels","Switch"}, {1081,3100,"Wheels","Grove"}, {1082,2900,"Wheels","Import"}, {1083,3400,"Wheels","Dollar"}, {1084,3300,"Wheels","Trance"}, {1085,3500,"Wheels","Atomic"}, {1086,2700,"Stereo","Stereo"},
{1087,5000,"Hydraulics","Hydraulics"}, {1088,3100,"Roof","Alien"}, {1089,3200,"Exhaust","X-Flow"}, {1090,3300,"Sideskirt","Right Alien Sideskirt"}, {1091,4100,"Roof","X-Flow"}, {1092,3400,"Exhaust","Alien"}, {1093,2800,"Sideskirt","Right X-Flow Sideskirt"},
{1094,2900,"Sideskirt","Left Alien Sideskirt"}, {1095,3100,"Sideskirt","Right X-Flow Sideskirt"}, {1096,2500,"Wheels","Ahab"}, {1097,2800,"Wheels","Virtual"}, {1098,2100,"Wheels","Access"}, {1099,2400,"Sideskirt","Left Chrome Sideskirt"},
{1100,2600,"Bullbar","Chrome Grill"}, {1101,2800,"Sideskirt","Left `Chrome Flames` Sideskirt"}, {1102,3100,"Sideskirt","Left `Chrome Strip` Sideskirt"}, {1103,2400,"Roof","Covertible"}, {1104,3200,"Exhaust","Chrome"}, {1105,3300,"Exhaust","Slamin"},
{1106,4100,"Sideskirt","Right `Chrome Arches`"}, {1107,3200,"Sideskirt","Left `Chrome Strip` Sideskirt"}, {1108,2500,"Sideskirt","Right `Chrome Strip` Sideskirt"}, {1109,2700,"Rear Bullbars","Chrome"}, {1110,2900,"Rear Bullbars","Slamin"},
{1111,3100,"Front Sign?","Slamin"}, {1112,2900,"Front Sign?","Little Sign?"}, {1113,2600,"Exhaust","Chrome"}, {1114,2400,"Exhaust","Slamin"}, {1115,3200,"Front Bullbars","Chrome"}, {1116,3400,"Front Bullbars","Slamin"}, {1117,2900,"Front Bumper","Chrome"},
{1118,3100,"Sideskirt","Right `Chrome Trim` Sideskirt"}, {1119,2300,"Sideskirt","Right `Wheelcovers` Sideskirt"}, {1120,2100,"Sideskirt","Left `Chrome Trim` Sideskirt"}, {1121,2400,"Sideskirt","Left `Wheelcovers` Sideskirt"},
{1122,2500,"Sideskirt","Right `Chrome Flames` Sideskirt"}, {1123,3100,"Bullbars","Bullbar Chrome Bars"}, {1124,2300,"Sideskirt","Left `Chrome Arches` Sideskirt"}, {1125,3200,"Bullbars","Bullbar Chrome Lights"}, {1126,2600,"Exhaust","Chrome Exhaust"},
{1127,2800,"Exhaust","Slamin Exhaust"}, {1128,3100,"Roof","Vinyl Hardtop"}, {1129,4000,"Exhaust","Chrome"}, {1130,3000,"Roof","Hardtop"}, {1131,2800,"Roof","Softtop"}, {1133,2900,"Sideskirt","Right `Chrome Strip` Sideskirt"}, {1135,2800,"Exhaust","Slamin"},
{1134,3200,"Sideskirt","Right `Chrome Strip` Sideskirt"}, {1135,2800,"Exhaust","Slamin"}, {1136,2700,"Exhaust","Chrome"}, {1137,3200,"Sideskirt","Left `Chrome Strip` Sideskirt"}, {1138,2800,"Spoiler","Alien"}, {1139,3000,"Spoiler","X-Flow"},
{1140,4800,"Rear Bumper","X-Flow"}, {1141,4500,"Rear Bumper","Alien"}, {1142,3200,"Vents","Left Oval Vents"}, {1143,3400,"Vents","Right Oval Vents"}, {1144,3500,"Vents","Left Square Vents"}, {1145,3800,"Vents","Right Square Vents"},
{1146,3500,"Spoiler","X-Flow"}, {1147,3800,"Spoiler","Alien"}, {1148,3600,"Rear Bumper","X-Flow"}, {1149,3800,"Rear Bumper","Alien"}, {1150,3100,"Rear Bumper","Alien"}, {1151,3200,"Rear Bumper","X-Flow"}, {1152,3200,"Front Bumper","X-Flow"},
{1153,2900,"Front Bumper","Alien"}, {1154,3000,"Rear Bumper","Alien"}, {1155,3300,"Front Bumper","Alien"}, {1156,3500,"Rear Bumper","X-Flow"}, {1157,3600,"Front Bumper","X-Flow"}, {1158,3800,"Spoiler","X-Flow"}, {1159,3600,"Rear Bumper","Alien"},
{1160,3700,"Front Bumper","Alien"}, {1161,3600,"Rear Bumper","X-Flow"}, {1162,3300,"Spoiler","Alien"}, {1163,3400,"Spoiler","X-Flow"}, {1164,3600,"Spoiler","Alien"}, {1165,4100,"Front Bumper","X-Flow"}, {1166,3800,"Front Bumper","Alien"},
{1167,3500,"Rear Bumper","X-Flow"}, {1168,3800,"Rear Bumper","Alien"}, {1169,3600,"Front Bumper","Alien"}, {1170,3400,"Front Bumper","X-Flow"}, {1171,3600,"Front Bumper","Alien"}, {1172,3800,"Front Bumper","X-Flow"}, {1173,3500,"Front Bumper","X-Flow"},
{1174,3200,"Front Bumper","Chrome"}, {1175,3700,"Front Bumper","Slamin"}, {1176,2900,"Rear Bumper","Chrome"}, {1177,3100,"Rear Bumper","Slamin"}, {1178,3800,"Rear Bumper","Slamin"}, {1179,4100,"Front Bumper","Chrome"}, {1180,4000,"Rear Bumper","Chrome"},
{1181,3750,"Front Bumper","Slamin"}, {1182,3500,"Front Bumper","Chrome"}, {1183,3400,"Rear Bumper","Slamin"}, {1184,3200,"Rear Bumper","Chrome"}, {1185,2200,"Front Bumper","Slamin"}, {1186,2000,"Rear Bumper","Slamin"}, {1187,3100,"Rear Bumper","Chrome"},
{1188,3200,"Front Bumper","Slamin"}, {1189,3400,"Front Bumper","Chrome"}, {1190,3100,"Front Bumper","Slamin"}, {1191,3000,"Front Bumper","Chrome"}, {1192,3000,"Rear Bumper","Chrome"}, {1193,3100,"Rear Bumper","Slamin"} };

/*new ACName[53][] = { "AirBreak (onfoot) [#000]", "AirBreak (in vehicle) [#001]", "AirBreak/Teleport [#002]", "Teleport hack (in vehicle) [#003]", "Teleport hack (into/between vehicles) [#004]", "Teleport hack (vehicle to player) [#005]",
	"Teleport hack (pickups) [#006]", "FlyHack (onfoot) [#007]", "FlyHack (in vehicle) [#008]", "SpeedHack (onfoot) [#009]", "SpeedHack (in vehicle) [#010]", "Health hack (in vehicle) [#011]", "Health hack (onfoot) [#012]", "Armour hack [#013]",
	"Money hack [#014]", "Weapon hack [#015]", "DGUN [#016]", "DGUN [#017]", "Special actions hack [#018]", "GodMode [#019]", "GodMode [#020]", "Invisible hack [#021]", "lagcomp-spoof [#022]",
	"Tuning hack [#023]", "Parkour mod [#024]", "Quick turn [#025]", "Anti-Rapid fire [#026]", "FakeSpawn [#027]", "FakeKill [#028]", "Pro Aim [#029]", "CJ run [#030]", "CarShot [#031]",
	"CarJack [#032]", "UnFreeze [#033]", "AFK Ghost [#034]", "Full Aiming [#035]", "Fake NPC [#036]", "Reconnect [#037]", "High ping [#038]", "Dialog hack [#039]", "Protection from the sandbox [#040]", "Protection against an invalid version [#041]",
	"Rcon hack [#042]", "Tuning crasher [#043]", "Invalid seat crasher [#044]", "Dialog crasher [#045]", "Attached object crasher [#046]", "Weapon Crasher [#047]", "Flood protection connects to one slot [#048]", "flood callback functions [#049]",
	"Flood change seat [#050]", "Ddos [#051]", "NOP's [#052]" };*/


stock DestroyVehicleEx(vehicleid)
{
	DestroyVehicle(vehicleid);
	return 1;
}

stock OnPlayerUpdateAdminPer(i, per[], per1) return format(MySQLStr, 188, "UPDATE `admin` SET `%s` = %d WHERE `Name` = '%s' LIMIT 1", per, per1, GetPlayerNameEx(i)), mysql_tquery(mMysql, MySQLStr, "", "");
stock OnPlayerUpdateSupportPer(i, per[], per1) return format(MySQLStr, 188, "UPDATE `supports` SET `%s` = %d WHERE `user_id` = %i LIMIT 1", per, per1, GetPlayerAccountID(i)), mysql_tquery(mMysql, MySQLStr, "", "");

stock OnPlayerUpdateAccountsPer(i, per[], per1) return format(MySQLStr, 144, "UPDATE `accounts` SET `%s` = %d WHERE `pID` = %d LIMIT 1", per, per1, PlayerInfo[i][pID]), mysql_tquery(mMysql, MySQLStr, "", "");
stock SaveABizzPer(i, per[], per1) return format(MySQLStr, 144, "UPDATE `bizz_fuel` SET `%s` = %d WHERE `aID` = %d LIMIT 1", per, per1, i), mysql_tquery(mMysql, MySQLStr, "", "");
stock SaveBizzPer(i, per[], per1)
{
    if(BizzInfo[i][bEntranceX] == 0.0) return 0;

	format(MySQLStr, 144, "UPDATE `bizz` SET `%s` = %d WHERE `bID` = %d LIMIT 1", per, per1, i);
	mysql_tquery(mMysql, MySQLStr);

	return 1;
}
stock SaveHousePer(i, per[], per1) return format(MySQLStr, 144, "UPDATE `house` SET `%s` = %d WHERE `hID` = %d LIMIT 1", per, per1, i), mysql_tquery(mMysql, MySQLStr, "", "");
/*
epublic: SaveHouse(i)
{
	if(i == -1) return 0;

    format(MySQLStr, sizeof(MySQLStr), "UPDATE `house` SET `hOwner` = '%s', `hOwned` = %d, `hHel` = %d, `hLock` = %d, `hUpdAD` = %d, `hUpdHel` = %d, `hUpdSub` = %d, `hSlet` = %d, `hGarLock` = %d, `hOplata` = %d",
 	HouseInfo[i][hOwner], HouseInfo[i][hOwned], HouseInfo[i][hHel], HouseInfo[i][hLock], HouseInfo[i][hUpdAD], HouseInfo[i][hUpdHel], HouseInfo[i][hUpdSub], HouseInfo[i][hSlet], HouseInfo[i][hGarLock], HouseInfo[i][hOplata]);

	format(MySQLStr, sizeof(MySQLStr), "%s, `hHealpickX` = '%f', `hHealpickY` = '%f', `hHealpickZ` = '%f' WHERE `hID` = %d", MySQLStr, HouseInfo[i][hHealpickX], HouseInfo[i][hHealpickY], HouseInfo[i][hHealpickZ], i);
 	//
    mysql_tquery(mMysql, MySQLStr);
    return 1;
}*/
epublic: SaveHouse(i)
{
	if(i == -1) return 0;

    format(MySQLStr, 444, "UPDATE `house` SET `hOwner` = '%s', `hOwned` = %d, `hHel` = %d, `hLock` = %d, `hUpdAD` = %d, `hUpdHel` = %d, `hUpdSub` = %d, `hUpdStore` = %i, `hSlet` = %d, `hOplata` = %d",
 	HouseInfo[i][hOwner], HouseInfo[i][hOwned], HouseInfo[i][hHel], HouseInfo[i][hLock], HouseInfo[i][hUpdAD], HouseInfo[i][hUpdHel], HouseInfo[i][hUpdSub], HouseInfo[i][hUpdStore], HouseInfo[i][hSlet], HouseInfo[i][hOplata]);

	format(MySQLStr, 444, "%s, `hHealpickX` = %f, `hHealpickY` = %f, `hHealpickZ` = %f , `hValue` = %d WHERE `hID` = %d", MySQLStr, HouseInfo[i][hHealpickX], HouseInfo[i][hHealpickY], HouseInfo[i][hHealpickZ], HouseInfo[i][hValue], HouseInfo[i][hID]);
 	//
    mysql_tquery(mMysql, MySQLStr);
    return 1;
}
epublic: SaveABizz(i)
{
    format(MySQLStr, 344, "UPDATE `bizz_fuel` SET `aOwned` = %d, `aOwner` = '%s', `aMoney` = %d, `aRaschet` = %d, `aSklad` = %d, `aLocked` = %d, `aProducts` = %d, `aPrice` = %d, `aMafia` = %d, `aOplata` = %d, `aSlet` = %d WHERE `aID` = %d",
    BizzAInfo[i][aOwned], BizzAInfo[i][aOwner], BizzAInfo[i][aMoney], BizzAInfo[i][aRaschet], BizzAInfo[i][aSklad], BizzAInfo[i][aLocked], BizzAInfo[i][aProducts], BizzAInfo[i][aPrice], BizzAInfo[i][aMafia], BizzAInfo[i][aOplata], BizzAInfo[i][aSlet], i);

    mysql_tquery(mMysql, MySQLStr);
    return 1;
}
stock SaveBizz(i)
stock GivePlayerBankEx(playerid, amount, reason[])
{
	PlayerInfo[playerid][pBank] += amount;
	OnPlayerUpdateAccountsPer(playerid, "pBank", PlayerInfo[playerid][pBank]);

    if(amount <= -1000 || amount >= 1000)
	{
		format(format_string, 244, "INSERT INTO `money_log` (`user_id`,`amount`,`reason`,`type`) VALUES (%i,%i,'%s ($%i)',1)", GetPlayerAccountID(playerid), amount, reason, PlayerInfo[playerid][pBank]);
		mysql_tquery(mMysql, format_string);
	}

	return 1;
}

stock GetPlayerHouseLodger(playerid)
{
	for(new i; i < MAX_HOUSES; i++)
	{
	    if(!HouseInfo[i][hOwned]) continue;

	    for(new x; x < MAX_HOUSE_LODGERS; x++) if(!strcmp(house_lodgers[i][x], Name(playerid), true)) return i;
 	}

 	return -1;
}

stock GetPlayerHouse(playerid)
{
	for(new i; i < MAX_HOUSES; i++)
	{
	    if(HouseInfo[i][hOwned] && !strcmp(HouseInfo[i][hOwner],Name(playerid),true)) return i;
 	}

 	return -1;
}

stock LoadMyCar(playerid, c_id = -1, type = 0)
{
	new hotel_id = PlayerInfo[playerid][pHotel];
    new h = GetPlayerHouse(playerid);
    if(h == -1) h = GetPlayerHouseLodger(playerid);
	new car;

	if(c_id == -1) c_id = PlayerInfo[playerid][pUseCar];

	if(player_home_car[playerid][c_id] != INVALID_VEHICLE_ID) DestroyVehicleEx(player_home_car[playerid][c_id]);
	if(CarInfo[playerid][cHeal][c_id] <= 300) CarInfo[playerid][cHeal][c_id] = 1000;

	if(type == 0)
	{
	    car = CreateVehicle(CarInfo[playerid][cModel][c_id], player_car_park[playerid][c_id][0], player_car_park[playerid][c_id][1], player_car_park[playerid][c_id][2], player_car_park[playerid][c_id][3], CarInfo[playerid][cColor1][c_id], CarInfo[playerid][cColor2][c_id], -1);
	    SetVehicleVirtualWorld(car, 0);
	    LinkVehicleToInterior(car, 0);
	}
	else
	{
	    if(h == -1 && hotel_id == -1) return 1;

		if(hotel_id != -1)
		{
		    car = CreateVehicle(CarInfo[playerid][cModel][c_id], 1304.3055,-1377.3057,13.6739,178.5732, CarInfo[playerid][cColor1][c_id], CarInfo[playerid][cColor2][c_id], -1);
		}
		else car = CreateVehicle(CarInfo[playerid][cModel][c_id], HouseInfo[h][hCarx],HouseInfo[h][hCary],HouseInfo[h][hCarz],HouseInfo[h][hCarc], CarInfo[playerid][cColor1][c_id], CarInfo[playerid][cColor2][c_id], -1);
	}

    SetVehicleHealth(car, CarInfo[playerid][cHeal][c_id]);

	Fuell[car] = CarInfo[playerid][cFuel][c_id];
	Milliage[car] = CarInfo[playerid][cProbeg][c_id];
	CompVeh(playerid, car);
	SetVehicleParamsEx(car,engine,lights,alarm,CarInfo[playerid][cLock][c_id],bonnet,boot,objective);

	VehInfo[car][vStatus] = 2;

    VehInfo[car][vEngineTune] = player_engine_tune[playerid][c_id];
  	VehInfo[car][vBrakeTune] = player_brake_tune[playerid][c_id];

	UpdateVehicleDamageStatus(car, CarInfo[playerid][cDamagePanel][c_id], CarInfo[playerid][cDamageDoors][c_id], CarInfo[playerid][cDamageLights][c_id], CarInfo[playerid][cDamageTires][c_id]);

    vehicle_owner_id[car] = playerid;

	player_home_car[playerid][c_id] = car;
	player_car_keys[playerid][c_id] = 1;

	return true;
}



public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
 switch(dialogid)
	{
	    case 4710:
	    {
	        if(!response) return 1;

	        listitem = GetPlayerListitemValue(playerid, listitem);

			new model = CarInfo[playerid][cModel][listitem];

			if(model == 0) return SCM(playerid, COLOR_GREY, "Slot ini kosong.");

	        SetPlayerUseListitem(playerid, listitem);
	        format(String, 64, "[%i] %s", listitem+1, VehicleNames[model-400]);

	        if(player_home_car[playerid][listitem] == INVALID_VEHICLE_ID)
	        {
	            new downloaded_vehicle = -1;

		        for(new i; i < MAX_PLAYER_VEHICLES; i++) if(player_home_car[playerid][i] != INVALID_VEHICLE_ID) downloaded_vehicle = i;

		        if(downloaded_vehicle != -1 && downloaded_vehicle != listitem)
		            return SCM(playerid, COLOR_GREY, "Untuk informasi lebih lanjut, silakan hubungi kami.");

				SPD(playerid, 4711, DIALOG_STYLE_LIST, String, "Unduh transportasi\nTandai transportasi di peta", "Pilih", "Tutup");
			}
			else
			    SPD(playerid, 4712, DIALOG_STYLE_LIST, "Sistem manajemen transportasi", "{a86cfc}1. {33AA33}Buka"W" atau {FF6347}Tutup"W" transportasi {afafaf}(/lock)\n{a86cfc}2. {33AA33}Tempel "W"atau {FF6347}Tarik keluar"W" kunci {afafaf}(/key)\n{a86cfc}3. {ffffff}Tandai kendaraan pada GPS {afafaf}($300)\n{a86cfc}4. {ffffff}Dokumen untuk transportasi {afafaf}(/pts)\n{a86cfc}5. {ffffff}Memarkir kendaraan {afafaf}(/park)\n"W"- Bongkar transportasi dari server", "Pilih", "Kembali");
	    }
      
      case 4711:
	    {
	        if(!response) return 1;

			new use_car = GetPlayerUseListitem(playerid);

	        if(listitem == 0)
	        {
				if(!PlayerToPoint(15.0, playerid, player_car_park[playerid][use_car][0], player_car_park[playerid][use_car][1], player_car_park[playerid][use_car][2]))
				    return SCM(playerid, COLOR_GREY, "Anda jauh dari tempat parkir.");

	            LoadMyCar(playerid, use_car);

	            SCM(playerid, COLOR_YELLOW, "Transportasi dikirim ke tempat parkir.");
	        }
	        else
			{
				new vehicleid = player_home_car[playerid][use_car];

			    if(vehicleid == INVALID_VEHICLE_ID)
			    {
			        SetPlayerCheckpoint(playerid, player_car_park[playerid][use_car][0], player_car_park[playerid][use_car][1], player_car_park[playerid][use_car][2], 3.0);

	         		SetPVarInt(playerid, "GPS", 1);

			        return SCM(playerid, COLOR_YELLOW, "Di peta ada tanda tempat di mana Anda dapat memuat kendaraan.");
			    }

				new Float: x, Float: y, Float: z;

			    GetVehiclePos(vehicleid, x, y, z);

			    SetPlayerCheckpoint(playerid, x, y, z, 3.0);

         		SetPVarInt(playerid, "GPS", 1);

			    SCM(playerid, COLOR_YELLOW, "Label diatur pada peta..");
	        }
	    }
      
      case 4712:
	    {
	        if(!response) return callcmd::car(playerid);

	        new car_id = GetPlayerUseListitem(playerid);

			switch(listitem)
			{
			    case 0: callcmd::lock(playerid, "1");
			    case 1:
				{
				    player_car_keys[playerid][car_id] = !player_car_keys[playerid][car_id];

				    SCMF(playerid, -1, "Kamu adalah %s kunci.", player_car_keys[playerid][car_id] ? ("dimasukkan") : ("ditarik keluar"));
				}
			    case 2:
				{
				    if(PlayerInfo[playerid][pBank] < 300)
				        return SCM(playerid, COLOR_GREY, "Anda tidak memiliki $ 300 di rekening bank.");

				    GivePlayerBankEx(playerid, -300, "Tandai mobil di peta");

				    new Float: x, Float: y, Float: z;

					new vehicleid = player_home_car[playerid][car_id];

				    GetVehiclePos(vehicleid, x, y, z);

				    SetPlayerCheckpoint(playerid, x, y, z, 3.0);

	         		SetPVarInt(playerid, "GPS", 1);
				}
				case 3: callcmd::pts(playerid, "");
				case 4: callcmd::park(playerid);
				case 5:
				{
					DestroyVehicleEx(player_home_car[playerid][car_id]);
					player_home_car[playerid][car_id] = INVALID_VEHICLE_ID;
				}
			}
	    }
	    case 4711:
	    {
	        if(!response) return 1;

			new use_car = GetPlayerUseListitem(playerid);

	        if(listitem == 0)
	        {
				if(!PlayerToPoint(15.0, playerid, player_car_park[playerid][use_car][0], player_car_park[playerid][use_car][1], player_car_park[playerid][use_car][2]))
				    return SCM(playerid, COLOR_GREY, "Anda jauh dari tempat parkir.");

	            LoadMyCar(playerid, use_car);

	            SCM(playerid, COLOR_YELLOW, "Transportasi dikirim ke tempat parkir.");
	        }
	        else
			{
				new vehicleid = player_home_car[playerid][use_car];

			    if(vehicleid == INVALID_VEHICLE_ID)
			    {
			        SetPlayerCheckpoint(playerid, player_car_park[playerid][use_car][0], player_car_park[playerid][use_car][1], player_car_park[playerid][use_car][2], 3.0);

	         		SetPVarInt(playerid, "GPS", 1);

			        return SCM(playerid, COLOR_YELLOW, "Di peta ada tanda tempat di mana Anda dapat memuat kendaraan.");
			    }

				new Float: x, Float: y, Float: z;

			    GetVehiclePos(vehicleid, x, y, z);

			    SetPlayerCheckpoint(playerid, x, y, z, 3.0);

         		SetPVarInt(playerid, "GPS", 1);

			    SCM(playerid, COLOR_YELLOW, "Label diatur pada peta..");
	        }
	    }
   }
}


CMD:car(playerid)
{
	if(CarInfo[playerid][cModel][0] == 0 && CarInfo[playerid][cModel][1] == 0 && CarInfo[playerid][cModel][2] == 0)
	    return SCM(playerid, COLOR_GREY, "Anda tidak memiliki transportasi yang tersedia.");

    String = "";

	new str[96];

	new count = 0;

	for(new i; i < MAX_PLAYER_VEHICLES; i++)
	{
	    if(CarInfo[playerid][cModel][i] == 0) continue;

		format(str, 96, "{a86cfc}%i.\t{ffffff}%s\t%s\n",
			i+1,
			VehicleNames[CarInfo[playerid][cModel][i]-400],
			player_home_car[playerid][i] == INVALID_VEHICLE_ID ? ("Menunggu") : ("Dimuat"));

		strcat(String, str);

		SetPlayerListitemValue(playerid, count++, i);
	}

	return SPD(playerid, 4710, DIALOG_STYLE_TABLIST, "Pemilihan slot", String, "Pilih", "Kembali");
}

