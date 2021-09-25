
new
	bool:Player_Fire_Enabled[MAX_PLAYERS],
	Player_Key_Sprint_Time[MAX_PLAYERS];
// Countdown
new Count = -1;
new countTimer;
new showCD[MAX_PLAYERS];
new CountText[5][5] =
{
	"~r~1",
	"~g~2",
	"~y~3",
	"~g~4",
	"~b~5"
};

// Server Uptime
new up_days,
	up_hours,
	up_minutes,
	up_seconds,
	WorldTime = 10,
	WorldWeather = 24;

//DMVCar
new DMVPlate1;
new DMVPlate2;
new DMVPlate3;
new DMVPlate4;
new DMVPlate5;
new DMVCar[6];
new LicenseTest[MAX_PLAYERS];
new CPD[MAX_PLAYERS];

//Model Selection 
new SpawnMale = mS_INVALID_LISTID,
	SpawnFemale = mS_INVALID_LISTID,
	MaleSkins = mS_INVALID_LISTID,
	FemaleSkins = mS_INVALID_LISTID,
	VIPMaleSkins = mS_INVALID_LISTID,
	VIPFemaleSkins = mS_INVALID_LISTID,
	SAPDMale = mS_INVALID_LISTID,
	SAPDFemale = mS_INVALID_LISTID,
	SAPDWar = mS_INVALID_LISTID,
	SAGSMale = mS_INVALID_LISTID,
	SAGSFemale = mS_INVALID_LISTID,
	SAMDMale = mS_INVALID_LISTID,
	SAMDFemale = mS_INVALID_LISTID,
	SANEWMale = mS_INVALID_LISTID,
	SANEWFemale = mS_INVALID_LISTID,
	toyslist = mS_INVALID_LISTID,
	rentjoblist = mS_INVALID_LISTID,
	sportcar = mS_INVALID_LISTID,
	boatlist = mS_INVALID_LISTID,
	viptoyslist = mS_INVALID_LISTID,
	vtoylist = mS_INVALID_LISTID;


// Faction Vehicle
#define VEHICLE_RESPAWN 7200

new SAPDVehicles[30],
	SAGSVehicles[30],
	SAMDVehicles[30],
	SANAVehicles[30];

//flash for pd
#define flashtime 115
new Flash[MAX_VEHICLES];
new FlashTime[MAX_VEHICLES];



//HAULING TRAILER
new bool:DialogHauling[10];
new TrailerHauling[MAX_PLAYERS];
new SedangHauling[MAX_PLAYERS];
new bool:DialogSweeper[3];
new bool:DialogBus[3];
new bool:DialogSaya[MAX_PLAYERS][10];

new KerjaSweeper[MAX_PLAYERS];
new SweeperSteps[MAX_PLAYERS][4];
//Sidejob Bus - ARIWIWIN14
new KerjaBus[MAX_PLAYERS];
new BusSteps[MAX_PLAYERS][4];

#define SWEEPERJOB 5558
#define BUSJOB 5559

new BUS[3], BusPlate[3];
new SWEEPER[3], SWEEPERPlate[3];


//anti spam veh
new VehicleLastEnterTime[MAX_PLAYERS],
    Warning[MAX_PLAYERS];
//anti aimbot
new AimbotWarnings[MAX_PLAYERS];
// Player data
enum E_PLAYERS
{
	pID,
	pName[MAX_PLAYER_NAME],
	pAdminname[MAX_PLAYER_NAME],
	pIP[16],
	pPassword[65],
	pSalt[17],
	pEmail[40],
	pAdmin,
	pHelper,
	pLevel,
	pLevelUp,
	pVip,
	pVipTime,
	pGold,
	pRegDate[50],
	pLastLogin[50],
	pMoney,
	pBankMoney,
	pBankRek,
	//phone
	pContact,
	pPhone,
	pPhoneOff,
	pPhoneCredit,
	pPhoneBook,
	pSMS,
	pCall,
	pCallTime,
	//--
	pWT,
	pHours,
	pMinutes,
	pSeconds,
	pPaycheck,
	pSkin,
	pFacSkin,
	pGender,
	pAge[50],
	pInDoor,
	pInHouse,
	pInBiz,
	Float: pPosX,
	Float: pPosY,
	Float: pPosZ,
	Float: pPosA,
	pInt,
	pWorld,
	Float:pHealth,
    Float:pArmour,
	pHunger,
	pBladder,
	pEnergy,
	pHungerTime,
	pEnergyTime,
	pBladderTime,
	pSick,
	pSickTime,
	pHospital,
	pHospitalTime,
	pInjured,
	pOnDuty,
	pOnDutyTime,
	pFaction,
	pFactionRank,
	pFactionLead,
	pTazer,
	pBroadcast,
	pNewsGuest,
	pFarm,
	pFarmRank,
	pFamily,
	pFamilyRank,
	pJail,
	pJailTime,
	pArrest,
	pArrestTime,
	pWarn,
	pJob,
	pJob2,
	pExitJob,
	pMineTime,
	pBusTime,
	pSweepTime,
	pLumTime,
	pTruckTime,
	pProdTime,
	pMedicine,
	pMedkit,
	pMask,
	pFightStyle,
	pGymVip,
	pFitnessTimer,
	pFitnessType,
	pHelmet,
	pSnack,
	pSprunk,
	pGas,
	pBandage,
	pGPS,
	pMaterial,
	pComponent,
	pFood,
	pSeed,
	pPotato,
	pWheat,
	pOrange,
	pPrice1,
	pPrice2,
	pPrice3,
	pPrice4,
	pMarijuana,
	pPlant,
	pPlantTime,
	pFishTool,
	pWorm,
	pFish,
	pInFish,
	pIDCard,
	pIDCardTime,
	pSkck,
	pSkckTime,
	pPenebangs,
	pPenebangsTime,
	pBpjs,
	pBpjsTime,
	pSpack,
	pDriveLic,
	pDriveLicTime,
	pBoatLic,
	pBoatLicTime,
	pFlyLic,
	pFlyLicTime,
	pGuns[13],
    pAmmo[13],
	pWeapon,
	pBoombox,
	//Not Save
	Cache:Cache_ID,
	bool: IsLoggedIn,
	LoginAttempts,
	LoginTimer,
	pSpawned,
	pAdminDuty,
	pFreezeTimer,
	pFreeze,
	pMaskID,
	pMaskOn,
	pSPY,
	pTname[MAX_PLAYER_NAME],
	pTweet,
	pTogTweet,
	pTogPM,
	pTogLog,
	pTogAds,
	pTogWT,
	pUsingWT,
	Text3D:pAdoTag,
	bool:pAdoActive,
	pFlare,
	bool:pFlareActive,
	pTrackCar,
	pBuyPvModel,
	pTrackHouse,
	pTrackBisnis,
	pFacInvite,
	pFacOffer,
	pFamInvite,
	pFamOffer,
	pFarmInvite,
	pFarmOffer,
	pFindEms,
	pCuffed,
	toySelected,
	TEditStatus,
	bool:PurchasedToy,
	pEditingItem,
	pProductModify,
	pCurrSeconds,
	pCurrMinutes,
	pCurrHours,
	pSpec,
	playerSpectated,
	pInspectOffer,
	Float:pBodyCondition[6],
	pFriskOffer,
	pDragged,
	pDraggedBy,
	pDragTimer,
	pHBEMode,
	pTDMode,
	pHelmetOn,
	pSeatBelt,
	pReportTime,
	pAskTime,
	//Player Progress Bar
	PlayerBar:fuelbar,
	PlayerBar:damagebar,
	PlayerBar:hungrybar,
	PlayerBar:energybar,
	PlayerBar:BarHp,
	PlayerBar:BarArmour,
	PlayerBar:bladdybar,
	PlayerBar:spfuelbar,
	PlayerBar:spdamagebar,
	PlayerBar:sphungrybar,
	PlayerBar:spenergybar,
	PlayerBar:spbladdybar,
	PlayerBar:activitybar,
	pProducting,
	pCooking,
	pArmsDealer,
	pMechanic,
	pActivity,
	pActivityTime,
	//Jobs Time
	pLumberTime,
	pMinerTime,
	pProductionTime,
	pTruckerTime,
	pSmugglerTime,
	//Jobs
	pSideJob,
	pSideJobTime,
	pGetJob,
	pGetJob2,
	pTaxiDuty,
	pTaxiTime,
	pFare,
	pFareTimer,
	pTotalFare,
	Float:pFareOldX,
	Float:pFareOldY,
	Float:pFareOldZ,
	Float:pFareNewX,
	Float:pFareNewY,
	Float:pFareNewZ,
	pMechDuty,
	pMechVeh,
	pMechColor1,
	pMechColor2,
	//ATM
	EditingATMID,
	//Limit Speed
	Float:pLimitSpeed,
	LimitSpeedTimer,
	pLsVehicle,
	//lumber job
	EditingTreeID,
	CuttingTreeID,
	bool:CarryingLumber,
	//Miner job
	EditingOreID,
	MiningOreID,
	CarryingLog,
	LoadingPoint,
	//production
	CarryProduct,
	//trucker
	pMission,
	pHauling,
	//Farmer
	pHarvest,
	pHarvestID,
	pOffer,
	//Bank
	pTransfer,
	pTransferRek,
	pTransferName[128],
	//Gas Station
	pFill,
	pFillTime,
	pFillPrice,
	//Gate
	gEditID,
	gEdit,
	//Workshop
	pWsEmplooye,
	pWsVeh,
	pWorkshop,
	//auto rp
	pSavedRp[70],
	//Skill
	pTruckSkill,
	pMechSkill,
	pSmuggSkill,
	//Vehicle Toys
	EditStatus,
	VehicleID,
	//
};
new pData[MAX_PLAYERS][E_PLAYERS];

// MySQL connection handle
new MySQL: g_SQL;
new g_MysqlRaceCheck[MAX_PLAYERS];

//DIALOG
enum
{
	//workshop
	DIALOG_MY_WORKSHOP,
	WORKSHOP_INFO,
	//tes
	DIALOG_NGENTOD,
	//---[ DIALOG PUBLIC ]---
	DIALOG_UNUSED,
    DIALOG_LOGIN,
    DIALOG_REGISTER,
    DIALOG_AGE,
	DIALOG_GENDER,
	DIALOG_EMAIL,
	DIALOG_PASSWORD,
	DIALOG_STATS,
	DIALOG_SETTINGS,
	DIALOG_HBEMODE,
	DIALOG_TDMODE,
	DIALOG_CHANGEAGE,
	//-----------------------
	DIALOG_GOLDSHOP,
	DIALOG_GOLDNAME,
	//---[ DIALOG BISNIS ]---
	DIALOG_SELL_BISNISS,
	DIALOG_SELL_BISNIS,
	DIALOG_MY_BISNIS,
	BISNIS_MENU,
	BISNIS_INFO,
	BISNIS_NAME,
	BISNIS_VAULT,
	BISNIS_WITHDRAW,
	BISNIS_DEPOSIT,
	BISNIS_BUYPROD,
	BISNIS_EDITPROD,
	BISNIS_PRICESET,
	BISNIS_SONG,
	BISNIS_PH,
	//--[Dialog Graffity]--
	DIALOG_WELCOME,
	DIALOG_SELECT,
	DIALOG_INPUTGRAFF,
	DIALOG_COLOR,
	DIALOG_HAPPY,
	DIALOG_LIST,
	BUY_SPRAYCAN,
	DIALOG_GOMENU,
	DIALOG_GDOBJECT,
	//---[ DIALOG HOUSE ]---
	DIALOG_SELL_HOUSES,
	DIALOG_SELL_HOUSE,
	DIALOG_MY_HOUSES,
	HOUSE_INFO,
	HOUSE_STORAGE,
	HOUSE_WEAPONS,
	HOUSE_MONEY,
	HOUSE_WITHDRAWMONEY,
	HOUSE_DEPOSITMONEY,
	//---[ DIALOG PRIVATE VEHICLE ]---
	DIALOG_FINDVEH,
	DIALOG_TRACKVEH,
	DIALOG_GOTOVEH,
	DIALOG_GETVEH,
	DIALOG_DELETEVEH,
	DIALOG_BUYPV,
	DIALOG_BUYVIPPV,
	DIALOG_BUYPLATE,
	DIALOG_BUYPVCP,
	DIALOG_BUYPVCP_BIKES,
	DIALOG_BUYPVCP_CARS,
	DIALOG_BUYPVCP_UCARS,
	DIALOG_BUYPVCP_JOBCARS,
	DIALOG_BUYPVCP_VIPCARS,
	DIALOG_BUYPVCP_CONFIRM,
	DIALOG_BUYPVS_CONFIRM,
	DIALOG_BUYBOAT_CONFIRM,
	DIALOG_BUYPVCP_VIPCONFIRM,
	DIALOG_RENT_JOBCARS,
	DIALOG_RENT_JOBCARSCONFIRM,
	//job
	LIST_JOB,
	//---[ DIALOG TOYS ]---
	//Vehicle Toys
	DIALOG_VTOY,
	DIALOG_VTOYBUY,
	DIALOG_VTOYEDIT,
	DIALOG_VTOYPOSX,
	DIALOG_VTOYPOSY,
	DIALOG_VTOYPOSZ,
	DIALOG_VTOYPOSRX,
	DIALOG_VTOYPOSRY,
	DIALOG_VTOYPOSRZ,
	VSELECT_POS,
	VTOYSET_VALUE,
	VTOYSET_COLOUR,
	VTOY_ACCEPT,
	//Player Toys
	DIALOG_TOY,
	DIALOG_TOYEDIT,
	DIALOG_TOYPOSISI,
	DIALOG_TOYPOSISIBUY,
	DIALOG_TOYBUY,
	DIALOG_TOYVIP,
	DIALOG_TOYPOSX,
	DIALOG_TOYPOSY,
	DIALOG_TOYPOSZ,
	DIALOG_TOYPOSRX,
	DIALOG_TOYPOSRY,
	DIALOG_TOYPOSRZ,
 	DIALOG_SCALEX,
 	DIALOG_SCALEY,
  	DIALOG_SCALEZ,
  	TSELECT_POS,
  	TOYSET_VALUE,
  	//butcher
  	D_WORK,
    D_WORK_INFO,
	//---[ DIALOG PLAYER ]---
	DIALOG_HELP,
	DIALOG_GPS,
	DIALOG_GPS_FACTION,
	DIALOG_GPS_PROPERTY,
	DIALOG_GPS_PUBLIC,
	DIALOG_GPS_DEALERSHIP,
	DIALOG_GPS_JOB,
	DIALOG_PAY,
	//---[ DIALOG WEAPONS ]---
	DIALOG_EDITBONE,
	//---[ DIALOG FAMILY ]---
	FAMILY_SAFE,
	FAMILY_STORAGE,
	FAMILY_WEAPONS,
	FAMILY_MARIJUANA,
	FAMILY_WITHDRAWMARIJUANA,
	FAMILY_DEPOSITMARIJUANA,
	FAMILY_COMPONENT,
	FAMILY_WITHDRAWCOMPONENT,
	FAMILY_DEPOSITCOMPONENT,
	FAMILY_MATERIAL,
	FAMILY_WITHDRAWMATERIAL,
	FAMILY_DEPOSITMATERIAL,
	FAMILY_MONEY,
	FAMILY_WITHDRAWMONEY,
	FAMILY_DEPOSITMONEY,
	FAMILY_INFO,
	//---[ DIALOG OWN FARM ]---
	FARM_STORAGE,
	FARM_INFO,
	FARM_POTATO,
	FARM_WHEAT,
	FARM_ORANGE,
	FARM_MONEY,
	FARM_DEPOSITPOTATO,
	FARM_WITHDRAWPOTATO,
	FARM_DEPOSITWHEAT,
	FARM_WITHDRAWWHEAT,
	FARM_DEPOSITORANGE,
	FARM_WITHDRAWORANGE,
	FARM_DEPOSITMONEY,
	FARM_WITHDRAWMONEY,
	//---[ DIALOG FACTION ]---
	DIALOG_LOCKERSAPD,
	DIALOG_WEAPONSAPD,
	DIALOG_LOCKERSAGS,
	DIALOG_WEAPONSAGS,
	DIALOG_LOCKERSAMD,
	DIALOG_WEAPONSAMD,
	DIALOG_LOCKERSANEW,
	DIALOG_WEAPONSANEW,
	
	DIALOG_LOCKERVIP,
	//---[ DIALOG JOB ]---
	//MECH
	DIALOG_SERVICE,
	DIALOG_SERVICE_COLOR,
	DIALOG_SERVICE_COLOR2,
	DIALOG_SERVICE_PAINTJOB,
	DIALOG_SERVICE_WHEELS,
	DIALOG_SERVICE_SPOILER,
	DIALOG_SERVICE_HOODS,
	DIALOG_SERVICE_VENTS,
	DIALOG_SERVICE_LIGHTS,
	DIALOG_SERVICE_EXHAUSTS,
	DIALOG_SERVICE_FRONT_BUMPERS,
	DIALOG_SERVICE_REAR_BUMPERS,
	DIALOG_SERVICE_ROOFS,
	DIALOG_SERVICE_SIDE_SKIRTS,
	DIALOG_SERVICE_BULLBARS,
	DIALOG_SERVICE_NEON,
	//Trucker
	DIALOG_HAULING,
	DIALOG_RESTOCK,
	
	//ARMS Dealer
	DIALOG_ARMS_GUN,
	
	//Farmer job
	DIALOG_PLANT,
	DIALOG_EDIT_PRICE,
	DIALOG_EDIT_PRICE1,
	DIALOG_EDIT_PRICE2,
	DIALOG_EDIT_PRICE3,
	DIALOG_EDIT_PRICE4,
	DIALOG_OFFER,
	//----[ Items ]-----
	DIALOG_MATERIAL,
	DIALOG_COMPONENT,
	DIALOG_DRUGS,
	DIALOG_FOOD,
	DIALOG_FOOD_BUY,
	DIALOG_SEED_BUY,
	DIALOG_PRODUCT,
	DIALOG_GASOIL,
	DIALOG_APOTEK,
	//Bank
	DIALOG_ATM,
	DIALOG_ATMWITHDRAW,
	DIALOG_BANK,
	DIALOG_BANKDEPOSIT,
	DIALOG_BANKWITHDRAW,
	DIALOG_BANKREKENING,
	DIALOG_BANKTRANSFER,
	DIALOG_BANKCONFIRM,
	DIALOG_BANKSUKSES,
	//ask
	DIALOG_ASKS,
	
	//reports
	DIALOG_REPORTS,
	DIALOG_SALARY,
	DIALOG_PAYCHECK,
	
	//Sidejob
	DIALOG_TRASH,
	
	DIALOG_FORKLIFT,
	//hauling tr
	//DIALOG_CHAULINGTR,
	//DIALOG_BUYTRUCK_CONFIRM,
	DIALOG_HAULINGTR,
	
	DIALOG_PB,
	
	//gym
	DIALOG_FSTYLE,
	DIALOG_GMENU,
	//mods
	DIALOG_MMENU,
	//box
	DIALOG_TDC,
	DIALOG_TDC_PLACE,
	
	//event
	DIALOG_TDM,
	
	//veh control
	DIALOG_VC,
	//startjob
	DIALOG_WORK,
	//Phone
	DIALOG_ENTERNUM,
	NEW_CONTACT,
	CONTACT_INFO,
	CONTACT,
	DIAL_NUMBER,
	TEXT_MESSAGE,
	SEND_TEXT,
	SHARE_LOC,
	MY_PHONE,
	TWEET_APP,
	WHATSAPP_APP,
	TWEET_SIGNUP,
	TWEET_CHANGENAME,
	TWEET_ACCEPT_CHANGENAME,
	DIALOG_TWEETMODE,
	PHONE_NOTIF,
	PHONE_APP,
	//trunk
	TRUNK_STORAGE,
	TRUNK_WEAPONS,
	TRUNK_MONEY,
	TRUNK_COMP,
	TRUNK_MATS,
	TRUNK_WITHDRAWMONEY,
	TRUNK_DEPOSITMONEY,
	TRUNK_WITHDRAWCOMP,
	TRUNK_DEPOSITCOMP,
	TRUNK_WITHDRAWMATS,
	TRUNK_DEPOSITMATS,
	//mech
	DIALOG_MECH_LEVEL,
	
