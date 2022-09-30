
// ------------------------------------------
#define ACCOUNT_STATE_NONE 		0
#define ACCOUNT_STATE_REGISTER 	1
#define ACCOUNT_STATE_LOGIN 	2
#define ACCOUNT_STATE_REG_SKIN 	3


// ------------------------------------------
#define GetPlayerData(%0,%1) 	g_player[%0][%1]
#define SetPlayerData(%0,%1,%2)	g_player[%0][%1] = %2
#define AddPlayerData(%0,%1,%2,%3) g_player[%0][%1] %2= %3

#define GetPlayerAccountID(%0)	GetPlayerData(%0, P_ACCOUNT_ID) 	// id akun
#define GetPlayerIpEx(%0)		GetPlayerData(%0, P_IP) 			// pemain ip
#define GetPlayerNameEx(%0)		GetPlayerData(%0, P_NAME) 			// nama pemain
#define GetPlayerColorEx(%0)	GetPlayerData(%0, P_COLOR)			// warna pemain
#define GetPlayerSelectSkin(%0)	GetPlayerData(%0, P_SELECT_SKIN) 	// kulit yang dipilih
#define GetPlayerLevel(%0)		GetPlayerData(%0, P_LEVEL)			// tingkat pemain
#define GetPlayerExp(%0)		GetPlayerData(%0, P_EXP)			// poin pengalaman pemain
#define GetPlayerSuspect(%0)	GetPlayerData(%0, P_SUSPECT)		// level yang diinginkan pemain
#define GetExpToNextLevel(%0)	((GetPlayerData(%0, P_LEVEL))*6) 	// poin pengalaman ke tingkat berikutnya
#define GetPlayerPhone(%0)		GetPlayerData(%0, P_PHONE)			// nomor telepon pemain
#define GetPlayerSex(%0)		GetPlayerData(%0, P_SEX)			// jenis kelamin pemain
#define GetPlayerSexName(%0)	GetPlayerData(%0, P_SEX) ? ("Perempuan") : ("Laki-laki") // nama gender
#define GetPlayerChatType(%0)	GetPlayerData(%0, P_CHAT_TYPE) 		// jenis obrolan
#define	GetPlayerAdminEx(%0)	GetPlayerData(%0, P_ADMIN) 			// tingkat admin
#define GetPlayerMoneyEx(%0)	GetPlayerData(%0, P_MONEY) 			// uang pemain
#define GetPlayerBankMoney(%0)	GetPlayerData(%0, P_BANK) 			// uang pemain
#define GetPlayerAFKTime(%0)	GetPlayerData(%0, P_AFK_TIME) 		// waktu afk
#define GetPlayerLastVehicle(%0) GetPlayerData(%0, P_LAST_VEHICLE) 	// id mobil terakhir di mana dia duduk
#define GetPlayerJobCar(%0)		GetPlayerData(%0, P_JOB_CAR) 		// transportasi kerja
#define GetPlayerJob(%0)		GetPlayerData(%0, P_JOB) 			// bekerja
#define GetPlayerInBiz(%0)		GetPlayerData(%0, P_IN_BUSINESS) 	// bisnis apa yang telah masuk\terletak
#define GetPlayerInHouse(%0)	GetPlayerData(%0, P_IN_HOUSE) 		// rumah apa yang dia masuki\terletak
#define GetPlayerTeamEx(%0)		GetPlayerData(%0, P_TEAM)			// organisasi pemain adalah anggota
#define GetPlayerHealthEx(%0)	GetPlayerData(%0, P_HEALTH)			// jumlah kesehatan
#define GetPlayerPremium(%0)	GetPlayerData(%0, P_PREMIUM)		// akun premium


