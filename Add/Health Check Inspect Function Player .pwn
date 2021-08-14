
// ------------------------------------------
enum E_PLAYER_STRUCT // struktur pemain
{
	P_ACCOUNT_ID, 	// id akun
	P_REFER,		// referensi
	P_SEX,			// jenis kelamin pemain
	P_ANAME,        // Nama Admin
	P_PASSWORD[64], // kata sandi pemain
	P_EMAIL[60 + 1],// email pemain
	bool: P_CONFIRM_EMAIL,// apakah email diverifikasi
	P_SKIN,			// kulit pemain
	P_PASS,         // Paspor
	P_MONEY,		// uang pemain
	P_BOOMBOX,      // boombox pemain
	P_LAPAR,        // Lapar Pemain
	P_HAUS,         // Haus Pemain
	P_KENCING,      // Kencing Pemain
	P_BANK,			// uang di bank
	P_ADMIN,		// tingkat admin
	P_DRIVING_A,	// lisensi moto
	P_DRIVING_B,	// lisensi manajemen mobil
	P_DRIVING_C,	// surat izin mengemudi truk
	P_DRIVING_D,	// lisensi manajemen bus
	P_LIC_FLY,		// lisensi senjata
	P_LIC_WATER,	// lisensi senjata
	P_LIC_BIZ,		// lisensi senjata
	P_LIC_WEAPON,	// lisensi senjata
	P_TRUCKER_LIC,  // lisensi trucker
	P_LUMBERJACK_LIC,   // lisensi lumberjack
	P_EXAM_CAR,
	P_SCHOOL,
	P_IN_SCH,
	P_REG_TIME,		// waktu pendaftaran
	P_REG_IP[16],	// tidak terdaftar
	P_LAST_IP[16],	// un di entri terakhir
	P_LEVEL,		// tingkat pemain
	P_EXP,			// poin pengalaman pemain
	P_SUSPECT,		// tingkat yang diinginkan
	P_PHONE,		// nomor telepon
	P_PHONE_BALANCE,// di akun telepon
	P_PHONE_COLOR,	// warna ponsel
	P_LAW_ABIDING,	// taat hukum
	P_IMPROVEMENTS, // perbaikan
	P_DRUGS,		// obat-obatan
	P_SEEDS,
	P_GANJA,
	P_AMMO,			// kartrid
	P_METALL,		// logam
	P_WIFE,			// istri
	P_TEAM,			// organisasi
	P_OSKIN,		// kulit organisasi
	P_SUBDIVISON,	// unit
	P_WAGE,			// gaji
	P_JOB,			// bekerja / posisi(peringkat)
	P_HOUSE_TYPE,	// tipe perumahan (rumah/hotel/pergi)
	P_HOUSE_ROOM,	// kamar di rumah
	P_HOUSE,		// rumah
	P_BUSINESS,		// bisnis
	P_FUEL_ST,	 	// pompa bensin
	P_SETTING_PHONE[13],// ponsel pemain sungguhan
	P_SETTING_PIN[5], 	// kode pin
	P_REQUEST_PHONE,	// permintaan telepon untuk otorisasi
	P_REQUEST_PIN,		// meminta kode PIN selama otorisasi
	pComponent,        // component pemain
	P_DELAYTRUCK,           // Delay truck
	P_DELAY_DEATH,         // delay /acceptdeath
	P_DELAY_SWEEPER,      // delay sweeper job.
    P_DELAY_MINING,      // delay nambang di LS
	P_EXITJOB,          // Exit Job Delay
	P_BUYPVMODEL,       // buy pv model
	P_GETJOB,           // Getjob
	P_WALKIETALKIE,     // Walkie Talkie
	P_WTFREQ,           // Frequensi Walkie Talkie
	P_TOGPM,            // tog pm player
	P_TOGOOC,           // tog ooc player
	P_DELAYBUS,         // delay bus
	P_DELAYLUMBER,      // delay lumberjack
	P_CHAINSAW,         // Chainsaw
	P_SIDEJOB,          // sidejob
	Float:P_FARENEWX,         // fare new x
	Float:P_FARENEWY,         // fare new y
	Float:P_FARENEWZ,         // fare new z
	Float:P_FAREOLDX,         // fare old x
	Float:P_FAREOLDY,         // fare old y
	Float:P_FAREOLDZ,         // fare old z
	P_TOTALFARE,              // total fare
	P_FARE,         // fare
	P_FARETIMER,    // fare timer
	P_DELAYPIZZA,           // delay pizza
	P_PCTIME,       // waktu paycheck
	pGuns[13],         // senjata player
	pAmmo[13],         // ammo player
	pTrackCar,        // checkpoint
    pFriskOffer,       // frisk offer
    bool:PurchasedToy,       // toys
	toySelected,        // selected toys
	pMaterial,          // materials
	pActivityTime,      // activity time
	pArmsDealer,        // timer
	ModSelected,        // modshop
	// -------------------------
	toy_model0,
	toy_bone0,
	Float:toy_x0,
	Float:toy_y0,
	Float:toy_z0,
	Float:toy_rx0,
	Float:toy_ry0,
	Float:toy_rz0,
	Float:toy_sx0,
	Float:toy_sy0,
	Float:toy_sz0,
	toy_model1,
	toy_bone1,
	Float:toy_x1,
	Float:toy_y1,
	Float:toy_z1,
	Float:toy_rx1,
	Float:toy_ry1,
	Float:toy_rz1,
	Float:toy_sx1,
	Float:toy_sy1,
	Float:toy_sz1,
	// -------------------------
	P_LAST_LOGIN_TIME,	// waktu login terakhir\keluar
	P_DATE,          // tanggal terakhir login
	// -------------------------
	P_GAME_FOR_HOUR,	// waktu bermain per jam
	P_GAME_FOR_DAY,		// waktu permainan per hari
	P_GAME_FOR_DAY_PREV,// waktu pertandingan kemarin
	// -------------------------
	P_COLOR,		// warna pemain
	P_SELECT_SKIN, 	// kulit yang dipilih
	P_CHAT_TYPE,	// jenis obrolan
	P_AFK_TIME,		// waktu afk
	P_LAST_VEHICLE,	// id mobil terakhir di mana dia duduk
	P_LAST_DIALOG,	// dialog terakhir id
	P_USE_ANIM_TYPE,// jenis animasi yang digunakan
	P_PASS_ATTEMPS, // upaya otorisasi
	P_TARGET_ID,	// ditujukan pada pemain
	Float: P_HEALTH,// pemain hp
	Float: P_ARMOUR,// pemain armour
	Float: P_LIMIT, // limit speed[Vehicle]
	P_CHECK,
	// -------------------------
	P_TEMP_JOB,				// pekerjaan sementara
	P_TEMP_JOB_STATE,		// tindakan apa yang harus dilakukan
	P_TEMP_JOB_CHECK,		// pemeriksaan animasi
	// -------------------------
	P_JOB_SERVICE_NAME[17],	// nama layanan
	P_JOB_TARIFF,			// tarif
	P_JOB_WAGE,				// Gaji
	P_JOB_LOAD_ITEMS,		// diunggah/ditunda (muatan/bijih)
	P_JOB_CAR,				// transportasi kerja
	P_END_JOB_TIMER,		// timer shutdown
	P_FACTORY_USE_DESK,		// Meja mana yang digunakan pabrik?
	P_BUS_ROUTE, 			// rute bus
	P_BUS_ROUTE_STEP,		// langkah rute
	P_FARM_ROUTE_STEP,		// langkah rute
	P_COMBAIN_ROUTE_STEP,	// langkah rute
	P_MECHANIC_FILL_PAY,	// dikenakan biaya N $
	P_MECHANIC_REPAIR_PAY,	// diperbaharui pada N $
	bool: P_IN_JOB,			// apakah sedang bekerja
	// -------------------------
	bool: P_LOGGED,				// status otorisasi
	bool: P_USE_ANIM,			// Apakah animku digunakan (/anim)
	bool: P_BLOCK_LEAVE_AREA, 	// blokir panggilan OnPlayerLeaveDynamicArea
	bool: P_ANIMS_INIT,			// adalah animasi yang dimuat saat menelurkan
	bool: P_ANIM_LIST_INIT,		// adalah binatang yang diunggah
	bool: P_SNACK,				// apakah pemain memiliki camilan
	Text3D: P_ADVISOR_LABEL,	// Lencana penasihat
	bool: P_ADVISOR_BLOCK_CHAT,	// nonaktifkan organisasi obrolan
	// -------------------------
	P_AUTH_TIME,		// waktu untuk otorisasi
	P_IN_BUSINESS,		// bisnis apa yang telah masuk
	P_IN_HOUSE,			// rumah apa yang dia masuki
	P_LAST_PICKUP,		// id truk pickup terakhir
	P_IN_HOTEL_ROOM,	// di kamar mana di hotel
	P_IN_HOTEL_FLOOR,	// di lantai berapa di hotel
	P_MED_CHEST,		// kotak P3K
	P_MASK,				// topeng
	P_HELM,             // helm
	P_LOTTERY,			// tiket lotere
	P_DRINK_STEP,		// penggunaan minuman
	P_REALTOR_TYPE,		// makelar
	P_OWNABLE_CAR,		// id kendaraan pribadi
	P_USE_TRUNK,		// id bagasi mobil bekas
	// -------------------------
	P_IP[16], 			// pemain ip
	P_NAME[20 + 1], 	// nama pemain
	P_ADMNAME[20 + 1],  // nama admin
	P_WIFE_NAME[21],	// nama istri
	// -------------------------
	P_ACCOUNT_STATE, 		// status akun (otorisasi/pendaftaran)
	P_ACCOUNT_STEP_STATE, 	// langkah (pendaftaran/otorisasi)
	// -------------------------
	P_WARN,             // Varna
	P_ADMIN_WARN,
	P_WARN_TIME,        // waktu varna
	P_MUTE,             // waktu muta
	// -------------------------
	P_POWER,			// kekuatan
	P_SKILL_COLT,     	// skill colt
	P_SKILL_SDPISTOL,   // skill gun dengan peredam
	P_SKILL_DEAGLE,     // skill deagle
	P_SKILL_SHOTGUN,    // shotgun keterampilan
	P_SKILL_MP5,        // skill mp5
	P_SKILL_AK47,	    // skill ak47
	P_SKILL_M4,         // skill m4
	P_SKILL_SNIPER_RIFLE,	// skill sniper rifle
	P_SKILL_SAWNOFF,    // keterampilan senapan digergaji
	P_SKILL_COMBAT_SG,  // keterampilan senapan taktis
 	P_SKILL_MICRO_UZI,  // keterampilan micro-ultrasound
 	// -------------------------
 	P_SPAWN,            // tempat spawn
 	// -------------------------
	P_DONATE_CURRENT,	// saldo donasi saat ini
	P_DONATE_TOTAL,		// total poin sumbangan yang dibeli
	// -------------------------
	bool: P_HOSPITAL,	// ada di rumah sakit
	P_INJURED,          // pingsan
	P_STARTERPACK,      // Starterpack
	P_OCCUPIED_BED,		// nomor tempat tidur
	// -------------------------
	bool: P_WEAPON_RELOADING,	// apakah senjata memuat ulang
	P_RELOADINGS_COUNT[11],		// ulang untuk setiap senjata
	P_CUFFED,			// borgol pada pemain
	P_FOLLOWED_BY,		// siapa yang memimpin
	// -------------------------
	P_BUY_CAR,			// Apakah membeli mobil
	P_RENT_CAR,			// mobil sewaan
	P_ALLOWED_CAR,		// mesin tepercaya
	P_CAR_SLOTS,		// jumlah slot untuk mobil
	// -------------------------
	P_JAIL,				// saat dipenjara
	P_JAIL_OOC,         // penjara admin
	// -------------------------
	P_WEAPON_TINT[MAX_WEAPON_TINTS], // pewarnaan senjata
	// -------------------------
	P_PREMIUM,			// tingkat akun premium
	P_PREMIUM_DATE,
	P_PREMIUM_CHAT,

	P_LOAD_SKILL,       // loader keterampilan
	P_LUMBERG_SKILL,    // keterampilan penebang pohon
	P_DEPOSIT,          // deposit
	P_FAMILY,           // id keluarga
	P_FAMILY_RANK,      // pangkat keluarga
	P_USED_FISH,        // memancing
	P_FISHING_EQUIPMENT, // Alat Mancing
	P_FISH_MAS,         // berapa kilogram ikan
	P_BAIT,             // Umpan
	// ------------------------
	P_USER_PC,          // Pengguna versi PC
	P_STOP_ID,          // hentikan id
	P_STOP_STEP,        // pada langkah perjalanan apa
	P_NEED_EAT,         // Kebutuhan: Kelaparan
	P_NEED_WATER,      	// Kebutuhan: Haus
	// ------------------------
 	Float: P_POS_X,     // posisi keluar
	Float: P_POS_Y,     // posisi keluar
	Float: P_POS_Z,     // posisi keluar
	Float: P_ANGLE,     // posisi keluar
	P_VIRTUAL_WORLD,    // Wirth. keluar dari dunia
	P_INTERIOR,         // keluar interior
    P_ONLINE_TIME,      // Waktu Bermain 
	P_EXIT_PROPERTY,   	// properti, yang mana
	P_ATWORK,           // di tempat kerja atau tidak
	// ------------------------ ( Pengemudi truk )
	P_TRUCK_WAGE,           // mendapat uang dari pengemudi truk
	P_TRUCK_ROAD,     		// tingkat sopir truk
	Float: P_TRUCK_MILEAGE, // berapa kilometer perjalanan dengan truk
	P_TRUCK_ID,             // id truk yang disewa
	P_TRAILER_ID,           // id cuplikan yang mengambil
	P_TRUCK_ORDER_ID,       // nomor pesanan yang diambil
	P_TRUCK_ATWORK,         // mulai hari kerja
	P_LAST_MP,              // acara
	P_USED_SHOP,        	// apakah itu di belakang meja
	P_GIFTS,                // sepatu kuda
	P_TUNING_CAR,           // timer akselerasi otomatis
	P_BONUS_DAY,            // Bonus
	P_BONUS_GET,            // Bonus
	P_FIGHT_STYLE_BOXING,   // GYM
	P_FIGHT_STYLE_KUNGFU,   // GYM
	P_FIGHT_STYLE_KNEEHEAD, // GYM
	P_FIGHT_STYLE_GRABKICK, // GYM
	P_FIGHT_STYLE_ELBOW,    // GYM
	//----------------------- (( Penambahan INDOLIVE + ))
	P_UNJ,
	P_PAYDAY_X,
	//----------------------- (( Pass System ))
	P_MED_REFERENCE,
	P_PASS_CASH,
	P_PASS_PHOTO,
	//---------------------- (( Last position of crash ))
	Float:P_LAST_X,
	Float:P_LAST_Y,
	Float:P_LAST_Z,
	Float:P_LAST_FA,
	//
	P_USE_DRUGS,
	//--------------------- (( RentBike ))
	P_RENT_BIKE,
	P_STATUS[4],
	P_STATE_REG_INFO,
    PlayerBar:BarDarah,
    PlayerBar:BarArmour,
	PlayerBar:BarLapar,
	PlayerBar:BarHaus,
	PlayerBar:BarKencing,
	PlayerBar:BarFuel,
	PlayerBar:BarDamage,
	PlayerBar:BarMining,
	PlayerBar:activitybar,    // activity bar
	pMechVeh,
	pMechColor1,
	pMechColor2,
	pMechanic,  // ini hanyalah timer
	pWS,
	pWSJob,
	pWSid,
	pWSBos,
	pPacket,
	pSmuggler,
	pSmugglerTimer,
	pBodyStatus,
	pCondition,
	Float:pBodyCondition[6],
	Float:pHead,
	Float:pTorso,
	Float:pGroin,
	Float:pRArm,
	Float:pLArm,
	Float:pRLeg,
	Float:pLLeg,
	pCigar,
	pSnack,
	pWater,
	pInDoor,
	gEdit,
	gEditID,
	pSaveTimer,
	pStorage,
	Text3D:pAme,
	Text3D:pAdo,
	pAcceptReport,
	pTrashReport,
	pDate,
	pFMax,
	pFTime,
	pForkliftJob,
	pBox,
	pDelayForklift,
	pInspectOffer,
	EditingATMID,
    pFitnessTimer,
    pGYMTime,
    pFitnessType,
    pDizzyTime,
    pUltrafluenza,
    pParacetamol,
    pAmoxicilin,
    pGTAV,
    pPosX,
    pPosY,
    pPosZ,
    pPosA,
    pCameraX,
    pCameraY,
    pCameraZ,
	pSelected,
	pOrigin[32],
	pGender,
	pUCP[22],
	pChar,
	pVoiceChat,
};



public: SaveCondition(playerid)
{
    if(pData[playerid][P_LOGGED] == false) return 0;

	new cQuery[20000];

	mysql_format(mysql, cQuery, sizeof(cQuery), "UPDATE `accounts` SET ");
	mysql_format(mysql, cQuery, sizeof(cQuery), "%s`leftleg` = '%f', ", cQuery, pData[playerid][pLLeg]);
	mysql_format(mysql, cQuery, sizeof(cQuery), "%s`rightleg` = '%f', ", cQuery, pData[playerid][pRLeg]);
	mysql_format(mysql, cQuery, sizeof(cQuery), "%s`leftarm` = '%f', ", cQuery, pData[playerid][pLArm]);
	mysql_format(mysql, cQuery, sizeof(cQuery), "%s`rightarm` = '%f', ", cQuery, pData[playerid][pRArm]);
	mysql_format(mysql, cQuery, sizeof(cQuery), "%s`torso` = '%f', ", cQuery, pData[playerid][pTorso]);
	mysql_format(mysql, cQuery, sizeof(cQuery), "%s`groin` = '%f', ", cQuery, pData[playerid][pGroin]);
	mysql_format(mysql, cQuery, sizeof(cQuery), "%s`head` = '%f', ", cQuery, pData[playerid][pHead]);
	
	mysql_format(mysql, cQuery, sizeof(cQuery), "%s`bodycondition0` = '%f', ", cQuery, pData[playerid][pBodyCondition][0]);
	mysql_format(mysql, cQuery, sizeof(cQuery), "%s`bodycondition1` = '%f', ", cQuery, pData[playerid][pBodyCondition][1]);
	mysql_format(mysql, cQuery, sizeof(cQuery), "%s`bodycondition2` = '%f', ", cQuery, pData[playerid][pBodyCondition][2]);
	mysql_format(mysql, cQuery, sizeof(cQuery), "%s`bodycondition3` = '%f', ", cQuery, pData[playerid][pBodyCondition][3]);
	mysql_format(mysql, cQuery, sizeof(cQuery), "%s`bodycondition4` = '%f', ", cQuery, pData[playerid][pBodyCondition][4]);
	mysql_format(mysql, cQuery, sizeof(cQuery), "%s`pCondition` = '%d', ", cQuery, pData[playerid][pCondition]);
	
	mysql_format(mysql, cQuery, sizeof(cQuery), "%s`bodycondition5` = '%f' WHERE `id` = '%d' ", cQuery, pData[playerid][pBodyCondition][5], GetPlayerAccountID(playerid));

	mysql_tquery(mysql, cQuery);
	
	return 1;
}

public OnPlayerGiveDamage(playerid, damagedid, Float: amount, weaponid, bodypart)
{
	if(playerid != INVALID_PLAYER_ID && bodypart == 9)
	{
	    pData[damagedid][pHead] -= amount;
	}

	if(playerid != INVALID_PLAYER_ID && bodypart == 3)
	{
		pData[damagedid][pCondition] -= amount;
	    pData[damagedid][pTorso] -= amount;
	}

	if(playerid != INVALID_PLAYER_ID && bodypart == 4 && pData[damagedid][pGroin] > 0)
	{
	    pData[damagedid][pGroin] -= amount;
	}

	if(playerid != INVALID_PLAYER_ID && bodypart == 5 && pData[damagedid][pLArm] > 0)
	{
	    pData[damagedid][pLArm] -= amount;
	}

	if(playerid != INVALID_PLAYER_ID && bodypart == 6 && pData[damagedid][pRArm] > 0)
	{
	    pData[damagedid][pRArm] -= amount;
	}

	if(playerid != INVALID_PLAYER_ID && bodypart == 7 && pData[damagedid][pLLeg] > 0)
	{
	    pData[damagedid][pLLeg] -= amount;
	}

	if(playerid != INVALID_PLAYER_ID && bodypart == 8 && pData[damagedid][pRLeg] > 0)
	{
	    pData[damagedid][pRLeg] -= amount;
	}
	return 1;
}

