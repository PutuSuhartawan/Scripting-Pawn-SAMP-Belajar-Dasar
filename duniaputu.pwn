
//----------------------------------------------------------
//
//  putu suhartawan
//  oktober 2020
//
//----------------------------------------------------------

//#pragma tabsize 0
/*
#include <a_samp>
#include <dini>
#include <a_mysql>
#include <md5>
#include <streamer>
#include <timestamptodate>
#include <sscanf2>
#include <kickfix>
#include <sprintf>

#include <YSI\y_timers>
#include <YSI\y_va>
#include <physics>
#include <zones>
#include <zcmd>
#include <geoip>

*/


//DEFINES
#define YSI_NO_OPTIMISATION_MESSAGE
#define YSI_NO_VERSION_CHECK
#define YSI_NO_CACHE_MESSAGE
#define YSI_NO_MODE_CACHE
#if !defined isnull
    #define isnull(%1) ((!(%1[0])) || (((%1[0]) == '\1') && (!(%1[1]))))
#endif
#define MAX_DIALOG_ITEMS 				(512 + 1)

//INCLUDES


#include <a_samp>
//#define FIXES_OnPlayerText 0
#define FIXES_GetMaxPlayersMsg 0
#define FIXES_ServerVarMsg 0                                             
#define FIX_GetServerVarAsString 0                                      
#define FIX_GetServerVarAsFloat  0                                       
#define FIX_GetServerVarAsInt    0                                      
#define FIX_GetServerVarAsBool   0
#define FIX_IS_FILTERSCRIPT 0




#include <fixes>
#include <sscanf2>


 // untuk membuat log
#include <Dini> // ini simpan data dari player
#include <sprintf>
#include <streamer>
#include "../include/gl_messages.inc"
#include <core>
#include <float>
#include "../include/gl_spawns.inc"
#include "../include/gl_common.inc"
#include "../include/vehicleutil.inc"
#include <a_npc>
#include "../include/SpikeStrip.inc"
#include "Idlewood_Projects.pwn"
#include <yom_buttons>
#include <data>
#include <textdraws>
#include <zcmd> // untuk membuat script command CMD
#include <gangzones.inc>

//#define _ALS_OnFilterScriptInit

 // untuk supaya bisa pake progress bar sekarang tahun. Progress Bar 2.0.3 tahun 2015
#include <a_mysql> // MySQL plugin R41-4
#include <YSI_Storage\y_ini>
#include <YSI_Data\y_iterate>
#include <progress2>
#include <foreach>// ini color khusus string yang tidak mendukung tanda kurung.

//#include <_ALS_OnFilterScriptInit>




//#define tabsize 0


#define FILTERSCRIPT
#define COL_EASY "{FFF1AF}"
#define COL_WHITE "{FFFFFF}"
#define COL_BLACK "{0E0101}"
#define COL_GREY "{C3C3C3}"
#define COL_GREEN "{6EF83C}"
#define COL_RED "{F81414}"
#define COL_YELLOW "{F3FF02}"
#define COL_ORANGE "{FFAF00}"
#define COL_LIME "{B7FF00}"
#define COL_CYAN "{00FFEE}"
#define COL_LIGHTBLUE "{00C0FF}"
#define COL_BLUE "{0049FF}"
#define COL_MAGENTA "{F300FF}"
#define COL_VIOLET "{B700FF}"
#define COL_PINK "{FF00EA}"
#define COL_MARONE "{A90202}"
#define COL_CMD "{B8FF02}"
#define COL_PARAM "{3FCD02}"
#define COL_SERVER "{AFE7FF}"
#define COL_VALUE "{A3E4FF}"
#define COL_RULE "{F9E8B7}"
#define COL_RULE2 "{FBDF89}"
#define COL_RWHITE "{FFFFFF}"
#define COL_LGREEN "{C9FFAB}"
#define COL_LRED "{FFA1A1}"
#define COL_LRED2 "{C77D87}" 


#define GetPlayerData(%0,%1) 	pInfo[%0][%1]
#define AddPlayerData(%0,%1,%2,%3) pInfo[%0][%1] %2= %3
#define GetPlayerMoneyEx(%0)	GetPlayerData(%0, pMoney) 			// uang pemain

// ini kumpulan ID dialog yang akan respond
#define 					DIALOG_PROSSES_IKLAN 				(16)
#define 					PILIHAN_LAMPU						(12312)
#define                     RESPONDDIALOGKOSONG					(543)
#define						BUYTOYSCOP 					 		(10153)
#define						BUYTOYSCOP2 					 	(10154)
#define						BUYTOYSCOP3 					 	(10155)
#define 					MAX_PLAYERTOYS 						(8)

#define TOTAL_ITEMS         20000
#define SELECTION_ITEMS 	21
#define ITEMS_PER_LINE  	7

#define HEADER_TEXT "Objects"
#define NEXT_TEXT   "Next"
#define PREV_TEXT   "Prev"

#define COLOR_ME 		0xC2A2DAFF
#define COLOR_ERROR 	0xFF0000FF
#define COLOR_GREEN 	0x008000FF
#define COLOR_AQUAGREEN   	0x03D687FF
#define COLOR_RED 0xFF0000FF
#define COLOR_LIGHTRED 0xFF6347AA // 0xB33C3CAA
#define COLOR_LIGHTBLUE 0x33CCFFAA

#define COLOR_BLUE 0x1ED5C7FF
#define COLOR_YELLOW 0xFFFF00AA
#define COLOR_ORANGE 0xFFFF8000
#define COLOR_PURPLE 0xFF400080
#define COLOR_LBLUE 0xFF0080FF
#define COLOR_WHITE 0xFFFFFFFF
#define COLOR_BLACK 0xFF000000
#define COLOR_CYAN 0xFF00FFFF
#define COLOR_PINK 0xFFFF00FF
#define COLOR_BROWN 0xFF6A0000
#define COLOR_LPURPLE 0xFF8080C0
#define COLOR_LGREEN 0x9ACD32AA
#define COLOR_GRAY 0xFF676767

#define COLOR_DARKGOLD 0x808000AA
#define COLOR_AQUA 0x00FFFFFF
#define COLOR_RUSAK 0x01FCFFC8
#define COLOR_NORMAL_PLAYER 0xFFBB7777


#define DIALOG_BASE_X   	75.0
#define DIALOG_BASE_Y   	130.0
#define DIALOG_WIDTH    	550.0
#define DIALOG_HEIGHT   	180.0
#define SPRITE_DIM_X    	60.0
#define SPRITE_DIM_Y    	70.0


#define WHITE 0xFFFFFFFF


#define MAX_ADMIN_LEVEL 7
#define SETLEVEL_ADMIN 5


// untuk beli senjata

#define     AMMUNATION_SMGS_DIALOG      "\
Weapon\tAmount\tPrice\n\
{FFFFFF}MP5 PUTU\t90\t{FF0000}$3500\n\
{FFFFFF}Acer Predator\t1\t{FF0000}RP. 80.000.000\n\
{FFFFFF}Nvidia RTX\t2080\t{FF0000}RP. 15.000.000\n\
{FFFFFF}RAM 32GB\t2\tRP. 1.000.000\n\
{FFFFFF}Sawnoff\t5000\tRP. 100\n\
{FFFFFF}Pistol\t1000\tRP. 50\n\
{FFFFFF}M4\t1000\tRP. 100\n\
{FFFFFF}MP5\t750\tRP. 200\n\
{FFFFFF}Grenade\t500\tRP. 100\n\
{FFFFFF}Parachute\t1000\tRP. 1900\n\
{FFFFFF}Lorikeet\t5000\tRP. 500\n\
"


#define     PLAYERNEEDHELP_DIALOG	"\
Nama Player\tStatus\tPermohonan\n\
{FFFFFF}Andrew_Wizz\tButuh Pertolongan\t{FF0000}Ada yang bisa bantu sekarang?\n\
{FFFFFF}Wirko_Gangs\tCheater Detected\t{FF0000}Destoring Database of PlayerData\n\
{FFFFFF}Koplo_Koplak\tCheating\t{FF0000}Hacking Admin Status\n\
"

#define HOLDING(%0) \
	((newkeys & (%0)) == (%0))


#define PRESSED(%0) \
    (((newkeys & (%0)) == (%0)) && ((oldkeys & (%0)) != (%0)))
    
#define RELEASED(%0) \
    (((newkeys & (%0)) == (%0)) && ((oldkeys & (%0)) != (%0)))


#define dcmd(%1,%2,%3) if (!strcmp((%3)[1], #%1, true, (%2)) && ((((%3)[(%2) + 1] == '\0') && (dcmd_%1(playerid, ""))) || (((%3)[(%2) + 1] == ' ') && (dcmd_%1(playerid, (%3)[(%2) + 2]))))) return 1



#define DropPlayerWeapons 42
#define ResetPlayerWeapons 42


#define PindahinOrangnya    SetPlayerPos


#define CITY_LOS_SANTOS 	0
#define CITY_SAN_FIERRO 	1
#define CITY_LAS_VENTURAS 	2


#define DIALOG_GANTINAMA				36
#define DIALOG_ATTACH_INDEX             13500
#define DIALOG_ATTACH_INDEX_SELECTION   DIALOG_ATTACH_INDEX+1
#define DIALOG_ATTACH_EDITREPLACE       DIALOG_ATTACH_INDEX+2
#define DIALOG_ATTACH_MODEL_SELECTION   DIALOG_ATTACH_INDEX+3
#define DIALOG_ATTACH_BONE_SELECTION    DIALOG_ATTACH_INDEX+4

#define BOOST_VEL 1.1 //Aceleration speed. (It must be at least at 1.1, else it will decrease the car speed)
#define MAX_KPH 360 //Ma


// ini untuk menjelaskan variabel baru mysql

#define mysql_fetch_string(%0,%1) cache_get_field_count(%0,%1)
#define mysql_stat(%0,%1) cache_get_field_count(%0,field); \%1=strval(field)

#define mysql_fetch_float(%0,%1) cache_get_field_count(%0,field); \
%1=floatstr(field)
#define mysql_fetch_string(%0,%1) cache_get_field_count(%0,%1)
#define mysql_stat(%0,%1) cache_get_field_count(%0,field); \%1=strval(field)



#define SQL_HOST "localhost" //your destination server
#define SQL_USER "pma" //default user name of wampserver
#define SQL_PASS "" //wampserver has no default password unless you have set one.
#define SQL_DB "putu"//the name of your database
//#define MySQL = mysql_connect(SQL_HOST, SQL_USER, SQL_PASS, SQL_DB)
//native IsValidVehicle(vehicleid);

// BAGIAN UNTUK VARIABEL MECHANIC YANG AKAN DI PAKAI UNTUK PUBLIK
new PintuMasukBizMoneyChangPick, PintuKeluarBizMoneyChangPick, PintuMasukMinimarketPick, PintuKeluarMinimarketPick, KasirMinimarketPick, Text:PerlihatkanBoombox;
// ini untuk jelaskan fungsi baru
new g_Sql;
new options; // = mysql_init_options();
// variabel yang tegolong untuk mancing
new Player_Frisk[MAX_PLAYERS], friskInvited[MAX_PLAYERS], friskApproved[MAX_PLAYERS];
new PintuGarasiMechanic, DongkratMobilMechanic, PeneranganMobilMechanic; // semua yang berhubungan dengan kondisi mechanic center.
new CrateBox, StatusCrateTerangkat; //khusus untuk pekerjaan angkat crate trucker

new AreaMancingDiLaut, PenandaMancingDiLaut, RodObject, EfekPancingan[MAX_PLAYERS];
new MenggunakanRobberPack[MAX_PLAYERS];
new kendaraanrobber;
new engine, lights, alarm, doors, bonnet, boot, objective; // status dari kendaraan

//untuk ID pekerjaan bandara
new KerjaSweeperBandara[MAX_PLAYERS], MobilSweeperBandara, pesawatbandara, balehopesawat, 
MobilPedagangMakanan, aktorpedagangmakanan, pintubrangkasbiz, sepedasewaan[MAX_PLAYERS], areapickuprentalsepeda;
new Text3D:ChatPedagangMenjualKeliling;
// ini untuk ID variabel khusus untuk kerja hauling trucker
new MobilKerjaHauling, KerjaHaulingStatus[MAX_PLAYERS], TrailerHaulingDiBandara;
// ingat untuk variabel id bisnis Iklan
// ini data variabel untuk jenis garasi mobil
new mobilplayer1[MAX_PLAYERS], AktifkanLimitSpeed[MAX_PLAYERS]; // untuk spawn ID mobil yang slot 1
new TempatDisplayIklan;
new TempatBeriklan;
new layariklanbadara;
// variabel gate yang di pakai untuk rumah sakit san fierro
new gatepertamadirumahsakit, KeadaanLelah[MAX_PLAYERS], MobilEmergencyAmbulance;

new gaterumahsakit[MAX_PLAYERS]; // untuk merubah variabel gate di rumah sakit dari 0 ke satu

new contohdikendaraan; // ini untuk objek di kendaraan.
//new MySQL:mysql;
//new field[128];
new susterdiresepsionis; // id dari suster

//new MySQL:Connection;
new sewaan;
new Text3D:HasilTrading;
new pakaihelm[MAX_PLAYERS]; // daftarkan ID setiap player untuk informasi pemakaian helm
new Text:UI[4], Text:TeksSaatLogin, Text:TeksInfoGreenZone;
 // variabel yang menjelaskan teks untuk menampilkan tanggal dan waktu.
new Text:panelkecepatankendaraan;
new tempatpickupbeligasstation;
new senjatadipilih;
// Buttons / doors
new FBILobbyLeft, FBILobbyLeftBTN[2], FBILobbyRight, FBILobbyRightBTN[2], FBIPrivate[2], FBIPrivateBTN[2];
new lspdcopsonly;
new lspdeveryone;

// ini parameter induk paling atas untuk siapa yang duty
new OnDuty[MAX_PLAYERS];
//new cmdtext;


new StatusBaruLogin[MAX_PLAYERS];
new StatusPlayerTerkill[MAX_PLAYERS];
new tempatrentalmobildibandarals;
new PintuMasukRumahPutuPick;
new PintuKeluarRumahPutuPick;

//khusus untuk rumah sakit
new pintumasukrumahsakitsfpickup;
new pintukeluarrumahsakitsfpickup;

//khusus parameter simbol rumah kecil
new PintuRumahKecilPick; 
new PintuRumahKecilKeluarPick; 

new Text:LayarJadiMerah;

new PintuKeluarMD;
new PintuMD;



//new PlayerText:gNextButtonTextDrawId[MAX_PLAYERS];
//new PlayerText:gPrevButtonTextDrawId[MAX_PLAYERS];
//new PlayerText:gSelectionItems[MAX_PLAYERS][SELECTION_ITEMS];

//new gSelectionItemsTag[MAX_PLAYERS][SELECTION_ITEMS];
//new gItemAt[MAX_PLAYERS];

new BahayaDeathRacePick;
new LanjutBahayaDeathRacePick;
new LanjutBahayaDeathRacePick2;
	
new total_vehicles_from_files=0;

// Class selection globals
new gPlayerCitySelection[MAX_PLAYERS];
new gPlayerHasCitySelected[MAX_PLAYERS];
new gPlayerLastCitySelectionTick[MAX_PLAYERS];

new Text:txtClassSelHelper;
new Text:txtLosSantos;
new Text:txtSanFierro;
new Text:txtLasVenturas;
new FiremanJob[256];
new infokerjapemadam;
forward busroutestoptimer(playerid);

//At The Top Of The Script:
new BlackRadar;

//Under OnGameModeInit

new Text3D:ame[MAX_PLAYERS];
// daftar variabel ado.
new Text3D:ado[MAX_PLAYERS];
new amestatus[MAX_PLAYERS], adostatus[MAX_PLAYERS];
new IDTEXTPAKU;
enum AttachmentEnum
{
    attachmodel,
    attachname[24]
}



enum HoldingEnumAll
{
	holdingmodelid,
	holdingprice,
	holdingmodelname[24]
}


new HoldingObjectsAll[240][HoldingEnumAll] = {
{18642,100,"Taser1"},
{18643,1000,"LaserPointer1"},
{19080,1000,"LaserPointer2"},
{19081,1000,"LaserPointer3"},
{19082,1000,"LaserPointer4"},
{19083,1000,"LaserPointer5"},
{19084,1000,"LaserPointer6"},
{19086,500,"ChainsawDildo1"},
{18675,1000,"SmokePuff"},
{19701,1000,"SmallFlame"},
{18693,1000,"LargeFlame"},
{18698,1000,"Insects"},
{18708,1000,"Bubbles"},
{19141,250,"SWATHelmet1"},
{19142,250,"SWATArmour1"},
{18636,100,"PoliceCap1"},
{19099,100,"PoliceCap2"},
{19100,100,"PoliceCap3"},
{18637,100,"PoliceShield1"},
{19161,100,"PoliceHat1"},
{19162,100,"PoliceHat2"},
{19200,100,"PoliceHelmet1"},
{19138,100,"PoliceGlasses1"},
{19139,100,"PoliceGlasses2"},
{19140,100,"PoliceGlasses3"},
{19347,250,"Badge"},
{18632,100,"FishingRod"},
{18633,150,"Wrench"},
{18634,100,"Crowbar"},
{18635,100,"Hammer"},
{18638,50,"HardHat"},
{19093,50,"HardHat2"},
{19160,50,"HardHat3"},
{18639,50,"BlackHat"},
{18640,70,"Hair"},
{18975,70,"Hair2"},
{19136,70,"Hair3"},
{19274,70,"Hair4"},
{18641,100,"Flashlight"},
{18644,500,"Screwdriver"},
{18865,50,"MobilePhone1"},
{18866,50,"MobilePhone2"},
{18867,50,"MobilePhone3"},
{18868,50,"MobilePhone4"},
{18869,50,"MobilePhone5"},
{18870,100,"MobilePhone6"},
{18871,100,"MobilePhone7"},
{18872,100,"MobilePhone8"},
{18873,100,"MobilePhone9"},
{18874,100,"MobilePhone10"},
{18875,75,"Pager"},
{18890,50,"Rake"},
{18891,50,"Bandana1"},
{18892,50,"Bandana2"},
{18893,50,"Bandana3"},
{18894,50,"Bandana4"},
{18895,50,"Bandana5"},
{18896,50,"Bandana6"},
{18897,50,"Bandana7"},
{18898,50,"Bandana8"},
{18899,50,"Bandana9"},
{18900,50,"Bandana10"},
{18901,75,"Bandana11"},
{18902,75,"Bandana12"},
{18903,75,"Bandana13"},
{18904,75,"Bandana14"},
{18905,75,"Bandana15"},
{18906,75,"Bandana16"},
{18907,75,"Bandana17"},
{18908,75,"Bandana18"},
{18909,75,"Bandana19"},
{18910,75,"Bandana20"},
{18911,100,"Mask1"},
{18912,100,"Mask2"},
{18913,100,"Mask3"},
{18914,100,"Mask4"},
{18915,100,"Mask5"},
{18916,100,"Mask6"},
{18917,100,"Mask7"},
{18918,100,"Mask8"},
{18919,100,"Mask9"},
{18920,100,"Mask10"},
{18921,50,"Beret1"},
{18922,50,"Beret2"},
{18923,75,"Beret3"},
{18924,100,"Beret4"},
{18925,100,"Beret5"},
{18926,50,"Hat1"},
{18927,50,"Hat2"},
{18928,50,"Hat3"},
{18929,50,"Hat4"},
{18930,50,"Hat5"},
{18931,100,"Hat6"},
{18932,100,"Hat7"},
{18933,100,"Hat8"},
{18934,100,"Hat9"},
{18935,100,"Hat10"},
{18936,50,"Helmet1"},
{18937,75,"Helmet2"},
{18938,100,"Helmet3"},
{18939,75,"CapBack1"},
{18940,75,"CapBack2"},
{18941,75,"CapBack3"},
{18942,100,"CapBack4"},
{18943,100,"CapBack5"},
{18944,100,"HatBoater1"},
{18945,125,"HatBoater2"},
{18946,150,"HatBoater3"},
{18947,100,"HatBowler1"},
{18948,100,"HatBowler2"},
{18949,100,"HatBowler3"},
{18950,100,"HatBowler4"},
{18951,100,"HatBowler5"},
{18952,150,"BoxingHelmet"},
{18953,50,"CapKnit1"},
{18954,75,"CapKnit2"},
{18955,75,"CapOverEye1"},
{18956,75,"CapOverEye2"},
{18957,75,"CapOverEye3"},
{18958,75,"CapOverEye4"},
{18959,75,"CapOverEye5"},
{18960,100,"CapRimUp1"},
{18961,75,"CapTrucker1"},
{18962,75,"CowboyHat2"},
{18964,100,"SkullyCap1"},
{18965,125,"SkullyCap2"},
{18966,150,"SkullyCap3"},
{18967,100,"HatMan1"},
{18968,100,"HatMan2"},
{18969,100,"HatMan3"},
{18970,200,"HatTiger"},
{18971,100,"HatCool1"},
{18972,125,"HatCool2"},
{18973,150,"HatCool3"},
{18974,1000,"MaskZorro1"},
{18645,150,"MotorcycleHelmet"},
{18976,100,"MotorcycleHelmet2"},
{18977,100,"MotorcycleHelmet3"},
{18978,125,"MotorcycleHelmet4"},
{18979,150,"MotorcycleHelmet5"},
{19006,50,"GlassesType1"},
{19007,50,"GlassesType2"},
{19008,50,"GlassesType3"},
{19009,50,"GlassesType4"},
{19010,50,"GlassesType5"},
{19011,50,"GlassesType6"},
{19012,50,"GlassesType7"},
{19013,50,"GlassesType8"},
{19014,50,"GlassesType9"},
{19015,50,"GlassesType10"},
{19016,100,"GlassesType11"},
{19017,100,"GlassesType12"},
{19018,100,"GlassesType13"},
{19019,100,"GlassesType14"},
{19020,100,"GlassesType15"},
{19021,100,"GlassesType16"},
{19022,100,"GlassesType17"},
{19023,100,"GlassesType18"},
{19024,100,"GlassesType19"},
{19025,100,"GlassesType20"},
{19026,150,"GlassesType21"},
{19027,150,"GlassesType22"},
{19028,150,"GlassesType23"},
{19029,150,"GlassesType24"},
{19030,150,"GlassesType25"},
{19031,150,"GlassesType26"},
{19032,150,"GlassesType27"},
{19033,150,"GlassesType28"},
{19034,150,"GlassesType29"},
{19035,150,"GlassesType30"},
{19036,200,"HockeyMask1"},
{19037,200,"HockeyMask2"},
{19038,200,"HockeyMask3"},
{19039,50,"WatchType1"},
{19040,50,"WatchType2"},
{19041,50,"WatchType3"},
{19042,50,"WatchType4"},
{19043,50,"WatchType5"},
{19044,50,"WatchType6"},
{19045,50,"WatchType7"},
{19046,100,"WatchType8"},
{19047,100,"WatchType9"},
{19048,100,"WatchType10"},
{19049,100,"WatchType11"},
{19050,100,"WatchType12"},
{19051,100,"WatchType13"},
{19052,100,"WatchType14"},
{19053,100,"WatchType15"},
{19064,1000, "SantaHat1"},
{19065,2000, "SantaHat2"},
{19066,300, "SantaHat3"},
{19067,100, "HoodyHat1"},
{19068,100, "HoodyHat2"},
{19069,100, "HoodyHat3"},
{19078,750, "TheParrot1"},
{19079,750, "TheParrot2"},
{19085,500, "EyePatch"},
{19090,150, "PomPomBlue"},
{19091,150, "PomPomRed"},
{19092,150, "PomPomGreen"},
{19094,200, "BurgerShotHat"},
{19095,50, "CowboyHat1"},
{19096,50, "CowboyHat3"},
{19097,100, "CowboyHat4"},
{19098,100, "CowboyHat5"},
{19101,200, "ArmyHelmet1"},
{19102,200, "ArmyHelmet2"},
{19103,200, "ArmyHelmet3"},
{19104,200, "ArmyHelmet4"},
{19105,200, "ArmyHelmet5"},
{19106,200, "ArmyHelmet6"},
{19107,400, "ArmyHelmet7"},
{19108,400, "ArmyHelmet8"},
{19109,400, "ArmyHelmet9"},
{19110,400, "ArmyHelmet10"},
{19111,400, "ArmyHelmet11"},
{19112,400, "ArmyHelmet12"},
{19113,100, "SillyHelmet1"},
{19114,200, "SillyHelmet2"},
{19115,300, "SillyHelmet3"},
{19116,50, "PlainHelmet1"},
{19117,50, "PlainHelmet2"},
{19118,75, "PlainHelmet3"},
{19119,100, "PlainHelmet4"},
{19120,100, "PlainHelmet5"},
{19137,500, "CluckinBellHat"},
{19163,100, "GimpMask"},
{1210,50, "Briefcase"},
{19421,50, "Headphones1"},
{19422,50, "Headphones2"},
{19423,50, "Headphones3"},
{19424,50, "Headphones4"},
{19350,50, "Moustache1"},
{19351,50, "Moustache2"},
{19352,50, "Tophat"},
{19349,50, "Monocle"},
{19317,50, "Bassguitar"},	
{371,500, "Backpack"},
{3044,500, "Cigar"},
{3027,500, "Joint"}
};

enum HoldingEnum
{
	holdingmodelid,
	holdingprice,
	holdingmodelname[24]
}

enum ptInfo
{
    ptModelID,
    ptRealID,
	ptBone,
    Float:ptPosX,
	Float:ptPosY,
	Float:ptPosZ,
	Float:ptRotX,
	Float:ptRotY,
	Float:ptRotZ,
	Float:ptScaleX,
	Float:ptScaleY,
	Float:ptScaleZ,
};



// kordinat attachment misalnya bone dyoc
new HoldingBones[][] = {
	"None",
	"Spine",
	"Head",
	"Left upper arm",
	"Right upper arm",
	"Left hand",
	"Right hand",
	"Left thigh",
	"Right thigh",
	"Left foot",
	"Right foot",
	"Right calf",
	"Left calf",
	"Left forearm",
	"Right forearm",
	"Left clavicle",
	"Right clavicle",
	"Neck",
	"Jaw"
};



new PlayerToyInfo[MAX_PLAYERS+1][MAX_PLAYERTOYS][ptInfo];

new AttachmentObjects[][AttachmentEnum] = {
{18632, "FishingRod"},
{18633, "GTASAWrench1"},
{18634, "GTASACrowbar1"},
{18635, "GTASAHammer1"},
{18636, "PoliceCap1"},
{18637, "PoliceShield1"},
{18638, "HardHat1"},
{18639, "BlackHat1"},
{18640, "Hair1"},
{18975, "Hair2"},
{19136, "Hair4"},
{19274, "Hair5"},
{18641, "Flashlight1"},
{18642, "Taser1"},
{18643, "LaserPointer1"},
{19080, "LaserPointer2"},
{19081, "LaserPointer3"},
{19082, "LaserPointer4"},
{19083, "LaserPointer5"},
{19084, "LaserPointer6"},
{18644, "Screwdriver1"},
{18645, "MotorcycleHelmet1"},
{18865, "MobilePhone1"},
{18866, "MobilePhone2"},
{18867, "MobilePhone3"},
{18868, "MobilePhone4"},
{18869, "MobilePhone5"},
{18870, "MobilePhone6"},
{18871, "MobilePhone7"},
{18872, "MobilePhone8"},
{18873, "MobilePhone9"},
{18874, "MobilePhone10"},
{18875, "Pager1"},
{18890, "Rake1"},
{18891, "Bandana1"},
{18892, "Bandana2"},
{18893, "Bandana3"},
{18894, "Bandana4"},
{18895, "Bandana5"},
{18896, "Bandana6"},
{18897, "Bandana7"},
{18898, "Bandana8"},
{18899, "Bandana9"},
{18900, "Bandana10"},
{18901, "Bandana11"},
{18902, "Bandana12"},
{18903, "Bandana13"},
{18904, "Bandana14"},
{18905, "Bandana15"},
{18906, "Bandana16"},
{18907, "Bandana17"},
{18908, "Bandana18"},
{18909, "Bandana19"},
{18910, "Bandana20"},
{18911, "Mask1"},
{18912, "Mask2"},
{18913, "Mask3"},
{18914, "Mask4"},
{18915, "Mask5"},
{18916, "Mask6"},
{18917, "Mask7"},
{18918, "Mask8"},
{18919, "Mask9"},
{18920, "Mask10"},
{18921, "Beret1"},
{18922, "Beret2"},
{18923, "Beret3"},
{18924, "Beret4"},
{18925, "Beret5"},
{18926, "Hat1"},
{18927, "Hat2"},
{18928, "Hat3"},
{18929, "Hat4"},
{18930, "Hat5"},
{18931, "Hat6"},
{18932, "Hat7"},
{18933, "Hat8"},
{18934, "Hat9"},
{18935, "Hat10"},
{18936, "Helmet1"},
{18937, "Helmet2"},
{18938, "Helmet3"},
{18939, "CapBack1"},
{18940, "CapBack2"},
{18941, "CapBack3"},
{18942, "CapBack4"},
{18943, "CapBack5"},
{18944, "HatBoater1"},
{18945, "HatBoater2"},
{18946, "HatBoater3"},
{18947, "HatBowler1"},
{18948, "HatBowler2"},
{18949, "HatBowler3"},
{18950, "HatBowler4"},
{18951, "HatBowler5"},
{18952, "BoxingHelmet1"},
{18953, "CapKnit1"},
{18954, "CapKnit2"},
{18955, "CapOverEye1"},
{18956, "CapOverEye2"},
{18957, "CapOverEye3"},
{18958, "CapOverEye4"},
{18959, "CapOverEye5"},
{18960, "CapRimUp1"},
{18961, "CapTrucker1"},
{18962, "CowboyHat2"},
{18963, "CJElvisHead"},
{18964, "SkullyCap1"},
{18965, "SkullyCap2"},
{18966, "SkullyCap3"},
{18967, "HatMan1"},
{18968, "HatMan2"},
{18969, "HatMan3"},
{18970, "HatTiger1"},
{18971, "HatCool1"},
{18972, "HatCool2"},
{18973, "HatCool3"},
{18974, "MaskZorro1"},
{18976, "MotorcycleHelmet2"},
{18977, "MotorcycleHelmet3"},
{18978, "MotorcycleHelmet4"},
{18979, "MotorcycleHelmet5"},
{19006, "GlassesType1"},
{19007, "GlassesType2"},
{19008, "GlassesType3"},
{19009, "GlassesType4"},
{19010, "GlassesType5"},
{19011, "GlassesType6"},
{19012, "GlassesType7"},
{19013, "GlassesType8"},
{19014, "GlassesType9"},
{19015, "GlassesType10"},
{19016, "GlassesType11"},
{19017, "GlassesType12"},
{19018, "GlassesType13"},
{19019, "GlassesType14"},
{19020, "GlassesType15"},
{19021, "GlassesType16"},
{19022, "GlassesType17"},
{19023, "GlassesType18"},
{19024, "GlassesType19"},
{19025, "GlassesType20"},
{19026, "GlassesType21"},
{19027, "GlassesType22"},
{19028, "GlassesType23"},
{19029, "GlassesType24"},
{19030, "GlassesType25"},
{19031, "GlassesType26"},
{19032, "GlassesType27"},
{19033, "GlassesType28"},
{19034, "GlassesType29"},
{19035, "GlassesType30"},
{19036, "HockeyMask1"},
{19037, "HockeyMask2"},
{19038, "HockeyMask3"},
{19039, "WatchType1"},
{19040, "WatchType2"},
{19041, "WatchType3"},
{19042, "WatchType4"},
{19043, "WatchType5"},
{19044, "WatchType6"},
{19045, "WatchType7"},
{19046, "WatchType8"},
{19047, "WatchType9"},
{19048, "WatchType10"},
{19049, "WatchType11"},
{19050, "WatchType12"},
{19051, "WatchType13"},
{19052, "WatchType14"},
{19053, "WatchType15"},
{19085, "EyePatch1"},
{19086, "ChainsawDildo1"},
{19090, "PomPomBlue"},
{19091, "PomPomRed"},
{19092, "PomPomGreen"},
{19093, "HardHat2"},
{19094, "BurgerShotHat1"},
{19095, "CowboyHat1"},
{19096, "CowboyHat3"},
{19097, "CowboyHat4"},
{19098, "CowboyHat5"},
{19099, "PoliceCap2"},
{19100, "PoliceCap3"},
{19101, "ArmyHelmet1"},
{19102, "ArmyHelmet2"},
{19103, "ArmyHelmet3"},
{19104, "ArmyHelmet4"},
{19105, "ArmyHelmet5"},
{19106, "ArmyHelmet6"},
{19107, "ArmyHelmet7"},
{19108, "ArmyHelmet8"},
{19109, "ArmyHelmet9"},
{19110, "ArmyHelmet10"},
{19111, "ArmyHelmet11"},
{19112, "ArmyHelmet12"},
{19113, "SillyHelmet1"},
{19114, "SillyHelmet2"},
{19115, "SillyHelmet3"},
{19116, "PlainHelmet1"},
{19117, "PlainHelmet2"},
{19118, "PlainHelmet3"},
{19119, "PlainHelmet4"},
{19120, "PlainHelmet5"},
{19137, "CluckinBellHat1"},
{19138, "PoliceGlasses1"},
{19139, "PoliceGlasses2"},
{19140, "PoliceGlasses3"},
{19141, "SWATHelmet1"},
{19142, "SWATArmour1"},
{19160, "HardHat3"},
{19161, "PoliceHat1"},
{19162, "PoliceHat2"},
{19163, "GimpMask1"},
{19317, "bassguitar01"},
{19318, "flyingv01"},
{19319, "warlock01"},
{19330, "fire_hat01"},
{19331, "fire_hat02"},
{19346, "hotdog01"},
{19347, "badge01"},
{19348, "cane01"},
{19349, "monocle01"},
{19350, "moustache01"},
{19351, "moustache02"},
{19352, "tophat01"},
{19487, "tophat02"},
{19488, "HatBowler6"},
{19513, "whitephone"},
{19578, "Banana"},
{19418, "HandCuff"}
};

new AttachmentBones[][24] = {
{"Spine"},
{"Head"},
{"Left upper arm"},
{"Right upper arm"},
{"Left hand"},
{"Right hand"},
{"Left thigh"},
{"Right thigh"},
{"Left foot"},
{"Right foot"},
{"Right calf"},
{"Left calf"},
{"Left forearm"},
{"Right forearm"},
{"Left clavicle"},
{"Right clavicle"},
{"Neck"},
{"Jaw"}
};

new PintuKeluarPolisiPick;
new PintuMasukPolisiPick;
new PintuParkiranPolisi, PintuParkiranPolisiPick;
//new PlayerText3D:player3dtextid;

new PintuMasukDoopBarPick;
new PintuKeluarDoopBarPick;

//new message[526+1];
new savanna=0;
new blade=0;
new fence=0;

new labelajah[MAX_PLAYERS]; // variabel untuk label yang di buat
new unfreezeplayer=0;
new testlbplayer=0;

new edit_objectid = INVALID_OBJECT_ID;
new vehicleid_tokill = 0;

// For testing text material/texture replacements
new test_tex_objects[128];
new text_counter = 0;
new text_update_timer = -1;
new text_update_player = INVALID_PLAYER_ID;

//new cmd[256+1];


// mulai kerja sebagai minner
new KerjaMiningPickup, LokasiMining;


//new Text:txtSpriteTest[5];

new test_actor_id = INVALID_ACTOR_ID;

//new main( ) { }

forward UnFreezeMe();
forward ShowTestDialog();
forward TimedVehicleDeath();
forward UpdateTextTimer();
forward KembalikanMobilPedagangMakanan();


enum PlayerInfo
{
    ID, // id of the player
    Nick[24],
    Sandi[20], // name of the player
    UCP[20], // merukapak variabel enum untuk nama UCP ketika duty admin
    pAdmin, // admin level of the player
    pSkin,
    pMoney, //money of the player
    pKills, // Kills of the player
    pDeaths,
    pPosisiTerakhir,
    pPosisiMobil,
    Float:pPx,
    Float:pPy,
    Float:pPz,
    Float:pMx,
    Float:pMy,
    Float:pMz,
    pJobMechanic, // untuk informasi termasuk fraksi job mechanic atau tidak
    Float:pHealtM1,
    Mvw1,
    Minterior1,
    pSenjata1,
    pPeluru1,
    pTipeMobil,
    pPunyaMobil,
    pWord,
    pInterior, // deaths of the player
    pScore,
    pNeon,
    PlayerBar:pLaparBar, // score bar hungry of the player
    PlayerBar:pLoadingBar, // enum untuk bar lapar.
    pStatusLoadingBar, // 
    Float:pKecepatanKendaraan,
    pKendaraanDipakai,
    IP[16],
    pBoombox, // nilai integer bahwa ada kepemilikan boombox
    pFishingRod, // kalau dia sudah beli pancingan
    pWorms,	// beli umpan.
    pComponent, // component setiap user untuk bahan upgrade kendaraan yang ada.
    pFishes,	// ikan yang sedang di bawa.
    Coba, // Storing the ip of the player
        Logged, // Players logged in or not variable
        IsRegistered //checks if the player is registered or not.
};

new pInfo[MAX_PLAYERS][PlayerInfo];




SavePlayer(playerid) // ini adalah fungsi callback saveplayer untuk simpan data ke mysql
{
   	// fungsi untuk save player data
   // SendClientMessage(playerid, -1, "MySQL di coba untuk simpan");
    pInfo[playerid][pInterior] = GetPlayerInterior(playerid);
    pInfo[playerid][pWord] = GetPlayerVirtualWorld(playerid);

    if(pInfo[playerid][Logged] == 1)
    // checks if the player is logged
    {
    	// stock simpan data player
        new Query[500];
        format(Query, 500, "UPDATE `playerdata` SET `admin` = '%d', `score` = '%d', `money` = '%i',`component` = '%i', `kills` = '%d', `deaths` = '%d', `posisiorang` = '%s', `posisimobil` = '%s', `pword` = '%s', `pinterior` = '%s' WHERE `id` = '%d' LIMIT 1",
        pInfo[playerid][pAdmin],
        pInfo[playerid][pScore],
        pInfo[playerid][pMoney],
        pInfo[playerid][pComponent],
        pInfo[playerid][pKills],
        pInfo[playerid][pDeaths],
        pInfo[playerid][pPosisiTerakhir],
        pInfo[playerid][pPosisiMobil],
        pInfo[playerid][pWord],
        pInfo[playerid][pInterior],
        pInfo[playerid][ID]);

        mysql_query(MySQL:g_Sql,Query, bool:true);

        SendClientMessage(playerid, -1, "MySQL data uang anda telah di update :)");

        
		    
		for(new i; i < 13; i++) // looping through all weapon slots (0 - 12)
		{
			new
		    weaponid,
		    ammo;

		    // koding nyimpan senjata
		   	//GetPlayerWeaponData(playerid, slot, weapons, ammo)
		    GetPlayerWeaponData(playerid, i, weaponid, ammo); // get weaponid and ammo

		    if(!weaponid) continue; // don't insert if there's no weapon in this slot
		    new savesenjata[500];
	   		format(savesenjata, 500, "INSERT INTO player_weapons VALUES (%d, %d, %d) ON DUPLICATE KEY UPDATE ammo = %d;", pInfo[playerid][ID], weaponid, ammo, ammo);
		   	mysql_query(MySQL:g_Sql, savesenjata[499],bool:true); // parallel queries
		   	
		   	//SendClientMessage(playerid, -1, savesenjata);
		   	return 1;
		}


		new loaddataplayer[200];
	    format(loaddataplayer, sizeof(Query), "SELECT * FROM `playerdata` WHERE `id` COLLATE latin1_general_cs = '%i' LIMIT 1", pInfo[playerid][ID]);
	    mysql_query(MySQL:g_Sql, loaddataplayer[199], bool:true);

        
        // simpan posisi mobil.
        GetVehiclePos(mobilplayer1[playerid], Float:pInfo[playerid][pMx], Float:pInfo[playerid][pMy], Float:pInfo[playerid][pMz]);

	    new kordinatmobil[500];
	   	format(kordinatmobil, 500, "UPDATE `playerdata` SET `pmx` = '%f',`pmy` = '%f',`pmz` = '%f' WHERE `id` = '%i' LIMIT 1", Float:pInfo[playerid][pMx], Float:pInfo[playerid][pMy], Float:pInfo[playerid][pMz], pInfo[playerid][ID]);
	    mysql_query(MySQL:g_Sql, kordinatmobil[499], bool:true);
	    SendClientMessage(playerid, -1, kordinatmobil);
	    
	    printf("Mobil pindah posisi ke %f, %f, %f ke pemilik ID %i", Float:pInfo[playerid][pMx], Float:pInfo[playerid][pMy], Float:pInfo[playerid][pMz], pInfo[playerid][ID]);
    
		//this basically gets the variables and stores it to the players special identifier called "ID".


	    // fungsi untuk simpan posisi orang saat save data player


		GetPlayerPos(playerid, Float:pInfo[playerid][pPx], Float:pInfo[playerid][pPy], Float:pInfo[playerid][pPz]);

	    new simpanorang[500];
	    format(simpanorang, 500, "UPDATE `playerdata` SET `ppx` = '%f',`ppy` = '%f',`ppz` = '%f' WHERE `id` = '%d' LIMIT 1",
	    pInfo[playerid][pPx], pInfo[playerid][pPy], pInfo[playerid][pPz], pInfo[playerid][ID]);
	    //mysql_query(MySQL:handle, const query[], bool:use_cache = true)
	    mysql_query(MySQL:g_Sql,simpanorang, bool:true);


	    new lokasidisimpan[500];
	    format(lokasidisimpan, 500, "Disimpan pada posisi %f, %f, %f", pInfo[playerid][pPx], pInfo[playerid][pPy], pInfo[playerid][pPz] );
	    SendClientMessage(playerid, -1, lokasidisimpan);

    }

    // batas bila player sudah login
    return 1;
}

// STOCK UNTU SEMUA JENIS FUNGSI YANG AKAN DI PANGGIL

stock SetVehicleSpeedTT(vehicleid, Float:speed)
{
    new Float:x1, Float:y1, Float:z1, Float:x2, Float:y2, Float:z2, Float:a;
    GetVehicleVelocity(vehicleid, x1, y1, z1);
    GetVehiclePos(vehicleid, x2, y2, z2);
    GetVehicleZAngle(vehicleid, a); a = 360 - a;
    x1 = (floatsin(a, degrees) * (speed/100) + floatcos(a, degrees) * 0 + x2) - x2;
    y1 = (floatcos(a, degrees) * (speed/100) + floatsin(a, degrees) * 0 + y2) - y2;
    SetVehicleVelocity(vehicleid, x1, y1, z1);
}

forward Float: GetVehicleSpeed(vehicleid);
public Float: GetVehicleSpeed(vehicleid)
{
	new Float: speed = -1;

	if(vehicleid != INVALID_VEHICLE_ID)
	{
		new Float: x,
			Float: y,
			Float: z,
			Float: angle;

		GetVehicleVelocity(vehicleid, x, y, z);
		GetVehicleZAngle(vehicleid, angle);

		speed = x / floatsin(-angle, degrees);

		speed *= 100.0;
	}


	return speed;
}


stock GetPlayerSpeed(playerid, bool:kmh = true)
{
	new
		Float:xx, 
		Float:yy, 
		Float:zz, 
		Float:pSpeed;

	if(IsPlayerInAnyVehicle(playerid))
	{
		GetVehicleVelocity(GetPlayerVehicleID(playerid), xx, yy, zz);
	}
	else
	{
		GetPlayerVelocity(playerid, xx, yy, zz);
	}

	pSpeed = floatsqroot((xx * xx) + (yy * yy) + (zz * zz));
	return kmh ? floatround((pSpeed * 165.12)) : floatround((pSpeed * 103.9));
}


stock MySQL_Register(playerid)
{
    new Query[300];
    mysql_escape_string(pInfo[playerid][Nick], pInfo[playerid][Nick]);
    // escaping the name of the player to avoid sql_injections.
    mysql_escape_string(pInfo[playerid][IP], pInfo[playerid][IP]);
    // escaping the IP of the player to avoid sql_injections.
    // as you might've seen we haven't escaped the password here because it was already escaped in our register dialog
    new inputtext[20];
    format(Query, sizeof(Query), "INSERT INTO `playerdata` (`nick`, `password`, `ip`) VALUES('%s', '%s', '%s')", pInfo[playerid][Nick], inputtext, pInfo[playerid][IP]); // Here we use the INSERT option and insert the name, password, and ip of the player in the database.
    // we don't insert the score, admin, or any other variable because its automatically 0.
    
    mysql_query(MySQL:g_Sql, Query, bool:true);
    // here we do not need to cache_get_result_count or cache_get_row_count
    // because we are only inserting data in the database not selecting it
    //next we set the players logged variable to 1.
    //and the isregistered variable to 1 aswell.
    SendClientMessage(playerid, -1, "Anda sudah mencoba daftar ke server"COL_RED" PutuSuhartawan");
    pInfo[playerid][Logged] = 0; //Sets the login variable to 1, meaning logged in.
    pInfo[playerid][IsRegistered] = 1; // sets the registered variable to 1. meaning registered.
    return 1;
}

stock MySQL_Login(playerid)
{
    new Query[500];
    mysql_escape_string(pInfo[playerid][Nick], pInfo[playerid][Nick]); // escaping the name of the player to avoid sql_injections.
    format(Query, sizeof(Query), "SELECT * FROM `playerdata` WHERE `nick` COLLATE latin1_general_cs = '%s' LIMIT 1", pInfo[playerid][Nick]);
    mysql_query(g_Sql, Query);
    // here we select all of the user's data in the database and store it
    cache_get_result_count(g_Sql, Query);
    while(cache_get_row_count(g_Sql, Query))
    // here after the server has selected the user
    //from the database and stored its data we extract that data onto our enums.
    {
        mysql_escape_string("id", pInfo[playerid][ID]);
        // the special identifier of a user called "id"
        orm_load( pInfo[playerid][pAdmin],"admin");
        cache_get_value_int(0, "admin", pInfo[playerid][pAdmin]);
        // the admin level of the player
        orm_load( pInfo[playerid][pScore], "score"); SetPlayerScore(playerid, pInfo[playerid][pScore]);
        // here we fetch the score and save it to the enum and also save it to the server by using setplayerscore
        orm_load( pInfo[playerid][pMoney], "money"); GivePlayerMoney(playerid, pInfo[playerid][pMoney]);
        // here we fetch the score and save it to the enum and also save it to the server by using setplayerscore
       	orm_load(pInfo[playerid][pKills], "kills");
        // the amount of kills a player has
        orm_load(pInfo[playerid][pDeaths], "deaths");
        // the amount of deaths a player has
        //
        // the way to fetch a users stats from the database is:
        //mysql_escape_string("table_name", variable_to_store_in);  remember the "table_name" is case sensitive!
    }
    //cache_get_row_count(MySQL, Query);
    // here we free our result and end the SELECT process.  Remember this is very important otherwise you may receive high amount of lag in your server!
    pInfo[playerid][Logged] = 0; // sets the logged variable to 1 meaning logged in.
    return 1;
}








SpawnVehicle_InfrontOfPlayer(playerid, vehiclemodel, color1, color2)
{
	new Float:x,Float:y,Float:z;
	new Float:facing;
	new Float:distance;

    GetPlayerPos(playerid, x, y, z);
    GetPlayerFacingAngle(playerid, facing);

    new Float:size_x,Float:size_y,Float:size_z;
	GetVehicleModelInfo(vehiclemodel, VEHICLE_MODEL_INFO_SIZE, size_x, size_y, size_z);

	distance = size_x + 0.5;

  	x += (distance * floatsin(-facing, degrees));
    y += (distance * floatcos(-facing, degrees));

	facing += 90.0;
	if(facing > 360.0) facing -= 360.0;

	return CreateVehicle(vehiclemodel, x, y, z + (size_z * 0.25), facing, color1, color2, -1);
}

//------------------------------------------------






SpawnObject_InfrontOfPlayer(playerid, model)
{
	new Float:x,Float:y,Float:z;
	new Float:facing;
	new Float:distance;

    GetPlayerPos(playerid, x, y, z);
    GetPlayerFacingAngle(playerid, facing);

    distance = 5.0;

  	x += (distance * floatsin(-facing, degrees));
    y += (distance * floatcos(-facing, degrees));

	facing += 90.0;
	if(facing > 360.0) facing -= 360.0;

	return CreateObject(model, x, y, z, 0.0, 0.0, 0.0, 300.0);
}

//-------------------------------------------------

stock ProcessChatText(playerid, text[])
{
	new useindex=1;

    // Handle shouting prefix (!)
	if(text[0] == '!' && strlen(text) > 1) {
	    if(text[1] == ' ') useindex++;
     	TalkMessage(SHOUT_DISTANCE, playerid, "*shouts*", text[useindex]);
     	return;
	}

	// Handle quiet prefix (#)
	if(text[0] == '#' && strlen(text) > 1) {
	    if(text[1] == ' ') useindex++;
     	TalkMessage(LOW_DISTANCE, playerid, "*quietly*", text[useindex]);
     	return;
	}

	// Send to other players in range and fade
	TalkMessage(TALK_DISTANCE, playerid, "", text);
}

//---------------------------------------------

stock ProcessActionText(playerid, message[], actiontype)
{
    new ActionText[256+1];
    new ActionBubble[MAX_CHATBUBBLE_LENGTH+1];
    new PlayerName[MAX_PLAYER_NAME+1];

    GetPlayerName(playerid, PlayerName, sizeof(PlayerName));

	if(actiontype == ACTION_DO) {
		format(ActionText, 256, "* %s ((%s))", message, PlayerName);
		format(ActionBubble, MAX_CHATBUBBLE_LENGTH, "* (( %s ))", message);
	} else {
	    format(ActionText, 256, "* %s %s", PlayerName, message);
	    format(ActionBubble, MAX_CHATBUBBLE_LENGTH, "* %s", message);
	}

    LocalMessage(ACTION_DISTANCE, playerid, ACTION_COLOR, ActionText);
   	SetPlayerChatBubble(playerid, ActionBubble, ACTION_COLOR, ACTION_DISTANCE, CHAT_BUBBLE_TIME);
   	return 1;
}

//---------------------------------------------

new gOOCDisabled = false;

stock GlobalOOCMessage(playerid, message[])
{
	new msg[256+1];
	new PlayerName[MAX_PLAYER_NAME+1];

	if(gOOCDisabled) {
		CmdErrorMessage(playerid, "The OOC channel is not enabled right now");
		return;
	}

	GetPlayerName(playerid, PlayerName, sizeof(PlayerName));
	format(msg, 256, "(( %s: %s ))", PlayerName, message);

	for(new i = 0; i < MAX_PLAYERS; i++) { // for every player
		if(IsPlayerConnected(i)) { // Todo: check if player accepts occ
		    PlayerMessage(i, OOC_COLOR, msg);
		}
	}
}

//---------------------------------------------

stock ToggleOOC(playerid)
{
	if(IsPlayerAdmin(playerid)) {
	    // toggle it
	    if(gOOCDisabled) gOOCDisabled = false;
		else gOOCDisabled = true;

	    if(!gOOCDisabled) {
	        GlobalMessage(GENERAL_COLOR, "{D0D0D0}[ooc] channel is {80CC80}enabled");
		} else {
		    GlobalMessage(GENERAL_COLOR, "{D0D0D0}[ooc] channel is {CC8080}disabled");
		}
	} else {
	    CmdErrorMessage(playerid, "Your admin level isn't high enough to change this");
	}
}

//---------------------------------------------

stock ProcessLocalOOC(playerid, message[])
{
	new new_message[256+1];
	new PlayerName[MAX_PLAYER_NAME+1];
	GetPlayerName(playerid, PlayerName, sizeof(PlayerName));
	format(new_message, 256, "%s (( %s ))", PlayerName, message);
	LocalMessage(TALK_DISTANCE, playerid, LOCAL_TALK_COLOR, new_message);
}

//---------------------------------------------

stock ProcessMegaphone(playerid, message[])
{
	// Todo: add permissions on megaphone usage
   	new new_message[256+1];
	new PlayerName[MAX_PLAYER_NAME+1];
	GetPlayerName(playerid, PlayerName, sizeof(PlayerName));
	format(new_message, 256, "* Terdengar suara Megaphone %s bilang: %s", PlayerName, message);
	LocalMessage(MEGAPHONE_DISTANCE, playerid, MEGAPHONE_COLOR, new_message, 1);
}

//---------------------------------------------

stock ProcessWhisper(playerid, toplayerid, message[])
{
	new PlayerName[MAX_PLAYER_NAME+1];
	new ToPlayerName[MAX_PLAYER_NAME+1];
	new PmMessage[256+1];
	GetPlayerName(playerid,PlayerName,sizeof(PlayerName));
	GetPlayerName(toplayerid,ToPlayerName,sizeof(ToPlayerName));
	format(PmMessage, sizeof(PmMessage), ">> Anda Mengirim PM %s(%d): %s", ToPlayerName, toplayerid, message);
	PlayerMessage(playerid, WHISPER_COLOR, PmMessage);
	format(PmMessage, sizeof(PmMessage), "** Anda di PM %s(%d): %s", PlayerName, playerid, message);
	PlayerMessage(toplayerid, WHISPER_COLOR, PmMessage);
	PlayerPlaySound(toplayerid, 1085, 0.0, 0.0, 0.0);
}


public HilangkanPreviewBoombox(playerid)
{
	TextDrawHideForPlayer(playerid, Text:PerlihatkanBoombox);
}


public KembalikanMobilPedagangMakanan()
{
	SetVehiclePos(MobilPedagangMakanan,1550.1057,-2361.8955,13.5808);
	SetVehiclePos(MobilEmergencyAmbulance, -1707.3444,897.0047,24.7422);
	SetActorPos(susterdiresepsionis, -26.2559,153.6491,999.0569);
	DestroyDynamic3DTextLabel(ChatPedagangMenjualKeliling);
}
//---------------------------------------------


stock GivePlayerMoneyEx(playerid, money, description[]="None", bool:save=true, bool:game_text=true)
{
	if(money < 0 && GetPlayerMoneyEx(playerid) < money) return -1;

	new fmt_str[185];

	AddPlayerData(playerid, pMoney, +, money);
	GivePlayerMoney(playerid, money);

	/*
	format(fmt_str, sizeof fmt_str, "INSERT INTO money_log (uid,uip,time,money,description) VALUES (%d,'%s',%d,%d,'%s')", GetPlayerAccountID(playerid), GetPlayerIpEx(playerid), gettime(), money, description);
	mysql_query(mysql, fmt_str, false);

	if(save) save = false;

	format(fmt_str, sizeof fmt_str, "UPDATE accounts SET money=%d WHERE id=%d LIMIT 1", GetPlayerMoneyEx(playerid), GetPlayerAccountID(playerid));
	mysql_query(mysql, fmt_str, false);
	*/

	if(game_text)
	{
		format(fmt_str, sizeof fmt_str, "%s$%d", money < 0 ? ("~r~") : ("~g~+"), money);
		GameTextForPlayer(playerid, fmt_str, 4000, 1);
	}

	return 1;
}



//-------------------------------------------------
stock CreateExplosionEx(Float:X, Float:Y, Float:Z, type, Float:Radius, virtualworld)
{
	new x;
	while(x != MAX_PLAYERS) {
		if(IsPlayerConnected(x)) {
   			if(virtualworld == -1 || virtualworld == GetPlayerVirtualWorld(x)) {
				CreateExplosionForPlayer(x, X, Y, Z, type, Radius);
			}
		}
		x++;
	}
}

/////////////////////////////////////////////////////////////////////////////////////////

// ini public penting sekali untuk gamemode.
// di public ini juga bisa untuk hapus tapi lebih baik saat player connect.
public OnGameModeInit()
{
	
	LayarJadiMerah = TextDrawCreate(317.000000, 
		-400.000000, // ini adalah sumbu y supaya bisa pindah atas bawah
		 "Tabrakan");
	TextDrawFont(LayarJadiMerah, 1);
	TextDrawLetterSize(LayarJadiMerah, 200.258332, 100.750000);
	TextDrawTextSize(LayarJadiMerah, 1000.500000, 1000.500000);
	TextDrawSetOutline(LayarJadiMerah, 1);
	TextDrawSetShadow(LayarJadiMerah, 0);
	TextDrawAlignment(LayarJadiMerah, 2);
	TextDrawColor(LayarJadiMerah, 0xFF000011);
	TextDrawBackgroundColor(LayarJadiMerah, 255);
	TextDrawBoxColor(LayarJadiMerah, 0xFF000011);
	TextDrawUseBox(LayarJadiMerah, 1);
	//TextDrawSetProportional(LayarJadiMerah, 1);
	//TextDrawSetSelectable(LayarJadiMerah, 0);


	TeksInfoGreenZone = TextDrawCreate(517.000000, 
		277.000000, // ini adalah sumbu y supaya bisa pindah atas bawah
		 "GREEN ZONE AREA");
	TextDrawFont(TeksInfoGreenZone, 2);
	TextDrawLetterSize(TeksInfoGreenZone, 0.258332, 1.750000);
	TextDrawTextSize(TeksInfoGreenZone, 16.500000, 90.500000);
	TextDrawSetOutline(TeksInfoGreenZone, 1);
	TextDrawSetShadow(TeksInfoGreenZone, 0);
	TextDrawAlignment(TeksInfoGreenZone, 2);
	TextDrawColor(TeksInfoGreenZone, -1);
	TextDrawBackgroundColor(TeksInfoGreenZone, 255);
	TextDrawBoxColor(TeksInfoGreenZone, COLOR_GREEN);
	TextDrawUseBox(TeksInfoGreenZone, 1);
	TextDrawSetProportional(TeksInfoGreenZone, 1);
	TextDrawSetSelectable(TeksInfoGreenZone, 0);
	
	TeksSaatLogin = TextDrawCreate(517.000000, 377.000000, "LANGSUNG MASUK");
	TextDrawFont(TeksSaatLogin, 2);
	TextDrawLetterSize(TeksSaatLogin, 0.258332, 1.750000);
	TextDrawTextSize(TeksSaatLogin, 16.500000, 90.500000);
	TextDrawSetOutline(TeksSaatLogin, 1);
	TextDrawSetShadow(TeksSaatLogin, 0);
	TextDrawAlignment(TeksSaatLogin, 2);
	TextDrawColor(TeksSaatLogin, -1);
	TextDrawBackgroundColor(TeksSaatLogin, 255);
	TextDrawBoxColor(TeksSaatLogin, -16777016);
	TextDrawUseBox(TeksSaatLogin, 1);
	TextDrawSetProportional(TeksSaatLogin, 1);
	TextDrawSetSelectable(TeksSaatLogin, 1);

	/* contoh untuk preview model saat login
	TeksSaatLogin = TextDrawCreate(216.000000, 139.000000, "Preview_Model");
	TextDrawFont(TeksSaatLogin, 5);
	TextDrawLetterSize(TeksSaatLogin, 0.600000, 2.000000);
	TextDrawTextSize(TeksSaatLogin, 180.000000, 195.500000);
	TextDrawSetOutline(TeksSaatLogin, 0);
	TextDrawSetShadow(TeksSaatLogin, 0);
	TextDrawAlignment(TeksSaatLogin, 1);
	TextDrawColor(TeksSaatLogin, -1);
	TextDrawBackgroundColor(TeksSaatLogin, 65405);
	TextDrawBoxColor(TeksSaatLogin, -1811885057);
	TextDrawUseBox(TeksSaatLogin, 0);
	TextDrawSetProportional(TeksSaatLogin, 1);
	//TextDrawSetSelectable(TeksSaatLogin, 0);
	TextDrawSetPreviewModel(TeksSaatLogin, 172);
	TextDrawSetPreviewRot(TeksSaatLogin, -55.000000, 0.000000, 32.000000, 0.610000);
	TextDrawSetPreviewVehCol(TeksSaatLogin, 1, 1);
	*/




	/*
	// teks draw hanya untuk login tap ini salah.
	TeksSaatLogin = TextDrawCreate(0.000000, // untuk kekiri kalau nilai negatif ke kanan kalau positif
	 200.000000, // untuk arah teks di dorong atas bawah. nilai negatif untuk ke atas dan positif untuk kebawah.
	  "        "); // string untuk teks draw.
	TextDrawLetterSize(TeksSaatLogin, -0.0199, // kotak dari samping
	 8.110000); // kotak dari bawah

	TextDrawUseBox(TeksSaatLogin, 1);
	TextDrawBoxColor(TeksSaatLogin, 122);
	TextDrawAlignment(TeksSaatLogin, 1);
	TextDrawColor(TeksSaatLogin, 0);
	
	TextDrawSetOutline(TeksSaatLogin, 0);
	TextDrawBackgroundColor(TeksSaatLogin, 0);
	TextDrawFont(TeksSaatLogin, 1);
	TextDrawSetProportional(TeksSaatLogin, 0);
	TextDrawSetShadow(TeksSaatLogin, 0);
	TextDrawTextSize(TeksSaatLogin,-0.0199, // kotak dari samping
	 8.110000); // kotak dari bawah

	*/
	//TextDrawSetPreviewModel(Text:TeksSaatLogin, 217);
	//TextDrawSetPreviewRot(Text:TeksSaatLogin, -15.0, 0.0, 0.0);
	//TextDrawSetPreviewVehCol(Text:TeksSaatLogin, 1, 1);
	// contoh simpan data log

	/*
	// salinan untuk saat login
	TeksSaatLogin = TextDrawCreate(0.000000, // untuk kekiri kalau nilai negatif ke kanan kalau positif
	 300.000000, // untuk arah teks di dorong atas bawah. nilai negatif untuk ke atas dan positif untuk kebawah.
	  "DuniaPutu Corp."); // string untuk teks draw.
	TextDrawLetterSize(TeksSaatLogin, 3.255285, // kotak dari samping
	 5.674167); // kotak dari bawah

	TextDrawUseBox(TeksSaatLogin, 1);
	TextDrawBoxColor(TeksSaatLogin, COLOR_WHITE);
	TextDrawAlignment(TeksSaatLogin, 1);
	TextDrawColor(TeksSaatLogin, COLOR_AQUAGREEN);
	
	TextDrawSetOutline(TeksSaatLogin, 0);
	TextDrawBackgroundColor(TeksSaatLogin, COLOR_BLACK);
	TextDrawFont(TeksSaatLogin, 0);
	TextDrawSetProportional(TeksSaatLogin, 3);
	TextDrawSetShadow(TeksSaatLogin, 1);
	TextDrawSetPreviewModel(Text:TeksSaatLogin, 319);
	TextDrawSetPreviewRot(Text:TeksSaatLogin, -15.0, 0.0, 0.0);
	
	*/
	//ConnectNPC("[BOT]pemotor", "motor"); // ini untuk NPC pemotor tapi ga work?

	new String[500];
	//new playerid;
	format(String, sizeof(String), "PAYINFO: ");
	Log("logs/pay.log", String);
	mysql_log(ALL);



	// load teks draw nama server dan waktu server
	
	SetTimer("WaktuServer", 500, true);
	SetTimer("GantiWarna", 	5000, true);
 
	
 
    UI[0] = TextDrawCreate(639.516906, 1.583336, "DuniaPutu");
	TextDrawLetterSize(UI[0], 0.476837, 2.434166);
	TextDrawAlignment(UI[0], 3);
	TextDrawColor(UI[0], -1);
	TextDrawSetShadow(UI[0], 0);
	TextDrawSetOutline(UI[0], 0);
	TextDrawBackgroundColor(UI[0], 255);
	TextDrawFont(UI[0], 1);
	TextDrawSetProportional(UI[0], 3);
	TextDrawSetShadow(UI[0], 0);

 
	UI[1] = TextDrawCreate(6.544635, 
	412.250122, "20:00:00");//Jam
	TextDrawLetterSize(UI[1], 0.461844, 2.247500);
	TextDrawAlignment(UI[1], 1);
	TextDrawColor(UI[1], -1);
	TextDrawSetShadow(UI[1], 0);
	TextDrawSetOutline(UI[1], 0);
	TextDrawBackgroundColor(UI[1], 255);
	TextDrawFont(UI[1], 2);
	TextDrawSetProportional(UI[1], 1);
	TextDrawSetShadow(UI[1], 0);
  
	UI[2] = TextDrawCreate(0.922398,
	 340.250061, // atur ke atas bawah
	  "01/Jan/2000");//TGL
	TextDrawLetterSize(UI[2], 0.455285, 0.574167);
	TextDrawAlignment(UI[2], 1);
	TextDrawColor(UI[2], -1);
	TextDrawSetShadow(UI[2], 0);
	TextDrawSetOutline(UI[2], 0);
	TextDrawBackgroundColor(UI[2], 255);
	TextDrawFont(UI[2], 2);
	TextDrawSetProportional(UI[2], 1);
	TextDrawSetShadow(UI[2], 0);

	UI[3] = TextDrawCreate(570.000000, // untuk kekiri kalau nilai negatif ke kanan kalau positif
	 310.000000, // untuk arah teks di dorong atas bawah. nilai negatif untuk ke atas dan positif untuk kebawah.
	  "Energy"); // string untuk teks draw.
	TextDrawLetterSize(UI[3], 0.255285, // kotak dari samping
	 1.674167); // kotak dari bawah
	TextDrawUseBox(UI[3], 1);
	TextDrawBoxColor(Text:UI[3], COLOR_AQUAGREEN);
	TextDrawAlignment(UI[3], 1);
	TextDrawColor(UI[3], -1);
	TextDrawSetShadow(UI[3], 0);
	TextDrawSetOutline(UI[3], 0);
	TextDrawBackgroundColor(UI[3], 255);
	TextDrawFont(UI[3], 1);
	TextDrawSetProportional(UI[3], 3);
	TextDrawSetShadow(UI[3], 0);
		

	panelkecepatankendaraan = TextDrawCreate(470.000000, // untuk kekiri kalau nilai negatif ke kanan kalau positif
	 210.000000, // untuk arah teks di dorong atas bawah. nilai negatif untuk ke atas dan positif untuk kebawah.
	  "Kecepatan"); // string untuk teks draw.
	TextDrawLetterSize(panelkecepatankendaraan, 0.255285, // kotak dari samping
	 2.074167); // kotak dari bawah
	TextDrawUseBox(panelkecepatankendaraan, 3);

	TextDrawBoxColor(panelkecepatankendaraan, COLOR_AQUAGREEN);
	TextDrawAlignment(panelkecepatankendaraan, 1);
	TextDrawColor(panelkecepatankendaraan, -1);
	TextDrawSetShadow(panelkecepatankendaraan, 0);
	TextDrawSetOutline(panelkecepatankendaraan, 0);
	TextDrawBackgroundColor(panelkecepatankendaraan, 255);
	TextDrawFont(panelkecepatankendaraan, 1);
	TextDrawSetProportional(panelkecepatankendaraan, 3);
	TextDrawSetShadow(panelkecepatankendaraan, 0);


	
	// tentang teks draw waktu dan nama server selesai

	//options = mysql_set_option(options, AUTO_RECONNECT, true); //disable auto-reconnect
	//options = mysql_set_option(options, POOL_SIZE, 1);
	//options = mysql_set_option(options, SERVER_PORT, 3306);
	//disable connection pool (and thus mysql_pquery)
	
	// simpan data log selesai

	//mysql_query(mySQLconnection, sprintf("INSERT INTO `playerdata` (`money`) VALUES ( '45')");
	//g_Sql = mysql_connect(SQL_HOST, SQL_USER, SQL_DB, SQL_PASS, options); // ini format konek yang salah
	//g_Sql = mysql_connect(SQL_HOST, SQL_USER, SQL_PASS, SQL_DB, options);
	//g_Sql = mysql_connect(SQL_HOST, SQL_USER, SQL_PASS, SQL_DB); // tanpan port rubahan
	/*g_Sql = mysql_connect(SQL_HOST, SQL_USER, SQL_PASS, SQL_DB, options);
	g_Sql = mysql_connect(SQL_HOST, SQL_USER, SQL_PASS, SQL_DB, options);
	g_Sql = mysql_connect(SQL_HOST, SQL_USER, SQL_PASS, SQL_DB, options);
	g_Sql = mysql_connect(SQL_HOST, SQL_USER, SQL_PASS, SQL_DB, options);*/
	//ConnectMySQL();
	//mysql_connect(SQL_HOST, SQL_USER, SQL_DB, SQL_PASS);
	
	//mysql_query(MySQL:handle, const query[], bool:use_cache = true)
	mysql_query(MySQL:g_Sql, "SELECT * FROM `playerdata` ORDER BY `playerdata`.`id` ASC", bool:true);
	//mysql_query(g_Sql, "INSERT INTO `playerdata` (`id`) VALUES ( '2')");
	//mysql_query(g_Sql, "INSERT INTO `playerdata` (`money`) VALUES ( '45')");

	//printf("[MYSQL]: Seharusnya bertambah angka 45 uangnya: %s !", SQL_DB);


	/*
	
	mysql_tquery(g_Sql, "INSERT INTO `playerdata` (`money`) VALUES ( '45')");
	mysql_pquery(g_Sql, "INSERT INTO `playerdata` (`money`) VALUES ( '45')");
	mysql_query(g_Sql, "INSERT INTO `playerdata` (`money`) VALUES ( '45')");
	mysql_query(g_Sql, "INSERT INTO `playerdata` (`money`) VALUES ( '45')");
	mysql_query(g_Sql, "INSERT INTO `playerdata` (`money`) VALUES ( '45')");
	mysql_query(g_Sql, "INSERT INTO `playerdata` (`money`) VALUES ( '45')");
	mysql_query(g_Sql, "INSERT INTO `playerdata` (`money`) VALUES ( '45')");
	mysql_query(g_Sql, "INSERT INTO `playerdata` (`money`) VALUES ( '45')");

	*/
	if(mysql_errno(MySQL:g_Sql) != 0) // worked
	{
		printf("[MYSQL]: MASI GAGAL KONEK KE DATABASE: %s !", SQL_DB);
	}
	else // didnt work
	{
		printf("[MYSQL INFORMASI] MENYATAKAN: SELAMAT SUDAH BERHASIL konek ke DATABASE BERNAMA: %s !", SQL_DB);
		
	}

	AddCharModel(305, 29999, "wartawan.dff", "wartawan.txd");
    AddCharModel(305, 20001, "lvpdpc2.dff", "lvpdpc2.txd");
    ConnectMySQL();
	SetGameModeText("Scrift Sering Sakit Maaf");
	

	

	BlackRadar= GangZoneCreate(-3334.758544, -3039.903808, 3049.241455, 3184.096191);

	
	ShowPlayerMarkers(PLAYER_MARKERS_MODE_GLOBAL);
	ShowNameTags(1);
	SetNameTagDrawDistance(40.0);
	EnableStuntBonusForAll(0);
	//DisableInteriorEnterExits();
	SetWeather(14);
	SetWorldTime(5);
	
	SetObjectsDefaultCameraCol(true);
	// anim untuk membuat cj run
	//UsePlayerPedAnims();
	ManualVehicleEngineAndLights();
	//LimitGlobalChatRadius(300.0);
	
	//ClassSel_InitTextDraws();

	// Player Class
	/*

	AddPlayerClass(299,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(300,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(301,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(302,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(303,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(304,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(305,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(280,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(281,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(282,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(283,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(284,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(285,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(286,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(287,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(288,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(289,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(265,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(266,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(267,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(268,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(269,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(270,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(1,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(2,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(3,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(4,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(5,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(6,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(8,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(42,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(65,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	//AddPlayerClass(74,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(86,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(119,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
 	AddPlayerClass(149,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(208,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(273,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(289,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	
	AddPlayerClass(47,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(48,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(49,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(50,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(51,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(52,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(53,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(54,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(55,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(56,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(57,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(58,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
   	AddPlayerClass(68,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(69,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(70,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(71,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(72,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(73,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(75,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(76,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(78,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(79,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(80,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(81,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(82,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(83,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(84,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(85,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(87,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(88,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(89,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(91,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(92,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(93,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(95,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(96,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(97,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(98,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(99,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	
	*/

	// SPECIAL

	total_vehicles_from_files += LoadStaticVehiclesFromFile("vehicles/trains.txt");
	total_vehicles_from_files += LoadStaticVehiclesFromFile("vehicles/pilots.txt");

   	// LAS VENTURAS
    total_vehicles_from_files += LoadStaticVehiclesFromFile("vehicles/lv_law.txt");
    total_vehicles_from_files += LoadStaticVehiclesFromFile("vehicles/lv_airport.txt");
    total_vehicles_from_files += LoadStaticVehiclesFromFile("vehicles/lv_gen.txt");
    
    // SAN FIERRO
    total_vehicles_from_files += LoadStaticVehiclesFromFile("vehicles/sf_law.txt");
    total_vehicles_from_files += LoadStaticVehiclesFromFile("vehicles/sf_airport.txt");
    total_vehicles_from_files += LoadStaticVehiclesFromFile("vehicles/sf_gen.txt");
    
    // LOS SANTOS
    total_vehicles_from_files += LoadStaticVehiclesFromFile("vehicles/ls_law.txt");
    total_vehicles_from_files += LoadStaticVehiclesFromFile("vehicles/ls_airport.txt");
    total_vehicles_from_files += LoadStaticVehiclesFromFile("vehicles/ls_gen_inner.txt");
    total_vehicles_from_files += LoadStaticVehiclesFromFile("vehicles/ls_gen_outer.txt");
    
    // OTHER AREAS
    total_vehicles_from_files += LoadStaticVehiclesFromFile("vehicles/whetstone.txt");
    total_vehicles_from_files += LoadStaticVehiclesFromFile("vehicles/bone.txt");
    total_vehicles_from_files += LoadStaticVehiclesFromFile("vehicles/flint.txt");
    total_vehicles_from_files += LoadStaticVehiclesFromFile("vehicles/tierra.txt");
    total_vehicles_from_files += LoadStaticVehiclesFromFile("vehicles/red_county.txt");

    printf("Semuanya tuan sudah muat jumlahnya %d kendaraan",total_vehicles_from_files);
    

    // ini untuk membuat cek point proses pencucian dan penitipan mobil
    CreateDynamicPickup( 1239, 1, Float:1568.6168, Float:-2183.2439, Float:13.8467,  0, 0, INVALID_PLAYER_ID, Float:30.00, -1, 0);
    CreateDynamic3DTextLabel(""COL_WHITE"**[PENITIPAN MOBIL]**\n\n nyalakan bell mobil "COL_RED"HORN\n"COL_WHITE" cuman $100", COLOR_ME, Float:1568.6168, Float:-2183.2439, Float:13.8467, Float:15.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID,  0, 0, 0, -1, Float:20.0, -1,0);
    


    // ini adalah mappingan untuk simpan sebuah lingkaran besar di sirkuit drit
    /*
    new objeklingkaran;
	objeklingkaran = CreateDynamicObject(19001, 2320.077392, 1476.048706, 29.589414, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(objeklingkaran, 0, 14548, "ab_cargo_int", "cargo_ceil2", COLOR_BLUE);
	*/
    
    // penambahan fungsi baru di gamemodeinit

    // fungsi supaya bisa rental sepeda di bandara kendari los santos
    //CreateDynamicPickup(modelid, type, Float:x, Float:y, Float:z, worldid = -1, interiorid = -1, playerid = -1, Float:streamdistance = STREAMER_PICKUP_SD, STREAMER_TAG_AREA areaid = STREAMER_TAG_AREA -1, priority = 0)
    CreateDynamicPickup( 1239, 1, Float:1585.7803, Float:-2202.4443, Float:13.5469,  0, 0, INVALID_PLAYER_ID, Float:30.00, -1, 0);
    CreateDynamic3DTextLabel(""COL_WHITE"**[RENTAL SEPEDA]**\n\n ketikan perintah "COL_RED"/rentalsepeda\n"COL_WHITE" cuman $50", COLOR_ME, Float:1585.7803, Float:-2202.4443, Float:13.5469, Float:15.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID,  0, 0, 0, -1, Float:20.0, -1,0);

   	
    // membuat gangzone contoh.
    //GangZoneCreate(Float:minx, Float:miny, Float:maxx, Float:maxy)
    new GZamanrumahsakit = GangZoneCreate(Float:-1878.5935 , Float:1095.0109, Float:-1542.2660, Float:842.9433);
    //GangZoneShowForPlayer(playerid, zone, )
    GangZoneShowForAll(GZamanrumahsakit,  0x00800099);
    //GangZoneFlashForAll(GZamanrumahsakit, COLOR_WHITE);
	
	//new GZamanrumahsakit = CreateDynamicRectangle(Float:-1878.5935 , Float:1095.0109, Float:-1542.2660, Float:842.9433, 0, 0,  -1,  0);
	//CreateDynamicRectangleEx(Float:minx, Float:miny, Float:maxx, Float:maxy, worlds[] = { -1 }, interiors[] = { -1 }, players[] = { -1 }, priority = 0, maxworlds = sizeof worlds, maxinteriors = sizeof interiors, maxplayers = sizeof players)
	//CreateDynamicRectangleEx(Float:minx, Float:miny, Float:maxx, Float:maxy, worlds[] = { -1 }, interiors[] = { -1 }, players[] = { -1 }, priority = 0, maxworlds = sizeof worlds, maxinteriors = sizeof interiors, maxplayers = sizeof players)

    // emergency dari ambulance
    //CreateVehicle(416, Float:x , Float:y , Float:z);
    //AddStaticVehicleEx(modelid, Float:spawn_x, Float:spawn_y, Float:spawn_z, Float:z_angle, color1, color2, respawn_delay, addsiren=0)
    MobilEmergencyAmbulance = AddStaticVehicleEx(416, Float:-1707.3444, Float:897.0047, Float:24.7422, Float:175.4169, 0,0, -1, 1);
    CreateDynamic3DTextLabel("**[PAPAN]**\n BLS kit sudah siap\n Ambulan siap melayani anda", COLOR_ME, 0.0, 0.6,0.35, Float:6.0, INVALID_PLAYER_ID, MobilEmergencyAmbulance,  0, 0, 0, -1, Float:20.0, -1,0);
    // pebisnis mobil makanan
    MobilPedagangMakanan =  AddStaticVehicle(423,1550.1057,-2361.8955,13.5808,0.0671, 0, 0);
    new engine, lights,alarm,doors,bonnet,boot,objective;
    GetVehicleParamsEx(MobilPedagangMakanan,engine,lights,alarm,doors,bonnet,boot,objective);

	SetVehicleParamsEx(MobilPedagangMakanan,VEHICLE_PARAMS_ON,VEHICLE_PARAMS_ON,alarm,doors,bonnet,boot,objective);
    //CreateDynamic3DTextLabel(const text[], color, Float:x, Float:y, Float:z, Float:drawdistance, attachedplayer = INVALID_PLAYER_ID, attachedvehicle = INVALID_VEHICLE_ID, testlos = 0, worldid = -1, interiorid = -1, playerid = -1, Float:streamdistance = STREAMER_3D_TEXT_LABEL_SD, STREAMER_TAG_AREA areaid = STREAMER_TAG_AREA -1, priority = 0)
    CreateDynamic3DTextLabel("[PAPAN] Menjual Aneka Makanan\n Serba $20 Yuk Murah di Beli", COLOR_ME, 0.0, 0.6,0.35, Float:15.0, INVALID_PLAYER_ID, MobilPedagangMakanan,  0, 0, 0,  -1, Float:20.0, -1,0);
    
    aktorpedagangmakanan = CreateActor(155,1553.9027,-2359.3181,13.5547,358.4258);
    SetActorVirtualWorld(aktorpedagangmakanan, 0); ApplyActorAnimation(aktorpedagangmakanan,"ON_LOOKERS", "shout_01", Float:4.0, 1, 1, 1, 1, 1);

    // pekerjaan sweeper bandara
    //AddStaticVehicle(modelid, Float:spawn_x, Float:spawn_y, Float:spawn_z, Float:z_angle, color1, color2)
    MobilSweeperBandara = AddStaticVehicle(574,1560.9934,-2309.1362,13.0200,90.7824,1,1);
    CreateDynamic3DTextLabel(""COL_RED"SIDEJOB SWEEPER\n"COL_GREEN"Tulis "COL_RED"/kerja \n"COL_GREEN" dalam mobil sweeper ini\n\n\n"COL_WHITE"untuk berkeja\n"COL_LRED"tentukan nasib anda",COLOR_GREEN,1560.9934,-2309.1362,13.0200,10.0,INVALID_PLAYER_ID,INVALID_PLAYER_ID, 0, 0);
    
    // untuk pekerjaan hauling di bandara
    MobilKerjaHauling = AddStaticVehicle(403,1584.7772,-2155.6304,13.8035,269.7189,1,1);
    TrailerHaulingDiBandara = AddStaticVehicle(435,1448.9202,-2286.5894,13.5468,89.6988,1,1);

    CreateDynamic3DTextLabel(""COL_RED"[ KERJA HAULING ]\n"COL_WHITE"Tulis "COL_RED"/kerja \n"COL_GREEN" dalam mobil sweeper ini\n\n\n"COL_WHITE"untuk berkeja\n"COL_LRED"tentukan nasib anda",COLOR_GREEN,1584.7772,-2155.6304,13.8035,10.0,INVALID_PLAYER_ID,INVALID_PLAYER_ID, 0, 0);
    
    new MobilTukangKargo = AddStaticVehicle(578,1617.4191,-2130.9641,13.5547,293.3173,1,1);
	new KotakKargo = CreateDynamicObject(19321,0.0,0.0,0.0,0.0,0.0,0.0);
	//CreateDynamicObject(modelid, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz, worldid = -1, interiorid = -1, playerid = -1, Float:streamdistance = STREAMER_OBJECT_SD, Float:drawdistance = STREAMER_OBJECT_DD, STREAMER_TAG_AREA areaid = STREAMER_TAG_AREA -1, priority = 0)
	//AttachDynamicObjectToVehicle(STREAMER_TAG_OBJECT objectid, vehicleid, Float:offsetx, Float:offsety, Float:offsetz, Float:rx, Float:ry, Float:rz)
	AttachDynamicObjectToVehicle(KotakKargo,MobilTukangKargo,-0.0165,-2.0660,1.2442,0.0,0.0,0.0);
	//AttachObjectToVehicle(objectid, vehicleid, Float:OffsetX, Float:OffsetY, Float:OffsetZ, Float:RotX, Float:RotY, Float:RotZ)

    //pekerjaan trading saham
    HasilTrading = CreateDynamic3DTextLabel(""COL_WHITE"KOMPUTER PRIBADI\nTulis /tradingsaham \n"COL_GREEN" Untuk mulai trading\n"COL_WHITE"akun premium\n"COL_LRED"tentukan deposit anda",COLOR_GREEN,-44.3967,174.4426,999.0569,20.0,INVALID_PLAYER_ID,INVALID_PLAYER_ID,-1,-1);
    
    // ini tentang bisnis iklan.
    TempatDisplayIklan = CreateDynamic3DTextLabel(""COL_WHITE"***[PAPAN IKLAN]***\nPasang Iklan Murah"COL_GREEN" Bandara\n"COL_WHITE"Selamat Datang\n"COL_LRED"Tourism",COLOR_GREEN,Float:1581.4403,Float:-2285.7283,Float:13.5396,Float:40.0,INVALID_PLAYER_ID,INVALID_PLAYER_ID,0,0);
    CreateDynamicPickup(1274, 1, 1557.3296,-2272.8071,13.5469, 0);
    //TempatBeriklan = CreateDynamicSphere(1557.3296,-2272.8071,13.5469, Float:2.0, 0, 0, -1, 0);
    //CreateDynamicSphere(Float:x, Float:y, Float:z, Float:size, worldid = -1, interiorid = -1, playerid = -1, priority = 0)
    //CreateDynamicCP(Float:x, Float:y, Float:z, Float:size, worldid = -1, interiorid = -1, playerid = -1, Float:streamdistance = STREAMER_CP_SD, STREAMER_TAG_AREA areaid = STREAMER_TAG_AREA -1, priority = 0)
   	// CreateDynamic3DTextLabel(const text[], color, Float:x, Float:y, Float:z, Float:drawdistance, attachedplayer = INVALID_PLAYER_ID, attachedvehicle = INVALID_VEHICLE_ID, testlos = 0, worldid = -1, interiorid = -1, playerid = -1, Float:streamdistance = STREAMER_3D_TEXT_LABEL_SD, STREAMER_TAG_AREA areaid = STREAMER_TAG_AREA -1, priority = 0)
    CreateDynamic3DTextLabel(""COL_WHITE"TEMPAT IKLAN\nTulis /iklan"COL_GREEN" Untuk Menulis iklan\n"COL_WHITE"Di Bandara\n"COL_LRED"Dengan Harga Murah",COLOR_GREEN, Float:1557.3296,Float:-2272.8071,Float:13.5469,Float:20.0,INVALID_PLAYER_ID,INVALID_PLAYER_ID,0,0);
    
    // mappingan interior biz money changer di work 2 interiorid 0.

    PintuMasukBizMoneyChangPick = CreatePickup(1272, 1, 1506.7028,-2179.6206,13.5620, 0);
	PintuKeluarBizMoneyChangPick = CreatePickup(1272, 1, -296.4943,1483.5664,1070.7504, 2);

	//teks untuk pikcup biz money changer
	Create3DTextLabel(""COL_WHITE"PUSH TO ENTER\nMoney Changer"COL_GREEN" Bandara\n"COL_WHITE"Selamat Datang\n"COL_LRED"Tourism",0xFFFFFFFF,1506.7028,-2179.6206,13.5620,20.0,0);
	Create3DTextLabel(""COL_WHITE"PUSH TO EXIT\nMoney Changer"COL_GREEN" Bandara\n"COL_WHITE"Trade Murah\n"COL_LRED"Tourism",0xFFFFFFFF,-296.4943,1483.5664,1070.7504,20.0,2);


    CreateDynamicObject(14576, -296.86697, 1494.12390, 1078.11389,   1.62000, -1.92000, 0.00000, 2 , 0);
    // ini adalah object pintu tempat bank
	pintubrangkasbiz = CreateDynamicObject(2634, -296.69016, 1501.73413, 1071.66125 + 5,   0.00000, 0.00000, 180.00000, 2 , 0);
	CreateDynamicObject(2332, -299.64529, 1517.24939, 1070.45691,   0.00000, 0.00000, 0.00000, 2 , 0);
	CreateDynamicObject(2332, -298.79199, 1517.24207, 1070.45691,   0.00000, 0.00000, 0.00000, 2 , 0);
	CreateDynamicObject(2332, -297.92276, 1517.24744, 1070.45691,   0.00000, 0.00000, 0.00000, 2 , 0);
	CreateDynamicObject(2332, -297.04465, 1517.25330, 1070.45691,   0.00000, 0.00000, 0.00000, 2 , 0);
	CreateDynamicObject(2332, -296.16833, 1517.26953, 1070.45691,   0.00000, 0.00000, 0.00000, 2 , 0);
	CreateDynamicObject(2332, -295.28772, 1517.32349, 1070.45691,   0.00000, 0.00000, 0.00000, 2 , 0);
	CreateDynamicObject(2332, -294.40381, 1517.34009, 1070.45691,   0.00000, 0.00000, 0.00000, 2 , 0);
	CreateDynamicObject(2332, -299.50650, 1517.09253, 1071.39136,   0.00000, 0.00000, 0.00000, 2 , 0);
	CreateDynamicObject(2332, -298.72806, 1517.07007, 1071.39136,   0.00000, 0.00000, 0.00000, 2 , 0);
	CreateDynamicObject(2332, -297.94815, 1517.19519, 1071.39136,   0.00000, 0.00000, 0.00000, 2 , 0);
	CreateDynamicObject(2332, -297.07520, 1517.14832, 1071.39136,   0.00000, 0.00000, 0.00000, 2 , 0);
	CreateDynamicObject(2332, -296.12149, 1517.22021, 1071.39136,   0.00000, 0.00000, 0.00000, 2 , 0);
	CreateDynamicObject(2332, -295.23346, 1517.21533, 1071.39136,   0.00000, 0.00000, 0.00000, 2 , 0);
	CreateDynamicObject(2332, -294.41537, 1517.41553, 1071.39136,   0.00000, 0.00000, 0.00000, 2 , 0);
	CreateDynamicObject(2754, -290.54276, 1493.17346, 1071.00806,   0.00000, 0.00000, 0.00000, 2 , 0);
	CreateDynamicObject(2180, -292.33066, 1497.42664, 1070.10596,   0.00000, 0.00000, 0.00000, 2 , 0);
	CreateDynamicObject(2180, -294.31717, 1497.38574, 1070.10596,   0.00000, 0.00000, 0.00000, 2 , 0);
	CreateDynamicObject(2180, -296.32635, 1497.40613, 1070.10596,   0.00000, 0.00000, 0.00000, 2 , 0);
	CreateDynamicObject(2180, -298.34827, 1497.40698, 1070.10596,   0.00000, 0.00000, 0.00000, 2 , 0);
	CreateDynamicObject(2180, -300.37775, 1497.42065, 1070.10596,   0.00000, 0.00000, 0.00000, 2 , 0);
	CreateDynamicObject(2180, -302.38351, 1497.40393, 1070.10596,   0.00000, 0.00000, 0.00000, 2 , 0);
	CreateDynamicObject(2180, -304.87003, 1499.37695, 1070.10596,   0.00000, 0.00000, 270.00000, 2 , 0);
	CreateDynamicObject(2180, -304.87604, 1501.32739, 1070.10596,   0.00000, 0.00000, 270.00000, 2 , 0);
	CreateDynamicObject(2180, -290.44012, 1498.37671, 1070.10596,   0.00000, 0.00000, 90.00000, 2 , 0);
	CreateDynamicObject(2180, -290.41708, 1500.35095, 1070.10596,   0.00000, 0.00000, 90.00000, 2 , 0);
	CreateDynamicObject(2309, -300.53226, 1498.45471, 1070.10596,   0.00000, 0.00000, 180.00000, 2 , 0);
	CreateDynamicObject(2309, -298.62415, 1498.48230, 1070.10596,   0.00000, 0.00000, 179.99451, 2 , 0);
	CreateDynamicObject(2309, -296.85922, 1498.49414, 1070.10596,   0.00000, 0.00000, 179.99451, 2 , 0);
	CreateDynamicObject(2309, -295.17157, 1498.63757, 1070.10596,   0.00000, 0.00000, 179.99451, 2 , 0);
	CreateDynamicObject(2309, -293.26782, 1498.61365, 1070.10596,   0.00000, 0.00000, 179.99451, 2 , 0);
	CreateDynamicObject(2309, -291.59940, 1498.75940, 1070.10596,   0.00000, 0.00000, 179.99451, 2 , 0);
	CreateDynamicObject(1649, -292.86682, 1497.26416, 1073.53223,   0.00000, 0.00000, 0.00000, 2 , 0);
	CreateDynamicObject(1649, -296.59625, 1497.32495, 1073.57141,   0.00000, 0.00000, 0.00000, 2 , 0);
	CreateDynamicObject(1649, -300.78131, 1497.33142, 1073.55139,   0.00000, 0.00000, 0.00000, 2 , 0);
	CreateDynamicObject(2180, -304.36710, 1497.56067, 1072.41199,   0.00000, 0.00000, 0.00000, 2 , 0);
	CreateDynamicObject(3260, -303.89990, 1497.43628, 1074.20593,   0.00000, 0.00000, 0.00000, 2 , 0);
	CreateDynamicObject(1649, -305.39377, 1499.45386, 1073.84790,   0.00000, 0.00000, 270.00000, 2 , 0);
	CreateDynamicObject(1649, -290.15015, 1499.85815, 1073.50623,   0.00000, 0.00000, 90.00000, 2 , 0);
	CreateDynamicObject(2754, -290.54352, 1493.98096, 1071.00806,   0.00000, 0.00000, 0.00000, 2 , 0);
	CreateDynamicObject(2754, -290.54169, 1494.77441, 1071.00806,   0.00000, 0.00000, 0.00000, 2 , 0);
	CreateDynamicObject(2754, -304.90341, 1493.20349, 1071.01538,   0.00000, 0.00000, 180.00000, 2 , 0);
	CreateDynamicObject(2754, -304.90866, 1493.97717, 1071.00806,   0.00000, 0.00000, 179.99451, 2 , 0);
	CreateDynamicObject(2754, -304.92480, 1494.77881, 1071.00562,   0.00000, 0.00000, 180.00000, 2 , 0);
	CreateDynamicObject(2771, -300.58331, 1497.18103, 1071.12988,   0.00000, 0.00000, 0.00000, 2 , 0);
	CreateDynamicObject(2771, -298.56274, 1497.26978, 1071.12988,   0.00000, 0.00000, 0.00000, 2 , 0);
	CreateDynamicObject(2771, -296.62137, 1497.35388, 1071.12988,   0.00000, 0.00000, 0.00000, 2 , 0);
	CreateDynamicObject(2771, -295.02042, 1497.25574, 1071.12988,   0.00000, 0.00000, 0.00000, 2 , 0);
	CreateDynamicObject(2771, -293.24567, 1497.43372, 1071.12988,   0.00000, 0.00000, 0.00000, 2 , 0);
	CreateDynamicObject(2771, -291.58124, 1497.46643, 1071.12988,   0.00000, 0.00000, 0.00000, 2 , 0);
	CreateDynamicObject(2614, -296.72122, 1482.08484, 1073.67151,   33.66001, 2.58000, 179.15999, 2 , 0);
	CreateDynamicObject(2614, -296.79407, 1501.42737, 1074.11426,   0.00000, 0.00000, 0.00000, 2 , 0);
	CreateDynamicObject(2957, -297.67880, 1481.38489, 1071.31018,   0.00000, 0.00000, 0.00000, 2 , 0);
	CreateDynamicObject(1892, -297.18051, 1482.30994, 1070.10596,   0.00000, 0.00000, 0.00000, 2 , 0);
	CreateDynamicObject(1892, -303.97128, 1495.99268, 1070.10596,   0.00000, 0.00000, 0.00000, 2 , 0);
	CreateDynamicObject(2894, -294.09531, 1497.20471, 1070.97693,   0.00000, 0.00000, 0.00000, 2 , 0);
	CreateDynamicObject(1622, -291.38187, 1491.86084, 1074.15479,   0.00000, 0.00000, 0.00000, 2 , 0);
	CreateDynamicObject(1627, -291.01019, 1491.98767, 1073.07202,   0.00000, 0.00000, 0.00000, 2 , 0);
	CreateDynamicObject(1616, -291.35782, 1496.80798, 1074.11365,   0.00000, 0.00000, 0.00000, 2 , 0);
	CreateDynamicObject(1550, -302.46555, 1497.78894, 1070.49927,   0.00000, 0.00000, 0.00000, 2 , 0);
	CreateDynamicObject(3389, -304.92987, 1489.15308, 1070.10596,   0.00000, 0.00000, 0.00000, 2 , 0);
	CreateDynamicObject(3389, -304.91171, 1488.15906, 1070.10596,   0.00000, 0.00000, 0.00000, 2 , 0);
	CreateDynamicObject(3389, -304.93658, 1490.13489, 1070.10596,   0.00000, 0.00000, 0.00000, 2 , 0);
	CreateDynamicObject(3389, -304.93857, 1491.08972, 1070.10596,   0.00000, 0.00000, 0.00000, 2 , 0);
	CreateDynamicObject(2009, -299.85272, 1485.17065, 1069.29297,   0.00000, 0.00000, 270.00000, 2 , 0);
	CreateDynamicObject(2120, -305.58801, 1482.12439, 1070.74377,   0.00000, 0.00000, 180.00000, 2 , 0);
	CreateDynamicObject(14532, -307.78625, 1481.84351, 1071.08862,   0.00000, 0.00000, 0.00000, 2 , 0);
	CreateDynamicObject(1571, -294.61948, 1480.82166, 1089.25854,   0.00000, 0.00000, 0.00000, 2 , 0);
	CreateDynamicObject(1622, -298.62320, 1481.74548, 1073.99158,   -1.26000, 1.74000, -122.22007, 2 , 0);
	CreateDynamicObject(172, -295.28125, 1498.43335, 1070.91931,   84.66002, -3.96000, 0.00000, 2 , 0);
	CreateDynamicObject(172, -291.58823, 1498.43274, 1070.91931,   84.66002, -3.96000, 0.00000, 2 , 0);
	CreateDynamicObject(172, -293.35498, 1498.30127, 1070.91931,   84.66002, -3.96000, 0.00000, 2 , 0);
	CreateDynamicObject(1523, -304.34656, 1497.41052, 1070.04626,   0.00000, 0.00000, 0.00000, 2 , 0);
	CreateDynamicObject(1550, -302.46555, 1497.78894, 1070.49927,   0.00000, 0.00000, 0.00000, 2 , 0);
	CreateDynamicObject(1550, -304.96970, 1499.20544, 1071.29907,   0.00000, 0.00000, 358.97974, 2 , 0);
	CreateDynamicObject(1550, -304.88315, 1498.54224, 1071.29907,   0.00000, 0.00000, 358.97974, 2 , 0);
	CreateDynamicObject(1622, -304.51956, 1501.45837, 1074.72974,   24.00000, -27.71999, 128.45996, 2 , 0);
	CreateDynamicObject(1649, -290.58188, 1489.91418, 1074.68787,   -0.96000, 0.60000, 93.21668, 2 , 0);
	CreateDynamicObject(1649, -290.27805, 1484.60291, 1071.51953,   -0.96000, 0.60000, 93.21668, 2 , 0);
	CreateDynamicObject(1622, -293.84317, 1517.22925, 1075.10388,   44.64005, -6.78002, 43.56000, 2 , 0);
	CreateDynamicObject(1649, -290.58188, 1489.91418, 1071.51953,   -0.96000, 0.60000, 93.21668, 2 , 0);
	CreateDynamicObject(2523, -291.79477, 1488.01819, 1070.62732,   0.00000, 0.00000, -93.89999, 2 , 0);
	CreateDynamicObject(2857, -293.83353, 1497.47205, 1070.90344,   0.00000, 0.00000, 0.00000, 2 , 0);
	CreateDynamicObject(19387, -293.86975, 1501.77356, 1071.34900,   0.00000, 0.00000, 89.81999, 2 , 0);
	CreateDynamicObject(2538, -291.13513, 1500.06799, 1069.72192,   0.36000, -0.06001, -94.44002, 2 , 0);




    //mappingan rumah di pantai marina di mulai
    new tmpobjid;
	tmpobjid = CreateDynamicObject(2021, 1396.714965, 2271.604492, 9.820311, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 11738, "mediccase1", "medicalbox1b", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10101, "2notherbuildsfe", "Bow_church_grass_alt", 0x00000000);
	tmpobjid = CreateDynamicObject(19366, 1877.879394, 1093.545898, 11.613034, 90.000000, 2.700000, 0.000000, -1, -1, -1, 300.00, 300.00); // adadeh
	SetDynamicObjectMaterialText(tmpobjid, 0, "mana", 120, "Ariel", 100, 1, 0x00000000, 0x00000000, 1);
	tmpobjid = CreateDynamicObject(18659, 1984.905639, 1305.233276, 9.527812, 0.000000, 0.000000, -93.299995, -1, -1, -1, 50.00, 50.00); // asd
	SetDynamicObjectMaterial(tmpobjid, 0, 1220, "boxes", "crate128", 0x00000000);
	SetDynamicObjectMaterialText(tmpobjid, 0, "putu", 120, "Ariel", 70, 1, 0xFF800000, 0xFF0000FF, 1);
	tmpobjid = CreateDynamicObject(8551, 1999.460449, 1309.567016, 8.257811, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterialText(tmpobjid, 0, "woow", 100, "Ariel", 100, 1, 0xFF800000, 0x00000000, 1);
	tmpobjid = CreateDynamicObject(18666, 2361.886962, 2324.719482, 9.320624, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 2591, "ab_partition1", "ab_fabricCheck2", 0x00000000);
	SetDynamicObjectMaterialText(tmpobjid, 0, "BOSYA", 110, "Ariel", 70, 1, 0xFF800000, 0xFF0000FF, 1);
	tmpobjid = CreateDynamicObject(11453, 2342.200195, 2345.923095, 12.050312, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10101, "2notherbuildsfe", "Bow_church_grass_alt", 0x00000000);
	SetDynamicObjectMaterialText(tmpobjid, 0, "PUTU LAGI", 70, "Ariel", 50, 1, 0xFF600000, 0xFF600000, 2);
	tmpobjid = CreateDynamicObject(11453, 2355.179443, 2342.133300, 12.430318, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); // 1
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10101, "2notherbuildsfe", "gz_vicdoor1", 0xFF0000FF);
	tmpobjid = CreateDynamicObject(18659, 2351.224365, 2323.303955, 8.600623, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterialText(tmpobjid, 0, "BOS#1", 140, "Ariel", 100, 1, 0xFFFFFFFF, 0x00000000, 1);
	tmpobjid = CreateDynamicObject(19366, 2340.166748, 2359.931152, 10.058214, -7.600008, -93.400009, -66.700019, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterialText(tmpobjid, 0, "PUTU", 120, "Ariel", 100, 1, 0xFFFFFFFF, 0xFF000000, 1);
	tmpobjid = CreateDynamicObject(4735, 2334.166748, 2382.498779, 12.680314, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterialText(tmpobjid, 0, "SUHARTAWAN", 130, "Ariel", 80, 1, 0xFFFFFFFF, 0x00000000, 1);
	tmpobjid = CreateDynamicObject(2020, 2314.504638, 2388.198730, 9.820311, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterialText(tmpobjid, 0, "PUTU", 100, "Ariel", 50, 1, 0xFFFFFFFF, 0x00000000, 1);
	tmpobjid = CreateDynamicObject(19370, 231.800003, -1792.400024, 14.000000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19597, "lsbeachside", "ceilingtiles4-128x128", 0x00000000);
	tmpobjid = CreateDynamicObject(19370, 228.300003, -1794.089843, 14.000000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19597, "lsbeachside", "ceilingtiles4-128x128", 0x00000000);
	tmpobjid = CreateDynamicObject(19370, 226.399993, -1794.099975, 14.000000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19597, "lsbeachside", "ceilingtiles4-128x128", 0x00000000);
	tmpobjid = CreateDynamicObject(19370, 231.800003, -1794.199951, 14.000000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19597, "lsbeachside", "ceilingtiles4-128x128", 0x00000000);
	tmpobjid = CreateDynamicObject(19370, 235.199996, -1794.199951, 14.000000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19597, "lsbeachside", "ceilingtiles4-128x128", 0x00000000);
	tmpobjid = CreateDynamicObject(19370, 235.300003, -1791.099975, 14.000000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19597, "lsbeachside", "ceilingtiles4-128x128", 0x00000000);
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	tmpobjid = CreateDynamicObject(4321, 2804.431884, 2505.352539, 58.854701, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2034, 2038.035400, 1316.302124, 11.189194, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2050, 2040.694946, 1312.441162, 10.928721, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2001, 2046.709472, 1297.515869, 9.189922, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19477, 2364.653564, 2323.011962, 7.140625, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2659, 2346.090576, 2351.480957, 9.820311, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(18649, 2033.921630, 1340.431152, 9.820311, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(18648, 2041.156250, 1385.769775, 9.671875, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1649, 245.100006, -1788.300048, 4.900000, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1649, 253.899414, -1788.099609, 4.900000, 0.000000, 0.000000, 179.994506, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2395, 242.300003, -1777.300048, 3.599999, 270.000000, 0.000000, 179.994506, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2395, 242.300003, -1777.300048, 0.800000, 0.000000, 0.000000, 179.994506, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2395, 242.300003, -1779.599975, 3.599999, 270.000000, 0.000000, 179.994506, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2395, 242.300003, -1781.800048, 3.599999, 270.000000, 0.000000, 179.994506, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2395, 246.199996, -1785.400024, 3.599999, 270.000000, 0.000000, 179.994506, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2395, 249.899993, -1785.400024, 3.599999, 270.000000, 0.000000, 179.994506, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2395, 253.600006, -1785.400024, 3.599999, 270.000000, 0.000000, 179.994506, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2395, 255.699218, -1785.399414, 3.599999, 270.000000, 0.000000, 179.994506, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2395, 246.100006, -1783.099975, 3.599999, 270.000000, 0.000000, 179.994506, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2395, 245.899993, -1781.800048, 3.599999, 270.000000, 0.000000, 179.994506, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2395, 246.100006, -1781.800048, 3.599999, 270.000000, 0.000000, 179.994506, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2395, 246.100006, -1781.800048, 0.800000, 0.000000, 0.000000, 179.994506, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2395, 245.600006, -1781.800048, 0.800000, 0.000000, 0.000000, 179.994506, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2395, 242.800003, -1781.400024, 0.800000, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2395, 242.800003, -1780.599975, 0.800000, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2395, 246.599609, -1785.099609, 0.800000, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2395, 249.699996, -1785.500000, 0.800000, 0.000000, 0.000000, 179.994506, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2395, 253.300003, -1785.500000, 0.800000, 0.000000, 0.000000, 179.994506, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2395, 255.699218, -1785.500000, 0.800000, 0.000000, 0.000000, 179.994506, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1649, 239.199996, -1782.300048, 4.900000, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2395, 242.800003, -1779.900024, 0.800000, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2395, 242.199996, -1776.599975, 0.800000, 0.000000, 0.000000, 179.994506, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2395, 242.300003, -1776.699951, 3.599999, 270.000000, 0.000000, 179.994506, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1649, 245.100006, -1795.599975, 4.900000, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1649, 249.500000, -1795.599975, 4.900000, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1649, 253.899993, -1795.599975, 4.900000, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2395, 239.199218, -1784.000000, 8.199999, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1649, 262.299987, -1790.500000, 4.900000, 0.000000, 0.000000, 179.994506, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1649, 262.299987, -1795.599975, 4.900000, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1523, 264.500000, -1792.000000, 3.283279, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1649, 249.500000, -1788.199951, 9.699999, 0.000000, 0.000000, 179.994506, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1649, 245.100006, -1788.199951, 9.699999, 0.000000, 0.000000, 179.994506, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1649, 236.899993, -1780.900024, 9.699999, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1523, 234.799804, -1780.799804, 8.000000, 0.000000, 0.000000, 179.994506, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1649, 230.199996, -1780.800048, 9.699999, 0.000000, 0.000000, 179.994506, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1649, 230.500000, -1795.699951, 9.699999, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1649, 234.899993, -1795.699951, 9.699999, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1649, 230.500000, -1795.699951, 9.699999, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1649, 234.899993, -1795.699951, 9.699999, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1649, 239.299804, -1795.699218, 9.699999, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1649, 239.299804, -1795.699218, 9.699999, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1649, 224.500000, -1786.800048, 4.900000, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1649, 224.500000, -1793.500000, 15.699999, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1649, 226.800003, -1787.500000, 15.699999, 0.000000, 0.000000, 179.994506, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1649, 234.899993, -1787.500000, 15.699999, 0.000000, 0.000000, 179.994506, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1649, 237.100006, -1789.699951, 15.699999, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1649, 234.800003, -1795.800048, 15.699999, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1649, 230.399993, -1795.800048, 15.699999, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2395, 259.299987, -1785.400024, 3.599999, 270.000000, 0.000000, 179.994506, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2395, 262.899993, -1785.400024, 3.599999, 270.000000, 0.000000, 179.994506, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2395, 262.899414, -1787.799804, 3.599999, 270.000000, 0.000000, 179.994506, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2395, 267.700012, -1790.500000, 3.599999, 270.000000, 0.000000, 179.994506, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2395, 267.700012, -1787.800048, 3.599999, 270.000000, 0.000000, 179.994506, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2395, 265.700012, -1787.800048, 3.599999, 270.000000, 0.000000, 179.994506, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2395, 259.399993, -1785.500000, 0.800000, 0.000000, 0.000000, 179.994506, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2395, 262.899993, -1785.500000, 0.800000, 0.000000, 0.000000, 179.994506, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2395, 263.399993, -1788.800048, 0.800000, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2395, 266.500000, -1787.800048, 0.800000, 0.000000, 0.000000, 179.994506, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2395, 267.700012, -1787.800048, 0.800000, 0.000000, 0.000000, 179.994506, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2395, 268.200012, -1791.099975, 0.800000, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2395, 268.200012, -1792.699951, 0.800000, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2395, 264.899993, -1793.199951, 0.800000, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3850, 239.100006, -1779.000000, 8.699999, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3850, 237.399993, -1777.300048, 8.699999, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3850, 234.000000, -1777.300048, 8.699999, 0.000000, 0.000000, 269.994506, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3850, 230.599609, -1777.299804, 8.699999, 0.000000, 0.000000, 269.989013, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3850, 227.199996, -1777.300048, 8.699999, 0.000000, 0.000000, 269.994506, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3850, 226.399993, -1777.300048, 8.699999, 0.000000, 0.000000, 269.994506, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3850, 224.699218, -1779.000000, 8.699999, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(638, 243.100006, -1778.000000, 3.900000, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(638, 243.100006, -1780.500000, 3.900000, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(638, 244.600006, -1781.500000, 3.900000, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(638, 246.899993, -1784.099975, 3.900000, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(638, 246.899993, -1782.699951, 3.900000, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(638, 246.000000, -1781.500000, 3.900000, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(638, 248.599609, -1785.099609, 3.900000, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(638, 251.199996, -1785.099975, 3.900000, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(638, 253.799804, -1785.099609, 3.900000, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(638, 256.399993, -1785.099975, 3.900000, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(638, 259.000000, -1785.099975, 3.900000, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(638, 261.600006, -1785.099975, 3.900000, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(638, 263.700012, -1786.500000, 3.900000, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(638, 262.799987, -1785.099975, 3.900000, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(638, 265.399993, -1787.500000, 3.900000, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(638, 268.500000, -1789.000000, 3.900000, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(638, 267.600006, -1787.500000, 3.900000, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(638, 265.899993, -1793.599975, 3.900000, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(638, 268.500000, -1792.599975, 3.900000, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(638, 267.500000, -1793.599975, 3.900000, 0.000000, 0.000000, 269.994506, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1649, 224.699996, -1786.800048, 4.900000, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1649, 245.100006, -1795.800048, 4.900000, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1649, 249.500000, -1795.800048, 4.900000, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1649, 253.899993, -1795.800048, 4.900000, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1649, 262.299987, -1795.800048, 4.900000, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1649, 262.299804, -1790.500000, 4.900000, 0.000000, 0.000000, 179.994506, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1649, 253.899993, -1788.300048, 4.900000, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1649, 253.467315, -1784.998168, 4.900000, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1472, 225.299804, -1792.099609, 7.599999, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1472, 226.699218, -1792.099609, 7.599999, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1472, 227.500000, -1792.099609, 7.599999, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1470, 225.299804, -1794.099609, 7.000000, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1470, 225.299804, -1794.799804, 7.000000, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1470, 226.699218, -1794.799804, 7.000000, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1470, 226.699218, -1794.099609, 7.000000, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1472, 227.799804, -1793.799804, 7.000000, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1472, 227.799804, -1794.899414, 7.000000, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1472, 228.800003, -1795.000000, 6.199999, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1472, 229.899993, -1795.000000, 5.400000, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1472, 230.800003, -1795.000000, 4.599999, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1472, 231.699218, -1795.000000, 3.799999, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1472, 228.800003, -1793.800048, 6.199999, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1472, 229.899993, -1793.699951, 5.400000, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1472, 230.800003, -1793.699951, 4.599999, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1472, 231.699996, -1793.699951, 3.799999, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(14535, 227.399414, -1781.500000, 5.599999, 0.000000, 0.000000, 179.994506, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2531, 230.699996, -1779.000000, 3.599999, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2532, 230.699996, -1778.000000, 3.599999, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2533, 230.699996, -1780.000000, 3.599999, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2011, 230.399993, -1780.800048, 3.599999, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1724, 225.199996, -1794.599975, 3.599999, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1724, 226.699996, -1795.099975, 3.599999, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1724, 227.699996, -1795.099975, 3.599999, 0.000000, 0.000000, 179.994506, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1724, 228.699996, -1795.099975, 3.599999, 0.000000, 0.000000, 179.994506, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1724, 225.199996, -1793.599975, 3.599999, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1724, 225.199996, -1792.599975, 3.599999, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2311, 226.699996, -1792.900024, 3.599999, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2852, 227.500000, -1792.900024, 4.099999, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(16151, 231.045837, -1786.468872, 8.399999, -0.059999, -0.119999, 180.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2229, 239.000000, -1781.400024, 8.100000, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2229, 239.000000, -1788.300048, 8.100000, 0.000000, 0.000000, 269.994506, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2229, 239.000000, -1788.000000, 8.100000, 0.000000, 0.000000, 269.994506, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2229, 239.000000, -1781.699951, 8.100000, 0.000000, 0.000000, 269.989013, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2232, 238.800003, -1781.300048, 12.000000, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2232, 238.800003, -1787.800048, 12.000000, 0.000000, 0.000000, 269.994506, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(14820, 237.300003, -1784.500000, 8.899999, 0.000000, 0.000000, 89.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2169, 237.379928, -1785.102050, 8.100000, -0.480010, 1.979990, 89.879997, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1491, 239.100006, -1791.900024, 8.100000, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2566, 247.899993, -1790.599975, 8.600000, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(14867, 246.500000, -1795.199951, 9.600000, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2296, 239.600006, -1790.800048, 8.100000, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1703, 242.500000, -1788.900024, 8.100000, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1472, 231.699996, -1794.900024, 8.500000, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1472, 230.800003, -1794.900024, 9.300000, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1472, 229.800003, -1794.900024, 10.100000, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1470, 226.699996, -1794.800048, 10.100000, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1470, 225.300003, -1794.800048, 10.100000, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1470, 226.699996, -1794.099975, 10.100000, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1472, 225.300003, -1792.099975, 10.899999, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1472, 226.699996, -1792.099975, 10.899999, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1470, 225.300003, -1794.099975, 10.100000, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1470, 226.600006, -1790.500000, 10.899999, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1470, 225.399993, -1790.500000, 10.899999, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1472, 228.500000, -1791.800048, 11.699999, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1472, 228.500000, -1790.400024, 11.699999, 0.000000, 0.000000, 269.994506, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1472, 229.399993, -1790.500000, 12.600000, 0.000000, 0.000000, 269.994506, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1472, 229.399993, -1791.800048, 12.600000, 0.000000, 0.000000, 269.994506, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1472, 230.399993, -1790.500000, 13.399999, 0.000000, 0.000000, 269.994506, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1472, 230.399993, -1791.800048, 13.399999, 0.000000, 0.000000, 269.994506, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1470, 227.800003, -1794.800048, 10.100000, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1470, 227.800003, -1794.099975, 10.100000, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1472, 229.800003, -1794.000000, 10.100000, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1472, 230.800003, -1794.000000, 9.300000, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1472, 231.699996, -1793.900024, 8.500000, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3850, 230.000000, -1793.000000, 8.600000, 0.000000, 0.000000, 269.989013, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3850, 226.399993, -1792.500000, 14.600000, 0.000000, 0.000000, 269.989013, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3850, 228.100006, -1792.500000, 14.600000, 0.000000, 0.000000, 269.989013, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3850, 226.300003, -1789.699951, 14.600000, 0.000000, 0.000000, 269.989013, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3850, 228.000000, -1789.699951, 14.600000, 0.000000, 0.000000, 269.989013, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 259.500000, -1793.300048, 3.500000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 262.700012, -1792.099975, 3.500000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 261.700012, -1792.099975, 3.500000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 262.799987, -1794.099975, 3.500000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 259.500000, -1794.099975, 3.500000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 256.299987, -1794.099975, 3.500000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 256.299987, -1791.000000, 3.500000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 256.200012, -1789.699951, 3.500000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 252.899993, -1789.699951, 3.500000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 249.600006, -1789.699951, 3.500000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 246.100006, -1789.699951, 3.500000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 242.800003, -1789.699951, 3.500000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 237.000000, -1793.699951, 15.600000, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 237.000000, -1789.300048, 18.799999, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 237.000000, -1794.000000, 15.600000, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 237.000000, -1794.000000, 18.799999, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 237.000000, -1792.099975, 18.799999, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 235.300003, -1787.599975, 18.799999, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 231.899993, -1787.599975, 18.799999, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 231.000000, -1787.599975, 15.600000, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 230.699996, -1787.599975, 15.600000, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 228.399993, -1787.599975, 18.799999, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 226.300003, -1787.599975, 18.799999, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 224.600006, -1789.300048, 18.799999, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 224.600006, -1792.800048, 18.799999, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 224.600006, -1793.900024, 18.799999, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 224.600006, -1789.300048, 15.600000, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 224.600006, -1789.599975, 15.600000, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 226.300003, -1795.699951, 15.600000, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 226.500000, -1795.699951, 15.600000, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 226.500000, -1795.699951, 18.799999, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 226.300003, -1795.699951, 18.799999, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 229.899993, -1795.699951, 18.799999, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 233.199996, -1795.699951, 18.799999, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 235.300003, -1795.699951, 18.799999, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19377, 229.000000, -1791.599975, 20.399999, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19377, 232.899993, -1791.599975, 20.399999, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 224.600006, -1789.300048, 12.399999, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 224.600006, -1789.300048, 9.199999, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 224.600006, -1789.300048, 8.100000, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 224.600006, -1790.699951, 4.900000, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 224.600006, -1794.000000, 4.900000, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 226.300003, -1795.699951, 4.900000, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 224.600006, -1790.699951, 12.399999, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 224.600006, -1790.699951, 9.199999, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 224.600006, -1790.699951, 8.100000, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 224.600006, -1794.000000, 9.199999, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 224.600006, -1794.000000, 12.399999, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 224.600006, -1794.000000, 8.100000, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 226.300003, -1777.599975, 12.399999, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 226.300003, -1795.699951, 10.500000, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 226.300003, -1795.699951, 8.100000, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 229.600006, -1795.699951, 12.399999, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 233.100006, -1795.699951, 12.399999, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 236.600006, -1795.699951, 12.399999, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 239.899993, -1795.699951, 12.399999, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 243.199996, -1795.699951, 9.500000, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 243.199996, -1795.699951, 12.399999, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 246.399993, -1795.699951, 12.399999, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 246.399993, -1795.699951, 9.500000, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 226.600006, -1795.699951, 10.500000, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 226.600006, -1795.699951, 8.100000, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 229.699996, -1795.699951, 4.900000, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 224.600006, -1785.900024, 12.399999, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 239.699996, -1779.199951, 11.399999, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 241.000000, -1779.199951, 11.399999, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 236.300003, -1779.199951, 11.399999, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 233.000000, -1779.199951, 11.399999, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 229.699996, -1779.199951, 11.399999, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 226.300003, -1779.199951, 11.399999, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 224.600006, -1782.500000, 12.399999, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 224.600006, -1779.300048, 12.399999, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 226.299804, -1795.699218, 12.399999, 90.000000, 180.000000, 269.999938, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 229.600006, -1777.599975, 12.399999, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 232.800003, -1777.599975, 12.399999, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 236.300003, -1777.599975, 12.399999, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 239.600006, -1777.599975, 12.399999, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 241.000000, -1777.599975, 12.399999, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 224.600006, -1782.500000, 9.199999, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 224.600006, -1785.900024, 9.199999, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 224.600006, -1785.900024, 8.100000, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 224.600006, -1782.900024, 4.800000, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 224.600006, -1782.900024, 8.100000, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 224.600006, -1779.599975, 4.800000, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 224.600006, -1778.900024, 4.800000, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 224.600006, -1778.900024, 6.400000, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 224.600006, -1779.599975, 6.400000, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 229.699996, -1795.699951, 6.500000, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 233.100006, -1795.699951, 4.900000, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 236.500000, -1795.699951, 4.900000, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 239.300003, -1795.699951, 4.900000, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 241.199996, -1795.699951, 4.900000, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 233.100006, -1795.699951, 6.500000, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 236.500000, -1795.699951, 6.500000, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 239.300003, -1795.699951, 6.500000, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 241.199996, -1795.699951, 6.500000, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 243.199996, -1795.699951, 8.100000, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 246.399993, -1795.699951, 8.100000, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 254.899993, -1794.099975, 12.500000, 0.000000, 330.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 255.899993, -1794.099975, 10.800000, 0.000000, 329.996337, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 255.899993, -1791.199951, 10.800000, 0.000000, 329.996337, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 255.899993, -1789.699951, 10.800000, 0.000000, 329.996337, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 254.899993, -1791.199951, 12.500000, 0.000000, 329.996337, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 254.899993, -1789.699951, 12.500000, 0.000000, 329.996337, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 253.500000, -1795.599975, 11.699999, 30.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 254.600006, -1795.599975, 10.000000, 29.998170, 0.000000, 269.994506, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 249.800003, -1795.699951, 12.399999, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 252.300003, -1795.699951, 12.399999, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 249.800003, -1795.699951, 9.500000, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 252.300003, -1795.699951, 9.500000, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 249.800003, -1795.699951, 8.100000, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 252.300003, -1795.699951, 8.100000, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 255.800003, -1795.699951, 8.100000, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 259.299987, -1795.699951, 8.100000, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 262.700012, -1795.699951, 8.100000, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 256.299987, -1794.099975, 8.000000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 252.800003, -1794.099975, 8.000000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 251.800003, -1794.099975, 8.000000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 251.699996, -1791.000000, 8.000000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 251.699996, -1789.800048, 8.000000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 255.199996, -1789.800048, 8.000000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 255.199996, -1791.000000, 8.000000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 259.500000, -1794.099975, 8.000000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 262.799987, -1794.099975, 8.000000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 256.299987, -1791.000000, 8.000000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 260.299987, -1792.000000, 8.000000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 262.799987, -1792.000000, 8.100000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 242.699996, -1779.300048, 12.399999, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 242.699996, -1780.300048, 12.399999, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 241.000000, -1782.400024, 11.399999, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 243.699996, -1783.400024, 11.399999, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 252.199996, -1786.400024, 11.500000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 248.699996, -1786.400024, 11.500000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 244.800003, -1786.400024, 11.399999, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 245.399993, -1786.400024, 11.399999, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 243.699996, -1783.400024, 11.399999, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 241.000000, -1783.400024, 11.399999, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 243.699996, -1781.699951, 12.399999, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 245.399993, -1783.400024, 12.399999, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 247.199996, -1784.800048, 12.399999, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 250.500000, -1784.800048, 12.399999, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 252.199996, -1784.800048, 12.399999, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 253.600006, -1788.099975, 11.699999, 29.998170, 0.000000, 269.994506, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 255.199996, -1788.099975, 8.899999, 29.998170, 0.000000, 269.994506, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 256.700012, -1788.099975, 6.400000, 29.998170, 0.000000, 269.994506, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 258.100006, -1788.099975, 3.900000, 29.998170, 0.000000, 269.994506, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 257.399993, -1789.699951, 8.300000, 0.000000, 329.996337, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 259.000000, -1789.699951, 5.599999, 0.000000, 329.996337, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 259.700012, -1789.699951, 4.400000, 0.000000, 329.996337, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 259.700012, -1790.300048, 4.400000, 0.000000, 329.996337, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 259.000000, -1790.300048, 5.599999, 0.000000, 329.996337, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 257.399993, -1790.300048, 8.300000, 0.000000, 329.996337, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 259.299987, -1789.800048, 8.300000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 262.100006, -1789.800048, 8.300000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 262.799987, -1789.800048, 8.300000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 254.000000, -1786.500000, 12.399999, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 248.199996, -1789.800048, 8.000000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 244.699996, -1789.800048, 8.000000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 241.199996, -1789.800048, 8.000000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 237.899993, -1789.800048, 8.000000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 237.300003, -1786.900024, 8.000000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 237.300003, -1784.000000, 8.000000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 237.300003, -1780.900024, 8.000000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 238.399993, -1779.500000, 8.000000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 238.399993, -1778.800048, 8.000000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 235.000000, -1778.800048, 8.000000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 231.500000, -1778.800048, 8.000000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 228.500000, -1778.800048, 8.000000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 226.300003, -1778.800048, 8.000000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 233.899993, -1781.000000, 8.000000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 230.399993, -1781.000000, 8.000000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 226.399993, -1781.000000, 8.000000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 226.399993, -1784.000000, 8.000000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 226.399993, -1787.099975, 8.000000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 226.399993, -1790.099975, 8.000000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 226.500000, -1791.000000, 8.000000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 229.899993, -1791.500000, 8.000000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 229.899993, -1788.800048, 8.000000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 229.899993, -1786.000000, 8.000000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 229.899993, -1782.900024, 8.000000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 229.800003, -1781.900024, 8.000000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 233.300003, -1791.500000, 8.064849, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 234.500000, -1794.099975, 8.000000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 233.300003, -1788.500000, 8.000000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 236.199996, -1790.400024, 8.000000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 233.300003, -1783.500000, 8.000000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 234.800003, -1783.699951, 8.000000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 234.500000, -1786.199951, 8.000000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 235.600006, -1789.400024, 8.000000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 237.000000, -1792.400024, 8.000000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 238.000000, -1794.099975, 8.000000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 239.100006, -1790.199951, 9.600000, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 240.500000, -1792.599975, 8.000000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 241.399993, -1794.099975, 8.000000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 244.899993, -1794.099975, 8.000000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 244.000000, -1792.400024, 8.000000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 247.300003, -1792.199951, 8.000000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 248.300003, -1794.099975, 8.000000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 257.299987, -1791.000000, 8.000000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 248.399993, -1792.099975, 8.000000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 231.800003, -1789.199951, 14.000000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 228.300003, -1788.199951, 14.000000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 226.300003, -1788.199951, 14.000000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 235.100006, -1791.099975, 14.000000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 235.199996, -1789.099975, 14.000000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1649, 226.800003, -1787.699951, 15.699999, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1649, 234.699996, -1787.699951, 15.699999, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1649, 236.899993, -1789.900024, 15.699999, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 237.000000, -1793.599975, 15.600000, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 235.300003, -1789.099975, 14.000000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1649, 224.699996, -1793.500000, 15.699999, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1649, 230.399993, -1795.599975, 15.699999, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1649, 234.800003, -1795.599975, 15.699999, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 232.800003, -1786.199951, 8.000000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 239.100006, -1786.800048, 9.600000, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 239.100006, -1783.500000, 9.600000, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 239.100006, -1782.500000, 9.600000, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1649, 236.899993, -1780.699951, 9.699999, 0.000000, 0.000000, 179.994506, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 239.100006, -1782.500000, 12.399999, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 239.100006, -1783.500000, 12.399999, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 239.100006, -1786.800048, 12.399999, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 239.100006, -1790.199951, 12.399999, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19439, 244.699996, -1788.199951, 7.300000, 90.000000, 180.000000, 270.000122, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 240.800003, -1784.599975, 5.000000, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 240.800003, -1784.599975, 8.199999, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 240.800003, -1784.599975, 11.399999, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 240.800003, -1784.599975, 12.399999, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 243.000000, -1786.300048, 12.399999, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 243.000000, -1786.300048, 9.300000, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 243.000000, -1786.300048, 6.199999, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 243.000000, -1786.300048, 4.400000, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 241.300003, -1784.599975, 5.000000, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 241.300003, -1784.599975, 7.599999, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 241.300003, -1784.599975, 10.600000, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 241.300003, -1784.599975, 12.399999, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 241.300003, -1788.300048, 9.699999, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 243.000000, -1786.500000, 9.300000, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 243.000000, -1786.500000, 6.199999, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 243.000000, -1786.500000, 4.400000, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 243.000000, -1786.500000, 12.399999, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1649, 245.100006, -1788.400024, 9.699999, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1649, 249.500000, -1788.400024, 9.699999, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 252.199996, -1786.800048, 11.399999, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 248.699996, -1786.800048, 11.399999, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 245.399993, -1786.800048, 11.399999, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 244.800003, -1786.800048, 11.399999, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 241.300003, -1788.300048, 12.399999, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 244.699996, -1788.300048, 12.399999, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 246.500000, -1788.300048, 12.399999, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 249.800003, -1788.300048, 12.399999, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 252.399993, -1788.300048, 12.399999, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 253.399993, -1788.199951, 9.699999, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 250.500000, -1790.199951, 9.600000, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 250.500000, -1793.099975, 9.600000, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 250.500000, -1794.000000, 9.600000, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 250.500000, -1794.000000, 12.399999, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 250.500000, -1790.199951, 12.399999, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 250.500000, -1793.099975, 12.399999, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 240.800003, -1793.500000, 9.699999, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19439, 242.500000, -1794.300048, 9.800000, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19439, 242.500000, -1794.900024, 9.800000, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19439, 242.500000, -1794.900024, 12.300000, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19439, 242.500000, -1794.300048, 12.300000, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 240.800003, -1793.500000, 12.399999, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 239.100006, -1791.800048, 12.399999, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 239.100006, -1791.800048, 12.100000, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 226.300003, -1780.900024, 9.699999, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1649, 230.199996, -1781.000000, 9.699999, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19439, 232.500000, -1780.900024, 9.800000, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 226.300003, -1780.900024, 12.399999, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19439, 234.000000, -1780.800048, 12.199999, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19439, 229.300003, -1780.900024, 12.100000, 90.000000, 179.994506, 269.994506, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19439, 229.399993, -1780.900024, 13.199999, 90.000000, 179.994506, 269.994506, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19439, 232.500000, -1780.900024, 13.199999, 90.000000, 179.994506, 269.994506, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19439, 232.699996, -1780.900024, 12.100000, 90.000000, 179.994506, 269.994506, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19439, 236.300003, -1780.800048, 12.199999, 90.000000, 179.994506, 269.994506, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19439, 237.500000, -1780.900024, 12.199999, 90.000000, 179.994506, 269.994506, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19439, 235.899993, -1780.800048, 13.199999, 90.000000, 179.994506, 269.994506, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19439, 237.399993, -1780.800048, 13.199999, 90.000000, 179.994506, 269.994506, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 264.500000, -1794.099975, 4.400000, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 264.500000, -1794.099975, 7.500000, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 264.500000, -1794.099975, 8.000000, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 257.799987, -1795.699951, 4.900000, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 258.399993, -1795.699951, 4.900000, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 264.500000, -1793.699951, 4.400000, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 264.500000, -1793.699951, 7.199999, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 264.500000, -1793.699951, 8.000000, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 264.500000, -1792.199951, 7.300000, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 264.500000, -1792.199951, 8.000000, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 258.399993, -1790.500000, 5.000000, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 259.299987, -1792.099975, 3.500000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1649, 262.299987, -1790.500000, 4.900000, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 258.399993, -1790.500000, 6.900000, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 262.799987, -1788.199951, 8.000000, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 264.500000, -1789.900024, 8.000000, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 259.299987, -1788.199951, 8.000000, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 258.299987, -1788.199951, 8.000000, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19439, 261.500000, -1790.500000, 7.300000, 90.000000, 179.994506, 269.994506, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19439, 262.799987, -1790.500000, 7.300000, 90.000000, 179.994506, 269.994506, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1649, 249.276229, -1784.979125, 4.900000, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1649, 245.100006, -1788.099975, 4.900000, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19439, 248.100006, -1788.199951, 7.300000, 90.000000, 179.994506, 269.994506, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19439, 251.100006, -1788.199951, 7.300000, 90.000000, 179.994506, 269.994506, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19439, 253.699996, -1788.199951, 7.300000, 90.000000, 179.994506, 269.994506, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 226.300003, -1777.199951, 4.800000, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 226.300003, -1777.199951, 6.400000, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 229.600006, -1777.199951, 4.800000, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 229.600006, -1777.199951, 6.400000, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 233.000000, -1777.199951, 4.800000, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 233.000000, -1777.199951, 6.400000, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 236.399993, -1777.199951, 4.800000, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 236.399993, -1777.199951, 6.400000, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 238.300003, -1777.199951, 6.400000, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 238.300003, -1777.199951, 4.800000, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 239.100006, -1783.500000, 8.100000, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 239.100006, -1782.500000, 8.100000, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1649, 239.000000, -1782.300048, 4.900000, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 239.100006, -1786.199951, 4.900000, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 241.300003, -1788.199951, 4.900000, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 240.800003, -1788.199951, 4.900000, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 239.100006, -1786.500000, 4.900000, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 239.100006, -1786.500000, 6.300000, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 240.800003, -1788.199951, 6.300000, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 241.300003, -1788.199951, 6.300000, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 240.716140, -1776.754028, 3.900000, 29.998170, 0.000000, 269.994506, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 239.600006, -1776.800048, 5.800000, 29.998170, 0.000000, 269.994506, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 241.899993, -1778.300048, 4.900000, 0.000000, 329.996337, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 241.899993, -1779.099975, 4.900000, 0.000000, 329.996337, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 240.699996, -1780.599975, 3.900000, 29.998170, 0.000000, 269.994506, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 239.600006, -1780.599975, 5.800000, 29.998170, 0.000000, 269.994506, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 241.000000, -1779.099975, 6.500000, 0.000000, 329.996337, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 241.000000, -1778.300048, 6.500000, 0.000000, 329.996337, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 236.785263, -1779.051879, 11.427140, 90.000000, 0.000000, 0.059999, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 237.199996, -1780.699951, 4.800000, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 237.199996, -1780.699951, 6.400000, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 236.328506, -1779.010986, 8.232279, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 224.600006, -1782.900024, 5.199999, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 224.600006, -1778.900024, 5.000000, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 256.100006, -1790.000000, 4.900000, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 258.500000, -1791.900024, 4.900000, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 257.799987, -1791.900024, 4.900000, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 256.100006, -1790.199951, 4.900000, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 256.100006, -1790.000000, 6.400000, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 256.100006, -1790.199951, 6.400000, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 257.799987, -1791.900024, 6.400000, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 258.500000, -1791.900024, 6.400000, 90.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 239.300003, -1789.699951, 3.500000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 237.300003, -1786.599975, 3.500000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 237.300003, -1784.599975, 3.500000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 237.300003, -1782.300048, 3.500000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 233.800003, -1778.800048, 3.500000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 230.500000, -1778.800048, 3.500000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 227.199996, -1778.800048, 3.500000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 226.300003, -1778.800048, 3.500000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 226.300003, -1782.000000, 3.500000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 229.600006, -1782.000000, 3.500000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 233.100006, -1782.000000, 3.500000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 234.600006, -1782.000000, 3.500000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 226.399993, -1785.199951, 3.500000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 226.399993, -1788.099975, 3.500000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 226.399993, -1791.199951, 3.500000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 226.399993, -1794.099975, 3.500000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 252.899993, -1794.099975, 3.500000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 249.399993, -1794.099975, 3.500000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 245.800003, -1794.099975, 3.500000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 242.300003, -1794.099975, 3.500000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 238.800003, -1794.099975, 3.500000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 235.600006, -1794.099975, 3.500000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 232.500000, -1794.099975, 3.500000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 229.800003, -1794.099975, 3.500000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 235.800003, -1789.699951, 3.500000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 232.500000, -1789.699951, 3.500000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 229.899993, -1789.699951, 3.500000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 234.500000, -1785.000000, 3.500000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 234.399993, -1788.000000, 3.500000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 231.699996, -1786.699951, 3.500000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 231.399993, -1785.000000, 3.500000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 229.500000, -1784.300048, 3.500000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 229.199996, -1787.099975, 3.500000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 229.699996, -1792.400024, 3.500000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 233.199996, -1792.300048, 3.500000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 236.399993, -1792.199951, 3.500000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 239.600006, -1792.099975, 3.500000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 242.899993, -1792.199951, 3.500000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 246.399993, -1792.300048, 3.500000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 250.000000, -1792.500000, 3.500000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19370, 253.300003, -1791.699951, 3.500000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19377, 229.100006, -1781.699951, 14.000000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19377, 229.100006, -1782.900024, 14.000000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19377, 238.300003, -1781.699951, 14.000000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19377, 238.399993, -1782.699951, 14.000000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19377, 242.100006, -1785.699951, 14.000000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19377, 242.100006, -1791.800048, 14.000000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19377, 249.699996, -1788.699951, 14.000000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19377, 249.800003, -1791.800048, 14.000000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19377, 259.899993, -1791.900024, 9.600000, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2395, 269.423492, -1786.643432, 3.405980, -90.900123, 1.979979, 92.996978, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2395, 268.003234, -1790.463134, 9.566579, -86.460083, 2.819979, 93.597000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2395, 266.751556, -1786.642822, 3.405980, -86.460083, 2.819979, 93.597000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2332, 236.132385, -1794.750488, 15.330360, 0.000000, 0.000000, 267.280029, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2332, 236.045455, -1794.675781, 14.488320, 0.000000, 0.000000, -92.819976, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1550, 235.980667, -1793.582031, 14.140041, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2754, 230.565750, -1793.378540, 14.807370, -1.140029, -5.219969, -91.699996, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1622, 226.358383, -1794.684692, 19.842220, -242.100158, 207.479812, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(172, 229.504470, -1793.197021, 15.049790, 95.279998, 200.640014, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1726, 230.455856, -1788.781005, 14.018489, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1649, 238.670532, -1784.671386, 11.056579, 0.000000, 0.000000, -90.180023, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19377, 238.924911, -1785.883300, 11.435569, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(14535, 226.997329, -1785.747680, 9.970620, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19387, 235.536087, -1778.963256, 5.332099, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1523, 235.494689, -1778.145751, 3.562580, 0.000000, 0.360000, -88.440032, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1737, 249.394485, -1791.569702, 3.573610, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1726, 250.846954, -1792.954345, 3.385829, 0.000000, -0.479999, 180.419982, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(14820, 249.681259, -1791.521606, 7.604149, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2891, 249.649612, -1791.239257, 4.331099, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2859, 250.018295, -1791.654418, 4.466740, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(5837, 245.618743, -1799.748901, 4.639510, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2566, 227.344223, -1780.594970, 8.596469, 0.000000, 0.000000, 91.259986, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1622, 249.695419, -1789.068359, 12.458620, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 


    // marina rumah selesai

    //mapping sekitaran rumah sakit san fierro
    new rumahsakitlabel;
    rumahsakitlabel = CreateDynamicObject(8551, -1698.4700,883.7368,27.8906, 0.00000, 0.00000, 1.00000);
	SetDynamicObjectMaterialText(rumahsakitlabel, 1, "{FFFFFF}PUTUSUHARTAWAN\nLAYANAN SEKITAR\n\n{8F6B00}- KOTA SAN FIERRO -\n\n\n\n\n\n\n", 140, "Arial", 48, 1, 0xFF800000, 0xFF0000FF, 1);
	
	// mapppingan rumah sakit interior di world -1 intid -1
    //rumahsakitlabel = CreateDynamicObjectEx(19327,-1698.4559,883.7368,24.8906,0.000,0.000,-180.000,300.000,300.000);
	//SetDynamicObjectMaterialText(rumahsakitlabel, 0, "Rumah Sakit", 140, "Ariel", 35, 1, 0xFFFF0000, 0x00000000, 1);

	// membuat pekerjaan mining auto rp
	//
	KerjaMiningPickup = CreatePickup(18634, 1, -1698.4553,883.7368,24.8906,0);
	CreateDynamic3DTextLabel("Tulis /kerja\nuntuk bekerja disini.\n sebagai minner", -1, 2122.7329,-1738.5591,13.5644, Float:5.0);

	susterdiresepsionis = CreateActor(172, -26.2559,153.6491,999.0569,72.9205); SetActorVirtualWorld(susterdiresepsionis, -1); 
	ApplyActorAnimation(susterdiresepsionis, "KISSING", "gfwave2",4.0,1,1,1,1,0);
	new pertanyaansuster[100];
	format(pertanyaansuster, 100, "Lagi nunggu apa pak?\n\n Clarentin_Ainsley\n"COL_RED"-------");

	Create3DTextLabel(pertanyaansuster, COLOR_WHITE,-26.2559,153.6491,1000.0100,5.0,-1);

	// teks yang di tulis di rumah sakit
	Create3DTextLabel("TEKAN\n\n\n\n"COL_WHITE"[[ H ]]\n Untuk buka tutup pintu.", COLOR_RED,-30.7960,147.7576,1000.0569,5.0,-1);

    pintumasukrumahsakitsfpickup = CreatePickup(1241, 1, -1698.4553,883.7368,24.8906,-1);
    pintukeluarrumahsakitsfpickup = CreatePickup(1241, 1, -45.4473,157.7184,999.0613,-1);
    //Create3DTextLabel("HOSPITAL",COLOR_AQUA,-1698.4553,883.7368,25.00,20.0,0);
    Create3DTextLabel(""COL_WHITE"PUSH TO ENTER\nOwned by"COL_LRED2" Putu\n"COL_WHITE"Selamat Datang\n"COL_LRED"HOSPITAL",0xFFFFFFFF,-1698.4553,883.7368,24.8906,20.0,0);
	Create3DTextLabel(""COL_LRED"PINTU KELUAR\n"COL_WHITE"Rumah Sakit\n"COL_YELLOW"Selamat Berkaya\nSan Fierro",0xFFFFFFFF,-45.4473,157.7184,999.0613,10.0,-1);

    


    // objeck gate yang di dalam interior rumah sakit san fierror
    gatepertamadirumahsakit = CreateDynamicObject(975,-30.7960,147.7576,1000.0569,183.8291,0,0, -1, -1);

    // lalebrumahsakit
    new labelajah = CreateDynamicObject(19366, -27.372444, 151.134201, 1000.506530, 0.000000, 0.000000, 0.00, -1, -1); 
	SetDynamicObjectMaterialText(labelajah, 0, ""COL_PINK"RUMAH SAKIT", 140, "Arial", 70, 1, 0xFFFFFFFF, 0x00000000, 1);

	tmpobjid = CreateDynamicObject(14595,-30.670,153.639,1002.010,0.000,0.000,0.000,-1,-1,-1,400.000,400.000); 
	SetDynamicObjectMaterial(tmpobjid, 2, 14665, "genintint711_1", "mp_gun_mat", 0); 
	SetDynamicObjectMaterial(tmpobjid, 3, 4828, "airport3_las", "gnhotelwall02_128", 0); 
	SetDynamicObjectMaterial(tmpobjid, 5, 4828, "airport3_las", "gnhotelwall02_128", 0); 
	SetDynamicObjectMaterial(tmpobjid, 6, 14563, "triad_main", "sign_maintenance", 0); 
	SetDynamicObjectMaterial(tmpobjid, 7, 14577, "casinovault01", "ab_mottleSteps", 0); 
	SetDynamicObjectMaterial(tmpobjid, 8, 18031, "cj_exp", "mp_cloth_wall", 0); 
	SetDynamicObjectMaterial(tmpobjid, 9, 8488, "flamingo1", "flmngo06_128", 0); 
	SetDynamicObjectMaterial(tmpobjid, 10, 4828, "airport3_las", "gnhotelwall02_128", 0); 
	SetDynamicObjectMaterial(tmpobjid, 11, 9524, "blokmodb", "lombard_build5_3", 0); 
	SetDynamicObjectMaterial(tmpobjid, 12, 14488, "dogsgym", "AH_stolewindow", 0); 
	SetDynamicObjectMaterial(tmpobjid, 13, 14674, "civic02cj", "hotcarp01_LA", 0); 
	SetDynamicObjectMaterial(tmpobjid, 14, 14577, "casinovault01", "ab_mottleSteps", 0); 
	SetDynamicObjectMaterial(tmpobjid, 15, 14581, "ab_mafiasuitea", "barbersmir1", 0); 
	tmpobjid = CreateDynamicObject(14593,-13.630,148.850,1000.380,0.000,0.000,-90.000,-1,-1,-1,400.000,400.000); 
	SetDynamicObjectMaterial(tmpobjid, 0, 8396, "sphinx01", "luxorceiling02_128", 0); 
	SetDynamicObjectMaterial(tmpobjid, 1, 9903, "pier69", "rooftop_gz4", 0); 
	SetDynamicObjectMaterial(tmpobjid, 2, 14865, "gf2", "mp_bobbie_carpwhite", 0); 
	SetDynamicObjectMaterial(tmpobjid, 3, 8396, "sphinx01", "luxorceiling02_128", 0); 
	SetDynamicObjectMaterial(tmpobjid, 4, 4568, "skyscrap2_lan2", "sl_marblewall2", 0); 
	tmpobjid = CreateDynamicObject(11455,-21.370,155.339,1000.809,0.000,0.000,90.000,-1,-1,-1,400.000,400.000); 
	SetDynamicObjectMaterial(tmpobjid, 1, 3899, "hospital2", "ind_hospital1_128", 0); 
	tmpobjid = CreateDynamicObject(19325,-27.459,160.660,999.440,0.000,0.000,0.000,-1,-1,-1,400.000,400.000); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "shelf_glas", 0); 
	tmpobjid = CreateDynamicObject(19325,-27.399,152.100,1001.650,0.000,0.000,0.000,-1,-1,-1,400.000,400.000); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "shelf_glas", 0); 
	tmpobjid = CreateDynamicObject(19325,-27.399,158.740,1003.450,0.000,0.000,0.000,-1,-1,-1,400.000,400.000); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "shelf_glas", 0); 
	tmpobjid = CreateDynamicObject(2146,-33.020,138.779,998.549,0.000,0.000,15.119,-1,-1,-1,400.000,400.000); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14600, "paperchase_bits2", "ab_medbag", 0); 
	tmpobjid = CreateDynamicObject(19379,-27.379,150.479,994.049,0.000,0.000,0.000,-1,-1,-1,400.000,400.000); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18029, "genintintsmallrest", "GB_restaursmll15", 0); 
	tmpobjid = CreateDynamicObject(1789,-36.560,149.259,998.609,0.000,0.000,0.000,-1,-1,-1,400.000,400.000); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14600, "paperchase_bits2", "ab_medbag", 0); 
	tmpobjid = CreateDynamicObject(19379,-27.579,139.750,1006.400,0.000,0.000,0.000,-1,-1,-1,400.000,400.000); 
	SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "airvent_gz", 0); 
	tmpobjid = CreateDynamicObject(2146,-45.830,142.130,998.549,0.000,0.000,-89.580,-1,-1,-1,400.000,400.000); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14600, "paperchase_bits2", "ab_medbag", 0); 
	tmpobjid = CreateDynamicObject(2146,-45.840,144.070,998.549,0.000,0.000,-89.580,-1,-1,-1,400.000,400.000); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14600, "paperchase_bits2", "ab_medbag", 0); 
	tmpobjid = CreateDynamicObject(2146,-43.549,147.619,998.549,0.000,0.000,-89.580,-1,-1,-1,400.000,400.000); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14600, "paperchase_bits2", "ab_medbag", 0); 
	tmpobjid = CreateDynamicObject(2146,-39.540,140.360,998.549,0.000,0.000,-91.199,-1,-1,-1,400.000,400.000); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14600, "paperchase_bits2", "ab_medbag", 0); 
	tmpobjid = CreateDynamicObject(16444,-37.330,143.440,999.229,0.000,0.000,264.119,-1,-1,-1,400.000,400.000); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14526, "sweetsmain", "gb_binbag01", 0);
	tmpobjid = CreateDynamicObject(14532,-17.940,150.619,999.039,0.000,0.000,-90.000,-1,-1,-1,400.000,400.000); 
	SetDynamicObjectMaterial(tmpobjid, 2, 14392, "dr_gsstudio", "monitors_128", 0); 
	tmpobjid = CreateDynamicObject(14532,-17.909,148.520,999.039,0.000,0.000,-90.000,-1,-1,-1,400.000,400.000); 
	SetDynamicObjectMaterial(tmpobjid, 2, 14392, "dr_gsstudio", "monitors_128", 0); 
	tmpobjid = CreateDynamicObject(14532,-17.969,146.490,999.039,0.000,0.000,-90.000,-1,-1,-1,400.000,400.000); 
	SetDynamicObjectMaterial(tmpobjid, 2, 14392, "dr_gsstudio", "monitors_128", 0); 
	tmpobjid = CreateDynamicObject(14532,-17.989,144.429,999.039,0.000,0.000,-90.000,-1,-1,-1,400.000,400.000); 
	SetDynamicObjectMaterial(tmpobjid, 2, 14392, "dr_gsstudio", "monitors_128", 0); 
	tmpobjid = CreateDynamicObject(11455,-21.369,151.246,1000.807,0.000,0.000,90.000,-1,-1,-1,400.000,400.000); 
	SetDynamicObjectMaterial(tmpobjid, 1, 3899, "hospital2", "ind_hospital2_128", 0); 
	tmpobjid = CreateDynamicObject(11455,-28.379,152.083,997.857,89.899,0.000,90.000,-1,-1,-1,400.000,400.000); 
	SetDynamicObjectMaterial(tmpobjid, 1, 14525, "imy_motel2", "mp_motel_reception", 0); 
	tmpobjid = CreateDynamicObject(11455,-57.074,158.723,999.757,0.000,0.000,0.000,-1,-1,-1,400.000,400.000); 
	SetDynamicObjectMaterial(tmpobjid, 1, 14599, "paperchasebits", "sign_firstaid", 0); 
	tmpobjid = CreateDynamicObject(11455,-43.736,139.632,999.877,0.000,0.000,0.000,-1,-1,-1,400.000,400.000); 
	SetDynamicObjectMaterial(tmpobjid, 1, 2670, "proc_rub", "CJ_CERT_3", 0); 
	tmpobjid = CreateDynamicObject(14532,-7.050,151.389,999.039,0.000,0.000,-33.000,-1,-1,-1,400.000,400.000); 
	SetDynamicObjectMaterial(tmpobjid, 2, 14392, "dr_gsstudio", "monitors_128", 0); 
	tmpobjid = CreateDynamicObject(2146,-22.579,144.259,998.549,0.000,0.000,87.599,-1,-1,-1,400.000,400.000); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14600, "paperchase_bits2", "ab_medbag", 0); 
	tmpobjid = CreateDynamicObject(2146,-3.650,149.270,998.549,0.000,0.000,177.360,-1,-1,-1,400.000,400.000); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14600, "paperchase_bits2", "ab_medbag", 0); 
	tmpobjid = CreateDynamicObject(2146,-4.860,148.559,998.549,0.000,0.000,188.759,-1,-1,-1,400.000,400.000); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14600, "paperchase_bits2", "ab_medbag", 0); 
	tmpobjid = CreateDynamicObject(14532,-13.859,154.889,999.039,0.000,0.000,-180.000,-1,-1,-1,400.000,400.000); 
	SetDynamicObjectMaterial(tmpobjid, 2, 14392, "dr_gsstudio", "monitors_128", 0); 
	tmpobjid = CreateDynamicObject(14532,-12.020,154.889,999.039,0.000,0.000,-180.000,-1,-1,-1,400.000,400.000); 
	SetDynamicObjectMaterial(tmpobjid, 2, 14392, "dr_gsstudio", "monitors_128", 0); 
	tmpobjid = CreateDynamicObject(2207,-43.580,172.429,998.039,0.000,0.000,0.000,-1,-1,-1,400.000,400.000); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "gun_floor1", 0); 
	tmpobjid = CreateDynamicObject(2208,-43.740,173.589,997.950,0.000,0.000,0.000,-1,-1,-1,400.000,400.000); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "gun_floor1", 0); 
	tmpobjid = CreateDynamicObject(2207,-41.709,174.880,998.039,0.000,0.000,-180.000,-1,-1,-1,400.000,400.000); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "gun_floor1", 0); 
	tmpobjid = CreateDynamicObject(2208,-42.060,172.610,997.929,0.000,0.000,0.000,-1,-1,-1,400.000,400.000); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "gun_floor1", 0); 
	tmpobjid = CreateDynamicObject(2208,-42.090,174.490,997.929,0.000,0.000,0.000,-1,-1,-1,400.000,400.000); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "gun_floor1", 0); 
	tmpobjid = CreateDynamicObject(2207,-38.360,172.660,998.010,0.000,0.000,-270.000,-1,-1,-1,400.000,400.000); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "gun_floor1", 0); 
	tmpobjid = CreateDynamicObject(1789,-48.630,153.649,998.609,0.000,0.000,89.279,-1,-1,-1,400.000,400.000); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14600, "paperchase_bits2", "ab_medbag", 0); 
	tmpobjid = CreateDynamicObject(1789,-60.130,158.449,998.609,0.000,0.000,1.559,-1,-1,-1,400.000,400.000); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14600, "paperchase_bits2", "ab_medbag", 0); 
	tmpobjid = CreateDynamicObject(2146,-47.000,149.350,998.549,0.000,0.000,88.260,-1,-1,-1,400.000,400.000); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14600, "paperchase_bits2", "ab_medbag", 0); 
	tmpobjid = CreateDynamicObject(2146,-61.330,149.250,998.549,0.000,0.000,89.220,-1,-1,-1,400.000,400.000); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14600, "paperchase_bits2", "ab_medbag", 0); 
	tmpobjid = CreateDynamicObject(2146,-62.389,158.250,998.549,0.000,0.000,89.220,-1,-1,-1,400.000,400.000); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14600, "paperchase_bits2", "ab_medbag", 0); 
	tmpobjid = CreateDynamicObject(3578,-39.950,151.830,997.280,0.000,0.000,0.000,-1,-1,-1,400.000,400.000); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14853, "gen_pol_vegas", "blue_carpet_256", 0); 
	tmpobjid = CreateDynamicObject(3578,-45.259,156.720,997.280,0.000,0.000,90.000,-1,-1,-1,400.000,400.000); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14853, "gen_pol_vegas", "blue_carpet_256", 0); 
	tmpobjid = CreateDynamicObject(3578,-34.930,151.820,997.290,0.000,0.000,0.000,-1,-1,-1,400.000,400.000); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14853, "gen_pol_vegas", "blue_carpet_256", 0); 
	tmpobjid = CreateDynamicObject(3578,-30.020,146.910,997.280,0.000,0.000,90.000,-1,-1,-1,400.000,400.000); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14853, "gen_pol_vegas", "blue_carpet_256", 0); 
	tmpobjid = CreateDynamicObject(3578,-24.639,142.020,997.280,0.000,0.000,0.000,-1,-1,-1,400.000,400.000); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14853, "gen_pol_vegas", "blue_carpet_256", 0); 
	tmpobjid = CreateDynamicObject(3578,-15.140,142.009,997.280,0.000,0.000,0.000,-1,-1,-1,400.000,400.000); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14853, "gen_pol_vegas", "blue_carpet_256", 0); 
	tmpobjid = CreateDynamicObject(3578,-10.239,147.410,997.280,0.000,0.000,90.000,-1,-1,-1,400.000,400.000); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14853, "gen_pol_vegas", "blue_carpet_256", 0); 
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////// 
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////// 
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////// 
	tmpobjid = CreateDynamicObject(1523,-42.049,148.570,998.049,0.000,0.000,0.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(2611,-27.750,146.080,999.500,0.000,0.000,-89.940,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(2000,-22.069,149.029,998.059,0.000,0.000,-90.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(18074,-27.409,150.410,999.200,0.000,0.000,0.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(18001,-27.000,7680.000,151.000,0.000,0.000,0.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(2007,-22.069,149.779,998.049,0.000,0.000,-90.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(19325,-27.000,2976.000,158.000,0.000,0.000,0.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(2373,-27.290,150.039,996.909,0.000,0.000,-90.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(2373,-27.280,151.559,996.909,0.000,0.000,-90.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(2373,-27.270,153.080,996.909,0.000,0.000,-90.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(2373,-27.290,154.610,996.909,0.000,0.000,-90.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(1999,-26.770,149.470,998.059,0.000,0.000,90.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(1999,-26.780,151.470,998.059,0.000,0.000,90.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(1999,-26.770,153.449,998.059,0.000,0.000,90.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(2002,-22.999,158.160,998.059,0.000,0.000,0.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(2894,-26.750,151.500,998.869,0.000,0.000,99.180,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(2894,-26.670,149.570,998.869,0.000,0.000,86.819,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(2001,-21.969,150.589,998.059,0.000,0.000,-41.159,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(1811,-25.920,150.440,998.650,0.000,0.000,3.299,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(1811,-26.040,152.380,998.650,0.000,0.000,-1.500,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(1811,-26.049,154.330,998.650,0.000,0.000,-1.500,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(937,-38.889,144.710,998.530,0.000,0.000,90.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(937,-38.880,142.820,998.530,0.000,0.000,90.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(18074,-27.409,150.410,999.450,0.000,0.000,0.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(1778,-37.310,149.399,998.280,0.000,0.000,89.819,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(19379,-27.579,139.750,992.809,0.000,0.000,0.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(2001,-27.989,166.229,998.059,0.000,0.000,-42.180,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(2002,-28.000,8249.000,137.000,0.000,0.000,0.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(2002,-27.950,137.199,998.049,0.000,0.000,180.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(1997,-17.430,145.479,998.039,0.000,0.000,90.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(2004,-47.200,146.429,998.869,0.000,0.000,90.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(2004,-47.180,144.570,998.869,0.000,0.000,90.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(2004,-47.180,142.679,998.869,0.000,0.000,90.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(2004,-47.220,140.770,998.869,0.000,0.000,90.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(2004,-47.180,144.570,999.929,0.000,0.000,90.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(2004,-47.200,146.429,999.909,0.000,0.000,90.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(2004,-47.180,142.679,999.929,0.000,0.000,90.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(2004,-47.220,140.770,999.950,0.000,0.000,90.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(2905,-45.409,144.190,999.140,0.000,90.000,-88.559,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(2907,-46.189,144.110,999.099,0.000,0.000,-90.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(2905,-45.430,143.970,999.140,0.000,90.000,-92.160,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(2908,-46.750,144.059,999.109,14.000,90.000,-83.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(2906,-46.279,143.820,999.039,0.000,0.000,-120.900,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(2906,-46.240,144.289,999.099,0.000,180.000,-76.139,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(1997,-17.350,147.520,998.039,0.000,0.000,90.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(1997,-17.409,149.529,998.039,0.000,0.000,90.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(1997,-17.420,151.649,998.039,0.000,0.000,90.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(14693,-16.260,151.690,998.479,0.000,0.000,17.760,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(14693,-16.250,149.500,998.479,0.000,0.000,17.760,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(14693,-16.190,147.509,998.479,0.000,0.000,17.760,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(14693,-16.250,145.440,998.479,0.000,0.000,17.760,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(18084,-17.090,142.850,999.739,0.000,0.000,180.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(18084,-17.090,142.850,997.309,0.000,0.000,180.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(18084,-14.479,142.850,999.739,0.000,0.000,180.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(18084,-14.479,142.850,997.299,0.000,0.000,180.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(18084,-12.770,142.860,997.299,0.000,0.000,180.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(18084,-12.770,142.850,999.739,0.000,0.000,180.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(18084,-7.690,142.860,997.299,0.000,0.000,180.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(18084,-7.690,142.880,999.739,0.000,0.000,180.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(18084,-5.079,142.860,997.299,0.000,0.000,180.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(18084,-5.079,142.869,999.739,0.000,0.000,180.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(18084,-4.190,142.869,997.299,0.000,0.000,180.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(18084,-4.110,142.880,999.739,0.000,0.000,180.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(18084,-1.950,147.649,999.739,0.000,0.000,270.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(18084,-1.960,147.639,997.299,0.000,0.000,270.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(18084,-1.950,150.229,999.739,0.000,0.000,270.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(18084,-1.960,150.229,997.299,0.000,0.000,270.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(18084,-1.960,152.839,999.739,0.000,0.000,270.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(18084,-1.960,152.839,997.299,0.000,0.000,270.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(18084,-1.970,154.110,997.299,0.000,0.000,270.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(18084,-1.960,154.130,999.739,0.000,0.000,270.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(18084,-4.280,156.309,999.739,0.000,0.000,0.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(18084,-4.289,156.320,997.299,0.000,0.000,0.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(18084,-6.880,156.309,999.739,0.000,0.000,0.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(18084,-7.800,156.309,999.739,0.000,0.000,0.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(18084,-6.880,156.320,997.299,0.000,0.000,0.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(18084,-7.739,156.320,997.299,0.000,0.000,0.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(18084,-13.020,156.320,997.299,0.000,0.000,0.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(18084,-13.000,156.320,999.739,0.000,0.000,0.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(18084,-15.600,156.309,997.299,0.000,0.000,0.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(18084,-15.600,156.330,999.739,0.000,0.000,0.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(18084,-17.129,156.320,999.739,0.000,0.000,0.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(18084,-17.209,156.309,997.299,0.000,0.000,0.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(18084,-19.420,151.250,999.739,0.000,0.000,90.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(18084,-19.420,148.669,999.739,0.000,0.000,90.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(18084,-19.420,146.089,999.739,0.000,0.000,90.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(18084,-19.409,145.009,999.739,0.000,0.000,90.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(18084,-19.430,151.330,997.299,0.000,0.000,90.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(18084,-19.440,148.740,997.299,0.000,0.000,90.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(18084,-19.430,146.160,997.299,0.000,0.000,90.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(18084,-19.430,145.059,997.299,0.000,0.000,90.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(3383,-5.960,153.479,997.869,0.000,0.000,0.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(3394,-3.589,153.419,998.049,0.000,0.000,0.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(2690,-10.300,139.940,999.409,0.000,0.000,180.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(2690,-38.560,158.669,999.409,0.000,0.000,0.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(2792,-44.970,158.809,1001.320,0.000,0.000,0.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(2986,-39.840,139.779,1000.760,90.000,90.000,90.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(2994,-42.790,140.250,998.549,0.000,0.000,-90.120,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(14834,-43.169,158.350,998.349,0.000,0.000,-34.319,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(14834,-52.945,158.367,998.349,0.000,0.000,-71.519,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(14782,-23.980,158.429,999.030,0.000,0.000,0.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(1997,-12.890,154.320,998.039,0.000,0.000,0.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(1997,-14.729,154.339,998.039,0.000,0.000,0.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(14455,-41.970,167.389,999.659,0.000,0.000,0.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(14779,-39.020,182.009,1000.260,0.000,0.000,90.059,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(1714,-44.750,173.940,998.049,0.000,0.000,64.080,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(1715,-41.409,175.669,998.059,0.000,0.000,-13.560,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(1715,-40.049,175.750,998.059,0.000,0.000,-13.560,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(1715,-39.849,171.649,998.059,0.000,0.000,-153.119,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(1715,-41.099,171.520,998.059,0.000,0.000,-161.399,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(1723,-31.969,178.610,998.049,0.000,0.000,-48.299,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(1724,-30.469,175.550,998.059,0.000,0.000,-90.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(1724,-34.439,178.759,998.059,0.000,0.000,0.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(1737,-32.900,177.059,997.820,0.000,0.000,-48.479,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(1808,-28.540,173.619,998.049,0.000,0.000,-89.220,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(1846,-30.979,176.690,999.960,90.000,90.000,0.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(2001,-21.729,140.179,998.049,0.000,0.000,-31.920,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(2010,-30.389,176.089,998.049,0.000,0.000,-61.619,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(2010,-32.939,178.949,998.049,0.000,0.000,-136.679,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(2162,-44.270,167.279,999.140,0.000,0.000,180.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(2162,-33.860,167.240,999.179,0.000,0.000,180.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(2164,-46.779,176.789,998.049,0.000,0.000,90.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(2167,-46.810,169.979,998.049,0.000,0.000,90.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(2167,-46.830,169.080,998.049,0.000,0.000,90.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(2186,-37.330,178.720,998.059,0.000,0.000,0.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(2191,-28.889,171.770,998.049,0.000,0.000,-90.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(2191,-28.879,170.300,998.049,0.000,0.000,-90.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(2191,-28.879,168.830,998.049,0.000,0.000,-90.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(2190,-43.680,173.160,998.650,0.000,0.000,-127.080,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(2194,-43.430,173.020,999.109,0.000,0.000,0.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(2197,-23.020,152.300,998.059,0.000,0.000,-90.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(2197,-23.010,155.009,998.059,0.000,0.000,-90.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(2197,-23.010,154.350,998.059,0.000,0.000,-90.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(2197,-23.000,153.669,998.059,0.000,0.000,-90.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(2197,-23.020,152.979,998.059,0.000,0.000,-90.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(1778,-48.459,153.320,998.280,0.000,0.000,-6.900,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(1778,-60.479,158.270,998.280,0.000,0.000,-91.080,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(1569,-54.259,148.619,998.049,0.000,0.000,180.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(1502,-21.219,142.910,998.049,0.000,0.000,-90.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(1502,-31.469,166.899,998.049,0.000,0.000,0.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(2001,-33.520,166.220,998.059,0.000,0.000,-42.180,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(956,-33.380,144.539,998.460,0.000,0.000,90.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(955,-33.330,143.330,998.469,0.000,0.000,90.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(1209,-33.529,142.259,998.059,0.000,0.000,90.000,-1,-1,-1,400.000,400.000); 
	tmpobjid = CreateDynamicObject(1428,-46.709,145.960,999.539,0.000,0.000,90.419,-1,-1,-1,400.000,400.000);




	// ini adalah tambahan mappingan interior rumah berisi pabrik kecil kecilan rumah kecil-kecilan
	// ini kumpulan pickup di bandara
	tempatpickupbeligasstation = CreatePickup(19130, 2, 1586.7046,-2175.1416,13.8035, -1);

	Create3DTextLabel(""COL_RED"Gas Station Sulawesi\n"COL_YELLOW"DIJUAL\n\n"COL_WHITE"Rp. 2.086.693.552",COLOR_SPRINGGREEN,1586.7100,-2175.1416,14.8035,8.0,0);
	tempatrentalmobildibandarals = CreatePickup(1239, 1, 1557.3281,-2260.5244,13.5407, -1);
	Create3DTextLabel("Bandara Internasional\nSewa Mobil\nKENDARI",0xFFFFFFFF,1557.3281,-2260.5244,13.5407,10.0,0);
	//CreateActor(234, 1557.3281,-2260.5260,13.5407);
	//Create3DTextLabel("ANDA BUTUH SIM\n",COLOR_ERROR,1557.3281,-2260.5244,13.5407,10.0,0);
    //Objects////////////////////////////////////////////////////////////////////////////////////////////////////////
	new object_world = 0, object_int = 0;
	balehopesawat = CreateDynamicObject(3715, 1505.291015, -2287.030273, 21.520681, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(balehopesawat, 2, 18646, "matcolours", "grey-90-percent", 0x00000000);
	tmpobjid = CreateDynamicObject(19325, 1646.470947, -2328.571044, 15.696879, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19325, "lsmall_shops", "lsmall_window01", 0x00000000);
	tmpobjid = CreateDynamicObject(19325, 1646.470947, -2328.571044, 11.576904, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19325, "lsmall_shops", "lsmall_window01", 0x00000000);
	tmpobjid = CreateDynamicObject(19325, 1646.470947, -2335.212402, 15.696879, 0.000000, 0.000007, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19325, "lsmall_shops", "lsmall_window01", 0x00000000);
	tmpobjid = CreateDynamicObject(19325, 1646.470947, -2335.212402, 11.576904, 0.000000, 0.000007, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19325, "lsmall_shops", "lsmall_window01", 0x00000000);
	tmpobjid = CreateDynamicObject(19325, 1636.507446, -2325.255126, 15.696879, 0.000007, 0.000007, 89.999946, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19325, "lsmall_shops", "lsmall_window01", 0x00000000);
	tmpobjid = CreateDynamicObject(19325, 1636.507446, -2325.255126, 11.576904, 0.000007, 0.000007, 89.999946, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19325, "lsmall_shops", "lsmall_window01", 0x00000000);
	tmpobjid = CreateDynamicObject(19325, 1643.148803, -2325.255126, 15.696879, 0.000007, 0.000014, 89.999946, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19325, "lsmall_shops", "lsmall_window01", 0x00000000);
	tmpobjid = CreateDynamicObject(19325, 1643.148803, -2325.255126, 11.576904, 0.000007, 0.000014, 89.999946, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19325, "lsmall_shops", "lsmall_window01", 0x00000000);
	tmpobjid = CreateDynamicObject(19325, 1623.265502, -2325.255126, 15.696879, 0.000014, 0.000007, 89.999923, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19325, "lsmall_shops", "lsmall_window01", 0x00000000);
	tmpobjid = CreateDynamicObject(19325, 1623.265502, -2325.255126, 11.576904, 0.000014, 0.000007, 89.999923, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19325, "lsmall_shops", "lsmall_window01", 0x00000000);
	tmpobjid = CreateDynamicObject(19325, 1629.906860, -2325.255126, 15.696879, 0.000014, 0.000014, 89.999923, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19325, "lsmall_shops", "lsmall_window01", 0x00000000);
	tmpobjid = CreateDynamicObject(19325, 1629.906860, -2325.255126, 11.576904, 0.000014, 0.000014, 89.999923, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19325, "lsmall_shops", "lsmall_window01", 0x00000000);
	tmpobjid = CreateDynamicObject(19325, 1610.013671, -2325.255126, 15.696879, 0.000022, 0.000007, 89.999900, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19325, "lsmall_shops", "lsmall_window01", 0x00000000);
	tmpobjid = CreateDynamicObject(19325, 1610.013671, -2325.255126, 11.576904, 0.000022, 0.000007, 89.999900, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19325, "lsmall_shops", "lsmall_window01", 0x00000000);
	tmpobjid = CreateDynamicObject(19325, 1616.655029, -2325.255126, 15.696879, 0.000022, 0.000014, 89.999900, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19325, "lsmall_shops", "lsmall_window01", 0x00000000);
	tmpobjid = CreateDynamicObject(19325, 1616.655029, -2325.255126, 11.576904, 0.000022, 0.000014, 89.999900, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19325, "lsmall_shops", "lsmall_window01", 0x00000000);
	tmpobjid = CreateDynamicObject(3657, 1606.290405, -2333.209960, 13.023400, 0.000000, 0.000000, 179.999984, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19517, "noncolored", "gen_white", 0x00000000);
	tmpobjid = CreateDynamicObject(4890, 1683.219970, -2328.429931, 11.875000, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18646, "matcolours", "grey-70-percent", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "white", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 10765, "airportgnd_sfse", "white", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 10765, "airportgnd_sfse", "white", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 5, 13691, "bevcunto2_lahills", "stonewall3_la", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 6, 16639, "a51_labs", "ws_trainstationwin1", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 7, 10101, "2notherbuildsfe", "flatdoor01_law", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 9, 10386, "mountainsfs", "ws_stonewall", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 10, 10023, "bigwhitesfe", "liftdoors_kb_256", 0x00000000);
	tmpobjid = CreateDynamicObject(4832, 1610.800048, -2285.840087, 52.750000, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 18646, "matcolours", "grey-70-percent", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 10765, "airportgnd_sfse", "white", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 4, 16639, "a51_labs", "ws_trainstationwin1", 0xFF87CEEB);
	SetDynamicObjectMaterial(tmpobjid, 5, 18646, "matcolours", "grey-70-percent", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 6, 18646, "matcolours", "grey-90-percent", 0x00000000);
	tmpobjid = CreateDynamicObject(4991, 1683.219970, -2242.959960, 11.789094, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18646, "matcolours", "grey-70-percent", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "white", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 10765, "airportgnd_sfse", "white", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 10765, "airportgnd_sfse", "white", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 5, 13691, "bevcunto2_lahills", "stonewall3_la", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 6, 16639, "a51_labs", "ws_trainstationwin1", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 7, 10101, "2notherbuildsfe", "flatdoor01_law", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 9, 10386, "mountainsfs", "ws_stonewall", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 10, 10023, "bigwhitesfe", "liftdoors_kb_256", 0x00000000);
	tmpobjid = CreateDynamicObject(4830, 1687.780029, -2286.540039, 10.250000, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 2, 10765, "airportgnd_sfse", "white", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 5, 18646, "matcolours", "grey-70-percent", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 6, 10386, "mountainsfs", "ws_stonewall", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 8, 16639, "a51_labs", "ws_trainstationwin1", 0x00000000);
	tmpobjid = CreateDynamicObject(6063, 1513.274047, -2164.850097, 19.452646, 0.000000, 0.000000, 360.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 16639, "a51_labs", "ws_trainstationwin1", 0xFF87CEEB);
	SetDynamicObjectMaterial(tmpobjid, 3, 6522, "cuntclub_law2", "marinadoor1_256", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 6, 18646, "matcolours", "grey-90-percent", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 7, 3083, "billbox", "Sprunk_postersign1", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 8, 18646, "matcolours", "grey-70-percent", 0xFF87CEEB);
	SetDynamicObjectMaterial(tmpobjid, 9, 10765, "airportgnd_sfse", "white", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 10, 18646, "matcolours", "grey-90-percent", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 11, 18646, "matcolours", "grey-50-percent", 0x00000000);
	tmpobjid = CreateDynamicObject(18762, 1562.805664, -2184.530761, 12.841688, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000);
	tmpobjid = CreateDynamicObject(18762, 1557.815795, -2184.530761, 12.841688, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000);
	tmpobjid = CreateDynamicObject(18762, 1552.834594, -2184.530761, 12.841688, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000);
	tmpobjid = CreateDynamicObject(18762, 1547.845581, -2184.530761, 12.841688, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000);
	tmpobjid = CreateDynamicObject(18762, 1542.855590, -2184.530761, 12.841688, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000);
	tmpobjid = CreateDynamicObject(18762, 1541.284667, -2184.530761, 12.841688, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000);
	tmpobjid = CreateDynamicObject(18980, 1564.815063, -2171.546875, 12.837435, 0.000000, 90.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000);
	tmpobjid = CreateDynamicObject(18980, 1564.815063, -2146.564208, 12.837435, 0.000000, 90.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000);
	tmpobjid = CreateDynamicObject(18980, 1552.806030, -2143.821533, 13.287446, 0.000000, 90.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000);
	tmpobjid = CreateDynamicObject(18980, 1540.796386, -2155.821289, 13.287446, 0.000000, 90.000000, 270.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000);
	tmpobjid = CreateDynamicObject(18981, 1577.402832, -2172.464355, 12.303502, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18646, "matcolours", "grey-50-percent", 0x00000000);
	tmpobjid = CreateDynamicObject(18981, 1577.402832, -2147.471191, 12.303502, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18646, "matcolours", "grey-50-percent", 0x00000000);
	tmpobjid = CreateDynamicObject(18981, 1602.341064, -2172.464355, 12.303502, 0.000000, 90.000007, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18646, "matcolours", "grey-50-percent", 0x00000000);
	tmpobjid = CreateDynamicObject(18981, 1602.341064, -2147.471191, 12.303502, 0.000000, 90.000007, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18646, "matcolours", "grey-50-percent", 0x00000000);
	tmpobjid = CreateDynamicObject(7520, 1612.351440, -2159.007812, 12.829865, 0.000000, 0.000000, 270.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_garagedoor3_white", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18646, "matcolours", "grey-70-percent", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 14538, "ab_xit_box", "sw_door07", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 6, 18646, "matcolours", "grey-90-percent", 0x00000000);
	tmpobjid = CreateDynamicObject(5409, 1576.073608, -2175.164794, 17.214120, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 16639, "a51_labs", "ws_trainstationwin1", 0xFF87CDEB);
	SetDynamicObjectMaterial(tmpobjid, 1, 18646, "matcolours", "grey-70-percent", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 10765, "airportgnd_sfse", "white", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 4, 18646, "matcolours", "grey-90-percent", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 6, 18646, "matcolours", "red", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 8, 18646, "matcolours", "grey-90-percent", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 10, 7088, "casinoshops1", "247sign1", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 11, 18646, "matcolours", "red", 0x00000000);
	tmpobjid = CreateDynamicObject(4735, 1580.931762, -2325.196289, 18.689550, 0.000000, 0.000000, 270.500000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterialText(tmpobjid, 0, "SULAWESI", 140, "Arial", 100, 1, 0xFF000000, 0x00000000, 1);
	tmpobjid = CreateDynamicObject(4735, 1586.072875, -2286.144042, 22.869586, 0.000000, 0.000000, 360.500000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterialText(tmpobjid, 0, "BANDARA", 140, "Arial", 100, 1, 0xFFFFFFFF, 0x00000000, 1);
	tmpobjid = CreateDynamicObject(4735, 1585.986572, -2276.311523, 20.879556, 0.000000, 0.000000, 360.500000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterialText(tmpobjid, 0, "AIRPORT", 140, "Arial", 60, 1, 0xFFFFFFFF, 0x00000000, 1);
	tmpobjid = CreateDynamicObject(4735, 1586.079467, -2293.824218, 20.879556, 0.000000, 0.000000, 360.500000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterialText(tmpobjid, 0, "KENDARI", 140, "Arial", 60, 1, 0xFFFFFFFF, 0x00000000, 1);
	tmpobjid = CreateDynamicObject(4735, 1630.424682, -2325.485595, 15.269547, 0.000000, 0.000000, 450.500000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterialText(tmpobjid, 0, "PUTU AIRPORTs", 140, "Arial", 70, 1, 0xFFFFFFFF, 0x00000000, 1);
	tmpobjid = CreateDynamicObject(19087, 1624.331909, -2325.520019, 14.915770, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18646, "matcolours", "grey-90-percent", 0x00000000);
	tmpobjid = CreateDynamicObject(19087, 1626.781372, -2325.520019, 14.915770, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18646, "matcolours", "grey-90-percent", 0x00000000);
	tmpobjid = CreateDynamicObject(19087, 1629.230224, -2325.520019, 14.915770, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18646, "matcolours", "grey-90-percent", 0x00000000);
	tmpobjid = CreateDynamicObject(19087, 1631.670410, -2325.520019, 14.915770, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18646, "matcolours", "grey-90-percent", 0x00000000);
	tmpobjid = CreateDynamicObject(19087, 1634.110595, -2325.520019, 14.915770, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18646, "matcolours", "grey-90-percent", 0x00000000);
	tmpobjid = CreateDynamicObject(19087, 1636.562500, -2325.520019, 14.915770, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18646, "matcolours", "grey-90-percent", 0x00000000);
	tmpobjid = CreateDynamicObject(19087, 1639.004028, -2325.520019, 14.915769, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18646, "matcolours", "grey-90-percent", 0x00000000);
	tmpobjid = CreateDynamicObject(3521, 1643.099853, -2328.787841, 14.078228, 0.000000, 0.000000, 337.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 3, 18646, "matcolours", "grey-90-percent", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 4, 18646, "matcolours", "grey-90-percent", 0x00000000);
	tmpobjid = CreateDynamicObject(19366, 1642.852416, -2328.764160, 14.754721, 0.000000, 0.000000, 67.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterialText(tmpobjid, 0, "Internasional", 140, "Arial", 40, 1, 0xFFFFFFFF, 0x00000000, 1);
	tmpobjid = CreateDynamicObject(19446, 1586.848999, -2282.044921, 18.252782, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	tmpobjid = CreateDynamicObject(19446, 1586.848999, -2282.044921, 17.392763, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	tmpobjid = CreateDynamicObject(19446, 1586.848999, -2282.044921, 16.462741, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	tmpobjid = CreateDynamicObject(19446, 1586.848999, -2282.044921, 15.422722, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	tmpobjid = CreateDynamicObject(19446, 1586.848999, -2282.044921, 14.342717, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	tmpobjid = CreateDynamicObject(19446, 1586.848999, -2282.044921, 13.142704, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	tmpobjid = CreateDynamicObject(19446, 1586.848999, -2290.968017, 18.252782, 0.000000, 90.000007, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	tmpobjid = CreateDynamicObject(19446, 1586.848999, -2290.968017, 17.392763, 0.000000, 90.000007, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	tmpobjid = CreateDynamicObject(19446, 1586.848999, -2290.968017, 16.462741, 0.000000, 90.000007, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	tmpobjid = CreateDynamicObject(19446, 1586.848999, -2290.968017, 15.422722, 0.000000, 90.000007, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	tmpobjid = CreateDynamicObject(19446, 1586.848999, -2290.968017, 14.342717, 0.000000, 90.000007, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	tmpobjid = CreateDynamicObject(19446, 1586.848999, -2290.968017, 13.142704, 0.000000, 90.000007, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	tmpobjid = CreateDynamicObject(8132, 1570.929443, -2325.374511, 15.042708, 0.000000, 0.000000, 270.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "white", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 18646, "matcolours", "grey-90-percent", 0x00000000);
	tmpobjid = CreateDynamicObject(19366, 1571.662719, -2326.274902, 15.124974, 0.000000, 0.000000, 78.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterialText(tmpobjid, 0, "WELLCOME:", 140, "Arial", 70, 0, 0xFFFFFFFF, 0x00000000, 1);
	tmpobjid = CreateDynamicObject(18980, 1525.820068, -2232.406005, 12.895152, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	tmpobjid = CreateDynamicObject(18980, 1510.599243, -2232.406005, 12.895152, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	tmpobjid = CreateDynamicObject(18980, 1537.841186, -2245.383300, 12.895152, 0.000007, 90.000007, 89.999946, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	tmpobjid = CreateDynamicObject(18980, 1537.841186, -2263.927490, 12.895152, 0.000007, 90.000007, 89.999946, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	tmpobjid = CreateDynamicObject(18980, 1538.529541, -2327.853515, 12.895152, 0.000000, 90.000000, -90.000038, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	tmpobjid = CreateDynamicObject(18980, 1538.529541, -2308.959960, 12.895152, 0.000000, 90.000000, -90.000038, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	tmpobjid = CreateDynamicObject(18980, 1525.552246, -2339.874511, 12.895152, 0.000007, 90.000007, -0.000098, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	tmpobjid = CreateDynamicObject(18980, 1516.497924, -2339.904296, 12.895152, 0.000007, 90.000007, 0.299901, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	tmpobjid = CreateDynamicObject(4735, 1630.504760, -2325.485595, 15.209546, 0.000000, 0.000000, 450.500000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterialText(tmpobjid, 0, "PUTU AIRPORTS", 140, "Arial", 70, 1, 0xFF000000, 0x00000000, 1);
	tmpobjid = CreateDynamicObject(19366, 1642.852416, -2328.764160, 14.524718, 0.000000, 0.000000, 67.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterialText(tmpobjid, 0, "Airport Putu", 140, "Arial", 40, 1, 0xFFFFFFFF, 0x00000000, 1);
	tmpobjid = CreateDynamicObject(19366, 1642.852416, -2328.764160, 14.294718, 0.000000, 0.000000, 67.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterialText(tmpobjid, 0, "Sulawesi Tenggara", 140, "Arial", 40, 1, 0xFFFFFFFF, 0x00000000, 1);
	tmpobjid = CreateDynamicObject(717, 1547.373779, -2181.686279, 13.011993, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	tmpobjid = CreateDynamicObject(4735, 1605.712524, -2183.159423, 18.104776, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterialText(tmpobjid, 0, "CNBC PETROL", 100, "Arial", 20, 1, 0xFFFF0000, 0x00000000, 1);
	tmpobjid = CreateDynamicObject(19366, 1579.327392, -2185.188964, 16.666572, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterialText(tmpobjid, 0, "BENSIN", 140, "Arial", 199, 1, 0xFFFF0000, 0x00000000, 1);
	tmpobjid = CreateDynamicObject(19366, 1585.468139, -2185.188964, 16.546569, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterialText(tmpobjid, 0, "MURAH", 140, "Arial", 150, 1, 0xFFFF0000, 0x00000000, 1);
	tmpobjid = CreateDynamicObject(4735, 1611.404052, -2173.090332, 13.464738, 0.000000, 0.000000, 360.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterialText(tmpobjid, 0, "PERTAMAX", 100, "Arial", 20, 1, 0xFFFF0000, 0x00000000, 2);
	tmpobjid = CreateDynamicObject(4735, 1499.532226, -2182.128417, 17.624765, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterialText(tmpobjid, 0, "METROPOLITAN", 140, "Arial", 50, 1, 0xFF000000, 0x00000000, 1);
	tmpobjid = CreateDynamicObject(4735, 1508.891967, -2182.128417, 17.544763, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterialText(tmpobjid, 0, "MARKET", 140, "Arial", 30, 1, 0xFF2F4F4F, 0x00000000, 1);
	tmpobjid = CreateDynamicObject(19366, 1498.103881, -2180.216796, 14.661212, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterialText(tmpobjid, 0, "PT", 100, "Courier New", 170, 1, 0xFFFFFFFF, 0x00000000, 1);
	tmpobjid = CreateDynamicObject(19087, 1498.073120, -2180.266357, 15.302041, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	tmpobjid = CreateDynamicObject(3502, 1498.038818, -2175.680908, 14.594983, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	tmpobjid = CreateDynamicObject(19087, 1500.353271, -2180.266357, 15.302041, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	tmpobjid = CreateDynamicObject(4735, 1508.892089, -2147.595947, 17.624765, 0.000000, 0.000000, -89.999969, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterialText(tmpobjid, 0, "METROPOLITAN", 140, "Arial", 50, 1, 0xFF000000, 0x00000000, 1);
	tmpobjid = CreateDynamicObject(4735, 1499.532348, -2147.595947, 17.544763, 0.000000, 0.000000, -89.999969, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterialText(tmpobjid, 0, "MARKET", 140, "Arial", 30, 1, 0xFF696969, 0x00000000, 1);
	tmpobjid = CreateDynamicObject(19366, 1500.288208, -2149.303710, 20.581243, 0.000000, 0.000000, -89.999969, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterialText(tmpobjid, 0, "mm", 100, "Courier New", 170, 1, 0xFFFFFFFF, 0x00000000, 1);
	tmpobjid = CreateDynamicObject(19087, 1500.318969, -2149.254150, 21.222070, 0.000000, 90.000000, 179.999893, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	tmpobjid = CreateDynamicObject(3502, 1500.353271, -2153.839599, 20.515012, 0.000000, 0.000000, 179.999893, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	tmpobjid = CreateDynamicObject(19087, 1498.038818, -2149.254150, 21.222070, 0.000000, 90.000000, 179.999893, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	tmpobjid = CreateDynamicObject(18980, 1578.191162, -2367.759277, 13.037322, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	tmpobjid = CreateDynamicObject(18980, 1553.191406, -2367.759277, 13.037322, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	tmpobjid = CreateDynamicObject(18980, 1528.204101, -2367.759277, 13.037322, 0.000000, 90.000007, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	tmpobjid = CreateDynamicObject(18980, 1503.204345, -2367.759277, 13.037322, 0.000000, 90.000007, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	tmpobjid = CreateDynamicObject(18980, 1496.852294, -2367.759277, 13.037322, 0.000000, 90.000007, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	tmpobjid = CreateDynamicObject(18980, 1484.852294, -2354.796630, 13.037322, 0.000000, 90.000007, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	tmpobjid = CreateDynamicObject(18762, 1486.904052, -2342.345947, 12.894564, 0.000000, 90.000000, 9.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	tmpobjid = CreateDynamicObject(18762, 1491.802734, -2341.567382, 12.894564, 0.000000, 90.000000, 9.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	tmpobjid = CreateDynamicObject(18762, 1496.730834, -2340.784912, 12.894564, 0.000000, 90.000000, 9.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	tmpobjid = CreateDynamicObject(18762, 1501.634765, -2340.186523, 12.894564, 0.000000, 90.000000, 5.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	tmpobjid = CreateDynamicObject(18980, 1566.608276, -2349.767578, 13.037322, 0.000000, 90.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	tmpobjid = CreateDynamicObject(18980, 1566.608276, -2354.862060, 13.037322, 0.000000, 90.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	tmpobjid = CreateDynamicObject(18980, 1566.608276, -2309.020751, 13.037322, 0.000000, 90.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	tmpobjid = CreateDynamicObject(18762, 1566.620361, -2320.811523, 13.034567, 0.000000, 90.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	tmpobjid = CreateDynamicObject(18762, 1560.383422, -2297.030273, 13.047815, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	tmpobjid = CreateDynamicObject(18762, 1563.904541, -2297.030273, 13.047815, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	tmpobjid = CreateDynamicObject(18762, 1560.383422, -2275.996582, 13.047815, 0.000000, 90.000007, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	tmpobjid = CreateDynamicObject(18762, 1563.904541, -2275.996582, 13.047815, 0.000000, 90.000007, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	tmpobjid = CreateDynamicObject(18980, 1566.608276, -2263.959716, 13.037322, 0.000000, 90.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	tmpobjid = CreateDynamicObject(18980, 1566.608276, -2238.969970, 13.037322, 0.000000, 90.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	tmpobjid = CreateDynamicObject(18980, 1566.608276, -2217.206054, 13.037322, 0.000000, 90.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	tmpobjid = CreateDynamicObject(18980, 1578.637451, -2205.236083, 13.037322, 0.000000, 90.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	tmpobjid = CreateDynamicObject(18980, 1578.637451, -2236.618652, 13.037322, 0.000000, 90.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	tmpobjid = CreateDynamicObject(18980, 1553.637817, -2205.236083, 13.037322, 0.000000, 90.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	tmpobjid = CreateDynamicObject(18980, 1528.656005, -2205.236083, 13.037322, 0.000000, 90.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	tmpobjid = CreateDynamicObject(18980, 1503.687133, -2205.236083, 13.037322, 0.000000, 90.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	tmpobjid = CreateDynamicObject(18980, 1496.967651, -2205.236083, 13.037322, 0.000000, 90.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	tmpobjid = CreateDynamicObject(18980, 1484.947143, -2217.255615, 13.037322, 0.000000, 90.000000, 270.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	tmpobjid = CreateDynamicObject(18762, 1486.862548, -2230.438476, 13.047815, 0.000000, 90.000007, -8.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	tmpobjid = CreateDynamicObject(18762, 1491.785156, -2231.129638, 13.047815, 0.000000, 90.000007, -8.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	tmpobjid = CreateDynamicObject(18762, 1495.855224, -2231.867675, 12.897810, 0.000000, 90.000007, -13.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	tmpobjid = CreateDynamicObject(19445, 1571.540527, -2205.196533, 13.695165, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10442, "graveyard_sfs", "ws_graveydfence", 0x00000000);
	tmpobjid = CreateDynamicObject(19445, 1581.181152, -2205.196533, 13.695165, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10442, "graveyard_sfs", "ws_graveydfence", 0x00000000);
	tmpobjid = CreateDynamicObject(19445, 1590.809936, -2205.196533, 13.695165, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10442, "graveyard_sfs", "ws_graveydfence", 0x00000000);
	tmpobjid = CreateDynamicObject(19445, 1571.540527, -2236.596923, 13.695165, 0.000007, 0.000000, 89.999977, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10442, "graveyard_sfs", "ws_graveydfence", 0x00000000);
	tmpobjid = CreateDynamicObject(19445, 1581.181152, -2236.596923, 13.695165, 0.000007, 0.000000, 89.999977, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10442, "graveyard_sfs", "ws_graveydfence", 0x00000000);
	tmpobjid = CreateDynamicObject(19445, 1590.809936, -2236.596923, 13.695165, 0.000007, 0.000000, 89.999977, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10442, "graveyard_sfs", "ws_graveydfence", 0x00000000);
	tmpobjid = CreateDynamicObject(19445, 1566.812255, -2229.191406, 13.695165, 0.000014, -0.000007, 179.999877, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10442, "graveyard_sfs", "ws_graveydfence", 0x00000000);
	tmpobjid = CreateDynamicObject(19445, 1566.812255, -2219.550781, 13.695165, 0.000014, -0.000007, 179.999877, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10442, "graveyard_sfs", "ws_graveydfence", 0x00000000);
	tmpobjid = CreateDynamicObject(19445, 1566.812255, -2209.922119, 13.695165, 0.000014, -0.000007, 179.999877, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10442, "graveyard_sfs", "ws_graveydfence", 0x00000000);
	tmpobjid = CreateDynamicObject(19445, 1566.812255, -2258.050537, 13.695165, 0.000014, -0.000014, 179.999832, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10442, "graveyard_sfs", "ws_graveydfence", 0x00000000);
	tmpobjid = CreateDynamicObject(19445, 1566.812255, -2248.409912, 13.695165, 0.000014, -0.000014, 179.999832, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10442, "graveyard_sfs", "ws_graveydfence", 0x00000000);
	tmpobjid = CreateDynamicObject(19445, 1566.812255, -2238.781250, 13.695165, 0.000014, -0.000014, 179.999832, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10442, "graveyard_sfs", "ws_graveydfence", 0x00000000);
	tmpobjid = CreateDynamicObject(19445, 1566.812255, -2267.681152, 13.695165, 0.000014, -0.000014, 179.999832, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10442, "graveyard_sfs", "ws_graveydfence", 0x00000000);
	tmpobjid = CreateDynamicObject(19445, 1566.812255, -2271.512695, 13.695165, 0.000014, -0.000014, 179.999832, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10442, "graveyard_sfs", "ws_graveydfence", 0x00000000);
	tmpobjid = CreateDynamicObject(19445, 1566.812255, -2311.122802, 13.695165, 0.000014, -0.000022, 179.999786, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10442, "graveyard_sfs", "ws_graveydfence", 0x00000000);
	tmpobjid = CreateDynamicObject(19445, 1566.812255, -2301.482177, 13.695165, 0.000014, -0.000022, 179.999786, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10442, "graveyard_sfs", "ws_graveydfence", 0x00000000);
	tmpobjid = CreateDynamicObject(19445, 1566.812255, -2318.182373, 13.695165, 0.000014, -0.000022, 179.999786, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10442, "graveyard_sfs", "ws_graveydfence", 0x00000000);
	tmpobjid = CreateDynamicObject(19445, 1566.812255, -2351.771240, 13.695165, 0.000014, -0.000029, 179.999740, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10442, "graveyard_sfs", "ws_graveydfence", 0x00000000);
	tmpobjid = CreateDynamicObject(19445, 1566.812255, -2342.130615, 13.695165, 0.000014, -0.000029, 179.999740, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10442, "graveyard_sfs", "ws_graveydfence", 0x00000000);
	tmpobjid = CreateDynamicObject(19445, 1566.812255, -2361.392822, 13.695165, 0.000014, -0.000029, 179.999740, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10442, "graveyard_sfs", "ws_graveydfence", 0x00000000);
	tmpobjid = CreateDynamicObject(19445, 1566.812255, -2362.674072, 13.695165, 0.000014, -0.000029, 179.999740, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10442, "graveyard_sfs", "ws_graveydfence", 0x00000000);
	tmpobjid = CreateDynamicObject(19445, 1566.812255, -2367.574218, 13.695165, 0.000014, -0.000029, 269.999755, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10442, "graveyard_sfs", "ws_graveydfence", 0x00000000);
	tmpobjid = CreateDynamicObject(19445, 1576.442504, -2367.574218, 13.695165, 0.000014, -0.000029, 269.999755, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10442, "graveyard_sfs", "ws_graveydfence", 0x00000000);
	tmpobjid = CreateDynamicObject(19445, 1586.062011, -2367.574218, 13.695165, 0.000014, -0.000029, 269.999755, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10442, "graveyard_sfs", "ws_graveydfence", 0x00000000);
	tmpobjid = CreateDynamicObject(19445, 1547.584960, -2367.574218, 13.695165, 0.000007, -0.000029, -90.000221, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10442, "graveyard_sfs", "ws_graveydfence", 0x00000000);
	tmpobjid = CreateDynamicObject(19445, 1557.204467, -2367.574218, 13.695165, 0.000007, -0.000029, -90.000221, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10442, "graveyard_sfs", "ws_graveydfence", 0x00000000);
	tmpobjid = CreateDynamicObject(19445, 1528.330566, -2367.574218, 13.695165, 0.000000, -0.000029, -90.000198, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10442, "graveyard_sfs", "ws_graveydfence", 0x00000000);
	tmpobjid = CreateDynamicObject(19445, 1537.950073, -2367.574218, 13.695165, 0.000000, -0.000029, -90.000198, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10442, "graveyard_sfs", "ws_graveydfence", 0x00000000);
	tmpobjid = CreateDynamicObject(19445, 1509.111206, -2367.574218, 13.695165, -0.000007, -0.000029, -90.000175, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10442, "graveyard_sfs", "ws_graveydfence", 0x00000000);
	tmpobjid = CreateDynamicObject(19445, 1518.730712, -2367.574218, 13.695165, -0.000007, -0.000029, -90.000175, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10442, "graveyard_sfs", "ws_graveydfence", 0x00000000);
	tmpobjid = CreateDynamicObject(19445, 1489.888793, -2367.574218, 13.695165, -0.000014, -0.000029, -90.000152, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10442, "graveyard_sfs", "ws_graveydfence", 0x00000000);
	tmpobjid = CreateDynamicObject(19445, 1499.508300, -2367.574218, 13.695165, -0.000014, -0.000029, -90.000152, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10442, "graveyard_sfs", "ws_graveydfence", 0x00000000);
	tmpobjid = CreateDynamicObject(19445, 1484.979614, -2362.857666, 13.695165, -0.000022, -0.000022, -0.000159, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10442, "graveyard_sfs", "ws_graveydfence", 0x00000000);
	tmpobjid = CreateDynamicObject(19445, 1484.979614, -2353.238281, 13.695165, -0.000022, -0.000022, -0.000159, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10442, "graveyard_sfs", "ws_graveydfence", 0x00000000);
	tmpobjid = CreateDynamicObject(19445, 1484.979614, -2347.475097, 13.695165, -0.000022, -0.000022, -0.000159, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10442, "graveyard_sfs", "ws_graveydfence", 0x00000000);
	tmpobjid = CreateDynamicObject(4735, 1505.434326, -2287.005859, 22.499578, 0.000000, 0.000000, 540.500000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterialText(tmpobjid, 0, "Sejarah", 140, "Arial", 70, 1, 0xFFFFFFFF, 0x00000000, 1);
	tmpobjid = CreateDynamicObject(4735, 1505.434326, -2287.005859, 21.129570, 0.000000, 0.000000, 540.500000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterialText(tmpobjid, 0, "Pesawat Putu", 140, "Arial", 70, 1, 0xFFFFFFFF, 0x00000000, 1);
	tmpobjid = CreateDynamicObject(19366, 1585.378540, -2173.502685, 16.546569, 0.000000, 0.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterialText(tmpobjid, 0, "PETROL", 140, "Arial", 150, 1, 0xFFFF0000, 0x00000000, 1);
	tmpobjid = CreateDynamicObject(19366, 1585.378540, -2176.632568, 16.546569, 0.000000, 0.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterialText(tmpobjid, 0, "HIFA", 140, "Arial", 150, 1, 0xFFFF0000, 0x00000000, 1);
	tmpobjid = CreateDynamicObject(8168, 1560.986816, -2270.887939, 14.316729, 0.000000, 0.000000, 286.200012, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18646, "matcolours", "grey-90-percent", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18646, "matcolours", "grey-90-percent", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 4, 10765, "airportgnd_sfse", "white", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 6, 16639, "a51_labs", "ws_trainstationwin1", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 9, 18646, "matcolours", "grey-70-percent", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 10, 18646, "matcolours", "grey-90-percent", 0x00000000);

	layariklanbadara = CreateDynamicObject(19366, 1558.582885, -2268.555175, 15.735628, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterialText(layariklanbadara, 0, "PUTU SECURITY", 140, "Arial", 50, 1, 0xFFFF0000, 0x00000000, 1);
	
	tmpobjid = CreateDynamicObject(19366, 1561.892333, -2274.485839, 15.735628, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterialText(tmpobjid, 0, "RENT A CAR HERE", 140, "Arial", 50, 1, 0xFFFF0000, 0x00000000, 1);
	tmpobjid = CreateDynamicObject(19366, 1606.006835, -2182.745361, 12.760728, 0.000000, 90.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10778, "airportcpark_sfse", "ws_roadarrow1", 0x00000000);
	tmpobjid = CreateDynamicObject(19366, 1606.006835, -2175.775146, 12.760728, 0.000000, 90.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10778, "airportcpark_sfse", "ws_roadarrow1", 0x00000000);
	tmpobjid = CreateDynamicObject(19366, 1606.006835, -2167.934570, 12.760728, 0.000000, 90.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10778, "airportcpark_sfse", "ws_roadarrow1", 0x00000000);
	tmpobjid = CreateDynamicObject(19366, 1591.635131, -2167.934326, 12.760728, 0.000000, 90.000000, -89.999969, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10778, "airportcpark_sfse", "ws_roadarrow1", 0x00000000);
	tmpobjid = CreateDynamicObject(19366, 1591.635131, -2174.904541, 12.760728, 0.000000, 90.000000, -89.999969, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10778, "airportcpark_sfse", "ws_roadarrow1", 0x00000000);
	tmpobjid = CreateDynamicObject(19366, 1591.635131, -2182.745117, 12.760728, 0.000000, 90.000000, -89.999969, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10778, "airportcpark_sfse", "ws_roadarrow1", 0x00000000);
	tmpobjid = CreateDynamicObject(4199, 1595.680664, -2139.739990, 14.763920, 0.000000, 0.000000, 270.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_garagedoor3_white", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18646, "matcolours", "grey-50-percent", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 18646, "matcolours", "grey-90-percent", 0x00000000);
	tmpobjid = CreateDynamicObject(19462, 1579.743774, -2144.539794, 13.291715, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 17562, "coast_apts", "stonewalls1", 0x00000000);
	tmpobjid = CreateDynamicObject(19462, 1570.122558, -2144.539794, 13.291715, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 17562, "coast_apts", "stonewalls1", 0x00000000);
	tmpobjid = CreateDynamicObject(19462, 1565.350341, -2149.326904, 13.291715, 0.000007, -0.000007, 179.999908, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 17562, "coast_apts", "stonewalls1", 0x00000000);
	tmpobjid = CreateDynamicObject(19462, 1565.350341, -2158.948242, 13.291715, 0.000007, -0.000007, 179.999908, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 17562, "coast_apts", "stonewalls1", 0x00000000);
	tmpobjid = CreateDynamicObject(19462, 1565.350341, -2168.558593, 13.291715, 0.000007, -0.000007, 179.999908, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 17562, "coast_apts", "stonewalls1", 0x00000000);
	tmpobjid = CreateDynamicObject(19462, 1565.350341, -2178.178710, 13.291715, 0.000007, -0.000007, 179.999908, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 17562, "coast_apts", "stonewalls1", 0x00000000);
	tmpobjid = CreateDynamicObject(19370, 1565.354248, -2183.433837, 13.294939, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 17562, "coast_apts", "stonewalls1", 0x00000000);
	tmpobjid = CreateDynamicObject(19366, 1568.555786, -2182.745361, 12.760728, 0.000000, 90.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10778, "airportcpark_sfse", "ws_roadarrow1", 0x00000000);
	tmpobjid = CreateDynamicObject(19366, 1568.555786, -2168.032958, 12.760728, 0.000000, 90.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10778, "airportcpark_sfse", "ws_roadarrow1", 0x00000000);
	tmpobjid = CreateDynamicObject(19366, 1590.285522, -2336.891357, 16.876472, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	tmpobjid = CreateDynamicObject(19366, 1590.285522, -2336.891357, 16.086469, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	tmpobjid = CreateDynamicObject(19366, 1590.285522, -2336.891357, 15.226470, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	tmpobjid = CreateDynamicObject(19366, 1590.285522, -2336.891357, 14.366477, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	tmpobjid = CreateDynamicObject(19446, 1596.815185, -2337.041748, 16.872768, 0.000014, 90.000007, 89.999923, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	tmpobjid = CreateDynamicObject(19446, 1605.738281, -2337.041748, 16.872768, 0.000014, 90.000015, 89.999923, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	tmpobjid = CreateDynamicObject(19446, 1618.170898, -2337.041748, 16.872768, 0.000022, 90.000007, 89.999900, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	tmpobjid = CreateDynamicObject(19446, 1627.794799, -2337.041748, 16.872768, 0.000022, 90.000015, 89.999900, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	tmpobjid = CreateDynamicObject(19446, 1632.915161, -2337.041748, 16.872768, 0.000022, 90.000015, 89.999900, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18646, "matcolours", "grey-10-percent", 0x00000000);
	tmpobjid = CreateDynamicObject(4735, 1586.074096, -2286.244140, 22.749584, 0.000000, 0.000000, 360.500000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterialText(tmpobjid, 0, "SULAWESI", 140, "Arial", 100, 1, 0xFF000000, 0x00000000, 1);
	tmpobjid = CreateDynamicObject(4735, 1586.079956, -2293.864257, 20.819555, 0.000000, 0.000000, 360.500000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterialText(tmpobjid, 0, "KENDARI", 140, "Arial", 60, 1, 0xFF000000, 0x00000000, 1);
	tmpobjid = CreateDynamicObject(4735, 1585.987182, -2276.361572, 20.799554, 0.000000, 0.000000, 360.500000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterialText(tmpobjid, 0, "AIRPORT", 140, "Arial", 60, 1, 0xFF000000, 0x00000000, 1);
	tmpobjid = CreateDynamicObject(4735, 1580.831665, -2325.196289, 18.599548, 0.000000, 0.000000, 270.500000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterialText(tmpobjid, 0, "SULAWESI", 140, "Arial", 100, 1, 0xFFFF0000, 0x00000000, 1);
	tmpobjid = CreateDynamicObject(19325, 1594.215087, -2334.594970, 11.429143, 0.000000, 0.000007, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19325, "lsmall_shops", "lsmall_window01", 0x00000000);
	tmpobjid = CreateDynamicObject(19325, 1594.215087, -2334.594970, 15.539149, 0.000000, 0.000007, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19325, "lsmall_shops", "lsmall_window01", 0x00000000);
	tmpobjid = CreateDynamicObject(19325, 1596.737792, -2325.255126, 15.696879, 0.000029, 0.000007, 89.999877, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19325, "lsmall_shops", "lsmall_window01", 0x00000000);
	tmpobjid = CreateDynamicObject(19325, 1596.737792, -2325.255126, 11.576904, 0.000029, 0.000007, 89.999877, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19325, "lsmall_shops", "lsmall_window01", 0x00000000);
	tmpobjid = CreateDynamicObject(19325, 1603.379150, -2325.255126, 15.696879, 0.000029, 0.000014, 89.999877, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19325, "lsmall_shops", "lsmall_window01", 0x00000000);
	tmpobjid = CreateDynamicObject(19325, 1603.379150, -2325.255126, 11.576904, 0.000029, 0.000014, 89.999877, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19325, "lsmall_shops", "lsmall_window01", 0x00000000);
	tmpobjid = CreateDynamicObject(19325, 1583.473266, -2325.255126, 15.696879, 0.000037, 0.000007, 89.999855, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19325, "lsmall_shops", "lsmall_window01", 0x00000000);
	tmpobjid = CreateDynamicObject(19325, 1583.473266, -2325.255126, 11.576904, 0.000037, 0.000007, 89.999855, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19325, "lsmall_shops", "lsmall_window01", 0x00000000);
	tmpobjid = CreateDynamicObject(19325, 1590.114624, -2325.255126, 15.696879, 0.000037, 0.000014, 89.999855, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19325, "lsmall_shops", "lsmall_window01", 0x00000000);
	tmpobjid = CreateDynamicObject(19325, 1590.114624, -2325.255126, 11.576904, 0.000037, 0.000014, 89.999855, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19325, "lsmall_shops", "lsmall_window01", 0x00000000);
	tmpobjid = CreateDynamicObject(19366, 1571.662719, -2326.274902, 14.634981, 0.000000, 0.000000, 78.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterialText(tmpobjid, 0, "SUHARTAWAN", 140, "Arial", 70, 1, 0xFFFF0000, 0x00000000, 1);
	tmpobjid = CreateDynamicObject(19366, 1571.662719, -2326.274902, 13.894968, 0.000000, 0.000000, 78.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterialText(tmpobjid, 0, "PutuSuhartawan Channel", 140, "Arial", 30, 1, 0xFFFF0000, 0x00000000, 1);
	tmpobjid = CreateDynamicObject(19366, 1574.077636, -2185.194335, 14.896879, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterialText(tmpobjid, 0, "Kendari Pertamax", 140, "Arial", 70, 1, 0xFFFF0000, 0x00000000, 1);
	tmpobjid = CreateDynamicObject(19366, 1573.287231, -2185.194335, 14.336874, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterialText(tmpobjid, 0, "Premium", 140, "Arial", 70, 1, 0xFFFF0000, 0x00000000, 1);
	tmpobjid = CreateDynamicObject(19366, 1575.077026, -2185.194335, 14.336874, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterialText(tmpobjid, 0, "KFC", 140, "Arial", 70, 1, 0xFFFF0000, 0x00000000, 1);
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	tmpobjid = CreateDynamicObject(4835, 1466.770019, -2286.439941, 16.585899, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1256, 1632.240966, -2335.310546, 13.156888, 0.000000, 0.000000, 270.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1256, 1625.571044, -2335.310546, 13.156888, 0.000000, 0.000000, 270.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3657, 1612.609985, -2333.209960, 13.023400, 0.000000, 0.000000, 179.999984, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3657, 1619.860351, -2333.209960, 13.023400, 0.000000, 0.000000, 179.999984, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(4995, 1682.069946, -2330.610107, 16.898399, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(4504, 56.382801, -1531.449951, 6.726560, 0.000000, 0.000000, -7.879539, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1686, 1598.965209, -2166.151611, 12.788507, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1686, 1598.965209, -2168.311767, 12.788507, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1686, 1598.965209, -2170.371826, 12.788507, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1686, 1598.965209, -2173.771972, 12.788507, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1686, 1598.965209, -2177.182373, 12.788507, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3471, 1585.994018, -2341.593994, 13.757343, 0.000007, 0.000000, 89.999977, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3471, 1580.173950, -2341.593994, 13.757343, 0.000007, 0.000000, 89.999977, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3471, 1573.283203, -2341.593994, 13.757343, 0.000007, 0.000000, 89.999977, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(6965, 1577.897216, -2354.479492, 16.178037, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(615, 1530.977172, -2310.969482, 11.867843, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(615, 1524.546386, -2322.010986, 11.867843, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(615, 1515.507690, -2331.239990, 11.867843, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(615, 1506.436767, -2337.620849, 11.867843, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(615, 1505.381347, -2234.575195, 11.867843, 0.000007, 0.000007, 89.999946, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(615, 1516.422851, -2241.006103, 11.867843, 0.000007, 0.000007, 89.999946, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(615, 1525.651855, -2250.044921, 11.867843, 0.000007, 0.000007, 89.999946, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(615, 1532.032714, -2259.115722, 11.867843, 0.000007, 0.000007, 89.999946, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3850, 1578.545166, -2325.797851, 13.067144, 0.000000, 0.000000, 107.899848, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3850, 1587.522338, -2337.194824, 13.057579, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3850, 1584.052124, -2337.194824, 13.057579, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3850, 1580.582275, -2337.194824, 13.057579, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3850, 1577.112304, -2337.194824, 13.057579, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3850, 1573.641967, -2337.194824, 13.057579, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3850, 1570.171997, -2337.194824, 13.057579, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3850, 1568.452514, -2337.194824, 13.057579, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3515, 1556.994750, -2155.437255, 12.049524, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3515, 1556.994750, -2177.007324, 12.049524, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3515, 1556.994750, -2169.967285, 12.049524, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3515, 1556.994750, -2162.696533, 12.049524, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(717, 1562.906250, -2153.304687, 13.011993, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(717, 1562.906250, -2159.725341, 13.011993, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(717, 1562.906250, -2166.585937, 13.011993, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(717, 1562.906250, -2181.686279, 13.011993, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(717, 1562.906250, -2173.658203, 13.011993, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(717, 1555.216552, -2181.686279, 13.011993, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(717, 1540.424560, -2181.686279, 13.011993, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(4173, 1597.687011, -2216.626953, 14.481336, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3515, 1583.836059, -2216.525634, 11.979415, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3515, 1583.836059, -2225.525634, 11.979415, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(616, 1586.134765, -2234.550292, 12.450011, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(616, 1576.524536, -2234.550292, 12.450011, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(616, 1569.954223, -2223.056884, 12.450011, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(878, 1532.359252, -2239.450927, 14.230586, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(878, 1522.519409, -2239.450927, 14.230586, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(878, 1522.519409, -2331.462158, 14.230586, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(878, 1532.789062, -2331.462158, 14.230586, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(877, 1532.085937, -2318.508789, 14.045619, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(877, 1532.956298, -2263.758544, 14.045619, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(16092, 1494.435058, -2287.170898, 9.088171, 0.000000, 0.000007, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(16092, 1466.555175, -2287.170898, 9.088171, 0.000000, 0.000007, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	pesawatbandara = CreateDynamicObject(1683, 1475.936889, -2284.978027, 21.027048, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3507, 1561.354125, -2146.692138, 12.502736, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3507, 1546.453857, -2146.692138, 12.502736, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1231, 1513.787719, -2182.134033, 15.261917, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1231, 1490.935302, -2182.134033, 15.261917, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1231, 1598.755371, -2181.367675, 13.273671, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19121, 1586.153442, -2186.023193, 16.563653, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19121, 1580.693359, -2186.023193, 16.563653, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19121, 1586.153442, -2164.322509, 16.563653, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19121, 1580.503906, -2164.322509, 16.563653, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(640, 1586.141235, -2168.938232, 13.434638, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(640, 1586.141235, -2181.018554, 13.434638, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1231, 1586.184936, -2177.818359, 12.533658, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1231, 1586.184936, -2172.618652, 12.533658, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1231, 1519.612304, -2178.665283, 25.415990, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19126, 1473.287231, -2286.547363, 13.066088, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19126, 1465.686645, -2286.547363, 13.066088, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19126, 1483.806640, -2286.547363, 13.066088, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19126, 1494.436035, -2286.547363, 13.066088, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19126, 1473.287231, -2295.148193, 13.066088, 0.000000, 0.000007, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19126, 1465.686645, -2295.148193, 13.066088, 0.000000, 0.000007, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19126, 1483.806640, -2295.148193, 13.066088, 0.000000, 0.000007, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19126, 1494.436035, -2295.148193, 13.066088, 0.000000, 0.000007, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19126, 1473.287231, -2279.335205, 13.066088, 0.000000, 0.000014, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19126, 1465.686645, -2279.335205, 13.066088, 0.000000, 0.000014, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19126, 1483.806640, -2279.335205, 13.066088, 0.000000, 0.000014, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19126, 1494.436035, -2279.335205, 13.066088, 0.000000, 0.000014, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(18657, 1487.380126, -2328.585693, -14.855353, 54.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(18657, 1487.380126, -2246.758056, -14.521659, 54.000000, 0.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2773, 1504.217773, -2180.432128, 13.068314, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2773, 1504.217773, -2183.053710, 13.068314, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2773, 1508.798950, -2180.432128, 13.068314, 0.000000, 0.000007, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2773, 1508.798950, -2183.053710, 13.068314, 0.000000, 0.000007, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(638, 1493.395019, -2182.634765, 13.164340, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(9833, 1501.972045, -2183.272949, 13.196228, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(9833, 1510.572021, -2183.272949, 13.196228, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(18075, 1640.810302, -2330.616699, 17.454011, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(18075, 1617.878662, -2330.616699, 17.454011, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(18075, 1629.999633, -2330.616699, 17.454011, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(18075, 1607.140258, -2330.616699, 17.454011, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(18075, 1593.429443, -2330.616699, 17.454011, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2773, 1589.607666, -2334.466796, 13.058571, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2773, 1589.607666, -2331.996093, 13.058571, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2773, 1588.207519, -2331.055175, 13.058571, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2773, 1585.777587, -2331.055175, 13.058571, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2773, 1583.337890, -2331.055175, 13.058571, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2773, 1580.897949, -2331.055175, 13.058571, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2773, 1578.478149, -2331.055175, 13.058571, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2773, 1576.098510, -2331.055175, 13.058571, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2773, 1573.728027, -2331.055175, 13.058571, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2773, 1571.357788, -2331.055175, 13.058571, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2773, 1568.948242, -2331.055175, 13.058571, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1892, 1594.439453, -2327.009277, 12.535778, 0.000007, 0.000000, 89.999977, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1892, 1594.439453, -2329.010498, 12.535778, 0.000007, 0.000000, 89.999977, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1892, 1594.439453, -2331.000244, 12.535778, 0.000007, 0.000000, 89.999977, object_world, object_int, -1, 300.00, 300.00); 

	// batas mappingan di sekitar bandara kendari



	// ini mapingan interior minimarket di word berbeda

	PintuMasukMinimarketPick = CreatePickup(1272, 1, 1610.9838,-2179.3374,13.8035, 0);
	PintuKeluarMinimarketPick = CreatePickup(1272, 1, 2222.8252,-1320.3254,1049.0308, 0);


	//teks untuk pikcup biz money changer
	Create3DTextLabel(""COL_WHITE"PUSH TO ENTER\nMinimarket"COL_GREEN" Bandara\n"COL_WHITE"Selamat Datang\n"COL_LRED"Tourism",0xFFFFFFFF,1610.9838,-2179.3374,13.8035,20.0,0);
	Create3DTextLabel(""COL_WHITE"PUSH TO EXIT\nMinimarket"COL_GREEN" Bandara\n"COL_WHITE"Trade Murah\n"COL_LRED"Tourism",0xFFFFFFFF,2222.8252,-1320.3254,1049.0308,20.0,0);
	Create3DTextLabel(""COL_WHITE"BELI ALAT\nBOOMBOX"COL_GREEN" Tekan "COL_RED"[ENTER]\n"COL_WHITE"Trade Murah\n"COL_LRED"Tourism",0xFFFFFFFF,2214.5010,-1318.6323,1049.0234,20.0,0);
	KasirMinimarketPick = CreatePickup(2226, 1, 2214.5010,-1318.6323,1049.0234, 0);
	// ini untuk textdraw preview boombox
	PerlihatkanBoombox = TextDrawCreate(216.000000, 139.000000, "Preview_Model");
	TextDrawFont(PerlihatkanBoombox, 5);
	TextDrawLetterSize(PerlihatkanBoombox, 0.600000, 2.000000);
	TextDrawTextSize(PerlihatkanBoombox, 180.000000, 195.500000);
	TextDrawSetOutline(PerlihatkanBoombox, 0);
	TextDrawSetShadow(PerlihatkanBoombox, 0);
	TextDrawAlignment(PerlihatkanBoombox, 1);
	TextDrawColor(PerlihatkanBoombox, -1);
	TextDrawBackgroundColor(PerlihatkanBoombox, 65405);
	TextDrawBoxColor(PerlihatkanBoombox, -1811885057);
	TextDrawUseBox(PerlihatkanBoombox, 0);
	TextDrawSetProportional(PerlihatkanBoombox, 1);
	//TextDrawSetSelectable(PerlihatkanBoombox, 0);
	TextDrawSetPreviewModel(PerlihatkanBoombox, 2226);
	// yang bagian belakang rot adalah zoom kasi kecil kalau object besar.
	TextDrawSetPreviewRot(PerlihatkanBoombox, -55.000000, 0.000000, 32.000000, 1.110000);
	TextDrawSetPreviewVehCol(PerlihatkanBoombox, 1, 1);

	// ini interiornya minimarket

	CreateDynamicObject(15044, 2255.09375, -1209.78125, 1048.03125,   356.85840, 0.00000, 3.14159);
	CreateDynamicObject(15054, 2218.60229, -1329.04187, 1050.02344,   0.00000, 0.00000, -1.68000);
	CreateDynamicObject(2948, 2223.61719, -1321.25293, 1048.02136,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2948, 2223.57910, -1319.35120, 1048.02136,   0.00000, 0.00000, 1.00000);
	CreateDynamicObject(2611, 2211.99829, -1316.35742, 1049.70361,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1616, 2223.10449, -1323.30432, 1051.47522,   0.00000, 0.00000, -10.38005);
	CreateDynamicObject(1615, 2215.63647, -1324.24780, 1051.35510,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(1843, 2215.23560, -1323.59277, 1048.00464,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1844, 2221.93848, -1323.65564, 1048.02051,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1884, 2216.81787, -1318.14465, 1048.01929,   0.24000, -1.38000, 8.10000);
	CreateDynamicObject(1850, 2209.76611, -1316.71167, 1048.02148,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1891, 2219.78809, -1317.83618, 1048.01001,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1984, 2213.65649, -1317.22144, 1048.02100,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(2362, 2214.04175, -1316.56934, 1048.94897,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2412, 2223.44189, -1321.47864, 1048.02002,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(2412, 2223.42798, -1319.70837, 1048.02002,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(2546, 2221.63379, -1315.30945, 1048.71472,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2871, 2217.18994, -1315.32739, 1048.90845,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1513, 2213.36035, -1317.37000, 1049.26355,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2261, 2214.57104, -1316.76355, 1049.55908,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2269, 2207.86523, -1318.07617, 1049.97595,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2263, 2214.12256, -1322.47937, 1049.61133,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1567, 2223.59277, -1327.34924, 1048.02136,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2121, 2207.75684, -1318.77515, 1048.46021,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2066, 2212.75806, -1324.14636, 1048.02185,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2608, 2218.85034, -1334.65027, 1050.31958,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2713, 2217.81860, -1324.75354, 1048.17517,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2737, 2219.01587, -1328.89233, 1049.74438,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2205, 2221.82642, -1331.88354, 1048.02087,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1714, 2223.03613, -1331.24902, 1047.98206,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(1715, 2220.45630, -1332.13391, 1048.02246,   0.00000, 0.00000, 135.00000);
	CreateDynamicObject(1715, 2220.46924, -1330.35181, 1048.02246,   0.00000, 0.00000, 45.00000);
	CreateDynamicObject(1724, 2222.28125, -1325.05908, 1047.99280,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1491, 2217.29272, -1324.07288, 1048.03760,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1491, 2220.70972, -1328.69067, 1048.03760,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1491, 2217.40723, -1327.31860, 1048.02136,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1840, 2219.55371, -1334.65283, 1050.72180,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2190, 2221.31592, -1331.80542, 1048.95618,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2517, 2210.73145, -1327.94788, 1048.02063,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(2518, 2213.30859, -1325.26978, 1048.02051,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2525, 2211.67603, -1326.18958, 1048.02051,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2833, 2221.27710, -1331.73840, 1048.02161,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2855, 2221.61230, -1330.32263, 1048.93750,   0.00000, 0.00000, 43.85999);
	CreateDynamicObject(16780, 2222.10742, -1319.88953, 1052.01965,   0.00000, 0.00000, 6.96000);
	CreateDynamicObject(16780, 2217.72290, -1319.54199, 1052.02222,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2754, 2220.00732, -1315.29272, 1048.74304,   0.00000, 0.00000, 90.72002);
	CreateDynamicObject(2754, 2218.98145, -1315.31079, 1048.74304,   0.00000, 0.00000, 90.72002);
	CreateDynamicObject(1649, 2223.36499, -1317.07288, 1049.64697,   0.00000, 0.00000, 88.86003);
	CreateDynamicObject(11743, 2220.96924, -1315.70862, 1048.32092,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(11743, 2217.04492, -1315.17590, 1048.02271,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1844, 2210.63745, -1323.69690, 1047.98413,   0.00000, 0.00000, 179.21997);
	CreateDynamicObject(1884, 2210.93896, -1320.11145, 1048.02185,   0.00000, 0.00000, 88.13997);
	CreateDynamicObject(49, 2217.95215, -1321.92664, 1048.99841,   92.28002, -10.37999, 130.25998);
	CreateDynamicObject(19587, 2214.41382, -1322.38428, 1048.05188,   0.00000, 0.00000, 86.58000);
	CreateDynamicObject(2000, 2222.44165, -1322.35913, 1048.18066,   0.00000, 0.00000, -98.75996);
	CreateDynamicObject(2391, 2223.07666, -1322.42249, 1050.18823,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(18717, 2213.90137, -1319.31824, 1049.18469,   0.00000, 0.00000, 0.00000);

	// ini script berkaitan dengan memancing ikan di laut bandara
	//AddStaticVehicle(modelid, Float:spawn_x, Float:spawn_y, Float:spawn_z, Float:z_angle, color1, color2)
	//AddStaticVehicleEx(modelid, Float:spawn_x, Float:spawn_y, Float:spawn_z, Float:z_angle, color1, color2, respawn_delay, addsiren=0)
	AddStaticVehicle(453,1243.1013,-2548.5920,-0.4530,107.3879, 1, 1); // kapal untuk memancing di laut
	PenandaMancingDiLaut = CreateDynamicObject(1279,1062.4270,-2567.9729,-0.5079, 0.000000, 0.000000, -138.436309); // pengingat kalau daerah mancing.
	CreateDynamicObject(18717+1, 1062.4270,-2567.9729,-0.5079-2.4, 0.0, 0.0, 0.0, 0,  0); // kembang api tanda di laut
	AttachDynamicAreaToObject(AreaMancingDiLaut, PenandaMancingDiLaut, STREAMER_OBJECT_TYPE_DYNAMIC, INVALID_PLAYER_ID,  0.0, 0.0, 0.0);

	// scropt yang berkaitan dengan rumah gubuk kecil arms dealer.
	new object;
	// label rumah gubuk
	labelajah = CreateDynamicObject(18659, 608.903198, -1188.038330, 42.815193, 0.000000, 0.000000, -138.436309);
	SetDynamicObjectMaterialText(labelajah, 0, ""COL_LRED2"KEEP\nOUT!!", 140, "Arial", 90, 1, 0xFFFFFFFF, 0x00000000, 1);
	// pickup untuk rumah gubuk jualan senjata
	PintuRumahKecilPick = CreatePickup(19522, 1, 608.2894,-1186.5176,41.7846, -1);
	Create3DTextLabel(""COL_RED"RUMAH GUBUK\n"COL_WHITE"Harap menjauh\n"COL_YELLOW"ini berbahaya!",COLOR_YELLOW, 608.2894,-1186.5176,42.50,5.0,0);
	PintuRumahKecilKeluarPick = CreatePickup(1272, 1, 505.0116,-2318.3489,512.7908, -1);
	//pickupbelisenjatadirumahkecil = 
	CreatePickup(1558, 1, 514.9139,-2335.0103,508.6938, -1);
	Create3DTextLabel(""COL_RED"*ARMS DEALER*\n\n"COL_RED"/belisenjata\n"COL_WHITE"untuk beli senjata jahat!",COLOR_SPRINGGREEN, 514.9139,-2335.0103,509.20,5.0,-1);
	
	//new worldid;
	//new interiorid;
	//CreateDynamicObject(modelid, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz, worldid = -1, interiorid = -1, playerid = -1, Float:streamdistance = STREAMER_OBJECT_SD, Float:drawdistance = STREAMER_OBJECT_DD, STREAMER_TAG_AREA areaid = STREAMER_TAG_AREA -1, priority = 0);

	object = CreateDynamicObject(6959,507.7510,-2303.0110,511.8220,0.0000,0.0000,0.0000, -1, -1, -1,200.0,200.0);
	//SetDynamicObjectMaterial(STREAMER_TAG_OBJECT objectid, materialindex, modelid, const txdname[], const texturename[], materialcolor = 0);
	SetDynamicObjectMaterial(object, 0, 5149, "lasground2_las2", "driveway4_128", 0x00000000);
	object = CreateDynamicObject(19353,508.0850,-2317.2791,513.5410,0.0000,0.0000,90.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 8678, "wddngchplgrnd01", "vgschapelwall01_128", 0x00000000);
	object = CreateDynamicObject(19383,504.8750,-2317.2791,513.5410,0.0000,0.0000,90.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 8678, "wddngchplgrnd01", "vgschapelwall01_128", 0x00000000);
	object = CreateDynamicObject(19859,505.6060,-2317.2891,513.0290,0.0000,0.0000,180.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 18200, "w_town2cs_t", "Bow_door_graffiti_128", 0x00000000);
	object = CreateDynamicObject(19353,501.6650,-2317.2791,513.5410,0.0000,0.0000,90.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 8678, "wddngchplgrnd01", "vgschapelwall01_128", 0x00000000);
	object = CreateDynamicObject(18066,505.6350,-2317.2461,513.6590,0.0000,90.0000,270.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	SetDynamicObjectMaterial(object, 1, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0x00000000);
	object = CreateDynamicObject(18066,504.8810,-2317.2461,514.3140,90.0000,180.0000,180.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	SetDynamicObjectMaterial(object, 1, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0x00000000);
	object = CreateDynamicObject(18066,505.6350,-2317.2461,512.2390,0.0000,90.0000,270.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	SetDynamicObjectMaterial(object, 1, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0x00000000);
	object = CreateDynamicObject(18066,504.0650,-2317.2461,513.6600,0.0000,90.0000,270.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	SetDynamicObjectMaterial(object, 1, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0x00000000);
	object = CreateDynamicObject(18066,504.8010,-2317.2439,514.3160,90.0000,180.0000,180.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	SetDynamicObjectMaterial(object, 1, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0x00000000);
	object = CreateDynamicObject(18066,504.0650,-2317.2461,512.2390,0.0000,90.0000,270.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	SetDynamicObjectMaterial(object, 1, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0x00000000);
	object = CreateDynamicObject(19399,509.1950,-2318.9180,513.5410,0.0000,0.0000,180.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 8678, "wddngchplgrnd01", "vgschapelwall01_128", 0x00000000);
	object = CreateDynamicObject(1897,509.0520,-2317.3169,512.8950,0.0000,0.0000,180.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,509.0520,-2317.3169,515.1250,0.0000,0.0000,180.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,507.8830,-2317.3169,515.2450,0.0000,90.0000,180.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,505.6530,-2317.3169,515.2450,0.0000,90.0000,180.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,503.4230,-2317.3169,515.2450,0.0000,90.0000,180.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(19383,502.2450,-2318.9280,513.5410,0.0000,0.0000,180.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 8678, "wddngchplgrnd01", "vgschapelwall01_128", 0x00000000);
	object = CreateDynamicObject(3361,508.1520,-2326.0259,509.7130,0.0000,0.0000,270.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 3925, "weemap", "Bow_Abattoir_Conc2", 0xFFFFFFFF);
	SetDynamicObjectMaterial(object, 1, 8438, "vgseroads", "ws_sub_pen_conc", 0x00000000);
	SetDynamicObjectMaterial(object, 4, 3925, "weemap", "Bow_Abattoir_Conc2", 0x00000000);
	object = CreateDynamicObject(19353,502.2460,-2322.1311,513.5410,0.0000,0.0000,180.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 8678, "wddngchplgrnd01", "vgschapelwall01_128", 0x00000000);

	object = CreateDynamicObject(19353,509.1950,-2322.1279,513.5410,0.0000,0.0000,180.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 8678, "wddngchplgrnd01", "vgschapelwall01_128", 0x00000000);
	object = CreateDynamicObject(3361,506.0420,-2326.2759,513.7330,0.0000,0.0000,450.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 3925, "weemap", "Bow_Abattoir_Conc2", 0xFFFFFFFF);
	SetDynamicObjectMaterial(object, 1, 8438, "vgseroads", "ws_sub_pen_conc", 0x00000000);
	SetDynamicObjectMaterial(object, 4, 3925, "weemap", "Bow_Abattoir_Conc2", 0x00000000);
	object = CreateDynamicObject(19353,503.4760,-2322.8120,513.5410,0.0000,0.0000,270.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 8678, "wddngchplgrnd01", "vgschapelwall01_128", 0x00000000);
	object = CreateDynamicObject(19353,504.9960,-2324.3311,513.5410,0.0000,0.0000,360.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 8678, "wddngchplgrnd01", "vgschapelwall01_128", 0x00000000);
	object = CreateDynamicObject(19353,509.1950,-2325.3369,513.5410,0.0000,0.0000,180.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 8678, "wddngchplgrnd01", "vgschapelwall01_128", 0x00000000);
	object = CreateDynamicObject(3095,504.6130,-2318.2329,515.2810,0.0000,0.0000,0.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 1, 9583, "bigshap_sfw", "man_ceiling", 0x00000000);
	object = CreateDynamicObject(19353,504.9960,-2327.5420,513.5410,0.0000,0.0000,360.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 8678, "wddngchplgrnd01", "vgschapelwall01_128", 0x00000000);
	object = CreateDynamicObject(19353,504.9960,-2327.5420,517.0410,0.0000,0.0000,360.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 8678, "wddngchplgrnd01", "vgschapelwall01_128", 0x00000000);
	object = CreateDynamicObject(19353,504.9960,-2324.3320,517.0410,0.0000,0.0000,360.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 8678, "wddngchplgrnd01", "vgschapelwall01_128", 0x00000000);
	object = CreateDynamicObject(3095,511.5720,-2327.2329,515.2810,0.0000,0.0000,0.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 1, 9583, "bigshap_sfw", "man_ceiling", 0x00000000);
	object = CreateDynamicObject(19353,507.1160,-2324.3320,517.0410,0.0000,0.0000,360.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 8678, "wddngchplgrnd01", "vgschapelwall01_128", 0x00000000);
	object = CreateDynamicObject(19353,507.1160,-2327.5449,517.0410,0.0000,0.0000,360.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 8678, "wddngchplgrnd01", "vgschapelwall01_128", 0x00000000);
	object = CreateDynamicObject(19353,509.1950,-2328.5459,513.5410,0.0000,0.0000,180.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 8678, "wddngchplgrnd01", "vgschapelwall01_128", 0x00000000);
	object = CreateDynamicObject(1498,502.2340,-2319.7061,511.7800,0.0000,0.0000,90.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, -1, "none", "none", 0xFFFFFFFF);
	object = CreateDynamicObject(3095,504.6130,-2325.9170,518.4670,-45.0000,0.0000,0.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 1, 13012, "sw_apartflat5", "concretenew256", 0x00000000);
	object = CreateDynamicObject(3095,504.6130,-2330.6909,518.7810,0.0000,0.0000,0.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 1, 9583, "bigshap_sfw", "man_ceiling", 0x00000000);
	object = CreateDynamicObject(19353,504.9960,-2330.7510,517.0410,0.0000,0.0000,360.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 8678, "wddngchplgrnd01", "vgschapelwall01_128", 0x00000000);
	object = CreateDynamicObject(19353,506.6360,-2331.2510,517.0410,0.0000,0.0000,450.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 8678, "wddngchplgrnd01", "vgschapelwall01_128", 0x00000000);
	object = CreateDynamicObject(16501,504.7890,-2326.5491,513.7500,-33.5000,90.0000,0.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 3925, "weemap", "Bow_Abattoir_Conc2", 0xFFFFFFFF);
	object = CreateDynamicObject(16501,504.7890,-2326.2410,513.5500,-33.5000,90.0000,0.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 3925, "weemap", "Bow_Abattoir_Conc2", 0xFFFFFFFF);
	object = CreateDynamicObject(16501,506.9090,-2325.6780,509.7570,-33.5000,90.0000,180.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 3925, "weemap", "Bow_Abattoir_Conc2", 0xFFFFFFFF);
	object = CreateDynamicObject(16501,506.9090,-2326.4441,509.2460,-33.5000,90.0000,180.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 3925, "weemap", "Bow_Abattoir_Conc2", 0xFFFFFFFF);
	object = CreateDynamicObject(1763,506.0940,-2326.8669,514.3020,18.4000,34.3000,103.9000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 14860, "gf1", "CJ_MAT2DIRT", 0x00000000);
	object = CreateDynamicObject(1347,506.1950,-2327.2200,515.2800,0.0000,37.7000,90.0000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(913,506.7430,-2330.6909,516.6400,0.0000,0.0000,180.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 14754, "sfhsb3", "mp_apt1_brokedoor", 0x00000000);
	object = CreateDynamicObject(2350,506.2620,-2327.0081,515.5870,-34.9000,22.7000,5.5000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(2807,506.6860,-2326.3191,514.5800,-30.4000,4.0000,-2.9000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 10789, "xenon_sfse", "bluemetal02", 0x00000000);
	SetDynamicObjectMaterial(object, 1, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0x00000000);
	object = CreateDynamicObject(1265,505.4550,-2327.3269,514.9430,-17.2000,0.0000,0.0000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(1265,506.6110,-2328.3479,515.7710,1.7000,29.1000,90.0000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(1265,505.6590,-2325.4790,514.3440,-4.1000,-51.5000,-87.9000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(19940,506.6260,-2325.8860,514.6840,-7.7000,35.0000,118.2000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 3925, "weemap", "telepole128", 0xFFFFFFFF);
	object = CreateDynamicObject(16500,504.5450,-2325.3269,515.1710,0.0000,0.0000,90.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, -1, "none", "none", 0x00FFFFFF);
	object = CreateDynamicObject(6959,508.3090,-2337.0979,507.7250,0.0000,0.0000,0.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 12923, "sw_block05", "dustyconcrete", 0xFFCCCCCC);
	object = CreateDynamicObject(19353,509.1950,-2328.5459,510.0410,0.0000,0.0000,180.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 17500, "stormdrain", "macbrij2_LAe", 0x00000000);
	object = CreateDynamicObject(19353,509.1950,-2328.5459,506.5410,180.0000,0.0000,180.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 17500, "stormdrain", "macbrij2_LAe", 0x00000000);
	object = CreateDynamicObject(19353,509.1950,-2328.5459,510.0410,0.0000,0.0000,180.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 17500, "stormdrain", "macbrij2_LAe", 0x00000000);
	object = CreateDynamicObject(19353,509.1950,-2325.3359,510.0410,0.0000,0.0000,180.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 17500, "stormdrain", "macbrij2_LAe", 0x00000000);
	object = CreateDynamicObject(19353,510.7250,-2330.0681,509.4310,0.0000,0.0000,270.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 17500, "stormdrain", "macbrij2_LAe", 0x00000000);
	object = CreateDynamicObject(19353,506.9750,-2328.5459,510.0410,0.0000,0.0000,180.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 17500, "stormdrain", "macbrij2_LAe", 0x00000000);
	object = CreateDynamicObject(19353,506.9750,-2325.3359,510.0410,0.0000,0.0000,180.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 17500, "stormdrain", "macbrij2_LAe", 0x00000000);
	object = CreateDynamicObject(19353,506.9750,-2322.1331,510.0410,0.0000,0.0000,180.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 17500, "stormdrain", "macbrij2_LAe", 0x00000000);
	object = CreateDynamicObject(19353,506.9750,-2328.5459,506.5410,180.0000,0.0000,180.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 17500, "stormdrain", "macbrij2_LAe", 0x00000000);
	object = CreateDynamicObject(3095,511.5320,-2328.6909,514.1210,35.0000,0.0000,0.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 1, 13012, "sw_apartflat5", "concretenew256", 0x00000000);
	object = CreateDynamicObject(3095,511.5390,-2334.6411,511.1590,0.0000,0.0000,0.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 1, 9583, "bigshap_sfw", "man_ceiling", 0x00000000);
	object = CreateDynamicObject(19353,507.5250,-2330.1951,513.5410,0.0000,0.0000,270.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 8678, "wddngchplgrnd01", "vgschapelwall01_128", 0x00000000);
	object = CreateDynamicObject(19353,507.5250,-2330.2051,512.9200,180.0000,0.0000,270.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 17500, "stormdrain", "macbrij2_LAe", 0x00000000);
	object = CreateDynamicObject(1897,502.2830,-2318.5581,515.2450,0.0000,90.0000,270.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,502.2830,-2320.7871,515.2450,0.0000,90.0000,270.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,502.2830,-2323.0171,515.2450,0.0000,90.0000,270.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,502.2830,-2322.6770,512.9040,0.0000,180.0000,270.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,502.2830,-2322.6770,515.1340,0.0000,180.0000,270.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,502.2830,-2317.4470,512.9040,0.0000,180.0000,270.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,502.2830,-2317.4470,515.1240,0.0000,180.0000,270.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,509.1630,-2318.5559,515.2450,360.0000,90.0000,450.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,509.1630,-2320.7859,515.2450,360.0000,90.0000,450.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,509.1650,-2321.7571,515.2440,360.0000,90.0000,450.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,509.1650,-2322.9270,512.8730,360.0000,180.0000,450.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,509.1650,-2322.9270,515.1030,360.0000,180.0000,450.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,505.0300,-2322.7771,512.8730,360.0000,180.0000,720.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,505.0300,-2322.7771,515.1030,360.0000,180.0000,720.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,503.8400,-2322.7771,515.2130,360.0000,270.0000,1080.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,501.6100,-2322.7771,515.2130,360.0000,270.0000,1080.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(19482,509.2010,-2317.7859,513.9950,0.0000,0.0000,0.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11390, "hubint2", "ws_fuckedwin2", 0x00000000);
	object = CreateDynamicObject(19482,509.2610,-2317.7859,514.0050,0.0000,0.0000,0.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 17944, "lngblok_lae2", "white64bumpy", 0xDDFFFFFF);
	object = CreateDynamicObject(647,511.6760,-2318.7539,513.4700,0.0000,0.0000,0.0000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(647,511.6760,-2322.7849,513.9300,0.0000,0.0000,0.0000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(18066,502.2260,-2318.1670,513.6590,0.0000,90.0000,360.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	SetDynamicObjectMaterial(object, 1, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0x00000000);
	object = CreateDynamicObject(18066,502.2260,-2318.1670,512.2390,0.0000,90.0000,360.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	SetDynamicObjectMaterial(object, 1, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0x00000000);
	object = CreateDynamicObject(18066,502.2260,-2319.7371,512.2390,0.0000,90.0000,360.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	SetDynamicObjectMaterial(object, 1, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0x00000000);
	object = CreateDynamicObject(18066,502.2260,-2319.7371,513.6590,0.0000,90.0000,360.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	SetDynamicObjectMaterial(object, 1, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0x00000000);
	object = CreateDynamicObject(18066,502.2260,-2318.9961,514.3150,90.0000,180.0000,270.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	SetDynamicObjectMaterial(object, 1, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0x00000000);
	object = CreateDynamicObject(18066,502.2280,-2318.9060,514.3140,90.0000,180.0000,270.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	SetDynamicObjectMaterial(object, 1, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0x00000000);
	object = CreateDynamicObject(18066,509.0980,-2318.7461,512.9530,90.0000,180.0000,270.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 1637, "od_beachstuff", "wood02", 0x00000000);
	SetDynamicObjectMaterial(object, 1, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0x00000000);
	object = CreateDynamicObject(18066,509.0990,-2319.1060,512.9560,90.0000,180.0000,270.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 1637, "od_beachstuff", "wood02", 0x00000000);
	SetDynamicObjectMaterial(object, 1, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0x00000000);
	object = CreateDynamicObject(18066,509.2190,-2317.9980,513.6390,180.0000,270.0000,540.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	SetDynamicObjectMaterial(object, 1, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0x00000000);
	object = CreateDynamicObject(18066,509.2190,-2319.8501,513.6390,180.0000,270.0000,540.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	SetDynamicObjectMaterial(object, 1, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0x00000000);
	object = CreateDynamicObject(18066,509.2190,-2319.1650,514.3790,270.0000,270.0000,540.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	SetDynamicObjectMaterial(object, 1, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0x00000000);
	object = CreateDynamicObject(18066,509.2200,-2318.6541,514.3800,270.0000,270.0000,540.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	SetDynamicObjectMaterial(object, 1, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0x00000000);
	object = CreateDynamicObject(18066,509.2800,-2318.8840,513.6890,360.0000,270.0000,540.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	SetDynamicObjectMaterial(object, 1, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0x00000000);
	object = CreateDynamicObject(1897,509.1670,-2324.1179,511.8430,360.0000,270.0000,1170.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(19353,509.1950,-2322.1221,510.0410,0.0000,0.0000,180.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 17500, "stormdrain", "macbrij2_LAe", 0x00000000);
	object = CreateDynamicObject(1897,509.1670,-2326.3479,511.8430,360.0000,270.0000,1170.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,509.1670,-2328.5801,511.8430,360.0000,270.0000,1170.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,509.1670,-2330.8110,511.8430,360.0000,270.0000,1170.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,506.9670,-2324.5391,511.8430,540.0000,270.0000,1530.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,506.9670,-2326.7700,511.8430,540.0000,270.0000,1530.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,506.9670,-2329.0000,511.8430,540.0000,270.0000,1530.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,508.0170,-2330.1809,511.8650,900.0000,270.0000,1620.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(19353,506.9750,-2331.7539,509.4410,0.0000,0.0000,180.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 17500, "stormdrain", "macbrij2_LAe", 0x00000000);
	object = CreateDynamicObject(19383,512.2450,-2331.7571,509.4310,0.0000,0.0000,360.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 17500, "stormdrain", "macbrij2_LAe", 0x00000000);
	object = CreateDynamicObject(19353,506.9750,-2334.9651,509.4410,0.0000,0.0000,180.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 17500, "stormdrain", "macbrij2_LAe", 0x00000000);
	object = CreateDynamicObject(19353,512.2460,-2334.9651,509.4410,0.0000,0.0000,180.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 17500, "stormdrain", "macbrij2_LAe", 0x00000000);
	object = CreateDynamicObject(19445,507.3560,-2335.7561,509.4410,0.0000,0.0000,270.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 17500, "stormdrain", "macbrij2_LAe", 0x00000000);
	object = CreateDynamicObject(19383,512.4250,-2331.7571,509.4310,0.0000,0.0000,360.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 5174, "warehus_las2", "newall1-1128", 0x00000000);
	object = CreateDynamicObject(19353,512.4250,-2334.9680,509.4310,0.0000,0.0000,360.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 5174, "warehus_las2", "newall1-1128", 0x00000000);
	object = CreateDynamicObject(19353,512.4250,-2328.5481,509.4310,0.0000,0.0000,360.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 5174, "warehus_las2", "newall1-1128", 0x00000000);
	object = CreateDynamicObject(19353,514.1050,-2327.0271,509.4310,0.0000,0.0000,450.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 5174, "warehus_las2", "newall1-1128", 0x00000000);
	object = CreateDynamicObject(19353,514.1050,-2336.6189,509.4310,0.0000,0.0000,450.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 5174, "warehus_las2", "newall1-1128", 0x00000000);
	object = CreateDynamicObject(19353,517.3150,-2336.6189,509.4310,0.0000,0.0000,450.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 5174, "warehus_las2", "newall1-1128", 0x00000000);
	object = CreateDynamicObject(19383,518.9950,-2334.9490,509.4310,0.0000,0.0000,540.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 5174, "warehus_las2", "newall1-1128", 0x00000000);
	object = CreateDynamicObject(19353,520.5150,-2333.2710,509.4310,0.0000,0.0000,450.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 5174, "warehus_las2", "newall1-1128", 0x00000000);
	object = CreateDynamicObject(19353,517.3140,-2327.0271,509.4310,0.0000,0.0000,450.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 5174, "warehus_las2", "newall1-1128", 0x00000000);
	object = CreateDynamicObject(19353,520.5250,-2327.0271,509.4310,0.0000,0.0000,450.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 5174, "warehus_las2", "newall1-1128", 0x00000000);
	object = CreateDynamicObject(19353,523.7340,-2327.0271,509.4310,0.0000,0.0000,450.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 5174, "warehus_las2", "newall1-1128", 0x00000000);
	object = CreateDynamicObject(19353,526.9440,-2327.0271,509.4310,0.0000,0.0000,450.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 5174, "warehus_las2", "newall1-1128", 0x00000000);
	object = CreateDynamicObject(19353,528.6340,-2328.7070,509.4310,0.0000,0.0000,540.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 13131, "cunte_blockammo", "dt_ammu_wall2", 0xFFFFEEEE);
	object = CreateDynamicObject(19353,528.6340,-2331.9170,509.4310,0.0000,0.0000,540.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 13131, "cunte_blockammo", "dt_ammu_wall2", 0xFFFFEEEE);
	object = CreateDynamicObject(19353,523.7250,-2333.2710,509.4310,0.0000,0.0000,450.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 5174, "warehus_las2", "newall1-1128", 0x00000000);
	object = CreateDynamicObject(19353,526.9350,-2333.2710,509.4310,0.0000,0.0000,450.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 5174, "warehus_las2", "newall1-1128", 0x00000000);
	object = CreateDynamicObject(19455,528.6250,-2330.7180,506.3610,180.0000,0.0000,540.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 5174, "warehus_las2", "newall1-1128", 0x00000000);
	object = CreateDynamicObject(19455,528.6250,-2330.7180,512.7810,180.0000,0.0000,540.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 5174, "warehus_las2", "newall1-1128", 0x00000000);
	object = CreateDynamicObject(3095,520.5390,-2334.6411,511.1590,0.0000,0.0000,0.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 1, 9583, "bigshap_sfw", "man_ceiling", 0x00000000);
	object = CreateDynamicObject(3095,520.5390,-2325.6411,511.1590,0.0000,0.0000,0.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 1, 9583, "bigshap_sfw", "man_ceiling", 0x00000000);
	object = CreateDynamicObject(-1,520.5390,-2325.6411,1511.1591,0.0000,0.0000,0.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 1, 9583, "bigshap_sfw", "man_ceiling", 0x00000000);
	object = CreateDynamicObject(3095,529.5390,-2334.6411,511.1590,0.0000,0.0000,0.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 1, 9583, "bigshap_sfw", "man_ceiling", 0x00000000);
	object = CreateDynamicObject(3095,529.5390,-2325.6411,511.1590,0.0000,0.0000,0.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 1, 9583, "bigshap_sfw", "man_ceiling", 0x00000000);
	object = CreateDynamicObject(3095,516.4980,-2325.6411,511.1610,0.0000,0.0000,0.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 1, 9583, "bigshap_sfw", "man_ceiling", 0x00000000);
	object = CreateDynamicObject(1499,512.3210,-2330.9851,507.6790,0.0000,0.0000,-90.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, -1, "none", "none", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,509.1930,-2330.0940,510.0650,0.0000,0.0000,180.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,509.1930,-2330.0940,507.8350,0.0000,0.0000,180.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,507.0030,-2330.1741,507.8350,0.0000,0.0000,270.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,507.0030,-2330.1741,510.0650,0.0000,0.0000,270.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,508.1730,-2330.0940,511.0850,180.0000,90.0000,360.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,510.4030,-2330.0940,511.0850,180.0000,90.0000,360.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,511.0430,-2330.0920,511.0850,180.0000,90.0000,360.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,512.2130,-2331.3330,511.0850,180.0000,90.0000,270.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,512.2130,-2333.5649,511.0850,180.0000,90.0000,270.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,512.2130,-2335.7949,511.0850,180.0000,90.0000,270.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,510.9630,-2335.7251,511.0850,180.0000,90.0000,180.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,508.7330,-2335.7251,511.0850,180.0000,90.0000,180.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,506.5030,-2335.7251,511.0850,180.0000,90.0000,180.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,507.0030,-2331.3611,511.0850,180.0000,90.0000,90.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,507.0030,-2333.5911,511.0850,180.0000,90.0000,90.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,507.0030,-2335.8201,511.0850,180.0000,90.0000,90.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,507.0030,-2335.5901,509.9450,180.0000,180.0000,90.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,507.0030,-2335.5901,507.7150,180.0000,180.0000,90.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(18066,512.4250,-2332.5149,508.1250,0.0000,90.0000,180.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	SetDynamicObjectMaterial(object, 1, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0x00000000);
	object = CreateDynamicObject(1897,512.2230,-2335.6201,509.9450,180.0000,180.0000,270.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,512.2230,-2330.2300,509.9450,180.0000,180.0000,270.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,512.2230,-2330.2300,507.7150,180.0000,180.0000,270.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(18066,512.2750,-2332.5161,509.5450,0.0000,90.0000,180.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	SetDynamicObjectMaterial(object, 1, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0x00000000);
	object = CreateDynamicObject(18066,512.2750,-2331.7649,510.2000,90.0000,90.0000,180.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	SetDynamicObjectMaterial(object, 1, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0x00000000);
	object = CreateDynamicObject(18066,512.2750,-2332.5161,508.1250,0.0000,90.0000,180.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	SetDynamicObjectMaterial(object, 1, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0x00000000);
	object = CreateDynamicObject(18066,512.2750,-2330.9451,508.1250,0.0000,90.0000,180.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	SetDynamicObjectMaterial(object, 1, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0x00000000);
	object = CreateDynamicObject(18066,512.2750,-2330.9451,509.5450,0.0000,90.0000,180.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	SetDynamicObjectMaterial(object, 1, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0x00000000);
	object = CreateDynamicObject(18066,512.2770,-2331.6851,510.1990,90.0000,90.0000,180.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	SetDynamicObjectMaterial(object, 1, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0x00000000);
	object = CreateDynamicObject(2680,502.4050,-2318.4080,512.6940,20.0000,0.0000,95.0000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(18066,502.4260,-2318.5701,513.9540,0.0000,30.0000,-90.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 1637, "od_beachstuff", "wood02", 0xFFFFFFFF);
	SetDynamicObjectMaterial(object, 1, 1637, "od_beachstuff", "wood02", 0x00000000);
	object = CreateDynamicObject(18066,502.4240,-2319.3569,513.4990,0.0000,30.0000,-90.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 1637, "od_beachstuff", "wood02", 0xFFFFFFFF);
	SetDynamicObjectMaterial(object, 1, 1637, "od_beachstuff", "wood02", 0x00000000);
	object = CreateDynamicObject(18066,502.4240,-2319.1470,512.9760,0.0000,10.0000,270.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 1637, "od_beachstuff", "wood02", 0xFFFFFFFF);
	SetDynamicObjectMaterial(object, 1, 1637, "od_beachstuff", "wood02", 0x00000000);
	object = CreateDynamicObject(18066,502.4260,-2318.6570,513.0620,0.0000,10.0000,270.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 1637, "od_beachstuff", "wood02", 0xFFFFFFFF);
	SetDynamicObjectMaterial(object, 1, 1637, "od_beachstuff", "wood02", 0x00000000);
	object = CreateDynamicObject(17969,502.3500,-2315.5400,512.9270,0.0000,0.0000,180.0000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(17969,502.3300,-2321.0710,513.1970,0.0000,0.0000,179.8000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(17969,502.3700,-2322.8220,513.6470,0.0000,0.0000,-179.4000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(18666,503.6360,-2322.7119,514.1470,2.7000,0.0000,270.0000, -1, -1, -1,200.0,200.0);
	//SetDynamicObjectMaterial(object, 0, -1, "none", "none", 0xFF000000);
	SetDynamicObjectMaterialText(object, 0, "PUTU\nSUHARTAWAN", 80, "Arial", 24, 0, 0xFF66FF00, 0x00000000, 0);
	object = CreateDynamicObject(911,503.6820,-2322.2419,512.3510,0.0000,0.0000,180.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 17925, "lae2fake_int", "ab_wood1", 0x00000000);
	object = CreateDynamicObject(4227,506.9740,-2329.5950,509.0750,0.0000,0.0000,90.0000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(365,503.6070,-2322.5381,513.0930,0.0000,-5.0000,0.0000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(365,503.9610,-2322.3721,513.0310,0.0000,85.0000,55.0000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(365,503.2690,-2322.0061,511.9510,0.0000,85.0000,5.0000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(1893,505.2260,-2320.2429,515.7360,0.0000,0.0000,0.0000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(1893,506.0850,-2329.0769,519.2470,0.0000,0.0000,90.0000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(1893,509.5860,-2333.3870,511.6170,0.0000,0.0000,90.0000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(1440,508.3890,-2318.2180,512.2990,0.0000,0.0000,-6.2000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(2121,504.8170,-2322.2329,512.2880,-33.0000,0.0000,146.7000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 10789, "xenon_sfse", "bluemetal02", 0x00000000);
	object = CreateDynamicObject(19477,505.2180,-2317.4250,511.7960,0.0000,-90.0000,0.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 10789, "xenon_sfse", "ruffroadlas", 0x00000000);
	object = CreateDynamicObject(19477,509.0970,-2320.7351,511.5960,90.0000,-90.0000,-90.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 10789, "xenon_sfse", "ruffroadlas", 0x00000000);
	object = CreateDynamicObject(2673,503.2450,-2321.2361,511.8680,0.0000,0.0000,27.8000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(1338,507.7230,-2335.0291,508.3770,0.0000,0.0000,-22.8000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, -1, "none", "none", 0xFFFFFFFF);
	object = CreateDynamicObject(925,510.9750,-2334.8311,508.6880,0.0000,0.0000,0.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, -1, "none", "none", 0xFFFFFFFF);
	object = CreateDynamicObject(1886,511.7030,-2334.9060,511.2230,15.5000,0.0000,-153.2000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(2922,512.1410,-2332.8850,508.9510,0.0000,0.0000,-270.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 1, 9818, "ship_brijsfw", "ship_greenscreen1", 0x00000000);
	object = CreateDynamicObject(927,512.1120,-2333.8560,509.8850,0.0000,0.0000,270.0000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(19475,511.9830,-2334.8379,510.6500,0.0000,0.0000,-32.8000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 10675, "transformer_sfs", "hangingwires2", 0x00000000);
	object = CreateDynamicObject(920,510.5700,-2334.8989,510.2310,0.0000,0.0000,180.0000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(19476,511.7250,-2334.8950,509.7600,0.0000,270.0000,-65.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 10675, "transformer_sfs", "hangingwires2", 0x00000000);
	object = CreateDynamicObject(19476,511.6450,-2334.6160,509.7600,0.0000,270.0000,109.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 10675, "transformer_sfs", "hangingwires2", 0x00000000);
	object = CreateDynamicObject(19563,512.3740,-2334.5691,509.8030,-90.0000,0.0000,90.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 16146, "des_ufoinn", "electricbox256", 0x00000000);
	object = CreateDynamicObject(18066,512.4250,-2332.5149,509.5450,0.0000,90.0000,180.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	SetDynamicObjectMaterial(object, 1, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0x00000000);
	object = CreateDynamicObject(18066,512.4250,-2330.9441,509.5450,0.0000,90.0000,180.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	SetDynamicObjectMaterial(object, 1, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0x00000000);
	object = CreateDynamicObject(18066,512.4250,-2330.9441,508.1250,0.0000,90.0000,180.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	SetDynamicObjectMaterial(object, 1, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0x00000000);
	object = CreateDynamicObject(18066,512.4250,-2331.6841,510.2010,90.0000,90.0000,180.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	SetDynamicObjectMaterial(object, 1, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0x00000000);
	object = CreateDynamicObject(18066,512.4260,-2331.7639,510.2000,90.0000,90.0000,180.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	SetDynamicObjectMaterial(object, 1, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0x00000000);
	object = CreateDynamicObject(1897,512.4520,-2336.4500,510.0450,0.0000,0.0000,-90.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,512.4520,-2336.4500,507.8050,0.0000,0.0000,-90.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,512.4520,-2327.1580,507.8050,0.0000,0.0000,-90.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,512.4520,-2327.1580,510.0350,0.0000,0.0000,-90.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,528.5930,-2327.1819,510.0350,0.0000,0.0000,90.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,528.5930,-2327.1819,507.8050,0.0000,0.0000,90.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,528.5930,-2333.1321,507.8050,0.0000,0.0000,90.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,528.5930,-2333.1321,510.0350,0.0000,0.0000,90.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,518.9620,-2333.2620,510.0450,0.0000,0.0000,90.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,518.9620,-2333.2620,507.8150,0.0000,0.0000,90.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,518.9620,-2336.4810,507.8150,0.0000,0.0000,90.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,518.9620,-2336.4810,510.0450,0.0000,0.0000,90.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,518.9620,-2334.4290,511.1150,0.0000,90.0000,90.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,518.9620,-2336.6599,511.1150,0.0000,90.0000,90.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,517.7210,-2336.5801,511.1150,0.0000,90.0000,0.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,515.4910,-2336.5801,511.1150,0.0000,90.0000,0.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,513.7010,-2336.5779,511.1160,0.0000,90.0000,0.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,512.4510,-2335.2881,511.1160,0.0000,90.0000,-90.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,512.4510,-2333.0591,511.1160,0.0000,90.0000,-90.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,512.4510,-2330.8291,511.1160,0.0000,90.0000,-90.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,512.4510,-2328.5991,511.1160,0.0000,90.0000,-90.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,512.4510,-2326.3611,511.1160,0.0000,90.0000,-90.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,513.6900,-2327.0620,511.1160,0.0000,90.0000,-180.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,515.9200,-2327.0620,511.1160,0.0000,90.0000,-180.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,518.1490,-2327.0620,511.1160,0.0000,90.0000,-180.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,520.3790,-2327.0620,511.1160,0.0000,90.0000,-180.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,522.6090,-2327.0620,511.1160,0.0000,90.0000,-180.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,524.8390,-2327.0620,511.1160,0.0000,90.0000,-180.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,527.0690,-2327.0620,511.1160,0.0000,90.0000,-180.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,529.3000,-2327.0620,511.1160,0.0000,90.0000,-180.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,528.6000,-2328.3430,511.1160,0.0000,90.0000,-270.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,528.6000,-2330.5730,511.1160,0.0000,90.0000,-270.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,528.6000,-2332.8020,511.1160,0.0000,90.0000,-270.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,519.9400,-2333.2419,511.1160,360.0000,270.0000,-360.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,522.1700,-2333.2419,511.1160,360.0000,270.0000,-360.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,524.4000,-2333.2419,511.1160,360.0000,270.0000,-360.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,526.6300,-2333.2419,511.1160,360.0000,270.0000,-360.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,528.8590,-2333.2419,511.1160,360.0000,270.0000,-360.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(941,519.6940,-2332.2390,508.1540,0.0000,0.0000,90.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 1637, "od_beachstuff", "wood02", 0xFFFFFFFF);
	SetDynamicObjectMaterial(object, 1, 10350, "oc_flats_gnd_sfs", "ws_woodfence1", 0x00000000);
	object = CreateDynamicObject(937,519.6240,-2328.0481,508.1540,0.0000,0.0000,270.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 1637, "od_beachstuff", "wood02", 0xFFFFFFFF);
	SetDynamicObjectMaterial(object, 1, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0x00000000);
	object = CreateDynamicObject(3013,519.3720,-2329.1960,507.8380,0.0000,0.0000,-17.4000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(3014,519.7970,-2329.2480,507.8180,0.0000,0.0000,3.9000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(3014,519.7960,-2329.2681,508.2980,0.0000,0.0000,-3.3000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(19940,519.9010,-2329.9351,508.6420,0.0000,0.0000,2.9000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 3925, "weemap", "telepole128", 0x00000000);
	object = CreateDynamicObject(19940,519.3420,-2329.9580,508.6420,360.0000,0.0000,178.7000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 3925, "weemap", "telepole128", 0x00000000);
	object = CreateDynamicObject(1587,523.8400,-2328.8550,506.5090,0.0000,0.0000,90.0000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(1586,523.7400,-2328.8550,507.8590,0.0000,0.0000,90.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 13131, "cunte_blockammo", "dt_ammu_wall2", 0xFFCCDDFF);
	object = CreateDynamicObject(1587,526.3800,-2331.4160,506.5090,0.0000,0.0000,90.0000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(1586,526.3700,-2331.4160,507.8680,0.0000,0.0000,270.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 13131, "cunte_blockammo", "dt_ammu_wall2", 0xFFCCDDFF);
	object = CreateDynamicObject(2448,514.4520,-2333.8459,507.1730,0.0000,0.0000,180.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 2, 914, "industrialext", "CJ_GEN_GLASS2", 0x00000000);
	SetDynamicObjectMaterial(object, 3, 3925, "weemap", "telepole128", 0x00000000);
	SetDynamicObjectMaterial(object, 4, 8494, "vgslowbuild1", "bluemetal", 0x00000000);
	object = CreateDynamicObject(2448,516.8510,-2333.8459,507.1730,0.0000,0.0000,180.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 2, 914, "industrialext", "CJ_GEN_GLASS2", 0x00000000);
	SetDynamicObjectMaterial(object, 3, 3925, "weemap", "telepole128", 0x00000000);
	SetDynamicObjectMaterial(object, 4, 8494, "vgslowbuild1", "bluemetal", 0x00000000);
	object = CreateDynamicObject(2400,517.1260,-2336.9070,508.4610,0.0000,0.0000,180.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 1, 1, "none", "none", 0x00FFFFFF);
	object = CreateDynamicObject(2509,516.6780,-2336.5081,509.7670,0.0000,90.0000,180.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 1, "none", "none", 0xFFFFFFFF);
	object = CreateDynamicObject(2509,514.7890,-2336.5081,509.7670,0.0000,90.0000,180.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 1, "none", "none", 0xFFFFFFFF);
	object = CreateDynamicObject(1271,513.0150,-2336.0129,508.0290,0.0000,0.0000,49.7000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 498, "boxville", "boxville92crate128", 0xFFFFFFFF);
	object = CreateDynamicObject(2969,512.8300,-2336.1331,508.4580,0.0000,0.0000,104.7000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(2807,513.6690,-2335.1721,508.2010,0.0000,0.0000,-114.3000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 10789, "xenon_sfse", "bluemetal02", 0x00000000);
	SetDynamicObjectMaterial(object, 1, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0x00000000);
	object = CreateDynamicObject(1744,512.3530,-2335.7290,509.2430,0.0000,0.0000,-270.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 1637, "od_beachstuff", "wood02", 0x00000000);
	object = CreateDynamicObject(2358,519.6330,-2327.3740,508.7390,0.0000,0.0000,0.0000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(2359,519.7700,-2327.8169,508.8290,0.0000,0.0000,-11.3000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(2043,519.4710,-2328.7009,508.7220,0.0000,0.0000,69.1000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(19832,519.5990,-2327.7019,508.7490,90.0000,0.0000,-11.3000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(19832,519.6260,-2328.4719,508.6320,0.0000,0.0000,-3.5000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(2038,519.4180,-2330.7280,508.7000,-90.0000,0.0000,-80.0000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(19995,519.5630,-2331.2180,508.6390,0.0000,-270.0000,-23.0000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(19995,519.5730,-2331.3979,508.6390,0.0000,-270.0000,18.0000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(3577,514.1690,-2327.2461,508.4150,0.0000,0.0000,-179.9000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 1, "none", "none", 0xFFFFFFFF);
	SetDynamicObjectMaterial(object, 2, 498, "boxville", "boxville92crate128", 0x00000000);
	object = CreateDynamicObject(1271,513.8250,-2327.8601,508.1390,0.0000,0.0000,0.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 456, "yankee", "yankee92crate", 0xFFAAAAAA);
	object = CreateDynamicObject(1271,513.8270,-2327.8579,508.7080,0.0000,0.0000,0.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 456, "yankee", "yankee92crate", 0xFFAAAAAA);
	object = CreateDynamicObject(2055,518.2450,-2327.1340,509.5570,0.0000,1.2000,0.0000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(2102,512.6830,-2334.7361,509.5780,0.0000,0.0000,99.0000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(2162,512.4770,-2335.4729,510.9080,180.0000,0.0000,-100.2000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 1, 1, "none", "none", 0x00FFFFFF);
	SetDynamicObjectMaterial(object, 2, -1, "none", "none", 0x00FFFFFF);
	object = CreateDynamicObject(19383,519.1650,-2334.9490,509.4310,0.0000,0.0000,540.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 17517, "templae2land", "chipboard_256128", 0x00000000);
	object = CreateDynamicObject(19353,520.5250,-2333.3311,509.4310,0.0000,0.0000,450.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 17517, "templae2land", "chipboard_256128", 0x00000000);
	object = CreateDynamicObject(19353,526.9350,-2333.3311,509.4310,0.0000,0.0000,450.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 17517, "templae2land", "chipboard_256128", 0x00000000);
	object = CreateDynamicObject(19353,519.1650,-2338.1541,509.4310,0.0000,0.0000,540.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 17517, "templae2land", "chipboard_256128", 0x00000000);
	object = CreateDynamicObject(19353,524.0540,-2339.7451,509.4310,0.0000,0.0000,630.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 17517, "templae2land", "chipboard_256128", 0x00000000);
	object = CreateDynamicObject(19353,520.8440,-2339.8020,509.4310,0.0000,0.0000,450.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 5174, "warehus_las2", "newall1-1128", 0x00000000);
	object = CreateDynamicObject(19353,525.7240,-2338.2129,509.4310,0.0000,0.0000,720.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 17517, "templae2land", "chipboard_256128", 0x00000000);
	object = CreateDynamicObject(19353,526.8950,-2335.0139,509.4310,0.0000,0.0000,720.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 17517, "templae2land", "chipboard_256128", 0x00000000);
	object = CreateDynamicObject(19353,527.2850,-2336.7041,509.4310,0.0000,0.0000,810.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 17517, "templae2land", "chipboard_256128", 0x00000000);
	object = CreateDynamicObject(3095,520.5390,-2343.6411,511.1590,0.0000,0.0000,0.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 1, 9583, "bigshap_sfw", "man_ceiling", 0x00000000);
	object = CreateDynamicObject(3095,529.5390,-2343.6411,511.1590,0.0000,0.0000,0.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 1, 9583, "bigshap_sfw", "man_ceiling", 0x00000000);
	object = CreateDynamicObject(1897,519.3330,-2333.3669,510.0550,0.0000,0.0000,-180.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,519.3330,-2333.3669,507.8250,0.0000,0.0000,-180.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,522.0780,-2333.3669,507.8250,0.0000,0.0000,-180.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,522.0780,-2333.3669,510.0540,0.0000,0.0000,-180.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,525.4060,-2333.3669,510.0540,0.0000,0.0000,-180.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,525.4060,-2333.3669,507.8240,0.0000,0.0000,-180.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,526.7560,-2333.3669,507.8240,0.0000,0.0000,-180.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,526.7560,-2333.3669,510.0540,0.0000,0.0000,-180.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,526.7360,-2336.6731,510.0540,0.0000,0.0000,0.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,526.7360,-2336.6731,507.8250,0.0000,0.0000,0.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,525.5660,-2339.7170,507.8250,0.0000,0.0000,0.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,525.5660,-2339.7170,510.0540,0.0000,0.0000,0.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,522.5010,-2339.7170,510.0540,0.0000,0.0000,0.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,522.5010,-2339.7170,507.8240,0.0000,0.0000,0.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,519.3010,-2339.7170,507.8240,0.0000,0.0000,0.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,519.3010,-2339.7170,510.0540,0.0000,0.0000,0.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,519.3010,-2339.8069,510.0540,0.0000,0.0000,0.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,519.3010,-2339.8069,507.8240,0.0000,0.0000,0.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,519.1910,-2334.6050,511.1140,0.0000,90.0000,-90.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,519.1910,-2336.8350,511.1140,0.0000,90.0000,-90.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,519.1910,-2339.0649,511.1140,0.0000,90.0000,-90.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,520.4800,-2339.7261,511.1140,0.0000,90.0000,0.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,522.7100,-2339.7261,511.1140,0.0000,90.0000,0.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,524.9400,-2339.7261,511.1140,0.0000,90.0000,0.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,525.7000,-2337.7241,511.1140,0.0000,90.0000,90.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,525.7000,-2339.9541,511.1140,0.0000,90.0000,90.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,526.6860,-2336.6731,511.1140,180.0000,90.0000,540.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,526.8600,-2334.6101,511.1140,0.0000,90.0000,90.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,526.8600,-2336.8391,511.1140,0.0000,90.0000,90.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,520.4790,-2333.3650,511.1140,0.0000,90.0000,180.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,522.7090,-2333.3650,511.1140,0.0000,90.0000,180.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,524.9390,-2333.3650,511.1140,0.0000,90.0000,180.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(1897,527.1690,-2333.3650,511.1140,0.0000,90.0000,180.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0xFFFFFFFF);
	object = CreateDynamicObject(11714,519.3930,-2337.8091,509.7230,0.0000,5.2000,180.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 17517, "templae2land", "chipboard_256128", 0xFFFFFFFF);
	object = CreateDynamicObject(11714,519.6190,-2337.8091,507.2330,0.0000,5.2000,180.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 17517, "templae2land", "chipboard_256128", 0xFFFFFFFF);
	object = CreateDynamicObject(1494,519.0790,-2334.2051,507.6720,0.0000,0.0000,-90.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 1, 3906, "libertyhi5", "chipboardgrating64HV", 0x00000000);
	object = CreateDynamicObject(941,526.2270,-2335.6101,508.1620,0.0000,0.0000,90.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 5154, "dkcargoshp_las2", "jettyfloor02", 0xFFFFFFFF);
	SetDynamicObjectMaterial(object, 1, 11631, "mp_ranchcut", "mpCJ_DarkWood", 0x00000000);
	object = CreateDynamicObject(2370,522.9270,-2338.7471,507.3780,0.0000,0.0000,0.0000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(1712,525.1150,-2337.6760,507.6820,0.0000,0.0000,270.0000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(2121,521.8600,-2339.1370,508.1950,0.0000,0.0000,143.5000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(2121,521.7420,-2337.9800,508.1950,0.0000,0.0000,80.4000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(2737,526.7670,-2335.5620,509.5750,0.0000,0.0000,-90.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 1637, "od_beachstuff", "wood02", 0x00000000);
	SetDynamicObjectMaterial(object, 1, 11391, "hubprops2_sfse", "toolwall1", 0x00000000);
	object = CreateDynamicObject(2051,517.3550,-2327.1599,509.5650,0.0000,0.0000,0.0000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(2050,516.6450,-2327.1599,509.5650,0.0000,-1.5000,0.0000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(2063,523.6990,-2333.6260,508.5740,0.0000,0.0000,0.0000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(2063,523.7000,-2333.6250,509.9140,0.0000,0.0000,0.0000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(19940,526.7670,-2335.3420,509.1850,0.0000,0.0000,0.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 1637, "od_beachstuff", "wood02", 0x00000000);
	object = CreateDynamicObject(19940,526.7670,-2335.3420,509.1550,0.0000,0.0000,0.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 1637, "od_beachstuff", "wood02", 0x00000000);
	object = CreateDynamicObject(19940,526.7670,-2335.3420,509.1240,0.0000,0.0000,0.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 1637, "od_beachstuff", "wood02", 0x00000000);
	object = CreateDynamicObject(3014,526.3530,-2333.8679,507.9070,0.0000,0.0000,45.0000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(3014,526.3530,-2333.8679,508.3870,0.0000,0.0000,67.1000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(3014,525.6580,-2333.6880,507.8870,0.0000,0.0000,0.0000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(1893,523.9170,-2330.1721,511.6190,0.0000,0.0000,0.0000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(1893,515.3160,-2330.1721,511.6190,0.0000,0.0000,0.0000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(1893,515.3160,-2334.8250,511.6190,0.0000,0.0000,0.0000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(1893,521.9770,-2337.7759,511.6190,0.0000,0.0000,0.0000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(1893,526.0770,-2335.5459,511.6190,0.0000,0.0000,90.0000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(349,516.5820,-2336.4961,509.3320,0.0000,10.5500,6.0000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(355,514.7280,-2336.4080,510.1380,0.0000,8.0500,186.0000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(357,515.9110,-2336.4050,510.1660,0.0000,15.0500,186.0000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(358,515.9320,-2336.4241,509.3120,0.0000,10.1550,186.0000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(346,513.6470,-2333.8250,508.5020,990.0000,180.0000,-6.0000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(346,513.6470,-2333.5750,508.5020,990.0000,180.0000,-6.0000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(347,514.1470,-2333.6250,508.5020,990.0000,180.0000,-6.0000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(348,514.7040,-2333.8350,508.4870,990.0000,180.0000,-1.0000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(348,514.7040,-2333.5850,508.4870,990.0000,180.0000,-1.0000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(335,513.0810,-2333.6479,508.4230,-270.0000,0.0000,-7.0000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(335,513.1150,-2333.8301,508.4230,-270.0000,0.0000,178.0000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(335,513.0050,-2333.8269,508.4230,-270.0000,0.0000,188.0000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(352,515.3390,-2333.8091,508.4540,90.0000,0.0000,3.0000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(352,515.7190,-2333.7900,508.4540,90.0000,0.0000,3.0000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(372,516.4380,-2333.7539,508.4940,630.0000,180.0000,3.0000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(350,516.9330,-2334.0430,508.4550,90.0000,0.0000,90.0000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(350,516.7610,-2334.0349,508.4550,90.0000,0.0000,105.0000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(19995,513.6270,-2333.7410,508.4800,0.0000,90.0000,-90.0000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(19773,519.6660,-2331.7019,508.6400,0.0000,90.0000,120.0000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(19773,512.7600,-2333.7290,508.1490,0.0000,90.0000,90.0000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(19773,512.9600,-2333.7290,508.1490,0.0000,90.0000,270.0000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(19773,513.1400,-2333.7290,508.1490,0.0000,90.0000,295.0000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(19832,515.1690,-2333.7661,508.1500,0.0000,0.0000,90.0000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(19832,515.4190,-2333.7661,508.1500,0.0000,0.0000,96.3000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(19832,515.6390,-2333.7710,508.1500,0.0000,0.0000,88.8000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(19832,515.8590,-2333.7759,508.1500,0.0000,0.0000,83.8000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(19832,516.9970,-2333.8569,508.1500,0.0000,0.0000,177.7000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(19832,517.0060,-2333.6270,508.1500,0.0000,0.0000,-176.2000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(1210,512.9630,-2333.9519,508.1200,90.0000,0.0000,0.0000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(19478,512.9050,-2333.8191,508.7730,0.0000,-90.0000,270.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 1829, "kbmiscfrn2", "man_mny1", 0x00000000);
	object = CreateDynamicObject(2042,513.0350,-2333.7200,508.8630,0.0000,0.0000,-45.0000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(19478,512.8650,-2333.6489,508.7930,0.0000,-90.0000,90.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 1829, "kbmiscfrn2", "man_mny1", 0x00000000);
	object = CreateDynamicObject(355,518.9970,-2329.4241,507.9880,-13.8000,273.0000,-89.8000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(346,519.2370,-2330.4619,508.6360,93.0000,0.0000,30.0000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(19825,513.2240,-2336.5010,510.4280,0.0000,0.0000,180.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, -1, "none", "none", 0xFFFFFFFF);
	object = CreateDynamicObject(2034,525.9320,-2335.1130,508.6550,0.0000,0.0000,-55.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 10824, "subpen1_sfse", "sl_metaledge", 0x00000000);
	object = CreateDynamicObject(2033,526.1620,-2335.4399,508.6670,0.0000,0.0000,-85.1000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 10824, "subpen1_sfse", "sl_metaledge", 0x00000000);
	object = CreateDynamicObject(3017,526.2160,-2334.4451,508.6430,0.0000,0.0000,540.0000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(19942,526.7290,-2334.5339,509.3030,0.0000,0.0000,-69.5000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(19942,523.5830,-2338.6709,508.2430,270.0000,0.0000,123.0000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(18644,525.7920,-2335.5439,508.6530,90.0000,0.0000,-57.0000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(18644,526.6390,-2334.8770,509.2130,90.0000,0.0000,-12.0000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(19621,522.7110,-2333.5371,508.1160,0.0000,0.0000,-8.5000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(19621,522.8330,-2333.4709,508.1160,0.0000,0.0000,14.7000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(18635,525.8580,-2334.6641,508.6900,270.0000,0.0000,-80.0000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(19832,526.5650,-2336.3521,508.6410,0.0000,0.0000,-165.8000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(19832,524.8120,-2333.6299,508.9390,0.0000,0.0000,-81.0000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(19816,526.3020,-2336.4380,508.9000,0.0000,0.0000,0.0000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(19893,525.9380,-2336.2910,508.6310,0.0000,0.0000,-147.5000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 1, 2059, "CJ_AMMO2", "CJ_gunbook1", 0x00000000);
	object = CreateDynamicObject(18633,526.6760,-2336.0229,509.2240,0.0000,0.0000,166.8000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(18634,524.7780,-2333.4929,509.3710,0.0000,90.0000,110.0000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(1650,523.0910,-2333.6289,508.3120,0.0000,0.0000,-80.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, -1, "none", "none", 0xFFFFFFFF);
	object = CreateDynamicObject(1650,523.2970,-2333.6650,508.3120,0.0000,0.0000,-89.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, -1, "none", "none", 0xFFFFFFFF);
	object = CreateDynamicObject(1654,526.5580,-2336.0601,508.8290,0.0000,0.0000,-106.7000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(2057,526.2860,-2335.0310,507.8570,0.0000,0.0000,-32.4000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(2036,523.1210,-2333.5940,508.9620,0.0000,0.0000,5.0000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(2035,523.1590,-2333.6489,508.9920,-7.2000,-3.7000,165.4000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 3267, "milbase", "a51_metal1", 0x00000000);
	object = CreateDynamicObject(2044,523.8480,-2333.6550,508.9600,0.0000,0.0000,68.9000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 9818, "ship_brijsfw", "CJ_PLASTIC", 0x00000000);
	object = CreateDynamicObject(2035,523.5510,-2333.6160,509.3760,0.0000,0.0000,-7.6000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 9818, "ship_brijsfw", "CJ_PLASTIC", 0x00000000);
	object = CreateDynamicObject(19998,526.6020,-2334.5339,508.7260,0.0000,0.0000,-30.1000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(19627,525.7850,-2335.3940,508.6430,0.0000,0.0000,-14.1000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(19627,526.6720,-2335.4060,509.2070,0.0000,0.0000,155.8000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(19627,526.6750,-2335.5271,509.2070,0.0000,0.0000,-173.7000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(2711,526.0330,-2335.2151,508.6410,90.0000,36.5000,0.0000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(1665,526.3900,-2334.5381,508.6520,0.0000,0.0000,0.0000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(19995,525.8610,-2334.5620,508.6460,0.0000,-90.0000,22.0000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(19995,526.1040,-2336.0300,508.6460,0.0000,-90.0000,176.7000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(1840,526.3730,-2333.7839,508.6450,0.0000,0.0000,30.6000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(1840,520.3250,-2339.3521,507.6880,0.0000,0.0000,-160.3000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(1839,519.9780,-2337.8020,508.3510,0.0000,0.0000,-91.7000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(1271,519.9430,-2338.6931,508.0320,0.0000,0.0000,0.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 456, "yankee", "yankee92crate", 0xFFFFFFFF);
	object = CreateDynamicObject(1271,519.9460,-2337.8831,508.0320,0.0000,0.0000,-4.2000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 498, "boxville", "boxville92crate128", 0xFFFFFFFF);
	object = CreateDynamicObject(1271,519.9060,-2338.4629,508.7120,0.0000,0.0000,0.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 456, "yankee", "yankee92crate", 0xFFFFFFFF);
	object = CreateDynamicObject(924,523.2500,-2333.6531,510.4610,0.0000,0.0000,179.1000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(19823,523.2770,-2338.4851,508.2150,0.0000,0.0000,-20.3000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(1509,523.4640,-2337.9790,508.4050,0.0000,0.0000,-20.3000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(1509,523.1260,-2337.8550,508.2750,90.0000,-48.4000,-20.3000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(1665,523.2300,-2338.2839,508.2540,0.0000,0.0000,41.1000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(348,522.6540,-2339.0879,508.2240,90.0000,0.0000,40.5000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(2695,523.5820,-2339.6350,509.6620,0.0000,3.1000,180.0000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(2588,524.4460,-2339.5649,509.9220,0.0000,-1.3000,180.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 14737, "whorewallstuff", "AH_paintbond", 0x00000000);
	object = CreateDynamicObject(19475,524.3440,-2339.6431,509.0730,0.0000,1.8000,450.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, 14737, "whorewallstuff", "ah_painting2", 0x00000000);
	object = CreateDynamicObject(351,519.5780,-2338.2419,509.0190,97.1000,70.1000,-70.0000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(1517,507.3360,-2317.7090,512.3660,90.0000,-31.7000,0.0000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(2342,514.5450,-2333.8411,508.8770,0.0000,0.0000,168.1000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(2663,525.0790,-2339.3469,508.4090,0.0000,3.1000,1.7000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(2768,523.7130,-2338.8679,508.2680,0.0000,0.0000,77.6000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(2769,522.5770,-2338.1670,508.2480,0.0000,0.0000,-90.5000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(19835,519.4140,-2332.5630,508.7120,0.0000,0.0000,-36.3000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterial(object, 0, -1, "none", "none", 0xFFFFFFFF);
	object = CreateDynamicObject(19421,519.6290,-2332.3931,508.6460,-8.5000,0.0000,-78.3000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(19421,519.7900,-2332.5181,508.6460,-8.5000,0.0000,-127.3000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(19421,519.2550,-2329.1790,508.6700,-8.5000,0.0000,-87.0000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(935,516.0710,-2327.5049,508.2620,0.0000,0.0000,-16.3000, -1, -1, -1,200.0,200.0);
	object = CreateDynamicObject(19477,509.3020,-2318.5820,512.2290,0.0000,0.0000,0.0000, -1, -1, -1,200.0,200.0);
	SetDynamicObjectMaterialText(object, 0, "PUTUSUHARTAWAN", 80, "Arial", 24, 0, 0xFF66FF00, 0x00000000, 0);



	//object = CreateObject(19477,509.3020,-2318.5820,512.2290,0.0000,0.0000,0.0000, -1, -1, -1,200.0,200.0);
	//SetObjectMaterial(object, 0, 8544, "vgsewrehse", "courthsewin_128", 0xFFFFFFFF);


	//object = CreatDynamicObject(19477,509.3020,-2318.5820,512.2290,0.0000,0.0000,0.0000, -1, -1, -1,200.0,200.0);
	//SetDynamicObjectMaterial(object, 0, 8544, "vgsewrehse", "airportmetalwall256", 0xFFFFFFFF);
	//SetObjectMaterialText(object, 0, "PUTUSUHARTAWAN", 80, "Arial", 24, 0, 0xFF66FF00, 0x00000000, 0);

	//Created with MovieServer Reloaded Mapping System!
	//Forum URL: https://ReloadedServer.com/



	// disini mapping rumah sudah selesai.








	//ini adalah tambahan rumah jordan

	PintuMasukRumahPutuPick = CreatePickup(1314, 1, 1291.2195,-1160.0063,23.9610, -1);
	PintuKeluarRumahPutuPick = CreatePickup(1272, 1, 243.6394,-1850.7050,3333.9329, -1);

	new housedjord;


	housedjord = CreateDynamicObjectEx(19378,247.573,-1848.020,3332.277,0.000,90.000,0.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 18031, "cj_exp", "mp_furn_floor", 0x00000000);
	housedjord = CreateDynamicObjectEx(19450,242.268,-1848.020,3334.100,0.000,0.000,0.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	housedjord = CreateDynamicObjectEx(19450,245.822,-1852.807,3334.100,0.000,0.000,90.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	housedjord = CreateDynamicObjectEx(19450,239.831,-1850.032,3331.182,0.000,0.000,90.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	housedjord = CreateDynamicObjectEx(19378,239.384,-1854.778,3332.847,0.000,90.000,0.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 18031, "cj_exp", "mp_furn_floor", 0x00000000);
	housedjord = CreateDynamicObjectEx(19450,244.561,-1854.765,3331.182,0.000,0.000,0.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	housedjord = CreateDynamicObjectEx(1506,242.554,-1851.335,3332.903,0.000,0.000,-45.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	housedjord = CreateDynamicObjectEx(19087,244.619,-1849.984,3333.808,0.000,0.000,0.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0xFF808080);
	housedjord = CreateDynamicObjectEx(19089,244.619,-1849.984,3333.795,0.000,90.000,90.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0xFF808080);
	housedjord = CreateDynamicObjectEx(19089,244.619,-1849.984,3333.355,0.000,90.000,90.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0xFF808080);
	housedjord = CreateDynamicObjectEx(1744,243.878,-1849.986,3332.201,0.000,0.000,180.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0xFF808080);
	housedjord = CreateDynamicObjectEx(1744,243.876,-1850.141,3332.327,0.000,0.000,180.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0xFF808080);
	housedjord = CreateDynamicObjectEx(1744,243.864,-1850.227,3332.455,0.000,0.000,180.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0xFF808080);
	housedjord = CreateDynamicObjectEx(19450,238.399,-1846.203,3334.100,0.000,0.000,90.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	housedjord = CreateDynamicObjectEx(19450,252.731,-1846.220,3334.100,0.000,0.000,90.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	housedjord = CreateDynamicObjectEx(19450,247.701,-1846.209,3336.230,0.000,180.000,90.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	housedjord = CreateDynamicObjectEx(19089,249.784,-1846.267,3332.365,0.000,90.000,0.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0xFF808080);
	housedjord = CreateDynamicObjectEx(19089,247.899,-1846.278,3332.300,0.000,180.000,0.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0xFF808080);
	housedjord = CreateDynamicObjectEx(19089,243.225,-1846.267,3332.300,0.000,180.000,0.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0xFF808080);
	housedjord = CreateDynamicObjectEx(19089,249.784,-1846.267,3334.469,0.000,90.000,0.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0xFF808080);
	housedjord = CreateDynamicObjectEx(19378,258.035,-1848.021,3332.277,0.000,90.000,0.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 18031, "cj_exp", "mp_furn_floor", 0x00000000);
	housedjord = CreateDynamicObjectEx(19451,250.592,-1857.532,3334.100,0.000,0.000,0.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 9524, "blokmodb", "lombard_build1_1", 0x00000000);
	housedjord = CreateDynamicObjectEx(18762,250.120,-1852.954,3331.890,0.000,90.000,90.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
	housedjord = CreateDynamicObjectEx(18762,250.102,-1849.967,3333.759,0.000,180.000,90.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
	housedjord = CreateDynamicObjectEx(18762,250.138,-1853.204,3334.644,0.000,180.000,90.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
	housedjord = CreateDynamicObjectEx(18762,250.121,-1852.000,3335.161,0.000,90.000,90.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
	housedjord = CreateDynamicObjectEx(19834,250.160,-1852.522,3333.546,0.000,90.000,-90.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0xFF808080);
	housedjord = CreateDynamicObjectEx(19834,250.155,-1852.181,3333.546,0.000,90.000,-90.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0xFF808080);
	housedjord = CreateDynamicObjectEx(19834,250.169,-1851.841,3333.546,0.000,90.000,-90.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0xFF808080);
	housedjord = CreateDynamicObjectEx(19834,250.164,-1851.501,3333.546,0.000,90.000,-90.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0xFF808080);
	housedjord = CreateDynamicObjectEx(19834,250.158,-1851.141,3333.546,0.000,90.000,-90.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0xFF808080);
	housedjord = CreateDynamicObjectEx(19834,250.152,-1850.761,3333.546,0.000,90.000,-90.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0xFF808080);
	housedjord = CreateDynamicObjectEx(19834,250.159,-1851.521,3334.367,0.000,0.000,-90.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0xFF808080);
	housedjord = CreateDynamicObjectEx(19834,250.159,-1851.521,3333.986,0.000,0.000,-90.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0xFF808080);
	housedjord = CreateDynamicObjectEx(19834,250.159,-1851.521,3333.626,0.000,0.000,-90.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0xFF808080);
	housedjord = CreateDynamicObjectEx(19834,250.159,-1851.521,3333.286,0.000,0.000,-90.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0xFF808080);
	housedjord = CreateDynamicObjectEx(19834,250.159,-1851.521,3332.906,0.000,0.000,-90.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0xFF808080);
	housedjord = CreateDynamicObjectEx(19834,250.159,-1851.521,3332.565,0.000,0.000,-90.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0xFF808080);
	housedjord = CreateDynamicObjectEx(19378,255.908,-1857.658,3332.277,0.000,90.000,0.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 18031, "cj_exp", "mp_furn_floor", 0x00000000);
	housedjord = CreateDynamicObjectEx(19451,255.274,-1854.889,3334.100,0.000,0.000,90.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 9524, "blokmodb", "lombard_build1_1", 0x00000000);
	housedjord = CreateDynamicObjectEx(19451,256.606,-1854.540,3334.100,0.000,0.000,0.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 9524, "blokmodb", "lombard_build1_1", 0x00000000);
	housedjord = CreateDynamicObjectEx(18762,253.064,-1849.967,3335.689,0.000,270.000,0.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
	housedjord = CreateDynamicObjectEx(18762,254.314,-1849.955,3335.686,0.000,270.000,0.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
	housedjord = CreateDynamicObjectEx(18762,256.654,-1849.932,3333.698,0.000,180.000,90.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
	housedjord = CreateDynamicObjectEx(18762,250.121,-1852.000,3336.157,0.000,90.000,90.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
	housedjord = CreateDynamicObjectEx(1744,259.167,-1846.677,3332.184,0.000,0.000,-90.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0xFF808080);
	housedjord = CreateDynamicObjectEx(1744,259.362,-1846.719,3332.325,0.000,0.000,-90.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0xFF808080);
	housedjord = CreateDynamicObjectEx(1744,259.542,-1846.762,3332.473,0.000,0.000,-90.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0xFF808080);
	housedjord = CreateDynamicObjectEx(1744,259.782,-1846.759,3332.631,0.000,0.000,-90.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0xFF808080);
	housedjord = CreateDynamicObjectEx(1744,259.900,-1846.742,3332.829,0.000,0.000,-90.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0xFF808080);
	housedjord = CreateDynamicObjectEx(1744,260.080,-1846.742,3333.000,0.000,0.000,-90.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0xFF808080);
	housedjord = CreateDynamicObjectEx(1744,260.240,-1846.724,3333.161,0.000,0.000,-90.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0xFF808080);
	housedjord = CreateDynamicObjectEx(1744,260.479,-1846.696,3333.295,0.000,0.000,-90.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0xFF808080);
	housedjord = CreateDynamicObjectEx(1744,260.719,-1846.695,3333.416,0.000,0.000,-90.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0xFF808080);
	housedjord = CreateDynamicObjectEx(19358,260.194,-1848.149,3332.014,0.000,0.000,90.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	housedjord = CreateDynamicObjectEx(19358,259.033,-1846.212,3334.095,0.000,0.000,90.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	housedjord = CreateDynamicObjectEx(19378,265.669,-1843.339,3333.679,0.000,90.000,0.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 18031, "cj_exp", "mp_furn_floor", 0x00000000);
	housedjord = CreateDynamicObjectEx(19358,261.630,-1848.152,3332.014,0.000,0.000,90.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	housedjord = CreateDynamicObjectEx(19358,262.206,-1846.223,3334.095,0.000,0.000,90.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	housedjord = CreateDynamicObjectEx(19358,262.212,-1847.844,3334.095,0.000,0.000,0.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	housedjord = CreateDynamicObjectEx(19358,262.206,-1850.981,3334.095,0.000,0.000,0.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	housedjord = CreateDynamicObjectEx(1744,261.850,-1848.556,3333.593,0.000,0.000,-180.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0xFF808080);
	housedjord = CreateDynamicObjectEx(1744,261.843,-1848.776,3333.794,0.000,0.000,-180.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0xFF808080);
	housedjord = CreateDynamicObjectEx(1744,261.845,-1848.936,3333.974,0.000,0.000,-180.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0xFF808080);
	housedjord = CreateDynamicObjectEx(1744,261.824,-1849.156,3334.174,0.000,0.000,-180.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0xFF808080);
	housedjord = CreateDynamicObjectEx(1744,261.794,-1849.415,3334.355,0.000,0.000,-180.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0xFF808080);
	housedjord = CreateDynamicObjectEx(1744,261.748,-1849.634,3334.496,0.000,0.000,-180.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0xFF808080);
	housedjord = CreateDynamicObjectEx(1744,261.735,-1849.861,3334.636,0.000,0.000,-180.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0xFF808080);
	housedjord = CreateDynamicObjectEx(1744,261.739,-1850.077,3334.823,0.000,0.000,-180.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0xFF808080);
	housedjord = CreateDynamicObjectEx(1744,261.752,-1850.265,3334.954,0.000,0.000,-180.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0xFF808080);
	housedjord = CreateDynamicObjectEx(19358,260.335,-1849.688,3332.366,0.000,0.000,180.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	housedjord = CreateDynamicObjectEx(19358,260.340,-1850.403,3333.601,35.000,0.000,180.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	housedjord = CreateDynamicObjectEx(1744,261.753,-1850.565,3335.114,0.000,0.000,-180.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0xFF808080);
	housedjord = CreateDynamicObjectEx(1744,261.740,-1850.826,3335.347,0.000,0.000,-180.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0xFF808080);
	//SetDynamicObjectMaterial(housedjord, 1, 8675, "wddngchpl02", "shingles6", 0xFFFFFFFF);
	housedjord = CreateDynamicObjectEx(1744,261.758,-1851.130,3335.512,0.000,0.000,-180.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0xFF808080);
	housedjord = CreateDynamicObjectEx(19358,260.325,-1852.249,3334.118,0.000,0.000,180.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	housedjord = CreateDynamicObjectEx(19358,258.638,-1850.280,3334.062,0.000,0.000,90.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	housedjord = CreateDynamicObjectEx(19378,257.038,-1855.792,3335.781,0.000,90.000,0.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 14387, "dr_gsnew", "la_flair1", 0x00000000);
	housedjord = CreateDynamicObjectEx(19358,261.968,-1851.033,3334.095,0.000,0.000,90.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	housedjord = CreateDynamicObjectEx(19450,262.227,-1851.081,3337.560,0.000,0.000,0.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	housedjord = CreateDynamicObjectEx(19450,257.416,-1846.209,3337.560,0.000,0.000,90.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	housedjord = CreateDynamicObjectEx(19358,256.319,-1847.918,3337.386,0.000,0.000,0.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	housedjord = CreateDynamicObjectEx(19358,258.638,-1850.280,3337.562,0.000,0.000,90.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	housedjord = CreateDynamicObjectEx(19358,257.563,-1850.279,3337.562,0.000,0.000,90.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	housedjord = CreateDynamicObjectEx(19358,256.321,-1850.155,3337.391,0.000,0.000,0.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	housedjord = CreateDynamicObjectEx(18762,256.654,-1849.932,3338.585,0.000,180.000,90.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
	housedjord = CreateDynamicObjectEx(19431,260.168,-1851.001,3337.548,0.000,0.000,0.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	housedjord = CreateDynamicObjectEx(19449,255.437,-1851.734,3337.560,0.000,0.000,90.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 4828, "airport3_las", "brwall_128", 0x00000000);
	housedjord = CreateDynamicObjectEx(18762,256.666,-1847.297,3335.704,0.000,270.000,90.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
	housedjord = CreateDynamicObjectEx(19325,245.939,-1846.247,3333.203,0.000,0.000,90.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, -1, "none", "none", 0xFF0AFC95);
	housedjord = CreateDynamicObjectEx(19089,244.974,-1846.270,3332.300,0.000,180.000,0.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0xFF808080);
	housedjord = CreateDynamicObjectEx(19089,246.224,-1846.269,3332.300,0.000,180.000,0.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0xFF808080);
	housedjord = CreateDynamicObjectEx(19449,262.182,-1856.623,3337.560,0.000,0.000,0.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 4828, "airport3_las", "brwall_128", 0x00000000);
	housedjord = CreateDynamicObjectEx(19388,261.268,-1851.713,3337.574,0.000,0.000,90.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	housedjord = CreateDynamicObjectEx(19387,261.265,-1851.753,3337.574,0.000,0.000,90.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 4828, "airport3_las", "brwall_128", 0x00000000);
	housedjord = CreateDynamicObjectEx(1502,260.459,-1851.716,3335.869,0.000,0.000,0.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 10765, "airportgnd_sfse", "white", 0xFF000000);
	SetDynamicObjectMaterial(housedjord, 1, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0xFF808080);
	housedjord = CreateDynamicObjectEx(19449,252.928,-1856.612,3337.560,0.000,0.000,0.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 4828, "airport3_las", "brwall_128", 0x00000000);
	housedjord = CreateDynamicObjectEx(19449,260.049,-1858.091,3337.560,0.000,0.000,90.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 4828, "airport3_las", "brwall_128", 0x00000000);
	housedjord = CreateDynamicObjectEx(19387,254.399,-1858.104,3337.574,0.000,0.000,90.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 4828, "airport3_las", "brwall_128", 0x00000000);
	housedjord = CreateDynamicObjectEx(1502,253.630,-1858.087,3335.869,0.000,0.000,0.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 10765, "airportgnd_sfse", "white", 0xFF000000);
	SetDynamicObjectMaterial(housedjord, 1, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0xFF808080);
	housedjord = CreateDynamicObjectEx(19834,247.062,-1852.716,3332.427,0.000,0.000,0.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0xFF808080);
	housedjord = CreateDynamicObjectEx(19834,247.042,-1852.709,3333.111,0.000,0.000,0.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0xFF808080);
	housedjord = CreateDynamicObjectEx(19834,245.941,-1852.717,3333.301,0.000,90.000,0.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0xFF808080);
	housedjord = CreateDynamicObjectEx(19834,247.082,-1852.711,3334.396,0.000,0.000,0.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0xFF808080);
	housedjord = CreateDynamicObjectEx(2259,247.771,-1852.250,3333.761,0.000,90.000,-180.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 10765, "airportgnd_sfse", "white", 0xFF000000);
	SetDynamicObjectMaterial(housedjord, 1, 10765, "airportgnd_sfse", "white", 0xFF000000);
	housedjord = CreateDynamicObjectEx(2259,247.261,-1852.245,3333.761,0.000,90.000,-180.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 10765, "airportgnd_sfse", "white", 0xFF000000);
	SetDynamicObjectMaterial(housedjord, 1, 10765, "airportgnd_sfse", "white", 0xFF000000);
	housedjord = CreateDynamicObjectEx(19834,248.187,-1852.711,3333.301,0.000,90.000,0.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0xFF808080);
	housedjord = CreateDynamicObjectEx(19834,247.044,-1852.712,3331.899,0.000,90.000,0.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0xFF808080);
	housedjord = CreateDynamicObjectEx(11682,247.468,-1850.094,3332.364,0.000,0.000,0.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 5986, "chateau_lawn", "chatwall01_law", 0xFFFFFFFF);
	SetDynamicObjectMaterial(housedjord, 1, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0xFF808080);
	housedjord = CreateDynamicObjectEx(11684,246.676,-1850.106,3332.364,0.000,0.000,0.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 5986, "chateau_lawn", "chatwall01_law", 0xFFFFFFFF);
	SetDynamicObjectMaterial(housedjord, 1, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0xFF808080);
	housedjord = CreateDynamicObjectEx(19376,255.332,-1855.056,3332.283,0.000,90.000,0.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 14577, "casinovault01", "vaultFloor", 0x00000000);
	housedjord = CreateDynamicObjectEx(19451,255.335,-1850.287,3330.628,0.000,0.000,90.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	housedjord = CreateDynamicObjectEx(18762,247.067,-1851.706,3330.094,0.000,0.000,0.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0xFF808080);
	housedjord = CreateDynamicObjectEx(11682,248.547,-1851.992,3332.364,0.000,0.000,-90.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 5986, "chateau_lawn", "chatwall01_law", 0xFFFFFFFF);
	SetDynamicObjectMaterial(housedjord, 1, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0xFF808080);
	housedjord = CreateDynamicObjectEx(11684,248.534,-1851.156,3332.364,0.000,0.000,-90.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 5986, "chateau_lawn", "chatwall01_law", 0xFFFFFFFF);
	SetDynamicObjectMaterial(housedjord, 1, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0xFF808080);
	housedjord = CreateDynamicObjectEx(1906,254.767,-1852.725,3333.203,0.000,0.000,0.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 10765, "airportgnd_sfse", "white", 0xFFFF0000);
	housedjord = CreateDynamicObjectEx(1906,254.767,-1852.625,3333.203,0.000,0.000,0.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 10765, "airportgnd_sfse", "white", 0xFFFF0000);
	housedjord = CreateDynamicObjectEx(1906,254.767,-1852.525,3333.203,0.000,0.000,0.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 10765, "airportgnd_sfse", "white", 0xFFFF0000);
	housedjord = CreateDynamicObjectEx(18762,254.724,-1852.414,3330.709,180.000,0.000,0.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0xFF808080);
	housedjord = CreateDynamicObjectEx(2132,252.192,-1854.380,3332.349,0.000,0.000,-180.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 1, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0xFF808080);
	housedjord = CreateDynamicObjectEx(2133,253.172,-1854.385,3332.349,0.000,0.000,-180.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 1, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0xFF808080);
	housedjord = CreateDynamicObjectEx(2131,255.163,-1854.370,3332.349,0.000,0.000,-180.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 1, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0xFF808080);
	housedjord = CreateDynamicObjectEx(19920,247.242,-1851.503,3332.603,0.000,0.000,142.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, -1, "none", "none", 0xFFFFFFFF);
	housedjord = CreateDynamicObjectEx(19916,256.056,-1854.521,3332.318,0.000,0.000,-180.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, -1, "none", "none", 0xFFFFFFFF);
	housedjord = CreateDynamicObjectEx(18762,253.739,-1852.415,3330.709,180.000,0.000,0.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0xFF808080);
	housedjord = CreateDynamicObjectEx(19327,247.017,-1852.674,3333.321,0.000,0.000,-180.000,300.000,300.000);
	SetDynamicObjectMaterialText(housedjord, 0, "TV PUTU", 140, "Ariel", 20, 1, 0xFFFFFFFF, 0x00000000, 1);
	housedjord = CreateDynamicObjectEx(1906,246.327,-1852.701,3333.306,-90.000,0.000,0.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 10765, "airportgnd_sfse", "white", 0xFFF00000);
	housedjord = CreateDynamicObjectEx(2255,254.637,-1852.465,3333.689,-90.000,0.000,90.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 10765, "airportgnd_sfse", "white", 0xFF000000);
	SetDynamicObjectMaterial(housedjord, 1, -1, "none", "none", 0xFF000000);
	housedjord = CreateDynamicObjectEx(1906,254.767,-1852.825,3333.203,0.000,0.000,0.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 10765, "airportgnd_sfse", "white", 0xFFFF0000);
	housedjord = CreateDynamicObjectEx(2613,254.806,-1851.735,3332.824,0.000,0.000,0.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 10765, "airportgnd_sfse", "white", 0xFFFF0000);
	housedjord = CreateDynamicObjectEx(2613,254.368,-1851.743,3332.824,0.000,0.000,0.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 10765, "airportgnd_sfse", "white", 0xFFFF0000);
	housedjord = CreateDynamicObjectEx(2613,254.358,-1851.418,3332.824,0.000,0.000,0.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 10765, "airportgnd_sfse", "white", 0xFFFF0000);
	housedjord = CreateDynamicObjectEx(2613,254.810,-1851.424,3332.824,0.000,0.000,0.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 10765, "airportgnd_sfse", "white", 0xFFFF0000);
	housedjord = CreateDynamicObjectEx(19386,254.421,-1858.212,3337.574,0.000,0.000,90.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 14387, "dr_gsnew", "mp_gs_pooltiles", 0x00000000);
	housedjord = CreateDynamicObjectEx(19448,260.708,-1858.194,3337.560,0.000,0.000,90.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 14387, "dr_gsnew", "mp_gs_pooltiles", 0x00000000);
	housedjord = CreateDynamicObjectEx(19448,252.984,-1862.986,3337.560,0.000,0.000,0.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 14387, "dr_gsnew", "mp_gs_pooltiles", 0x00000000);
	housedjord = CreateDynamicObjectEx(19448,259.731,-1862.970,3337.560,0.000,0.000,0.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 14387, "dr_gsnew", "mp_gs_pooltiles", 0x00000000);
	housedjord = CreateDynamicObjectEx(19448,256.953,-1865.135,3337.560,0.000,0.000,90.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 14387, "dr_gsnew", "mp_gs_pooltiles", 0x00000000);
	housedjord = CreateDynamicObjectEx(19375,257.203,-1862.911,3335.783,0.000,90.000,0.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 14387, "dr_gsnew", "mp_gs_pooltiles", 0x00000000);
	housedjord = CreateDynamicObjectEx(19450,243.308,-1852.147,3334.100,0.000,0.000,45.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	housedjord = CreateDynamicObjectEx(2006,242.720,-1851.356,3333.973,0.000,0.000,-45.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 10765, "airportgnd_sfse", "white", 0xFF000000);
	housedjord = CreateDynamicObjectEx(14446,255.993,-1853.600,3336.227,0.000,0.000,0.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0xFF808080);
	SetDynamicObjectMaterial(housedjord, 1, 10765, "airportgnd_sfse", "white", 0x00000000);
	SetDynamicObjectMaterial(housedjord, 2, 14387, "dr_gsnew", "mp_gs_wall", 0x00000000);
	housedjord = CreateDynamicObjectEx(2082,253.134,-1852.897,3335.869,0.000,0.000,0.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0xFF808080);
	housedjord = CreateDynamicObjectEx(2082,257.839,-1852.839,3335.869,0.000,0.000,0.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0xFF808080);
	housedjord = CreateDynamicObjectEx(19403,260.462,-1856.466,3336.939,0.000,0.000,0.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 4828, "airport3_las", "brwall_128", 0x00000000);
	housedjord = CreateDynamicObjectEx(19449,260.472,-1859.678,3339.812,0.000,0.000,0.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 4828, "airport3_las", "brwall_128", 0x00000000);
	housedjord = CreateDynamicObjectEx(19449,265.203,-1854.944,3337.560,0.000,0.000,90.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 4828, "airport3_las", "brwall_128", 0x00000000);
	housedjord = CreateDynamicObjectEx(1742,258.628,-1850.302,3332.364,0.000,0.000,-180.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 2, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0xFF808080);
	housedjord = CreateDynamicObjectEx(19433,261.220,-1856.803,3336.308,0.000,90.000,90.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 10765, "airportgnd_sfse", "white", 0xFF000000);
	housedjord = CreateDynamicObjectEx(19433,261.223,-1855.499,3338.111,0.000,180.000,90.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 10765, "airportgnd_sfse", "white", 0xFF000000);
	housedjord = CreateDynamicObjectEx(19433,261.210,-1857.424,3338.111,0.000,180.000,90.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 10765, "airportgnd_sfse", "white", 0xFF000000);
	housedjord = CreateDynamicObjectEx(19433,261.818,-1856.349,3338.111,0.000,180.000,0.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 10765, "airportgnd_sfse", "white", 0xFF000000);
	housedjord = CreateDynamicObjectEx(19433,261.817,-1856.610,3338.111,0.000,180.000,0.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 10765, "airportgnd_sfse", "white", 0xFF000000);
	housedjord = CreateDynamicObjectEx(19381,244.609,-1846.128,3332.364,0.000,0.000,90.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	housedjord = CreateDynamicObjectEx(18980,268.430,-1861.463,3336.020,90.000,0.000,-90.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 14387, "dr_gsnew", "mp_gs_pooltiles", 0xFFFFFFFF);
	housedjord = CreateDynamicObjectEx(18980,256.426,-1873.610,3336.040,90.000,0.000,-180.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 14387, "dr_gsnew", "mp_gs_pooltiles", 0xFFFFFFFF);
	housedjord = CreateDynamicObjectEx(19360,258.228,-1863.487,3335.791,0.000,90.000,0.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 14387, "dr_gsnew", "mp_gs_pooltiles", 0x00000000);
	housedjord = CreateDynamicObjectEx(18980,260.135,-1874.164,3336.020,90.000,0.000,-180.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 14387, "dr_gsnew", "mp_gs_pooltiles", 0xFFFFFFFF);
	housedjord = CreateDynamicObjectEx(18980,268.803,-1865.527,3336.020,90.000,0.000,-90.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 14387, "dr_gsnew", "mp_gs_pooltiles", 0xFFFFFFFF);
	housedjord = CreateDynamicObjectEx(1742,254.583,-1865.117,3334.234,0.000,0.000,-180.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 2, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0xFF808080);
	housedjord = CreateDynamicObjectEx(1744,254.828,-1865.194,3337.498,0.000,0.000,-180.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0xFF808080);
	housedjord = CreateDynamicObjectEx(1744,256.207,-1861.465,3335.972,0.000,0.000,-90.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0xFF808080);
	housedjord = CreateDynamicObjectEx(1744,256.107,-1861.470,3335.781,0.000,0.000,-90.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0xFF808080);
	housedjord = CreateDynamicObjectEx(1744,257.057,-1861.151,3335.781,0.000,0.000,-180.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0xFF808080);
	housedjord = CreateDynamicObjectEx(1744,257.139,-1861.261,3335.972,0.000,0.000,-180.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0xFF808080);
	housedjord = CreateDynamicObjectEx(14842,258.768,-1864.985,3337.463,0.000,0.000,-180.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, -1, "none", "none", 0xFFFFFFFF);
	housedjord = CreateDynamicObjectEx(14842,259.018,-1863.466,3337.463,0.000,0.000,-180.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, -1, "none", "none", 0xFFFFFFFF);
	housedjord = CreateDynamicObjectEx(2134,258.189,-1858.737,3335.870,0.000,0.000,0.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0xFF808080);
	SetDynamicObjectMaterial(housedjord, 1, 10765, "airportgnd_sfse", "white", 0xFF808080);
	SetDynamicObjectMaterial(housedjord, 2, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0xFF808080);
	SetDynamicObjectMaterial(housedjord, 4, -1, "none", "none", 0xFF808080);
	housedjord = CreateDynamicObjectEx(2134,259.170,-1858.734,3335.870,0.000,0.000,0.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0xFF808080);
	SetDynamicObjectMaterial(housedjord, 1, 10765, "airportgnd_sfse", "white", 0xFF808080);
	SetDynamicObjectMaterial(housedjord, 2, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0xFF808080);
	SetDynamicObjectMaterial(housedjord, 4, -1, "none", "none", 0xFF808080);
	housedjord = CreateDynamicObjectEx(2134,257.208,-1858.740,3335.870,0.000,0.000,0.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0xFF808080);
	SetDynamicObjectMaterial(housedjord, 1, 10765, "airportgnd_sfse", "white", 0xFF808080);
	SetDynamicObjectMaterial(housedjord, 2, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0xFF808080);
	SetDynamicObjectMaterial(housedjord, 4, -1, "none", "none", 0xFF808080);
	housedjord = CreateDynamicObjectEx(2515,258.163,-1858.513,3337.043,0.000,0.000,0.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, -1, "none", "none", 0xFFFFFFFF);
	housedjord = CreateDynamicObjectEx(2255,258.153,-1858.769,3337.549,0.000,0.000,0.000,300.000,300.000);
	SetDynamicObjectMaterial(housedjord, 0, 14581, "ab_mafiasuitea", "barbersmir1", 0x00000000);
	housedjord = CreateDynamicObjectEx(19327,256.037,-1854.004,3334.221,0.000,0.000,-180.000,300.000,300.000);
	SetDynamicObjectMaterialText(housedjord, 0, "YOUTUBE", 140, "Ariel", 35, 1, 0xFFFF0000, 0x00000000, 1);
	housedjord = CreateDynamicObjectEx(19327,256.037,-1854.014,3334.161,0.000,0.000,-180.000,300.000,300.000);
	SetDynamicObjectMaterialText(housedjord, 0, "Future Tehnology", 140, "Ariel", 15, 1, 0xFF000000, 0x00000000, 1);
	housedjord = CreateDynamicObjectEx(19377,240.442,-1849.355,3335.705,0.000,90.000,0.000,300.000,300.000);
	housedjord = CreateDynamicObjectEx(19377,250.931,-1849.405,3335.705,0.000,90.000,0.000,300.000,300.000);
	housedjord = CreateDynamicObjectEx(19377,261.553,-1846.955,3339.202,0.000,90.000,0.000,300.000,300.000);
	housedjord = CreateDynamicObjectEx(19377,255.114,-1855.226,3335.579,0.000,90.000,0.000,300.000,300.000);
	housedjord = CreateDynamicObjectEx(2816,247.052,-1851.808,3332.593,0.000,0.000,-16.000,300.000,300.000);
	housedjord = CreateDynamicObjectEx(19581,254.016,-1853.082,3333.215,0.000,0.000,171.000,300.000,300.000);
	housedjord = CreateDynamicObjectEx(19582,254.065,-1852.629,3333.227,0.000,0.000,0.000,300.000,300.000);
	housedjord = CreateDynamicObjectEx(19591,250.562,-1846.330,3333.943,0.000,0.000,0.000,300.000,300.000);
	housedjord = CreateDynamicObjectEx(2267,252.472,-1846.354,3333.998,0.000,0.000,0.000,300.000,300.000);
	housedjord = CreateDynamicObjectEx(2263,255.563,-1846.809,3333.819,0.000,0.000,0.000,300.000,300.000);
	housedjord = CreateDynamicObjectEx(2264,261.605,-1847.535,3334.929,0.000,0.000,-90.000,300.000,300.000);
	housedjord = CreateDynamicObjectEx(2254,242.399,-1848.129,3334.271,0.000,0.000,90.000,300.000,300.000);
	housedjord = CreateDynamicObjectEx(2251,242.705,-1846.599,3333.202,0.000,0.000,90.000,300.000,300.000);
	housedjord = CreateDynamicObjectEx(2241,259.855,-1848.608,3332.802,0.000,0.000,90.000,300.000,300.000);
	housedjord = CreateDynamicObjectEx(2853,258.340,-1852.347,3336.364,0.000,0.000,0.000,300.000,300.000);
	housedjord = CreateDynamicObjectEx(2828,253.510,-1852.215,3336.367,0.000,0.000,-164.000,300.000,300.000);
	housedjord = CreateDynamicObjectEx(19632,261.068,-1856.286,3336.375,0.000,0.000,0.000,300.000,300.000);
	housedjord = CreateDynamicObjectEx(19632,261.082,-1856.608,3336.375,0.000,0.000,0.000,300.000,300.000);
	housedjord = CreateDynamicObjectEx(19632,261.095,-1856.448,3336.495,0.000,0.000,0.000,300.000,300.000);
	housedjord = CreateDynamicObjectEx(2406,257.188,-1857.926,3337.108,-6.000,0.000,-180.000,300.000,300.000);
	housedjord = CreateDynamicObjectEx(2405,256.495,-1857.886,3337.108,-6.000,0.000,-180.000,300.000,300.000);
	housedjord = CreateDynamicObjectEx(2286,256.009,-1851.839,3337.490,0.000,0.000,0.000,300.000,300.000);
	housedjord = CreateDynamicObjectEx(10444,263.638,-1876.892,3335.997,0.000,0.000,0.000,300.000,300.000);
	housedjord = CreateDynamicObjectEx(10444,263.638,-1876.892,3336.077,0.000,0.000,0.000,300.000,300.000);
	housedjord = CreateDynamicObjectEx(10444,263.638,-1876.892,3336.116,0.000,0.000,0.000,300.000,300.000);
	housedjord = CreateDynamicObjectEx(2384,254.638,-1864.901,3336.001,0.000,0.000,0.000,300.000,300.000);
	housedjord = CreateDynamicObjectEx(2384,254.009,-1864.902,3336.372,0.000,0.000,0.000,300.000,300.000);
	housedjord = CreateDynamicObjectEx(2870,254.472,-1864.893,3337.837,0.000,0.000,0.000,300.000,300.000);
	housedjord = CreateDynamicObjectEx(2749,256.519,-1864.418,3336.537,0.000,0.000,0.000,300.000,300.000);
	housedjord = CreateDynamicObjectEx(2751,256.376,-1864.375,3336.582,0.000,0.000,0.000,300.000,300.000);
	housedjord = CreateDynamicObjectEx(2752,256.497,-1864.195,3336.582,0.000,0.000,0.000,300.000,300.000);
	housedjord = CreateDynamicObjectEx(2741,259.139,-1858.329,3337.283,0.000,0.000,0.000,300.000,300.000);
	housedjord = CreateDynamicObjectEx(2751,257.153,-1858.631,3336.954,0.000,0.000,0.000,300.000,300.000);
	housedjord = CreateDynamicObjectEx(2752,257.323,-1858.573,3336.954,0.000,0.000,0.000,300.000,300.000);
	housedjord = CreateDynamicObjectEx(2239,253.328,-1858.657,3335.869,0.000,0.000,52.000,300.000,300.000);
	housedjord = CreateDynamicObjectEx(19377,258.156,-1856.436,3339.202,0.000,90.000,0.000,300.000,300.000);
	housedjord = CreateDynamicObjectEx(19377,258.010,-1866.109,3339.202,0.000,90.000,0.000,300.000,300.000);

	// pickup lokasi ledakan bahaya di pelabuhan
	BahayaDeathRacePick = CreatePickup(19295, 14, -1563.9391,645.6500,43.3195, -1);
	LanjutBahayaDeathRacePick = CreatePickup(19295, 14, -1093.9713,1148.9292,37.3037, -1);
	LanjutBahayaDeathRacePick2 = CreatePickup(19295, 14, -1308.1287,911.5069,45.7724, -1);
	//BahayaDeathRacePick = CreatePickup(1254, 14, -1563.9391,645.6500,43.3195, -1);

	    //ini bagian objecr doop bar

	    
	  //pickup untuk ke interior Doop Bar
	PintuMasukDoopBarPick = CreatePickup(2580, 1, 969.9212,-1564.4719,13.5988, -1);
	PintuKeluarDoopBarPick = CreatePickup(19823, 1, 962.0608,-1557.7747,21.5722, -1);
	    
	    
	    //Objects////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	tmpobjid = CreateDynamicObject(18066, 968.971923, -1562.381591, 15.553564, 0.000000, 0.000007, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 14581, "ab_mafiasuitea", "walp45S", 0x00000000);
	tmpobjid = CreateDynamicObject(18066, 970.391906, -1562.381591, 15.553564, 0.000000, 0.000007, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 14581, "ab_mafiasuitea", "walp45S", 0x00000000);
	tmpobjid = CreateDynamicObject(18066, 971.802368, -1562.381591, 15.553564, 0.000000, 0.000007, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 14581, "ab_mafiasuitea", "walp45S", 0x00000000);
	tmpobjid = CreateDynamicObject(18066, 968.971923, -1562.381591, 15.863567, 0.000000, 0.000015, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 14581, "ab_mafiasuitea", "walp45S", 0x00000000);
	tmpobjid = CreateDynamicObject(18066, 970.391906, -1562.381591, 15.863567, 0.000000, 0.000015, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 14581, "ab_mafiasuitea", "walp45S", 0x00000000);
	tmpobjid = CreateDynamicObject(18066, 971.802368, -1562.381591, 15.863567, 0.000000, 0.000015, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 14581, "ab_mafiasuitea", "walp45S", 0x00000000);
	tmpobjid = CreateDynamicObject(18066, 969.942077, -1562.391601, 15.773569, 0.000000, 0.000007, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "gz_vicdoor2", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 14652, "ab_trukstpa", "CJ_WOOD6", 0xFF009966);
	SetDynamicObjectMaterialText(tmpobjid, 0, "None", 10, "Ariel", 20, 0, 0xFFFFFFFF, 0xFFFFFFFF, 0);
	tmpobjid = CreateDynamicObject(18066, 970.612609, -1562.391601, 15.773569, 0.000000, 0.000007, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "gz_vicdoor2", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 14652, "ab_trukstpa", "CJ_WOOD6", 0xFF009966);
	SetDynamicObjectMaterialText(tmpobjid, 0, "None", 10, "Ariel", 20, 0, 0xFFFFFFFF, 0xFFFFFFFF, 0);
	tmpobjid = CreateDynamicObject(18066, 970.612609, -1562.391601, 15.653566, 0.000000, 0.000007, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "gz_vicdoor2", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 14652, "ab_trukstpa", "CJ_WOOD6", 0xFF009966);
	SetDynamicObjectMaterialText(tmpobjid, 0, "None", 10, "Ariel", 20, 0, 0xFFFFFFFF, 0xFFFFFFFF, 0);
	tmpobjid = CreateDynamicObject(18066, 969.941955, -1562.391601, 15.653566, 0.000000, 0.000007, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "gz_vicdoor2", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 14652, "ab_trukstpa", "CJ_WOOD6", 0xFF009966);
	SetDynamicObjectMaterialText(tmpobjid, 0, "None", 10, "Ariel", 20, 0, 0xFFFFFFFF, 0xFFFFFFFF, 0);
	tmpobjid = CreateDynamicObject(19329, 970.301635, -1562.425781, 15.728970, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterialText(tmpobjid, 0, "BAR PUTU", 90, "Engravers MT", 40, 0, 0xFFFFFFFF, 0x00000000, 1);
	tmpobjid = CreateDynamicObject(19378, 964.949462, -1556.012573, 20.486261, 0.000000, 270.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 14537, "pdomebar", "club_floor2_sfwTEST", 0x00000000);
	tmpobjid = CreateDynamicObject(19378, 975.449829, -1556.012573, 20.476261, 0.000000, 270.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 14537, "pdomebar", "club_floor2_sfwTEST", 0x00000000);
	tmpobjid = CreateDynamicObject(19378, 985.939819, -1556.012573, 20.486261, 0.000000, 270.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 14537, "pdomebar", "club_floor2_sfwTEST", 0x00000000);
	tmpobjid = CreateDynamicObject(19378, 985.939819, -1551.282470, 20.486261, 0.199999, 270.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 14537, "pdomebar", "club_floor2_sfwTEST", 0x00000000);
	tmpobjid = CreateDynamicObject(19378, 975.439697, -1551.282470, 20.486261, 0.199999, 270.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 14537, "pdomebar", "club_floor2_sfwTEST", 0x00000000);
	tmpobjid = CreateDynamicObject(19378, 964.950134, -1551.282470, 20.486261, 0.199999, 270.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 14537, "pdomebar", "club_floor2_sfwTEST", 0x00000000);
	tmpobjid = CreateDynamicObject(19325, 963.114074, -1560.854858, 22.332227, 0.000007, 0.000000, 89.999977, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 17588, "lae2coast_alpha", "plainglass", 0x00000000);
	tmpobjid = CreateDynamicObject(19982, 966.434997, -1560.852172, 21.692224, 0.000000, 0.000007, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18996, "mattextures", "sampblack", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 19297, "matlights", "invisible", 0x00000000);
	tmpobjid = CreateDynamicObject(19982, 966.434997, -1560.852172, 19.032230, 0.000000, 0.000007, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18996, "mattextures", "sampblack", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 19297, "matlights", "invisible", 0x00000000);
	tmpobjid = CreateDynamicObject(19325, 969.764831, -1560.854858, 22.332227, 0.000015, 0.000000, 89.999954, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 17588, "lae2coast_alpha", "plainglass", 0x00000000);
	tmpobjid = CreateDynamicObject(19982, 973.085754, -1560.852172, 21.692224, 0.000000, 0.000015, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18996, "mattextures", "sampblack", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 19297, "matlights", "invisible", 0x00000000);
	tmpobjid = CreateDynamicObject(19982, 973.085754, -1560.852172, 19.032230, 0.000000, 0.000015, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18996, "mattextures", "sampblack", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 19297, "matlights", "invisible", 0x00000000);
	tmpobjid = CreateDynamicObject(19325, 976.427246, -1560.854858, 22.332227, 0.000022, 0.000000, 89.999931, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 17588, "lae2coast_alpha", "plainglass", 0x00000000);
	tmpobjid = CreateDynamicObject(19982, 979.748168, -1560.852172, 21.692224, 0.000000, 0.000022, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18996, "mattextures", "sampblack", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 19297, "matlights", "invisible", 0x00000000);
	tmpobjid = CreateDynamicObject(19982, 979.748168, -1560.852172, 19.032230, 0.000000, 0.000022, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18996, "mattextures", "sampblack", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 19297, "matlights", "invisible", 0x00000000);
	tmpobjid = CreateDynamicObject(19325, 983.078430, -1560.854858, 22.332227, 0.000030, 0.000000, 89.999908, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 17588, "lae2coast_alpha", "plainglass", 0x00000000);
	tmpobjid = CreateDynamicObject(19982, 986.399353, -1560.852172, 21.692224, 0.000000, 0.000030, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18996, "mattextures", "sampblack", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 19297, "matlights", "invisible", 0x00000000);
	tmpobjid = CreateDynamicObject(19982, 986.399353, -1560.852172, 19.032230, 0.000000, 0.000030, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18996, "mattextures", "sampblack", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 19297, "matlights", "invisible", 0x00000000);
	tmpobjid = CreateDynamicObject(19325, 989.720581, -1560.854858, 22.332227, 0.000038, 0.000000, 89.999885, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 17588, "lae2coast_alpha", "plainglass", 0x00000000);
	tmpobjid = CreateDynamicObject(19982, 993.041503, -1560.852172, 21.692224, 0.000000, 0.000038, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18996, "mattextures", "sampblack", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 19297, "matlights", "invisible", 0x00000000);
	tmpobjid = CreateDynamicObject(19982, 993.041503, -1560.852172, 19.032230, 0.000000, 0.000038, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18996, "mattextures", "sampblack", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 19297, "matlights", "invisible", 0x00000000);
	tmpobjid = CreateDynamicObject(19325, 963.114074, -1546.471557, 22.332227, 0.000015, 0.000000, 89.999954, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 17588, "lae2coast_alpha", "plainglass", 0x00000000);
	tmpobjid = CreateDynamicObject(19982, 966.434997, -1546.468872, 21.692224, 0.000000, 0.000015, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18996, "mattextures", "sampblack", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 19297, "matlights", "invisible", 0x00000000);
	tmpobjid = CreateDynamicObject(19982, 966.434997, -1546.468872, 19.032230, 0.000000, 0.000015, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18996, "mattextures", "sampblack", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 19297, "matlights", "invisible", 0x00000000);
	tmpobjid = CreateDynamicObject(19325, 969.764831, -1546.471557, 22.332227, 0.000022, 0.000000, 89.999931, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 17588, "lae2coast_alpha", "plainglass", 0x00000000);
	tmpobjid = CreateDynamicObject(19982, 973.085754, -1546.468872, 21.692224, 0.000000, 0.000022, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18996, "mattextures", "sampblack", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 19297, "matlights", "invisible", 0x00000000);
	tmpobjid = CreateDynamicObject(19982, 973.085754, -1546.468872, 19.032230, 0.000000, 0.000022, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18996, "mattextures", "sampblack", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 19297, "matlights", "invisible", 0x00000000);
	tmpobjid = CreateDynamicObject(19325, 976.427246, -1546.471557, 22.332227, 0.000030, 0.000000, 89.999908, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 17588, "lae2coast_alpha", "plainglass", 0x00000000);
	tmpobjid = CreateDynamicObject(19982, 979.748168, -1546.468872, 21.692224, 0.000000, 0.000030, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18996, "mattextures", "sampblack", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 19297, "matlights", "invisible", 0x00000000);
	tmpobjid = CreateDynamicObject(19982, 979.748168, -1546.468872, 19.032230, 0.000000, 0.000030, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18996, "mattextures", "sampblack", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 19297, "matlights", "invisible", 0x00000000);
	tmpobjid = CreateDynamicObject(19325, 983.078430, -1546.471557, 22.332227, 0.000038, 0.000000, 89.999885, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 17588, "lae2coast_alpha", "plainglass", 0x00000000);
	tmpobjid = CreateDynamicObject(19982, 986.399353, -1546.468872, 21.692224, 0.000000, 0.000038, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18996, "mattextures", "sampblack", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 19297, "matlights", "invisible", 0x00000000);
	tmpobjid = CreateDynamicObject(19982, 986.399353, -1546.468872, 19.032230, 0.000000, 0.000038, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18996, "mattextures", "sampblack", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 19297, "matlights", "invisible", 0x00000000);
	tmpobjid = CreateDynamicObject(19325, 989.720581, -1546.471557, 22.332227, 0.000045, 0.000000, 89.999862, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 17588, "lae2coast_alpha", "plainglass", 0x00000000);
	tmpobjid = CreateDynamicObject(19982, 993.041503, -1546.468872, 21.692224, 0.000000, 0.000045, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18996, "mattextures", "sampblack", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 19297, "matlights", "invisible", 0x00000000);
	tmpobjid = CreateDynamicObject(19982, 993.041503, -1546.468872, 19.032230, 0.000000, 0.000045, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18996, "mattextures", "sampblack", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 19297, "matlights", "invisible", 0x00000000);
	tmpobjid = CreateDynamicObject(2435, 969.710754, -1556.716796, 20.572198, 0.000000, 0.000007, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 14385, "trailerkb", "tr_wood1", 0xFF663300);
	SetDynamicObjectMaterial(tmpobjid, 2, 11631, "mp_ranchcut", "mpCJ_WOOD_DARK", 0x00000000);
	tmpobjid = CreateDynamicObject(2435, 968.790466, -1556.716796, 20.572198, 0.000000, 0.000007, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 14385, "trailerkb", "tr_wood1", 0xFF663300);
	SetDynamicObjectMaterial(tmpobjid, 2, 11631, "mp_ranchcut", "mpCJ_WOOD_DARK", 0x00000000);
	tmpobjid = CreateDynamicObject(2435, 967.880310, -1556.716796, 20.572198, 0.000000, 0.000007, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 14385, "trailerkb", "tr_wood1", 0xFF663300);
	SetDynamicObjectMaterial(tmpobjid, 2, 11631, "mp_ranchcut", "mpCJ_WOOD_DARK", 0x00000000);
	tmpobjid = CreateDynamicObject(2434, 966.751708, -1556.559204, 20.572198, -0.000007, 0.000000, -89.999977, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 14385, "trailerkb", "tr_wood1", 0xFF663300);
	SetDynamicObjectMaterial(tmpobjid, 2, 11631, "mp_ranchcut", "mpCJ_WOOD_DARK", 0x00000000);
	tmpobjid = CreateDynamicObject(2435, 966.760009, -1555.636962, 20.572198, -0.000007, 0.000000, -89.999977, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 14385, "trailerkb", "tr_wood1", 0xFF663300);
	SetDynamicObjectMaterial(tmpobjid, 2, 11631, "mp_ranchcut", "mpCJ_WOOD_DARK", 0x00000000);
	tmpobjid = CreateDynamicObject(2435, 966.760009, -1554.706054, 20.572198, -0.000007, 0.000000, -89.999977, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 14385, "trailerkb", "tr_wood1", 0xFF663300);
	SetDynamicObjectMaterial(tmpobjid, 2, 11631, "mp_ranchcut", "mpCJ_WOOD_DARK", 0x00000000);
	tmpobjid = CreateDynamicObject(2435, 966.760009, -1553.775512, 20.572198, -0.000007, 0.000000, -89.999977, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 14385, "trailerkb", "tr_wood1", 0xFF663300);
	SetDynamicObjectMaterial(tmpobjid, 2, 11631, "mp_ranchcut", "mpCJ_WOOD_DARK", 0x00000000);
	tmpobjid = CreateDynamicObject(2435, 966.760009, -1552.865234, 20.572198, -0.000007, 0.000000, -89.999977, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 14385, "trailerkb", "tr_wood1", 0xFF663300);
	SetDynamicObjectMaterial(tmpobjid, 2, 11631, "mp_ranchcut", "mpCJ_WOOD_DARK", 0x00000000);
	tmpobjid = CreateDynamicObject(2435, 966.760009, -1551.934326, 20.572198, -0.000007, 0.000000, -89.999977, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 14385, "trailerkb", "tr_wood1", 0xFF663300);
	SetDynamicObjectMaterial(tmpobjid, 2, 11631, "mp_ranchcut", "mpCJ_WOOD_DARK", 0x00000000);
	tmpobjid = CreateDynamicObject(2434, 966.921875, -1550.818725, 20.572198, -0.000000, -0.000007, -179.999954, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 14385, "trailerkb", "tr_wood1", 0xFF663300);
	SetDynamicObjectMaterial(tmpobjid, 2, 11631, "mp_ranchcut", "mpCJ_WOOD_DARK", 0x00000000);
	tmpobjid = CreateDynamicObject(2435, 967.850219, -1550.823730, 20.572198, -0.000000, -0.000007, -179.999954, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 14385, "trailerkb", "tr_wood1", 0xFF663300);
	SetDynamicObjectMaterial(tmpobjid, 2, 11631, "mp_ranchcut", "mpCJ_WOOD_DARK", 0x00000000);
	tmpobjid = CreateDynamicObject(2435, 968.780212, -1550.823730, 20.572198, -0.000000, -0.000007, -179.999954, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 14385, "trailerkb", "tr_wood1", 0xFF663300);
	SetDynamicObjectMaterial(tmpobjid, 2, 11631, "mp_ranchcut", "mpCJ_WOOD_DARK", 0x00000000);
	tmpobjid = CreateDynamicObject(2435, 969.710510, -1550.823730, 20.572198, -0.000000, -0.000007, -179.999954, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 14385, "trailerkb", "tr_wood1", 0xFF663300);
	SetDynamicObjectMaterial(tmpobjid, 2, 11631, "mp_ranchcut", "mpCJ_WOOD_DARK", 0x00000000);
	tmpobjid = CreateDynamicObject(19378, 963.888488, -1557.514038, 25.496292, 0.000000, 270.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0xFF333333);
	tmpobjid = CreateDynamicObject(19378, 963.888488, -1549.841918, 25.496292, 0.300000, 270.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0xFF333333);
	tmpobjid = CreateDynamicObject(19378, 974.388732, -1557.514038, 25.496292, 0.000000, 270.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0xFF333333);
	tmpobjid = CreateDynamicObject(19378, 974.388732, -1549.841918, 25.496292, 0.300000, 270.000000, -0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0xFF333333);
	tmpobjid = CreateDynamicObject(19378, 984.869140, -1557.514038, 25.496292, 0.000000, 270.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0xFF333333);
	tmpobjid = CreateDynamicObject(19378, 984.869140, -1549.841918, 25.496292, 0.300000, 270.000000, -0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0xFF333333);
	tmpobjid = CreateDynamicObject(2434, 970.631713, -1556.719360, 20.572198, -0.000007, 0.000000, 0.000022, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 14385, "trailerkb", "tr_wood1", 0xFF663300);
	SetDynamicObjectMaterial(tmpobjid, 2, 11631, "mp_ranchcut", "mpCJ_WOOD_DARK", 0x00000000);
	tmpobjid = CreateDynamicObject(2434, 970.821716, -1550.978271, 20.572198, -0.000007, 0.000000, 90.000022, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 14385, "trailerkb", "tr_wood1", 0xFF663300);
	SetDynamicObjectMaterial(tmpobjid, 2, 11631, "mp_ranchcut", "mpCJ_WOOD_DARK", 0x00000000);
	tmpobjid = CreateDynamicObject(2435, 970.820922, -1551.913574, 20.572198, -0.000000, -0.000007, -269.999938, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 14385, "trailerkb", "tr_wood1", 0xFF663300);
	SetDynamicObjectMaterial(tmpobjid, 2, 11631, "mp_ranchcut", "mpCJ_WOOD_DARK", 0x00000000);
	tmpobjid = CreateDynamicObject(2435, 970.820922, -1552.833374, 20.572198, -0.000000, -0.000007, -269.999938, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 14385, "trailerkb", "tr_wood1", 0xFF663300);
	SetDynamicObjectMaterial(tmpobjid, 2, 11631, "mp_ranchcut", "mpCJ_WOOD_DARK", 0x00000000);
	tmpobjid = CreateDynamicObject(2435, 970.820922, -1553.743530, 20.572198, -0.000000, -0.000007, -269.999938, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 14385, "trailerkb", "tr_wood1", 0xFF663300);
	SetDynamicObjectMaterial(tmpobjid, 2, 11631, "mp_ranchcut", "mpCJ_WOOD_DARK", 0x00000000);
	tmpobjid = CreateDynamicObject(2435, 970.820922, -1554.674072, 20.572198, -0.000000, -0.000007, -269.999938, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 14385, "trailerkb", "tr_wood1", 0xFF663300);
	SetDynamicObjectMaterial(tmpobjid, 2, 11631, "mp_ranchcut", "mpCJ_WOOD_DARK", 0x00000000);
	tmpobjid = CreateDynamicObject(2435, 970.820922, -1555.584472, 20.572198, -0.000000, -0.000007, -269.999938, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 14385, "trailerkb", "tr_wood1", 0xFF663300);
	SetDynamicObjectMaterial(tmpobjid, 2, 11631, "mp_ranchcut", "mpCJ_WOOD_DARK", 0x00000000);
	tmpobjid = CreateDynamicObject(19982, 968.673706, -1551.881835, 19.882213, 0.000000, 0.000015, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18996, "mattextures", "sampblack", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 19297, "matlights", "invisible", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 968.885742, -1552.881835, 21.662227, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 1, 14385, "trailerkb", "tr_wood1", 0xFF663300);
	SetDynamicObjectMaterial(tmpobjid, 2, 11631, "mp_ranchcut", "mpCJ_WOOD_DARK", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 968.885742, -1554.592163, 21.662227, 0.099999, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 1, 14385, "trailerkb", "tr_wood1", 0xFF663300);
	SetDynamicObjectMaterial(tmpobjid, 2, 11631, "mp_ranchcut", "mpCJ_WOOD_DARK", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 968.885742, -1552.881835, 22.092237, 0.000000, 0.000015, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 1, 14385, "trailerkb", "tr_wood1", 0xFF663300);
	SetDynamicObjectMaterial(tmpobjid, 2, 11631, "mp_ranchcut", "mpCJ_WOOD_DARK", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 968.885742, -1554.592163, 22.102237, 0.099999, 0.000007, -0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 1, 14385, "trailerkb", "tr_wood1", 0xFF663300);
	SetDynamicObjectMaterial(tmpobjid, 2, 11631, "mp_ranchcut", "mpCJ_WOOD_DARK", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 968.885742, -1552.881835, 22.522247, 0.000000, 0.000015, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 1, 14385, "trailerkb", "tr_wood1", 0xFF663300);
	SetDynamicObjectMaterial(tmpobjid, 2, 11631, "mp_ranchcut", "mpCJ_WOOD_DARK", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 968.885742, -1554.592163, 22.522247, 0.099999, 0.000022, -0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 1, 14385, "trailerkb", "tr_wood1", 0xFF663300);
	SetDynamicObjectMaterial(tmpobjid, 2, 11631, "mp_ranchcut", "mpCJ_WOOD_DARK", 0x00000000);
	tmpobjid = CreateDynamicObject(19982, 968.673706, -1555.582885, 19.882213, 0.000000, 0.000015, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18996, "mattextures", "sampblack", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 19297, "matlights", "invisible", 0x00000000);
	tmpobjid = CreateDynamicObject(19982, 969.094116, -1555.582885, 19.882213, 0.000000, 0.000015, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18996, "mattextures", "sampblack", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 19297, "matlights", "invisible", 0x00000000);
	tmpobjid = CreateDynamicObject(19982, 969.094116, -1551.892456, 19.882213, 0.000000, 0.000015, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18996, "mattextures", "sampblack", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 19297, "matlights", "invisible", 0x00000000);
	tmpobjid = CreateDynamicObject(19445, 981.404418, -1552.803100, 23.622222, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 4828, "airport3_las", "brwall_128", 0x00000000);
	tmpobjid = CreateDynamicObject(19383, 981.399902, -1559.207519, 23.632219, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 4828, "airport3_las", "brwall_128", 0x00000000);
	tmpobjid = CreateDynamicObject(14877, 979.966979, -1559.333496, 19.822185, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0xFF333333);
	SetDynamicObjectMaterial(tmpobjid, 1, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0xFF333333);
	tmpobjid = CreateDynamicObject(19378, 986.569885, -1556.072631, 21.846292, 0.000000, 270.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 14537, "pdomebar", "club_floor2_sfwTEST", 0x00000000);
	tmpobjid = CreateDynamicObject(19378, 986.569885, -1551.341308, 21.846292, 0.199999, 270.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 14537, "pdomebar", "club_floor2_sfwTEST", 0x00000000);
	tmpobjid = CreateDynamicObject(19445, 981.404418, -1555.956054, 20.132204, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 4828, "airport3_las", "brwall_128", 0x00000000);
	tmpobjid = CreateDynamicObject(19445, 981.404418, -1551.344116, 20.132204, 0.000000, 0.000000, 0.099999, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 4828, "airport3_las", "brwall_128", 0x00000000);
	tmpobjid = CreateDynamicObject(19445, 987.234802, -1551.361816, 23.622222, 0.000000, 0.000000, 0.099999, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 4828, "airport3_las", "brwall_128", 0x00000000);
	tmpobjid = CreateDynamicObject(19383, 983.119689, -1554.537353, 23.632219, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 4828, "airport3_las", "brwall_128", 0x00000000);
	tmpobjid = CreateDynamicObject(19445, 989.534179, -1554.543090, 23.622222, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 4828, "airport3_las", "brwall_128", 0x00000000);
	tmpobjid = CreateDynamicObject(2802, 969.761047, -1559.597900, 20.962207, 0.000000, 0.000000, 108.799957, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 19297, "matlights", "invisible", 0x00000000);
	tmpobjid = CreateDynamicObject(19445, 987.242492, -1556.044433, 23.622222, 0.000000, 0.000000, -0.099999, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 4828, "airport3_las", "brwall_128", 0x00000000);
	tmpobjid = CreateDynamicObject(19445, 981.404418, -1551.363647, 23.622222, 0.000000, 0.000000, -0.099999, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 4828, "airport3_las", "brwall_128", 0x00000000);
	tmpobjid = CreateDynamicObject(1821, 982.392578, -1557.038696, 21.932229, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 3967, "cj_airprt", "ceiling_256", 0x00000000);
	tmpobjid = CreateDynamicObject(2082, 983.563293, -1549.105224, 21.932985, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 3967, "cj_airprt", "ceiling_256", 0x00000000);
	tmpobjid = CreateDynamicObject(2205, 984.942443, -1552.327148, 21.935533, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFF996666);
	tmpobjid = CreateDynamicObject(2607, 985.500366, -1557.231811, 22.322237, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 14535, "ab_wooziec", "ab_woodborder", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 1355, "break_s_bins", "CJ_WOOD_DARK", 0x00000000);
	tmpobjid = CreateDynamicObject(2163, 981.504394, -1553.662231, 21.935153, 0.000000, 0.000000, -270.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 1355, "break_s_bins", "CJ_WOOD_DARK", 0x00000000);
	tmpobjid = CreateDynamicObject(2163, 981.504394, -1551.883056, 21.935153, 0.000000, 0.000000, -270.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 1355, "break_s_bins", "CJ_WOOD_DARK", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 986.100341, -1548.109130, 23.743696, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 4828, "airport3_las", "brwall_128", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 987.609619, -1549.648925, 23.743696, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 4828, "airport3_las", "brwall_128", 0x00000000);
	tmpobjid = CreateDynamicObject(19445, 959.764343, -1556.064697, 23.682224, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 4828, "airport3_las", "brwall_128", 0x00000000);
	tmpobjid = CreateDynamicObject(19445, 959.764343, -1556.064697, 20.202220, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 4828, "airport3_las", "brwall_128", 0x00000000);
	tmpobjid = CreateDynamicObject(19445, 959.764343, -1551.262939, 20.202220, 0.000000, 0.000000, -0.199999, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 4828, "airport3_las", "brwall_128", 0x00000000);
	tmpobjid = CreateDynamicObject(19445, 959.764343, -1551.262939, 23.692251, 0.000000, 0.000000, -0.199999, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 4828, "airport3_las", "brwall_128", 0x00000000);
	tmpobjid = CreateDynamicObject(2691, 981.264038, -1553.651123, 24.172222, 0.000000, 0.000000, -90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 5998, "sunstr_lawn", "manns02_LAwN", 0x00000000);
	tmpobjid = CreateDynamicObject(2691, 959.896423, -1549.624267, 23.372234, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 5731, "melrose15_lawn", "melrsign03_LA", 0x00000000);
	tmpobjid = CreateDynamicObject(2691, 959.896179, -1553.593750, 23.352233, 0.000000, 0.000000, -270.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 5731, "melrose15_lawn", "melrsign05_LA", 0x00000000);
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	tmpobjid = CreateDynamicObject(1556, 970.382080, -1562.284423, 12.597802, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1556, 968.882446, -1562.284423, 12.597802, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(3810, 973.429199, -1563.035522, 14.939637, 0.000000, 0.000000, -90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(3810, 967.028747, -1563.035522, 14.939637, 0.000000, 0.000000, -90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1257, 990.120971, -1565.517578, 13.821056, 0.000000, 0.000000, -270.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(17969, 978.992675, -1588.748901, 13.948545, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2726, 966.939025, -1551.578735, 21.972198, 0.000000, 0.000007, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2726, 966.748840, -1555.468017, 21.972198, 0.000005, 0.000005, 42.499984, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19608, 978.213684, -1553.659179, 20.572198, -0.000007, 0.000000, -89.999977, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19820, 968.912719, -1552.140991, 22.532209, 0.000007, 0.000002, 67.299980, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19820, 968.909973, -1552.899414, 22.532209, -0.000002, 0.000007, -21.700010, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19821, 968.805419, -1552.680786, 22.552217, 0.000000, 0.000007, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19824, 968.937866, -1552.593750, 22.552207, 0.000000, 0.000007, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19824, 968.767700, -1552.363525, 22.552207, -0.000007, -0.000000, -92.799995, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19823, 968.912719, -1553.441650, 22.122220, 0.000000, 0.000000, 101.899986, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19812, 968.737854, -1552.712036, 21.072195, 0.000000, 0.000000, -90.600006, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19812, 968.728942, -1553.582275, 21.072195, 0.000000, 0.000000, 136.199981, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19830, 966.947204, -1551.952392, 21.612207, 0.000000, 0.000000, 56.199985, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19819, 968.868530, -1555.401123, 21.772211, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19819, 968.868530, -1555.170898, 21.772211, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19819, 968.868530, -1554.950683, 21.772211, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19819, 968.868530, -1554.700439, 21.772211, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19819, 968.868530, -1554.480224, 21.772211, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19819, 968.868530, -1554.239990, 21.772211, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19818, 968.834472, -1554.002685, 21.752210, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19818, 968.834472, -1553.822509, 21.752210, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19818, 968.834472, -1553.612304, 21.752210, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19818, 968.834472, -1553.422119, 21.752210, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19818, 966.863830, -1552.451904, 21.722209, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19823, 966.833251, -1552.838378, 21.612209, 0.000000, 0.000000, 101.899986, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19570, 968.885681, -1553.089477, 22.112197, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19570, 968.775573, -1552.849243, 22.112197, 0.000000, 0.000000, -47.599998, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1486, 968.994201, -1553.783325, 22.272220, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1486, 968.934143, -1553.893432, 22.272220, 0.000000, 0.000000, -27.700000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1544, 968.789916, -1553.791992, 22.132213, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1669, 968.882446, -1554.038818, 22.282224, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1669, 968.942504, -1554.349121, 22.282224, 0.000000, 0.000000, -25.100000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1668, 968.747680, -1554.177978, 22.292201, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1512, 968.841125, -1553.055175, 22.732213, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1512, 968.841125, -1553.195312, 22.732213, 0.000000, 0.000000, -131.300033, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1541, 967.252197, -1555.132324, 21.822217, 0.000000, 0.000000, -90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1541, 970.322937, -1552.461547, 21.822217, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1548, 966.789794, -1553.886840, 21.662208, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1548, 970.750183, -1553.676635, 21.662208, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1548, 970.750183, -1555.297363, 21.662208, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2683, 970.543029, -1555.044555, 21.822206, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19609, 978.516784, -1551.258666, 20.652200, -0.000006, 0.000003, -63.499984, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19318, 977.567321, -1551.169311, 21.260639, -7.900006, 0.000002, -73.299972, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19319, 977.387390, -1557.659301, 21.275440, -17.400001, -0.000007, 179.999954, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19615, 976.813110, -1550.399902, 20.662200, -0.000006, 0.000003, -64.299972, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19615, 979.905273, -1556.824829, 20.662200, -0.000005, -0.000005, -134.800003, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1805, 979.465698, -1550.601562, 20.989080, 0.000003, 0.000006, 31.399993, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1716, 970.115539, -1549.037109, 20.572198, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1716, 969.265197, -1549.037109, 20.572198, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1716, 968.204956, -1549.037109, 20.572198, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1716, 965.514404, -1552.288696, 20.572198, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1716, 965.514404, -1551.337402, 20.572198, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19614, 978.925659, -1557.485473, 20.659072, -0.000004, -0.000005, -140.299987, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19614, 977.916198, -1552.670532, 20.659072, -0.000006, 0.000003, -60.199989, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2225, 980.448791, -1556.130615, 20.619073, -0.000007, -0.000000, -91.099975, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19616, 979.789550, -1553.701782, 20.572198, -0.000007, 0.000001, -80.199989, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19806, 968.661682, -1553.904541, 24.862203, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2176, 980.838378, -1556.878417, 21.892187, 0.000000, 0.000007, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2176, 980.838378, -1550.207275, 21.892187, 0.000000, 0.000007, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2176, 980.838378, -1553.576782, 21.892187, 0.000000, 0.000007, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(3498, 968.911254, -1551.534912, 20.973579, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(3498, 968.911254, -1555.916137, 20.973579, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(18701, 966.727722, -1555.470825, 20.622200, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(18701, 966.927917, -1551.560791, 20.622200, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1670, 969.942504, -1547.754882, 21.311059, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2802, 969.965942, -1547.806030, 20.962207, 0.000000, 0.000000, 112.399993, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2802, 965.639526, -1547.491333, 20.962207, 0.000000, 0.000000, -71.200042, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2802, 969.883605, -1559.958129, 20.962207, 0.000000, 0.000000, -71.200042, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2802, 966.376892, -1560.021118, 20.962207, 0.000000, 0.000000, -84.500000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2802, 973.283874, -1559.556640, 20.962207, 0.000000, 0.000000, -84.500000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1716, 972.236999, -1551.537963, 20.572198, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1716, 972.236999, -1552.358764, 20.572198, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1716, 972.236999, -1553.149536, 20.572198, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2802, 962.118041, -1551.112182, 20.962207, 0.000000, 0.000000, -176.300018, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2802, 963.278015, -1553.552246, 20.962207, 0.000000, 0.000000, 5.699973, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2802, 962.779418, -1548.557128, 20.962207, 0.000000, 0.000000, 71.199958, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1670, 962.822326, -1548.445068, 21.311059, 0.000000, 0.000000, -34.700000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1670, 963.221984, -1553.454467, 21.311059, 0.000000, 0.000000, -34.700000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2800, 973.267578, -1559.611083, 21.132205, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2800, 969.856933, -1559.921386, 21.132205, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(11683, 972.997924, -1547.006347, 20.580844, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(11683, 973.838317, -1547.006347, 20.580844, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(11683, 974.658508, -1547.006347, 20.580844, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1746, 973.753479, -1549.196655, 20.580274, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(11682, 975.473937, -1547.041992, 20.580997, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(11684, 972.159301, -1547.042968, 20.582252, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19824, 973.968688, -1549.267211, 21.130424, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19824, 973.728454, -1549.357299, 21.130424, 0.000000, 0.000000, 46.299999, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2262, 986.643798, -1559.404052, 23.502233, 0.000000, 0.000000, -90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2264, 985.602905, -1555.183349, 23.502244, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2271, 986.643798, -1557.253051, 23.442239, 0.000000, 0.000000, -90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2073, 984.066650, -1557.804809, 25.372270, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19611, 977.025634, -1554.434082, 20.652200, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2267, 987.108398, -1551.670166, 23.752243, 0.000000, 0.000000, -90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1714, 986.477661, -1551.621337, 21.932229, 0.000000, 0.000000, -90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2777, 985.566345, -1555.762939, 22.362224, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2310, 985.679687, -1559.034179, 22.362232, 0.000000, 0.000000, -71.000030, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2310, 983.422363, -1551.497680, 22.356668, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2292, 982.713867, -1546.997680, 21.846775, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1754, 983.687438, -1546.986328, 21.842021, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1754, 984.637695, -1546.986328, 21.842021, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2292, 985.614196, -1546.997680, 21.846775, 0.000000, 0.000000, -90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1754, 985.647460, -1547.957275, 21.842021, 0.000000, 0.000000, -90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2292, 985.614196, -1548.918334, 21.846775, 0.000000, 0.000000, -180.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2239, 986.717529, -1549.918334, 21.934494, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19786, 981.468444, -1548.879028, 23.885557, 3.399999, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(16780, 984.522460, -1551.385620, 25.446712, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2074, 984.519226, -1551.335083, 24.724952, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1556, 959.837646, -1559.472656, 20.572198, 0.000000, 0.000000, -270.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1556, 959.837646, -1557.992431, 20.572198, 0.000000, 0.000000, -270.000000, -1, -1, -1, 300.00, 300.00);


	//Ini Objeck tambahan terakhir
	CreateDynamicObject(3474, 1116.29822, -1387.77185, 18.81791,   0.00000, 0.00000, 1.70477);
	CreateDynamicObject(5811, 1117.28601, -1393.49182, 16.39510,   0.00000, 0.00000, 2.22422);
	CreateDynamicObject(8303, 1115.24829, -1361.68237, 29.87900,   0.00000, 0.00000, 270.00000);



	// tambah objeck
    CreateDynamicObject(3474, 1116.29822, -1387.77185, 18.81791,   0.00000, 0.00000, 1.70477);
	CreateDynamicObject(5811, 1117.28601, -1393.49182, 16.39510,   0.00000, 0.00000, 2.22422);
	CreateDynamicObject(8303, 1115.24829, -1361.68237, 29.87900,   0.00000, 0.00000, 270.00000);
	// tambah bangunan selesai.


	//objeck untuk taman gurun

	
	

	CreateDynamicObject(310, 1301.17810, 2786.85913, 23.40754,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1412, 1303.24451, 2754.96509, 10.97019,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1412, 1308.68738, 2754.69946, 10.97019,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(7033, 1306.08984, 2765.95459, 14.11048,   0.00000, 0.00000, 0.00000);


	// Map kantor polisi yang ada di dekat CGH



	CreateDynamicObject(4638, 2315.35791, -1336.90796, 24.67100,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19443, 2313.66895, -1337.22705, 24.54700,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19428, 2316.26294, -1337.87695, 24.36600,   0.00000, 0.00000, 89.99900);
	CreateDynamicObject(19791, 2319.70801, -1367.51501, 21.00600,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19741, 2317.14697, -1370.04004, 28.25100,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19463, 2314.77002, -1367.70898, 22.51000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19463, 2317.67090, -1364.25305, 22.51000,   0.00000, 0.00000, -89.40000);
	CreateDynamicObject(19791, 2317.87891, -1369.21594, 16.02600,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19791, 2319.70801, -1357.68506, 19.94600,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19463, 2312.94800, -1369.01904, 22.51000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19463, 2312.93799, -1369.46899, 22.51000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19463, 2317.77490, -1374.19299, 22.51000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(19463, 2318.10498, -1374.20300, 22.51000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(19463, 2322.81689, -1369.37903, 22.51000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19791, 2326.96802, -1367.47498, 18.62600,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19463, 2327.15698, -1372.43298, 22.51000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(19463, 2331.90698, -1367.54895, 22.51000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19463, 2331.91699, -1357.93896, 22.51000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19791, 2326.94995, -1357.70508, 18.63600,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19463, 2331.92700, -1357.45801, 22.51000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19463, 2314.77808, -1358.20898, 22.51000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19463, 2314.76807, -1357.43896, 22.51000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19463, 2319.65991, -1352.71301, 22.51000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(19463, 2327.19995, -1352.70300, 22.51000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(19447, 2313.52490, -1363.99402, 24.33400,   90.60000, -13.69900, -78.00000);
	CreateDynamicObject(19447, 2313.52710, -1363.92395, 24.33400,   90.60000, -13.69900, -78.00000);
	CreateDynamicObject(19741, 2315.12695, -1367.09998, 25.37100,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19741, 2315.12695, -1371.55896, 25.37100,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19741, 2319.93701, -1371.55896, 25.37100,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(18763, 2314.31909, -1366.53894, 22.84500,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(18763, 2314.31909, -1369.53894, 22.84500,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(18763, 2314.31909, -1372.53894, 22.84500,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(18763, 2314.30811, -1373.03894, 22.84500,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(18763, 2317.29810, -1373.03894, 22.84500,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(18763, 2320.27808, -1373.03894, 22.84500,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(18763, 2321.42798, -1373.04895, 22.84500,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(18763, 2316.19702, -1370.04700, 28.18300,   89.89900, 0.00000, 0.00000);
	CreateDynamicObject(18763, 2323.23706, -1370.04700, 28.18300,   89.89900, 0.00000, 0.00000);
	CreateDynamicObject(19741, 2321.84692, -1370.04004, 28.25100,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(18763, 2317.81592, -1370.07703, 28.18300,   89.89900, 0.00000, 0.00000);
	CreateDynamicObject(18763, 2330.48706, -1370.05005, 26.80300,   89.89900, 0.00000, 0.00000);
	CreateDynamicObject(19741, 2329.19702, -1369.68994, 27.28100,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(18763, 2330.48706, -1355.18005, 26.84700,   89.89900, 0.00000, 0.00000);
	CreateDynamicObject(19741, 2329.19702, -1363.52002, 27.28100,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19741, 2329.19702, -1357.31006, 27.28100,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19741, 2329.19702, -1355.63000, 27.28100,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(18763, 2316.19702, -1355.14795, 27.22700,   89.89900, 0.00000, 0.00000);
	CreateDynamicObject(19741, 2323.03809, -1355.62903, 27.28100,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19741, 2317.66797, -1355.62903, 27.28100,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19741, 2316.99707, -1360.81897, 27.28100,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(18763, 2316.20703, -1361.44800, 27.23800,   89.89900, 0.00000, 0.00000);
	CreateDynamicObject(19741, 2316.99707, -1354.90906, 27.28100,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19741, 2323.22705, -1354.90906, 27.28100,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19741, 2329.44800, -1354.90906, 27.28100,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19741, 2329.44800, -1361.13904, 27.28100,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19741, 2329.44800, -1367.26794, 27.28100,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19741, 2329.44800, -1369.84802, 27.28100,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19741, 2328.88696, -1369.85803, 27.28100,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(18763, 2314.31909, -1365.50903, 22.84500,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(18663, 2311.98096, -1369.47302, 24.45400,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(18667, 2326.48291, -1372.48804, 24.64500,   0.00000, 0.00000, 89.80000);
	CreateDynamicObject(18667, 2327.70288, -1372.49194, 24.52500,   0.00000, 0.00000, 89.80000);
	CreateDynamicObject(18667, 2326.39404, -1372.48804, 24.95500,   0.00000, 0.00000, 89.80000);
	CreateDynamicObject(18667, 2326.39404, -1372.48804, 23.92500,   0.00000, 0.00000, 89.80000);
	CreateDynamicObject(18667, 2326.62402, -1372.48901, 24.83500,   0.00000, 0.00000, 89.80000);
	CreateDynamicObject(18667, 2326.43408, -1372.48804, 23.49500,   0.00000, 0.00000, 89.80000);
	CreateDynamicObject(18763, 2330.48706, -1362.66895, 26.80000,   89.89900, 0.00000, 0.00000);
	CreateDynamicObject(19866, 2309.32690, -1352.86401, 22.96300,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19866, 2309.47803, -1352.86401, 22.96300,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19866, 2309.59790, -1352.86401, 22.96300,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19866, 2309.59790, -1352.86401, 23.65300,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19866, 2309.47803, -1352.86401, 23.65300,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19866, 2309.32690, -1352.86401, 23.65300,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(18667, 2309.21802, -1352.89404, 23.29800,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(18667, 2309.21802, -1352.86401, 23.29800,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(18667, 2309.21802, -1353.32397, 22.91800,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(18667, 2309.21802, -1352.85400, 22.91800,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(18667, 2309.21802, -1352.99402, 22.63800,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19791, 2333.67212, -1347.89697, 16.24500,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19791, 2333.67212, -1338.13696, 16.24500,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19791, 2328.11108, -1338.13696, 15.83500,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1409, 910.87500, -836.69501, 91.12500,   0.00000, 0.00000, 19.99900);
	CreateDynamicObject(19966, 2313.62695, -1336.93994, 21.20800,   0.00000, 0.00000, -89.99900);
	CreateDynamicObject(19467, 2314.02905, -1340.44397, 22.42600,   -124.80000, 0.00000, -90.50000);
	CreateDynamicObject(19467, 2313.99194, -1344.67395, 22.42600,   -124.80000, 0.00000, -90.50000);
	CreateDynamicObject(19467, 2313.95508, -1348.93396, 22.42600,   -124.80000, 0.00000, -90.50000);
	CreateDynamicObject(1569, 2312.97290, -1367.41602, 23.01700,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1569, 2312.97290, -1367.41602, 23.01700,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1569, 2312.86304, -1370.90002, 22.85900,   0.00000, 0.00000, 89.79900);
	CreateDynamicObject(1569, 2312.86890, -1367.93005, 22.85900,   0.00000, 0.00000, -90.50000);
	CreateDynamicObject(1616, 2312.70190, -1364.31604, 25.18700,   0.00000, 0.00000, 83.70000);
	CreateDynamicObject(1616, 2327.96606, -1372.68396, 28.35700,   0.00000, 0.00000, 59.20000);
	CreateDynamicObject(1502, 2318.23608, -1373.35095, 23.03200,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19859, 2317.28589, -1374.52002, 24.19100,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19859, 2320.24512, -1374.54004, 24.19100,   0.00000, 0.00000, 179.10001);
	CreateDynamicObject(17951, 2323.14697, -1339.72302, 23.89700,   0.00000, 0.00000, -0.49900);
	CreateDynamicObject(1569, 2328.72607, -1349.57800, 22.98900,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19791, 1831.60901, -1444.46594, 10.71200,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19791, 1831.60901, -1434.47595, 10.71200,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19791, 1821.71899, -1424.49695, 10.71200,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19791, 1821.72900, -1444.46594, 10.71200,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19791, 1821.72900, -1434.47595, 10.71200,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19791, 1831.60901, -1424.49695, 10.71200,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19379, 1836.56494, -1433.89404, 10.78000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19379, 1836.56494, -1443.52502, 10.77000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19379, 1836.57495, -1444.73499, 10.73000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19379, 1836.29504, -1424.29395, 16.31000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19379, 1816.76404, -1424.31396, 11.93000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19379, 1816.76404, -1433.91394, 11.93000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19379, 1816.76404, -1443.52405, 11.93000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19379, 1816.75403, -1444.72400, 11.93000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19379, 1821.48401, -1449.61401, 11.93000,   0.00000, 0.00000, 89.99900);
	CreateDynamicObject(19379, 1826.35400, -1449.61401, 11.93000,   0.00000, 0.00000, 89.99900);
	CreateDynamicObject(19379, 1831.83398, -1449.46399, 10.43000,   0.00000, 0.00000, 89.99900);
	CreateDynamicObject(19379, 1821.47400, -1419.55505, 11.93000,   0.00000, 0.00000, 89.99900);
	CreateDynamicObject(19379, 1831.09399, -1419.55505, 11.93000,   0.00000, 0.00000, 89.99900);
	CreateDynamicObject(19379, 1831.83398, -1419.56494, 11.93000,   0.00000, 0.00000, 89.99900);
	CreateDynamicObject(3034, 1818.49805, -1450.16895, 14.91100,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3034, 1822.11804, -1450.16895, 14.91100,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3034, 1825.73804, -1450.16895, 14.91100,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3034, 1828.61694, -1450.17896, 14.91100,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3034, 1832.97803, -1449.59900, 16.32100,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3034, 1834.85803, -1449.60901, 16.32100,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3034, 1836.67896, -1447.80798, 16.32100,   0.00000, 0.00000, 89.99900);
	CreateDynamicObject(3034, 1836.68896, -1444.41895, 16.32100,   0.00000, 0.00000, 89.99900);
	CreateDynamicObject(3034, 1836.68896, -1440.79895, 16.32100,   0.00000, 0.00000, 89.99900);
	CreateDynamicObject(3034, 1836.68896, -1437.17896, 16.32100,   0.00000, 0.00000, 89.99900);
	CreateDynamicObject(3034, 1836.68896, -1433.55896, 16.32100,   0.00000, 0.00000, 89.99900);
	CreateDynamicObject(3034, 1836.69897, -1431.74902, 16.32100,   0.00000, 0.00000, 89.99900);
	CreateDynamicObject(19379, 1821.48401, -1449.45398, 11.93000,   0.00000, 0.00000, 89.99900);
	CreateDynamicObject(19379, 1821.48401, -1449.45398, 11.93000,   0.00000, 0.00000, 89.99900);
	CreateDynamicObject(19379, 1831.10400, -1449.45398, 11.93000,   0.00000, 0.00000, 89.99900);
	CreateDynamicObject(19379, 1821.48401, -1449.45398, 11.93000,   0.00000, 0.00000, 89.99900);
	CreateDynamicObject(19379, 1821.48401, -1449.76404, 11.93000,   0.00000, 0.00000, 89.99900);
	CreateDynamicObject(19379, 1826.35400, -1449.76404, 11.93000,   0.00000, 0.00000, 89.99900);
	CreateDynamicObject(19379, 1821.48401, -1449.91394, 11.93000,   0.00000, 0.00000, 89.99900);
	CreateDynamicObject(19379, 1826.35400, -1449.91394, 11.93000,   0.00000, 0.00000, 89.99900);
	CreateDynamicObject(19379, 1821.48401, -1450.06396, 11.93000,   0.00000, 0.00000, 89.99900);
	CreateDynamicObject(19379, 1826.35400, -1450.06396, 11.93000,   0.00000, 0.00000, 89.99900);
	CreateDynamicObject(4100, 1823.84802, -1450.19800, 15.20400,   0.00000, 0.00000, -39.89900);
	CreateDynamicObject(19379, 1836.43506, -1424.29395, 16.31000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19379, 1836.56494, -1424.29395, 16.31000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19379, 1837.01501, -1424.29395, 11.93000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19379, 1836.73499, -1424.29395, 16.31000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19379, 1836.90503, -1424.29395, 16.31000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19379, 1837.05505, -1424.29395, 16.31000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19379, 1837.15503, -1424.29395, 16.31000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19379, 1837.29504, -1424.29395, 16.31000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19379, 1837.42505, -1424.29395, 16.31000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19379, 1837.59497, -1424.29395, 16.31000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19379, 1837.76501, -1424.29395, 16.31000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19379, 1837.91504, -1424.29395, 16.31000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3034, 1836.69897, -1428.13904, 16.32100,   0.00000, 0.00000, 89.99900);
	CreateDynamicObject(3034, 1825.24805, -1450.29895, 18.87100,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3034, 1828.86804, -1450.29895, 18.87100,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3034, 1832.48804, -1450.29895, 18.87100,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3034, 1835.42700, -1450.30896, 18.87100,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(4100, 1830.64404, -1450.36206, 19.23400,   0.00000, 0.00000, -39.89900);
	CreateDynamicObject(3034, 1837.19702, -1448.47900, 18.87100,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3034, 1837.19702, -1442.78894, 18.87100,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3034, 1837.19702, -1437.76904, 18.87100,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3034, 1837.19702, -1432.24902, 18.87100,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(4100, 1837.25195, -1443.19104, 19.23400,   0.00000, 0.00000, 50.10000);
	CreateDynamicObject(4100, 1837.26794, -1429.45203, 19.24400,   0.00000, 0.00000, 50.10000);
	CreateDynamicObject(3034, 1818.05798, -1450.29895, 18.87100,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3034, 1816.24805, -1448.48901, 18.87100,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(3034, 1816.24805, -1444.85901, 18.87100,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(3034, 1816.24805, -1437.28796, 18.87100,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(3034, 1816.24805, -1433.64905, 18.87100,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(3034, 1816.24805, -1426.41797, 18.87100,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(4100, 1823.35498, -1450.30603, 19.23400,   0.00000, 0.00000, -39.89900);
	CreateDynamicObject(4100, 1816.21399, -1443.63098, 19.23400,   0.00000, 0.00000, -129.89900);
	CreateDynamicObject(4100, 1816.18896, -1429.97595, 19.23400,   0.00000, 0.00000, -129.89900);
	CreateDynamicObject(19358, 1837.77100, -1438.88000, 15.53900,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19358, 1837.77100, -1435.69995, 15.53900,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(18648, 1837.64001, -1439.95496, 16.24800,   49.10000, 11.09900, 92.19900);
	CreateDynamicObject(18648, 1837.63306, -1439.91602, 16.24300,   49.10000, 11.09900, 92.19900);
	CreateDynamicObject(18648, 1837.52197, -1434.54199, 16.32600,   49.10000, 11.09900, 92.19900);
	CreateDynamicObject(18648, 1837.53003, -1434.58105, 16.33100,   49.10000, 11.09900, 92.19900);
	CreateDynamicObject(921, 1837.90405, -1437.30701, 15.33600,   89.79900, 0.00000, 0.00000);
	CreateDynamicObject(2314, 1836.54102, -1450.08704, 17.02900,   -89.89900, -179.99899, 89.40000);
	CreateDynamicObject(2314, 1836.68506, -1451.61902, 17.04000,   -89.89900, 179.99899, -90.60000);
	new tekskantorpolisi = CreateDynamicObject(18666, 1837.05200, -1450.80298, 16.24800,   0.00000, 0.00000, 180.00000);
	// disini kasi teks
	SetDynamicObjectMaterialText(tekskantorpolisi, 0, "{FFFFFF}PUTUSUHARTAWAN\nPOLISI SEKITAR\n\n{8F6B00}- CINTA Bot Pengawal -\n\n\n\n\n\n\n", 140, "Arial", 48, 1, 0xFF800000, 0xFF0000FF, 1);
	
	tekskantorpolisi = CreateDynamicObject(18666, 1836.17102, -1451.51404, 16.25800,   0.00000, 0.00000, 0.00000);
	// ini juga
	SetDynamicObjectMaterialText(tekskantorpolisi, 0, ""COL_RED"POLISI", 140, "Arial", 48, 1, 0xFF800000, 0xFF0000FF, 1);
	
	CreateDynamicObject(19354, 1836.29004, -1427.34094, 14.48000,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(18663, 1838.05103, -1427.25903, 13.60000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(19356, 1837.92395, -1426.01904, 18.73000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(18667, 1838.00696, -1426.08398, 15.88000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(18667, 1838.00696, -1426.08398, 15.88000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(18667, 1838.04700, -1424.97400, 14.64000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(18667, 1838.00696, -1425.07397, 15.33000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(19379, 1833.18604, -1429.03503, 15.96000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(987, 1785.16199, -1441.63501, 10.07900,   0.00000, 0.00000, -18.89900);
	CreateDynamicObject(987, 1796.52795, -1445.30396, 10.07900,   0.00000, 0.00000, -198.89900);
	CreateDynamicObject(987, 1793.42297, -1444.42603, 10.07900,   0.00000, 0.00000, -18.89900);
	CreateDynamicObject(987, 1804.78894, -1448.09497, 10.07900,   0.00000, 0.00000, 161.09900);
	CreateDynamicObject(987, 1785.40796, -1441.72998, 10.07900,   0.00000, 0.00000, 46.09900);
	CreateDynamicObject(987, 1793.53699, -1432.97998, 10.07900,   0.00000, 0.00000, -133.89900);
	CreateDynamicObject(987, 1793.70801, -1433.08997, 10.07900,   0.00000, 0.00000, 46.09900);
	CreateDynamicObject(987, 1801.83704, -1424.33997, 10.07900,   0.00000, 0.00000, -133.89900);
	CreateDynamicObject(987, 1797.46899, -1429.20996, 10.07900,   0.00000, 0.00000, 46.09900);
	CreateDynamicObject(987, 1805.59705, -1420.45898, 10.07900,   0.00000, 0.00000, -133.89900);
	CreateDynamicObject(3034, 1816.24805, -1437.28796, 14.82100,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(3034, 1816.24805, -1433.66895, 14.82100,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(3034, 1816.24805, -1425.77795, 14.82100,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(3034, 1816.66699, -1448.36902, 14.91100,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(3034, 1816.66699, -1444.72803, 14.91100,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(967, 1805.71497, -1448.09595, 12.35200,   0.00000, 0.00000, -104.39900);
	CreateDynamicObject(966, 1806.55200, -1448.82495, 12.50000,   0.00000, 0.00000, 170.10001);
	CreateDynamicObject(3467, 1813.97498, -1449.95605, 13.20000,   8.00000, 0.00000, 0.00000);
	CreateDynamicObject(3467, 1814.69702, -1450.06104, 13.20800,   0.00000, 0.00000, -8.29900);
	CreateDynamicObject(3467, 1815.43005, -1450.16699, 13.20800,   0.00000, 0.00000, -8.29900);
	CreateDynamicObject(3467, 1816.12195, -1450.26904, 13.20800,   0.00000, 0.00000, -8.29900);
	CreateDynamicObject(18665, 1815.19397, -1450.17200, 12.63500,   0.00000, 0.00000, 81.59900);
	CreateDynamicObject(18665, 1815.11499, -1450.16003, 12.63500,   0.00000, 0.00000, 81.59900);
	CreateDynamicObject(18665, 1815.11499, -1450.16003, 13.06500,   0.00000, 0.00000, 81.59900);
	tekskantorpolisi = CreateDynamicObject(18665, 1816.01501, -1450.29297, 12.14500,   0.00000, 0.00000, 81.59900);
	SetDynamicObjectMaterialText(tekskantorpolisi, 0, ""COL_RED"BAYAR\nPARKIR", 140, "Arial", 48, 1, 0xFF800000, 0xFF0000FF, 1);
	
	CreateDynamicObject(6874, 1818.32605, -1410.91394, 12.24900,   0.00000, 0.00000, 0.00000);

	// pintu polisi
	PintuParkiranPolisi = CreateDynamicObject(968, 1806.35498, -1448.79199, 13.40000,   0.00000, 90.00000, -9.90000);
	PintuParkiranPolisiPick = CreatePickup(1212, 1, 1809.9792,-1449.8053,13.5469, -1);

	// papan nama kantor polisi
	new tandakantorpolisi = CreateDynamicObject(8551, 1812.8149,-1425.8359,13.4297, 0.00000, 0.00000, 10.00000);
	SetDynamicObjectMaterialText(tandakantorpolisi, 1, "{FFFFFF}PUTUSUHARTAWAN\nPOLISI SEKITAR\n\n{8F6B00}- CINTA Bot Pengawal -\n\n\n\n\n\n\n", 140, "Arial", 48, 1, 0xFF800000, 0xFF0000FF, 1);
	// Map kantor polisi selesai.


	//pickup untuk ke interior FBI
	PintuMasukPolisiPick = CreatePickup(1318, 1, 2388.6382,2466.6025,10.8203, -1);


	//pickup untuk ke parkiran polisi FBI
	PintuKeluarPolisiPick = CreatePickup(1318, 1, 311.7394,-1485.0898,-33.5292, -1);



	// papan nama kantor gas putu
	new tandakantorgasidle = CreateDynamicObject(11453, 1955.9915,-1760.6854,13.5469,0.00000, 1.00000, 80.91982);
	SetDynamicObjectMaterialText(tandakantorgasidle, 1, "{FFFFFF}PUTUSUHARTAWAN\nGAS STATION\n\n{8F6B00}- IDLEWOOD -\n\n\n\n\n\n\n", 140, "Arial", 48, 1, 0xFF600000, 0xFF0000FF, 1);


	//objeck MD LV
	CreateDynamicObject(4002, 2388.02612, 2001.58337, -17.85637,   0.00000, 0.00000, 0.94291);
	CreateDynamicObject(2538, 2408.41724, 1993.98584, 9.80401,   0.00000, 0.00000, 90.66784);
	CreateDynamicObject(2538, 2408.41724, 1993.98584, 9.80401,   0.00000, 0.00000, 90.66784);
	CreateDynamicObject(2556, 2408.38989, 1993.17737, 9.60930,   0.00000, 0.00000, 89.02473);
	CreateDynamicObject(1412, 2409.86206, 1989.38586, 13.96535,   -91.00000, -4.00000, 265.85855);
	CreateDynamicObject(7392, 2407.53369, 2001.55811, 29.60212,   0.00000, 0.00000, 2.23450);
	CreateDynamicObject(1684, 2430.49341, 1988.48389, 11.70366,   0.00000, 0.00000, 269.63101);

	PintuMD = CreatePickup(1276,1,2409.2627,1989.2328,10.8203,-1);

	// MD luar seesai

	// Resto MD bagian dalam
	CreateDynamicObject(1412, 2115.17334, 2396.57715, 229.97696,   -78.00000, -11.00000, 171.00000);
	CreateDynamicObject(7006, 2115.86182, 2396.64429, 230.48050,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(5837, 2148.77100, 2394.08179, 231.44046,   0.00000, 0.00000, 0.00000);

    PintuKeluarMD = CreatePickup(1274,1,1169.4120,-1354.9413,2423.0461,-1);
	// INI BAGIAN PLAYER CONNECTNYA OBJECK SPAWNER


	// ini adalah bagian pekerjaan seorang pemadam
	infokerjapemadam = CreatePickup(1239,1,1112.8021,-1246.9584,15.8203,-1);
   //== Cars =====
   /*
   AddStaticVehicleex(407, 1103.3850, -1246.4249, 16.0418, 0.0000, -1, -1, 100);
   AddStaticVehicleEx(407, 1095.1766, -1245.9021, 16.0418, 0.0000, -1, -1, 100);
   AddStaticVehicleEx(407, 1086.6315, -1246.2279, 16.0418, 0.0000, -1, -1, 100);
   AddStaticVehicleEx(407, 1086.6494, -1227.3779, 16.0418, 271.3036, -1, -1, 100);
   */
   // === Building and Wather Fireman ======
   //CreateDynamicObject(11008, 1099.30066, -1261.38281, 20.22270,   0.00000, -6.00000, 90.00000);
   // rumah pekerjaan Pompier
   CreateDynamicObject(3255, 1099.55139, -1185.04590, 17.02541,   0.00000, 0.00000, 270.48352);
   CreateDynamicObject(3643, 1099.36389, -1189.03284, 25.69979,   0.00000, 0.00000, 0.00000);


	// pemadam kerjaanya selesai


	// ini gas station idlewood
	//CreateDynamicObject(3881, 1952.383666, -1793.119140, 13.982812, 0.000000, 0.000000, 180.000000);
	CreateDynamicObject(2921, 1951.815185, -1790.028930, 15.382810, 0.000000, 0.000000, 240.000000);
	CreateDynamicObject(1250, 1952.101562, -1789.347656, 13.382810, 0.000000, 0.000000, 180.000000);
	CreateDynamicObject(984, 1952.210693, -1775.617187, 13.146873, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(984, 1952.199096, -1764.158325, 13.146873, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(984, 1945.817382, -1757.783813, 12.982810, 0.000000, 0.000000, 90.000000);
	CreateDynamicObject(3881, 1931.155273, -1762.271972, 14.146873, 0.000000, 0.000000, 180.000000);
	CreateDynamicObject(1250, 1932.206298, -1758.158569, 13.182811, 0.000000, 0.000000, 90.000000);
	CreateDynamicObject(2921, 1933.699096, -1761.030273, 15.546875, 0.000000, 0.000000, 270.000000);
	CreateDynamicObject(984, 1891.929443, -1796.973876, 13.146873, 0.000000, 0.000000, 90.000000);
	CreateDynamicObject(984, 1943.146850, -1797.102783, 13.046873, 0.000000, 0.000000, 90.000000);
	CreateDynamicObject(984, 1930.312011, -1797.063598, 13.082811, 0.000000, 0.000000, 90.000000);
	CreateDynamicObject(984, 1917.484619, -1797.005126, 13.082811, 0.000000, 0.000000, 90.000000);
	CreateDynamicObject(984, 1907.963256, -1786.331176, 13.082811, 0.000000, 0.000000, 90.000000);
	CreateDynamicObject(1232, 1901.348266, -1786.360107, 13.246871, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(984, 1904.694946, -1796.933593, 13.146873, 0.000000, 0.000000, 90.000000);
	CreateDynamicObject(1232, 1898.136474, -1797.011840, 13.346874, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(984, 1879.126098, -1796.958618, 13.146873, 0.000000, 0.000000, 90.000000);
	CreateDynamicObject(984, 1866.326049, -1796.994018, 13.146873, 0.000000, 0.000000, 90.000000);
	CreateDynamicObject(984, 1853.520874, -1797.024536, 13.146873, 0.000000, 0.000000, 90.000000);
	CreateDynamicObject(3881, 1836.737670, -1799.610107, 14.146873, 0.000000, 0.000000, 270.000000);
	CreateDynamicObject(984, 1847.150024, -1797.080200, 13.146873, 0.000000, 0.000000, 90.000000);
	CreateDynamicObject(1232, 1840.913818, -1797.162597, 13.546875, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(2921, 1834.439086, -1797.414672, 15.546877, 0.000000, 0.000000, 240.000000);
	CreateDynamicObject(1250, 1839.699707, -1796.738769, 13.546875, 0.000000, 0.000000, 180.000000);

	// gas station selesai.

	// ini fire department map
    new fd_wall[52];
	/*



	

	*/
		// NEW FIRE DEPARTMENT
	CreateDynamicObject(19791, 2328.77686, -1515.69995, 13.91983,   0.00000, 10.00000, 0.00000);
	CreateDynamicObject(19791, 2328.77686, -1525.69995, 13.91980,   0.00000, 10.00000, 0.00000);
	CreateDynamicObject(19791, 2328.77686, -1535.69995, 13.91980,   0.00000, 10.00000, 0.00000);
	CreateDynamicObject(19791, 2328.77686, -1545.69995, 13.91980,   0.00000, 10.00000, 0.00000);
	CreateDynamicObject(19791, 2320.58667, -1515.69995, 14.63260,   0.00000, 0.00000, 0.20100);
	CreateDynamicObject(19791, 2320.58667, -1525.69995, 14.63260,   0.00000, 0.00000, 0.20100);
	CreateDynamicObject(19791, 2320.58667, -1535.69995, 14.63260,   0.00000, 0.00000, 0.20100);
	CreateDynamicObject(19791, 2320.58667, -1545.69995, 14.63260,   0.00000, 0.00000, 0.20100);
	CreateDynamicObject(19791, 2310.58667, -1515.69995, 14.63260,   0.00000, 0.00000, 0.20100);
	CreateDynamicObject(19791, 2310.56665, -1525.70129, 14.63260,   0.00000, 0.00000, 0.20100);
	CreateDynamicObject(19791, 2310.58667, -1535.69995, 14.63260,   0.00000, 0.00000, 0.20100);
	CreateDynamicObject(19791, 2310.58667, -1545.69995, 14.63260,   0.00000, 0.00000, 0.20100);
	CreateDynamicObject(8581, 2294.63599, -1528.11401, 30.95190,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(8581, 2294.65967, -1528.10889, 30.93190,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(8581, 2283.95581, -1530.46667, 30.97190,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(8581, 2283.99023, -1530.45947, 30.93190,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(621, 2295.69116, -1549.05127, 22.58316,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(621, 2303.25464, -1546.98718, 20.38125,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2948, 2297.01294, -1510.59912, 25.85350,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2948, 2298.92529, -1510.58911, 25.85350,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(14469, 2282.78760, -1511.90234, 26.44890,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(14469, 2277.68579, -1511.59106, 26.44890,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3034, 2300.63574, -1510.56189, 31.77940,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(3034, 2288.03564, -1510.56189, 31.77940,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(3034, 2294.23560, -1510.56189, 31.77940,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(11245, 2297.49170, -1509.08801, 32.12990,   0.00000, -14.00000, 90.00000);
	CreateDynamicObject(3034, 2280.22168, -1512.91675, 31.77940,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(14469, 2329.98071, -1496.44055, 23.34250,   0.00000, 0.00000, 45.18060);
	CreateDynamicObject(19791, 2298.07788, -1540.33923, 26.05730,   0.00000, 0.00000, 0.20100);
	CreateDynamicObject(19791, 2288.07788, -1540.33923, 26.05730,   0.00000, 0.00000, 0.20100);
	CreateDynamicObject(19791, 2280.17798, -1540.33923, 26.04730,   0.00000, 0.00000, 0.20100);
	CreateDynamicObject(19791, 2298.07788, -1530.33923, 26.05730,   0.00000, 0.00000, 0.20100);
	CreateDynamicObject(19791, 2298.07788, -1520.33923, 26.05730,   0.00000, 0.00000, 0.20100);
	CreateDynamicObject(19791, 2288.07788, -1530.33923, 26.05730,   0.00000, 0.00000, 0.20100);
	CreateDynamicObject(19791, 2288.07788, -1520.33923, 26.05730,   0.00000, 0.00000, 0.20100);
	CreateDynamicObject(19791, 2280.17798, -1530.33923, 26.04730,   0.00000, 0.00000, 0.20100);
	CreateDynamicObject(19791, 2280.17798, -1520.33923, 26.04730,   0.00000, 0.00000, 0.20100);
	CreateDynamicObject(19791, 2290.70435, -1515.67468, 26.06730,   0.00000, 0.00000, 0.20100);
	CreateDynamicObject(1635, 2298.39600, -1546.23438, 32.79228,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1687, 2301.00879, -1513.10242, 35.72760,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1687, 2297.74756, -1513.13660, 35.72760,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1232, 2319.98535, -1507.09509, 28.30576,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1232, 2309.39136, -1507.09314, 28.30576,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1232, 2286.28760, -1507.06726, 28.30576,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1232, 2276.57129, -1507.26489, 28.30576,   0.00000, 0.00000, 0.00000);
	fd_wall[36] = CreateDynamicObject(19428, 2321.45898, -1548.51868, 23.16800,   0.00000, 0.00000, 0.00000, -1, -1, -1, 250.00, 250.00);
	fd_wall[37] = CreateDynamicObject(19428, 2321.45898, -1548.51868, 26.66840,   0.00000, 0.00000, 0.00000, -1, -1, -1, 250.00, 250.00);
	fd_wall[38] = CreateDynamicObject(19447, 2316.72412, -1549.23633, 26.66840,   0.00000, 0.00000, 90.00000, -1, -1, -1, 250.00, 250.00);
	fd_wall[39] = CreateDynamicObject(19428, 2321.45898, -1542.38269, 26.66840,   0.00000, 0.00000, 0.00000, -1, -1, -1, 250.00, 250.00);
	fd_wall[40] = CreateDynamicObject(19428, 2321.45898, -1542.38269, 23.16800,   0.00000, 0.00000, 0.00000, -1, -1, -1, 250.00, 250.00);
	fd_wall[41] = CreateDynamicObject(19447, 2316.72412, -1549.23633, 23.16800,   0.00000, 0.00000, 90.00000, -1, -1, -1, 250.00, 250.00);
	fd_wall[42] = CreateDynamicObject(19355, 2323.14160, -1541.67249, 26.66840,   0.00000, 0.00000, 90.00000, -1, -1, -1, 250.00, 250.00);
	fd_wall[43] = CreateDynamicObject(19355, 2323.14160, -1541.67249, 23.16800,   0.00000, 0.00000, 90.00000, -1, -1, -1, 250.00, 250.00);
	fd_wall[44] = CreateDynamicObject(19428, 2324.66064, -1540.78320, 26.66840,   0.00000, 0.00000, 0.00000, -1, -1, -1, 250.00, 250.00);
	fd_wall[45] = CreateDynamicObject(19428, 2324.66064, -1540.78320, 23.16800,   0.00000, 0.00000, 0.00000, -1, -1, -1, 250.00, 250.00);
	fd_wall[46] = CreateDynamicObject(19428, 2324.66064, -1534.64917, 26.66840,   0.00000, 0.00000, 0.00000, -1, -1, -1, 250.00, 250.00);
	fd_wall[47] = CreateDynamicObject(19428, 2324.66064, -1534.64917, 23.16800,   0.00000, 0.00000, 0.00000, -1, -1, -1, 250.00, 250.00);
	fd_wall[48] = CreateDynamicObject(19428, 2324.66064, -1528.51917, 26.66840,   0.00000, 0.00000, 0.00000, -1, -1, -1, 250.00, 250.00);
	fd_wall[49] = CreateDynamicObject(19428, 2324.66064, -1528.51917, 23.16800,   0.00000, 0.00000, 0.00000, -1, -1, -1, 250.00, 250.00);
	fd_wall[50] = CreateDynamicObject(19447, 2319.92700, -1519.89856, 26.66840,   0.00000, 0.00000, 90.00000, -1, -1, -1, 250.00, 250.00);
	fd_wall[51] = CreateDynamicObject(19355, 2324.66064, -1521.58447, 26.66840,   0.00000, 0.00000, 0.00000, -1, -1, -1, 250.00, 250.00);
	fd_wall[1] = CreateDynamicObject(19355, 2324.66064, -1521.58447, 23.16800,   0.00000, 0.00000, 0.00000, -1, -1, -1, 250.00, 250.00);
	fd_wall[2] = CreateDynamicObject(19447, 2319.92700, -1519.89856, 23.16800,   0.00000, 0.00000, 90.00000, -1, -1, -1, 250.00, 250.00);
	fd_wall[3] = CreateDynamicObject(19447, 2310.29688, -1549.23804, 26.66840,   0.00000, 0.00000, 90.00000, -1, -1, -1, 250.00, 250.00);
	fd_wall[4] = CreateDynamicObject(19447, 2310.29688, -1549.23804, 23.16800,   0.00000, 0.00000, 90.00000, -1, -1, -1, 250.00, 250.00);
	fd_wall[5] = CreateDynamicObject(19447, 2310.29688, -1519.89856, 26.66840,   0.00000, 0.00000, 90.00000, -1, -1, -1, 250.00, 250.00);
	fd_wall[6] = CreateDynamicObject(19447, 2310.29688, -1519.89856, 23.16800,   0.00000, 0.00000, 90.00000, -1, -1, -1, 250.00, 250.00);
	fd_wall[7] = CreateDynamicObject(19447, 2305.57520, -1544.34424, 26.66840,   0.00000, 0.00000, 0.00000, -1, -1, -1, 250.00, 250.00);
	fd_wall[8] = CreateDynamicObject(19447, 2305.57520, -1544.34424, 23.16800,   0.00000, 0.00000, 0.00000, -1, -1, -1, 250.00, 250.00);
	fd_wall[9] = CreateDynamicObject(19447, 2305.57593, -1534.71423, 26.66840,   0.00000, 0.00000, 0.00000, -1, -1, -1, 250.00, 250.00);
	fd_wall[10] = CreateDynamicObject(19447, 2305.57520, -1534.71423, 23.16800,   0.00000, 0.00000, 0.00000, -1, -1, -1, 250.00, 250.00);
	fd_wall[11] = CreateDynamicObject(19447, 2305.57593, -1525.08423, 26.66840,   0.00000, 0.00000, 0.00000, -1, -1, -1, 250.00, 250.00);
	fd_wall[12] = CreateDynamicObject(19447, 2305.57520, -1525.08423, 23.16800,   0.00000, 0.00000, 0.00000, -1, -1, -1, 250.00, 250.00);
	fd_wall[13] = CreateDynamicObject(19428, 2305.57690, -1520.67566, 23.16800,   0.00000, 0.00000, 0.00000, -1, -1, -1, 250.00, 250.00);
	fd_wall[14] = CreateDynamicObject(19428, 2305.57690, -1520.67566, 26.66840,   0.00000, 0.00000, 0.00000, -1, -1, -1, 250.00, 250.00);
	fd_wall[15] = CreateDynamicObject(19447, 2300.66699, -1519.89856, 30.16760,   0.00000, 0.00000, 90.00000, -1, -1, -1, 250.00, 250.00);
	fd_wall[16] = CreateDynamicObject(19447, 2300.66699, -1519.89856, 23.16800,   0.00000, 0.00000, 90.00000, -1, -1, -1, 250.00, 250.00);
	fd_wall[17] = CreateDynamicObject(19447, 2300.66699, -1519.89856, 26.66840,   0.00000, 0.00000, 90.00000, -1, -1, -1, 250.00, 250.00);
	fd_wall[18] = CreateDynamicObject(19447, 2305.57593, -1525.08423, 30.16760,   0.00000, 0.00000, 0.00000, -1, -1, -1, 250.00, 250.00);
	fd_wall[19] = CreateDynamicObject(19428, 2305.57690, -1520.67566, 30.16760,   0.00000, 0.00000, 0.00000, -1, -1, -1, 250.00, 250.00);
	fd_wall[20] = CreateDynamicObject(19447, 2305.57593, -1534.71423, 30.16760,   0.00000, 0.00000, 0.00000, -1, -1, -1, 250.00, 250.00);
	fd_wall[21] = CreateDynamicObject(19447, 2305.57520, -1544.34424, 30.16760,   0.00000, 0.00000, 0.00000, -1, -1, -1, 250.00, 250.00);
	fd_wall[22] = CreateDynamicObject(19447, 2310.29688, -1549.23804, 30.16760,   0.00000, 0.00000, 90.00000, -1, -1, -1, 250.00, 250.00);
	fd_wall[23] = CreateDynamicObject(19447, 2316.72412, -1549.23633, 30.16760,   0.00000, 0.00000, 90.00000, -1, -1, -1, 250.00, 250.00);
	fd_wall[24] = CreateDynamicObject(19447, 2310.29688, -1519.89856, 30.16760,   0.00000, 0.00000, 90.00000, -1, -1, -1, 250.00, 250.00);
	fd_wall[25] = CreateDynamicObject(19447, 2319.92700, -1519.89856, 30.16760,   0.00000, 0.00000, 90.00000, -1, -1, -1, 250.00, 250.00);
	fd_wall[26] = CreateDynamicObject(19447, 2324.66064, -1524.63086, 30.16760,   0.00000, 0.00000, 0.00000, -1, -1, -1, 250.00, 250.00);
	fd_wall[27] = CreateDynamicObject(19447, 2324.66064, -1534.26086, 30.16760,   0.00000, 0.00000, 0.00000, -1, -1, -1, 250.00, 250.00);
	fd_wall[28] = CreateDynamicObject(19355, 2324.67065, -1540.14746, 30.16760,   0.00000, 0.00000, 0.00000, -1, -1, -1, 250.00, 250.00);
	fd_wall[29] = CreateDynamicObject(19355, 2323.14160, -1541.67249, 30.16760,   0.00000, 0.00000, 90.00000, -1, -1, -1, 250.00, 250.00);
	fd_wall[30] = CreateDynamicObject(19355, 2321.45898, -1546.11389, 30.16760,   0.00000, 0.00000, 0.00000, -1, -1, -1, 250.00, 250.00);
	fd_wall[31] = CreateDynamicObject(19428, 2321.45898, -1548.51868, 30.16760,   0.00000, 0.00000, 0.00000, -1, -1, -1, 250.00, 250.00);
	fd_wall[32] = CreateDynamicObject(19355, 2321.46899, -1543.19385, 30.16760,   0.00000, 0.00000, 0.00000, -1, -1, -1, 250.00, 250.00);
	fd_wall[33] = CreateDynamicObject(19447, 2300.72168, -1545.56250, 26.66840,   0.00000, 0.00000, 90.00000, -1, -1, -1, 250.00, 250.00);
	fd_wall[34] = CreateDynamicObject(19447, 2300.72168, -1545.56250, 23.16800,   0.00000, 0.00000, 90.00000, -1, -1, -1, 250.00, 250.00);
	fd_wall[35] = CreateDynamicObject(19447, 2300.72168, -1545.56250, 30.16760,   0.00000, 0.00000, 90.00000, -1, -1, -1, 250.00, 250.00);
	CreateDynamicObject(1635, 2313.83496, -1549.91479, 29.24914,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1635, 2308.19507, -1549.91479, 29.24910,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19377, 2319.34521, -1524.79724, 31.83230,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19377, 2319.34521, -1536.78870, 31.83230,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19377, 2308.84521, -1524.79724, 31.83230,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19377, 2308.84521, -1536.78870, 31.83230,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19377, 2308.84521, -1530.85376, 31.85230,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19377, 2319.34521, -1530.85376, 31.85230,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19377, 2316.20996, -1544.38257, 31.85230,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19377, 2310.74683, -1544.39502, 31.84230,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19377, 2300.26099, -1540.75269, 31.84230,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(1687, 2313.67969, -1539.58594, 32.63800,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1687, 2313.67969, -1528.29187, 32.63803,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2653, 2313.88916, -1523.94604, 31.07910,   0.00000, 180.00000, 0.00000);
	CreateDynamicObject(2653, 2309.58057, -1534.14294, 31.07910,   0.00000, 180.00000, 90.00000);
	CreateDynamicObject(2653, 2313.89111, -1531.83008, 31.07910,   0.00000, 180.00000, 0.00000);
	CreateDynamicObject(2653, 2313.89111, -1539.69897, 31.07910,   0.00000, 180.00000, 0.00000);
	CreateDynamicObject(2653, 2313.88110, -1545.38000, 31.07910,   0.00000, 180.00000, 0.00000);
	CreateDynamicObject(2986, 2314.22070, -1534.18335, 30.35590,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1498, 2306.27686, -1519.97217, 24.62630,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1498, 2306.27686, -1519.87219, 24.62630,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1535, 2305.67065, -1534.95227, 24.62750,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2567, 2306.75439, -1546.52576, 26.49260,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2567, 2306.75439, -1541.18579, 26.49260,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1348, 2306.81421, -1538.14966, 25.30640,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19815, 2305.67407, -1530.04773, 26.35043,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19816, 2305.83667, -1532.14099, 24.88290,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19816, 2305.83667, -1532.32104, 24.88290,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19816, 2305.83667, -1532.50098, 24.88290,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19816, 2305.83667, -1532.68103, 24.88290,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19816, 2305.99658, -1532.60095, 24.88290,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19816, 2305.99658, -1532.40100, 24.88290,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19816, 2305.99658, -1532.22095, 24.88290,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19810, 2308.11328, -1519.80835, 25.96690,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1211, 2334.97778, -1506.10352, 23.49794,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1211, 2334.96191, -1552.42346, 23.49794,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1211, 2320.79199, -1491.60645, 23.29790,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1211, 2287.17798, -1491.61401, 22.48780,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1297, 2335.71387, -1518.95435, 26.26371,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1297, 2335.69067, -1534.75537, 26.26371,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1297, 2335.62891, -1550.61890, 26.26371,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(19430, 2312.20679, -1518.43408, 23.84390,   90.00000, 90.00000, 55.91340);
	CreateDynamicObject(19430, 2308.65869, -1518.46179, 23.84390,   90.00000, 90.00000, 55.91340);
	CreateDynamicObject(19430, 2315.57837, -1518.44092, 23.84390,   90.00000, 90.00000, 55.91340);
	CreateDynamicObject(19430, 2319.10620, -1518.41028, 23.84390,   90.00000, 90.00000, 55.91340);
	CreateDynamicObject(19430, 2322.70239, -1518.41040, 23.84390,   90.00000, 90.00000, 55.91340);
	CreateDynamicObject(19430, 2309.79956, -1516.78125, 23.83390,   90.00000, 90.00000, 55.91340);
	CreateDynamicObject(19430, 2313.28467, -1516.84106, 23.83390,   90.00000, 90.00000, 55.91340);
	CreateDynamicObject(19430, 2316.67578, -1516.82520, 23.83390,   90.00000, 90.00000, 55.91340);
	CreateDynamicObject(19430, 2320.18359, -1516.81641, 23.83390,   90.00000, 90.00000, 55.91340);
	CreateDynamicObject(19430, 2323.71069, -1516.92285, 23.83390,   90.00000, 90.00000, 55.91340);
	CreateDynamicObject(19865, 2329.81226, -1550.73352, 22.58390,   6.00000, 0.00000, 90.00000);
	CreateDynamicObject(19865, 2324.97241, -1550.73645, 22.90490,   2.00000, 0.00000, 90.00000);
	CreateDynamicObject(19865, 2320.03223, -1550.73450, 22.98490,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19865, 2315.03223, -1550.73450, 22.98490,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19865, 2310.03223, -1550.73450, 22.98490,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19865, 2305.03223, -1550.73450, 22.98490,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19865, 2300.06909, -1550.27942, 22.98490,   0.00000, 0.00000, 79.53068);
	//CreateDynamicObject(11453, 2330.52515, -1496.05225, 24.93609,   0.00000, 0.00000, 42.91982);
	CreateDynamicObject(8990, 2305.16675, -1511.45337, 25.22185,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(8990, 2304.09375, -1518.61133, 25.22190,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(8990, 2304.77881, -1518.87524, 24.91490,   0.00000, 0.00000, -90.00000);


	new fdst9sign = CreateDynamicObject(11453, 2330.52515, -1496.05225, 24.93609,   0.00000, 0.00000, 42.91982);
	SetDynamicObjectMaterialText(fdst9sign, 1, "{FFFFFF}PUTUSUHARTAWAN\nFIRE DEPARTMENT\n\n{8F6B00}-  Bot Pengawal SAYANG -\n\n\n\n\n\n\n", 140, "Arial", 48, 1, 0xFF800000, 0xFF0000FF, 1);


	/*
	for(new i=0; i < sizeof(fd_wall); i++)
	{

		SetDynamicObjectMaterial(fd_wall[i], 0, 8581, "vgsebuild02", "newall11-1");

	*/
	// mulai interior hospital
	// MD LV Interior paramedis



	CreateDynamicObject(18030, 1174.7900390625, -1343.57421875, 2424.4133300781, 0, 0, 0, .interiorid = 1);
	CreateDynamicObject(14466, 1214.5484619141, -1360.7130126953, 2432.2053222656, 0, 0, 270.5, .interiorid = 1);
	CreateDynamicObject(7191, 1191.828125, -1351.0107421875, 2421.6208496094, 0, 270, 0, .interiorid = 1);
	CreateDynamicObject(14782, 1187.7976074219, -1353.7375488281, 2423.0622558594, 0, 0, 90.5, .interiorid = 1);
	CreateDynamicObject(1523, 1190.55078125, -1350.01953125, 2422.2648925781, 0, 0, 180.24719238281, .interiorid = 1);
	CreateDynamicObject(18070, 1169.6414794922, -1345.1927490234, 2422.5458984375, 0, 0, 0, .interiorid = 1);
	CreateDynamicObject(4724, 1158.5886230469, -1353.6053466797, 2423.7512207031, 0, 0, 0.25, .interiorid = 1);
	CreateDynamicObject(2001, 1163.2530517578, -1355.927734375, 2422.0461425781, 0, 0, 0, .interiorid = 1);
	CreateDynamicObject(932, 1185.4672851563, -1355.8714599609, 2422.0461425781, 0, 0, 272.5, .interiorid = 1);
	CreateDynamicObject(932, 1183.7150878906, -1355.9479980469, 2422.0461425781, 0, 0, 272.49938964844, .interiorid = 1);
	CreateDynamicObject(932, 1182.11328125, -1355.9810791016, 2422.0461425781, 0, 0, 272.49938964844, .interiorid = 1);
	CreateDynamicObject(932, 1180.4866943359, -1355.9487304688, 2422.0461425781, 0, 0, 272.49938964844, .interiorid = 1);
	CreateDynamicObject(1557, 1168.1516113281, -1357.0413818359, 2422.0461425781, 0, 0, 359.5, .interiorid = 1);
	CreateDynamicObject(1557, 1171.1590576172, -1357.0489501953, 2422.0461425781, 0, 0, 180, .interiorid = 1);
	CreateDynamicObject(2596, 1156.7939453125, -1348.4765625, 2425.3452148438, 0, 0, 0, .interiorid = 1);
	CreateDynamicObject(2596, 1163.4686279297, -1354.6719970703, 2425.3083496094, 0, 0, 270.25, .interiorid = 1);
	CreateDynamicObject(2773, 1185.4097900391, -1354.6234130859, 2422.5634765625, 0, 0, 90.25, .interiorid = 1);
	CreateDynamicObject(2773, 1183.4921875, -1354.6352539063, 2422.5634765625, 0, 0, 90.247192382813, .interiorid = 1);
	CreateDynamicObject(2773, 1181.576171875, -1354.6499023438, 2422.5634765625, 0, 0, 90.247192382813, .interiorid = 1);
	CreateDynamicObject(2190, 1168.4984130859, -1346.9685058594, 2423.0561523438, 0, 0.25, 182.75, .interiorid = 1);
	CreateDynamicObject(2190, 1170.7844238281, -1346.9844970703, 2423.0561523438, 0, 0.2471923828125, 182.74658203125, .interiorid = 1);
	CreateDynamicObject(1663, 1170.712890625, -1345.3366699219, 2422.5063476563, 0, 0, 17.25, .interiorid = 1);
	CreateDynamicObject(1663, 1168.3572998047, -1345.3454589844, 2422.5063476563, 0, 0, 355.99853515625, .interiorid = 1);
	CreateDynamicObject(2894, 1169.7390136719, -1347.2918701172, 2423.0561523438, 0, 0, 0, .interiorid = 1);
	CreateDynamicObject(7930, 1189.5693359375, -1345.9460449219, 2423.5441894531, 90, 180.0054931640600549316406, 269.98352050781, .interiorid = 1);
	CreateDynamicObject(3962, 1156.3192138672, -1357.0517578125, 2424.2602539063, 0, 0, 268.5, .interiorid = 1);
	CreateDynamicObject(2257, 1152.9465332031, -1351.5755615234, 2424.3505859375, 0, 180, 89.999969482422, .interiorid = 1);
	CreateDynamicObject(2243, 1166.4963378906, -1348.0822753906, 2422.3195800781, 0, 0, 0, .interiorid = 1);
	CreateDynamicObject(2243, 1172.7916259766, -1347.9880371094, 2422.3195800781, 0, 0, 0, .interiorid = 1);
	CreateDynamicObject(2954, 1190.2352294922, -1346.0294189453, 2422.0461425781, 0, 0, 270.5, .interiorid = 1);
	CreateDynamicObject(1726, 1155.638671875, -1348.72265625, 2422.0461425781, 0, 0, 0.25, .interiorid = 1);
	CreateDynamicObject(1726, 1153.4948730469, -1352.5561523438, 2422.0461425781, 0, 0, 89.997192382813, .interiorid = 1);
	CreateDynamicObject(1726, 1157.3165283203, -1355.7957763672, 2422.0461425781, 0, 0, 179.99450683594, .interiorid = 1);
	CreateDynamicObject(1727, 1154.0897216797, -1354.7977294922, 2422.0461425781, 0, 0, 123, .interiorid = 1);
	CreateDynamicObject(1727, 1153.9633789063, -1349.6390380859, 2422.0461425781, 0, 0, 44.997436523438, .interiorid = 1);
	CreateDynamicObject(1727, 1162.5498046875, -1354.5593261719, 2422.0461425781, 0, 0, 220.99743652344, .interiorid = 1);
	CreateDynamicObject(7191, 1157.6741943359, -1339.1177978516, 2424.0207519531, 0, 0, 270, .interiorid = 1);
	CreateDynamicObject(7191, 1157.6701660156, -1338.3753662109, 2424.0207519531, 0, 0, 270, .interiorid = 1);
	CreateDynamicObject(1776, 1153.2979736328, -1343.3521728516, 2423.1455078125, 0, 0, 90.75, .interiorid = 1);
	CreateDynamicObject(1209, 1153.2958984375, -1346.2855224609, 2422.0461425781, 0, 0, 90.5, .interiorid = 1);
	CreateDynamicObject(7191, 1167.7000732422, -1313.4320068359, 2427.9807128906, 0, 0, 180, .interiorid = 1);
	CreateDynamicObject(7191, 1191.1739501953, -1335.5490722656, 2424.0207519531, 0, 0, 90, .interiorid = 1);
	CreateDynamicObject(7191, 1167.69921875, -1313.431640625, 2424.0207519531, 0, 0, 179.99450683594, .interiorid = 1);
	CreateDynamicObject(7191, 1191.173828125, -1335.548828125, 2427.9807128906, 0, 0, 90, .interiorid = 1);
	CreateDynamicObject(2603, 1154.3084716797, -1331.0260009766, 2422.4995117188, 0, 0, 0, .interiorid = 1);
	CreateDynamicObject(2603, 1157.8651123047, -1331.033203125, 2422.4995117188, 0, 0, 0, .interiorid = 1);
	CreateDynamicObject(2603, 1162.1901855469, -1330.9475097656, 2422.4995117188, 0, 0, 0, .interiorid = 1);
	CreateDynamicObject(2603, 1165.8120117188, -1330.8693847656, 2422.4995117188, 0, 0, 0, .interiorid = 1);
	CreateDynamicObject(2596, 1156.2908935547, -1337.9664306641, 2424.7763671875, 0, 0, 179.25, .interiorid = 1);
	CreateDynamicObject(2596, 1163.3677978516, -1337.9395751953, 2424.7763671875, 0, 0, 179.24743652344, .interiorid = 1);
	CreateDynamicObject(3383, 1175.9519042969, -1330.5677490234, 2422.0461425781, 0, 0, 179.75, .interiorid = 1);
	CreateDynamicObject(3383, 1183.3975830078, -1330.3992919922, 2422.0461425781, 0, 0, 179.74731445313, .interiorid = 1);
	CreateDynamicObject(3388, 1172.5631103516, -1329.8569335938, 2422.0461425781, 0, 0, 90.25, .interiorid = 1);
	CreateDynamicObject(3388, 1180.3153076172, -1329.8544921875, 2422.0461425781, 0, 0, 90.247192382813, .interiorid = 1);
	CreateDynamicObject(3394, 1184.6655273438, -1334.9022216797, 2422.0461425781, 0, 0, 269.75, .interiorid = 1);
	CreateDynamicObject(3394, 1175.7877197266, -1334.8275146484, 2422.0461425781, 0, 0, 269.74731445313, .interiorid = 1);
	
	
	// interior selesai

	// mapping untuk mechanic center map mechanic
	CreateDynamic3DTextLabel("Tulis /joinjob mechanic\nuntuk bekerja disini.\n /buycomponent (jumlah)", -1, 2141.9475,-1728.9771,13.5592, Float:5.0);
	// teks 3d di kantor mechanic center
	CreateVehicle(525,2171.1123,-1731.6053,13.6506,180.3974,1,1); // mobil tow trucknya mechanic
	//Objects////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	// ini untuk pintu garasi 1 yang bisa naik turun.
	PintuGarasiMechanic = CreateDynamicObject(10575, 2152.647216, -1735.895996, 17.400230, 0.000000, 85.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(PintuGarasiMechanic, 0, 9514, "711_sfw", "sw_sheddoor2", 0x00000000);
	
	tmpobjid = CreateDynamicObject(19447, 2168.206542, -1729.110839, 15.931400, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10370, "alleys_sfs", "ws_sandstone1", 0x00000000);
	
	DongkratMobilMechanic = CreateDynamicObject(19817, 2151.989501, -1729.435058, 11.610030, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(DongkratMobilMechanic, 0, 16640, "a51", "sm_conc_hatch", 0x00000000);
	
	tmpobjid = CreateDynamicObject(19447, 2168.206542, -1729.110839, 15.931400, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10370, "alleys_sfs", "ws_sandstone1", 0x00000000);
	tmpobjid = CreateDynamicObject(19447, 2163.476806, -1724.381713, 15.931400, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10370, "alleys_sfs", "ws_sandstone1", 0x00000000);
	tmpobjid = CreateDynamicObject(19447, 2153.843994, -1724.379028, 15.931400, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10370, "alleys_sfs", "ws_sandstone1", 0x00000000);
	tmpobjid = CreateDynamicObject(19447, 2144.230957, -1724.377197, 15.931400, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10370, "alleys_sfs", "ws_sandstone1", 0x00000000);
	tmpobjid = CreateDynamicObject(19447, 2139.482666, -1729.108642, 15.931409, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10370, "alleys_sfs", "ws_sandstone1", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 2144.620605, -1729.132568, 17.834899, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 7555, "bballcpark1", "ws_carparknew2a", 0x00000000);
	tmpobjid = CreateDynamicObject(19447, 2139.482666, -1729.108642, 12.434800, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicwall01", 0x00000000);
	tmpobjid = CreateDynamicObject(19447, 2144.211181, -1724.380371, 12.434800, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicwall01", 0x00000000);
	tmpobjid = CreateDynamicObject(19447, 2153.843994, -1724.379028, 12.434800, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicwall01", 0x00000000);
	tmpobjid = CreateDynamicObject(19447, 2163.476806, -1724.381713, 12.434800, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicwall01", 0x00000000);
	tmpobjid = CreateDynamicObject(19447, 2168.206542, -1729.110839, 12.434800, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicwall01", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 2155.146484, -1729.131103, 12.473299, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "ws_airpt_concrete", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 2163.042724, -1729.132202, 12.471300, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "ws_airpt_concrete", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 2144.645019, -1729.131103, 12.473299, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "ws_airpt_concrete", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 2155.115966, -1729.132324, 17.662900, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 7555, "bballcpark1", "ws_carparknew2a", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 2163.042724, -1729.132202, 17.664899, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 7555, "bballcpark1", "ws_carparknew2a", 0x00000000);
	tmpobjid = CreateDynamicObject(19385, 2141.176025, -1733.836791, 15.928831, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10370, "alleys_sfs", "ws_sandstone1", 0x00000000);
	tmpobjid = CreateDynamicObject(19360, 2144.386230, -1733.835449, 12.434800, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicwall01", 0x00000000);
	tmpobjid = CreateDynamicObject(19360, 2141.173095, -1727.103149, 12.434800, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicwall01", 0x00000000);
	tmpobjid = CreateDynamicObject(19360, 2144.381591, -1727.102539, 12.434800, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicwall01", 0x00000000);
	tmpobjid = CreateDynamicObject(19447, 2145.905517, -1729.103759, 12.434800, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicwall01", 0x00000000);
	tmpobjid = CreateDynamicObject(19360, 2141.173095, -1727.103149, 15.931400, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10370, "alleys_sfs", "ws_sandstone1", 0x00000000);
	tmpobjid = CreateDynamicObject(19360, 2144.381591, -1727.102539, 15.931400, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10370, "alleys_sfs", "ws_sandstone1", 0x00000000);
	tmpobjid = CreateDynamicObject(19447, 2145.905517, -1729.103759, 15.931400, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10370, "alleys_sfs", "ws_sandstone1", 0x00000000);
	tmpobjid = CreateDynamicObject(19360, 2144.386230, -1733.835449, 15.931400, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10370, "alleys_sfs", "ws_sandstone1", 0x00000000);
	tmpobjid = CreateDynamicObject(19385, 2141.176513, -1733.838623, 12.434800, 0.000000, 180.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicwall01", 0x00000000);
	tmpobjid = CreateDynamicObject(2010, 2145.364501, -1733.247192, 12.560310, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 4003, "cityhall_tr_lan", "foliage256", 0x00000000);
	tmpobjid = CreateDynamicObject(19385, 2141.176513, -1733.826660, 14.154040, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "plaintarmac1", 0x00000000);
	tmpobjid = CreateDynamicObject(19385, 2141.176513, -1733.836669, 15.153630, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "plaintarmac1", 0x00000000);
	tmpobjid = CreateDynamicObject(2010, 2139.927734, -1734.271484, 12.540390, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 4830, "airport2", "kbplanter_plants1", 0x00000000);
	tmpobjid = CreateDynamicObject(2010, 2142.472167, -1734.315429, 12.540390, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 4830, "airport2", "kbplanter_plants1", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 2151.109375, -1737.494750, 12.471300, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 1259, "billbrd", "ws_oldpainted2", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 2161.604980, -1737.495117, 12.471300, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 1259, "billbrd", "ws_oldpainted2", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 2163.025634, -1737.500488, 12.469300, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 1259, "billbrd", "ws_oldpainted2", 0x00000000);
	tmpobjid = CreateDynamicObject(19430, 2156.927978, -1733.856567, 15.931400, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10370, "alleys_sfs", "ws_sandstone1", 0x00000000);
	tmpobjid = CreateDynamicObject(10575, 2161.531005, -1735.855346, 17.400230, 0.000000, 85.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "sw_sheddoor2", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 2144.620605, -1729.132568, 17.662929, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 7555, "bballcpark1", "ws_carparknew2a", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 2155.115966, -1729.132324, 17.834899, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 7555, "bballcpark1", "ws_carparknew2a", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 2163.042724, -1729.132202, 17.832899, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 7555, "bballcpark1", "ws_carparknew2a", 0x00000000);
	tmpobjid = CreateDynamicObject(19360, 2147.588623, -1733.835327, 15.931400, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10370, "alleys_sfs", "ws_sandstone1", 0x00000000);
	tmpobjid = CreateDynamicObject(19360, 2166.588623, -1733.759033, 15.931400, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10370, "alleys_sfs", "ws_sandstone1", 0x00000000);
	tmpobjid = CreateDynamicObject(19430, 2157.268798, -1733.844604, 15.931400, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10370, "alleys_sfs", "ws_sandstone1", 0x00000000);
	tmpobjid = CreateDynamicObject(19360, 2147.588623, -1733.835327, 12.434800, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicwall01", 0x00000000);
	tmpobjid = CreateDynamicObject(19430, 2156.927978, -1733.856567, 12.434800, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicwall01", 0x00000000);
	tmpobjid = CreateDynamicObject(19430, 2157.268798, -1733.844604, 12.434800, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicwall01", 0x00000000);
	tmpobjid = CreateDynamicObject(19360, 2166.588623, -1733.759033, 12.434800, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicwall01", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 2144.666992, -1737.490722, 12.469300, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 1259, "billbrd", "ws_oldpainted2", 0x00000000);
	tmpobjid = CreateDynamicObject(19360, 2141.010253, -1732.116577, 16.234409, 0.000000, 90.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 7555, "bballcpark1", "ws_carparknew2a", 0x00000000);
	tmpobjid = CreateDynamicObject(19360, 2141.147705, -1728.883056, 16.234409, 0.000000, 90.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 7555, "bballcpark1", "ws_carparknew2a", 0x00000000);
	tmpobjid = CreateDynamicObject(19360, 2144.272460, -1728.881347, 16.234409, 0.000000, 90.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 7555, "bballcpark1", "ws_carparknew2a", 0x00000000);
	tmpobjid = CreateDynamicObject(19360, 2144.207275, -1732.064453, 16.234409, 0.000000, 90.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 7555, "bballcpark1", "ws_carparknew2a", 0x00000000);
	tmpobjid = CreateDynamicObject(19817, 2161.529296, -1729.669433, 11.610030, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "sm_conc_hatch", 0x00000000);
	tmpobjid = CreateDynamicObject(2311, 2166.181396, -1730.897827, 12.557000, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 12821, "alleystuff", "planks01", 0x00000000);
	tmpobjid = CreateDynamicObject(2258, 2147.924072, -1724.471679, 16.484579, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 16093, "a51_ext", "ws_controltowerwin1", 0x00000000);
	tmpobjid = CreateDynamicObject(2258, 2165.585937, -1724.487792, 16.484579, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 16093, "a51_ext", "ws_controltowerwin1", 0x00000000);
	tmpobjid = CreateDynamicObject(2258, 2156.776855, -1724.475341, 16.484579, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 16093, "a51_ext", "ws_controltowerwin1", 0x00000000);
	tmpobjid = CreateDynamicObject(2258, 2152.176269, -1724.476928, 16.484579, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 16093, "a51_ext", "ws_controltowerwin1", 0x00000000);
	tmpobjid = CreateDynamicObject(2258, 2160.958496, -1724.530029, 16.484579, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 16093, "a51_ext", "ws_controltowerwin1", 0x00000000);
	tmpobjid = CreateDynamicObject(3593, 2129.317871, -1729.180175, 13.049500, 0.000000, 0.000000, 40.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 7555, "bballcpark1", "ws_carparknew2a", 0x00000000);
	tmpobjid = CreateDynamicObject(1217, 2119.212890, -1735.429443, 12.928600, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 7555, "bballcpark1", "ws_carparknew2a", 0x00000000);
	tmpobjid = CreateDynamicObject(1217, 2118.037353, -1734.551269, 12.928600, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 7555, "bballcpark1", "ws_carparknew2a", 0x00000000);
	tmpobjid = CreateDynamicObject(1217, 2117.088867, -1735.041259, 12.928600, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 7555, "bballcpark1", "ws_carparknew2a", 0x00000000);
	tmpobjid = CreateDynamicObject(2670, 2118.684570, -1734.030395, 12.656399, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 7555, "bballcpark1", "ws_carparknew2a", 0x00000000);
	tmpobjid = CreateDynamicObject(1131, 2122.977783, -1736.179199, 12.553930, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 7555, "bballcpark1", "ws_carparknew2a", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 2144.199951, -1733.986083, 7.317242, 0.000000, 0.000000, 89.700035, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 2153.793701, -1734.036376, 7.317242, 0.000000, 0.000000, 89.700035, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 2163.479003, -1734.047607, 7.317242, 0.000000, 0.000000, 90.000030, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	tmpobjid = CreateDynamicObject(19903, 2154.089843, -1724.869750, 12.545200, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(11709, 2148.440917, -1724.942749, 13.191260, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1502, 2140.387939, -1733.875488, 12.399299, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1998, 2141.096435, -1728.682006, 12.559900, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1714, 2140.982421, -1727.591186, 12.560770, 0.000000, 0.000000, 358.290618, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1726, 2145.259277, -1730.364135, 12.560000, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2311, 2143.655517, -1732.210815, 12.560400, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1776, 2145.365478, -1727.871093, 13.670399, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2059, 2143.493896, -1731.047119, 13.090399, 0.000000, 0.000000, 52.666278, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2161, 2143.056396, -1727.196411, 12.558950, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1893, 2141.997802, -1728.335327, 16.649150, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1893, 2142.186767, -1732.242919, 16.649150, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19903, 2163.433837, -1724.933349, 12.545200, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1098, 2158.677978, -1724.900512, 13.037099, 0.000000, 0.000000, 280.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1728, 2167.683593, -1729.055541, 12.556799, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1487, 2166.414062, -1729.222778, 13.265500, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1487, 2166.350097, -1730.953002, 13.265500, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2823, 2166.286865, -1729.507690, 13.061249, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2860, 2166.117919, -1730.297119, 13.061200, 0.000000, 0.000000, 200.783340, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2670, 2166.031494, -1728.116088, 12.649399, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2670, 2157.192871, -1731.992553, 12.649399, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2670, 2166.522949, -1732.575195, 12.649399, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2670, 2147.671142, -1730.795410, 12.649399, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2671, 2148.262939, -1727.432495, 12.571100, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2671, 2156.388916, -1726.302612, 12.571100, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2671, 2162.434570, -1727.662353, 12.571100, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(3632, 2146.641113, -1726.681396, 12.961990, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(3632, 2146.365966, -1727.368408, 12.961990, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(3632, 2154.950439, -1724.961181, 12.961990, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19621, 2155.086181, -1725.144653, 13.531100, 0.000000, 0.000000, 231.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19899, 2156.797851, -1725.000488, 12.558699, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19899, 2167.624755, -1726.149291, 12.558699, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19900, 2146.435791, -1728.267456, 12.559880, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19900, 2159.250488, -1725.698120, 12.559900, 0.000000, 0.000000, 32.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19815, 2151.250976, -1724.455688, 14.981550, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19815, 2160.403564, -1724.478759, 14.981550, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19921, 2146.557373, -1729.212768, 12.643699, 0.000000, 0.000000, 32120.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19921, 2153.961425, -1728.156860, 12.643699, 0.000000, 0.000000, 32120.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1128, 2147.151367, -1731.377807, 12.560199, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1150, 2147.927734, -1729.616088, 12.566049, 0.000000, 0.000000, 6.122260, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1074, 2146.182373, -1730.443115, 13.040300, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1074, 2148.540771, -1733.557983, 13.040300, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1074, 2148.579345, -1732.554931, 12.669300, 0.000000, 270.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1010, 2152.832275, -1725.111938, 13.529939, 0.000000, 0.000000, 10.675700, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1008, 2159.128173, -1725.726806, 13.434889, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2551, 2157.119628, -1733.310058, 13.496100, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2585, 2146.123779, -1732.459594, 13.746100, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1001, 2165.400146, -1725.064331, 12.558090, 0.000000, 0.000000, 0.406040, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1000, 2165.444580, -1725.401367, 12.558190, 0.000000, 0.000000, 358.274200, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1003, 2165.370605, -1726.243896, 12.558219, 0.000000, 0.000000, 0.828570, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1010, 2167.499511, -1726.978149, 13.826359, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1078, 2166.945556, -1726.952026, 13.053899, 0.000000, -10.000000, 180.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1078, 2167.931152, -1728.040771, 13.053899, 0.000000, -10.000000, 180.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1078, 2166.124023, -1726.927368, 12.652899, 0.000000, 270.000000, 180.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2000, 2149.885009, -1724.937866, 12.561470, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2000, 2167.613769, -1732.305419, 12.558500, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19622, 2167.242187, -1733.562255, 13.265999, 10.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19622, 2157.890136, -1733.609863, 13.265999, 10.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19621, 2157.312255, -1733.511962, 15.097599, 0.000000, 0.000000, 120.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19621, 2156.908447, -1733.551635, 15.097599, 0.000000, 0.000000, 170.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19631, 2157.000488, -1733.525024, 14.700900, 0.000000, 90.000000, 80.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19627, 2157.239257, -1733.441650, 14.677599, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19627, 2157.024658, -1733.348632, 14.677599, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19627, 2156.978515, -1733.446411, 14.677599, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19627, 2157.405029, -1733.350830, 14.677599, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19832, 2157.364257, -1733.569213, 14.316880, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19832, 2156.891113, -1733.480712, 14.316900, 0.000000, 0.000000, 30.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19917, 2161.536621, -1725.575927, 12.558329, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(18633, 2157.216064, -1733.516723, 13.984999, 0.000000, 90.000000, 80.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19627, 2157.344970, -1733.352172, 13.985600, 0.000000, 0.000000, -353.055297, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(18635, 2157.146240, -1733.606079, 13.609700, 90.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(18635, 2157.094970, -1733.469482, 13.609700, 90.000000, 90.000000, 20.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(18634, 2156.690429, -1733.565307, 13.646599, 0.000000, 90.000000, -50.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1893, 2150.796386, -1729.450805, 17.868000, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1893, 2163.750976, -1729.825439, 17.868000, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1893, 2159.770751, -1729.762451, 17.868000, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1893, 2155.130371, -1729.742675, 17.868000, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1412, 2126.665771, -1722.637451, 13.703700, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1412, 2121.414062, -1722.636962, 13.703700, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1412, 2116.149658, -1722.638671, 13.703700, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1412, 2112.625732, -1725.110473, 13.703700, 0.000000, 0.000000, 70.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1412, 2110.822753, -1730.064086, 13.703700, 0.000000, 0.000000, 70.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1412, 2109.022705, -1735.007202, 13.703700, 0.000000, 0.000000, 70.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1412, 2107.830810, -1738.276855, 13.703700, 0.000000, 0.000000, 70.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1412, 2109.602050, -1740.739990, 13.703700, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1412, 2114.872314, -1740.741333, 13.703700, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1412, 2120.131591, -1740.742675, 13.703700, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1412, 2125.393310, -1740.742797, 13.703700, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1358, 2116.105957, -1726.113281, 13.749990, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(3594, 2111.832519, -1736.207519, 13.245900, 0.000000, 0.000000, 10.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(3594, 2124.127685, -1727.443847, 13.245900, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(3594, 2133.152343, -1727.213256, 13.245900, 0.000000, 0.000000, 30.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(3593, 2117.541503, -1736.943725, 13.049500, 0.000000, 0.000000, 80.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1217, 2118.331542, -1724.575805, 12.928600, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1217, 2118.718261, -1726.025146, 12.928600, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(918, 2125.353515, -1730.581542, 12.860400, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(918, 2125.953125, -1730.394531, 12.860400, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(918, 2156.983642, -1725.919311, 12.860400, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(918, 2147.071044, -1728.924804, 12.860400, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1222, 2122.052734, -1738.390380, 13.060190, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1222, 2131.304687, -1728.077636, 13.060190, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1222, 2132.714355, -1730.134155, 13.060190, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2670, 2124.145263, -1738.783325, 12.656399, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2670, 2126.290039, -1729.016967, 12.656399, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2671, 2109.642333, -1738.470336, 12.567099, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2671, 2120.514892, -1726.805541, 12.567099, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2671, 2113.870117, -1734.545654, 12.567099, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2671, 2127.554199, -1730.345581, 12.567099, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1299, 2113.688964, -1730.012207, 12.942350, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1327, 2135.805908, -1726.530639, 13.326390, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1149, 2116.847900, -1729.071044, 12.539859, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1149, 2114.875732, -1738.593750, 12.539859, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1226, 2114.081298, -1724.468139, 16.302299, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1226, 2135.712158, -1724.377319, 16.302299, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1226, 2108.739501, -1740.063598, 16.302299, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1226, 2114.081298, -1724.468139, 16.302299, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1226, 2135.712158, -1724.377319, 16.302299, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1226, 2108.739501, -1740.063598, 16.302299, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00);
	PeneranganMobilMechanic = CreateDynamicObject(1215, 2156.474121, -1734.285278, 12.558380, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1215, 2157.697021, -1734.286254, 12.558380, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);

	// map mechanic center selesai
	// interior FBI katanya

	//---------------FBI HQ Interior--------------------//
 	CreateDynamicObject(1536,293.27246094,-1481.46582031,-34.53342056,0.00000000,0.00000000,179.99450684,1324123, .interiorid = 1); //object(gen_doorext15) (2)
	CreateDynamicObject(1536,290.27832031,-1481.50488281,-34.53342056,0.00000000,0.00000000,0.00000000,1324123, .interiorid = 1); //object(gen_doorext15) (2)
	CreateDynamicObject(1776,291.19232178,-1512.44006348,-45.03078842,0.00000000,0.00000000,90.00000000,1324123, .interiorid = 1); //object(cj_candyvendor) (2)
	FBILobbyLeftBTN[0] = CreateButton(297.66613770,-1498.67749023,-44.59006119,0.79565430); //Lobby Button Left
	FBILobbyLeftBTN[1] = CreateButton(297.24850464,-1498.23107910,-44.59006119,180); //Lobby Button Left
	FBILobbyRightBTN[0] = CreateButton(300.05300903,-1521.40747070,-44.59006119,180); //Lobby Button Right
	FBILobbyRightBTN[1] = CreateButton(300.16033936,-1521.84387207,-44.59006119,0); //Lobby Button Right
	FBIPrivateBTN[0] = CreateButton(298.87384033,-1495.87316895,-27.32773209,270); //Private Office Button
	FBIPrivateBTN[1] = CreateButton(300.49453735,-1495.33837891,-27.28091812,180.49487305); //Private Office Button

	CreateDynamicObject(2886,297.66613770,-1498.67749023,-44.59006119,0,0,0.79565430, 1324123); //Lobby Button Left
	CreateDynamicObject(2886,297.24850464,-1498.23107910,-44.59006119,0,0,180, 1324123); //Lobby Button Left
	CreateDynamicObject(2886,300.05300903,-1521.40747070,-44.59006119,0,0,180, 1324123); //Lobby Button Right
	CreateDynamicObject(2886,300.16033936,-1521.84387207,-44.59006119,0,0,0, 1324123); //Lobby Button Right
	CreateDynamicObject(2886,298.87384033,-1495.87316895,-27.32773209,0,0,270, 1324123); //Private Office Button
	CreateDynamicObject(2886,300.49453735,-1495.33837891,-27.28091812,0,0,180.49487305, 1324123); //Private Office Button

	FBIPrivate[0] = CreateDynamicObject(1536,299.29986572,-1492.82666016,-28.73300552,0.00000000,0.00000000,270.00000000,1324123, .interiorid = 1); //Private Office Door Left
	FBIPrivate[1] = CreateDynamicObject(1536,299.33737183,-1495.83911133,-28.73300552,0.00000000,0.00000000,90.00000000,1324123, .interiorid = 1); //Private Office Door Right
	FBILobbyLeft = CreateDynamicObject(1536,295.40136719,-1498.43457031,-46.13965225,0.00000000,0.00000000,0.00000000,1324123, .interiorid = 1); //Lobby Door Left
	FBILobbyRight = CreateDynamicObject(1536,302.39355469,-1521.62988281,-46.13965225,0.00000000,0.00000000,179.99450684,1324123, .interiorid = 1); //Lobby Door Right

	CreateDynamicObject(1536,281.51000977,-1513.26867676,23.89100075,0.00000000,0.00000000,55.00000000); // Door in FBI garage

	CreateDynamicObject(14858,309.24609375,-1498.32812500,-29.38235855,0.00000000,0.00000000,270.00000000, .interiorid = 1); //object(veg_pol_main1) (1)
	CreateDynamicObject(14596,294.02929688,-1490.56835938,-35.43539047,0.00000000,0.00000000,179.99450684, .interiorid = 1); //object(paperchase_stairs) (1)
	CreateDynamicObject(14602,291.64355469,-1505.73730469,-40.76299286,0.00000000,0.00000000,179.99450684, .interiorid = 1); //object(paperchase01) (1)
	CreateDynamicObject(14593,308.32128906,-1535.68750000,-43.80562592,0.00000000,0.00000000,179.99450684, .interiorid = 1); //object(paperchase04) (1)
	CreateDynamicObject(8231,308.96191406,-1496.32617188,-38.62692261,0.00000000,0.00000000,90.00000000, .interiorid = 1); //object(vgsbikeschl05) (1)
	CreateDynamicObject(2395,300.22045898,-1490.45019531,-40.34618378,0.00000000,0.00000000,270.00000000, .interiorid = 1); //object(cj_sports_wall) (1)
	CreateDynamicObject(2395,300.22143555,-1495.39575195,-40.34618378,0.00000000,0.00000000,270.00000000, .interiorid = 1); //object(cj_sports_wall) (2)
	CreateDynamicObject(2395,300.21777344,-1492.38110352,-38.05657196,0.00000000,0.00000000,270.00000000, .interiorid = 1); //object(cj_sports_wall) (3)
	CreateDynamicObject(1523,300.42980957,-1495.13427734,-40.51028061,0.00000000,0.00000000,90.00000000, .interiorid = 1); //object(gen_doorext10) (2)
	CreateDynamicObject(1491,317.16406250,-1489.74243164,-40.33905029,0.00000000,0.00000000,179.99450684, .interiorid = 1); //object(gen_doorint01) (3)
	CreateDynamicObject(18001,300.45489502,-1489.20227051,-38.69902802,0.00000000,0.00000000,90.00000000, .interiorid = 1); //object(int_barbera07) (2)
	CreateDynamicObject(8169,300.41653442,-1489.28137207,-37.95204163,73.49853516,270.00000000,179.99450684, .interiorid = 1); //object(vgs_guardhseflr) (2)
	CreateDynamicObject(2197,300.78768921,-1490.73352051,-40.85678101,90.00000000,0.00000000,0.00000000, .interiorid = 1); //object(filling_cabinet) (1)
	CreateDynamicObject(2197,300.78659058,-1489.06945801,-40.85678101,90.00000000,0.00000000,0.00000000, .interiorid = 1); //object(filling_cabinet) (2)
	CreateDynamicObject(2197,300.78652954,-1487.39941406,-40.85678101,90.00000000,0.00000000,0.00000000, .interiorid = 1); //object(filling_cabinet) (3)
	CreateDynamicObject(2515,300.82122803,-1491.78662109,-39.25311279,0.00000000,0.00000000,90.00000000, .interiorid = 1); //object(cj_bs_sink) (1)
	CreateDynamicObject(2515,300.81488037,-1490.82836914,-39.25311279,0.00000000,0.00000000,90.00000000, .interiorid = 1); //object(cj_bs_sink) (1)
	CreateDynamicObject(2515,300.80892944,-1489.84216309,-39.25311279,0.00000000,0.00000000,90.00000000, .interiorid = 1); //object(cj_bs_sink) (1)
	CreateDynamicObject(2515,300.80908203,-1488.83654785,-39.25311279,0.00000000,0.00000000,90.00000000, .interiorid = 1); //object(cj_bs_sink) (1)
	CreateDynamicObject(2738,313.09997559,-1491.99609375,-39.72719574,0.00000000,0.00000000,90.00000000, .interiorid = 1); //object(cj_toilet_bs) (2)
	CreateDynamicObject(2957,314.01480103,-1489.76110840,-38.71026230,0.00000000,90.00000000,0.31311035, .interiorid = 1); //object(chinatgaragedoor) (2)
	CreateDynamicObject(2957,312.46731567,-1491.96643066,-38.71386337,0.00000000,0.00000000,90.00000000, .interiorid = 1); //object(chinatgaragedoor) (3)
	CreateDynamicObject(2957,312.46868896,-1491.96606445,-38.47619247,0.00000000,0.00000000,90.00000000, .interiorid = 1); //object(chinatgaragedoor) (4)
	CreateDynamicObject(2957,318.77011108,-1489.75573730,-38.71026230,0.00000000,90.00000000,0.00000000, .interiorid = 1); //object(chinatgaragedoor) (5)
	CreateDynamicObject(2957,317.91894531,-1489.73242188,-36.22134018,0.00000000,0.00000000,179.99450684, .interiorid = 1); //object(chinatgaragedoor) (6)
	CreateDynamicObject(2602,310.02233887,-1498.55773926,-39.60855103,0.00000000,0.00000000,225.12634277, .interiorid = 1); //object(police_cell_toilet) (1)
	CreateDynamicObject(2602,311.27764893,-1498.55688477,-39.60855103,0.00000000,0.00000000,225.12084961, .interiorid = 1); //object(police_cell_toilet) (2)
	CreateDynamicObject(2602,312.52236938,-1498.55688477,-39.60855103,0.00000000,0.00000000,225.12084961, .interiorid = 1); //object(police_cell_toilet) (3)
	CreateDynamicObject(2741,300.51300049,-1487.71777344,-38.53912735,0.00000000,0.00000000,90.19226074, .interiorid = 1); //object(cj_soap_disp) (1)
	CreateDynamicObject(2742,300.63558960,-1493.05334473,-38.75522995,0.00000000,0.00000000,90.00000000, .interiorid = 1); //object(cj_handdrier) (1)
	CreateDynamicObject(2685,300.49490356,-1495.37646484,-38.65332794,0.00000000,0.00000000,90.04394531, .interiorid = 1); //object(cj_food_post1) (1)
	CreateDynamicObject(1522,276.98992920,-1506.53881836,-46.13738251,0.00000000,0.00000000,90.00000000, .interiorid = 1); //object(gen_doorshop3) (1)
	CreateDynamicObject(3798,301.63208008,-1521.53662109,-48.13918304,0.00000000,0.00000000,0.00000000, .interiorid = 1); //object(acbox3_sfs) (1)
	CreateDynamicObject(14420,301.31414795,-1504.62548828,-25.47793198,0.00000000,0.00000000,270.00000000, .interiorid = 1); //object(madddoggs09) (1)
	CreateDynamicObject(2395,296.75616455,-1490.17004395,-28.86031342,0.00000000,0.00000000,0.00000000, .interiorid = 1); //object(cj_sports_wall) (1)
	CreateDynamicObject(2395,299.82714844,-1492.76855469,-28.86031342,0.00000000,0.00000000,90.00000000, .interiorid = 1); //object(cj_sports_wall) (1)
	CreateDynamicObject(2952,299.73284912,-1476.11962891,-28.81253433,0.00000000,0.00000000,0.00000000, .interiorid = 1); //object(kmb_gimpdoor) (1)
	CreateDynamicObject(2952,299.73013306,-1473.99279785,-28.81253433,0.00000000,0.00000000,0.00000000, .interiorid = 1); //object(kmb_gimpdoor) (2)
	CreateDynamicObject(10558,307.77490234,-1490.10229492,-26.71455383,0.00000000,0.00000000,270.00000000, .interiorid = 1); //object(tbnsfs) (4)
	CreateDynamicObject(10558,303.61007690,-1474.12097168,-26.71455383,0.00000000,0.00000000,270.00000000, .interiorid = 1); //object(tbnsfs) (5)
	CreateDynamicObject(12814,313.29492188,-1478.75097656,-28.73871231,0.00000000,0.00000000,179.99450684, .interiorid = 1); //object(cuntyeland04) (1)
	CreateDynamicObject(12814,313.79980469,-1473.21289062,-34.54065323,0.00000000,0.00000000,0.00000000, .interiorid = 1); //object(cuntyeland04) (2)
	CreateDynamicObject(5066,310.43295288,-1484.74877930,-33.05167389,0.00000000,0.00000000,180.00000000, .interiorid = 1); //object(mondoshave_las) (1)
	CreateDynamicObject(14598,303.44128418,-1505.88110352,-30.57250977,0.00000000,0.00000000,179.99450684, .interiorid = 1); //object(paperchase_glass) (1)
	CreateDynamicObject(2395,305.25082397,-1489.78857422,-28.86031342,0.00000000,0.00000000,180.00000000, .interiorid = 1); //object(cj_sports_wall) (1)
	CreateDynamicObject(2395,301.95947266,-1490.32165527,-28.86031342,0.00000000,0.00000000,270.00000000, .interiorid = 1); //object(cj_sports_wall) (1)
	CreateDynamicObject(2395,301.95996094,-1494.03027344,-28.86031342,0.00000000,0.00000000,270.00000000, .interiorid = 1); //object(cj_sports_wall) (1)
	CreateDynamicObject(2395,303.02163696,-1495.31762695,-28.86031342,0.00000000,0.00000000,180.00000000, .interiorid = 1); //object(cj_sports_wall) (1)
	CreateDynamicObject(10558,299.79708862,-1485.71166992,-26.71455383,0.00000000,0.00000000,0.00000000, .interiorid = 1); //object(tbnsfs) (5)
	CreateDynamicObject(10558,299.79199219,-1477.44433594,-26.71455383,0.00000000,0.00000000,0.00000000, .interiorid = 1); //object(tbnsfs) (5)
	CreateDynamicObject(10558,308.07742310,-1477.47680664,-26.71455383,0.00000000,0.00000000,0.00000000, .interiorid = 1); //object(tbnsfs) (5)
	CreateDynamicObject(10558,308.07962036,-1485.49145508,-26.71455383,0.00000000,0.00000000,0.00000000, .interiorid = 1); //object(tbnsfs) (5)
	CreateDynamicObject(2395,303.70001221,-1495.32324219,-34.54189301,0.00000000,0.00000000,179.99450684, .interiorid = 1); //object(cj_sports_wall) (1)
	CreateDynamicObject(2395,303.47012329,-1481.95263672,-34.54189301,0.00000000,0.00000000,270.00000000, .interiorid = 1); //object(cj_sports_wall) (1)
	CreateDynamicObject(2395,303.47064209,-1485.67785645,-34.54189301,0.00000000,0.00000000,270.00000000, .interiorid = 1); //object(cj_sports_wall) (1)
	CreateDynamicObject(2395,303.47103882,-1489.40173340,-34.54189301,0.00000000,0.00000000,270.00000000, .interiorid = 1); //object(cj_sports_wall) (1)
	CreateDynamicObject(2395,303.47222900,-1493.12512207,-34.54189301,0.00000000,0.00000000,270.00000000, .interiorid = 1); //object(cj_sports_wall) (1)
	CreateDynamicObject(2395,300.50918579,-1485.34570312,-34.54189301,0.00000000,0.00000000,90.00000000, .interiorid = 1); //object(cj_sports_wall) (1)
	CreateDynamicObject(2395,300.50698853,-1489.05407715,-34.54189301,0.00000000,0.00000000,90.00000000, .interiorid = 1); //object(cj_sports_wall) (1)
	CreateDynamicObject(2395,300.50997925,-1492.77001953,-34.54189301,0.00000000,0.00000000,90.00000000, .interiorid = 1); //object(cj_sports_wall) (1)
	CreateDynamicObject(2395,300.50823975,-1484.68981934,-34.54189301,0.00000000,0.00000000,90.00000000, .interiorid = 1); //object(cj_sports_wall) (1)
	CreateDynamicObject(14782,309.60202026,-1543.15441895,-45.20714951,0.00000000,0.00000000,90.00000000, .interiorid = 1); //object(int3int_boxing30) (1)
	CreateDynamicObject(14782,309.58764648,-1536.19519043,-45.20714951,0.00000000,0.00000000,90.00000000, .interiorid = 1); //object(int3int_boxing30) (2)
	CreateDynamicObject(1827,305.07128906,-1533.61816406,-46.13375092,0.00000000,0.00000000,0.00000000, .interiorid = 1); //object(man_sdr_tables) (1)
	CreateDynamicObject(1811,304.16955566,-1531.93151855,-45.50744629,0.00000000,0.00000000,117.60995483, .interiorid = 1); //object(med_din_chair_5) (1)
	CreateDynamicObject(1811,305.66729736,-1531.85888672,-45.50744629,0.00000000,0.00000000,69.65365601, .interiorid = 1); //object(med_din_chair_5) (2)
	CreateDynamicObject(16000,309.58935547,-1500.71423340,-26.22244644,270.00000000,0.00000000,90.00000000, .interiorid = 1); //object(drvin_screen) (1)
	CreateDynamicObject(16000,310.02539062,-1492.14257812,-31.78104019,270.00000000,0.00000000,90.00000000, .interiorid = 1); //object(drvin_screen) (2)
	CreateDynamicObject(2395,309.09744263,-1546.07031250,-46.13375092,0.00000000,0.00000000,90.00000000, .interiorid = 1); //object(cj_sports_wall) (19)
	CreateDynamicObject(2395,309.09747314,-1542.33789062,-46.13375092,0.00000000,0.00000000,90.00000000, .interiorid = 1); //object(cj_sports_wall) (20)
	CreateDynamicObject(2395,309.09802246,-1538.61096191,-46.13375092,0.00000000,0.00000000,90.00000000, .interiorid = 1); //object(cj_sports_wall) (21)
	CreateDynamicObject(2395,309.09780884,-1534.87768555,-46.13375092,0.00000000,0.00000000,90.00000000, .interiorid = 1); //object(cj_sports_wall) (22)
	CreateDynamicObject(2395,309.09716797,-1534.07751465,-46.13375092,0.00000000,0.00000000,90.00000000, .interiorid = 1); //object(cj_sports_wall) (23)
	CreateDynamicObject(2395,308.94421387,-1531.32495117,-46.13555145,0.00000000,0.00000000,270.00000000, .interiorid = 1); //object(cj_sports_wall) (24)
	CreateDynamicObject(2395,308.94485474,-1535.05346680,-46.13555145,0.00000000,0.00000000,270.00000000, .interiorid = 1); //object(cj_sports_wall) (25)
	CreateDynamicObject(2395,308.94528198,-1538.78503418,-46.13555145,0.00000000,0.00000000,270.00000000, .interiorid = 1); //object(cj_sports_wall) (26)
	CreateDynamicObject(2395,308.94180298,-1542.47778320,-46.13555145,0.00000000,0.00000000,270.00000000, .interiorid = 1); //object(cj_sports_wall) (27)
	CreateDynamicObject(2395,308.94659424,-1543.31518555,-46.13555145,0.00000000,0.00000000,270.00000000, .interiorid = 1); //object(cj_sports_wall) (28)
	CreateDynamicObject(1432,307.47851562,-1544.94921875,-46.13375092,0.00000000,0.00000000,350.07385254, .interiorid = 1); //object(dyn_table_2) (1)
	CreateDynamicObject(1703,297.30395508,-1520.81726074,-46.12367630,0.00000000,0.00000000,180.00000000, .interiorid = 1); //object(kb_couch02) (1)
	CreateDynamicObject(1703,298.31497192,-1517.79614258,-46.12367630,0.00000000,0.00000000,270.00000000, .interiorid = 1); //object(kb_couch02) (2)
	CreateDynamicObject(2725,298.29296875,-1520.72167969,-45.69048691,0.00000000,0.00000000,0.00000000, .interiorid = 1); //object(lm_striptable) (1)
	CreateDynamicObject(1806,309.10546875,-1505.52636719,-46.12367630,0.00000000,0.00000000,105.87994385, .interiorid = 1); //object(med_office_chair) (1)
	CreateDynamicObject(2190,307.29687500,-1506.07812500,-45.40361786,0.00000000,0.00000000,104.99633789, .interiorid = 1); //object(pc_1) (1)
	CreateDynamicObject(1892,278.57611084,-1506.30029297,-46.13018036,0.00000000,0.00000000,90.00000000, .interiorid = 1); //object(security_gatsh) (1)
	CreateDynamicObject(2773,304.49935913,-1504.94628906,-45.61295319,0.00000000,0.00000000,90.00000000, .interiorid = 1); //object(cj_airprt_bar) (1)
	CreateDynamicObject(2773,304.50588989,-1506.51086426,-45.61295319,0.00000000,0.00000000,90.00000000, .interiorid = 1); //object(cj_airprt_bar) (2)
	CreateDynamicObject(2773,302.58798218,-1506.51135254,-45.61295319,0.00000000,0.00000000,90.00000000, .interiorid = 1); //object(cj_airprt_bar) (3)
	CreateDynamicObject(2773,303.51632690,-1503.98291016,-45.61295319,0.00000000,0.00000000,0.00000000, .interiorid = 1); //object(cj_airprt_bar) (4)
	CreateDynamicObject(2773,302.57733154,-1503.02441406,-45.61295319,0.00000000,0.00000000,90.00000000, .interiorid = 1); //object(cj_airprt_bar) (5)
	CreateDynamicObject(2773,301.60446167,-1505.54931641,-45.61295319,0.00000000,0.00000000,0.00000000, .interiorid = 1); //object(cj_airprt_bar) (6)
	CreateDynamicObject(2773,300.64788818,-1503.04052734,-45.61295319,0.00000000,0.00000000,90.00000000, .interiorid = 1); //object(cj_airprt_bar) (7)
	CreateDynamicObject(2773,299.66088867,-1503.99853516,-45.61295319,0.00000000,0.00000000,0.00000000, .interiorid = 1); //object(cj_airprt_bar) (8)
	CreateDynamicObject(2773,298.72500610,-1504.95776367,-45.61115265,0.00000000,0.00000000,90.00000000, .interiorid = 1); //object(cj_airprt_bar) (9)
	CreateDynamicObject(2773,300.66802979,-1506.51232910,-45.61115265,0.00000000,0.00000000,90.00000000, .interiorid = 1); //object(cj_airprt_bar) (10)
	CreateDynamicObject(2773,298.75299072,-1506.51000977,-45.61295319,0.00000000,0.00000000,90.00000000, .interiorid = 1); //object(cj_airprt_bar) (11)
	CreateDynamicObject(12814,309.92465210,-1460.12158203,-34.53705215,0.00000000,0.00000000,0.00000000, .interiorid = 1); //object(cuntyeland04) (2)
	CreateDynamicObject(8169,304.51583862,-1444.51806641,-32.52923965,107.00000000,90.00000000,180.00000000, .interiorid = 1); //object(vgs_guardhseflr) (1)
	CreateDynamicObject(8169,304.51293945,-1449.76049805,-32.52923965,106.99584961,90.00000000,179.99450684, .interiorid = 1); //object(vgs_guardhseflr) (3)
	CreateDynamicObject(8169,313.10473633,-1444.55773926,-32.52923965,106.99588013,90.00000000,0.00000000, .interiorid = 1); //object(vgs_guardhseflr) (4)
	CreateDynamicObject(8169,313.10540771,-1449.97326660,-32.52923965,106.99584961,90.00000000,0.00000000, .interiorid = 1); //object(vgs_guardhseflr) (5)
	CreateDynamicObject(8169,301.08428955,-1441.09985352,-32.52923965,106.99588013,90.00000000,270.00000000, .interiorid = 1); //object(vgs_guardhseflr) (7)
	CreateDynamicObject(8169,300.08203125,-1441.09960938,-32.52923965,106.99584961,90.00000000,270.00000000, .interiorid = 1); //object(vgs_guardhseflr) (8)
	CreateDynamicObject(8169,316.52737427,-1441.10034180,-32.52923965,106.99588013,90.00000000,270.00000000, .interiorid = 1); //object(vgs_guardhseflr) (9)
	CreateDynamicObject(8169,319.76895142,-1441.10217285,-32.52923965,106.99584961,90.00000000,270.00000000, .interiorid = 1); //object(vgs_guardhseflr) (10)
	CreateDynamicObject(8169,321.71502686,-1444.51538086,-32.52923965,106.99584961,90.00000000,179.99450684, .interiorid = 1); //object(vgs_guardhseflr) (11)
	CreateDynamicObject(8169,321.71609497,-1451.29589844,-32.52923965,106.99584961,90.00000000,179.99450684, .interiorid = 1); //object(vgs_guardhseflr) (12)
	CreateDynamicObject(8169,296.79656982,-1444.37243652,-32.52923965,106.99584961,90.00000000,0.00000000, .interiorid = 1); //object(vgs_guardhseflr) (13)
	CreateDynamicObject(8169,296.80148315,-1451.28527832,-32.52923965,106.99584961,90.00000000,0.00000000, .interiorid = 1); //object(vgs_guardhseflr) (14)
	CreateDynamicObject(14856,309.25753784,-1451.73974609,-32.65511322,0.00000000,0.00000000,270.00000000, .interiorid = 1); //object(cellsa) (1)
	CreateDynamicObject(8169,314.25317383,-1444.62646484,-32.52923965,106.99588013,90.00000000,90.00000000, .interiorid = 1); //object(vgs_guardhseflr) (15)
	CreateDynamicObject(8169,304.31835938,-1444.62304688,-32.52923965,106.99584961,90.00000000,90.00000000, .interiorid = 1); //object(vgs_guardhseflr) (16)
	CreateDynamicObject(2957,308.80404663,-1453.56689453,-32.47067261,0.00000000,90.00000000,0.00000000, .interiorid = 1); //object(chinatgaragedoor) (1)
	CreateDynamicObject(2957,305.55273438,-1453.56542969,-30.41305542,0.00000000,0.00000000,0.00000000, .interiorid = 1); //object(chinatgaragedoor) (7)
	CreateDynamicObject(2957,311.57226562,-1453.56542969,-30.41333008,0.00000000,0.00000000,0.00000000, .interiorid = 1); //object(chinatgaragedoor) (8)
	CreateDynamicObject(1491,305.67440796,-1453.56250000,-34.52923965,0.00000000,0.00000000,0.00000000, .interiorid = 1); //object(gen_doorint01) (1)
	CreateDynamicObject(1491,310.42266846,-1453.56958008,-34.52923965,0.00000000,0.00000000,0.00000000, .interiorid = 1); //object(gen_doorint01) (2)
	CreateDynamicObject(2957,304.04525757,-1453.56958008,-32.47067261,0.00000000,90.00000000,0.00000000, .interiorid = 1); //object(chinatgaragedoor) (1)
	CreateDynamicObject(2957,313.55474854,-1453.56701660,-32.47067261,0.00000000,90.00000000,0.00000000, .interiorid = 1); //object(chinatgaragedoor) (1)
	CreateDynamicObject(1649,308.91375732,-1451.29418945,-32.86349869,0.00000000,0.00000000,270.00000000, .interiorid = 1); //object(wglasssmash) (1)
	CreateDynamicObject(1649,308.91308594,-1451.29394531,-32.86349869,0.00000000,0.00000000,90.00000000, .interiorid = 1); //object(wglasssmash) (2)
	CreateDynamicObject(8169,308.91879272,-1450.16955566,-32.52923965,106.99588013,90.00000000,180.00000000, .interiorid = 1); //object(vgs_guardhseflr) (8)
	CreateDynamicObject(1649,308.91668701,-1451.29418945,-29.60837173,0.00000000,0.00000000,90.00000000, .interiorid = 1); //object(wglasssmash) (3)
	CreateDynamicObject(1649,308.91128540,-1451.29431152,-29.60297012,0.00000000,0.00000000,270.00000000, .interiorid = 1); //object(wglasssmash) (4)
	CreateDynamicObject(14532,309.53399658,-1452.88830566,-33.54652023,0.00000000,0.00000000,315.00000000, .interiorid = 1); //object(tv_stand_driv) (1)
	CreateDynamicObject(1671,311.07064819,-1450.01330566,-34.06902695,0.00000000,0.00000000,311.60888672, .interiorid = 1); //object(swivelchair_a) (1)
	CreateDynamicObject(1671,311.91442871,-1451.20056152,-34.06902695,0.00000000,0.00000000,282.31018066, .interiorid = 1); //object(swivelchair_a) (2)
	CreateDynamicObject(1810,305.47702026,-1450.94470215,-34.52923965,0.00000000,0.00000000,87.65490723, .interiorid = 1); //object(cj_foldchair) (1)
	CreateDynamicObject(1810,307.89422607,-1451.39428711,-34.52923965,0.00000000,0.00000000,273.15954590, .interiorid = 1); //object(cj_foldchair) (2)
	CreateDynamicObject(1827,306.67138672,-1451.28918457,-34.52923965,0.00000000,0.00000000,0.00000000, .interiorid = 1); //object(man_sdr_tables) (2)
	CreateDynamicObject(2009,290.45791626,-1468.11608887,-34.52298355,0.00000000,0.00000000,90.00000000, .interiorid = 1); //object(officedesk2l) (1)
	CreateDynamicObject(2197,286.46551514,-1467.00256348,-34.52298355,0.00000000,0.00000000,90.00000000, .interiorid = 1); //object(filling_cabinet) (4)
	CreateDynamicObject(2200,292.76733398,-1469.83776855,-34.52298355,0.00000000,0.00000000,270.00000000, .interiorid = 1); //object(med_office5_unit_1) (1)
	CreateDynamicObject(2204,287.41705322,-1471.50622559,-34.52298355,0.00000000,0.00000000,180.00000000, .interiorid = 1); //object(med_office8_cabinet) (1)
	CreateDynamicObject(1714,290.53604126,-1467.20202637,-34.52298355,0.00000000,0.00000000,289.61608887, .interiorid = 1); //object(kb_swivelchair1) (1)
	CreateDynamicObject(1778,329.46221924,-1474.47827148,-34.52298355,0.00000000,0.00000000,90.00000000, .interiorid = 1); //object(cj_mop_pail) (1)
	CreateDynamicObject(1771,328.46612549,-1476.94348145,-33.88931656,0.00000000,0.00000000,268.69885254, .interiorid = 1); //object(cj_bunk_bed1) (1)
	CreateDynamicObject(1337,322.30862427,-1474.60803223,-33.87375641,0.00000000,0.00000000,90.00000000, .interiorid = 1); //object(binnt07_la) (2)
	CreateDynamicObject(1338,326.28952026,-1476.88671875,-33.81167221,0.00000000,0.00000000,0.00000000, .interiorid = 1); //object(binnt08_la) (1)
	CreateDynamicObject(1440,324.06448364,-1476.95019531,-34.00386810,0.00000000,0.00000000,180.00000000, .interiorid = 1); //object(dyn_box_pile_3) (1)
	CreateDynamicObject(1265,325.22683716,-1476.19226074,-34.05393982,0.00000000,0.00000000,296.25524902, .interiorid = 1); //object(blackbag2) (1)
	CreateDynamicObject(1264,323.25726318,-1474.70031738,-34.05083847,0.00000000,0.00000000,279.02832031, .interiorid = 1); //object(blackbag1) (1)
	CreateDynamicObject(11631,329.22161865,-1468.77941895,-33.27708054,0.00000000,0.00000000,270.00000000, .interiorid = 1); //object(ranch_desk) (1)
	CreateDynamicObject(2607,325.18939209,-1468.12915039,-34.12730026,0.00000000,0.00000000,180.00000000, .interiorid = 1); //object(polce_desk2) (1)
	CreateDynamicObject(2356,328.48495483,-1469.47021484,-34.52298355,0.00000000,0.00000000,303.83496094, .interiorid = 1); //object(police_off_chair) (1)
	CreateDynamicObject(2207,303.88574219,-1480.73437500,-28.73089981,0.00000000,0.00000000,270.00000000, .interiorid = 1); //object(med_office7_desk_1) (1)
	CreateDynamicObject(1714,305.63839722,-1481.56811523,-28.75525284,0.00000000,0.00000000,286.04431152, .interiorid = 1); //object(kb_swivelchair1) (2)
	CreateDynamicObject(2190,303.95974731,-1482.46374512,-27.95352745,0.00000000,0.00000000,111.03887939, .interiorid = 1); //object(pc_1) (2)
	CreateDynamicObject(2311,304.88085938,-1489.10546875,-28.73089981,0.00000000,0.00000000,0.00000000, .interiorid = 1); //object(cj_tv_table2) (2)
	CreateDynamicObject(2700,300.06005859,-1481.78222656,-25.16612434,0.00000000,0.00000000,0.00000000, .interiorid = 1); //object(cj_sex_tv2) (1)
	CreateDynamicObject(1893,301.89276123,-1493.61791992,-31.40267563,0.00000000,0.00000000,270.00000000, .interiorid = 1); //object(shoplight1) (1)
	CreateDynamicObject(1893,301.88687134,-1486.12084961,-31.40267563,0.00000000,0.00000000,270.00000000, .interiorid = 1); //object(shoplight1) (2)
	CreateDynamicObject(1893,301.28695679,-1483.02026367,-31.40267563,0.00000000,0.00000000,0.00000000, .interiorid = 1); //object(shoplight1) (3)
	CreateDynamicObject(2007,285.47372437,-1461.86901855,-34.53079605,0.00000000,0.00000000,90.00000000, .interiorid = 1); //object(filing_cab_nu01) (1)
	CreateDynamicObject(2007,285.47827148,-1465.82226562,-34.53079605,0.00000000,0.00000000,90.00000000, .interiorid = 1); //object(filing_cab_nu01) (2)
	CreateDynamicObject(2008,289.19281006,-1463.93908691,-34.53079605,0.00000000,0.00000000,90.00000000, .interiorid = 1); //object(officedesk1) (1)
	CreateDynamicObject(1714,290.24304199,-1463.02392578,-34.52298355,0.00000000,0.00000000,289.61608887, .interiorid = 1); //object(kb_swivelchair1) (1)
	CreateDynamicObject(2608,292.67315674,-1465.32287598,-33.81932449,0.00000000,0.00000000,270.00000000, .interiorid = 1); //object(polce_shelf) (1)
	CreateDynamicObject(2609,292.52435303,-1461.60766602,-33.79908752,0.00000000,0.00000000,270.00000000, .interiorid = 1); //object(cj_p_fileing1) (1)
	CreateDynamicObject(2191,292.37973022,-1462.93566895,-34.53079605,0.00000000,0.00000000,270.00000000, .interiorid = 1); //object(med_office2_cab) (1)
	CreateDynamicObject(16662,309.20010376,-1463.23413086,-24.77413940,63.39999390,90.00000000,270.00000000, .interiorid = 1); //object(a51_radar_stuff) (1)
	CreateDynamicObject(1668,304.25622559,-1480.90881348,-27.78682327,0.00000000,0.00000000,0.00000000, .interiorid = 1); //object(propvodkabotl1) (1)
	CreateDynamicObject(2855,303.82894897,-1481.18969727,-27.95352745,0.00000000,0.00000000,65.86511230, .interiorid = 1); //object(gb_bedmags05) (1)
	CreateDynamicObject(2852,303.61880493,-1482.01403809,-27.95352745,0.00000000,0.00000000,0.00000000, .interiorid = 1); //object(gb_bedmags02) (1)
	CreateDynamicObject(1736,307.49340820,-1481.78393555,-25.27207184,0.00000000,0.00000000,269.48693848, .interiorid = 1); //object(cj_stags_head) (1)
	CreateDynamicObject(2491,308.43945312,-1467.54589844,-35.16662979,0.00000000,0.00000000,179.99450684, .interiorid = 1); //object(model_stand) (1)
	CreateDynamicObject(1730,300.42053223,-1474.60668945,-28.73089981,0.00000000,0.00000000,0.00000000, .interiorid = 1); //object(swank_cabinet_3) (1)
	CreateDynamicObject(2204,301.84945679,-1474.26086426,-28.73089981,0.00000000,0.00000000,0.00000000, .interiorid = 1); //object(med_office8_cabinet) (2)
	CreateDynamicObject(2200,302.21353149,-1474.26831055,-26.94274521,0.00000000,0.00000000,0.00000000, .interiorid = 1); //object(med_office5_unit_1) (2)
	CreateDynamicObject(1703,304.62121582,-1474.67419434,-28.73089981,0.00000000,0.00000000,0.00000000, .interiorid = 1); //object(kb_couch02) (3)
	CreateDynamicObject(12814,313.29492188,-1478.75097656,-24.23483658,0.00000000,0.00000000,179.99450684, .interiorid = 1); //object(cuntyeland04) (1)
	CreateDynamicObject(2002,302.75833130,-1489.31335449,-28.73089981,0.00000000,0.00000000,180.00000000, .interiorid = 1); //object(water_coolnu) (1)
	CreateDynamicObject(2288,300.29425049,-1479.18029785,-26.33251381,0.00000000,0.00000000,90.09881592, .interiorid = 1); //object(frame_3) (1)
	CreateDynamicObject(2007,314.12896729,-1505.99865723,-46.13018036,0.00000000,0.00000000,270.00000000, .interiorid = 1); //object(filing_cab_nu01) (3)
	CreateDynamicObject(1806,312.65527344,-1512.03027344,-46.12367630,0.00000000,0.00000000,90.00000000, .interiorid = 1); //object(med_office_chair) (1)
	CreateDynamicObject(1806,312.62911987,-1518.00183105,-46.12367630,0.00000000,0.00000000,90.00000000, .interiorid = 1); //object(med_office_chair) (1)
	CreateDynamicObject(1806,312.64999390,-1499.31555176,-46.12367630,0.00000000,0.00000000,90.00000000, .interiorid = 1); //object(med_office_chair) (1)
	CreateDynamicObject(1806,312.67895508,-1493.98632812,-46.12367630,0.00000000,0.00000000,90.00000000, .interiorid = 1); //object(med_office_chair) (1)
	CreateDynamicObject(2190,310.62237549,-1512.26940918,-45.21636200,0.00000000,0.00000000,104.99630737, .interiorid = 1); //object(pc_1) (1)
	CreateDynamicObject(2190,310.59692383,-1518.19750977,-45.21636200,0.00000000,0.00000000,104.99630737, .interiorid = 1); //object(pc_1) (1)
	CreateDynamicObject(2190,310.74307251,-1499.55859375,-45.21636200,0.00000000,0.00000000,104.99630737, .interiorid = 1); //object(pc_1) (1)
	CreateDynamicObject(2190,310.70114136,-1494.10925293,-45.21636200,0.00000000,0.00000000,104.99633789, .interiorid = 1); //object(pc_1) (1)
	CreateDynamicObject(1886,308.70672607,-1467.93701172,-30.56187057,16.16790771,0.19573975,179.06506348, .interiorid = 1); //object(shop_sec_cam) (1)
	CreateDynamicObject(2747,308.48376465,-1472.51135254,-34.11668777,0.00000000,0.00000000,0.00000000, .interiorid = 1); //object(cj_donut_table) (1)
	CreateDynamicObject(2747,310.08023071,-1472.51135254,-34.11668777,0.00000000,0.00000000,0.00000000, .interiorid = 1); //object(cj_donut_table) (2)
	CreateDynamicObject(2747,306.88693237,-1472.51135254,-34.11668777,0.00000000,0.00000000,0.00000000, .interiorid = 1); //object(cj_donut_table) (3)
	CreateDynamicObject(2747,306.88693237,-1473.50244141,-34.11668777,0.00000000,0.00000000,0.00000000, .interiorid = 1); //object(cj_donut_table) (4)
	CreateDynamicObject(2747,308.48376465,-1473.50244141,-34.11668777,0.00000000,0.00000000,0.00000000, .interiorid = 1); //object(cj_donut_table) (5)
	CreateDynamicObject(2747,310.08023071,-1473.50244141,-34.11668777,0.00000000,0.00000000,0.00000000, .interiorid = 1); //object(cj_donut_table) (6)
	CreateDynamicObject(1806,306.94726562,-1474.57141113,-34.52923965,0.00000000,0.00000000,0.00000000, .interiorid = 1); //object(med_office_chair) (6)
	CreateDynamicObject(1806,308.53701782,-1474.58837891,-34.52923965,0.00000000,0.00000000,0.00000000, .interiorid = 1); //object(med_office_chair) (7)
	CreateDynamicObject(1806,310.08981323,-1474.62011719,-34.52923965,0.00000000,0.00000000,0.00000000, .interiorid = 1); //object(med_office_chair) (8)
	CreateDynamicObject(1806,310.13595581,-1471.40625000,-34.52923965,0.00000000,0.00000000,180.00000000, .interiorid = 1); //object(med_office_chair) (9)
	CreateDynamicObject(1806,308.49731445,-1471.39831543,-34.52923965,0.00000000,0.00000000,179.99450684, .interiorid = 1); //object(med_office_chair) (10)
	CreateDynamicObject(1806,306.94650269,-1471.37988281,-34.52923965,0.00000000,0.00000000,179.99450684, .interiorid = 1); //object(med_office_chair) (11)
	CreateDynamicObject(1806,305.62155151,-1473.00012207,-34.52923965,0.00000000,0.00000000,270.00000000, .interiorid = 1); //object(med_office_chair) (12)
	CreateDynamicObject(1806,311.44116211,-1472.99316406,-34.52923965,0.00000000,0.00000000,90.00000000, .interiorid = 1); //object(med_office_chair) (13)
	CreateDynamicObject(16782,322.13433838,-1469.29296875,-32.56002808,0.00000000,0.00000000,0.00000000, .interiorid = 1); //object(a51_radar_scan) (1)
	CreateDynamicObject(2611,325.91857910,-1473.77783203,-32.58835220,0.00000000,0.00000000,179.93066406, .interiorid = 1); //object(police_nb1) (1)
	CreateDynamicObject(14527,304.30047607,-1480.94714355,-26.86861801,0.00000000,0.00000000,0.00000000, .interiorid = 1); //object(fannyfan) (1)
	CreateDynamicObject(2198,289.17578125,-1474.82629395,-34.53079605,0.00000000,0.00000000,90.00000000, .interiorid = 1); //object(med_office2_desk_3) (1)
	CreateDynamicObject(1714,290.23767090,-1474.06457520,-34.53079605,0.00000000,0.00000000,300.22509766, .interiorid = 1); //object(kb_swivelchair1) (4)
	CreateDynamicObject(2182,292.43322754,-1475.33679199,-34.53079605,0.00000000,0.00000000,180.00000000, .interiorid = 1); //object(med_office5_desk_1) (1)
	CreateDynamicObject(2000,285.47576904,-1472.12133789,-34.53079605,0.00000000,0.00000000,90.00000000, .interiorid = 1); //object(filing_cab_nu) (1)
	CreateDynamicObject(2000,285.47576904,-1472.64123535,-34.53079605,0.00000000,0.00000000,90.00000000, .interiorid = 1); //object(filing_cab_nu) (2)
	CreateDynamicObject(14632,321.33325195,-1475.83569336,-33.03472900,0.00000000,0.00000000,270.00000000, .interiorid = 1); //object(paperchase_bits2b) (1)
	CreateDynamicObject(2186,329.36141968,-1464.33728027,-34.52298355,0.00000000,0.00000000,270.00000000, .interiorid = 1); //object(photocopier_1) (1)
	CreateDynamicObject(2206,329.35076904,-1471.45605469,-34.52298355,0.00000000,0.00000000,270.00000000, .interiorid = 1); //object(med_office8_desk_02) (1)
	CreateDynamicObject(2606,329.50375366,-1472.36730957,-33.36120224,0.00000000,0.00000000,270.00000000, .interiorid = 1); //object(cj_police_counter2) (1)
	CreateDynamicObject(2612,304.02514648,-1463.07299805,-32.50022888,0.00000000,0.00000000,0.00000000, .interiorid = 1); //object(police_nb2) (1)
	CreateDynamicObject(2611,314.25363159,-1463.07299805,-32.39287949,0.00000000,0.00000000,0.00000000, .interiorid = 1); //object(police_nb1) (2)
	CreateDynamicObject(1722,323.52783203,-1485.03967285,-34.52298355,0.00000000,0.00000000,0.00000000, .interiorid = 1); //object(off_chairnu) (1)
	CreateDynamicObject(1722,322.35116577,-1485.02929688,-34.52298355,0.00000000,0.00000000,0.00000000, .interiorid = 1); //object(off_chairnu) (2)
	CreateDynamicObject(1722,321.10070801,-1485.05798340,-34.52298355,0.00000000,0.00000000,0.00000000, .interiorid = 1); //object(off_chairnu) (3)
	CreateDynamicObject(1722,325.25961304,-1481.93444824,-34.52298355,0.00000000,0.00000000,90.00000000, .interiorid = 1); //object(off_chairnu) (4)
	CreateDynamicObject(1722,325.27322388,-1480.63781738,-34.52298355,0.00000000,0.00000000,90.00000000, .interiorid = 1); //object(off_chairnu) (5)
	CreateDynamicObject(1722,325.24453735,-1479.48413086,-34.52298355,0.00000000,0.00000000,90.00000000, .interiorid = 1); //object(off_chairnu) (6)
	CreateDynamicObject(1808,317.90686035,-1482.45349121,-34.52298355,0.00000000,0.00000000,90.00000000, .interiorid = 1); //object(cj_watercooler2) (1)
	CreateDynamicObject(15038,325.23391724,-1478.51025391,-33.90579605,0.00000000,0.00000000,0.00000000, .interiorid = 1); //object(plant_pot_3_sv) (1)
	CreateDynamicObject(1616,317.07241821,-1498.25427246,-37.11650085,0.00000000,0.00000000,0.00000000, .interiorid = 1); //object(nt_securecam1_01) (1)
	CreateDynamicObject(1616,281.14285278,-1481.05761719,-31.00306702,0.00000000,0.00000000,267.23352051, .interiorid = 1); //object(nt_securecam1_01) (2)
	CreateDynamicObject(1616,318.01690674,-1485.05334473,-31.00306702,0.00000000,0.00000000,267.23144531, .interiorid = 1); //object(nt_securecam1_01) (3)
	CreateDynamicObject(1616,277.92636108,-1509.63354492,-43.22993469,0.00000000,0.00000000,267.23144531, .interiorid = 1); //object(nt_securecam1_01) (4)



		


	return 1;
}


public OnGameModeExit() 
{ 

    //mysql_close(g_Sql);
    print("\n--------------------------------------");
    print("\nMohon di mengerti bahwa telah berlangsung");
	print("SERVER DIMATIKAN ALIAS DIRESTART");
	print("\n--------------------------------------");
	//SavePlayer(playerid);
	/*
	new Query[500];
    format(Query, 500, "UPDATE `playerdata` SET `admin` = '%d', `score` = '%d', `money` = '%d', `kills` = '%d', `deaths` = '%d' WHERE `id` = '%d' LIMIT 1",
    pInfo[playerid][pAdmin],
    pInfo[playerid][pScore],
    pInfo[playerid][pMoney],
    pInfo[playerid][pKills],
    pInfo[playerid][pDeaths],
    pInfo[playerid][ID]);
    mysql_query(g_Sql, Query);
   	mysql_log( ALL );
   	*/
    /* 5 - close the connection on exit. 
    if() 
    { 

        mysql_close(); 

    } 
    
    */ 
    return 1; 
} 

stock ToggleBoot(vehicleid, toggle)
{
	GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
	SetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, toggle, objective);
}

stock ToggleEngine(vehicleid, toggle)
{
	GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
	SetVehicleParamsEx(vehicleid, toggle, lights, alarm, doors, bonnet, boot, objective);
}
stock ToggleDoors(vehicleid, toggle)
{
	GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
	SetVehicleParamsEx(vehicleid, engine, lights, alarm, toggle, bonnet, boot, objective);
}

stock ToggleHood(vehicleid, toggle)
{
	GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
	SetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, toggle, boot, objective);
}
//-------------------------------------------------
forward WaktuServer(playerid, closestcar);
public WaktuServer(playerid, closestcar)
{
	// membuat fungsi progress bar jadi berjalan menuju 100 persen
	if(pInfo[playerid][pStatusLoadingBar] == 1) // artinya sedang ada loading
	{
		if(GetPlayerProgressBarValue(playerid, PlayerBar:pInfo[playerid][pLoadingBar]) <= Float:100.0)
		{
			SetPlayerProgressBarValue(playerid, PlayerBar:pInfo[playerid][pLoadingBar], GetPlayerProgressBarValue(playerid, PlayerBar:pInfo[playerid][pLoadingBar]) + Float:5.0);
			if(GetPlayerProgressBarValue(playerid, PlayerBar:pInfo[playerid][pLoadingBar]) >= Float:50.0)
			{
				SetPlayerProgressBarColour(playerid, PlayerBar:pInfo[playerid][pLoadingBar], COLOR_AQUAGREEN);
			}
			if(GetPlayerProgressBarValue(playerid, PlayerBar:pInfo[playerid][pLoadingBar]) >= Float:80.0)
			{
				SetPlayerProgressBarColour(playerid, PlayerBar:pInfo[playerid][pLoadingBar], COLOR_AQUA);
			}
		}

		/*
		if(GetPlayerProgressBarValue(playerid, PlayerBar:pInfo[playerid][pLoadingBar]) == Float:20.0)
		{
			SetPlayerProgressBarValue(playerid, PlayerBar:pInfo[playerid][pLoadingBar], Float:30.0);
		}

		if(GetPlayerProgressBarValue(playerid, PlayerBar:pInfo[playerid][pLoadingBar]) == Float:30.0)
		{
			SetPlayerProgressBarValue(playerid, PlayerBar:pInfo[playerid][pLoadingBar], Float:50.0);
		}

		if(GetPlayerProgressBarValue(playerid, PlayerBar:pInfo[playerid][pLoadingBar]) == Float:50.0)
		{
			SetPlayerProgressBarValue(playerid, PlayerBar:pInfo[playerid][pLoadingBar], Float:60.0);
		}

		if(GetPlayerProgressBarValue(playerid, PlayerBar:pInfo[playerid][pLoadingBar]) == Float:60.0)
		{
			SetPlayerProgressBarValue(playerid, PlayerBar:pInfo[playerid][pLoadingBar], Float:80.0);
		}

		if(GetPlayerProgressBarValue(playerid, PlayerBar:pInfo[playerid][pLoadingBar]) == Float:80.0)
		{
			SetPlayerProgressBarValue(playerid, PlayerBar:pInfo[playerid][pLoadingBar], Float:90.0);
		}

		if(GetPlayerProgressBarValue(playerid, PlayerBar:pInfo[playerid][pLoadingBar]) == Float:90.0)
		{
			SetPlayerProgressBarValue(playerid, PlayerBar:pInfo[playerid][pLoadingBar], Float:100.0);
		}
		
		*/

		if(GetPlayerProgressBarValue(playerid, PlayerBar:pInfo[playerid][pLoadingBar]) >= Float:100.0)
		{
			pInfo[playerid][pStatusLoadingBar] = 0;
			
			HidePlayerProgressBar(playerid, PlayerBar:pInfo[playerid][pLoadingBar]);
			SetPlayerProgressBarValue(playerid, PlayerBar:pInfo[playerid][pLoadingBar], Float:0.0);
			SendClientMessage(playerid,COLOR_AQUAGREEN,"Anda sudah melewati proses loading. Selamat tuan!");
			// saat proses loading selesai
		}
	}


	if(StatusCrateTerangkat == true)
    {
    	
    		PlayerPlaySound(playerid, 1155, 0.0, 0.0, 10.0);
    		//ApplyAnimation(playerid, "MISC", "Idle_Chat_02", 4.1, 0, 0, 0, 0, 0, 0);
    		//ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.1, 0, 0, 0, 0, 1, 1);
    	
    }

	if(IsPlayerInRangeOfPoint(playerid, Float:15.0, 2152.647216, -1735.895996, 17.400230))
	{ 
		MoveDynamicObject(PintuGarasiMechanic, 2152.647216, -1735.895996, 17.400230, Float:2.0,  0.000000, 85.000000, 90.000000);
		// ketika pintu garasi di buka
		if(IsPlayerInAnyVehicle(playerid))
		{
			ToggleHood(GetPlayerVehicleID(playerid), VEHICLE_PARAMS_ON);
		}
		MoveDynamicObject(DongkratMobilMechanic, 2151.989501, -1729.435058, 11.610030+1, Float:0.01, 0.000000, 0.000000, 0.000000);
		// ini dongkrak di naikkan
		MoveDynamicObject(PeneranganMobilMechanic, 2152.0371,-1726.3260,12.9692, Float:0.01, 0.0000,0.0000,4.8428);
		
		//cmd_makan(playerid);
	}
	else

	{
		MoveDynamicObject(PintuGarasiMechanic, 2152.632812, -1733.791625, 14.466965, Float:2.0,  0.599999, 0.899998, 89.599990);
		
		// ini kalau pintu sudah di tutup.
		
		MoveDynamicObject(DongkratMobilMechanic, 2151.9052,-1729.4147,10.7400, Float:0.1,  0.0000,0.9000,0.7433);
		// ini dongkrak di turunkan

		MoveDynamicObject(PeneranganMobilMechanic, 2156.474121, -1734.285278, 12.558380, Float:1.0, 0.000000, 0.000000, 0.000000);
		
	}

	if(IsPlayerInAnyVehicle(playerid))
	{
		new Float:health;
		new vehicleid = GetPlayerVehicleID(playerid);
		GetVehicleHealth(vehicleid, Float:health);
		if(health < 350 )
		{
			if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
			{
				ToggleEngine(vehicleid, VEHICLE_PARAMS_OFF);
				GameTextForPlayer(playerid, "Mesin Mobil Rusak Parah\nHubungi Mechanic Segera", 200, 5);
				PlayerPlaySound(playerid, 1100, 0.0, 0.0, 0.0);
				ToggleHood(vehicleid, VEHICLE_PARAMS_ON);
				cmd_makan(playerid);
				// mesin rusak ketika 350 health
			}
			
		}
	}


	if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 416)
    {
    	// pemulihan saat di dalam ambulance
    	if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER)
    	{
    		new Float:HP;
    		GetPlayerHealth(playerid, Float:HP);
			SetPlayerHealth(playerid, Float:HP+2);
			GameTextForPlayer(playerid, "Tuan anda sedang di rawat di dalam ambulance.", 500, 5);
			ApplyAnimation(playerid, "CRACK", "crckdeth2",4.0,0,0,0,0,0);
			//SendClientMessage(playerid, COLOR_AQUAGREEN, "* Tuan anda sedang di rawat di dalam ambulance.");
   			
   			if(HP > 99)
   			{
   				RemovePlayerFromVehicle(playerid);
   				SendClientMessage(playerid, COLOR_AQUAGREEN, "* Tuan anda sembuh dan perawatan berhasil di akhiri.");
   				GameTextForPlayer(playerid, "~r~-500", 2000, 6);
   			}
    	}
    }



	static warna = 0;
    new str[32];
    if(warna == 5) format(str, sizeof(str), "~p~DuniaPutu Corp."), warna = 0;
    if(warna == 4) format(str, sizeof(str), "~y~DuniaPutu Corp."), warna = 5;
    if(warna == 3) format(str, sizeof(str), "~g~DuniaPutu Corp."), warna = 4;
    if(warna == 2) format(str, sizeof(str), "~w~DuniaPutu Corp."), warna = 0; // warna jadi biru saja
    if(warna == 1) format(str, sizeof(str), "~r~DuniaPutu Corp."), warna = 2;
    if(warna == 0) format(str, sizeof(str), "~b~DuniaPutu Corp."), warna = 1;
    TextDrawSetString(UI[0], str);


    new
        string[800],
        month[12],
        date[6];
 
    getdate(date[2], date[1], date[0]);
    gettime(date[3], date[4], date[5]);
 
    switch (date[1]) {
        case 1: month = "Jan";
        case 2: month = "Feb";
        case 3: month = "Mar";
        case 4: month = "Apr";
        case 5: month = "Mei";
        case 6: month = "Jun";
        case 7: month = "Jul";
        case 8: month = "Agt";
        case 9: month = "Sep";
        case 10: month = "Oktober";
        case 11: month = "Nov";
        case 12: month = "Des";
    }
    format(string, sizeof string, "%02d:%02d:%02d", date[3], date[4], date[5]);//jam
    TextDrawSetString(UI[1], string);

    // mengatur jam seperti di realtime ooc
    SetPlayerTime(playerid, date[3], date[4]);

    format(string, sizeof string, "%02d, %s, %d", date[0],month,date[2]);//TGL
    TextDrawSetString(UI[2], string);

    // update data panel kecepatan kendaraan
    new vehicleid = GetPlayerVehicleID(playerid);
    new tekskecepatan[100];
  
	format(tekskecepatan, sizeof(tekskecepatan), "ID Kendaraan %i\nKecepatan : %i KM/h",vehicleid, GetPlayerSpeed(playerid, true));
	TextDrawSetString(Text:panelkecepatankendaraan, tekskecepatan);

    //tambahan sering berkurang energynya
    new Float:NilaiLapar = Float:GetPlayerProgressBarValue(playerid, PlayerBar:pInfo[playerid][pLaparBar]) - Float:0.01;
    SetPlayerProgressBarValue(playerid, PlayerBar:pInfo[playerid][pLaparBar], Float:NilaiLapar);
    //untuk set warna bar dari setiap nilai bar
    if(Float:NilaiLapar > 70.00)
    {
    	return SetPlayerProgressBarColour(playerid, PlayerBar:pInfo[playerid][pLaparBar], COLOR_GREEN);
    }
	else if(Float:NilaiLapar > 25.00)
	{
		return SetPlayerProgressBarColour(playerid, PlayerBar:pInfo[playerid][pLaparBar], COLOR_YELLOW);
	}
	if(Float:NilaiLapar < 25.00)
	{
		return SetPlayerProgressBarColour(playerid, PlayerBar:pInfo[playerid][pLaparBar], COLOR_RED);
		TextDrawShowForPlayer(playerid, Text:LayarJadiMerah);
		SetPlayerDrunkLevel(playerid, 99999);
		SetTimer("HilangkanLayarWarnaMerah", 2000, 0);
	}

	// usir pencuri sepeda sewaan
	if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 510)
    {
    	if(GetPlayerVehicleID(playerid) != sepedasewaan[playerid])
    	{
    		RemovePlayerFromVehicle(playerid);
    		
    		SendClientMessage(playerid, COLOR_AQUAGREEN, "* Manager rental : Anda tidak berhak menggunakan sewaan orang lain");
   	
    	}
    }

    // usir pencuri sepeda sewaan
	if(IsPlayerInRangeOfPoint(playerid, Float:130.0, Float:-1712.7421,Float:969.1401,Float:26.0941))
    {
    	// player masuk ke sebuah green zone rumah sakit
    	TextDrawShowForPlayer(playerid, Text:TeksInfoGreenZone);
    }
    else
    {

    	TextDrawHideForPlayer(playerid, Text:TeksInfoGreenZone);
    }


    

}

forward GantiWarna(playerid);
public GantiWarna(playerid) 
{
    if(GetPlayerVirtualWorld(playerid) == 0)
    {
    	if(GetPlayerInterior(playerid) == 0)
    	{
    		if(IsPlayerInRangeOfPoint(playerid, Float:100.0, 1062.4270,-2567.9729,-0.5079))
		    {
		    	new string[500];
				
				format(string, sizeof(string), "Anda di area memancing gunakan /fishingrod /attachworm lalu /fish. Berat ikan anda sekarang adalah %i gram", pInfo[playerid][pFishes]);
				SendClientMessage(playerid, COLOR_WHITE, string);
				//PlayerInfo[playerid][pFishes] = 0;
	//}
		    	
		    }
    	}
    }

    // setingg string jadi model gambar
    TextDrawSetPreviewModel(Text:UI[3], 172);
    TextDrawSetPreviewRot(Text:UI[3], Float:0.0, Float:0.0, Float:0.0, Float:0.1);

    if(!IsPlayerInAnyVehicle(playerid))
    {
    	TextDrawHideForPlayer(playerid, Text:panelkecepatankendaraan);
    }

    if(pInfo[playerid][Logged] == 1)
    {
    	if(IsActorStreamedIn(susterdiresepsionis, playerid))
	    {
	    	//TextDrawSetPreviewModel(Text:text, 18659)
	    	//TextDrawSetPreviewRot(Text:text, Float:fRotX, Float:fRotY, Float:fRotZ, Float:fZoom = 1.0)
			//new labelajah = CreateDynamicObject(18659, pos[0], pos[1]+4.0, pos[2], 0.000000, 0.000000, angle); 



	    	if(GetPlayerMoney(playerid) < 1000)
	    	{
	    		cmd_belisenjata(playerid);
	    	}
	    	else
	    	{
	    		new biayaservis = random(1000);
				pInfo[playerid][pMoney] = pInfo[playerid][pMoney]-biayaservis;
				ResetPlayerMoney(playerid);
				GivePlayerMoney(playerid, pInfo[playerid][pMoney]);
				

				new infomakan[200];
				format(infomakan, sizeof(infomakan), ""COL_LIGHTBLUE"TAGIHAN"COL_GREEN": Anda bayar biaya layanan konsultasi sebanyak $%i.", biayaservis);
				SendClientMessage(playerid,0xFF0000FF, infomakan);
	    	}
	    	
	    }

	    // kejadian ketika tidak ada energy lagi
	    //GetPlayerProgressBarValue(playerid, PlayerBar:barid)
	    if(Float:GetPlayerProgressBarValue(playerid,  PlayerBar:pInfo[playerid][pLaparBar]) < Float:2.00)
	    {
	    	new x,y,z;
	    	GetPlayerPos(playerid, Float:x, Float:y, Float:z);
	    	SetVehiclePos(MobilEmergencyAmbulance, Float:x +1, Float:y , Float:z);
	    	SetActorPos(susterdiresepsionis, Float:x, Float:y, Float:z);
	    	SetTimer("KembalikanMobilPedagangMakanan", 10000, 0);

	    	KeadaanLelah[playerid] = 1;
	    	new biayaservis = random(3000);
			pInfo[playerid][pMoney] = pInfo[playerid][pMoney]-biayaservis;
			ResetPlayerMoney(playerid);
			GivePlayerMoney(playerid, pInfo[playerid][pMoney]);
			

	    	new infomakan[200];
			format(infomakan, sizeof(infomakan), ""COL_YELLOW"SAKIT"COL_RED": Anda bayar biaya ambulace wajib sebesar $%i, mohon tetap jaga kesehatan.", biayaservis);
			SendClientMessage(playerid,0xFF0000FF, infomakan);
	    	
	    	//SetPlayerProgressBarValue(playerid, PlayerBar:barid, Float:value)
	    	SetPlayerProgressBarValue(playerid, PlayerBar:pInfo[playerid][pLaparBar], Float:100.00);
	    	// saat sakit di bawa ambulance
	    	return cmd_kill(playerid);
	    	
	    }
	    if(IsPlayerInRangeOfPoint(playerid, Float:7.0, -293.9700,1500.8232,1071.3231))
	    {
	    	MoveObject(pintubrangkasbiz, -293.9700,1500.8232,1071.3231, Float:1.0);
	    }
    }
    



    return 1;
}



public UnFreezeMe()
{
	SetCameraBehindPlayer(unfreezeplayer);
	TogglePlayerControllable(unfreezeplayer, 1); // variabel dia bergerak itu jadi satu supaya bisa bergerak karakternya.
}

//-------------------------------------------------

public ShowTestDialog()
{
      new listitems[] = "{FFFFFF}1\t{55EE55}Deagle\n{FFFFFF}2\t{55EE55}Sawnoff\n{FFFFFF}3\t{55EE55}Pistol\n{FFFFFF}4\t{55EE55}Grenade\n{FFFFFF}5\t{55EE55}Parachute\n6\t{55EE55}Lorikeet";
	  ShowPlayerDialog(testlbplayer,2,DIALOG_STYLE_LIST,"{448844}List of weapons:",listitems,"Select","Cancel");
}

//-------------------------------------------------

TabListDialogTest(playerid)
{
      new listitems[] =
  	  "Deagle\t$5000\t100\n" \
	  "Sawnoff\t$5000\t100\n" \
	  "Pistol\t$1000\t50\n" \
	  "M4\t$10000\t100\n" \
	  "MP5\t$7500\t200\n" \
	  "Grenade\t$500\t1\n" \
	  "Parachute\t$10000\t1\n" \
	  "Lorikeet\t$50000\t500\n";

	  ShowPlayerDialog(playerid,2,DIALOG_STYLE_TABLIST,"Buy Weapon",listitems,"Select","Cancel");
}

//-------------------------------------------------

TabListHeadersDialogTest(playerid)
{
      new listitems[] =
      "Weapon\tPrice\tAmmo\n" \
  	  "Deagle\t$5000\t100\n" \
	  "Sawnoff\t$5000\t100\n" \
	  "Pistol\t$1000\t50\n" \
	  "M4\t$10000\t100\n" \
	  "MP5\t$7500\t200\n" \
	  "Grenade\t$500\t1\n" \
	  "Parachute\t$10000\t1\n" \
	  "Lorikeet\t$50000\t500\n";

	  ShowPlayerDialog(playerid,2,DIALOG_STYLE_TABLIST_HEADERS,"Beli Senjata",listitems,"Select","Cancel");
}

//-------------------------------------------------

public OnPlayerSpawn(playerid)
{
	
	SetPlayerSkin(playerid, pInfo[playerid][pSkin]);
	new dapatkanIDdiMySQL[500];
	format(dapatkanIDdiMySQL, 500, "SELECT * FROM `playerdata` WHERE `nick` = '%s' LIMIT 1", pInfo[playerid][Nick]); // now here check the database if the player has given the proper password.HTTP
	//mysql_query(MySQL:handle, const query[], bool:use_cache = true)
	mysql_query(MySQL:g_Sql, dapatkanIDdiMySQL, bool:true);
	cache_get_value_int(0, "id", pInfo[playerid][ID]);


	if(StatusBaruLogin[playerid] == 1)
    {	
    	StatusBaruLogin[playerid] = 0;
    	TextDrawShowForPlayer(playerid,UI[0]);
    	TextDrawShowForPlayer(playerid,UI[1]);	
    	TextDrawShowForPlayer(playerid,UI[2]);
    	TextDrawShowForPlayer(playerid,UI[3]);	


    	TogglePlayerSpectating(playerid, 0);
    	TogglePlayerControllable(playerid, 1);

    	ResetPlayerMoney(playerid);
    	cache_get_value_int(0, "money", pInfo[playerid][pMoney]); GivePlayerMoney(playerid, pInfo[playerid][pMoney]);
    	
    	

    	SetPlayerPos(playerid, Float:pInfo[playerid][pPx], Float:pInfo[playerid][pPy], Float:pInfo[playerid][pPz]);
		SetPlayerVirtualWorld(playerid, pInfo[playerid][pWord]);
		SetPlayerInterior(playerid, pInfo[playerid][pInterior]);
		

		// meload data player weapon

		new
        weaponid,
        ammo;
        
        
    
        new Query[250];
   		format(Query, sizeof(Query), "SELECT weaponid, ammo FROM player_weapons WHERE id = %d;", pInfo[playerid][ID]);
	    //mysql_query(MySQL:handle, const query[], bool:use_cache = true)
	    mysql_query(MySQL:g_Sql, Query, bool:true);

	    for(new i, j = cache_num_rows(); i < j; i++) // loop through all the rows that were found
	    {
	        cache_get_value_index_int(i, 0, weaponid);
			cache_get_value_index_int(i, 1, ammo);
	        
	        new infodataweapon[100];
	        format(infodataweapon, 100, "* Data yang di muat adalah di antaranya senjata ID %i pelurunya %i, ",  weaponid, ammo);
	        SendClientMessage(playerid, -1, infodataweapon);


	        if(!(0 <= weaponid <= 46)) // check if weapon is valid (should be)
	        {
	            printf("[info] Warning: OnLoadPlayerWeapons - Unknown weaponid '%d'. Senjata ini ID nya tidak cocok melebihi 46.", weaponid);
	            continue;
	        }
	        
	        GivePlayerWeapon(playerid, weaponid, ammo); 

	        //GivePlayerWeapon(playerid,WEAPON_M4,100);

		    //GivePlayerWeapon(playerid,WEAPON_SHOTGUN,122);

		    //GivePlayerWeapon(playerid,WEAPON_AK47,132);

		    // load data bar lapar
		    //CreatePlayerProgressBar(playerid, Float:x, Float:y, Float:width = 55.5, Float:height = 3.2, colour = 0xFF1C1CFF, Float:max = 100.0, direction = BAR_DIRECTION_RIGHT)
		    pInfo[playerid][pLaparBar] = PlayerBar:CreatePlayerProgressBar(playerid, Float:572.00, Float:340.00, Float:56.50, Float:4.20, COLOR_GREEN, Float:100.0, BAR_DIRECTION_RIGHT);
		   	// untuk membuat progressbar loading
		    pInfo[playerid][pLoadingBar] = PlayerBar:CreatePlayerProgressBar(playerid, Float:260.00, Float:210.00, Float:120.50, Float:16.20, COLOR_WHITE, Float:100.0, BAR_DIRECTION_RIGHT);
		   	SetPlayerProgressBarValue(playerid, PlayerBar:pInfo[playerid][pLoadingBar], Float:1.0);

		   	//CreatePlayerProgressBar(playerid, Float:x, Float:y, Float:width = 55.5, Float:height = 3.2, colour = 0xFF1C1CFF, Float:max = 100.0, direction = BAR_DIRECTION_RIGHT)
		    ShowPlayerProgressBar(playerid, PlayerBar:pInfo[playerid][pLaparBar]);
		    //SetPlayerProgressBarValue(playerid, PlayerBar:barid, Float:value)
        	SetPlayerProgressBarValue(playerid, PlayerBar:pInfo[playerid][pLaparBar], Float:80.0);

        	
	    }

	    
	    SetPlayerArmedWeapon(playerid, 0);
	    
		ResetPlayerMoney(playerid);
	    GivePlayerMoney(playerid, pInfo[playerid][pMoney]);
	    new pesan[100];
	    format(pesan, 100, " Lokasinya jadi spawn di %f, %f, %f Sementara masalah ID mobilnya adalah %i", Float:pInfo[playerid][pPx], Float:pInfo[playerid][pPy], Float:pInfo[playerid][pPz], pInfo[playerid][pTipeMobil]);
	    SendClientMessage(playerid, -1, pesan);
	    SetCameraBehindPlayer(playerid);


	    // ini adalah fungsi ketika ingin load data kendaraan saat akan spawn

	    if(!IsValidVehicle(mobilplayer1[playerid]))
    	{
    		mobilplayer1[playerid] = AddStaticVehicle( pInfo[playerid][pTipeMobil], Float:pInfo[playerid][pMx], Float:pInfo[playerid][pMy], Float:pInfo[playerid][pMz], Float:0.0, -1, -1);
			SetVehicleVirtualWorld(mobilplayer1[playerid], 0);
			LinkVehicleToInterior(mobilplayer1[playerid], 0);
	    	SetVehicleHealth(mobilplayer1[playerid], Float:pInfo[playerid][pHealtM1]);
    	}
    	else
    	{
    		SendClientMessage(playerid, -1, "Mobil player slot satu sudah memang ada terspawn.");
    	}

	    if(IsPlayerInRangeOfPoint(playerid, Float:6, Float:pInfo[playerid][pMx], Float:pInfo[playerid][pMy], Float:pInfo[playerid][pMz]))
	    { 
	    	// langsung masuk mobil di spawn
	    	//AddStaticVehicle(modelid, Float:spawn_x, Float:spawn_y, Float:spawn_z, Float:z_angle, color1, color2)

    		PutPlayerInVehicle(playerid, mobilplayer1[playerid], 0);

	    }



		    // CONTOH UNTU LOAD DATA DARI SQL
	 	new loaddataplayer[200];
	    format(loaddataplayer, sizeof(Query), "SELECT * FROM `playerdata` WHERE `id` COLLATE latin1_general_cs = '%i' LIMIT 1", pInfo[playerid][ID]);
	    mysql_query(MySQL:g_Sql, loaddataplayer[199], bool:true);
	    
	   	// pInfo[playerid][pMoney] = 222;
	   	
	    cache_get_value_int(0, "money", pInfo[playerid][pMoney]); 

	    GameTextForPlayer(playerid, "DATA DARI MYSQL~n~~r~~h~DI LOAD SABAR", 6000, 3);
	    //orm_load( pInfo[playerid][pMoney], "money"); GivePlayerMoney(playerid, pInfo[playerid][pMoney]);
	    //pInfo[playerid][pMoney] = 1;
	    // ketika meload data player dari mysql
	    //cache_get_value_int(0, "money", pInfo[playerid][pMoney]); GivePlayerMoney(playerid, pInfo[playerid][pMoney]);// ubu khusus koad datanya keuanganya dari enum money
	    
	    cache_get_value_int(0, "score", pInfo[playerid][pScore]); SetPlayerScore(playerid, pInfo[playerid][pScore]);
	    cache_get_value_int(0, "id", pInfo[playerid][ID]); 
	    cache_get_value_int(0, "JobMechanic", pInfo[playerid][pJobMechanic]);
	    cache_get_value_int(0, "admin", pInfo[playerid][pAdmin]);
	    cache_get_value_int(0, "kills", pInfo[playerid][pKills]); 
	    cache_get_value_int(0, "deaths", pInfo[playerid][pDeaths]); 
	    cache_get_value_int(0, "pword", pInfo[playerid][pWord]); //SetPlayerVirtualWorld(playerid, pInfo[playerid][pWord]);
		
	    cache_get_value_int(0, "pinterior", pInfo[playerid][pInterior]); SetPlayerInterior(playerid, pInfo[playerid][pInterior]);
	    
	    SendClientMessage(playerid, -1, pInfo[playerid][pPosisiTerakhir]);
	    cache_get_value_name(0, "password", pInfo[playerid][Sandi], 50);
	    
	    
	    
	    cmd_stats(playerid);

	    TogglePlayerControllable(playerid, 0); // supaya karakter yang spawn itu diam tidak bergerak
	 	unfreezeplayer = playerid; // variabel playerid itu sama dengan variabel unfreeplayer
	 	SetTimer("UnFreezeMe",4000,0); 
	    //cache_get_value_name(0, "password", pInfo[playerid][Sandi]);
	    pInfo[playerid][pScore] = pInfo[playerid][pScore]+1;
	     // kasi skornya dia.
	    

	    // di setingg posisi harusnya di load last posisi setelah player diskonek dari server.
	    //PindahinOrangnya(playerid, pInfo[playerid][pPosisiTerakhir]);


	    new String[100];
	    format(String, 100, "Seharusnya jumlah %s uangnya itu :"COL_GREEN" %i Rupiah", GetRPName(playerid), pInfo[playerid][pMoney]);
	    SendClientMessage(playerid, COLOR_RED, String);


		//ResetPlayerMoney(playerid);
	    
	    
	    return 1;
    }

	
    ResetPlayerMoney(playerid);
	GivePlayerMoney(playerid, pInfo[playerid][pMoney]);
	//PindahinOrangnya(playerid, pInfo[playerid][pPosisiTerakhir]);

 	 // nanti selama 5 detik kemudian barulah funsin yang namanya unfreezeme alias membuat karkater bergerak kembali bisa di lanjutkan.

 	
    if(StatusPlayerTerkill[playerid] == 1)
		{
			SpawnPlayer(playerid);
			StatusPlayerTerkill[playerid] = 0;
		    PindahinOrangnya(playerid, Float:-44.9554, Float:142.0473, Float:1000.0493);
			ApplyAnimation(playerid, "CRACK", "crckdeth2",4.0,0,0,0,0,0);
			ShowPlayerDialog(playerid,RESPONDDIALOGKOSONG,DIALOG_STYLE_MSGBOX,"{EE7777}Pingsan sudah lama berlangsung\n","\n*"COL_RED" Mohon istrihat tidur sebentar.\n\nJagalah kesehatan anda karena itu penting!","OK","");	
			printf("* Di temukan %s telah pingsan dan bangun di rumah sakit sekitar san fierro, mohon untuk di jenguk segera. %s", GetRPName(playerid));
			SetPlayerTime(playerid, 0, 0);
			SetPlayerVirtualWorld(playerid, -1);
			SetPlayerInterior(playerid, -1);
		    SetPlayerSkin(playerid, 187);

		    return 1;
		}
	
	//PindahinOrangnya(playerid, pInfo[playerid][pPosisiTerakhir]);
	//Under OnPlayerSpawn:
	GangZoneShowForPlayer(playerid, BlackRadar, 0x000000FF);
	PlayerPlaySound(playerid,6401,0.0,0.0,0.0);
	/*
	if(PlayerInfo[playerid][pSAPD] = 1)
	{
		//SetPlayerPos(playerid, Float:x, Float:y, Float:z)
		PindahinOrangnya(playerid, -44.9554,142.0473,1000.0493);
	}
	*/
	new Float:nyawa;
	if(GetPlayerHealth(playerid, Float:nyawa) > 10.0)
	{
		//SetPlayerPos(playerid, Float:x, Float:y, Float:z)
		PindahinOrangnya(playerid, -44.9554,142.0473,1000.0493);
		ApplyAnimation(playerid, "CRACK", "crckdeth2",4.0,0,0,0,0,0);
		ShowPlayerDialog(playerid,RESPONDDIALOGKOSONG,DIALOG_STYLE_MSGBOX,"{EE7777}Anda Cedera\n","\n*"COL_RED" Mohon istrihat tidur sebentar.\n\nJagalah kesehatan anda karena itu penting!","OK","");	
		printf("* Di temukan %s telah pingsan dan bangun di rumah sakit sekitar san fierro, mohon untuk di jenguk segera. %f", GetRPName(playerid), Float:nyawa);
		SetPlayerTime(playerid, 0, 0);
		return 1;
	}
	
	
	//new randSpawn = 0;
	//new day, month, year;
	//new tanggalkejadian = getdate(day, month, year);
	
	
	//TogglePlayerClock(playerid,1);
 	
	//GivePlayerMoney(playerid, 9999);
	//return cmd_rumahsakit(playerid);

	/*
	if(CITY_LOS_SANTOS == gPlayerCitySelection[playerid]) {
 	    randSpawn = random(sizeof(gRandomSpawns_LosSantos));
 	    SetPlayerPos(playerid,
		 gRandomSpawns_LosSantos[randSpawn][0],
		 gRandomSpawns_LosSantos[randSpawn][1],
		 gRandomSpawns_LosSantos[randSpawn][2]);
		SetPlayerFacingAngle(playerid,gRandomSpawns_LosSantos[randSpawn][3]);
	}
	else if(CITY_SAN_FIERRO == gPlayerCitySelection[playerid]) {
 	    randSpawn = random(sizeof(gRandomSpawns_SanFierro));
 	    SetPlayerPos(playerid,
		 gRandomSpawns_SanFierro[randSpawn][0],
		 gRandomSpawns_SanFierro[randSpawn][1],
		 gRandomSpawns_SanFierro[randSpawn][2]);
		SetPlayerFacingAngle(playerid,gRandomSpawns_SanFierro[randSpawn][3]);
	}
	else if(CITY_LAS_VENTURAS == gPlayerCitySelection[playerid]) {
 	    randSpawn = random(sizeof(gRandomSpawns_LasVenturas));
 	    SetPlayerPos(playerid,
		 gRandomSpawns_LasVenturas[randSpawn][0],
		 gRandomSpawns_LasVenturas[randSpawn][1],
		 gRandomSpawns_LasVenturas[randSpawn][2]);
		SetPlayerFacingAngle(playerid,gRandomSpawns_LasVenturas[randSpawn][3]);
	}

	*/
	SetPlayerColor(playerid,COLOR_RED);


	SetPlayerSkillLevel(playerid,WEAPONSKILL_PISTOL,200);
    SetPlayerSkillLevel(playerid,WEAPONSKILL_PISTOL_SILENCED,200);
    SetPlayerSkillLevel(playerid,WEAPONSKILL_DESERT_EAGLE,200);
    SetPlayerSkillLevel(playerid,WEAPONSKILL_SHOTGUN,200);
    SetPlayerSkillLevel(playerid,WEAPONSKILL_SAWNOFF_SHOTGUN,200);
    SetPlayerSkillLevel(playerid,WEAPONSKILL_SPAS12_SHOTGUN,200);
    SetPlayerSkillLevel(playerid,WEAPONSKILL_MICRO_UZI,200);
    SetPlayerSkillLevel(playerid,WEAPONSKILL_MP5,200);
    SetPlayerSkillLevel(playerid,WEAPONSKILL_AK47,200);
    SetPlayerSkillLevel(playerid,WEAPONSKILL_M4,200);
    SetPlayerSkillLevel(playerid,WEAPONSKILL_SNIPERRIFLE,200);

    //GivePlayerWeapon(playerid,WEAPON_COLT45,100);
   
    if(KeadaanLelah[playerid] == 1)
    {
    	KeadaanLelah[playerid] = 0;
    	//SetPlayerProgressBarValue(playerid, PlayerBar:barid, Float:value)
    	SetPlayerProgressBarValue(playerid, PlayerBar:pInfo[playerid][pLaparBar], Float:100.0);
    	PindahinOrangnya(playerid, Float:-44.9554, Float:142.0473, Float:1000.0493);
		ApplyAnimation(playerid, "CRACK", "crckdeth2",4.0,0,0,0,0,0);
		ShowPlayerDialog(playerid,RESPONDDIALOGKOSONG,DIALOG_STYLE_MSGBOX,"{EE7777}Wah ketemu lagi\n","\n*"COL_GREEN" Anda sedikit cedera\n\nJagalah kesehatan anda karena itu penting!","OK","");	
		printf("* Di temukan %s telah pingsan dan bangun di rumah sakit sekitar san fierro, mohon untuk di jenguk segera. %s", GetRPName(playerid));
		SetPlayerTime(playerid, 0, 0);
		SetPlayerVirtualWorld(playerid, -1);
		SetPlayerInterior(playerid, -1);
	    SetPlayerSkin(playerid, 187);

	    SetActorPos(susterdiresepsionis,  Float:-44.9554 + 2, Float:142.0473, Float:1000.0493);
    }
	
    if(StatusBaruLogin[playerid] == 0)
    {
    	//ShowPlayerDialog(playerid,RESPONDDIALOGKOSONG,DIALOG_STYLE_MSGBOX,""COL_RED"Anda sedang pusing\n","\n*"COL_GREEN" Perlu di ingat untuk jangan berhutang\n\nJagalah kesehatan anda karena itu penting!","Baik","");

    }
    //SetPlayerPos(playerid, Float:x, Float:y, Float:z);
	//SetPlayerVirtualWorld(playerid, pInfo[playerid][pWord]);
	//SetPlayerInterior(playerid, pInfo[playerid][pInterior]);
	
	return 1;
}
//----------------------------------------------------------


//----------------------------------------------------------

public OnPlayerFinishedDownloading(playerid)
{
    SendClientMessage(playerid,COLOR_WHITE,"Downloads finished.");

	return 1;
}


//----------------------------------------------------------

// ini script tambah paku
perintahpaku(const string[], &index)
{
	new length = strlen(string);
	while ((index < length) && (string[index] <= ' '))
	{
		index++;
	}

	new offset = index;
	new result[20];
	while ((index < length) && (string[index] > ' ') && ((index - offset) < (sizeof(result) - 1)))
	{
		result[index - offset] = string[index];
		index++;
	}
	result[index - offset] = EOS;
	return result;
}

// tambah paku selesai

// on player connect tempat paling bagus menghapus segala object yang di tambah ataupun yang ada.

public OnPlayerConnect(playerid)
{	
	SelectTextDraw(playerid, COLOR_BLUE);

	SetSpawnInfo(0, 0, 0, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 0, 0);
	TogglePlayerSpectating(playerid, true);
	//InterpolateCameraPos(playerid, Float:FromX, Float:FromY, Float:FromZ, Float:ToX, Float:ToY, Float:ToZ, time, cut = CAMERA_CUT)
	InterpolateCameraPos(playerid,  Float:1584.7772, Float:-2155.6304, Float:13.8035, Float:1544.4404, Float:-2281.2668, Float:13.3828, 17000, CAMERA_MOVE); 
	//InterpolateCameraLookAt(playerid, Float:FromX, Float:FromY, Float:FromZ, Float:ToX, Float:ToY, Float:ToZ, time, cut = CAMERA_CUT)
	InterpolateCameraLookAt(playerid,  Float:1584.7772, Float:-2155.6304, Float:13.8035, Float:1494.7446, Float:-2293.4832, Float:18.2991, CAMERA_MOVE);
	
	
	

	for( new w = 0; w < 4; w++)
	{
	    TextDrawHideForPlayer(playerid, Text:UI[w]);
	    //TextDrawShowForPlayer(playerid,UI[w]);

	    /*
	    new teksenergy = CreatePlayerTextDraw(playerid, 537.000000, 140.000000, "Energy");
		PlayerTextDrawBackgroundColor(playerid, teksenergy, 0);
		PlayerTextDrawFont(playerid, teksenergy, 5);
		PlayerTextDrawLetterSize(playerid, teksenergy, 0.539999, 1.400000);
		PlayerTextDrawColor(playerid, teksenergy, -1);
		PlayerTextDrawSetOutline(playerid, teksenergy, 1);
		PlayerTextDrawSetProportional(playerid, teksenergy, 1);
		PlayerTextDrawUseBox(playerid, teksenergy, 1);
		PlayerTextDrawBoxColor(playerid, teksenergy, 0);
		PlayerTextDrawTextSize(playerid, teksenergy, 51.000000, 37.000000);
		PlayerTextDrawSetPreviewModel(playerid, teksenergy, 1543);
		PlayerTextDrawSetPreviewRot(playerid, teksenergy, 0.0000, 0.0000, 0.0000);
		*/
	}

	//GetPlayerCameraTargetObject(playerid);


	//if(IsPlayerNPC(playerid) == 1)
	//{
		
		
		//return cmd_spawn(playerid);
		
	//} 
	//new dataid[250];
    //format(dataid, sizeof(dataid), "SELECT * FROM `playerdata` WHERE `id` COLLATE latin1_general_cs = '%i' LIMIT 1", pInfo[playerid][ID]);
    //mysql_query(g_Sql, dataid);

	SetPlayerInterior(playerid, 0);
	SetPlayerVirtualWorld(playerid, 0);
	//PindahinOrangnya(playerid, 1557.3281,-2260.5244,13.5407);
	
	

    
	//SetCameraBehindPlayer(playerid);
	TogglePlayerControllable(playerid, 1);
	//SetPlayerSkin(playerid, 187);
	//0 // supaya ga ada skin selection...
	// lokasi saat spawn


	
	//ConnectMySQL();
    GetPlayerName(playerid, pInfo[playerid][Nick], 24);
     //gets the player's name and stores it to to your enum pInfo[playerid][Nick]
    GetPlayerIp(playerid, pInfo[playerid][IP], 16); //Gets the IP of the player and stores it to pInfo[playerid][IP]
   // mysql_log( ERROR | WARNING ); // we query the statement above
   // mysql_escape_string(pInfo[playerid][Nick], pInfo[playerid][Nick]); 
    //fopen("logs/pay.log", io_write);

    
    //mysql_connect_file("mysql.ini");// now we have to escape the name inorder to escape any mysql injections. ([url]http://en.wikipedia.org/wiki/SQL_injection[/url])
   	//format(Query, 500, "SELECT `nick` FROM `playerdata` WHERE `nick` COLLATE latin1_general_cs = '%s' LIMIT 1", pInfo[playerid][Nick]); // here we are selecting the name of the player who logged in from the database.
    //mysql_query(g_Sql, Query, true);


    new passworddariuser[500];
    format(passworddariuser, 500, "SELECT * FROM `playerdata` WHERE `nick` COLLATE latin1_general_cs = '%s' LIMIT 1", pInfo[playerid][Nick]); // now here check the database if the player has given the proper password.HTTP
	//mysql_query(MySQL:handle, const query[], bool:use_cache = true)
	mysql_query(MySQL:g_Sql, passworddariuser, bool:true);

	//new datapw[250];
    //format(datapw, sizeof(datapw), "SELECT * FROM `playerdata` WHERE `nick` COLLATE latin1_general_cs = '%s' LIMIT 1", pInfo[playerid][Nick]);
    //mysql_query(g_Sql, datapw);

	
	cache_get_value_int(0, "id", pInfo[playerid][ID]); 
	cache_get_value_name(0, "password", pInfo[playerid][Sandi], 50);
	cache_get_value_name(0, "UCP", pInfo[playerid][UCP], 20);
	cache_get_value_int(0, "JobMechanic", pInfo[playerid][pJobMechanic]);
	cache_get_value_int(0, "skin", pInfo[playerid][pSkin]);
	cache_get_value_int(0, "component", pInfo[playerid][pComponent]);
	cache_get_value_name_float(0, "ppx", Float:pInfo[playerid][pPx]); 
    cache_get_value_name_float(0, "ppy", Float:pInfo[playerid][pPy]);
    cache_get_value_name_float(0, "ppz", Float:pInfo[playerid][pPz]);
    cache_get_value_name_float(0, "pmx", Float:pInfo[playerid][pMx]); 
    cache_get_value_name_float(0, "pmy", Float:pInfo[playerid][pMy]);
    cache_get_value_name_float(0, "pmz", Float:pInfo[playerid][pMz]);
    cache_get_value_name_float(0, "healthm1", Float:pInfo[playerid][pHealtM1]);
	cache_get_value_int(0, "tipemobil", pInfo[playerid][pTipeMobil]);
	new inputtext[600];
	new yangdiinput[600];
	format(yangdiinput, 600, "Anda %s selaku kode %i mengetik password "COL_RED" %s padahal password anda %s ", pInfo[playerid][Nick], pInfo[playerid][ID], inputtext, pInfo[playerid][Sandi]);
    SendClientMessage(playerid, COLOR_SPRINGGREEN, yangdiinput); 
    //cache_get_result_count(); // next we store the result inorder for it to be used further ahead.

    ///*

    TextDrawShowForPlayer(playerid, Text:TeksSaatLogin);
    // bagian dimana player diminta login passsowrd


    if(cache_num_rows() > 0) // if the  database has more then one table with the given name
    {//then
    	

		//SetCameraBehindPlayer(playerid);
		
		
		
		// dialog yang di hilangkan.
        //ShowPlayerDialog(playerid, 1, DIALOG_STYLE_PASSWORD, ""COL_GREEN"Selamat Datang Mari Login via Akun", "\n \n"COL_RED"Nama user ini sudah di daftarkan mohon sebutkan sandi yang cocok:\n\n\n", "Login", "");
        pInfo[playerid][Logged] = 0;
        
		 
		

		TogglePlayerControllable(playerid, 1);
		
		SetPlayerInterior(playerid, 0);
		SetPlayerVirtualWorld(playerid, 0);
		//InterpolateCameraPos(playerid, Float:1573.5380, Float:-2328.9688, Float:20.9819, Float:1493.3318, Float:-2286.1392, Float:22.3049, 30000, CAMERA_MOVE);
		//InterpolateCameraLookAt(playerid, Float:1573.5380, Float:-2328.9688, Float:20.9819, Float:1493.3318, Float:-2286.1392, Float:22.3049, 30000, CAMERA_MOVE);
        // saat konek minta password

         // show the login dialog and tell the player to login.
    }
    else // else if the database found no tables with the given name
    { // then
        ShowPlayerDialog(playerid, 2, DIALOG_STYLE_INPUT, "Register", "This account not registered yet! Please register:", "Register", "");// show the register dialog and tell the player to register
    }
    //cache_get_row_count(); // here we free the result we stored in the beginning as we do not need it anymore.
    //You must always free the mysql result to avoid
    //there being massive memory usage.

    //*/



    /*
    if(Connection) //checks if the database is successfully connected
    {
        new dest[200];
        mysql_stat(dest); // display the mysql database statistics.
        printf(dest);
        printf(">> MySQL connection successfully initialized"); // if it is connected it will display this line, if not then it wont display anything.
    }
	*/
    //my_options = mysql_init_options();
    //mysql_set_option(my_options, AUTO_RECONNECT, true); 
	//SetGameModeText("Scrift Sering Sakit Maaf");
	

	
    // class selection init vars
  	//gPlayerCitySelection[playerid] = 1;
	//gPlayerHasCitySelected[playerid] = 1;
	//gPlayerLastCitySelectionTick[playerid] = GetTickCount();
	//TextDrawCreateEx(637.000000, 3.000000, "~n~"DUNIA PUTU"~n~"SIAP MELAYANI"~n~", 255, 1, 0.149999, 0.899999, -1, 3, 1, true);
     //GetTickCount();

	//Remove Buildings khusus RS bandara///////////////////////////////////////////////////////////////////////////////////////////////
	//CA_RemoveBuilding(modelid, Float:x, Float:y, Float:z, Float:radius)
	RemoveBuildingForPlayer(playerid, 4828, 1474.410, -2286.800, 26.359, 0.250);
	RemoveBuildingForPlayer(playerid, 4942, 1474.410, -2286.800, 26.359, 0.250);
	RemoveBuildingForPlayer(playerid, 4835, 1466.770, -2286.439, 16.585, 0.250);
	RemoveBuildingForPlayer(playerid, 4941, 1466.770, -2286.439, 16.585, 0.250);
	RemoveBuildingForPlayer(playerid, 3657, 1612.609, -2333.209, 13.023, 0.250);
	RemoveBuildingForPlayer(playerid, 4995, 1682.069, -2330.610, 16.898, 0.250);
	RemoveBuildingForPlayer(playerid, 4504, 56.382, -1531.449, 6.726, 0.250);
	RemoveBuildingForPlayer(playerid, 4890, 1683.219, -2328.429, 11.875, 0.250);
	RemoveBuildingForPlayer(playerid, 4946, 1683.219, -2328.429, 11.875, 0.250);
	RemoveBuildingForPlayer(playerid, 4832, 1610.800, -2285.840, 52.750, 0.250);
	RemoveBuildingForPlayer(playerid, 4948, 1610.800, -2285.840, 52.750, 0.250);
	RemoveBuildingForPlayer(playerid, 3658, 1722.650, -2237.550, 12.992, 0.250);
	RemoveBuildingForPlayer(playerid, 4991, 1683.219, -2242.959, 11.789, 0.250);
	RemoveBuildingForPlayer(playerid, 5012, 1683.219, -2242.959, 11.789, 0.250);
	RemoveBuildingForPlayer(playerid, 4830, 1687.780, -2286.540, 10.250, 0.250);
	RemoveBuildingForPlayer(playerid, 4947, 1687.780, -2286.540, 10.250, 0.250);

	//taman gurun
	RemoveBuildingForPlayer(playerid, 621, 1313.2969, 2767.4844, 9.8203, 0.25);
	RemoveBuildingForPlayer(playerid, 621, 1314.6875, 2764.9453, 9.8203, 0.25);
	RemoveBuildingForPlayer(playerid, 647, 1308.5859, 2760.0703, 9.8203, 0.25);


	// ini hapus bagian pemadam kembaran ELS
	//RemoveBuildingForPlayer(playerid, modelid, Float:fX, Float:fY, Float:fZ, Float:fRadius)
	RemoveBuildingForPlayer(playerid, 1297, 2278.5469, -1544.1797, 29.0938, 0.25);
	RemoveBuildingForPlayer(playerid, 1297, 2278.5469, -1512.9609, 29.0938, 0.25);
	RemoveBuildingForPlayer(playerid, 946, 2290.6406, -1541.6094, 28.0703, 0.25);
	RemoveBuildingForPlayer(playerid, 946, 2290.5781, -1514.2734, 28.0469, 0.25);
	RemoveBuildingForPlayer(playerid, 1297, 2300.3672, -1544.1797, 29.0938, 0.25);
	RemoveBuildingForPlayer(playerid, 1297, 2300.3672, -1512.9609, 29.0938, 0.25);
	RemoveBuildingForPlayer(playerid, 1297, 2305.5859, -1512.9609, 27.2188, 0.25);
	RemoveBuildingForPlayer(playerid, 1297, 2305.5859, -1544.1797, 27.2188, 0.25);
	RemoveBuildingForPlayer(playerid, 946, 2316.9375, -1541.6094, 26.5000, 0.25);
	RemoveBuildingForPlayer(playerid, 946, 2316.9375, -1514.2734, 26.5000, 0.25);
	RemoveBuildingForPlayer(playerid, 1297, 2337.8125, -1523.8281, 26.2266, 0.25);
	RemoveBuildingForPlayer(playerid, 1297, 2327.4063, -1544.1797, 27.2188, 0.25);
	RemoveBuildingForPlayer(playerid, 1297, 2327.4063, -1512.9609, 27.2188, 0.25);


	//Remove Buildings untuk doop bar///////////////////////////////////////////////////////////////////////////////////////////////
	RemoveBuildingForPlayer(playerid, 759, 975.546, -1547.969, 20.835, 0.250);
	RemoveBuildingForPlayer(playerid, 759, 979.789, -1547.969, 20.835, 0.250);
	RemoveBuildingForPlayer(playerid, 759, 984.039, -1547.969, 20.835, 0.250);
	RemoveBuildingForPlayer(playerid, 759, 967.062, -1547.969, 20.835, 0.250);
	RemoveBuildingForPlayer(playerid, 759, 971.304, -1547.969, 20.835, 0.250);
	RemoveBuildingForPlayer(playerid, 759, 962.812, -1547.969, 20.835, 0.250);
	RemoveBuildingForPlayer(playerid, 759, 962.812, -1559.910, 20.835, 0.250);
	RemoveBuildingForPlayer(playerid, 759, 967.062, -1559.910, 20.835, 0.250);
	RemoveBuildingForPlayer(playerid, 759, 971.304, -1559.910, 20.835, 0.250);
	RemoveBuildingForPlayer(playerid, 759, 975.546, -1559.910, 20.835, 0.250);
	RemoveBuildingForPlayer(playerid, 759, 979.789, -1559.910, 20.835, 0.250);
	RemoveBuildingForPlayer(playerid, 759, 984.039, -1559.910, 20.835, 0.250);

	    // Create their own vehicle and put them in
	    
	RemoveBuildingForPlayer(playerid, 1294, 1812.3047, -1455.5078, 16.9063, 0.25);
	RemoveBuildingForPlayer(playerid, 4606, 1825.0000, -1413.9297, 12.5547, 0.25);
	RemoveBuildingForPlayer(playerid, 4594, 1825.0000, -1413.9297, 12.5547, 0.25);
	RemoveBuildingForPlayer(playerid, 17535, 2364.0547, -1391.5313, 41.3516, 0.25);
	RemoveBuildingForPlayer(playerid, 17965, 2322.2813, -1355.1953, 25.4063, 0.25);
	RemoveBuildingForPlayer(playerid, 1266, 2317.5859, -1355.8281, 37.2188, 0.25);
	RemoveBuildingForPlayer(playerid, 17970, 2364.0547, -1391.5313, 41.3516, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, 2331.4453, -1373.5313, 23.0938, 0.25);
	RemoveBuildingForPlayer(playerid, 1315, 2310.0547, -1376.9453, 26.2422, 0.25);
	RemoveBuildingForPlayer(playerid, 17504, 2378.6719, -1455.2578, 26.7422, 0.25);
	RemoveBuildingForPlayer(playerid, 1297, 2308.5859, -1356.2813, 26.2266, 0.25);
	RemoveBuildingForPlayer(playerid, 17543, 2322.2813, -1355.1953, 25.4063, 0.25);
	RemoveBuildingForPlayer(playerid, 1260, 2317.5938, -1355.8203, 37.2266, 0.25);
	RemoveBuildingForPlayer(playerid, 620, 2336.9844, -1350.5781, 22.7266, 0.25);
	    
	//ForceClassSelection(playerid); // for next time they respawn coba teknis class
  	// ini untuk remove building di mechanic map center
  	//Remove Buildings///////////////////////////////////////////////////////////////////////////////////////////////
	RemoveBuildingForPlayer(playerid, 5551, 2140.515, -1735.140, 15.890, 0.250);
	RemoveBuildingForPlayer(playerid, 1412, 2116.726, -1713.460, 13.703, 0.250);
	RemoveBuildingForPlayer(playerid, 1412, 2118.093, -1718.546, 13.703, 0.250);
	RemoveBuildingForPlayer(playerid, 1412, 2121.375, -1721.687, 13.703, 0.250);
	RemoveBuildingForPlayer(playerid, 1412, 2126.578, -1722.468, 13.703, 0.250);
	RemoveBuildingForPlayer(playerid, 5410, 2140.515, -1735.140, 15.890, 0.250);

	// remove building mechanic center selesai
    
    new selamatdatang[200];
    format(selamatdatang, 200, "~w~HAI SELAMA DATANG~n~~r~%s", pInfo[playerid][Nick]);
	GameTextForPlayer(playerid,selamatdatang,6000,4);
	PlayerPlaySound(playerid, 4, 0.0, 0.0, 10.0);
	//Create3DTextLabel(text_info,256, "{FFFFFF}[{88EE88}Kerja{FFFFFF}]", 1112.0814,-1250.2550,15.9391)
  	SendClientMessage(playerid,COLOR_WHITE,"Welcome to {88AA88}Putu{FFFFFF}Suhartawan {88AA88}Corp{FFFFFF}Agency");
  	
  	
	//SetPlayerColor(playerid,COLOR_NORMAL_PLAYER);

	/*
	Removes vending machines
	RemoveBuildingForPlayer(playerid, 1302, 0.0, 0.0, 0.0, 6000.0);
	RemoveBuildingForPlayer(playerid, 1209, 0.0, 0.0, 0.0, 6000.0);
	RemoveBuildingForPlayer(playerid, 955, 0.0, 0.0, 0.0, 6000.0);
	RemoveBuildingForPlayer(playerid, 1775, 0.0, 0.0, 0.0, 6000.0);
	RemoveBuildingForPlayer(playerid, 1776, 0.0, 0.0, 0.0, 6000.0);
	*/


	// changing cities by inputs
	
	if( !gPlayerHasCitySelected[playerid] &&
	    GetPlayerState(playerid) == PLAYER_STATE_SPECTATING ) {
	    //ClassSel_HandleCitySelection(playerid);
	    return 1;
	}
	
	// No weapons in interiors
	//if(GetPlayerInterior(playerid) != 0 && GetPlayerWeapon(playerid) != 0) {
	    //SetPlayerArmedWeapon(playerid,0); // fists
	    //return 0; // no syncing until they change their weapon
	//}

	// Don't allow minigun
	if(GetPlayerWeapon(playerid) == WEAPON_MINIGUN){
	    Kick(playerid);
	    return 0;
	}

	
	/* No jetpacks allowed
	if(GetPlayerSpecialAction(playerid) == SPECIAL_ACTION_USEJETPACK) {
	    Kick(playerid);
	    return 0;
	}

	For testing animations
    new msg[128+1];
	new animlib[32+1];
	new animname[32+1];

	thisanimid = GetPlayerAnimationIndex(playerid);
	if(lastanimid != thisanimid)
	{
		GetAnimationName(thisanimid,animlib,32,animname,32);
		format(msg, 128, "anim(%d,%d): %s %s", lastanimid, thisanimid, animlib, animname);
		lastanimid = thisanimid;
		SendClientMessage(playerid, 0xFFFFFFFF, msg);
	}*/
	// Init all of the textdraw related globals

		/*

    gHeaderTextDrawId[playerid] = PlayerText:INVALID_TEXT_DRAW;
    
    gCurrentPageTextDrawId[playerid] = PlayerText:INVALID_TEXT_DRAW;
    gNextButtonTextDrawId[playerid] = PlayerText:INVALID_TEXT_DRAW;
    gPrevButtonTextDrawId[playerid] = PlayerText:INVALID_TEXT_DRAW;

	new x=0;
	while(x != SELECTION_ITEMS) {
        gSelectionItems[playerid][x] = PlayerText:INVALID_TEXT_DRAW;
        x++;
	}

	gItemAt[playerid] = 0;

	*/

	//CONNECTNYA OBJECK SPAWNER SELESAI
	 
 	return 1;
}

//----------------------------------------------------------



//----------------------------------------------------------

forward ParkiranPolisiBuka(playerid);
public ParkiranPolisiBuka(playerid)
{
	
    DestroyDynamicObject(PintuParkiranPolisi);
    PintuParkiranPolisi = CreateDynamicObject(968, 1806.35498, -1448.79199, 13.40000,   0.00000, 90.00000, -9.90000);
    //Gate = CreateObject(968, 1952.225952, -1789.184082, 13.682809, 0, 90, 90);
    SetTimer("ParkiranPolisiBuka2", 500, false);
    GameTextForPlayer(playerid, "~w~SATPAM Says: ~r~Selamat menikmati liburan ?", 9000, 5);
   
    return 1;
}


forward ParkiranPolisiBuka2();
public ParkiranPolisiBuka2()
{
    DestroyDynamicObject(PintuParkiranPolisi);
    PintuParkiranPolisi = CreateDynamicObject(968, 1806.35498, -1448.79199, 13.40001,   0.00000, 80.00000, -9.90000);
    //Gate = CreateObject(968, 1952.225952, -1789.184082, 13.682809, 0, 90, 90);
    SetTimer("ParkiranPolisiBuka3", 500, false);
    return 1;
}


forward ParkiranPolisiBuka3();
public ParkiranPolisiBuka3()
{
    DestroyDynamicObject(PintuParkiranPolisi);
    PintuParkiranPolisi = CreateDynamicObject(968, 1806.35498, -1448.79199, 13.99999,   0.00000, 50.00000, -9.90000);
    //Gate = CreateObject(968, 1952.225952, -1789.184082, 13.682809, 0, 90, 90);
    SetTimer("ParkiranPolisiTutup", 10000, false);
    return 1;
}

forward ParkiranPolisiTutup();
public ParkiranPolisiTutup()
{
    DestroyDynamicObject(PintuParkiranPolisi);
    PintuParkiranPolisi = CreateDynamicObject(968, 1806.35498, -1448.79199, 13.99999,   0.00000, 50.00000, -9.90000);
    //Gate = CreateObject(968, 1952.225952, -1789.184082, 13.682809, 0, 90, 90);
    SetTimer("ParkiranPolisiTutup2", 500, false);
    return 1;
}


forward ParkiranPolisiTutup2(playerid);
public ParkiranPolisiTutup2(playerid)
{
	
	DestroyDynamicObject(PintuParkiranPolisi);
    PintuParkiranPolisi = CreateDynamicObject(968, 1806.35498, -1448.79199, 13.40000,   0.00000, 80.00000, -9.90000);
    //Gate = CreateDynamicObject(968, 1952.225952, -1789.184082, 13.682809, 0, 90, 90);
    SetTimer("ParkiranPolisiTutup3", 2000, false);
    GameTextForPlayer(playerid, "~r~AWAS PINTU MAU RAPAT", 5000, 0);
    return 1;
}

forward ParkiranPolisiTutup3();
public ParkiranPolisiTutup3()
{

    DestroyDynamicObject(PintuParkiranPolisi);
    PintuParkiranPolisi = CreateDynamicObject(968, 1806.35498, -1448.79199, 13.40000,   0.00000, 90.00000, -9.90000);
    PintuParkiranPolisiPick = CreatePickup(1212, 1, 1809.9792,-1449.8053,13.5469, -1);
    
    CreateExplosion(1812.8149,-1425.8359,13.4297,1,50);
	//Gate = CreateDynamicObject(968, 1952.225952, -1789.184082, 13.682809, 0, 90, 90);

    return 1;
}

//----------------------------------------------------------

//-----------------------------------------------------------

//----------------------------------------------------------

ClassSel_SetupCharSelection(playerid)
{
	 
	/*
   	if(gPlayerCitySelection[playerid] == CITY_LOS_SANTOS) {
		SetPlayerInterior(playerid,11);
		SetPlayerPos(playerid,508.7362,-87.4335,998.9609);
		SetPlayerFacingAngle(playerid,0.0);
    	SetPlayerCameraPos(playerid,508.7362,-83.4335,998.9609);
		SetPlayerCameraLookAt(playerid,508.7362,-87.4335,998.9609);
	} 
	/*
	else if(gPlayerCitySelection[playerid] == CITY_SAN_FIERRO) {
		SetPlayerInterior(playerid,3);
		SetPlayerPos(playerid,-2673.8381,1399.7424,918.3516);
		SetPlayerFacingAngle(playerid,181.0);
    	SetPlayerCameraPos(playerid,-2673.2776,1394.3859,918.3516);
		SetPlayerCameraLookAt(playerid,-2673.8381,1399.7424,918.3516);
	}
	
	else if(gPlayerCitySelection[playerid] == CITY_LAS_VENTURAS) {
		SetPlayerInterior(playerid,3);
		SetPlayerPos(playerid,349.0453,193.2271,1014.1797);
		SetPlayerFacingAngle(playerid,286.25);
    	SetPlayerCameraPos(playerid,352.9164,194.5702,1014.1875);
		SetPlayerCameraLookAt(playerid,349.0453,193.2271,1014.1797);
	}
	*/
	
}

//----------------------------------------------------------
// Used to init textdraws of city names

ClassSel_InitCityNameText(Text:txtInit)
{
  	TextDrawUseBox(txtInit, 0);
	TextDrawLetterSize(txtInit,1.25,3.0);
	TextDrawFont(txtInit, 0);
	TextDrawSetShadow(txtInit,0);
    TextDrawSetOutline(txtInit,1);
    TextDrawColor(txtInit,0xEEEEEEFF);
    TextDrawBackgroundColor(txtClassSelHelper,0x000000FF);
}

//----------------------------------------------------------

ClassSel_InitTextDraws()
{
	/*
    // Init our observer helper text display
	txtLosSantos = TextDrawCreate(10.0, 380.0, "Muncul di Los Santos");
	ClassSel_InitCityNameText(txtLosSantos);
	txtSanFierro = TextDrawCreate(10.0, 380.0, "Ke San Fierro");
	ClassSel_InitCityNameText(txtSanFierro);
	txtLasVenturas = TextDrawCreate(10.0, 380.0, "Pilih Las Venturas");
	ClassSel_InitCityNameText(txtLasVenturas);

    // Init our observer helper text display
	txtClassSelHelper = TextDrawCreate(10.0, 415.0,
	   " Press ~b~~k~~GO_LEFT~ ~w~or ~b~~k~~GO_RIGHT~ ~w~to switch cities.~n~ Press ~r~~k~~PED_FIREWEAPON~ ~w~to select.");
	TextDrawUseBox(txtClassSelHelper, 1);
	TextDrawBoxColor(txtClassSelHelper,0x222222BB);
	TextDrawLetterSize(txtClassSelHelper,0.3,1.0);
	TextDrawTextSize(txtClassSelHelper,400.0,40.0);
	TextDrawFont(txtClassSelHelper, 2);
	TextDrawSetShadow(txtClassSelHelper,0);
    TextDrawSetOutline(txtClassSelHelper,1);
    TextDrawBackgroundColor(txtClassSelHelper,0x000000FF);
    TextDrawColor(txtClassSelHelper,0xFFFFFFFF);


	*/
}

//----------------------------------------------------------

ClassSel_SetupSelectedCity(playerid)
{
	/*
	if(gPlayerCitySelection[playerid] == -1) {
		gPlayerCitySelection[playerid] = CITY_LOS_SANTOS;
	}
	
	if(gPlayerCitySelection[playerid] == CITY_LOS_SANTOS) {
		SetPlayerInterior(playerid,0);
   		SetPlayerCameraPos(playerid,1630.6136,-2286.0298,110.0);
		SetPlayerCameraLookAt(playerid,1887.6034,-1682.1442,47.6167);
		
		TextDrawShowForPlayer(playerid,txtLosSantos);
		TextDrawHideForPlayer(playerid,txtSanFierro);
		TextDrawHideForPlayer(playerid,txtLasVenturas);
	}
	else if(gPlayerCitySelection[playerid] == CITY_SAN_FIERRO) {
		SetPlayerInterior(playerid,0);
   		SetPlayerCameraPos(playerid,-1300.8754,68.0546,129.4823);
		SetPlayerCameraLookAt(playerid,-1817.9412,769.3878,132.6589);
		
		TextDrawHideForPlayer(playerid,txtLosSantos);
		TextDrawShowForPlayer(playerid,txtSanFierro);
		TextDrawHideForPlayer(playerid,txtLasVenturas);
	}
	else if(gPlayerCitySelection[playerid] == CITY_LAS_VENTURAS) {
		SetPlayerInterior(playerid,0);
   		SetPlayerCameraPos(playerid,1310.6155,1675.9182,110.7390);
		SetPlayerCameraLookAt(playerid,2285.2944,1919.3756,68.2275);
		
		TextDrawHideForPlayer(playerid,txtLosSantos);
		TextDrawHideForPlayer(playerid,txtSanFierro);
		TextDrawShowForPlayer(playerid,txtLasVenturas);
	}

	*/
}

//----------------------------------------------------------

ClassSel_SwitchToNextCity(playerid)
{
	/*
    gPlayerCitySelection[playerid]++;
	if(gPlayerCitySelection[playerid] > CITY_LAS_VENTURAS) {
	    gPlayerCitySelection[playerid] = CITY_LOS_SANTOS;
	}
	PlayerPlaySound(playerid,1052,0.0,0.0,0.0);
	gPlayerLastCitySelectionTick[playerid] = GetTickCount();
	ClassSel_SetupSelectedCity(playerid);
	*/
}

//----------------------------------------------------------

ClassSel_SwitchToPreviousCity(playerid)
{
    gPlayerCitySelection[playerid]--;
	if(gPlayerCitySelection[playerid] < CITY_LOS_SANTOS) {
	    gPlayerCitySelection[playerid] = CITY_LAS_VENTURAS;
	}
	PlayerPlaySound(playerid,1053,0.0,0.0,0.0);
	gPlayerLastCitySelectionTick[playerid] = GetTickCount();
	ClassSel_SetupSelectedCity(playerid);
}

//----------------------------------------------------------

ClassSel_HandleCitySelection(playerid)
{
	new Keys,ud,lr;
    GetPlayerKeys(playerid,Keys,ud,lr);
    
    if(gPlayerCitySelection[playerid] == -1) {
		ClassSel_SwitchToNextCity(playerid);
		return;
	}
	
	// only allow new selection every ~500 ms
	if( (GetTickCount() - gPlayerLastCitySelectionTick[playerid]) < 500 ) return;
	
	if(Keys & KEY_FIRE) {
		SetPlayerSkin(playerid, 187);
	    gPlayerHasCitySelected[playerid] = 1;
	    TextDrawHideForPlayer(playerid,txtClassSelHelper);
		TextDrawHideForPlayer(playerid,txtLosSantos);
		TextDrawHideForPlayer(playerid,txtSanFierro);
		TextDrawHideForPlayer(playerid,txtLasVenturas);
	    TogglePlayerSpectating(playerid,0);
	     
	    return;
	}
	
	if(lr > 0) {
	   ClassSel_SwitchToNextCity(playerid);
	}
	else if(lr < 0) {
	   ClassSel_SwitchToPreviousCity(playerid);
	}
}

stock ApplyAnimationEx(playerid, animlib[], animname[], Float:fDelta, loop, lockx, locky, freeze, time, forcesync = 0)
{
	ApplyAnimation(playerid, animlib, animname, fDelta, loop, lockx, locky, freeze, time, forcesync);

	PlayerData[playerid][pLoopAnim] = true;
	ShowPlayerFooter(playerid, "Press ~y~SPRINT~w~ to stop the animation.");

	return 1;
}



	






//----------------------------------------------------------

public OnPlayerRequestClass(playerid, classid)
{
	  
	SetPlayerCameraPos(playerid, Float:1494.7446, Float:-2293.4832, Float:18.2991);
    SetPlayerCameraLookAt(playerid, Float:1494.7446, Float:-2293.4832, Float:18.29911557, CAMERA_MOVE);

	if(IsPlayerNPC(playerid)) return 1;


	/*
	if(gPlayerHasCitySelected[playerid]) 
	{
		//ClassSel_SetupCharSelection(playerid);
		SetPlayerSkin(playerid, 187);
		return 1;
	} 
	else 
	{
		if(GetPlayerState(playerid) != PLAYER_STATE_SPECTATING) 
		{
			//TogglePlayerSpectating(playerid,1);
    		//TextDrawShowForPlayer(playerid, txtClassSelHelper);
    		gPlayerCitySelection[playerid] = -1;
		}
  	}
	*/
    

    // scripting tempat orang harusnya mati
    if(StatusPlayerTerkill[playerid] == 1)
	{
		SpawnPlayer(playerid);
		StatusPlayerTerkill[playerid] = 0;
	    PindahinOrangnya(playerid, Float:-44.9554, Float:142.0473, Float:1000.0493);
		ApplyAnimation(playerid, "CRACK", "crckdeth2",4.0,0,0,0,0,0);
		ShowPlayerDialog(playerid,RESPONDDIALOGKOSONG,DIALOG_STYLE_MSGBOX,"{EE7777}Pingsan sudah lama berlangsung\n","\n*"COL_RED" Mohon istrihat tidur sebentar.\n\nJagalah kesehatan anda karena itu penting!","OK","");	
		printf("* Di temukan %s telah pingsan dan bangun di rumah sakit sekitar san fierro, mohon untuk di jenguk segera. %s", GetRPName(playerid));
		SetPlayerTime(playerid, 0, 0);
		SetPlayerVirtualWorld(playerid, -1);
		SetPlayerInterior(playerid, -1);
	    SetPlayerSkin(playerid, 187);
	    return 1;
	}



	return 1;
	

}

forward ConnectMySQL();
public ConnectMySQL()
{

	//mysql_connect(const host[], const user[], const password[], const database[], MySQLOpt:option_id = MySQLOpt:0)
	g_Sql = mysql_connect(SQL_HOST, SQL_USER, SQL_PASS, SQL_DB, MySQLOpt:0);
	//mysql_connect_file("my.ini");
    //mysql_errno(handle = MYSQL_DEFAULT_HANDLE)
    if(mysql_errno(MySQL:g_Sql) != 0)
    {
        print("[MYSQL]: Failed to connect with using Following Informations: ");
        printf(" Host: %s | User: %s | Password: ****** | Database: %s", SQL_HOST, SQL_USER, SQL_DB);

        //mysql_query("CREATE TABLE IF NOT EXISTS `players`(`id` int(11) NOT NULL auto_increment PRIMARY KEY,`Username` varchar(30) NOT NULL,`Password` varchar(50) NOT NULL,`Money` int(10) NOT NULL default '0')");
    }
    else
    {
        

        printf("[MYSQL]: Connection Success to database: %s !", SQL_DB);
        printf(" Host: %s | User: %s | Password: ****** | Database: %s", SQL_HOST, SQL_USER, SQL_DB);
    }
	return 1;
}


stock Log(sz_fileName[], sz_input[]) {

	new
		sz_logEntry[156],
		i_dateTime[2][3],
		File: fileHandle = fopen(sz_fileName, io_append);

	gettime(i_dateTime[0][0], i_dateTime[0][1], i_dateTime[0][2]);
	getdate(i_dateTime[1][0], i_dateTime[1][1], i_dateTime[1][2]);

	format(sz_logEntry, sizeof(sz_logEntry), "[%i/%i/%i - %i:%i:%i] %s\r\n", i_dateTime[1][0], i_dateTime[1][1], i_dateTime[1][2], i_dateTime[0][0], i_dateTime[0][1], i_dateTime[0][2], sz_input);
	fwrite(fileHandle, sz_logEntry);
	return fclose(fileHandle);
}

//----------------------------------------------------------

public OnActorStreamIn(actorid, forplayerid)
{
	if(actorid == susterdiresepsionis)
	{
		SendClientMessage(forplayerid, 0xFFFFFFFF, "Clarentine Ainsley says: Pak ada yang bisa bantu?");
		SendClientMessage(forplayerid, COLOR_ME, "* Clarentine Ainsley terseyum kepada tamu dengan menonjolkan bulu mata yang lentik.");
	}

    new string[40];
    format(string, sizeof(string), "Actor %d is now streamed in for you.", actorid);
    SendClientMessage(forplayerid, 0xFFFFFFFF, string);
    return 1;
}

public OnActorStreamOut(actorid, forplayerid)
{
    new string[40];
    format(string, sizeof(string), "Actor %d is now streamed out for you.", actorid);
    SendClientMessage(forplayerid, 0xFFFFFFFF, string);
    return 1;
}



//----------------------------------------------------------



//----------------------------------------------------------

/*
ProcessVehicleCommands(playerid, cmdtext[])
{
    new cmd[256+1];
	new	idx;

	cmd = strtok(cmdtext, idx);


	if(!strcmp(cmd, "/lights",true)) {
        new vid = GetPlayerVehicleID(playerid);
	  	if(vid != INVALID_VEHICLE_ID) {
			ToggleVehicleLights(vid);
		}
	    return 1;
	}
	if(!strcmp(cmd, "/hood",true) || !strcmp(cmd, "/bonnet",true)) {
        new vid = GetPlayerVehicleID(playerid);
	  	if(vid != INVALID_VEHICLE_ID) {
			ToggleVehicleHood(vid);
		}
	    return 1;
	}
	if(!strcmp(cmd, "/trunk",true) || !strcmp(cmd, "/boot",true)) {
        new vid = GetPlayerVehicleID(playerid);
	  	if(vid != INVALID_VEHICLE_ID) {
			ToggleVehicleTrunk(vid);
		}
	    return 1;
	}
	if(!strcmp(cmd, "/lock",true)) {
        new vid = GetPlayerVehicleID(playerid);
	  	if(vid != INVALID_VEHICLE_ID) {
			ToggleVehicleDoorsLocked(vid);
		}
	    return 1;
	}

	return 0;
}


//----------------------------------------------------------

public OnPlayerCommandText(playerid, cmdtext[])
{
// ------------


	new cmd[256+1];
	new idx;
	cmd = strtok(cmdtext, idx);
	new engine,lights,alarm,doors,bonnet,boot,objective;

	//if(!IsPlayerAdmin(playerid)) return 0; // this is an admin only script

	if(strcmp(cmd, "/masukkendaraan", true) == 0)
	{
  		new tmp[256];
	  	new tmp2[256];
		tmp = strtok(cmdtext,idx);
		tmp2 = strtok(cmdtext,idx);
		PutPlayerInVehicle(strval(tmp),strval(tmp2),0);
	    return 1;
	}

	if(strcmp( cmd, "/v", true ) == 0 )
	{
		new tmp[256];
		new created_vehicle_id;
		tmp = strtok( cmdtext, idx );

		created_vehicle_id = SpawnVehicle_InfrontOfPlayer(playerid, strval(tmp), -1, -1);

		new msg[128+1];
		format(msg,128,"Created vehicle: %d",created_vehicle_id);
		SendClientMessage(playerid,0xAAAAAAAA,msg);

		return 1;
	}




	if(strcmp( cmd, "/dvehicle", true ) == 0 )
	{
		new tmp[256];
		tmp = strtok( cmdtext, idx );

		DestroyVehicle( strval(tmp) );

		new msg[256];
		format(msg,256,"Destroyed vehicle: %d",strval(tmp));
		SendClientMessage(playerid,0xAAAAAAAA,msg);

		return 1;
	}

	if(strcmp( cmd, "/goto", true ) == 0)
	{
	    new tmp[256];

	    tmp = strtok(cmdtext,idx);
	    if(!strlen(tmp)) { return 1; }

	    new Float:X, Float:Y, Float:Z;

	    if(GetPlayerVehicleID(playerid))
	    {
		    GetPlayerPos( strval(tmp), X, Y, Z );
		    SetVehiclePos( GetPlayerVehicleID(playerid), X+2, Y+2, Z );
	    } else {
		    GetPlayerPos( strval(tmp), X, Y, Z );
		    SetPlayerPos( playerid, X+2, Y+2, Z );
	    }

	    return 1;
	}

	if(strcmp(cmd, "/bring", true) == 0)
	{
	    new tmp[256];

	    tmp = strtok(cmdtext, idx);

	    if(!strlen(tmp)) { return 1; }

	    new Float:X, Float:Y, Float:Z;

	    if(GetPlayerVehicleID(strval(tmp)))
	    {
		    GetPlayerPos(playerid, X, Y, Z);
		    SetVehiclePos(GetPlayerVehicleID(strval(tmp)), X+2, Y+2, Z);
	    } else {
		    GetPlayerPos(playerid, X, Y, Z);
		    SetPlayerPos(strval(tmp), X+2, Y+2, Z);
	    }

	    return 1;
	}

	if(strcmp(cmd, "/me2v", true) == 0)
	{
	  	new tmp[256];
		tmp = strtok(cmdtext,idx);
		PutPlayerInVehicle(playerid,strval(tmp),0);
	    return 1;
	}

	if(strcmp(cmd, "/tpzero", true) == 0)
	{
	  	new vid = GetPlayerVehicleID(playerid);
	  	if(vid != INVALID_VEHICLE_ID) {
			SetVehiclePos(vid,0.0,0.0,10.0);
		}
	    return 1;
	}

	if(strcmp(cmd, "/myvw", true) == 0)
	{
        new tmp[256];
		tmp = strtok(cmdtext,idx);
		SetPlayerPos(playerid, 0.0, 0.0, 15.0);
		SetPlayerVirtualWorld(playerid,strval(tmp));
	    return 1;
	}

	if(strcmp( cmd, "/fight", true ) == 0)
	{
		new tmp[256];
		new name[128];

		tmp = strtok(cmdtext, idx);
		new style = strval(tmp);
		SetPlayerFightingStyle(playerid, style);
		GetPlayerName(playerid,name,128);
		format(tmp, 256, "(%s) fighting style changed to %d", name, style);
		SendClientMessageToAll(0x4499CCFF,tmp);
		return 1;
	}

	if(strcmp( cmd, "/myfacingangle", true ) == 0)
	{
	    new Float:angle;
	    new tmp[256];
	    GetPlayerFacingAngle(playerid,angle);
		format(tmp, 256, "Facing: %f",angle);
		SendClientMessage(playerid,0x4499CCFF,tmp);
		return 1;
	}

	if(strcmp(cmd, "/crime", true) == 0) {
	    new tmp[256];
	  	new tmp2[256];
		tmp = strtok(cmdtext,idx);
		tmp2 = strtok(cmdtext,idx);
		PlayCrimeReportForPlayer(playerid, strval(tmp), strval(tmp2));
		return 1;
	}

	if(strcmp(cmd, "/fix", true) == 0) {
	    new vid = GetPlayerVehicleID(playerid);
	    if (vid) RepairVehicle(vid);
		return 1;
	}

    if(strcmp(cmd, "/bv", true) == 0)
	{
		new tmp[128], iCar, string[128];

		tmp = strtok(cmdtext, idx);

		if(strlen(tmp) == 0) return SendClientMessage(playerid, 0xFFFFFFFF, "DO: /bv [vehicleid]");

		iCar = strval(tmp);

		new File:file = fopen("badvehicles.txt",io_append);
		format(string,sizeof(string),"%d\r\n", iCar);
		fwrite(file,string);
		fclose(file);

		GetPlayerName(playerid,tmp,128);
		format(string, sizeof(string), "Veh ID %i marked as bad vehicle by %s", iCar, tmp);
		SendClientMessageToAll(0xFFFFFFFF, string);
		return 1;
	}

	if(strcmp(cmd, "/weapskill", true) == 0) {
	    new tmp[256];
	  	new tmp2[256];
		tmp = strtok(cmdtext,idx);
		tmp2 = strtok(cmdtext,idx);
		SetPlayerSkillLevel(playerid, strval(tmp), strval(tmp2));
		return 1;
	}

	if(strcmp(cmd, "/labelonvehicle", true) == 0) {
	    new vid = GetPlayerVehicleID(playerid);
	    textid = Create3DTextLabel("My Vehicle\nOwned by me\nNo Fuel\nRunning on vapour",0xEEEEEE50,0.0,0.0,0.0,15.0,0);
	    Attach3DTextLabelToVehicle(textid, vid, 0.0, -1.6, -0.35); // tail of the vehicle toward the ground
		return 1;
	}

	if(strcmp(cmd, "/labelonplayer", true) == 0) {
		new tmp[256];
		tmp = strtok(cmdtext,idx);
 		textid = Create3DTextLabel("Player Label",0xFFFFFFFF,0.0,0.0,0.0,40.0,0);
	    Attach3DTextLabelToPlayer(textid, strval(tmp), 0.0, 0.0, -0.4);
		return 1;
	}

	if(strcmp(cmd, "/manylabels", true) == 0) {
	    new Float:X, Float:Y, Float:Z;
	    GetPlayerPos(playerid, X, Y, Z);
	    new x=0;
	    while(x!=50) {
 			Create3DTextLabel("Putu Suhartawan Corp",0xFFFFFFFF,X,Y,Z,100.0,0);
 			Z = Z + 0.1;
 			x++;
		}
		return 1;
	}

    if(strcmp(cmd, "/dellabel", true) == 0) {
	    Delete3DTextLabel(textid);
		return 1;
	}

	if(strcmp(cmd, "/bikinlabel", true) == 0) {
	    new Float:X, Float:Y, Float:Z;
	    

	    new	isikarakter;

	    GetPlayerPos( playerid, X, Y, Z );
	    message = strrest(cmdtext, isikarakter);
	    strdel(message, 0, 11);
	    PlayerPlaySound(playerid, 1002, 0.0, 0.0, 10.0);
	    player3dtextid = CreatePlayer3DTextLabel(playerid,message,0xFFFFFFFF,X,Y,Z,10.3);
	    SendClientMessage(playerid, 0xFFFFFFFF, "**label berhasil di buat tuan.");
		return 1;
	}

	if(strcmp(cmd, "/labeldiplat", true) == 0) {
	    new vid = GetPlayerVehicleID(playerid);
	    player3dtextid = CreatePlayer3DTextLabel(playerid,"Hallo bos?\n Apa kabar nih",0x008080FF,0.0,-1.6,-0.35,20.0,INVALID_PLAYER_ID,vid,1);
		return 1;
	}

	if(strcmp(cmd, "/playerlabelpl", true) == 0) {
	    new tmp[256];
		tmp = strtok(cmdtext,idx);
	    player3dtextid = CreatePlayer3DTextLabel(playerid,"Hello Testing",0x008080FF,0.0,0.0,0.0,30.0,strval(tmp));
		return 1;
	}

    if(strcmp(cmd, "/delplayerlabel", true) == 0) {
	    DeletePlayer3DTextLabel(playerid, player3dtextid);
		return 1;
	}

	if(strcmp(cmd, "/updateplayerlabel", true) == 0) {
	    UpdatePlayer3DTextLabelText(playerid, player3dtextid, 0xFFFFFFFF, "");
		return 1;
	}

	if(strcmp(cmd, "/carmodtest", true) == 0) {
	    // spawns a couple of cars in Grove with mods applied
	   	savanna = CreateVehicle(567,2509.1343,-1686.2330,13.2296,47.3679,16,16,10000);
		AddVehicleComponent(savanna,1189); //Front Bumper
		AddVehicleComponent(savanna,1187); //Rear Bumper
		AddVehicleComponent(savanna,1129); //Exhaust
		AddVehicleComponent(savanna,1102); //Left Side Skirt
		AddVehicleComponent(savanna,1133); //Right Side Skirt
		AddVehicleComponent(savanna,1078); //Wheels
		AddVehicleComponent(savanna,1010); //Nitro 10x
		AddVehicleComponent(savanna,1087); //Hydrolics

		blade = CreateVehicle(536,2509.8462,-1671.8666,13.1510,348.3512,16,16,10000);
		AddVehicleComponent(blade,1182); //Front Bumper
		AddVehicleComponent(blade,1184); //Rear Bumper
		AddVehicleComponent(blade,1104); //Exhaust
		AddVehicleComponent(blade,1108); //Left Side Skirt
		AddVehicleComponent(blade,1107); //Right Side Skirt
		AddVehicleComponent(blade,1078); //Wheels
		AddVehicleComponent(blade,1010); //Nitro 10x
		AddVehicleComponent(blade,1087); //Hydrolics
  		return 1;
	}

	if(strcmp(cmd, "/addnitro", true) == 0) {
	    new vid = GetPlayerVehicleID(playerid);
	    AddVehicleComponent(vid, 1010);
	    return 1;
	}


	if(strcmp(cmd, "/remnitro", true) == 0) {
        new vid = GetPlayerVehicleID(playerid);
	    RemoveVehicleComponent(vid, 1010);
	    return 1;
	}

	if(strcmp(cmd, "/paintjob", true) == 0) {
	    new tmp[256];
		tmp = strtok(cmdtext,idx);
	    new vid = GetPlayerVehicleID(playerid);
		ChangeVehiclePaintjob(vid,strval(tmp));
		return 1;
	}

	if(strcmp(cmd, "/longtd", true) == 0) {
  		new st4[256];
  		new st5[256];
		new st6[256];
		new st7[1024];

		format(st4,sizeof(st4),"0123456789012345678901234567890123456789~n~012345678901234567890123456789~n~01234567890123456789~n~0123456789~n~0123456789012345678901234567890123456789~n~01234567890123456789~n~01234567890123456789~n~01234567890123456789~n~");
		format(st5,sizeof(st5),"0123456789012345678901234567890123456789~n~012345678901234567890123456789~n~01234567890123456789~n~0123456789~n~0123456789012345678901234567890123456789~n~01234567890123456789~n~01234567890123456789~n~01234567890123456789~n~");
		format(st6,sizeof(st6),"0123456789012345678901234567890123456789~n~012345678901234567890123456789~n~01234567890123456789~n~0123456789~n~0123456789012345678901234567890123456789~n~01234567890123456789~n~01234567890123456789~n~01234567890123456789");
		format(st7,sizeof(st7),"%s %s %s~n~LEN(%d)",st4,st5,st6,strlen(st4)+strlen(st5)+strlen(st6));

        new Text:Stats = TextDrawCreate(10.0, 10.0, st7);
		TextDrawTextSize(Stats, 400.0, 400.0);
		TextDrawUseBox(Stats,0);
		TextDrawBoxColor(Stats,0xFFFFFFFF);
		TextDrawFont(Stats,1);
		TextDrawLetterSize(Stats,0.5,0.5);
		TextDrawShowForPlayer(playerid,Stats);
		return 1;
	}

	if(strcmp(cmd, "/testmsgbox", true) == 0) {
		ShowPlayerDialog(playerid,0,DIALOG_STYLE_MSGBOX,"Welcome","Welcome to the SA-MP 0.3 server. This is test_cmds.pwn /testmsgbox\nHope it's useful to you.","OK","");
        return 1;
	}

	if(strcmp(cmd, "/testmsgbox2", true) == 0) {
		ShowPlayerDialog(playerid,0,DIALOG_STYLE_MSGBOX,"Welcome","Welcome:\tInfo\nTest:\t\tTabulated\nLine:\t\tHello","OK","Cancel");
        return 1;
	}

	if(strcmp(cmd, "/testinputbox", true) == 0) {
	    new loginmsg[256+1];
	    new loginname[MAX_PLAYER_NAME+1];
	    GetPlayerName(playerid,loginname,MAX_PLAYER_NAME);
	    format(loginmsg,256,"Welcome to the SA-MP 0.3 server.\n\n{EEEE88}Account:\t{FFFFFF}%s\n\n{FFFFFF}Please enter your password below:",loginname);
		ShowPlayerDialog(playerid,1,DIALOG_STYLE_INPUT,"{EE7777}Login to SA-MP",loginmsg,"Login","Cancel");
        return 1;
	}

	if(strcmp(cmd, "/testpassbox", true) == 0) {
	    new loginmsg[256+1];
	    new loginname[MAX_PLAYER_NAME+1];
	    GetPlayerName(playerid,loginname,MAX_PLAYER_NAME);
	    format(loginmsg,256,"Welcome to the SA-MP 0.3 server.\n\n{EEEE88}Account:\t{FFFFFF}%s\n\n{FFFFFF}Please enter your password below:",loginname);
		ShowPlayerDialog(playerid,1,DIALOG_STYLE_PASSWORD,"{EE7777}Login to SA-MP",loginmsg,"Login","Cancel");
        return 1;
	}

	if(strcmp(cmd, "/testlistbox", true) == 0) {
	    new listitems[] = "{FFFFFF}1\t{55EE55}Deagle\n{FFFFFF}2\t{55EE55}Sawnoff\n{FFFFFF}3\t{55EE55}Pistol\n{FFFFFF}4\t{55EE55}Grenade\n{FFFFFF}5\t{55EE55}Parachute\n6\t{55EE55}Lorikeet";
	    ShowPlayerDialog(playerid,2,DIALOG_STYLE_LIST,"{448844}List of weapons:",listitems,"Select","Cancel");
        return 1;
	}

	if(strcmp(cmd, "/testtablist", true) == 0) {
	    TabListDialogTest(playerid);
        return 1;
	}

	if(strcmp(cmd, "/testtablistheaders", true) == 0) {
	    TabListHeadersDialogTest(playerid);
        return 1;
	}

	if(strcmp(cmd, "/testtablistcrash", true) == 0) {
		//ShowPlayerDialog(playerid,2,DIALOG_STYLE_TABLIST_HEADERS,"{FFFF00}SMGs", "Weapon\tAmount\tPrice\n{FFFFFF}MP5\t90\t{FF0000}$3500","Buy", "Go Back");
        ShowPlayerDialog(playerid,2,DIALOG_STYLE_TABLIST_HEADERS,"{FFFF00}SMGs", AMMUNATION_SMGS_DIALOG, "Buy", "Go Back");
		return 1;
	}

    if(strcmp(cmd, "/testclosebox", true) == 0) {
	    ShowPlayerDialog(playerid,-1,0,"","","","");
        return 1;
	}

    if(strcmp(cmd, "/setfacingzero", true) == 0) {
	    SetPlayerFacingAngle(playerid, 0.0);
        return 1;
	}

    if(strcmp(cmd, "/detachtrailer", true) == 0) {
        new vid = GetPlayerVehicleID(playerid);
	    DetachTrailerFromVehicle(vid);
        return 1;
	}

	if(strcmp(cmd, "/testformat", true) == 0) {
	    new strtest[256];
	    new File:f = fopen("test.txt",io_write);
	    format(strtest,256,"[chat] %d %s\r\n",24,"þÿÿþ");
	    SendClientMessage(playerid,0xFFFFFFFF,strtest);
	    fwrite(f,strtest);
	    format(strtest,256,"[chat] %d %s\r\n",34," þÿÿþ");
	    SendClientMessage(playerid,0xFFFFFFFF,strtest);
	    fwrite(f,strtest);
	    fclose(f);
	    return 1;
	}

	if(strcmp(cmd, "/setskin", true) == 0) {
        new tmp[256];
		tmp = strtok(cmdtext,idx);
		SetPlayerSkin(playerid,strval(tmp));
	    return 1;
	}

	if(strcmp(cmd, "/getskin", true) == 0) {
        new tmp[256+1];
		new custskin = GetPlayerSkin(playerid);
		format(tmp,256,"Skin: %d",custskin);
		SendClientMessage(playerid,0xFFFFFFFF,tmp);
	    return 1;
	}


	if(strcmp(cmd, "/getcskin", true) == 0) {
        new tmp[256+1];
		new custskin = GetPlayerCustomSkin(playerid);
		format(tmp,256,"Custom skin: %d",custskin);
		SendClientMessage(playerid,0xFFFFFFFF,tmp);
	    return 1;
	}

	if(strcmp(cmd, "/setvars", true) == 0) {
		SetPVarInt(playerid,"num_test",7001);
		SetPVarString(playerid,"additional_tag","Hello World");
		SetPVarFloat(playerid,"some_float",1001.0);
		SendClientMessage(playerid,0xFFFFFFFF, "Vars set");
	    return 1;
	}

	if(strcmp(cmd, "/modvars", true) == 0) {
		SetPVarInt(playerid,"num_test",8001);
		SetPVarString(playerid,"additional_tag","World Hello");
		SetPVarFloat(playerid,"some_float",6901.0);
		SendClientMessage(playerid,0xFFFFFFFF, "Vars modded");
	    return 1;
	}

	if(strcmp(cmd, "/getvars", true) == 0) {

		new tst_IntRet;
		new Float:tst_FloatRet;
		new tst_StrRet[256];
		new tst_DispStr[256];

		tst_IntRet = GetPVarInt(playerid,"num_test");
		tst_FloatRet = GetPVarFloat(playerid,"some_float");
 		GetPVarString(playerid,"additional_tag",tst_StrRet,256);

		format(tst_DispStr,256,"num_test: %d some_float: %f additional_tag: %s",tst_IntRet,tst_FloatRet,tst_StrRet);
		SendClientMessage(playerid,0xFFFFFFFF, tst_DispStr);

	    return 1;
	}

	if(strcmp(cmd, "/delvars", true) == 0) {
		DeletePVar(playerid,"num_test");
		DeletePVar(playerid,"additional_tag");
		DeletePVar(playerid,"some_float");
		SendClientMessage(playerid,0xFFFFFFFF, "Vars deleted");
	    return 1;
	}

	if(strcmp(cmd, "/pvarlist", true) == 0) {
		SendPVarListToPlayer(playerid);
	    return 1;
	}

	if(strcmp(cmd, "/kill",true) == 0) {
	    SetPlayerHealth(playerid,0.0);
	    return 1;
	}

	if(strcmp(cmd, "/kickallnpc",true) == 0) {
		new p=0;
		while(p!=MAX_PLAYERS) {
			if(IsPlayerConnected(p) && IsPlayerNPC(p)) Kick(p);
			p++;
		}
	    return 1;
	}

	if(strcmp(cmd, "/startengine",true) == 0) {
        new vid = GetPlayerVehicleID(playerid);
	  	if(vid != INVALID_VEHICLE_ID) {
	  	    GetVehicleParamsEx(vid,engine,lights,alarm,doors,bonnet,boot,objective);
	  	    SetVehicleParamsEx(vid,VEHICLE_PARAMS_ON,lights,alarm,doors,bonnet,boot,objective);
		}
	    return 1;
	}
	if(strcmp(cmd, "/stopengine",true) == 0) {
        new vid = GetPlayerVehicleID(playerid);
	  	if(vid != INVALID_VEHICLE_ID) {
	  	    GetVehicleParamsEx(vid,engine,lights,alarm,doors,bonnet,boot,objective);
	  	    SetVehicleParamsEx(vid,VEHICLE_PARAMS_OFF,lights,alarm,doors,bonnet,boot,objective);
		}
	    return 1;
	}

	if(strcmp(cmd, "/openboot",true) == 0) {
        new vid = GetPlayerVehicleID(playerid);
	  	if(vid != INVALID_VEHICLE_ID) {
	  	    GetVehicleParamsEx(vid,engine,lights,alarm,doors,bonnet,boot,objective);
	  	    SetVehicleParamsEx(vid,engine,lights,alarm,doors,bonnet,VEHICLE_PARAMS_ON,objective);
		}
	    return 1;
	}
	if(strcmp(cmd, "/closeboot",true) == 0) {
        new vid = GetPlayerVehicleID(playerid);
	  	if(vid != INVALID_VEHICLE_ID) {
	  	    GetVehicleParamsEx(vid,engine,lights,alarm,doors,bonnet,boot,objective);
	  	    SetVehicleParamsEx(vid,engine,lights,alarm,doors,bonnet,VEHICLE_PARAMS_OFF,objective);
		}
	    return 1;
	}
	if(strcmp(cmd, "/openbonnet",true) == 0) {
        new vid = GetPlayerVehicleID(playerid);
	  	if(vid != INVALID_VEHICLE_ID) {
	  	    GetVehicleParamsEx(vid,engine,lights,alarm,doors,bonnet,boot,objective);
	  	    SetVehicleParamsEx(vid,engine,lights,alarm,doors,VEHICLE_PARAMS_ON,boot,objective);
		}
	    return 1;
	}
	if(strcmp(cmd, "/closebonnet",true) == 0) {
        new vid = GetPlayerVehicleID(playerid);
	  	if(vid != INVALID_VEHICLE_ID) {
	  	    GetVehicleParamsEx(vid,engine,lights,alarm,doors,bonnet,boot,objective);
	  	    SetVehicleParamsEx(vid,engine,lights,alarm,doors,VEHICLE_PARAMS_OFF,boot,objective);
		}
	    return 1;
	}
	if(strcmp(cmd, "/alarmon",true) == 0) {
        new vid = GetPlayerVehicleID(playerid);
	  	if(vid != INVALID_VEHICLE_ID) {
	  	    GetVehicleParamsEx(vid,engine,lights,alarm,doors,bonnet,boot,objective);
	  	    SetVehicleParamsEx(vid,engine,lights,VEHICLE_PARAMS_ON,doors,bonnet,boot,objective);
		}
	    return 1;
	}
	if(strcmp(cmd, "/alarmoff",true) == 0) {
        new vid = GetPlayerVehicleID(playerid);
	  	if(vid != INVALID_VEHICLE_ID) {
	  	    GetVehicleParamsEx(vid,engine,lights,alarm,doors,bonnet,boot,objective);
	  	    SetVehicleParamsEx(vid,engine,lights,VEHICLE_PARAMS_OFF,doors,bonnet,boot,objective);
		}
	    return 1;
	}
	if(strcmp(cmd, "/lightson",true) == 0) {
        new vid = GetPlayerVehicleID(playerid);
	  	if(vid != INVALID_VEHICLE_ID) {
	  	    GetVehicleParamsEx(vid,engine,lights,alarm,doors,bonnet,boot,objective);
	  	    SetVehicleParamsEx(vid,engine,VEHICLE_PARAMS_ON,alarm,doors,bonnet,boot,objective);
		}
	    return 1;
	}
	if(strcmp(cmd, "/lightsoff",true) == 0) {
        new vid = GetPlayerVehicleID(playerid);
	  	if(vid != INVALID_VEHICLE_ID) {
	  	    GetVehicleParamsEx(vid,engine,lights,alarm,doors,bonnet,boot,objective);
	  	    SetVehicleParamsEx(vid,engine,VEHICLE_PARAMS_OFF,alarm,doors,bonnet,boot,objective);
		}
	    return 1;
	}

	if(strcmp(cmd, "/holdobjectid",true) == 0) {
	    new tmp[256];
		tmp = strtok(cmdtext,idx);
		SetPlayerAttachedObject(playerid,0,strval(tmp),6);
		SetPlayerAttachedObject(playerid,1,strval(tmp),5);
		//SetPlayerAttachedObject(playerid, 0, 1254,2, 0.1,0.05,0,0,90,0);
	    return 1;
	}

	if(strcmp(cmd, "/removeheld",true) == 0) {
		new zz=0;
		while(zz!=MAX_PLAYER_ATTACHED_OBJECTS) {
		    if(IsPlayerAttachedObjectSlotUsed(playerid, zz)) {
		        RemovePlayerAttachedObject(playerid, zz);
			}
			zz++;
		}
	    return 1;
	}

	if(strcmp(cmd, "/attachobj",true) == 0) {
	    new tmp[256];
		tmp = strtok(cmdtext,idx);
		new obj = CreateObject(strval(tmp),0.0,0.0,0.0,0.0,0.0,0.0,200.0);
		AttachObjectToVehicle(obj,GetPlayerVehicleID(playerid),0.0,0.0,1.0,0.0,0.0,0.0);
		return 1;
	}

	if(strcmp(cmd, "/attachtome",true) == 0) {
	    new tmp[256];
		tmp = strtok(cmdtext,idx);
		new obj = CreateObject(strval(tmp),0.0,0.0,0.0,0.0,0.0,0.0,200.0);
		AttachObjectToPlayer(obj,playerid,0.0,0.0,2.0,0.0,0.0,0.0);
		return 1;
	}

	if(strcmp(cmd, "/mapicontest",true) == 0) {
	    new Float:X, Float:Y, Float:Z;
 		GetPlayerPos(playerid, X, Y, Z);
 		SetPlayerCheckpoint(playerid,X,Y,Z,5.0);
	   	SetPlayerMapIcon(playerid, 1, X+50.0, Y, Z, 52, 0, MAPICON_LOCAL_CHECKPOINT);
	   	SetPlayerMapIcon(playerid, 2, X+100.0, Y, Z, 53, 0, MAPICON_LOCAL_CHECKPOINT);
	   	SetPlayerMapIcon(playerid, 3, X+150.0, Y, Z, 54, 0, MAPICON_LOCAL_CHECKPOINT);
	   	SetPlayerMapIcon(playerid, 4, X+200.0, Y, Z, 55, 0, MAPICON_LOCAL_CHECKPOINT);
	   	SetPlayerMapIcon(playerid, 5, X+250.0, Y, Z, 0, 0x00FF00FF);
		return 1;
	}

	if(strcmp(cmd, "/mapicondel",true) == 0) {
        RemovePlayerMapIcon(playerid, 1);
        RemovePlayerMapIcon(playerid, 2);
        RemovePlayerMapIcon(playerid, 3);
        RemovePlayerMapIcon(playerid, 4);
        RemovePlayerMapIcon(playerid, 5);
     	return 1;
	}

	if(strcmp(cmd, "/mapicontest2",true) == 0) {
	    new Float:X, Float:Y, Float:Z;
 		GetPlayerPos(playerid, X, Y, Z);
		RemovePlayerMapIcon(playerid, 0);
		SetPlayerMapIcon(playerid, 0, X, Y, Z, 33, 0, MAPICON_GLOBAL);
		RemovePlayerMapIcon(playerid, 2);
		SetPlayerMapIcon(playerid, 2, X+100.0, Y, Z, 55, 0, MAPICON_LOCAL);
  		return 1;
	}

	if(strcmp(cmd, "/setweap",true) == 0) {
	    new tmp[256];
		tmp = strtok(cmdtext,idx);
		SetPlayerArmedWeapon(playerid,strval(tmp));
  		return 1;
	}

	if(strcmp(cmd, "/jp",true) == 0) {
	    SetPlayerSpecialAction(playerid,SPECIAL_ACTION_USEJETPACK);
		return 1;
	}

	if(strcmp(cmd, "/crobj",true) == 0) {
	    new Float:X, Float:Y, Float:Z;
	   	new tmp[256];
	   	tmp = strtok(cmdtext,idx);
	   	SpawnObject_InfrontOfPlayer(playerid, strval(tmp));
 		//GetPlayerPos(playerid, X, Y, Z);
		//CreateObject(strval(tmp),X+1.0,Y+1.0,Z,0.0,0.0,0.0,200.0);
		return 1;
	}

	if(strcmp(cmd, "/dropaudio",true) == 0) {
	    new Float:X, Float:Y, Float:Z;
 		GetPlayerPos(playerid, X, Y, Z);
		PlayAudioStreamForPlayer(playerid, "http://somafm.com/tags.pls", X, Y, Z, 40.0, true);
		return 1;
	}

	if(strcmp(cmd, "/officefloor",true) == 0) {
 		SetPlayerPos(playerid,1786.0645,-1298.7510,104.2);
		return 1;
	}

	if(strcmp(cmd, "/lvpd",true) == 0) {
	    SetPlayerInterior(playerid, 3);
 		SetPlayerPos(playerid,237.5571,148.7559,1005.4703);
		return 1;
	}

	if(strcmp(cmd, "/kill",true) == 0) {
 		SetPlayerHealth(playerid,0.0);
		return 1;
	}

	if(strcmp(cmd, "/atrailer",true) == 0) {
 		new tmp[256];
 		tmp = strtok(cmdtext,idx);
		AttachTrailerToVehicle(strval(tmp),GetPlayerVehicleID(playerid));
		return 1;
	}

	if(strcmp(cmd, "/dtrailer",true) == 0) {
		if(GetVehicleTrailer(GetPlayerVehicleID(playerid)) != 0) {
		    DetachTrailerFromVehicle(GetPlayerVehicleID(playerid));
		}
		return 1;
	}

	if(strcmp(cmd, "/cfence",true) == 0) {
		SetPlayerPos(playerid,2496.40, -1664.84, 13.19);
		if(!fence) fence = CreateObject(1410, 2496.80, -1661.88, 13.4, 0.00, 0.00, 0.00);
		return 1;
	}

	if(strcmp(cmd, "/mfence1",true) == 0) {
	    MoveObject(fence, 2494.56, -1664.12, 13.4, 1.0, 0.00, 0.00, -90.0);
		return 1;
	}

	if(strcmp(cmd, "/mfence2",true) == 0) {
	    MoveObject(fence, 2496.80, -1661.88, 13.4, 1.0, 0.00, 0.00, 0.00);
		return 1;
	}

	if(strcmp(cmd, "/usecell",true) == 0) {
	    SetPlayerSpecialAction(playerid, SPECIAL_ACTION_USECELLPHONE);
	    //SetPlayerAttachedObject(playerid, 4, 330, 6); // 4 = attachment slot, 330 = cellphone model, 6 = right hand
		return 1;
	}

	if(strcmp(cmd, "/stopcell",true) == 0) {
	    SetPlayerSpecialAction(playerid, SPECIAL_ACTION_STOPUSECELLPHONE);
	    RemovePlayerAttachedObject(playerid, 4);
		return 1;
	}

	if(strcmp(cmd, "/objvehst",true) == 0) {
	    new objveh;
		new objatt;
		new Float:X, Float:Y, Float:Z;
 		GetPlayerPos(playerid, X, Y, Z);
		objveh = CreateVehicle(563, X+2.0, Y+2.0, Z, 0.0, 0, 0, -1);
		objatt = CreateObject(19277, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 200.0);
		AttachObjectToVehicle(objatt, objveh, 2.0, 0.15, 0.0, 0.0, 0.0, 90.0);
		return 1;
	}

	if(strcmp(cmd, "/uncontrol", true) == 0) {
	    TogglePlayerControllable(playerid, 0);
	    unfreezeplayer = playerid;
	    //SetTimer("UnFreezeMe",5000,0);
	    return 1;
	}

	if(strcmp(cmd, "/recontrol", true) == 0) {
	    TogglePlayerControllable(playerid, 1);
	    return 1;
	}

	if(strcmp(cmd, "/objlim1", true) == 0) {
	    new Float:X, Float:Y, Float:Z;
	    new lp=0;
 		GetPlayerPos(playerid, X, Y, Z);
 		while(lp != 999) {
	    	CreateObject(1656, X, Y, Z, 0.00, 0.00, 0.00, 1000.0);
	    	Y += 0.25;
	    	lp++;
		}
	    return 1;
	}

	if(strcmp(cmd, "/kkeys", true) == 0) {
		
		format(message, 256, "{FFFFFF}Left Key: {FFFF00}~k~~GO_LEFT~ {FFFFFF}Right Key: {FFFF00}~k~~GO_RIGHT~ {FFFFFF}Fire Key: {FFFF00}~k~~PED_FIREWEAPON~");
		SendClientMessage(playerid, 0xFFFFFFFF, message);
		return 1;
	}

	if(strcmp(cmd, "/timeddlg", true) == 0) {
	    testlbplayer = playerid;
	    SetTimer("ShowTestDialog",5000,0);
	    return 1;
	}

	if(strcmp(cmd, "/editattach",true) == 0) {
	    if(!IsPlayerAttachedObjectSlotUsed(playerid, 0)) {
			SetPlayerAttachedObject(playerid,0,-4006,2); // red sunglasses to head bone
		}
		SendClientMessage(playerid, 0xFFFFFFFF, "Hint: Use {FFFF00}~k~~PED_SPRINT~{FFFFFF} to look around.");
		EditAttachedObject(playerid, 0);
	    return 1;
	}

	if(strcmp(cmd, "/editobject",true) == 0) {
		if(edit_objectid == INVALID_OBJECT_ID) {
		    new Float:X, Float:Y, Float:Z;
			GetPlayerPos(playerid, X, Y, Z);
			edit_objectid = CreateObject(1656,X+1.0,Y+1.0,Z+0.5,0.0,0.0,0.0,200.0);
		}
		SendClientMessage(playerid, 0xFFFFFFFF, "Hint: Use {FFFF00}~k~~PED_SPRINT~{FFFFFF} to look around.");
		EditObject(playerid, edit_objectid);
	    return 1;
	}

	if(strcmp(cmd, "/selobj",true) == 0) {
		SendClientMessage(playerid, 0xFFFFFFFF, "Hint: Use {FFFF00}~k~~PED_SPRINT~{FFFFFF} to look around.");
		SelectObject(playerid);
	    return 1;
	}

	if(strcmp(cmd, "/canceledit",true) == 0) {
		CancelEdit(playerid);
	    return 1;
	}

	if(strcmp(cmd, "/editpobject",true) == 0) {
		if(edit_objectid == INVALID_OBJECT_ID) {
		    new Float:X, Float:Y, Float:Z;
			GetPlayerPos(playerid, X, Y, Z);
			edit_objectid = CreatePlayerObject(playerid,19522,X+1.0,Y+1.0,Z+0.5,0.0,0.0,0.0,200.0);
		}
		SendClientMessage(playerid, 0xFFFFFFFF, "Hint: Use {FFFF00}~k~~PED_SPRINT~{FFFFFF} to look around.");
		EditPlayerObject(playerid, edit_objectid);
	    return 1;
	}

	if(strcmp(cmd, "/cam_on_obj",true) == 0) {
	  	new Float:X, Float:Y, Float:Z;
		GetPlayerPos(playerid, X, Y, Z);
		if(edit_objectid == INVALID_OBJECT_ID) {
			edit_objectid = CreateObject(19320,X+1.0,Y+1.0,Z+0.5,0.0,0.0,0.0,200.0);
		}
		//TogglePlayerSpectating(playerid, 1);
	    AttachCameraToObject(playerid, edit_objectid);
	    MoveObject(edit_objectid, X, Y + 2000.0, Z + 400.0, 20.0);
	    return 1;
	}

	if(strcmp(cmd, "/cam_on_train",true) == 0) {
	  	new Float:X, Float:Y, Float:Z;
		GetPlayerPos(playerid, X, Y, Z);
		if(edit_objectid == INVALID_OBJECT_ID) {
			edit_objectid = CreateObject(19320,X+1.0,Y+1.0,Z+0.5,0.0,0.0,0.0,200.0);
		}
		TogglePlayerSpectating(playerid, 1);
		AttachObjectToVehicle(edit_objectid, 9, 0.0, 0.0, 2.0, 0.0, 0.0, 0.0);
		PlayerSpectateVehicle(playerid, 9);
	    AttachCameraToObject(playerid, edit_objectid);
	    return 1;
	}

	if(strcmp(cmd, "/cam_interp",true) == 0) {
	  	new Float:X, Float:Y, Float:Z;
		GetPlayerPos(playerid, X, Y, Z);
		InterpolateCameraPos(playerid, X, Y, Z, X + 100.0, Y + 100.0, Z + 20.0, 10000);
	    return 1;
	}

	if(strcmp(cmd, "/cam_interp_look",true) == 0) {
	  	new Float:X, Float:Y, Float:Z;
		GetPlayerPos(playerid, X, Y, Z);
		InterpolateCameraPos(playerid, X, Y, Z, X + 100.0, Y + 100.0, Z + 20.0, 10000);
		InterpolateCameraLookAt(playerid, X, Y, Z, 0.0, 0.0, 0.0, 10000);
	    return 1;
	}

	if(strcmp(cmd, "/cam_behind",true) == 0) {
	    SetCameraBehindPlayer(playerid);
	    return 1;
	}

	if(strcmp(cmd, "/respawn_veh",true) == 0) {
	  	new tmp[256];
		tmp = strtok(cmdtext,idx);
		SetVehicleToRespawn(strval(tmp));
		return 1;
	}

	if(strcmp(cmd, "/crplain", true) == 0) {
        CreateObject(19003, 416.54, 1655.75, 700.00, 0.00, 0.00, 0.00, 200.0);
        CreateObject(4561, -26.98, 1639.33, 98.03, 0.00, 0.00, 0.00, 1000.0);
	    return 1;
	}

	if(strcmp(cmd, "/testplain", true) == 0) {
        CreateObject(19003, 416.54, 1655.75, 700.00, 0.00, 0.00, 0.00);

	    if(GetPlayerVehicleID(playerid)) {
		    SetVehiclePos(GetPlayerVehicleID(playerid), 416.54, 1655.75, 705.00);
	    }
		else {
		    SetPlayerPos(playerid, 416.54, 1655.75, 710.00);
	    }
	    return 1;
	}

	if(strcmp(cmd, "/testplain2", true) == 0) {
 		CreateObject(10766, 168.86, 1686.77, 44.86, 0.00, 0.00, 0.00, 1000.0);
		CreateObject(10766, 168.86, 1532.52, 44.86, 0.00, 0.00, 0.00, 1000.0);

	    if(GetPlayerVehicleID(playerid)) {
		    SetVehiclePos(GetPlayerVehicleID(playerid), 162.9956, 1606.2555, 55.3197);
	    }
		else {
		    SetPlayerPos(playerid, 162.9956, 1606.2555, 55.3197);
	    }
	    return 1;
	}

	if(strcmp(cmd, "/clicktd",true) == 0) {
		new Text:txtTestText1;

    	txtTestText1 = TextDrawCreate(320.0, 100.0, "Test Text 1");
    	TextDrawUseBox(txtTestText1, 1);
    	TextDrawBoxColor(txtTestText1, 0x00000044);
		TextDrawFont(txtTestText1, 3);
		TextDrawSetShadow(txtTestText1,0); // no shadow
    	TextDrawSetOutline(txtTestText1,2); // thickness 1
    	TextDrawBackgroundColor(txtTestText1,0x000000FF);
    	TextDrawColor(txtTestText1,0xFFFFFFFF);
    	TextDrawAlignment(txtTestText1,2); // centered
		TextDrawLetterSize(txtTestText1,0.5,1.5);
		TextDrawTextSize(txtTestText1, 20.0, 200.0); // reverse width and height for rockstar (only for centered td's)
		TextDrawSetSelectable(txtTestText1, 1);
		TextDrawShowForPlayer(playerid,txtTestText1);

    	new Text:txtSprite1;
    	txtSprite1 = TextDrawCreate(200.0, 220.0, "samaps:map"); // Text is txdfile:texture
    	TextDrawFont(txtSprite1, 4); // Font ID 4 is the sprite draw font
    	TextDrawColor(txtSprite1,0xFFFFFFFF);
    	TextDrawTextSize(txtSprite1,200.0,200.0); // Text size is the Width:Height
    	TextDrawSetSelectable(txtSprite1, 1);
    	TextDrawShowForPlayer(playerid,txtSprite1);

    	SelectTextDraw(playerid, 0x9999BBBB);
    	return 1;
	}

	if(strcmp(cmd, "/playertd",true) == 0) {
		
		new PlayerText:PlayerTestText1;
    	PlayerTestText1 = CreatePlayerTextDraw(playerid, 320.0, 100.0, "Test Text 1");
    	PlayerTextDrawUseBox(playerid,PlayerTestText1, 1);
    	PlayerTextDrawBoxColor(playerid,PlayerTestText1, 0x00000044);
		PlayerTextDrawFont(playerid,PlayerTestText1, 3);
		PlayerTextDrawSetShadow(playerid,PlayerTestText1,0); // no shadow
    	PlayerTextDrawSetOutline(playerid,PlayerTestText1,2); // thickness 1
    	PlayerTextDrawBackgroundColor(playerid, PlayerTestText1,0x000000FF);
    	PlayerTextDrawColor(playerid,PlayerTestText1,0xFFFFFFFF);
    	//PlayerTextDrawAlignment(playerid,PlayerTestText1,2); // centered
		PlayerTextDrawLetterSize(playerid,PlayerTestText1,0.5,1.5);
		PlayerTextDrawTextSize(playerid,PlayerTestText1, 50.0, 200.0); // reverse width and height for rockstar (only for centered td's)
		PlayerTextDrawSetSelectable(playerid,PlayerTestText1,1);
		PlayerTextDrawShow(playerid,PlayerTestText1);

    	//SelectTextDraw(playerid, 0x9999BBBB);


    	return 1;
	}

	if(strcmp(cmd, "/canceltd",true) == 0) {
	    CancelSelectTextDraw(playerid);
	    return 1;
	}

	if(strcmp(cmd, "/timed_vd", true) == 0) {
	    vehicleid_tokill = GetPlayerVehicleID(playerid);
	    SetTimer("TimedVehicleDeath",3000,0);
	    return 1;
	}

	if(strcmp(cmd, "/vmodelsize", true) == 0) {
	    new Float:X, Float:Y, Float:Z;
	    new VehicleId = GetPlayerVehicleID(playerid);
		
		if(!VehicleId || VehicleId == INVALID_VEHICLE_ID) {
		    SendClientMessage(playerid, 0xFFFFFFFF, "/vmodelsize : Be in a vehicle to use this command." );
			return 1;
		}
		new VehicleModel = GetVehicleModel(VehicleId);
		GetVehicleModelInfo(VehicleModel, VEHICLE_MODEL_INFO_SIZE, X, Y, Z);
		format(message, 256, "Vehicle(%d) Size: %.4f, %.4f, %.4f", VehicleModel, X, Y, Z);
		SendClientMessage(playerid, 0xFFFFFFFF, message);
	    return 1;
	}


	if(strcmp(cmd, "/crptex",true) == 0) {
	    new lp=0;
		new Float:X, Float:Y, Float:Z;
		GetPlayerPos(playerid, X, Y, Z);
		X+=1.0;
		while(lp != 128) {
			test_tex_objects[lp] = CreatePlayerObject(playerid,19372,X,Y,Z+0.5,0.0,0.0,0.0,0.0);
			//SetPlayerObjectMaterial(playerid, test_tex_objects[lp], 0, 0, "null", "null", 0);

			if(lp % 2 == 0) {
				SetPlayerObjectMaterial(playerid, test_tex_objects[lp], 0, 19325, "all_walls", "stormdrain3_nt", 0xFF00FF00);
			} else {
			    SetPlayerObjectMaterial(playerid, test_tex_objects[lp], 0, 19371, "all_walls", "stormdrain3_nt", 0xFF551155);
			}

			X+=2.0;
			lp++;
		}
	}

    if(strcmp(cmd, "/crpmix",true) == 0) {
	    new lp=0;
		new Float:X, Float:Y, Float:Z;
		GetPlayerPos(playerid, X, Y, Z);
		X+=1.0;
		new szId[256+1];
		while(lp != 128) {
			test_tex_objects[lp] = CreatePlayerObject(playerid,19371,X,Y,Z+0.5,0.0,0.0,0.0,300.0);
			//format(szId, 256, "Text Here: {00FF00}%d", lp);
			//SetPlayerObjectMaterialText(playerid, test_tex_objects[lp], szId, 0, OBJECT_MATERIAL_SIZE_512x512, "Verdana", 60, 1, 0xFF5555FF, 0xFF000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
			if(lp % 2 == 0) {
			    SetPlayerObjectMaterial(playerid, test_tex_objects[lp], 0, 19371, "all_walls", "stormdrain3_nt", 0xFF55AA55);
			} else {
			    format(szId, 256, "Text: {00FF00}%d", lp);
			    SetPlayerObjectMaterialText(playerid, test_tex_objects[lp], szId, 0, OBJECT_MATERIAL_SIZE_512x256, "Verdana", 60, 1, 0xFF5555FF, 0xFF000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
			}
			X+=2.0;
			lp++;
		}
		return 1;
	}

	if(strcmp(cmd, "/crptext",true) == 0) {
		new Float:X, Float:Y, Float:Z;
		GetPlayerPos(playerid, X, Y, Z);
		X+=1.0;

		test_tex_objects[0] = CreatePlayerObject(playerid,19479,X,Y,Z+0.5,0.0,0.0,0.0,300.0);
		SetObjectMaterialText(test_tex_objects[0], "Dynamic Update (0)", 0, OBJECT_MATERIAL_SIZE_512x128, "Courier New", 48, 1, 0xFF000000, 0, 0);
		X+=3.0;

		// This is a dynamic update material text
		if(text_update_timer == -1) {
			text_update_timer = SetTimer("UpdateTextTimer", 1000, 1);
			text_update_player = playerid;
		}

		test_tex_objects[1] = CreatePlayerObject(playerid,19479,X,Y,Z+4.0,0.0,0.0,0.0,300.0);
		SetPlayerObjectMaterialText(playerid, test_tex_objects[1], "ABDSJFUEGI\nABDRJCFEGI\n{DDDDDD}Center", 0, OBJECT_MATERIAL_SIZE_512x256, "GTAWEAPON3", 70, 0, 0xFF00FF00, 0xFF444477, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
		X+=3.0;

		test_tex_objects[2] = CreatePlayerObject(playerid,19480,X,Y,Z+4.0,0.0,0.0,0.0,300.0);
		SetPlayerObjectMaterialText(playerid, test_tex_objects[2], "Blue Text\nVerdana\nAlpha BG\n{DDDDDD}Center", 0, OBJECT_MATERIAL_SIZE_512x256, "Verdana", 60, 1, 0xFF000000, 0xFFFFFFFF, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
		X+=3.0;

		test_tex_objects[3] = CreatePlayerObject(playerid,19481,X,Y,Z+4.0,0.0,0.0,0.0,300.0);
		SetPlayerObjectMaterialText(playerid, test_tex_objects[3], "Blue Text\nArial\nAlpha BG\n{DDDDDD}Center", 0, OBJECT_MATERIAL_SIZE_512x256, "Arial", 60, 1, 0xFF000000, 0xFFCDD704, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
		X+=3.0;

		test_tex_objects[4] = CreatePlayerObject(playerid,19482,X,Y,Z+4.0,0.0,0.0,0.0,300.0);
		SetPlayerObjectMaterialText(playerid, test_tex_objects[4], "Blue Text\nVerdana\nAlpha BG\n{DDDDDD}Center", 0, OBJECT_MATERIAL_SIZE_512x256, "Verdana", 60, 1, 0xFF000000, 0xFFCDD704, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
		X+=3.0;

		test_tex_objects[5] = CreatePlayerObject(playerid,19483,X,Y,Z+4.0,0.0,0.0,0.0,300.0);
		SetPlayerObjectMaterialText(playerid, test_tex_objects[5], "Blue Text\nArial\nAlpha BG\n{DDDDDD}Center", 0, OBJECT_MATERIAL_SIZE_512x256, "Arial", 60, 1, 0xFF000000, 0, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
		X+=3.0;

		//EditPlayerObject(playerid, test_tex_objects[0]);
	    return 1;
	}

	if(strcmp(cmd, "/delptex",true) == 0) {
	    new lp=0;
		while(lp != 128) {
			if(IsValidPlayerObject(playerid, test_tex_objects[lp])) {
				DestroyPlayerObject(playerid, test_tex_objects[lp]);
			}
			lp++;
		}
		if(text_update_timer >= 0) {
			KillTimer(text_update_timer);
			text_update_timer = -1;
		}
	    return 1;
	}

	// Damian's bed that crashed because material object id and original object id were the same
	if(strcmp(cmd, "/crashbed",true) == 0) {
	    new objbed1=0;
	    new objbed2=0;
		new Float:X, Float:Y, Float:Z;
		GetPlayerPos(playerid, X, Y, Z);

		// 14446
		//0:18028:cj_bar2:CJ_nastybar_D2:000000;
		//2:18646:matcolours:blue:000fff;
		objbed1 = CreatePlayerObject(playerid,14446,X,Y,Z+0.1,0.0,0.0,0.0,300.0);
		SetPlayerObjectMaterial(playerid, objbed1, 0, 18028, "cj_bar2", "CJ_nastybar_D2", 0xFF000000);
	    SetPlayerObjectMaterial(playerid, objbed1, 2, 18646, "matcolours", "blue", 0xFF000fff);

	   	// 14446
		//0:0:none:none:000000;
		//1:0:none:none:0000ff;
		//2:14446:carter_block:zebra_skin:000000;
	    objbed2 = CreatePlayerObject(playerid,14446,X,Y+2.0,Z+0.1,0.0,0.0,0.0,300.0);
        SetPlayerObjectMaterial(playerid, objbed2, 0, 0, "none", "none", 0xFF000000);
        SetPlayerObjectMaterial(playerid, objbed2, 1, 0, "none", "none", 0xFF0000FF);
        //SetPlayerObjectMaterial(playerid, objbed2, 2, 18646, "matcolours", "blue", 0xFFFFFFFF);
	    SetPlayerObjectMaterial(playerid, objbed2, 2, 14446, "carter_block", "mp_carter_wall", 0xFFFFFFFF);

	    return 1;
	}

	// Damian's house object that is crashing in 0.3x
	if(strcmp(cmd, "/crash_hobj",true) == 0) {
	    new objcab=0;
		new Float:X, Float:Y, Float:Z;
		GetPlayerPos(playerid, X, Y, Z);

		//2385
		//;index_id:model_id:txd_name:txd_txt:txd_color(0 if no color);
		//;0:2748:pizza_furn:CJ_WOOD6:0;
		//;1:2748:pizza_furn:CJ_WOOD6:A78D84;
		//;2:2748:pizza_furn:CJ_WOOD6:A78D84;
		objcab = CreatePlayerObject(playerid,2385,X,Y,Z+0.1,0.0,0.0,0.0,0.0);

		SetPlayerObjectMaterial(playerid, objcab, 0, 2748, "pizza_furn", "CJ_WOOD6", 0);
	    SetPlayerObjectMaterial(playerid, objcab, 1, 2748, "pizza_furn", "CJ_WOOD6", 0xFFA78D84);
	    SetPlayerObjectMaterial(playerid, objcab, 2, 2748, "pizza_furn", "CJ_WOOD6", 0xFFA78D84);

	    
	    SetPlayerObjectMaterial(playerid, objcab, 0, -1, "none", "none", 0xFF00AA00);
	    SetPlayerObjectMaterial(playerid, objcab, 1, -1, "none", "none", 0xFF00AA00);
	    SetPlayerObjectMaterial(playerid, objcab, 2, -1, "none", "none", 0xFF00AA00);

	    return 1;
	}

	if(strcmp(cmd, "/kickmessage", true) == 0) {
        KickWithMessage(playerid, "Bye!");
        return 1;
	}

	if(strcmp(cmd, "/animindex", true) == 0) {
	    new msg[256+1];
		new animlib[64+1];
		new animname[64+1];
	    new tmp[256+1];
		tmp = strtok(cmdtext,idx);
		GetAnimationName(strval(tmp), animlib, 64, animname, 64);
		format(msg,sizeof(msg),"AnimIndex: %d is %s:%s", strval(tmp), animlib, animname);
		SendClientMessage(playerid, 0xFFFFFFFF, msg);
		return 1;
	}

	if(strcmp(cmd, "/weapdata", true) == 0) {
	    new msg[256+1];
	    new x=0;
	    new weaponret;
	    new ammoret;
	    while(x!=13) {
	        GetPlayerWeaponData(playerid, x, weaponret, ammoret);
			format(msg,sizeof(msg),"WeapSlot(%d) %d:%d", x, weaponret, ammoret);
			SendClientMessage(playerid, 0xFFFFFFFF, msg);
			x++;
		}
		return 1;
	}

	if(strcmp(cmd, "/explosion", true) == 0) {
		new tmp[256];
		tmp = strtok(cmdtext,idx);
	    new Float:X, Float:Y, Float:Z;
		GetPlayerPos(playerid, X, Y, Z);
		CreateExplosionEx(X+10.0, Y+10.0, Z+10.0, 1, 2.0, strval(tmp));
		return 1;
	}

	if(strcmp(cmd, "/flatbedcontainer",true) == 0) {
		new create_flatbed = SpawnVehicle_InfrontOfPlayer(playerid, 578, -1, -1);
		new obj = CreateObject(19321,0.0,0.0,0.0,0.0,0.0,0.0);
		AttachObjectToVehicle(obj,create_flatbed,-0.0165,-2.0660,1.2442,0.0,0.0,0.0);
		return 1;
	}

	if(strcmp(cmd, "/disablevcol",true) == 0) {
	    DisableRemoteVehicleCollisions(playerid, 1);
		return 1;
	}

	if(strcmp(cmd, "/enablevcol",true) == 0) {
        DisableRemoteVehicleCollisions(playerid, 0);
		return 1;
	}

	if(strcmp(cmd, "/disablecamtarget",true) == 0) {
	    EnablePlayerCameraTarget(playerid, 0);
		return 1;
	}

	if(strcmp(cmd, "/enablecamtarget",true) == 0) {
        EnablePlayerCameraTarget(playerid, 1);
		return 1;
	}

	if(strcmp(cmd, "/poolsize", true) == 0) {
	    new msg[256+1];
	    new HigestPlayerId = GetPlayerPoolSize();
	    new HigestVehicleId = GetVehiclePoolSize();
	 	format(msg,sizeof(msg),"PlayerPoolSize: %d", HigestPlayerId);
		SendClientMessage(playerid, 0xFFFFFFFF, msg);
        format(msg,sizeof(msg),"VehiclePoolSize: %d", HigestVehicleId);
		SendClientMessage(playerid, 0xFFFFFFFF, msg);
		return 1;
	}

	if(strcmp(cmd, "/sirenstate", true ) == 0)
	{
	    if( GetPlayerVehicleID(playerid) && GetPlayerVehicleID(playerid) != INVALID_VEHICLE_ID &&
		    GetVehicleParamsSirenState(GetPlayerVehicleID(playerid)) == VEHICLE_PARAMS_ON )
		{
		   SendClientMessage(playerid, 0xFFFFFFFF, "Siren is ON");
	    }
		else {
		   SendClientMessage(playerid, 0xFFFFFFFF, "Siren is OFF");
	    }

	    return 1;
	}

	if(strcmp(cmd, "/opencardoors", true ) == 0)
	{
        if(GetPlayerVehicleID(playerid) && GetPlayerVehicleID(playerid) != INVALID_VEHICLE_ID)
		{
			SetVehicleParamsCarDoors(GetPlayerVehicleID(playerid), VEHICLE_PARAMS_ON, VEHICLE_PARAMS_ON, VEHICLE_PARAMS_ON, VEHICLE_PARAMS_ON);
	    }
	    
   		if(GetPlayerCameraTargetVehicle(playerid) != INVALID_VEHICLE_ID)
		{
			SetVehicleParamsCarDoors(GetPlayerCameraTargetVehicle(playerid), VEHICLE_PARAMS_ON, VEHICLE_PARAMS_ON, VEHICLE_PARAMS_ON, VEHICLE_PARAMS_ON);
	    }
	    return 1;
	}

	if(strcmp(cmd, "/closecardoors", true ) == 0)
	{
	    if(GetPlayerVehicleID(playerid) && GetPlayerVehicleID(playerid) != INVALID_VEHICLE_ID)
		{
			SetVehicleParamsCarDoors(GetPlayerVehicleID(playerid), VEHICLE_PARAMS_OFF, VEHICLE_PARAMS_OFF, VEHICLE_PARAMS_OFF, VEHICLE_PARAMS_OFF);
	    }
	    
	    if(GetPlayerCameraTargetVehicle(playerid) != INVALID_VEHICLE_ID)
		{
			SetVehicleParamsCarDoors(GetPlayerCameraTargetVehicle(playerid), VEHICLE_PARAMS_OFF, VEHICLE_PARAMS_OFF, VEHICLE_PARAMS_OFF, VEHICLE_PARAMS_OFF);
	    }
 	    return 1;
	}

	if(strcmp(cmd, "/opencarwindows", true ) == 0)
	{
	    if(GetPlayerVehicleID(playerid) && GetPlayerVehicleID(playerid) != INVALID_VEHICLE_ID)
		{
			SetVehicleParamsCarWindows(GetPlayerVehicleID(playerid), VEHICLE_PARAMS_OFF, VEHICLE_PARAMS_OFF, VEHICLE_PARAMS_OFF, VEHICLE_PARAMS_OFF);
	    }
	    return 1;
	}

	if(strcmp(cmd, "/closecarwindows", true ) == 0)
	{
	    if(GetPlayerVehicleID(playerid) && GetPlayerVehicleID(playerid) != INVALID_VEHICLE_ID)
		{
			SetVehicleParamsCarWindows(GetPlayerVehicleID(playerid), VEHICLE_PARAMS_ON, VEHICLE_PARAMS_ON, VEHICLE_PARAMS_ON, VEHICLE_PARAMS_ON);
	    }
	    return 1;
	}

	if(strcmp(cmd, "/spritetest", true ) == 0)
	{
    	txtSpriteTest[0] = TextDrawCreate(100.0, 100.0, "ld_grav:timer"); // Text is txdfile:texture
    	TextDrawFont(txtSpriteTest[0], 4); // Font ID 4 is the sprite draw font
    	TextDrawColor(txtSpriteTest[0],0xFFFFFFFF);
    	TextDrawTextSize(txtSpriteTest[0],100.0,100.0); // Text size is the Width:Height
    	TextDrawShowForPlayer(playerid,txtSpriteTest[0]);

    	txtSpriteTest[1] = TextDrawCreate(200.0, 100.0, "ld_grav:bee2"); // Text is txdfile:texture
    	TextDrawFont(txtSpriteTest[1], 4); // Font ID 4 is the sprite draw font
    	TextDrawColor(txtSpriteTest[1],0xFFFFFFFF);
    	TextDrawTextSize(txtSpriteTest[1],100.0,100.0); // Text size is the Width:Height
    	TextDrawShowForPlayer(playerid,txtSpriteTest[1]);

    	txtSpriteTest[2] = TextDrawCreate(100.0, 200.0, "ld_slot:r_69"); // Text is txdfile:texture
    	TextDrawFont(txtSpriteTest[2], 4); // Font ID 4 is the sprite draw font
    	TextDrawColor(txtSpriteTest[2],0xFFFFFFFF);
    	TextDrawTextSize(txtSpriteTest[2],100.0,100.0); // Text size is the Width:Height
    	TextDrawShowForPlayer(playerid,txtSpriteTest[2]);

		txtSpriteTest[3] = TextDrawCreate(200.0, 200.0, "ld_slot:cherry"); // Text is txdfile:texture
    	TextDrawFont(txtSpriteTest[3], 4); // Font ID 4 is the sprite draw font
    	TextDrawColor(txtSpriteTest[3],0xFFFFFFFF);
    	TextDrawTextSize(txtSpriteTest[3],100.0,100.0); // Text size is the Width:Height
    	TextDrawShowForPlayer(playerid,txtSpriteTest[3]);

    	txtSpriteTest[4] = TextDrawCreate(100.0, 300.0, "ld_card:cd9d"); // Text is txdfile:texture
    	TextDrawFont(txtSpriteTest[4], 4); // Font ID 4 is the sprite draw font
    	TextDrawColor(txtSpriteTest[4],0xFFFFFFFF);
    	TextDrawTextSize(txtSpriteTest[4],100.0,100.0); // Text size is the Width:Height
    	TextDrawShowForPlayer(playerid,txtSpriteTest[4]);

    	return 1;
	}

	if(strcmp(cmd, "/delspritetest", true ) == 0)
	{
		TextDrawDestroy(txtSpriteTest[0]);
		TextDrawDestroy(txtSpriteTest[1]);
		TextDrawDestroy(txtSpriteTest[2]);
		TextDrawDestroy(txtSpriteTest[3]);
		TextDrawDestroy(txtSpriteTest[4]);
		return 1;
	}

	if(strcmp(cmd, "/removeallbuilding", true ) == 0)
	{
		RemoveBuildingForPlayer(playerid, -1, 0.0, 0.0, 0.0, 6000.0);
		return 1;
	}

	if(strcmp(cmd, "/actoratme", true ) == 0)
	{
	  	new Float:X, Float:Y, Float:Z, Float:fang;
	    GetPlayerPos(playerid, X, Y, Z);
	    GetPlayerFacingAngle(playerid, fang);
		test_actor_id = CreateActor(25000, X+1.0, Y+1.0, Z+0.5, fang);
		//SetActorInvulnerable(test_actor_id);
		SetActorVirtualWorld(test_actor_id, GetPlayerVirtualWorld(playerid));
		return 1;
	}

	if(strcmp(cmd, "/actorground", true) == 0) {
	    ApplyActorAnimation(test_actor_id, "BEACH", "ParkSit_M_loop", 4.0, 1, 1, 1, 1, -1);
		return 1;
	}

	if(strcmp(cmd, "/actorclear", true) == 0) {
	    ClearActorAnimations(test_actor_id);
		return 1;
	}

	if(strcmp(cmd, "/actorface", true) == 0) {
	    new Float:fang;
	    GetPlayerFacingAngle(playerid, fang);
	    SetActorFacingAngle(test_actor_id, fang);
		return 1;
	}

	if(strcmp(cmd, "/actorpos", true) == 0) {
	   	new Float:X, Float:Y, Float:Z;
	    GetPlayerPos(playerid, X, Y, Z);
	    SetActorPos(test_actor_id, X+1.0, Y+1.0, Z);
		return 1;
	}

// ----------------------

// ----------------------

// ----------------------

   
	



	if(ProcessVehicleCommands(playerid,cmdtext)) {
	    return 1;
	}
	
	

*/
	
	
	//return 0;
//}


//----------------------------------------------------------
//mulai hilankanplayeupdate

//hilankanplayeupdate selesai */
/*
public OnGameModeInIt()
{
    CreatePlayerObject(3428,-1575.78638,852.52661,6.72064,0.0000,0.0000,0.0000,999.0);
	//Ini Objeck tambahan terakhir
	CreateObject(3474, 1116.29822, -1387.77185, 18.81791,   0.00000, 0.00000, 1.70477);
	CreateObject(5811, 1117.28601, -1393.49182, 16.39510,   0.00000, 0.00000, 2.22422);
	CreateObject(8303, 1115.24829, -1361.68237, 29.87900,   0.00000, 0.00000, 270.00000);
	//CreateObject(3428, -1575.78638, 852.52661, 6.72064,   0.00000, 0.00000, 0.00000);
	//CreateObject(codingblablahere);
    //Rest of it here etc. I hope you get the point
    return 1;
}
// Mapping untuk bank SF
//CreateObject(3428, -1575.78638, 852.52661, 6.72064,   0.00000, 0.00000, 0.00000);

//----------------------------------------------------------





//------------------------------------------------




GetNumberOfPages()
{
	if((gTotalItems >= SELECTION_ITEMS) && (gTotalItems % SELECTION_ITEMS) == 0)
	{
		return (gTotalItems / SELECTION_ITEMS);
	}
	else return (gTotalItems / SELECTION_ITEMS) + 1;
}

//------------------------------------------------

PlayerText:CreateCurrentPageTextDraw(playerid, Float:Xpos, Float:Ypos)
{
	new PlayerText:txtInit;
   	txtInit = CreatePlayerTextDraw(playerid, Xpos, Ypos, "0/0");
   	PlayerTextDrawUseBox(playerid, txtInit, 0);
	PlayerTextDrawLetterSize(playerid, txtInit, 0.4, 1.1);
	PlayerTextDrawFont(playerid, txtInit, 1);
	PlayerTextDrawSetShadow(playerid, txtInit, 0);
    PlayerTextDrawSetOutline(playerid, txtInit, 1);
    PlayerTextDrawColor(playerid, txtInit, 0xACCBF1FF);
    PlayerTextDrawShow(playerid, txtInit);
    return txtInit;
}

//------------------------------------------------
// Creates a button textdraw and returns the textdraw ID.

PlayerText:CreatePlayerDialogButton(playerid, Float:Xpos, Float:Ypos, Float:Width, Float:Height, button_text[])
{
 	new PlayerText:txtInit;
   	txtInit = CreatePlayerTextDraw(playerid, Xpos, Ypos, button_text);
   	PlayerTextDrawUseBox(playerid, txtInit, 1);
   	PlayerTextDrawBoxColor(playerid, txtInit, 0x000000FF);
   	PlayerTextDrawBackgroundColor(playerid, txtInit, 0x000000FF);
	PlayerTextDrawLetterSize(playerid, txtInit, 0.4, 1.1);
	PlayerTextDrawFont(playerid, txtInit, 1);
	PlayerTextDrawSetShadow(playerid, txtInit, 0); // no shadow
    PlayerTextDrawSetOutline(playerid, txtInit, 0);
    PlayerTextDrawColor(playerid, txtInit, 0x4A5A6BFF);
    PlayerTextDrawSetSelectable(playerid, txtInit, 1);
    PlayerTextDrawAlignment(playerid, txtInit, 2);
    PlayerTextDrawTextSize(playerid, txtInit, Height, Width); // The width and height are reversed for centering.. something the game does <g>
    PlayerTextDrawShow(playerid, txtInit);
    return txtInit;
}

//------------------------------------------------

PlayerText:CreatePlayerHeaderTextDraw(playerid, Float:Xpos, Float:Ypos, header_text[])
{
	new PlayerText:txtInit;
   	txtInit = CreatePlayerTextDraw(playerid, Xpos, Ypos, header_text);
   	PlayerTextDrawUseBox(playerid, txtInit, 0);
	PlayerTextDrawLetterSize(playerid, txtInit, 1.25, 3.0);
	PlayerTextDrawFont(playerid, txtInit, 0);
	PlayerTextDrawSetShadow(playerid, txtInit, 0);
    PlayerTextDrawSetOutline(playerid, txtInit, 1);
    PlayerTextDrawColor(playerid, txtInit, 0xACCBF1FF);
    PlayerTextDrawShow(playerid, txtInit);
    return txtInit;
}

//------------------------------------------------

PlayerText:CreatePlayerBackgroundTextDraw(playerid, Float:Xpos, Float:Ypos, Float:Width, Float:Height)
{
	new PlayerText:txtBackground = CreatePlayerTextDraw(playerid, Xpos, Ypos,
	"                                           ~n~"); // enough space for everyone
    PlayerTextDrawUseBox(playerid, txtBackground, 1);
    PlayerTextDrawBoxColor(playerid, txtBackground, 0x4A5A6BBB);
	PlayerTextDrawLetterSize(playerid, txtBackground, 5.0, 5.0);
	PlayerTextDrawFont(playerid, txtBackground, 0);
	PlayerTextDrawSetShadow(playerid, txtBackground, 0);
    PlayerTextDrawSetOutline(playerid, txtBackground, 0);
    PlayerTextDrawColor(playerid, txtBackground,0xFFFFFFFF);
    PlayerTextDrawTextSize(playerid, txtBackground, Width, Height);
   	PlayerTextDrawBackgroundColor(playerid, txtBackground, 0x4A5A6BBB);
    PlayerTextDrawShow(playerid, txtBackground);
    return txtBackground;
}

//------------------------------------------------
// Creates a model preview sprite

PlayerText:CreateModelPreviewTextDraw(playerid, modelindex, Float:Xpos, Float:Ypos, Float:width, Float:height)
{
    new PlayerText:txtPlayerSprite = CreatePlayerTextDraw(playerid, Xpos, Ypos, ""); // it has to be set with SetText later
    PlayerTextDrawFont(playerid, txtPlayerSprite, TEXT_DRAW_FONT_MODEL_PREVIEW);
    PlayerTextDrawColor(playerid, txtPlayerSprite, 0xFFFFFFFF);
    PlayerTextDrawBackgroundColor(playerid, txtPlayerSprite, 0x88888899);
    PlayerTextDrawTextSize(playerid, txtPlayerSprite, width, height); // Text size is the Width:Height
    PlayerTextDrawSetPreviewModel(playerid, txtPlayerSprite, modelindex);
    if(modelindex > 319) {
    	PlayerTextDrawSetPreviewRot(playerid,txtPlayerSprite, -15.0, 0.0, 0.0);
	}
    PlayerTextDrawSetSelectable(playerid, txtPlayerSprite, 1);
    PlayerTextDrawShow(playerid,txtPlayerSprite);
    return txtPlayerSprite;
}

//------------------------------------------------

DestroyPlayerModelPreviews(playerid)
{
	new x=0;
	while(x != SELECTION_ITEMS) {
	    if(gSelectionItems[playerid][x] != PlayerText:INVALID_TEXT_DRAW) {
			PlayerTextDrawDestroy(playerid, gSelectionItems[playerid][x]);
			gSelectionItems[playerid][x] = PlayerText:INVALID_TEXT_DRAW;
		}
		x++;
	}
}

//------------------------------------------------

ShowPlayerModelPreviews(playerid)
{
    new x=0;
	new Float:BaseX = DIALOG_BASE_X;
	new Float:BaseY = DIALOG_BASE_Y - (SPRITE_DIM_Y * 0.33); // down a bit
	new linetracker = 0;

	new itemat = GetPVarInt(playerid, "ospawner_page") * SELECTION_ITEMS;

	// Destroy any previous ones created
	DestroyPlayerModelPreviews(playerid);

	while(x != SELECTION_ITEMS && itemat < gTotalItems) {
	    if(linetracker == 0) {
	        BaseX = DIALOG_BASE_X + 25.0; // in a bit from the box
	        BaseY += SPRITE_DIM_Y + 1.0; // move on the Y for the next line
		}
  		gSelectionItems[playerid][x] = CreateModelPreviewTextDraw(playerid, itemat, BaseX, BaseY, SPRITE_DIM_X, SPRITE_DIM_Y);
  		gSelectionItemsTag[playerid][x] = itemat;
		BaseX += SPRITE_DIM_X + 1.0; // move on the X for the next sprite
		linetracker++;
		if(linetracker == ITEMS_PER_LINE) linetracker = 0;
		itemat++;
		x++;
	}
}

//------------------------------------------------

UpdatePageTextDraw(playerid)
{
	new PageText[64+1];
	format(PageText, 64, "%d/%d", GetPVarInt(playerid,"ospawner_page") + 1, GetNumberOfPages());
	PlayerTextDrawSetString(playerid, gCurrentPageTextDrawId[playerid], PageText);
}

//------------------------------------------------

CreateSelectionMenu(playerid)
{
	
	gHeaderTextDrawId[playerid] = CreatePlayerHeaderTextDraw(playerid, DIALOG_BASE_X, DIALOG_BASE_Y, HEADER_TEXT);
    gCurrentPageTextDrawId[playerid] = CreateCurrentPageTextDraw(playerid, DIALOG_WIDTH - 50.0, DIALOG_BASE_Y + 15.0);
    gNextButtonTextDrawId[playerid] = CreatePlayerDialogButton(playerid, DIALOG_WIDTH - 30.0, DIALOG_BASE_Y+DIALOG_HEIGHT+100.0, 50.0, 16.0, NEXT_TEXT);
    gPrevButtonTextDrawId[playerid] = CreatePlayerDialogButton(playerid, DIALOG_WIDTH - 90.0, DIALOG_BASE_Y+DIALOG_HEIGHT+100.0, 50.0, 16.0, PREV_TEXT);

    ShowPlayerModelPreviews(playerid);
    UpdatePageTextDraw(playerid);
}

//------------------------------------------------

DestroySelectionMenu(playerid)
{
	DestroyPlayerModelPreviews(playerid);

	PlayerTextDrawDestroy(playerid, gHeaderTextDrawId[playerid]);
	
	PlayerTextDrawDestroy(playerid, gCurrentPageTextDrawId[playerid]);
	PlayerTextDrawDestroy(playerid, gNextButtonTextDrawId[playerid]);
	PlayerTextDrawDestroy(playerid, gPrevButtonTextDrawId[playerid]);

	gHeaderTextDrawId[playerid] = PlayerText:INVALID_TEXT_DRAW;
    
    gCurrentPageTextDrawId[playerid] = PlayerText:INVALID_TEXT_DRAW;
    gNextButtonTextDrawId[playerid] = PlayerText:INVALID_TEXT_DRAW;
    gPrevButtonTextDrawId[playerid] = PlayerText:INVALID_TEXT_DRAW;
}

//------------------------------------------------

SpawnVehicle_InfrontOfPlayer(playerid, vehiclemodel, color1, color2)
{
	new Float:x,Float:y,Float:z;
	new Float:facing;
	new Float:distance;

    GetPlayerPos(playerid, x, y, z);
    GetPlayerFacingAngle(playerid, facing);

    new Float:size_x,Float:size_y,Float:size_z;
	GetVehicleModelInfo(vehiclemodel, VEHICLE_MODEL_INFO_SIZE, size_x, size_y, size_z);

	distance = size_x + 0.5;

  	x += (distance * floatsin(-facing, degrees));
    y += (distance * floatcos(-facing, degrees));

	facing += 90.0;
	if(facing > 360.0) facing -= 360.0;

	return CreateVehicle(vehiclemodel, x, y, z + (size_z * 0.25), facing, color1, color2, -1);
}

//------------------------------------------------

SpawnObject_InfrontOfPlayer(playerid, model)
{
	new Float:x,Float:y,Float:z;
	new Float:facing;
	new Float:distance;

    GetPlayerPos(playerid, x, y, z);
    GetPlayerFacingAngle(playerid, facing);

    distance = 5.0;

  	x += (distance * floatsin(-facing, degrees));
    y += (distance * floatcos(-facing, degrees));

	facing += 90.0;
	if(facing > 360.0) facing -= 360.0;

	return CreateObject(model, x, y, z, 0.0, 0.0, 0.0, 300.0);
}

//------------------------------------------------

HandlePlayerItemSelection(playerid, selecteditem)
{
    if(gSelectionItemsTag[playerid][selecteditem] >= 0 && gSelectionItemsTag[playerid][selecteditem] < 319) {
        SetPlayerSkin(playerid, gSelectionItemsTag[playerid][selecteditem]);
		return;
	}
	if(gSelectionItemsTag[playerid][selecteditem] >= 400 && gSelectionItemsTag[playerid][selecteditem] < 612) {
		// In this case we're spawning a vehicle for them
    	SpawnVehicle_InfrontOfPlayer(playerid, gSelectionItemsTag[playerid][selecteditem], -1, -1);
    	return;
	}
    if(gSelectionItemsTag[playerid][selecteditem] > 615) {
    	new objectid = SpawnObject_InfrontOfPlayer(playerid, gSelectionItemsTag[playerid][selecteditem]);
    	EditObject(playerid, objectid);
    	return;
	}
}

//------------------------------------------------

//-------------------------------------------
// Even though only Player* textdraws are used in this script,
// OnPlayerClickTextDraw is still required to handle ESC

public OnPlayerClickTextDraw(playerid, Text:clickedid)
{
   	if(GetPVarInt(playerid, "ospawner_active") == 0) return 0;

	// Handle: They cancelled (with ESC)
	if(clickedid == Text:INVALID_TEXT_DRAW) {
        DestroySelectionMenu(playerid);
        SetPVarInt(playerid, "ospawner_active", 0);
        PlayerPlaySound(playerid, 1085, 0.0, 0.0, 0.0);
        return 1;
	}

	return 0;
}

//------------------------------------------------

public OnPlayerClickPlayerTextDraw(playerid, PlayerText:playertextid)
{
	if(GetPVarInt(playerid, "ospawner_active") == 0) return 0;

	new curpage = GetPVarInt(playerid, "ospawner_page");

	// Handle: next button
	if(playertextid == gNextButtonTextDrawId[playerid]) {
	    if(curpage < (GetNumberOfPages() - 1)) {
	        SetPVarInt(playerid, "ospawner_page", curpage + 1);
	        ShowPlayerModelPreviews(playerid);
         	UpdatePageTextDraw(playerid);
         	PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
		} else {
		    PlayerPlaySound(playerid, 1085, 0.0, 0.0, 0.0);
		}
		return 1;
	}

	// Handle: previous button
	if(playertextid == gPrevButtonTextDrawId[playerid]) {
	    if(curpage > 0) {
	    	SetPVarInt(playerid, "ospawner_page", curpage - 1);
	    	ShowPlayerModelPreviews(playerid);
	    	UpdatePageTextDraw(playerid);
	    	PlayerPlaySound(playerid, 1084, 0.0, 0.0, 0.0);
		} else {
		    PlayerPlaySound(playerid, 1085, 0.0, 0.0, 0.0);
		}
		return 1;
	}

	// Search in the array of textdraws used for the items
	new x=0;
	while(x != SELECTION_ITEMS) {
	    if(playertextid == gSelectionItems[playerid][x]) {
	        DestroySelectionMenu(playerid);
	        CancelSelectTextDraw(playerid);
	        HandlePlayerItemSelection(playerid, x);
	        PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
        	SetPVarInt(playerid, "ospawner_active", 0);
        	return 1;
		}
		x++;
	}

	return 0;
}

//------------------------------------------------

//------------------------------------------------

*/


public OnPlayerDisconnect(playerid, reason)
{
	//pInfo[playerid][pTipeMobil] = GetVehicleModel(GetPlayerVehicleID(playerid));
	RemovePlayerAttachedObject(playerid, 1);
	RemovePlayerAttachedObject(playerid, 2);
	RemovePlayerAttachedObject(playerid, 3);


	new tekslogininformasi[200];
	format(tekslogininformasi, 200,"* "COL_RED"%s "COL_YELLOW"telah meninggalkan server dengan tenang namun ber IP %s dan beruang"COL_GREEN" %i Rupiah.",
	pInfo[playerid][Nick], pInfo[playerid][IP], pInfo[playerid][pMoney]);
	SendClientMessageToAll(COLOR_YELLOW, tekslogininformasi);
	// ini peenghapusan dari player yang punya ado dan ame
	// kondisi DC playernya
    DestroyDynamic3DTextLabel(ado[playerid]);
    DestroyDynamic3DTextLabel(ame[playerid]);
    amestatus[playerid] = 0;
    adostatus[playerid] = 0;

    //new Float:orangnyaposisix, Float:orangnyaposisiy, Float:orangnyaposisiz;

    GetPlayerPos(playerid, pInfo[playerid][pPx], pInfo[playerid][pPy], pInfo[playerid][pPz]);
              

    //new teksposisiplayernya[100];
    //format(teksposisiplayernya, 100, "%f, %f, %f", orangnyaposisix, orangnyaposisiy, orangnyaposisiz);
   // pInfo[playerid][pPosisiTerakhir] = teksposisiplayernya[99];

    new Query[500];
    format(Query, 500, "UPDATE `playerdata` SET `ppx` = '%f',`ppy` = '%f',`ppz` = '%f',`money` = '%i' WHERE `id` = '%d' LIMIT 1",
    pInfo[playerid][pPx], pInfo[playerid][pPy], pInfo[playerid][pPz], pInfo[playerid][pMoney],
    pInfo[playerid][ID]);
    //mysql_query(MySQL:handle, const query[], bool:use_cache = true)
    mysql_query(MySQL:g_Sql, Query, bool:true);


    //new Float:mobilx, Float:mobily, Float:mobilz;
    //GetVehiclePos(vehicleid, Float:x, Float:y, Float:z)
    GetVehiclePos(mobilplayer1[playerid], Float:pInfo[playerid][pMx], Float:pInfo[playerid][pMy], Float:pInfo[playerid][pMz]);

    //new teksposisimobil[100];
    //format(teksposisimobil, 100, "%f, %f, %f", mobilx, mobily, mobilz);
    //pInfo[playerid][pPosisiMobil] = teksposisimobil[99];



    pInfo[playerid][Mvw1] = GetVehicleVirtualWorld(mobilplayer1[playerid]);

    new simpanpword[100];
    format(simpanpword, sizeof(simpanpword), "UPDATE `playerdata` SET `pword` = '%i', `vwm1` = '%i' WHERE `id` = '%d' LIMIT 1", pInfo[playerid][pWord], pInfo[playerid][Mvw1], pInfo[playerid][ID]);
    mysql_query(MySQL:g_Sql, simpanpword, bool:true);

    

    new simpanpinterior[100];
    format(simpanpinterior, sizeof(simpanpinterior), "UPDATE `playerdata` SET `pinterior` = '%i' WHERE `id` = '%d' LIMIT 1",pInfo[playerid][pInterior],pInfo[playerid][ID]);
    mysql_query(MySQL:g_Sql, simpanpinterior, bool:true);

    printf("Di tempat word %i di interior %i ",pInfo[playerid][pWord], pInfo[playerid][pInterior]);

    /*
    new tipemobil[500];
    format(tipemobil, 500, "UPDATE `playerdata` SET `tipemobil` = '%i' WHERE `id` = '%d' LIMIT 1",
    pInfo[playerid][pTipeMobil],
    pInfo[playerid][ID]);
	*/
    //mysql_query(g_Sql, tipemobil);

    //DestroyVehicle(pInfo[playerid][pPunyaMobil]);


    


    // ini untuk perintah kasi tau lokasi terakhir kendaraan
    new currentveh;
    currentveh = GetPlayerVehicleID(playerid);
 
    new Float:vehx, Float:vehy, Float:vehz;
    GetVehiclePos(currentveh, vehx, vehy, vehz);
 
    new vehpostext[96];
    format(vehpostext, sizeof(vehpostext), "The current vehicle positions are: %f, %f, %f", vehx, vehy, vehz);
 
    SendClientMessage(playerid, 0xFFFFFFFF, vehpostext);
    // ini untuk kasi tau kalau sudah selesai penyembutan posisinya.
    new Float:healthmp1;
    GetVehicleHealth(mobilplayer1[playerid], Float:healthmp1);

    format(simpanpinterior, sizeof(simpanpinterior), "UPDATE `playerdata` SET `healthm1` = '%f' WHERE `id` = '%d' LIMIT 1", Float:healthmp1,pInfo[playerid][ID]);
    mysql_query(MySQL:g_Sql, simpanpinterior, bool:true);

    printf("Health kendaraan %i yang tersimpan adalah %f ", mobilplayer1[playerid], Float:healthmp1);
    SavePlayer(playerid);

    return 1;
}




//------------------------------------------------
GetRPName(playerid)
{
    new RPName[MAX_PLAYER_NAME], i_pos;
    GetPlayerName(playerid, RPName, MAX_PLAYER_NAME);
    while ((i_pos = strfind(RPName, "_", false, i_pos)) != -1) RPName[i_pos] = ' ';
    return RPName;
}



stock GetClosestCar(playerid, exception = INVALID_VEHICLE_ID) 
{

    new
		Float: Distance,
		target = -1,
		Float: vPos[3];

	if(!IsPlayerInAnyVehicle(playerid)) GetPlayerPos(playerid, vPos[0], vPos[1], vPos[2]);
	else GetVehiclePos(GetPlayerVehicleID(playerid), vPos[0], vPos[1], vPos[2]);

    for(new v; v < MAX_VEHICLES; v++) if(GetVehicleModel(v) >= 400) {
        if(v != exception && (target < 0 || Distance > GetDistanceToCar(playerid, v, vPos[0], vPos[1], vPos[2]))) {
            target = v;
            Distance = GetDistanceToCar(playerid, v, vPos[0], vPos[1], vPos[2]); // Before the rewrite, we'd be running GetPlayerPos 2000 times...
        }
    }
    return target;
}

stock GetDistanceToCar(playerid, veh, Float: posX = 0.0, Float: posY = 0.0, Float: posZ = 0.0) {

	new
	    Float: Floats[2][3];

	if(posX == 0.0 && posY == 0.0 && posZ == 0.0) {
		if(!IsPlayerInAnyVehicle(playerid)) GetPlayerPos(playerid, Floats[0][0], Floats[0][1], Floats[0][2]);
		else GetVehiclePos(GetPlayerVehicleID(playerid), Floats[0][0], Floats[0][1], Floats[0][2]);
	}
	else {
		Floats[0][0] = posX;
		Floats[0][1] = posY;
		Floats[0][2] = posZ;
	}
	GetVehiclePos(veh, Floats[1][0], Floats[1][1], Floats[1][2]);
	return floatround(floatsqroot((Floats[1][0] - Floats[0][0]) * (Floats[1][0] - Floats[0][0]) + (Floats[1][1] - Floats[0][1]) * (Floats[1][1] - Floats[0][1]) + (Floats[1][2] - Floats[0][2]) * (Floats[1][2] - Floats[0][2])));
}

new WormAttached[MAX_PLAYERS],FishingEquipped[MAX_PLAYERS],fish[MAX_PLAYERS],attachingw[MAX_PLAYERS],AttachWorm[MAX_PLAYERS],TimerFish[MAX_PLAYERS],Fishing[MAX_PLAYERS],TimerAttachWorm[MAX_PLAYERS];


public FishChance(playerid)
{
	new
	fishchance = 0 + random(30);

	if(fishchance == 0)
	{
		SendClientMessage(playerid, COLOR_WHITE, "You have caught a Salmon. (5g)");
		pInfo[playerid][pFishes] += 5;
		PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
	}
	else if(fishchance == 1)
	{
		SendClientMessage(playerid, COLOR_GREEN, "You have caught a Lobster. (20g)");
		pInfo[playerid][pFishes] += 20;
		PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
	}
	else if(fishchance == 2)
	{
		SendClientMessage(playerid, COLOR_WHITE, "You have caught a Salmon. (5g)");
		pInfo[playerid][pFishes] += 5;
		PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
	}
	else if(fishchance == 3)
	{
		SendClientMessage(playerid, COLOR_WHITE, "You have caught an Angelfish. (1g)");
		pInfo[playerid][pFishes] += 1;
		PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
	}
	else if(fishchance == 4)
	{
		SendClientMessage(playerid, COLOR_LIGHTRED, "You reel the line in and notice that the bait worm is gone.");
	}
	else if(fishchance == 5)
	{
		SendClientMessage(playerid, COLOR_WHITE, "You have caught an Angelfish. (1g)");
		pInfo[playerid][pFishes] += 1;
		PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
	}
	else if(fishchance == 6)
	{
		SendClientMessage(playerid, COLOR_LIGHTRED, "You reel the line in and notice that the worm is gone.");
	}
	else if(fishchance == 7)
	{
		SendClientMessage(playerid, COLOR_WHITE, "You have caught an Angelfish. (1g)");
		pInfo[playerid][pFishes] += 1;
		PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
	}
	else if(fishchance == 8)
	{
		SendClientMessage(playerid, COLOR_WHITE, "You have caught an Angelfish. (1g)");
		pInfo[playerid][pFishes] += 1;
		PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
	}
	else if(fishchance == 9)
	{
		SendClientMessage(playerid, COLOR_WHITE, "You have caught a Salmon. (5g)");
		pInfo[playerid][pFishes] += 5;
		PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
	}
	else if(fishchance == 10)
	{
		SendClientMessage(playerid, COLOR_LIGHTRED, "You reel the line in and notice that the worm is gone.");
	}
	else if(fishchance == 11)
	{
		SendClientMessage(playerid, COLOR_GREEN, "You have caught a Lobster. (20g)");
		pInfo[playerid][pFishes] += 20;
		PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
	}
	else if(fishchance == 12)
	{
		SendClientMessage(playerid, COLOR_LIGHTRED, "You reel the line in and notice that the worm is gone.");
	}
	else if(fishchance == 13)
	{
		SendClientMessage(playerid, COLOR_GREEN, "You have caught a Lobster! (20g)");
		pInfo[playerid][pFishes] += 20;
		PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
	}
	else if(fishchance == 14)
	{
		SendClientMessage(playerid, COLOR_WHITE, "You have caught an Angelfish. (1g)");
		pInfo[playerid][pFishes] += 1;
		PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
	}
	else if(fishchance == 15)
	{
		SendClientMessage(playerid, COLOR_GREEN, "You have caught a Shark! (100g)");
		pInfo[playerid][pFishes] += 100;
		PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
	}
	else if(fishchance == 16)
	{
		SendClientMessage(playerid, COLOR_LIGHTRED, "You reel the line in and notice that the worm is gone.");
	}
	else if(fishchance == 17)
	{
		SendClientMessage(playerid, COLOR_WHITE, "You have caught an Angelfish. (1g)");
		pInfo[playerid][pFishes] += 1;
		PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
	}
	else if(fishchance == 18)
	{
		SendClientMessage(playerid, COLOR_WHITE, "You have caught a Salmon. (5g)");
		pInfo[playerid][pFishes] += 5;
		PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
	}
	else if(fishchance == 19)
	{
		SendClientMessage(playerid, COLOR_LIGHTRED, "You reel the line in and notice that the worm is gone.");
	}
	else if(fishchance == 20)
	{
		SendClientMessage(playerid, COLOR_WHITE, "You have caught an Angelfish. (1g)");
		pInfo[playerid][pFishes] += 1;
		PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
	}
	else if(fishchance == 21)
	{
		SendClientMessage(playerid, COLOR_WHITE, "You have caught an Angelfish. (1g)");
		pInfo[playerid][pFishes] += 1;
		PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
	}
	else if(fishchance == 22)
	{
		SendClientMessage(playerid, COLOR_LIGHTRED, "You reel the line in and notice that the worm is gone.");
	}
	else if(fishchance == 23)
	{
		SendClientMessage(playerid, COLOR_WHITE, "You have caught a Salmon. (5g)");
		pInfo[playerid][pFishes] += 5;
		PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
	}
	else if(fishchance == 24)
	{
		SendClientMessage(playerid, COLOR_LIGHTRED, "You reel the line in and notice that the worm is gone.");
	}
	else if(fishchance == 25)
	{
		SendClientMessage(playerid, COLOR_WHITE, "You have caught an Angelfish. (1g)");
		pInfo[playerid][pFishes] += 1;
		PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
	}
	else if(fishchance == 26)
	{
		SendClientMessage(playerid, COLOR_WHITE, "You have caught a Salmon. (5g)");
		pInfo[playerid][pFishes] += 5;
		PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
	}
	else if(fishchance == 27)
	{
		SendClientMessage(playerid, COLOR_LIGHTRED, "You reel the line in and notice that the worm is gone.");
	}
	else if(fishchance == 28)
	{
		SendClientMessage(playerid, COLOR_WHITE, "You have caught an Angelfish. (1g)");
		pInfo[playerid][pFishes] += 1;
		PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
	}
	else if(fishchance == 29)
	{
		SendClientMessage(playerid, COLOR_GREEN, "You have caught a Lobster. (20g)");
		pInfo[playerid][pFishes] += 20;
		PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
	}
	else if(fishchance == 30)
	{
		SendClientMessage(playerid, COLOR_GREEN, "You have caught a Shark! (100g)");
		pInfo[playerid][pFishes] += 100;
		PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
	}
	return 1;
}


public timerFish(playerid)
{
    if(fish[playerid] > 0)
    {
        new string[128];
        format(string, 50, "~w~FISHING...", fish[playerid]);
        GameTextForPlayer(playerid, string, 1300, 1);
        fish[playerid] = fish[playerid] - 1;
	    format(string, sizeof(string), "* %s is fishing now with rod.", GetRPName(playerid));
	    SetPlayerChatBubble(playerid, string, COLOR_PURPLE, 100.0, 10000);
    }
    else
    {
		TogglePlayerControllable(playerid, 1);
		KillTimer(TimerFish[playerid]);
		FishChance(playerid);
		ClearAnimations(playerid);
		SetPlayerProgressBarValue(playerid, PlayerBar:pInfo[playerid][pLaparBar], GetPlayerProgressBarValue(playerid, PlayerBar:pInfo[playerid][pLaparBar]) - Float:20.0);
		SetPlayerProgressBarColour(playerid, PlayerBar:pInfo[playerid][pLaparBar], COLOR_RED);
		DestroyObject(EfekPancingan[playerid]); 
		Fishing[playerid] = false;
	}
	return 1;
}

public timerAttachWorm(playerid)
{
    if(AttachWorm[playerid] > 0)
    {
        new string[128];
        format(string, 50, "~w~Attaching...", AttachWorm[playerid]);
        GameTextForPlayer(playerid, string, 800, 1);
        AttachWorm[playerid] = AttachWorm[playerid] - 1;
	    format(string, sizeof(string), "* %s is trying to attach a worm to his fishing hook.", GetRPName(playerid));
	    SetPlayerChatBubble(playerid, string, COLOR_PURPLE, 100.0, 10000);
	    ApplyAnimation(playerid, "MISC", "SEAT_LR", 4.0,0,0,0,0,0,0);

    }
    else
    {
    	ClearAnimations(playerid, 1);
		TogglePlayerControllable(playerid, 1);
		KillTimer(TimerAttachWorm[playerid]);
		WormAttached[playerid] = 1;
		attachingw[playerid] = 0;
		SendClientMessage(playerid, COLOR_WHITE, "You have attached the worm to the hook.");
		ApplyAnimation(playerid, "CARRY","putdwn", 4.0,0,0,0,0,0,0);
	}
	return 1;
}



CMD:getcrate(playerid, params[])
{
	StatusCrateTerangkat = true;
	SetPlayerArmedWeapon(playerid, 0);
	ApplyAnimation(playerid, "CARRY", "crry_prtial", 2.0, 0, 0, 0, 1, 1);
	
	CrateBox = SetPlayerAttachedObject(playerid,6,19900,1,0.280000,0.449998,-0.275998,-5.399997,7.100007,-7.699997,0.749000,0.589999,0.609998);
	//SetPlayerAttachedObject(playerid, index, modelid, bone, Float:fOffsetX = 0.0, Float:fOffsetY = 0.0, Float:fOffsetZ = 0.0, Float:fRotX = 0.0, Float:fRotY = 0.0, Float:fRotZ = 0.0, Float:fScaleX = 1.0, Float:fScaleY = 1.0, Float:fScaleZ = 1.0, materialcolor1 = 0, materialcolor2 = 0)
	PlayerPlaySound(playerid, 1138, 0.0, 0.0, 0.0);

	SendClientMessage(playerid, COLOR_WHITE, "Anda angkat sebuah crate Box sekarang.");
}

CMD:dropcrate(playerid, params[])
{
	StatusCrateTerangkat = false;
	ApplyAnimation(playerid, "CARRY","putdwn", 4.0,0,0,0,0,0,0);
	RemovePlayerAttachedObject(playerid, 6);
	PlayerPlaySound(playerid, 1137, 0.0, 0.0, 0.0);
	SendClientMessage(playerid, COLOR_WHITE, "Anda menaruh crate tersebut");

}

CMD:payday(playerid, params[])
{
	
	
	//tambahan berkurang energynya saat payday
	new BantuanPayDay = random(2000);
	pInfo[playerid][pMoney] = pInfo[playerid][pMoney]+BantuanPayDay;
	ResetPlayerMoney(playerid);
	GivePlayerMoney(playerid, pInfo[playerid][pMoney]);
    new Float:NilaiLapar = Float:GetPlayerProgressBarValue(playerid, PlayerBar:pInfo[playerid][pLaparBar]) - Float:20.0;
    SetPlayerProgressBarValue(playerid, PlayerBar:pInfo[playerid][pLaparBar], Float:NilaiLapar);
    new string[250];
    format(string, sizeof(string), "* Anda di dompet %s di beri bonus PayDay sebesar "COL_GREEN"$%i,"COL_LIGHTBLUE" Oleh Pemerintah Kota", GetRPName(playerid), BantuanPayDay);
    SendClientMessage(playerid, -1, string);
    format(string, sizeof(string), "~g~+%i~n~%s", BantuanPayDay,                  GetRPName(playerid));
    GameTextForPlayer(playerid, string, 2000, 1);
    ApplyAnimation(playerid, "ped", "gum_eat", 4.0, 0, 0, 0, 0, 0, 0);
    PlayerPlaySound(playerid, 1054, 0.0, 0.0, 0.0);

	return 1;
}

CMD:items(playerid)
{
	new str[256];
	new string[256];
	new i;
	new Float:X, Float:Y, Float:Z;
	new Player_Weapons[13];
	new Player_Ammos[13];

	for(i = 1;i <= 12;i++)
			{
				GetPlayerWeaponData(playerid, i, Player_Weapons[i], Player_Ammos[i]);
				if(Player_Weapons[i] != 0 && Player_Ammos[i] != 0)
				{
					new weaponName[128];
					GetWeaponName(Player_Weapons[i], weaponName, 128);
					format(string, 255, "Weapon Name: %s | Weapon Ammo: %d", weaponName, Player_Ammos[i]);
					SendClientMessage(playerid, -1, string);
				}
			}
			format(string, 255, "Money: $%d", GetPlayerMoney(playerid));
			SendClientMessage(playerid, -1, string);
			format(string, 255, "Alat Boombox: %d Mesin | Alat Pancingan: Kekuatan %d | Umpan Ikan: %d Cacing | Component Mekanik: %d Bahan | Ikan segar: %dg ", pInfo[playerid][pBoombox], pInfo[playerid][pFishingRod], pInfo[playerid][pWorms], pInfo[playerid][pComponent], pInfo[playerid][pFishes]);
			SendClientMessage(playerid, -1, string);
}



CMD:frisk(playerid, params[])
{
	// saat melakukan frisk ke orang lain
	new str[256];
	new string[256];
	new id, i;
	new Float:X, Float:Y, Float:Z;
	new Player_Weapons[13];
	new Player_Ammos[13];
	//GetPlayerName(playerid, IDPlayerYangFrisk, 20); 

    if(sscanf(params, "u", id)) return SendClientMessage(playerid, COLOR_ERROR, "[Usage:] /frisk [playerid/partofname].");
   	GetPlayerPos(id, X, Y, Z);
   	if(friskApproved[playerid] == false)
   	{
	    if(IsPlayerInRangeOfPoint(playerid, 10.0, X, Y, Z))
		{
		    friskInvited[id] = true;
		    Player_Frisk[id] = playerid;
		   	format(str, sizeof(str), "Your frisk request has been sent to %s.", GetRPName(id));
			SendClientMessage(playerid, COLOR_YELLOW, str);
  			format(str, sizeof(str), "%s has requested to frisk you, /acceptfrisk %d.", GetRPName(playerid), playerid);
			SendClientMessage(id, COLOR_YELLOW, str);
		} else return SendClientMessage(playerid, COLOR_LIGHTRED, "You're not close to that player.");
	}
	else if(friskApproved[playerid] == true)
	{
	    if(friskApproved[id] == false) return SendClientMessage(playerid, COLOR_LIGHTRED, "That player has not accepted to be frisked.");
		format(string, sizeof(string), "____________[%s]____________", GetRPName(id));
		SendClientMessage(playerid, COLOR_WHITE, string);
	 	GetPlayerPos(id, X, Y, Z);
	    if(IsPlayerInRangeOfPoint(playerid, 10.0, X, Y, Z))
		{
			for(i = 1;i <= 12;i++)
			{
				GetPlayerWeaponData(id, i, Player_Weapons[i], Player_Ammos[i]);
				if(Player_Weapons[i] != 0 && Player_Ammos[i] != 0)
				{
					new weaponName[128];
					GetWeaponName(Player_Weapons[i], weaponName, 128);
					format(string, 255, "Weapon Name: %s | Weapon Ammo: %d", weaponName, Player_Ammos[i]);
					SendClientMessage(playerid, -1, string);
				}
			}
			format(string, 255, "Money: $%d", GetPlayerMoney(id));
			SendClientMessage(playerid, -1, string);
			format(string, 255, "Alat Boombox: %d Mesin | Alat Pancingan: Kekuatan %d | Umpan Ikan: %d Cacing | Component Mekanik: %d Bahan | Ikan segar: %dg ", pInfo[id][pBoombox], pInfo[id][pFishingRod], pInfo[id][pWorms], pInfo[id][pComponent], pInfo[id][pFishes]);
			SendClientMessage(playerid, -1, string);
   			friskApproved[Player_Frisk[playerid]] = false;
    		friskApproved[playerid] = false;
		} else return SendClientMessage(playerid, COLOR_LIGHTRED, "You're not close to that player.");
	}
	return 1;
}

CMD:acceptfrisk(playerid, params[])
{
	new str[256];
	new id;
	
    if(sscanf(params, "u", id)) return SendClientMessage(playerid, COLOR_LIGHTRED, "[Usage:] /acceptfrisk [playerid/partofname].");
	if(friskInvited[playerid] == false) return SendClientMessage(playerid, COLOR_LIGHTRED, "You do not have a pending frisk request.");
	if(id != Player_Frisk[playerid]) return SendClientMessage(playerid, COLOR_LIGHTRED, "That player has not sent you a frisk request.");

    friskApproved[Player_Frisk[playerid]] = true;
    friskApproved[playerid] = true;
    friskInvited[playerid] = false;
    
   	format(str, sizeof(str), "You have accepted %s to frisk you.", GetRPName(Player_Frisk[playerid]));
	SendClientMessage(id, COLOR_YELLOW, str);
	
	format(str, sizeof(str), "%s has accepted your frisk request.", GetRPName(playerid));
	SendClientMessage(Player_Frisk[playerid], COLOR_YELLOW, str);

	
	new string[256],i;
	new Player_Weapons[13];
	new Player_Ammos[13];


	format(string, sizeof(string), "____________[%s]____________", GetRPName(playerid));
	SendClientMessage(Player_Frisk[playerid], COLOR_WHITE, string);
 	
	for(i = 1;i <= 12;i++)
	{
		GetPlayerWeaponData(playerid, i, Player_Weapons[i], Player_Ammos[i]);
		if(Player_Weapons[i] != 0 && Player_Ammos[i] != 0)
		{
			new weaponName[128];
			GetWeaponName(Player_Weapons[i], weaponName, 128);
			format(string, 255, "Weapon Name: %s | Weapon Ammo: %d", weaponName, Player_Ammos[i]);
			SendClientMessage(Player_Frisk[playerid], -1, string);
		}
	}
	format(string, 255, "Money: $%d", GetPlayerMoney(playerid));
	SendClientMessage(Player_Frisk[playerid], -1, string);
	format(string, 255, "Alat Boombox: %d Mesin | Alat Pancingan: Kekuatan %d | Umpan Ikan: %d Cacing | Component Mekanik: %d Bahan | Ikan segar: %dg ", pInfo[playerid][pBoombox], pInfo[playerid][pFishingRod], pInfo[playerid][pWorms], pInfo[playerid][pComponent], pInfo[playerid][pFishes]);
	SendClientMessage(Player_Frisk[playerid], -1, string);
	


	return 1;
}





CMD:drunk(playerid, params[])
{
	if(isnull(params)) return SendClientMessage(playerid, COLOR_GREEN, "[Usage:] /drunk (level 0 supaya sehat, level 90000 supaya terasa pusing.)");
    
	extract params -> new level;
	SetPlayerDrunkLevel(playerid, level);

	new string[128];
    format(string, 50, "~w~Pusing...", AttachWorm[playerid]);
    GameTextForPlayer(playerid, string, 800, 1);
    
    format(string, sizeof(string), "* %s merasakan pusing di kepalanya seperti ada %i bayangan", GetRPName(playerid), level);
    LocalMessage(ACTION_DISTANCE, playerid, ACTION_COLOR, string);
    
}


CMD:buycomponent(playerid, params[])
{
	// cmd beli component
	if(IsPlayerInRangeOfPoint(playerid, Float:4.0, 2141.9475,-1728.9771,13.5592))
   	{
   		if(isnull(params)) return SendClientMessage(playerid, COLOR_GREEN, "[Usage:] /buycomponent (Jumlah bahan component yang akan di beli)");
    
   		// fungsi untuk beli component
   		extract params -> new Jumlah;
   		pInfo[playerid][pComponent] = pInfo[playerid][pComponent] + Jumlah;

   		ApplyAnimation(playerid, "INT_SHOP","shop_shelf", 4.1, 0, 0, 0, 0, 0, 0);
		//ApplyAnimation(playerid, "SMOKING", "M_smk_in", 4.1, 0, 0, 0, 0, 0, 0);

		new hargacomponent = random(3)*Jumlah;
		pInfo[playerid][pMoney] = pInfo[playerid][pMoney]-hargacomponent;
		ResetPlayerMoney(playerid);
		GivePlayerMoney(playerid, pInfo[playerid][pMoney]);
		SavePlayer(playerid);

		new infopembelian[200];
		format(infopembelian, sizeof(infopembelian), ""COL_LIGHTBLUE"Component"COL_GREEN": Anda telah beli Component Sebanyak %i dengan harga %i$.", Jumlah, hargacomponent);
		SendClientMessage(playerid,0xFF0000FF, infopembelian);

   	}
   	else
   	{
   		ApplyAnimation(playerid, "MISC", "SEAT_LR", 4.0,0,0,0,0,0,0);
   		GameTextForPlayer(playerid, "Anda perlu ke penjual component mekanik untuk membelinya", 800, 1);
   	}
}


CMD:tambahnos(playerid, params[])
{
    
    if(pInfo[playerid][pComponent] > 5) // kebutuhan untuk modif mobil yaitu NOS nitro
    {
        new closestcar = GetClosestCar(playerid, INVALID_VEHICLE_ID);
        AddVehicleComponent(closestcar, 1010);
        new string[128];
        format(string, 50, "~w~Attaching %i Nitro ...", closestcar);
        GameTextForPlayer(playerid, string, 800, 1);
       
        format(string, sizeof(string), "* %s is trying to attach a Nitro to his Client Vehicle.", GetRPName(playerid));
        SetPlayerChatBubble(playerid, string, COLOR_PURPLE, 100.0, 10000);
        ApplyAnimation(playerid, "MISC","bng_wndw", 4.0,0,0,0,0,0,0);
        pInfo[playerid][pComponent] = pInfo[playerid][pComponent]-200;
        new infopembelian[200];
        format(infopembelian, sizeof(infopembelian), ""COL_LIGHTBLUE"Component"COL_GREEN": Anda menghabiskan 200 component dan kini tersisa %i item.", pInfo[playerid][pComponent]);
        SendClientMessage(playerid,0xFF0000FF, infopembelian);

    }
    else
    {
        GameTextForPlayer(playerid, "Anda sebaiknya beli component terlebih dahulu tuan.", 800, 1);
    }

    return 1;
}



/*
CMD:mv(playerid, params[])
{
    if(isnull(params)) return SendClientMessage(playerid, COLOR_GREEN, "[Usage:] /v (lock, get, park, lights, sell, givekeys, buy, eject, ejectall, find, clearmods, trunk, trunkinfo, enter, exit)");
    if(!strcmp(params, "lock", true, 4))
    {
		new vehicleid;
		if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		{
			vehicleid = GetPlayerVehicleID(playerid);
		}
		else
		{
			vehicleid = GetClosestVehicle(playerid);
			if(!PlayerToVehicle(playerid, vehicleid, 3.5)) vehicleid = 0;
	 	}
		if(!vehicleid) return SendClientMessage(playerid, COLOR_LIGHTRED, "You are not close to a vehicle.");
		if(GetVehicleVirtualWorld(vehicleid) != GetPlayerVirtualWorld(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "You are not close to a vehicle.");
		new id = GetVehicleID(vehicleid);
		if(!IsValidVehicle(id)) return SendClientMessage(playerid, COLOR_LIGHTRED, "You don't have the keys for this vehicle.");
		if(GetPlayerVehicleAccess(playerid, id) < 2)
		return SendClientMessage(playerid, COLOR_LIGHTRED, "You don't have the keys for this vehicle.");
		GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
		if(doors == 1)
		{
			doors = 0;
			VehicleLock[id] = 0;
			GameTextForPlayer(playerid, "~w~vehicle ~g~unlocked", 3000, 6);
			PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
		}
		else
		{
			doors = 1;
			VehicleLock[id] = 1;
			GameTextForPlayer(playerid, "~w~vehicle ~r~locked", 3000, 6);
	  		PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
		}
		SetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
		SaveVehicle(id);
		return 1;
    }
    else if(!strcmp(params, "breakin", true, 7))
    {
  		new vehicleid;
		if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		{
			vehicleid = GetPlayerVehicleID(playerid);
		}
		else
		{
			vehicleid = GetClosestVehicle(playerid);
			if(!PlayerToVehicle(playerid, vehicleid, 3.5)) vehicleid = 0;
	 	}
		if(!vehicleid) return SendClientMessage(playerid, COLOR_LIGHTRED, "You are not close to a vehicle.");
  		if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER) return SCM(playerid, COLOR_LIGHTRED, "You are already in a vehicle.");
		GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
  		if(doors == 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "This vehicle is already unlocked.");
  		if(breaking[playerid] == 1) return SendClientMessage(playerid, COLOR_LIGHTRED, "You are already breaking in.");
		if(toolkit[playerid] > 0)
		{
  			breakin[playerid] = 60;//change it with the timer time
    		Timer[playerid] = SetTimerEx("timer", 1000, 1, "i", playerid);
		    PlayerActionMessage(playerid, 20.0, "begins to fiddle with the lock of the vehicle.");
		    TogglePlayerControllable(playerid, 0);
		    breaking[playerid] = 1;
		}
    }
    else if(!strcmp(params, "hotwire", true, 7))
    {
        new vehicleid;
		if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		{
			vehicleid = GetPlayerVehicleID(playerid);
		}
		else
		{
			vehicleid = GetClosestVehicle(playerid);
			if(!PlayerToVehicle(playerid, vehicleid, 3.5)) vehicleid = 0;
	 	}
	 	
	 	GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
		if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SCM(playerid, COLOR_LIGHTRED, "You need to be in a vehicle.");
		if(hotwiring[playerid] == 1) return SendClientMessage(playerid, COLOR_LIGHTRED, "You are already hotwiring.");
		if(toolkit[playerid] > 0)
		{
  			hotwire[playerid] = 60;//change it with the timer time
    		Timer2[playerid] = SetTimerEx("timer2", 1000, 1, "i", playerid);
		    PlayerActionMessage(playerid, 20.0, "begins to hotwire the vehicle.");
		    TogglePlayerControllable(playerid, 0);
		    SetVehicleParamsEx(vehicleid, engine, lights, 1, doors, bonnet, boot, objective);
		    hotwiring[playerid] = 1;
		}
    }
    else if(!strcmp(params, "trunkinfo", true, 9))
    {
		new vehicleid = GetClosestVehicle(playerid);
		GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
		if(!PlayerToVehicle(playerid, vehicleid, 7.0)) vehicleid = 0;
		if(!vehicleid || IsBicycle(vehicleid) || IsPlayerInAnyVehicle(playerid))
			return SendClientMessage(playerid, COLOR_LIGHTRED, "You are not close to a vehicle!");
		new id = GetVehicleID(vehicleid);
  		if(boot == 0) return SCM(playerid, COLOR_LIGHTRED, "The trunk is closed.");
		SetPVarInt(playerid, "DialogValue1", id);
		ShowDialog(playerid, DIALOG_TRUNK);
		return 1;
    }
    else if(!strcmp(params, "lights", true, 6))
    {
		new string[64];
		new vehicleid = GetPlayerVehicleID(playerid);

	    GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
	    if(GetPlayerState(playerid) == 2)
	    {
			if(lights != 1)
			{
				SetVehicleParamsEx(vehicleid, engine, 1, alarm, doors, bonnet, boot, 0);
		  		format(string, sizeof(string), "* %s turns the lights on.", GetName(playerid));
		  		ProxDetector(20.0, playerid, string, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
			}
			else if(lights != 0)
			{
				SetVehicleParamsEx(vehicleid, engine, 0, alarm, doors, bonnet, boot, 0);
				format(string, sizeof(string), "* %s turns the lights off.", GetName(playerid));
		  		ProxDetector(20.0, playerid, string, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
			}
		}
		return 1;
    }
    else if(!strcmp(params, "find", true, 4))
    {
		if(TrackCar[playerid])
	{
		TrackCar[playerid] = 0;
		DisablePlayerCheckpoint(playerid);
		SendClientMessage(playerid, COLOR_WHITE, "You are not tracking your vehicle anymore.");
		return 1;
	}
		new playername[24];
		GetPlayerName(playerid, playername, sizeof(playername));
		new info[256], bool:found;
		for(new i=1; i < MAX_DVEHICLES; i++)
		{
			if(VehicleCreated[i] == VEHICLE_PLAYER && strcmp(VehicleOwner[i], playername) == 0)
			{
				found = true;
				format(info, sizeof(info), "%sID: %d  Name: %s\n", info, i, VehicleNames[VehicleModel[i]-400]);
			}
		}
		if(!found) return SendClientMessage(playerid, COLOR_LIGHTRED, "You don't have any vehicles.");
		ShowPlayerDialog(playerid, DIALOG_FINDVEHICLE, DIALOG_STYLE_LIST, "Find Your Vehicle", info, "Find", "Cancel");
		return 1;
    }
    else if(!strcmp(params, "clearmods", true, 9))
    {
		if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendClientMessage(playerid, COLOR_LIGHTRED, "You are not driving a vehicle.");
		new vehicleid = GetPlayerVehicleID(playerid);
		new id = GetVehicleID(vehicleid);
		if(GetPlayerVehicleAccess(playerid, id) < 2)
			return SendClientMessage(playerid, COLOR_LIGHTRED, "This is not your vehicle.");
		for(new i=0; i < sizeof(VehicleMods[]); i++)
		{
			RemoveVehicleComponent(VehicleID[id], GetVehicleComponentInSlot(VehicleID[id], i));
			VehicleMods[id][i] = 0;
		}
		VehiclePaintjob[id] = 255;
		ChangeVehiclePaintjob(VehicleID[id], 255);
		SaveVehicle(id);
		SendClientMessage(playerid, COLOR_WHITE, "You have removed all modifications from your vehicle.");
	}
 	else if(!strcmp(params, "eject", true, 5))
    {
		if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendClientMessage(playerid, COLOR_LIGHTRED, "You are not driving a vehicle.");
		new pid, msg[128];
		if(sscanf(params, "s[128]u", params, pid)) return SendClientMessage(playerid, COLOR_GREY, "[Usage:] /v eject [player]");
		if(!IsPlayerConnected(pid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Invalid player.");
		new vehicleid = GetPlayerVehicleID(playerid);
		if(!IsPlayerInVehicle(pid, vehicleid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Player is not in your vehicle.");
		RemovePlayerFromVehicle(pid);
		format(msg, sizeof(msg), "%s (%d) has ejected you from the vehicle.", PlayerName(playerid), playerid);
		SendClientMessage(pid, COLOR_WHITE, msg);
		format(msg, sizeof(msg), "You have ejected %s (%d) from your vehicle.", PlayerName(pid), pid);
		SendClientMessage(playerid, COLOR_WHITE, msg);
	}
	else if(!strcmp(params, "givekeys", true, 8))
    {
		new pid, id, msg[128];
		if(sscanf(params, "s[128]ud", params, pid, id)) return SendClientMessage(playerid, COLOR_GREY, "[Usage:] /v givekeys [playerid/partofname] [vehicleid]");
		if(!IsPlayerConnected(pid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Invalid player.");
		if(!IsValidVehicle(id)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Invalid vehicleid.");
		if(GetPlayerVehicleAccess(playerid, id) < 2)
			return SendClientMessage(playerid, COLOR_LIGHTRED, "You are not the owner of this vehicle.");
		if(!PlayerToPlayer(playerid, pid, 10.0)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Player is too far away.");
		SetPVarInt(pid, "CarKeys", id);
		format(msg, sizeof(msg), "You have given your car keys to %s (%d).", PlayerName(pid), pid);
		SendClientMessage(playerid, COLOR_WHITE, msg);
		format(msg, sizeof(msg), "%s (%d) has given you his extra-pair of his vehicle keys.", PlayerName(playerid), playerid);
		SendClientMessage(pid, COLOR_WHITE, msg);
	}
	else if(!strcmp(params, "ejectall", true, 8))
 	{
		if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendClientMessage(playerid, COLOR_LIGHTRED, "You are not driving a vehicle.");
		new vehicleid = GetPlayerVehicleID(playerid);
		new msg[128];
		format(msg, sizeof(msg), "%s (%d) has ejected you.", PlayerName(playerid), playerid);
		for(new i=0; i < MAX_PLAYERS; i++)
		{
			if(IsPlayerConnected(i) && i != playerid && IsPlayerInVehicle(i, vehicleid))
			{
				RemovePlayerFromVehicle(i);
				SendClientMessage(i, COLOR_WHITE, msg);
			}
		}
		SendClientMessage(playerid, COLOR_WHITE, "You have ejected all passengers.");
	}
	else if(!strcmp(params, "list", true, 4))
 	{
		new playername[24];
		GetPlayerName(playerid, playername, sizeof(playername));
		new info[256], bool:found;
		for(new i=1; i < MAX_DVEHICLES; i++)
		{
			if(VehicleCreated[i] == VEHICLE_PLAYER && strcmp(VehicleOwner[i], playername) == 0)
			{
				found = true;
				format(info, sizeof(info), "%sID: %d  Name: %s\n", info, i, VehicleNames[VehicleModel[i]-400]);
			}
		}
		if(!found) return SendClientMessage(playerid, COLOR_LIGHTRED, "You don't have any vehicles.");
		ShowPlayerDialog(playerid, DIALOG_VEHICLELIST, DIALOG_STYLE_LIST, "Vehicle List", info, "OK", "Cancel");
		return 1;
    }
   	else if(!strcmp(params, "trunk", true, 5))
 	{
		new vehicleid;
		vehicleid = GetClosestVehicle(playerid);
		if(!PlayerToVehicle(playerid, vehicleid, 7.0)) vehicleid = 0;
		GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
		if(doors == 1) return SendClientMessage(playerid, COLOR_LIGHTRED, "This vehicle is locked.");
		if(boot == 1) boot = 0; else boot = 1;
		SetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
		return 1;
    }
   	else if(!strcmp(params, "enter", true, 5))
 	{
        new carid;
		carid = GetClosestVehicle(playerid);
		RVID[playerid] = carid;
		if(PlayerToVehicle(playerid, carid, 7.0))
		{
			GetVehicleParamsEx(carid, engine, lights, alarm, doors, bonnet, boot, objective);
			if(doors == 1) return SendClientMessage(playerid, COLOR_LIGHTRED, "This vehicle is locked.");
			if(GetVehicleModel(carid) == 508)
			{
			    SetPlayerPos(playerid, 1.9232, -3.2151, 999.5729);
			    SetPlayerInterior(playerid, 2);
			    SetPlayerVirtualWorld(playerid, RVID[playerid]);
			}
		}
		return 1;
    }
   	else if(!strcmp(params, "exit", true, 4))
 	{
		if(IsPlayerInRangeOfPoint(playerid, 5.0, 1.9232, -3.2151, 999.5729))
		{
		    SetPlayerInterior(playerid, 0);
		    SetPlayerVirtualWorld(playerid, 0);
      		new Float:vehx, Float:vehy, Float:vehz;
      		new arrvID = RVID[playerid];
          	GetVehiclePos(arrvID, vehx, vehy, vehz);
          	SetPlayerPos(playerid, vehx + 2, vehy, vehz + 2);
			return 1;
		}
    }
   	else if(!strcmp(params, "park", true, 4))
 	{
 		if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendClientMessage(playerid, COLOR_LIGHTRED, "You are not inside any vehicle.");
		new vehicleid = GetPlayerVehicleID(playerid);
		new id = GetVehicleID(vehicleid);
		if(GetPlayerVehicleAccess(playerid, id) < 1)
		return SendClientMessage(playerid, COLOR_LIGHTRED, "You don't have the keys for this vehicle.");

  		new Float:x, Float:y, Float:z;
		GetPlayerPos(playerid, x, y, z);

		GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
		SetVehicleParamsEx(vehicleid, 0, 0, 0, 0, 0, 0, 0);

		GetVehiclePos(VehicleID[id], VehiclePos[id][0], VehiclePos[id][1], VehiclePos[id][2]);
		GetVehicleZAngle(VehicleID[id], VehiclePos[id][3]);
		VehicleInterior[id] = GetPlayerInterior(playerid);
		VehicleWorld[id] = 100;
		SaveVehicle(id);
		
        SetPlayerPos(playerid, x, y, z+1);
	    foreach(new i : Player)
	    {
			if(IsPlayerInAnyVehicle(i) && GetPlayerVehicleID(i) == vehicleid)
			{
				if(GetPlayerVehicleSeat(i) != 0 && GetPlayerVehicleSeat(i) != 128)
				{
					RemovePlayerFromVehicle(i);
					GetPlayerPos(i, x, y, z);
					SetPlayerPos(i, x, y, z+1);
				}
			}
		}

		SetVehicleVirtualWorld(VehicleID[id], 100);
		SetVehiclePos(VehicleID[id], 154.8577, 213.5532, -0.4741);
		UpdateVehicle(id, 0);

		SendClientMessage(playerid, COLOR_WHITE, "You have parked your vehicle at this position.");
		return 1;
    }
   	else if(!strcmp(params, "get", true, 3))
 	{
 		new vehicleid;
		if(sscanf(params, "s[128]d", params, vehicleid)) return SendClientMessage(playerid, COLOR_GREY, "[Usage:] /v get [ID]. Check /v list for your vehicle ID.");
		if(!IsValidVehicle(vehicleid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Invalid vehicleid.");
		if(GetPlayerVehicleAccess(playerid, vehicleid) < 1)
		return SendClientMessage(playerid, COLOR_LIGHTRED, "You don't own that vehicle. /v list for your vehicle ID's.");
		if(VehicleWorld[vehicleid] == 100)
		{
			SetVehicleVirtualWorld(VehicleID[vehicleid], 0);
			VehicleWorld[vehicleid] = 0;
			SetVehiclePos(VehicleID[vehicleid], VehiclePos[vehicleid][0], VehiclePos[vehicleid][1], VehiclePos[vehicleid][2]);
			SetVehicleZAngle(VehicleID[vehicleid], VehiclePos[vehicleid][3]);
			
   			GetVehicleParamsEx(VehicleID[vehicleid], engine, lights, alarm, doors, bonnet, boot, objective);
			SetVehicleParamsEx(VehicleID[vehicleid], 0, 0, 0, 0, 0, 0, 0);

	        getcp[playerid] = 1;
			SendClientMessage(playerid, COLOR_WHITE, "You have successfully spawned your vehicle.");
			SetPlayerCheckpoint(playerid, VehiclePos[vehicleid][0], VehiclePos[vehicleid][1], VehiclePos[vehicleid][2], 5.0);
			return 1;
		} else return SCM(playerid, COLOR_LIGHTRED, "That vehicle is already spawned.");
    }
   	else if(!strcmp(params, "buy", true, 3))
 	{
 	    if(!IsPlayerInRangeOfPoint(playerid, 5.0, 331.8448, 1288.8008, 452.9749)) return SCM(playerid, COLOR_LIGHTRED, "You need to be inside the dealership.");
 	    new info[3000];
		strcat(info, "BMX "COL_GREEN"($1000)\nBike "COL_GREEN"($1000)\nFaggio "COL_GREEN"($1500)", sizeof(info));
		strcat(info, "\nSadler "COL_GREEN"($3000)\nDinghy "COL_GREEN"($3000)\nFreeway "COL_GREEN"($3500)", sizeof(info));
		strcat(info, "\nRumpo "COL_GREEN"($3700)\nPicador "COL_GREEN"($4000)\nVirgo "COL_GREEN"($4200)", sizeof(info));
		strcat(info, "\nManana "COL_GREEN"($4200)\nNebula "COL_GREEN"($4300)\nMoonbeam "COL_GREEN"($4300)", sizeof(info));
		strcat(info, "\nWayfarer "COL_GREEN"($4300)\nOceanic "COL_GREEN"($4600)\nPrimo "COL_GREEN"($5000)", sizeof(info));
		strcat(info, "\nBravura "COL_GREEN"($5000)\nTampa "COL_GREEN"($5000)\nPrevion "COL_GREEN"($5000)", sizeof(info));
		strcat(info, "\nMajestic "COL_GREEN"($5200)\nClub "COL_GREEN"($5500)\nBuccanner "COL_GREEN"($5500)", sizeof(info));
		strcat(info, "\nCadrona "COL_GREEN"($5600)\nMerit "COL_GREEN"($5800)\nStallion "COL_GREEN"($6000)", sizeof(info));
		strcat(info, "\nAdmiral "COL_GREEN"($6200)\nWalton "COL_GREEN"($3000)\nGreenwood "COL_GREEN"($6800)", sizeof(info));
		strcat(info, "\nBobcat "COL_GREEN"($7000)\nWillard "COL_GREEN"($7100)\nSentinel "COL_GREEN"($7500)", sizeof(info));
		strcat(info, "\nGlendale "COL_GREEN"($7100)\nIntruder "COL_GREEN"($7100)\nVincent "COL_GREEN"($7100)", sizeof(info));
		strcat(info, "\nHermes "COL_GREEN"($7200)\nFortune "COL_GREEN"($7300)\nMesa "COL_GREEN"($7300)", sizeof(info));
		strcat(info, "\nCamper "COL_GREEN"($7200)\nHustler "COL_GREEN"($7400)\nEsperanto "COL_GREEN"($7400)", sizeof(info));
		strcat(info, "\nStratum "COL_GREEN"($7500)\nWashington "COL_GREEN"($7800)\nSolair "COL_GREEN"($7800)", sizeof(info));
		strcat(info, "\nSunrise "COL_GREEN"($7900)\nTornado "COL_GREEN"($7900)\nVoodoo "COL_GREEN"($8000)", sizeof(info));
		strcat(info, "\nCabbie "COL_GREEN"($8000)\nFeltzer "COL_GREEN"($8200)\nRemington "COL_GREEN"($8300)", sizeof(info));
		strcat(info, "\nEmperor "COL_GREEN"($8400)\nElegant "COL_GREEN"($8400)\nYosemite "COL_GREEN"($8500)", sizeof(info));
		strcat(info, "\nSavanna "COL_GREEN"($9000)\nBlade "COL_GREEN"($9100)\nRanger "COL_GREEN"($9200)", sizeof(info));
		strcat(info, "\nBroadway "COL_GREEN"($9500)\nRegina "COL_GREEN"($9600)\nRancher "COL_GREEN"($9700)", sizeof(info));
		strcat(info, "\nSabre "COL_GREEN"($10000)\nClover "COL_GREEN"($10000)\nPony "COL_GREEN"($10000)", sizeof(info));
		strcat(info, "\nBlista Compact "COL_GREEN"($10000)\nSlamvan "COL_GREEN"($10000)\nJourney "COL_GREEN"($10000)", sizeof(info));
		strcat(info, "\nPremier "COL_GREEN"($10500)\nPerennial "COL_GREEN"($11000)\nElegy "COL_GREEN"($14000)", sizeof(info));
		strcat(info, "\nStafford "COL_GREEN"($14500)\nBurrito "COL_GREEN"($15000)\nTahoma "COL_GREEN"($15000)", sizeof(info));
		strcat(info, "\nEuro "COL_GREEN"($15500)\nJester "COL_GREEN"($16500)\nHuntley "COL_GREEN"($17000)", sizeof(info));
		strcat(info, "\nLandstalker "COL_GREEN"($17000)\nReefer "COL_GREEN"($18000)\nBuffalo "COL_GREEN"($19000)", sizeof(info));
		strcat(info, "\nUranus "COL_GREEN"($19500)\nComet "COL_GREEN"($20000)\nAlpha "COL_GREEN"($20500)", sizeof(info));
		strcat(info, "\nFlash "COL_GREEN"($21000)\nWindsor "COL_GREEN"($26000)\nMarquis "COL_GREEN"($30000)", sizeof(info));
		strcat(info, "\nSultan "COL_GREEN"($32000)\nStretch "COL_GREEN"($35000)", sizeof(info));
		strcat(info, "\nTropic "COL_GREEN"($38000)\nPhoenix "COL_GREEN"($42000)\nCheetah "COL_GREEN"($46000)", sizeof(info));
		strcat(info, "\nMaverick "COL_GREEN"($65000)\nSanchez "COL_GREEN"($7000)\nZR-350 "COL_GREEN"($37000)\nFCR-900 "COL_GREEN"($15000)\nBullet "COL_GREEN"($44000)\nBanshee "COL_GREEN"($44000)\nMountain Bike"COL_GREEN"($1500)\nQuad"COL_GREEN"($7000)\nHotknife"COL_GREEN"($7400)", sizeof(info));
 	    ShowPlayerDialog(playerid, DIALOG_BUYCAR, DIALOG_STYLE_LIST, "Vehicles", info, "Purchase", "Cancel");
    	return 1;
    }
   	else if(!strcmp(params, "register", true, 8))
 	{
 	    if(!IsPlayerInRangeOfPoint(playerid, 20.0, 2127.4885, -1136.8491, 25.4748)) return SCM(playerid, COLOR_LIGHTRED, "You need to be near the dealership.");
 	    if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		{
			new vehicleid;
			if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
			{
				vehicleid = GetPlayerVehicleID(playerid);
			}
			new id = GetVehicleID(vehicleid);

			new
			plate = 11111 + random(99999);
			new string[128], string2[128];

			format(string, sizeof(string), "SJ-%d", plate);
			format(string2, sizeof(string2), "%d", plate);
			SetVehicleNumberPlate(vehicleid, string);
			strmid(VehicleNumberPlate[id], string2, 0, sizeof(VehicleNumberPlate[]));
			SaveVehicle(id);
			
			if(PlayerInfo[playerid][pPlate1] == 0)
			{
				
				PlayerInfo[playerid][pPlate1] = plate;
				new INI:File = INI_Open(UserPath(playerid));
				INI_SetTag(File, "data");
				INI_WriteInt(File, "Plate1", PlayerInfo[playerid][pPlate1]);
				INI_Close(File);

				SCM(playerid, -1, "HINT: You have to /v park your vehicle one time for your number plate to show.");
				return 1;
			}
			else if(PlayerInfo[playerid][pPlate2] == 0)
			{
				
				PlayerInfo[playerid][pPlate2] = plate;
				
				new INI:File = INI_Open(UserPath(playerid));
				INI_SetTag(File, "data");
				INI_WriteInt(File, "Plate2", PlayerInfo[playerid][pPlate2]);
				INI_Close(File);

				SCM(playerid, -1, "HINT: You have to /v park your vehicle one time for your number plate to show.");
				return 1;
			}
			else if(PlayerInfo[playerid][pPlate3] == 0)
			{
				
				PlayerInfo[playerid][pPlate3] = plate;
				new INI:File = INI_Open(UserPath(playerid));
				INI_SetTag(File, "data");
				INI_WriteInt(File, "Plate3", PlayerInfo[playerid][pPlate3]);
				INI_Close(File);

				SCM(playerid, -1, "HINT: You have to /v park your vehicle one time for your number plate to show.");
				return 1;
			}
		}
		else return SCM(playerid, COLOR_LIGHTRED, "You need to be in a vehicle.");
    }
   	else if(!strcmp(params, "sell", true, 4))
 	{
		new pid, price, msg[128];
		if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendClientMessage(playerid, COLOR_LIGHTRED, "You are not driving a vehicle.");
		new vehicleid = GetPlayerVehicleID(playerid);
		new id = GetVehicleID(vehicleid);
		if(sscanf(params, "s[128]ud", params, pid, id, price)) return SendClientMessage(playerid, COLOR_GREY, "[Usage:] /v sell [playerid/partofname] [price]");
		if(!IsPlayerConnected(pid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Invalid player.");
		if(GetPlayerVehicleAccess(playerid, id) < 1)
		return SendClientMessage(playerid, COLOR_LIGHTRED, "You don't have the keys for this vehicle.");

		if(price < 1) return SendClientMessage(playerid, COLOR_LIGHTRED, "Invalid price.");
		if(!PlayerToPlayer(playerid, pid, 10.0)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Player is too far away.");
		SetPVarInt(pid, "DialogValue1", playerid);
		SetPVarInt(pid, "DialogValue2", price);
		ShowDialog(pid, DIALOG_VEHICLE_SELL);
		format(msg, sizeof(msg), "You have offered %s (%d) to buy your vehicle for $%d.", PlayerName(pid), pid, price);
		SendClientMessage(playerid, COLOR_WHITE, msg);

		if(!strcmp(VehicleNumberPlate[id], PlayerInfo[playerid][pPlate1], false))
		{
			PlayerInfo[playerid][pPlate1] = 0;
			new INI:File = INI_Open(UserPath(playerid));
			INI_SetTag(File, "data");
			INI_WriteInt(File, "Plate1", PlayerInfo[playerid][pPlate1]);
			INI_Close(File);
		}
		else if(!strcmp(VehicleNumberPlate[id], PlayerInfo[playerid][pPlate2], false))
		{
			PlayerInfo[playerid][pPlate2] = 0;
			new INI:File = INI_Open(UserPath(playerid));
			INI_SetTag(File, "data");
			INI_WriteInt(File, "Plate2", PlayerInfo[playerid][pPlate2]);
			INI_Close(File);
		}
		else if(!strcmp(VehicleNumberPlate[id], PlayerInfo[playerid][pPlate3], false))
		{
			PlayerInfo[playerid][pPlate3] = 0;
			new INI:File = INI_Open(UserPath(playerid));
			INI_SetTag(File, "data");
			INI_WriteInt(File, "Plate3", PlayerInfo[playerid][pPlate3]);
			INI_Close(File);
		}

		new
		plate = 11111 + random(99999);
		new string[128];

		format(string, sizeof(string), "SJ-%d", plate);
		SetVehicleNumberPlate(vehicleid, string);
		strmid(VehicleNumberPlate[id], string, 0, sizeof(VehicleNumberPlate[]));
		SaveVehicle(id);

		if(PlayerInfo[pid][pPlate1] == 0)
		{
			PlayerInfo[pid][pPlate1] = plate;
			new INI:File = INI_Open(UserPath(pid));
			INI_SetTag(File, "data");
			INI_WriteInt(File, "Plate1", PlayerInfo[pid][pPlate1]);
			INI_Close(File);
		}
		else if(PlayerInfo[pid][pPlate2] == 0)
		{
			PlayerInfo[pid][pPlate2] = plate;
			new INI:File = INI_Open(UserPath(pid));
			INI_SetTag(File, "data");
			INI_WriteInt(File, "Plate2", PlayerInfo[pid][pPlate2]);
			INI_Close(File);
		}
		else if(PlayerInfo[pid][pPlate3] == 0)
		{
			PlayerInfo[pid][pPlate3] = plate;
			new INI:File = INI_Open(UserPath(pid));
			INI_SetTag(File, "data");
			INI_WriteInt(File, "Plate3", PlayerInfo[pid][pPlate3]);
			INI_Close(File);
		}
	}
	return 1;
}

*/

CMD:hood(playerid, params[])
{
	new closestcar = GetClosestCar(playerid, INVALID_VEHICLE_ID);
	if(isnull(params)) return SendClientMessage(playerid, COLOR_LIGHTRED, "[Usage:] /hood [buka/tutup]");
    if(!strcmp(params, "buka", true))
    {
			ToggleHood(closestcar, VEHICLE_PARAMS_ON);
    }
    if(!strcmp(params, "tutup", true))
    {
			ToggleHood(closestcar, VEHICLE_PARAMS_OFF);
    }

    
    return 1;
}

new DutyMechanic[MAX_PLAYERS];


CMD:jobduty(playerid)
{
	//pInfo[playerid][pJobMechanic] = 1;
	if(pInfo[playerid][pJobMechanic] == 1)
	{
		if(DutyMechanic[playerid] == 0)
		{
			SetPlayerColor(playerid, COLOR_LGREEN);
			SendClientMessage(playerid, -1, "* Anda on duty sebagai mechanic");
			DutyMechanic[playerid] = 1;
			new ObjKunciInggris = SetPlayerAttachedObject(playerid, 0, 19627, 6, 0.079376, 0.037070, 0.007706, 181.482910, 0.000000, 0.000000, 1.000000, 1.000000, 1.000000);
 			SetPlayerSkin(playerid, 122);
 			GameTextForPlayer(playerid, "Anda Mekanik", 5000, 1);
		}
		else if(DutyMechanic[playerid] == 1)
		{
			DutyMechanic[playerid] = 0;
			SendClientMessage(playerid, -1, "* Anda off duty sebagai mechanic");
			SetPlayerColor(playerid, COLOR_WHITE);
			RemovePlayerAttachedObject(playerid, 0);
			SetPlayerSkin(playerid, pInfo[playerid][pSkin]);
			GameTextForPlayer(playerid, "Off duty Mekanik", 5000, 1);
		}
	}
	if(pInfo[playerid][pJobMechanic] == 0)
	{
		GameTextForPlayer(playerid, "Anda harus join mechanic terlebih dulu", 5000, 3);
	}

	return 1;
}

CMD:joinjob(playerid, params[])
{
	
	if(isnull(params)) return SendClientMessage(playerid, COLOR_LIGHTRED, "[Usage:] /joinjob [mechanic/turis/polisi]");
    if(!strcmp(params, "mechanic", true))
    {
    	if(IsPlayerInRangeOfPoint(playerid, Float:4.0, 2141.9475,-1728.9771,13.5592))
    	{
    		if(pInfo[playerid][pJobMechanic] == 1)
			{
				GameTextForPlayer(playerid, "Anda sudah mendaftar mechanic sebelumnya", 5000, 5);
			}
	       	else
	       	{
	       		pInfo[playerid][pJobMechanic] = 1;
				SendClientMessage(playerid, -1, "* Anda join sebagai mechanic");

				new Query[500];
		        format(Query, 500, "UPDATE `playerdata` SET `JobMechanic` = '%i' WHERE `id` = '%d' LIMIT 1",
		        pInfo[playerid][pJobMechanic],
		        pInfo[playerid][ID]);

		        mysql_query(MySQL:g_Sql,Query, bool:true);

		        GameTextForPlayer(playerid, "Selamat Bekerja Sebagai Mechanic", 5000, 1);
	       	}
    	}
       	

    }
    
    return 1;

}

CMD:quitjob(playerid, params[])
{
	
	if(isnull(params)) return SendClientMessage(playerid, COLOR_LIGHTRED, "[Usage:] /joinjob [mechanic/turis/polisi]");
    if(!strcmp(params, "mechanic", true))
    {
    	if(IsPlayerInRangeOfPoint(playerid, Float:4.0, 2141.9475,-1728.9771,13.5592))
    	{
    		if(pInfo[playerid][pJobMechanic] == 1)
			{
				GameTextForPlayer(playerid, "Anda kini sudah bukan staff mechanic lagi", 5000, 6);
				pInfo[playerid][pJobMechanic] = 0;

				new Query[500];
		        format(Query, 500, "UPDATE `playerdata` SET `JobMechanic` = '%i' WHERE `id` = '%d' LIMIT 1",
		        pInfo[playerid][pJobMechanic],
		        pInfo[playerid][ID]);

		        mysql_query(MySQL:g_Sql,Query, bool:true);

			}
	       	
    	}
    	else
    	{
    		GameTextForPlayer(playerid, "~r~Anda perlu menghadap manager untuk keluar dari job mechanic", 3000, 1);
    	}
       	

    }
    
    return 1;

}


CMD:setvehhealth(playerid, params[])
{
    extract params -> new Float:health;
    new vehicleid = GetClosestCar(playerid, INVALID_VEHICLE_ID);
    SetVehicleHealth(vehicleid, Float:health);
    if(IsPlayerInAnyVehicle(playerid))
    {
        
        SendClientMessage(playerid, -1, "Kesehatan mesin di rubah");
    }
    else return GameTextForPlayer(playerid, "Anda memperbaiki dari luar mobil", 5000, 4);
}

CMD:sethealth(playerid, params[])
{
    if(isnull(params)) return SendClientMessage(playerid, COLOR_LIGHTRED, "[Usage:] /sethealth [jumlahnya misalnya 50]");
    extract params -> new Float:health;
    SetPlayerHealth(playerid, Float:health);

}


CMD:fishingrod(playerid, params[])
{
	//if(PlayerInfo[playerid][pFishingRod] < 1) return SCM(playerid, COLOR_LIGHTRED, "You do not have a fishing rod.");
	
	if(FishingEquipped[playerid] == 0)
	{
 		RodObject = SetPlayerAttachedObject(playerid, 0, 18632, 6, 0.079376, 0.037070, 0.007706, 181.482910, 0.000000, 0.000000, 1.000000, 1.000000, 1.000000);
 		
 		FishingEquipped[playerid] = 1;
 		ApplyAnimation(playerid, "COP_AMBIENT", "COPBROWSE_OUT",1.0,0,0,0,0,0);
 		new string[140];
		format(string, sizeof(string), "* %s mengambil alat pancing dari kapal dan memakainya.", GetRPName(playerid));
		LocalMessage(ACTION_DISTANCE, playerid, ACTION_COLOR, string);
	}
	else if(FishingEquipped[playerid] == 1)
	{
		
		RemovePlayerAttachedObject(playerid, 0);
		RemovePlayerAttachedObject(playerid, RodObject);
		FishingEquipped[playerid] = 0;
		ApplyAnimation(playerid, "GANGS", "Invite_Yes",1.0,0,0,0,0,0);
		new string[140];
		format(string, sizeof(string), "* %s menyimpan kembali alat pancing dan merapikanya dengan cara di lipat satu-persatu.", GetRPName(playerid));
		LocalMessage(ACTION_DISTANCE, playerid, ACTION_COLOR, string);
	}
	return 1;
}

CMD:attachworm(playerid, params[])
{
	pInfo[playerid][pFishingRod]=500;
	pInfo[playerid][pWorms]= 500;
	if(pInfo[playerid][pFishingRod] < 1) return SendClientMessage(playerid, COLOR_LIGHTRED, "You need to have a fishing rod.");
	if(attachingw[playerid] == 1) return SendClientMessage(playerid, COLOR_LIGHTRED, "You're already attaching a worm to your hook.");
	if(pInfo[playerid][pWorms] < 1) return SendClientMessage(playerid, COLOR_LIGHTRED, "You need to have a worm.");
	if(FishingEquipped[playerid] == 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "You need to have your fishing rod equipped.");
	if(WormAttached[playerid] == 2) return SendClientMessage(playerid, COLOR_LIGHTRED, "You have already attached a worm to your hook.");
	if(Fishing[playerid] == true) return SendClientMessage(playerid, COLOR_LIGHTRED, "You are already fishing. Attach a worm when you're done fishing.");
	
	new string[140];
	format(string, sizeof(string), "* %s begins to fiddle with the fishing hook.", GetRPName(playerid));
	LocalMessage(ACTION_DISTANCE, playerid, ACTION_COLOR, string);
	AttachWorm[playerid] = 5; //change it with the timer time
	TimerAttachWorm[playerid] = SetTimerEx("timerAttachWorm", 500, 1, "i", playerid);
	TogglePlayerControllable(playerid, 0);
	pInfo[playerid][pWorms] -= 1;
	attachingw[playerid] = 1;
	WormAttached[playerid] = 2;
  	return 1;
}


CMD:fish(playerid, params[])
{
	if(IsPlayerInRangeOfPoint(playerid, 100.0, 1062.4270,-2567.9729,-0.5079)) // lokasi mancing
	{
	        if(WormAttached[playerid] < 1) return SendClientMessage(playerid, COLOR_LIGHTRED, "You need to have a bait worm attached to the fishing rod to fish.");
	        if(FishingEquipped[playerid] == 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "You need to have your fishing rod equipped.");
	        if(Fishing[playerid] == true) return SendClientMessage(playerid, COLOR_LIGHTRED, "You are already fishing.");
	        
  			new string[140];
			format(string, sizeof(string), "* %s begins to fish with his fishing rod.", GetRPName(playerid));
			LocalMessage(ACTION_DISTANCE, playerid, ACTION_COLOR, string);
  			fish[playerid] = 2; //change it with the timer time

  			
  			new Float:BBCoord[4];
		    GetPlayerPos(playerid, BBCoord[0], BBCoord[1], BBCoord[2]);
		    GetPlayerFacingAngle(playerid, BBCoord[3]);

			
			EfekPancingan[playerid] = SpawnObject_InfrontOfPlayer(playerid, 18717+2);
			//CreateDynamicObject(18717+2, BBCoord[0]+3, BBCoord[1], BBCoord[2]-2.4, 0.0, 0.0, 0.0, 0,  0);
			

    		TimerFish[playerid] = SetTimerEx("timerFish", 1000, 1, "i", playerid);
		    TogglePlayerControllable(playerid, 0);
		    WormAttached[playerid] = 0;
	    	ApplyAnimation(playerid, "ped", "ARRESTgun", 4.0, 0, 1, 1, 1, -1, 1);
	    	Fishing[playerid] = true;
	    	
	    	if(pInfo[playerid][pFishes] > 5)
	    	{
	    		SendClientMessage(playerid, COLOR_LGREEN, "Anda dapat menjual ikan sekarang dengan /sellfish");
	    		cmd_fishingrod(playerid);
	    	}
	}
	else return SendClientMessage(playerid, COLOR_RED, "You can't fish here.");
  	return 1;
}


CMD:sellfish(playerid, params[])
{
	//if(IsPlayerInRangeOfPoint(playerid, 7.0, 388.1848, -2088.7964, 7.8359) || IsPlayerInRangeOfPoint(playerid, 7.0, 388.1848, -2088.7964, 7.8359))
	//{
	//SendClientMessage(playerid, color, const message[])
	    if(pInfo[playerid][pFishes] < 1) return SendClientMessage(playerid, COLOR_LIGHTRED, "You do not have any fishes.");
	    new string[64];
		new sellfishamount = (pInfo[playerid][pFishes])*200;
		GivePlayerMoney(playerid, sellfishamount);
		format(string, sizeof(string), "You have sold all of your fishes for: $%d.", sellfishamount);
		SendClientMessage(playerid, COLOR_WHITE, string);
		GameTextForPlayer(playerid, string, 3000, 5);
		pInfo[playerid][pFishes] = 0;
	//}
  	return 1;
}


CMD:tow(playerid, params[])
{
	new carid = GetPlayerVehicleID(playerid);
	new closestcar = GetClosestCar(playerid, carid);
	//AttachTrailerToVehicle(trailerid, vehicleid)
	AttachTrailerToVehicle(closestcar,carid);
}

forward kembalikansepeda(playerid);
public kembalikansepeda(playerid)
{
	DestroyVehicle(sepedasewaan[playerid]);

}






CMD:rentalsepeda(playerid)
{	
	if(!IsPlayerInRangeOfPoint(playerid, Float:3.0, Float:1585.7803, Float:-2202.4443, Float:13.5469))
	{
		SendClientMessage(playerid, COLOR_YELLOW, "* Anda tidak bertemu pegawai usaha rental sepeda.");
	}
	else if(IsPlayerInRangeOfPoint(playerid, Float:3.0, Float:1585.7803, Float:-2202.4443, Float:13.5469))
	{
		if(IsValidVehicle(sepedasewaan[playerid]))
		{
			SendClientMessage(playerid, COLOR_YELLOW, "* Anda di batasi sewa sepeda hanya bisa satu saja.");
			DestroyVehicle(sepedasewaan[playerid]);
			sewaan = random(50); // tarif sewa kendaraan
			pInfo[playerid][pMoney] = pInfo[playerid][pMoney]-sewaan;
			ResetPlayerMoney(playerid);
			GivePlayerMoney(playerid, pInfo[playerid][pMoney]);
			SavePlayer(playerid);

			new infomakan[200];
			format(infomakan, sizeof(infomakan), ""COL_LIGHTBLUE"Layanan Rental"COL_RED": Anda bayar biaya perawatan sepeda %i.", sewaan);
			SendClientMessage(playerid,0xFF0000FF, infomakan);
		}
		else if(pInfo[playerid][pMoney] < 50)
		{
			SendClientMessage(playerid, COLOR_GREEN, "* Anda di usir oleh pegawai rental sepeda karena tidak bayar.");
		}
		else if(!IsPlayerInAnyVehicle(playerid))
		{
			sepedasewaan[playerid] = CreateVehicle(510, 1585.7803,-2202.4443,13.5469,139.5556, 1, 1, -1, 1);
			//CreateDynamic3DTextLabel(const text[], color, Float:x, Float:y, Float:z, Float:drawdistance, attachedplayer = INVALID_PLAYER_ID, attachedvehicle = INVALID_VEHICLE_ID, testlos = 0, worldid = -1, interiorid = -1, playerid = -1, Float:streamdistance = STREAMER_3D_TEXT_LABEL_SD, STREAMER_TAG_AREA areaid = STREAMER_TAG_AREA -1, priority = 0)
			CreateDynamic3DTextLabel("**Sepeda Sewaan Anda**", COLOR_ME, 0.0, 0.6,0.35, Float:15.0, INVALID_PLAYER_ID, sepedasewaan[playerid],  0, 0, 0, playerid, Float:20.0, -1,0);
			new waktusewa;
			KillTimer(waktusewa);
			waktusewa = SetTimer("kembalikansepeda", 900000000, 0);
			SendClientMessage(playerid, COLOR_GREEN, "* Anda sedang di bisnis rental sepeda di beri waktu 15 menit untuk kembalikan.");
			ToggleVehicleEngine(sepedasewaan[playerid]); // langsung jalankan sepeda

			sewaan = random(50);
			pInfo[playerid][pMoney] = pInfo[playerid][pMoney]-sewaan;
			ResetPlayerMoney(playerid);
			GivePlayerMoney(playerid, pInfo[playerid][pMoney]);
			SavePlayer(playerid);

			new infomakan[200];
			format(infomakan, sizeof(infomakan), ""COL_LIGHTBLUE"Rental"COL_LRED2": Anda sewa sepeda dengan biaya $%i.", sewaan); // bayar sewa
			SendClientMessage(playerid,0xFF0000FF, infomakan);

			cmd_makan(playerid);
		}


	}
	

	//return 1;
}





CMD:tradingsaham(playerid, params[])
{
	if(IsPlayerInRangeOfPoint(playerid, Float:4.0, -44.3967,174.4426,999.0569))
	{
		new profiftrading = random(1000)+random(2000)-random(1000);
		if(profiftrading > 3000)
		{
			new infosaham[200];
			format(infosaham, sizeof(infosaham), "* Anda dapat profit terjual sangat besar hingga $%i dan pemerintah memberikan reward sebesar $2999", profiftrading);
			SendClientMessage(playerid, COLOR_GREEN, infosaham);
			pInfo[playerid][pMoney] = pInfo[playerid][pMoney]+2999;
			cmd_makan(playerid);
		}
		pInfo[playerid][pMoney] = pInfo[playerid][pMoney]+profiftrading;
		GivePlayerMoney(playerid, profiftrading);
		
		new infosaham[200];
		format(infosaham, sizeof(infosaham), "* Anda dapat profit sebesar $%i", profiftrading);
		SendClientMessage(playerid, COLOR_LGREEN, infosaham);
		GameTextForPlayer(playerid, infosaham, 2000, 1);
		//TextDrawSetString(UI[0], infosaham);

		ApplyAnimation(playerid, "MISC", "SEAT_LR", 4.0,0,0,0,0,0,0);
		new infosaham2[200];
		format(infosaham2, sizeof(infosaham2),""COL_WHITE"KOMPUTER PRIBADI\nTulis /tradingsaham \n"COL_GREEN" Untuk mulai trading\n\n"COL_WHITE"Anda telah mendapatkan $ %i keuntungan\n"COL_LRED"silahkan kembali deposit", profiftrading);
		Update3DTextLabelText( Text3D:HasilTrading, COLOR_WHITE, infosaham2);
		if(profiftrading > 3000)
		{

		}
	}
	else
	{
		SendClientMessage(playerid, COLOR_ERROR, "* Anda harus login di akun saham");
	}

	return 1;
}



CMD:untow(playerid, params[])
{
	//DetachTrailerFromVehicle(vehicleid)
	DetachTrailerFromVehicle(GetPlayerVehicleID(playerid));
}


CMD:objekkendaraan(playerid, params[])
{
	
	//SetPlayerArmour(playerid, Float:70.1);
	//pakaiarmour[playerid] = 1; // kondisi sedang pakai armour
	//SetPlayerAttachedObject(playerid, 3, 19515, 1 , 0.096999,0.058999,0.012999,4.199995,0.999981,8.800023,1.000000,1.221000,0.797000, 0xFFFFA500, 0xFFFFA500);
	//EditAttachedObject(playerid, 3);


	
	//contohdikendaraan = CreateDynamicObject(18649, 0,0,0,0,0,0);
	//CreateDynamicObject(modelid, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz, worldid = -1, interiorid = -1, playerid = -1, Float:streamdistance = STREAMER_OBJECT_SD, Float:drawdistance = STREAMER_OBJECT_DD, STREAMER_TAG_AREA areaid = STREAMER_TAG_AREA -1, priority = 0)
	//CreateDynamicObject(modelid, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz, worldid = -1, interiorid = -1, playerid = -1, Float:streamdistance = STREAMER_OBJECT_SD, Float:drawdistance = STREAMER_OBJECT_DD, STREAMER_TAG_AREA areaid = STREAMER_TAG_AREA -1, priority = 0)
	contohdikendaraan = CreateDynamicObject(18649, Float:0.0, Float:0.0, Float:0.0, Float:0.0, Float:0.0, Float:0.0, 0, 0, -1, Float:20.0,Float:20.0, -1, 0);
	SendClientMessage(playerid, COLOR_GREEN, "Anda pasang neon hijau.");
	//SetDynamicObjectMaterialText(tmpobjid, 0, "Pesawat Putu", 140, "Arial", 70, 1, 0xFFFFFFFF, 0x00000000, 1);
	
	//SetDynamicObjectMaterialText(STREAMER_TAG_OBJECT contohdikendaraan, 0, "Solusi", 140, "Arial", 70, 1,  0xFFFFFFFF, 0, 1);

	//AttachObjectToVehicle(objectid, vehicleid, Float:OffsetX, Float:OffsetY, Float:OffsetZ, Float:RotX, Float:RotY, Float:RotZ)
	pInfo[playerid][pNeon] = AttachDynamicObjectToVehicle( contohdikendaraan,
	 GetPlayerVehicleID(playerid),
	  Float:0.0, // kanan kiri
	   Float:-2.0, // kedepan
	    Float:0.0, // ke atas
	     Float:2.0, Float:0.0, Float:0.0);
	//AttachDynamicObjectToVehicle(STREAMER_TAG_OBJECT objectid, vehicleid, Float:offsetx, Float:offsety, Float:offsetz, Float:rx, Float:ry, Float:rz)
	//EditPlayerObject(playerid, objectid);
	//RemovePlayerFromVehicle(playerid);
	//EditAttachedObject(playerid, idterttach);
	//EditObject(playerid, contohdikendaraan);
	//contohdikendaraan = false;
	Streamer_Update(playerid);
	EditDynamicObject(playerid, contohdikendaraan);
	//EditDynamicObject(playerid, pInfo[playerid][pNeon]);
	//EditAttachedObject(playerid, contohdikendaraan);
	return 1;
}


CMD:editpintugarasi(playerid, params)
{
	
	Streamer_Update(playerid);
	EditDynamicObject(playerid, PintuGarasiMechanic);
}

CMD:editneon(playerid, params)
{
	
	Streamer_Update(playerid);
	EditDynamicObject(playerid, contohdikendaraan);
}

CMD:gspawn(playerid, params)
{
	GetPlayerPos(playerid, pInfo[playerid][pPx], pInfo[playerid][pPy], pInfo[playerid][pPz]);

	
	//mysql_query(MySQL:handle, const query[], bool:use_cache = true)
	mysql_query(MySQL:g_Sql, "SELECT * FROM `playerdata` ORDER BY `playerdata`.`id` ASC", bool:true);

    new Query[500];
    format(Query, 500, "UPDATE `playerdata` SET `ppx` = '%f',`ppy` = '%f',`ppz` = '%f' WHERE `id` = '%d' LIMIT 1",
    pInfo[playerid][pPx], pInfo[playerid][pPy], pInfo[playerid][pPz],
    pInfo[playerid][ID]);
    mysql_query(MySQL:g_Sql, Query, bool:true);
    

    new lokasidisimpan[500];
    format(lokasidisimpan, 500, "Disimpan pada posisi %f, %f, %f", pInfo[playerid][pPx], pInfo[playerid][pPy], pInfo[playerid][pPz] );
    SendClientMessage(playerid, -1, lokasidisimpan);
    SavePlayer(playerid);

    pInfo[playerid][pWord] = GetPlayerVirtualWorld(playerid);
    new simpanpword[200];
    format(simpanpword, 200, "UPDATE `playerdata` SET `pword` = '%i' WHERE `id` = '%d' LIMIT 1",pInfo[playerid][pWord],pInfo[playerid][ID]);
    mysql_query(MySQL:g_Sql, simpanpword, bool:true);

    pInfo[playerid][pInterior] = GetPlayerInterior(playerid);
    new simpanpinterior[200];
    format(simpanpinterior, 200, "UPDATE `playerdata` SET `pinterior` = '%i' WHERE `id` = '%d' LIMIT 1",pInfo[playerid][pInterior],pInfo[playerid][ID]);
    mysql_query(MySQL:g_Sql, simpanpinterior, bool:true);

    printf("Di tempat word %i di interior %i ",pInfo[playerid][pWord], pInfo[playerid][pInterior]);


    //GetVehiclePos(vehicleid, Float:x, Float:y, Float:z)
    GetVehiclePos(mobilplayer1[playerid], Float:pInfo[playerid][pMx], Float:pInfo[playerid][pMy], Float:pInfo[playerid][pMz]);

    new kordinatmobil[500];
   	format(kordinatmobil, 500, "UPDATE `playerdata` SET `pmx` = '%f',`pmy` = '%f',`pmz` = '%f' WHERE `id` = '%d' LIMIT 1", Float:pInfo[playerid][pMx], Float:pInfo[playerid][pMy], Float:pInfo[playerid][pMz], pInfo[playerid][ID]);
    mysql_query(MySQL:g_Sql, kordinatmobil, bool:true);
    printf("Mobil pindah posisi ke %f, %f, %f ke pemilik ID %i", Float:pInfo[playerid][pMx], Float:pInfo[playerid][pMy], Float:pInfo[playerid][pMz], pInfo[playerid][ID]);
    

}


CMD:changename(playerid, inputtext)
{
	ShowPlayerDialog(playerid, DIALOG_GANTINAMA, DIALOG_STYLE_INPUT, ""COL_RED"Proses Ganti Nama", "Mohon masukkan nama baru anda.", "Ganti", "Batal");
	


}


public OnPlayerCommandPerformed(playerid, cmdtext[], success)
{
	/*

    if(!success)
    {
       	return GameTextForPlayer(playerid, "~r~Peringatan ~w~~n~ Anda memasukkan~g~~n~Command Yang Salah Salah", 4000, 1);
		PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
    	SendClientMessage(playerid,COLOR_RED,"* Tolong perhatikan command yang anda berikan.");
    }
    
    */

    //return SendClientMessage(playerid,COLOR_RED,"* Tolong perhatikan command yang anda berikan.");
} 


CMD:spawn(playerid)
{
	SpawnPlayer(playerid);
	// untuk cmd salah
	return 1;
}

CMD:(playerid)
{
	
	// untuk cmd salah

}




//------------------------------------------------
CMD:bikinobject(playerid, params[]) //[COLOR="Green"]//
{
	//check if the player is a admin
	

	new model;
	if(sscanf(params, "i", model)) return SendClientMessage(playerid, COLOR_RED, "USAGE: /bikinobject [model]");

	if(0 > model > 20000) return SendClientMessage(playerid, COLOR_RED, "ERROR: The specified model is invalid.");

	new Float:pos[3];
	GetPlayerPos(playerid, pos[0], pos[1], pos[2]);

	new Float: angle;
	GetPlayerFacingAngle(playerid, angle);

	new object;// = CreateObject(model, pos[0] + (20.0 * floatsin(-angle, degrees)), pos[1] + (20.0 * floatcos(-angle, degrees)), pos[2] + 5, 0, 0, angle);
	object = CreateObject(model,pos[0], pos[1], pos[2], 0, 0, angle);
	PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);

	new string[144];
	format(string, sizeof(string), "You have created a new object [modelID untuk coding : %i, idobject di baris : %i, position: %f, %f, %f, 0.0, 0.0, %f].", model, object, pos[0], pos[1], pos[2], angle);
	SendClientMessage(playerid, COLOR_RED, string);
	EditObject(playerid, object);
	SendClientMessage(playerid, 0xFFFFFFFF, "TIPS INFO: Pakailah tombal tahan {FFFF00}~k~~PED_SPRINT~{FFFFFF} hanya untuk lihat kiri kanan atas bawah.");

	return 1;
}



CMD:selectob(playerid, params[])
{


		SendClientMessage(playerid, 0xFFFFFFFF, "TIPS INFO: Pakailah tombal tahan {FFFF00}~k~~PED_SPRINT~{FFFFFF} hanya untuk lihat kiri kanan atas bawah.");

		
		SelectObject(playerid);



	    return 1;
	
}


CMD:editobject(playerid, params[])
{
		extract params -> new objectid;
		new model;
		if(sscanf(params, "i", model)) return SendClientMessage(playerid, COLOR_RED, "USAGE: /editobject [ID object di server sekarang]");


		SendClientMessage(playerid, 0xFFFFFFFF, "TIPS INFO: Pakailah tombal tahan {FFFF00}~k~~PED_SPRINT~{FFFFFF} hanya untuk lihat kiri kanan atas bawah.");
		Streamer_Update(playerid);
		
		EditObject(playerid, objectid);
		new string[250];
		format(string, 250, "ID object yang anda edit adalah : "COL_RED"%i", objectid);
		SendClientMessage(playerid, 0xFFFFFFFF, string);

	    return 1;
	
}

CMD:editdynamicobject(playerid, params[])
{
		extract params -> new objectid;
		new model;
		if(sscanf(params, "i", model)) return SendClientMessage(playerid, COLOR_RED, "USAGE: /editdynamicobject [ID object di server sekarang]");


		SendClientMessage(playerid, 0xFFFFFFFF, "TIPS INFO: Pakailah tombal tahan {FFFF00}~k~~PED_SPRINT~{FFFFFF} hanya untuk lihat kiri kanan atas bawah.");
		Streamer_Update(playerid);
		EditDynamicObject(playerid, objectid);
		new string[250];
		format(string, 250, "ID dynamic object yang anda edit adalah : "COL_RED"%i", objectid);
		SendClientMessage(playerid, 0xFFFFFFFF, string);

	    return 1;
	
}

CMD:stats(playerid)
{
	new Float:x,Float:y,Float:z;
	new Float:facing, pekerjaan[50];
	new skinid = GetPlayerSkin(playerid);
	// ini untuk cmd /stats

	//pInfo[playerid][pJobMechanic] = 1; //percobaan ganti string

	if(pInfo[playerid][pJobMechanic] == 1)
	{
		pekerjaan = ""COL_LIGHTBLUE"Mechanic";
	}
	else
	{
		pekerjaan = ""COL_GREEN"Tamu Kota";
	}

    GetPlayerPos(playerid, x, y, z);
    GetPlayerFacingAngle(playerid, facing);

	new infokarakter[1000];
	format(infokarakter, 1000, "Bekerja : [ %s ]"COL_RWHITE" Virtuarl Word di angka : [ %d ]  Interior sekarang di angka : [ %d ] \n Anda pemilik %s terdaftar di kode %i \n kini telah merubah password menjadi "COL_RED"[ %s ] \n Skin ID yang di kenakan Adalah [ %d ] \n "COL_YELLOW"Kordinat sekarang ada di %f, %f, %f dan menghadap ke arah %f. \n Anda dalam status login (%i)",
	pekerjaan, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid), pInfo[playerid][Nick], pInfo[playerid][ID], pInfo[playerid][Sandi], skinid, x, y, z, facing, pInfo[playerid][Logged]);
	ShowPlayerDialog(playerid, RESPONDDIALOGKOSONG, DIALOG_STYLE_MSGBOX, "Database Karakter", infokarakter, "Paham", "");

}


CMD:gantipw(playerid, params[])
{
	
	/*
	new Query[250];
    format(Query, sizeof(Query), "SELECT * FROM `playerdata` WHERE `nick` COLLATE latin1_general_cs = '%s' LIMIT 1", pInfo[playerid][Nick]);
    mysql_query(g_Sql, Query); */

   	new passworddariuser[500];
    format(passworddariuser, 500, "SELECT * FROM `playerdata` WHERE `id` = '%d' LIMIT 1", pInfo[playerid][ID]); // now here check the database if the player has given the proper password.HTTP
    mysql_query(MySQL:g_Sql, passworddariuser, bool:true);
    //cache_get_value_name(0, "password", pInfo[playerid][Sandi]);
    new masukpw[500];
    //new params[1],params[2];
    //format(masukpw, 500, "UPDATE `playerdata` SET `money` = '%s', `password` = '%s' WHERE `playerdata`.`id` = %d;", params, pInfo[playerid][ID] );
    //mysql_query(g_Sql, masukpw);
    format(masukpw, 500, "UPDATE `playerdata` SET `password` = '%s' WHERE `playerdata`.`id` = %d;", params, pInfo[playerid][ID] );

    mysql_query(MySQL:g_Sql, masukpw, bool:true);
    mysql_query(MySQL:g_Sql, passworddariuser, bool:true);
	SendClientMessage(playerid, COLOR_RED, "[DATA MYSQL] * Sudah di prosses dan berhasil di input di server.");
	cache_get_value_name(0, "password", pInfo[playerid][Sandi], 100);

	// lokasi konek
	
	new yangdiinput[600];
	format(yangdiinput, 600, "Anda pemilik %s terdaftar di kode %i kini telah merubah password menjadi "COL_RED" %s", pInfo[playerid][Nick], pInfo[playerid][ID], pInfo[playerid][Sandi]);
    SendClientMessage(playerid, COLOR_SPRINGGREEN, yangdiinput); 
  
   
    
}


CMD:belisenjata(playerid)
{	
	if(IsPlayerInRangeOfPoint(playerid, 3.0, 514.9139,-2335.0103,508.6938))

	{
		pInfo[playerid][pDeaths] = pInfo[playerid][pDeaths]+1;
		SavePlayer(playerid);
		ShowPlayerDialog(playerid,9,DIALOG_STYLE_TABLIST_HEADERS,"{FFFF00}Barang Senjata", AMMUNATION_SMGS_DIALOG, "Beli", "Batal");
		
		PlayerPlaySound(playerid,1057,0.0,0.0,0.0);
		ProcessActionText(playerid, "memutuskan untuk membeli senjata dan berkomunikasi dengan arms dealer.", ACTION_ME);
		printf("[PERINGATAN SENJATA] Ditemukan %s mencoba untuk roleplay pembrontakan!", GetRPName(playerid));

		

	}
	else
	{
		SendClientMessage(playerid, COLOR_WHITE, "* Anda harus berada di tukang senjata terselubung yang di rumah gubuk kecil.");
		//ShowPlayerDialog(playerid, dialogid, style, caption[], info[], button1[], button2[])
		ShowPlayerDialog(playerid, RESPONDDIALOGKOSONG,	DIALOG_STYLE_INPUT, "{FFFF00}Anda di denda", "Serahkan jumlah pajak Retribusi :\n\n", "Bayar", "");
		ProcessActionText(playerid, "melihat ke arah polisi dan menyerahkan diri untuk membayar tilang di tempat.", ACTION_ME);
		return cmd_lsb(playerid);
		//ApplyAnimation(playerid, animlib[], animname[], Float:fDelta, loop, lockx, locky, freeze, time, forcesync = 0)
		ApplyAnimation(playerid, "SWEET", "Sweet_injuredloop", Float:4.0, -1,0,0,0,-1,-1);
		SavePlayer(playerid);
	}
	return 1;
}


//------------------------------------------------

CMD:bandara(playerid)
{	
	SetPlayerInterior(playerid, 0);
	SetPlayerVirtualWorld(playerid, 0);
	ShowPlayerDialog(playerid, RESPONDDIALOGKOSONG , DIALOG_STYLE_INPUT, ""COL_GREEN"Jasa penerbangan online", ""COL_WHITE"Jumlah kursi yang anda ingin booking :", "Travel", "Cancel");
	PindahinOrangnya(playerid, 1494.7446,-2293.4832,18.2991);
	pInfo[playerid][pKills] = pInfo[playerid][pKills]+1;
	SavePlayer(playerid);
	//1560.9934,-2309.1362,13.0200,90.7824
	//ShowPlayerDialog(playerid,2,DIALOG_STYLE_TABLIST_HEADERS,"{FFFF00}Barang Senjata", AMMUNATION_SMGS_DIALOG, "Beli", "Batal");

return 1;
}

CMD:kepemancingan(playerid)
{	
	SetPlayerInterior(playerid, 0);
	SetPlayerVirtualWorld(playerid, 0);
	//ShowPlayerDialog(playerid, RESPONDDIALOGKOSONG , DIALOG_STYLE_INPUT, ""COL_GREEN"Selamat Datang Ke Pusat Kontribusi", ""COL_WHITE"Apa yang anda ingin tawarkan dengan Sidejob? :", "Tawarkan", "Cancel");
	PindahinOrangnya(playerid, 1243.1013,-2548.5920,-0.4530+1);
	pInfo[playerid][pKills] = pInfo[playerid][pKills]+1;
	SetPlayerFacingAngle(playerid, Float:107.3879);
	SavePlayer(playerid);
	//PutPlayerInVehicle(playerid, MobilSweeperBandara, 0);
	//1560.9934,-2309.1362,13.0200,90.7824
	//ShowPlayerDialog(playerid,2,DIALOG_STYLE_TABLIST_HEADERS,"{FFFF00}Barang Senjata", AMMUNATION_SMGS_DIALOG, "Beli", "Batal");

return 1;
}

CMD:kemekanik(playerid)
{	
	SetPlayerInterior(playerid, 0);
	SetPlayerVirtualWorld(playerid, 0);
	//ShowPlayerDialog(playerid, RESPONDDIALOGKOSONG , DIALOG_STYLE_INPUT, ""COL_GREEN"Selamat Datang Ke Pusat Kontribusi", ""COL_WHITE"Apa yang anda ingin tawarkan dengan Sidejob? :", "Tawarkan", "Cancel");
	PindahinOrangnya(playerid, 2141.9475,-1728.9771,13.5592);
	pInfo[playerid][pKills] = pInfo[playerid][pKills]+1;
	SetPlayerFacingAngle(playerid, Float:49.2221);
	SavePlayer(playerid);
	//PutPlayerInVehicle(playerid, MobilSweeperBandara, 0);
	//1560.9934,-2309.1362,13.0200,90.7824
	//ShowPlayerDialog(playerid,2,DIALOG_STYLE_TABLIST_HEADERS,"{FFFF00}Barang Senjata", AMMUNATION_SMGS_DIALOG, "Beli", "Batal");

	return 1;
}







CMD:kesweeper(playerid)
{	
	SetPlayerInterior(playerid, 0);
	SetPlayerVirtualWorld(playerid, 0);
	ShowPlayerDialog(playerid, RESPONDDIALOGKOSONG , DIALOG_STYLE_INPUT, ""COL_GREEN"Selamat Datang Ke Pusat Kontribusi", ""COL_WHITE"Apa yang anda ingin tawarkan dengan Sidejob? :", "Tawarkan", "Cancel");
	PindahinOrangnya(playerid, 1560.9934,-2309.1362,13.0200);
	pInfo[playerid][pKills] = pInfo[playerid][pKills]+1;
	SetPlayerFacingAngle(playerid, Float:90.7824);
	SavePlayer(playerid);
	PutPlayerInVehicle(playerid, MobilSweeperBandara, 0);
	//1560.9934,-2309.1362,13.0200,90.7824
	//ShowPlayerDialog(playerid,2,DIALOG_STYLE_TABLIST_HEADERS,"{FFFF00}Barang Senjata", AMMUNATION_SMGS_DIALOG, "Beli", "Batal");

return 1;
}


//------------------------------------------------

CMD:setlevel(playerid, params[])
{
    if(IsPlayerAdmin(playerid) || pInfo[playerid][pAdmin] >= SETLEVEL_ADMIN)
    // if the player is an rcon admin or the players admin level is greater or equal
    // to the defined admin level of that command
    {//then
        new level, target;
        //here we create 2 variable which we will use
        if(sscanf(params, "ui", target, level)) return SendClientMessage(playerid, red, "[*] Usage: /setadmin [playerid/name] [level]");
        //if the player hasnt entered a target id or level then it will return that msg
        if(target == INVALID_PLAYER_ID) return SendClientMessage(playerid, red, "[*] Enter a valid player ID/name!");
        // if the target player is not a valid player then it will return that msg
        new string[128], Query[500], str2[50];
        if(level < 0 || level > MAX_ADMIN_LEVEL) // here we check if the level the player entered is more then the max admin level defined or 0
        {
            format(string, sizeof(string), "Enter a level between 0 and %d!", MAX_ADMIN_LEVEL);
            SendClientMessage(playerid, red,string); // if it is then we send the message and stop the command from processing
            return 1;
        }
        pInfo[target][pAdmin] = level; // MENENTUKAN LEVEL BERAPA KARAKTER TERSEBUT

        format(Query, 500, "UPDATE `playerdata` SET `admin` = '%i' WHERE `id` = '%i' LIMIT 1", level, pInfo[target][ID]); //Format the query
        //mysql_query(MySQL:handle, const query[], bool:use_cache = true)
        mysql_query(MySQL:g_Sql, Query, bool:true);
        // here we use the UPDATE option again and tell the database to update the player we specified's admin level to what we have set.
        
        // here we set the target's var to what we defined
        format(string, 256, "You have set %s yang sekarang di tab ID [%d]'s telah di percayakan menjadi admin level to %d.", pInfo[target][Nick], target, level);
        SendClientMessage(playerid, green, string);
        format(string, 256, "Admin %s has set your admin level to %d.", pInfo[playerid][Nick], level);
        SendClientMessage(target, yellow, string);
        printf("[PERUBAHAN ADMIN] * %s telah dipilih menjadi admin oleh %s ke level %d",pInfo[target][Nick], pInfo[playerid][Nick], level );
        pInfo[playerid][pAdmin] = pInfo[target][pAdmin];
        for (new i=0; i<MAX_PLAYERS; i++)
        {
            if(pInfo[i][Logged] == 1 && pInfo[i][pAdmin])
            {
                format(str2, sizeof(str2), "Admin %s[%d] has used the following command: Setlevel", pInfo[playerid][Nick], playerid);
                SendClientMessage(i,COLOR_SPRINGGREEN,string);
            }
        }
        // here we send the message to the admins
        PlayerPlaySound(target,1057,0.0,0.0,0.0);
        // play the sound for the target notifying him of this command.
    }
    else return SendClientMessage(playerid, red, "* Anda belum login di "COL_YELLOW"/rcon"COL_RED" dahulu tuan.");//ErrorMessage(playerid); // if it wasnt a rcon admin or his admin level wasnt greater then the max level
    //then we send the error message
    return 1;
}



CMD:kill(playerid)
{
	SetPlayerHealth(playerid,0.0);

	return 1;
}


CMD:rumahsakit(playerid)
{
	//ShowPlayerDialog(playerid,2,DIALOG_STYLE_TABLIST_HEADERS,"{FFFF00}Barang Senjata", AMMUNATION_SMGS_DIALOG, "Beli", "Batal");
	PindahinOrangnya(playerid, Float:-45.0102, Float:152.1082, Float:999.0637);
	SetPlayerVirtualWorld(playerid, -1);
	SetPlayerInterior(playerid, -1);
	//ApplyAnimation(playerid, "ped", "ARRESTgun",4.0,0,0,0,0,0);
	SetPlayerSkin(playerid, 172);
	//ApplyAnimation(playerid,"BAR","dnk_stndF_loop",4.0,0,0,0,0,0);
	//SetVehiclePos(GetPlayerVehicleID(playerid),-2432.1833,-1619.8467,526.6392);
    //PutPlayerInVehicle(playerid,GetPlayerVehicleID(playerid),0);
    //SetCameraBehindPlayer(playerid);
	//SetVehicleZAngle(GetPlayerVehicleID(playerid), 526.6392);
    //SetVehicleVelocity(GetPlayerVehicleID(playerid), 1.0, 1.0, 0.2);
    //SetPlayerSkin(playerid, 187);


return 1;
}

CMD:b(playerid,params[])
{
	
	    ProcessLocalOOC(playerid, params);
	    GameTextForPlayer(playerid, "~r~Peringatan ~w~~n~ Kebanyakan OOC ya ~g~~n~bisa meresahkan", 7000, 1);
}
		



CMD:aduty(playerid, params[])
{

		// ini adalah penentu skin yang di pakek user awalnya
        //new skin = GetPlayerSkin(playerid);
        //new sudahduty;
        //new belumduty;
		//new skorawal = GetPlayerScore(playerid);
   		 // Dsini player tersebut harus lebih dulu /rcon login PW , if the player isnt a rcon admin then this message will be sent to him.
    	
    	//if(!IsPlayerAdmin(playerid)) return SendClientMessage(playerid,-1,"* Tuan belum pakai /rcon login (password). ");
		new teksdikarakteradmin;
		new string[128];
		if(OnDuty[playerid] == 0)
    	{
        	SetPlayerName(playerid, pInfo[playerid][UCP]);
			teksdikarakteradmin = CreatePlayer3DTextLabel(playerid,"Hight Admin",0x01FCFFFF,0.0,0.0,0.0,30.0);
			SetPlayerSkin(playerid,217);
	        SetPlayerHealth(playerid,999999);
	        SetPlayerColor(playerid, 0x01FCFFFF);
	        SetPlayerScore(playerid, GetPlayerScore(playerid) + 9999);
	        OnDuty[playerid] = 1;
	        ApplyAnimation(playerid,"MEDIC","CPR",4.0,0,0,0,0,0);		
	        format(string, sizeof(string), "* "COL_RED"[ %s ]"COL_GREEN" are is now on duty as an admin (/report for assistance).", GetRPName(playerid));
	        SendClientMessage(playerid, COLOR_SPRINGGREEN, string);
	        GameTextForPlayer(playerid, "~r~ANDA ADMIN SEKARANG", 4000, 1);
	        ShowPlayerDialog(playerid, sewaan, DIALOG_STYLE_TABLIST_HEADERS,"{FFFF00}Daftar pelapor", PLAYERNEEDHELP_DIALOG, "Bantu", "Malas");
	       

       
   		}
 	   	else
   		{	
   			SetPlayerName(playerid, pInfo[playerid][Nick]);
   			DeletePlayer3DTextLabel(teksdikarakteradmin);
	        SetPlayerSkin(playerid,pInfo[playerid][pSkin]);
	        SetPlayerHealth(playerid,100);
	        SetPlayerColor(playerid, 0xFFFFFFFF);
	        OnDuty[playerid] = 0;
	        SetPlayerScore(playerid, GetPlayerScore(playerid) - 9999);
	        SendClientMessage(playerid, COLOR_ERROR, "* You are is now off duty as admin!");
	        ApplyAnimation(playerid,"ped","Crouch_Roll_L",4.0,0,0,0,0,0);
    	}




	
		

	return 1;
}


CMD:kegunung(playerid,params[])
{
		PindahinOrangnya(playerid,-2432.1833,-1619.8467,526.6392);
		//ApplyAnimation(playerid,"BAR","dnk_stndF_loop",4.0,0,0,0,0,0);
		SetVehiclePos(GetPlayerVehicleID(playerid),-2432.1833,-1619.8467,526.6392);
        PutPlayerInVehicle(playerid,GetPlayerVehicleID(playerid),0);
        SetCameraBehindPlayer(playerid);
  		SetVehicleZAngle(GetPlayerVehicleID(playerid), 526.6392);
        //SetVehicleVelocity(GetPlayerVehicleID(playerid), 1.0, 1.0, 0.2);
        //SetPlayerSkin(playerid, 187);
    	GameTextForPlayer(playerid, "~r~awas ketinggian!", 1000, 1);

    	CreatePlayer3DTextLabel(playerid,"WARNING\n \nMobil Ini Akan Hancur",0xFF0000FF,0.0,-1.6,-0.35,20.0,INVALID_PLAYER_ID,GetPlayerVehicleID(playerid),1);

}




CMD:v(playerid,params[])
{
	new Float:X, Float:Y, Float:Z;
	new mobilbaru;
	//new pickupsaatspawnv;
	//new mobilhitamini:
	ProcessActionText(playerid, "menyewa mobil dari pihak bandara.", ACTION_ME, params);
	//DestroyPickup(pickupsaatspawnv);
	if(IsValidVehicle(mobilbaru) == 1)
	{
		DestroyVehicle(mobilbaru);
	}
	
	PlayerPlaySound(playerid, 1055, 0.0, 0.0, 0.0);
	GetPlayerPos(playerid, Float:X, Float:Y, Float:Z);
    mobilbaru = CreateVehicle(416, X, Y, Z + 1.0, 1, 0, 0, 0);
    SendClientMessage(playerid, COLOR_ERROR, "* Peringatan anda sedang menambah mobil sport yang keren mohon di jarangkan.");
    new platcantik[100];
    format(platcantik, 100, "OWNER\n %s \n [%s]", pInfo[playerid][Nick], params);
    CreatePlayer3DTextLabel(playerid, platcantik, COLOR_YELLOW,0.0,-1.6,-0.35,20.0,INVALID_PLAYER_ID,mobilbaru,1);
    PutPlayerInVehicle(playerid, mobilbaru, 0);
    SetVehicleHealth(mobilbaru, 3000);
  	SetVehicleVelocity(GetPlayerVehicleID(playerid), 0.0, 0.2, 0.1);
    AddVehicleComponent(GetPlayerVehicleID(playerid), 1010);
    //CreateExplosion( X, Y, Z,1,2000);

    //GameTextForPlayer(playerid, "~g~Mobil Biru~n~~w~Putih~g~~n~Coba nyalakan mesin", 2000, 4);
    //pickupsaatspawnv = CreatePickup(19295, 14, X, Y, Z, -1);
    

    return cmd_objekkendaraan(playerid);
}





CMD:rumahkecil(playerid, params[])
{
        
        PindahinOrangnya(playerid,594.2203,-1178.2686,45.3405);
		SetPlayerInterior( playerid, 0 );
		// player bisa berubah worldnya dengan ini
		SetPlayerVirtualWorld( playerid, 0 );
        
        SetCameraBehindPlayer(playerid);
  		SetVehicleZAngle(GetPlayerVehicleID(playerid), 1760.2146);
        SetVehicleVelocity(GetPlayerVehicleID(playerid), 1.0, 1.0, 0.2);
       
        

         return 1;
}


CMD:wave(playerid, params[])
{
	
	switch(strval(params))
	{
	case 1: ApplyAnimation(playerid,"ON_LOOKERS", "wave_loop" ,4.0,0,0,0,0,0);
	case 2: ApplyAnimation(playerid,"KISSING", "gfwave2",4.0,0,0,0,0,0);
	case 3: ApplyAnimation(playerid,  "PED", "endchat_03",4.0,0,0,0,0,0);
	default: SendClientMessage(playerid, COLOR_WHITE, "USAGE: /wave [1 sampai 3]");
	}
	return 1;
}



CMD:lsa(playerid)
{
	PindahinOrangnya(19798, 1160.96, -1180.58);
}

CMD:lsb(playerid)
{
	
	    // Set the interior
		SetPlayerInterior(playerid, 0);
		SetPlayerVirtualWorld(playerid, 0);
		// Set player position and facing angle
		SetPlayerPos(playerid, 289.81 + random(2), -1630.65 + random(2), 34.32);
		SetPlayerFacingAngle(playerid, 10);

		// Fix camera position after teleporting
		SetCameraBehindPlayer(playerid);

		// Send a gametext message to the player
		GameTextForPlayer(playerid, "~b~~h~ Selamat datang~n~LS Putu BeachSide!", 3000, 3);


	// Exit here (return 0 as the command was not handled in this filterscript)
	return 1;
}




CMD:dr(playerid, params[])
{
        SetVehiclePos(GetPlayerVehicleID(playerid),-1720.2146,481.0942,38.0289);
        SetVehicleZAngle(GetPlayerVehicleID(playerid), 1760.2146);
        PlayerPlaySound(playerid,1057,0.0,0.0,0.0);
		// world dari kendaraan bisa berubah
		SetVehicleVirtualWorld( playerid, 0 );
		SetPlayerInterior( playerid, 0 );
		// player bisa berubah worldnya dengan ini
		SetPlayerVirtualWorld( playerid, 0 );
        //SendGuiInformation(playerid, "Bersantai", "Mohon nikmati dulu menu yang tersedia tuan.");

        PindahinOrangnya(playerid,-1720.2146,481.0942,38.0289);
		//ApplyAnimation(playerid,"BAR","dnk_stndF_loop",4.0,0,0,0,0,0);
		//PutPlayerInVehicle(playerid, vehicleid, seatid)

        PutPlayerInVehicle(playerid,GetPlayerVehicleID(playerid),0);
        SetCameraBehindPlayer(playerid);
  		//SetVehicleZAngle(GetPlayerVehicleID(playerid), 1760.2146);
        SetVehicleVelocity(GetPlayerVehicleID(playerid), 1.0, 1.0, 0.2);
        SetPlayerSkin(playerid, 29999); printf("[SKin baru ID 29999]: Skin berhasil di pasang ke: %s !", GetRPName(playerid));

        //ProcessActionText(playerid, "fokus ke jalur bakapan untuk menghadapi stunt mendadak.", ACTION_ME, params);
        new string[140];
		format(string, sizeof(string), "* %s mengemudi dengan kecepatan penuh di speedometer dan fokus sekali untuk menyetir.", GetRPName(playerid));
		//SendClientMessage(playerid, COLOR_ME, string);
		LocalMessage(ACTION_DISTANCE, playerid, ACTION_COLOR, string);

         return 1;
    }


CMD:labelbadan(playerid, params[])
{

	//new tmp[256];
	//tmp = strtok(cmdtext,idx);
	
	new textdiketik[100];
	new Text3D:textbadan;
	format(textdiketik, sizeof(textdiketik), " %s \n ((%s))", params, pInfo[playerid][Nick]);
	textbadan = Create3DTextLabel(textdiketik,COLOR_SPRINGGREEN,0.0,0.0,0.0,40.0);
		//Create3DTextLabel(text[], color, Float:X, Float:Y, Float:Z, Float:DrawDistance, virtualworld, testLOS=0);//
	//Attach3DTextLabelToPlayer(Text3D:id, playerid, Float:OffsetX, Float:OffsetY, Float:OffsetZ)

    Attach3DTextLabelToPlayer(Text3D:textbadan, playerid, 0.0, 0.0, 0.0);
	return 1;
}


CMD:bar(playerid, params[])
{
        //SendGuiInformation(playerid, "Bersantai", "Mohon nikmati dulu menu yang tersedia tuan.");
        PindahinOrangnya(playerid,970.5093,-1568.8385,13.4070);
		ApplyAnimation(playerid,"BAR","dnk_stndF_loop",4.0,0,0,0,0,0);
		SetVehiclePos(GetPlayerVehicleID(playerid),970.5093,-1568.8385,13.4070);
        PutPlayerInVehicle(playerid,GetPlayerVehicleID(playerid),0);
        SetCameraBehindPlayer(playerid);
  		SetVehicleZAngle(GetPlayerVehicleID(playerid), 970.5093);
        SetVehicleVelocity(GetPlayerVehicleID(playerid), 0.1, 0.0, 0.0);
        SetPlayerSkin(playerid, 187);
        
        /*
        new Float: x,Float: y,Float: z;
	GetVehicleVelocity(GetPlayerVehicleID(playerid), x, y, z);
	if(floatsqroot(floatpower(floatabs(x), 2.0) + floatpower(floatabs(y), 2.0) + floatpower(floatabs(z), 2.0)) * 180 < MAX_KPH)
	{
		SetVehicleVelocity(GetPlayerVehicleID(playerid), x*BOOST_VEL, y*BOOST_VEL, z*BOOST_VEL);
	} */
	
	
         return 1;
    }


CMD:sit(playerid, params[])
{
        //SendGuiInformation(playerid, "Bersantai", "Mohon nikmati dulu menu yang tersedia tuan.");
		 ApplyAnimation(playerid, "MISC", "Seat_talk_01",4.0, 1, 1, 1, 1, 1, 1);

         return 1;
    }

CMD:dance(playerid, params[])
{
		 SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DANCE4);
         return 1;
}

forward lockspeed(playerid, vehicleid);
public lockspeed(playerid, vehicleid)
{
	//GetPVarInt(playerid, "playerid");
	//GetPVarInt(playerid, "pInfo[playerid][pKendaraanDipakai]");
	//GetPVarFloat(playerid, "speed");
	
	
	//SendClientMessage(playerid, -1, "* lockspeed sytem terbaca dan terpanggil");

	if(Float:GetVehicleSpeed(pInfo[playerid][pKendaraanDipakai]) > Float:pInfo[playerid][pKecepatanKendaraan])
	{
		SetVehicleSpeedTT(pInfo[playerid][pKendaraanDipakai], Float:pInfo[playerid][pKecepatanKendaraan]);
		new str[100];
		format(str, 100, "ID kendaraan %i, Kecepatan %i", pInfo[playerid][pKendaraanDipakai], GetPlayerSpeed(playerid, true));
		SendClientMessage(playerid, -1, str);
	}
	if(!IsPlayerInAnyVehicle(playerid))
	{
		KillTimer(AktifkanLimitSpeed[playerid]);
		return 1;
	}
}

CMD:limitspeed(playerid, params[])
{
	new vehicleid = GetPlayerVehicleID(playerid);

	extract params -> new Float: speed; else return SendClientMessage(playerid, COLOR_ERROR, "/limitspeed [speed]");
	pInfo[playerid][pKendaraanDipakai]=vehicleid;
	Float:pInfo[playerid][pKecepatanKendaraan]=speed;
	KillTimer(AktifkanLimitSpeed[playerid]);
	AktifkanLimitSpeed[playerid] = SetTimer("lockspeed", 1, true);



	return SendClientMessage(playerid, -1, "* speed limit changed");
}


// coba latihan membuat cmd penghilang limit speed.
CMD:unlimitspeed(playerid, params[])
{
	SendClientMessage(playerid, COLOR_ERROR, "* Limit speed kendaraan di hilangkan.");
	KillTimer(AktifkanLimitSpeed[playerid]);
	return 1;



}

CMD:kasispeed(playerid, params[])
{
	

	if(!IsPlayerInAnyVehicle(playerid))
		return SendClientMessage(playerid, -1, "u have to be in a vehicle");

	extract params -> new Float: speed; else return SendClientMessage(playerid, -1, "/setspeed [speed]");

	new vehicleid = GetPlayerVehicleID(playerid);

	SetVehicleSpeedTT(vehicleid, speed);

	SendClientMessage(playerid, -1, "speed changed");

	return 1;
}




CMD:jp(playerid, params[])
{
	    SetPlayerSpecialAction(playerid,SPECIAL_ACTION_USEJETPACK);
		return 1;
	}

CMD:ame(playerid, params[])
{
    new result[100], string[140];
    if(sscanf(params, "s[100]", result))
    {


        format(string, sizeof(string), "* %s %s *", GetRPName(playerid), result);
        // format penulisan ame nya
        
        //CreateDynamic3DTextLabel(const text[], color, Float:x, Float:y, Float:z, Float:drawdistance, attachedplayer = INVALID_PLAYER_ID, attachedvehicle = INVALID_VEHICLE_ID, testlos = 0, worldid = -1, interiorid = -1, playerid = -1, Float:streamdistance = STREAMER_3D_TEXT_LABEL_SD, STREAMER_TAG_AREA areaid = STREAMER_TAG_AREA -1, priority = 0)
        ame[playerid] = CreateDynamic3DTextLabel(string, COLOR_ME, 0.0, 0.0, 0.0, 40.0, playerid);
        
        SendClientMessage(playerid, COLOR_ME, "*Ame berhasil di pasang tuan");
        format(string, sizeof(string), "AME >> %s", string);
        SendClientMessage(playerid, COLOR_ME, string);
        amestatus[playerid] = 1;

		return 1;
    }
    if(strlen(result) >100) return SendClientMessage(playerid, COLOR_ERROR, "The description shouldn't more than 100 character!");
    if(strcmp(result, "off", true) == 0)
    {
        SendClientMessage(playerid, COLOR_ERROR, "USAGE:{FFFFFF} /ame [description] - This text will show up above your head.");
        SendClientMessage(playerid, COLOR_ERROR, "HINT:{FFFFFF} Use (/ame off) to remove the text!");


        if(amestatus[playerid] == 0) return SendClientMessage(playerid, COLOR_ERROR, "You don't have any ame attached!");
        DestroyDynamic3DTextLabel(ame[playerid]);
        SendClientMessage(playerid, COLOR_ME, "AME deleted!");
        amestatus[playerid] = 0;
        return 1;
    }
    if(amestatus[playerid] == 0)
    {
        format(string, sizeof(string), "* %s %s *", GetRPName(playerid), result);
        ame[playerid] = CreateDynamic3DTextLabel(string, COLOR_ME, 0.0, 0.0, 0.0, 40.0, playerid);
        format(string, sizeof(string), "AME >> %s", string);
        SendClientMessage(playerid, COLOR_ME, "Wah sedang pakai me yang muncul di kepala");
        SendClientMessage(playerid, COLOR_ME, string);
        amestatus[playerid] = 1;
    }
    else
    {
        format(string, sizeof(string), "* %s %s *", GetRPName(playerid), result);
        UpdateDynamic3DTextLabelText(ame[playerid], COLOR_ME, string);
        format(string, sizeof(string), "AME Update Success! >> %s", string);
        SendClientMessage(playerid, COLOR_ME, string);

		return 1;
    }
    return 1;
}

//------------------------------------------------
CMD:w(playerid, params[])
{

	new result[100], string[140];
if(sscanf(params, "string[300]", result))
    {
        
		GivePlayerWeapon(playerid, strval(string), 9999);
		return 1;
	}
	return 1;
	}


CMD:bikinlabel(playerid, params[])
	{
	    new Float:X, Float:Y, Float:Z;
	    

	    //new	isikarakter;

	    GetPlayerPos( playerid, X, Y, Z );
	    //message = strrest(params, isikarakter);
	    //strdel(message, 0, 11);
	    PlayerPlaySound(playerid, 2401, 0.0, 0.0, 10.0);
	    
	    //player3dtextid = CreatePlayer3DTextLabel(playerid," Putu Ganteng Disini ",0xFFFFFF00,X,Y,Z,10.3);
	    ApplyAnimation(playerid,"BOMBER", "BOM_Plant",4.0,0,0,0,0,0);
	    SendClientMessage(playerid, 0xFFFFFFFF, "**label berhasil di buat tuan.");
	    
	    GameTextForPlayer(playerid, "~r~~h~~h~~h~~h~ Anda membuat label ~n~~r~-47000", 5000, 5);
		return 1;
	}



CMD:m(playerid, params[])
	{
  	    //message = strrest(params,idx);
		ProcessMegaphone(playerid, params);
		ApplyAnimation(playerid, "POLICE", "CopTraf_Stop",4.0,0,0,0,0,0);
		PlayerPlaySound(playerid, 2402, 0.0, 0.0, 0.0);
		GameTextForPlayer(playerid, "~y~Terdengar suara keras dari speaker megaphone", 5000, 5);
		return 1;
	}
	
	
CMD:teleportasi(playerid, params[])
{
	new Float:gotoPos[3];
	//sscanf(const data[], const format[], ...)

    if(sscanf(params, "fffdd", gotoPos[0], gotoPos[1], gotoPos[2], params[4], params[5])) return SendClientMessage(playerid, -1, "Caranya: /teleportasi (X) (Y) (Z) (world ID berapa) (Interior ID berapa) ");
    GameTextForPlayer(playerid, "~r~INGAT KODE INTERIORNYA YA dengan /save ", 10000, 5);
	SetPlayerPos(playerid, gotoPos[0], gotoPos[1], gotoPos[2]);
    SetPlayerVirtualWorld( playerid, params[4] );
    SetPlayerInterior(playerid, params[5]);

    TogglePlayerControllable(playerid, 0); // supaya karakter yang spawn itu diam tidak bergerak
 	unfreezeplayer = playerid; // variabel playerid itu sama dengan variabel unfreeplayer
 	SetTimer("UnFreezeMe",3000,0);
    
    return 1;
}


//------------------------------------------------
CMD:engine(playerid, params[]) 
{
		//new PRESSED;
		//if (PRESSED( KEY_WALK | KEY_SPRINT ));
        //new vid = GetPlayerVehicleID(playerid);
	  	//if(vid != INVALID_VEHICLE_ID) {
			ToggleVehicleEngine(playerid);
		//}
	    return 1;
	}

CMD:padamkan(playerid, params[])
{
	
	new result[100], string[140];
	if(sscanf(params, "string[300]", result))
    {
	SendClientMessage(playerid,COLOR_YELLOW,"* Sudah tau cara naik mobil?");
	GameTextForPlayer(playerid, "~g~Yuk Padamkan", 5000, 5);
	{

        if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 407)
        {
            FiremanJob[playerid] = 1;
            new name[MAX_PLAYER_NAME], string[90];
            GetPlayerName(playerid, name, sizeof(name));
   	        format(string, sizeof(string), "* %s Dimulai sebagai petugas pemadam kebakaran.", name );
	    	SendClientMessageToAll(COLOR_AQUA, string);
	    	PlayerPlaySound(playerid, 1150, 0.0, 0.0, 10.0);
      		GameTextForPlayer(playerid, "~g~Hai ~w~Bos mulai~r~ awas ledakan ~b~semoga berhasil ~g~!!!...", 7000, 5);
			SetPlayerCheckpoint(playerid,1099.0345,-1194.4751,18.1079,7);
			GivePlayerWeapon(playerid, 42, 99999);
			SendClientMessage(playerid,COLOR_YELLOW,"* Pergi ke api nanti ya!");
			return 1;
		}
		SendClientMessage(playerid, COLOR_RED,"Anda dapat memulai tugas pemadam kebakaran hanya di dalam mobil.");
	}
    return 1;
}
 return 1;
}


//------------------------------------------------

CMD:kerja(playerid)
{
	SetPlayerArmedWeapon(playerid, 0);
	GangZoneHideForPlayer(playerid, BlackRadar);

	if(GetPlayerVirtualWorld(playerid) == 0)
	{
		if(GetPlayerInterior(playerid) == 0)
		{

			if(IsPlayerInRangeOfPoint(playerid, Float:3.0, 2122.7329,-1738.5591,13.5644))// mau kerja minner
			{
				SendClientMessage(playerid,COLOR_YELLOW,"Anda dapat ke cekpoint untuk mulai kerja minner.");
				LokasiMining = SetPlayerCheckpoint(playerid, 2116.5764,-1726.5281,15.0132, Float:1.0);
				SetPlayerAttachedObject(playerid, 4, 18634, 6, 0.07, 0.03, 0.04, 0.0, 270.0, 270.0, 1.5, 2.1, 1.8, 0); // attachment linggis untuk minner
				PlayerPlaySound(playerid, 1221, 0.0, 0.0, 10.0);
			}

			if(IsPlayerInVehicle(playerid, MobilKerjaHauling))
			{
				KerjaHaulingStatus[playerid] = 1;
		        
		    	PlayerPlaySound(playerid, 1150, 0.0, 0.0, 10.0);
		  		GameTextForPlayer(playerid, "~g~Hai Anda Sekarang Cari Trailer ~n~~w~Di Pesawat~r~ ~n~ Gunakan  ~b~jalur kanan~g~", 7000, 5);
				
				SetPlayerCheckpoint(playerid,1448.9202,-2286.5894,13.5468,25); // cp 1
				SendClientMessage(playerid,COLOR_YELLOW,"* Mohon untuk memuat paket trailer dari landasan pesawat segera.");

				return 1;
			}

			if(IsPlayerInVehicle(playerid, MobilSweeperBandara))
		    {
		        KerjaSweeperBandara[playerid] = 1;
		        
		    	PlayerPlaySound(playerid, 1150, 0.0, 0.0, 10.0);
		  		GameTextForPlayer(playerid, "~g~Mulai untuk ~n~~w~perawatan jalan~b~ ~n~ hindari salah ~r~jalur kiri!~g~", 7000, 5);
				
				SetPlayerCheckpoint(playerid,1550.3846,-2299.2410,13.0196,4); // cp 1
				SendClientMessage(playerid,COLOR_YELLOW,"* Ikuti jalur jalan di depan anda.");

				return 1;
			}
			else
			{
				SendClientMessage(playerid, COLOR_RED,"Anda dapat memulai tugas hanya di tempat resmi yang di tandai saja.");
			}

			return 1;
				
		}
	}
	



}





CMD:dyoc(playerid, params[])
{
     new string[128];
    for(new x;x<MAX_PLAYER_ATTACHED_OBJECTS;x++)
    if(IsPlayerAttachedObjectSlotUsed(playerid, x)) format(string, sizeof(string), "%s%d (Sudah Ada Attachment)\n", string, x);
    else format(string, sizeof(string), "%s%d (Masi Kosong)\n", string, x);
    

    //ShowPlayerDialog(playerid, dialogid, style, caption[], info[], button1[], button2[])
    ShowPlayerDialog(playerid, DIALOG_ATTACH_INDEX_SELECTION, DIALOG_STYLE_LIST, 
    "{FF0000}Attachment Modification - Index Selection", string, "Select", "Cancel");
    
    
 	return 1;
 } 
    
//------------------------------------------------
CMD:tambahpaku(playerid, params[])
{
	
	//new perintahpaku;
	//new cmdtext;
	//new idx;
	//new result[100], string[140];
//if(sscanf(params, "string[300]", result))
  //  {	
  		//new IDTEXTPAKU;
		new Float:plocx,Float:plocy,Float:plocz,Float:ploca;
        GetPlayerPos(playerid, plocx, plocy, plocz);
        GetPlayerFacingAngle(playerid,ploca);
    
        CreateStrip(plocx,plocy,plocz,ploca);
        GameTextForPlayer(playerid, "~g~KAWAT PAKU~n~~w~BERHASIL DI PASANG~r~~n~- 2000$", 1000, 4);
        GivePlayerMoney(playerid, -200);
		PlayerPlaySound(playerid, 1085, plocx,plocy,plocz);
        IDTEXTPAKU = CreatePlayer3DTextLabel(playerid,"AWAS PAKU",0xFFFFFFFF,plocx,plocy,plocz,10.3);
		//TextDrawCreate(plocx,plocy,"~y~AWAS PAKU");
		ApplyAnimation(playerid, "PED", "bomber",4.0,0,0,0,0,0);
		ProcessActionText(playerid, "mengambil spikestip dari dalam trunk mobil lalu memasangnya dengan kedua tangan.", ACTION_ME);
	  //  return 1;
//	}


	return 1;
}


CMD:hapuspaku(playerid, params[])
{
    
//	new result[100], string[140];
//if(sscanf(params, "string[300]", result))
   // {
        //new IDTEXTPAKU;
	    new Float:plocx,Float:plocy,Float:plocz,Float:ploca;
        GetPlayerPos(playerid, plocx, plocy, plocz);
        GetPlayerFacingAngle(playerid,ploca);
        DeleteClosestStrip(playerid); 
        GameTextForPlayer(playerid, "~R~Berhasil kalau hapus dekat", 900, 5);
        IDTEXTPAKU = DeletePlayer3DTextLabel(playerid,plocx,plocy,plocz);
        DeletePlayer3DTextLabel(playerid, IDTEXTPAKU);
        ApplyAnimation(playerid, "COP_AMBIENT", "Coplook_watch" ,4.0,0,0,0,0,0);
	
	    //return 1;
//	}

return 1;
	}
	
CMD:hapussemuapaku(playerid, params[])
{
    
	//new result[100], string[140];
//if(sscanf(params, "string[300]", result))
    //{
    
        //new IDTEXTPAKU;
        DeletePlayer3DTextLabel(playerid, IDTEXTPAKU);
		DeleteAllStrip();
        GameTextForPlayer(playerid, "~g~KAWAT PAKU~n~~w~BERHASIL DI BONGKAR~g~~n~Anda di gaji + 2000$", 2000, 5);
        GivePlayerMoney(playerid, 20000);
        
        pInfo[playerid][pMoney] = pInfo[playerid][pMoney]+20000;
        //new Query[500];
        //format(Query, 500, "UPDATE `playerdata` SET `money` = '%i' WHERE `id` = '%i' LIMIT 1", pInfo[playerid][pMoney], pInfo[playerid][ID]); //Format the query
        //mysql_query(g_Sql, Query);
        SavePlayer(playerid);
        printf("[MYSQL]: uang di tambah ke database %s sebesar 2000 rupiah!", SQL_DB);
        ApplyAnimation(playerid, "GANGS", "Invite_Yes",4.0,0,0,0,0,0);
	 //   return 1;
	//}
	
	return 1;
}
	/*
	
*/

CMD:me(playerid, params[])
	{
  	   	//SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "* %s %.64s", ReturnName(playerid, 0), params);
  	   	
		ProcessActionText(playerid, params, ACTION_ME);
		PlayerPlaySound(playerid, 1150, 0.0, 0.0, 10.0);
		GameTextForPlayer(playerid, "~g~Roleplay~n~~w~Wah sudah ada lawan main nih ~g~~n~Semangat", 2000, 4);
	
		return 1;
	}
	
CMD:fix(playerid, params[])
	{
	    new vid = GetClosestCar(playerid, INVALID_VEHICLE_ID);
	    RepairVehicle(vid);
	    pInfo[playerid][pMoney] = pInfo[playerid][pMoney]-200;
		GivePlayerMoney(playerid, -200);
		PlayerPlaySound(playerid, 1083, 0.0, 0.0, 10.0);
		GameTextForPlayer(playerid, "~r~-$200", 7000, 3);
		SendClientMessage(playerid, 0xFFFFFFFF, "* Pelayan telah memperbaiki mobil yang di pakai senilai $200.");
	    RemovePlayerFromVehicle(playerid);
		//PindahinOrangnya(playerid,-1763.0876,439.2883,38.4542);
	    SetPlayerTime(playerid, 6, 0);
		//SetPlayerHealth(playerid,9999);
	    //CreateExplosion(-1563.9391,645.6500,43.3195,2,100);
	    //SetPlayerCameraLookAt(playerid,-1563.9391,645.6500,43.3195);

		ApplyAnimation(playerid, "GRAVEYARD", "mrnF_loop",4.0,0,0,0,0,0);
		SavePlayer(playerid);
		return 1;
	}
	
CMD:do(playerid, params[])
	{

		ProcessActionText(playerid, params, ACTION_DO);
        PlayerPlaySound(playerid, 1112, 0.0, 0.0, 10.0);
        GameTextForPlayer(playerid, "~g~Sekarang ~w~Kondisikan secara detail ~g~Yang Terjadi", 7000, 3);
		return 1;
	}

CMD:delado(playerid, params[])
{

	DestroyDynamic3DTextLabel(ado[playerid]);
    PlayerPlaySound(playerid, 1112, 0.0, 0.0, 10.0);
    GameTextForPlayer(playerid, "~g~Wah ~w~jangan bersedih kalau papan hilang~g~bisa bikin lagi", 7000, 3);
	return 1;
}


//------------------------------------------------
CMD:ado(playerid, params[])
{
    // membuat ado deteksi kalau id teks ado udah ada.
    if(IsValidDynamic3DTextLabel(ado[playerid]))
    {
    	DestroyDynamic3DTextLabel(ado[playerid]);
    	new IDkendaraan = GetPlayerVehicleID(playerid);
    	new Float:AdoX, Float:AdoY, Float:AdoZ;
        GetPlayerPos(playerid, AdoX, AdoY, AdoZ);
        new string[200];
        format(string, sizeof(string), "** %s **\n(( %s ))", params, GetRPName(playerid));
        ado[playerid] = CreateDynamic3DTextLabel(string, COLOR_ME, AdoX, AdoY, AdoZ, 20.0);
        SendClientMessage(playerid, COLOR_ME, "*Anda berhasil membuat ado tuan. ((Putu Suhartawan))");

        if(IsPlayerInAnyVehicle(playerid))
        {
        	
        	DestroyDynamic3DTextLabel(ado[playerid]);
        	ado[playerid] = CreateDynamic3DTextLabel(string, COLOR_ME, 0.0, 0.6,0.35, Float:2.0, INVALID_PLAYER_ID, IDkendaraan,  0, 0, 0, playerid = -1, Float:5.0, -1,0);
        }
    }
    else
    {
    	new result[100], string[300];
	    if(sscanf(string, "params", result))
	    {

	        new Float:AdoX, Float:AdoY, Float:AdoZ;
	        GetPlayerPos(playerid, AdoX, AdoY, AdoZ);
	        //strfind(string, "_", false, format) = ' ';
	        format(string, sizeof(string), "** %s **\n(( %s ))", params, GetRPName(playerid));
	        ado[playerid] = CreateDynamic3DTextLabel(string, COLOR_ME, AdoX, AdoY, AdoZ, 20.0);
	        SendClientMessage(playerid, COLOR_ME, "*Anda berhasil membuat ado tuan. ((Putu Suhartawan))");
	        adostatus[playerid] = 1;


			return 1;
	    }
	    if(strlen(result) >300) return SendClientMessage(playerid, COLOR_ERROR, "The description shouldn't more than 100 character!");
	    if(strcmp(result, "off", true) == 0)
	    {
	        SendClientMessage(playerid, COLOR_ERROR, "USAGE:{FFFFFF} /ado [description] - This text will stay on your current place.");
	        SendClientMessage(playerid, COLOR_ERROR, "HINT:{FFFFFF} Use (/ado off) to remove the text!");


	        if(adostatus[playerid] == 0) return SendClientMessage(playerid, COLOR_ERROR, "You don't have any ado attached!");
	        DestroyDynamic3DTextLabel(ado[playerid]);
	        SendClientMessage(playerid, COLOR_ME, "Ado Telah di hapus tuan.");
	        adostatus[playerid] = 0;
	        return 1;
	    }
	    if(adostatus[playerid] == 0)
	    {
	        new Float:AdoX, Float:AdoY, Float:AdoZ;
	        GetPlayerPos(playerid, AdoX, AdoY, AdoZ);
	        format(string, sizeof(string), "* %s *\n(( %s ))", result, GetRPName(playerid));
	        ado[playerid] = CreateDynamic3DTextLabel(string, COLOR_ME, AdoX, AdoY, AdoZ, 40.0);
	        SendClientMessage(playerid, COLOR_ME, "Ado berhasil di buat tuan.");
	        adostatus[playerid] = 1;
	    }
	    else
	    {
	        format(string, sizeof(string), "* %s *\n(( %s ))", result, GetRPName(playerid));
	        UpdateDynamic3DTextLabelText(ado[playerid], COLOR_ME, string);
	        SendClientMessage(playerid, COLOR_ME, "ADO Update Success!");
	        return 1;
	    }
    }


    
    return 1;
}



//------------------------------------------------
public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	new message[526+1];
	
	if(dialogid == DIALOG_PROSSES_IKLAN) //If Dialog is our register dialog
    {
    	if(!response)
    	{
    			new string[140];
				format(string, sizeof(string), "* %s menaruh kembali formulir di meja dan memutuskan untuk memeriksa uang di dompet", GetRPName(playerid));
				LocalMessage(ACTION_DISTANCE, playerid, ACTION_COLOR, string);
    			LocalMessage(ACTION_DISTANCE, playerid, ACTION_COLOR, "* Anda dapat melihat iklan dibatalkan karena malasah keuangan dari penulisnya.((Staff SANews))");
    	}


    	if(response)
    	{
    		if(IsValidDynamic3DTextLabel( TempatDisplayIklan))
    		{
    			LocalMessage(ACTION_DISTANCE, playerid, ACTION_COLOR, "* Nampak Iklan sudah berhasil di buat dengan rapi.((Staff SANews))");
    			new isiiklan[200];

    			format(isiiklan, sizeof(isiiklan), " "COL_WHITE" * [PAPAN IKLAN] * \n\n "COL_LGREEN" %s \n "COL_PINK" * Thank You * " , inputtext);
    			UpdateDynamic3DTextLabelText(TempatDisplayIklan, COLOR_GREEN, isiiklan);
    			// fungsi pembayaran iklan 20 dollar
    			GivePlayerMoney(playerid, -20);
    			pInfo[playerid][pMoney] = pInfo[playerid][pMoney]-20;
    			
    			//SetDynamicObjectMaterialText(STREAMER_TAG_OBJECT objectid, materialindex, const text[], materialsize = OBJECT_MATERIAL_SIZE_256x128, const fontface[] = "Arial", fontsize = 24, bold = 1, fontcolor = 0xFFFFFFFF, backcolor = 0, textalignment = 0)
    			SetDynamicObjectMaterialText(layariklanbadara, 0, isiiklan, OBJECT_MATERIAL_SIZE_512x512, "Arial", 50, 1, COLOR_GREEN, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);

    			new string[140];
				format(string, sizeof(string), "* %s menaruh kembali formulir di meja dan membayar biaya iklan ke staff SANews Agency.", GetRPName(playerid));
				LocalMessage(ACTION_DISTANCE, playerid, ACTION_COLOR, string);
    			LocalMessage(ACTION_DISTANCE, playerid, ACTION_COLOR, "* Anda dapat melihat iklan telah di update di papan reklame bandara Kendari.((Staff SANews))");

    			new iklanbaris[200];
    			format(iklanbaris, sizeof(iklanbaris), "[IKLAN] %s!\nHubungi CP: %s "COL_PINK"* Trimakasih *", inputtext, GetRPName(playerid));
    			SendClientMessageToAll(COLOR_GREEN, iklanbaris);


    			ApplyAnimation(playerid, "MISC", "Idle_Chat_02", 4.1, 0, 0, 0, 0, 0, 0);
    		}	
    		else
    		{
    			SendClientMessage(playerid, -1,"Kesalahan ID teks");
    		}
    		
    		
    	}

    }

	if(dialogid == 9) //If Dialog is our register dialog
    {


    	//return cmd_aduty(playerid);
    	switch(listitem) 
    	{
			case 0:
			{
				if(GetPlayerMoney(playerid) <200)
                {
                	SendClientMessage(playerid, COLOR_RED, "* Tuan belum cukup uang untuk item ini!");
                }

				SendClientMessage(playerid, COLOR_RED, "* Peringatan anda sudah memutuskan ini memang suram!");
				GivePlayerMoney(playerid, -540);
				GameTextForPlayer(playerid, "~r~-$540", 7000, 3);
                GivePlayerWeapon(playerid,22,30);
                SendClientMessage(playerid, COLOR_SPRINGGREEN, "*Arms Dealer : Thank you for purchasing a 9mm! ($540)");
                

                
                //ShowPlayerDialog(playerid,9,DIALOG_STYLE_TABLIST_HEADERS,"{FFFF00}Barang Senjata", AMMUNATION_SMGS_DIALOG, "Beli", "Batal");
                //ShowPlayerDialog(playerid, WEAPONSHOP, DIALOG_STYLE_LIST, "AmmuNation", "{F9B857}Pistols\n{F9B857}Sub-Machine Gun\n{FAFA52}Shotguns\n{C77D87}Armours\n{B8FF02}SMG\n{F300FF}Assault", "Select", "Cancel");

				//return cmd_kegunung(playerid);
			} 
			case 1:
			{
				SendClientMessage(playerid, COLOR_RED, "* Wah ini baru senjata untuk streaming!");
				GivePlayerMoney(playerid, -340);
				GameTextForPlayer(playerid, "~r~-$548", 7000, 3);
				//return cmd_dr(playerid);
			} 
			case 2:
			{
				 SendClientMessage(playerid, COLOR_SPRINGGREEN, "* VGA ini memang mantap tuan");
				 GivePlayerMoney(playerid, -540);
				 GameTextForPlayer(playerid, "~r~-$765", 7000, 3);
				 // return cmd_rumahsakit(playerid);
			}
			case 3:	
			{
				SendClientMessage(playerid, COLOR_RED, "* Wah mantap nih anda beli RAM besar!");
				GivePlayerMoney(playerid, -340);
				GameTextForPlayer(playerid, "~r~-$456", 7000, 3);
				//return cmd_dr(playerid);
			} 

			

		}

    	
		if(response) 
		    	{
		    		SendClientMessage(playerid, COLOR_RED, "* Ingatlah senjata berat tanpa lisensi membuat anda miskin.");
		    		//GivePlayerMoney(playerid, -1000);
		    		return cmd_belisenjata(playerid);
		    		//ShowPlayerDialog(playerid, BUYTOYSCOP, DIALOG_STYLE_MSGBOX, "Accessories", "Welcome to the law enforcement accessory locker!","Continue", "Cancel");
		    	}
		    	
    	if(!response) 
    	{
    		SendClientMessage(playerid, COLOR_RED, "* Bagus rupanya anda masi bisa sadar.");
    		GivePlayerMoney(playerid, 1432);

    	}

    	//return cmd_dyoc(playerid);
    }
    
	
	switch(dialogid)
    {
        case DIALOG_ATTACH_INDEX_SELECTION:
        {
            if(response)
            {
                if(IsPlayerAttachedObjectSlotUsed(playerid, listitem))
                {
                    ShowPlayerDialog(playerid, DIALOG_ATTACH_EDITREPLACE, DIALOG_STYLE_MSGBOX, \
                    "{FF0000}Attachment Modification", "Do you wish to edit the attachment in that slot, or delete it?", "Edit", "Delete");
                }
                else
                {
                    new string[4000+1];
                    for(new x;x<sizeof(AttachmentObjects);x++)
                    {
                        format(string, sizeof(string), "%s%s\n", string, AttachmentObjects[x][attachname]);
                    }
                    ShowPlayerDialog(playerid, DIALOG_ATTACH_MODEL_SELECTION, DIALOG_STYLE_LIST, \
                    "{FF0000}Attachment Modification - Model Selection", string, "Select", "Cancel");
                }
                SetPVarInt(playerid, "AttachmentIndexSel", listitem);
            }
            return 1;
        }
        case DIALOG_ATTACH_EDITREPLACE:
        {
            if(response) EditAttachedObject(playerid, GetPVarInt(playerid, "AttachmentIndexSel"));
            else RemovePlayerAttachedObject(playerid, GetPVarInt(playerid, "AttachmentIndexSel"));
            DeletePVar(playerid, "AttachmentIndexSel");
            return 1;
        }
        case DIALOG_ATTACH_MODEL_SELECTION:
        {
            if(response)
            {
                if(GetPVarInt(playerid, "AttachmentUsed") == 1) EditAttachedObject(playerid, listitem);
                else
                {
                    SetPVarInt(playerid, "AttachmentModelSel", AttachmentObjects[listitem][attachmodel]);
                    new string[600+1];
                    for(new x;x<sizeof(AttachmentBones);x++)
                    {
                        format(string, sizeof(string), "%s%s\n", string, AttachmentBones[x]);
                    }
                    ShowPlayerDialog(playerid, DIALOG_ATTACH_BONE_SELECTION, DIALOG_STYLE_LIST, \
                    "{FF0000}Attachment Modification - Bone Selection", string, "Select", "Cancel");
                }
            }
            else DeletePVar(playerid, "AttachmentIndexSel");
            return 1;
        }
        case DIALOG_ATTACH_BONE_SELECTION:
        {
            if(response)
            {
                SetPlayerAttachedObject(playerid, GetPVarInt(playerid, "AttachmentIndexSel"), GetPVarInt(playerid, "AttachmentModelSel"), listitem+1);
                EditAttachedObject(playerid, GetPVarInt(playerid, "AttachmentIndexSel"));
                SendClientMessage(playerid, 0xFFFFFFFF, "Hint: Use {FFFF00}~k~~PED_SPRINT~{FFFFFF} to look around.");
            }
            DeletePVar(playerid, "AttachmentIndexSel");
            DeletePVar(playerid, "AttachmentModelSel");
            return 1;
        }
    }
	/*
	//--------------------------------------------------------------------------------------------------------------------------
    

	*/

    if(dialogid == PILIHAN_LAMPU) //If Dialog is our register dialog
    {
    	//return cmd_aduty(playerid);
    	new vid = GetPlayerVehicleID(playerid);
    	new engine,lights,alarm,doors,bonnet,boot,objective;
    	if(response) 
    	{
    		SendClientMessage(playerid, COLOR_YELLOW, "* Berhasil menyalakan lampu.");
    		if(vid != INVALID_VEHICLE_ID) 
    		{
		  	    GetVehicleParamsEx(vid,engine,lights,alarm,doors,bonnet,boot,objective);

		  	    SetVehicleParamsEx(vid,engine,VEHICLE_PARAMS_ON,alarm,doors,bonnet,boot,objective);
			}
    		//GivePlayerMoney(playerid, -1000);
    		//ShowPlayerDialog(playerid, BUYTOYSCOP, DIALOG_STYLE_MSGBOX, "Accessories", "Welcome to the law enforcement accessory locker!","Continue", "Cancel");
    	}
    	if(!response) 
    	{
    		SendClientMessage(playerid, COLOR_WHITE, "* Lampu dalam kondisi mati.");
    		GetVehicleParamsEx(vid, engine, lights, alarm, doors, bonnet, boot, objective);
    		SetVehicleParamsEx(vid, engine,VEHICLE_PARAMS_OFF,alarm,doors,bonnet,boot,objective);
    		//GivePlayerMoney(playerid, 1432);
    	}


    	//return cmd_dyoc(playerid);
    }







	if(dialogid == sewaan) //If Dialog is our register dialog
    {
    	//return cmd_aduty(playerid);
    	switch(listitem) 
    	{
			case 0:
			{
				SendClientMessage(playerid, COLOR_RED, "* User tersebut sepertinya menyerang karena sudah tidak tahan dengan stuck yang lama.");
				GivePlayerMoney(playerid, -100);
				//return cmd_kegunung(playerid);
			} 
			case 1:
			{
				SendClientMessage(playerid, COLOR_RED, "* Wirko nampak berhasil melakukan cheat uang di database");
				//return cmd_dr(playerid);
			} 
			case 2:
			{
				 SendClientMessage(playerid, COLOR_NORMAL_PLAYER, "* Koplo  menghilangkan jejak dengan menghapus cache miliknya.");
				 // return cmd_rumahsakit(playerid);
			}
			case 3: SendClientMessage(playerid, COLOR_YELLOW, "* COLOR_RED Koplo COLOR_YELLOW kini sedang menguasai database.");
		}

    	if(response) 
    	{
    		SendClientMessage(playerid, COLOR_SPRINGGREEN, "* Uang anda sepertinya harus di perhitungkan.");
    		GivePlayerMoney(playerid, -1000);
    		//ShowPlayerDialog(playerid, BUYTOYSCOP, DIALOG_STYLE_MSGBOX, "Accessories", "Welcome to the law enforcement accessory locker!","Continue", "Cancel");
    	}
    	if(!response) 
    	{
    		SendClientMessage(playerid, COLOR_RED, "* Disarankan untuk mencari peluang menambah saldo anda tahun ini.");
    		GivePlayerMoney(playerid, 1432);
    	}


    	//return cmd_dyoc(playerid);
    }


    //--------------------------------------------------------------------------------------------------------------------------
    if((dialogid == BUYTOYSCOP) && response)
	{
	    new stringg[856];
		for(new x;x<MAX_PLAYERTOYS;x++)
		{
  			new name[24] = "None";

			for(new i;i<sizeof(HoldingObjectsAll);i++)
   			{
				if(HoldingObjectsAll[i][holdingmodelid] == PlayerToyInfo[playerid][x][ptModelID])
    			{
   					format(name, sizeof(name), "%s", HoldingObjectsAll[i][holdingmodelname]);
				}
			}

			format(stringg, sizeof(stringg), "%s(%d) %s (Bone: %s)\n", stringg, x, name, HoldingBones[PlayerToyInfo[playerid][x][ptBone]]);
		}
		ShowPlayerDialog(playerid, BUYTOYSCOP2, DIALOG_STYLE_LIST, "Select a Slot", stringg, "Select", "Cancel");
	}


	if(dialogid == 2) //If Dialog is our register dialog
    {
        if(response) //If they click the button register
        {
            if(!strlen(inputtext) || strlen(inputtext) > 68)  //checks if password is more then 68 characters or nothing.
            {	
            	
                SendClientMessage(playerid, 0xFF0000, "You must insert a password between 1-68 characters!");
                ShowPlayerDialog(playerid, 2, DIALOG_STYLE_PASSWORD, "Register", "This account not registered yet! Please register:", "Register", "");// show the register dialog again.
            }
            else if(strlen(inputtext) > 0 && strlen(inputtext) < 68) // if the password is in between 1 - 68 characters
            {
                new escpass[100];
                mysql_escape_string(inputtext, escpass); // here we escape the data again to avoid any mysql injection,
                //remember to always to do this when SELECT'ing or INSERT'ing any data in the database
                MySQL_Register(playerid, escpass); // Here we are going to another function to register the player.
            }
        }
        if(!response)
        {
            SendClientMessage(playerid, 0xFF0000, "You must register before you can login!");
            ShowPlayerDialog(playerid, 2, DIALOG_STYLE_PASSWORD, "Register", "This account not registered yet! Please register:", "Register", "");// show the register dialog again.
        }
    }


    if(dialogid == DIALOG_GANTINAMA)
    {
    	if(!response) //If they click the cancel button
        {
                SendClientMessage(playerid, COLOR_YELLOW, "Anda membatalkan proses ganti nama."); 
                
        }
        if(response) //If the player clicked login
        {
        	new namalama[100];
		   	format(namalama, 100, "* Anda memiliki nama lama "COL_RED"[ %s ]", pInfo[playerid][Nick]);
		   	SendClientMessage(playerid, -1, namalama);

		   	g_Sql = mysql_connect(SQL_HOST, SQL_USER, SQL_PASS, SQL_DB); // disini portnya tidak di rubah port rubahan
			//g_Sql = MySQL:mysql_connect_file("mysql_setting.ini");

			new passworddariuser[500];
        	format(passworddariuser, 500, "SELECT * FROM `playerdata` WHERE `nick` = '%s' LIMIT 1", pInfo[playerid][Nick]); // now here check the database if the player has given the proper password.HTTP
        	mysql_query(g_Sql, passworddariuser);
        	cache_get_value_int(0, "id", pInfo[playerid][ID]);
			
			mysql_query(g_Sql, "SELECT * FROM `playerdata` ORDER BY `playerdata`.`id` ASC" );

		   	//new perubahan[100];
		   	//format(perubahan, 100, "%s", params[50]);
		   	//SendClientMessage(playerid, -1, perubahan);
			//pInfo[playerid][Nick] = perubahan[99];
			//GetPlayerName(playerid, pInfo[playerid][Nick], 100);



			new Query[500];
		    format(Query, 500, "UPDATE `playerdata` SET `nick` = '%s'  WHERE `id` = '%d' LIMIT 1", inputtext, pInfo[playerid][ID]);
		    new namabaru[200];
		   	format(namabaru, 200, "* Anda sudah berhasil merubah mohon relogin segera karena ganti nama menjadi "COL_RED"[ %s ]", inputtext);
		   	SendClientMessage(playerid, -1, namabaru);

		    mysql_query(g_Sql, Query);
		   	mysql_log( ALL );
		   	
		   	Kick(playerid);

        }
    }





    if(dialogid == 1) //Dialog logindi
    {
    	//ShowPlayerDialog(playerid, 1, DIALOG_STYLE_PASSWORD, "Login","Nama yang tuan pakai sudah terdaftar\n{FF0000} Please enter a password between 0 and 68 characters","Login","Cancel");
        
        if(!response) //If they click the cancel button
        {
                SendClientMessage(playerid, 0xFF0000, "You must login before you spawn!"); //Sends the client a error message
                Kick(playerid); // and kicks him. ( you can change it to show the player the login dialog again by uncommenting the bottem line and commenting this one.
                //ShowPlayerDialog(playerid, 1, DIALOG_STYLE_PASSWORD, "Login", "This account is registered! Please log in:", "Login", "");
        }
        if(response) //If the player clicked login
        {
        	// 



        	TogglePlayerControllable(playerid, 1);
        	//SetCameraBehindPlayer(playerid);
        	//SetPlayerInterior(playerid, 0);
			//SetPlayerVirtualWorld(playerid, 0);
        	//PindahinOrangnya(playerid, 1557.3281,-2260.5244,13.5407);
        	SendClientMessage(playerid, COLOR_SPRINGGREEN, "Sabar ya tuan harap untuk cocokan akun masuk.");
        	new yangdiinput[600];
        	new passworddariuser[500];
        	//format(masukpw, 500, "UPDATE `playerdata` SET `money` = '%s', `password` = '%s' WHERE `playerdata`.`id` = %d;", params, pInfo[playerid][ID] );
    		//mysql_query(g_Sql, masukpw);
        	format(passworddariuser, 500, "SELECT * FROM `playerdata` WHERE `id` = '%d' LIMIT 1", pInfo[playerid][ID]); // now here check the database if the player has given the proper password.HTTP
        	mysql_query(g_Sql, passworddariuser);
        	cache_get_value_int(0, "id", pInfo[playerid][ID]); 
        	mysql_query(g_Sql, passworddariuser);
        	new isipassword[20];
        	cache_get_value_name(0, "password", pInfo[playerid][Sandi],100);
        	new infopw[600];
        	format(infopw, 600, "Password anda : %s",pInfo[playerid][Sandi]);
        	SendClientMessage(playerid, COLOR_SPRINGGREEN, infopw); 
        	//pInfo[playerid][Sandi] = 1234324;
        	//pInfo[playerid][Sandi] = isipassword;
        	format(yangdiinput, 600, "Anda %s selaku kode primary %i mengetik password "COL_RED" [ %s ]"COL_YELLOW" padahal *** %s ***", pInfo[playerid][Nick], pInfo[playerid][ID], inputtext, pInfo[playerid][Sandi]);
        	SendClientMessage(playerid, COLOR_SPRINGGREEN, yangdiinput); 
    		//PindahinOrangnya(playerid, 1557.3281,-2260.5244,13.5407);
    		//SetCameraBehindPlayer(playerid);


    		//new cocokaninput[20];
        	//format(cocokaninput, 20, "%s",inputtext);
        	//SendClientMessage(playerid, COLOR_SPRINGGREEN, cocokaninput); 

        	//SetPlayerCameraPos(playerid, Float:1494.7446, Float:-2293.4832, Float:18.2991);
        	//SetPlayerCameraLookAt(playerid, 1557.3281,-2260.5244,13.5407);
        	
        	
			InterpolateCameraPos(playerid, Float:1494.7446, Float:-2293.4832, Float:18.2991, Float:1544.4404, Float:-2281.2668, Float:13.3828, 12000, CAMERA_MOVE);
			InterpolateCameraLookAt(playerid, Float:1494.7446, Float:-2293.4832, Float:18.2991, Float:1544.4404, Float:-2281.2668, Float:13.3828, 12000, CAMERA_MOVE);
	
			//strcmp(const string1[], const string2[], bool:ignorecase=false, length=cellmax)
        	if(strcmp(inputtext, pInfo[playerid][Sandi], true))	
        	{
    
        		SendClientMessage(playerid, COLOR_RED, "[LOGIN] *Anda sedang salah password");
        		//SetPlayerInterior(playerid, 0);
        		
				//SetPlayerVirtualWorld(playerid, 0);
        		//SetPlayerSkin(playerid, 187);
        		//TogglePlayerControllable(playerid, 1);

        		// dialog yang hilangkan karena textdraw
        		//ShowPlayerDialog(playerid, 1, DIALOG_STYLE_PASSWORD, "Login","Nama yang tuan pakai sudah terdaftar\n{FF0000} Please enter a password between 0 and 68 characters","Login","Cancel");
        		//return cmd_kill(playerid);

        	}
        	else
        	{
        		
        		TextDrawHideForPlayer(playerid, Text:TeksSaatLogin);
        		// khusus saat cocokkan password login
        		SendClientMessage(playerid, COLOR_AQUA, "[LOGIN] : Selamat anda sudah berhasil login dan data sudah cocok");
        		new tekslogininformasi[200];
        		
        		format(tekslogininformasi, 200,"* "COL_RED"%s "COL_YELLOW"telah login ke server ber IP %s dan beruang"COL_GREEN" %i Rupiah.",
        		pInfo[playerid][Nick], pInfo[playerid][IP], pInfo[playerid][pMoney]);
        		SendClientMessageToAll(COLOR_YELLOW, tekslogininformasi);

			    new infolokasispawn[500];
			    format(infolokasispawn, 500, "Selamat anda spawn di %f, %f, %f semoga anda terhibur di word %d dan interior %d", pInfo[playerid][pPx], pInfo[playerid][pPy], pInfo[playerid][pPz], pInfo[playerid][pWord], pInfo[playerid][pInterior]);
        		SendClientMessage(playerid, COLOR_YELLOW, infolokasispawn);
        		

        		



				SetPlayerInterior(playerid, 0);
				SetPlayerVirtualWorld(playerid, 0);
        		SetSpawnInfo(0, 0, 0, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 0, 0);
        		TogglePlayerControllable(playerid, 1);
				TogglePlayerSpectating(playerid, 0);
				
				
				StatusBaruLogin[playerid] = 1;
				
				cmd_rumahsakit(playerid);
				pInfo[playerid][Logged] = 1;
				 // situasi ketika player sudah konek jadi login
				cmd_rumahsakit(playerid);
				return cmd_spawn(playerid);
				if(!PLAYER_STATE_SPAWNED)
				{
					OnPlayerConnect(playerid);
					return 1;
				}
				
        	}	

            if(!strlen(inputtext) || strlen(inputtext) > 68)  //if the password is not 1 to 100 characters
            {

                SendClientMessage(playerid, 0xFF0000, "You must insert a password between 1-68 characters!"); //Sends the client a error message
                ShowPlayerDialog(playerid, 1, DIALOG_STYLE_PASSWORD, "Login","Your user is registered! Please login with your password below!\n{FF0000} Please enter a password between 0 and 68 characters","Login","Cancel");
               
				//SetCameraBehindPlayer(playerid);
				TogglePlayerControllable(playerid, 1);
				SetPlayerSkin(playerid, 187);
				
                return 1;

            }
            //SetCameraBehindPlayer(playerid);
            /*
            mysql_escape_string(inputtext, inputtext); //Here we escape the inputtext to avoid SQL injections as stated above.
            mysql_escape_string(pInfo[playerid][Nick], pInfo[playerid][Nick]); // escapeing ^^
            new Query[500];
            format(Query, 500, "SELECT * FROM `playerdata` WHERE `nick` COLLATE latin1_general_cs = '%s' AND `password` = '%d'", pInfo[playerid][Nick], udb_hash(inputtext)); // now here check the database if the player has given the proper password.HTTP
            mysql_query(g_Sql, Query);
            cache_get_result_count();
			*/

            /*
            if(cache_num_rows() > 0) 
            { // if the password the player provided is correct and matches the database
            	SendClientMessage(playerid, COLOR_GREEN, "salah sasaran");

            	
            	ShowPlayerDialog(playerid, 1, DIALOG_STYLE_PASSWORD, "Login","Nama yang tuan pakai sudah terdaftar\n{FF0000} Please enter a password between 0 and 68 characters","Login","Cancel");

            	new passworddariuser[500];
            	format(passworddariuser, 500, "SELECT * FROM `playerdata` WHERE `nick` COLLATE latin1_general_cs = '%s'", pInfo[playerid][Nick]); // now here check the database if the player has given the proper password.HTTP
            	mysql_query(g_Sql, passworddariuser);

            	cache_get_value_name(0, "password", pInfo[playerid][Sandi]);
            	
            	if(inputtext[100] == pInfo[playerid][Sandi])	// khusus cocokkan password login
            	{
            		SendClientMessage(playerid, COLOR_GREEN, "login sudah cocok");
            	}

            	if(inputtext[100] != pInfo[playerid][Sandi])
            	{
            		SendClientMessage(playerid, COLOR_GREEN, "salah password");
            	}	
            	
            	format(Query, sizeof(Query), "SELECT * FROM `playerdata` WHERE `nick` COLLATE latin1_general_cs = '%s' LIMIT 1", pInfo[playerid][Nick]);
			    mysql_query(g_Sql, Query);
			    // here we select all of the user's data in the database and store it
			    cache_get_result_count(g_Sql, Query);
			    
		        mysql_escape_string("id", pInfo[playerid][ID]);
		        // the special identifier of a user called "id"
		        orm_load( pInfo[playerid][pAdmin],"admin");
		        cache_get_value_int(0, "admin", pInfo[playerid][pAdmin]);
		        // the admin level of the player
		        orm_load( pInfo[playerid][pScore], "score"); SetPlayerScore(playerid, pInfo[playerid][pScore]);
		        // here we fetch the score and save it to the enum and also save it to the server by using setplayerscore
		        orm_load( pInfo[playerid][pMoney], "money"); GivePlayerMoney(playerid, pInfo[playerid][pMoney]);
		        // here we fetch the score and save it to the enum and also save it to the server by using setplayerscore
		       	orm_load(pInfo[playerid][pKills], "kills");
		        // the amount of kills a player has
		        orm_load(pInfo[playerid][pDeaths], "deaths");
		               // MySQL_Login(playerid); // we will call this function and log the player in.

				*/
				/*

            } 
            else 
            {
                //other wise this means that the password that the player
                //typed was incorrect and we will resend the dialog.
                //ShowPlayerDialog(playerid, 1, DIALOG_STYLE_PASSWORD, "Login","Your user is registered! Please login with your password below!\n The password you typed was incorrect!","Login","Cancel"); //Shows our login dialog again.
            	SendClientMessage(playerid, COLOR_GREEN, "kena bagian else");
            	
            	
            	new Query[500];
                format(Query, sizeof(Query), "SELECT * FROM `playerdata` WHERE `nick` COLLATE latin1_general_cs = '%s' LIMIT 1", pInfo[playerid][Nick]);
			    mysql_query(g_Sql, Query);
			    // here we select all of the user's data in the database and store it
			    cache_get_result_count(g_Sql, Query);
			    
		        mysql_escape_string("id", pInfo[playerid][ID]);
		        // the special identifier of a user called "id"
		        orm_load( pInfo[playerid][pAdmin],"admin");
		        cache_get_value_int(0, "admin", pInfo[playerid][pAdmin]);
		        // the admin level of the player
		        orm_load( pInfo[playerid][pScore], "score"); SetPlayerScore(playerid, pInfo[playerid][pScore]);
		        // here we fetch the score and save it to the enum and also save it to the server by using setplayerscore

		        // here we fetch the score and save it to the enum and also save it to the server by using setplayerscore
		       	orm_load(pInfo[playerid][pKills], "kills");
		        // the amount of kills a player has
		        orm_load(pInfo[playerid][pDeaths], "deaths");

		       

            }
            */

            //cache_get_row_count(); //Remember to always free a result if you stored one!
            
        }
    }

	if(!IsPlayerAdmin(playerid)) return 0; // this is an admin only script

	if(dialogid == 0) { // Our example msgbox
		if(response) {
		    SendClientMessage(playerid,0xFFFFFFFF,"You selected OK");
		} else {
		    SendClientMessage(playerid,0xFFFFFFFF,"You selected Cancel");
		}
		return 1; // we processed this. no need for other filterscripts to process it.
	}

	if(dialogid == 12) { // Our example inputbox
		if(response) {
			
			format(message, 256, "You replied: %s", inputtext);
		    SendClientMessage(playerid, 0xFFFFFFFF, message);
		} else {
		    SendClientMessage(playerid, 0xFFFFFFFF, "You selected Cancel");
		}
		return 1; // we processed it.
	}

	if(dialogid == 2)
	{ // Our example listbox
		if(response) {
			
			format(message, 256, "You selected item %d:", listitem);
		    SendClientMessage(playerid, 0xFFFFFFFF, message);
		    SendClientMessage(playerid, 0xFFFFFFFF, inputtext);
		} else {
		    SendClientMessage(playerid, 0xFFFFFFFF, "You selected Cancel");
		}
		return 1; // we processed it.
	}


	if(dialogid == RESPONDDIALOGKOSONG) //If Dialog is our register dialog
    {

    }
	//----------------------------------
    
    return 0;
}

//------------------------------------------------
public OnPlayerEditAttachedObject( playerid, response, index, modelid, boneid,
                                   Float:fOffsetX, Float:fOffsetY, Float:fOffsetZ,
                                   Float:fRotX, Float:fRotY, Float:fRotZ,
                                   Float:fScaleX, Float:fScaleY, Float:fScaleZ )
{
    new debug_string[256+1];
	format(debug_string,256,"SetPlayerAttachedObject(playerid,%d,%d,%d,%f,%f,%f,%f,%f,%f,%f,%f,%f)",
           index,modelid,boneid,fOffsetX,fOffsetY,fOffsetZ,fRotX,fRotY,fRotZ,fScaleX,fScaleY,fScaleZ);

	print(debug_string);
    SendClientMessage(playerid, 0xFFFFFFFF, debug_string);

    SetPlayerAttachedObject(playerid,index,modelid,boneid,fOffsetX,fOffsetY,fOffsetZ,fRotX,fRotY,fRotZ,fScaleX,fScaleY,fScaleZ);
    SendClientMessage(playerid, 0xFFFFFFFF, "You finished editing an attached object DYOC");

    return 1;
}


//------------------------------------------------


public TimedVehicleDeath()
{
	if(vehicleid_tokill > 0) {
	    DestroyVehicle(vehicleid_tokill);
	}
}

//-------------------------------------------------

public UpdateTextTimer()
{
	new textdisp[256+1];
	format(textdisp,256,"Dynamic Update (%d)", text_counter);
	text_counter++;

	SetPlayerObjectMaterialText(text_update_player, test_tex_objects[0], textdisp, 0, OBJECT_MATERIAL_SIZE_512x128, "Courier New", 48, 1, 0xFF000000, 0, 0);
}

//-------------------------------------------------




//-------------------------------------------

forward KickPublic(playerid);
public KickPublic(playerid) { Kick(playerid); }

//-------------------------------------------

KickWithMessage(playerid, message[])
{
	SendClientMessage(playerid, 0xFF4444FF, message);
	SetTimerEx("KickPublic", 1000, 0, "d", playerid);
}

//-------------------------------------------

public OnPlayerClickTextDraw(playerid, Text:clickedid)
{
	new msg[256+1];
	format(msg,sizeof(msg),"(TextDraw) You selected: %d", int:clickedid);
	SendClientMessage(playerid, 0xFFFFFFFF, msg);

	if(clickedid == TeksSaatLogin)
	{
		// fungsi bisa langsung masuk kedalam server tanpa password.

		CancelSelectTextDraw(playerid);
		TextDrawHideForPlayer(playerid, Text:TeksSaatLogin);
		// khusus saat cocokkan password login
		SendClientMessage(playerid, COLOR_AQUA, "[LOGIN] : Selamat anda sudah berhasil login dan data sudah cocok");
		new tekslogininformasi[200];
		
		if(OnDuty[playerid] == 1)
		{
			format(tekslogininformasi, 200,"* "COL_RED"%s "COL_YELLOW"telah login ke server ber IP %s dan beruang"COL_GREEN" %i Rupiah.",
			pInfo[playerid][Nick], pInfo[playerid][IP], pInfo[playerid][pMoney]);

			SendClientMessageToAll(COLOR_YELLOW, tekslogininformasi);

		}
		

	    new infolokasispawn[500];
	    format(infolokasispawn, 500, "Selamat anda spawn di %f, %f, %f semoga anda terhibur di word %d dan interior %d", pInfo[playerid][pPx], pInfo[playerid][pPy], pInfo[playerid][pPz], pInfo[playerid][pWord], pInfo[playerid][pInterior]);
		SendClientMessage(playerid, COLOR_YELLOW, infolokasispawn);
		

		



		SetPlayerInterior(playerid, 0);
		SetPlayerVirtualWorld(playerid, 0);
		SetSpawnInfo(0, 0, 0, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 0, 0);
		TogglePlayerControllable(playerid, 1);
		TogglePlayerSpectating(playerid, 0);
		
		
		StatusBaruLogin[playerid] = 1;
		
		cmd_rumahsakit(playerid);
		pInfo[playerid][Logged] = 1;
		 // situasi ketika player sudah konek jadi login
		return cmd_spawn(playerid);
		if(!PLAYER_STATE_SPAWNED)
		{
			OnPlayerConnect(playerid);
			return 1;
		}
	}
}

//-------------------------------------------

public OnPlayerClickPlayerTextDraw(playerid, PlayerText:playertextid)
{
	new msg[256+1];
	format(msg,sizeof(msg),"(PlayerTextDraw) You selected: %d", int:playertextid);
	SendClientMessage(playerid, 0xFFFFFFFF, msg);

}

//-------------------------------------------
// Sends a list of all PVars to the player as
// client messages.

SendPVarListToPlayer(playerid)
{	
    new ubound = GetPVarsUpperIndex(playerid);
	new x=0;
	new name[40+1];
	new line[128+1];

    SendClientMessage(playerid,0xF000F0F0, "---Player Vars List---");
	while(x != ubound) {
		if(GetPVarNameAtIndex(playerid,x,name,40)) {
			if(Util_GetPVarEntryAsString(playerid,name,line,128)) {
                 SendClientMessage(playerid,0xFFFFFFFF,line);
			}
		}
		x++;
	}
}

//-------------------------------------------
// return PVar entry as 'name'='value' string

stock Util_GetPVarEntryAsString(playerid, name[], ret[], len)
{
	new Float:fValue;
	new iValue;
	new szStrValue[1024+1]; // this might require greater size if you store large strings in PVars
	new type;
    ret[0] = EOS;

  	type = GetPVarType(playerid, name);
	if(type != PLAYER_VARTYPE_NONE) {
		switch(type)
		{
			case PLAYER_VARTYPE_STRING:
			{
				GetPVarString(playerid,name,szStrValue,1024);
				format(ret,len,"%s=%s",name,szStrValue);
			}
			case PLAYER_VARTYPE_INT:
			{
				iValue = GetPVarInt(playerid,name);
				format(ret,len,"%s=%d",name,iValue);
			}
			case PLAYER_VARTYPE_FLOAT:
			{
			    fValue = GetPVarFloat(playerid,name);
				format(ret,len,"%s=%f",name,fValue);
			}
		}
		return 1;
	}
	return 0;
}

//-------------------------------------------
// Fills the provided string with all the player's PVars
// seperated by the specified 'delimiter'

stock Util_CreatePVarList(playerid, retstr[], len, delimiter[])
{
	if(!IsPlayerConnected(playerid)) return 0;

	new x=0;
	new remaining_string=len;
	new line[2048+1];
	new name[40+1];
	retstr[0] = EOS;

	new ubound = GetPVarsUpperIndex(playerid);

	while(x != ubound) {
		if(GetPVarNameAtIndex(playerid,x,name,40)) {
			if(Util_GetPVarEntryAsString(playerid,name,line,2048)) {
				// if there is enough space, concat this line to the return string
				if(remaining_string > (strlen(line) + strlen(delimiter))) {
			    	strcat(retstr,line);
			    	strcat(retstr,delimiter);
					remaining_string -= (strlen(line) + strlen(delimiter));
				}
			}
		}
		x++;
	}

	return 1;
}

//-------------------------------------------
// Test reapplying vehicle mods on respawn

public OnVehicleSpawn(vehicleid)
{
	if(vehicleid == savanna) {
	    AddVehicleComponent(savanna,1189); //Front Bumper
		AddVehicleComponent(savanna,1187); //Rear Bumper
		AddVehicleComponent(savanna,1129); //Exhaust
		AddVehicleComponent(savanna,1102); //Left Side Skirt
		AddVehicleComponent(savanna,1133); //Right Side Skirt
		AddVehicleComponent(savanna,1078); //Wheels
		AddVehicleComponent(savanna,1010); //Nitro 10x
		AddVehicleComponent(savanna,1087); //Hydraulics
	}
	else if(vehicleid == blade) {
	    AddVehicleComponent(blade,1182); //Front Bumper
		AddVehicleComponent(blade,1184); //Rear Bumper
		AddVehicleComponent(blade,1104); //Exhaust
		AddVehicleComponent(blade,1108); //Left Side Skirt
		AddVehicleComponent(blade,1107); //Right Side Skirt
		AddVehicleComponent(blade,1078); //Wheels
		AddVehicleComponent(blade,1010); //Nitro 10x
		AddVehicleComponent(blade,1087); //Hydraulics
	}
}

//-------------------------------------------
// Example of handling dialog responses.


//-------------------------------------------
// Example of handling scoreboard click.

public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	new message[526+1];

	if(!IsPlayerAdmin(playerid)) return 0; // this is an admin only script

    
	format(message, 256, "You clicked on player %d", clickedplayerid);
	SendClientMessage(playerid, 0xFFFFFFFF, message);
	return 1;
}

//-------------------------------------------

public OnPlayerClickMap(playerid, Float:fX, Float:fY, Float:fZ)
{
 	new message[526+1];
	format(message, 256, "Tuan berhasil pindah ke peta ini : %f %f %f", fX, fY, fZ);
	SendClientMessage(playerid, 0xFFFFFFFF, message);
	SetPlayerPos(playerid, fX, fY, fZ);
	SetVehiclePos(GetPlayerVehicleID(playerid), fX, fY, fZ);
	PutPlayerInVehicle(playerid,GetPlayerVehicleID(playerid),0);
}

//-------------------------------------------
/*
public OnPlayerEditAttachedObject( playerid, response, index, modelid, boneid,
								   Float:fOffsetX, Float:fOffsetY, Float:fOffsetZ,
								   Float:fRotX, Float:fRotY, Float:fRotZ,
  								   Float:fScaleX, Float:fScaleY, Float:fScaleZ )
{
	SendClientMessage(playerid, 0xFFFFFFFF, "You finished editing an attached object");
	SetPlayerAttachedObject(playerid,index,modelid,boneid,fOffsetX,fOffsetY,fOffsetZ,fRotX,fRotY,fRotZ,fScaleX,fScaleY,fScaleZ);
	return 1;
}*/

//-------------------------------------------
	
public OnPlayerEditDynamicObject(playerid, STREAMER_TAG_OBJECT:objectid, response, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz)
//public OnPlayerEditDynamicObject(playerid, STREAMER_TAG_OBJECT:objectid, response, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz);
{

	//SendClientMessage(playerid, COLOR_RED, "Anda Sedang Mengedit DynamicObject.");
	if(response == EDIT_RESPONSE_UPDATE)
	{
	    SetDynamicObjectPos(objectid, x, y, z);
		SetDynamicObjectRot(objectid, rx, ry, rz);

		//SendClientMessage(playerid, COLOR_RED, "Anda Sedang Update DynamicObject.");
	}
	else if(response == EDIT_RESPONSE_CANCEL)
	{
	    SendClientMessage(playerid, COLOR_RED, "Anda Sedang Cancel DynamicObject.");
	}
	else if(response == EDIT_RESPONSE_FINAL)
	{


		SetDynamicObjectPos(objectid, x, y, z);
		SetDynamicObjectRot(objectid, rx, ry, rz);
		SendClientMessage(playerid, COLOR_RED, "Anda Selesai Mengedit DynamicObject.");
		new lokasidynamicobject[100];
		format(lokasidynamicobject, sizeof(lokasidynamicobject), 
		"ID di gamemode %i, Kordinat %f, %f, %f, %f, %f, %f)",
		objectid, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz);
 		SendClientMessage(playerid, COLOR_RED, lokasidynamicobject);
 		SelectObject(playerid);
	}

	return 1;
}

/*

public OnPlayerSelectDynamicObject(playerid, STREAMER_TAG_OBJECT objectid, modelid,
 Float:x, Float:y, Float:z)
{
	
	EditDynamicObject(playerid, objectid);
	
	SendClientMessage(playerid, COLOR_RED, "Anda Telah Select Jenis Dynamic Object.");
	return 1;
}

*/
public OnPlayerEditObject( playerid, playerobject, objectid, response,
Float:fX, Float:fY, Float:fZ, Float:fRotX, Float:fRotY, Float:fRotZ )
{
	if(!playerobject) {
	    if(!IsValidObject(objectid)) return;
		MoveObject(objectid, fX, fY, fZ, 10.0, fRotX, fRotY, fRotZ);
	} else {
	    if(!IsValidPlayerObject(playerid, objectid)) return;
	    MovePlayerObject(playerid, objectid, fX, fY, fZ, 10.0, fRotX, fRotY, fRotZ);
	}

	if(response == EDIT_RESPONSE_FINAL || response == EDIT_RESPONSE_CANCEL) {
	    // put them back in selection mode after they click save
	    SelectObject(playerid);
	    new message[250];
	    
        format(message,sizeof(message),"(Edit Object) Anda memilih baris program : %d ID publik nya adalah: %d Pos: %.4f,%.4f,%.4f Dan rotasi di %.4f,%.4f,%.4f", playerobject, objectid, Float:fX, Float:fY, Float:fZ, Float:fRotX, Float:fRotY, Float:fRotZ);
        SendClientMessage(playerid, 0xFFFFFFFF, message);
	}
}




//-------------------------------------------

public OnPlayerSelectObject(playerid, type, objectid, modelid, Float:fX, Float:fY, Float:fZ)
{
    new message[526+1];

    if(type == SELECT_OBJECT_GLOBAL_OBJECT) {
        if(!IsValidObject(objectid)) return 0;
        format(message,sizeof(message),"(Player Object) Anda memilih baris program : %d modelID nya adalah: %dPos: %.4f,%.4f,%.4f", objectid, modelid, fX, fY, fZ);
        SendClientMessage(playerid, 0xFFFFFFFF, message);
        EditObject(playerid, objectid);
        return 1;
	}

	if(type == SELECT_OBJECT_PLAYER_OBJECT) {
        if(!IsValidPlayerObject(playerid, objectid)) return 0;
        format(message,sizeof(message),"(Player Object) Anda memilih baris proggram : %d modelID nya adalah: %dPos: %.4f,%.4f,%.4f", objectid, modelid, fX, fY, fZ);
        SendClientMessage(playerid, 0xFFFFFFFF, message);
        EditPlayerObject(playerid, objectid);
        return 1;
	}
	// bagian select object
	EditObject(playerid, objectid);

	return 1;
}

//-------------------------------------------

public OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ)
{
	new message[526+1];
    
    new weaponname[64+1];
	new File:file = fopen("playershots.txt",io_append);

	GetWeaponName(weaponid, weaponname, 64);

	if(hittype == BULLET_HIT_TYPE_PLAYER) {
		format(message,256,"Shooter(%d) hit Player(%d) PlayerAnim: %d Using: %s [%.2f, %.2f, %.2f]\r\n", playerid, hitid,
			   GetPlayerAnimationIndex(hitid), weaponname, fX, fY, fZ);
	}
	else if(hittype == BULLET_HIT_TYPE_VEHICLE) {
	    format(message,256,"Shooter(%d) hit Vehicle(%d) Using: %s [%.2f, %.2f, %.2f]\r\n",playerid, hitid, weaponname, fX, fY, fZ);
	}
	else if(hittype == BULLET_HIT_TYPE_NONE) {
	    format(message,256,"Shooter(%d) hit World Using: %s [%.2f, %.2f, %.2f]\r\n",playerid,weaponname,fX,fY,fZ);
	}
	else {
	    format(message,256,"Shooter(%d) hit Object(%d) Using: %s [%.2f, %.2f, %.2f]\r\n",playerid, hitid, weaponname, fX, fY, fZ);
	}

	fwrite(file, message);
	fclose(file);

	//new LastVectors[128+1];
	//new Float:OriginX, Float:OriginY, Float:OriginZ;
	//new Float:HitX, Float:HitY, Float:HitZ;
	//GetPlayerLastShotVectors(playerid, OriginX, OriginY, OriginZ, HitX, HitY, HitZ);
	//format(LastVectors, 128, "Last Vectors: [%.2f, %.2f, %.2f] [%.2f, %.2f, %.2f]", OriginX, OriginY, OriginZ, HitX, HitY, HitZ);
	//SendClientMessage(playerid, 0xFFFFFFFF, LastVectors);

	SendClientMessage(playerid, 0xFFFFFFFF, message);
 	return 1;
}

//-------------------------------------------
/*
new LastShotTime = 0;
new LastShotWeapon = 0;

public OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ)
{
	

	if(!LastShotTime) {
	    LastShotTime = GetTickCount();
	    return 1;
	}

	if(weaponid == LastShotWeapon) {
		 format(message, 128, "WeaponId: %d LastShotDelta: %d", weaponid, GetTickCount() - LastShotTime);
		 SendClientMessage(playerid, 0xFFFFFFFF, message);
	     printf("%s", message);
	}

	LastShotWeapon = weaponid;
	LastShotTime = GetTickCount();

 	return 1;
}*/

//-------------------------------------------
// Example of TakeDamage
/*
public OnPlayerTakeDamage(playerid, issuerid, Float:amount, weaponid, bodypart)
{
	new File:file = fopen("playershots.txt",io_append);
 	
 	new weapname[64+1];

	if(issuerid != INVALID_PLAYER_ID) {
	    GetWeaponName(weaponid, weapname, 64);
		format(message, 256, "PlayerTakeDamage(%d) from Player(%d) (%f) weapon: (%s) bodypart: %d\r\n", playerid, issuerid, amount, weapname, bodypart);
		SendClientMessageToAll(0xFFFFFFFF, message);
	}
	else {
		format(message, 256, "PlayerTakeDamage(%d) (%f) from: %d\r\n", playerid, amount, weaponid);
		SendClientMessageToAll(0xFFFFFFFF, message);
	}

	fwrite(file, message);
	fclose(file);
}*/

//-------------------------------------------
// Example of GiveDamage
/*
public OnPlayerGiveDamage(playerid, damagedid, Float:amount, weaponid, bodypart)
{
	new File:file = fopen("playershots.txt",io_append);
 	
 	new weapname[64+1];

    GetWeaponName(weaponid, weapname, 64);
	format(message, 256, "PlayerGiveDamage(%d) to Player(%d) (%f) weapon: (%s) bodypart: %d\r\n", playerid, damagedid, amount, weapname, bodypart);

	fwrite(file, message);
	fclose(file);
	SendClientMessageToAll(0xFFFFFFFF, message);
}*/


//-------------------------------------------

/*
public OnPlayerGiveDamageActor(playerid, damaged_actorid, Float:amount, weaponid, bodypart)
{
    new message[526+1];
    new weapname[64+1];

    GetWeaponName(weaponid, weapname, 64);
    format(message, 256, "PlayerGiveDamageActor(%d) to Actor(%d) (%f) weapon: (%s) bodypart: %d\r\n", playerid, damaged_actorid, amount, weapname, bodypart);
    SendClientMessageToAll(0xFFFFFFFF, message);

	/*
	if(IsValidActor(damaged_actorid)) {
	    new Float:fActorHealth;
	    GetActorHealth(damaged_actorid, fActorHealth);
	    fActorHealth -= amount;
		if(fActorHealth < 0.0) fActorHealth = 0.0;
		SetActorHealth(damaged_actorid, fActorHealth);
	}
	
	if(damaged_actorid == susterdiresepsionis)
	{
		cmd_belisenjata(playerid);
	}


	return 1;
}

*/

public OnPlayerGiveDamageDynamicActor(playerid, STREAMER_TAG_ACTOR:actorid, Float:amount, weaponid, bodypart)
{
	new message[526+1];
    new weapname[64+1];

    GetWeaponName(weaponid, weapname, 64);
    format(message, 256, "PlayerGiveDamageActor(%d) to Actor(%d) (%f) weapon: (%s) bodypart: %d\r\n", playerid, actorid, amount, weapname, bodypart);
    SendClientMessageToAll(0xFFFFFFFF, message);

	/*
	if(IsValidActor(damaged_actorid)) {
	    new Float:fActorHealth;
	    GetActorHealth(damaged_actorid, fActorHealth);
	    fActorHealth -= amount;
		if(fActorHealth < 0.0) fActorHealth = 0.0;
		SetActorHealth(damaged_actorid, fActorHealth);
	}
	*/
	if(actorid == susterdiresepsionis)
	{
		cmd_belisenjata(playerid);
	}
}
//-------------------------------------------

/*
public OnPlayerDeath(playerid, killerid, reason)
{
    SendDeathMessage(killerid, playerid, reason);
    return 1;
}*/

//-------------------------------------------
/*
public OnEnterExitModShop(playerid, enterexit, interiorid)
{
    
    if(enterexit) {
		format(message, 256, "You entered modshop at interior %d", interiorid);
		SendClientMessage(playerid, 0xFFFFFFFF, message);
	} else {
	   	format(message, 256, "You exited the modshop");
		SendClientMessage(playerid, 0xFFFFFFFF, message);
	}
	return 1;
}
*/
//-------------------------------------------

public PlayerAnimJadiSekarat(playerid)
{
	
	ApplyAnimation(playerid, "SWEET", "Sweet_injuredloop", 4.0, 0, 0, 0, 0, 0, 0);
	
	//SetTimer("HilangkanLayarWarnaHitam", 500, 0);
	return 1;
}


public HilangkanLayarWarnaHitam(playerid)
{
	//TextDrawBoxColor(LayarJadiMerah, 0xFF000055);
	TextDrawHideForPlayer(playerid, Text:LayarJadiMerah);
	TextDrawBoxColor(LayarJadiMerah, 0xFF000011);
	new Float:HP;
    GetPlayerHealth(playerid, Float:HP);
	SetPlayerHealth(playerid, Float:HP-5);
	SetPlayerDrunkLevel(playerid, 0);
	//SetTimer("HilangkanLayarWarnaHitam", 500, 0);
	return 1;
}

public MunculLayarHitamSebentar(playerid)
{
	
	TextDrawBoxColor(LayarJadiMerah, 0x000000FF);
	TextDrawShowForPlayer(playerid, Text:LayarJadiMerah);
	
	SetTimer("HilangkanLayarWarnaHitam", 300, 0);
	return 1;
}

public HilangkanLayarWarnaMerah(playerid)
{
	
	
	TextDrawHideForPlayer(playerid, Text:LayarJadiMerah);
	//RemovePlayerFromVehicle(playerid);
	SetTimer("PlayerAnimJadiSekarat", 1000, 0);
	
	SetTimer("MunculLayarHitamSebentar", 2000, 0);
	return 1;
}


public OnVehicleDamageStatusUpdate(vehicleid, playerid)
{
	new panel, doors, lights, tires;
	new update_msg[128+1];

	//if(!IsPlayerAdmin(playerid)) return 0;
	new Float:Mesinmobil;
	
	GetVehicleHealth(vehicleid, Mesinmobil);
	GetVehicleDamageStatus(vehicleid,panel,doors,lights,tires);

	format(update_msg,128,"* Nilai Kendaraan mengalami lecet VehicleDamage[IDmobil:%d Panel depan:%x Pintu:%x Lampu:%x Rodanya:%x]",vehicleid,panel,doors,lights,tires);
	
	SendClientMessage(playerid,0xFFFFFFFF,update_msg);

	// rubah warna layar jadi merah saat tabrakan
	TextDrawShowForPlayer(playerid, Text:LayarJadiMerah);
	SetPlayerDrunkLevel(playerid, 99999);
	SetTimer("HilangkanLayarWarnaMerah", 2000, 0);
	
	//sistem fix mobil otomatatis
	/*
	if(Mesinmobil < 800.0)
	{
		/*
		new vid = GetPlayerVehicleID(playerid);
	    if (vid) RepairVehicle(vid);
		//new uangmekanik = GivePlayerMoney(playerid, -76);
		PlayerPlaySound(playerid, 1083, 0.0, 0.0, 10.0);
		GameTextForPlayer(playerid, "~w~Biaya fix mesin tersebut~n~~r~-$76", 1000, 3);
		new String[140];
		format(String, 140, "* Kendaraan telah di perbaiki oleh mechanic dan di bayar $75 oleh "COL_GREEN"%s"COL_MAGENTA". ((Mechanic 111))",  GetRPName(playerid));
		SendClientMessage(playerid, COLOR_ME, String);
		
		return cmd_fix(playerid);
	}
	*/

	return 1;
}

//-------------------------------------------

/*
public OnUnoccupiedVehicleUpdate(vehicleid, playerid, passenger_seat, Float:new_x, Float:new_y, Float:new_z)
{
    new update_msg[128+1];
    new Float:X, Float:Y, Float:Z;

    //if(!IsPlayerAdmin(playerid)) return 0;

    GetVehiclePos(vehicleid, X, Y, Z);

    format(update_msg,128,"NoDriverVehicleUpdate(playerid=%d vehicle=%d passenger=%d cur_pos: %.2f %.2f %.2f new_pos: %.2f %.2f %.2f)",
		playerid, vehicleid, passenger_seat, X, Y, Z, new_x, new_y, new_z);

	SendClientMessageToAll(0xFFFFFFFF,update_msg);

	return 1;
}*/

//-------------------------------------------

public OnFilterScriptInit()
{
   	
    return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{

	// fungsi untuk hilangkan limit speed saat user keluar dari kendaraaan.
	KillTimer(AktifkanLimitSpeed[playerid]);

	TextDrawHideForPlayer(playerid, Text:panelkecepatankendaraan);
	//DestroyVehicle(GetPlayerVehicleID(playerid)); 
	if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 521)
	{
		
	}
	if(IsPlayerInVehicle(playerid, MobilSweeperBandara))
	{
		RemovePlayerFromVehicle(playerid);
		SetVehicleToRespawn(MobilSweeperBandara);
	}

	
	return 1;
	
}





public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	
	TextDrawShowForPlayer(playerid, Text:panelkecepatankendaraan);
	
	if(IsPlayerInVehicle(playerid, MobilKerjaHauling))
    {
    	
    	SendClientMessage(playerid, COLOR_AQUAGREEN, "Manager Hauler : Mohong untuk diingat. Ketik /kerja untuk mulai kontrak pengiriman paket barang melalui anda.");
    	cmd_kerja(playerid);
    }


	if(IsPlayerInVehicle(playerid, MobilSweeperBandara))
    {
    	SendClientMessage(playerid, COLOR_AQUAGREEN, "Manager Sweeper : Ketik /kerja untuk mulai sidejob sweeper anda.");
    }
    
	if(! ispassenger)
	{
		SendClientMessage(playerid, COLOR_ME, "* Anda dapat gunakan mesin dengan menekan tombol N ");
    	GameTextForPlayer(playerid, "~g~Memeriksa bensin...", 1000, 5);
   		//ShowPlayerDialog(playerid,0,DIALOG_STYLE_MSGBOX,"INFO : Kemudi mobil","Tekan ALT kiri + N\n\nUntuk Nyalakan Mesin dan Lampu","OK","");
		
		
		new string[140];
		format(string, sizeof(string), "* %s masuk kedalam mobil dan siap untuk mengemudi dengan kedua tangannya.", GetRPName(playerid));
		//SendClientMessage(playerid, COLOR_ME, string);
		LocalMessage(ACTION_DISTANCE, playerid, ACTION_COLOR, string);

		//ProcessActionText(playerid, string);

	    if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 407)
	    {
	        GameTextForPlayer(playerid, "~g~Sedang Mengisi air...", 5000, 5);
			SendClientMessage(playerid, COLOR_RED, "* Cepat masukin perintah /Fireman ");
	    }

	}
	
	
    
    return 0;
}



public OnPlayerEnterCheckpoint(playerid)
{
    if(IsPlayerInCheckpoint(playerid) == LokasiMining)
    {
    	ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.1, 0, 1, 1, 1, 1, 1);
    	new string[140];
		format(string, sizeof(string), "* %s menggali di antara bebatuan dengan menggunakan palu.", GetRPName(playerid));
		LocalMessage(ACTION_DISTANCE, playerid, ACTION_COLOR, string);
		format(string, sizeof(string), "* Terlihat ada bongkahan logam yang siap di tambang. (( %s ))", GetRPName(playerid));
		LocalMessage(ACTION_DISTANCE, playerid, ACTION_COLOR, string);
		RemovePlayerAttachedObject(playerid, 4);
		DisablePlayerCheckpoint(playerid);

	}
	




    if(IsPlayerInVehicle(playerid, MobilKerjaHauling))
    {
    	new ongkos, infogaji[200];
    	if(KerjaHaulingStatus[playerid] == 1)
    	{
    		KerjaHaulingStatus[playerid] = 2;
    		SetPlayerCheckpoint(playerid,1322.1824,-2251.5188,13.9770,5); // cp 2
			ongkos = random(130);
			pInfo[playerid][pMoney] = pInfo[playerid][pMoney]+ongkos;
			ResetPlayerMoney(playerid);
			GivePlayerMoney(playerid, pInfo[playerid][pMoney]);

			
			format(infogaji, sizeof(infogaji), ""COL_LIGHTBLUE"Manager Kargo"COL_GREEN": Anda melewati jalan toll dengan bonus $%i oleh manager untuk membawa paket trailer ke stasiun gas.", ongkos);
			SendClientMessage(playerid,0xFF0000FF, infogaji);

    	}
    	else if(KerjaHaulingStatus[playerid] == 2)// dia baru saja selesai cek point pertama
    	{

    	
    	SetPlayerCheckpoint(playerid,1617.4191,-2130.9641,13.5547,10); // cp 3 kawasan terima kargo belakang gas station
		ongkos = random(100);
		pInfo[playerid][pMoney] = pInfo[playerid][pMoney]+ongkos;
		ResetPlayerMoney(playerid);
		GivePlayerMoney(playerid, pInfo[playerid][pMoney]);

		
		format(infogaji, sizeof(infogaji), ""COL_LIGHTBLUE"Manager Kargo"COL_GREEN": Anda di modali $%i oleh manager untuk membawa paket trailer ke stasiun gas. Bawalah trailer tersebut dengan mobil", ongkos);
		SendClientMessage(playerid,0xFF0000FF, infogaji);
		//KerjaHaulingStatus[playerid] = 0;
		KerjaHaulingStatus[playerid] = 3;

    	}
    	
    	else if(KerjaHaulingStatus[playerid] == 3) // kalau saja dia sudah selesai di cek point yang nomor dua
    	{
    		if(IsTrailerAttachedToVehicle(MobilKerjaHauling))
    		{

    		KerjaHaulingStatus[playerid] = 0;
    		SetPlayerCheckpoint(playerid,1584.7772,-2155.6304,13.8035,8); // cp 4 cek point saat di serahkan di pom bensin
    		RemovePlayerFromVehicle(playerid);
    		
    		ongkos = random(200); // disini ongkos bonus sweeper yang besar yang di acak sekitaran 200 dollar
			pInfo[playerid][pMoney] = pInfo[playerid][pMoney]+ongkos;
			ResetPlayerMoney(playerid);
			GivePlayerMoney(playerid, pInfo[playerid][pMoney]);

			// saat pesawat harus mendarat
			MoveDynamicObject(pesawatbandara, 1475.936889, -2284.978027, 21.027048, Float:4.0);
			
			format(infogaji, sizeof(infogaji), ""COL_LIGHTBLUE"PEKERJAAN"COL_GREEN": Anda di biayai $%i oleh manager hauler.", ongkos);
			SendClientMessage(playerid,0xFF0000FF, infogaji);


			
	        SetVehicleToRespawn(GetPlayerVehicleID(playerid));
			SetVehicleToRespawn(TrailerHaulingDiBandara);
			
			DisablePlayerCheckpoint(playerid);
			PlayerPlaySound(playerid, 1150, 0.0, 0.0, 10.0);
			SendClientMessage(playerid,COLOR_AQUA,"* Anda sekarang pahlawan dari pengiriman paket antar bandara");
    		return 1;
    		}
    		else
    		{
    			SendClientMessage(playerid,COLOR_AQUA,"* Anda tidak membawa paket kiriman kesini? Mohon segera ambil ulang trailer tersebut dengan /kerja.");
    			cmd_kerja(playerid);
    		}

    		
    	}
    }

    if(IsPlayerInVehicle(playerid, MobilSweeperBandara))
    {
    	new ongkos, infogaji[200];
    	// untuk id setiap data variabel yang tersedia di job sweeper bandara
    	if(KerjaSweeperBandara[playerid] == 1) // dia baru saja selesai cek point pertama
    	{
    		KerjaSweeperBandara[playerid] = 2;
    		SetPlayerCheckpoint(playerid,1530.7072,-2283.4131,12.8548,4); // cp 2
    		ongkos = random(100);
			pInfo[playerid][pMoney] = pInfo[playerid][pMoney]+ongkos;
			ResetPlayerMoney(playerid);
			GivePlayerMoney(playerid, pInfo[playerid][pMoney]);

			
			format(infogaji, sizeof(infogaji), ""COL_LIGHTBLUE"PEKERJAAN SWEEPER"COL_GREEN": Anda di biayai $%i oleh manager bandara.", ongkos);
			SendClientMessage(playerid,0xFF0000FF, infogaji);


    	}
    	else if(KerjaSweeperBandara[playerid] == 2) // kalau saja dia sudah selesai di cek point yang nomor dua
    	{
    		KerjaSweeperBandara[playerid] = 3; // selanjutkan kerjakan ke cek point nomor 3

    		SetPlayerCheckpoint(playerid,1518.2854,-2292.3523,12.8550,4); // cp 3
    		ongkos = random(10);
			pInfo[playerid][pMoney] = pInfo[playerid][pMoney]+ongkos;
			ResetPlayerMoney(playerid);
			GivePlayerMoney(playerid, pInfo[playerid][pMoney]);

			
			format(infogaji, sizeof(infogaji), ""COL_LIGHTBLUE"PEKERJAAN"COL_GREEN": Anda di biayai $%i oleh manager bandara.", ongkos);
			SendClientMessage(playerid,0xFF0000FF, infogaji);
			MoveDynamicObject(pesawatbandara, 1632.2781,-2284.4343,108.9864, Float:3.0);
			MoveDynamicObject(balehopesawat, 1440.1274,-2286.6082,13.5468, Float:10.0);
    	}
    	else if(KerjaSweeperBandara[playerid] == 3) // sudah melewati cp 3
    	{
    		KerjaSweeperBandara[playerid] = 4; // harus selesaikan ke cp 4
    		SetPlayerCheckpoint(playerid,1433.9756,-2311.4485,12.8549,4); // cp 4
    		ongkos = random(10);
			pInfo[playerid][pMoney] = pInfo[playerid][pMoney]+ongkos;
			ResetPlayerMoney(playerid);
			GivePlayerMoney(playerid, pInfo[playerid][pMoney]);

			
			format(infogaji, sizeof(infogaji), ""COL_LIGHTBLUE"PEKERJAAN"COL_GREEN": Anda di biayai $%i oleh manager bandara.", ongkos);
			SendClientMessage(playerid,0xFF0000FF, infogaji);
    	}
    	else if(KerjaSweeperBandara[playerid] == 4)
    	{
    		KerjaSweeperBandara[playerid] = 5;
    		SetPlayerCheckpoint(playerid,1469.9279,-2243.2749,12.8553,4); // cp 5
    		ongkos = random(10);
			pInfo[playerid][pMoney] = pInfo[playerid][pMoney]+ongkos;
			ResetPlayerMoney(playerid);
			GivePlayerMoney(playerid, pInfo[playerid][pMoney]);

			cmd_olahraga(playerid);
			format(infogaji, sizeof(infogaji), ""COL_LIGHTBLUE"PEKERJAAN"COL_GREEN": Anda di biayai $%i oleh manager bandara.", ongkos);
			SendClientMessage(playerid,0xFF0000FF, infogaji);

    	}
    	else if(KerjaSweeperBandara[playerid] == 5)
    	{
    		KerjaSweeperBandara[playerid] = 6;
    		SetPlayerCheckpoint(playerid,1516.8074,-2272.8855,12.8549,4); // cp 6
    		ongkos = random(10);
			pInfo[playerid][pMoney] = pInfo[playerid][pMoney]+ongkos;
			ResetPlayerMoney(playerid);
			GivePlayerMoney(playerid, pInfo[playerid][pMoney]);

			
			format(infogaji, sizeof(infogaji), ""COL_LIGHTBLUE"PEKERJAAN"COL_GREEN": Anda di biayai $%i oleh manager bandara.", ongkos);
			SendClientMessage(playerid,0xFF0000FF, infogaji);
    	}
    	else if(KerjaSweeperBandara[playerid] == 6)
    	{
    		KerjaSweeperBandara[playerid] = 7;
    		SetPlayerCheckpoint(playerid,1532.8485,-2289.2373,12.8547,4); // cp 7
    		ongkos = random(10);
			pInfo[playerid][pMoney] = pInfo[playerid][pMoney]+ongkos;
			ResetPlayerMoney(playerid);
			GivePlayerMoney(playerid, pInfo[playerid][pMoney]);

			
			format(infogaji, sizeof(infogaji), ""COL_LIGHTBLUE"PEKERJAAN"COL_GREEN": Anda di biayai $%i oleh manager bandara.", ongkos);
			SendClientMessage(playerid,0xFF0000FF, infogaji);
    	}
    	else if(KerjaSweeperBandara[playerid] == 7)
    	{
    		
    		SetPlayerCheckpoint(playerid,1554.0874,-2307.4119,13.0142,4); // cp 8
    		ongkos = random(10);
			pInfo[playerid][pMoney] = pInfo[playerid][pMoney]+ongkos;
			ResetPlayerMoney(playerid);
			GivePlayerMoney(playerid, pInfo[playerid][pMoney]);

			
			format(infogaji, sizeof(infogaji), ""COL_LIGHTBLUE"PEKERJAAN"COL_GREEN": Anda di biayai $%i oleh manager bandara.", ongkos);
			SendClientMessage(playerid,0xFF0000FF, infogaji);
			KerjaSweeperBandara[playerid] = 8;
			MoveDynamicObject(pesawatbandara, 1108.0010,-2433.6838,101.2289, Float:1000.0);
			
			MoveDynamicObject(balehopesawat, 1505.291015, -2287.030273, 21.520681, Float:1.0);
			
    	}
    	else if(KerjaSweeperBandara[playerid] == 8)
    	{
    		KerjaSweeperBandara[playerid] = 0;
    		SetPlayerCheckpoint(playerid,1554.0874,-2307.4119,13.0142,4);
    		RemovePlayerFromVehicle(playerid);
    		 // cp 8
    		ongkos = random(200); // disini ongkos bonus sweeper yang besar yang di acak sekitaran 200 dollar
			pInfo[playerid][pMoney] = pInfo[playerid][pMoney]+ongkos;
			ResetPlayerMoney(playerid);
			GivePlayerMoney(playerid, pInfo[playerid][pMoney]);

			// saat pesawat harus mendarat
			MoveDynamicObject(pesawatbandara, 1475.936889, -2284.978027, 21.027048, Float:4.0);
			
			format(infogaji, sizeof(infogaji), ""COL_LIGHTBLUE"PEKERJAAN"COL_GREEN": Anda di biayai $%i oleh manager bandara.", ongkos);
			SendClientMessage(playerid,0xFF0000FF, infogaji);


			
	        SetVehicleToRespawn(GetPlayerVehicleID(playerid));
			
			
			DisablePlayerCheckpoint(playerid);
			PlayerPlaySound(playerid, 1150, 0.0, 0.0, 10.0);
			SendClientMessage(playerid,COLOR_AQUA,"* Anda sekarang pahlawan dari kebersihan bandara kendari.");
    	}
    }



    if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 407)
    {
        if(FiremanJob[playerid] == 1)
		{
		FiremanJob[playerid] = 2;
		SetTimerEx("Descarca", 1000, 0, "i", playerid);
		GameTextForPlayer(playerid, "~g~Mengisi air...", 5000, 5);
		SetPlayerCheckpoint(playerid,1099.0345,-1194.4751,18.1079,4);//2
		SendClientMessage(playerid,COLOR_AQUA,"* Pergi ke api!");
		SetTimerEx("busroutestoptimer", 3000, false, "i", playerid);
		TogglePlayerControllable(playerid, 1);
		}
		else if(FiremanJob[playerid] == 2)
        {
		FiremanJob[playerid] = 3;
		SetTimerEx("busroutestoptimer", 3000, false, "i", playerid);
		TogglePlayerControllable(playerid, 1);
		//SetPlayerCheckpoint(playerid,2449.0610, -1274.9933, 23.4286,4);//1
		SendClientMessage(playerid,COLOR_AQUA,"*Matikan apinya bos terus isi lagi kembali ke pangkalan");
		}
        else if(FiremanJob[playerid] == 3)
		{
		FiremanJob[playerid] = 4;
		SetPlayerCheckpoint(playerid,1099.0345,-1194.4751,18.1079,4);//2
		GameTextForPlayer(playerid, "~g~Mengisi air...", 2000, 5);
		SendClientMessage(playerid,COLOR_AQUA,"* Pergi ke api!");
		SetTimerEx("busroutestoptimer", 3000, false, "i", playerid);
		TogglePlayerControllable(playerid, 1);
		CreateExplosion(2438.04688, -1271.21838, 23.22764,1,100);
		CreateExplosion(2438.04688, -1271.21838, 23.22764,1,100);
		CreateExplosion(2438.04688, -1271.21838, 23.22764,1,100);
		CreateExplosion(2438.04688, -1271.21838, 23.22764,1,100);
		CreateExplosion(2438.04688, -1271.21838, 23.22764,1,100);
		CreateExplosion(2438.04688, -1271.21838, 23.22764,1,100);
		CreateExplosion(2438.04688, -1271.21838, 23.22764,1,100);
		CreateExplosion(2438.04688, -1271.21838, 23.22764,1,100);
		CreateExplosion(2438.04688, -1271.21838, 23.22764,1,100);
		CreateExplosion(2438.04688, -1271.21838, 23.22764,1,100);


		CreateExplosion(2435.11060, -1270.86462, 23.22764,1,100);
        CreateExplosion(2435.11060, -1270.86462, 23.22764,1,100);
        CreateExplosion(2435.11060, -1270.86462, 23.22764,1,100);
        CreateExplosion(2435.11060, -1270.86462, 23.22764,1,100);
		CreateExplosion(2435.11060, -1270.86462, 23.22764,1,100);
		CreateExplosion(2435.11060, -1270.86462, 23.22764,1,100);
		CreateExplosion(2435.11060, -1270.86462, 23.22764,1,100);
		CreateExplosion(2435.11060, -1270.86462, 23.22764,1,100);
		CreateExplosion(2435.11060, -1270.86462, 23.22764,1,100);
		CreateExplosion(2435.11060, -1270.86462, 23.22764,1,100);


		CreateExplosion(2434.60400, -1274.67651, 23.42864,1,100);
		CreateExplosion(2434.60400, -1274.67651, 23.42864,1,100);
		CreateExplosion(2434.60400, -1274.67651, 23.42864,1,100);
		CreateExplosion(2434.60400, -1274.67651, 23.42864,1,100);
		CreateExplosion(2434.60400, -1274.67651, 23.42864,1,100);
		CreateExplosion(2434.60400, -1274.67651, 23.42864,1,100);
		CreateExplosion(2434.60400, -1274.67651, 23.42864,1,100);
		CreateExplosion(2434.60400, -1274.67651, 23.42864,1,100);
		CreateExplosion(2434.60400, -1274.67651, 23.42864,1,100);
		CreateExplosion(2434.60400, -1274.67651, 23.42864,1,100);


		CreateExplosion(2434.87476, -1278.60217, 23.42864,1,100);
		CreateExplosion(2434.87476, -1278.60217, 23.42864,1,100);
		CreateExplosion(2434.87476, -1278.60217, 23.42864,1,100);
		CreateExplosion(2434.87476, -1278.60217, 23.42864,1,100);
		CreateExplosion(2434.87476, -1278.60217, 23.42864,1,100);
		CreateExplosion(2434.87476, -1278.60217, 23.42864,1,100);
		CreateExplosion(2434.87476, -1278.60217, 23.42864,1,100);
		CreateExplosion(2434.87476, -1278.60217, 23.42864,1,100);
		CreateExplosion(2434.87476, -1278.60217, 23.42864,1,100);
		CreateExplosion(2434.87476, -1278.60217, 23.42864,1,100);


		CreateExplosion(2438.10645, -1279.20044, 23.42864,1,100);
		CreateExplosion(2438.10645, -1279.20044, 23.42864,1,100);
		CreateExplosion(2438.10645, -1279.20044, 23.42864,1,100);
		CreateExplosion(2438.10645, -1279.20044, 23.42864,1,100);
		CreateExplosion(2438.10645, -1279.20044, 23.42864,1,100);
		CreateExplosion(2438.10645, -1279.20044, 23.42864,1,100);
		CreateExplosion(2438.10645, -1279.20044, 23.42864,1,100);
		CreateExplosion(2438.10645, -1279.20044, 23.42864,1,100);
		CreateExplosion(2438.10645, -1279.20044, 23.42864,1,100);
		CreateExplosion(2438.10645, -1279.20044, 23.42864,1,100);


		CreateExplosion(2438.35132, -1275.54395, 23.42864,1,100);
		CreateExplosion(2438.35132, -1275.54395, 23.42864,1,100);
		CreateExplosion(2438.35132, -1275.54395, 23.42864,1,100);
		CreateExplosion(2438.35132, -1275.54395, 23.42864,1,100);
		CreateExplosion(2438.35132, -1275.54395, 23.42864,1,100);
		CreateExplosion(2438.35132, -1275.54395, 23.42864,1,100);
		CreateExplosion(2438.35132, -1275.54395, 23.42864,1,100);
		CreateExplosion(2438.35132, -1275.54395, 23.42864,1,100);
		CreateExplosion(2438.35132, -1275.54395, 23.42864,1,100);
		CreateExplosion(2438.35132, -1275.54395, 23.42864,1,100);


		CreateExplosion(2433.57251, -1269.59546, 23.42864,1,100);
		CreateExplosion(2433.57251, -1269.59546, 23.42864,1,100);
		CreateExplosion(2433.57251, -1269.59546, 23.42864,1,100);
		CreateExplosion(2433.57251, -1269.59546, 23.42864,1,100);
		CreateExplosion(2433.57251, -1269.59546, 23.42864,1,100);
		CreateExplosion(2433.57251, -1269.59546, 23.42864,1,100);
		CreateExplosion(2433.57251, -1269.59546, 23.42864,1,100);
		CreateExplosion(2433.57251, -1269.59546, 23.42864,1,100);
		CreateExplosion(2433.57251, -1269.59546, 23.42864,1,100);
		CreateExplosion(2433.57251, -1269.59546, 23.42864,1,100);
		SendClientMessage(playerid,COLOR_AQUA,"Sudah padam nih apinya");
		}
        else if(FiremanJob[playerid] == 4)
		{
		FiremanJob[playerid] = 5;
		SetPlayerCheckpoint(playerid,807.4693, -1690.9219, 12.3747,4);//3
		SetTimerEx("busroutestoptimer", 3000, false, "i", playerid);
		TogglePlayerControllable(playerid, 1);
		SendClientMessage(playerid,COLOR_RED,"* Anda pergi ke misi terakhir!");
		}
        else if(FiremanJob[playerid] == 5)
		{
		FiremanJob[playerid] = 6;
		SetPlayerCheckpoint(playerid,1099.0345,-1194.4751,18.1079,4);//3
		SetTimerEx("busroutestoptimer", 1, false, "i", playerid);
		TogglePlayerControllable(playerid, 1);
		GameTextForPlayer(playerid, "~g~Mengisi air...", 2000, 5);
		SendClientMessage(playerid,COLOR_YELLOW,"*Matikan api dan kembali ke pangkalan.");
		CreateExplosion(798.45123, -1689.74084, 13.06241,1,100);
        CreateExplosion(798.45123, -1689.74084, 13.06241,1,100);
		CreateExplosion(798.45123, -1689.74084, 13.06241,1,100);
        CreateExplosion(798.45123, -1689.74084, 13.06241,1,100);
		CreateExplosion(798.45123, -1689.74084, 13.06241,1,100);
        CreateExplosion(798.45123, -1689.74084, 13.06241,1,100);
		CreateExplosion(798.45123, -1689.74084, 13.06241,1,100);
        CreateExplosion(798.45123, -1689.74084, 13.06241,1,100);
		CreateExplosion(798.45123, -1689.74084, 13.06241,1,100);
        CreateExplosion(798.45123, -1689.74084, 13.06241,1,100);


		CreateExplosion(794.80164, -1690.99963, 13.78167,1,100);
		CreateExplosion(794.80164, -1690.99963, 13.78167,1,100);
		CreateExplosion(794.80164, -1690.99963, 13.78167,1,100);
		CreateExplosion(794.80164, -1690.99963, 13.78167,1,100);
		CreateExplosion(794.80164, -1690.99963, 13.78167,1,100);
		CreateExplosion(794.80164, -1690.99963, 13.78167,1,100);
		CreateExplosion(794.80164, -1690.99963, 13.78167,1,100);
		CreateExplosion(794.80164, -1690.99963, 13.78167,1,100);
		CreateExplosion(794.80164, -1690.99963, 13.78167,1,100);
		CreateExplosion(794.80164, -1690.99963, 13.78167,1,100);
        GameTextForPlayer(playerid,"~w~INGATLAH PADAMKAN CEPAT",5000,4);


		CreateExplosion(797.27179, -1694.94678, 13.16647,1,100);
        CreateExplosion(797.27179, -1694.94678, 13.16647,1,100);
        CreateExplosion(797.27179, -1694.94678, 13.16647,1,100);
        CreateExplosion(797.27179, -1694.94678, 13.16647,1,100);
        CreateExplosion(797.27179, -1694.94678, 13.16647,1,100);
        CreateExplosion(797.27179, -1694.94678, 13.16647,1,100);
        CreateExplosion(797.27179, -1694.94678, 13.16647,1,100);
        CreateExplosion(797.27179, -1694.94678, 13.16647,1,100);
        CreateExplosion(797.27179, -1694.94678, 13.16647,1,100);
        CreateExplosion(797.27179, -1694.94678, 13.16647,1,100);

		CreateExplosion(798.41132, -1687.45667, 13.06241,1,100);
        CreateExplosion(798.41132, -1687.45667, 13.06241,1,100);
        CreateExplosion(798.41132, -1687.45667, 13.06241,1,100);
        CreateExplosion(798.41132, -1687.45667, 13.06241,1,100);
        CreateExplosion(798.41132, -1687.45667, 13.06241,1,100);
        CreateExplosion(798.41132, -1687.45667, 13.06241,1,100);
        CreateExplosion(798.41132, -1687.45667, 13.06241,1,100);
        CreateExplosion(798.41132, -1687.45667, 13.06241,1,100);
        CreateExplosion(798.41132, -1687.45667, 13.06241,1,100);
        CreateExplosion(798.41132, -1687.45667, 13.06241,1,100);

		CreateExplosion(799.21808, -1691.95740, 12.75940,1,100);
        CreateExplosion(799.21808, -1691.95740, 12.75940,1,100);
        CreateExplosion(799.21808, -1691.95740, 12.75940,1,100);
        CreateExplosion(799.21808, -1691.95740, 12.75940,1,100);
        CreateExplosion(799.21808, -1691.95740, 12.75940,1,100);
        CreateExplosion(799.21808, -1691.95740, 12.75940,1,100);
        CreateExplosion(799.21808, -1691.95740, 12.75940,1,100);
        CreateExplosion(799.21808, -1691.95740, 12.75940,1,100);
        CreateExplosion(799.21808, -1691.95740, 12.75940,1,100);
        CreateExplosion(799.21808, -1691.95740, 12.75940,1,100);


		CreateExplosion(797.75031, -1693.45801, 13.06241,1,100);
        CreateExplosion(797.75031, -1693.45801, 13.06241,1,100);
        CreateExplosion(797.75031, -1693.45801, 13.06241,1,100);
        CreateExplosion(797.75031, -1693.45801, 13.06241,1,100);
        CreateExplosion(797.75031, -1693.45801, 13.06241,1,100);
        CreateExplosion(797.75031, -1693.45801, 13.06241,1,100);
        CreateExplosion(797.75031, -1693.45801, 13.06241,1,100);
        CreateExplosion(797.75031, -1693.45801, 13.06241,1,100);
        CreateExplosion(797.75031, -1693.45801, 13.06241,1,100);
        CreateExplosion(797.75031, -1693.45801, 13.06241,1,100);
        CreateExplosion(797.75031, -1693.45801, 13.06241,1,100);

		CreateExplosion(794.52057, -1687.30396, 13.78167,1,100);
        CreateExplosion(794.52057, -1687.30396, 13.78167,1,100);
        CreateExplosion(794.52057, -1687.30396, 13.78167,1,100);
        CreateExplosion(794.52057, -1687.30396, 13.78167,1,100);
        CreateExplosion(794.52057, -1687.30396, 13.78167,1,100);
        CreateExplosion(794.52057, -1687.30396, 13.78167,1,100);
        CreateExplosion(794.52057, -1687.30396, 13.78167,1,100);
        CreateExplosion(794.52057, -1687.30396, 13.78167,1,100);
        CreateExplosion(794.52057, -1687.30396, 13.78167,1,100);
        CreateExplosion(794.52057, -1687.30396, 13.78167,1,100);
        }
		else if(FiremanJob[playerid] == 6)
		{


			//SetPlayerPos(playerid, Float:x, Float:y, Float:z);
			FiremanJob[playerid] = 0;
			SetPlayerCheckpoint(playerid,1099.0345,-1194.4751,18.1079,4);//40
			//ShowPlayerDialog(playerid, dialogid, style, caption[], info[], button1[], button2[]);
			GameTextForPlayer(playerid, "~g~Hai ~w~Selamat! ~r~10~b~K~g~ Anda berhasil menghasilkan uang.", 2000, 5);

			GivePlayerMoney(playerid, 10000); //nominal gajian dari sidejiob
	        SetVehicleToRespawn(GetPlayerVehicleID(playerid));
			RemovePlayerFromVehicle(playerid);
			//ResetPlayerWeapons(playerid, 42);
			DisablePlayerCheckpoint(playerid);
			PlayerPlaySound(playerid, 1150, 0.0, 0.0, 10.0);
			SendClientMessage(playerid,COLOR_AQUA,"* Wow selamat ya bos sudah menyelakatkan kota dari kebakaran!");
		}
	}
    return 1;
}


public busroutestoptimer(playerid)
{
	if(IsPlayerConnected(playerid))
	{
	    if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 544)
	    {
	        TogglePlayerControllable(playerid, 1);
	        SendClientMessage(playerid, COLOR_RUSAK, "Percepat!");
	    }
	}
}



public OnFilterScriptExit()
{
	mysql_close();
    return 1;
}

forward SimpanMobilPlayerKeGarasi(playerid);
public SimpanMobilPlayerKeGarasi(playerid)
{
	if(IsValidVehicle(mobilplayer1[playerid]))
	{
		DestroyVehicle(mobilplayer1[playerid]);
		SendClientMessage(playerid, COLOR_RUSAK, "Mobil di amankan di garasi.");
	}
	else
	{
		SendClientMessage(playerid, COLOR_RUSAK, "Anda tidak menyetor mobil ke garasi.");
	}
	

}


public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    if(StatusCrateTerangkat == true)
    {
    	if (!HOLDING (KEY_WALK))
    	{
    		PlayerPlaySound(playerid, 1151, 0.0, 0.0, 10.0);
    		//ApplyAnimation(playerid, "MISC", "Idle_Chat_02", 4.1, 0, 0, 0, 0, 0, 0);
    		ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.1, 0, 0, 0, 1, 1, 1);
    		GameTextForPlayer(playerid, "~r~Tahan Tombol ~n~ALT kiri", 2000, 1);
    		
    	}
    	if (HOLDING (KEY_WALK))
    	{
    		PlayerPlaySound(playerid, 1152, 0.0, 0.0, 10.0);
    		//ApplyAnimation(playerid, "MISC", "Idle_Chat_02", 4.1, 0, 0, 0, 0, 0, 0);
    		//ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.1, 0, 0, 0, 0, 1, 1);
    		GameTextForPlayer(playerid, "~g~Bawalah dengan perlahan", 1000, 1);
    	}
    	if (PRESSED (KEY_JUMP))
    	{
    		PlayerPlaySound(playerid, 1150, 0.0, 0.0, 10.0);
    		//ApplyAnimation(playerid, "MISC", "Idle_Chat_02", 4.1, 0, 0, 0, 0, 0, 0);
    		ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.1, 1, 1, 1, 1, 1, 1);
    	}
    }

	if (PRESSED (KEY_CTRL_BACK))
	{
		if(IsPlayerInRangeOfPoint(playerid, Float:4.0, Float:1568.6168, Float:-2183.2439, Float:13.8467))
		{
			// minta mobil kembali dari garasi
			//AddStaticVehicle(modelid, Float:spawn_x, Float:spawn_y, Float:spawn_z, Float:z_angle, color1, color2)
			if(!IsValidVehicle(mobilplayer1[playerid]))
			{	
				SendClientMessage(playerid, COLOR_RUSAK, "Mobil di ambil dari garasi.");
				mobilplayer1[playerid] = AddStaticVehicle(pInfo[playerid][pTipeMobil],Float:1568.6168, Float:-2183.2439, Float:13.8467, Float:0.00, -1, -1);
				SetPlayerPos(playerid, Float:1568.6168, Float:-2183.2439 + 5.0, Float:13.8467);
				return 1;
			}
			
		}

		if(IsPlayerInRangeOfPoint(playerid, 3.0, -30.7960,147.7576,999.0569))
		{
			if(gaterumahsakit[playerid] == 0)
	    	{
	        	// buka pintu gate rumah sakit sf command
	        	MoveDynamicObject(gatepertamadirumahsakit, -30.7960,147.7576,996.0569, 2.0);
				
		        gaterumahsakit[playerid] = 1;
		        

		        //format(string, sizeof(string), "* %s are is now on duty as an admin (/report for assistance).", GetRPName(playerid));
		        //SendClientMessage(playerid, COLOR_SPRINGGREEN, string);
		        GameTextForPlayer(playerid, "~r~ANDA membuka pintu", 500, 1);
		        //ShowPlayerDialog(playerid,sewaan,DIALOG_STYLE_TABLIST_HEADERS,"{FFFF00}Daftar pelapor", PLAYERNEEDHELP_DIALOG, "Bantu", "Malas");
		       	new string[140];
				format(string, sizeof(string), "* %s menekan tombol pembuka gate dengan tangan kanan.", GetRPName(playerid));
				LocalMessage(ACTION_DISTANCE, playerid, ACTION_COLOR, string);
				PlayerPlaySound(playerid, 1085, 0.0, 0.0, 0.0);
	       		ApplyAnimation(playerid, "GANGS", "Invite_Yes",1.0,0,0,0,0,0);
	   		}
	 	   	else
	   		{	
	   			
	   			MoveDynamicObject(gatepertamadirumahsakit, -30.7960,147.7576,1000.0, 2.0);
		        gaterumahsakit[playerid] = 0;
		        GameTextForPlayer(playerid, "~r~ANDA nutup pintu", 500, 1);
		        //SetPlayerScore(playerid, 0);
		        //SendClientMessage(playerid, COLOR_ERROR, "* You are is now off duty as admin!");
		        new string[3000];
				format(string, sizeof(string), "* %s menutup gate dengan tombol close lalu menguncinya dengan kedua tangan.", GetRPName(playerid));
				LocalMessage(ACTION_DISTANCE, playerid, ACTION_COLOR, string);
				PlayerPlaySound(playerid, 1085, 0.0, 0.0, 0.0);
				ApplyAnimation(playerid, "GANGS", "Invite_Yes",1.0,0,0,0,0,0);
	    	}

	    }
	}


	if (PRESSED( KEY_SECONDARY_ATTACK ))	// ini kalau tekan tombol enter
	{
		if(IsPlayerInRangeOfPoint(playerid, 3.0, 514.9139,-2335.0103,508.6938))
		{
			PlayerPlaySound(playerid, 568, 0.0, 0.0, 10.0);
			//ShowPlayerDialog(playerid,0,DIALOG_STYLE_TABLIST_HEADERS,"{FFFF00}Beli Senjata Diam-Diam", AMMUNATION_SMGS_DIALOG, "Beli", "Batal");
		    //
		    //ShowPlayerDialog(playerid, senjatadipilih, DIALOG_STYLE_TABLIST_HEADERS,"{FFFF00}Penjual Senjata", AMMUNATION_SMGS_DIALOG, "Beli", "Batal");
		
			//PindahinOrangnya(playerid,594.2203,-1178.2686,45.3405);
		    //SetPlayerTime(playerid, 0, 0);
		    //ApplyAnimation(playerid, animlib[], animname[], Float:fDelta, loop, lockx, locky, freeze, time, forcesync = 0)
		    //ApplyAnimation(playerid, "SUNBATHE", "batherdown",4.0,0,0,0,0,0);
			GameTextForPlayer(playerid, "~w~Anda beli~ w ~~n~ senjata~n~ ~r~licensi wanted~ w ~", 3000, 1);
			ResetPlayerMoney(playerid);
			//SetPlayerInterior(playerid, 0);
			//SetPlayerVirtualWorld( playerid, 0 );

			//return cmd_belisenjata(playerid);
			//ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.0, 0, 0, 0, 0, 0, 1);
		}

		if(IsPlayerInRangeOfPoint(playerid, 3.0, 2214.5010,-1318.6323,1049.0234))
		{
			
			if(pInfo[playerid][pBoombox] == 0)
			{
				//PlayerPlaySound(playerid, 568, 0.0, 0.0, 10.0);
				GameTextForPlayer(playerid, "~w~Anda beli~ w ~~n~ Boombox~n~ ~r~Mainkan Musik Segera~ w ~", 3000, 1);
			
				pInfo[playerid][pBoombox]=1; // jadi dia sudah memiliki boombox
				TextDrawShowForPlayer(playerid, Text:PerlihatkanBoombox);
				SetTimer("HilangkanPreviewBoombox", 2000, 0);

				//PlayAudioStreamForPlayer(playerid, "../audio/Naruto.mp3", 2214.5010,-1318.6323,1049.0234, 30.0, 0);
				SendClientMessage(playerid, -1, "Boombox Sudah Terbeli.");
				DestroyPickup(KasirMinimarketPick);
				
			}

			else
			{
				ApplyAnimation(playerid, "ped", "SEAT_down",4.0,0,0,0,0,0,0);
				SendClientMessage(playerid, COLOR_ME, "* Anda sudah memiliki Boombox tersebut mari bersantai. ((Bot Pengawal))");

			}
			
		}
	   

	
		

	}



    
	/*

    if (PRESSED( KEY_SPRINT ))	
    //if(IsKeyJustDown(KEY_SPRINT,newkeys,oldkeys))
	{
	    ClearAnimations(playerid);

		//ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.0, 0, 0, 0, 0, 0, 1);
    }

	*/
    /*
	if(IsKeyJustDown(KEY_WALK,newkeys,oldkeys))
	//if (PRESSED(KEY_WALK))
	{
		// They just pressed the action key, save their
		// old health for restoration.
		//ToggleVehicleEngine(playerid);
		SendClientMessage(playerid, TEAM_AZTECAS_COLOR, "* Nampak gas terus di tarik dengan perlahan");
	}
	if(IsKeyJustDown(KEY_NO,newkeys,oldkeys))
	//if (PRESSED(KEY_NO))
	{
		// They just let go of action - restore
		// their old health again.
		ToggleVehicleEngine(playerid);
	}
	 KEY_WALK | //*/



	/*
		if (PRESSED( KEY_WALK )) // Replace the 'playerid' with the id you want
	{
    	
    	//ApplyAnimation(playerid, animlib[], animname[], Float:fDelta, loop, lockx, locky, freeze, time, forcesync = 0)
    	ApplyAnimation(playerid, "ped", "SEAT_down",4.0,0,0,0,1,0,1);
		SendClientMessage(playerid, COLOR_ME, "* Anda berhasil duduk dengan santai untuk bercengkrama. ((Bot Pengawal))");

		/*
    	if(IsPlayerInAnyVehicle(playerid))
		{
			//SetVehicleVelocity(GetPlayerVehicleID(playerid), 0.0, 0.0, 0.1);
			return GameTextForPlayer(playerid, "~G~NOS ACTIVATE~n~~W~KECEPATAN NAMBAH", 1000, 5);
			AddVehicleComponent(GetPlayerVehicleID(playerid), 1010);
		}
		


		return 1;

	}

	*/

	/*
	 
	  if (PRESSED( KEY_FIRE )) // Replace the 'playerid' with the id you want
	{
    	if(IsPlayerInAnyVehicle(playerid))
		{
			//SetVehicleVelocity(GetPlayerVehicleID(playerid), 0.0, 0.0, 0.1);
			return GameTextForPlayer(playerid, "~G~NOS ACTIVATE~n~~W~KECEPATAN NAMBAH", 1000, 5);
			AddVehicleComponent(GetPlayerVehicleID(playerid), 1010);
		}

		return 1;
	}

	*/

	if (PRESSED( KEY_FIRE )) // Replace the 'playerid' with the id you want
	{
		
    	if(GetPlayerWeapon(playerid) == 0)
		{
			ApplyAnimation(playerid,"KISSING", "gfwave2",4.0,0,0,0,0,0);
			return GameTextForPlayer(playerid, "~w~HAI !~n~~n~~y~APA KABAR", 2000, 5);
			//SetVehicleVelocity(GetPlayerVehicleID(playerid), 0.0, 0.0, 0.1);
			//OnVehicleDamageStatusUpdate(GetPlayerVehicleID(playerid), playerid);
			

		}

		return 1;

	}


	if (PRESSED( KEY_YES )) // Replace the 'playerid' with the id you want
	{
		ApplyAnimation(playerid,"KISSING", "gfwave2",4.0,0,0,0,0,0);
		return GameTextForPlayer(playerid, "~w~HAI !~n~~n~~y~APA KABAR", 2000, 5);
    	if(IsPlayerInAnyVehicle(playerid))
		{

			//SetVehicleVelocity(GetPlayerVehicleID(playerid), 0.0, 0.0, 0.1);
			//OnVehicleDamageStatusUpdate(GetPlayerVehicleID(playerid), playerid);
			

		}

		return 1;

	}

	
	 if (PRESSED( KEY_CROUCH )) // ketika player pencet klakson bell horn mobil
	{
    	if(IsPlayerInAnyVehicle(playerid))
		{
			if(IsPlayerInRangeOfPoint(playerid, Float:4.0, Float:1568.6168, Float:-2183.2439, Float:13.8467))
			{
				if(GetPlayerVehicleID(playerid) == mobilplayer1[playerid])
				{
					RemovePlayerFromVehicle(playerid);
					SetTimer("SimpanMobilPlayerKeGarasi", 5000, false);
					GameTextForPlayer(playerid, "~w~SELAMAT ISTIRAHAT~n~~n~~y~PETUGAS NGURUS MOBIL", 1000, 5);
					return 1;
					
				}
			}
			SetVehicleVelocity(GetPlayerVehicleID(playerid), 0.0, 0.0, 0.1);
			OnVehicleDamageStatusUpdate(GetPlayerVehicleID(playerid), playerid);
			return GameTextForPlayer(playerid, "~w~People says:~n~~n~~y~GANTENG MEMANG", 2000, 5);

		}

		return 1;

	}
	
	
	//new engine,lights,alarm,doors,bonnet,boot,objective;
	new vid = GetPlayerVehicleID(playerid);
	
    if (PRESSED( KEY_FIRE | KEY_NO )) // Replace the 'playerid' with the id you want
	{
	    	if(IsPlayerInAnyVehicle(playerid))
			{
		
		  		if(vid != INVALID_VEHICLE_ID)
		  		{

		  			// DISINI DIA AKAN MENYALAKAN MESIN DENGAN MENEKAN TOMBOL ALT KIRI DAN BERSAMAAN DENGAN TOMBOL N
			  	    ShowPlayerDialog(playerid,PILIHAN_LAMPU,DIALOG_STYLE_MSGBOX,"Tombol lampu kendaraan",""COL_RED"Anda ingin menyalakan lampu?\n\n"COL_WHITE"(Lampu juga bisa tekan NUM 8)","Nyalakan","Matikan");
			  	    ToggleVehicleEngine(vid);
			  	    
		  	    	
			  	    //SetVehicleParamsEx(vid,VEHICLE_PARAMS_ON,lights,alarm,doors,bonnet,boot,objective);
				}

				//new vid = GetPlayerVehicleID(playerid);
		  		//if(vid != INVALID_VEHICLE_ID) {
		  	    
	    
				new string[140];
				format(string, sizeof(string), "* %s memutar kunci kendaraan untuk switch ke ON dengan tangan kanan.", GetRPName(playerid));
				//SendClientMessage(playerid, COLOR_ME, string);
				LocalMessage(ACTION_DISTANCE, playerid, ACTION_COLOR, string);

				//ProcessActionText(playerid, "memutar kunci kendaraan untuk switch dengan tangan kanan.", ACTION_ME);
			}

		//SetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective)	
		//SetVehicleParamsEx(vid,VEHICLE_PARAMS_OFF,lights,alarm,doors,bonnet,boot,objective);
		return SendClientMessage(playerid, COLOR_ME, "* Terlihat semua dalam kondisii bagus dari jauh. ((Bot Pengawal))");
	}


	if (PRESSED(KEY_ANALOG_UP)) // Replace the 'playerid' with the id you want
	{
	    	if(IsPlayerInAnyVehicle(playerid))
			{
		
		  		if(vid != INVALID_VEHICLE_ID)
		  		{

		  			// DISINI DIA AKAN MENYALAKAN MESIN DENGAN MENEKAN TOMBOL ALT KIRI DAN BERSAMAAN DENGAN TOMBOL N
			  	    //GetVehicleParamsEx(vid,engine,lights,alarm,doors,bonnet,boot,objective);
			  	    ToggleVehicleLights(vid);
			  	    
		  	    	//SetVehicleParamsEx(vid,engine,VEHICLE_PARAMS_ON,alarm,doors,bonnet,boot,objective);
			  	    //SetVehicleParamsEx(vid,VEHICLE_PARAMS_ON,lights,alarm,doors,bonnet,boot,objective);
				}

				//new vid = GetPlayerVehicleID(playerid);
		  		//if(vid != INVALID_VEHICLE_ID) {
		  	    
	    
				return ProcessActionText(playerid, "menekan tombol switch lampu mobil dengan tangan kiri.", ACTION_ME);
			}

			
		//etVehicleParamsEx(vid,VEHICLE_PARAMS_OFF,lights,alarm,doors,bonnet,boot,objective);
		return SendClientMessage(playerid, COLOR_ME, "* Terlihat lampu mobil begitu berkilau. ((Bot Pengawal))");
	}


	return 1;
}



public OnPlayerText(playerid, text[])
{
	ProcessChatText(playerid, text);


	return 1;
}


//------------------------------------------------






public OnPlayerPickUpPickup(playerid, pickupid )
{
	if(pickupid == PintuMasukMinimarketPick)
	{
		pInfo[playerid][pBoombox]=0;
		TogglePlayerControllable(playerid, 0); // supaya karakter yang spawn itu diam tidak bergerak
 		unfreezeplayer = playerid; // variabel playerid itu sama dengan variabel unfreeplayer
 		SetTimer("UnFreezeMe",3000,0);
		GangZoneShowForPlayer(playerid, BlackRadar, 0x000000FF);
		//MoveObject(pintubrangkasbiz, -296.69016, 1501.73413, 1071.66125, Float:2.0);
		//GangZoneHideForPlayer(playerid, BlackRadar);
	    PlayerPlaySound(playerid, 2, 0.0, 0.0, 10.0);

		SetPlayerPos(playerid,2220.3926,-1320.2301,1049.0234);
		SetPlayerFacingAngle(playerid, Float:73.6874);
	    SetPlayerTime(playerid, 12, 0);
	    //ApplyAnimation(playerid, animlib[], animname[], Float:fDelta, loop, lockx, locky, freeze, time, forcesync = 0)
	    //ApplyAnimation(playerid, "LOWRIDER", "lrgirl_hurry",4.0,0,0,0,0,0);
		GameTextForPlayer(playerid, "~w~Anda Masuk Bisnis~ w ~~n~ Mari Belanja~n~ ~r~Trimakasih~ w ~", 3000, 1);
		SetPlayerInterior(playerid, 0);
		SetPlayerVirtualWorld( playerid, 0 );
		//AttachCameraToObject(playerid, PintuMasukBizMoneyChangPick);
	}

	if(pickupid == PintuKeluarMinimarketPick)
	{
		TogglePlayerControllable(playerid, 0); // supaya karakter yang spawn itu diam tidak bergerak
 		unfreezeplayer = playerid; // variabel playerid itu sama dengan variabel unfreeplayer
 		SetTimer("UnFreezeMe",3000,0);
		GangZoneHideForPlayer(playerid, BlackRadar);
		

		//GangZoneHideForPlayer(playerid, BlackRadar);
	    PlayerPlaySound(playerid, 2, 0.0, 0.0, 10.0);

		SetPlayerPos(playerid,1607.6140,-2179.4382,13.8035);
		SetPlayerFacingAngle(playerid, Float:86.8983);
	    SetPlayerTime(playerid, 12, 0);
	    //ApplyAnimation(playerid, animlib[], animname[], Float:fDelta, loop, lockx, locky, freeze, time, forcesync = 0)
	    //ApplyAnimation(playerid, "LOWRIDER", "lrgirl_hurry",4.0,0,0,0,0,0);
		GameTextForPlayer(playerid, "~w~Trimakasih~ w ~~n~ Telah Belanja di~n~ ~r~Bandara~ w ~", 3000, 1);
		SetPlayerInterior(playerid, 0);
		SetPlayerVirtualWorld( playerid, 0);

	}

	if(pickupid == PintuMasukBizMoneyChangPick)
	{
		TogglePlayerControllable(playerid, 0); // supaya karakter yang spawn itu diam tidak bergerak
 		unfreezeplayer = playerid; // variabel playerid itu sama dengan variabel unfreeplayer
 		SetTimer("UnFreezeMe",3000,0);
		GangZoneShowForPlayer(playerid, BlackRadar, 0x000000FF);
		MoveObject(pintubrangkasbiz, -296.69016, 1501.73413, 1071.66125, Float:2.0);
		//GangZoneHideForPlayer(playerid, BlackRadar);
	    PlayerPlaySound(playerid, 2, 0.0, 0.0, 10.0);

		SetPlayerPos(playerid,-296.6222,1489.2268,1070.9063);
		SetPlayerFacingAngle(playerid, Float:8.6825);
	    SetPlayerTime(playerid, 12, 0);
	    //ApplyAnimation(playerid, animlib[], animname[], Float:fDelta, loop, lockx, locky, freeze, time, forcesync = 0)
	    //ApplyAnimation(playerid, "LOWRIDER", "lrgirl_hurry",4.0,0,0,0,0,0);
		GameTextForPlayer(playerid, "~w~Anda Masuk Bisnis~ w ~~n~ Money Changer~n~ ~r~Trimakasih~ w ~", 3000, 1);
		SetPlayerInterior(playerid, 0);
		SetPlayerVirtualWorld( playerid, 2 );
		AttachCameraToObject(playerid, PintuMasukBizMoneyChangPick);
		
		return 1;
	}


	if(pickupid == PintuKeluarBizMoneyChangPick)
	{
		TogglePlayerControllable(playerid, 0); // supaya karakter yang spawn itu diam tidak bergerak
 		unfreezeplayer = playerid; // variabel playerid itu sama dengan variabel unfreeplayer
 		SetTimer("UnFreezeMe",3000,0);
		GangZoneHideForPlayer(playerid, BlackRadar);
		

		//GangZoneHideForPlayer(playerid, BlackRadar);
	    PlayerPlaySound(playerid, 2, 0.0, 0.0, 10.0);

		SetPlayerPos(playerid,1505.9360,-2189.6584,13.5469);
		SetPlayerFacingAngle(playerid, Float:175.2302);
	    SetPlayerTime(playerid, 12, 0);
	    //ApplyAnimation(playerid, animlib[], animname[], Float:fDelta, loop, lockx, locky, freeze, time, forcesync = 0)
	    //ApplyAnimation(playerid, "LOWRIDER", "lrgirl_hurry",4.0,0,0,0,0,0);
		GameTextForPlayer(playerid, "~w~Anda Keluar Bisnis~ w ~~n~ Money Changer~n~ ~r~Bandara~ w ~", 3000, 1);
		SetPlayerInterior(playerid, 0);
		SetPlayerVirtualWorld( playerid, 0);

		return 1;
	}

		/*
	if(pickupid == pickupbelisenjatadirumahkecil)  // Replace the 'playerid' with the id you want
	{
    		
		
	

		    PlayerPlaySound(playerid, 568, 0.0, 0.0, 10.0);
		    
		    //ShowPlayerDialog(playerid, senjatadipilih, DIALOG_STYLE_TABLIST_HEADERS,"{FFFF00}Penjual Senjata", AMMUNATION_SMGS_DIALOG, "Beli", "Batal");
		
			//PindahinOrangnya(playerid,594.2203,-1178.2686,45.3405);
		    //SetPlayerTime(playerid, 0, 0);
		    //ApplyAnimation(playerid, animlib[], animname[], Float:fDelta, loop, lockx, locky, freeze, time, forcesync = 0)
		    //ApplyAnimation(playerid, "SUNBATHE", "batherdown",4.0,0,0,0,0,0);
			//GameTextForPlayer(playerid, "~w~Anda menyewar~ w ~~n~ mobil~n~ ~g~licensi internasional~ w ~", 3000, 1);
			//SetPlayerInterior(playerid, 0);
			//SetPlayerVirtualWorld( playerid, 0 );

			return cmd_belisenjata(playerid);
		
	}
		*/


	if(pickupid == tempatpickupbeligasstation)
	{

	    PlayerPlaySound(playerid, 568, 0.0, 0.0, 10.0);
	    ShowPlayerDialog(playerid, sewaan, DIALOG_STYLE_INPUT, "{FFFF00}Bisnis Property di Jual", "Anda yakin membelinya?\n\n{FFFF00}Masukkan nominal deal pembelian :\n\n\n\n"COL_WHITE"(Minimal 10.000 Rupiah)", "Beli", "Lelangkan");
	
		//PindahinOrangnya(playerid,594.2203,-1178.2686,45.3405);
	    //SetPlayerTime(playerid, 0, 0);
	    //ApplyAnimation(playerid, animlib[], animname[], Float:fDelta, loop, lockx, locky, freeze, time, forcesync = 0)
	    //ApplyAnimation(playerid, "SUNBATHE", "batherdown",4.0,0,0,0,0,0);
		//GameTextForPlayer(playerid, "~w~Anda menyewar~ w ~~n~ mobil~n~ ~g~licensi internasional~ w ~", 3000, 1);
		//SetPlayerInterior(playerid, 0);
		//SetPlayerVirtualWorld( playerid, 0 );

		//return cmd_v(playerid);
	}



	if(pickupid == tempatrentalmobildibandarals)
	{

	    PlayerPlaySound(playerid, 2, 0.0, 0.0, 10.0);

		//PindahinOrangnya(playerid,594.2203,-1178.2686,45.3405);
	    //SetPlayerTime(playerid, 0, 0);
	    //ApplyAnimation(playerid, animlib[], animname[], Float:fDelta, loop, lockx, locky, freeze, time, forcesync = 0)
	    //ApplyAnimation(playerid, "SUNBATHE", "batherdown",4.0,0,0,0,0,0);
		GameTextForPlayer(playerid, "~w~Anda menyewar~ w ~~n~ mobil~n~ ~g~licensi internasional~ w ~", 3000, 1);
		//SetPlayerInterior(playerid, 0);
		//SetPlayerVirtualWorld( playerid, 0 );

		return cmd_v(playerid);
	}
  
	if(pickupid == PintuRumahKecilKeluarPick)
	{
		//GangZoneShowForPlayer(playerid, BlackRadar, 0x000000FF);
		
		GangZoneHideForPlayer(playerid, BlackRadar);
	    PlayerPlaySound(playerid, 2, 0.0, 0.0, 10.0);

		PindahinOrangnya(playerid,594.2203,-1178.2686,45.3405);
	    SetPlayerTime(playerid, 0, 0);
	    //ApplyAnimation(playerid, animlib[], animname[], Float:fDelta, loop, lockx, locky, freeze, time, forcesync = 0)
	    //ApplyAnimation(playerid, "SUNBATHE", "batherdown",4.0,0,0,0,0,0);
		GameTextForPlayer(playerid, "~w~Anda keluar~ w ~~n~ awas ingat~n~ ~g~licensi wajib~ w ~", 3000, 1);
		SetPlayerInterior(playerid, 0);
		SetPlayerVirtualWorld( playerid, 0 );

		return 1;
	}



 
	if(pickupid == PintuRumahKecilPick)
	{
		TogglePlayerControllable(playerid, 0); // supaya karakter yang spawn itu diam tidak bergerak
 		unfreezeplayer = playerid; // variabel playerid itu sama dengan variabel unfreeplayer
 		SetTimer("UnFreezeMe",2000,0);
		GangZoneShowForPlayer(playerid, BlackRadar, 0x000000FF);

		//GangZoneHideForPlayer(playerid, BlackRadar);
	    PlayerPlaySound(playerid, 2, 0.0, 0.0, 10.0);

		PindahinOrangnya(playerid,507.8102,-2321.7339,512.7908);
	    SetPlayerTime(playerid, 12, 0);
	    //ApplyAnimation(playerid, animlib[], animname[], Float:fDelta, loop, lockx, locky, freeze, time, forcesync = 0)
	    //ApplyAnimation(playerid, "LOWRIDER", "lrgirl_hurry",4.0,0,0,0,0,0);
		GameTextForPlayer(playerid, "~w~Anda Masuk Bahaya~ w ~~n~ awas ingat~n~ ~r~Dosa sendiri~ w ~", 3000, 1);
		SetPlayerInterior(playerid, -1);
		SetPlayerVirtualWorld( playerid, -1 );

		return 1;
	}




	if(pickupid == PintuMasukRumahPutuPick)
	{

	    PlayerPlaySound(playerid, 2, 0.0, 0.0, 10.0);

		PindahinOrangnya(playerid,247.1455,-1847.9506,3333.3630);
	    SetPlayerTime(playerid, 0, 0);
	    ApplyAnimation(playerid,  "SHOP", "ROB_Shifty",4.0,0,0,0,0,0);
		GameTextForPlayer(playerid, "~w~Anda datang~ w ~~n~ Kerumah idaman~n~ ~g~Sendiri~ w ~", 2000, 1);
		SetPlayerInterior(playerid, 0);

		return 1;
	}


		// ini bagian kedua cahaya untuk loncat saja
    if(pickupid == LanjutBahayaDeathRacePick2)
	{
	    PlayerPlaySound(playerid, 1212, 0.0, 0.0, 10.0);
	    SetVehicleHealth(GetPlayerVehicleID(playerid), 3000);
	    SetVehicleVelocity(GetPlayerVehicleID(playerid), 1.0, 1.1, 1.0);
	    SendClientMessage(playerid, COLOR_ME, "* Anda dapat melihat mobil teleportasi kembali. ((Pengawas jalan))");
    
	}


    if(pickupid == LanjutBahayaDeathRacePick)
	{
	    PlayerPlaySound(playerid, 555, 0.0, 0.0, 10.0);
	    SetVehicleHealth(GetPlayerVehicleID(playerid), 3000);
	    return cmd_dr(playerid); 
	    

	}

	if(pickupid == PintuKeluarRumahPutuPick)
	{

	    PlayerPlaySound(playerid, 2, 0.0, 0.0, 10.0);
		PindahinOrangnya(playerid,1292.8975,-1154.0797,23.6563);
	    SetPlayerTime(playerid, 12, 0);
	    ApplyAnimation(playerid, "PED", "BIKE_elbowR",4.0,0,0,0,0,0);
		GameTextForPlayer(playerid, "~w~Kembali kerja~ w ~~n~ biaya hidup~n~ ~r~-$23000~ w ~", 3000, 1);
		SetPlayerInterior(playerid, 0);
		GivePlayerMoney(playerid, -20);

	}
	


    if(pickupid == BahayaDeathRacePick)
	{

	    PlayerPlaySound(playerid, 1141, 0.0, 0.0, 10.0);
	 	//RemovePlayerFromVehicle(playerid);
		//PindahinOrangnya(playerid,-1763.0876,439.2883,38.4542);
	    //SetPlayerTime(playerid, 5, 0);
		//SetPlayerHealth(playerid,9999);
	    CreateExplosion(-1563.9391,645.6500,43.3195,1,2000);
	    //SetPlayerCameraLookAt(playerid,-1563.9391,645.6500,43.3195);
	    ApplyAnimation(playerid, "FOOD", "EAT_Vomit_P",4.0,0,0,0,0,0);
	    SetVehicleVelocity(GetPlayerVehicleID(playerid), 1.0, 1.0, 1.2);
		GameTextForPlayer(playerid, "~r~DEATH RACE~w~~n~ Live from terminal~n~ ~w~Youtube~ w ~", 6000, 1);
		//SetPlayerInterior(playerid, 0);
		//SetVehicleVelocity(GetPlayerVehicleID(playerid), -1563.9391,645.6500,43.3195);

       

	}

    if(pickupid == PintuMasukDoopBarPick)
	{

	    PlayerPlaySound(playerid, 2, 0.0, 0.0, 10.0);
		PindahinOrangnya(playerid,967.4761,-1558.5636,21.5722);
	    SetPlayerTime(playerid, 0, 0);
	    ApplyAnimation(playerid,"POLICE","Door_Kick",4.0,0,0,0,0,0);
		GameTextForPlayer(playerid, "~w~Selamat Pesta tuan~ w ~~n~ Sudah siap~n~ ~g~Di kelas elit~ w ~", 2000, 1);
		SetPlayerInterior(playerid, 0);
	}


    if(pickupid == PintuKeluarDoopBarPick)
	{

	    PlayerPlaySound(playerid, 2, 0.0, 0.0, 10.0);
		PindahinOrangnya(playerid,970.5093,-1568.8385,13.4070);
	    SetPlayerTime(playerid, 8, 0);
	    ApplyAnimation(playerid, "PED", "WALK_DRUNK",4.0, 1, 1, 1, 1, 1, 1);
		GameTextForPlayer(playerid, "~w~Selamat istirahat~ w ~~n~ Sudah siap~n~ ~g~Di kelas elit~ w ~", 2000, 1);
		SetPlayerInterior(playerid, 0);
	}
    
    if(pickupid == PintuKeluarPolisiPick)
	{
		TogglePlayerControllable(playerid, 0); // supaya karakter yang spawn itu diam tidak bergerak
 		unfreezeplayer = playerid; // variabel playerid itu sama dengan variabel unfreeplayer
 		SetTimer("UnFreezeMe",2000,0);
 		
	    PlayerPlaySound(playerid, 2, 0.0, 0.0, 10.0);
		PindahinOrangnya(playerid,2379.0518,2469.0483,10.8203);
		GameTextForPlayer(playerid, "~w~Parkiran anda~ w ~~n~ Sudah siap~n~ ~r~Pak polisi~ w ~", 2000, 1);
		SetPlayerInterior(playerid, 0);
	}

    if(pickupid == PintuMasukPolisiPick)
	{
		TogglePlayerControllable(playerid, 0); // supaya karakter yang spawn itu diam tidak bergerak
 		unfreezeplayer = playerid; // variabel playerid itu sama dengan variabel unfreeplayer
 		SetTimer("UnFreezeMe",2000,0);



	    PlayerPlaySound(playerid, 2210, 0.0, 0.0, 10.0);
	    //SetPlayerPos(playerid, Float:x, Float:y, Float:z)
	    //SetPlayerVirtualWorld(playerid, worldid)
	    //SetPlayerInterior(playerid, interiorid)

		PindahinOrangnya(playerid, 326.7800,-1464.6260,-33.5230);
	    SetPlayerFacingAngle(playerid,0.0);
		GameTextForPlayer(playerid, "~w~Selamat kerja~ w ~~n~ Jadi polisi~n~ ~r~ Bertaruh nyali ~ w ~", 2000, 1);
		SetPlayerInterior(playerid, 1);
	}
	

    if(pickupid == PintuKeluarMD)
	{

	    PlayerPlaySound(playerid, 5400, 0.0, 0.0, 10.0);
		PindahinOrangnya(playerid, 2409.8557,1998.4230,10.8203,251.7435);
		GameTextForPlayer(playerid, "~R~SUDAH MAKAN~ w ~~n~ Trimakasih sudah makan~n~ ~r~ KERJA LAGI KAN ~ w ~", 2000, 1);
		SetPlayerInterior(playerid, 0);
	}
	

    if(pickupid == PintuParkiranPolisiPick)
    { 
		SetTimer("ParkiranPolisiBuka", 0, false);
		GivePlayerMoney(playerid, -10);

	}




    if(pickupid == infokerjapemadam)
	{

	    PlayerPlaySound(playerid, 6201, 0.0, 0.0, 10.0);
	    ShowPlayerDialog(playerid,2,DIALOG_STYLE_TABLIST_HEADERS,"{FFFF00}Barang Senjata", AMMUNATION_SMGS_DIALOG, "Beli", "Batal");
		
		PindahinOrangnya(playerid, 1105.8713,-1231.4409,15.8203,70.3663);
		//ApplyAnimation(playerid, animlib[], animname[], Float:fDelta, loop, lockx, locky, freeze, time, forcesync = 0);
		ApplyAnimation(playerid,  "RAPPING", "Laugh_01",4.0);
	    GameTextForPlayer(playerid, "~g~Pemadam Kebakaran, ~ w ~ Masuk ke kendaraan dan masukkan perintah ~ r ~ /padamkan ~ w ~", 3000, 3);
	}





    if(pickupid == PintuMD)
	{

	    PlayerPlaySound(playerid, 1035, 0.0, 0.0, 10.0);
		PindahinOrangnya(playerid,1154.8158,-1344.9395,2423.0461);
		SetPlayerInterior(playerid, 1);
	    GameTextForPlayer(playerid, "~w~Selamat datang~ w ~~n~ Mau Makan apa anda~n~ ~r~ Pasti Murah ~ w ~", 3000, 3);
	}
	
	
	if(pickupid == pintumasukrumahsakitsfpickup)
	{
		GangZoneShowForPlayer(playerid, BlackRadar, 0x000000FF);
	    PlayerPlaySound(playerid, 2, 0.0, 0.0, 10.0);
		ShowPlayerDialog(playerid,0,DIALOG_STYLE_MSGBOX,"Rumah Sakit","Maaf tuan rumah sakit sedang kehabisan obat\nHarap untuk menjaga kesehatan mandiri dulu","OK","");
		PindahinOrangnya(playerid,-45.0102,152.1082,999.0637);
	    //SetPlayerTime(playerid, 0, 0);
	    //ApplyAnimation(playerid, animlib[], animname[], Float:fDelta, loop, lockx, locky, freeze, time, forcesync = 0)
	    //ApplyAnimation(playerid, "SUNBATHE", "batherdown",4.0,0,0,0,0,0);
		GameTextForPlayer(playerid, "~w~Selamat datang di rumah sakit~ w ~~n~ ingatlah~n~ ~g~licensi wajib~ w ~", 2000, 1);
		SetPlayerInterior(playerid, -1);
		SetPlayerVirtualWorld( playerid, -1 );

		//return 1;
	}

	if(pickupid == pintukeluarrumahsakitsfpickup)
	{
		//GangZoneShowForPlayer(playerid, BlackRadar, 0x000000FF);
		GangZoneHideForPlayer(playerid, BlackRadar);
	    PlayerPlaySound(playerid, 2, 0.0, 0.0, 10.0);

		PindahinOrangnya(playerid, -1706.8209,883.2354,24.7422);
	    //SetPlayerTime(playerid, 0, 0);
	    //ApplyAnimation(playerid, animlib[], animname[], Float:fDelta, loop, lockx, locky, freeze, time, forcesync = 0)
	    //ApplyAnimation(playerid, "SUNBATHE", "batherdown",4.0,0,0,0,0,0);
		GameTextForPlayer(playerid, "~w~Semoga sehat selalu~ w ~~n~ ingatlah~n~ ~g~asuransi kesehatan~ w ~", 2000, 1);
		SetPlayerInterior(playerid, 0);
		SetPlayerVirtualWorld( playerid, 0 );

		//return 1;
	}

	return 1;

}


public OnPlayerDeath(playerid, killerid, reason)
{
    
	StatusPlayerTerkill[playerid] = 1;
    

	//SendDeathMessage(killerid, playerid, reason);
    

    //new playercash;
    //return cmd_spawn(playerid);
    // if they ever return to class selection make them city
	// select again first
	//gPlayerHasCitySelected[playerid] = 1;

	//SetPlayerPos(playerid, x, y, z);

	//SetPlayerInterior(playerid, -1);
	

	/*if(killerid == INVALID_PLAYER_ID)
	{
        ResetPlayerMoney(playerid);
	} 
	else
	{
		playercash = GetPlayerMoney(playerid);
		if(playercash > 0)
		{
			GivePlayerMoney(killerid, playercash);
			ResetPlayerMoney(playerid);
		}
	}
   	
   	*/
   	return 1;
	
}


public OnPlayerCommandText(playerid, cmdtext[])
{
    //endClientMessage(playerid, color, const message[])
   // SendClientMessage(playerid, COLOR_RED, "Anda salah memasukkan command yang telah ada");

	return SendClientMessage(playerid, COLOR_RED, "Anda salah memasukkan command yang telah ada");
}

new BoomboxnyaDiLantai[MAX_PLAYERS][2];

public MelangsungkanDance(playerid)
{
	SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DANCE3);
	SendClientMessage(playerid, COLOR_LBLUE, "* Anda bergoyang mengikuti irama musik dari alat yang di lantai.");
}

CMD:boombox(playerid)
{
	// bisa beli boombox di toko minimarket dulu
	if(pInfo[playerid][pBoombox] == 1)
	{
		new string[128], Float:BBCoord[4];
	    GetPlayerPos(playerid, BBCoord[0], BBCoord[1], BBCoord[2]);
	    GetPlayerFacingAngle(playerid, BBCoord[3]);

		BoomboxnyaDiLantai[playerid][0] = CreateDynamicObject(2226, BBCoord[0], BBCoord[1], BBCoord[2]-1, 0.0, 0.0, 0.0, GetPlayerVirtualWorld(playerid),  GetPlayerInterior(playerid));
		BoomboxnyaDiLantai[playerid][1] = CreateDynamicObject(18717, BBCoord[0], BBCoord[1], BBCoord[2]-2.4, 0.0, 0.0, 0.0, GetPlayerVirtualWorld(playerid),  GetPlayerInterior(playerid));
		// object kedua adalah semacam cahaya sinyal suara.

		ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 0, 0, 0, 0, 0, 1);
		SendClientMessage(playerid, COLOR_LBLUE, "You play music in a boombox. /boombox to take ** BOOMBOX PLAYS ** again.");
		pInfo[playerid][pBoombox] = 2; // artinya kalau nilia boomboxnya status 2, dia sudah sedang drop boombox.
		PlayAudioStreamForPlayer(playerid, "http://yp.shoutcast.com/sbin/tunein-station.pls?id=512156", BBCoord[0], BBCoord[1], BBCoord[2], 30.0,  0);
		
        format(string, sizeof(string), "** BOOMBOX PLAYS **\n(( %s ))", GetRPName(playerid));
        if(IsValidDynamic3DTextLabel(ado[playerid]))
        {
        	DestroyDynamic3DTextLabel(ado[playerid]);
        }
        
        ado[playerid] = CreateDynamic3DTextLabel(string, COLOR_ME, BBCoord[0], BBCoord[1], BBCoord[2]-1, 40.0);
		SetTimer("MelangsungkanDance", 5000, 0);
		return 1;
	}
	if(pInfo[playerid][pBoombox] == 0) // kondisi tidak punya boombox
	{
		SendClientMessage(playerid, COLOR_RED, "You do not have a boombox and must be buy first in minimarket.");
		ApplyAnimation(playerid, "PED", "KO_skid_front", 4.0, 0, 0, 0, 0, 0, 1);
	}
	if(pInfo[playerid][pBoombox] == 2) // saat ambil boombox di lantai
	{
		ClearAnimations(playerid, 0);
		DestroyDynamicObject(BoomboxnyaDiLantai[playerid][0]); DestroyDynamicObject(BoomboxnyaDiLantai[playerid][1]); // objek boombox sama objek cahaya
		TextDrawShowForPlayer(playerid, Text:PerlihatkanBoombox);
		DestroyDynamic3DTextLabel(ado[playerid]);
		SetTimer("HilangkanPreviewBoombox", 2000, 0);
		StopAudioStreamForPlayer(playerid);
		ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 0, 0, 0, 0, 0, 1);
		
		SendClientMessage(playerid, COLOR_LBLUE, "You have take a boombox, with /boombox.");

		
		pInfo[playerid][pBoombox] = 1;
	}
}


CMD:ubahattachment(playerid, params[])
{
	//extract params -> 

	new index;
	sscanf(params, "i", index);
	EditAttachedObject(playerid, index );
	return 1;
}


CMD:dropgun(playerid, params[])
{
	//opPlayerWeapons(playerid);
	//ResetPlayerWeapons(playerid);
	return 1;
	
}

CMD:rampok(playerid, params[])
{
	MoveObject(pintubrangkasbiz, -293.9700,1500.8232,1071.3231, Float:2.0);
	return 1;
	
}

CMD:ads(playerid, params[])
{
	new isiiklan[200];

    format(isiiklan, sizeof(isiiklan), " "COL_WHITE" * [PAPAN IKLAN] * \n\n "COL_LGREEN" %s \n "COL_PINK" * Thank You * " , params);
	TextDrawSetString(Text:TeksSaatLogin, isiiklan);
	return 1;
}




CMD:iklan(playerid)
{
	if(IsPlayerInRangeOfPoint(playerid, 3.0, 1557.3296,-2272.8071,13.5469))
	//if(IsPlayerInDynamicArea(playerid, TempatBeriklan))
	{
		SendClientMessage(playerid, COLOR_YELLOW, "* Trimakasih sudah datang untuk beriklan biayanya cukup "COL_LGREEN"$20.");
		ShowPlayerDialog(playerid, DIALOG_PROSSES_IKLAN, DIALOG_STYLE_INPUT, ""COL_GREEN"Iklan Cepat Dan Murah", ""COL_YELLOW"\nMohon Tulis Iklan Anda Di Bawah Ini", "Buat", "Sabar");
		new string[140];
		format(string, sizeof(string), "* %s mengambil pena lewat jendela loket lalu menulis iklan dengan tangan kanan.", GetRPName(playerid));
		LocalMessage(ACTION_DISTANCE, playerid, ACTION_COLOR, string);
		ApplyAnimation(playerid, "CRIB", "CRIB_Use_Switch",4.0,0,0,0,0,0), PlayerPlaySound(playerid, 4203, 0,0,0);
		return 1;
		
	}
	else
	{
		SendClientMessage(playerid, COLOR_YELLOW, "* Anda butuh ke lokasi kantor cabang SANews Angency dan uang "COL_LGREEN"$20.");
		
	}
	return 1;
	
}




CMD:toghelm(playerid)
{
	new armour;

	if(pakaihelm[playerid] == 0) // jika belum pakai helm
	{
		ApplyAnimation(playerid, "CRIB", "CRIB_Use_Switch", 4.0, 0, 0, 0, 0, 0, 1);
		SetPlayerAttachedObject(playerid,2,18977, 2, Float:0.073000,Float:0.006999,Float:0.000000,Float:0.000000,Float:86.199996,Float:90.699981,Float:1.000000,Float:1.000000,Float:1.000000);
		//SetPlayerAttachedObject(playerid, index, modelid, bone, Float:fOffsetX = 0.0, Float:fOffsetY = 0.0, Float:fOffsetZ = 0.0, Float:fRotX = 0.0, Float:fRotY = 0.0, Float:fRotZ = 0.0, Float:fScaleX = 1.0, Float:fScaleY = 1.0, Float:fScaleZ = 1.0, materialcolor1 = 0, materialcolor2 = 0)
		EditAttachedObject(playerid, 2);
		GetPlayerArmour(playerid, Float:armour);
		SetPlayerArmour(playerid, Float:armour+10.1);
		pakaihelm[playerid] = 1; // kondisi sedang pakai armour dan helm
		SendClientMessage(playerid,COLOR_SPRINGGREEN,"Trimakasih telah memakai helm untuk menjaga kesehatan otak.");
	}
	else
	{
		//ApplyAnimation(playerid, "SHOP","ROB_Shifty", 4.1, 0, 0, 0, 0, 0, 0);
		ApplyAnimation(playerid, "GHANDS", "gsign3LH", 4.1, 0, 1, 1, 1, 2250, 1);
		GetPlayerArmour(playerid, Float:armour);
		SetPlayerArmour(playerid, Float:armour-10.0);
		RemovePlayerAttachedObject(playerid, 2);
		pakaihelm[playerid] = 0; // kondisi tidak pakai armour dan helm
		SendClientMessage(playerid,COLOR_SPRINGGREEN,"Trimakasih telah ingat dengan pentingnya helm ini.");
	
	}
		
	return 1;
}




CMD:makan(playerid, params[])
{

	SetPlayerProgressBarValue(playerid, PlayerBar:pInfo[playerid][pLaparBar], GetPlayerProgressBarValue(playerid, PlayerBar:pInfo[playerid][pLaparBar]) + Float:20.0);
	
	ApplyAnimation(playerid, "FOOD", "EAT_Burger", 4.1, 0, 0, 0, 0, 0, 0);
	//ApplyAnimation(playerid, "SMOKING", "M_smk_in", 4.1, 0, 0, 0, 0, 0, 0);

	new makanan = random(50);
	pInfo[playerid][pMoney] = pInfo[playerid][pMoney]-makanan;
	ResetPlayerMoney(playerid);
	GivePlayerMoney(playerid, pInfo[playerid][pMoney]);
	SavePlayer(playerid);

	new infomakan[200];
	format(infomakan, sizeof(infomakan), ""COL_LIGHTBLUE"USAGE"COL_GREEN": Anda makan dengan biaya %i.", makanan);
	SendClientMessage(playerid,0xFF0000FF, infomakan);

	new x, y, z;
	GetPlayerPos(playerid, Float:x, Float:y, Float:z);
	SetVehiclePos(MobilPedagangMakanan, Float:x +10, Float:y, Float:z);
	SetActorPos(aktorpedagangmakanan, Float:x +4, Float:y, Float:z);
	new chat[200];
	format(chat, 200, "Ayo pak mari makan aja banyak kok yang enak sini!\n\n Mark_Ainsley\n"COL_WHITE"=========\n"COL_RED"++++++++");
	if(!IsValidDynamic3DTextLabel(ChatPedagangMenjualKeliling))
	{
		ChatPedagangMenjualKeliling = CreateDynamic3DTextLabel(  chat, -1, Float:x +4, Float:y, Float:z+1.5, 35.0);
	}
	
	//CreateDynamic3DTextLabel(const text[], color, Float:x, Float:y, Float:z, Float:drawdistance, attachedplayer = INVALID_PLAYER_ID, attachedvehicle = INVALID_VEHICLE_ID, testlos = 0, worldid = -1, interiorid = -1, playerid = -1, Float:streamdistance = STREAMER_3D_TEXT_LABEL_SD, STREAMER_TAG_AREA areaid = STREAMER_TAG_AREA -1, priority = 0)
	SetTimer("KembalikanMobilPedagangMakanan", 10000, 0);
	//SetVehicleVelocity(MobilPedagangMakanan, 0.1, 0.0, 0.0);
	//SetVehicleSpeedTT(MobilPedagangMakanan, Float:20.00);
	return 1;
}

CMD:olahraga(playerid, params[])
{

	SetPlayerProgressBarValue(playerid, PlayerBar:pInfo[playerid][pLaparBar], GetPlayerProgressBarValue(playerid, PlayerBar:pInfo[playerid][pLaparBar]) - Float:40.0);
	//SetPlayerProgressBarColour(playerid, PlayerBar:pInfo[playerid][pLaparBar], COLOR_RED);
	ApplyAnimation(playerid, "FAT", "IDLE_tired", 4.1, 0, 0, 0, 0, 0, 0);
	SendClientMessage(playerid,0xFF0000FF,"Usage: Anda lelah sekarang butuh istirahat dan makan.");
	return 1;
}

CMD:vrecord(playerid, params[])
{

	if(!strlen(params)) {
		SendClientMessage(playerid,0xFF0000FF,"Usage: /vrecord {name}");
		return 1;
	}
	if(!IsPlayerInAnyVehicle(playerid)) {
        SendClientMessage(playerid,0xFF0000FF,"Recording: Get in a vehicle.");
		return 1;
	}
	StartRecordingPlayerData(playerid,PLAYER_RECORDING_TYPE_DRIVER,params);
	SendClientMessage(playerid,0xFF0000FF,"Recording: started.");
	return 1;
}

CMD:ofrecord(playerid, params[])
{
	if(!strlen(params)) {
		SendClientMessage(playerid,0xFF0000FF,"Usage: /ofrecord {name}");
		return 1;
	}
		if(IsPlayerInAnyVehicle(playerid)) {
        SendClientMessage(playerid,0xFF0000FF,"Recording: Leave the vehicle and reuse the command.");
		return 1;
	}
	//StartRecordingPlayerData(playerid,PLAYER_RECORDING_TYPE_ONFOOT,params);
	SendClientMessage(playerid,0xFF0000FF,"Recording: started.");
	return 1;
}

CMD:stoprecord(playerid, params[])
{
	StopRecordingPlayerData(playerid);
	SendClientMessage(playerid,0xFF0000FF,"Recording: stopped.");
	return 1;
}

CMD:labelsaya(playerid, params[])
{
	if(!IsValidDynamicObject(labelajah[playerid]))
	{
		new Float:pos[3];
		GetPlayerPos(playerid, pos[0], pos[1], pos[2]);

		new Float: angle;
		GetPlayerFacingAngle(playerid, angle);

		//object = CreateObject(model,pos[0], pos[1], pos[2], 0, 0, angle);
		// id cadangan lain adalah spray tag 18659
		// modelid label transparan 2659 tapi cadangan sedang 19366 
		labelajah[playerid] = CreateDynamicObject(18659, pos[0], pos[1]+4.0, pos[2], 0.000000, 0.000000, angle); 
		SetDynamicObjectMaterialText(labelajah[playerid], 0, params, 140, "Arial", 80, 1, 0xFFFFFFFF, 0x00000000, 1);
		EditDynamicObject(playerid, labelajah[playerid]);
		SendClientMessage(playerid,0xFF0000FF,"Edit posisi label anda dan tahan SPASI untuk melihat di sekeliling.");
		return 1;
	}
	else return cmd_hapuslabelsaya(playerid);

}

CMD:loading(playerid)
{
	// membuat fungsi supaya ada progress bar loading di tengah layar
	if(pInfo[playerid][Logged] == 1)
	{
		SetPlayerProgressBarValue(playerid, PlayerBar:pInfo[playerid][pLoadingBar], Float:1.0);
		SetPlayerProgressBarColour(playerid, PlayerBar:pInfo[playerid][pLoadingBar], COLOR_WHITE);
		ShowPlayerProgressBar(playerid, PlayerBar:pInfo[playerid][pLoadingBar]);
		SendClientMessage(playerid,COLOR_WHITE,"Anda sedang menunjukkan bar seperti loading yang di maksud.");
		
		pInfo[playerid][pStatusLoadingBar] = 1;
		

		return 1;
	}
	
}


CMD:hapuslabelsaya(playerid)
{
	if(IsValidDynamicObject(labelajah[playerid]))
	{
		DestroyDynamicObject(labelajah[playerid]);
		SendClientMessage(playerid,0xFF0000FF,"Label yang lebih dulu di buat sudah berhasil di hapus.");
		return 1;
	}
	
}


CMD:mobilsaya(playerid, params)
{
	if(IsValidVehicle(mobilplayer1[playerid]))
	{
		PutPlayerInVehicle(playerid, mobilplayer1[playerid], 0);

	}
	else
	{
		new passworddariuser[500];
	    format(passworddariuser, 500, "SELECT * FROM `playerdata` WHERE `id` COLLATE latin1_general_cs = '%s' LIMIT 1", pInfo[playerid][ID]); // now here check the database if the player has given the proper password.HTTP
		//mysql_query(MySQL:handle, const query[], bool:use_cache = true)
		mysql_query(MySQL:g_Sql, passworddariuser, bool:true);

		//new datapw[250];
	    //format(datapw, sizeof(datapw), "SELECT * FROM `playerdata` WHERE `nick` COLLATE latin1_general_cs = '%s' LIMIT 1", pInfo[playerid][Nick]);
	    //mysql_query(g_Sql, datapw);


		cache_get_value_int(0, "tipemobil", pInfo[playerid][pTipeMobil]);
		//new stringmobil = pInfo[playerid][pTipeMobil];

		//new mobilplayer1[playerid] = 
		new tipemobil[10];
		format(tipemobil, 10, "%i",pInfo[playerid][pTipeMobil] );
		SendClientMessage(playerid, -1, tipemobil);
		
		//PindahinOrangnya(playerid, Float:pInfo[playerid][pMx], Float:pInfo[playerid][pMy], Float:pInfo[playerid][pMz]);
		//AddStaticVehicle(modelid, Float:spawn_x, Float:spawn_y, Float:spawn_z, Float:z_angle, color1, color2)
		mobilplayer1[playerid] = AddStaticVehicle(pInfo[playerid][pTipeMobil],Float:pInfo[playerid][pMx], Float:pInfo[playerid][pMy], Float:pInfo[playerid][pMz], Float:0.00, -1, -1);
		//new mobilplayer1[playerid] = AddStaticVehicle(416,Float:pInfo[playerid][pMx], Float:pInfo[playerid][pMy], Float:pInfo[playerid][pMz]);
		
		//CreateVehicle(543,Float:pInfo[playerid][pMx], Float:pInfo[playerid][pMy], Float:pInfo[playerid][pMz]);
		//PutPlayerInVehicle(playerid, mobilplayer1[playerid], 0);
		SetVehicleVirtualWorld(mobilplayer1[playerid], 0);
		LinkVehicleToInterior(mobilplayer1[playerid], 0);
		PutPlayerInVehicle(playerid, mobilplayer1[playerid], 0);
	}
	
}
 
new pakaiarmour[MAX_PLAYERS];

CMD:attach9(playerid)
{

	if(pakaiarmour[playerid] == 0)
	{
		SetPlayerArmour(playerid, Float:70.1);
		pakaiarmour[playerid] = 1; // kondisi sedang pakai armour
		SetPlayerAttachedObject(playerid, 3, 19515, 1 ,0.096999,0.058999,0.012999,4.199995,0.999981,8.800023,1.000000,1.221000,0.797000, 0xFFFFA500, 0xFFFFA500);
		//EditAttachedObject(playerid, 3);
	}
	else
	{
		SetPlayerArmour(playerid, Float:0.0);
		RemovePlayerAttachedObject(playerid, 3);
		pakaiarmour[playerid] = 0; // kondisi tidak pakai armour
	}
	
}




CMD:robberpack(playerid)
{

	if(MenggunakanRobberPack[playerid] == 0)
	{
		SetPlayerSkin(playerid, 172);
		//new x,y,z;
		//GetPlayerPos(playerid, Float:x, Float:y, Float:z);
		//kendaraanrobber = CreateVehicle(468, Float:x, Float:y, Float:z); 
		//PutPlayerInVehicle(playerid, kendaraanrobber, 0);
		SetPlayerArmour(playerid, Float:70.1);
		MenggunakanRobberPack[playerid] = 1; // kondisi sedang pakai armour
		// ini adalah slot kosong tas robber
		SetPlayerAttachedObject(playerid,0,1550,1,0.013000,-0.196998,0.000000,-4.299999,91.599975,2.599997,0.495999,0.641999,1.791997); // money bag
		// slot satu yaitu masker
		SetPlayerAttachedObject(playerid,1,18915,2,0.063998,0.028998,-0.004999,-89.599998,1.699996,-84.699989,1.000000,1.000000,1.000000); // ini maskernya
		
		SetPlayerAttachedObject(playerid,2,18642,9,-0.499000,0.000000,-0.081000,-85.599990,-70.500000,-7.800002,1.000000,1.000000,1.000000); // senjatanya robber.
		//EditAttachedObject(playerid, 3);
	}
	else
	{
		SetPlayerArmour(playerid, Float:0.0);
		RemovePlayerAttachedObject(playerid, 0);
		RemovePlayerAttachedObject(playerid, 1);
		RemovePlayerAttachedObject(playerid, 2);
		//DestroyVehicle(kendaraanrobber);

		MenggunakanRobberPack[playerid] = 0; // kondisi tidak pakai armour
		
	}
	
}





CMD:restar(playerid, params[])
{
	SendClientMessage(playerid, -1,"Data setiap player tak dapat di save saat server langsung restar");
	
	SendRconCommand("gmx");

	return 1;
}


CMD:layarmerah(playerid, params[])
{
	
	TextDrawShowForPlayer(playerid, Text:LayarJadiMerah);
	SetTimer("HilangkanLayarWarnaMerah", 500, 0);

	return 1;
}


CMD:takemoney(playerid, params[])
{
	
	//if(GetPlayerAdminEx(playerid) < 5) return 1;
	if(strfind(params, "-", true)!= -1) return SendClientMessage(playerid, COLOR_LIGHTRED, "Cukup input nominal yang di ambil tanpa tanda minus (-)");
	extract params -> new to_player, cash; else return SendClientMessage(playerid, 0xCECECEFF, "Gunakan: /takemoney [id pemain] [jumlah yang di ambil]");
	//if(!IsPlayerConnected(to_player) || !IsPlayerLogged(to_player)) return SendClientMessage(playerid, 0xCECECEFF, "Tidak ada pemain seperti itu");
	//if(!(-25_000_000 <= cash <= 25_000_000)) return SendClientMessage(playerid, 0xCECECEFF, "Anda dapat menerbitkan dari 1 hingga 25000000$ pada suatu waktu");
	if(cash > 100000) return SendClientMessage(playerid, COLOR_LIGHTRED, "Maaf setiap pengambilan uang di batasi hanya sampai 100.000 karena sering berisiko salah");
	cash = -cash;
	new reason[144];
	format(reason, sizeof reason, "Mengambil uang dari player %s", GetRPName(playerid));
	SendClientMessage(playerid, COLOR_LGREEN, reason);
	GivePlayerMoneyEx(to_player, cash, reason, true, true); // ini ke tujuan pengambilan
	GivePlayerMoneyEx(playerid, -cash, reason, true, false);	// ini ke uang pengambil bertambah
	format(reason, sizeof reason, "%s %s telah mengambil uang anda sebesar $%d", pInfo[playerid][UCP], GetRPName(playerid), cash);
	SendClientMessage(to_player, COLOR_LGREEN, reason); // notifikasi ke korban
	format(reason, sizeof reason, "[CASH] %s[%d] mengambil uang"COL_RED" %s[%d] jumlah $%d, pada akhirnya uangnya berubah jadi "COL_GREEN"$%d",  GetRPName(playerid), playerid,  GetRPName(to_player), to_player, cash, GetPlayerMoneyEx(to_player));
	//SendMessageToAdmins(reason, 0xFFFF00FF);
	SendClientMessage(playerid, COLOR_LIGHTBLUE, reason); // notifkasi ke pelaku sisa uang nya korban.
	
	format(reason, sizeof reason, "Uang di copet oleh %s[acc:%d] Sebesar $%d korbannya adalah %s",  GetRPName(playerid) , pInfo[to_player][ID], cash, GetRPName(to_player));
	printf(reason);
	//SendLog(playerid, LOG_TYPE_SUPERADMIN_ACTION, reason);
	return 1;
}