// ------------------------------------------
new g_player[MAX_PLAYERS][E_PLAYER_STRUCT];
new
	g_player_default_values[E_PLAYER_STRUCT] =
{
	0,		// id akun
	0,		// referensi
	0,		// jenis kelamin pemain
	"",		// kata sandi pemain
	"None",	// email pemain
	false, 	// apakah email diverifikasi
	0,		// kulit pemain
	0,      // Paspor
	0,		// uang pemain
	0,		// uang di bank
	ADMIN_TYPE_NONE, // tingkat admin
	false,	// lisensi moto
	false,	// lisensi manajemen mobil
	false,	// surat izin mengemudi truk
	false,	// lisensi manajemen bus
	false,	// lisensi penerbangan
	false,	// lisensi renang
	false,	// izin usaha
	false,	// lisensi senjata
	-1,     // Exam car
	0,		// waktu pendaftaran
	"255.255.255.255",	// tidak terdaftar
	"255.255.255.255",	// un di entri terakhir
	1,		// tingkat pemain
	0,		// poin pengalaman pemain
	0,		// tingkat yang diinginkan
	0,		// nomor telepon
	0,		// di akun telepon
	0,		// warna ponsel
	0,		// taat hukum
	0, 		// perbaikan
	0,		// obat-obatan
	0,		// kartrid
	0,		// logam
	0,		// istri
	0,		// organisasi
	0,		// kulit organisasi
	0,		// unit
	0,		// gaji
	0,		// bekerja / posisi(peringkat)
	HOUSE_TYPE_NONE, // tipe perumahan (rumah/hotel/pergi)
	-1,		// kamar di rumah
	-1,		// rumah
	-1,		// bisnis
	-1,	 	// pompa bensin
	"None", // ponsel pemain sungguhan
	"None", // kode pin
	REQUEST_TYPE_OFF, // permintaan telepon untuk otorisasi
	REQUEST_TYPE_OFF, // meminta kode PIN selama otorisasi
	// -------------------------
	0,					// waktu login terakhir\keluar
	// -------------------------
	0,					// waktu bermain per jam
	0,					// waktu permainan per hari
	0,					// waktu pertandingan kemarin
	// -------------------------
	0xFFFFFF11,			// warna pemain
	-1,					// kulit yang dipilih
	0,					// jenis obrolan
	0,					// waktu afk
	INVALID_VEHICLE_ID, // id mobil terakhir di mana dia duduk
	INVALID_DIALOG_ID,	// dialog terakhir id
	USE_ANIM_TYPE_NONE,	// jenis animasi yang digunakan
	ENTER_PASSWORD_ATTEMPS,// upaya otorisasi
	INVALID_PLAYER_ID,	// ditujukan pada pemain
	100.0,				// pemain hp
	0,
	// -------------------------
	TEMP_JOB_NONE,		// pekerjaan sementara
	TEMP_JOB_STATE_NONE,// tindakan apa yang harus dilakukan
	false,				// pemeriksaan animasi
	// ---------------------------------
	"",					// nama layanan
	0,					// tarif
	0,					// Gaji
	0,					// Spawn/ditunda (muatan/bijih)
	INVALID_VEHICLE_ID,	// transportasi kerja
	-1,					// timer shutdown
	-1,					// Meja mana yang digunakan pabrik?
	0, 					// rute bus
	0,					// langkah rute
	0,					// langkah rute
	0,					// langkah rute
	0,					// terselip di N
	0,					// diperbaharui pada N $
	false,				// apakah sedang bekerja
	// -------------------------
	false,				// status otorisasi
	false,				// Apakah animku digunakan (/anim)
	false,				// blokir panggilan OnPlayerLeaveDynamicArea
	false,				// adalah animasi yang dimuat saat menelurkan
	false,				// adalah binatang yang Spawn
	false,				// apakah pemain memiliki camilan
	Text3D: -1,			// Lencana penasihat
	false,				// nonaktifkan organisasi obrolan
	// -------------------------
	-1, 				// waktu untuk otorisasi
	-1, 				// bisnis apa yang telah masuk
	-1, 				// rumah apa yang dia masuki
	-1,					// id truk pickup terakhir
	-1,					// di kamar mana di hotel
	0,					// di lantai berapa di hotel
	0,					// kotak P3K
	0,					// topeng
	0,					// tiket lotere
	0,					// penggunaan minuman
	REALTOR_TYPE_NONE,	// makelar
	INVALID_VEHICLE_ID,	// id kendaraan pribadi
	INVALID_VEHICLE_ID,	// id bagasi mobil bekas
	// -------------------------
	"255.255.255.255", 	// pemain ip
	"", 				// nama pemain
	"—", 				// nama istri/suami
	// -------------------------
	ACCOUNT_STATE_NONE, // status akun (otorisasi/pendaftaran)
	0, 					// langkah (pendaftaran/otorisasi)
	// -------------------------
	0,             		// Varna
	0,                  // Admin peringatkan
	0,        			// waktu varna
	0,             		// waktu muta
	// -------------------------
	0, 					// kekuatan
	0,     				// skill colt
	0,   				// skill gun dengan peredam
	0,     				// skill deagle
	0,    				// shotgun keterampilan
	0,        			// skill mp5
	0,	    			// skill ak47
	0,         			// skill m4
	0,					// skill sniper rifle
	0,    				// keterampilan senapan digergaji
	0,  				// keterampilan senapan taktis
 	0,  				// keterampilan micro-ultrasound
 	// -------------------------
 	0,                   // tempat bertelur
	// -------------------------
	0,					// saldo donasi saat ini
	0,					// total pengisian poin donasi
	// -------------------------
	false,				// ada di rumah sakit
	-1,					// nomor tempat tidur
	// -------------------------
	false,				// apakah senjata memuat ulang
	0,					// jumlah ulang
	0,					// borgol pada pemain (0 - tidak, 1 - borgol, 2 - tali)
	INVALID_PLAYER_ID,	// siapa yang memimpin
	// -------------------------
	INVALID_VEHICLE_ID,	// Apakah membeli mobil
	INVALID_VEHICLE_ID,	// mobil sewaan
	INVALID_VEHICLE_ID,	// mobil tepercaya
	1,					// jumlah slot untuk mobil
	// -------------------------
	0,					// saat dipenjara
	// -------------------------
	0,					// pewarnaan senjata
	// -------------------------
	0,					// tingkat akun premium
	0,                  // Date premium
	1,                  // premium chat
	// -------------------------
	0,       			// loader keterampilan
	0,    				// keterampilan penebang pohon
	0,          		// deposit
	-1,           		// id keluarga
	0,      			// pangkat keluarga
	0,        			// memancing
	0,         			// berapa kilogram ikan
	// ------------------------
	0,          		// Pengguna versi PC
	-1,                 // ID berhenti
	0,                  // Langkah perjalanan
	100,                // Kebutuhan: Kelaparan
	100,                // Kebutuhan: Haus
	// ------------------------
	0.0,     			// posisi keluar
	0.0,     			// posisi keluar
	0.0,    			// posisi keluar
	0.0,     			// posisi keluar
	0,    				// Wirth. keluar dari dunia
	0,          		// keluar interior
	0,                  // properti di mana
	0,                  // pergi bekerja (ATWORK)
	// ------------------------
	0,                  // uang yang diperoleh pengemudi truk
	0,     				// tingkat sopir truk
	0.0, 				// berapa kilometer perjalanan dengan truk
	INVALID_VEHICLE_ID,	// id truk yang disewa
	INVALID_VEHICLE_ID,	// id cuplikan yang mengambil
	0,       			// nomor pesanan yang diambil
	0,                  // sopir truk mulai bekerja
	0,                  // pada mp atau tidak
	-1,                 // apakah itu di belakang bangku
	0,                  // sepatu kuda
	-1,					// timer akselerasi otomatis
	0,            // Bonus
	0,            // Bonus
	0,   // GYM
	0,   // GYM
	0, // GYM
	0, // GYM
	0,    // GYM
	//----------------------- (( Penambahan Lesson Roleplay + ))
	0,
	0,
	//----------------------- (( pass system ))
	0,
	0,
	0,
	//----------------------- (( Last position of crash ))
	0.0,
	0.0,
	0.0,
};