public OnPlayerTakeDamage(playerid, issuerid, Float:amount, weaponid, bodypart)
{
	new Float: health;

	/*

	if(IsPlayerFly(playerid))
	{
		GetPlayerHealth(playerid, health);
		SetPlayerHealthEx(playerid, health + amount);
	}

	*/

	if(issuerid == INVALID_PLAYER_ID) return 1;

	if(GetPVarInt(playerid, "player_in_green_zone"))
	{
		new green_zone_id = GetPVarInt(playerid, "player_in_green_zone") - 1;

		if(!(TEAM_LSPD <= GetPlayerTeamEx(issuerid) <= TEAM_FBI))
		{
			ClearPlayerAnim(issuerid);

			new fmt_text[220];

			format
			(
				fmt_text, sizeof fmt_text,
				"{FFFFFF}"\
				"Peringatan:\n\n"\
				"Pemain berada di zona hijau. '{66CC33}%s{FFFFFF}'\n"\
				"Kerusakan dilarang. Ketika Anda mencoba lagi, Anda akan ditendang.",
				g_green_zones[green_zone_id][GZ_NAME]
			);

			Dialog(issuerid, INVALID_DIALOG_ID, DIALOG_STYLE_MSGBOX, "Zona hijau", fmt_text, "Tutup", "");

	//		format(fmt_text, sizeof fmt_text, "[A] %s[%d] mencoba memukul %s[%d] di zona hijau %s", GetPlayerNameEx(issuerid), issuerid, GetPlayerNameEx(playerid), playerid, g_green_zones[green_zone_id][GZ_NAME]);
	//		SendMessageToAdmins(fmt_text, 0xFF5533FF);

			return 0;
		}
	}
	
	/*if(issuerid != INVALID_PLAYER_ID)
	{
	    if(bodypart == 9)
	    {
	    	pData[playerid][pHead] -= amount;
	    }
	    if(bodypart == 3)
		{
		    pData[playerid][pTorso] -= amount;
		}
		if(bodypart == 4)
		{
		    pData[playerid][pGroin] -= amount;
		}
  		if(bodypart == 5)
		{
		    pData[playerid][pLArm] -= amount;
		}

		if(bodypart == 6)
		{
		    pData[playerid][pRArm] -= amount;
		}

		if(bodypart == 7)
		{
		    pData[playerid][pLLeg] -= amount;
		}

		if(bodypart == 8)
		{
		    pData[playerid][pRLeg] -= amount;
		}
	}*/

	if(TEAM_LSPD <= GetPlayerTeamEx(issuerid) <= TEAM_FBI)
	{
		if(weaponid == WEAPON_NITESTICK)
		{
			SetPlayerAnimation(playerid, 21);
			TogglePlayerControllable(playerid, false);

			SetTimerEx("UnfreezePlayer", 15000, false, "i", playerid);

			new fmt_text[90];

			format(fmt_text, sizeof fmt_text, "Anda tertegun %s selama 15 detik", GetPlayerNameEx(playerid));
			SendClientMessage(issuerid, 0x1E90FFFF, fmt_text);

			format(fmt_text, sizeof fmt_text, "%s mengejutkan Anda selama 15 detik", GetPlayerNameEx(issuerid));
			SendClientMessage(playerid, 0x1E90FFFF, fmt_text);

			CheckPlayerFlood(playerid, true, MAX_FLOOD_RATE, 500, FLOOD_RATE_KICK);
		}
	}

	/*if(TEAM_LSPD <= GetPlayerTeamEx(issuerid) <= TEAM_FBI && pTazer[issuerid] == 1)
	{
		if(weaponid == 23)
		{
			SetPlayerAnimation(playerid, 21);
			TogglePlayerControllable(playerid, false);

			SetTimerEx("UnfreezePlayer", 15000, false, "i", playerid);

			new fmt_text[90];

			format(fmt_text, sizeof fmt_text, "Anda tertegun %s selama 15 detik", GetPlayerNameEx(playerid));
			SendClientMessage(issuerid, 0x1E90FFFF, fmt_text);

			format(fmt_text, sizeof fmt_text, "%s mengejutkan Anda selama 15 detik", GetPlayerNameEx(issuerid));
			SendClientMessage(playerid, 0x1E90FFFF, fmt_text);

			CheckPlayerFlood(playerid, true, MAX_FLOOD_RATE, 500, FLOOD_RATE_KICK);
		}
	}*/

	if(GetPlayerData(issuerid, P_POWER))
	{
		if(!weaponid)
		{
			new Float: armour,
				Float: taken_health;

			GetPlayerHealth(playerid, health);
			GetPlayerArmour(playerid, armour);

			taken_health = GetPlayerData(issuerid, P_POWER) * 0.05;

			if(armour) SetPlayerArmour(playerid, armour - taken_health);
			else SetPlayerHealthEx(playerid, health - taken_health);
		}
	}

	return 1;
}


