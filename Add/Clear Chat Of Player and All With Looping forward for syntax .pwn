#include <Pawn.CMD>
#define Send(%0,%1,%2) 									SendClientMessage(%0,%1,%2)


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

CMD:cc(playerid)
{
	// this for clear chat player
	for(new i; i < 10; i++) Send(playerid,-1,"");
	return true;
}
CMD:cca(playerid)
{
	// this for clear chat all player
	if(admin_level[playerid] < 8) return true;
	for(new i; i < 10; i++) SendClientMessageToAll(-1,"");
	return true;
}