new mysql_race[MAX_PLAYERS];

new Float: g_taxi_mileage[MAX_PLAYERS] = {0.0, ...};

new following_timer[MAX_PLAYERS] = {-1, ...};
new bool: vehicle_nitro[MAX_VEHICLES] = {false, ...};

// ------------------------------------------
new g_ownable_car[MAX_OWNABLE_CARS][E_OWNABLE_CAR_STRUCT];
new g_ownable_car_loaded;

// ------------------------------------------
new g_vehicle_trunk[MAX_VEHICLES][MAX_VEHICLE_TRUNK_SLOTS][E_VEHICLE_TRUNK_STRUCT];


public OnPlayerRequestSpawn(playerid)
{
	CheckPlayerFlood(playerid, true, MAX_FLOOD_RATE, FLOOD_RATE_INC, FLOOD_RATE_KICK);

	if(!IsPlayerLogged(playerid))
	{
		new a_state = GetPlayerData(playerid, P_ACCOUNT_STATE);
		if(a_state != ACCOUNT_STATE_REG_SKIN)
		{
			new fmt_str[64];
			format(fmt_str, sizeof fmt_str, "{FFFFFF}Untuk bermain di server Anda harus %s", a_state == ACCOUNT_STATE_REGISTER ? ("terdaftar") : ("masuk"));

			Dialog
			(
				playerid, INVALID_DIALOG_ID, DIALOG_STYLE_MSGBOX,
				"Kesalahan",
				fmt_str,
				"Tutup", ""
			);
			Kick:(playerid);
			SendClientMessage(playerid, 0xCECECEFF, fmt_str[8]);
		}
	}
}


