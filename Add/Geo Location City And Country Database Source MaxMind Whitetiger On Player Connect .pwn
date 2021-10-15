// https://github.com/George480/geolite/blob/master/geolite.inc


/*
https://github.com/George480/geolite/releases/tag/v24.0

	GeoIP Include by Whitetiger
	-> SQLite GeoIP Include
	
	Credits: Whitetiger, RaekwonDaChef, Y_Less, Andreas Gohr.
	
	MaxMind, GeoIP and related marks are registered trademarks of MaxMind, Inc.
	
	---------------------------------------------------------------------------------------
	
*/




public OnPlayerConnect(playerid)
{
	new PlayerIP[16], country[MAX_COUNTRY_LENGTH], city[MAX_CITY_LENGTH];
	g_MysqlRaceCheck[playerid]++;
	AntiBHOP[playerid] = 0;
	IsAtEvent[playerid] = 0;
	ResetVariables(playerid);
	CreatePlayerTextDraws(playerid);
	TextDrawShowForPlayer(playerid, TextDate);
	TextDrawShowForPlayer(playerid, TextTime);

	LagiKerja[playerid] = false;
	Kurir[playerid] = false;
	angkatBox[playerid] = false;

	SetPlayerMapIcon(playerid, 12, 1001.29,-1356.507,12.992, 51 , 0, MAPICON_LOCAL); // ICON TRUCKER
	
	GetPlayerName(playerid, pData[playerid][pName], MAX_PLAYER_NAME);
	GetPlayerIp(playerid, PlayerIP, sizeof(PlayerIP));
	pData[playerid][pIP] = PlayerIP;
	InterpolateCameraPos(playerid, 1429.946655, -1597.120483, 41, 2098.130615, -1775.991210, 41.111639, 50000);
	InterpolateCameraLookAt(playerid, 247.605590, -1841.989990, 39.802570, 817.645996, -1645.395751, 29.292520, 15000);
	
	GetPlayerCountry(playerid, country, MAX_COUNTRY_LENGTH);
	GetPlayerCity(playerid, city, MAX_CITY_LENGTH);
	
	SetTimerEx("SafeLogin", 1000, 0, "i", playerid);
	
	new query[103];
	mysql_format(g_SQL, query, sizeof query, "SELECT * FROM `players` WHERE `username` = '%e' LIMIT 1", pData[playerid][pName]);
	mysql_pquery(g_SQL, query, "OnPlayerDataLoaded", "dd", playerid, g_MysqlRaceCheck[playerid]);
	SetPlayerColor(playerid, COLOR_WHITE);
	
	foreach(new ii : Player)
	{
		if(pData[ii][pTogLog] == 0)
		{
			SendClientMessageEx(ii, COLOR_RED, "{ff0000}[JOIN]"YELLOW_E" %s[%d] telah join kedalam Server.{7fffd4}(%s, %s)", pData[playerid][pName], playerid, city, country);
		}
	}

}

public OnPlayerDisconnect(playerid, reason)
{
		foreach(new ii : Player)
	{
		if(IsPlayerInRangeOfPoint(ii, 40.0, x, y, z))
		{
			switch(reason)
			{
				case 0:
				{
					SendClientMessageEx(ii, COLOR_RED, "[SERVER]"YELLOW_E" %s(%d) telah keluar dari Server.{7fffd4}(FC/Crash/Timeout)", pData[playerid][pName], playerid);
				}
				case 1:
				{
					SendClientMessageEx(ii, COLOR_RED, "[SERVER]"YELLOW_E" %s(%d) telah keluar dari Server.{7fffd4}(Disconnected)", pData[playerid][pName], playerid);
				}
				case 2:
				{
					SendClientMessageEx(ii, COLOR_RED, "[SERVER]"YELLOW_E" %s(%d) telah keluar dari Server.{7fffd4}(Kick/Banned)", pData[playerid][pName], playerid);
				}
			}
		}
	}
	return 1;
}

/*

    MIT License

    Copyright (c) 2018 Calisthenics

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in all
    copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
    SOFTWARE.

*/
/*

This product includes GeoLite2 data created by MaxMind, available from http://www.maxmind.com

*/
/*

Credits:
    MaxMind - GeoLite2
    TimeZoneDB.com - time zones
    Alex "Y_Less" Cole - sscanf
    Andy Skelton - ordering by `ip_to` (avoidance of range scan)
    Nikolay Bachiyski - ordering by `ip_to` (avoidance of range scan)
    Mark Robson - highest `ip_from` which is less than or equal to the given IP (avoidance of next country returned due to gaps)
	
*/

#if defined _INC_geolite
    #endinput
#endif
#define _INC_geolite

#if !defined sscanf
    #error Please include <sscanf2> first.
#endif

