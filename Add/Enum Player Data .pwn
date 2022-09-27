
// ------------------------------------------
enum E_PLAYER_STRUCT // struktur pemain
{
	P_ACCOUNT_ID, 	// id akun
	float:P_BTC, // jumlah asset BTC
	P_REFER,		// referensi
	P_SEX,			// jenis kelamin pemain
	P_PASSWORD[64], // kata sandi pemain
	P_EMAIL[60 + 1],// email pemain
	bool: P_CONFIRM_EMAIL,// apakah email diverifikasi
	P_SKIN,			// kulit pemain
	P_PASS,         // Paspor
	P_MONEY,		// uang pemain
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
	P_EXAM_CAR,
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
	// -------------------------
	P_LAST_LOGIN_TIME,	// waktu login terakhir\keluar
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
	P_LOTTERY,			// tiket lotere
	P_DRINK_STEP,		// penggunaan minuman
	P_REALTOR_TYPE,		// makelar
	P_OWNABLE_CAR,		// id kendaraan pribadi
	P_USE_TRUNK,		// id bagasi mobil bekas
	// -------------------------
	P_IP[16], 			// pemain ip
	P_NAME[20 + 1], 	// nama pemain
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
	P_FISH_MAS,         // berapa kilogram ikan
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
	//----------------------- (( Penambahan Lesson Roleplay + ))
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
	P_RENT_KENDARAAN,
	P_RENT_LSPD,
	P_RENT_KAPAL,
	P_RENT_MOTOR,
	P_RENT_TRUK,
	P_RENT_FBI,
	P_RENT_LVPD,
	//--------------------- (( SYSTEM ))
	P_PASWORD_CRACK,
	P_TAS_ROB,
	P_KUNCI_INGGRIS,
	P_KUNCI_SETANG,
	P_CAT_SEMPROT,
	P_ADMIN_DUTY,
	P_BELI_JAM,
	P_DELAY_HACK,
	P_JOB_BALON,
	P_HAND_PHONE,
	P_KOUTA,
	P_MBAKING,
	P_DEEPWEB,
	P_FB,
	P_TWITTER,
	P_KOLAM,
	P_ALAT_PENEBANG,
	P_AMBIL_AYAM,
	P_POTONG_AYAM,
	P_BUNGKUS_AYAM,
};
