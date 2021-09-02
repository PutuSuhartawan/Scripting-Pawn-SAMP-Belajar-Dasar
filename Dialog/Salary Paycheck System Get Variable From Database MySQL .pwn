
#include <a_samp>
#undef MAX_PLAYERS
#define MAX_PLAYERS	100
#include <crashdetect.inc>
#include <gvar.inc>
#include <a_mysql.inc>
#include <a_actor.inc>
#include <a_zones.inc>
#include <progress2.inc>
#include <compat>
#include <Pawn.CMD.inc>
#include <mSelection.inc>
#include <TimestampToDate.inc>
#define ENABLE_3D_TRYG_YSI_SUPPORT
#include <3DTryg.inc>
#include <streamer.inc>
#include <EVF2.inc>
#include <YSI\y_timers>
#include <sscanf2.inc>
#include <yom_buttons.inc>
#include <geoiplite.inc>
#include <garageblock.inc>
#include <timerfix.inc>
#include <dini.inc>
//-----[ Modular ]-----
#include "DEFINE.pwn"

//====== QUIZ

// Player data
enum E_PLAYERS
{
	pID,
	pName[MAX_PLAYER_NAME],
	pAdminname[MAX_PLAYER_NAME],
	pTwittername[MAX_PLAYER_NAME],
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
	Text3D:pMaskLabel,
	pBankMoney,
	pBankRek,
	pPhone,
	pPhoneCredit,
	pPhoneBook,
	pSMS,
	pCall,
	pCallTime,
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
	pFamily,
	pFamilyRank,
	pJail,
	pJailTime,
	pArrest,
	pArrestTime,
	pWarn,
	pJob,
	pJob2,
	pJobTime,
	pExitJob,
	pMedicine,
	pMedkit,
	pMask,
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
	pDriveLic,
	pDriveLicTime,
	pBoatLic,
	pBoatLicTime,
	pFlyLic,
	pFlyLicTime,
	pGuns[13],
    pAmmo[13],
	pWeapon,
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
	pTogPM,
	pTogLog,
	pTogAds,
	pTogWT,
	Text3D:pAdoTag,
	Text3D:pBTag,
	bool:pBActive,
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
	pFindEms,
	pCuffed,
	toySelected,
	bool:PurchasedToy,
	pEditingItem,
	pProductModify,
	pCurrSeconds,
	pCurrMinutes,
	pCurrHours,
	pSpec,
	playerSpectated,
	pFriskOffer,
	pDragged,
	pDraggedBy,
	pDragTimer,
	pHBEMode,
	pHelmetOn,
	pSeatBelt,
	pReportTime,
	pAskTime,
	//Player Progress Bar
	PlayerBar:fuelbar,
	PlayerBar:damagebar,
	PlayerBar:hungrybar,
	PlayerBar:energybar,
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
	// WBR
	pHead,
 	pPerut,
 	pLHand,
 	pRHand,
 	pLFoot,
 	pRFoot,
 	// Inspect Offer
 	pInsOffer,
 	// Obat System
 	pObat,
 	// Suspect
 	pSuspectTimer,
 	pSuspect,
 	// Phone On Off
 	pUsePhone,
 	pTogPhone,
 	// Kurir
 	pKurirEnd,
 	// Shareloc Offer
 	pLocOffer,
 	// Twitter
 	pTwitter,
 	pRegTwitter,
 	// Kuota
 	pKuota,
 	// DUTY SYSTEM
 	pDutyHour,
 	// CHECKPOINT
 	pCP,
 	// ROBBERY
 	pRobTime,
 	pRobOffer,
 	pRobLeader,
 	pRobMember,
 	pMemberRob,
 	// Roleplay Booster
 	pBooster,
 	pBoostTime,
	pTrailer,
	// Smuggler
	bool:pTakePacket,
	pTrackPacket,
	// Garkot
	pPark,
	pLoc,
	// WS
	pMenuType,
	pInWs,
	pTransferWS,
	
};
new pData[MAX_PLAYERS][E_PLAYERS];


enum
{
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
	DIALOG_BUYPVCP_VIPCONFIRM,
	DIALOG_RENT_JOBCARS,
	DIALOG_RENT_JOBCARSCONFIRM,
	//---[ DIALOG TOYS ]---
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
	//---[ DIALOG PLAYER ]---
	DIALOG_HELP,
	DIALOG_GPS,
	DIALOG_JOB,
	DIALOG_GPS_JOB,
	DIALOG_GPS_MORE,
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
	
	//reports
	DIALOG_REPORTS,
	//ask
	DIALOG_ASKS,
	DIALOG_SALARY,
	DIALOG_PAYCHECK,
	
	//Sidejob
	DIALOG_SWEEPER,
	DIALOG_BUS,
	DIALOG_FORKLIFT,
	// HEALTH
	DIALOG_HEALTH,
	// OBAT
	DIALOG_OBAT,
	// KUOTA
	DIALOG_ISIKUOTA,
	DIALOG_DOWNLOAD,
	DIALOG_KUOTA,
	// STUCK
	DIALOG_STUCK,
	// TDM
	DIALOG_TDM,
	//
	DIALOG_PICKUPVEH,
	DIALOG_TRACKPARK,
	DIALOG_MY_WS,
	DIALOG_TRACKWS,
	WS_MENU,
	WS_SETNAME,
	WS_SETOWNER,
	WS_SETEMPLOYE,
	WS_SETEMPLOYEE,
	WS_SETOWNERCONFIRM,
	WS_SETMEMBER,
	WS_SETMEMBERE,
	WS_MONEY,
	WS_WITHDRAWMONEY,
	WS_DEPOSITMONEY,
	WS_COMPONENT,
	WS_COMPONENT2,
	WS_MATERIAL,
	WS_MATERIAL2,
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
}

// DOWNLOAD
new download[MAX_PLAYERS];
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

// WBR
new File[128];

// ROB
new robmoney;

// Server Uptime
new up_days,
	up_hours,
	up_minutes,
	up_seconds,
	WorldTime = 10,
	WorldWeather = 24;

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
	viptoyslist = mS_INVALID_LISTID;
	
// Faction Vehicle
#define VEHICLE_RESPAWN 7200

new SAPDVehicles[30],
	SAGSVehicles[30],
	SAMDVehicles[30],
	SANAVehicles[30];


//Format Money
FormatMoney(cCash)
{
    new szStr[18], dollar[40];
    format(szStr, sizeof(szStr), "%i", cCash);

    for(new iLen = strlen(szStr) - 3; iLen > 0; iLen -= 3)
    {
        strins(szStr, ",", iLen);
    }
	format(dollar, sizeof(dollar), "$%s", szStr);
    return dollar;
}


UpdatePlayerData(playerid)
{
	if(pData[playerid][IsLoggedIn] == false) return 0;
	if(IsPlayerInAnyVehicle(playerid))
	{
		if(IsATruck(GetPlayerVehicleID(playerid)))
		{
			RemovePlayerFromVehicle(playerid);
			GetPlayerPos(playerid, pData[playerid][pPosX], pData[playerid][pPosY], pData[playerid][pPosZ]);
			pData[playerid][pPosZ] = pData[playerid][pPosZ]+0.4;
		}
		else
		{
			GetPlayerPos(playerid, pData[playerid][pPosX], pData[playerid][pPosY], pData[playerid][pPosZ]);
		}
    }
	else
	{
		GetPlayerPos(playerid, pData[playerid][pPosX], pData[playerid][pPosY], pData[playerid][pPosZ]);
	}
	GetPlayerFacingAngle(playerid, pData[playerid][pPosA]);
	GetPlayerHealth(playerid, pData[playerid][pHealth]);
	GetPlayerArmour(playerid, pData[playerid][pArmour]);
	//UpdateWeapons(playerid);

	new cQuery[3048], PlayerIP[16];
	GetPlayerIp(playerid, PlayerIP, sizeof(PlayerIP));
	
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "UPDATE `players` SET ");
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`Gun1` = '%d', ", cQuery, pData[playerid][pGuns][0]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`Gun2` = '%d', ", cQuery, pData[playerid][pGuns][1]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`Gun3` = '%d', ", cQuery, pData[playerid][pGuns][2]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`Gun4` = '%d', ", cQuery, pData[playerid][pGuns][3]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`Gun5` = '%d', ", cQuery, pData[playerid][pGuns][4]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`Gun6` = '%d', ", cQuery, pData[playerid][pGuns][5]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`Gun7` = '%d', ", cQuery, pData[playerid][pGuns][6]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`Gun8` = '%d', ", cQuery, pData[playerid][pGuns][7]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`Gun9` = '%d', ", cQuery, pData[playerid][pGuns][8]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`Gun10` = '%d', ", cQuery, pData[playerid][pGuns][9]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`Gun11` = '%d', ", cQuery, pData[playerid][pGuns][10]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`Gun12` = '%d', ", cQuery, pData[playerid][pGuns][11]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`Gun13` = '%d', ", cQuery, pData[playerid][pGuns][12]);
	
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`Ammo1` = '%d', ", cQuery, pData[playerid][pAmmo][0]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`Ammo2` = '%d', ", cQuery, pData[playerid][pAmmo][1]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`Ammo3` = '%d', ", cQuery, pData[playerid][pAmmo][2]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`Ammo4` = '%d', ", cQuery, pData[playerid][pAmmo][3]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`Ammo5` = '%d', ", cQuery, pData[playerid][pAmmo][4]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`Ammo6` = '%d', ", cQuery, pData[playerid][pAmmo][5]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`Ammo7` = '%d', ", cQuery, pData[playerid][pAmmo][6]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`Ammo8` = '%d', ", cQuery, pData[playerid][pAmmo][7]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`Ammo9` = '%d', ", cQuery, pData[playerid][pAmmo][8]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`Ammo10` = '%d', ", cQuery, pData[playerid][pAmmo][9]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`Ammo11` = '%d', ", cQuery, pData[playerid][pAmmo][10]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`Ammo12` = '%d', ", cQuery, pData[playerid][pAmmo][11]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`Ammo13` = '%d', ", cQuery, pData[playerid][pAmmo][12]);
	
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`username` = '%e', ", cQuery, pData[playerid][pName]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`adminname` = '%e', ", cQuery, pData[playerid][pAdminname]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`twittername` = '%e', ", cQuery, pData[playerid][pTwittername]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`ip` = '%s', ", cQuery, PlayerIP);
	//mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`email` = '%s', ", cQuery, pData[playerid][pEmail]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`admin` = '%d', ", cQuery, pData[playerid][pAdmin]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`helper` = '%d', ", cQuery, pData[playerid][pHelper]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`level` = '%d', ", cQuery, pData[playerid][pLevel]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`levelup` = '%d', ", cQuery, pData[playerid][pLevelUp]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`vip` = '%d', ", cQuery, pData[playerid][pVip]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`vip_time` = '%d', ", cQuery, pData[playerid][pVipTime]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`gold` = '%d', ", cQuery, pData[playerid][pGold]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`money` = '%d', ", cQuery, pData[playerid][pMoney]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`bmoney` = '%d', ", cQuery, pData[playerid][pBankMoney]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`brek` = '%d', ", cQuery, pData[playerid][pBankRek]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`phone` = '%d', ", cQuery, pData[playerid][pPhone]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`phonecredit` = '%d', ", cQuery, pData[playerid][pPhoneCredit]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`phonebook` = '%d', ", cQuery, pData[playerid][pPhoneBook]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`wt` = '%d', ", cQuery, pData[playerid][pWT]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`hours` = '%d', ", cQuery, pData[playerid][pHours]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`minutes` = '%d', ", cQuery, pData[playerid][pMinutes]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`seconds` = '%d', ", cQuery, pData[playerid][pSeconds]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`paycheck` = '%d', ", cQuery, pData[playerid][pPaycheck]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`skin` = '%d', ", cQuery, pData[playerid][pSkin]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`facskin` = '%d', ", cQuery, pData[playerid][pFacSkin]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`gender` = '%d', ", cQuery, pData[playerid][pGender]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`age` = '%s', ", cQuery, pData[playerid][pAge]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`indoor` = '%d', ", cQuery, pData[playerid][pInDoor]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`inhouse` = '%d', ", cQuery, pData[playerid][pInHouse]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`inbiz` = '%d', ", cQuery, pData[playerid][pInBiz]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`posx` = '%f', ", cQuery, pData[playerid][pPosX]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`posy` = '%f', ", cQuery, pData[playerid][pPosY]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`posz` = '%f', ", cQuery, pData[playerid][pPosZ]+0.3);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`posa` = '%f', ", cQuery, pData[playerid][pPosA]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`interior` = '%d', ", cQuery, GetPlayerInterior(playerid));
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`world` = '%d', ", cQuery, GetPlayerVirtualWorld(playerid));
	
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`health` = '%f', ", cQuery, pData[playerid][pHealth]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`armour` = '%f', ", cQuery, pData[playerid][pArmour]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`hunger` = '%d', ", cQuery, pData[playerid][pHunger]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`bladder` = '%d', ", cQuery, pData[playerid][pBladder]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`energy` = '%d', ", cQuery, pData[playerid][pEnergy]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`sick` = '%d', ", cQuery, pData[playerid][pSick]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`hospital` = '%d', ", cQuery, pData[playerid][pHospital]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`injured` = '%d', ", cQuery, pData[playerid][pInjured]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`duty` = '%d', ", cQuery, pData[playerid][pOnDuty]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`dutytime` = '%d', ", cQuery, pData[playerid][pOnDutyTime]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`faction` = '%d', ", cQuery, pData[playerid][pFaction]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`factionrank` = '%d', ", cQuery, pData[playerid][pFactionRank]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`factionlead` = '%d', ", cQuery, pData[playerid][pFactionLead]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`family` = '%d', ", cQuery, pData[playerid][pFamily]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`familyrank` = '%d', ", cQuery, pData[playerid][pFamilyRank]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`jail` = '%d', ", cQuery, pData[playerid][pJail]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`jail_time` = '%d', ", cQuery, pData[playerid][pJailTime]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`arrest` = '%d', ", cQuery, pData[playerid][pArrest]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`arrest_time` = '%d', ", cQuery, pData[playerid][pArrestTime]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`warn` = '%d', ", cQuery, pData[playerid][pWarn]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`job` = '%d', ", cQuery, pData[playerid][pJob]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`job2` = '%d', ", cQuery, pData[playerid][pJob2]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`jobtime` = '%d', ", cQuery, pData[playerid][pJobTime]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`sidejobtime` = '%d', ", cQuery, pData[playerid][pSideJobTime]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`exitjob` = '%d', ", cQuery, pData[playerid][pExitJob]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`taxitime` = '%d', ", cQuery, pData[playerid][pTaxiTime]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`medicine` = '%d', ", cQuery, pData[playerid][pMedicine]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`medkit` = '%d', ", cQuery, pData[playerid][pMedkit]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`mask` = '%d', ", cQuery, pData[playerid][pMask]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`helmet` = '%d', ", cQuery, pData[playerid][pHelmet]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`snack` = '%d', ", cQuery, pData[playerid][pSnack]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`sprunk` = '%d', ", cQuery, pData[playerid][pSprunk]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`gas` = '%d', ", cQuery, pData[playerid][pGas]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`bandage` = '%d', ", cQuery, pData[playerid][pBandage]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`gps` = '%d', ", cQuery, pData[playerid][pGPS]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`material` = '%d', ", cQuery, pData[playerid][pMaterial]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`component` = '%d', ", cQuery, pData[playerid][pComponent]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`food` = '%d', ", cQuery, pData[playerid][pFood]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`seed` = '%d', ", cQuery, pData[playerid][pSeed]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`potato` = '%d', ", cQuery, pData[playerid][pPotato]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`wheat` = '%d', ", cQuery, pData[playerid][pWheat]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`orange` = '%d', ", cQuery, pData[playerid][pOrange]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`price1` = '%d', ", cQuery, pData[playerid][pPrice1]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`price2` = '%d', ", cQuery, pData[playerid][pPrice2]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`price3` = '%d', ", cQuery, pData[playerid][pPrice3]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`price4` = '%d', ", cQuery, pData[playerid][pPrice4]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`marijuana` = '%d', ", cQuery, pData[playerid][pMarijuana]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`plant` = '%d', ", cQuery, pData[playerid][pPlant]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`plant_time` = '%d', ", cQuery, pData[playerid][pPlantTime]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`fishtool` = '%d', ", cQuery, pData[playerid][pFishTool]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`fish` = '%d', ", cQuery, pData[playerid][pFish]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`worm` = '%d', ", cQuery, pData[playerid][pWorm]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`idcard` = '%d', ", cQuery, pData[playerid][pIDCard]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`idcard_time` = '%d', ", cQuery, pData[playerid][pIDCardTime]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`drivelic` = '%d', ", cQuery, pData[playerid][pDriveLic]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`drivelic_time` = '%d', ", cQuery, pData[playerid][pDriveLicTime]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`hbemode` = '%d', ", cQuery, pData[playerid][pHBEMode]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`togpm` = '%d', ", cQuery, pData[playerid][pTogPM]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`toglog` = '%d', ", cQuery, pData[playerid][pTogLog]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`togads` = '%d', ", cQuery, pData[playerid][pTogAds]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`togwt` = '%d', ", cQuery, pData[playerid][pTogWT]);

	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`last_login` = CURRENT_TIMESTAMP() WHERE `reg_id` = '%d'", cQuery, pData[playerid][pID]);
	mysql_tquery(g_SQL, cQuery);
	
	MySQL_SavePlayerToys(playerid);
	SaveLunarSystem(playerid);
	return 1;
}