	//MDC
	DIALOG_TRACK,
	DIALOG_TRACK_PH,
	
	DIALOG_INFO_BIS,
	DIALOG_INFO_HOUSE,
	
	//bb
	DIALOG_BOOMBOX,
	DIALOG_BOOMBOX1,
}
//users
new File[ 128 ];

enum Rendi
{
	pCharacterStory,
	pSweeperT,
	pBusTime,
	LoggedIn
}
new PlayerInfo[MAX_PLAYERS][Rendi];

forward SaveUser(playerid);
public SaveUser(playerid)
{
	format(File, sizeof(File), "user/%s.ini", GetName(playerid));
	if( dini_Exists( File ) )
	{
		dini_Set(File, "CharacterStory", PlayerInfo[playerid][pCharacterStory]);
		dini_IntSet(File, "SweeperTime", PlayerInfo[playerid][pSweeperT]);
		dini_IntSet(File, "BusTime", PlayerInfo[playerid][pBusTime]);
	}
}


//======== Bus ===========
#define buspoint1 1671.5015,-1477.9338,13.4804
#define buspoint2 1655.4309,-1578.8663,13.4876
#define buspoint3 1675.6584,-1594.5546,13.4830
#define buspoint4 1808.3151,-1614.4534,13.4606
#define buspoint5 1822.1866,-1602.4225,13.4650
#define buspoint6 1852.0515,-1477.0760,13.4892
#define buspoint7 1976.1843,-1468.7709,13.4898
#define buspoint8 1988.9058,-1453.9619,13.4881
#define buspoint9 1989.5841,-1354.7592,23.8970
#define buspoint10 2055.3843,-1343.6346,23.9209
#define buspoint11 2073.3601,-1237.0232,23.9111
#define buspoint12 2074.4985,-1106.5936,24.7291
#define buspoint13 1995.6899,-1054.9963,24.5139
#define buspoint14 1867.9518,-1058.5884,23.7857
#define buspoint15 1863.6049,-1169.5271,23.7625
#define buspoint16 1657.9583,-1157.8536,23.8513
#define buspoint17 1592.6194,-1159.1958,24.0051
#define buspoint18 1549.6796,-1055.4402,23.7095
#define buspoint19 1458.6635,-1030.3673,23.7568
#define buspoint20 1383.3145,-1032.3024,26.1900
#define buspoint21 1355.6470,-1045.0482,26.4642
#define buspoint22 1340.4150,-1127.6436,23.7744
#define buspoint23 1340.1676,-1379.0829,13.5948
#define buspoint24 1363.4252,-1405.9730,13.4503
#define buspoint25 1393.6683,-1430.9860,13.5163
#define buspoint26 1640.2510,-1443.0830,13.4826
#define buspoint27 1654.4456,-1539.0234,13.4815


IsBUSCAR(carid)
{
	for(new v = 0; v < sizeof(BUS); v++)
	{
		if(carid == BUS[v]) return 1;
	}
	return 0;
}
IsSWEEPERCar(carid)
{
	for(new v = 0; v < sizeof(SWEEPER); v++)
	{
		if(carid == SWEEPER[v]) return 1;
	}
	return 0;
}

new BusVeh[3];

AddBusVehicle()
{
	BusVeh[0] = AddStaticVehicleEx(431, 1704.6984, -1524.3541, 13.3736, 0.0000, -1, -1, VEHICLE_RESPAWN);
	BusVeh[1] = AddStaticVehicleEx(431, 1705.1564, -1488.2904, 13.3736, 0.0000, -1, -1, VEHICLE_RESPAWN);
	BusVeh[2] = AddStaticVehicleEx(431, 1705.3203, -1505.8333, 13.3736, 0.0000, -1, -1, VEHICLE_RESPAWN);
	//BusVeh[3] = AddStaticVehicleEx(431, 1705.1434, -1543.4546, 13.3736, 0.0000, -1, -1, VEHICLE_RESPAWN);
}

IsABusVeh(carid)
{
	for(new v = 0; v < sizeof(BusVeh); v++) {
	    if(carid == BusVeh[v]) return 1;
	}
	return 0;
}


public OnGameModeInit()
{
	//mysql_log(ALL);

	new MySQLOpt: option_id = mysql_init_options();

	mysql_set_option(option_id, AUTO_RECONNECT, true);

	g_SQL = mysql_connect(MYSQL_HOST, MYSQL_USER, MYSQL_PASSWORD, MYSQL_DATABASE, option_id);
	if (g_SQL == MYSQL_INVALID_HANDLE || mysql_errno(g_SQL) != 0)
	{
		print("MySQL connection failed. Server is shutting down.");
		SendRconCommand("");
		return 1;
	}
	print("MySQL connection is successful.");

	mysql_tquery(g_SQL, "SELECT * FROM `server`", "LoadServer");
	mysql_tquery(g_SQL, "SELECT * FROM `doors`", "LoadDoors");
	mysql_tquery(g_SQL, "SELECT * FROM `familys`", "LoadFamilys");
	mysql_tquery(g_SQL, "SELECT * FROM `farm`", "LoadFarm");
	mysql_tquery(g_SQL, "SELECT * FROM `houses`", "LoadHouses");
	mysql_tquery(g_SQL, "SELECT * FROM `bisnis`", "LoadBisnis");
	mysql_tquery(g_SQL, "SELECT * FROM `workshop`", "LoadWorkshop");
	mysql_tquery(g_SQL, "SELECT * FROM `lockers`", "LoadLockers");
	mysql_tquery(g_SQL, "SELECT * FROM `gstations`", "LoadGStations");
	mysql_tquery(g_SQL, "SELECT * FROM `atms`", "LoadATM");
	mysql_tquery(g_SQL, "SELECT * FROM `gates`", "LoadGates");
	mysql_tquery(g_SQL, "SELECT * FROM `vouchers`", "LoadVouchers");
	mysql_tquery(g_SQL, "SELECT * FROM `trees`", "LoadTrees");
	mysql_tquery(g_SQL, "SELECT * FROM `ores`", "LoadOres");
	mysql_tquery(g_SQL, "SELECT * FROM `plants`", "LoadPlants");
	//--------
	new gm[32];
	format(gm, sizeof(gm), "%s", TEXT_GAMEMODE);
	SetGameModeText(gm);
	format(gm, sizeof(gm), "weburl %s", TEXT_WEBURL);
	SendRconCommand(gm);
	format(gm, sizeof(gm), "language %s", TEXT_LANGUAGE);
	SendRconCommand(gm);
	//---- [ Function ]----
	CreateTextDraw();
	CreateServerPoint();
	CreateGetJobPoint();
	CreateJoinProductionPoint();
	CreateArmsPoint();
	CreateJoinSmugglerPoint();
	CreateUnloadPacketPoint();
	LoadTazerSAPD();
	//server
	ServerLabels();
	ServerVehicle();
	LoadFarm();
	//Sidejob Vehicle
	AddForVehicle();
	AddTrashVehicle();
	//map
	ObjectMapping();
	LoadObjects();
	LoadGym();
	LoadGYMObject();
	LoadModsPoint();
	//motd
	LoadMOTDs();
	//---
	SendRconCommand("mapname San Andreas");
	ManualVehicleEngineAndLights();
	EnableStuntBonusForAll(0);
	AllowInteriorWeapons(1);
	DisableInteriorEnterExits();
	LimitPlayerMarkerRadius(15.0);
	SetNameTagDrawDistance(20.0);

	ShowPlayerMarkers(PLAYER_MARKERS_MODE_OFF);
	SetWorldTime(WorldTime);
	SetWeather(WorldWeather);
	BlockGarages(.text=".");
	//icon
	for(new id = 0; id < MAX_MAPICONS; id++)
	{
		new filename[ 32 ];
		format( filename, sizeof( filename ), MAPICONS_FILE, id );
		if( fexist( filename ) )
		{
		    INI_ParseFile( filename, "LoadMapIcons", .bExtra = true, .extra = id );
		    {
	            Icon[ id ] = CreateDynamicMapIcon( MI[ id ][ miX ],MI[ id ][ miY ],MI[ id ][ miZ ], MI[ id ][ miType ], -1, MI[ id ][ miVW ], MI[ id ][ miInt ], -1, MI[ id ][ miDistance ] );
			}
		}
	}
	//Timer
	SetTimer("settime",1000,true);
	//SetTimer("CheckPlayers",1000,true);
	g_Discord_Chat = DCC_FindChannelById("873176757224734740");

	//DMVCar
	DMVPlate1 = DMVCar[1] = AddStaticVehicleEx(405,2052.8206,-1903.9745,13.3249,359.6511-180,6,1, 1); // Car1
	SetVehicleNumberPlate(DMVPlate1, "LATIHAN");
	DMVPlate2 = DMVCar[2] = AddStaticVehicleEx(405,2056.1641,-1903.9946,13.3470,359.6512-180,6,1, 1); // Car2
	SetVehicleNumberPlate(DMVPlate2, "LATIHAN");
	DMVPlate3 = DMVCar[3] = AddStaticVehicleEx(405,2059.3220,-1904.0138,13.3470,359.6512-180,6,1, 1); // Car3
	SetVehicleNumberPlate(DMVPlate3, "LATIHAN");
	DMVPlate4 = DMVCar[4] = AddStaticVehicleEx(405,2062.5098,-1904.0331,13.3470,359.6512-180,6,1, 1); // Car4
	SetVehicleNumberPlate(DMVPlate4, "LATIHAN");
	DMVPlate5 = DMVCar[5] = AddStaticVehicleEx(405,2065.6597,-1904.0526,13.3470,359.6512-180,6,1, 1); // Car5
	SetVehicleNumberPlate(DMVPlate5, "LATIHAN");
	//Sweeper
	SWEEPERPlate[0] = SWEEPER[0] = AddStaticVehicleEx(574, 1626.1691,-1896.3145,13.2765,357.4089, 1, 1, 1);
	SetVehicleNumberPlate(SWEEPERPlate[0], "SWEEPER");
	SWEEPERPlate[1] = SWEEPER[1] = AddStaticVehicleEx(574, 1622.7128,-1896.3400,13.2757,358.0077, 1, 1, 1);
	SetVehicleNumberPlate(SWEEPERPlate[1], "SWEEPER");
	SWEEPERPlate[2] = SWEEPER[2] = AddStaticVehicleEx(574, 1619.3044,-1896.3998,13.2737,359.5278, 1, 1, 1);
	SetVehicleNumberPlate(SWEEPERPlate[2], "SWEEPER");
	//Bus
	BusPlate[0] = BUS[0] = AddStaticVehicleEx(431, 1698.3337, -1496.5729, 13.4855, 359.1141, 3, 1, 1);
	SetVehicleNumberPlate(BusPlate[0], "BUS");
	BusPlate[1] = BUS[1] = AddStaticVehicleEx(431, 1698.2653, -1511.8468, 13.4872, 359.8352, 6, 1, 1);
	SetVehicleNumberPlate(BusPlate[1], "BUS");
	BusPlate[2] = BUS[2] = AddStaticVehicleEx(431, 1698.4172, -1526.7191, 13.4833, 0.4046, 2, 1, 1);
	SetVehicleNumberPlate(BusPlate[2], "BUS");

}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	//trasher
	if(newstate == PLAYER_STATE_DRIVER)
	{
	    new vehicleid = GetPlayerVehicleID(playerid);
	    if(GetVehicleModel(vehicleid) == 408)
	    {
		    if(LoadedTrash[vehicleid] > 0) 
		    {
		        new string[128];
		        format(string, sizeof(string), "TRASHMASTER: {FFFFFF}This vehicle has {F39C12}%d {FFFFFF}trash bags which is worth {2ECC71}$%d.", LoadedTrash[vehicleid], LoadedTrash[vehicleid] * TRASH_BAG_VALUE);
				SendClientMessage(playerid, COLOR_JOB, string);
				SendClientMessage(playerid, COLOR_JOB, "TRASHMASTER: {FFFFFF}You can sell your trash bags to recycling factories marked by a truck icon.");

				for(new i; i < sizeof(FactoryData); i++)
				{
				    FactoryIcons[playerid][i] = CreateDynamicMapIcon(FactoryData[i][FactoryX], FactoryData[i][FactoryY], FactoryData[i][FactoryZ], 51, 0, _, _, playerid, 8000.0, MAPICON_GLOBAL);
					TogglePlayerDynamicCP(playerid, FactoryData[i][FactoryCP], 1);
				}
		    }
		    else
		    {
		        SendClientMessage(playerid, COLOR_JOB, "TRASHMASTER: {FFFFFF}You can collect trash and sell them at recycling factories.");
		        SendClientMessage(playerid, COLOR_JOB, "TRASHMASTER: {FFFFFF}Find trash cans or dumpsters and use '/pickup'.");
		    }

			Trash_ShowCapacity(playerid);
		}
		SetPVarInt(playerid, "LastVehicleID", vehicleid);
	}

	if(oldstate == PLAYER_STATE_DRIVER)
	{
		for(new i; i < sizeof(FactoryData); i++)
		{
		    if(IsValidDynamicMapIcon(FactoryIcons[playerid][i]))
		    {
		        DestroyDynamicMapIcon(FactoryIcons[playerid][i]);
		        FactoryIcons[playerid][i] = -1;
		    }

			TogglePlayerDynamicCP(playerid, FactoryData[i][FactoryCP], 0);
		}

		PlayerTextDrawHide(playerid, CapacityText[playerid]);
		HidePlayerProgressBar(playerid, CapacityBar[playerid]);
	}
	Trash_ResetPlayer(playerid);
	//electrican
	if(newstate == PLAYER_STATE_DRIVER)
	{
	    new vehicleid = GetPlayerVehicleID(playerid);
	    if(GetVehicleModel(vehicleid) == 552)
	    {
		   	SendClientMessage(playerid, 0x2ECC71FF, "ELECTRICAN: {FFFFFF}.");
		}
		SetPVarInt(playerid, "LastVehicleID", vehicleid);
	}
	if(newstate == PLAYER_STATE_WASTED && pData[playerid][pJail] < 1)
    {	
		if(pData[playerid][pInjured] == 0)
        {
            pData[playerid][pInjured] = 1;
            SetPlayerHealthEx(playerid, 99999);

            pData[playerid][pInt] = GetPlayerInterior(playerid);
            pData[playerid][pWorld] = GetPlayerVirtualWorld(playerid);

            GetPlayerPos(playerid, pData[playerid][pPosX], pData[playerid][pPosY], pData[playerid][pPosZ]);
            GetPlayerFacingAngle(playerid, pData[playerid][pPosA]);
        }
        else
        {
            pData[playerid][pHospital] = 1;
        }
	}
	//Spec Player
	new vehicleid = GetPlayerVehicleID(playerid);
	if(newstate == PLAYER_STATE_ONFOOT)
	{
		if(pData[playerid][playerSpectated] != 0)
		{
			foreach(new ii : Player)
			{
				if(pData[ii][pSpec] == playerid)
				{
					PlayerSpectatePlayer(ii, playerid);
					Servers(ii, ,"%s(%i) is now on foot.", pData[playerid][pName], playerid);
				}
			}
		}
	}
	if(newstate == PLAYER_STATE_DRIVER || newstate == PLAYER_STATE_PASSENGER)
    {
		if(pData[playerid][pInjured] == 1)
        {
            //RemoveFromVehicle(playerid);
			RemovePlayerFromVehicle(playerid);
            SetPlayerHealthEx(playerid, 99999);
        }
		foreach (new ii : Player) if(pData[ii][pSpec] == playerid) 
		{
            PlayerSpectateVehicle(ii, GetPlayerVehicleID(playerid));
        }
	}
	if(oldstate == PLAYER_STATE_PASSENGER)
	{
		TextDrawHideForPlayer(playerid, TextFare);
		TextDrawHideForPlayer(playerid, DPvehfare[playerid]);
	}
	if(oldstate == PLAYER_STATE_DRIVER)
    {	
		if(GetPlayerSpecialAction(playerid) == SPECIAL_ACTION_CARRY || GetPlayerSpecialAction(playerid) == SPECIAL_ACTION_CUFFED)
            return RemovePlayerFromVehicle(playerid);/*RemoveFromVehicle(playerid);*/
			
		PlayerTextDrawHide(playerid, DPvehname[playerid]);
        PlayerTextDrawHide(playerid, DPvehengine[playerid]);
        PlayerTextDrawHide(playerid, DPvehspeed[playerid]);
        PlayerTextDrawHide(playerid, HBEC[playerid]);
		
		TextDrawHideForPlayer(playerid, DPvehfare[playerid]);
		TextDrawHideForPlayer(playerid, VehBox);
        for(new txd; txd < 6; txd++)
		{
			TextDrawHideForPlayer(playerid, HudVeh[txd]);
		}
		//HBE textdraw Simple
		PlayerTextDrawHide(playerid, SPvehname[playerid]);
        PlayerTextDrawHide(playerid, SPvehengine[playerid]);
        //PlayerTextDrawHide(playerid, SPvehspeed[playerid]);
        PlayerTextDrawHide(playerid, DGHBEC[playerid]);
        for(new txd; txd < 3; txd++)
		{
			TextDrawHideForPlayer(playerid, DGhudveh[txd]);
		}
		
		if(pData[playerid][pTaxiDuty] == 1)
		{
			pData[playerid][pTaxiDuty] = 0;
			SetPlayerColor(playerid, COLOR_WHITE);
			Servers(playerid, "You are no longer on taxi duty!");
		}
		if(pData[playerid][pFare] == 1)
		{
			KillTimer(pData[playerid][pFareTimer]);
			Info(playerid, "Anda telah menonaktifkan taxi fare pada total: {00FF00}%s", FormatMoney(pData[playerid][pTotalFare]));
			pData[playerid][pFare] = 0;
			pData[playerid][pTotalFare] = 0;
		}
		
        HidePlayerProgressBar(playerid, pData[playerid][fuelbar]);
        HidePlayerProgressBar(playerid, pData[playerid][damagebar]);
        
        HidePlayerProgressBar(playerid, pData[playerid][spfuelbar]);
        HidePlayerProgressBar(playerid, pData[playerid][spdamagebar]);
	}
	//mt speedo
	if(newstate != PLAYER_STATE_DRIVER)
	{
		DestroyPlayerObject(playerid,PlayerSpeedObject[playerid]);
		DestroyPlayerObject(playerid,PlayerSpeedObject2[playerid]);
	}
	else if(newstate == PLAYER_STATE_DRIVER)
    {
		foreach(new pv : PVehicles)
		{

	if(IsBUSCAR(vehicleid))
		{
		    new String[10000], S3MP4K[10000];
		    if(PlayerInfo[playerid][pBusTime] == 0)
			{
		    	strcat(S3MP4K, "Route\tTujuan\n");
				format(String, sizeof(String), "Route A:\tCommerce - Ocean Dock\n");
				strcat(S3MP4K, String);
				format(String, sizeof(String), "Route B:\tCommerce - Los Santos Bank\n");
				strcat(S3MP4K, String);
				format(String, sizeof(String), "Route C:\t{FF0000}Maintenance");
				strcat(S3MP4K, String);
				ShowPlayerDialog(playerid, BUSJOB, DIALOG_STYLE_TABLIST_HEADERS, "Bus Driver Sidejob", S3MP4K, "Select", "Cancel");
			}
			else
			{
			    format(String, sizeof(String),"ERROR: Kamu harus menunggu %d Menit untuk menjadi Bus Driver", PlayerInfo[playerid][pBusTime]/60);
			    SendClientMessage(playerid, COLOR_GRAD2, String);
				RemovePlayerFromVehicle(playerid);
		 	}
		}
	}
}