#define MAX_AUTONOMOUS_SYSTEM_LENGTH    95
#define MAX_COUNTRY_LENGTH              45
#define MAX_CITY_LENGTH                 109
#define MAX_PROVINCE_LENGTH             53
#define MAX_UTC_LENGTH                  7

static stock
    bool: GEOLITE_init,

    DB: GEOLITE_country_db,
    DB: GEOLITE_city_db,
    DB: GEOLITE_asn_db,
    DB: GEOLITE_province_db;

public OnFilterScriptInit()
{
    GEOLITE_init = true;
    
    geolite_open_dbs();
    
    #if defined GEOLITE_OnFilterScriptInit
        return GEOLITE_OnFilterScriptInit();
    #else
        return 1;
    #endif
}

#if defined _ALS_OnFilterScriptInit
    #undef OnFilterScriptInit
#else
    #define _ALS_OnFilterScriptInit
#endif

#define OnFilterScriptInit GEOLITE_OnFilterScriptInit

#if defined GEOLITE_OnFilterScriptInit
    forward GEOLITE_OnFilterScriptInit();
#endif

public OnFilterScriptExit()
{
    if (GEOLITE_init)
    {
        geolite_close_dbs();
    }

    #if defined GEOLITE_OnFilterScriptExit
        return GEOLITE_OnFilterScriptExit();
    #else
        return 1;
    #endif
}

#if defined _ALS_OnFilterScriptExit
    #undef OnFilterScriptExit
#else
    #define _ALS_OnFilterScriptExit
#endif

#define OnFilterScriptExit GEOLITE_OnFilterScriptExit

#if defined GEOLITE_OnFilterScriptExit
    forward GEOLITE_OnFilterScriptExit();
#endif

public OnGameModeInit()
{
    if (!GEOLITE_init)
    {
        geolite_open_dbs();
    }
	
    #if defined GEOLITE_OnGameModeInit
        return GEOLITE_OnGameModeInit();
    #else
        return 1;
    #endif
}

#if defined _ALS_OnGameModeInit
    #undef OnGameModeInit
#else
    #define _ALS_OnGameModeInit
#endif

#define OnGameModeInit GEOLITE_OnGameModeInit

#if defined GEOLITE_OnGameModeInit
    forward GEOLITE_OnGameModeInit();
#endif

public OnGameModeExit()
{
    if (!GEOLITE_init)
    {
        geolite_close_dbs();
    }

    #if defined GEOLITE_OnGameModeExit
        return GEOLITE_OnGameModeExit();
    #else
        return 1;
    #endif
}
#if defined _ALS_OnGameModeExit
    #undef OnGameModeExit
#else
    #define _ALS_OnGameModeExit
#endif

#define OnGameModeExit GEOLITE_OnGameModeExit

#if defined GEOLITE_OnGameModeExit
    forward GEOLITE_OnGameModeExit();
#endif

/*

native GetIpAutonomousSystem(const geolite_ip[], geolite_dest[], geolite_len = sizeof (geolite_dest));
native GetIpCountry(const geolite_ip[], geolite_dest[], geolite_len = sizeof (geolite_dest));
native GetIpCity(const geolite_ip[], geolite_dest[], geolite_len = sizeof (geolite_dest));
native GetIpProvince(const geolite_ip[], geolite_dest[], geolite_len = sizeof (geolite_dest));
native GetIpUTC(const geolite_ip[], geolite_dest[], geolite_len = sizeof (geolite_dest));
native IsIpProxy(const geolite_ip[]);

*/

stock GetIpAutonomousSystem(const geolite_ip[], geolite_dest[], geolite_len = sizeof (geolite_dest))
{
    if (GEOLITE_asn_db == DB: 0) return 0;
    
    new DBResult: geolite_result,

        geolite_octet1, geolite_octet2, geolite_octet3, geolite_octet4,

        calculations[24], query[305];

    sscanf(geolite_ip, "p<.>dddd", geolite_octet1, geolite_octet2, geolite_octet3, geolite_octet4);

    format(calculations, sizeof (calculations), "(16777216*%d+%d)", geolite_octet1, (65536 * geolite_octet2) + (256 * geolite_octet3) + geolite_octet4);
    format(query, sizeof (query),

        "SELECT CASE (ip_from<=%s) \
                WHEN 1 THEN autonomous_system_organization \
                ELSE 'Unknown' \
                END AS autonomous_system_organization \
           FROM asn_blocks AS b,asn_organizations AS o \
          WHERE b.autonomous_system_number=o.autonomous_system_number AND ip_to>=%s \
          ORDER BY ip_to LIMIT 1;",

    calculations, calculations);

    geolite_result = db_query(GEOLITE_asn_db, query);
    db_get_field(geolite_result, 0, geolite_dest, geolite_len);
    db_free_result(geolite_result);
    return 1;
}

