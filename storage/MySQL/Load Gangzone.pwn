
new g_repository[8][3][E_REPOSITORY_STRUCT]; // gudang

// ------------------------------------------
enum E_GANG_REPOSITORY_STRUCT
{
	GR_GANG,
	GR_METALL,
	GR_AMMO,
	GR_DRUGS,
	GR_MONEY,
	Text3D: GR_LABEL,
	GR_PICKUP,
	bool: GR_LOCK
}

new g_gang_repository[MAX_GANG_REPOSITORIES][E_GANG_REPOSITORY_STRUCT]; // toko geng

// ------------------------------------------
enum E_GANG_ZONES_STRUCT
{
	Float: GZ_MIN_X,
	Float: GZ_MIN_Y,
	Float: GZ_MAX_X,
	Float: GZ_MAX_Y,
	GZ_GANG,
	GZ_ZONE,
	GZ_AREA
}

new g_gang_zone[MAX_GZ][E_GANG_ZONES_STRUCT]; // gangzone
new g_gang_zones_loaded; // jumlah gangzon yang dimuat

// ------------------------------------------
enum
{
	GANG_GROVE = 1,	// Groove
	GANG_VAGOS,		// The Aventazor
	GANG_BALLAS,	// Never Sleep Mafia
	GANG_AZTECAS,	// Mechanic
}

// ------------------------------------------
new gang_zone_colors[5] =
{
	0xFFFFFF90,	// Zona bebas
	0xFFD700FF, // Grove Gang
	0x800080FF, // The Aventazor
	0x8B0000FF,  // Unity Sky Drifter
	0x800080FF,  // Mechanic
};

new family_colors[17] =
{
	0xFFFFFFFF, // putih
	0xCD5C5CFF, // merah tua
	0xFF0000FF, // merah
	0x8B0000FF, // merah tua
	0xFFC0CBFF, // merah muda muda
	0xFFA07AFF, // warna kulit
	0xFFFF00FF, // kuning
	0xFFD700FF, // emas
	0xEE82EEFF, // ungu
	0x800080FF, // ungu tua
	0x808080FF, // abu-abu
	0xC0C0C0FF, // perak
	0x00FF00FF, // jeruk nipis
	0x008000FF, // hijau
	0x228B22FF, // hutan
	0x1E90FFFF, // biru
	0x00BFFFFF // warna langit
};

new family_colors_name[][32] =
{
	{"Putih"},
	{"Crimson"},
	{"Merah"},
	{"Merah gelap"},
	{"Merah muda muda"},
	{"Warna kulit"},
	{"Kuning"},
	{"Emas"},
	{"Ungu"},
	{"Ungu tua"},
	{"Abu-abu"},
	{"Perak"},
	{"Jeruk nipis"},
	{"Hijau"},
	{"Hutan"},
	{"Biru"},
	{"Warna langit"}
};

// ------------------------------------------
enum E_CAPTURE_STRUCT
{
	bool: C_STATUS,
	C_GANG_ZONE,
	C_ATTACK_TEAM,
	C_PROTECT_TEAM,
	C_ATTACKER_KILLS,
	C_PROTECTOR_KILLS,
	C_TIME,
	C_WAIT_TIME[4]
}

new g_capture[E_CAPTURE_STRUCT]; // topi untuk kelompok kejahatan terorganisir

// ------------------------------------------
new weapon_tints[6] =
{
	0xFF4B5320, // Kamuflase
	0xFF9EAF43, // Hijau
	0xFFFFAE1A, // Oranye
	0xFF0073E6, // Biru (polisi)
	0xFFFF1493, // Merah muda
	0xFFFFD700 	// Emas
};

enum
{
	WEAPON_TINT_CAMO = 0,
	WEAPON_TINT_GREEN = 1,
	WEAPON_TINT_ORANGE,
	WEAPON_TINT_POLICE,
	WEAPON_TINT_PINK,
	WEAPON_TINT_GOLD
}

enum E_WEAPON_TINT_STRUCT
{
	WT_OBJECT,
	Float: WT_X,
	Float: WT_Y,
	Float: WT_Z,
	Float: WT_RX,
	Float: WT_RY,
	Float: WT_RZ,
	Float: WT_SCALE_X,
	Float: WT_SCALE_Y,
	Float: WT_SCALE_Z
}



