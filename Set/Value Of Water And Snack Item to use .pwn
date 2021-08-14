

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

// ------------------------------------------
new g_player[MAX_PLAYERS][E_PLAYER_STRUCT];

#define pData    g_player
#define PlayerInfo g_player
new
	g_player_default_values[E_PLAYER_STRUCT] =
{
	0,		// id akun
	0,		// referensi
	0,		// jenis kelamin pemain
	"",     // Nama admin
	"",		// kata sandi pemain
	"None",	// email pemain
	false, 	// apakah email diverifikasi
	0,		// kulit pemain
	0,      // Paspor
	0,		// uang pemain
	0,      // boombox pemain
	100,     // Lapar Pemain
	100,     // Haus Pemain
	100,     // Kencing Pemain
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
	false,  // lisensi trucker
	false,  // lisensi lumberjack
	-1,     // Exam car
	-1,
	0,
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
	0,
	0,
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
	0,     // component pemain
	0,      // delay trucker
	0,      // delay /acceptdeath
	0,      // delay sweeper
    0,     // Delay Nambang di LS
	0,      // Exit Job Delay
	0,      // buy pv model
	0,      // getjob
	0,      // walkie talkie
	0,      // wt freq
	0,      // tog pm player
	0,      // tot ooc player
	0,      // delay bus
	0,      // delay lumberjack
	0,      // chainsaw
	0,      // sidejob
	0.000,      // fare new x
	0.000,      // fare new y
	0.000,      // fare new z
	0.000,      // fare old x
	0.000,      // fare old y
	0.000,      // fare old z
	0,      // total fare
	0,      // fare
	0,      // fare timer
	0,          // delay pizza
	0,      // waktu paycheck
	0,      // ammo gun player
	0,      // ammo gun player
	0,      // track car
    INVALID_PLAYER_ID,      // frisk offer
    false,      // toys
    0,      // selected toys
    0,      // Materials
    0,      // activity time
    0,      // timer cgun
    0,      // modshop
	// -------------------------
	0,
	0,
	0.0,
	0.0,
	0.0,
	0.0,
	0.0,
	0.0,
	0.0,
	0.0,
	0.0,
	0,
	0,
	0.0,
	0.0,
	0.0,
	0.0,
	0.0,
	0.0,
	0.0,
	0.0,
	0.0,
	// -------------------------
	0,					// waktu login terakhir\keluar
	"",
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
	0.0,               // pemain armour
	150.0,             // limit speed[vehicle]
	0,
	// -------------------------
	TEMP_JOB_NONE,		// pekerjaan sementara
	TEMP_JOB_STATE_NONE,// tindakan apa yang harus dilakukan
	false,				// pemeriksaan animasi
	// ---------------------------------
	"",					// nama layanan
	0,					// tarif
	0,					// Gaji
	0,					// diunggah/ditunda (muatan/bijih)
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
	false,				// adalah binatang yang diunggah
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
	0,                  // helm
	0,					// tiket lotere
	0,					// penggunaan minuman
	REALTOR_TYPE_NONE,	// makelar
	INVALID_VEHICLE_ID,	// id kendaraan pribadi
	INVALID_VEHICLE_ID,	// id bagasi mobil bekas
	// -------------------------
	"255.255.255.255", 	// pemain ip
	"", 				// nama pemain
	"",                 // Adm Name
	"�", 				// nama istri/suami
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
	0,                  // pingsan
	0,
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
	0,                  // penjara admin
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
	0,                   // Alat Mancing
	0,         			// berapa kilogram ikan
	0,                  // umpan
	// ------------------------
	0,          		// Pengguna versi PC
	-1,                 // ID berhenti
	0,                  // Langkah perjalanan
	100,                // Kebutuhan: Kelaparan
	100,                // Kebutuhan: Haus
	// ------------------------
	403.7906,     			// posisi keluar 403.7906, -1799.5159, 7.8281, 317.1260
	-1799.5159,     			// posisi keluar
	7.8281,    			// posisi keluar
	317.1260,     			// posisi keluar
	0,    				// Wirth. keluar dari dunia
	0,          		// keluar interior
    0,                  // Waktu Bermain
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
	//----------------------- (( Penambahan INDOLIVE + ))
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

// Tagging system
enum a_tagging_data
{
    tag_text,
    tag_font,
    tag_fontsize,
    Float:tag_x,
    Float:tag_y,
    Float:tag_z,
    Float:tag_rx,
    Float:tag_ry,
    Float:tag_rz,
}

// Toy System
enum e_toy_data
{
    toy_model,
    toy_bone,
    Float:toy_x,
    Float:toy_y,
    Float:toy_z,
    Float:toy_rx,
    Float:toy_ry,
    Float:toy_rz,
    Float:toy_sx,
    Float:toy_sy,
    Float:toy_sz
}
new pToys[MAX_PLAYERS][6][e_toy_data];

enum e_auction_data
{
	Bidder[MAX_BIDDER],
	Prize[256],
}

//ENUM GYM
enum GYMObjectInfo
{
	Float:GYMOBJPos[6],
	Text3D:GYMOBJText,
	GYMOBJType,
	GYMOBJObject,
	GYMOBJUsed,
	GYMOBJCondition
};
new GYMInfo[MAX_GYMOBJECT][GYMObjectInfo];
new gymEdit[MAX_PLAYERS]; //1=object posisi
new gymEditID[MAX_PLAYERS];
new Float:gymObjectPos[MAX_PLAYERS][3];
new Float:gymObjectRot[MAX_PLAYERS][3];
new Iterator:GYM<MAX_GYMOBJECT>;

//Pickup Gun Drop Gun
enum DropGunData
{
    DropGunAmmount[2],
    Float:DropGunPosX,
    Float:DropGunPosY,
    Float:DropGunPosZ,
    DropGunVWorld,
    DropGunInterior,
};


stock SetPlayerAnimation(playerid, animid)
{
	if(0 <= animid <= sizeof anim_list-1)
	{
		if(!IsPlayerInAnyVehicle(playerid))
		{
			switch(animid+1)
			{
				case 1..4:
				{
					SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DANCE1 + animid);
				}
				default:
				{
					new type = USE_ANIM_TYPE_NONE - 1;
					if(GetAnimListData(animid, AL_LOOP))
					{
						SetPlayerData(playerid, P_USE_ANIM, true);
					}
					else
					{
						if(IsPlayerUseAnim(playerid))
						{
							SetPlayerData(playerid, P_USE_ANIM, false);
						}
						type = USE_ANIM_TYPE_NONE;
					}
					ApplyAnimationEx(playerid, GetAnimListData(animid, AL_LIB), GetAnimListData(animid, AL_NAME), GetAnimListData(animid, AL_DELTA), (GetAnimListData(animid, AL_LOOP) % 2), GetAnimListData(animid, AL_LOCK_X), GetAnimListData(animid, AL_LOCK_Y), GetAnimListData(animid, AL_FREEZE), GetAnimListData(animid, AL_TIME), 1, type);
				}
			}
		}
		return 1;
	}
	return 0;
}

