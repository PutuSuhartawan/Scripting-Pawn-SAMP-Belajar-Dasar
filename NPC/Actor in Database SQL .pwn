
// actros
enum actorInfo
{
    aID, aModel, aVirtualWorld, aColor, aStatus, Float: aPosX, Float: aPosY, Float: aPosZ, Float: aPosA, aName[32],
	aAreaActors, aTimer, Text3D:ActorsText, aAntiFlood
}
new ActorInfo[MAX_ACTOR][actorInfo];


public OnPlayerEnterDynamicArea(playerid, areaid)
{
  for(new i=1; i <= TotalActor; i++)
	{
		if(areaid == ActorInfo[i][aAreaActors]) return player_enter_actors[playerid] = i;
	}
}  

stock UnSurfCar(playerid)
{
	if(GetPlayerSurfingVehicleID(playerid) != INVALID_VEHICLE_ID && GetVehicleModel(GetPlayerSurfingVehicleID(playerid)) != 478 && !IsABoat(GetPlayerSurfingVehicleID(playerid)))
	{
		new Float:p[3];
		GetPlayerPos(IsVehicleOccupiedMode(GetPlayerSurfingVehicleID(playerid)),p[0],p[1],p[2]);
		GetXYInBackOfPlayer(playerid,p[0],p[1],3.0);
		t_SetPlayerPos(playerid,p[0],p[1],p[2]);
	}
	return 1;
}

stock MySQLConnect()
{
    new MySQLOpt: option_id = mysql_init_options();
	mysql_set_option(option_id, AUTO_RECONNECT, true); // it automatically reconnects when loosing connection to mysql server

	mMysql = mysql_connect("localhost", "root", "", "ddd", option_id); // sebuah database
    //if(!mysql_errno()) print("Koneksi basis data aktif!");
	//else return print("Koneksi basis data tidak aktif!");

    //mysql_log(ALL);

    LoadVehicles();

	//mysql_tquery(mMysql, "SET NAMES 'cp1251'", "", "");
	mysql_set_charset("cp1251");

    LoadBizz();

	mysql_tquery(mMysql, "SELECT * FROM `taxi_bizz`", "LoadTaxiBizz", "");

	mysql_tquery(mMysql, "SELECT * FROM `fraction` ORDER BY `fID` ASC", "LoadFractions", "");
	mysql_tquery(mMysql, "SELECT * FROM `bizz_fuel`", "LoadABizz", "");
	mysql_tquery(mMysql, "SELECT * FROM `enters`", "LoadEnters", "");
	mysql_tquery(mMysql, "SELECT * FROM `actors`", "LoadActors", "");
	mysql_tquery(mMysql, "SELECT * FROM `atms`", "LoadAtms", "");
	mysql_tquery(mMysql, "SELECT * FROM `others`", "LoadOthers", "");
	mysql_tquery(mMysql, "SELECT * FROM `gangzone`", "LoadGangZones", "");
	mysql_tquery(mMysql, "SELECT * FROM `anticheats`", "load_anticheat", "");
    mysql_tquery(mMysql, "SELECT * FROM `graffiti`", "LoadGraffiti", "");
    mysql_tquery(mMysql, "SELECT * FROM `elecations`", "LoadElecations", "");
    mysql_tquery(mMysql, "SELECT * FROM `fraction_wh`", "LoadFractionWH", "");
    mysql_tquery(mMysql, "SELECT * FROM `family`", "LoadFamily", "");
    mysql_tquery(mMysql, "SELECT * FROM `house`", "LoadHouse", "");
	mysql_tquery(mMysql, "SELECT * FROM `hotels`", "LoadHotels", "");

    mysql_tquery(mMysql, "UPDATE `accounts` SET `pLogin` = 0");

	// others
	for(new x; x < MAX_HOSPITALS; x++)
	{
	    for(new i; i < MAX_HOSPITAL_BEDS; i++)
		{
		}
	}

	printf("[Unduh mod]: Tempat tidur rumah sakit dimuat: %d", MAX_HOSPITALS);

	SetTimer("Fresh", 1000, true);

	return 1;
}


stock AdvertList(playerid)
{
	new str[120], count = 0;
	String = "";
	for(new i; i<MAX_ADVERTS; i++)
	{
		if(AdvertInfo[i][aNumber] == 0 || AdvertInfo[i][aEditor] != INVALID_PLAYER_ID) continue;

		format(str,120,"%i\t%s\t%s\n",i,AdvertInfo[i][aName],AdvertInfo[i][aText]);
		strcat(String, str);

        SetPlayerListitemValue(playerid, count++, i);
	}
	if(!count) return SCM(playerid,COLOR_GREY,"Tidak ada pengumuman baru");
	return SPD(playerid,7731,DIALOG_STYLE_TABLIST,"{33AAFF}Pengumuman",String,"Pilih","Kembali") & 1;
}


stock ProxDetectorBot(Float:radi, actorid, string[],col1,col2,col3,col4,col5)
{
	if(actorid == 0) return 1;
	if(ActorInfo[actorid][aAntiFlood] > 0) return 1;

    new Float: Pos[3], Float: Radius;
    GetActorPos(ActorInfo[actorid][aID], Pos[0], Pos[1], Pos[2]);
    foreach(new i : Player)
    {
        if(GetActorVirtualWorld(ActorInfo[actorid][aID]) != GetPlayerVirtualWorld(i)) continue;

	    ApplyActorAnimation(ActorInfo[actorid][aID], "PED", "IDLE_CHAT",4.1,0,1,1,1,1);
        Radius = GetPlayerDistanceFromPoint(i, Pos[0], Pos[1], Pos[2]);

        if (Radius < radi / 16) SCMF(i, col1, "%s: %s", ActorInfo[actorid][aName], string);
        else if(Radius < radi / 8) SCMF(i, col2, "%s: %s", ActorInfo[actorid][aName], string);
        else if(Radius < radi / 4) SCMF(i, col3, "%s: %s", ActorInfo[actorid][aName], string);
        else if(Radius < radi / 2) SCMF(i, col4, "%s: %s", ActorInfo[actorid][aName], string);
        else if(Radius < radi) SCMF(i, col5, "%s: %s", ActorInfo[actorid][aName], string);
        ActorInfo[actorid][aAntiFlood] = 5;
    }
    return 1;
}