// ------------------------------------------
#define GetTeleportListData(%0,%1)		g_teleport_list[%0][%1]

// ------------------------------------------
#define GetGangZoneData(%0,%1)			g_gang_zone[%0][%1]
#define SetGangZoneData(%0,%1,%2)		g_gang_zone[%0][%1] = %2

// ------------------------------------------
#define GetGangRepositoryData(%0,%1)		g_gang_repository[%0][%1]
#define SetGangRepositoryData(%0,%1,%2)		g_gang_repository[%0][%1] = %2

// 



// ------------------------------------------
public: LoadGangZones()
{
	new idx;
	new Cache: result, rows;

	result = mysql_query(mysql, "SELECT * FROM gang_zones", true);
	rows = cache_num_rows();

	if(rows > MAX_GZ)
	{
		rows = MAX_GZ;
		print("[GangZones]: DB rows > MAX_GZ");
	}

	if(rows)
	{
		for(idx = 0; idx < rows; idx ++)
		{
			SetGangZoneData(idx, GZ_MIN_X,	cache_get_field_content_float(idx, "min_x"));
			SetGangZoneData(idx, GZ_MIN_Y,	cache_get_field_content_float(idx, "min_y"));
			SetGangZoneData(idx, GZ_MAX_X,	cache_get_field_content_float(idx, "max_x"));
			SetGangZoneData(idx, GZ_MAX_Y,	cache_get_field_content_float(idx, "max_y"));

			SetGangZoneData(idx, GZ_GANG,	cache_get_field_content_int(idx, "fraction"));

			// ----------------------------------------------------------------------------------
			g_gang_zone[idx][GZ_ZONE] = GangZoneCreate
			(
				GetGangZoneData(idx, GZ_MIN_X),
				GetGangZoneData(idx, GZ_MIN_Y),
				GetGangZoneData(idx, GZ_MAX_X),
				GetGangZoneData(idx, GZ_MAX_Y)
			);

			// ----------------------------------------------------------------------------------
			g_gang_zone[idx][GZ_AREA] = CreateDynamicRectangle
			(
				GetGangZoneData(idx, GZ_MIN_X),
				GetGangZoneData(idx, GZ_MIN_Y),
				GetGangZoneData(idx, GZ_MAX_X),
				GetGangZoneData(idx, GZ_MAX_Y)
			);
		}
	}

	g_gang_zones_loaded = rows;
	cache_delete(result);

	printf("[GangZones]: Gangzon dimuat: %d", g_gang_zones_loaded);
}


stock ShowGangZonesForPlayer(playerid)
{
	for(new idx; idx < sizeof g_gang_zone; idx ++)
	{
		GangZoneShowForPlayer(playerid, GetGangZoneData(idx, GZ_ZONE), gang_zone_colors[ GetGangZoneData(idx, GZ_GANG) ]);
	}

	if(g_capture[C_STATUS])
		GangZoneFlashForPlayer(playerid, GetGangZoneData(g_capture[C_GANG_ZONE], GZ_ZONE), gang_zone_colors[ g_capture[C_ATTACK_TEAM] ]);
}

stock UpdateGangZone(idx)
{
	if(!GetGangZoneData(idx, GZ_GANG))
	{
		new area_players[3];

		foreach(new i : Player)
		{
			if(!IsPlayerConnected(i)) continue;
			else if(!IsPlayerLogged(i)) continue;
			else if(!IsPlayerInDynamicArea(i, GetGangZoneData(idx, GZ_AREA))) continue;
			else if(!(TEAM_GANG_GROVE <= GetPlayerTeamEx(i) <= TEAM_BROKER)) continue;

			area_players[ GetPlayerTeamEx(i) - TEAM_GANG_GROVE ] ++;
		}

		for(new i; i < 4; i++)
		{
			if(area_players[i] < MIN_PLAYERS_FOR_CAPTURE) continue;

			SetGangZoneData(idx, GZ_GANG, i + 1);
			SaveGangZone(idx);

			GangZoneShowForAll(GetGangZoneData(idx, GZ_ZONE), gang_zone_colors[i + 1]);

			new fmt_text[50];

			format(fmt_text, sizeof fmt_text, "%s merebut wilayah baru", GetTeamName(i + TEAM_GANG_GROVE));
			SendMessageToGang(fmt_text, 0xFF5533FF);

			UpdateGangRepository(i);

			break;
		}
	}
}