public: OnPlayerTimer(playerid)
{

	if(IsPlayerLogged(playerid))
	{
		new fmt_str[128];
		new speed = GetPlayerSpeed(playerid);
		if(GetPlayerData(playerid, P_USE_DRUGS) != 0)
		{
			AddPlayerData(playerid, P_USE_DRUGS, -, 1);
		}
		if(g_capture[C_STATUS])
		{
		    new fmt_text[125];

		    if(TEAM_GANG_GROVE <= GetPlayerTeamEx(playerid) <= TEAM_GANG_RIFA)
		    {
		        format
				(
					fmt_text, sizeof fmt_text,
					"~n~~n~~n~~n~~n~~g~~h~~h~Time: %d:%02d~n~"\
					"~w~%s__~r~~h~%d~n~"\
					"~w~%s__~r~~h~%d",
					g_capture[C_TIME] / 60,
					g_capture[C_TIME] % 60,
					GetTeamName( (g_capture[C_ATTACK_TEAM] + TEAM_GANG_GROVE) - 1 ),
					g_capture[C_ATTACKER_KILLS],
					GetTeamName( (g_capture[C_PROTECT_TEAM] + TEAM_GANG_GROVE) - 1 ),
					g_capture[C_PROTECTOR_KILLS]
				);

				GameTextForPlayer(playerid, fmt_text, 1000, 3);
		    }
		}

        if(!IsPlayerInRangeOfPoint(playerid,250.0,2570.7031,-1301.9629,1044.1250) && GetPlayerTempJob(playerid) == TEMP_JOB_FACTORY)
        {
            EndPlayerTempJob(playerid, TEMP_JOB_FACTORY);
		}

		if(GetPlayerSpectateData(playerid, S_PLAYER) != -1)
		{
			new spec_player = GetPlayerSpectateData(playerid, S_PLAYER),
				fmt_text[150];

			format(fmt_text, sizeof fmt_text, "~n~~n~~n~~n~~n~~n~~n~~n~~y~%s(%d)~n~ping: %d", g_player[spec_player][P_NAME], spec_player, GetPlayerPing(spec_player));
			GameTextForPlayer(playerid, fmt_text, 1000, 3);
		}
        if(GetPlayerPing(playerid) > 800) // Ping Player
        {
            new fmt_msg[128];
            format(fmt_msg, sizeof fmt_msg, "BotCmd: %s has been kicked by BOT.", GetPlayerNameEx(playerid));
            SendClientMessageToAll(0xFF5533FF, fmt_msg);
            format(fmt_msg, sizeof fmt_msg, "Reason: High Ping [%d/800]", GetPlayerPing(playerid));
            SendClientMessageToAll(0xFF5533FF, fmt_msg);
            return SetTimerEx("DelayKick", 500, 0, "i", playerid);
        }

		AddPlayerData(playerid, P_AFK_TIME, +, 1);
		if(IsPlayerAFK(playerid))
		{
			new afk_minutes = ConvertUnixTime(GetPlayerAFKTime(playerid), CONVERT_TIME_TO_MINUTES);
			new afk_seconds = ConvertUnixTime(GetPlayerAFKTime(playerid));

			if(afk_minutes > 0)
			{
				format(fmt_str, sizeof fmt_str, "AFK %d:%02d", afk_minutes, afk_seconds);
			}
			else format(fmt_str, sizeof fmt_str, "AFK %d detik.", afk_seconds);

			SetPlayerChatBubble(playerid, fmt_str, 0xFF0000FF, 7.0, 1500);

			if(afk_minutes == MAX_AFK_TIME && GetPlayerAdminEx(playerid) < 1)
				BocilAFK(playerid);
		}
		else
		{
			AddPlayerData(playerid, P_GAME_FOR_HOUR, +, 1);
			AddPlayerData(playerid, P_GAME_FOR_DAY, +, 1);

			UpdatePlayerDatabaseInt(playerid, "game_for_hour", GetPlayerData(playerid, P_GAME_FOR_HOUR));
			UpdatePlayerDatabaseInt(playerid, "game_for_day", GetPlayerData(playerid, P_GAME_FOR_DAY));
		}
        
        if(GetPlayerSpeed(playerid) > 200)
        {
            SetTimerEx("DelayKick", 500, 0, "i", playerid);
            new fmt_msg[128];
            format(fmt_msg, sizeof fmt_msg, "BotCmd: %s has been kicked by BOT.", GetPlayerNameEx(playerid));
            SendClientMessageToAll(0xFF5533FF, fmt_msg);
            SendClientMessageToAll(0xFF5533FF, "Reason: Speed Hack!");
        }
        
        if(GetPlayerData(playerid, P_ONLINE_TIME) == 10800) // 3 Jam = Level 2
	    {
	        //AddPlayerData(playerid, P_ONLINE_TIME, +, 1);
	        SetPlayerData(playerid, P_LEVEL, 2);
	        GameTextForPlayer(playerid, "~y~Level Up!", 4000, 1);
	        new fmt_msg[128];
	        format(fmt_msg, sizeof fmt_msg, "{FFFF00}<!>{FF0000}PERHATIAN: {FFFFFF}Selamat %s Telah Naik Level Menjadi Level 2", GetPlayerNameEx(playerid));
	        SendClientMessageToAll(0xFF5533FF, fmt_msg);
	        SetPlayerLevelInit(playerid);
	    }
	    if(GetPlayerData(playerid, P_ONLINE_TIME) == 36000) // 10 Jam = Level 3
	    {
	        //AddPlayerData(playerid, P_ONLINE_TIME, +, 1);
	        SetPlayerData(playerid, P_LEVEL, 3);
	        GameTextForPlayer(playerid, "~y~Level Up!", 4000, 1);
	        new fmt_msg[128];
	        format(fmt_msg, sizeof fmt_msg, "{FFFF00}<!>{FF0000}PERHATIAN: {FFFFFF}Selamat %s Telah Naik Level Menjadi Level 3", GetPlayerNameEx(playerid));
	        SendClientMessageToAll(0xFF5533FF, fmt_msg);
	        SetPlayerLevelInit(playerid);
	    }
	    if(GetPlayerData(playerid, P_ONLINE_TIME) == 57600) // 16 Jam = Level 4
	    {
	        //AddPlayerData(playerid, P_ONLINE_TIME, +, 1);
	        SetPlayerData(playerid, P_LEVEL, 4);
	        GameTextForPlayer(playerid, "~y~Level Up!", 4000, 1);
	        new fmt_msg[128];
	        format(fmt_msg, sizeof fmt_msg, "{FFFF00}<!>{FF0000}PERHATIAN: {FFFFFF}Selamat %s Telah Naik Level Menjadi Level 4", GetPlayerNameEx(playerid));
	        SendClientMessageToAll(0xFF5533FF, fmt_msg);
	        SetPlayerLevelInit(playerid);
	    }
	    if(GetPlayerData(playerid, P_ONLINE_TIME) == 90000) // 25 Jam = Level 5
	    {
	        //AddPlayerData(playerid, P_ONLINE_TIME, +, 1);
	        SetPlayerData(playerid, P_LEVEL, 5);
	        GameTextForPlayer(playerid, "~y~Level Up!", 4000, 1);
	        new fmt_msg[128];
	        format(fmt_msg, sizeof fmt_msg, "{FFFF00}<!>{FF0000}PERHATIAN: {FFFFFF}Selamat %s Telah Naik Level Menjadi Level 5", GetPlayerNameEx(playerid));
	        SendClientMessageToAll(0xFF5533FF, fmt_msg);
	        SetPlayerLevelInit(playerid);
	    }
	    if(GetPlayerData(playerid, P_ONLINE_TIME) == 180000) // 50 Jam = Level 6
	    {
	        //AddPlayerData(playerid, P_ONLINE_TIME, +, 1);
	        SetPlayerData(playerid, P_LEVEL, 6);
	        GameTextForPlayer(playerid, "~y~Level Up!", 4000, 1);
	        new fmt_msg[128];
	        format(fmt_msg, sizeof fmt_msg, "{FFFF00}<!>{FF0000}PERHATIAN: {FFFFFF}Selamat %s Telah Naik Level Menjadi Level 6", GetPlayerNameEx(playerid));
	        SendClientMessageToAll(0xFF5533FF, fmt_msg);
	        SetPlayerLevelInit(playerid);
	    }
	    if(GetPlayerData(playerid, P_ONLINE_TIME) == 270000) // 75 Jam = Level 7
	    {
	        //AddPlayerData(playerid, P_ONLINE_TIME, +, 1);
	        SetPlayerData(playerid, P_LEVEL, 7);
	        GameTextForPlayer(playerid, "~y~Level Up!", 4000, 1);
	        new fmt_msg[128];
	        format(fmt_msg, sizeof fmt_msg, "{FFFF00}<!>{FF0000}PERHATIAN: {FFFFFF}Selamat %s Telah Naik Level Menjadi Level 7", GetPlayerNameEx(playerid));
	        SendClientMessageToAll(0xFF5533FF, fmt_msg);
	        SetPlayerLevelInit(playerid);
	    }
	    if(GetPlayerData(playerid, P_ONLINE_TIME) == 360000) // 100 Jam = Level 8
	    {
	        //AddPlayerData(playerid, P_ONLINE_TIME, +, 1);
	        SetPlayerData(playerid, P_LEVEL, 8);
	        GameTextForPlayer(playerid, "~y~Level Up!", 4000, 1);
	        new fmt_msg[128];
	        format(fmt_msg, sizeof fmt_msg, "{FFFF00}<!>{FF0000}PERHATIAN: {FFFFFF}Selamat %s Telah Naik Level Menjadi Level 8", GetPlayerNameEx(playerid));
	        SendClientMessageToAll(0xFF5533FF, fmt_msg);
	        SetPlayerLevelInit(playerid);
	    }
	    if(GetPlayerData(playerid, P_ONLINE_TIME) == 450000) // 125 Jam = Level 9
	    {
	        //AddPlayerData(playerid, P_ONLINE_TIME, +, 1);
	        SetPlayerData(playerid, P_LEVEL, 9);
	        GameTextForPlayer(playerid, "~y~Level Up!", 4000, 1);
	        new fmt_msg[128];
	        format(fmt_msg, sizeof fmt_msg, "{FFFF00}<!>{FF0000}PERHATIAN: {FFFFFF}Selamat %s Telah Naik Level Menjadi Level 9", GetPlayerNameEx(playerid));
	        SendClientMessageToAll(0xFF5533FF, fmt_msg);
	        SetPlayerLevelInit(playerid);
	    }
	    if(GetPlayerData(playerid, P_ONLINE_TIME) == 540000) // 150 Jam = Level 10
	    {
	        //AddPlayerData(playerid, P_ONLINE_TIME, +, 1);
	        SetPlayerData(playerid, P_LEVEL, 10);
	        GameTextForPlayer(playerid, "~y~Level Up!", 4000, 1);
	        new fmt_msg[128];
	        format(fmt_msg, sizeof fmt_msg, "{FFFF00}<!>{FF0000}PERHATIAN: {FFFFFF}Selamat %s Telah Naik Level Menjadi Level 10", GetPlayerNameEx(playerid));
	        SendClientMessageToAll(0xFF5533FF, fmt_msg);
	        SetPlayerLevelInit(playerid);
	    }
	    if(GetPlayerData(playerid, P_ONLINE_TIME) == 630000) // 175 Jam = Level 11
	    {
	        //AddPlayerData(playerid, P_ONLINE_TIME, +, 1);
	        SetPlayerData(playerid, P_LEVEL, 11);
	        GameTextForPlayer(playerid, "~y~Level Up!", 4000, 1);
	        new fmt_msg[128];
	        format(fmt_msg, sizeof fmt_msg, "{FFFF00}<!>{FF0000}PERHATIAN: {FFFFFF}Selamat %s Telah Naik Level Menjadi Level 11", GetPlayerNameEx(playerid));
	        SendClientMessageToAll(0xFF5533FF, fmt_msg);
	        SetPlayerLevelInit(playerid);
	    }
	    if(GetPlayerData(playerid, P_ONLINE_TIME) == 720000) // 200 Jam = Level 12
	    {
	        //AddPlayerData(playerid, P_ONLINE_TIME, +, 1);
	        SetPlayerData(playerid, P_LEVEL, 12);
	        GameTextForPlayer(playerid, "~y~Level Up!", 4000, 1);
	        new fmt_msg[128];
	        format(fmt_msg, sizeof fmt_msg, "{FFFF00}<!>{FF0000}PERHATIAN: {FFFFFF}Selamat %s Telah Naik Level Menjadi Level 12", GetPlayerNameEx(playerid));
	        SendClientMessageToAll(0xFF5533FF, fmt_msg);
	        SetPlayerLevelInit(playerid);
	    }
	    if(GetPlayerData(playerid, P_ONLINE_TIME) == 810000) // 225 Jam = Level 13
	    {
	        //AddPlayerData(playerid, P_ONLINE_TIME, +, 1);
	        SetPlayerData(playerid, P_LEVEL, 13);
	        GameTextForPlayer(playerid, "~y~Level Up!", 4000, 1);
	        new fmt_msg[128];
	        format(fmt_msg, sizeof fmt_msg, "{FFFF00}<!>{FF0000}PERHATIAN: {FFFFFF}Selamat %s Telah Naik Level Menjadi Level 13", GetPlayerNameEx(playerid));
	        SendClientMessageToAll(0xFF5533FF, fmt_msg);
	        SetPlayerLevelInit(playerid);
	    }
	    if(GetPlayerData(playerid, P_ONLINE_TIME) == 900000) // 250 Jam = Level 14
	    {
	        //AddPlayerData(playerid, P_ONLINE_TIME, +, 1);
	        SetPlayerData(playerid, P_LEVEL, 14);
	        GameTextForPlayer(playerid, "~y~Level Up!", 4000, 1);
	        new fmt_msg[128];
	        format(fmt_msg, sizeof fmt_msg, "{FFFF00}<!>{FF0000}PERHATIAN: {FFFFFF}Selamat %s Telah Naik Level Menjadi Level 14", GetPlayerNameEx(playerid));
	        SendClientMessageToAll(0xFF5533FF, fmt_msg);
	        SetPlayerLevelInit(playerid);
	    }
	    if(GetPlayerData(playerid, P_ONLINE_TIME) == 990000) // 175 Jam = Level 15
	    {
	        //AddPlayerData(playerid, P_ONLINE_TIME, +, 1);
	        SetPlayerData(playerid, P_LEVEL, 15);
	        GameTextForPlayer(playerid, "~y~Level Up!", 4000, 1);
	        new fmt_msg[128];
	        format(fmt_msg, sizeof fmt_msg, "{FFFF00}<!>{FF0000}PERHATIAN: {FFFFFF}Selamat %s Telah Naik Level Menjadi Level 15", GetPlayerNameEx(playerid));
	        SendClientMessageToAll(0xFF5533FF, fmt_msg);
	        SetPlayerLevelInit(playerid);
	    }
	    if(GetPlayerData(playerid, P_ONLINE_TIME) == 1080000) // 300 Jam = Level 16
	    {
	        //AddPlayerData(playerid, P_ONLINE_TIME, +, 1);
	        SetPlayerData(playerid, P_LEVEL, 16);
	        GameTextForPlayer(playerid, "~y~Level Up!", 4000, 1);
	        new fmt_msg[128];
	        format(fmt_msg, sizeof fmt_msg, "{FFFF00}<!>{FF0000}PERHATIAN: {FFFFFF}Selamat %s Telah Naik Level Menjadi Level 16", GetPlayerNameEx(playerid));
	        SendClientMessageToAll(0xFF5533FF, fmt_msg);
	        SetPlayerLevelInit(playerid);
	    }
	    if(GetPlayerData(playerid, P_ONLINE_TIME) == 1170000) // 325 Jam = Level 17
	    {
	        //AddPlayerData(playerid, P_ONLINE_TIME, +, 1);
	        SetPlayerData(playerid, P_LEVEL, 17);
	        GameTextForPlayer(playerid, "~y~Level Up!", 4000, 1);
	        new fmt_msg[128];
	        format(fmt_msg, sizeof fmt_msg, "{FFFF00}<!>{FF0000}PERHATIAN: {FFFFFF}Selamat %s Telah Naik Level Menjadi Level 17", GetPlayerNameEx(playerid));
	        SendClientMessageToAll(0xFF5533FF, fmt_msg);
	        SetPlayerLevelInit(playerid);
	    }
	    if(GetPlayerData(playerid, P_ONLINE_TIME) == 1260000) // 350 Jam = Level 18
	    {
	        //AddPlayerData(playerid, P_ONLINE_TIME, +, 1);
	        SetPlayerData(playerid, P_LEVEL, 18);
	        GameTextForPlayer(playerid, "~y~Level Up!", 4000, 1);
	        new fmt_msg[128];
	        format(fmt_msg, sizeof fmt_msg, "{FFFF00}<!>{FF0000}PERHATIAN: {FFFFFF}Selamat %s Telah Naik Level Menjadi Level 18", GetPlayerNameEx(playerid));
	        SendClientMessageToAll(0xFF5533FF, fmt_msg);
	        SetPlayerLevelInit(playerid);
	    }
	    if(GetPlayerData(playerid, P_ONLINE_TIME) == 1350000) // 375 Jam = Level 19
	    {
	        //AddPlayerData(playerid, P_ONLINE_TIME, +, 1);
	        SetPlayerData(playerid, P_LEVEL, 19);
	        GameTextForPlayer(playerid, "~y~Level Up!", 4000, 1);
	        new fmt_msg[128];
	        format(fmt_msg, sizeof fmt_msg, "{FFFF00}<!>{FF0000}PERHATIAN: {FFFFFF}Selamat %s Telah Naik Level Menjadi Level 19", GetPlayerNameEx(playerid));
	        SendClientMessageToAll(0xFF5533FF, fmt_msg);
	        SetPlayerLevelInit(playerid);
	    }
	    if(GetPlayerData(playerid, P_ONLINE_TIME) == 1440000) // 400 Jam = Level 20
	    {
	        //AddPlayerData(playerid, P_ONLINE_TIME, +, 1);
	        SetPlayerData(playerid, P_LEVEL, 20);
	        GameTextForPlayer(playerid, "~y~Level Up!", 4000, 1);
	        new fmt_msg[128];
	        format(fmt_msg, sizeof fmt_msg, "{FFFF00}<!>{FF0000}PERHATIAN: {FFFFFF}Selamat %s Telah Naik Level Menjadi Level 20", GetPlayerNameEx(playerid));
	        SendClientMessageToAll(0xFF5533FF, fmt_msg);
	        SetPlayerLevelInit(playerid);
	    }
        
        if(JustReported[playerid] > 0)
		{
			JustReported[playerid]--;
		}

		if(GetPlayerData(playerid, P_MUTE) > 0)
		{
			AddPlayerData(playerid, P_MUTE, -, 1);
			UpdatePlayerDatabaseInt(playerid, "mute", GetPlayerData(playerid, P_MUTE));
			if(GetPlayerData(playerid, P_MUTE) <= 0)
				SendClientMessage(playerid, 0x32a44bFF, "Larangan Obrolan Berakhir");
		}

		if(GetPlayerData(playerid, P_JAIL) > 0)
		{
			AddPlayerData(playerid, P_JAIL, -, 1);
			UpdatePlayerDatabaseInt(playerid, "jail", GetPlayerData(playerid, P_JAIL));

			if(GetPlayerData(playerid, P_JAIL) <= 0)
				SendClientMessage(playerid, 0x32a44bFF, "Hukuman penjara telah berakhir"),
				UnjailPlayer(playerid);
		}
		
		if(GetPlayerJob(playerid) == JOB_SMUGGLER)
		{
			if(packet == 1)
			{
				pData[playerid][pSmugglerTimer]++;

				if(pData[playerid][pSmugglerTimer] == 25)
					SendClientMessage(playerid, COLOR_LOGS, "JOB: {FFFFFF}Smuggling job is currently active!, use "YELLOW_E"'/findpacket'"WHITE_E" to trace the package"),
					pData[playerid][pSmugglerTimer] = 0;
			}
		}
		
		if(pData[playerid][pDizzyTime] >= 1)
		{
		    if(pData[playerid][pHead] < 40 || pData[playerid][pCondition] < 35)
		    {
				if(pData[playerid][pDizzyTime] < 1)
				{
				    ShowBloodScreen(playerid, 50);
					SetPlayerDrunkLevel(playerid, 50000);
					SetTimerEx("DisableDizzy", 120000, false, "i", playerid);
				}
				else
				{
					pData[playerid][pDizzyTime] --;
				}
			}
		}
		
		if(CalledCops[playerid] >= 1)
		{
            if(CopsCallTime[playerid] < 1)
			{
				CopsCallTime[playerid] = 0;
				CalledCops[playerid] = 0;
			}
			else
			{
				CopsCallTime[playerid]--;
			}
		}
		if(CalledMedics[playerid] >= 1)
		{
            if(MedicsCallTime[playerid] < 1)
			{
				MedicsCallTime[playerid] = 0;
			 	CalledMedics[playerid] = 0;
			}
			else
			{
				MedicsCallTime[playerid]--;
			}
		}
		
		if(SedangFitness[playerid] == 1)
		{
			if(PlayerInfo[playerid][pFitnessTimer] > 0)
			{
				PlayerInfo[playerid][pFitnessTimer]--;
				PlayerInfo[playerid][P_LAPAR] -= 1;
				PlayerInfo[playerid][P_HAUS] -= 2;
				UpdatePlayerDatabaseInt(playerid, "lapar", PlayerInfo[playerid][P_LAPAR]);
	            UpdatePlayerDatabaseInt(playerid, "haus", PlayerInfo[playerid][P_HAUS]);
				if(PlayerInfo[playerid][pFitnessTimer] == 1)
				{
			    	if(PlayerInfo[playerid][pFitnessType] == 1)
			    	{
			    	    SendClientMessageEx(playerid, -1, "{56A4E4}�{DB881A}| {FF0000}Fitness Status\n");
			    	    PlayerInfo[playerid][pBodyCondition][0] += frandom(1.0);
						SendClientMessageEx(playerid, -1, "{56A4E4}�{DB881A}| {00ff00}Groin: {ffff00}%.1f > %.1f\n", PlayerInfo[playerid][pBodyCondition][0]-=frandom(1.0), PlayerInfo[playerid][pBodyCondition][0]+=frandom(1.0));
						PlayerInfo[playerid][pBodyCondition][2] += frandom(1.5);
						SendClientMessageEx(playerid, -1, "{56A4E4}�{DB881A}| {00ff00}RArm: {ffff00}%.1f > %.1f\n", PlayerInfo[playerid][pBodyCondition][2]-=frandom(1.5), PlayerInfo[playerid][pBodyCondition][2]+=frandom(1.5));
						PlayerInfo[playerid][pBodyCondition][3] += frandom(1.5);
						SendClientMessageEx(playerid, -1, "{56A4E4}�{DB881A}| {00ff00}LArm: {ffff00}%.1f > %.1f", PlayerInfo[playerid][pBodyCondition][3]-=frandom(1.5), PlayerInfo[playerid][pBodyCondition][3]+=frandom(1.5));
						PlayerInfo[playerid][pBodyCondition][1] += frandom(1.0);
						SendClientMessageEx(playerid, -1, "{56A4E4}�{DB881A}| {00ff00}Torso: {ffff00}%.1f > %.1f\n", PlayerInfo[playerid][pBodyCondition][1]-=frandom(1.0), PlayerInfo[playerid][pBodyCondition][1]+=frandom(1.0));
						PlayerInfo[playerid][pBodyCondition][4] += frandom(1.5);
						SendClientMessageEx(playerid, -1, "{56A4E4}�{DB881A}| {00ff00}RLeg: {ffff00}%.1f > %.1f\n", PlayerInfo[playerid][pBodyCondition][4]-=frandom(1.5), PlayerInfo[playerid][pBodyCondition][4]+=frandom(1.5));
						PlayerInfo[playerid][pBodyCondition][5] += frandom(1.5);
						SendClientMessageEx(playerid, -1, "{56A4E4}�{DB881A}| {00ff00}LLeg: {ffff00}%.1f > %.1f", PlayerInfo[playerid][pBodyCondition][5]-=frandom(1.5), PlayerInfo[playerid][pBodyCondition][5]+=frandom(1.5));
						PlayerInfo[playerid][pFitnessType] = 0;
						PlayerInfo[playerid][pFitnessTimer] = 0;
						SedangFitness[playerid] = 0;
						Streamer_Update(playerid);
			    	}
			    	if(PlayerInfo[playerid][pFitnessType] == 2)
			    	{
			    	    SendClientMessageEx(playerid, -1, "{56A4E4}�{DB881A}| {FF0000}Fitness Status\n");
			    	    PlayerInfo[playerid][pBodyCondition][1] += frandom(1.0);
						SendClientMessageEx(playerid, -1, "{56A4E4}�{DB881A}| {00ff00}Torso: {ffff00}%.1f > %.1f\n", PlayerInfo[playerid][pBodyCondition][1]-=frandom(1.0), PlayerInfo[playerid][pBodyCondition][0]+=frandom(1.0));
						PlayerInfo[playerid][pBodyCondition][4] += frandom(2.5);
						SendClientMessageEx(playerid, -1, "{56A4E4}�{DB881A}| {00ff00}RLeg: {ffff00}%.1f > %.1f\n", PlayerInfo[playerid][pBodyCondition][4]-=frandom(2.5), PlayerInfo[playerid][pBodyCondition][2]+=frandom(2.5));
						PlayerInfo[playerid][pBodyCondition][5] += frandom(2.5);
						SendClientMessageEx(playerid, -1, "{56A4E4}�{DB881A}| {00ff00}LLeg: {ffff00}%.1f > %.1f", PlayerInfo[playerid][pBodyCondition][5]-=frandom(2.5), PlayerInfo[playerid][pBodyCondition][3]+=frandom(2.5));
						PlayerInfo[playerid][pFitnessType] = 0;
						PlayerInfo[playerid][pFitnessTimer] = 0;
						Streamer_Update(playerid);
						SedangFitness[playerid] = 0;
			    	}
			    	if(PlayerInfo[playerid][pFitnessType] == 3)
			    	{
			    	    SedangFitness[playerid] = 0;
			    	    SendClientMessageEx(playerid, -1, "{56A4E4}�{DB881A}| {FF0000}Fitness Status\n");
			    	    PlayerInfo[playerid][pBodyCondition][0] += frandom(1.5);
						SendClientMessageEx(playerid, -1, "{56A4E4}�{DB881A}| {00ff00}Groin: {ffff00}%.1f > %.1f\n", PlayerInfo[playerid][pBodyCondition][0]-=frandom(1.0), PlayerInfo[playerid][pBodyCondition][0]+=frandom(1.5));
						PlayerInfo[playerid][pBodyCondition][2] += frandom(2.5);
						SendClientMessageEx(playerid, -1, "{56A4E4}�{DB881A}| {00ff00}RArm: {ffff00}%.1f > %.1f\n", PlayerInfo[playerid][pBodyCondition][2]-=frandom(2.5), PlayerInfo[playerid][pBodyCondition][2]+=frandom(2.5));
						PlayerInfo[playerid][pBodyCondition][3] += frandom(2.5);
						SendClientMessageEx(playerid, -1, "{56A4E4}�{DB881A}| {00ff00}LArm: {ffff00}%.1f > %.1f", PlayerInfo[playerid][pBodyCondition][3]-=frandom(2.5), PlayerInfo[playerid][pBodyCondition][3]+=frandom(2.5));
						PlayerInfo[playerid][pFitnessType] = 0;
						PlayerInfo[playerid][pFitnessTimer] = 0;
						Streamer_Update(playerid);
					}
				    ClearAnimations(playerid);
				    PlayerInfo[playerid][pFitnessTimer] --;
				}
			}
		}
		
		if(GetPlayerJob(playerid) == JOB_SMUGGLER)
		{
			if(packet == 2)
			{
				pData[playerid][pSmugglerTimer]++;

				if(pData[playerid][pSmugglerTimer] == 25)
					SendClientMessage(playerid, COLOR_LOGS, "JOB: {FFFFFF}Smuggling job is currently active!, use "YELLOW_E"'/findpacket'"WHITE_E" to trace the package"),
					pData[playerid][pSmugglerTimer] = 0;
			}
		}
		
		if(pData[playerid][pSaveTimer] == 0)
		{
			pData[playerid][pSaveTimer]++;
			
			if(pData[playerid][pSaveTimer] == 5)
				SavePlayerAccount(playerid), UpdateWeaponData(playerid),
				pData[playerid][pSaveTimer] = 0;
		}
		
		if(pData[playerid][pDelayForklift] > 0)
		{
		    pData[playerid][pDelayForklift]--;
		    UpdatePlayerDatabaseInt(playerid, "delay_forklift", pData[playerid][pDelayForklift]);

		    if(pData[playerid][pDelayForklift] <= 0)
				Info(playerid, "You now can start forklift job again");
		}
		
		if(pData[playerid][pGYMTime] > 0)
		{
		    pData[playerid][pGYMTime]--;
		    UpdatePlayerDatabaseInt(playerid, "gymtime", pData[playerid][pGYMTime]);

		    if(pData[playerid][pGYMTime] <= 0)
				Info(playerid, "GYM Membership has ended");
		}

		if(GetPlayerData(playerid, P_DELAY_DEATH) > 0)
		{
			AddPlayerData(playerid, P_DELAY_DEATH, -, 1);
			UpdatePlayerDatabaseInt(playerid, "delay_death", GetPlayerData(playerid, P_DELAY_DEATH));

			if(GetPlayerData(playerid, P_DELAY_DEATH) <= 0)
				SendClientMessage(playerid, COLOR_RED, "{FFFF00}<!>{FF0000}PERHATIAN: {FFFFFF}Kamu Sudah Bisa Menggunakan /death, sekarang");
		}
		
		if(pData[playerid][pFTime] > 0)
		{
			pData[playerid][pFTime] -= 1;
			UpdatePlayerDatabaseInt(playerid, "fishtime", pData[playerid][pFTime]);

			if(pData[playerid][pFTime] <= 0)
				SendClientMessage(playerid, COLOR_ARWIN, "JOB: {FFFFFF}Kamu Sudah Bisa Memancing sekarang");
		}

		if(GetPlayerData(playerid, P_DELAY_SWEEPER) > 0)
		{
			AddPlayerData(playerid, P_DELAY_SWEEPER, -, 1);
			UpdatePlayerDatabaseInt(playerid, "delay_sweeper", GetPlayerData(playerid, P_DELAY_SWEEPER));

			if(GetPlayerData(playerid, P_DELAY_SWEEPER) <= 0)
				SendClientMessage(playerid, COLOR_RED, "{FFFF00}<!>{FF0000}PERHATIAN: {FFFFFF}Kamu sudah bisa kembali bekerja sweeper");
		}

        if(GetPlayerData(playerid, P_DELAY_MINING) > 0)
        {
            AddPlayerData(playerid, P_DELAY_MINING, -, 1);
            UpdatePlayerDatabaseInt(playerid, "delay_mining", GetPlayerData(playerid, P_DELAY_MINING));

            if(GetPlayerData(playerid, P_DELAY_MINING) <= 0)
                SendClientMessage(playerid, COLOR_RED, "{FFFF00}<!>{FF0000}PERHATIAN: {FFFFFF} Anda Sudah Bisa Menambang Lagi!");
        }

		if(GetPlayerData(playerid, P_DELAYBUS) > 0)
		{
			AddPlayerData(playerid, P_DELAYBUS, -, 1);
			UpdatePlayerDatabaseInt(playerid, "delaybus", GetPlayerData(playerid, P_DELAYBUS));

			if(GetPlayerData(playerid, P_DELAYBUS) <= 0)
				SendClientMessage(playerid, COLOR_RED, "BUS: {FFFFFF}Sekarang kamu sudah bisa kembali bekerja sebagai sopir bus");

		}
		
		if(GetPlayerData(playerid, P_PCTIME) > 0)
		{
			AddPlayerData(playerid, P_PCTIME, -, 1);
			UpdatePlayerDatabaseInt(playerid, "paycheck_time", GetPlayerData(playerid, P_PCTIME));

			if(GetPlayerData(playerid, P_PCTIME) <= 0)
				SendClientMessage(playerid, COLOR_LOGS, "PAYCHECK: {FFFFFF}Pergi ke bank dan /signcheck untuk mendapatkan paycheck anda atau pergi ke salah satu ATM!");

		}

		if(GetPlayerData(playerid, P_DELAYTRUCK) > 0)
		{
			AddPlayerData(playerid, P_DELAYTRUCK, -, 1);
			UpdatePlayerDatabaseInt(playerid, "delaytruck", GetPlayerData(playerid, P_DELAYTRUCK));

			if(GetPlayerData(playerid, P_DELAYTRUCK) <= 0)
				SendClientMessage(playerid, COLOR_RED, "TRUCKER: {FFFFFF}Sekarang kamu sudah bisa kembali bekerja sebagai trucker");

		}

        if(GetPlayerData(playerid, P_DELAYPIZZA) > 0)
		{
			AddPlayerData(playerid, P_DELAYPIZZA, -, 1);
			UpdatePlayerDatabaseInt(playerid, "delaypizza", GetPlayerData(playerid, P_DELAYPIZZA));

			if(GetPlayerData(playerid, P_DELAYPIZZA) <= 0)
				SendClientMessage(playerid, COLOR_LOGS, "PIZZA JOB: {FFFFFF}Sekarang kamu sudah bisa kembali bekerja sebagai pengantar pizza");

		}

		if(GetPlayerData(playerid, P_DELAYLUMBER) > 0)
		{
			AddPlayerData(playerid, P_DELAYLUMBER, -, 1);
			UpdatePlayerDatabaseInt(playerid, "delaylumber", GetPlayerData(playerid, P_DELAYLUMBER));

			if(GetPlayerData(playerid, P_DELAYLUMBER) <= 0)
				SendClientMessage(playerid, COLOR_RED, "LUMBERJACK: {FFFFFF}Sekarang kamu sudah bisa kembali bekerja lumberjack");

		}

		/*if(GetPlayerData(playerid, P_EXITJOB) > 0)
		{
			AddPlayerData(playerid, P_EXITJOB, -, 1);
			UpdatePlayerDatabaseInt(playerid, "exitjob", GetPlayerData(playerid, P_EXITJOB));

			if(GetPlayerData(playerid, P_EXITJOB) <= 0)
				SendClientMessage(playerid, COLOR_RED, "JOB: {FFFFFF}Sekarang kamu sudah bisa /quitjob");

		}*/

		if(GetPlayerData(playerid, P_JAIL_OOC) > 0)
		{
			AddPlayerData(playerid, P_JAIL_OOC, -, 1);
			UpdatePlayerDatabaseInt(playerid, "jail_ooc", GetPlayerData(playerid, P_JAIL_OOC));

			if(GetPlayerData(playerid, P_JAIL_OOC) <= 0)
				SendClientMessage(playerid, 0x32a44bFF, "Hukuman penjara telah berakhir"),
				UnjailPlayer(playerid);
		}

		if(GetPlayerGPSInfo(playerid, G_ENABLED) == GPS_STATUS_ON)
		{
			if(IsPlayerInRangeOfPoint(playerid, 10.0, GetPlayerGPSInfo(playerid, G_POS_X), GetPlayerGPSInfo(playerid, G_POS_Y), GetPlayerGPSInfo(playerid, G_POS_Z)))
			{
				DisablePlayerGPS(playerid);
			}
		}

		new Float: player_health;

		GetPlayerHealth(playerid, player_health);

		/*if(player_health > GetPlayerHealthEx(playerid))
		{
			//SetPlayerHealthEx(playerid, GetPlayerHealthEx(playerid));

			//SetPVarInt(playerid, "anti_health_cheat", GetPVarInt(playerid, "anti_health_cheat")+1);

			if(GetPVarInt(playerid, "anti_health_cheat") >= 10)
			{
				SendClientMessage(playerid, 0xCECECEFF, "Anda ditendang karena dicurigai selingkuh {FF0000}(gac-code 01)");
				Kick:(playerid);
			}
		}
		else
		{
			SetPlayerData(playerid, P_HEALTH, player_health);
		}*/

		if(GetPlayerData(playerid, P_OCCUPIED_BED) != -1)
		{
			if(!IsPlayerInRangeOfPoint(playerid, 70.0, 1370.0732, -173.6992, 968.5089))
			{
				ClearMedBed(playerid, GetPlayerData(playerid, P_OCCUPIED_BED));
			}
			else if(GetPlayerHealthEx(playerid) >= 95.0)
			{
				SetPlayerData(playerid, P_HOSPITAL, false);

//				SendClientMessage(playerid, 0x32a44bFF, "Perawatan selesai");
//				SendClientMessage(playerid, -1, "Anda keluar dari rumah sakit");

				ClearMedBed(playerid, GetPlayerData(playerid, P_OCCUPIED_BED));

//				SetPlayerChatBubble(playerid, "Habis", 0x32a44bFF, 10.0, 2000);
				new query[90];
				mysql_format(mysql, query, sizeof query, "UPDATE accounts SET hospital=0 WHERE id=%d LIMIT 1", GetPlayerAccountID(playerid));
				mysql_query(mysql, query, false);
			}
		}

		new weapon_slot = player_weapon_slot[playerid];

		if(weapon_slot != -1)
		{
		    new fmt_text[150];

		    format(fmt_text, sizeof fmt_text, "~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~g~%s~n~%d/%d", weapon_info[GetWeaponIndex(player_weapon[playerid][weapon_slot][PW_WEAPON])][WI_NAME], player_weapon[playerid][weapon_slot][PW_CHARGED], player_weapon[playerid][weapon_slot][PW_AMMO]);

		    GameTextForPlayer(playerid, fmt_text, 1000, 3);
		}

        if(ShowSpeed[playerid] == 1)
        {
            format(fmt_str, sizeof fmt_str, "~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~y~~h~~h~Speed:~p~_%03i_", GetPlayerSpeed(playerid));
            GameTextForPlayer(playerid, fmt_str, 1000, 3);
        }

		if(IsPlayerDriver(playerid))
		{
			//new Float: health;
			new vehicleid = GetPlayerVehicleID(playerid);
			if(!IsABike(vehicleid))
			{
				new	Float: fuels = GetVehicleData(vehicleid, V_FUEL);

				SetVehicleParamsInit(vehicleid);
				SetVehicleData(vehicleid, V_MILEAGE, GetVehicleData(vehicleid, V_MILEAGE) + (float(speed) / 3600.0));

				if(vehicleid == GetPlayerData(playerid, P_TRUCK_ID))
				{
				    SetPlayerData(playerid, P_TRUCK_MILEAGE, GetVehicleData(vehicleid, V_MILEAGE) + (float(speed) / 3600.0));

			    	new query[90];

					mysql_format(mysql, query, sizeof query, "UPDATE accounts SET truck_mileage=%f WHERE id=%d LIMIT 1", GetPlayerData(playerid, P_TRUCK_MILEAGE), GetPlayerAccountID(playerid));
					mysql_query(mysql, query, false);
				}

				if(GetVehicleParamEx(vehicleid, V_ENGINE) == VEHICLE_PARAM_ON)
				{
					if(fuels <= 0.0)
					{
						SetVehicleParam(vehicleid, V_ENGINE, false);
						GameTextForPlayer(playerid, "~r~no fuel", 4000, 1);
					}
					else
					{
						if(IsAOwnableCar(vehicleid))
						{
							new index = GetVehicleData(vehicleid, V_ACTION_ID);
							SetVehicleData(vehicleid, V_FUEL, fuels - 0.01);
							SetOwnableCarData(index, OC_FUEL, GetVehicleData(vehicleid, V_FUEL));

						}
						else
						{
							SetVehicleData(vehicleid, V_FUEL, fuels - 0.01);
						}
					}
				}
				
				format(fmt_str, sizeof fmt_str, "~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~y~~h~~h~Speed:~p~_%03i_~w~~w~Fuel:~p~_%.1f l.~n~~y~~h~~h~~w~~w~Mileage:~p~ %.1f km", speed,  GetVehicleData(vehicleid, V_FUEL), GetVehicleData(vehicleid, V_MILEAGE));
                /*new string[1280];
				format(string, sizeof string, "~w~%s", GetVehicleName(vehicleid));
				PlayerTextDrawSetString(playerid, LLine1[playerid], string);
				format(string, sizeof string,"~w~Speed: %03i mph", speed);
				PlayerTextDrawSetString(playerid, LLine2[playerid], string);
				format(string, sizeof string,"~w~Fuel: ~g~%.1f~w~", GetVehicleData(vehicleid, V_FUEL));
				PlayerTextDrawSetString(playerid, LLine3[playerid], string);*/
				//GameTextForPlayer(playerid, fmt_str, 1000, 3); // Speedo old

				CheckRadars(playerid);

			}
		}
		else if(IsPlayerPassenger(playerid))
		{
			new vehicleid = GetPlayerVehicleID(playerid);
			new driver = GetVehicleData(vehicleid, V_DRIVER_ID);

			if(driver != INVALID_PLAYER_ID && IsPlayerInJob(driver) && IsPlayerDriver(driver))
			{
				if(GetPlayerJobCar(driver) == vehicleid && IsPlayerInVehicle(driver, vehicleid))
				{
					if(GetVehicleData(vehicleid, V_ACTION_TYPE) == VEHICLE_ACTION_TYPE_TAXI_DRIVER)
					{
						g_taxi_mileage[playerid] += (float(speed) / 3600.0);
						if(g_taxi_mileage[playerid] > 0.1)
						{
							g_taxi_mileage[playerid] = 0.0;

							new tariff = GetPlayerData(driver, P_JOB_TARIFF);
							if(GetPlayerMoneyEx(playerid) >= tariff)
							{
								GivePlayerMoneyEx(driver, tariff, "- Pembayaran ongkos taksi", false, true);
								GivePlayerMoneyEx(playerid, -tariff, "+ Pembayaran ongkos taksi", false, true);

								AddPlayerData(playerid, P_JOB_WAGE, +, tariff);

								format(fmt_str, sizeof fmt_str, "~r~-$%s~n~~b~+100 m", FormatMoney(tariff));
								GameTextForPlayer(playerid, fmt_str, 4000, 1);

								format(fmt_str, sizeof fmt_str, "~g~+$%s~n~~b~+100 m", FormatMoney(tariff));
								GameTextForPlayer(driver, fmt_str, 4000, 1);
							}
							else
							{
								RemovePlayerFromVehicle(playerid);
								SendClientMessage(playerid, 0xCECECEFF, "Tidak cukup uang untuk membayar ongkos lebih lanjut");
							}
						}
					}
				}
			}
		}

		if(GetPlayerTempJob(playerid) != TEMP_JOB_NONE)
		{
			CheckPlayerTempJobState(playerid);
		}

		if(GetPVarInt(playerid, "player_in_ammo_cp"))
		{
			new army_ammo = GetRepositoryData(REPOSITORY_TYPE_ARMY, REPOSITORY_ACTION_ARMY_AMMO, R_AMOUNT),
				rand_ammo = random(4)+1,
				soldiers_count;

			foreach(new i : Player)
			{
				if(!IsPlayerConnected(i)) continue;
				else if(!IsPlayerLogged(i)) continue;
				else if(GetPlayerTeamEx(i) != TEAM_ARMY) continue;

				soldiers_count++;
			}

			if(soldiers_count < 3 && GetPlayerTeamEx(playerid) != TEAM_ARMY)
				SendClientMessage(playerid, 0xCECECEFF, "Untuk mencuri kartrid dari gudang, setidaknya harus ada 3 personel militer dalam jaringan");

			else
			{
				if(army_ammo == 0)
					GameTextForPlayer(playerid, "~g~loading...", 1100, 6);
				else
				{
					if(!IsPlayerAFK(playerid))
					{
						if((army_ammo - rand_ammo) < 0)
							rand_ammo = 200000 - army_ammo;

						if((GetPlayerData(playerid, P_AMMO) + rand_ammo) > 500)
							SendClientMessage(playerid, 0x66CC33FF, "Saya tidak bisa mendapatkan lebih banyak putaran");
						else
						{
							AddPlayerData(playerid, P_AMMO, +, rand_ammo);
							UpdatePlayerDatabaseInt(playerid, "ammo", GetPlayerData(playerid, P_AMMO));

							SetRepositoryData(REPOSITORY_TYPE_ARMY, REPOSITORY_ACTION_ARMY_AMMO, R_AMOUNT, army_ammo - rand_ammo);

							new fmt_text[128];

							format(fmt_text, sizeof fmt_text, "~g~+%d patr.~n~~b~total %d patr.", rand_ammo, GetPlayerData(playerid, P_AMMO));
							GameTextForPlayer(playerid, fmt_text, 1100, 6);

							format(fmt_text, sizeof fmt_text, "+%d ��.", rand_ammo);
							SetPlayerChatBubble(playerid, fmt_text, 0xffff00FF, 10.0, 1100);

							UpdateRepository(REPOSITORY_TYPE_ARMY, REPOSITORY_ACTION_ARMY_AMMO);
						}
					}
				}
			}
		}
	}
	else
	{
		if(GetPlayerData(playerid, P_AUTH_TIME) >= 0)
		{
			if(GetPlayerData(playerid, P_AUTH_TIME) >= MAX_AUTHORIZATION_TIME)
			{
				HidePlayerDialog(playerid);

				SendClientMessage(playerid, 0xCECECEFF, "Waktu otorisasi terbatas");
				Kick:(playerid);
			}
			else AddPlayerData(playerid, P_AUTH_TIME, +, 1);
		}
	}
    return 1;
}