stock GetIpCountry(const geolite_ip[], geolite_dest[], geolite_len = sizeof (geolite_dest))
{
    if (GEOLITE_country_db == DB: 0) return 0;
    
    new DBResult: geolite_result,

        geolite_octet1, geolite_octet2, geolite_octet3, geolite_octet4,

        calculations[24], query[245];

    sscanf(geolite_ip, "p<.>dddd", geolite_octet1, geolite_octet2, geolite_octet3, geolite_octet4);

    format(calculations, sizeof (calculations), "(16777216*%d+%d)", geolite_octet1, (65536 * geolite_octet2) + (256 * geolite_octet3) + geolite_octet4);
    format(query, sizeof (query),

        "SELECT CASE (ip_from<=%s) \
                WHEN 1 THEN country_name \
                ELSE 'Unknown' \
                END AS country_name \
           FROM country_blocks AS b,country_locations AS l \
          WHERE b.geoname_id=l.geoname_id AND ip_to>=%s \
          ORDER BY ip_to LIMIT 1;",

    calculations, calculations);

    geolite_result = db_query(GEOLITE_country_db, query);
    db_get_field(geolite_result, 0, geolite_dest, geolite_len);
    db_free_result(geolite_result);
    return 1;
}

stock GetIpCity(const geolite_ip[], geolite_dest[], geolite_len = sizeof (geolite_dest))
{
    if (GEOLITE_city_db == DB: 0) return 0;
    
    new DBResult: geolite_result,

        geolite_octet1, geolite_octet2, geolite_octet3, geolite_octet4,

        calculations[24], query[235];

    sscanf(geolite_ip, "p<.>dddd", geolite_octet1, geolite_octet2, geolite_octet3, geolite_octet4);

    format(calculations, sizeof (calculations), "(16777216*%d+%d)", geolite_octet1, (65536 * geolite_octet2) + (256 * geolite_octet3) + geolite_octet4);
    format(query, sizeof (query),

        "SELECT CASE (ip_from<=%s) \
                WHEN 1 THEN city_name \
                ELSE 'Unknown' \
                END AS city_name \
           FROM city_blocks AS b,city_locations AS l \
          WHERE b.geoname_id=l.geoname_id AND ip_to>=%s \
          ORDER BY ip_to LIMIT 1;",

    calculations, calculations);

    geolite_result = db_query(GEOLITE_city_db, query);
    db_get_field(geolite_result, 0, geolite_dest, geolite_len);
    db_free_result(geolite_result);
    return 1;
}

stock GetIpProvince(const geolite_ip[], geolite_dest[], geolite_len = sizeof (geolite_dest))
{
    if (GEOLITE_province_db == DB: 0) return 0;

    new DBResult: geolite_result,

        geolite_octet1, geolite_octet2, geolite_octet3, geolite_octet4,

        calculations[24], query[261];

    sscanf(geolite_ip, "p<.>dddd", geolite_octet1, geolite_octet2, geolite_octet3, geolite_octet4);

    format(calculations, sizeof (calculations), "(16777216*%d+%d)", geolite_octet1, (65536 * geolite_octet2) + (256 * geolite_octet3) + geolite_octet4);
    format(query, sizeof (query),

        "SELECT CASE (ip_from<=%s) \
                WHEN 1 THEN subdivision_1_name \
                ELSE 'Unknown' \
                END AS subdivision_1_name \
           FROM province_blocks AS b,province_locations AS l \
          WHERE b.geoname_id=l.geoname_id AND ip_to>=%s \
          ORDER BY ip_to LIMIT 1;",

    calculations, calculations);

    geolite_result = db_query(GEOLITE_province_db, query);
    db_get_field(geolite_result, 0, geolite_dest, geolite_len);
    db_free_result(geolite_result);
    return 1;
}

stock GetIpUTC(const geolite_ip[], geolite_dest[], geolite_len = sizeof (geolite_dest))
{
    if (GEOLITE_city_db == DB: 0) return 0;
    
    new DBResult: geolite_result,

        geolite_octet1, geolite_octet2, geolite_octet3, geolite_octet4,

        calculations[24], query[234];

    sscanf(geolite_ip, "p<.>dddd", geolite_octet1, geolite_octet2, geolite_octet3, geolite_octet4);

    format(calculations, sizeof (calculations), "(16777216*%d+%d)", geolite_octet1, (65536 * geolite_octet2) + (256 * geolite_octet3) + geolite_octet4);
    format(query, sizeof (query),

        "SELECT CASE (ip_from<=%s) \
                WHEN 1 THEN time_zone \
                ELSE '+00:00' \
                END AS time_zone \
           FROM city_blocks AS b,city_locations AS l \
          WHERE b.geoname_id=l.geoname_id AND ip_to>=%s \
          ORDER BY ip_to LIMIT 1;",

    calculations, calculations);

    geolite_result = db_query(GEOLITE_city_db, query);
    db_get_field(geolite_result, 0, geolite_dest, geolite_len);
    db_free_result(geolite_result);
    return 1;
}