stock SaveGangZone(idx)
{
	new query[55];

	mysql_format(mysql, query, sizeof query, "UPDATE gang_zones SET fraction=%d WHERE id=%d", GetGangZoneData(idx, GZ_GANG), idx + 1);
	mysql_query(mysql, query, false);
}

stock GetGangZonesCount(team)
{
	new count;

	for(new idx; idx < g_gang_zones_loaded; idx ++)
	{
		if(GetGangZoneData(idx, GZ_GANG) != team) continue;

		count ++;
	}

	return count;
}

// ------------------------------------------
public: LoadGangRepositories()
{
	new idx;
	new Cache: result, rows;

	result = mysql_query(mysql, "SELECT * FROM gang_repositories", true);
	rows = cache_num_rows();

	if(rows > MAX_GZ)
	{
		rows = MAX_GZ;
		print("[GangRepositories]: DB rows > MAX_GANG_REPOSITORIES");
	}

	for(idx = 0; idx < rows; idx ++)
	{
		SetGangRepositoryData(idx, GR_GANG, 		cache_get_field_content_int(idx, "id"));
		SetGangRepositoryData(idx, GR_METALL, 		cache_get_field_content_int(idx, "metall"));
		SetGangRepositoryData(idx, GR_AMMO, 		cache_get_field_content_int(idx, "ammo"));
		SetGangRepositoryData(idx, GR_DRUGS, 		cache_get_field_content_int(idx, "drugs"));
		SetGangRepositoryData(idx, GR_MONEY, 		cache_get_field_content_int(idx, "money"));

		SetGangRepositoryData(idx, GR_LOCK, 		bool: cache_get_field_content_int(idx, "lock"));

		new fmt_text[330],
			gang_id = GetGangRepositoryData(idx, GR_GANG);


		format
		(
			fmt_text, sizeof fmt_text,
			"Gudang\n\
			%s\n\n\
			{FFFFFF}Obat-obatan: {ff9900}%d èç 20000 ã\n\
			{FFFFFF}Kartrid: {ff9900}%d èç 50000 øò\n\
			{FFFFFF}Logam: {ff9900}%d èç 6000 êã\n\
			{FFFFFF}Uang: {3366FF}$%d\n\n\
			%s\
			",
			GetTeamName(idx + TEAM_GANG_GROVE),
			GetGangRepositoryData(idx, GR_DRUGS),
			GetGangRepositoryData(idx, GR_AMMO),
			GetGangRepositoryData(idx, GR_METALL),
			GetGangRepositoryData(idx, GR_MONEY),
			GetGangRepositoryData(idx, GR_LOCK) ? "{66CC33}Buka" : "{FF3300}Tertutup"
		);


		g_gang_repository[idx][GR_LABEL] = CreateDynamic3DTextLabel
		(
			fmt_text,
			0xFFFFFFFF,
			GetTeamData(idx + TEAM_GANG_GROVE, O_REPOSITORY_POS)[0],
			GetTeamData(idx + TEAM_GANG_GROVE, O_REPOSITORY_POS)[1],
			GetTeamData(idx + TEAM_GANG_GROVE, O_REPOSITORY_POS)[2] + 1.5,
			10.0
		);

		g_gang_repository[idx][GR_PICKUP] = CreatePickup
		(
			1239,
			23,
			GetTeamData(idx + TEAM_GANG_GROVE, O_REPOSITORY_POS)[0],
			GetTeamData(idx + TEAM_GANG_GROVE, O_REPOSITORY_POS)[1],
			GetTeamData(idx + TEAM_GANG_GROVE, O_REPOSITORY_POS)[2],
			-1,
			PICKUP_ACTION_TYPE_GANG_REPOSIT,
			gang_id
		);
	}

	cache_delete(result);

	printf("[GangRepositories]: Gudang Gang dimuat");
}