/*UpdatePlayerData(playerid)
{
	if (pData[playerid][IsLoggedIn] == false) return 0;

	GetPlayerPos(playerid, pData[playerid][pPosX], pData[playerid][pPosY], pData[playerid][pPosZ]);
	GetPlayerFacingAngle(playerid, pData[playerid][pPosA]);
	//UpdateWeapons(playerid);

	new query[2048], PlayerIP[16];
	GetPlayerIp(playerid, PlayerIP, sizeof(PlayerIP));
	
	mysql_format(g_SQL, query, sizeof query, "UPDATE players SET username='%s',adminname='%s',ip='%s',email='%s',admin=%d,helper=%d,level=%d,levelup=%d,vip=%d,vip_time=%d,coin=%d,money=%d,bmoney=%d,brek=%d,phone=%d,phonecredit=%d,hours=%d,minutes=%d,seconds=%d,paycheck='%d',skin=%d,facskin=%d,gender=%d,age='%s',indoor=%d,inhouse=%d,inbiz=%d,posx=%f,posy=%f,posz=%f,posa=%f,interior=%d,world=%d",
	pData[playerid][pName],
	pData[playerid][pAdminname],
	PlayerIP,
	pData[playerid][pEmail],
	pData[playerid][pAdmin],
	pData[playerid][pHelper],
	pData[playerid][pLevel],
	pData[playerid][pLevelUp],
	pData[playerid][pVip],
	pData[playerid][pVipTime],
	pData[playerid][pGold],
	pData[playerid][pMoney],
	pData[playerid][pBankMoney],
	pData[playerid][pBankRek],
	pData[playerid][pPhone],
	pData[playerid][pPhoneCredit],
	pData[playerid][pHours],
	pData[playerid][pMinutes],
	pData[playerid][pSeconds],
	pData[playerid][pPaycheck],
	pData[playerid][pSkin],
	pData[playerid][pFacSkin],
	pData[playerid][pGender],
	pData[playerid][pAge],
	pData[playerid][pInDoor],
	pData[playerid][pInHouse],
	pData[playerid][pInBiz],
	pData[playerid][pPosX],
	pData[playerid][pPosY],
	pData[playerid][pPosZ],
	pData[playerid][pPosA],
	GetPlayerInterior(playerid),
	GetPlayerVirtualWorld(playerid));
	
	for (new i = 0; i < 13; i ++) 
	{
        format(query, sizeof(query), "%s, Gun%d=%d, Ammo%d=%d", query, i + 1, pData[playerid][pGuns][i], i + 1, pData[playerid][pAmmo][i]);
    }
	format(query, sizeof(query), "%s, health=%f,armour=%f,hunger=%d,bladder=%d,energy=%d,sick=%d,hospital=%d,injured=%d,duty=%d,dutytime=%d,faction=%d,factionrank=%d,family=%d,familyrank=%d,jail=%d,arrest=%d,arrest_time=%d,warn=%d,job=%d,job2=%d,jobtime=%d,taxitime=%d,medicine=%d,medkit=%d,mask=%d,helmet=%d,snack=%d,sprunk=%d,gas=%d,bandage=%d,gps=%d,material=%d,component=%d,idcard=%d,idcard_time=%d,drivelic=%d,drivelic_time=%d,last_login=CURRENT_TIMESTAMP() WHERE ID=%d LIMIT 1",
	query,
	pData[playerid][pHealth],
	pData[playerid][pArmour],
	pData[playerid][pHunger],
	pData[playerid][pBladder],
	pData[playerid][pEnergy],
	pData[playerid][pSick],
	pData[playerid][pHospital],
	pData[playerid][pInjured],
	pData[playerid][pOnDuty],
	pData[playerid][pOnDutyTime],
	pData[playerid][pFaction],
	pData[playerid][pFactionRank],
	pData[playerid][pFamily],
	pData[playerid][pFamilyRank],
	pData[playerid][pJail],
	pData[playerid][pArrest],
	pData[playerid][pArrestTime],
	pData[playerid][pWarn],
	pData[playerid][pJob],
	pData[playerid][pJob2],
	pData[playerid][pJobTime],
	pData[playerid][pTaxiTime],
	pData[playerid][pMedicine],
	pData[playerid][pMedkit],
	pData[playerid][pMask],
	pData[playerid][pHelmet],
	pData[playerid][pSnack],
	pData[playerid][pSprunk],
	pData[playerid][pGas],
	pData[playerid][pBandage],
	pData[playerid][pGPS],
	pData[playerid][pMaterial],
	pData[playerid][pComponent],
	pData[playerid][pIDCard],
	pData[playerid][pIDCardTime],
	pData[playerid][pDriveLic],
	pData[playerid][pDriveLicTime],
	pData[playerid][pID]);
	mysql_tquery(g_SQL, query);
	
	//MySQL_SavePlayerToys(playerid);
	return 1;
}*/

ResetVariables(playerid)
{
	/*for(new i; E_PLAYERS:i < E_PLAYERS; i++)
	{
    	pData[playerid][E_PLAYERS:i] = 0;
	}*/
	
	static const empty_player[E_PLAYERS];
	pData[playerid] = empty_player;
	
	pData[playerid][pInDoor] = -1;
	pData[playerid][pInHouse] = -1;
	pData[playerid][pInBiz] = -1;
	pData[playerid][pFamily] = -1;
	pData[playerid][IsLoggedIn] = false;
	pData[playerid][PurchasedToy] = false;
	pData[playerid][pHealth] = 100.0;
	pData[playerid][pArmour] = 0.0;
	pData[playerid][pMaskID] = random(90000) + 10000;
	pData[playerid][pSpec] = -1;
	pData[playerid][fuelbar] = INVALID_PLAYER_BAR_ID;
	pData[playerid][damagebar] = INVALID_PLAYER_BAR_ID;
	pData[playerid][hungrybar] = INVALID_PLAYER_BAR_ID;
	pData[playerid][energybar] = INVALID_PLAYER_BAR_ID;
	pData[playerid][bladdybar] = INVALID_PLAYER_BAR_ID;
	pData[playerid][pMechVeh] = INVALID_VEHICLE_ID;
	
//	pData[playerid][pTransferName] = "None";
	pData[playerid][pFlareActive] = false;
	pData[playerid][pAdoActive] = false;
	pData[playerid][CuttingTreeID] = -1;
	pData[playerid][CarryingLumber] = false;
	pData[playerid][EditingTreeID] = -1;
	pData[playerid][pNewsGuest] = INVALID_PLAYER_ID;
	pData[playerid][pFindEms] = INVALID_PLAYER_ID;
	pData[playerid][pCall] = INVALID_PLAYER_ID;
	
	pData[playerid][MiningOreID] = -1;
	pData[playerid][CarryingLog] = -1;
	pData[playerid][EditingOreID] = -1;
	
	pData[playerid][EditingATMID] = -1;
	
	pData[playerid][gEditID] = -1;
	
	pData[playerid][pHarvestID] = -1;
	pData[playerid][pOffer] = -1;
	
	pData[playerid][pFill] = -1;
	
	pData[playerid][pMission] = -1;
	pData[playerid][pHauling] = -1;
	
	pData[playerid][pFacInvite] = -1;
	pData[playerid][pFacOffer] = -1;
	pData[playerid][pFamInvite] = -1;
	pData[playerid][pFamOffer] = -1;
	
	pData[playerid][pHBEMode] = 1;
	
	gPlayerUsingLoopingAnim[playerid] = 0;
	gPlayerAnimLibsPreloaded[playerid] = 0;
	
	pData[playerid][pLoc] = -1;
	SetPVarInt(playerid, "GiveUptime", 0);
	
	ResetVariableTazer(playerid);
	
	//Toys
    pData[playerid][PurchasedToy] = false;
	pData[playerid][toySelected] = 0;
	for(new i = 0; i < 6; i++)
	{
		pToys[playerid][i][toy_model] = 0;
		pToys[playerid][i][toy_bone] = 0;
		pToys[playerid][i][toy_x] = 0.0;
		pToys[playerid][i][toy_y] = 0.0;
		pToys[playerid][i][toy_z] = 0.0;
		pToys[playerid][i][toy_rx] = 0.0;
		pToys[playerid][i][toy_ry] = 0.0;
		pToys[playerid][i][toy_rz] = 0.0;
		pToys[playerid][i][toy_sx] = 0.0;
		pToys[playerid][i][toy_sy] = 0.0;
		pToys[playerid][i][toy_sz] = 0.0;
	}
}

KickEx(playerid, time = 500)
{
	SetTimerEx("_KickPlayerDelayed", time, false, "i", playerid);
	return 1;
}