//----------[ Dialog Login Register]----------
public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	printf("[OnDialogResponse]: %s(%d) has used dialog id: %d Listitem: %d", pData[playerid][pName], playerid, dialogid, listitem);
    
	
	if(dialogid == BUSJOB)
	{
		if(response)
		{
		    switch(listitem)
			{
			    case 0:
			    {
				 	if(PlayerInfo[playerid][pBusTime] == 0)
				 	{
				 	  //  if(DialogBus[0] == false) // Kalau False atau tidak dipilih
			    		{
					    	DialogBus[0] = true; // Dialog 0 telah di pilih
					    	DialogSaya[playerid][0] = true;
		                	BusSteps[playerid][0] = 2;
					     	KerjaBus[playerid] = 1;
					     	SetPlayerRaceCheckpoint(playerid, 0, 1673.5162,-1477.9034,13.4807, 1655.8779,-1580.8289,13.4839, 5.0);
					     	SendClientMessage(playerid, COLOR_ARWIN, "SIDEJOBINFO: {FFFFFF}Ikutilah checkpoint yang tersedia pada Radar");
						}
					//	else
						//    SendClientMessage(playerid,-1,"ERROR: Route already taken by Someone");
					}
				}
				case 1:
			    {
				 	if(PlayerInfo[playerid][pBusTime] == 0)
				 	{
				 	 //  if(DialogBus[1] == false) // Kalau False atau tidak dipilih
			    		{
					    	DialogBus[1] = true; // Dialog 0 telah di pilih
					    	DialogSaya[playerid][1] = true;
		                	BusSteps[playerid][1] = 6;
					     	KerjaBus[playerid] = 1;
					     	SetPlayerRaceCheckpoint(playerid, 0, 1671.5015,-1477.9338,13.4804,1655.4309,-1578.8663,13.4876, 5);
					     	SendClientMessage(playerid, COLOR_ARWIN, "SIDEJOBINFO: {FFFFFF}Ikutilah checkpoint yang tersedia pada Radar");
						}
						//else
						  //  SendClientMessage(playerid,-1,"ERROR: Route already taken by Someone");
					}
				}
				case 2:
			    {
				 	if(PlayerInfo[playerid][pBusTime] == 0)
				 	{
				 	   // if(DialogBus[2] == false) // Kalau False atau tidak dipilih
			    		{
					    	/*DialogBus[2] = true; // Dialog 0 telah di pilih
					    	DialogSaya[playerid][2] = true;
		                	BusSteps[playerid][2] = 1;
					     	KerjaBus[playerid] = 1;
					     	SetPlayerRaceCheckpoint(playerid, 0, 1619.1874, -1877.3141, 13.3828, 1539.4319,-1869.4375,13.1080, 5.0);
					     	SendClientMessage(playerid, COLOR_ARWIN, "SIDEJOBINFO: {FFFFFF}Ikutilah checkpoint yang tersedia pada Radar");*/
							RemovePlayerFromVehicle(playerid);
							SendClientMessage(playerid, COLOR_ARWIN, "SIDEJOBINFO: {FFFFFF}Rute dalam tahap pembenahan, harap menunggu sampai Rute di buka kembali");
						}
						//else
						//    SendClientMessage(playerid,-1,"ERROR: Route already cleaning by Someone");
					}
				}
			}
		}
		else RemovePlayerFromVehicle(playerid);
	}
	if(dialogid == SWEEPERJOB)
	{
		if(response)
		{
		    switch(listitem)
			{
			    case 0:
			    {
				 //	if(PlayerInfo[playerid][pSweeperT] == 0)
				 	{
				 	    if(DialogSweeper[0] == false) // Kalau False atau tidak dipilih
			    		{
					    	DialogSweeper[0] = true; // Dialog 0 telah di pilih
					    	DialogSaya[playerid][0] = true;
		                	SweeperSteps[playerid][0] = 1;
					     	KerjaSweeper[playerid] = 1;
					     	SetPlayerRaceCheckpoint(playerid, 0, 1619.1874,-1877.3141,13.3828,1619.4293,-1881.6036,13.4845, 5);
					     	SendClientMessage(playerid, COLOR_ARWIN, "SIDEJOBINFO: {FFFFFF}Ikutilah checkpoint yang tersedia pada Radar");
						}
				//		else
					//	    SendClientMessage(playerid,-1,"ERROR: Route already cleaning by Someone");
					}
				}
				case 1:
			    {
				 	if(PlayerInfo[playerid][pSweeperT] == 0)
				 	{
				 	    //if(DialogSweeper[1] == false) // Kalau False atau tidak dipilih
			    		{
					    	DialogSweeper[1] = true; // Dialog 0 telah di pilih
					    	DialogSaya[playerid][1] = true;
		                	SweeperSteps[playerid][1] = 1;
					     	KerjaSweeper[playerid] = 1;
					     	SetPlayerRaceCheckpoint(playerid, 0, 1619.1874, -1877.3141, 13.3828, 1574.9003, -1871.1334, 12.9483, 5.0);
					     	SendClientMessage(playerid, COLOR_ARWIN, "SIDEJOBINFO: {FFFFFF}Ikutilah checkpoint yang tersedia pada Radar");
						}
					//	else
						//    SendClientMessage(playerid,-1,"ERROR: Route already cleaning by Someone");
					}
				}
				case 2:
			    {
				 	if(PlayerInfo[playerid][pSweeperT] == 0)
				 	{
				 	 //   if(DialogSweeper[2] == false) // Kalau False atau tidak dipilih
			    		{
					    	DialogSweeper[2] = true; // Dialog 0 telah di pilih
					    	DialogSaya[playerid][2] = true;
		                	SweeperSteps[playerid][2] = 1;
					     	KerjaSweeper[playerid] = 1;
					     	SetPlayerRaceCheckpoint(playerid, 0, 1619.1874, -1877.3141, 13.3828, 1539.4319,-1869.4375,13.1080, 5.0);
					     	SendClientMessage(playerid, COLOR_ARWIN, "SIDEJOBINFO: {FFFFFF}Ikutilah checkpoint yang tersedia pada Radar");
						}
					//	else
						//    SendClientMessage(playerid,-1,"ERROR: Route already cleaning by Someone");
					}
				}
			}
		}
		else RemovePlayerFromVehicle(playerid);
	}
	if(dialogid == DIALOG_HAULINGTR)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0://Ocean Dock 1
				{
				    if(DialogHauling[0] == false) // Kalau False atau tidak dipilih
				    {
					    DialogHauling[0] = true; // Dialog 0 telah di pilih
					    DialogSaya[playerid][0] = true;
						SendClientMessage(playerid, COLOR_JOB,"TRUCKING: {FFFFFF}Go to marked checkpoint on your map");
						SetPlayerRaceCheckpoint(playerid, 1, 2791.4016, -2494.5452, 14.2522, 2791.4016, -2494.5452, 14.2522, 10.0);
						TrailerHauling[playerid] = CreateVehicle(435, 2791.4016, -2494.5452, 14.2522, 89.5366, 1, 1, -1);
						SedangHauling[playerid] = 1;
					}
					else
					    SendClientMessage(playerid,-1,"ERROR: Trucking Missions already taken by Someone");
				}
				case 1://Ocean Dock 2
				{
				    if(DialogHauling[1] == false) // Kalau False atau tidak dipilih
				    {
					    DialogHauling[1] = true; // Dialog 1 telah di pilih
					    DialogSaya[playerid][1] = true;
						SendClientMessage(playerid, COLOR_JOB,"TRUCKING: {FFFFFF}Go to marked checkpoint on your map");
						SetPlayerRaceCheckpoint(playerid, 1, 2784.3132, -2456.6299, 14.2415, 2784.3132, -2456.6299, 14.2415, 10.0);
						TrailerHauling[playerid] = CreateVehicle(591, 2784.3132, -2456.6299, 14.2415, 89.4938, 1, 1, -1);
						SedangHauling[playerid] = 3;
					}
					else
					    SendClientMessage(playerid,-1,"ERROR: Trucking Missions already taken by Someone");
				}
				case 2://Angel Pine 1
				{
				    if(DialogHauling[2] == false) // Kalau False atau tidak dipilih
				    {
					    DialogHauling[2] = true; // Dialog 2 telah di pilih
					    DialogSaya[playerid][3] = true;
						SendClientMessage(playerid, COLOR_JOB,"TRUCKING: {FFFFFF}Go to marked checkpoint on your map");
						SetPlayerRaceCheckpoint(playerid, 1,-1963.0142, -2436.3079, 31.2311, -1963.0142, -2436.3079, 31.2311, 10.0);
						TrailerHauling[playerid] = CreateVehicle(450, -1963.0142, -2436.3079, 31.2311, 226.1548, 1, 1, -1);
						SedangHauling[playerid] = 5;
					}
					else
					    SendClientMessage(playerid,-1,"ERROR: Trucking Missions already taken by Someone");
				}
				case 3://Angel Pine 2
				{
				    if(DialogHauling[3] == false) // Kalau False atau tidak dipilih
				    {
					    DialogHauling[3] = true; // Dialog 0 telah di pilih
					    DialogSaya[playerid][3] = true;
						SendClientMessage(playerid, COLOR_JOB,"TRUCKING: {FFFFFF}Go to marked checkpoint on your map");
						SetPlayerRaceCheckpoint(playerid, 1, -1966.5603, -2439.9380, 31.2306, -1966.5603, -2439.9380, 31.2306, 10.0);
						TrailerHauling[playerid] = CreateVehicle(450, -1966.5603, -2439.9380, 31.2306, 225.5799, 1, 1, -1);
						SedangHauling[playerid] = 7;
					}
					else
					    SendClientMessage(playerid,-1,"ERROR: Trucking Missions already taken by Someone");
				}
				case 4://Dekat Jembatan Montgomery 1
				{
				    if(DialogHauling[4] == false) // Kalau False atau tidak dipilih
				    {
					    DialogHauling[4] = true; // Dialog 1 telah di pilih
					    DialogSaya[playerid][4] = true;
						SendClientMessage(playerid, COLOR_JOB,"TRUCKING: {FFFFFF}Go to marked checkpoint on your map");
						SetPlayerRaceCheckpoint(playerid, 1, -1863.1541, -1720.5603, 22.3558, -1863.1541, -1720.5603, 22.3558, 10.0);
						TrailerHauling[playerid] = CreateVehicle(450, -1863.1541, -1720.5603, 22.3558, 122.1463, 1, 1, -1);
						SedangHauling[playerid] = 9;
					}
					else
					    SendClientMessage(playerid,-1,"ERROR: Trucking Missions already taken by Someone");
				}
				case 5://Dekat Jembatan Montgomery 2
				{
				    if(DialogHauling[5] == false) // Kalau False atau tidak dipilih
				    {
					    DialogHauling[5] = true; // Dialog 2 telah di pilih
					    DialogSaya[playerid][5] = true;
						SendClientMessage(playerid, COLOR_JOB,"TRUCKING: {FFFFFF}Go to marked checkpoint on your map");
						SetPlayerRaceCheckpoint(playerid, 1, -1855.7255, -1726.0389, 22.3566, -1855.7255, -1726.0389, 22.3566, 10.0);
						TrailerHauling[playerid] = CreateVehicle(450, -1855.7255, -1726.0389, 22.3566, 124.4187, 1, 1, -1);
						SedangHauling[playerid] = 11;
					}
					else
					    SendClientMessage(playerid,-1,"ERROR: Trucking Missions already taken by Someone");
				}
				case 6://Pabrik Easter Egg
				{
				    if(DialogHauling[6] == false) // Kalau False atau tidak dipilih
				    {
					    DialogHauling[6] = true; // Dialog 0 telah di pilih
					    DialogSaya[playerid][6] = true;
						SendClientMessage(playerid, COLOR_JOB,"TRUCKING: {FFFFFF}Go to marked checkpoint on your map");
						SetPlayerRaceCheckpoint(playerid, 1, -1053.6145, -658.6473, 32.6319, -1053.6145, -658.6473, 32.6319, 10.0);
						TrailerHauling[playerid] = CreateVehicle(584, -1053.6145, -658.6473, 32.6319, 260.6392, 1, 1, -1);
						SedangHauling[playerid] = 13;
					}
					else
					    SendClientMessage(playerid,-1,"ERROR: Trucking Missions already taken by Someone");
				}
				case 7://Blueberry Atas
				{
				    if(DialogHauling[7] == false) // Kalau False atau tidak dipilih
				    {
					    DialogHauling[7] = true; // Dialog 1 telah di pilih
					    DialogSaya[playerid][7] = true;
						SendClientMessage(playerid, COLOR_JOB,"TRUCKING: {FFFFFF}Go to marked checkpoint on your map");
						SetPlayerRaceCheckpoint(playerid, 1, -459.3511, -48.3457, 60.5507, -459.3511, -48.3457, 60.5507, 10.0);
						TrailerHauling[playerid] = CreateVehicle(450, -459.3511, -48.3457, 60.5507, 182.7280, 1, 1, -1);
						SedangHauling[playerid] = 15;
					}
					else
					    SendClientMessage(playerid,-1,"ERROR: Trucking Missions already taken by Someone");
				}
				case 8://LV Tanah
				{
				    if(DialogHauling[8] == false) // Kalau False atau tidak dipilih
				    {
					    DialogHauling[8] = true; // Dialog 2 telah di pilih
					    DialogSaya[playerid][8] = true;
						SendClientMessage(playerid, COLOR_JOB,"TRUCKING: {FFFFFF}Go to marked checkpoint on your map");
						SetPlayerRaceCheckpoint(playerid, 1, 847.0450, 921.0422, 13.9579, 847.0450, 921.0422, 13.9579, 10.0);
						TrailerHauling[playerid] = CreateVehicle(450, 847.0450, 921.0422, 13.9579, 201.2555, 1, 1, -1);
						SedangHauling[playerid] = 17;
					}
					else
					    SendClientMessage(playerid,-1,"ERROR: Trucking Missions already taken by Someone");
				}
				case 9://LV Pabrik
				{
				    if(DialogHauling[9] == false) // Kalau False atau tidak dipilih
				    {
					    DialogHauling[9] = true; // Dialog 2 telah di pilih
					    DialogSaya[playerid][9] = true;
						SendClientMessage(playerid, COLOR_JOB,"TRUCKING: {FFFFFF}Go to marked checkpoint on your map");
						SetPlayerRaceCheckpoint(playerid, 1, 249.6713, 1395.7150, 11.1923, 249.6713, 1395.7150, 11.1923, 10.0);
						TrailerHauling[playerid] = CreateVehicle(584, 249.6713, 1395.7150, 11.1923, 269.0699, 1, 1, -1);
						SedangHauling[playerid] = 19;
					}
					else
					    SendClientMessage(playerid,-1,"ERROR: Trucking Missions already taken by Someone");
				}
			}
		}
	}
	if(dialogid == DIALOG_TDM)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0:
				{
					if(GetPlayerTeam(playerid) == 1)
						return Error(playerid, "Anda sudah bergabung ke Tim ini");

					if(RedTeam >= MaxRedTeam)
						return Error(playerid, "Pemain didalam tim ini sudah terlalu penuh");

					SetPlayerTeam(playerid, 1);
					SetPlayerPos(playerid, RedX, RedY, RedZ);
					IsAtEvent[playerid] = 1;
					SetPlayerVirtualWorld(playerid, EventWorld);
					SetPlayerInterior(playerid, EventInt);
					SetPlayerHealthEx(playerid, EventHP);
					SetPlayerArmourEx(playerid, EventArmour);
					ResetPlayerWeapons(playerid);
					GivePlayerWeaponEx(playerid, EventWeapon1, 150);
					GivePlayerWeaponEx(playerid, EventWeapon2, 150);
					GivePlayerWeaponEx(playerid, EventWeapon3, 150);
					GivePlayerWeaponEx(playerid, EventWeapon4, 150);
					GivePlayerWeaponEx(playerid, EventWeapon5, 150);
					TogglePlayerControllable(playerid, 0);
					SetPlayerColor(playerid, COLOR_RED);
					Servers(playerid, "Berhasil bergabung kedalam Tim, Harap tunggu Admin memulai Event");
					RedTeam += 1;
				}
				case 1:
				{
					if(GetPlayerTeam(playerid) == 2)
						return Error(playerid, "Anda sudah bergabung ke Tim ini");

					if(BlueTeam >= MaxBlueTeam)
						return Error(playerid, "Pemain didalam tim ini sudah terlalu penuh");

					SetPlayerTeam(playerid, 2);
					SetPlayerPos(playerid, BlueX, BlueY, BlueZ);
					IsAtEvent[playerid] = 1;
					SetPlayerVirtualWorld(playerid, EventWorld);
					SetPlayerInterior(playerid, EventInt);
					SetPlayerHealthEx(playerid, EventHP);
					SetPlayerArmourEx(playerid, EventArmour);
					ResetPlayerWeapons(playerid);
					GivePlayerWeaponEx(playerid, EventWeapon1, 150);
					GivePlayerWeaponEx(playerid, EventWeapon2, 150);
					GivePlayerWeaponEx(playerid, EventWeapon3, 150);
					GivePlayerWeaponEx(playerid, EventWeapon4, 150);
					GivePlayerWeaponEx(playerid, EventWeapon5, 150);
					TogglePlayerControllable(playerid, 0);
					SetPlayerColor(playerid, COLOR_BLUE);
					Servers(playerid, "Berhasil bergabung kedalam Tim, Harap tunggu Admin memulai Event");
					BlueTeam += 1;
				}
			}
		}
	}
	//trunk
	if(dialogid == TRUNK_STORAGE)
	{
	   	new x = GetNearestVehicleToPlayer(playerid, 3.5, false);

		if(x == INVALID_VEHICLE_ID)
			return Error(playerid, "You not in near any vehicles.");

	    foreach(new i: PVehicles)
		if(x == pvData[i][cVeh])
		{
			new carid = pvData[i][cVeh];
			if(response)
			{
				if(listitem == 0)
				{
					Trunk_WeaponStorage(playerid, carid);
				}
				else if(listitem == 1)
				{
					ShowPlayerDialog(playerid, TRUNK_MONEY, DIALOG_STYLE_LIST, "Money Safe", "Withdraw from safe\nDeposit into safe", "Select", "Back");
				}
				else if(listitem == 2)
				{
					ShowPlayerDialog(playerid, TRUNK_COMP, DIALOG_STYLE_LIST, "Component Safe", "Withdraw from safe\nDeposit into safe", "Select", "Back");
				}
				else if(listitem == 3)
				{
					ShowPlayerDialog(playerid, TRUNK_MATS, DIALOG_STYLE_LIST, "Material Safe", "Withdraw from safe\nDeposit into safe", "Select", "Back");
				}
			}
		}
		return 1;
	}
	if(dialogid == TRUNK_WEAPONS)
	{
       	new x = GetNearestVehicleToPlayer(playerid, 3.5, false);

		if(x == INVALID_VEHICLE_ID)
			return Error(playerid, "You not in near any vehicles.");

	    foreach(new i: PVehicles)
		if(x == pvData[i][cVeh])
		{
			new carid = pvData[i][cVeh];
			if(response)
			{
				if(vsData[carid][tWeapon][listitem] != 0)
				{
					GivePlayerWeaponEx(playerid, vsData[carid][tWeapon][listitem], vsData[carid][tAmmo][listitem]);

					SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s has taken a \"%s\" from their weapon storage.", ReturnName(playerid), ReturnWeaponName(vsData[carid][tWeapon][listitem]));

					vsData[carid][tWeapon][listitem] = 0;
					vsData[carid][tAmmo][listitem] = 0;
					Trunk_Save(i);
					Trunk_WeaponStorage(playerid, carid);
				}
				else
				{
					new
						weaponid = GetPlayerWeaponEx(playerid),
						ammo = GetPlayerAmmoEx(playerid);

					if(!weaponid)
						return Error(playerid, "You are not holding any weapon!");

					ResetWeapon(playerid, weaponid);
					SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s has stored a \"%s\" into their weapon storage.", ReturnName(playerid), ReturnWeaponName(weaponid));

					vsData[carid][tWeapon][listitem] = weaponid;
					vsData[carid][tAmmo][listitem] = ammo;
					Trunk_Save(i);
					Trunk_WeaponStorage(playerid, carid);
				}
			}
			else
			{
				Trunk_OpenStorage(playerid, carid);
			}
		}
		return 1;
	}
	if(dialogid == TRUNK_MONEY)
	{
		if(response)
		{
			switch (listitem)
			{
				case 0:
				{
					new str[128];
					format(str, sizeof(str), "Please enter how much money you wish to withdraw from the safe:");
					ShowPlayerDialog(playerid, TRUNK_WITHDRAWMONEY, DIALOG_STYLE_INPUT, "Withdraw from safe", str, "Withdraw", "Back");
				}
				case 1:
				{
					new str[128];
					format(str, sizeof(str), "Please enter how much money you wish to deposit into the safe:");
					ShowPlayerDialog(playerid, TRUNK_DEPOSITMONEY, DIALOG_STYLE_INPUT, "Deposit into safe", str, "Deposit", "Back");
				}
			}
		}
		return 1;
	}
	if(dialogid == TRUNK_WITHDRAWMONEY)
	{
		if(response)
		{
			new x = GetNearestVehicleToPlayer(playerid, 3.5, false);

			if(x == INVALID_VEHICLE_ID)
				return Error(playerid, "You not in near any vehicles.");

		    foreach(new i: PVehicles)
			if(x == pvData[i][cVeh])
			{
				new carid = pvData[i][cVeh];
				new amount = strval(inputtext);

				if(isnull(inputtext))
				{
					new str[128];
					format(str, sizeof(str), "Please enter how much money you wish to withdraw from the safe:");
					ShowPlayerDialog(playerid, TRUNK_WITHDRAWMONEY, DIALOG_STYLE_INPUT, "Withdraw from safe", str, "Withdraw", "Back");
					return 1;
				}
				if(amount < 1 || amount > vsData[carid][tMoney])
				{
					new str[128];
					format(str, sizeof(str), "Error: Insufficient funds.\n\nSafe Balance: %s\n\nPlease enter how much money you wish to withdraw from the safe:", FormatMoney(vsData[carid][tMoney]));
					ShowPlayerDialog(playerid, TRUNK_WITHDRAWMONEY, DIALOG_STYLE_INPUT, "Withdraw from safe", str, "Withdraw", "Back");
					return 1;
				}
				vsData[carid][tMoney] -= amount;
				GivePlayerMoneyEx(playerid, amount);

				Trunk_Save(i);
				Trunk_OpenStorage(playerid, carid);

				SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s has withdrawn %s from their vehicle safe.", ReturnName(playerid), FormatMoney(amount));
			}
		}
		return 1;
	}
	if(dialogid == TRUNK_DEPOSITMONEY)
	{
		if(response)
		{
			new x = GetNearestVehicleToPlayer(playerid, 3.5, false);

			if(x == INVALID_VEHICLE_ID)
				return Error(playerid, "You not in near any vehicles.");

		    foreach(new i: PVehicles)
			if(x == pvData[i][cVeh])
			{
				new carid = pvData[i][cVeh];
				new amount = strval(inputtext);

				if(isnull(inputtext))
				{
					new str[128];
					format(str, sizeof(str), "Safe Balance: %s\n\nPlease enter how much money you wish to deposit into the safe:", FormatMoney(vsData[carid][tMoney]));
					ShowPlayerDialog(playerid, TRUNK_DEPOSITMONEY, DIALOG_STYLE_INPUT, "Deposit into safe", str, "Deposit", "Back");
					return 1;
				}
				if(amount < 1 || amount > GetPlayerMoney(playerid))
				{
					new str[128];
					format(str, sizeof(str), "Error: Insufficient funds.\n\nSafe Balance: %s\n\nPlease enter how much money you wish to deposit into the safe:", FormatMoney(vsData[carid][tMoney]));
					ShowPlayerDialog(playerid, TRUNK_DEPOSITMONEY, DIALOG_STYLE_INPUT, "Deposit into safe", str, "Deposit", "Back");
					return 1;
				}
				vsData[carid][tMoney] += amount;
				GivePlayerMoneyEx(playerid, -amount);

				Trunk_Save(i);
				Trunk_OpenStorage(playerid, carid);

				SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s has deposited %s into their vehicle safe.", ReturnName(playerid), FormatMoney(amount));
			}
		}
	}
	if(dialogid == TRUNK_COMP)
	{
		if(response)
		{
			switch (listitem)
			{
				case 0:
				{
					new str[128];
					format(str, sizeof(str), "Please enter how much component you wish to withdraw from the safe:");
					ShowPlayerDialog(playerid, TRUNK_WITHDRAWCOMP, DIALOG_STYLE_INPUT, "Withdraw from safe", str, "Withdraw", "Back");
				}
				case 1:
				{
					new str[128];
					format(str, sizeof(str), "Please enter how much component you wish to deposit into the safe:");
					ShowPlayerDialog(playerid, TRUNK_DEPOSITCOMP, DIALOG_STYLE_INPUT, "Deposit into safe", str, "Deposit", "Back");
				}
			}
		}
		return 1;
	}
	if(dialogid == TRUNK_WITHDRAWCOMP)
	{
		if(response)
		{
			new x = GetNearestVehicleToPlayer(playerid, 3.5, false);

			if(x == INVALID_VEHICLE_ID)
				return Error(playerid, "You not in near any vehicles.");

		    foreach(new i: PVehicles)
			if(x == pvData[i][cVeh])
			{
				new carid = pvData[i][cVeh];
				new amount = strval(inputtext);

				if(isnull(inputtext))
				{
					new str[128];
					format(str, sizeof(str), "Safe Balance: %d\n\nPlease enter how much component you wish to withdraw from the safe:", vsData[carid][tComp]);
					ShowPlayerDialog(playerid, TRUNK_WITHDRAWCOMP, DIALOG_STYLE_INPUT, "Withdraw from safe", str, "Withdraw", "Back");
					return 1;
				}
				if(amount < 1 || amount > vsData[carid][tComp])
				{
					new str[128];
					format(str, sizeof(str), "Error: Insufficient funds.\n\nSafe Balance: %d\n\nPlease enter how much component you wish to withdraw from the safe:", vsData[carid][tComp]);
					ShowPlayerDialog(playerid, TRUNK_WITHDRAWCOMP, DIALOG_STYLE_INPUT, "Withdraw from safe", str, "Withdraw", "Back");
					return 1;
				}
				vsData[carid][tComp] -= amount;
				pData[playerid][pComponent] += amount;

				Trunk_Save(i);
				Trunk_OpenStorage(playerid, carid);

				SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s has withdrawn %d from their vehicle storage safe.", ReturnName(playerid), amount);
			}
		}
	}
	if(dialogid == TRUNK_DEPOSITCOMP)
	{
		if(response)
		{
			new x = GetNearestVehicleToPlayer(playerid, 3.5, false);

			if(x == INVALID_VEHICLE_ID)
				return Error(playerid, "You not in near any vehicles.");

		    foreach(new i: PVehicles)
			if(x == pvData[i][cVeh])
			{
				new carid = pvData[i][cVeh];
				new amount = strval(inputtext);
				new total = vsData[carid][tComp] + amount;
				
				if(isnull(inputtext))
				{
					new str[128];
					format(str, sizeof(str), "Safe Balance: %d\n\nPlease enter how much component you wish to deposit into the safe:", vsData[carid][tComp]);
					ShowPlayerDialog(playerid, TRUNK_DEPOSITCOMP, DIALOG_STYLE_INPUT, "Deposit into safe", str, "Deposit", "Back");
					return 1;
				}
				if(amount < 1 || amount > pData[playerid][pComponent] || total > 150)
				{
					new str[128];
					format(str, sizeof(str), "Error: Insufficient funds.\n\nSafe Balance: %d\n\nPlease enter how much component you wish to deposit into the safe:", vsData[carid][tComp]);
					ShowPlayerDialog(playerid, TRUNK_DEPOSITCOMP, DIALOG_STYLE_INPUT, "Deposit into safe", str, "Deposit", "Back");
					return 1;
				}
				vsData[carid][tComp] += amount;
				pData[playerid][pComponent] -= amount;

				Trunk_Save(i);
				Trunk_OpenStorage(playerid, carid);

				SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s has deposited %d into their vehicle storage.", ReturnName(playerid), amount);
			}
		}
	}
	if(dialogid == TRUNK_MATS)
	{
		if(response)
		{
			switch (listitem)
			{
				case 0:
				{
					new str[128];
					format(str, sizeof(str), "Please enter how much material you wish to withdraw from the safe:");
					ShowPlayerDialog(playerid, TRUNK_WITHDRAWMATS, DIALOG_STYLE_INPUT, "Withdraw from safe", str, "Withdraw", "Back");
				}
				case 1:
				{
					new str[128];
					format(str, sizeof(str), "Please enter how much material you wish to deposit into the safe:");
					ShowPlayerDialog(playerid, TRUNK_DEPOSITMATS, DIALOG_STYLE_INPUT, "Deposit into safe", str, "Deposit", "Back");
				}
			}
		}
		return 1;
	}
	if(dialogid == TRUNK_WITHDRAWMATS)
	{
		if(response)
		{
			new x = GetNearestVehicleToPlayer(playerid, 3.5, false);

			if(x == INVALID_VEHICLE_ID)
				return Error(playerid, "You not in near any vehicles.");

		    foreach(new i: PVehicles)
			if(x == pvData[i][cVeh])
			{
				new carid = pvData[i][cVeh];
				new amount = strval(inputtext);

				if(isnull(inputtext))
				{
					new str[128];
					format(str, sizeof(str), "Safe Balance: %d\n\nPlease enter how much material you wish to withdraw from the safe:", vsData[carid][tMats]);
					ShowPlayerDialog(playerid, TRUNK_WITHDRAWMATS, DIALOG_STYLE_INPUT, "Withdraw from safe", str, "Withdraw", "Back");
					return 1;
				}
				if(amount < 1 || amount > vsData[carid][tMats])
				{
					new str[128];
					format(str, sizeof(str), "Error: Insufficient funds.\n\nSafe Balance: %d\n\nPlease enter how much material you wish to withdraw from the safe:", vsData[carid][tMats]);
					ShowPlayerDialog(playerid, TRUNK_WITHDRAWMATS, DIALOG_STYLE_INPUT, "Withdraw from safe", str, "Withdraw", "Back");
					return 1;
				}
				vsData[carid][tMats] -= amount;
				pData[playerid][pMaterial] += amount;

				Trunk_Save(i);
				Trunk_OpenStorage(playerid, carid);

				SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s has withdrawn %d from their vehicle storage safe.", ReturnName(playerid), amount);
			}
		}
		return 1;
	}
	if(dialogid == TRUNK_DEPOSITMATS)
	{
		if(response)
		{
			new x = GetNearestVehicleToPlayer(playerid, 3.5, false);

			if(x == INVALID_VEHICLE_ID)
				return Error(playerid, "You not in near any vehicles.");

		    foreach(new i: PVehicles)
			if(x == pvData[i][cVeh])
			{
				new carid = pvData[i][cVeh];
				new amount = strval(inputtext);
				new total = vsData[carid][tMats] + amount;
				if(isnull(inputtext))
				{
					new str[128];
					format(str, sizeof(str), "Safe Balance: %d\n\nPlease enter how much material you wish to deposit into the safe:", vsData[carid][tMats]);
					ShowPlayerDialog(playerid, TRUNK_DEPOSITMATS, DIALOG_STYLE_INPUT, "Deposit into safe", str, "Deposit", "Back");
					return 1;
				}
				if(amount < 1 || amount > pData[playerid][pMaterial] || total > 150)
				{
					new str[128];
					format(str, sizeof(str), "Error: Insufficient funds.\n\nSafe Balance: %d\n\nPlease enter how much material you wish to deposit into the safe:", vsData[carid][tMats]);
					ShowPlayerDialog(playerid, TRUNK_DEPOSITMATS, DIALOG_STYLE_INPUT, "Deposit into safe", str, "Deposit", "Back");
					return 1;
				}
				vsData[carid][tMats] += amount;
				pData[playerid][pMaterial] -= amount;

				Trunk_Save(i);
				Trunk_OpenStorage(playerid, carid);

				SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s has deposited %d into their vehicle storage.", ReturnName(playerid), amount);
			}
		}
	}
	//End of trunk
	if(dialogid == DIALOG_VC)
	{
 		if(response)
		{
			switch(listitem)
			{
				case 0:
				{
					return callcmd::v(playerid, "en");
				}
				case 1:
				{
					return callcmd::v(playerid, "lock");
				}
				case 2:
				{
					return callcmd::v(playerid, "lights");
				}
			}
			//return 1;
		}
	}
	if(dialogid == DIALOG_WORK)
	{
 		if(response)
		{
			switch(listitem)
			{
				case 0:
				{
					return callcmd::mechduty(playerid);
				}
				case 1:
				{
					return callcmd::taxiduty(playerid);
				}
				case 2:
				{
					
				}
				case 3:
				{
					return callcmd::hauls(playerid);
				}
			}
		}
	}
	if(dialogid == DIALOG_TRACK)
	{
 		if(response)
		{
			switch(listitem)
			{
				case 0:
				{
					return callcmd::tr(playerid, "ph");
				}
				case 1:
				{
					return callcmd::tr(playerid, "bis");
				}
				case 2:
				{
					return callcmd::tr(playerid, "house");
				}
			}
			return 1;
		}
	}
	//graf
	if(dialogid == DIALOG_SELECT)
    {
        if(response)
        {
            switch(listitem)
            {
                case 0: ShowPlayerDialog(playerid, DIALOG_INPUTGRAFF, DIALOG_STYLE_INPUT, "Graffiti", "Please Enter Graffiti text", "Continue", "Cancel");
            }
        }
        return 1; 
    }
    if(dialogid == BUY_SPRAYCAN)
    {
        if(response)
        {
            switch(listitem)
            {
                case 0: GivePlayerMoneyEx(playerid, -70), GivePlayerWeaponEx(playerid, 41, 300);
                case 1: GivePlayerMoneyEx(playerid, -120), GivePlayerWeaponEx(playerid, 41, 500);
                case 2: GivePlayerMoneyEx(playerid, -200), GivePlayerWeaponEx(playerid, 41, 900);
            }
        }
        return 1; 
    }




}