stock UpdateGangRepository(idx)
{
	new fmt_text[330];

	format
	(
		fmt_text, sizeof fmt_text,
		"Gudang\n\
		%s\n\n\
		{FFFFFF}Obat-obatan: {ff9900}%d dari 20000 g\n\
		{FFFFFF}Kartrid: {ff9900}%d dari 50000 pcs\n\
		{FFFFFF}Logam: {ff9900}%d dari 6000 kg\n\
		{FFFFFF}Uang: {3366FF}$%d\n\n\
		%s\
		",
		GetTeamName(idx + TEAM_GANG_GROVE),
		GetGangRepositoryData(idx, GR_DRUGS),
		GetGangRepositoryData(idx, GR_AMMO),
		GetGangRepositoryData(idx, GR_METALL),
		GetGangRepositoryData(idx, GR_MONEY),
		GetGangRepositoryData(idx, GR_LOCK) ? "{66CC33}Buka" : "{FF3300}Tertutup"
	);

	UpdateDynamic3DTextLabelText(GetGangRepositoryData(idx, GR_LABEL), 0xFFFFFFFF, fmt_text);
}


public: LoadOwnableCars()
{
	new rows, vehicleid;
	new Cache: result;

	result = mysql_query(mysql, "SELECT oc.*, IFNULL(a.name, 'None') AS owner_name FROM ownable_cars oc LEFT JOIN accounts a ON a.id = oc.owner_id", true);
	rows = cache_num_rows();

	if(rows > MAX_OWNABLE_CARS)
	{
		rows = MAX_OWNABLE_CARS;
		print("[OwnableCars]: DB rows > MAX_OWNABLE_CARS");
	}
	for(new idx; idx < rows; idx ++)
	{
		SetOwnableCarData(idx, OC_SQL_ID, 		cache_get_field_content_int(idx, "id"));
		SetOwnableCarData(idx, OC_OWNER_ID, 	cache_get_field_content_int(idx, "owner_id"));

		SetOwnableCarData(idx, OC_MODEL_ID, 	cache_get_field_content_int(idx, "model_id"));
		SetOwnableCarData(idx, OC_COLOR_1, 		cache_get_field_content_int(idx, "color_1"));
		SetOwnableCarData(idx, OC_COLOR_2, 		cache_get_field_content_int(idx, "color_2"));

		SetOwnableCarData(idx, OC_POS_X, 		cache_get_field_content_float(idx, "pos_x"));
		SetOwnableCarData(idx, OC_POS_Y, 		cache_get_field_content_float(idx, "pos_y"));
		SetOwnableCarData(idx, OC_POS_Z, 		cache_get_field_content_float(idx, "pos_z"));
		SetOwnableCarData(idx, OC_ANGLE, 		cache_get_field_content_float(idx, "angle"));

		SetOwnableCarData(idx, OC_World, 		cache_get_field_content_int(idx, "World"));
		SetOwnableCarData(idx, OC_Int, 			cache_get_field_content_int(idx, "Inter"));

		cache_get_field_content(idx, "number", g_ownable_car[idx][OC_NUMBER], mysql, 8);

		SetOwnableCarData(idx, OC_KEY_IN, 		bool: cache_get_field_content_int(0, "key_in"));

		SetOwnableCarData(idx, OC_CREATE, 		cache_get_field_content_int(0, "create_time"));

		SetOwnableCarData(idx, OC_PT_ENGINE, 	cache_get_field_content_int(0, "pt_engine"));
		SetOwnableCarData(idx, OC_PT_BRAKE, 	cache_get_field_content_int(0, "pt_brake"));
		SetOwnableCarData(idx, OC_PT_STABILITY, cache_get_field_content_int(0, "pt_stability"));

		SetOwnableCarData(idx, OC_PAINTJOBID, 	cache_get_field_content_int(0, "paintjob"));
		SetOwnableCarData(idx, OC_COMPID, 		cache_get_field_content_int(0, "componentid"));

		SetOwnableCarData(idx, OC_SPOILER, 		cache_get_field_content_int(0, "Spoiler"));
		SetOwnableCarData(idx, OC_NITRO, 		cache_get_field_content_int(0, "Nitro"));
		SetOwnableCarData(idx, OC_LAMPS, 		cache_get_field_content_int(0, "Lamps"));
		SetOwnableCarData(idx, OC_SIDES, 		cache_get_field_content_int(0, "Sides"));
		SetOwnableCarData(idx, OC_HOOD, 		cache_get_field_content_int(0, "Hood"));
		SetOwnableCarData(idx, OC_VENTS, 		cache_get_field_content_int(0, "Vents"));
		SetOwnableCarData(idx, OC_EXHAUST, 		cache_get_field_content_int(0, "Exhaust"));
		SetOwnableCarData(idx, OC_WHEELS, 		cache_get_field_content_int(0, "Wheels"));
		SetOwnableCarData(idx, OC_RBUMP, 		cache_get_field_content_int(0, "RBumper"));
		SetOwnableCarData(idx, OC_FBUMP, 		cache_get_field_content_int(0, "FBumper"));
		SetOwnableCarData(idx, OC_ROOF, 		cache_get_field_content_int(0, "Roof"));

		// ----------------------------------------------------------------------------------------


		if(strlen(GetOwnableCarData(idx, OC_NUMBER)) != 6)
			strmid(g_ownable_car[idx][OC_NUMBER], "------", 0, 8, 8);

		vehicleid = CreateVehicle
		(
			GetOwnableCarData(idx, OC_MODEL_ID),
			GetOwnableCarData(idx, OC_POS_X),
			GetOwnableCarData(idx, OC_POS_Y),
			GetOwnableCarData(idx, OC_POS_Z),
			GetOwnableCarData(idx, OC_ANGLE),
			GetOwnableCarData(idx, OC_COLOR_1),
			GetOwnableCarData(idx, OC_COLOR_2),
			-1,
			0,
			VEHICLE_ACTION_TYPE_OWNABLE_CAR,
			idx
		);
		LinkVehicleToInterior(vehicleid, GetOwnableCarData(idx, OC_Int));
		SetVehicleVirtualWorld(vehicleid, GetOwnableCarData(idx, OC_World));
		if(vehicleid != INVALID_VEHICLE_ID)
		{
			CreateVehicleLabel(vehicleid, GetOwnableCarData(idx, OC_NUMBER), 0xFFFF00EE, 0.0, 0.0, 1.3, 20.0);
			SetVehicleParam(vehicleid, V_LOCK, bool: cache_get_field_content_int(idx, "status"));
			SetVehicleData(vehicleid, V_MILEAGE, cache_get_field_content_float(idx, "mileage"));
			ChangeVehiclePaintjob(vehicleid, GetOwnableCarData(idx, OC_PAINTJOBID));
			AddVehicleComponent(vehicleid, GetOwnableCarData(idx, OC_COMPID));
			AddVehicleComponent(vehicleid, GetOwnableCarData(idx, OC_SPOILER));
			AddVehicleComponent(vehicleid, GetOwnableCarData(idx, OC_NITRO));
			AddVehicleComponent(vehicleid, GetOwnableCarData(idx, OC_LAMPS));
			AddVehicleComponent(vehicleid, GetOwnableCarData(idx, OC_SIDES));
			AddVehicleComponent(vehicleid, GetOwnableCarData(idx, OC_HOOD));
			AddVehicleComponent(vehicleid, GetOwnableCarData(idx, OC_VENTS));
			AddVehicleComponent(vehicleid, GetOwnableCarData(idx, OC_EXHAUST));
			AddVehicleComponent(vehicleid, GetOwnableCarData(idx, OC_WHEELS));
			AddVehicleComponent(vehicleid, GetOwnableCarData(idx, OC_RBUMP));
			AddVehicleComponent(vehicleid, GetOwnableCarData(idx, OC_FBUMP));
			AddVehicleComponent(vehicleid, GetOwnableCarData(idx, OC_ROOF));
		}
	}
	g_ownable_car_loaded = rows;
	cache_delete(result);

	printf("[OwnableCars]: Mobil pribadi dimuat: %d", g_ownable_car_loaded);
}