IsValidRoleplayName(const name[]) {
    if(!name[0] || strfind(name, "_") == -1)
        return 0;

    else for (new i = 0, len = strlen(name); i != len; i ++) {
    if((i == 0) && (name[i] < 'A' || name[i] > 'Z'))
            return 0;

        else if((i != 0 && i < len  && name[i] == '_') && (name[i + 1] < 'A' || name[i + 1] > 'Z'))
            return 0;

        else if((name[i] < 'A' || name[i] > 'Z') && (name[i] < 'a' || name[i] > 'z') && name[i] != '_' && name[i] != '.')
            return 0;
    }
    return 1;
}

IsValidName(const name[])
{
	new len = strlen(name);

	for(new ch = 0; ch != len; ch++)
	{
		switch(name[ch])
		{
			case 'A' .. 'Z', 'a' .. 'z', '0' .. '9', ']', '[', '(', ')', '_', '.': continue;
			default: return false;
		}
	}
	return true;
}

IsValidPassword(const name[])
{
	new len = strlen(name);

	for(new ch = 0; ch != len; ch++)
	{
		switch(name[ch])
		{
			case 'A' .. 'Z', 'a' .. 'z', '0' .. '9', ']', '[', '(', ')', '_', '.', '@', '#': continue;
			default: return false;
		}
	}
	return true;
}

/*SetupPlayerTable()
{
	mysql_tquery(g_SQL, "CREATE TABLE IF NOT EXISTS `players` (`id` int(11) NOT NULL AUTO_INCREMENT,`username` varchar(24) NOT NULL,`password` char(64) NOT NULL,`salt` char(16) NOT NULL,`kills` mediumint(8) NOT NULL DEFAULT '0',`deaths` mediumint(8) NOT NULL DEFAULT '0',`x` float NOT NULL DEFAULT '0',`y` float NOT NULL DEFAULT '0',`z` float NOT NULL DEFAULT '0',`angle` float NOT NULL DEFAULT '0',`interior` tinyint(3) NOT NULL DEFAULT '0', PRIMARY KEY (`id`), UNIQUE KEY `username` (`username`))");
	return 1;
}*/

//----------[ Anti-Cheat Native ]------
//Anti Money Hack
GivePlayerMoneyEx(playerid, cashgiven)
{
	pData[playerid][pMoney] += cashgiven;
	GivePlayerMoney(playerid, cashgiven);
}
ResetPlayerMoneyEx(playerid)
{
	pData[playerid][pMoney] = 0;
	ResetPlayerMoney(playerid);
}

//Anti Health and Armour Hack
SetPlayerHealthEx(playerid, Float:heal)
{
	pData[playerid][pHealth] = heal;
	SetPlayerHealth(playerid, heal);
}

SetPlayerArmourEx(playerid, Float:armor)
{
	pData[playerid][pArmour] = armor;
	SetPlayerArmour(playerid, armor);
}

//Anti Weapon Hack
new const g_aWeaponSlots[] = {
    0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 10, 10, 10, 10, 10, 10, 8, 8, 8, 0, 0, 0, 2, 2, 2, 3, 3, 3, 4, 4, 5, 5, 4, 6, 6, 7, 7, 7, 7, 8, 12, 9, 9, 9, 11, 11, 11
};

ResetPlayerWeaponsEx(playerid)
{
    ResetPlayerWeapons(playerid);

    for (new i = 0; i < 13; i ++) {
        pData[playerid][pGuns][i] = 0;
        pData[playerid][pAmmo][i] = 0;
    }
    return 1;
}

ResetWeapon(playerid, weaponid)
{
	ResetPlayerWeapons(playerid);
	
    for (new i = 0; i < 13; i ++) {
        if(pData[playerid][pGuns][i] != weaponid) 
		{
            GivePlayerWeapon(playerid, pData[playerid][pGuns][i], pData[playerid][pAmmo][i]);
        }
        else 
		{
            pData[playerid][pGuns][i] = 0;
            pData[playerid][pAmmo][i] = 0;
        }
    }
    return 1;
}

UpdateWeapons(playerid)
{
    for(new i = 0; i < 13; i ++)
	{
		if(pData[playerid][pGuns][i])
		{
			GetPlayerWeaponData(playerid, i, pData[playerid][pGuns][i], pData[playerid][pAmmo][i]);

			if(pData[playerid][pGuns][i] != 0 && !pData[playerid][pAmmo][i]) 
			{
					pData[playerid][pGuns][i] = 0;
			}
		}
	}
    return 1;
}

IsWeaponModel(model) {
    new const g_aWeaponModels[] = {
        0, 331, 333, 334, 335, 336, 337, 338, 339, 341, 321, 322, 323, 324,
        325, 326, 342, 343, 344, 0, 0, 0, 346, 347, 348, 349, 350, 351, 352,
        353, 355, 356, 372, 357, 358, 359, 360, 361, 362, 363, 364, 365, 366,
        367, 368, 368, 371
    };
    for (new i = 0; i < sizeof(g_aWeaponModels); i ++) if(g_aWeaponModels[i] == model) {
        return 1;
    }
    return 0;
}

SetWeapons(playerid)
{
    ResetPlayerWeapons(playerid);

    for (new i = 0; i < 13; i ++) if(pData[playerid][pGuns][i] > 0 && pData[playerid][pAmmo][i] > 0) {
        GivePlayerWeapon(playerid, pData[playerid][pGuns][i], pData[playerid][pAmmo][i]);
    }
    return 1;
}

GetPlayerWeaponEx(playerid)
{
    new weaponid = GetPlayerWeapon(playerid);

    if(1 <= weaponid <= 46 && pData[playerid][pGuns][g_aWeaponSlots[weaponid]] == weaponid)
        return weaponid;

    return 0;
}

GetPlayerAmmoEx(playerid)
{
	new weaponid = GetPlayerWeapon(playerid);
	new ammo = pData[playerid][pAmmo][g_aWeaponSlots[weaponid]];
	if(1 <= weaponid <= 46 && pData[playerid][pGuns][g_aWeaponSlots[weaponid]] == weaponid)
	{
		if(pData[playerid][pGuns][g_aWeaponSlots[weaponid]] != 0 && pData[playerid][pAmmo][g_aWeaponSlots[weaponid]] > 0)
		{
			return ammo;
		}
	}
	return 0;
}

IsAHaulTruck(vehicleid)
{
	switch(GetVehicleModel(vehicleid))
	{
	    case 515, 514, 403, 498, 499, 609: return 1;
	    default: return 0;
	}

	return 0;
}

GivePlayerWeaponEx(playerid, weaponid, ammo)
{
    if(weaponid < 0 || weaponid > 46)
        return 0;

    pData[playerid][pGuns][g_aWeaponSlots[weaponid]] = weaponid;
    pData[playerid][pAmmo][g_aWeaponSlots[weaponid]] += ammo;

    return GivePlayerWeapon(playerid, weaponid, ammo);
}

ReturnWeaponName(weaponid)
{
    new weapon[22];
    switch(weaponid)
    {
        case 0: weapon = "Fist";
        case 18: weapon = "Molotov Cocktail";
        case 44: weapon = "Night Vision Goggles";
        case 45: weapon = "Thermal Goggles";
        case 54: weapon = "Fall";
        default: GetWeaponName(weaponid, weapon, sizeof(weapon));
    }
    return weapon;
}

//----------[ Admin Native ]----------
GetStaffRank(playerid)
{
	new name[40];
	if(pData[playerid][pAdmin] == 1)
	{
		name = ""RED_E"Moderator(1)";
	}
	else if(pData[playerid][pAdmin] == 2)
	{
		name = ""RED_E"Admin Junior(2)";
	}
	else if(pData[playerid][pAdmin] == 3)
	{
		name = ""RED_E"Admin(3)";
	}
	else if(pData[playerid][pAdmin] == 4)
	{
		name = ""RED_E"Senior Admin(4)";
	}
	else if(pData[playerid][pAdmin] == 5)
	{
		name = ""RED_E"Executive Admin(5)";
	}
	else if(pData[playerid][pAdmin] == 6)
	{
		name = ""RED_E"Chief Executive Officer(6)";
	}
	else if(pData[playerid][pHelper] == 1 && pData[playerid][pAdmin] == 0)
	{
		name = ""GREEN_E"Junior Helper";
	}
	else if(pData[playerid][pHelper] == 2 && pData[playerid][pAdmin] == 0)
	{
		name = ""GREEN_E"Senior Helper";
	}
	else if(pData[playerid][pHelper] == 3 && pData[playerid][pAdmin] == 0)
	{
		name = ""GREEN_E"Head Helper";
	}
	else
	{
		name = "None";
	}
	return name;
}

SendStaffMessage(color, const str[], {Float,_}:...)
{
    static
        args,
        start,
        end,
        string[144]
    ;
    #emit LOAD.S.pri 8
    #emit STOR.pri args

    if(args > 8)
    {
        #emit ADDR.pri str
        #emit STOR.pri start

        for (end = start + (args - 8); end > start; end -= 4)
        {
            #emit LREF.pri end
            #emit PUSH.pri
        }
        #emit PUSH.S str
        #emit PUSH.C 144
        #emit PUSH.C string

        #emit LOAD.S.pri 8
        #emit ADD.C 4
        #emit PUSH.pri

        #emit SYSREQ.C format
        #emit LCTRL 5
        #emit SCTRL 4

        foreach (new i : Player)
        {
            if(pData[i][pAdmin] >= 1 || pData[i][pHelper] >= 1) {
                SendClientMessageEx(i, color, "[STAFF MSG] "YELLOW_E"%s", string);
            }
        }
        return 1;
    }
    foreach (new i : Player)
    {
        if(pData[i][pAdmin] >= 1 || pData[i][pHelper] >= 1) {
            SendClientMessageEx(i, color, "[STAFF MSG] "YELLOW_E"%s", string);
        }
    }
    return 1;
}

SendAdminMessage(color, const str[], {Float,_}:...)
{
    static
        args,
        start,
        end,
        string[144]
    ;
    #emit LOAD.S.pri 8
    #emit STOR.pri args

    if(args > 8)
    {
        #emit ADDR.pri str
        #emit STOR.pri start

        for (end = start + (args - 8); end > start; end -= 4)
        {
            #emit LREF.pri end
            #emit PUSH.pri
        }
        #emit PUSH.S str
        #emit PUSH.C 144
        #emit PUSH.C string

        #emit LOAD.S.pri 8
        #emit ADD.C 4
        #emit PUSH.pri

        #emit SYSREQ.C format
        #emit LCTRL 5
        #emit SCTRL 4

        foreach (new i : Player)
        {
            if(pData[i][pAdmin] >= 1 /*&& !pData[i][pDisableAdmin]*/) {
				SendClientMessageEx(i, color, "[ADMIN MSG] "YELLOW_E"%s", string);
            }
        }
        return 1;
    }
    foreach (new i : Player)
    {
        if(pData[i][pAdmin] >= 1 /*&& !pData[i][pDisableAdmin]*/) {
			SendClientMessageEx(i, color, "[ADMIN MSG] "YELLOW_E"%s", string);
        }
    }
    return 1;
}

StaffCommandLog(const command[], adminid, player = INVALID_PLAYER_ID, logstr[] = '*')
{
	// Set the logging message to be correct
	new logStrEscaped[128], query[512];
	if(logstr[0] == '*')
		logStrEscaped = "*", printf("AdminCommandLog: logstr detected as unnecessary, logStrEscaped = '%s' (must be '*')", logStrEscaped);
	else
		mysql_escape_string(logstr, logStrEscaped), printf("AdminCommandLog: logstr detected necessary, escaped from '%s' to '%s'", logstr, logStrEscaped);

	if(player != INVALID_PLAYER_ID)
	{
		// The action involves a player, get their name
		mysql_format(g_SQL, query, sizeof(query), "INSERT INTO logstaff (command,admin,adminid,player,playerid,str,time) VALUES('%s','%s(%s)',%d,'%s',%d,'%s',UNIX_TIMESTAMP())", command, pData[adminid][pName], pData[adminid][pAdminname], pData[adminid][pID], pData[player][pName], pData[player][pID], logStrEscaped);
	}
	else
	{
		mysql_format(g_SQL, query, sizeof(query), "INSERT INTO logstaff (command,admin,adminid,str,time) VALUES('%s','%s(%s)',%d,'%s',UNIX_TIMESTAMP())", command, pData[adminid][pName], pData[adminid][pAdminname], pData[adminid][pID], logStrEscaped);
	}

	// Send the query!
	mysql_tquery(g_SQL, query);
	return 1;
}

//----------[ VIP Native ]----------
GetVipRank(playerid)
{
	new name[40];
	if(pData[playerid][pVip] == 1)
	{
		name = ""LG_E"Regular(1)";
	}
	else if(pData[playerid][pVip] == 2)
	{
		name = ""YELLOW_E"Premium(2)";
	}
	else if(pData[playerid][pVip] == 3)
	{
		name = ""PURPLE_E"VIP Player(3)";
	}
	else
	{
		name = "None";
	}
	return name;
}