public: LoadPlayerData(playerid)
{
	new query[1280];
	new Cache: result;
	mysql_format(mysql, query, sizeof query, "SELECT * FROM accounts WHERE id=%d LIMIT 1", GetPlayerAccountID(playerid));
	result = mysql_query(mysql, query);

	if(cache_num_rows())
	{
		new
			buffer = 0,
			time = gettime();

        cache_get_field_content(0, "aname", g_player[playerid][P_ANAME], mysql, 61);
		cache_get_field_content(0, "email", g_player[playerid][P_EMAIL], mysql, 61);
		SetPlayerData(playerid, P_CONFIRM_EMAIL, bool: cache_get_field_content_int(0, "confirm_email"));

		SetPlayerData(playerid, P_REFER, 	cache_get_field_content_int(0, "refer"));
		SetPlayerData(playerid, P_SEX, 		bool: cache_get_field_content_int(0, "sex"));
		SetPlayerData(playerid, P_SKIN, 	cache_get_field_content_int(0, "skin"));
		SetPlayerData(playerid, P_MONEY, 	cache_get_field_content_int(0, "money"));
		SetPlayerData(playerid, P_BOOMBOX, 	cache_get_field_content_int(0, "boombox"));
		SetPlayerData(playerid, P_LAPAR, 	cache_get_field_content_int(0, "lapar"));
		SetPlayerData(playerid, P_HAUS, 	cache_get_field_content_int(0, "haus"));
		SetPlayerData(playerid, P_KENCING, 	cache_get_field_content_int(0, "kencing"));
		SetPlayerData(playerid, P_BANK, 	cache_get_field_content_int(0, "bank"));
		SetPlayerData(playerid, P_ADMIN, 	cache_get_field_content_int(0, "admin"));

		SetPlayerData(playerid, P_DRIVING_A, 	cache_get_field_content_int(0, "driving_a"));
		SetPlayerData(playerid, P_DRIVING_B, 	cache_get_field_content_int(0, "driving_b"));
		SetPlayerData(playerid, P_DRIVING_C, 	cache_get_field_content_int(0, "driving_c"));
		SetPlayerData(playerid, P_DRIVING_D, 	cache_get_field_content_int(0, "driving_d"));
		SetPlayerData(playerid, P_LIC_FLY, 		cache_get_field_content_int(0, "lic_fly"));
		SetPlayerData(playerid, P_LIC_WATER, 	cache_get_field_content_int(0, "lic_water"));
		SetPlayerData(playerid, P_LIC_BIZ, 		cache_get_field_content_int(0, "lic_biz"));
		SetPlayerData(playerid, P_LIC_WEAPON, 	cache_get_field_content_int(0, "lic_weapon"));
		SetPlayerData(playerid, P_LIC_WEAPON, 	cache_get_field_content_int(0, "lic_weapon"));
		SetPlayerData(playerid, P_TRUCKER_LIC, 	cache_get_field_content_int(0, "trucker_lic"));

		SetPlayerData(playerid, P_SUSPECT, 		cache_get_field_content_int(0, "suspect"));
		SetPlayerData(playerid, P_PHONE, 		cache_get_field_content_int(0, "phone"));
		SetPlayerData(playerid, P_PHONE_BALANCE,cache_get_field_content_int(0, "phone_balance"));
		SetPlayerData(playerid, P_PHONE_COLOR,	cache_get_field_content_int(0, "phone_color"));

		SetPlayerData(playerid, P_LAW_ABIDING,	cache_get_field_content_int(0, "law_abiding"));
		SetPlayerData(playerid, P_IMPROVEMENTS, cache_get_field_content_int(0, "improvements"));
		SetPlayerData(playerid, P_POWER, 		cache_get_field_content_int(0, "power"));

		SetPlayerData(playerid, P_DRUGS, 		cache_get_field_content_int(0, "drugs"));
		SetPlayerData(playerid, P_SEEDS, 		cache_get_field_content_int(0, "seeds"));
		SetPlayerData(playerid, P_GANJA, 		cache_get_field_content_int(0, "ganja"));
		SetPlayerData(playerid, P_AMMO, 		cache_get_field_content_int(0, "ammo"));
		SetPlayerData(playerid, P_METALL, 		cache_get_field_content_int(0, "metall"));
		SetPlayerData(playerid, P_WIFE, 		cache_get_field_content_int(0, "wife"));
		SetPlayerData(playerid, P_TEAM, 		cache_get_field_content_int(0, "team"));
		SetPlayerData(playerid, P_SUBDIVISON,	cache_get_field_content_int(0, "subdivison"));
		SetPlayerData(playerid, P_WAGE,			cache_get_field_content_int(0, "wage"));
		SetPlayerData(playerid, P_JOB, 			cache_get_field_content_int(0, "job"));

		SetPlayerData(playerid, P_HOUSE_TYPE,	cache_get_field_content_int(0, "house_type"));
		SetPlayerData(playerid, P_HOUSE_ROOM,	cache_get_field_content_int(0, "house_room"));
		SetPlayerData(playerid, P_HOUSE, 		cache_get_field_content_int(0, "house"));
		SetPlayerData(playerid, P_BUSINESS,		cache_get_field_content_int(0, "business"));
		SetPlayerData(playerid, P_FUEL_ST,		cache_get_field_content_int(0, "fuel_st"));
		SetPlayerData(playerid, pComponent,    cache_get_field_content_int(0, "component"));
 	 	SetPlayerData(playerid, P_DELAYTRUCK,   cache_get_field_content_int(0, "delaytruck"));
 	 	SetPlayerData(playerid, P_DELAY_DEATH,   cache_get_field_content_int(0, "delay_death"));
 	 	SetPlayerData(playerid, P_DELAY_SWEEPER,   cache_get_field_content_int(0, "delay_sweeper"));
        SetPlayerData(playerid, P_DELAY_MINING,  cache_get_field_content_int(0, "delay_mining"));
 	 	SetPlayerData(playerid, P_EXITJOB,   	cache_get_field_content_int(0, "exitjob"));
 	 	SetPlayerData(playerid, P_WALKIETALKIE,   	cache_get_field_content_int(0, "walkietalkie"));
 	 	SetPlayerData(playerid, P_WTFREQ,   	cache_get_field_content_int(0, "wt_freq"));
 	 	SetPlayerData(playerid, P_TOGPM,   	cache_get_field_content_int(0, "togpm"));
 	 	SetPlayerData(playerid, P_TOGOOC,   	cache_get_field_content_int(0, "togooc"));
 	 	SetPlayerData(playerid, P_DELAYBUS,   	cache_get_field_content_int(0, "delaybus"));
 	 	SetPlayerData(playerid, P_DELAYLUMBER,   	cache_get_field_content_int(0, "delaylumber"));
 	 	SetPlayerData(playerid, P_DELAYPIZZA,   	cache_get_field_content_int(0, "delaypizza"));
 	 	SetPlayerData(playerid, P_PCTIME,   	cache_get_field_content_int(0, "paycheck_time"));
		SetPlayerData(playerid, P_ADMIN_WARN,		cache_get_field_content_int(0, "admin_warn"));
		
		pData[playerid][pWS] = cache_get_field_content_int(0, "workshop");
		pData[playerid][pWSJob] = cache_get_field_content_int(0, "wsjob");
		pData[playerid][pWSBos] = cache_get_field_content_int(0, "wsbos");
		pData[playerid][pWSid] = cache_get_field_content_int(0, "workshopid");
		
		pData[playerid][pMaterial] = cache_get_field_content_int(0, "material");
		pData[playerid][pSnack] = cache_get_field_content_int(0, "snack");
		pData[playerid][pWater] = cache_get_field_content_int(0, "air_botol");
		pData[playerid][pCigar] = cache_get_field_content_int(0, "cigar");
		
		pData[playerid][pFTime] = cache_get_field_content_int(0, "fishtime");
		pData[playerid][pFMax] = cache_get_field_content_int(0, "fishmax");
		
		pData[playerid][pHead] = cache_get_field_content_float(0, "head");
		pData[playerid][pTorso] = cache_get_field_content_float(0, "torso");
		pData[playerid][pGroin] = cache_get_field_content_float(0, "groin");
		pData[playerid][pRArm] = cache_get_field_content_float(0, "rightarm");
		pData[playerid][pLArm] = cache_get_field_content_float(0, "leftarm");
		pData[playerid][pRLeg] = cache_get_field_content_float(0, "rightleg");
		pData[playerid][pLLeg] = cache_get_field_content_float(0, "leftleg");
		
		pData[playerid][pBodyCondition][0] = cache_get_field_content_float(0, "bodycondition0");
		pData[playerid][pBodyCondition][1] = cache_get_field_content_float(0, "bodycondition1");
		pData[playerid][pBodyCondition][2] = cache_get_field_content_float(0, "bodycondition2");
		pData[playerid][pBodyCondition][3] = cache_get_field_content_float(0, "bodycondition3");
		pData[playerid][pBodyCondition][4] = cache_get_field_content_float(0, "bodycondition4");
		pData[playerid][pBodyCondition][5] = cache_get_field_content_float(0, "bodycondition5");
		
		pData[playerid][pDelayForklift] = cache_get_field_content_int(0, "delay_forklift");
		pData[playerid][pGYMTime] = cache_get_field_content_int(0, "gymtime");
		
		pData[playerid][pCondition] = cache_get_field_content_int(0, "pCondition");
		pData[playerid][pUltrafluenza] = cache_get_field_content_int(0, "ultrafluenza");
		pData[playerid][pAmoxicilin] = cache_get_field_content_int(0, "amoxicilin");
		pData[playerid][pParacetamol] = cache_get_field_content_int(0, "paracetamol");
		
		pData[playerid][pGuns][0] = cache_get_field_content_int(0, "Gun1");
		pData[playerid][pGuns][1] = cache_get_field_content_int(0, "Gun2");
		pData[playerid][pGuns][2] = cache_get_field_content_int(0, "Gun3");
		pData[playerid][pGuns][3] = cache_get_field_content_int(0, "Gun4");
		pData[playerid][pGuns][4] = cache_get_field_content_int(0, "Gun5");
		pData[playerid][pGuns][5] = cache_get_field_content_int(0, "Gun6");
		pData[playerid][pGuns][6] = cache_get_field_content_int(0, "Gun7");
		pData[playerid][pGuns][7] = cache_get_field_content_int(0, "Gun8");
		pData[playerid][pGuns][8] = cache_get_field_content_int(0, "Gun9");
		pData[playerid][pGuns][9] = cache_get_field_content_int(0, "Gun10");
		pData[playerid][pGuns][10] = cache_get_field_content_int(0, "Gun11");
		pData[playerid][pGuns][11] = cache_get_field_content_int(0, "Gun12");
		pData[playerid][pGuns][12] = cache_get_field_content_int(0, "Gun13");

		pData[playerid][pAmmo][0] = cache_get_field_content_int(0, "Ammo1");
		pData[playerid][pAmmo][1] = cache_get_field_content_int(0, "Ammo2");
		pData[playerid][pAmmo][2] = cache_get_field_content_int(0, "Ammo3");
		pData[playerid][pAmmo][3] = cache_get_field_content_int(0, "Ammo4");
		pData[playerid][pAmmo][4] = cache_get_field_content_int(0, "Ammo5");
		pData[playerid][pAmmo][5] = cache_get_field_content_int(0, "Ammo6");
		pData[playerid][pAmmo][6] = cache_get_field_content_int(0, "Ammo7");
		pData[playerid][pAmmo][7] = cache_get_field_content_int(0, "Ammo8");
		pData[playerid][pAmmo][8] = cache_get_field_content_int(0, "Ammo9");
		pData[playerid][pAmmo][9] = cache_get_field_content_int(0, "Ammo10");
		pData[playerid][pAmmo][10] = cache_get_field_content_int(0, "Ammo11");
		pData[playerid][pAmmo][11] = cache_get_field_content_int(0, "Ammo12");
		pData[playerid][pAmmo][12] = cache_get_field_content_int(0, "Ammo13");

		SetPlayerData(playerid, P_FIGHT_STYLE_BOXING,		cache_get_field_content_int(0, "fight_1"));
		SetPlayerData(playerid, P_FIGHT_STYLE_KUNGFU,		cache_get_field_content_int(0, "fight_2"));
		SetPlayerData(playerid, P_FIGHT_STYLE_KNEEHEAD,		cache_get_field_content_int(0, "fight_3"));
		SetPlayerData(playerid, P_FIGHT_STYLE_GRABKICK,		cache_get_field_content_int(0, "fight_4"));
		SetPlayerData(playerid, P_FIGHT_STYLE_ELBOW,		cache_get_field_content_int(0, "fight_5"));

		SetPlayerData(playerid, P_PASS_PHOTO,		cache_get_field_content_int(0, "photo"));
		SetPlayerData(playerid, P_PASS,				cache_get_field_content_int(0, "pass"));
		SetPlayerData(playerid, P_PASS_CASH,		cache_get_field_content_int(0, "toll"));
		SetPlayerData(playerid, P_MED_REFERENCE,	cache_get_field_content_int(0, "med"));

		SetPlayerData(playerid, P_LAST_X,	cache_get_field_content_float(0, "last_x"));
		SetPlayerData(playerid, P_LAST_Y,	cache_get_field_content_float(0, "last_y"));
		SetPlayerData(playerid, P_LAST_Z,	cache_get_field_content_float(0, "last_z"));
		SetPlayerData(playerid, P_LAST_FA,	cache_get_field_content_float(0, "last_fa"));


		SetPlayerData(playerid, P_REG_TIME, 	cache_get_field_content_int(0, "reg_time"));
		cache_get_field_content(0, "reg_ip", g_player[playerid][P_REG_IP], mysql, 16);

		buffer = SetPlayerData(playerid, P_LAST_LOGIN_TIME,	cache_get_field_content_int(0, "last_login"));
		SetPlayerData(playerid, P_GAME_FOR_DAY,			cache_get_field_content_int(0, "game_for_day"));
		SetPlayerData(playerid, P_GAME_FOR_DAY_PREV,	cache_get_field_content_int(0, "game_for_day_prev"));

		buffer = GetElapsedTime(time, buffer, CONVERT_TIME_TO_DAYS);
		if(buffer == 1)
		{
			SetPlayerData(playerid, P_GAME_FOR_DAY_PREV, GetPlayerData(playerid, P_GAME_FOR_DAY));
			SetPlayerData(playerid, P_GAME_FOR_DAY, 0);
		}
		else if(buffer > 1)
		{
			SetPlayerData(playerid, P_GAME_FOR_DAY, 0);
			SetPlayerData(playerid, P_GAME_FOR_DAY_PREV, 0);
		}

		SetPlayerData(playerid, P_WARN, 				cache_get_field_content_int(0, "warn"));
		SetPlayerData(playerid, P_WARN_TIME,			cache_get_field_content_int(0, "warn_time"));
		SetPlayerData(playerid, P_MUTE, 				cache_get_field_content_int(0, "mute"));

		SetPlayerData(playerid, P_SKILL_COLT, 			cache_get_field_content_int(0, "skill_colt"));
		SetPlayerData(playerid, P_SKILL_SDPISTOL,		cache_get_field_content_int(0, "skill_sdpistol"));
		SetPlayerData(playerid, P_SKILL_DEAGLE, 		cache_get_field_content_int(0, "skill_deagle"));
		SetPlayerData(playerid, P_SKILL_SHOTGUN, 		cache_get_field_content_int(0, "skill_shotgun"));
		SetPlayerData(playerid, P_SKILL_MP5, 			cache_get_field_content_int(0, "skill_mp5"));
		SetPlayerData(playerid, P_SKILL_AK47, 			cache_get_field_content_int(0, "skill_ak47"));
		SetPlayerData(playerid, P_SKILL_M4, 			cache_get_field_content_int(0, "skill_m4"));
		SetPlayerData(playerid, P_SKILL_SNIPER_RIFLE, 	cache_get_field_content_int(0, "skill_sniper_rifle"));
		SetPlayerData(playerid, P_SKILL_SAWNOFF, 		cache_get_field_content_int(0, "skill_sawnoff"));
		SetPlayerData(playerid, P_SKILL_COMBAT_SG, 		cache_get_field_content_int(0, "skill_combat_sg"));
		SetPlayerData(playerid, P_SKILL_MICRO_UZI, 		cache_get_field_content_int(0, "skill_micro_uzi"));

		SetPlayerData(playerid, P_DONATE_CURRENT, 		cache_get_field_content_int(0, "donate"));
		SetPlayerData(playerid, P_DONATE_TOTAL, 		cache_get_field_content_int(0, "donate_total"));

		SetPlayerData(playerid, P_OSKIN,		 		cache_get_field_content_int(0, "org_skin"));

		SetPlayerData(playerid, P_SPAWN,		 		cache_get_field_content_int(0, "setting_spawn"));

		SetPlayerData(playerid, P_HOSPITAL,				bool: cache_get_field_content_int(0, "hospital"));
		SetPlayerData(playerid, P_INJURED,				    cache_get_field_content_int(0, "injured"));
		SetPlayerData(playerid, P_STARTERPACK,			    cache_get_field_content_int(0, "starterpack"));

		pData[playerid][P_HEALTH] = cache_get_field_content_float(0, "health");
		SetPlayerData(playerid, P_ARMOUR,				cache_get_field_content_float(0, "armour"));
		SetPlayerData(playerid, P_MASK, 		        cache_get_field_content_int(0, "mask"));
		SetPlayerData(playerid, P_HELM, 		        cache_get_field_content_int(0, "helm"));

		SetPlayerData(playerid, P_CAR_SLOTS,			cache_get_field_content_int(0, "car_slots"));

		SetPlayerData(playerid, P_JAIL,					cache_get_field_content_int(0, "jail"));
		SetPlayerData(playerid, P_JAIL_OOC,					cache_get_field_content_int(0, "jail_ooc"));

		SetPlayerData(playerid, P_PREMIUM,				cache_get_field_content_int(0, "premium"));
		SetPlayerData(playerid, P_PREMIUM_DATE,			cache_get_field_content_int(0, "premium_date"));

		SetPlayerData(playerid, P_LOAD_SKILL,			cache_get_field_content_int(0, "load_skill"));
		SetPlayerData(playerid, P_LUMBERG_SKILL,		cache_get_field_content_int(0, "lumberg_skill"));

		SetPlayerData(playerid, P_DEPOSIT,              cache_get_field_content_int(0, "deposit"));

		SetPlayerData(playerid, P_FAMILY,              	cache_get_field_content_int(0, "family"));
		SetPlayerData(playerid, P_FAMILY_RANK,        	cache_get_field_content_int(0, "family_rank"));

		SetPlayerData(playerid, P_FISHING_EQUIPMENT,    cache_get_field_content_int(0, "fishing_equipment"));
		SetPlayerData(playerid, P_FISH_MAS,        		cache_get_field_content_int(0, "fish_mas"));
		SetPlayerData(playerid, P_BAIT,        		    cache_get_field_content_int(0, "bait"));

		SetPlayerData(playerid, P_NEED_EAT,        		cache_get_field_content_int(0, "eat"));
		SetPlayerData(playerid, P_NEED_WATER,        	cache_get_field_content_int(0, "water"));

		SetPlayerData(playerid, P_POS_X,        cache_get_field_content_float(0, "pos_x"));
		SetPlayerData(playerid, P_POS_Y,        cache_get_field_content_float(0, "pos_y"));
		SetPlayerData(playerid, P_POS_Z,        cache_get_field_content_float(0, "pos_z"));
		SetPlayerData(playerid, P_ANGLE,        cache_get_field_content_float(0, "angle"));
		SetPlayerData(playerid, P_VIRTUAL_WORLD, 	cache_get_field_content_int(0, "virtual_world"));
		SetPlayerData(playerid, P_INTERIOR, 	cache_get_field_content_int(0, "interior"));
		SetPlayerData(playerid, P_ATWORK,       cache_get_field_content_int(0, "atwork"));
        SetPlayerData(playerid, P_ONLINE_TIME,  cache_get_field_content_int(0, "online_time"));

		SetPlayerData(playerid, P_LEVEL, 	cache_get_field_content_int(0, "score"));
		SetPlayerData(playerid, P_EXP, 		cache_get_field_content_int(0, "exp"));

		SetPlayerData(playerid, P_NEED_EAT,        		cache_get_field_content_int(0, "eat"));
		SetPlayerData(playerid, P_NEED_WATER,        	cache_get_field_content_int(0, "water"));

		SetPlayerData(playerid, P_TRUCK_ROAD,        	cache_get_field_content_int(0, "truck_road"));
		SetPlayerData(playerid, P_TRUCK_WAGE,        	cache_get_field_content_int(0, "truck_wage"));
		SetPlayerData(playerid, P_TRUCK_MILEAGE,        cache_get_field_content_float(0, "truck_mileage"));

		SetPlayerData(playerid, P_GIFTS,        		cache_get_field_content_int(0, "gifts"));

		SetPlayerData(playerid, P_BONUS_GET,        	cache_get_field_content_int(0, "bonusget"));
        SetPlayerData(playerid, P_BONUS_DAY,        	cache_get_field_content_int(0, "loginday"));
        SetPlayerData(playerid, P_IN_BUSINESS,        	cache_get_field_content_int(0, "in_business"));
        SetPlayerData(playerid, P_IN_HOUSE,        	cache_get_field_content_int(0, "in_house"));

		//SetTimerEx("NeedEatPlayer", 1000*60*20, true, "i", playerid);
		//SetTimerEx("NeedWaterPlayer", 1000*60*30, true, "i", playerid);

		GivePlayerWeaponEx(playerid, GetPlayerData(playerid, P_CHAINSAW), 1);

		//SendClientMessageTip(playerid, "Anda tidak terhubung perlindungan Google Authenticator");
		//SendClientMessageTip(playerid, "Kami menyarankan untuk menghubungkan jenis perlindungan ini. /mm > Keamanan > Google Authenticator");
		// -------------------------------------------------------------------------
		SelectPlayerSpawn(playerid, 0);
		LoadPlayerVehicle(playerid);
        
		SetPlayerArmour(playerid, GetPlayerData(playerid, P_ARMOUR));
		SetPlayerHealthEx(playerid, GetPlayerData(playerid, P_HEALTH));
		mysql_format(mysql, query, sizeof query, "UPDATE accounts SET online = '1' WHERE id=%d LIMIT 1", GetPlayerAccountID(playerid));
		mysql_query(mysql, query);
	}
	cache_delete(result);
}