public OnPlayerExitVehicle(playerid, vehicleid)
{
	KillTimer(pData[playerid][LimitSpeedTimer]);
	if (GetVehicleModel(vehicleid) == 574)
	{
	    if(KerjaSweeper[playerid] != 0)
	    {
	        SendClientMessageEx(playerid,COLOR_LIGHTBLUE,"Kamu telah berhenti bekerja, kamu dapat bekerja Sweeper 30 menit lagi.");
			KerjaSweeper[playerid] = 0;
			for(new i = 0; i < 3; i++)
			{
				SweeperSteps[playerid][i] = 0;
			}
			DisablePlayerRaceCheckpoint(playerid);
			PlayerInfo[playerid][pSweeperT] = 1800;
	    }
		return 1;
	}
	if (GetVehicleModel(vehicleid) == 431)
	{
	    if(KerjaBus[playerid] != 0)
	    {
	        SendClientMessageEx(playerid,COLOR_LIGHTBLUE,"Kamu telah berhenti bekerja, kamu dapat bekerja sebagai Bus Driver 30 menit lagi.");
			KerjaBus[playerid] = 0;
			for(new i = 0; i < 3; i++)
			{
				BusSteps[playerid][i] = 0;
			}
			DisablePlayerRaceCheckpoint(playerid);
			PlayerInfo[playerid][pBusTime] = 1800;
	    }
		return 1;
	}
	if (GetVehicleModel(vehicleid) == 530)
	{
	    {
	        SendClientMessageEx(playerid,COLOR_JOB,"Kamu telah berhenti bekerja, kamu dapat bekerja Forklift 10 menit lagi.");
			pData[playerid][pSideJob] = 0;
			RemovePlayerFromVehicle(playerid);
			SetTimerEx("RespawnPV", 3000, false, "d", vehicleid);
			pData[playerid][pSideJobTime] = 600;
			DisablePlayerCheckpoint(playerid);
	    }
	}
	return 1;
}



public OnPlayerEnterDynamicCP(playerid, checkpointid)
{
	//pilot
	if(IsPlayerInDynamicCP(playerid, cp[playerid]))
	{
	    if(TakingPs[playerid] == 1)
	    {
     		rands2 = random(sizeof(RandomCPs));
	        while (rands2 == rands)
	        {
	            rands2 = random(sizeof(RandomCPs));
			}
	    	SendClientMessage(playerid, 0x00FF24AA, "You took passengers and now are looking to leave, when ready.");
	    	DestroyDynamicCP(cp[playerid]);
 			rands = random(sizeof(RandomCPs));
 			TakingPs[playerid] = 0;
	 		cp[playerid] = CreateDynamicCP(RandomCPs[rands2][0],RandomCPs[rands2][1],RandomCPs[rands2][2], 20, -1, playerid, -1, 6000);
	 		return 1;
		}
		if(TakingPs[playerid] == 0)
		{
		    new wst[180];
			new pilotN[MAX_PLAYER_NAME];
		    GetPlayerName(playerid, pilotN, sizeof(pilotN));
		    format(wst, sizeof(wst), "Officer looking at you said: Well work MR.%s you have done your job honestly then he fetches something from his pocket and handes to you.", pilotN);
		    SendClientMessage(playerid, 0x26CF12AA, "You completed your passengers' trip (Which you must have to do), then a staff officer approached you...");
		    SendClientMessage(playerid, 0x26CF12AA, wst);
		    SendClientMessage(playerid, 0x26CF12AA, "You then hurried and opened you hand, it was filled with bucks i.e cash. You were payed. If you again need the work type /pwork");
			GivePlayerMoney(playerid, WorkBucks);
			DestroyDynamicCP(cp[playerid]);
			TakingPs[playerid] = 2;
			return 1;
		}
	}
	//trash
	else if(checkpointid == TrashCP[playerid])
	{
	    if(!HasTrash[playerid]) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}You're not carrying a trash bag.");
	    new vehicleid = GetPVarInt(playerid, "LastVehicleID");
	    if(LoadedTrash[vehicleid] >= TRASH_LIMIT) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}This vehicle is full, you can't load any more trash.");
	    LoadedTrash[vehicleid]++;
		ApplyAnimation(playerid, "GRENADE", "WEAPON_throwu", 4.1, 0, 0, 0, 0, 0);
		SendClientMessage(playerid, COLOR_JOB, "TRASHMASTER: {FFFFFF}You've collected a trash bag.");

		if(TRASH_LIMIT - LoadedTrash[vehicleid] > 0)
		{
			new string[96];
			format(string, sizeof(string), "TRASHMASTER: {FFFFFF}You can load {F39C12}%d {FFFFFF}more trash bags to this vehicle.", TRASH_LIMIT - LoadedTrash[vehicleid]);
			SendClientMessage(playerid, COLOR_JOB, string);
		}

		new driver = GetVehicleDriver(vehicleid);
		if(IsPlayerConnected(driver)) Trash_ShowCapacity(driver);
		Trash_ResetPlayer(playerid);
		return 1;
	}

    if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	{
		for(new i; i < sizeof(FactoryData); i++)
		{
		    if(checkpointid == FactoryData[i][FactoryCP])
		    {
		        new string[128], vehicleid = GetPlayerVehicleID(playerid), cash = LoadedTrash[vehicleid] * TRASH_BAG_VALUE;
		        format(string, sizeof(string), "TRASHMASTER: {FFFFFF}Sold {F39C12}%d {FFFFFF}bags of trash and earned {2ECC71}$%d.", LoadedTrash[vehicleid], cash);
		        SendClientMessage(playerid, COLOR_JOB, string);
		        GivePlayerMoneyEx(playerid, cash);
		        FactoryData[i][FactoryCurrent] += LoadedTrash[vehicleid];
		        LoadedTrash[vehicleid] = 0;
                Trash_ShowCapacity(playerid);
                format(string, sizeof(string), "Recycling Factory - %s\n\n{FFFFFF}Current Trash Bags: {F39C12}%d\n{FFFFFF}Bring trash here to earn money!", FactoryData[i][FactoryName], FactoryData[i][FactoryCurrent]);
                UpdateDynamic3DTextLabelText(FactoryData[i][FactoryLabel], 0x2ECC71FF, string);

		        for(new x; x < sizeof(FactoryData); x++)
				{
				    if(IsValidDynamicMapIcon(FactoryIcons[playerid][x]))
				    {
				        DestroyDynamicMapIcon(FactoryIcons[playerid][x]);
				        FactoryIcons[playerid][x] = -1;
				    }
					TogglePlayerDynamicCP(playerid, FactoryData[x][FactoryCP], 0);
				}

		        break;
		    }
		}
	}
	//electrican
	if(checkpointid == ElectricCP[playerid])
	{
	    GetPVarInt(playerid, "LastVehicleID");

		ApplyAnimation(playerid, "CARRY", "liftup105", 4.1, 0, 0, 0, 0, 0);
		SetPlayerAttachedObject(playerid, 9, 1264, 6, 0.222, 0.024, 0.128, 1.90, -90.0, 0.0, 0.5,0.5, 0.5);
		SCM(playerid, COLOR_JOB, "ELECTRICAN: {FFFFFF}Anda Mengambil Tangga.");
		DestroyDynamicCP(TrashCP[playerid]);
		return 1;
	}
	else if(checkpointid == StoremeatCP[playerid])
	{
	    if(!GetMeatBag[playerid]) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}You're not carrying a meat bag.");

	    if(StoreMeat[playerid] == 10) return Error(playerid, "You has store 10 meat!");

	    StoreMeat[playerid] += 2;
	    GetMeatBag[playerid] = false;
	    ApplyAnimation(playerid, "GRENADE", "WEAPON_throwu", 4.1, 0, 0, 0, 0, 0);
	    RemovePlayerAttachedObject(playerid, ATTACHMENT_INDEX);
		SendClientMessage(playerid, COLOR_JOB, "BUTCHER: {FFFFFF}You've stored a meat bag.");
				
		Info(playerid, "You Has Stored "RED_E"%d "WHITE_E"Meat", StoreMeat[playerid]);
		return 1;
	}
	else if(checkpointid == pData[playerid][LoadingPoint])
	{
	    if(GetPVarInt(playerid, "LoadingCooldown") > gettime()) return 1;
		new vehicleid = GetPVarInt(playerid, "LastVehicleID"), type[64], carid = -1;
		if(pData[playerid][CarryingLog] == 0)
		{
			type = "Metal";
		}
		else if(pData[playerid][CarryingLog] == 1)
		{
			type = "Coal";
		}
		else
		{
			type = "Unknown";
		}
		if(Vehicle_LogCount(vehicleid) >= LOG_LIMIT) return Error(playerid, "You can't load any more ores to this vehicle.");
		if((carid = Vehicle_Nearest2(playerid)) != -1)
		{
			if(pData[playerid][CarryingLog] == 0)
			{
				pvData[carid][cMetal] += 1;
			}
			else if(pData[playerid][CarryingLog] == 1)
			{
				pvData[carid][cCoal] += 1;
			}
		}
		LogStorage[vehicleid][ pData[playerid][CarryingLog] ]++;
		Info(playerid, "MINING: Loaded %s.", type);
		ApplyAnimation(playerid, "CARRY", "putdwn05", 4.1, 0, 1, 1, 0, 0, 1);
		Player_RemoveLog(playerid);
		return 1;
	}
	else if(checkpointid == ShowRoomCP)
	{
		ShowPlayerDialog(playerid, DIALOG_BUYPVCP, DIALOG_STYLE_LIST, "Showroom", "Bikes\nCars\nUnique Cars\nJob Cars", "Select", "Cancel");
	}
	else if(checkpointid == ShowRoomS)
	{
		ShowModelSelectionMenu(playerid, sportcar, "Sport Cars", 0x4A5A6BBB, 0x282828FF, 0x4A5A6BBB);
	}
	else if(checkpointid == ShowRoomCPRent)
	{
		ShowModelSelectionMenu(playerid, rentjoblist, "Rent JobsCar", 0x4A5A6BBB, 0x282828FF, 0x4A5A6BBB);
	}
	else if(checkpointid == BoatDealer)
	{
		ShowModelSelectionMenu(playerid, boatlist, "Buy Boat", 0x4A5A6BBB, 0x282828FF, 0x4A5A6BBB);
	}
	return 1;
}
}