//----------[ Faction Native ]----------
SetFactionColor(playerid)
{
    new factionid = pData[playerid][pFaction];

    if(factionid == 1)
	{
		SetPlayerColor(playerid, COLOR_BLUE);
	}
	else if(factionid == 2)
	{
		SetPlayerColor(playerid, COLOR_LBLUE);
	}
	else if(factionid == 3)
	{
		SetPlayerColor(playerid, COLOR_PINK2);
	}
	else if(factionid == 4)
	{
		SetPlayerColor(playerid, COLOR_ORANGE2);
	}
	else
	{
		SetPlayerColor(playerid, COLOR_WHITE);
	}
	return 1;
}

GetFactionRank(playerid)
{
	new rank[24];
	if(pData[playerid][pFaction] == 1)
	{
		if(pData[playerid][pFactionRank] == 1)
		{
			rank = "Officer";
		}
		else if(pData[playerid][pFactionRank] == 2)
		{
			rank = "Staff";
		}
		else if(pData[playerid][pFactionRank] == 3)
		{
			rank = "Warden";
		}
		else if(pData[playerid][pFactionRank] == 4)
		{
			rank = "Captain";
		}
		else if(pData[playerid][pFactionRank] == 5)
		{
			rank = "Commander";
		}
		else if(pData[playerid][pFactionRank] == 6)
		{
			rank = "General";
		}
		else
		{
			rank = "None";
		}
	}
  	if(pData[playerid][pFaction] == 2)
	{
		if(pData[playerid][pFactionRank] == 1)
		{
			rank = "Officer";
		}
		else if(pData[playerid][pFactionRank] == 2)
		{
			rank = "Agent Staff";
		}
		else if(pData[playerid][pFactionRank] == 3)
		{
			rank = "Regent";
		}
		else if(pData[playerid][pFactionRank] == 4)
		{
			rank = "Mayor";
		}
		else if(pData[playerid][pFactionRank] == 5)
		{
			rank = "Gubernur";
		}
		else if(pData[playerid][pFactionRank] == 6)
		{
			rank = "President";
		}
		else
		{
			rank = "None";
		}
	}
	if(pData[playerid][pFaction] == 3)
	{
		if(pData[playerid][pFactionRank] == 1)
		{
			rank = "Officer";
		}
		else if(pData[playerid][pFactionRank] == 2)
		{
			rank = "Staff";
		}
		else if(pData[playerid][pFactionRank] == 3)
		{
			rank = "Paramedic";
		}
		else if(pData[playerid][pFactionRank] == 4)
		{
			rank = "Specialist";
		}
		else if(pData[playerid][pFactionRank] == 5)
		{
			rank = "Commissioner";
		}
		else if(pData[playerid][pFactionRank] == 6)
		{
			rank = "Doctor";
		}
		else
		{
			rank = "None";
		}
	}
  	if(pData[playerid][pFaction] == 4)
	{
		if(pData[playerid][pFactionRank] == 1)
		{
			rank = "Officer";
		}
		else if(pData[playerid][pFactionRank] == 2)
		{
			rank = "Staff";
		}
		else if(pData[playerid][pFactionRank] == 3)
		{
			rank = "Reporter";
		}
		else if(pData[playerid][pFactionRank] == 4)
		{
			rank = "Producer";
		}
		else if(pData[playerid][pFactionRank] == 5)
		{
			rank = "Manager";
		}
		else if(pData[playerid][pFactionRank] == 6)
		{
			rank = "Director";
		}
		else
		{
			rank = "None";
		}
	}
	return rank;
}

SetPlayerArrest(playerid, cellid)
{
	if(cellid == 1)
	{
		SetPlayerPositionEx(playerid, 227.49, 109.84, 999.01, 3.70, 2000);
	}
	else if(cellid == 2)
	{
		SetPlayerPositionEx(playerid, 223.51, 109.61, 999.01, 0.25, 2000);
	}
	else if(cellid == 3)
	{
		SetPlayerPositionEx(playerid, 219.52, 109.52, 999.01, 150, 2000);
	}
	else if(cellid == 4)
	{
		SetPlayerPositionEx(playerid, 215.33, 109.62, 999.01, 357.05, 2000);
	}
	SetPlayerVirtualWorld(playerid, 0);
	SetPlayerInterior(playerid, 10);
	ShowPlayerDialog(playerid, -1, DIALOG_STYLE_LIST, "Close", "Close", "Close", "Close");
	SetPlayerWantedLevel(playerid, 0);
	PlayerPlaySound(playerid, 1186, 0, 0, 0);
    ResetPlayerWeaponsEx(playerid);
    SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
	pData[playerid][pCuffed] = 0;
	pData[playerid][pInBiz] = -1;
	pData[playerid][pInHouse] = -1;
	pData[playerid][pInDoor] = -1;
}

SendFactionMessage(factionid, color, const str[], {Float,_}:...)
{
    static
        args,
        start,
        end,
        string[144]
    ;
    #emit LOAD.S.pri 8
    #emit STOR.pri args

    if(args > 12)
    {
        #emit ADDR.pri str
        #emit STOR.pri start

        for (end = start + (args - 12); end > start; end -= 4)
        {
            #emit LREF.pri end
            #emit PUSH.pri
        }
        #emit PUSH.S str
        #emit PUSH.C 144
        #emit PUSH.C string
        #emit PUSH.C args

        #emit SYSREQ.C format
        #emit LCTRL 5
        #emit SCTRL 4

        foreach (new i : Player) if(pData[i][pFaction] == factionid /*&& !pData[i][pDisableFaction]*/) {
                SendClientMessage(i, color, string);
        }
        return 1;
    }
    foreach (new i : Player) if(pData[i][pFaction] == factionid /*&& !pData[i][pDisableFaction]*/) {
        SendClientMessage(i, color, str);
    }
    return 1;
}

//----------[ Family Native]----------
GetFamilyRank(playerid)
{
	new rank[24];
	if(pData[playerid][pFamily] != -1)
	{
		if(pData[playerid][pFamilyRank] == 1) 
		{
			rank = "Outsider(1)";
		}
		else if(pData[playerid][pFamilyRank] == 2) 
		{
			rank = "Associate(2)";
		}
		else if(pData[playerid][pFamilyRank] == 3) 
		{
			rank = "Soldier(3)";
		}
		else if(pData[playerid][pFamilyRank] == 4) 
		{
			rank = "Advisor(4)";
		}
		else if(pData[playerid][pFamilyRank] == 5) 
		{
			rank = "UnderBoss(5)";
		}
		else if(pData[playerid][pFamilyRank] == 6) 
		{
			rank = "GodFather(6)";
		}
		else
		{
			rank = "None";
		}
	}
	else
	{
		rank = "None";
	}
	return rank;
}


public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	printf("[OnDialogResponse]: %s(%d) has used dialog id: %d Listitem: %d", pData[playerid][pName], playerid, dialogid, listitem);
    
	if(dialogid == DIALOG_PAYCHECK)
	{
		if(response)
		{
			if(pData[playerid][pPaycheck] < 3600) return Error(playerid, "Sekarang belum waktunya anda mengambil paycheck.");
			
			new query[512];
			mysql_format(g_SQL, query, sizeof(query), "SELECT * FROM salary WHERE owner='%d' ORDER BY id ASC LIMIT 30", pData[playerid][pID]);
			mysql_query(g_SQL, query);
			new rows = cache_num_rows();
			if(rows) 
			{
				new list[2000], date[30], info[16], money, totalduty, gajiduty, totalsal, total, pajak, hasil;
				
				totalduty = pData[playerid][pOnDutyTime] + pData[playerid][pTaxiTime];
				for(new i; i < rows; ++i)
				{
					cache_get_value_name(i, "info", info);
					cache_get_value_name(i, "date", date);
					cache_get_value_name_int(i, "money", money);
					totalsal += money;
				}
				
				if(totalduty > 600)
				{
					gajiduty = 600;
				}
				else
				{
					gajiduty = totalduty;
				}
				total = gajiduty + totalsal;
				pajak = total / 100 * 10;
				hasil = total - pajak;
				
				format(list, sizeof(list), "Total gaji yang masuk ke rekening bank anda adalah: "LG_E"%s", FormatMoney(hasil));
				ShowPlayerDialog(playerid, DIALOG_UNUSED, DIALOG_STYLE_MSGBOX, "Paycheck", list, "Close", "");
				pData[playerid][pBankMoney] += hasil;
				Server_MinMoney(hasil);
				pData[playerid][pPaycheck] = 0;
				pData[playerid][pOnDutyTime] = 0;
				pData[playerid][pTaxiTime] = 0;
				mysql_format(g_SQL, query, sizeof(query), "DELETE FROM salary WHERE owner='%d'", pData[playerid][pID]);
				mysql_query(g_SQL, query);
			}
			else
			{
				new list[2000], totalduty, gajiduty, total, pajak, hasil;
				
				totalduty = pData[playerid][pOnDutyTime] + pData[playerid][pTaxiTime];
				
				if(totalduty > 600)
				{
					gajiduty = 600;
				}
				else
				{
					gajiduty = totalduty;
				}
				total = gajiduty;
				pajak = total / 100 * 10;
				hasil = total - pajak;
				
				format(list, sizeof(list), "Total gaji yang masuk ke rekening bank anda adalah: "LG_E"%s", FormatMoney(hasil));
				ShowPlayerDialog(playerid, DIALOG_UNUSED, DIALOG_STYLE_MSGBOX, "Paycheck", list, "Close", "");
				pData[playerid][pBankMoney] += hasil;
				Server_MinMoney(hasil);
				pData[playerid][pPaycheck] = 0;
				pData[playerid][pOnDutyTime] = 0;
				pData[playerid][pTaxiTime] = 0;
			}
		}
	}
}