stock ShowSelectSpawnDialog(playerid)
{
    Dialog
	(
	    playerid,
	    DIALOG_SELECT_SPAWN,
	    DIALOG_STYLE_LIST,
	    "Pilih lokasi pemijahan",
	    "1. Di pintu keluar dari game\n"\
	    "2. Di stasiun kereta api atau stasiun bus\n"\
		"3. Di rumah sendiri\n"\
		"4. Di kamar hotel\n"\
		"5. Organisasi berbasis\n"\
		"6. Pergi (hidup bersama)\n"\
		"7. Di rumah keluarga\n"\
		"8. Last Exit Player",
	    "Pilihan", ""
	);

	return 1;
}



stock Dialog(playerid, dialogid, style, caption[], info[], button1[], button2[])
{
	if(GetPVarInt(playerid, "buycar_dialog"))
	{
	    TogglePlayerControllable(playerid, true);
		RemovePlayerFromVehicle(playerid);

		DeletePVar(playerid, "buycar_dialog");
	}

	SetPlayerData(playerid, P_LAST_DIALOG, dialogid);

	new fix_style = style;

	/*if(!GetPlayerData(playerid, P_USER_PC) && style == DIALOG_STYLE_LIST)
	{
	    fix_style = DIALOG_STYLE_INPUT;

	    SetPVarInt(playerid, "fix_style", 1);
	}*/

	return ShowPlayerDialog(playerid, dialogid, fix_style, caption, info, button1, button2);
}


CMD:inspect(playerid, params[])
{
    new otherid;
    if(sscanf(params, "u", otherid))
        return Info(playerid, "Use /inspect [playerid/PartOfName]");

    if(otherid == INVALID_PLAYER_ID || !IsPlayerInRangeOfPlayer(playerid, otherid, 6.0))
        return Error(playerid, "The specified player is disconnected or not near you.");

    if(otherid == playerid)
        return Error(playerid, "You cannot frisk yourself.");

    pData[otherid][pInspectOffer] = playerid;

    new fmt_text[1280];
    format(fmt_text, sizeof fmt_text, "%s has offered to inspect you (type \"/accept inspect or ignore\").", GetPlayerNameEx(playerid));

    Info(otherid, fmt_text);
    format(fmt_text, sizeof fmt_text, "You have offered to inspect %s.", GetPlayerNameEx(otherid));
    Info(playerid, fmt_text);
    return 1;
}


CMD:health(playerid, params[])
{
	new body[80];
	if(PlayerInfo[playerid][pCondition] > 61)
	{
	    body = "Normal";
	}
	if(PlayerInfo[playerid][pCondition] < 60)
	{
	    body = "Sick";
	}

	new str[1500];
	format(str, sizeof(str), "{56A4E4}�{DB881A}| {C2A2DA}===[Body part status]===\n");
	format(str, sizeof str, "%s"WHITE_E"Part: {00FFFC}Whole Body\n", str);
	format(str, sizeof str, "%s"WHITE_E"Condition: {0ED000}%s\n", str, body);
	format(str, sizeof(str), "%s{FFFFFF}Part: {33CCFF}Torso{FFFFFF} | Fitness Rating:{00FF00} %.2f\n", str, pData[playerid][pBodyCondition][0]);
	format(str, sizeof(str), "%sCondition: %.2f\n", str, pData[playerid][pTorso]);
	format(str, sizeof(str), "%s{FFFFFF}Part: {33CCFF}Groin{FFFFFF} | Fitness Rating:{00FF00} %.2f\n", str, pData[playerid][pBodyCondition][1]);
	format(str, sizeof(str), "%sCondition: %.2f\n", str, pData[playerid][pGroin]);
	format(str, sizeof(str), "%s{FFFFFF}Part: {33CCFF}Right Arm{FFFFFF} | Fitness Rating:{00FF00} %.2f\n", str, pData[playerid][pBodyCondition][2]);
	format(str, sizeof(str), "%sCondition: %.2f\n", str, pData[playerid][pRArm]);
	format(str, sizeof(str), "%s{FFFFFF}Part: {33CCFF}Left Arm{FFFFFF} | Fitness Rating:{00FF00} %.2f\n", str, pData[playerid][pBodyCondition][3]);
	format(str, sizeof(str), "%sCondition: %.2f\n", str, pData[playerid][pLArm]);
	format(str, sizeof(str), "%s{FFFFFF}Part: {33CCFF}Right Leg{FFFFFF} | Fitness Rating:{00FF00} %.2f\n", str, pData[playerid][pBodyCondition][4]);
	format(str, sizeof(str), "%sCondition: %.2f\n", str, pData[playerid][pRLeg]);
	format(str, sizeof(str), "%s{FFFFFF}Part: {33CCFF}Left Leg{FFFFFF} | Fitness Rating:{00FF00} %.2f\n", str, pData[playerid][pBodyCondition][5]);
	format(str, sizeof(str), "%sCondition: %.2f\n", str, pData[playerid][pLLeg]);
	format(str, sizeof(str), "%s{FFFFFF}Part: {33CCFF}Head{FFFFFF}\n", str);
	format(str, sizeof(str), "%sCondition: %.2f", str, pData[playerid][pHead]);
	Dialog(playerid, 0, DIALOG_STYLE_MSGBOX, "Character Health", str, "Close", "");
	return 1;
}


CMD:accept(playerid, params[])
{
	if(IsPlayerConnected(playerid))
	{
        if(isnull(params))
		{
            SendClientMessage(playerid, COLOR_GREY, "USAGE: /accept [name]");
            Info(playerid, "Names: job, frisk");
            return 1;
        }
		if(strcmp(params,"job",true) == 0)
		{
			if(GetPlayerData(playerid, P_GETJOB) > 0)
			{
				GetPlayerData(playerid, P_JOB) = GetPlayerData(playerid, P_GETJOB);
				new query[64];
				new fmt_str[800];
				format(query, sizeof query, "UPDATE accounts SET job=%d WHERE id=%d LIMIT 1", GetPlayerData(playerid, P_JOB), GetPlayerAccountID(playerid));
				mysql_query(mysql, query, false);
				format(fmt_str, sizeof fmt_str, "JOB: {FFFFFF}Anda beehasil mendapatkan job %s. gunakan /jobhelp untuk informasi.", GetPlayerJobAndRankName(playerid));
				SendClientMessage(playerid, COLOR_YELLOW, fmt_str);
				GetPlayerData(playerid, P_GETJOB) = 0;
    			SetPlayerData(playerid, P_EXITJOB, gettime() + 1 * 86400);
				UpdatePlayerDatabaseInt(playerid, "exitjob", GetPlayerData(playerid, P_EXITJOB));
			}
		}
        else if(strcmp(params,"frisk",true) == 0)
        {
            if(pData[playerid][pFriskOffer] == INVALID_PLAYER_ID || !IsPlayerConnected(pData[playerid][pFriskOffer]))
                return Error(playerid, "That player not connected!");

            if(!IsPlayerInRangeOfPlayer(playerid, pData[playerid][pFriskOffer], 5.0))
                return Error(playerid, "You must be near this player.");

            new String[10000], S3MP4K[10000];
            strcat(S3MP4K, "Item\tAmount\n");
            if(GetPlayerMoneyEx(playerid) < 0)
            {
                format(String, sizeof(String), "Cash\t{FF0000}($%s)\n{FFFFFF}", FormatMoney(GetPlayerMoneyEx(playerid)));
                strcat(S3MP4K, String);
            }
            if(GetPlayerMoneyEx(playerid) > 0)
            {
                format(String, sizeof(String), "Cash\t$%s\n", FormatMoney(GetPlayerMoneyEx(playerid)));
                strcat(S3MP4K, String);
            }
            if(GetPlayerData(playerid, P_BAIT) > 0)
            {
                format(String, sizeof(String), "Bait\t%d\n", GetPlayerData(playerid, P_BAIT));
                strcat(S3MP4K, String);
            }
            if(GetPlayerData(playerid, P_GANJA) > 0)
            {
                format(String, sizeof(String), "Ganja\t%d\n", GetPlayerData(playerid, P_GANJA));
                strcat(S3MP4K, String);
            }
            if(GetPlayerData(playerid, pComponent) > 0)
            {
                format(String, sizeof(String), "Component\t%d\n", GetPlayerData(playerid, pComponent));
                strcat(S3MP4K, String);
            }
            if(pData[playerid][pMaterial] > 0)
		    {
				format(String, sizeof(String), "Material\t%d\n", pData[playerid][pMaterial]);
			    strcat(S3MP4K, String);
			}
			for(new i = 0; i < 13; i++)
			{
				if(pData[playerid][pGuns][i] > 0)
				{
				    format(String, sizeof(String), "%s\t%d\n", GetWeaponName(pData[playerid][pGuns][i]), pData[playerid][pAmmo][i]);
			    	strcat(S3MP4K, String);
				}
			}
            Dialog(pData[playerid][pFriskOffer], INVALID_DIALOG_ID, DIALOG_STYLE_TABLIST_HEADERS, "Frisk", S3MP4K, "Close", "");
            new fmt_str[1280];
            format(fmt_str, sizeof fmt_str, "Anda telah berhasil menaccept tawaran frisk kepada %s.", NamaPlayer(pData[playerid][pFriskOffer]));
            Info(playerid, fmt_str);
            pData[playerid][pFriskOffer] = INVALID_PLAYER_ID;
        }
        else if(strcmp(params,"inspect",true) == 0)
        {
            if(pData[playerid][pInspectOffer] == INVALID_PLAYER_ID || !IsPlayerConnected(pData[playerid][pInspectOffer]))
                return Error(playerid, "That player not connected!");

            if(!IsPlayerInRangeOfPlayer(playerid, pData[playerid][pInspectOffer], 5.0))
                return Error(playerid, "You must be near this player.");
                
            new body[80];
			if(PlayerInfo[playerid][pCondition] > 61)
			{
			    body = "Normal";
			}
			if(PlayerInfo[playerid][pCondition] < 60)
			{
			    body = "Sick";
			}

			new str[1500];
			format(str, sizeof(str), "{56A4E4}�{DB881A}| {C2A2DA}===[Body part status]===\n");
			format(str, sizeof str, "%s"WHITE_E"Part: {00FFFC}Whole Body\n", str);
			format(str, sizeof str, "%s"WHITE_E"Condition: {0ED000}%s\n", str, body);
			format(str, sizeof(str), "%s{FFFFFF}Part: {33CCFF}Torso{FFFFFF} | Fitness Rating:{00FF00} %.2f\n", str, pData[playerid][pBodyCondition][0]);
			format(str, sizeof(str), "%sCondition: %.2f\n", str, pData[playerid][pTorso]);
			format(str, sizeof(str), "%s{FFFFFF}Part: {33CCFF}Groin{FFFFFF} | Fitness Rating:{00FF00} %.2f\n", str, pData[playerid][pBodyCondition][1]);
			format(str, sizeof(str), "%sCondition: %.2f\n", str, pData[playerid][pGroin]);
			format(str, sizeof(str), "%s{FFFFFF}Part: {33CCFF}Right Arm{FFFFFF} | Fitness Rating:{00FF00} %.2f\n", str, pData[playerid][pBodyCondition][2]);
			format(str, sizeof(str), "%sCondition: %.2f\n", str, pData[playerid][pRArm]);
			format(str, sizeof(str), "%s{FFFFFF}Part: {33CCFF}Left Arm{FFFFFF} | Fitness Rating:{00FF00} %.2f\n", str, pData[playerid][pBodyCondition][3]);
			format(str, sizeof(str), "%sCondition: %.2f\n", str, pData[playerid][pLArm]);
			format(str, sizeof(str), "%s{FFFFFF}Part: {33CCFF}Right Leg{FFFFFF} | Fitness Rating:{00FF00} %.2f\n", str, pData[playerid][pBodyCondition][4]);
			format(str, sizeof(str), "%sCondition: %.2f\n", str, pData[playerid][pRLeg]);
			format(str, sizeof(str), "%s{FFFFFF}Part: {33CCFF}Left Leg{FFFFFF} | Fitness Rating:{00FF00} %.2f\n", str, pData[playerid][pBodyCondition][5]);
			format(str, sizeof(str), "%sCondition: %.2f\n", str, pData[playerid][pLLeg]);
			format(str, sizeof(str), "%s{FFFFFF}Part: {33CCFF}Head{FFFFFF}\n", str);
			format(str, sizeof(str), "%sCondition: %.2f", str, pData[playerid][pHead]);
            
            Dialog(pData[playerid][pInspectOffer], INVALID_DIALOG_ID, DIALOG_STYLE_MSGBOX, "Inspect", str, "Close", "");
            new fmt_str[1280];
            format(fmt_str, sizeof fmt_str, "Anda telah berhasil menaccept tawaran inspect kepada %s.", NamaPlayer(pData[playerid][pInspectOffer]));
            Info(playerid, fmt_str);
            pData[playerid][pInspectOffer] = INVALID_PLAYER_ID;
        }
	}
	return 1;
}