epublic: LoadActors()
{
	new rows;
	cache_get_row_count(rows);
    new ActorText[2] = { 0x6495EDFF, 0xF7ED00FF };
	if(!rows) return print("[MySQL R41-3]: Tidak ada aktor untuk diunduh!");

 	for(new i = 1; i <= rows; i++)
	{
	    cache_get_value_name_int(i-1, "aID", ActorInfo[i][aID]);
	    cache_get_value_name_int(i-1, "aModel", ActorInfo[i][aModel]);
	    cache_get_value_name_int(i-1, "aVirtualWorld", ActorInfo[i][aVirtualWorld]);
	    cache_get_value_name_int(i-1, "aColor", ActorInfo[i][aColor]);
	    cache_get_value_name_int(i-1, "aStatus", ActorInfo[i][aStatus]);
        cache_get_value_name_float(i-1, "aPosX", ActorInfo[i][aPosX]);
        cache_get_value_name_float(i-1, "aPosY", ActorInfo[i][aPosY]);
        cache_get_value_name_float(i-1, "aPosZ", ActorInfo[i][aPosZ]);
        cache_get_value_name_float(i-1, "aPosA", ActorInfo[i][aPosA]);
        cache_get_value_name(i-1, "aName", ActorInfo[i][aName], 32);

		if(ActorInfo[i][aStatus] > 0 && ActorInfo[i][aStatus] < 20)
		{
  			ActorInfo[i][aID] = CreateActor(ActorInfo[i][aModel], ActorInfo[i][aPosX], ActorInfo[i][aPosY], ActorInfo[i][aPosZ], ActorInfo[i][aPosA]);

			CreateDynamic3DTextLabel(ActorInfo[i][aName], ActorText[ActorInfo[i][aColor]], ActorInfo[i][aPosX], ActorInfo[i][aPosY], ActorInfo[i][aPosZ] + 1.2, 5.0, INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 0, ActorInfo[i][aVirtualWorld], -1);
			ActorInfo[i][aAreaActors] = CreateDynamicSphere(ActorInfo[i][aPosX], ActorInfo[i][aPosY], ActorInfo[i][aPosZ], 3.5);
			SetActorVirtualWorld(ActorInfo[i][aID], ActorInfo[i][aVirtualWorld]);
		}
		else
		{
			ActorInfo[i][aID] = CreateActor(ActorInfo[i][aModel], ActorInfo[i][aPosX], ActorInfo[i][aPosY], ActorInfo[i][aPosZ], ActorInfo[i][aPosA]);
			SetActorVirtualWorld(ActorInfo[i][aID], ActorInfo[i][aVirtualWorld]);
			CreateDynamic3DTextLabel(ActorInfo[i][aName], ActorText[ActorInfo[i][aColor]], ActorInfo[i][aPosX], ActorInfo[i][aPosY], ActorInfo[i][aPosZ] + 1.2, 5.0, INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 0, ActorInfo[i][aVirtualWorld], -1);

			if(ActorInfo[i][aStatus] == 255) ActorInfo[i][aAreaActors] = CreateDynamicSphere(ActorInfo[i][aPosX], ActorInfo[i][aPosY], ActorInfo[i][aPosZ], 15.0);
			else ActorInfo[i][aAreaActors] = CreateDynamicSphere(ActorInfo[i][aPosX], ActorInfo[i][aPosY], ActorInfo[i][aPosZ], 3.5);
		}
		TotalActor++;
	}
	printf("[MySQL R41-3]: Aktor diunggah: %i pcs.", TotalActor);
	return 1;
}

// SQL TABLE STURCTUR
/*
-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 26, 2021 at 12:35 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ddd`
--

-- --------------------------------------------------------

--
-- Table structure for table `actors`
--

CREATE TABLE `actors` (
  `aID` int(11) NOT NULL,
  `aModel` int(11) NOT NULL,
  `aVirtualWorld` int(11) NOT NULL,
  `aColor` int(11) NOT NULL,
  `aStatus` int(11) NOT NULL,
  `aPosX` float NOT NULL,
  `aPosY` float NOT NULL,
  `aPosZ` float NOT NULL,
  `aPosA` float NOT NULL,
  `aName` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

--
-- Dumping data for table `actors`
--

INSERT INTO `actors` (`aID`, `aModel`, `aVirtualWorld`, `aColor`, `aStatus`, `aPosX`, `aPosY`, `aPosZ`, `aPosA`, `aName`) VALUES
(1, 76, 1, 0, 0, 2308.77, -11.0131, 26.7422, 177.324, 'Pegawai Bank'),
(2, 172, 1, 0, 0, 2318.31, -9.9432, 26.7496, 89.5668, 'Pegawai Bank'),
(3, 283, 1, 0, 1, 251.257, 67.2897, 1003.64, 90.8049, 'Arthur'),
(4, 300, 0, 0, 255, 1544.18, -1631.87, 13.3828, 88.5597, 'Kadet'),
(5, 286, 0, 0, 255, -294.301, 1508.18, 75.5625, 180.952, 'Penjaga');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

*/