stock ClearPlayerUseAnim(playerid)
{
	if(IsPlayerUseAnim(playerid))
	{
		SetPlayerData(playerid, P_USE_ANIM_TYPE, USE_ANIM_TYPE_NONE);

		SetPlayerData(playerid, P_USE_ANIM, false);

		ClearPlayerAnim(playerid);
	}
}


CMD:usecigar(playerid, params[])
{
	if(pData[playerid][pCigar] > 0)
	{
		
		SetPlayerSpecialAction(playerid,SPECIAL_ACTION_SMOKE_CIGGY);
		pData[playerid][pCigar]--;
		UpdatePlayerDatabaseInt(playerid, "cigar", pData[playerid][pCigar]);
		return 1;
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GREY, "You don't have any cigars");
		return 1;
	}
}
CMD:usesnack(playerid, params[])
{
	if(pData[playerid][pSnack] > 0)
	{
		new Float:Health;
		GetPlayerHealth(playerid, Health);
		SetPlayerHealthEx(playerid, Health+10);
		SetPlayerAnimation(playerid, 19-1);
		SendInfo(playerid, "{56A4E4}�{DB881A}| {FFFFFF} SNACK", "You have eat 1 snack");
		PlayAnimEx(playerid, "FOOD", "EAT_Burger", 3.0, 1, 0, 0, 0, 0, 1);
        AddPlayerData(playerid, P_LAPAR, +, 50);
		SetPlayerProgressBarValue(playerid, pData[playerid][BarLapar], GetPlayerData(playerid, P_LAPAR));
		pData[playerid][pSnack] --;
		UpdatePlayerDatabaseInt(playerid, "snack", pData[playerid][pSnack]);
		return 1;
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GREY, "You don't have any Snack");
		return 1;
	}
}
CMD:usewater(playerid, params[])
{
	if(pData[playerid][pWater] > 0)
	{
        SetPlayerAnimation(playerid, 27-1);
	    new Float:Health;
		GetPlayerHealth(playerid, Health);
		SendInfo(playerid, "{56A4E4}�{DB881A}| {FFFFFF} DRINK", "You have drinking 1 mineral water");
		SetPlayerHealthEx(playerid, Health+15);
	    AddPlayerData(playerid, P_HAUS, +, 40);
		SetPlayerProgressBarValue(playerid, pData[playerid][BarLapar], GetPlayerData(playerid, P_LAPAR));
		pData[playerid][pWater] --;
		UpdatePlayerDatabaseInt(playerid, "air_botol", pData[playerid][pWater]);
		return 1;
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GREY, "You don't have any Mineral Water");
		return 1;
	}
}