stock IsIpProxy(const geolite_ip[])
{
    new geolite_AP[MAX_COUNTRY_LENGTH];

    if (GEOLITE_country_db != DB: 0)
    {
        return (GetIpCountry(geolite_ip, geolite_AP, MAX_COUNTRY_LENGTH) &&
            !strcmp(geolite_AP, "Anonymous Proxy"));
    }
    else if (GEOLITE_city_db != DB: 0)
    {
        return (GetIpCity(geolite_ip, geolite_AP, MAX_COUNTRY_LENGTH) &&
            !strcmp(geolite_AP, "Anonymous Proxy"));
    }
    return 0;
}

/*

native GetPlayerAutonomousSystem(playerid, geolite_dest[], geolite_len = sizeof (geolite_dest));
native GetPlayerCountry(playerid, geolite_dest[], geolite_len = sizeof (geolite_dest));
native GetPlayerCity(playerid, geolite_dest[], geolite_len = sizeof (geolite_dest));
native GetPlayerProvince(playerid, geolite_dest[], geolite_len = sizeof (geolite_dest));
native GetPlayerUTC(playerid, geolite_dest[], geolite_len = sizeof (geolite_dest));
native IsPlayerUsingProxy(playerid);

*/

stock GetPlayerAutonomousSystem(playerid, geolite_dest[], geolite_len = sizeof (geolite_dest))
{
    new geolite_ip[16];

    return (GetPlayerIp(playerid, geolite_ip, sizeof (geolite_ip)) != -1
        && GetIpAutonomousSystem(geolite_ip, geolite_dest, geolite_len));
}

stock GetPlayerCountry(playerid, geolite_dest[], geolite_len = sizeof (geolite_dest))
{
    new geolite_ip[16];

    return (GetPlayerIp(playerid, geolite_ip, sizeof (geolite_ip)) != -1
        && GetIpCountry(geolite_ip, geolite_dest, geolite_len));
}

stock GetPlayerCity(playerid, geolite_dest[], geolite_len = sizeof (geolite_dest))
{
    new geolite_ip[16];

    return (GetPlayerIp(playerid, geolite_ip, sizeof (geolite_ip)) != -1
        && GetIpCity(geolite_ip, geolite_dest, geolite_len));
}

stock GetPlayerProvince(playerid, geolite_dest[], geolite_len = sizeof (geolite_dest))
{
    new geolite_ip[16];

    return (GetPlayerIp(playerid, geolite_ip, sizeof (geolite_ip)) != -1
        && GetIpProvince(geolite_ip, geolite_dest, geolite_len));
}

stock GetPlayerUTC(playerid, geolite_dest[], geolite_len = sizeof (geolite_dest))
{
    new geolite_ip[16];

    return (GetPlayerIp(playerid, geolite_ip, sizeof (geolite_ip)) != -1
        && GetIpUTC(geolite_ip, geolite_dest, geolite_len));
}

stock IsPlayerUsingProxy(playerid)
{
    new geolite_ip[16];

    return (GetPlayerIp(playerid, geolite_ip, sizeof (geolite_ip)) != -1
        && IsIpProxy(geolite_ip));
}

/*

Internal functions:
    geolite_open_dbs();
    geolite_close_dbs();
	
*/

static geolite_open_dbs()
{
    if (fexist("maxmind_asn.db"))
    {
        GEOLITE_asn_db = db_open("maxmind_asn.db");
        db_free_result(db_query(GEOLITE_asn_db, "PRAGMA query_only = ON"));
    }

    if (fexist("maxmind_country.db"))
    {
        GEOLITE_country_db = db_open("maxmind_country.db");
        db_free_result(db_query(GEOLITE_country_db, "PRAGMA query_only = ON"));
    }

    if (fexist("maxmind_city.db"))
    {
        GEOLITE_city_db = db_open("maxmind_city.db");
        db_free_result(db_query(GEOLITE_city_db, "PRAGMA query_only = ON"));
    }
    
    if (fexist("maxmind_province.db"))
    {
        GEOLITE_province_db = db_open("maxmind_province.db");
        db_free_result(db_query(GEOLITE_province_db, "PRAGMA query_only = ON"));
    }
}

static geolite_close_dbs()
{
    if (GEOLITE_asn_db != DB: 0)
    {
        db_close(GEOLITE_asn_db);
    }

    if (GEOLITE_country_db != DB: 0)
    {
        db_close(GEOLITE_country_db);
    }

    if (GEOLITE_city_db != DB: 0)
    {
        db_close(GEOLITE_city_db);
    }
    
    if (GEOLITE_province_db != DB: 0)
    {
        db_close(GEOLITE_province_db);
    }
}