public OnPlayerEnterCheckpoint(playerid)
{
	new playerState = GetPlayerState(playerid);
    if(playerState == PLAYER_STATE_ONFOOT )
    {
	    if(Kurir[playerid] == true)
	    {
            if(angkatBox[playerid] == false)
	        {
				 Error(playerid,"Silahkan bawa Box pengiriman barang, /angkatbox");
			}
			else if(angkatBox[playerid] == true)
	        {
	        RemovePlayerAttachedObject(playerid, BOX_INDEX);
			GameTextForPlayer(playerid, "~g~MELETAKKAN BARANG...", 4000, 3);
            ApplyAnimation(playerid,"BOMBER","BOM_Plant",4.0,0 ,0,0,0,0,1);
	        Unload_Timer[playerid] = SetTimerEx("PekerjaanSelesai", 5000, false, "i", playerid);
	        TogglePlayerControllable(playerid,0);
		    }
        }
	}
	if(pData[playerid][pHauling] > -1)
	{
		if(IsPlayerInRangeOfPoint(playerid, 5.5, 336.70, 895.54, 20.40))
		{
			DisablePlayerCheckpoint(playerid);
			Info(playerid, "/buy , /gps(My Hauling) , /storegas.");
		}
	}
	if(pData[playerid][pCP] == 1)
	{
		pData[playerid][pJobTime] = 120;
		DisablePlayerCheckpoint(playerid);
		AddPlayerSalary(playerid, "Job (Kurir)", 400);
        pData[playerid][pKurirEnd] = 0;
        pData[playerid][pCP] = 0;
		Info(playerid, "Job (Kurir) telah masuk ke pending salary anda!");
		RemovePlayerFromVehicle(playerid);
		SetTimerEx("RespawnPV", 3000, false, "d", GetPlayerVehicleID(playerid));
	}
	if(pData[playerid][CarryingLog] != -1)
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
		DisablePlayerCheckpoint(playerid);
		return 1;
	}
	if(pData[playerid][pFindEms] != INVALID_PLAYER_ID)
	{
		pData[playerid][pFindEms] = INVALID_PLAYER_ID;
		DisablePlayerCheckpoint(playerid);
	}
	if(pData[playerid][pSideJob] == 1)
	{
		new vehicleid = GetPlayerVehicleID(playerid);
		if(GetVehicleModel(vehicleid) == 574)
		{
			if (IsPlayerInRangeOfPoint(playerid, 7.0,sweperpoint1))
			{
				SetPlayerCheckpoint(playerid, sweperpoint2, 7.0);
				//GameTextForPlayer(playerid, "~g~Bersih!", 1000, 3);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,sweperpoint2))
			{
				SetPlayerCheckpoint(playerid, sweperpoint3, 7.0);
				//GameTextForPlayer(playerid, "~g~Bersih!", 1000, 3);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,sweperpoint3))
			{
				SetPlayerCheckpoint(playerid, sweperpoint4, 7.0);
				//GameTextForPlayer(playerid, "~g~Bersih!", 1000, 3);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,sweperpoint4))
			{
				SetPlayerCheckpoint(playerid, sweperpoint5, 7.0);
				//GameTextForPlayer(playerid, "~g~Bersih!", 1000, 3);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,sweperpoint5))
			{
				SetPlayerCheckpoint(playerid, sweperpoint6, 7.0);
				//GameTextForPlayer(playerid, "~g~Bersih!", 1000, 3);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,sweperpoint6))
			{
				SetPlayerCheckpoint(playerid, sweperpoint7, 7.0);
				//GameTextForPlayer(playerid, "~g~Bersih!", 1000, 3);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,sweperpoint7))
			{
				SetPlayerCheckpoint(playerid, sweperpoint8, 7.0);
				//GameTextForPlayer(playerid, "~g~Bersih!", 1000, 3);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,sweperpoint8))
			{
				SetPlayerCheckpoint(playerid, sweperpoint9, 7.0);
				//GameTextForPlayer(playerid, "~g~Bersih!", 1000, 3);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,sweperpoint9))
			{
				SetPlayerCheckpoint(playerid, sweperpoint10, 7.0);
				//GameTextForPlayer(playerid, "~g~Bersih!", 1000, 3);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,sweperpoint10))
			{
				SetPlayerCheckpoint(playerid, sweperpoint11, 7.0);
				//GameTextForPlayer(playerid, "~g~Bersih!", 1000, 3);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,sweperpoint11))
			{
				SetPlayerCheckpoint(playerid, sweperpoint12, 7.0);
				//GameTextForPlayer(playerid, "~g~Bersih!", 1000, 3);
			}
			if(IsPlayerInRangeOfPoint(playerid, 7.0,sweperpoint12))
			{
				pData[playerid][pSideJob] = 0;
				pData[playerid][pSideJobTime] = 120;
				DisablePlayerCheckpoint(playerid);
				AddPlayerSalary(playerid, "Sidejob(Sweeper)", 150);
				Info(playerid, "Sidejob(Sweeper) telah masuk ke pending salary anda!");
				RemovePlayerFromVehicle(playerid);
				SetTimerEx("RespawnPV", 3000, false, "d", vehicleid);
			}
		}
	}
	if(pData[playerid][pSideJob] == 2)
	{
		new vehicleid = GetPlayerVehicleID(playerid);
		if(GetVehicleModel(vehicleid) == 431)
		{
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint1))
			{
				SetPlayerCheckpoint(playerid, buspoint2, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint2))
			{
				SetPlayerCheckpoint(playerid, buspoint3, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint3))
			{
				SetPlayerCheckpoint(playerid, buspoint4, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint4))
			{
				SetPlayerCheckpoint(playerid, buspoint5, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint5))
			{
				SetPlayerCheckpoint(playerid, buspoint6, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint6))
			{
				SetPlayerCheckpoint(playerid, buspoint7, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint7))
			{
				SetPlayerCheckpoint(playerid, buspoint8, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint8))
			{
				SetPlayerCheckpoint(playerid, buspoint9, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint9))
			{
				SetPlayerCheckpoint(playerid, buspoint10, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint10))
			{
				SetPlayerCheckpoint(playerid, buspoint11, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint11))
			{
				SetPlayerCheckpoint(playerid, buspoint12, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint12))
			{
				SetPlayerCheckpoint(playerid, buspoint13, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint13))
			{
				SetPlayerCheckpoint(playerid, buspoint14, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint14))
			{
				SetPlayerCheckpoint(playerid, buspoint15, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint15))
			{
				SetPlayerCheckpoint(playerid, buspoint16, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint16))
			{
				SetPlayerCheckpoint(playerid, buspoint17, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint17))
			{
				SetPlayerCheckpoint(playerid, buspoint18, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint18))
			{
				SetPlayerCheckpoint(playerid, buspoint19, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint19))
			{
				SetPlayerCheckpoint(playerid, buspoint20, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint20))
			{
				SetPlayerCheckpoint(playerid, buspoint21, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint21))
			{
				SetPlayerCheckpoint(playerid, buspoint22, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint22))
			{
				SetPlayerCheckpoint(playerid, buspoint23, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint23))
			{
				SetPlayerCheckpoint(playerid, buspoint24, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint24))
			{
				SetPlayerCheckpoint(playerid, buspoint25, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint25))
			{
				SetPlayerCheckpoint(playerid, buspoint26, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint26))
			{
				SetPlayerCheckpoint(playerid, buspoint27, 7.0);
			}
			if(IsPlayerInRangeOfPoint(playerid, 7.0,buspoint27))
			{
				pData[playerid][pSideJob] = 0;
				pData[playerid][pSideJobTime] = 360;
				DisablePlayerCheckpoint(playerid);
				AddPlayerSalary(playerid, "Sidejob(Bus)", 200);
				Info(playerid, "Sidejob(Bus) telah masuk ke pending salary anda!");
				RemovePlayerFromVehicle(playerid);
				SetTimerEx("RespawnPV", 3000, false, "d", vehicleid);
			}
		}
	}
	if(pData[playerid][pSideJob] == 3)
	{
		new vehicleid = GetPlayerVehicleID(playerid);
		if(GetVehicleModel(vehicleid) == 530)
		{
			if (IsPlayerInRangeOfPoint(playerid, 4.0,forpoint1))
			{
				SetPlayerCheckpoint(playerid, 2400.02,-2565.49,13.21, 4.0);
				TogglePlayerControllable(playerid, 0);
				GameTextForPlayer(playerid, "~w~MEMUAT ~g~BARANG...", 5000, 3);
				SetTimerEx("JobForklift", 3000, false, "i", playerid);
				return 1;
			}
			if (IsPlayerInRangeOfPoint(playerid, 4.0,forpoint2))
			{
				SetPlayerCheckpoint(playerid, 2752.89,-2392.60,13.64, 4.0);
				TogglePlayerControllable(playerid, 0);
				GameTextForPlayer(playerid, "~w~MELETAKKAN ~g~BARANG...", 5000, 3);
				SetTimerEx("JobForklift", 3000, false, "i", playerid);
				return 1;
			}
			if(IsPlayerInRangeOfPoint(playerid, 4.0,forpoint3))
			{
				pData[playerid][pSideJob] = 0;
				pData[playerid][pSideJobTime] = 80;
				DisablePlayerCheckpoint(playerid);
				AddPlayerSalary(playerid, "Sidejob(Forklift)", 70);
				Info(playerid, "Sidejob(Forklift) telah masuk ke pending salary anda!");
				RemovePlayerFromVehicle(playerid);
				SetTimerEx("RespawnPV", 3000, false, "d", vehicleid);
				return 1;
			}
		}
	}
	//DisablePlayerCheckpoint(playerid);
	return 1;
}

forward JobForklift(playerid);
public JobForklift(playerid)
{
	TogglePlayerControllable(playerid, 1);
	GameTextForPlayer(playerid, "~w~SELESAI!", 5000, 3);
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    if((newkeys & KEY_JUMP) && !IsPlayerInAnyVehicle(playerid))
    {
        AntiBHOP[playerid] ++;
        if(pData[playerid][pRFoot] <= 70 || pData[playerid][pLFoot] <= 70)
        {
        	SetTimerEx("AppuiePasJump", 1700, false, "i", playerid);
        	if(AntiBHOP[playerid] == 2)
        	{
        		ApplyAnimation(playerid, "PED", "BIKE_fall_off", 4.1, 0, 1, 1, 1, 0, 1);
        		new jpName[MAX_PLAYER_NAME];
        		GetPlayerName(playerid,jpName,MAX_PLAYER_NAME);
        		SetTimerEx("AppuieJump", 3000, false, "i", playerid);
        	}
        	return 1;
        }
        if(pData[playerid][pRFoot] <= 90 || pData[playerid][pLFoot] <= 90)
        {
        	SetTimerEx("AppuiePasJump", 700, false, "i", playerid);
        	if(AntiBHOP[playerid] == 2)
        	{
        		ApplyAnimation(playerid, "PED", "BIKE_fall_off", 4.1, 0, 1, 1, 1, 0, 1);
        		new jpName[MAX_PLAYER_NAME];
        		GetPlayerName(playerid,jpName,MAX_PLAYER_NAME);
        		SetTimerEx("AppuieJump", 3000, false, "i", playerid);
        	}
        	return 1;
        }
        if(pData[playerid][pRFoot] <= 40 || pData[playerid][pLFoot] <= 40)
        {
        	SetTimerEx("AppuiePasJump", 3200, false, "i", playerid);
        	if(AntiBHOP[playerid] == 2)
        	{
        		ApplyAnimation(playerid, "PED", "BIKE_fall_off", 4.1, 0, 1, 1, 1, 0, 1);
        		new jpName[MAX_PLAYER_NAME];
        		GetPlayerName(playerid,jpName,MAX_PLAYER_NAME);
        		SetTimerEx("AppuieJump", 3000, false, "i", playerid);
        	}
        	return 1;
        }
    }
	if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT && (newkeys & KEY_NO))
	{
	    if(pData[playerid][CarryingLumber])
		{
			Player_DropLumber(playerid);
		}
		else if(pData[playerid][CarryingLog] == 0)
		{
			Player_DropLog(playerid, pData[playerid][CarryingLog]);
			Info(playerid, "You dropping metal ore.");
			DisablePlayerCheckpoint(playerid);
		}
		else if(pData[playerid][CarryingLog] == 1)
		{
			Player_DropLog(playerid, pData[playerid][CarryingLog]);
			Info(playerid, "You dropping coal ore.");
			DisablePlayerCheckpoint(playerid);
		}
	}
	if((newkeys & KEY_SECONDARY_ATTACK))
    {
		foreach(new did : Doors)
		{
			if(IsPlayerInRangeOfPoint(playerid, 2.8, dData[did][dExtposX], dData[did][dExtposY], dData[did][dExtposZ]))
			{
				if(dData[did][dIntposX] == 0.0 && dData[did][dIntposY] == 0.0 && dData[did][dIntposZ] == 0.0)
					return Error(playerid, "Interior entrance masih kosong, atau tidak memiliki interior.");

				if(dData[did][dLocked])
					return Error(playerid, "This entrance is locked at the moment.");
					
				if(dData[did][dFaction] > 0)
				{
					if(dData[did][dFaction] != pData[playerid][pFaction])
						return Error(playerid, "This door only for faction.");
				}
				if(dData[did][dFamily] > 0)
				{
					if(dData[did][dFamily] != pData[playerid][pFamily])
						return Error(playerid, "This door only for family.");
				}
				
				if(dData[did][dVip] > pData[playerid][pVip])
					return Error(playerid, "Your VIP level not enough to enter this door.");
				
				if(dData[did][dAdmin] > pData[playerid][pAdmin])
					return Error(playerid, "Your admin level not enough to enter this door.");
					
				if(strlen(dData[did][dPass]))
				{
					new params[256];
					if(sscanf(params, "s[256]", params)) return Usage(playerid, "/enter [password]");
					if(strcmp(params, dData[did][dPass])) return Error(playerid, "Invalid door password.");
					
					if(dData[did][dCustom])
					{
						SetPlayerPositionEx(playerid, dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ], dData[did][dIntposA]);
					}
					else
					{
						SetPlayerPosition(playerid, dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ], dData[did][dIntposA]);
					}
					pData[playerid][pInDoor] = did;
					SetPlayerInterior(playerid, dData[did][dIntint]);
					SetPlayerVirtualWorld(playerid, dData[did][dIntvw]);
					SetCameraBehindPlayer(playerid);
					SetPlayerWeather(playerid, 0);
				}
				else
				{
					if(dData[did][dCustom])
					{
						SetPlayerPositionEx(playerid, dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ], dData[did][dIntposA]);
					}
					else
					{
						SetPlayerPosition(playerid, dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ], dData[did][dIntposA]);
					}
					pData[playerid][pInDoor] = did;
					SetPlayerInterior(playerid, dData[did][dIntint]);
					SetPlayerVirtualWorld(playerid, dData[did][dIntvw]);
					SetCameraBehindPlayer(playerid);
					SetPlayerWeather(playerid, 0);
				}
			}
			if(IsPlayerInRangeOfPoint(playerid, 2.8, dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ]))
			{
				if(dData[did][dFaction] > 0)
				{
					if(dData[did][dFaction] != pData[playerid][pFaction])
						return Error(playerid, "This door only for faction.");
				}
				
				if(dData[did][dCustom])
				{
					SetPlayerPositionEx(playerid, dData[did][dExtposX], dData[did][dExtposY], dData[did][dExtposZ], dData[did][dExtposA]);
				}
				else
				{
					SetPlayerPositionEx(playerid, dData[did][dExtposX], dData[did][dExtposY], dData[did][dExtposZ], dData[did][dExtposA]);
				}
				pData[playerid][pInDoor] = -1;
				SetPlayerInterior(playerid, dData[did][dExtint]);
				SetPlayerVirtualWorld(playerid, dData[did][dExtvw]);
				SetCameraBehindPlayer(playerid);
				SetPlayerWeather(playerid, WorldWeather);
			}
        }
		//Bisnis
		foreach(new bid : Bisnis)
		{
			if(IsPlayerInRangeOfPoint(playerid, 2.8, bData[bid][bExtposX], bData[bid][bExtposY], bData[bid][bExtposZ]))
			{
				if(bData[bid][bIntposX] == 0.0 && bData[bid][bIntposY] == 0.0 && bData[bid][bIntposZ] == 0.0)
					return Error(playerid, "Interior bisnis masih kosong, atau tidak memiliki interior.");

				if(bData[bid][bLocked])
					return Error(playerid, "This bisnis is locked!");
					
				pData[playerid][pInBiz] = bid;
				SetPlayerPositionEx(playerid, bData[bid][bIntposX], bData[bid][bIntposY], bData[bid][bIntposZ], bData[bid][bIntposA]);
				
				SetPlayerInterior(playerid, bData[bid][bInt]);
				SetPlayerVirtualWorld(playerid, bid);
				SetCameraBehindPlayer(playerid);
				SetPlayerWeather(playerid, 0);
			}
        }
		new inbisnisid = pData[playerid][pInBiz];
		if(pData[playerid][pInBiz] != -1 && IsPlayerInRangeOfPoint(playerid, 2.8, bData[inbisnisid][bIntposX], bData[inbisnisid][bIntposY], bData[inbisnisid][bIntposZ]))
		{
			pData[playerid][pInBiz] = -1;
			SetPlayerPositionEx(playerid, bData[inbisnisid][bExtposX], bData[inbisnisid][bExtposY], bData[inbisnisid][bExtposZ], bData[inbisnisid][bExtposA]);
			
			SetPlayerInterior(playerid, 0);
			SetPlayerVirtualWorld(playerid, 0);
			SetCameraBehindPlayer(playerid);
			SetPlayerWeather(playerid, WorldWeather);
		}
		//Houses
		foreach(new hid : Houses)
		{
			if(IsPlayerInRangeOfPoint(playerid, 2.5, hData[hid][hExtposX], hData[hid][hExtposY], hData[hid][hExtposZ]))
			{
				if(hData[hid][hIntposX] == 0.0 && hData[hid][hIntposY] == 0.0 && hData[hid][hIntposZ] == 0.0)
					return Error(playerid, "Interior house masih kosong, atau tidak memiliki interior.");

				if(hData[hid][hLocked])
					return Error(playerid, "This house is locked!");
				
				pData[playerid][pInHouse] = hid;
				SetPlayerPositionEx(playerid, hData[hid][hIntposX], hData[hid][hIntposY], hData[hid][hIntposZ], hData[hid][hIntposA]);

				SetPlayerInterior(playerid, hData[hid][hInt]);
				SetPlayerVirtualWorld(playerid, hid);
				SetCameraBehindPlayer(playerid);
				SetPlayerWeather(playerid, 0);
			}
        }
		new inhouseid = pData[playerid][pInHouse];
		if(pData[playerid][pInHouse] != -1 && IsPlayerInRangeOfPoint(playerid, 2.8, hData[inhouseid][hIntposX], hData[inhouseid][hIntposY], hData[inhouseid][hIntposZ]))
		{
			pData[playerid][pInHouse] = -1;
			SetPlayerPositionEx(playerid, hData[inhouseid][hExtposX], hData[inhouseid][hExtposY], hData[inhouseid][hExtposZ], hData[inhouseid][hExtposA]);
			
			SetPlayerInterior(playerid, 0);
			SetPlayerVirtualWorld(playerid, 0);
			SetCameraBehindPlayer(playerid);
			SetPlayerWeather(playerid, WorldWeather);
		}
		//Family
		foreach(new fid : FAMILYS)
		{
			if(IsPlayerInRangeOfPoint(playerid, 2.8, fData[fid][fExtposX], fData[fid][fExtposY], fData[fid][fExtposZ]))
			{
				if(fData[fid][fIntposX] == 0.0 && fData[fid][fIntposY] == 0.0 && fData[fid][fIntposZ] == 0.0)
					return Error(playerid, "Interior masih kosong, atau tidak memiliki interior.");

				if(pData[playerid][pFaction] == 0)
					if(pData[playerid][pFamily] == -1)
						return Error(playerid, "You dont have registered for this door!");
					
				SetPlayerPositionEx(playerid, fData[fid][fIntposX], fData[fid][fIntposY], fData[fid][fIntposZ], fData[fid][fIntposA]);

				SetPlayerInterior(playerid, fData[fid][fInt]);
				SetPlayerVirtualWorld(playerid, fid);
				SetCameraBehindPlayer(playerid);
				//pData[playerid][pInBiz] = fid;
				SetPlayerWeather(playerid, 0);
			}
			if(IsPlayerInRangeOfPoint(playerid, 2.8, fData[fid][fIntposX], fData[fid][fIntposY], fData[fid][fIntposZ]))
			{
				SetPlayerPositionEx(playerid, fData[fid][fExtposX], fData[fid][fExtposY], fData[fid][fExtposZ], fData[fid][fExtposA]);

				SetPlayerInterior(playerid, 0);
				SetPlayerVirtualWorld(playerid, 0);
				SetCameraBehindPlayer(playerid);
				SetPlayerWeather(playerid, WorldWeather);
				//pData[playerid][pInBiz] = -1;
			}
        }
	}
	//SAPD Taser/Tazer
	if(newkeys & KEY_FIRE && TaserData[playerid][TaserEnabled] && GetPlayerWeapon(playerid) == 0 && !IsPlayerInAnyVehicle(playerid) && TaserData[playerid][TaserCharged])
	{
  		TaserData[playerid][TaserCharged] = false;

	    new Float: x, Float: y, Float: z, Float: health;
     	GetPlayerPos(playerid, x, y, z);
	    PlayerPlaySound(playerid, 6003, 0.0, 0.0, 0.0);
	    ApplyAnimation(playerid, "KNIFE", "KNIFE_3", 4.1, 0, 1, 1, 0, 0, 1);
		pData[playerid][pActivityTime] = 0;
	    TaserData[playerid][ChargeTimer] = SetTimerEx("ChargeUp", 1000, true, "i", playerid);
		PlayerTextDrawSetString(playerid, ActiveTD[playerid], "Recharge...");
		PlayerTextDrawShow(playerid, ActiveTD[playerid]);
		ShowPlayerProgressBar(playerid, pData[playerid][activitybar]);

	    for(new i, maxp = GetPlayerPoolSize(); i <= maxp; ++i)
		{
	        if(!IsPlayerConnected(i)) continue;
          	if(playerid == i) continue;
          	if(TaserData[i][TaserCountdown] != 0) continue;
          	if(IsPlayerInAnyVehicle(i)) continue;
			if(GetPlayerDistanceFromPoint(i, x, y, z) > 2.0) continue;
			ClearAnimations(i, 1);
			TogglePlayerControllable(i, false);
   			ApplyAnimation(i, "CRACK", "crckdeth2", 4.1, 0, 0, 0, 1, 0, 1);
			PlayerPlaySound(i, 6003, 0.0, 0.0, 0.0);

			GetPlayerHealth(i, health);
			TaserData[i][TaserCountdown] = TASER_BASETIME + floatround((100 - health) / 12);
   			Info(i, "You got tased for %d secounds!", TaserData[i][TaserCountdown]);
			TaserData[i][GetupTimer] = SetTimerEx("TaserGetUp", 1000, true, "i", i);
			break;
	    }
	}
	//Vehicle
	if((newkeys & KEY_YES ))
	{
		if(IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		{
			return callcmd::v(playerid, "engine");
		}
	}
	if((newkeys & KEY_NO ))
	{
		if(IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		{
			return callcmd::v(playerid, "lights");
		}
	}
	if(GetPVarInt(playerid, "UsingSprunk"))
	{
		if(pData[playerid][pEnergy] >= 100 )
		{
  			Info(playerid, " Kamu terlalu banyak minum.");
	   	}
	   	else
	   	{
	   		pData[playerid][pBladder] -= 1;
		    pData[playerid][pEnergy] += 5;
		}
	}
	// STREAMER MASK SYSTEM
	if(PRESSED( KEY_WALK ))
	{
		if(pData[playerid][pMaskOn] == 1)
		{
			for(new i; i<MAX_PLAYERS; i++)
			{
				ShowPlayerNameTagForPlayer(i, playerid, 0);
			}
		}
		else if(pData[playerid][pMaskOn] == 0)
		{
			for(new i; i<MAX_PLAYERS; i++)
			{
				ShowPlayerNameTagForPlayer(i, playerid, 1);
			}
		}
		if(IsPlayerInAnyVehicle(playerid))
		{
			new vehicleid = GetPlayerVehicleID(playerid);
			if(GetEngineStatus(vehicleid))
			{
				if(GetVehicleSpeed(vehicleid) <= 40)
				{
					new playerState = GetPlayerState(playerid);
					if(playerState == PLAYER_STATE_DRIVER)
					{
						SendClientMessageToAllEx(COLOR_RED, "Anti-Bug User: "GREY2_E"%s have been auto kicked for vehicle engine hack!", pData[playerid][pName]);
						KickEx(playerid);
					}
				}
			}
		}
	}
	if(PRESSED( KEY_FIRE ))
	{
		if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER && IsPlayerInAnyVehicle(playerid))
		{
			foreach(new did : Doors)
			{
				if(IsPlayerInRangeOfPoint(playerid, 2.8, dData[did][dExtposX], dData[did][dExtposY], dData[did][dExtposZ]))
				{
					if(dData[did][dGarage] == 1)
					{
						if(dData[did][dIntposX] == 0.0 && dData[did][dIntposY] == 0.0 && dData[did][dIntposZ] == 0.0)
							return Error(playerid, "Interior entrance masih kosong, atau tidak memiliki interior.");

						if(dData[did][dLocked])
							return Error(playerid, "This entrance is locked at the moment.");
							
						if(dData[did][dFaction] > 0)
						{
							if(dData[did][dFaction] != pData[playerid][pFaction])
								return Error(playerid, "This door only for faction.");
						}
						if(dData[did][dFamily] > 0)
						{
							if(dData[did][dFamily] != pData[playerid][pFamily])
								return Error(playerid, "This door only for family.");
						}
						
						if(dData[did][dVip] > pData[playerid][pVip])
							return Error(playerid, "Your VIP level not enough to enter this door.");
						
						if(dData[did][dAdmin] > pData[playerid][pAdmin])
							return Error(playerid, "Your admin level not enough to enter this door.");
							
						if(strlen(dData[did][dPass]))
						{
							new params[256];
							if(sscanf(params, "s[256]", params)) return Usage(playerid, "/enter [password]");
							if(strcmp(params, dData[did][dPass])) return Error(playerid, "Invalid door password.");
							
							if(dData[did][dCustom])
							{
								SetVehiclePositionEx(playerid, GetPlayerVehicleID(playerid), dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ], dData[did][dIntposA]);
							}
							else
							{
								SetVehiclePosition(playerid, GetPlayerVehicleID(playerid), dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ], dData[did][dIntposA]);
							}
							pData[playerid][pInDoor] = did;
							SetPlayerInterior(playerid, dData[did][dIntint]);
							SetPlayerVirtualWorld(playerid, dData[did][dIntvw]);
							SetCameraBehindPlayer(playerid);
							SetPlayerWeather(playerid, 0);
						}
						else
						{
							if(dData[did][dCustom])
							{
								SetVehiclePositionEx(playerid, GetPlayerVehicleID(playerid), dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ], dData[did][dIntposA]);
							}
							else
							{
								SetVehiclePosition(playerid, GetPlayerVehicleID(playerid), dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ], dData[did][dIntposA]);
							}
							pData[playerid][pInDoor] = did;
							SetPlayerInterior(playerid, dData[did][dIntint]);
							SetPlayerVirtualWorld(playerid, dData[did][dIntvw]);
							SetCameraBehindPlayer(playerid);
							SetPlayerWeather(playerid, 0);
						}
					}
				}
				if(IsPlayerInRangeOfPoint(playerid, 2.8, dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ]))
				{
					if(dData[did][dGarage] == 1)
					{
						if(dData[did][dFaction] > 0)
						{
							if(dData[did][dFaction] != pData[playerid][pFaction])
								return Error(playerid, "This door only for faction.");
						}
					
						if(dData[did][dCustom])
						{
							SetVehiclePositionEx(playerid, GetPlayerVehicleID(playerid), dData[did][dExtposX], dData[did][dExtposY], dData[did][dExtposZ], dData[did][dExtposA]);
						}
						else
						{
							SetVehiclePosition(playerid, GetPlayerVehicleID(playerid), dData[did][dExtposX], dData[did][dExtposY], dData[did][dExtposZ], dData[did][dExtposA]);
						}
						pData[playerid][pInDoor] = -1;
						SetPlayerInterior(playerid, dData[did][dExtint]);
						SetPlayerVirtualWorld(playerid, dData[did][dExtvw]);
						SetCameraBehindPlayer(playerid);
						SetPlayerWeather(playerid, WorldWeather);
					}
				}
			}
		}
	}
	//if(IsKeyJustDown(KEY_CTRL_BACK,newkeys,oldkeys))
	if(PRESSED( KEY_CTRL_BACK ))
	{
		if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT && pData[playerid][pCuffed] == 0)
		{
			ClearAnimations(playerid);
			StopLoopingAnim(playerid);
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
		}
    }
	if(IsKeyJustDown(KEY_SECONDARY_ATTACK, newkeys, oldkeys))
	{
		if(GetPVarInt(playerid, "UsingSprunk"))
		{
			DeletePVar(playerid, "UsingSprunk");
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
		}
	}
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	//JOB KURIR
	if(oldstate == PLAYER_STATE_ONFOOT && newstate == PLAYER_STATE_DRIVER)
	{
		if(IsAKurirVeh(GetPlayerVehicleID(playerid)))
		{
			GameTextForPlayer(playerid, "~w~PENGANTARAN BARANG TERSEDIA /STARTKURIR", 5000, 3);
			SendClientMessage(playerid, 0x76EEC6FF, "* Tampaknya ada paket yang tidak terkirim di Burrito Anda.");
		}
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
		TextDrawHideForPlayer(playerid, TDEditor_TD[11]);
		TextDrawHideForPlayer(playerid, DPvehfare[playerid]);
	}
	if(oldstate == PLAYER_STATE_DRIVER)
    {	
		if(GetPlayerSpecialAction(playerid) == SPECIAL_ACTION_CARRY || GetPlayerSpecialAction(playerid) == SPECIAL_ACTION_CUFFED)
            return RemovePlayerFromVehicle(playerid);/*RemoveFromVehicle(playerid);*/
			
		PlayerTextDrawHide(playerid, DPvehname[playerid]);
        PlayerTextDrawHide(playerid, DPvehengine[playerid]);
        PlayerTextDrawHide(playerid, DPvehspeed[playerid]);
		
        TextDrawHideForPlayer(playerid, TDEditor_TD[5]);
		TextDrawHideForPlayer(playerid, TDEditor_TD[6]);
		TextDrawHideForPlayer(playerid, TDEditor_TD[7]);
		TextDrawHideForPlayer(playerid, TDEditor_TD[8]);
		TextDrawHideForPlayer(playerid, TDEditor_TD[9]);
		TextDrawHideForPlayer(playerid, TDEditor_TD[10]);
		
		TextDrawHideForPlayer(playerid, TDEditor_TD[11]);
		TextDrawHideForPlayer(playerid, DPvehfare[playerid]);
		
		//HBE textdraw Simple
		PlayerTextDrawHide(playerid, SPvehname[playerid]);
        PlayerTextDrawHide(playerid, SPvehengine[playerid]);
        PlayerTextDrawHide(playerid, SPvehspeed[playerid]);
		
		TextDrawHideForPlayer(playerid, TDEditor_TD[16]);
		TextDrawHideForPlayer(playerid, TDEditor_TD[17]);
		TextDrawHideForPlayer(playerid, TDEditor_TD[18]);
		
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
        
		HidePlayerProgressBar(playerid, pData[playerid][spfuelbar]);
        HidePlayerProgressBar(playerid, pData[playerid][spdamagebar]);
		
        HidePlayerProgressBar(playerid, pData[playerid][fuelbar]);
        HidePlayerProgressBar(playerid, pData[playerid][damagebar]);
	}
	else if(newstate == PLAYER_STATE_DRIVER)
    {
		/*if(IsSRV(vehicleid))
		{
			new tstr[128], price = GetVehicleCost(GetVehicleModel(vehicleid));
			format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"%s", GetVehicleName(vehicleid), FormatMoney(price));
			ShowPlayerDialog(playerid, DIALOG_BUYPV, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
		}
		else if(IsVSRV(vehicleid))
		{
			new tstr[128], price = GetVipVehicleCost(GetVehicleModel(vehicleid));
			if(pData[playerid][pVip] == 0)
			{
				Error(playerid, "Kendaraan Khusus VIP Player.");
				RemovePlayerFromVehicle(playerid);
				//SetVehicleToRespawn(GetPlayerVehicleID(playerid));
				SetTimerEx("RespawnPV", 3000, false, "d", vehicleid);
			}
			else
			{
				format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "YELLOW_E"%d Coin", GetVehicleName(vehicleid), price);
				ShowPlayerDialog(playerid, DIALOG_BUYVIPPV, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
			}
		}*/
		
		foreach(new pv : PVehicles)
		{
			if(vehicleid == pvData[pv][cVeh])
			{
				if(IsABike(vehicleid) || GetVehicleModel(vehicleid) == 424)
				{
					if(pvData[pv][cLocked] == 1)
					{
						RemovePlayerFromVehicle(playerid);
						//new Float:slx, Float:sly, Float:slz;
						//GetPlayerPos(playerid, slx, sly, slz);
						//SetPlayerPos(playerid, slx, sly, slz);
						Error(playerid, "This bike is locked by owner.");
						return 1;
					}
				}
			}
		}
		
		if(IsASweeperVeh(vehicleid))
		{
			ShowPlayerDialog(playerid, DIALOG_SWEEPER, DIALOG_STYLE_MSGBOX, "Side Job - Sweeper", "Anda akan bekerja sebagai pembersih jalan?", "Start Job", "Close");
		}
		if(IsABusVeh(vehicleid))
		{
			ShowPlayerDialog(playerid, DIALOG_BUS, DIALOG_STYLE_MSGBOX, "Side Job - Bus", "Anda akan bekerja sebagai pengangkut penumpang bus?", "Start Job", "Close");
		}
		if(IsAForVeh(vehicleid))
		{
			ShowPlayerDialog(playerid, DIALOG_FORKLIFT, DIALOG_STYLE_MSGBOX, "Side Job - Forklift", "Anda akan bekerja sebagai pemuat barang dengan Forklift?", "Start Job", "Close");
		}
		
		if(!IsEngineVehicle(vehicleid))
        {
            SwitchVehicleEngine(vehicleid, true);
        }
		if(IsEngineVehicle(vehicleid) && pData[playerid][pDriveLic] <= 0)
        {
            Info(playerid, "Anda tidak memiliki surat izin mengemudi, berhati-hatilah.");
        }
		if(pData[playerid][pHBEMode] == 1)
		{
			TextDrawShowForPlayer(playerid, TDEditor_TD[16]);
			TextDrawShowForPlayer(playerid, TDEditor_TD[17]);
			TextDrawShowForPlayer(playerid, TDEditor_TD[18]);
			
			PlayerTextDrawShow(playerid, SPvehname[playerid]);
			PlayerTextDrawShow(playerid, SPvehengine[playerid]);
			PlayerTextDrawShow(playerid, SPvehspeed[playerid]);
			ShowPlayerProgressBar(playerid, pData[playerid][spfuelbar]);
			ShowPlayerProgressBar(playerid, pData[playerid][spdamagebar]);
		}
		else if(pData[playerid][pHBEMode] == 2)
		{
			TextDrawShowForPlayer(playerid, TDEditor_TD[5]);
			TextDrawShowForPlayer(playerid, TDEditor_TD[6]);
			TextDrawShowForPlayer(playerid, TDEditor_TD[7]);
			TextDrawShowForPlayer(playerid, TDEditor_TD[8]);
			TextDrawShowForPlayer(playerid, TDEditor_TD[9]);
			TextDrawShowForPlayer(playerid, TDEditor_TD[10]);
			
			PlayerTextDrawShow(playerid, DPvehname[playerid]);
			PlayerTextDrawShow(playerid, DPvehengine[playerid]);
			PlayerTextDrawShow(playerid, DPvehspeed[playerid]);
			ShowPlayerProgressBar(playerid, pData[playerid][fuelbar]);
			ShowPlayerProgressBar(playerid, pData[playerid][damagebar]);
		}
		else
		{
		
		}
		new Float:health;
        GetVehicleHealth(GetPlayerVehicleID(playerid), health);
        VehicleHealthSecurityData[GetPlayerVehicleID(playerid)] = health;
        VehicleHealthSecurity[GetPlayerVehicleID(playerid)] = true;
		
		if(pData[playerid][playerSpectated] != 0)
  		{
			foreach(new ii : Player)
			{
    			if(pData[ii][pSpec] == playerid)
			    {
        			PlayerSpectateVehicle(ii, vehicleid);
				    Servers(ii, "%s(%i) is now driving a %s(%d).", pData[playerid][pName], playerid, GetVehicleModelName(GetVehicleModel(vehicleid)), vehicleid);
				}
			}
		}
		SetPVarInt(playerid, "LastVehicleID", vehicleid);
	}
	return 1;
}

public OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ)
{
	switch(weaponid){ case 0..18, 39..54: return 1;} //invalid weapons
	if(1 <= weaponid <= 46 && pData[playerid][pGuns][g_aWeaponSlots[weaponid]] == weaponid)
	{
		pData[playerid][pAmmo][g_aWeaponSlots[weaponid]]--;
		if(pData[playerid][pGuns][g_aWeaponSlots[weaponid]] != 0 && !pData[playerid][pAmmo][g_aWeaponSlots[weaponid]])
		{
			pData[playerid][pGuns][g_aWeaponSlots[weaponid]] = 0;
		}
	}
	return 1;
}

stock GivePlayerHealth(playerid,Float:Health)
{
	new Float:health; GetPlayerHealth(playerid,health);
	SetPlayerHealth(playerid,health+Health);
}

/*#define MAX_SALARY 15

enum E_SALARY
{
	salOwner,
	salInfo[16],
	salMoney,
	salDate[30]
};
new SalData[MAX_SALARY][E_SALARY];*/

AddPlayerSalary(playerid, info[], money)
{
	new query[512];
	mysql_format(g_SQL, query, sizeof(query), "INSERT INTO salary(owner, info, money, date) VALUES ('%d', '%s', '%d', CURRENT_TIMESTAMP())", pData[playerid][pID], info, money);
	mysql_tquery(g_SQL, query);
	return true;
}