public OnPlayerEnterRaceCheckpoint(playerid)
{
	//driving center
	new Float:Health;
    if(CPD[playerid] == 1)
	{
		GetVehicleHealth(GetPlayerVehicleID(playerid), Health);
		if(Health > 900)
		{
			DisablePlayerRaceCheckpoint(playerid);
			CPD[playerid] = 2;
			SetPlayerRaceCheckpoint(playerid, 0, 1972.9482, -1929.8557, 12.5739,1948.1033,-1930.6860,13.4751,5);
		}
		if(Health < 900)
		{
			DisablePlayerRaceCheckpoint(playerid);
			LicenseTest[playerid] = 0;
			CPD[playerid] = 0;
			SetVehicleToRespawn(GetPlayerVehicleID(playerid));
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Driving Center: Anda telah merusak kendaraan ini, oleh karena itu Anda gagal dalam pengujian. ");
		}
		return 1;
	}
	else if(CPD[playerid] == 2)
	{
		GetVehicleHealth(GetPlayerVehicleID(playerid), Health);
		if(Health > 900)
		{
			DisablePlayerRaceCheckpoint(playerid);
			CPD[playerid] = 3;
			SetPlayerRaceCheckpoint(playerid, 0, 1948.1033,-1930.6860,13.4751,1906.9967, -1930.0426, 12.5739,5);
		}
		if(Health < 900)
		{
			DisablePlayerRaceCheckpoint(playerid);
			LicenseTest[playerid] = 0;
			CPD[playerid] = 0;
			SetVehicleToRespawn(GetPlayerVehicleID(playerid));
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Driving Center: Anda telah merusak kendaraan ini, oleh karena itu Anda gagal dalam pengujian. ");
		}
		return 1;
	}
	else if(CPD[playerid] == 3)
	{
		GetVehicleHealth(GetPlayerVehicleID(playerid), Health);
		if(Health > 900)
		{
		    DisablePlayerRaceCheckpoint(playerid);
		    CPD[playerid] = 4;
			SetPlayerRaceCheckpoint(playerid, 0, 1906.9967, -1930.0426, 12.5739,1834.1765, -1929.9357, 12.5739,5);
		}
		if(Health < 900)
		{
			DisablePlayerRaceCheckpoint(playerid);
			LicenseTest[playerid] = 0;
			CPD[playerid] = 0;
			SetVehicleToRespawn(GetPlayerVehicleID(playerid));
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Driving Center: Anda telah merusak kendaraan ini, oleh karena itu Anda gagal dalam pengujian. ");
		}
		return 1;
	}
	else if(CPD[playerid] == 4)
	{
		GetVehicleHealth(GetPlayerVehicleID(playerid), Health);
		if(Health >= 950)
		{
		    DisablePlayerRaceCheckpoint(playerid);
		    CPD[playerid] = 5;
			SetPlayerRaceCheckpoint(playerid, 0, 1834.1765, -1929.9357, 12.5739,1823.9728, -1921.6290, 12.5739,5);
		}
		if(Health < 900)
		{
			DisablePlayerRaceCheckpoint(playerid);
			LicenseTest[playerid] = 0;
			CPD[playerid] = 0;
			SetVehicleToRespawn(GetPlayerVehicleID(playerid));
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Driving Center: Anda telah merusak kendaraan ini, oleh karena itu Anda gagal dalam pengujian. ");
		}
		return 1;
	}
	else if(CPD[playerid] == 5)
	{
		GetVehicleHealth(GetPlayerVehicleID(playerid), Health);
		if(Health > 900)
		{
		    DisablePlayerRaceCheckpoint(playerid);
		    CPD[playerid] = 6;
			SetPlayerRaceCheckpoint(playerid, 0, 1823.9728, -1921.6290, 12.5739,1823.7241, -1844.5658, 12.5739,5);
		}
		if(Health < 900)
		{
			DisablePlayerRaceCheckpoint(playerid);
			LicenseTest[playerid] = 0;
			CPD[playerid] = 0;
			SetVehicleToRespawn(GetPlayerVehicleID(playerid));
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Driving Center: Anda telah merusak kendaraan ini, oleh karena itu Anda gagal dalam pengujian. ");
		}
		return 1;
	}
	else if(CPD[playerid] == 6)
	{
		GetVehicleHealth(GetPlayerVehicleID(playerid), Health);
		if(Health > 900)
		{
		    DisablePlayerRaceCheckpoint(playerid);
		    CPD[playerid] = 7;
			SetPlayerRaceCheckpoint(playerid, 0, 1823.7241, -1844.5658, 12.5739,1809.9785, -1829.8235, 12.5739,5);
		}
		if(Health < 900)
		{
			DisablePlayerRaceCheckpoint(playerid);
			LicenseTest[playerid] = 0;
			CPD[playerid] = 0;
			SetVehicleToRespawn(GetPlayerVehicleID(playerid));
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Driving Center: Anda telah merusak kendaraan ini, oleh karena itu Anda gagal dalam pengujian. ");
		}
		return 1;
	}
	else if(CPD[playerid] == 7)
	{
		GetVehicleHealth(GetPlayerVehicleID(playerid), Health);
		if(Health > 900)
		{
		    DisablePlayerRaceCheckpoint(playerid);
		    CPD[playerid] = 9;
			SetPlayerRaceCheckpoint(playerid, 0, 1809.9785, -1829.8235, 12.5739,1766.6809, -1822.9556, 12.5739,5);
		}
		if(Health < 900)
		{
			DisablePlayerRaceCheckpoint(playerid);
			LicenseTest[playerid] = 0;
			CPD[playerid] = 0;
			SetVehicleToRespawn(GetPlayerVehicleID(playerid));
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Driving Center: Anda telah merusak kendaraan ini, oleh karena itu Anda gagal dalam pengujian. ");
		}
		return 1;
	}
	else if(CPD[playerid] == 9)
	{
		GetVehicleHealth(GetPlayerVehicleID(playerid), Health);
		if(Health > 900)
		{
		    DisablePlayerRaceCheckpoint(playerid);
		    CPD[playerid] = 10;
			SetPlayerRaceCheckpoint(playerid, 0, 1766.6809, -1822.9556, 12.5739,1700.6266, -1809.6973, 12.5739,5);
		}
		if(Health < 900)
		{
			DisablePlayerRaceCheckpoint(playerid);
			LicenseTest[playerid] = 0;
			CPD[playerid] = 0;
			SetVehicleToRespawn(GetPlayerVehicleID(playerid));
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Driving Center: Anda telah merusak kendaraan ini, oleh karena itu Anda gagal dalam pengujian. ");
		}
		return 1;
	}
	else if(CPD[playerid] == 10)
	{
		GetVehicleHealth(GetPlayerVehicleID(playerid), Health);
		if(Health > 900)
		{
		    DisablePlayerRaceCheckpoint(playerid);
		    CPD[playerid] = 11;
			SetPlayerRaceCheckpoint(playerid, 0, 1700.6266, -1809.6973, 12.5739,1691.8811, -1801.5286, 12.5739,5);
		}
		if(Health < 900)
		{
			DisablePlayerRaceCheckpoint(playerid);
			LicenseTest[playerid] = 0;
			CPD[playerid] = 0;
			SetVehicleToRespawn(GetPlayerVehicleID(playerid));
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Driving Center: Anda telah merusak kendaraan ini, oleh karena itu Anda gagal dalam pengujian. ");
		}
		return 1;
	}
	else if(CPD[playerid] == 11)
	{
		GetVehicleHealth(GetPlayerVehicleID(playerid), Health);
		if(Health > 900)
		{
		    DisablePlayerRaceCheckpoint(playerid);
		    CPD[playerid] = 12;
			SetPlayerRaceCheckpoint(playerid, 0, 1691.8811, -1801.5286, 12.5739,1691.7961, -1745.4752, 12.5739,5);
		}
		if(Health < 900)
		{
			DisablePlayerRaceCheckpoint(playerid);
			LicenseTest[playerid] = 0;
			CPD[playerid] = 0;
			SetVehicleToRespawn(GetPlayerVehicleID(playerid));
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Driving Center: Anda telah merusak kendaraan ini, oleh karena itu Anda gagal dalam pengujian. ");
		}
		return 1;
	}
	else if(CPD[playerid] == 12)
	{
		GetVehicleHealth(GetPlayerVehicleID(playerid), Health);
		if(Health > 900)
		{
		    DisablePlayerRaceCheckpoint(playerid);
		    CPD[playerid] = 13;
			SetPlayerRaceCheckpoint(playerid, 0, 1691.7961, -1745.4752, 12.5739,1691.8342, -1679.3737, 12.5739,5);
		}
		if(Health < 900)
		{
			DisablePlayerRaceCheckpoint(playerid);
			LicenseTest[playerid] = 0;
			CPD[playerid] = 0;
			SetVehicleToRespawn(GetPlayerVehicleID(playerid));
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Driving Center: Anda telah merusak kendaraan ini, oleh karena itu Anda gagal dalam pengujian. ");
		}
		return 1;
	}
	else if(CPD[playerid] == 13)
	{
		GetVehicleHealth(GetPlayerVehicleID(playerid), Health);
		if(Health > 900)
		{
		    DisablePlayerRaceCheckpoint(playerid);
		    CPD[playerid] = 15;
			SetPlayerRaceCheckpoint(playerid, 0, 1691.8342, -1679.3737, 12.5739,1691.7463, -1603.1737, 12.5739,5);
		}
		if(Health < 900)
		{
			DisablePlayerRaceCheckpoint(playerid);
			LicenseTest[playerid] = 0;
			CPD[playerid] = 0;
			SetVehicleToRespawn(GetPlayerVehicleID(playerid));
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Driving Center: Anda telah merusak kendaraan ini, oleh karena itu Anda gagal dalam pengujian. ");
		}
		return 1;
	}
	else if(CPD[playerid] == 15)
	{
		GetVehicleHealth(GetPlayerVehicleID(playerid), Health);
		if(Health > 900)
		{
		    DisablePlayerRaceCheckpoint(playerid);
		    CPD[playerid] = 16;
			SetPlayerRaceCheckpoint(playerid, 0, 1691.7463, -1603.1737, 12.5739,1699.5380, -1594.7327, 12.5739,5);
		}
		if(Health < 900)
		{
			DisablePlayerRaceCheckpoint(playerid);
			LicenseTest[playerid] = 0;
			CPD[playerid] = 0;
			SetVehicleToRespawn(GetPlayerVehicleID(playerid));
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Driving Center: Anda telah merusak kendaraan ini, oleh karena itu Anda gagal dalam pengujian. ");
		}
		return 1;
	}
	else if(CPD[playerid] == 16)
	{
		GetVehicleHealth(GetPlayerVehicleID(playerid), Health);
		if(Health > 900)
		{
		    DisablePlayerRaceCheckpoint(playerid);
		    CPD[playerid] = 17;
			SetPlayerRaceCheckpoint(playerid, 0, 1699.5380, -1594.7327, 12.5739,1738.8302, -1600.2924, 12.5739,5);
		}
		if(Health < 900)
		{
			DisablePlayerRaceCheckpoint(playerid);
			LicenseTest[playerid] = 0;
			CPD[playerid] = 0;
			SetVehicleToRespawn(GetPlayerVehicleID(playerid));
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Driving Center: Anda telah merusak kendaraan ini, oleh karena itu Anda gagal dalam pengujian. ");
		}
		return 1;
	}
	else if(CPD[playerid] == 17)
	{
		GetVehicleHealth(GetPlayerVehicleID(playerid), Health);
		if(Health > 900)
		{
		    DisablePlayerRaceCheckpoint(playerid);
		    CPD[playerid] = 18;
			SetPlayerRaceCheckpoint(playerid, 0, 1738.8302, -1600.2924, 12.5739,1809.6837, -1614.3446, 12.5739,5);
		}
		if(Health < 900)
		{
			DisablePlayerRaceCheckpoint(playerid);
			LicenseTest[playerid] = 0;
			CPD[playerid] = 0;
			SetVehicleToRespawn(GetPlayerVehicleID(playerid));
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Driving Center: Anda telah merusak kendaraan ini, oleh karena itu Anda gagal dalam pengujian. ");
		}
		return 1;
	}
	else if(CPD[playerid] == 18)
	{
		GetVehicleHealth(GetPlayerVehicleID(playerid), Health);
		if(Health > 900)
		{
		    DisablePlayerRaceCheckpoint(playerid);
		    CPD[playerid] = 19;
			SetPlayerRaceCheckpoint(playerid, 0, 1809.6837, -1614.3446, 12.5739,1929.3334, -1615.0773, 12.5739,5);
		}
		if(Health < 900)
		{
			DisablePlayerRaceCheckpoint(playerid);
			LicenseTest[playerid] = 0;
			CPD[playerid] = 0;
			SetVehicleToRespawn(GetPlayerVehicleID(playerid));
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Driving Center: Anda telah merusak kendaraan ini, oleh karena itu Anda gagal dalam pengujian. ");
		}
		return 1;
	}
	else if(CPD[playerid] == 19)
	{
		GetVehicleHealth(GetPlayerVehicleID(playerid), Health);
		if(Health > 900)
		{
		    DisablePlayerRaceCheckpoint(playerid);
		    CPD[playerid] = 20;
			SetPlayerRaceCheckpoint(playerid, 0, 1929.3334, -1615.0773, 12.5739,1939.0790, -1622.0118, 12.5739,5);
		}
		if(Health < 900)
		{
			DisablePlayerRaceCheckpoint(playerid);
			LicenseTest[playerid] = 0;
			CPD[playerid] = 0;
			SetVehicleToRespawn(GetPlayerVehicleID(playerid));
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Driving Center: Anda telah merusak kendaraan ini, oleh karena itu Anda gagal dalam pengujian. ");
		}
		return 1;
	}
	else if(CPD[playerid] == 20)
	{
		GetVehicleHealth(GetPlayerVehicleID(playerid), Health);
		if(Health > 900)
		{
		    DisablePlayerRaceCheckpoint(playerid);
		    CPD[playerid] = 21;
			SetPlayerRaceCheckpoint(playerid, 0, 1939.0790, -1622.0118, 12.5739,1939.3633, -1738.4812, 12.5739,5);
		}
		if(Health < 900)
		{
			DisablePlayerRaceCheckpoint(playerid);
			LicenseTest[playerid] = 0;
			CPD[playerid] = 0;
			SetVehicleToRespawn(GetPlayerVehicleID(playerid));
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Driving Center: Anda telah merusak kendaraan ini, oleh karena itu Anda gagal dalam pengujian. ");
		}
		return 1;
	}
	else if(CPD[playerid] == 21)
	{
		GetVehicleHealth(GetPlayerVehicleID(playerid), Health);
		if(Health > 900)
		{
		    DisablePlayerRaceCheckpoint(playerid);
		    CPD[playerid] = 22;
			SetPlayerRaceCheckpoint(playerid, 0, 1939.3633, -1738.4812, 12.5739,1952.4625, -1754.5654, 12.5739,5);
		}
		if(Health < 900)
		{
			DisablePlayerRaceCheckpoint(playerid);
			LicenseTest[playerid] = 0;
			CPD[playerid] = 0;
			SetVehicleToRespawn(GetPlayerVehicleID(playerid));
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Driving Center: Anda telah merusak kendaraan ini, oleh karena itu Anda gagal dalam pengujian. ");
		}
		return 1;
	}
	else if(CPD[playerid] == 22)
	{
		GetVehicleHealth(GetPlayerVehicleID(playerid), Health);
		if(Health > 900)
		{
		    DisablePlayerRaceCheckpoint(playerid);
		    CPD[playerid] = 23;
			SetPlayerRaceCheckpoint(playerid, 0, 1952.4625, -1754.5654, 12.5739,1988.9359, -1754.5220, 12.5739,5);
		}
		if(Health < 900)
		{
			DisablePlayerRaceCheckpoint(playerid);
			LicenseTest[playerid] = 0;
			CPD[playerid] = 0;
			SetVehicleToRespawn(GetPlayerVehicleID(playerid));
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Driving Center: Anda telah merusak kendaraan ini, oleh karena itu Anda gagal dalam pengujian. ");
		}
		return 1;
	}
	else if(CPD[playerid] == 23)
 	{
		GetVehicleHealth(GetPlayerVehicleID(playerid), Health);
		if(Health > 900)
		{
		    DisablePlayerRaceCheckpoint(playerid);
		    CPD[playerid] = 24;
			SetPlayerRaceCheckpoint(playerid, 0, 1988.9359, -1754.5220, 12.5739,2079.5874, -1754.7408, 12.5739,5);
		}
		if(Health < 900)
		{
			DisablePlayerRaceCheckpoint(playerid);
			LicenseTest[playerid] = 0;
			CPD[playerid] = 0;
			SetVehicleToRespawn(GetPlayerVehicleID(playerid));
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Driving Center: Anda telah merusak kendaraan ini, oleh karena itu Anda gagal dalam pengujian. ");
		}
		return 1;
	}
	else if(CPD[playerid] == 24)
	{
		GetVehicleHealth(GetPlayerVehicleID(playerid), Health);
		if(Health > 900)
		{
		    DisablePlayerRaceCheckpoint(playerid);
		    CPD[playerid] = 25;
			SetPlayerRaceCheckpoint(playerid, 0, 2079.5874, -1754.7408, 12.5739,2087.1904, -1762.3777, 12.5739,5);
		}
		if(Health < 900)
		{
			DisablePlayerRaceCheckpoint(playerid);
			LicenseTest[playerid] = 0;
			CPD[playerid] = 0;
			SetVehicleToRespawn(GetPlayerVehicleID(playerid));
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Driving Center: Anda telah merusak kendaraan ini, oleh karena itu Anda gagal dalam pengujian. ");
		}
		return 1;
	}
	else if(CPD[playerid] == 25)
	{
		GetVehicleHealth(GetPlayerVehicleID(playerid), Health);
		if(Health > 900)
		{
		    DisablePlayerRaceCheckpoint(playerid);
		    CPD[playerid] = 26;
			SetPlayerRaceCheckpoint(playerid, 0, 2087.1904, -1762.3777, 12.5739,2079.6643, -1797.5828, 12.5739,5);
		}
		if(Health < 900)
		{
			DisablePlayerRaceCheckpoint(playerid);
			LicenseTest[playerid] = 0;
			CPD[playerid] = 0;
			SetVehicleToRespawn(GetPlayerVehicleID(playerid));
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Driving Center: Anda telah merusak kendaraan ini, oleh karena itu Anda gagal dalam pengujian. ");
		}
		return 1;
	}
	else if(CPD[playerid] == 26)
	{
		GetVehicleHealth(GetPlayerVehicleID(playerid), Health);
		if(Health > 900)
		{
		    DisablePlayerRaceCheckpoint(playerid);
		    CPD[playerid] = 27;
			SetPlayerRaceCheckpoint(playerid, 0, 2079.6643, -1797.5828, 12.5739,2079.6372, -1886.3774, 12.5739,5);
		}
		if(Health < 900)
		{
			DisablePlayerRaceCheckpoint(playerid);
			LicenseTest[playerid] = 0;
			CPD[playerid] = 0;
			SetVehicleToRespawn(GetPlayerVehicleID(playerid));
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Driving Center: Anda telah merusak kendaraan ini, oleh karena itu Anda gagal dalam pengujian. ");
		}
		return 1;
	}
	else if(CPD[playerid] == 27)
	{
		GetVehicleHealth(GetPlayerVehicleID(playerid), Health);
		if(Health > 900)
		{
		    DisablePlayerRaceCheckpoint(playerid);
		    CPD[playerid] = 28;
			SetPlayerRaceCheckpoint(playerid, 0, 2079.6372, -1886.3774, 12.5739,2073.5535, -1909.7695, 12.5739,5);
		}
		if(Health < 900)
		{
			DisablePlayerRaceCheckpoint(playerid);
			LicenseTest[playerid] = 0;
			CPD[playerid] = 0;
			SetVehicleToRespawn(GetPlayerVehicleID(playerid));
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Driving Center: Anda telah merusak kendaraan ini, oleh karena itu Anda gagal dalam pengujian. ");
		}
		return 1;
	}
	else if(CPD[playerid] == 28)
	{
		GetVehicleHealth(GetPlayerVehicleID(playerid), Health);
		if(Health > 900)
		{
		    DisablePlayerRaceCheckpoint(playerid);
		    CPD[playerid] = 29;
			SetPlayerRaceCheckpoint(playerid, 0, 2073.5535, -1909.7695, 12.5739,2073.5535, -1909.7695, 12.5739,5);
		}
		if(Health < 900)
		{
			DisablePlayerRaceCheckpoint(playerid);
			LicenseTest[playerid] = 0;
			CPD[playerid] = 0;
			SetVehicleToRespawn(GetPlayerVehicleID(playerid));
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Driving Center: Anda telah merusak kendaraan ini, oleh karena itu Anda gagal dalam pengujian. ");
		}
		return 1;
	}
	else if(CPD[playerid] == 29)
	{
		GetVehicleHealth(GetPlayerVehicleID(playerid), Health);
		if(Health > 900)
		{
		    DisablePlayerRaceCheckpoint(playerid);
		    CPD[playerid] = 30;
			SetPlayerRaceCheckpoint(playerid, 0, 2073.5535, -1909.7695, 12.5739,2066.9595, -1914.0358, 12.5739,5);
		}
		if(Health < 900)
		{
			DisablePlayerRaceCheckpoint(playerid);
			LicenseTest[playerid] = 0;
			CPD[playerid] = 0;
			SetVehicleToRespawn(GetPlayerVehicleID(playerid));
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Driving Center: Anda telah merusak kendaraan ini, oleh karena itu Anda gagal dalam pengujian. ");
		}
		return 1;
	}
	else if(CPD[playerid] == 30)
	{
		GetVehicleHealth(GetPlayerVehicleID(playerid), Health);
		if(Health > 900)
		{
		    DisablePlayerRaceCheckpoint(playerid);
		    CPD[playerid] = 31;
			SetPlayerRaceCheckpoint(playerid, 0, 2066.9595, -1914.0358, 12.5739,2065.4746, -1919.7954, 12.5739,5);
		}
		if(Health < 900)
		{
			DisablePlayerRaceCheckpoint(playerid);
			LicenseTest[playerid] = 0;
			CPD[playerid] = 0;
			SetVehicleToRespawn(GetPlayerVehicleID(playerid));
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Driving Center: Anda telah merusak kendaraan ini, oleh karena itu Anda gagal dalam pengujian. ");
		}
		return 1;
	}
	else if(CPD[playerid] == 31)
	{
		GetVehicleHealth(GetPlayerVehicleID(playerid), Health);
		if(Health > 900)
		{
		    DisablePlayerRaceCheckpoint(playerid);
		    CPD[playerid] = 32;
			SetPlayerRaceCheckpoint(playerid, 1, 2065.4746, -1919.7954, 12.5739,2065.4746, -1919.7954, 12.5739,5);
		}
		if(Health < 900)
		{
			DisablePlayerRaceCheckpoint(playerid);
			LicenseTest[playerid] = 0;
			CPD[playerid] = 0;
			SetVehicleToRespawn(GetPlayerVehicleID(playerid));
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Driving Center: Anda telah merusak kendaraan ini, oleh karena itu Anda gagal dalam pengujian. ");
		}
		return 1;
	}
	else if(CPD[playerid] == 32)
	{
		GetVehicleHealth(GetPlayerVehicleID(playerid), Health);
		if(Health > 900)
		{
			DisablePlayerRaceCheckpoint(playerid);
			pData[playerid][pDriveLic] = 1;
			pData[playerid][pDriveLicTime] = gettime() + (15 * 86400);
			LicenseTest[playerid] = 0;
			CPD[playerid] = 0;
			new sext[40], mstr[128];
			if(pData[playerid][pGender] == 1) { sext = "Laki-Laki"; } else { sext = "Perempuan"; }
			format(mstr, sizeof(mstr), "{FFFFFF}Nama: %s\nNegara: San Andreas\nTgl Lahir: %s\nJenis Kelamin: %s\nBerlaku hingga 14 hari!", pData[playerid][pName], pData[playerid][pAge], sext);
			ShowPlayerDialog(playerid, DIALOG_UNUSED, DIALOG_STYLE_MSGBOX, "Driving License", mstr, "Tutup", "");
			SetVehicleToRespawn(GetPlayerVehicleID(playerid));
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Driving Center: You have successfully passed the test and received your license.");
		}
		if(Health < 900)
		{
			DisablePlayerRaceCheckpoint(playerid);
			LicenseTest[playerid] = 0;
			CPD[playerid] = 0;
			SetVehicleToRespawn(GetPlayerVehicleID(playerid));
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Driving Center: Anda telah merusak kendaraan ini, oleh karena itu Anda gagal dalam pengujian. ");
		}
		return 1;
	}
	for(new i; i <= 3; i++) // 3 = Total Dialog , Jadi kita mau tau kalau Player Ini Apakah Ambil Dialog dari 3 tersebut apa ga !
	{
		if(BusSteps[playerid][i] > 0)
		{
		    if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 431)
		    {
			 	if(IsPlayerInAnyVehicle(playerid))
				{
				    if(BusSteps[playerid][0] == 2)
				    {
				        DisablePlayerRaceCheckpoint(playerid);
				        ////GivePlayerCash(playerid, 15);
				        BusSteps[playerid][0] = 3;
				        SetPlayerRaceCheckpoint(playerid, 0, 1655.8779,-1580.8289,13.4839, 1325.0560,-1569.7898,13.4628, 5);
				        return 1;
				    }
				    else if(BusSteps[playerid][0] == 3)
				    {
				        DisablePlayerRaceCheckpoint(playerid);
				        ////GivePlayerCash(playerid, 20);
				        BusSteps[playerid][0] = 4;
				        SetPlayerRaceCheckpoint(playerid, 0, 1325.0560,-1569.7898,13.4628,1359.4424,-1422.9174,13.4767, 5);
				        return 1;
				    }
				    else if(BusSteps[playerid][0] == 4)
				    {
				        DisablePlayerRaceCheckpoint(playerid);
				        //GivePlayerCash(playerid, 100);
				        BusSteps[playerid][0] = 5;
				        SetPlayerRaceCheckpoint(playerid, 0, 1359.4424,-1422.9174,13.4767,1338.3066,-1394.7805,13.4779, 5);
				        return 1;
				    }
				    else if(BusSteps[playerid][0] == 5)
				    {
				        DisablePlayerRaceCheckpoint(playerid);
				        //GivePlayerCash(playerid, 70);
				        BusSteps[playerid][0] = 6;
				        SetPlayerRaceCheckpoint(playerid, 0, 1338.3066,-1394.7805,13.4779,651.5914,-1393.6437,13.5422, 5);
				        return 1;
				    }
				    else if(BusSteps[playerid][0] == 6)
				    {
				        DisablePlayerRaceCheckpoint(playerid);
				        //GivePlayerCash(playerid, 5);
				        BusSteps[playerid][0] = 7;
				        SetPlayerRaceCheckpoint(playerid, 0, 651.5914,-1393.6437,13.5422,539.4284,-1405.4429,15.7669, 5);
				        return 1;
				    }
				    else if(BusSteps[playerid][0] == 7)
				    {
				        DisablePlayerRaceCheckpoint(playerid);
				        //GivePlayerCash(playerid, 300);
				        BusSteps[playerid][0] = 8;
				        SetPlayerRaceCheckpoint(playerid, 0, 539.4284,-1405.4429,15.7669,492.0627,-1309.9187,15.7158, 5);
				        return 1;
				    }
				    else if(BusSteps[playerid][0] == 8)
				    {
				        DisablePlayerRaceCheckpoint(playerid);
				        //GivePlayerCash(playerid, 129);
				        BusSteps[playerid][0] = 9;
				        SetPlayerRaceCheckpoint(playerid, 0, 492.0627,-1309.9187,15.7158,153.1991,-1545.3175,10.5614, 5);
				        return 1;
				    }
				    else if(BusSteps[playerid][0] == 9)
				    {
				        DisablePlayerRaceCheckpoint(playerid);
				        //GivePlayerCash(playerid, 90);
				        BusSteps[playerid][0] = 10;
				        SetPlayerRaceCheckpoint(playerid, 0, 153.1991,-1545.3175,10.5614,373.0657,-1720.0210,7.2636, 5);
				        return 1;
				    }
				    else if(BusSteps[playerid][0] == 10)
				    {
				        DisablePlayerRaceCheckpoint(playerid);
				        //GivePlayerCash(playerid, 250);
				        BusSteps[playerid][0] = 11;
				        SetPlayerRaceCheckpoint(playerid, 0, 373.0657,-1720.0210,7.2636,1001.7006,-1809.3325,14.1462, 5);
				        return 1;
				    }
				    else if(BusSteps[playerid][0] == 11)
				    {
				        DisablePlayerRaceCheckpoint(playerid);
				        //GivePlayerCash(playerid, 200);
				        BusSteps[playerid][0] = 12;
				        SetPlayerRaceCheckpoint(playerid, 0, 1001.7006,-1809.3325,14.1462, 1017.2707,-2218.5603,13.0459, 5);
				        return 1;
				    }
				    else if(BusSteps[playerid][0] == 12)
				    {
				        DisablePlayerRaceCheckpoint(playerid);
				        //GivePlayerCash(playerid, 20);
				        BusSteps[playerid][0] = 13;
				        SetPlayerRaceCheckpoint(playerid, 0, 1017.2707,-2218.5603,13.0459,1312.3700,-2467.7739,7.7606, 5);
				        return 1;
				    }
				    else if(BusSteps[playerid][0] == 13)
				    {
				        DisablePlayerRaceCheckpoint(playerid);
				        //GivePlayerCash(playerid, 100);
				        BusSteps[playerid][0] = 14;
				        SetPlayerRaceCheckpoint(playerid, 0, 1312.3700,-2467.7739,7.7606,1443.5225,-2683.4890,13.4660, 5);
				        return 1;
				    }
				    else if(BusSteps[playerid][0] == 14)
				    {
				        DisablePlayerRaceCheckpoint(playerid);
				        //GivePlayerCash(playerid, 100);
				        BusSteps[playerid][0] = 15;
				        SetPlayerRaceCheckpoint(playerid, 0, 1443.5225,-2683.4890,13.4660,2167.0093,-2614.6147,13.4766, 5);
				        return 1;
				    }
				    else if(BusSteps[playerid][0] == 15)
				    {
				        DisablePlayerRaceCheckpoint(playerid);
				        //GivePlayerCash(playerid, 100);
				        BusSteps[playerid][0] = 16;
				        SetPlayerRaceCheckpoint(playerid, 1, 2167.0093,-2614.6147,13.4766,2297.5007,-2281.6836,13.4911, 5);
				        return 1;
				    }
				    else if(BusSteps[playerid][0] == 16)
				    {
				        DisablePlayerRaceCheckpoint(playerid);
				        //GivePlayerCash(playerid, 100);
				        BusSteps[playerid][0] = 17;
				        SetPlayerRaceCheckpoint(playerid, 1, 2297.5007,-2281.6836,13.4911,2245.5674,-2207.3191,13.4066, 5);
				        return 1;
				    }
				    else if(BusSteps[playerid][0] == 17)
				    {
				        DisablePlayerRaceCheckpoint(playerid);
				        //GivePlayerCash(playerid, 100);
				        BusSteps[playerid][0] = 18;
				        SetPlayerRaceCheckpoint(playerid, 1, 2245.5674,-2207.3191,13.4066,1978.5647,-2107.1409,13.4477, 5);
				        return 1;
				    }
				    else if(BusSteps[playerid][0] == 18)
				    {
				        DisablePlayerRaceCheckpoint(playerid);
				        //GivePlayerCash(playerid, 100);
				        BusSteps[playerid][0] = 19;
				        SetPlayerRaceCheckpoint(playerid, 1, 1978.5647,-2107.1409,13.4477,1964.9993,-1764.2311,13.4818, 5);
				        return 1;
				    }
				    else if(BusSteps[playerid][0] == 19)
				    {
				        DisablePlayerRaceCheckpoint(playerid);
				        //GivePlayerCash(playerid, 100);
				        BusSteps[playerid][0] = 20;
				        SetPlayerRaceCheckpoint(playerid, 1, 1964.9993,-1764.2311,13.4818,1835.2019,-1750.1224,13.4855, 5);
				        return 1;
				    }
				    else if(BusSteps[playerid][0] == 20)
				    {
				        DisablePlayerRaceCheckpoint(playerid);
				        //GivePlayerCash(playerid, 100);
				        BusSteps[playerid][0] = 21;
				        SetPlayerRaceCheckpoint(playerid, 1, 1835.2019,-1750.1224,13.4855,1824.7201,-1625.2925,13.4876, 5);
				        return 1;
				    }
				    else if(BusSteps[playerid][0] == 21)
				    {
				        DisablePlayerRaceCheckpoint(playerid);
				        //GivePlayerCash(playerid, 100);
				        BusSteps[playerid][0] = 22;
				        SetPlayerRaceCheckpoint(playerid, 1, 1824.7201,-1625.2925,13.4876,1668.9048,-1590.1837,13.4715, 5);
				        return 1;
				    }
				    else if(BusSteps[playerid][0] == 22)
				    {
				        DisablePlayerRaceCheckpoint(playerid);
				        //GivePlayerCash(playerid, 100);
				        BusSteps[playerid][0] = 23;
				        SetPlayerRaceCheckpoint(playerid, 1, 1668.9048,-1590.1837,13.4715,1662.6278,-1552.6962,13.4833, 5);
				        return 1;
				    }
				    else if(BusSteps[playerid][0] == 23)
				    {
				        DisablePlayerRaceCheckpoint(playerid);
				        //GivePlayerCash(playerid, 100);
				        BusSteps[playerid][0] = 24;
				        SetPlayerRaceCheckpoint(playerid, 1, 1662.6278,-1552.6962,13.4833,1686.7153,-1551.0281,13.4776, 5);
				        return 1;
				    }
				    else if(BusSteps[playerid][0] == 24)
				    {
				        DisablePlayerRaceCheckpoint(playerid);
				        //GivePlayerCash(playerid, 100);
				        BusSteps[playerid][0] = 25;
				        SetPlayerRaceCheckpoint(playerid, 1, 1686.7153,-1551.0281,13.4776,1673.5162,-1477.9034,13.4807, 5);
				        return 1;
				    }
				    else if(BusSteps[playerid][0] == 25)
				    {
				        BusSteps[playerid][0] = 0;
				        DialogBus[0] = false; // Dialog 0 telah di pilih
			    		DialogSaya[playerid][0] = false;
						SendClientMessageEx(playerid, COLOR_ARWIN, "SIDEJOBINFO: {FFFFFF}Gaji Sudah di masukin ke salary cek /mysalary");
						//PlayerInfo[playerid][pPayCheck] += 10000;
						AddPlayerSalary(playerid, "Sidejob(Bus)", 6000);
				        PlayerInfo[playerid][pBusTime] = 1800;
				        DisablePlayerRaceCheckpoint(playerid);
				        SetVehicleToRespawn(GetPlayerVehicleID(playerid));
				        return 1;
			   		}
				    else if(BusSteps[playerid][1] == 6)
				    {
				        DisablePlayerRaceCheckpoint(playerid);
				        //GivePlayerCash(playerid, 5);
				        BusSteps[playerid][1] = 7;
				        SetPlayerRaceCheckpoint(playerid, 0, 1655.4309,-1578.8663,13.4876,1675.6584,-1594.5546,13.4830, 5);
				        return 1;
				    }
				    else if(BusSteps[playerid][1] == 7)
				    {
				        DisablePlayerRaceCheckpoint(playerid);
				        //GivePlayerCash(playerid, 300);
				        BusSteps[playerid][1] = 8;
				        SetPlayerRaceCheckpoint(playerid, 0, 1675.6584,-1594.5546,13.4830,1808.3151,-1614.4534,13.4606, 5);
				        return 1;
				    }
				    else if(BusSteps[playerid][1] == 8)
				    {
				        DisablePlayerRaceCheckpoint(playerid);
				        //GivePlayerCash(playerid, 129);
				        BusSteps[playerid][1] = 9;
				        SetPlayerRaceCheckpoint(playerid, 0, 1808.3151,-1614.4534,13.4606,1822.1866,-1602.4225,13.4650, 5);
				        return 1;
				    }
				    else if(BusSteps[playerid][1] == 9)
				    {
				        DisablePlayerRaceCheckpoint(playerid);
				        //GivePlayerCash(playerid, 90);
				        BusSteps[playerid][1] = 10;
				        SetPlayerRaceCheckpoint(playerid, 0, 1822.1866,-1602.4225,13.4650,1852.0515,-1477.0760,13.4892, 5);
				        return 1;
				    }
				    else if(BusSteps[playerid][1] == 10)
				    {
				        DisablePlayerRaceCheckpoint(playerid);
				        //GivePlayerCash(playerid, 250);
				        BusSteps[playerid][1] = 11;
				        SetPlayerRaceCheckpoint(playerid, 0, 1852.0515,-1477.0760,13.4892,1976.1843,-1468.7709,13.4898, 5);
				        return 1;
				    }
				    else if(BusSteps[playerid][1] == 11)
				    {
				        DisablePlayerRaceCheckpoint(playerid);
				        //GivePlayerCash(playerid, 200);
				        BusSteps[playerid][1] = 12;
				        SetPlayerRaceCheckpoint(playerid, 0, 1976.1843,-1468.7709,13.4898, 1988.9058,-1453.9619,13.4881, 5);
				        return 1;
				    }
				    else if(BusSteps[playerid][1] == 12)
				    {
				        DisablePlayerRaceCheckpoint(playerid);
				        //GivePlayerCash(playerid, 20);
				        BusSteps[playerid][1] = 13;
				        SetPlayerRaceCheckpoint(playerid, 0, 1988.9058,-1453.9619,13.4881,1989.5841,-1354.7592,23.8970, 5);
				        return 1;
				    }
				    else if(BusSteps[playerid][1] == 13)
				    {
				        DisablePlayerRaceCheckpoint(playerid);
				        //GivePlayerCash(playerid, 100);
				        BusSteps[playerid][1] = 14;
				        SetPlayerRaceCheckpoint(playerid, 0, 1989.5841,-1354.7592,23.8970,2055.3843,-1343.6346,23.9209, 5);
				        return 1;
				    }
				    else if(BusSteps[playerid][1] == 14)
				    {
				        DisablePlayerRaceCheckpoint(playerid);
				        //GivePlayerCash(playerid, 100);
				        BusSteps[playerid][1] = 15;
				        SetPlayerRaceCheckpoint(playerid, 0, 2055.3843,-1343.6346,23.9209,2073.3601,-1237.0232,23.9111, 5);
				        return 1;
				    }
				    else if(BusSteps[playerid][1] == 15)
				    {
				        DisablePlayerRaceCheckpoint(playerid);
				        //GivePlayerCash(playerid, 100);
				        BusSteps[playerid][1] = 16;
				        SetPlayerRaceCheckpoint(playerid, 0, 2073.3601,-1237.0232,23.9111,2074.4985,-1106.5936,24.7291, 5);
				        return 1;
				    }
				    else if(BusSteps[playerid][1] == 16)
				    {
				        DisablePlayerRaceCheckpoint(playerid);
				        //GivePlayerCash(playerid, 100);
				        BusSteps[playerid][1] = 17;
				        SetPlayerRaceCheckpoint(playerid, 0, 2074.4985,-1106.5936,24.7291,1995.6899,-1054.9963,24.5139, 5);
				        return 1;
				    }
				    else if(BusSteps[playerid][1] == 17)
				    {
				        DisablePlayerRaceCheckpoint(playerid);
				        //GivePlayerCash(playerid, 100);
				        BusSteps[playerid][1] = 18;
				        SetPlayerRaceCheckpoint(playerid, 0, 1995.6899,-1054.9963,24.5139,1867.9518,-1058.5884,23.7857, 5);
				        return 1;
				    }
				    else if(BusSteps[playerid][1] == 18)
				    {
				        DisablePlayerRaceCheckpoint(playerid);
				        //GivePlayerCash(playerid, 100);
				        BusSteps[playerid][1] = 19;
				        SetPlayerRaceCheckpoint(playerid, 0, 1867.9518,-1058.5884,23.7857,1863.6049,-1169.5271,23.7625, 5);
				        return 1;
				    }
				    else if(BusSteps[playerid][1] == 19)
				    {
				        DisablePlayerRaceCheckpoint(playerid);
				        //GivePlayerCash(playerid, 100);
				        BusSteps[playerid][1] = 20;
				        SetPlayerRaceCheckpoint(playerid, 0, 1863.6049,-1169.5271,23.7625,1657.9583,-1157.8536,23.8513, 5);
				        return 1;
				    }
				    else if(BusSteps[playerid][1] == 20)
				    {
				        DisablePlayerRaceCheckpoint(playerid);
				        //GivePlayerCash(playerid, 100);
				        BusSteps[playerid][1] = 21;
				        SetPlayerRaceCheckpoint(playerid, 0, 1657.9583,-1157.8536,23.8513,1592.6194,-1159.1958,24.0051, 5);
				        return 1;
				    }
				    else if(BusSteps[playerid][1] == 21)
				    {
				        DisablePlayerRaceCheckpoint(playerid);
				        //GivePlayerCash(playerid, 100);
				        BusSteps[playerid][1] = 22;
				        SetPlayerRaceCheckpoint(playerid, 0, 1592.6194,-1159.1958,24.0051,1549.6796,-1055.4402,23.7095, 5);
				        return 1;
				    }
				    else if(BusSteps[playerid][1] == 22)
				    {
				        DisablePlayerRaceCheckpoint(playerid);
				        //GivePlayerCash(playerid, 100);
				        BusSteps[playerid][1] = 23;
				        SetPlayerRaceCheckpoint(playerid, 0, 1549.6796,-1055.4402,23.7095,1458.6635,-1030.3673,23.7568, 5);
				        return 1;
				    }
				    else if(BusSteps[playerid][1] == 23)
				    {
				        DisablePlayerRaceCheckpoint(playerid);
				        //GivePlayerCash(playerid, 100);
				        BusSteps[playerid][1] = 24;
				        SetPlayerRaceCheckpoint(playerid, 0, 1458.6635,-1030.3673,23.7568,1383.3145,-1032.3024,26.1900, 5);
				        return 1;
				    }
				    else if(BusSteps[playerid][1] == 24)
				    {
				        DisablePlayerRaceCheckpoint(playerid);
				        //GivePlayerCash(playerid, 100);
				        BusSteps[playerid][1] = 25;
				        SetPlayerRaceCheckpoint(playerid, 0, 1383.3145,-1032.3024,26.1900,1355.6470,-1045.0482,26.4642, 5);
				        return 1;
				    }
				    else if(BusSteps[playerid][1] == 25)
				    {
				        DisablePlayerRaceCheckpoint(playerid);
				        //GivePlayerCash(playerid, 100);
				        BusSteps[playerid][1] = 26;
				        SetPlayerRaceCheckpoint(playerid, 0, 1355.6470,-1045.0482,26.4642,1340.4150,-1127.6436,23.7744, 5);
				        return 1;
				    }
				    else if(BusSteps[playerid][1] == 26)
				    {
				        DisablePlayerRaceCheckpoint(playerid);
				        //GivePlayerCash(playerid, 100);
				        BusSteps[playerid][1] = 27;
				        SetPlayerRaceCheckpoint(playerid, 0, 1340.4150,-1127.6436,23.7744,1340.1676,-1379.0829,13.5948, 5);
				        return 1;
				    }
				    else if(BusSteps[playerid][1] == 27)
				    {
				        DisablePlayerRaceCheckpoint(playerid);
				        //GivePlayerCash(playerid, 100);
				        BusSteps[playerid][1] = 28;
				        SetPlayerRaceCheckpoint(playerid, 0, 1340.1676,-1379.0829,13.5948,1363.4252,-1405.9730,13.4503, 5);
				        return 1;
				    }
				    else if(BusSteps[playerid][1] == 28)
				    {
				        DisablePlayerRaceCheckpoint(playerid);
				        //GivePlayerCash(playerid, 100);
				        BusSteps[playerid][1] = 29;
				        SetPlayerRaceCheckpoint(playerid, 0, 1363.4252,-1405.9730,13.4503,1393.6683,-1430.9860,13.5163, 5);
				        return 1;
				    }
				    else if(BusSteps[playerid][1] == 29)
				    {
				        DisablePlayerRaceCheckpoint(playerid);
				        //GivePlayerCash(playerid, 100);
				        BusSteps[playerid][1] = 30;
				        SetPlayerRaceCheckpoint(playerid, 0, 1393.6683,-1430.9860,13.5163,1640.2510,-1443.0830,13.4826, 5);
				        return 1;
				    }
				    else if(BusSteps[playerid][1] == 30)
				    {
				        DisablePlayerRaceCheckpoint(playerid);
				        //GivePlayerCash(playerid, 100);
				        BusSteps[playerid][1] = 31;
				        SetPlayerRaceCheckpoint(playerid, 0, 1640.2510,-1443.0830,13.4826,1654.4456,-1539.0234,13.4815, 5);
				        return 1;
				    }
				    else if(BusSteps[playerid][1] == 31)
				    {
				        DisablePlayerRaceCheckpoint(playerid);
				        //GivePlayerCash(playerid, 100);
				        BusSteps[playerid][1] = 32;
				        SetPlayerRaceCheckpoint(playerid, 1, 1654.4456,-1539.0234,13.4815,1685.5889,-1550.3016,13.4852, 5);
				        return 1;
				    }
				    else if(BusSteps[playerid][1] == 32)
				    {
				        BusSteps[playerid][1] = 0;
				        DialogBus[1] = false; // Dialog 0 telah di pilih
			    		DialogSaya[playerid][1] = false;
						SendClientMessageEx(playerid, COLOR_ARWIN, "SIDEJOBINFO: {FFFFFF}Gaji Sudah di masukin ke salary cek /mysalary");
						AddPlayerSalary(playerid, "Sidejob(Bus)", 8000);
				        PlayerInfo[playerid][pBusTime] = 1800;
				        DisablePlayerRaceCheckpoint(playerid);
				        SetVehicleToRespawn(GetPlayerVehicleID(playerid));
				        return 1;
			   		}
				}
			}
		}
	}
	for(new i; i <= 3; i++) // 3 = Total Dialog , Jadi kita mau tau kalau Player Ini Apakah Ambil Dialog dari 3 tersebut apa ga !
	{
		if(SweeperSteps[playerid][i] > 0)
		{
		 	if(IsPlayerInAnyVehicle(playerid))
			{
				if(SweeperSteps[playerid][0] == 1)
			    {
			        DisablePlayerRaceCheckpoint(playerid);
			        //GivePlayerCash(playerid, 144);
			        SweeperSteps[playerid][0] = 2;
			        SetPlayerRaceCheckpoint(playerid, 0, 1619.4293,-1881.6036,13.4845, 1816.1698,-1834.6884,13.4141, 5);
			        return 1;
			    }
			    else if(SweeperSteps[playerid][0] == 2)
			    {
			        DisablePlayerRaceCheckpoint(playerid);
			        //GivePlayerCash(playerid, 15);
			        SweeperSteps[playerid][0] = 3;
			        SetPlayerRaceCheckpoint(playerid, 0, 1816.1698,-1834.6884,13.4141, 1820.7505,-1929.6912,13.3750, 5);
			        return 1;
			    }
			    else if(SweeperSteps[playerid][0] == 3)
			    {
			        DisablePlayerRaceCheckpoint(playerid);
			        //GivePlayerCash(playerid, 20);
			        SweeperSteps[playerid][0] = 4;
			        SetPlayerRaceCheckpoint(playerid, 0, 1820.7505,-1929.6912,13.3750,1955.9108,-1934.7244,13.3828, 5);
			        return 1;
			    }
			    else if(SweeperSteps[playerid][0] == 4)
			    {
			        DisablePlayerRaceCheckpoint(playerid);
			        //GivePlayerCash(playerid, 100);
			        SweeperSteps[playerid][0] = 5;
			        SetPlayerRaceCheckpoint(playerid, 0, 1955.9108,-1934.7244,13.3828,1962.7469,-1759.2129,13.3828, 5);
			        return 1;
			    }
			    else if(SweeperSteps[playerid][0] == 5)
			    {
			        DisablePlayerRaceCheckpoint(playerid);
			        //GivePlayerCash(playerid, 70);
			        SweeperSteps[playerid][0] = 6;
			        SetPlayerRaceCheckpoint(playerid, 0, 1962.7469,-1759.2129,13.3828,1830.1188,-1750.1913,13.3828, 5);
			        return 1;
			    }
			    else if(SweeperSteps[playerid][0] == 6)
			    {
			        DisablePlayerRaceCheckpoint(playerid);
			        //GivePlayerCash(playerid, 5);
			        SweeperSteps[playerid][0] = 7;
			        SetPlayerRaceCheckpoint(playerid, 0, 1830.1188,-1750.1913,13.3828,1700.3102,-1729.7719,13.3828, 5);
			        return 1;
			    }
			    else if(SweeperSteps[playerid][0] == 7)
			    {
			        DisablePlayerRaceCheckpoint(playerid);
			        //GivePlayerCash(playerid, 300);
			        SweeperSteps[playerid][0] = 8;
			        SetPlayerRaceCheckpoint(playerid, 0, 1700.3102,-1729.7719,13.3828,1575.3949,-1729.9983,13.3828, 5);
			        return 1;
			    }
			    else if(SweeperSteps[playerid][0] == 8)
			    {
			        DisablePlayerRaceCheckpoint(playerid);
			        //GivePlayerCash(playerid, 129);
			        SweeperSteps[playerid][0] = 9;
			        SetPlayerRaceCheckpoint(playerid, 0, 1575.3949,-1729.9983,13.3828,1567.2383,-1862.6960,13.3828, 5);
			        return 1;
			    }
			    else if(SweeperSteps[playerid][0] == 9)
			    {
			        DisablePlayerRaceCheckpoint(playerid);
			        //GivePlayerCash(playerid, 90);
			        SweeperSteps[playerid][0] = 10;
			        SetPlayerRaceCheckpoint(playerid, 0, 1567.2383,-1862.6960,13.3828,1619.1874,-1877.3141,13.3828, 5);
			        return 1;
			    }
			    else if(SweeperSteps[playerid][0] == 10)
			    {
			        DisablePlayerRaceCheckpoint(playerid);
			        //GivePlayerCash(playerid, 250);
			        SweeperSteps[playerid][0] = 11;
			        SetPlayerRaceCheckpoint(playerid, 1, 1619.1874,-1877.3141,13.3828,1619.1874,-1877.3141,13.3828, 5);
			        return 1;
			    }
			    else if(SweeperSteps[playerid][0] == 11)
			    {
			        SweeperSteps[playerid][0] = 0;
			        DialogSweeper[0] = false; // Dialog 0 telah di pilih
		    		DialogSaya[playerid][0] = false;
			        SendClientMessageEx(playerid, COLOR_ARWIN, "SIDEJOBINFO: {FFFFFF}Gaji Sudah di masukin ke salary cek /mysalary");
					AddPlayerSalary(playerid, "Sidejob(sweeper)", 3000);
			        PlayerInfo[playerid][pSweeperT] = 1800;
			        DisablePlayerRaceCheckpoint(playerid);
			        SetVehicleToRespawn(GetPlayerVehicleID(playerid));
			        return 1;
		   		}
			    else if(SweeperSteps[playerid][1] == 1)
			    {
			        DisablePlayerRaceCheckpoint(playerid);
			        //GivePlayerCash(playerid, 200);
			        SweeperSteps[playerid][1] = 2;
			        SetPlayerRaceCheckpoint(playerid, 0, 1574.9003,-1871.1334,12.9483, 1572.1841,-1746.2827,12.9516, 5);
			        return 1;
			    }
			    else if(SweeperSteps[playerid][1] == 2)
			    {
			        DisablePlayerRaceCheckpoint(playerid);
			        //GivePlayerCash(playerid, 20);
			        SweeperSteps[playerid][1] = 3;
			        SetPlayerRaceCheckpoint(playerid, 0, 1572.1841,-1746.2827,12.9516,1533.9382,-1729.6626,12.9601, 5);
			        return 1;
			    }
			    else if(SweeperSteps[playerid][1] == 3)
			    {
			        DisablePlayerRaceCheckpoint(playerid);
			        //GivePlayerCash(playerid, 100);
			        SweeperSteps[playerid][1] = 4;
			        SetPlayerRaceCheckpoint(playerid, 0, 1533.9382,-1729.6626,12.9601,1532.7323,-1606.6068,12.9475, 5);
			        return 1;
			    }
			    else if(SweeperSteps[playerid][1] == 4)
			    {
			        DisablePlayerRaceCheckpoint(playerid);
			        //GivePlayerCash(playerid, 70);
			        SweeperSteps[playerid][1] = 5;
			        SetPlayerRaceCheckpoint(playerid, 0, 1532.7323,-1606.6068,12.9475,1443.0881,-1593.6465,12.9596, 5);
			        return 1;
			    }
			    else if(SweeperSteps[playerid][1] == 5)
			    {
			        DisablePlayerRaceCheckpoint(playerid);
			        //GivePlayerCash(playerid, 5);
			        SweeperSteps[playerid][1] = 6;
			        SetPlayerRaceCheckpoint(playerid, 0, 1443.0881,-1593.6465,12.9596,1456.4535,-1453.5516,12.9308, 5);
			        return 1;
			    }
			    else if(SweeperSteps[playerid][1] == 6)
			    {
			        DisablePlayerRaceCheckpoint(playerid);
			        //GivePlayerCash(playerid, 129);
			        SweeperSteps[playerid][1] = 7;
			        SetPlayerRaceCheckpoint(playerid, 0, 1456.4535,-1453.5516,12.9308,1424.1686,-1432.9954,12.9524, 5);
			        return 1;
			    }
			    else if(SweeperSteps[playerid][1] == 7)
			    {
			        DisablePlayerRaceCheckpoint(playerid);
			        //GivePlayerCash(playerid, 90);
			        SweeperSteps[playerid][1] = 8;
			        SetPlayerRaceCheckpoint(playerid, 0, 1424.1686,-1432.9954,12.9524,1369.5051,-1392.7247,13.0346, 5);
			        return 1;
			    }
			    else if(SweeperSteps[playerid][1] == 8)
			    {
			        DisablePlayerRaceCheckpoint(playerid);
			        //GivePlayerCash(playerid, 250);
			        SweeperSteps[playerid][1] = 9;
			        SetPlayerRaceCheckpoint(playerid, 0, 1369.5051,-1392.7247,13.0346,1294.5410,-1565.4962,12.9621, 5);
			        return 1;
			    }
			    else if(SweeperSteps[playerid][1] == 9)
			    {
			        DisablePlayerRaceCheckpoint(playerid);
			        //GivePlayerCash(playerid, 250);
			        SweeperSteps[playerid][1] = 10;
			        SetPlayerRaceCheckpoint(playerid, 0, 1294.5410,-1565.4962,12.9621,1293.6605,-1837.6873,12.9545, 5);
			        return 1;
			    }
			    else if(SweeperSteps[playerid][1] == 10)
			    {
			        DisablePlayerRaceCheckpoint(playerid);
			        //GivePlayerCash(playerid, 250);
			        SweeperSteps[playerid][1] = 11;
			        SetPlayerRaceCheckpoint(playerid, 0, 1293.6605,-1837.6873,12.9545,1524.6145,-1875.7056,12.9340, 5);
			        return 1;
			    }
			    else if(SweeperSteps[playerid][1] == 11)
			    {
			        DisablePlayerRaceCheckpoint(playerid);
			        //GivePlayerCash(playerid, 144);
			        SweeperSteps[playerid][1] = 12;
			        SetPlayerRaceCheckpoint(playerid, 1, 1619.4293,-1881.6036,13.4845, 1619.4293, -1881.6036, 13.4845, 5);
			        return 1;
			    }
			    else if(SweeperSteps[playerid][1] == 12)
			    {
			        SweeperSteps[playerid][1] = 0;
			        DialogSweeper[1] = false; // Dialog 0 telah di pilih
		    		DialogSaya[playerid][1] = false;
			        SendClientMessageEx(playerid, COLOR_ARWIN, "SIDEJOBINFO: {FFFFFF}$250.00 telah dimasukkan ke JobSalary mu.");
					AddPlayerSalary(playerid, "Sidejob(Sweeper)", 4000);
			        PlayerInfo[playerid][pSweeperT] = 1800;
			        DisablePlayerRaceCheckpoint(playerid);
			        SetVehicleToRespawn(GetPlayerVehicleID(playerid));
			        return 1;
		   		}
		   		else if(SweeperSteps[playerid][2] == 1)
			    {
			        DisablePlayerRaceCheckpoint(playerid);
			        //GivePlayerCash(playerid, 144);
			        SweeperSteps[playerid][2] = 2;
			        SetPlayerRaceCheckpoint(playerid, 0, 1539.4319,-1869.4375,13.1080, 1323.6667,-1851.4268,13.1080, 5);
			        return 1;
			    }
			    else if(SweeperSteps[playerid][2] == 2)
			    {
			        DisablePlayerRaceCheckpoint(playerid);
			        //GivePlayerCash(playerid, 15);
			        SweeperSteps[playerid][2] = 3;
			        SetPlayerRaceCheckpoint(playerid, 0, 1323.6667,-1851.4268,13.1080, 1184.0767,-1849.0615,13.1313, 5);
			        return 1;
			    }
			    else if(SweeperSteps[playerid][2] == 3)
			    {
			        DisablePlayerRaceCheckpoint(playerid);
			        //GivePlayerCash(playerid, 15);
			        SweeperSteps[playerid][2] = 17;
			        SetPlayerRaceCheckpoint(playerid, 0, 1184.0767,-1849.0615,13.1313, 1181.9901,-1711.4929,13.2177, 5);
			        return 1;
			    }
			    else if(SweeperSteps[playerid][2] == 17)
			    {
			        DisablePlayerRaceCheckpoint(playerid);
			        //GivePlayerCash(playerid, 20);
			        SweeperSteps[playerid][2] = 4;
			        SetPlayerRaceCheckpoint(playerid, 0, 1181.9901,-1711.4929,13.2177,1045.3878,-1709.5790,13.1080, 5);
			        return 1;
			    }
			    else if(SweeperSteps[playerid][2] == 4)
			    {
			        DisablePlayerRaceCheckpoint(playerid);
			        //GivePlayerCash(playerid, 100);
			        SweeperSteps[playerid][2] = 5;
			        SetPlayerRaceCheckpoint(playerid, 0, 1045.3878,-1709.5790,13.1080,1039.8157,-1583.4841,13.1078, 5);
			        return 1;
			    }
			    else if(SweeperSteps[playerid][2] == 5)
			    {
			        DisablePlayerRaceCheckpoint(playerid);
			        //GivePlayerCash(playerid, 70);
			        SweeperSteps[playerid][2] = 6;
			        SetPlayerRaceCheckpoint(playerid, 0, 1039.8157,-1583.4841,13.1078,927.9300,-1568.9344,13.1080, 5);
			        return 1;
			    }
			    else if(SweeperSteps[playerid][2] == 6)
			    {
			        DisablePlayerRaceCheckpoint(playerid);
			        //GivePlayerCash(playerid, 5);
			        SweeperSteps[playerid][2] = 7;
			        SetPlayerRaceCheckpoint(playerid, 0, 927.9300,-1568.9344,13.1080,916.0417,-1583.1429,13.1079, 5);
			        return 1;
			    }
			    else if(SweeperSteps[playerid][2] == 7)
			    {
			        DisablePlayerRaceCheckpoint(playerid);
			        //GivePlayerCash(playerid, 300);
			        SweeperSteps[playerid][2] = 8;
			        SetPlayerRaceCheckpoint(playerid, 0, 916.0417,-1583.1429,13.1079,916.0583,-1760.4836,13.1076, 5);
			        return 1;
			    }
			    else if(SweeperSteps[playerid][2] == 8)
			    {
			        DisablePlayerRaceCheckpoint(playerid);
			        //GivePlayerCash(playerid, 129);
			        SweeperSteps[playerid][2] = 9;
			        SetPlayerRaceCheckpoint(playerid, 0, 916.0583,-1760.4836,13.1076,819.3672,-1766.9518,13.1248, 5);
			        return 1;
			    }
			    else if(SweeperSteps[playerid][2] == 9)
			    {
			        DisablePlayerRaceCheckpoint(playerid);
			        //GivePlayerCash(playerid, 90);
			        SweeperSteps[playerid][2] = 10;
			        SetPlayerRaceCheckpoint(playerid, 0, 819.3672,-1766.9518,13.1248,832.2370,-1623.7051,13.1080, 5);
			        return 1;
			    }
			    else if(SweeperSteps[playerid][2] == 10)
			    {
			        DisablePlayerRaceCheckpoint(playerid);
			        //GivePlayerCash(playerid, 250);
			        SweeperSteps[playerid][2] = 11;
			        SetPlayerRaceCheckpoint(playerid, 0, 832.2370,-1623.7051,13.1080,905.0103,-1576.2756,13.1081, 5);
			        return 1;
			    }
			    else if(SweeperSteps[playerid][2] == 11)
			    {
			        DisablePlayerRaceCheckpoint(playerid);
			        //GivePlayerCash(playerid, 200);
			        SweeperSteps[playerid][2] = 12;
			        SetPlayerRaceCheckpoint(playerid, 0, 905.0103,-1576.2756,13.1081, 1286.4901,-1574.9495,13.1080, 5);
			        return 1;
			    }
			    else if(SweeperSteps[playerid][2] == 12)
			    {
			        DisablePlayerRaceCheckpoint(playerid);
			        //GivePlayerCash(playerid, 20);
			        SweeperSteps[playerid][2] = 13;
			        SetPlayerRaceCheckpoint(playerid, 0, 1286.4901,-1574.9495,13.1080,1294.6498,-1852.5858,13.1080, 5);
			        return 1;
			    }
			    else if(SweeperSteps[playerid][2] == 13)
			    {
			        DisablePlayerRaceCheckpoint(playerid);
			        //GivePlayerCash(playerid, 100);
			        SweeperSteps[playerid][2] = 14;
			        SetPlayerRaceCheckpoint(playerid, 0, 1294.6498,-1852.5858,13.1080,1524.0383,-1875.6007,13.1080, 5);
			        return 1;
			    }
			    else if(SweeperSteps[playerid][2] == 14)
			    {
			        DisablePlayerRaceCheckpoint(playerid);
			        //GivePlayerCash(playerid, 100);
			        SweeperSteps[playerid][2] = 15;
			        SetPlayerRaceCheckpoint(playerid, 0, 1524.0383,-1875.6007,13.1080,1619.1874, -1877.3141, 13.3828, 5);
			        return 1;
			    }
			    else if(SweeperSteps[playerid][2] == 15)
			    {
			        DisablePlayerRaceCheckpoint(playerid);
			        //GivePlayerCash(playerid, 100);
			        SweeperSteps[playerid][2] = 16;
			        SetPlayerRaceCheckpoint(playerid, 1, 1619.1874, -1877.3141, 13.3828,1619.1874, -1877.3141, 13.3828, 5);
			        return 1;
			    }
			    else if(SweeperSteps[playerid][2] == 16)
			    {
			        SweeperSteps[playerid][2] = 0;
			        DialogSweeper[2] = false; // Dialog 0 telah di pilih
		    		DialogSaya[playerid][2] = false;
					SendClientMessageEx(playerid, COLOR_ARWIN, "SIDEJOBINFO: {FFFFFF}$300.00 telah dimasukkan ke JobSalary mu.");
					AddPlayerSalary(playerid, "Sidejob(Sweeper)", 5000);
			        PlayerInfo[playerid][pSweeperT] = 1800;
			        DisablePlayerRaceCheckpoint(playerid);
			        SetVehicleToRespawn(GetPlayerVehicleID(playerid));
			        return 1;
		   		}
			}
	   	}
    }
    if(SedangHauling[playerid] > 0)
	{
 		if(SedangHauling[playerid] == 1)
	    {
     		DisablePlayerRaceCheckpoint(playerid);
     		SendClientMessage(playerid, COLOR_JOB,"TRUCKING: {FFFFFF}Attach the trailer to your vehicle to order");
  			SedangHauling[playerid] = 2;
     		SetPlayerRaceCheckpoint(playerid, 1, -2471.2942, 783.0248, 35.1719, -2471.2942, 783.0248, 35.1719, 10.0);
       		return 1;
		}
		else if(SedangHauling[playerid] == 2)
		{
			if(IsTrailerAttachedToVehicle(GetPlayerVehicleID(playerid)))
			{
			    DisablePlayerRaceCheckpoint(playerid);
                SedangHauling[playerid] = 0;
                AddPlayerSalary(playerid, "Sidejob(Hauling)", 12000);
                pData[playerid][pTruckerTime] += 30*60;
                DialogHauling[0] = false;
                DialogSaya[playerid][0] = false;
                DestroyVehicle(GetVehicleTrailer(GetPlayerVehicleID(playerid)));
                SendClientMessage(playerid, COLOR_JOB, "TRUCKING: {FFFFFF}$120.00 have been issued to your paycheck");
                return 1;
			}
		}
		else if(SedangHauling[playerid] == 3)
	    {
     		DisablePlayerRaceCheckpoint(playerid);
     		SendClientMessage(playerid, COLOR_JOB,"TRUCKING: {FFFFFF}Attach the trailer to your vehicle to order");
  			SedangHauling[playerid] = 4;
     		SetPlayerRaceCheckpoint(playerid, 1, -576.2687, 2569.0842, 53.5156, 576.2687, 2569.0842, 53.5156, 10.0);
       		return 1;
		}
		else if(SedangHauling[playerid] == 4)
		{
			if(IsTrailerAttachedToVehicle(GetPlayerVehicleID(playerid)))
			{
			    DisablePlayerRaceCheckpoint(playerid);
                SedangHauling[playerid] = 0;
                AddPlayerSalary(playerid, "Sidejob(Hauling)", 10000);
                pData[playerid][pTruckerTime] += 30*60;
                DialogHauling[1] = false;
                DialogSaya[playerid][1] = false;
                DestroyVehicle(GetVehicleTrailer(GetPlayerVehicleID(playerid)));
                SendClientMessage(playerid, COLOR_JOB, "TRUCKING: {FFFFFF}$100.00 have been issued to your paycheck");
                return 1;
			}
		}
		else if(SedangHauling[playerid] == 5)
	    {
     		DisablePlayerRaceCheckpoint(playerid);
     		SendClientMessage(playerid, COLOR_JOB,"TRUCKING: {FFFFFF}Attach the trailer to your vehicle to order");
  			SedangHauling[playerid] = 6;
     		SetPlayerRaceCheckpoint(playerid, 1, 1424.8624, 2333.4939, 10.8203, 1424.8624, 2333.4939, 10.8203, 10.0);
       		return 1;
		}
		else if(SedangHauling[playerid] == 6)
		{
			if(IsTrailerAttachedToVehicle(GetPlayerVehicleID(playerid)))
			{
			    DisablePlayerRaceCheckpoint(playerid);
                SedangHauling[playerid] = 0;
                AddPlayerSalary(playerid, "Sidejob(Hauling)", 5000);
                pData[playerid][pTruckerTime] += 30*60;
                DialogHauling[2] = false;
                DialogSaya[playerid][2] = false;
                DestroyVehicle(GetVehicleTrailer(GetPlayerVehicleID(playerid)));
                SendClientMessage(playerid, COLOR_JOB, "TRUCKING: {FFFFFF}$50.00 have been issued to your paycheck");
                return 1;
			}
		}
		if(SedangHauling[playerid] == 7)
	    {
     		DisablePlayerRaceCheckpoint(playerid);
     		SendClientMessage(playerid, COLOR_JOB,"TRUCKING: {FFFFFF}Attach the trailer to your vehicle to order");
  			SedangHauling[playerid] = 8;
     		SetPlayerRaceCheckpoint(playerid, 1, 1198.7153, 165.4331, 20.5056, 1198.7153, 165.4331, 20.5056, 10.0);
       		return 1;
		}
		else if(SedangHauling[playerid] == 8)
		{
			if(IsTrailerAttachedToVehicle(GetPlayerVehicleID(playerid)))
			{
			    DisablePlayerRaceCheckpoint(playerid);
                SedangHauling[playerid] = 0;
                AddPlayerSalary(playerid, "Sidejob(Hauling)", 7000);
                pData[playerid][pTruckerTime] += 30*60;
                DialogHauling[3] = false;
                DialogSaya[playerid][3] = false;
                DestroyVehicle(GetVehicleTrailer(GetPlayerVehicleID(playerid)));
                SendClientMessage(playerid, COLOR_JOB, "TRUCKING: {FFFFFF}$70.00 have been issued to your paycheck");
                return 1;
			}
		}
		else if(SedangHauling[playerid] == 9)
	    {
     		DisablePlayerRaceCheckpoint(playerid);
     		SendClientMessage(playerid, COLOR_JOB,"TRUCKING: {FFFFFF}Attach the trailer to your vehicle to order");
  			SedangHauling[playerid] = 10;
     		SetPlayerRaceCheckpoint(playerid, 1, 1201.5385, 171.6184, 20.5035, 1201.5385, 171.6184, 20.5035, 10.0);
       		return 1;
		}
		else if(SedangHauling[playerid] == 10)
		{
			if(IsTrailerAttachedToVehicle(GetPlayerVehicleID(playerid)))
			{
			    DisablePlayerRaceCheckpoint(playerid);
                SedangHauling[playerid] = 0;
                AddPlayerSalary(playerid, "Sidejob(Hauling)", 12000);
                pData[playerid][pTruckerTime] += 30*60;
                DialogHauling[4] = false;
                DialogSaya[playerid][4] = false;
                DestroyVehicle(GetVehicleTrailer(GetPlayerVehicleID(playerid)));
                SendClientMessage(playerid, COLOR_JOB, "TRUCKING: {FFFFFF}$120.00 have been issued to your paycheck");
                return 1;
			}
		}
		else if(SedangHauling[playerid] == 11)
	    {
     		DisablePlayerRaceCheckpoint(playerid);
     		SendClientMessage(playerid, COLOR_JOB,"TRUCKING: {FFFFFF}Attach the trailer to your vehicle to order");
  			SedangHauling[playerid] = 12;
     		SetPlayerRaceCheckpoint(playerid, 1, 2786.8313, -2417.9558, 13.6339, 2786.8313, -2417.9558, 13.6339, 10.0);
       		return 1;
		}
		else if(SedangHauling[playerid] == 12)
		{
			if(IsTrailerAttachedToVehicle(GetPlayerVehicleID(playerid)))
			{
			    DisablePlayerRaceCheckpoint(playerid);
                SedangHauling[playerid] = 0;
                AddPlayerSalary(playerid, "Sidejob(Hauling)", 5000);
                pData[playerid][pTruckerTime] += 30*60;
                DialogHauling[5] = false;
                DialogSaya[playerid][5] = false;
                DestroyVehicle(GetVehicleTrailer(GetPlayerVehicleID(playerid)));
                SendClientMessage(playerid, COLOR_JOB, "TRUCKING: {FFFFFF}$50.00 have been issued to your paycheck");
                return 1;
			}
		}
		else if(SedangHauling[playerid] == 13)
	    {
     		DisablePlayerRaceCheckpoint(playerid);
     		SendClientMessage(playerid, COLOR_JOB,"TRUCKING: {FFFFFF}Attach the trailer to your vehicle to order");
  			SedangHauling[playerid] = 14;
     		SetPlayerRaceCheckpoint(playerid, 1, 1613.7815, 2236.2046, 10.3787, 1613.7815, 2236.2046, 10.3787, 10.0);
       		return 1;
		}
		else if(SedangHauling[playerid] == 14)
		{
			if(IsTrailerAttachedToVehicle(GetPlayerVehicleID(playerid)))
			{
			    DisablePlayerRaceCheckpoint(playerid);
                SedangHauling[playerid] = 0;
                AddPlayerSalary(playerid, "Sidejob(Hauling)", 11000);
                pData[playerid][pTruckerTime] += 30*60;
                DialogHauling[6] = false;
                DialogSaya[playerid][6] = false;
                DestroyVehicle(GetVehicleTrailer(GetPlayerVehicleID(playerid)));
                SendClientMessage(playerid, COLOR_JOB, "TRUCKING: {FFFFFF}$110.00 have been issued to your paycheck");
                return 1;
			}
		}
		else if(SedangHauling[playerid] == 15)
	    {
     		DisablePlayerRaceCheckpoint(playerid);
     		SendClientMessage(playerid, COLOR_JOB,"TRUCKING: {FFFFFF}Attach the trailer to your vehicle to order");
  			SedangHauling[playerid] = 16;
     		SetPlayerRaceCheckpoint(playerid, 1, 2415.7803, -2470.1309, 13.6300, 2415.7803, -2470.1309, 13.6300, 10.0);
       		return 1;
		}
		else if(SedangHauling[playerid] == 16)
		{
			if(IsTrailerAttachedToVehicle(GetPlayerVehicleID(playerid)))
			{
			    DisablePlayerRaceCheckpoint(playerid);
                SedangHauling[playerid] = 0;
                AddPlayerSalary(playerid, "Sidejob(Hauling)", 12000);
                pData[playerid][pTruckerTime] += 30*60;
                DialogHauling[7] = false;
                DialogSaya[playerid][7] = false;
                DestroyVehicle(GetVehicleTrailer(GetPlayerVehicleID(playerid)));
                SendClientMessage(playerid, COLOR_JOB, "TRUCKING: {FFFFFF}$120.00 have been issued to your paycheck");
                return 1;
			}
		}
		else if(SedangHauling[playerid] == 17)
	    {
     		DisablePlayerRaceCheckpoint(playerid);
     		SendClientMessage(playerid, COLOR_JOB,"TRUCKING: {FFFFFF}Attach the trailer to your vehicle to order");
  			SedangHauling[playerid] = 18;
     		SetPlayerRaceCheckpoint(playerid, 1, -980.1684, -713.3505, 32.0078, -980.1684, -713.3505, 32.0078, 10.0);
       		return 1;
		}
		else if(SedangHauling[playerid] == 18)
		{
			if(IsTrailerAttachedToVehicle(GetPlayerVehicleID(playerid)))
			{
			    DisablePlayerRaceCheckpoint(playerid);
                SedangHauling[playerid] = 0;
                AddPlayerSalary(playerid, "Sidejob(Hauling)", 9000);
                pData[playerid][pTruckerTime] += 30*60;
                DialogHauling[8] = false;
                DialogSaya[playerid][8] = false;
                DestroyVehicle(GetVehicleTrailer(GetPlayerVehicleID(playerid)));
                SendClientMessage(playerid, COLOR_JOB, "TRUCKING: {FFFFFF}$90.00 have been issued to your paycheck");
                return 1;
			}
		}
		else if(SedangHauling[playerid] == 19)
		{
			DisablePlayerRaceCheckpoint(playerid);
			SendClientMessage(playerid, COLOR_JOB,"TRUCKING: {FFFFFF}Attach the trailer to your vehicle to order");
			SedangHauling[playerid] = 20;
			SetPlayerRaceCheckpoint(playerid, 1, -2226.1292, -2315.1055, 30.6045, -2226.1292, -2315.1055, 30.6045, 10.0);
			return 1;
		}
		else if(SedangHauling[playerid] == 20)
		{
			if(IsTrailerAttachedToVehicle(GetPlayerVehicleID(playerid)))
			{
			    DisablePlayerRaceCheckpoint(playerid);
	            SedangHauling[playerid] = 0;
	            AddPlayerSalary(playerid, "Sidejob(Hauling)", 5500);
	            pData[playerid][pTruckerTime] += 30*60;
	            DialogHauling[9] = false;
	            DialogSaya[playerid][9] = false;
	            DestroyVehicle(GetVehicleTrailer(GetPlayerVehicleID(playerid)));
	            SendClientMessage(playerid, COLOR_JOB, "TRUCKING: {FFFFFF}$55.00 have been issued to your paycheck");
	            return 1;
			}
		}
	}
	if(pData[playerid][pTrackCar] == 1)
	{
		Info(playerid, "Anda telah berhasil menemukan kendaraan anda!");
		pData[playerid][pTrackCar] = 0;
		DisablePlayerRaceCheckpoint(playerid);
	}
	if(pData[playerid][pTrackHouse] == 1)
	{
		Info(playerid, "Anda telah berhasil menemukan rumah anda!");
		pData[playerid][pTrackHouse] = 0;
		DisablePlayerRaceCheckpoint(playerid);
	}
	if(pData[playerid][pTrackBisnis] == 1)
	{
		Info(playerid, "Anda telah berhasil menemukan bisnis anda!");
		pData[playerid][pTrackBisnis] = 0;
		DisablePlayerRaceCheckpoint(playerid);
	}
	if(pData[playerid][pMission] > -1)
	{
		DisablePlayerRaceCheckpoint(playerid);
		Info(playerid, "/buy , /gps(My Mission) , /storeproduct.");
	}
	if(pData[playerid][pHauling] > -1)
	{
		DisablePlayerRaceCheckpoint(playerid);
		Info(playerid, "/buy , /gps(My Hauling) , /storegas.");
	}
	DisablePlayerRaceCheckpoint(playerid);
	return 1;
}