CMD:quitjob(playerid, params[])
{
    new quittime = GetPlayerData(playerid, P_EXITJOB);
    new time = gettime();
    if((quittime - time) > 0) return SendClientMessage(playerid, COLOR_RED, " {FFFFFF}Kamu tidak bisa quitjob sekarang");
    new fmt_text[360];
    format(fmt_text, sizeof fmt_text, "Kamu berhasil keluar dari job %s", GetPlayerJobAndRankName(playerid));
    SendClientMessage(playerid, COLOR_WHITE, fmt_text);
    SetPlayerData(playerid, P_JOB, 0);
    SetPlayerData(playerid, P_EXITJOB, 0);
	UpdatePlayerDatabaseInt(playerid, "exitjob", 0);

	new query[64];

	format(query, sizeof query, "UPDATE accounts SET job=%d WHERE id=%d LIMIT 1", GetPlayerData(playerid, P_JOB), GetPlayerAccountID(playerid));
	mysql_query(mysql, query, false);
	return 1;
}


CMD:stopfitness(playerid, params[])
{
	if(PlayerInfo[playerid][pFitnessType] != 0)
	{
	    if(SedangFitness[playerid] == 1)
		{
			if(PlayerInfo[playerid][pFitnessType] == 1)
			{
			    SedangFitness[playerid] = 0;
			    SendClientMessageEx(playerid, -1, "{56A4E4}�{DB881A}| {FF0000}Fitness Status\n");
			    PlayerInfo[playerid][pBodyCondition][0] += frandom(0.5);
				SendClientMessageEx(playerid, -1, "{56A4E4}�{DB881A}| {00ff00}Groin: {ffff00}%.1f > %.1f\n", PlayerInfo[playerid][pBodyCondition][0]-=frandom(0.5), PlayerInfo[playerid][pBodyCondition][0]+=frandom(0.5));
				PlayerInfo[playerid][pBodyCondition][2] += frandom(0.5);
				SendClientMessageEx(playerid, -1, "{56A4E4}�{DB881A}| {00ff00}RArm: {ffff00}%.1f > %.1f\n", PlayerInfo[playerid][pBodyCondition][2]-=frandom(0.5), PlayerInfo[playerid][pBodyCondition][2]+=frandom(0.5));
				PlayerInfo[playerid][pBodyCondition][3] += frandom(0.5);
				SendClientMessageEx(playerid, -1, "{56A4E4}�{DB881A}| {00ff00}LArm: {ffff00}%.1f > %.1f", PlayerInfo[playerid][pBodyCondition][3]-=frandom(0.5), PlayerInfo[playerid][pBodyCondition][3]+=frandom(0.5));
				PlayerInfo[playerid][pBodyCondition][1] += frandom(0.2);
				SendClientMessageEx(playerid, -1, "{56A4E4}�{DB881A}| {00ff00}Torso: {ffff00}%.1f > %.1f\n", PlayerInfo[playerid][pBodyCondition][1]-=frandom(0.2), PlayerInfo[playerid][pBodyCondition][1]+=frandom(0.2));
				PlayerInfo[playerid][pBodyCondition][4] += frandom(0.5);
				SendClientMessageEx(playerid, -1, "{56A4E4}�{DB881A}| {00ff00}RLeg: {ffff00}%.1f > %.1f\n", PlayerInfo[playerid][pBodyCondition][4]-=frandom(0.5), PlayerInfo[playerid][pBodyCondition][4]+=frandom(0.5));
				PlayerInfo[playerid][pBodyCondition][5] += frandom(0.5);
				SendClientMessageEx(playerid, -1, "{56A4E4}�{DB881A}| {00ff00}LLeg: {ffff00}%.1f > %.1f", PlayerInfo[playerid][pBodyCondition][5]-=frandom(0.5), PlayerInfo[playerid][pBodyCondition][5]+=frandom(0.5));
				PlayerInfo[playerid][pFitnessType] = 0;

				Streamer_Update(playerid);
				ClearAnimations(playerid);
			}
			if(PlayerInfo[playerid][pFitnessType] == 2)
			{
			    SedangFitness[playerid] = 0;
			    SendClientMessageEx(playerid, -1, "{56A4E4}�{DB881A}| {FF0000}Fitness Status\n");
			    PlayerInfo[playerid][pBodyCondition][1] += frandom(1.0);
				SendClientMessageEx(playerid, -1, "{56A4E4}�{DB881A}| {00ff00}Torso: {ffff00}%.1f > %.1f\n", PlayerInfo[playerid][pBodyCondition][1]-=frandom(1.0), PlayerInfo[playerid][pBodyCondition][0]+=frandom(1.0));
				PlayerInfo[playerid][pBodyCondition][4] += frandom(0.5);
				SendClientMessageEx(playerid, -1, "{56A4E4}�{DB881A}| {00ff00}RLeg: {ffff00}%.1f > %.1f\n", PlayerInfo[playerid][pBodyCondition][4]-=frandom(0.5), PlayerInfo[playerid][pBodyCondition][2]+=frandom(0.5));
				PlayerInfo[playerid][pBodyCondition][5] += frandom(0.5);
				SendClientMessageEx(playerid, -1, "{56A4E4}�{DB881A}| {00ff00}LLeg: {ffff00}%.1f > %.1f", PlayerInfo[playerid][pBodyCondition][5]-=frandom(0.5), PlayerInfo[playerid][pBodyCondition][3]+=frandom(0.5));
				PlayerInfo[playerid][pFitnessType] = 0;

				Streamer_Update(playerid);
				ClearAnimations(playerid);
			}
			if(PlayerInfo[playerid][pFitnessType] == 3)
			{
			    SedangFitness[playerid] = 0;
			    SendClientMessageEx(playerid, -1, "{56A4E4}�{DB881A}| {FF0000}Fitness Status\n");
			    PlayerInfo[playerid][pBodyCondition][0] += frandom(0.5);
				SendClientMessageEx(playerid, -1, "{56A4E4}�{DB881A}| {00ff00}Groin: {ffff00}%.1f > %.1f\n", PlayerInfo[playerid][pBodyCondition][0]-=frandom(0.5), PlayerInfo[playerid][pBodyCondition][0]+=frandom(0.5));
				PlayerInfo[playerid][pBodyCondition][2] += frandom(0.5);
				SendClientMessageEx(playerid, -1, "{56A4E4}�{DB881A}| {00ff00}RArm: {ffff00}%.1f > %.1f\n", PlayerInfo[playerid][pBodyCondition][2]-=frandom(0.5), PlayerInfo[playerid][pBodyCondition][2]+=frandom(0.5));
				PlayerInfo[playerid][pBodyCondition][3] += frandom(0.5);
				SendClientMessageEx(playerid, -1, "{56A4E4}�{DB881A}| {00ff00}LArm: {ffff00}%.1f > %.1f", PlayerInfo[playerid][pBodyCondition][3]-=frandom(0.5), PlayerInfo[playerid][pBodyCondition][3]+=frandom(0.5));
				PlayerInfo[playerid][pFitnessType] = 0;
				ClearAnimations(playerid);

				Streamer_Update(playerid);
			}
		}
	}
	return 1;
}


CMD:fitness(playerid, params[])
{
	new businessid = GetPlayerInBiz(playerid), String[1280];
	
 	if(!IsPlayerInBuyPosBiz(playerid, businessid, BUSINESS_TYPE_SPORTZAL))
 	    return SEM(playerid, " You are not at gym");

	if(PlayerInfo[playerid][pGYMTime] < 1)
		return SEM(playerid, " Anda tidak memiliki GYM Membership");

    if(PlayerInfo[playerid][pFitnessTimer] > 0)
    {
    	SendClientMessageEx(playerid, COLOR_GRAD2, " Anda harus menunggu %d menit untuk melakukan Fitness kembali", PlayerInfo[playerid][pFitnessTimer]/60);
		return 1;
	}
	foreach(new idx : GYM)
	{
		if(IsPlayerInRangeOfPoint(playerid, 3.0, GYMInfo[idx][GYMOBJPos][0], GYMInfo[idx][GYMOBJPos][1], GYMInfo[idx][GYMOBJPos][2]))
		{
		    if(GYMInfo[idx][GYMOBJUsed] == 0)
		    {
			    if(GYMInfo[idx][GYMOBJType] == 1)
				{
				    SedangFitness[playerid] = 1;
					PlayerInfo[playerid][pFitnessTimer] = 1*60;
					PlayerInfo[playerid][pFitnessType] = 1;
					GYMInfo[idx][GYMOBJCondition] -= Random(50, 100);
					DestroyDynamic3DTextLabel(GYMInfo[idx][GYMOBJText]);
					format(String, 128, "[ID:%d]\n{00FF00}Used\n%d/1000", idx, GYMInfo[idx][GYMOBJCondition]);
					GYMInfo[idx][GYMOBJText] = CreateDynamic3DTextLabel(String, COLOR_RIKO, GYMInfo[idx][GYMOBJPos][0], GYMInfo[idx][GYMOBJPos][1], GYMInfo[idx][GYMOBJPos][2], 5.0, 0, 0);
					SetPlayerPos(playerid, GYMInfo[idx][GYMOBJPos][0]+0.5, GYMInfo[idx][GYMOBJPos][1], GYMInfo[idx][GYMOBJPos][2]);
					OnePlayAnim(playerid, "GYMNASIUM", "gym_tread_sprint", 4.1, 0, 0, 0, 0, 9999999);
					SetCameraBehindPlayer(playerid);
					Streamer_Update(playerid);
				}
				if(GYMInfo[idx][GYMOBJType] == 2)
				{
				    SedangFitness[playerid] = 1;
					PlayerInfo[playerid][pFitnessTimer] = 1*60;
					PlayerInfo[playerid][pFitnessType] = 2;
		         	GYMInfo[idx][GYMOBJCondition] -= Random(50, 100);
					DestroyDynamic3DTextLabel(GYMInfo[idx][GYMOBJText]);
					format(String, 128, "[ID:%d]\n{00FF00}Used\n%d/1000", idx, GYMInfo[idx][GYMOBJCondition]);
					GYMInfo[idx][GYMOBJText] = CreateDynamic3DTextLabel(String, COLOR_RIKO, GYMInfo[idx][GYMOBJPos][0], GYMInfo[idx][GYMOBJPos][1], GYMInfo[idx][GYMOBJPos][2], 5.0, 0, 0);
					SetPlayerPos(playerid, GYMInfo[idx][GYMOBJPos][0]+0.5, GYMInfo[idx][GYMOBJPos][1], GYMInfo[idx][GYMOBJPos][2]);
					OnePlayAnim(playerid, "GYMNASIUM", "gym_bike_faster", 4.1, 0, 0, 0, 0, 9999999);
					SetCameraBehindPlayer(playerid);
					Streamer_Update(playerid);
				}
				if(GYMInfo[idx][GYMOBJType] == 3)
				{
				    SedangFitness[playerid] = 1;
					PlayerInfo[playerid][pFitnessTimer] = 1*60;
					PlayerInfo[playerid][pFitnessType] = 3;
		         	GYMInfo[idx][GYMOBJCondition] -= Random(50, 100);
					DestroyDynamic3DTextLabel(GYMInfo[idx][GYMOBJText]);
					format(String, 128, "[ID:%d]\n{00FF00}Used\n%d/1000", idx, GYMInfo[idx][GYMOBJCondition]);
					GYMInfo[idx][GYMOBJText] = CreateDynamic3DTextLabel(String, COLOR_RIKO, GYMInfo[idx][GYMOBJPos][0], GYMInfo[idx][GYMOBJPos][1], GYMInfo[idx][GYMOBJPos][2], 5.0, 0, 0);
					SetPlayerPos(playerid, GYMInfo[idx][GYMOBJPos][0]+0.5, GYMInfo[idx][GYMOBJPos][1], GYMInfo[idx][GYMOBJPos][2]);
					OnePlayAnim(playerid, "GYMNASIUM", "GYMshadowbox", 4.1, 0, 0, 0, 0, 9999999);
					SetCameraBehindPlayer(playerid);
					Streamer_Update(playerid);
				}
			}
			else return SEM(playerid, " This is used");
		}
		else return SEM(playerid, " Anda tidak berada di dekat alat fitness");
	}
 	return 1;
}
CMD:editmachine(playerid, params[])
{
	new id, String[512], amount;
	if(PlayerInfo[playerid][P_ADMIN] < 4) return SEM(playerid, " You don't have the privilege to use this command!");
	if(sscanf(params, "s[32]", params))
	{
	    SendClientMessage(playerid, COLOR_WHITE, "KEGUNAAN: /editmachine [posisi,condition]");
	    return 1;
	}
	if(!strcmp(params, "posisi", true, 6))
	{
	    if(sscanf(params, "s[32]i", params, id)) return SendClientMessage(playerid, COLOR_WHITE, "/editmachine posisi [id]");
		if(!GYMInfo[id][GYMOBJPos][0])
		{
			SendClientMessage(playerid, COLOR_GREY, "invalid id");
			return 1;
		}
		gymEdit[playerid] = 1;
		gymEditID[playerid] = id;
		GetDynamicObjectPos(GYMInfo[id][GYMOBJObject], gymObjectPos[playerid][0], gymObjectPos[playerid][1], gymObjectPos[playerid][2]);
		GetDynamicObjectRot(GYMInfo[id][GYMOBJObject], gymObjectRot[playerid][0], gymObjectRot[playerid][1], gymObjectRot[playerid][2]);
		EditDynamicObject(playerid, GYMInfo[id][GYMOBJObject]);
		DestroyDynamic3DTextLabel(GYMInfo[id][GYMOBJText]);
  		format(String, 128, "[ID:%d]\n{00FF00}Available\n%d/1000", id, GYMInfo[id][GYMOBJCondition]);
		GYMInfo[id][GYMOBJText] = CreateDynamic3DTextLabel(String, COLOR_RIKO, GYMInfo[id][GYMOBJPos][0], GYMInfo[id][GYMOBJPos][1], GYMInfo[id][GYMOBJPos][2],4.0);
		SaveGYMObject(id);
	}
	if(!strcmp(params, "condition", true, 9))
	{
	    if(sscanf(params, "s[32]ii", params, id, amount)) return SendClientMessage(playerid, COLOR_WHITE, "/editgymobject condition [id] [amount]");
		if(!GYMInfo[id][GYMOBJPos][0])
		{
			SendClientMessage(playerid, COLOR_GREY, "invalid id");
			return 1;
		}
		GYMInfo[id][GYMOBJCondition] = amount;
		DestroyDynamic3DTextLabel(GYMInfo[id][GYMOBJText]);
  		format(String, 128, "[ID:%d]\n{00FF00}Available\n%d/1000", id, GYMInfo[id][GYMOBJCondition]);
		GYMInfo[id][GYMOBJText] = CreateDynamic3DTextLabel(String, COLOR_RIKO, GYMInfo[id][GYMOBJPos][0], GYMInfo[id][GYMOBJPos][1], GYMInfo[id][GYMOBJPos][2], 4.0);
		SaveGYMObject(id);
	}
	return 1;
}



CMD:revive(playerid, params[])
{
    if(GetPlayerAdminEx(playerid) < 1) return 1;

	extract params -> new to_player; else return SendClientMessage(playerid, 0xCECECEFF, "Gunakan: /revive [id pemain]");

	if(!IsPlayerConnected(to_player) || !IsPlayerLogged(to_player))
		return SendClientMessage(playerid, 0xCECECEFF, "Tidak ada pemain seperti itu");

    if(GetPlayerData(to_player, P_INJURED) == 0) return Error(playerid, "Pemain Itu Tidak Sekarat");

	SetPlayerHealthEx(to_player, 100);
	SetPlayerData(to_player, P_INJURED, 0);
	UpdatePlayerDatabaseInt(to_player, "injured", 0);
	SetPlayerDrunkLevel(to_player, 0);
	SetPlayerData(to_player, P_DELAY_DEATH, 0);
	UpdatePlayerDatabaseInt(to_player, "delay_death", 0);
	ClearAnimations(to_player);
	SetPlayerHealthEx(playerid, 100);

	new fmt_str[128];
	format(fmt_str, sizeof fmt_str, "[REVIVE] {FFFFFF}%s Telah Revive %s", GetAdminNameEx(playerid), GetPlayerNameEx(to_player));
	SendMessageToAdmins(fmt_str, COLOR_LOGS);

	return 1;
}

CMD:explode(playerid, params[])
{
    if(GetPlayerAdminEx(playerid) < 6) return 1;

	new Float:POS[3];

	extract params -> new to_player; else return SendClientMessage(playerid, 0xCECECEFF, "Gunakan: /explode [id pemain]");

	if(!IsPlayerConnected(to_player) || !IsPlayerLogged(to_player))
		return SendClientMessage(playerid, 0xCECECEFF, "Tidak ada pemain seperti itu");

    GetPlayerPos(to_player, POS[0], POS[1], POS[2]);
	CreateExplosion(POS[0], POS[1], POS[2], 7, 5.0);

	new fmt_str[128];
	format(fmt_str, sizeof fmt_str, "[EXPLODE] {FFFFFF}%s telah meledakkan %s", GetAdminNameEx(playerid), GetPlayerNameEx(to_player));
	SendMessageToAdmins(fmt_str, COLOR_LOGS);

	return 1;
}

CMD:explodecar(playerid, params[])
{
    if(GetPlayerAdminEx(playerid) < 6) return 1;

	new Float:POS[3];

	extract params -> new to_player; else return SendClientMessage(playerid, 0xCECECEFF, "Gunakan: /explode [id pemain]");

	if(!IsPlayerConnected(to_player) || !IsPlayerLogged(to_player))
		return SendClientMessage(playerid, 0xCECECEFF, "Tidak ada pemain seperti itu");

    if(GetPlayerOwnableCar(to_player) == INVALID_VEHICLE_ID)
		return SendClientMessage(playerid, 0xCECECEFF, "Pemain tidak memiliki transportasi pribadi");

    GetVehiclePos(GetPlayerOwnableCar(to_player), POS[0], POS[1], POS[2]);
	CreateExplosion(POS[0], POS[1], POS[2], 7, 5.0);

	new fmt_str[128];
	format(fmt_str, sizeof fmt_str, "[EXPLODE] {FFFFFF}%s telah meledakkan kendaraan %s", GetAdminNameEx(playerid), GetPlayerNameEx(to_player));
	SendMessageToAdmins(fmt_str, COLOR_LOGS);

	return 1;
}

CMD:death(playerid)
{
	if(GetPlayerData(playerid, P_INJURED) == 0) return Error(playerid, "Anda Tidak Sedang Pingsan.");
    if(GetPlayerData(playerid, P_JAIL) > 0) return Error(playerid, "Anda Harus Keluar Dari Penjara Untuk Menggunakan CMD ini.");
    if(GetPlayerData(playerid, P_CUFFED) > 0) return Error(playerid, "Anda Tidak Bisa Menggunakan CMD ini Saat Sedang Di Borgol.");
    new fmt_msg[1280];
    format(fmt_msg, sizeof fmt_msg, "{56A4E4}�{DB881A}| {FFFFFF}Kamu Harus Menunggu Selama %d:%02d Untuk Menggunakan CMD ini.", floatround(GetPlayerData(playerid, P_DELAY_DEATH) / 60) /* % 60 */, (GetPlayerData(playerid, P_DELAY_DEATH) % 60));
    if(GetPlayerData(playerid, P_DELAY_DEATH) > 0) return SendClientMessage(playerid, COLOR_RED, fmt_msg);

    new med_pos = random(sizeof g_med_position);

	SetPlayerPosEx
	(
		playerid,
		g_med_position[med_pos][0]+ random(3),
		g_med_position[med_pos][1]+ random(2),
		g_med_position[med_pos][2],
		g_med_position[med_pos][3],
		6, 0
	);

	SetPlayerHealthEx(playerid, 20);
	SetPlayerData(playerid, P_INJURED, 0);
	UpdatePlayerDatabaseInt(playerid, "injured", 0);
    SetPlayerInBiz(playerid, -1);
    SetPlayerInHouse(playerid, -1);

    return 1;
}