alias:salary("mysalary")

CMD:salary(playerid, params[])
{
	DisplaySalary(playerid);
	return 1;
}


DisplaySalary(playerid)
{
	new query[512];
	mysql_format(g_SQL, query, sizeof(query), "SELECT * FROM salary WHERE owner='%d' ORDER BY id ASC LIMIT 30", pData[playerid][pID]);
	mysql_query(g_SQL, query);
	new rows = cache_num_rows();
	if(rows) 
	{
		new list[2000], date[30], info[46], money, totalduty, gajiduty, totalsal, total;
		
		totalduty = pData[playerid][pOnDutyTime] + pData[playerid][pTaxiTime];
		if(totalduty > 600)
		{
			gajiduty = 600;
		}
		else
		{
			gajiduty = totalduty;
		}
		format(list, sizeof(list), ""WHITE_E"Date\tInfo\tAmmount\n");
		if(pData[playerid][pFaction] >= 1)
		{
			format(list, sizeof(list), "%sCurrent Time\tFaction\t"LG_E"%s\n", list, FormatMoney(gajiduty));
		}
		if(pData[playerid][pJob] == 1 || pData[playerid][pJob2] == 1)
		{
			format(list, sizeof(list), "%s"WHITE_E"Current Time\tTaxi Duty\t"LG_E"%s\n", list, FormatMoney(gajiduty));
		}
		for(new i; i < rows; ++i)
	    {
			cache_get_value_name(i, "info", info);
			cache_get_value_name(i, "date", date);
			cache_get_value_name_int(i, "money", money);
			
			format(list, sizeof(list), "%s"WHITE_E"%s\t%s\t"LG_E"%s\n", list, date, info, FormatMoney(money));
			totalsal += money;
		}
		total = gajiduty + totalsal;
		format(list, sizeof(list), "%s"WHITE_E"     \tTotal:\t"LG_E"%s\n", list, FormatMoney(total));
		
		new title[48];
		format(title, sizeof(title), "Salary: %s", pData[playerid][pName]);
		ShowPlayerDialog(playerid, DIALOG_UNUSED, DIALOG_STYLE_TABLIST_HEADERS, title, list, "Close", "");
	}
	else
	{
		new list[2000], totalduty, gajiduty;
		
		totalduty = pData[playerid][pOnDutyTime] + pData[playerid][pTaxiTime];
		if(totalduty > 500)
		{
			gajiduty = 500;
		}
		else
		{
			gajiduty = totalduty;
		}
		format(list, sizeof(list), ""WHITE_E"Date\tInfo\tAmmount\n");
		if(pData[playerid][pFaction] >= 1)
		{
			format(list, sizeof(list), "%sCurrent Time\tFaction\t"LG_E"%s\n", list, FormatMoney(gajiduty));
		}
		if(pData[playerid][pJob] == 1 || pData[playerid][pJob2] == 1)
		{
			format(list, sizeof(list), "%s"WHITE_E"Current Time\tTaxi Duty\t"LG_E"%s\n", list, FormatMoney(gajiduty));
		}
		format(list, sizeof(list), "%s"WHITE_E"     \tTotal:\t"LG_E"%s\n", list, FormatMoney(gajiduty));
		
		new title[48];
		format(title, sizeof(title), "Salary: %s", pData[playerid][pName]);
		ShowPlayerDialog(playerid, DIALOG_UNUSED, DIALOG_STYLE_TABLIST_HEADERS, title, list, "Close", "");
	}
	return 1;
}