public OnPlayerSpawn(playerid)
{
    SetPlayerChatBubble(playerid, "**Datang mengunjungi anda**", 0xFF5533FF, 10.5, 5000);
    SetCameraBehindPlayer(playerid);
	TogglePlayerControllable(playerid, true);
    TogglePlayerSpectating(playerid, false);
	SetPlayerAttachedObject(playerid, 5, 3026, 1,-0.1, -0.1, 0.0, 0.0, 0.0, 0.0, 1, 1, 1, 0xFF00FF00);
    GameTextForPlayer(playerid, "~r~Verfication Complete...", 3000, 3);
    TextDrawHideForPlayer(playerid, TakeDamage[playerid]);
    StopAudioStreamForPlayer (playerid);

	TwData[playerid][LoggedIn] = 1;
	LoadTwitter(playerid);

	CheckPlayerFlood(playerid, true, MAX_FLOOD_RATE, 500, FLOOD_RATE_KICK);
	SetPlayerData(playerid, P_IN_HOUSE, 		-1);
	SetPlayerData(playerid, P_IN_BUSINESS, 		-1);
	SetPlayerData(playerid, P_IN_HOTEL_FLOOR, 	-1);
	SetPlayerData(playerid, P_IN_HOTEL_ROOM, 	-1);

	SetPlayerSkillsInit(playerid);

	if(!IsPlayerLogged(playerid))
	{
	    SendClientMessage(playerid, 0xCECECEFF, "Karakter yang anda pakai terspawnkan. Namun akun ini harus login segera.");
	    //CheckPlayerAccount(playerid, mysql_race[playerid]); // check data login
		if(GetPlayerData(playerid, P_ACCOUNT_STATE) == ACCOUNT_STATE_REG_SKIN)
		{
	}
  
}


stock SelectPlayerSpawn(playerid, spawntype)
{
	SetCameraBehindPlayer(playerid);
	new query[128],
		time = gettime();
	if(spawntype == 0)
	{
    	SetPlayerSpawnInit(playerid);
	}
	else if(spawntype != 0)
	{
        SetSpawnInfo
		(
			playerid,
			0,
			GetPlayerSkinEx(playerid),
			GetPlayerData(playerid, P_LAST_X),
			GetPlayerData(playerid, P_LAST_Y),
			GetPlayerData(playerid, P_LAST_Z),
			GetPlayerData(playerid, P_LAST_FA),
			0, 0, 0, 0, 0, 0
		);
		SetPlayerData(playerid, P_POS_X, 0.0);
		mysql_format(mysql, query, sizeof query, "UPDATE accounts SET last_x = '0.0' , last_y = '0.0', last_z = '0.0' , last_fa = '0.0' WHERE id = '%d'", GetPlayerAccountID(playerid));
		mysql_tquery(mysql, query, "", "");

	}
	//SpawnPlayer(playerid);

	if(GetPlayerData(playerid, P_SKIN))
	{
		mysql_format(mysql, query, sizeof query, "UPDATE accounts SET last_ip='%e',last_login=%d WHERE id=%d LIMIT 1", GetPlayerIpEx(playerid), time, GetPlayerAccountID(playerid));
		mysql_tquery(mysql, query, "", "");

		new player_admin_rank = GetPlayerAdminEx(playerid);

		if(player_admin_rank)
		{
			new admin_rank[6][32] =
			{
				"administrator tingkat pertama",
				"administrator tingkat kedua",
				"administrator tingkat ketiga",
				"administrator tingkat keempat",
				"administrator tingkat kelima",
				"administrator tingkat keenam"
			};

			format(query, sizeof query, "LO MASUK SEBAGAI %s", admin_rank[ player_admin_rank - 1 ]);
			SendClientMessage(playerid, 0xFFFF00FF, query);
		}

		new player_premium = GetPlayerData(playerid, P_PREMIUM_DATE);

		if(player_premium)
		{
			if((player_premium - time) > 0)
			{
			    new premium_day,
			        premium_month,
			        premium_year;

				timestamp_to_date(player_premium, premium_year, premium_month, premium_day);

				format
				(
					query, sizeof query,
					"Status VIP Anda berlaku hingga {FFFFFF}%02d.%02d.%d",
					premium_day, premium_month, premium_year
				);
				SendClientMessage(playerid, 0xEC174FFF, query);
			}
			else
			{
			    format(query, sizeof query, "Status VIP telah kedaluwarsa. Untuk memperbarui langganan Anda, gunakan: {FFFFFF}/mn > Opsional");
				SendClientMessage(playerid, 0xEC174FFF, query);

				SetPlayerData(playerid, P_PREMIUM, 					0);

				UpdatePlayerDatabaseInt(playerid, "premium", 		0);
			}
		}

		if(GetPlayerData(playerid, P_WARN) > 0)
		{
			if(time > GetPlayerData(playerid, P_WARN_TIME))
			{
				SetPlayerData(playerid, P_WARN, 0);
				SetPlayerData(playerid, P_WARN_TIME, 0);
			}
			else
			{
				format(query, sizeof query, "Jumlah peringatan: %d dari 3", GetPlayerData(playerid, P_WARN));
				SendClientMessage(playerid, 0xCECECEFF, query);
				SendClientMessage(playerid, 0xCECECEFF, "Setelah 3 peringatan, akun akan diblokir");
			}
		}
		format(query, sizeof query, "Aktif saat ini: {FFFF00}%d orangnya",online);
		SendClientMessage(playerid, -1, "Selamat datang di server {00ff00}Lesson Roleplay!");
		SendClientMessage(playerid, -1, "Discord LRP:{00ffff} https://discord.gg/LRP");
		SendClientMessage(playerid, -1, "{ffffff}Website:{ffff00} Comingsoon");
		SendClientMessage(playerid, -1, "{00ff00} Pendiri Server, Semua Pengurus Lesson");
		SendClientMessage(playerid, -1, "{00ffff}•[Petunjuk] Jangan Lupa /rphelp /autorphelp untuk mengetahui Autorp");
		SendClientMessage(playerid, -1, "{00ffff}•[Petunjuk] Jangan Lupa /fixhelp untuk mengetahui cara fix bug");
		SendClientMessage(playerid, -1, query);

        StopAudioStreamForPlayer(playerid);

		SetPlayerInit(playerid); // login succsec
		if(GetPlayerData(playerid,P_BONUS_GET) == 1) return false;
		{
			SetPlayerData(playerid,P_BONUS_DAY,GetPlayerData(playerid,P_BONUS_DAY)+1);
			new fmt_text[256];
			new bonus = GetPlayerData(playerid,P_BONUS_DAY) * 1500;
			printf("Mengambil bonus %s , sebelum bonus rekening bank %d",GetPlayerNameEx(playerid),GetPlayerData(playerid, P_BANK));
			AddPlayerData(playerid, P_BANK, +, bonus);
			SetPlayerData(playerid,P_BONUS_GET,1);
			printf("Mengambil bonus %s , setelah akun bonus bank %d",GetPlayerNameEx(playerid),GetPlayerData(playerid, P_BANK));
			format(fmt_text, sizeof fmt_text, "{ffffff}Selamat datang{FFFF00} %s\n{ffffff}Hadiah harian {FFFF00}%d/7\n{ffffff}Hadiah:{FFFF00}%d$\n\n{6d6d6d}Bonus dikreditkan ke rekening bank utama.", GetPlayerNameEx(playerid), GetPlayerData(playerid,P_BONUS_DAY),bonus);
			Dialog(playerid,0,DIALOG_STYLE_MSGBOX,"Bonus harian",fmt_text,"Selanjutnya","");
			format(fmt_text, sizeof fmt_text, "UPDATE `accounts` SET loginday = '%d', bonusget = '1' WHERE id = '%d' LIMIT 1", GetPlayerData(playerid, P_BONUS_DAY), GetPlayerAccountID(playerid));
			mysql_query(mysql, fmt_text);
		    if(GetPlayerData(playerid,P_BONUS_DAY) >= 7) return SetPlayerData(playerid,P_BONUS_DAY,0),UpdatePlayerDatabaseInt(playerid, "loginday", 0);
		}
	}
	else
	{
		SetPlayerData(playerid, P_ACCOUNT_STATE, ACCOUNT_STATE_REG_SKIN);
		SendClientMessage(playerid, 0x32a44bFF, "Pilih penampilan karakter Anda");
	}
	return 1;
}


stock SetPlayerSkillAmount(playerid, skill_index, amount)
{
	switch(skill_index)
	{
		case 0: SetPlayerData(playerid, P_POWER, amount);
		case 1: SetPlayerData(playerid, P_SKILL_COLT, amount);
		case 2: SetPlayerData(playerid, P_SKILL_SDPISTOL, amount);
		case 3: SetPlayerData(playerid, P_SKILL_DEAGLE, amount);
		case 4: SetPlayerData(playerid, P_SKILL_SHOTGUN, amount);
		case 5: SetPlayerData(playerid, P_SKILL_MP5, amount);
		case 6: SetPlayerData(playerid, P_SKILL_AK47, amount);
		case 7: SetPlayerData(playerid, P_SKILL_M4, amount);
		case 8: SetPlayerData(playerid, P_SKILL_SNIPER_RIFLE, amount);
		case 9: SetPlayerData(playerid, P_SKILL_SAWNOFF, amount);
		case 10: SetPlayerData(playerid, P_SKILL_COMBAT_SG, amount);
		case 11: SetPlayerData(playerid, P_SKILL_MICRO_UZI, amount);
	}

	return 1;
}


public: CheckPlayerAccount(playerid, race)
{
	if(race == mysql_race[playerid])
	{
		new query[75];
		new Cache: result, is_account_exist;

		mysql_format(mysql, query, sizeof query, "SELECT * FROM accounts WHERE name='%e' LIMIT 1", GetPlayerNameEx(playerid));
		result = mysql_query(mysql, query);

		if(!mysql_errno())
		{
			is_account_exist = bool: cache_num_rows();
			SetPlayerData(playerid, P_ACCOUNT_STATE, is_account_exist + 1);

	}
}