/*CMD:medbed(playerid, params[])
{
	if(IsPlayerInRangeOfPoint(playerid, 100.0, 1370.0732, -173.6992, 968.5089))
	{
	    if(GetPlayerHealthEx(playerid) >= 75)
		{
			return SendClientMessage(playerid, 0xCECECEFF, "Anda tidak perlu perawatan");
		}
		new bedid = -1;

		for(new i; i < sizeof g_med_bed_pos; i++)
		{
			if(!IsPlayerInRangeOfPoint(playerid, 2.5, g_med_bed_pos[i][0], g_med_bed_pos[i][1], g_med_bed_pos[i][2])) continue;
			bedid = i;
			break;
		}

		if(bedid == -1) return 1;
		else if(GetPlayerData(playerid, P_OCCUPIED_BED) != -1) return SendClientMessage(playerid, 0xCECECEFF, "Anda sudah tidur");
		else if(g_med_bed_used[bedid]) return SendClientMessage(playerid, 0xCECECEFF, "Tempat tidur ini sibuk");

		else
		{
			SetPlayerData(playerid, P_OCCUPIED_BED, bedid);

			g_med_bed_used[bedid] = true;

			new fmt_msg[85];

			format(fmt_msg, sizeof fmt_msg, "Tempat tidur �%d\n\n{ffff00}Sabar:\n%s", bedid + 1, GetPlayerNameEx(playerid));
			UpdateDynamic3DTextLabelText(g_med_bed_label[bedid], 0xFFFFFFFF, fmt_msg);

			format(fmt_msg, sizeof fmt_msg, "Anda mengambil tempat tidur �%d. Tergantung pada kondisi kesehatan Anda, perawatan mungkin memakan waktu.", bedid + 1);
			SendClientMessage(playerid, 0x32a44bFF, fmt_msg);

			SendClientMessage(playerid, -1, "Untuk check out, pergi ke dokter atau pergi ke luar rumah sakit");
		}
		SetTimer("HospitalTreatment", (random(5) + 1) * 1000, false);
	}

	return 1;
}*/

CMD:out(playerid, params[])
{
	if(GetPlayerTeamEx(playerid) != TEAM_HOSPITAL) return SendClientMessage(playerid, 0xCECECEFF, "Anda bukan profesional medis");
	if(!IsPlayerInRangeOfPoint(playerid, 70.0, 1362.7057,-166.8792,967.5167)) return SendClientMessage(playerid, 0xCECECEFF, "Anda harus di rumah sakit");

	extract params -> new to_player; else return SendClientMessage(playerid, 0xCECECEFF, "Gunakan: /out [id pemain]");

	if(!IsPlayerConnected(to_player) || !IsPlayerLogged(to_player))
		return SendClientMessage(playerid, 0xCECECEFF, "Tidak ada pemain seperti itu");

	if(!IsPlayerInRangeOfPlayer(playerid, to_player, 6.0)) return SendClientMessage(playerid, 0xCECECEFF, "Pemainnya terlalu jauh");
//	if(GetPlayerData(to_player, P_OCCUPIED_BED) == -1) return SendClientMessage(playerid, 0xCECECEFF, "Pemain harus dalam perawatan");

	ClearMedBed(to_player, GetPlayerData(playerid, P_OCCUPIED_BED));
	SetPlayerData(to_player, P_HOSPITAL, false);

	SetPlayerChatBubble(to_player, "Habis", 0x32a44bFF, 10.0, 2000);

	new fmt_msg[60];
	format(fmt_msg, sizeof fmt_msg, "Pekerja medis %s mengeluarkanmu dari rumah sakit", GetPlayerNameEx(playerid));
	SendClientMessage(to_player, 0x1E90FFFF, fmt_msg);

	format(fmt_msg, sizeof fmt_msg, "Anda habis %s dari rumah sakit", GetPlayerNameEx(to_player));
	SendClientMessage(playerid, 0x1E90FFFF, fmt_msg);
	return 1;
}

CMD:heal(playerid, params[])
{
	if(GetPlayerTeamEx(playerid) != TEAM_HOSPITAL) return SendClientMessage(playerid, 0xCECECEFF, "Anda bukan profesional medis");
	if(!strlen(params)) return SendClientMessage(playerid, 0xCECECEFF, "Gunakan: /heal [id pemain] [harga untuk perawatan]");
	extract params -> new to_player, price;

	new vehicleid = GetPlayerVehicleID(playerid);

	if(!IsPlayerConnected(to_player) || !IsPlayerLogged(playerid)) return SendClientMessage(playerid, 0xCECECEFF, "Tidak ada pemain seperti itu");
	if(GetVehicleData(vehicleid, V_ACTION_TYPE) != VEHICLE_ACTION_TYPE_MED_CAR || GetPlayerVehicleID(to_player) != vehicleid) return SendClientMessage(playerid, 0xCECECEFF, "Anda atau pasien Anda tidak berada di ambulans");
	if(!(0 <= price <= 5000)) return SendClientMessage(playerid, 0xCECECEFF, "Biaya perawatan harus dari 0 hingga 5000$");
	if(GetPlayerMoneyEx(to_player) < price) return SendClientMessage(playerid, 0xCECECEFF, "Pasien tidak punya banyak uang dengannya");

	SendPlayerOffer(playerid, to_player, OFFER_TYPE_HEAL, price);
	return 1;
}

CMD:changesex(playerid, params[])
{
	if(GetPlayerTeamEx(playerid) != TEAM_HOSPITAL) return SendClientMessage(playerid, 0xCECECEFF, "Anda bukan profesional medis");

	if(!strlen(params)) return SendClientMessage(playerid, 0xCECECEFF, "Gunakan: /changesex [id pemain] [biaya transaksi]");
	extract params -> new to_player, price;

	if(!IsPlayerConnected(to_player) || !IsPlayerLogged(to_player) || to_player == playerid) return SendClientMessage(playerid, 0xCECECEFF, "Tidak ada pemain seperti itu");
	if(!IsPlayerInRangeOfPlayer(playerid, to_player, 6.0)) return SendClientMessage(playerid, 0xCECECEFF, "Pemainnya terlalu jauh");
	
	if(GetPlayerMoneyEx(to_player) < price) return SendClientMessage(playerid, 0xCECECEFF, "Pasien tidak punya banyak uang dengannya");

	SendPlayerOffer(playerid, to_player, OFFER_TYPE_CHANGE_SEX, price);
	return 1;
}

CMD:tie(playerid, params[])
{
	if(!(TEAM_GANG_GROVE <= GetPlayerTeamEx(playerid) <= TEAM_GANG_RIFA)) return SendClientMessage(playerid, 0xCECECEFF, "Anda bukan anggota geng");

	extract params -> new to_player; else return SendClientMessage(playerid, 0xCECECEFF, "Gunakan: /tie [id pemain]");

	if(!IsPlayerConnected(to_player) || !IsPlayerLogged(to_player) || to_player == playerid) return SendClientMessage(playerid, 0xCECECEFF, "Tidak ada pemain seperti itu");
	if(!IsPlayerInRangeOfPlayer(playerid, to_player, 6.0)) return SendClientMessage(playerid, 0xCECECEFF, "Pemainnya terlalu jauh");

	if(GetPlayerData(to_player, P_CUFFED)) return SendClientMessage(playerid, 0xCECECEFF, "Pemain sudah terikat/diborgol");

	SetPlayerSpecialAction(to_player, SPECIAL_ACTION_CUFFED);
	SetPlayerAttachedObject(to_player, A_OBJECT_SLOT_HAND, 19418, A_OBJECT_BONE_RIGHT_HAND, -0.011, 0.028, -0.022, -15.600012, -33.699977, -81.700035, 0.891999, 1.00, 1.168);
	SetPlayerData(to_player, P_CUFFED, 2);

	TogglePlayerControllable(to_player, false);

	new fmt_str[90];

	format(fmt_str, sizeof fmt_str, "%s terikat %s", GetPlayerNameEx(playerid), GetPlayerNameEx(to_player));
	SendMessageInLocal(playerid, fmt_str, 0xDD90FFFF, 25.0);

	return 1;
}

CMD:untie(playerid, params[])
{
	if(!(TEAM_GANG_GROVE <= GetPlayerTeamEx(playerid) <= TEAM_GANG_RIFA) && GetPlayerAdminEx(playerid) == 0)
		return SendClientMessage(playerid, 0xCECECEFF, "�� �� ���� �����");

	extract params -> new to_player; else return SendClientMessage(playerid, 0xCECECEFF, "Gunakan: /untie [id pemain]");

	if(!IsPlayerConnected(to_player) || !IsPlayerLogged(to_player)) return SendClientMessage(playerid, 0xCECECEFF, "Tidak ada pemain seperti itu");
	if(!IsPlayerInRangeOfPlayer(playerid, to_player, 6.0)) return SendClientMessage(playerid, 0xCECECEFF, "Pemainnya terlalu jauh");

	if(!GetPlayerData(to_player, P_CUFFED)) return SendClientMessage(playerid, 0xCECECEFF, "Pemain tidak terikat");

	if(GetPlayerData(to_player, P_FOLLOWED_BY) != INVALID_PLAYER_ID) return SendClientMessage(playerid, 0xCECECEFF, "Berhenti memimpin pemain di belakang Anda (/follow)");

	SetPlayerSpecialAction(to_player, SPECIAL_ACTION_NONE);
	RemovePlayerAttachedObject(to_player, A_OBJECT_SLOT_HAND);
	SetPlayerData(to_player, P_CUFFED, 0);

	TogglePlayerControllable(to_player, true);

	new fmt_str[90];

	format(fmt_str, sizeof fmt_str, "%s �������� %s", GetPlayerNameEx(playerid), GetPlayerNameEx(to_player));
	SendMessageInLocal(playerid, fmt_str, 0xDD90FFFF, 25.0);

	return 1;
}

CMD:unlocktire(playerid, params[])
{
 	if(!IsPlayerInPoliceTeam(playerid))
		return Error(playerid, "You are not SAPD");

	new closestcar = Vehicle_Nearest(playerid), S3MP4K[1401];

	if(!IsPlayerInRangeOfVehicle(playerid, 8.0)) return Error(playerid, "You must be near vehicle");

    if(pvData[closestcar][cLockTire] == 0) return Error(playerid, "This vehicle tire is not locked!");

	//SendClientMessage(i, COLOR_LOGS, "VEHICLEINFO: {ffffff}Your vehicle is being tire locked by {00FFFF}Authority.");
    format(S3MP4K, sizeof(S3MP4K), "TIREINFO: {ffffff}You have unlocked the tire lock This {ffffff}vehicle.");
    SendClientMessage(playerid, COLOR_LOGS, S3MP4K);
    pvData[closestcar][cLockTire] = 0;

	return 1;
}

CMD:impound(playerid, params[])
{
	if(GetPlayerTeamEx(playerid) == 5)
	{
	    if(IsPlayerInRangeOfPoint(playerid, 10.0, 2813.7676, -1472.8700, 16.2363))
	    {
	        if(IsTrailerAttachedToVehicle(GetPlayerVehicleID(playerid)))
         	{
         	    new iVehTowed = GetVehicleTrailer(GetPlayerVehicleID(playerid));
         	    foreach(new ii : PVehicles)
			    {
			        if(iVehTowed == pvData[ii][cVeh])
			        {
			            foreach(new pid : Player) if(pvData[ii][OC_OWNER_ID] == pData[pid][P_ACCOUNT_ID])
			            {
			                new modelid = GetVehicleModel(iVehTowed) - 400;
				            SendClientMessageEx(playerid, COLOR_ARWIN, "IMPOUND: "WHITE_E"You have succesfully impound %s %s", GetPlayerNameEx(pid), GetVehicleInfo(modelid, VI_NAME));
							SendClientMessageEx(pid, COLOR_ARWIN, "IMPOUND: "WHITE_E"Your %s have been impounded by authority", GetVehicleInfo(modelid, VI_NAME));
							for(new idx = 0; idx < 3; idx ++)
							{
							    DestroyDynamicObject(pvData[ii][pvToy][idx]);
							}
			         	    pvData[ii][cImpounded] = 1;
			         	    if(IsValidVehicle(pvData[ii][cVeh]))
				                DestroyVehicle(pvData[ii][cVeh]);

				            pvData[ii][cVeh] = 0;
						}
					}
				}
			}
			else SEM(playerid, " There is no towed vehicle");
		}
		else SEM(playerid, " You are not near impound point");
	}
	else SEM(playerid, "You are not SAPD");
	return 1;
}

CMD:locktire(playerid, params[])
{
 	if(!IsPlayerInPoliceTeam(playerid))
		return Error(playerid, "Anda bukan petugas penegak hukum");
		
	new closestcar = Vehicle_Nearest(playerid), S3MP4K[1401];
	
	if(!IsPlayerInRangeOfVehicle(playerid, 8.0)) return Error(playerid, "You must be near vehicle");

    if(pvData[closestcar][cLockTire] == 1) return Error(playerid, "This vehicle tire is already locked!");
				
	//SendClientMessage(i, COLOR_LOGS, "VEHICLEINFO: {ffffff}Your vehicle is being tire locked by {00FFFF}Authority.");
    format(S3MP4K, sizeof(S3MP4K), "TIREINFO: {ffffff}You have tire lock This {ffffff}vehicle.");
    SendClientMessage(playerid, COLOR_LOGS, S3MP4K);
    pvData[closestcar][cLockTire] = 1;

	return 1;
}

CMD:cuff(playerid, params[])
{
	if(!IsPlayerInPoliceTeam(playerid)) return SendClientMessage(playerid, 0xCECECEFF, "Anda bukan petugas penegak hukum");

	extract params -> new to_player; else return SendClientMessage(playerid, 0xCECECEFF, "Gunakan: /cuff [id pemain]");

	if(!IsPlayerConnected(to_player) || !IsPlayerLogged(to_player) || to_player == playerid) return SendClientMessage(playerid, 0xCECECEFF, "Tidak ada pemain seperti itu");
	if(!IsPlayerInRangeOfPlayer(playerid, to_player, 6.0)) return SendClientMessage(playerid, 0xCECECEFF, "Pemainnya terlalu jauh");

	if(GetPlayerData(to_player, P_CUFFED)) return SendClientMessage(playerid, 0xCECECEFF, "Pemain sudah diborgol");

	SetPlayerSpecialAction(to_player, SPECIAL_ACTION_CUFFED);
	SetPlayerAttachedObject(to_player, A_OBJECT_SLOT_HAND, 19418, A_OBJECT_BONE_RIGHT_HAND, -0.011, 0.028, -0.022, -15.600012, -33.699977, -81.700035, 0.891999, 1.00, 1.168);
	SetPlayerData(to_player, P_CUFFED, 1);

	TogglePlayerControllable(to_player, false);

	new fmt_str[90];

	format(fmt_str, sizeof fmt_str, "%s %s pakai %s borgol", GetPlayerJobAndRankName(playerid), GetPlayerNameEx(playerid), GetPlayerNameEx(to_player));
	SendMessageInLocal(playerid, fmt_str, 0xDD90FFFF, 25.0);

	return 1;
}

CMD:uncuff(playerid, params[])
{
	if(!IsPlayerInPoliceTeam(playerid)) return SendClientMessage(playerid, 0xCECECEFF, "Anda bukan petugas penegak hukum");

	extract params -> new to_player; else return SendClientMessage(playerid, 0xCECECEFF, "Gunakan: /uncuff [id pemain]");

	if(!IsPlayerConnected(to_player) || !IsPlayerLogged(to_player)) return SendClientMessage(playerid, 0xCECECEFF, "Tidak ada pemain seperti itu");
	if(!IsPlayerInRangeOfPlayer(playerid, to_player, 6.0)) return SendClientMessage(playerid, 0xCECECEFF, "Pemainnya terlalu jauh");

	if(!GetPlayerData(to_player, P_CUFFED)) return SendClientMessage(playerid, 0xCECECEFF, "Pemain tidak diborgol");

	if(GetPlayerData(to_player, P_FOLLOWED_BY) != INVALID_PLAYER_ID) return SendClientMessage(playerid, 0xCECECEFF, "Berhenti memimpin pemain di belakang Anda (/follow)");

	SetPlayerSpecialAction(to_player, SPECIAL_ACTION_NONE);
	RemovePlayerAttachedObject(to_player, A_OBJECT_SLOT_HAND);
	SetPlayerData(to_player, P_CUFFED, 0);

	TogglePlayerControllable(to_player, true);

	new fmt_str[90];

	format(fmt_str, sizeof fmt_str, "%s %s berangkat %s borgol", GetPlayerJobAndRankName(playerid), GetPlayerNameEx(playerid), GetPlayerNameEx(to_player));
	SendMessageInLocal(playerid, fmt_str, 0xDD90FFFF, 25.0);

	return 1;
}

CMD:putpl(playerid, params[])
{
	if(!IsPlayerInPoliceTeam(playerid) && !(TEAM_GANG_GROVE <= GetPlayerTeamEx(playerid) <= TEAM_GANG_RIFA))
		return SendClientMessage(playerid, 0xCECECEFF, "Perintah ini tidak tersedia untuk Anda");

	extract params -> new to_player; else return SendClientMessage(playerid, 0xCECECEFF, "Gunakan: /putpl [id pemain]");

	if(!IsPlayerConnected(to_player) || !IsPlayerLogged(to_player)) return SendClientMessage(playerid, 0xCECECEFF, "Tidak ada pemain seperti itu");
	if(!IsPlayerInRangeOfPlayer(playerid, to_player, 6.0)) return SendClientMessage(playerid, 0xCECECEFF, "Pemainnya terlalu jauh");

	if(!GetPlayerData(to_player, P_CUFFED)) return SendClientMessage(playerid, 0xCECECEFF, "Pemain Tidak Diikat/Diborgol");

	new vehicle_id = GetPlayerVehicleID(playerid);
	if(!vehicle_id) return SendClientMessage(playerid, 0xCECECEFF, "Anda harus berada di dalam mobil");

	if(IsPlayerInPoliceTeam(playerid) && !IsPlayerInPoliceCar(playerid))
		return SendClientMessage(playerid, 0xCECECEFF, "Anda harus berada dalam transportasi resmi");

	new bool: is_there_some_free_places;

	for(new i = 2; i < 3; i++)
	{
		if(IsVehicleSeatOccupied(vehicle_id, i)) continue;
		PutPlayerInVehicle(to_player, vehicle_id, i);
		is_there_some_free_places = true;
		break;
	}

	if(!is_there_some_free_places) return SendClientMessage(playerid, 0xCECECEFF, "Kursi belakang mobil Anda terisi");

	new fmt_str[90];

	if(IsPlayerInPoliceTeam(playerid))
		format(fmt_str, sizeof fmt_str, "%s %s ditanam %s ke dalam mobil", GetPlayerJobAndRankName(playerid), GetPlayerNameEx(playerid), GetPlayerNameEx(to_player));

	else
	    format(fmt_str, sizeof fmt_str, "%s ditanam %s ke dalam mobil", GetPlayerNameEx(playerid), GetPlayerNameEx(to_player));

	SendMessageInLocal(playerid, fmt_str, 0xDD90FFFF, 25.0);

	return 1;
}

CMD:putplayer(playerid, params[])
{

	extract params -> new to_player; else return SendClientMessage(playerid, 0xCECECEFF, "Gunakan: /putplayer [id pemain]");

	if(!IsPlayerConnected(to_player) || !IsPlayerLogged(to_player)) return SendClientMessage(playerid, 0xCECECEFF, "Tidak ada pemain seperti itu");
	if(!IsPlayerInRangeOfPlayer(playerid, to_player, 6.0)) return SendClientMessage(playerid, 0xCECECEFF, "Pemainnya terlalu jauh");

	if(GetPlayerData(to_player, P_INJURED) == 0) return Error(playerid, "Pemain Itu Tidak Sekarat");
	new vehicle_id = GetPlayerVehicleID(playerid);
	if(!vehicle_id) return SendClientMessage(playerid, 0xCECECEFF, "Anda harus berada di dalam mobil");


	new bool: is_there_some_free_places;

	for(new i = 2; i < 3; i++)
	{
		if(IsVehicleSeatOccupied(vehicle_id, i)) continue;
		ClearAnimations(to_player);
		PutPlayerInVehicle(to_player, vehicle_id, i);
		is_there_some_free_places = true;
		break;
	}

	if(!is_there_some_free_places) return SendClientMessage(playerid, 0xCECECEFF, "Kursi belakang mobil Anda terisi");

	new fmt_str[500];

	format(fmt_str, sizeof fmt_str, "Kamu memasukkan %s kedalam mobil", GetPlayerNameEx(to_player));
	SendClientMessage(playerid, COLOR_WHITE, fmt_str);

	return 1;
}