DisplayPaycheck(playerid)
{
	new query[512];
	mysql_format(g_SQL, query, sizeof(query), "SELECT * FROM salary WHERE owner='%d' ORDER BY id ASC LIMIT 30", pData[playerid][pID]);
	mysql_query(g_SQL, query);
	new rows = cache_num_rows();
	if(rows) 
	{
		new list[2000], date[30], info[46], money, totalduty, gajiduty, totalsal, total, pajak, hasil;
		
		totalduty = pData[playerid][pOnDutyTime] + pData[playerid][pTaxiTime];
		if(totalduty > 500)
		{
			gajiduty = 500;
		}
		else
		{
			gajiduty = totalduty;
		}
		format(list, sizeof(list), ""WHITE_E"Date\tInfo\tAmmount\n");
		if(pData[playerid][pFaction] >= 1)
		{
			format(list, sizeof(list), "%sCurrent Time\tFaction\t"LG_E"%s\n", list, FormatMoney(gajiduty));
		}
		if(pData[playerid][pJob] == 1 || pData[playerid][pJob2] == 1)
		{
			format(list, sizeof(list), "%s"WHITE_E"Current Time\tTaxi Duty\t"LG_E"%s\n", list, FormatMoney(gajiduty));
		}
		for(new i; i < rows; ++i)
	    {
			cache_get_value_name(i, "info", info);
			cache_get_value_name(i, "date", date);
			cache_get_value_name_int(i, "money", money);
			
			format(list, sizeof(list), "%s"WHITE_E"%s\t%s\t"LG_E"%s\n", list, date, info, FormatMoney(money));
			totalsal += money;
		}
		total = gajiduty + totalsal;
		pajak = total / 100 * 10;
		hasil = total - pajak;
		format(list, sizeof(list), "%s"WHITE_E"     \tTax:\t"RED_E"%s\n", list, FormatMoney(pajak));
		format(list, sizeof(list), "%s"WHITE_E"     \tTotal:\t"LG_E"%s\n", list, FormatMoney(hasil));
		new title[48];
		format(title, sizeof(title), "Paycheck: %s", pData[playerid][pName]);
		ShowPlayerDialog(playerid, DIALOG_PAYCHECK, DIALOG_STYLE_TABLIST_HEADERS, title, list, "Get", "Close");
	}
	else
	{
		new list[2000], totalduty, gajiduty, total, pajak, hasil;
		
		totalduty = pData[playerid][pOnDutyTime] + pData[playerid][pTaxiTime];
		if(totalduty > 500)
		{
			gajiduty = 500;
		}
		else
		{
			gajiduty = totalduty;
		}
		format(list, sizeof(list), ""WHITE_E"Date\tInfo\tAmmount\n");
		if(pData[playerid][pFaction] >= 1)
		{
			format(list, sizeof(list), "%sCurrent Time\tFaction\t"LG_E"%s\n", list, FormatMoney(gajiduty));
		}
		if(pData[playerid][pJob] == 1 || pData[playerid][pJob2] == 1)
		{
			format(list, sizeof(list), "%s"WHITE_E"Current Time\tTaxi Duty\t"LG_E"%s\n", list, FormatMoney(gajiduty));
		}
		
		total = gajiduty;
		pajak = total / 100 * 10;
		hasil = total - pajak;
		format(list, sizeof(list), "%s"WHITE_E"     \tTax:\t"RED_E"%s\n", list, FormatMoney(pajak));
		format(list, sizeof(list), "%s"WHITE_E"     \tTotal:\t"LG_E"%s\n", list, FormatMoney(hasil));
		new title[48];
		format(title, sizeof(title), "Paycheck: %s", pData[playerid][pName]);
		ShowPlayerDialog(playerid, DIALOG_PAYCHECK, DIALOG_STYLE_TABLIST_HEADERS, title, list, "Get", "Close");
	}
	return 1;
}





CMD:salary(playerid, params[])
{
	new query[256], count;
	format(query, sizeof(query), "SELECT * FROM salary WHERE owner='%d'", pData[playerid][pID]);
	new Cache:result = mysql_query(g_SQL, query);
	new rows = cache_num_rows();
	if(rows) 
	{
		new str[2048];
		for(new i; i < rows; i++)
		{
			new info[64];
			cache_get_value_int(i, "id", pSalary[playerid][i][salaryId]);
			cache_get_value_int(i, "money", pSalary[playerid][i][salaryMoney]);
			cache_get_value(i, "info", info);
			format(pSalary[playerid][i][salaryInfo], 64, "%s", info);
			cache_get_value_int(i, "date", pSalary[playerid][i][salaryDate]);
			
			format(str, sizeof(str), "%s%s\t%s\t%s\n", str, ReturnDate(pSalary[playerid][i][salaryDate]), pSalary[playerid][i][salaryInfo], FormatMoney(pSalary[playerid][i][salaryMoney]));
			count++;
			if(count >= 10) break;
		}
		format(str, sizeof(str), "Date\tInfo\tCash\n", str);
		if(count >= 10)
		{
			format(str, sizeof(str), "%s\nNext >>>", str);
		}
		ShowPlayerDialog(playerid, DIALOG_UNUSED, DIALOG_STYLE_TABLIST_HEADERS, "Salary Details", str, "Close", "");
	}
	else 
	{
		ShowPlayerDialog(playerid, DIALOG_UNUSED, DIALOG_STYLE_MSGBOX, "Notice", "Kamu tidak memiliki salary saat ini!", "Ok", "");
	}
	cache_delete(result);
	return 1;
}



/*
-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 02, 2021 at 05:49 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `SalarySystem`
-- // SQL SQUERY UPDATE UPDATE `salary` SET owner=YourID

-- --------------------------------------------------------

--
-- Table structure for table `salary`
--

CREATE TABLE `salary` (
  `id` bigint(20) NOT NULL,
  `owner` int(11) DEFAULT 0,
  `info` varchar(46) DEFAULT '',
  `money` int(11) NOT NULL DEFAULT 0,
  `date` varchar(36) DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `salary`
--

INSERT INTO `salary` (`id`, `owner`, `info`, `money`, `date`) VALUES
(1, 69, 'Sidejob(Sweeper)', 150, '2021-08-12 19:09:04'),
(2, 62, 'Sidejob(Bus)', 200, '2021-08-11 23:50:57'),
(3, 61, 'Sidejob(Sweeper)', 150, '2021-08-11 23:54:09'),
(4, 72, 'Sidejob(Sweeper)', 150, '2021-08-12 01:05:46'),
(5, 72, 'Sidejob(Bus)', 200, '2021-08-12 01:12:00'),
(6, 76, 'Sidejob(Sweeper)', 150, '2021-08-12 01:12:27'),
(7, 73, 'Sidejob(Bus)', 200, '2021-08-12 01:14:46'),
(8, 74, 'Sidejob(Sweeper)', 150, '2021-08-12 01:18:55'),
(9, 56, 'Sidejob(Sweeper)', 150, '2021-08-12 01:21:31'),
(10, 21, 'Job (Kurir)', 400, '2021-08-12 13:43:06'),
(11, 81, 'Sidejob(Sweeper)', 150, '2021-08-12 01:25:51'),
(12, 76, 'Sidejob(Bus)', 200, '2021-08-12 01:26:26'),
(13, 56, 'Sidejob(Sweeper)', 150, '2021-08-12 01:26:40'),
(14, 14, 'Job (Kurir)', 400, '2021-08-12 12:23:43'),
(15, 14, 'Job (Kurir)', 400, '2021-08-12 13:19:56'),
(16, 14, 'Job (Kurir)', 400, '2021-08-12 12:18:11'),
(17, 14, 'Job (Kurir)', 400, '2021-08-12 12:02:47'),
(18, 99, 'Sidejob(Bus)', 200, '2021-08-12 11:59:36'),
(19, 25, 'Sidejob(Sweeper)', 150, '2021-08-12 10:54:42'),
(20, 20, 'Sidejob(Bus)', 200, '2021-08-12 11:55:11'),
(21, 14, 'Sidejob(Bus)', 200, '2021-08-12 11:48:19'),
(22, 97, 'Sidejob(Bus)', 200, '2021-08-12 11:43:39'),
(23, 95, 'Sidejob(Sweeper)', 150, '2021-08-12 11:06:00'),
(24, 41, 'Sidejob(Bus)', 200, '2021-08-12 22:34:29'),
(25, 95, 'Sidejob(Sweeper)', 150, '2021-08-12 11:11:23'),
(26, 34, 'Sidejob(Bus)', 200, '2021-08-12 11:13:53'),
(27, 14, 'Job (Kurir)', 400, '2021-08-12 12:29:09'),
(28, 104, 'Sidejob(Bus)', 200, '2021-08-12 12:29:12'),
(29, 14, 'Job (Kurir)', 400, '2021-08-12 12:35:44'),
(30, 21, 'Sidejob(Bus)', 200, '2021-08-12 13:12:36'),
(31, 14, 'Job (Kurir)', 400, '2021-08-12 13:11:29'),
(32, 108, 'Job (Kurir)', 400, '2021-08-12 13:44:02'),
(33, 21, 'Job (Kurir)', 400, '2021-08-12 13:46:44'),
(34, 108, 'Job (Kurir)', 400, '2021-08-12 13:51:03'),
(35, 21, 'Job (Kurir)', 400, '2021-08-12 13:58:00'),
(36, 21, 'Job (Kurir)', 400, '2021-08-12 14:13:22'),
(37, 107, 'Sidejob(Bus)', 200, '2021-08-12 14:20:19'),
(38, 107, 'Sidejob(Sweeper)', 150, '2021-08-12 14:29:40'),
(39, 69, 'Sidejob(Sweeper)', 150, '2021-08-12 19:04:48'),
(40, 50, 'Sidejob(Sweeper)', 150, '2021-08-12 19:10:47'),
(41, 113, 'Sidejob(Bus)', 200, '2021-08-12 15:26:56'),
(42, 110, 'Job (Kurir)', 400, '2021-08-12 15:24:29'),
(43, 112, 'Sidejob(Sweeper)', 150, '2021-08-12 15:07:19'),
(44, 112, 'Sidejob(Bus)', 200, '2021-08-12 15:13:21'),
(45, 116, 'Sidejob(Bus)', 200, '2021-08-12 16:25:59'),
(46, 130, 'Sidejob(Bus)', 200, '2021-08-12 21:57:05'),
(47, 132, 'Sidejob(Sweeper)', 150, '2021-08-12 19:36:42'),
(48, 118, 'Sidejob(Bus)', 200, '2021-08-12 18:13:06'),
(49, 119, 'Sidejob(Bus)', 200, '2021-08-12 18:12:55'),
(50, 56, 'Sidejob(Sweeper)', 150, '2021-08-12 17:56:17'),
(51, 130, 'Sidejob(Sweeper)', 150, '2021-08-12 19:21:54'),
(52, 69, 'Sidejob(Sweeper)', 150, '2021-08-12 18:49:42'),
(53, 126, 'Sidejob(Sweeper)', 150, '2021-08-12 19:17:51'),
(54, 136, 'Sidejob(Bus)', 200, '2021-08-12 20:49:17'),
(55, 125, 'Job (Kurir)', 400, '2021-08-12 22:01:08'),
(56, 21, 'Sidejob(Bus)', 200, '2021-08-12 22:28:18'),
(57, 84, 'Sidejob(Bus)', 200, '2021-08-12 22:27:50'),
(58, 41, 'Sidejob(Bus)', 200, '2021-08-12 20:10:24'),
(59, 125, 'Job (Kurir)', 400, '2021-08-12 21:54:46'),
(60, 93, 'Sidejob(Bus)', 200, '2021-08-12 20:27:38'),
(61, 137, 'Sidejob(Sweeper)', 150, '2021-08-12 20:30:01'),
(62, 138, 'Sidejob(Sweeper)', 150, '2021-08-12 20:38:20'),
(63, 139, 'Sidejob(Sweeper)', 150, '2021-08-12 21:52:46'),
(64, 138, 'Sidejob(Forklift)', 70, '2021-08-12 20:52:58'),
(65, 138, 'Sidejob(Bus)', 200, '2021-08-12 20:45:08'),
(66, 130, 'Sidejob(Bus)', 200, '2021-08-12 22:08:49'),
(67, 127, 'Sidejob(Sweeper)', 150, '2021-08-12 21:45:26'),
(68, 84, 'Sidejob(Bus)', 200, '2021-08-12 21:07:11'),
(69, 84, 'Sidejob(Bus)', 200, '2021-08-12 21:31:07'),
(70, 146, 'Sidejob(Bus)', 200, '2021-08-12 22:24:28'),
(71, 84, 'Sidejob(Bus)', 200, '2021-08-12 21:16:55'),
(72, 127, 'Sidejob(Bus)', 200, '2021-08-12 21:28:05'),
(73, 127, 'Sidejob(Bus)', 200, '2021-08-12 21:18:15'),
(74, 146, 'Sidejob(Sweeper)', 150, '2021-08-12 22:35:13'),
(75, 21, 'Sidejob(Bus)', 200, '2021-08-12 22:40:07'),
(76, 130, 'Sidejob(Bus)', 200, '2021-08-12 22:44:53'),
(77, 146, 'Sidejob(Forklift)', 70, '2021-08-12 22:45:32'),
(78, 51, 'Sidejob(Bus)', 200, '2021-08-12 22:53:27'),
(79, 84, 'Sidejob(Bus)', 200, '2021-08-12 22:53:29'),
(80, 21, 'Sidejob(Forklift)', 70, '2021-08-12 22:54:30'),
(81, 100, 'Sidejob(Forklift)', 70, '2021-08-12 23:38:50');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `salary`
--
ALTER TABLE `salary`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `salary`
--
ALTER TABLE `salary`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

*/