CMD:follow(playerid, params[])
{
	if(!IsPlayerInPoliceTeam(playerid)) return SendClientMessage(playerid, 0xCECECEFF, "Anda bukan petugas penegak hukum");

	extract params -> new to_player; else return SendClientMessage(playerid, 0xCECECEFF, "Gunakan: /follow [id pemain]");

	if(!IsPlayerConnected(to_player) || !IsPlayerLogged(to_player) || to_player == playerid)
		return SendClientMessage(playerid, 0xCECECEFF, "Pemain tidak ditemukan");

	if(!IsPlayerInRangeOfPlayer(playerid, to_player, 6.0))
		return SendClientMessage(playerid, 0xCECECEFF, "Pemainnya terlalu jauh");

	if(!GetPlayerData(to_player, P_CUFFED))
		return SendClientMessage(playerid, 0xCECECEFF, "Pemain yang diborgol");

	if(GetPlayerData(to_player, P_FOLLOWED_BY) == playerid)
		UnFollow(to_player);

	else
		Follow(to_player, playerid);

	return 1;
}

CMD:search(playerid, params[])
{
	if(!IsPlayerInPoliceTeam(playerid)) return SendClientMessage(playerid, 0xCECECEFF, "Anda bukan petugas penegak hukum");

	extract params -> new to_player; else return SendClientMessage(playerid, 0xCECECEFF, "Gunakan: /search [id pemain]");

	if(!IsPlayerConnected(to_player) || !IsPlayerLogged(to_player) || to_player == playerid) return SendClientMessage(playerid, 0xCECECEFF, "Tidak ada pemain seperti itu");
	if(!IsPlayerInRangeOfPlayer(playerid, to_player, 6.0)) return SendClientMessage(playerid, 0xCECECEFF, "Pemainnya terlalu jauh");

	new fmt_text[110],
		bool: some_is_found;

	format(fmt_text, sizeof fmt_text, "%s %s mencari %s", GetPlayerJobAndRankName(playerid), GetPlayerNameEx(playerid), GetPlayerNameEx(to_player));
	SendMessageInLocal(playerid, fmt_text, 0xDD90FFFF, 25.0);

	if(GetPlayerData(to_player, P_DRUGS))
	{
		format(fmt_text, sizeof fmt_text, "Di %s(%d) ditemukan %d gram obat",GetPlayerNameEx(to_player), to_player, GetPlayerData(to_player, P_DRUGS));
		SendClientMessage(playerid, 0xFFFF00FF, fmt_text);

		some_is_found = true;
	}
	if(GetPlayerData(to_player, P_AMMO))
	{
		format(fmt_text, sizeof fmt_text, "Di %s(%d) ditemukan %d kartrid",GetPlayerNameEx(to_player), to_player, GetPlayerData(to_player, P_AMMO));
		SendClientMessage(playerid, 0xFFFF00FF, fmt_text);

		some_is_found = true;
	}
	if(GetPlayerData(to_player, P_GANJA))
	{
		format(fmt_text, sizeof fmt_text, "Di %s(%d) ditemukan %d gram ganja",GetPlayerNameEx(to_player), to_player, GetPlayerData(to_player, P_GANJA));
		SendClientMessage(playerid, 0xFFFF00FF, fmt_text);

		some_is_found = true;
	}

	if(!some_is_found) SendClientMessage(playerid, 0xFFFF00FF, "Tidak ada yang ditemukan");

	return 1;
}

CMD:hgun(playerid, params[])
{
	if(GetPlayerAdminEx(playerid) < 5) return 1;
	extract params -> new to_player, weapon_id, weapon_ammo; else return SendClientMessage(playerid, 0xCECECEFF, "Gunakan: /givegun [id pemain] [id lengan] [jumlah putaran]");

	if(!IsPlayerConnected(to_player) || !IsPlayerLogged(to_player))
		return SendClientMessage(playerid, 0xCECECEFF, "Tidak ada pemain seperti itu");

	if(!(1 <= weapon_id <= 46) || (19 <= weapon_id <= 21)) return SendClientMessage(playerid, 0xCECECEFF, "ID senjata dari 1 hingga 46");
	if(!(1 <= weapon_ammo <= 1000)) return SendClientMessage(playerid, 0xCECECEFF, "Jumlah kartrid dari 1 hingga 1000");

	GivePlayerWeapon(to_player, weapon_id, weapon_ammo);

	new fmt_text[128];

	format(fmt_text, sizeof fmt_text, "%s %s[%d] memberimu %s dan %d patre.", admins_rank_name[GetPlayerAdminEx(playerid)], GetPlayerNameEx(playerid), playerid, GetWeaponName(weapon_id), weapon_ammo);
	SendClientMessage(to_player, -1, fmt_text);

	format(fmt_text, sizeof fmt_text, "Anda memberi pemain %s[%d] %s dan %d patre.", GetPlayerNameEx(to_player), to_player, GetWeaponName(weapon_id), weapon_ammo);
	SendClientMessage(playerid, -1, fmt_text);

	if(GetPlayerAdminEx(playerid) <= 5)
	{
		format(fmt_text, sizeof fmt_text, "[A] %s %s[%d] dikeluarkan %s[%d] %s [%d patre]", admins_rank_name[GetPlayerAdminEx(playerid)], GetPlayerNameEx(playerid), playerid, GetPlayerNameEx(to_player), to_player, GetWeaponName(weapon_id), weapon_ammo);
		SendMessageToAdmins(fmt_text, 0xCECECEFF);
	}

	format(fmt_text, sizeof fmt_text, "Dikeluarkan %s[acc:%d] %s[%d patre]", GetPlayerNameEx(to_player), GetPlayerAccountID(to_player), GetWeaponName(weapon_id), weapon_ammo);
	SendLog(playerid, LOG_TYPE_ADMIN_ACTION, fmt_text);

	return 1;
}

CMD:givegun(playerid, params[])
{
	new weapon = GetPlayerWeaponEx(playerid), ammo = GetPlayerAmmoEx(playerid);
	if(!weapon) return Error(playerid, "You must holding a weapon!");

	extract params -> new to_player; else return Info(playerid, "Use /givegun [playerid]");
	
	if(to_player == INVALID_PLAYER_ID || to_player == playerid || !IsPlayerInRangeOfPlayer(playerid, to_player, 3.0))
		return Error(playerid, "Invalid playerid!");

	GivePlayerWeaponEx(to_player, weapon, ammo);
	ResetWeapon(playerid, weapon);
	new fmt_str[1280];
	format(fmt_str, sizeof fmt_str, "GUN: {FFFFFF}%s memberimu %s dengan %d ammo", GetPlayerNameEx(playerid), GetWeaponName(weapon), ammo);
	SendClientMessage(to_player, COLOR_RED, fmt_str);
	format(fmt_str, sizeof fmt_str, "GUN: {FFFFFF}Kamu memberi %s kepada %s dengan %d ammo", GetWeaponName(weapon), GetPlayerNameEx(to_player), ammo);
	SendClientMessage(playerid, COLOR_RED, fmt_str);
	return 1;
}

CMD:sotot(playerid, params[])
{
	if(GetPlayerAdminEx(playerid) < 1) return Error(playerid, "You are not authorized to use this command");
	
	SetPlayerPos(playerid, -975.975708,1060.983032,1345.671875);
	SetPlayerInterior(playerid, 10);
	return 1;
}

CMD:give(playerid, params[])
{
	if(IsPlayerConnected(playerid))
	{
		new name[24], ammount, otherid;
        if(sscanf(params, "us[24]d", otherid, name, ammount))
		{
			Info(playerid, "/give [playerid] [name] [ammount]");
			Info(playerid, "Names: material, component, drugs, snack, water, cigarette");
			return 1;
		}
		if(otherid == INVALID_PLAYER_ID || otherid == playerid || !IsPlayerInRangeOfPlayer(playerid, otherid, 3.0))
			return Error(playerid, "Invalid playerid!");

		if(ammount < 0) return SendInfo(playerid, "{56A4E4}�{DB881A}| {FFFFFF} INFO", "Jumlah Minimal 0!");
		
	 	if(strcmp(name,"material",true) == 0)
		{
			if(pData[playerid][pMaterial] < ammount)
				return Error(playerid, "Item anda tidak cukup.");
				
			if(ammount < 0)
			    return Error(playerid, "Invalid Amount");

			if(ammount > 500)
				return Error(playerid, "Invalid ammount 1 - 500");

			pData[playerid][pMaterial] -= ammount;
			pData[otherid][pMaterial] += ammount;
			new fmt_str[1280];
			format(fmt_str, sizeof fmt_str, "Anda telah berhasil memberikan Material kepada %s sejumlah %d.", GetPlayerNameEx(otherid), ammount);
			Info(playerid, fmt_str);
			format(fmt_str, sizeof fmt_str, "%s telah berhasil memberikan Material kepada anda sejumlah %d.", GetPlayerNameEx(playerid), ammount);
			Info(otherid, fmt_str);
			ApplyAnimation(playerid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
			ApplyAnimation(otherid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
		}
		else if(strcmp(name,"component",true) == 0)
		{
			if(pData[playerid][pComponent] < ammount)
				return Error(playerid, "Item anda tidak cukup.");
				
            if(ammount < 0)
			    return Error(playerid, "Invalid Amount");

			if(ammount > 250)
				return Error(playerid, "Invalid ammount 1 - 500");

			new maxcomp = pData[otherid][pComponent] + ammount;

			if(maxcomp > 250)
				return Error(playerid, "That player already have maximum component!");

			pData[playerid][pComponent] -= ammount;
			pData[otherid][pComponent] += ammount;
			new fmt_str[1280];
			format(fmt_str, sizeof fmt_str, "Anda telah berhasil memberikan Component kepada %s sejumlah %d.", GetPlayerNameEx(otherid), ammount);
			Info(playerid, fmt_str);
			format(fmt_str, sizeof fmt_str, "%s telah berhasil memberikan Component kepada anda sejumlah %d.", GetPlayerNameEx(playerid), ammount);
			Info(otherid, fmt_str);
			ApplyAnimation(playerid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
			ApplyAnimation(otherid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
		}
		else if(strcmp(name,"drugs",true) == 0)
		{
			if(pData[playerid][P_GANJA] < ammount)
				return Error(playerid, "Item anda tidak cukup.");
				
            if(ammount < 0)
			    return Error(playerid, "Invalid Amount");

			if(ammount > 250)
				return Error(playerid, "Invalid ammount 1 - 500");

			pData[playerid][P_GANJA] -= ammount;
			pData[otherid][P_GANJA] += ammount;
			new fmt_str[1280];
			format(fmt_str, sizeof fmt_str, "Anda telah berhasil memberikan Drugs kepada %s sejumlah %d.", GetPlayerNameEx(otherid), ammount);
			Info(playerid, fmt_str);
			format(fmt_str, sizeof fmt_str, "%s telah berhasil memberikan Drugs kepada anda sejumlah %d.", GetPlayerNameEx(playerid), ammount);
			Info(otherid, fmt_str);
			ApplyAnimation(playerid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
			ApplyAnimation(otherid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
		}
		else if(strcmp(name,"snack",true) == 0)
		{
			if(pData[playerid][pSnack] < ammount)
				return Error(playerid, "Item anda tidak cukup.");
				
            if(ammount < 0)
			    return Error(playerid, "Invalid Amount");

			if(ammount > 250)
				return Error(playerid, "Invalid ammount 1 - 500");

			pData[playerid][pSnack] -= ammount;
			pData[otherid][pSnack] += ammount;
			new fmt_str[1280];
			format(fmt_str, sizeof fmt_str, "Anda telah berhasil memberikan Snack kepada %s sejumlah %d.", GetPlayerNameEx(otherid), ammount);
			Info(playerid, fmt_str);
			format(fmt_str, sizeof fmt_str, "%s telah berhasil memberikan Snack kepada anda sejumlah %d.", GetPlayerNameEx(playerid), ammount);
			Info(otherid, fmt_str);
			ApplyAnimation(playerid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
			ApplyAnimation(otherid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
		}
		else if(strcmp(name,"water",true) == 0)
		{
			if(pData[playerid][pWater] < ammount)
				return Error(playerid, "Item anda tidak cukup.");
				
            if(ammount < 0)
			    return Error(playerid, "Invalid Amount");

			if(ammount > 250)
				return Error(playerid, "Invalid ammount 1 - 500");

			pData[playerid][pWater] -= ammount;
			pData[otherid][pWater] += ammount;
			new fmt_str[1280];
			format(fmt_str, sizeof fmt_str, "Anda telah berhasil memberikan Mineral Water kepada %s sejumlah %d.", GetPlayerNameEx(otherid), ammount);
			Info(playerid, fmt_str);
			format(fmt_str, sizeof fmt_str, "%s telah berhasil memberikan Mineral Water kepada anda sejumlah %d.", GetPlayerNameEx(playerid), ammount);
			Info(otherid, fmt_str);
			ApplyAnimation(playerid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
			ApplyAnimation(otherid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
		}
		else if(strcmp(name,"cigarette",true) == 0)
		{
			if(pData[playerid][pCigar] < ammount)
				return Error(playerid, "Item anda tidak cukup.");
				
            if(ammount < 0)
			    return Error(playerid, "Invalid Amount");

			if(ammount > 250)
				return Error(playerid, "Invalid ammount 1 - 500");

			pData[playerid][pCigar] -= ammount;
			pData[otherid][pCigar] += ammount;
			new fmt_str[1280];
			format(fmt_str, sizeof fmt_str, "Anda telah berhasil memberikan Cigarette kepada %s sejumlah %d.", GetPlayerNameEx(otherid), ammount);
			Info(playerid, fmt_str);
			format(fmt_str, sizeof fmt_str, "%s telah berhasil memberikan Cigarette kepada anda sejumlah %d.", GetPlayerNameEx(playerid), ammount);
			Info(otherid, fmt_str);
			ApplyAnimation(playerid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
			ApplyAnimation(otherid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
		}
	}
	return 1;
}

CMD:findpacket(playerid, params[])
{
	if(GetPlayerJob(playerid) != JOB_SMUGGLER) return Error(playerid, "You must be smuggler");
	
	if(pData[playerid][pPacket] == 1) return Error(playerid, "You already take the packet");
	if(pCPPacket == playerid) return Error(playerid, "You are the taker!");
	
	if(packet == 0)
	{
		SendClientMessage(playerid, COLOR_LOGS, "GPS: {FFFFFF}There is no packet");
	}
	if(packet == 1 && taked == 0)
	{
		CheckpointPacket[playerid] = 1;
        new Float:X, Float:Y, Float:Z;
        GetDynamicObjectPos(objectpacket, X, Y, Z);
        SetPlayerRaceCheckpoint(playerid, 1, X, Y, Z, X, Y, Z, 5.0);
        SendClientMessage(playerid, COLOR_LOGS, "GPS: {FFFFFF}Target is "GREEN_E"Standing Still.");
	}
	if(packet == 2 && taked == 0)
	{
	    CheckpointPacket[playerid] = 1;
        new Float:X, Float:Y, Float:Z;
        GetDynamicObjectPos(objectpacket, X, Y, Z);
        SetPlayerRaceCheckpoint(playerid, 1, X, Y, Z, X, Y, Z, 5.0);
        SendClientMessage(playerid, COLOR_LOGS, "GPS: {FFFFFF}Target is "GREEN_E"Standing Still.");
	}
	if(taked == 1)
	{
	    new Float:X, Float:Y, Float:Z;
	    CheckpointPacket[playerid] = 1;
	    GetPlayerPos(pCPPacket, X, Y, Z);
	    SetPlayerRaceCheckpoint(playerid, 1, X, Y, Z, X, Y, Z, 5.0);
		SendClientMessage(playerid, COLOR_LOGS, "GPS: {FFFFFF}Target is "RED_E"Moving.");
	}
	/*if(taked == 1 && pCPPacket == INVALID_PLAYER_ID)
	{
	    new Float:X, Float:Y, Float:Z;
    	GetDynamicObjectPos(objectpacket, X, Y, Z);
    	SetPlayerRaceCheckpoint(playerid, 1, X, Y, Z, X, Y, Z, 5.0);
    	SendClientMessage(playerid, COLOR_LOGS, "GPS: {FFFFFF}Target is "RED_E"Moving.");
	}*/
	return 1;
}

CMD:takepacket(playerid, params[])
{
    if(GetPlayerJob(playerid) != JOB_SMUGGLER) return Error(playerid, "You must be smuggler");
    
    new Float:X, Float:Y, Float:Z;
    GetDynamicObjectPos(objectpacket, X, Y, Z);
    if(!IsPlayerInRangeOfPoint(playerid, 15.0, X, Y, Z)) return Error(playerid, "There are no packets near you");
    
    if(pData[playerid][pPacket] == 1) return Error(playerid, "You already take a packet");
    
    pData[playerid][pPacket]++;

	InfoTD_MSG(playerid, 8000, "Packet Taked!");
	CheckpointLast[playerid] = 1;
	SendClientMessage(playerid, COLOR_LOGS, "SMUGGLER: {FFFFFF}You have taked the packet go to the checkpoint");
	SetPlayerRaceCheckpoint(playerid, 1, 1568.997192, 30.751678, 24.164062, 1568.997192, 30.751678, 24.164062, 5.0);
	taked = 1;
	pCPPacket = playerid;
	DestroyDynamicObject(objectpacket);
	ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.1, 0, 0, 0, 0, 0, 1);
	return 1;
}

CMD:enablecp(playerid, params[])
{
    if(GetPlayerJob(playerid) != JOB_SMUGGLER) return Error(playerid, "You must be smuggler");
    if(pData[playerid][pPacket] == 0) return Error(playerid, "You must have a packet");
    
    DisablePlayerRaceCheckpoint(playerid);
	CheckpointLast[playerid] = 1;
	SetPlayerRaceCheckpoint(playerid, 1, 1568.997192, 30.751678, 24.164062, 1568.997192, 30.751678, 24.164062, 5.0);
 	SendClientMessage(playerid, COLOR_LOGS, "GPS: {FFFFFF}Checkpoint enabled");
	return 1;
}
    
CMD:droppacket(playerid, params[])
{
	if(pData[playerid][pPacket] == 1)
	{
	    taked = 0;
        DisablePlayerRaceCheckpoint(playerid);
        CheckpointLast[playerid] = 0;
        pData[playerid][pPacket]--;
        pCPPacket = INVALID_PLAYER_ID;
        new Float:X, Float:Y, Float:Z;
        GetPlayerPos(playerid, X, Y, Z);
        objectpacket = CreateDynamicObject(11745, X, Y, Z-1, 0.0, 0.0, 0.0, 0);
	}
	else Error(playerid, "You didnt have a packet");
	return 1;
}

CMD:frisk(playerid, params[])
{
    new otherid;
    if(sscanf(params, "u", otherid))
        return Info(playerid, "Use /frisk [playerid/PartOfName]");

    if(otherid == INVALID_PLAYER_ID || !IsPlayerInRangeOfPlayer(playerid, otherid, 6.0))
        return Error(playerid, "The specified player is disconnected or not near you.");

    if(otherid == playerid)
        return Error(playerid, "You cannot frisk yourself.");

    pData[otherid][pFriskOffer] = playerid;

    new fmt_text[1280];
    format(fmt_text, sizeof fmt_text, "%s has offered to frisk you (type \"/accept frisk or ignore\").", GetPlayerNameEx(playerid));

    Info(otherid, fmt_text);
    format(fmt_text, sizeof fmt_text, "You have offered to frisk %s.", GetPlayerNameEx(otherid));
    Info(playerid, fmt_text);
    return 1;
}

CMD:inspect(playerid, params[])
{
    new otherid;
    if(sscanf(params, "u", otherid))
        return Info(playerid, "Use /inspect [playerid/PartOfName]");

    if(otherid == INVALID_PLAYER_ID || !IsPlayerInRangeOfPlayer(playerid, otherid, 6.0))
        return Error(playerid, "The specified player is disconnected or not near you.");

    if(otherid == playerid)
        return Error(playerid, "You cannot frisk yourself.");

    pData[otherid][pInspectOffer] = playerid;

    new fmt_text[1280];
    format(fmt_text, sizeof fmt_text, "%s has offered to inspect you (type \"/accept inspect or ignore\").", GetPlayerNameEx(playerid));

    Info(otherid, fmt_text);
    format(fmt_text, sizeof fmt_text, "You have offered to inspect %s.", GetPlayerNameEx(otherid));
    Info(playerid, fmt_text);
    return 1;
}
