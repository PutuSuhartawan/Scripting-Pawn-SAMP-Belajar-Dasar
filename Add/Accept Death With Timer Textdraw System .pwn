
// Message
#define SCM SendClientMessage
#define function%0(%1) forward %0(%1); public %0(%1)
#define Servers(%1,%2) SendClientMessageEx(%1, ARWIN, "SERVER: "WHITE_E""%2)
#define Info(%1,%2) SendClientMessageEx(%1, ARWIN, "INFO: "WHITE_E""%2)
#define Vehicle(%1,%2) SendClientMessageEx(%1, ARWIN, "VEHICLE: "WHITE_E""%2)
#define Usage(%1,%2) SendClientMessage(%1, ARWIN , "KEGUNAAN: "WHITEP_E""%2)
#define Error(%1,%2) SendClientMessageEx(%1, COLOR_GREY3, ""RED_E"ERROR: "WHITE_E""%2)
#define PermissionError(%0) SendClientMessage(%0, COLOR_RED, "ERROR: "WHITE_E"Kamu tidak memiliki akses untuk melakukan command ini!")



//Info textdraw
new PlayerText:InfoTD[MAX_PLAYERS];
new Text:TextTime, Text:TextDate;


new DutyTimer;

// Yom Button
new SAGSLobbyBtn[2],
	SAGSLobbyDoor,
	SAPDLobbyBtn[4],
	SAPDLobbyDoor[4],
	LLFLobbyBtn[2],
	LLFLobbyDoor;

// MySQL connection handle
new MySQL: g_SQL;

new TogOOC = 1;

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



public OnPlayerDeath(playerid, killerid, reason)
{
	DeletePVar(playerid, "UsingSprunk");
	SetPVarInt(playerid, "GiveUptime", -1);
	pData[playerid][pSpawned] = 0;
	Player_ResetCutting(playerid);
	Player_RemoveLumber(playerid);
	Player_ResetMining(playerid);
	Player_ResetHarvest(playerid);
	
	pData[playerid][CarryProduct] = 0;
	
	KillTimer(pData[playerid][pActivity]);
	KillTimer(pData[playerid][pMechanic]);
	KillTimer(pData[playerid][pProducting]);
	KillTimer(pData[playerid][pCooking]);
	HidePlayerProgressBar(playerid, pData[playerid][activitybar]);
	PlayerTextDrawHide(playerid, ActiveTD[playerid]);
	pData[playerid][pMechVeh] = INVALID_VEHICLE_ID;
	pData[playerid][pActivityTime] = 0;
	
	pData[playerid][pMechDuty] = 0;
	pData[playerid][pTaxiDuty] = 0;
	pData[playerid][pMission] = -1;
	
	pData[playerid][pSideJob] = 0;
	DisablePlayerCheckpoint(playerid);
	DisablePlayerRaceCheckpoint(playerid);
	SetPlayerColor(playerid, COLOR_WHITE);
	RemovePlayerAttachedObject(playerid, 9);
	GetPlayerPos(playerid, pData[playerid][pPosX], pData[playerid][pPosY], pData[playerid][pPosZ]);
	foreach(new ii : Player)
    {
        if(pData[ii][pAdmin] > 0)
        {
            SendDeathMessageToPlayer(ii, killerid, playerid, reason);
        }
    }
    if(IsAtEvent[playerid] == 1)
    {
    	SetPlayerPos(playerid, 1474.65, -1736.36, 13.38);
    	SetPlayerVirtualWorld(playerid, 0);
    	SetPlayerInterior(playerid, 0);
    	ClearAnimations(playerid);
    	ResetPlayerWeaponsEx(playerid);
       	SetPlayerColor(playerid, COLOR_WHITE);
    	if(GetPlayerTeam(playerid) == 1)
    	{
    		Servers(playerid, "Anda sudah terkalahkan");
    		RedTeam -= 1;
    	}
    	else if(GetPlayerTeam(playerid) == 2)
    	{
    		Servers(playerid, "Anda sudah terkalahkan");
    		BlueTeam -= 1;
    	}
    	if(BlueTeam == 0)
    	{
    		foreach(new ii : Player)
    		{
    			if(GetPlayerTeam(ii) == 1)
    			{
    				GivePlayerMoneyEx(ii, EventPrize);
    				Servers(ii, "Selamat, Tim Anda berhasil memenangkan Event dan Mendapatkan Hadiah $%d per orang", EventPrize);
    				pData[playerid][pHospital] = 0;
    				ClearAnimations(ii);
    				BlueTeam = 0;
    			}
    			else if(GetPlayerTeam(ii) == 2)
    			{
    				Servers(ii, "Maaf, Tim anda sudah terkalahkan, Harap Coba Lagi lain waktu");
    				pData[playerid][pHospital] = 0;
    				ClearAnimations(ii);
    				BlueTeam = 0;
    			}
    		}
    	}
    	if(RedTeam == 0)
    	{
    		foreach(new ii : Player)
    		{
    			if(GetPlayerTeam(ii) == 2)
    			{
    				GivePlayerMoneyEx(ii, EventPrize);
    				Servers(ii, "Selamat, Tim Anda berhasil memenangkan Event dan Mendapatkan Hadiah $%d per orang", EventPrize);
    				pData[playerid][pHospital] = 0;
    				ClearAnimations(ii);
    				BlueTeam = 0;
    			}
    			else if(GetPlayerTeam(ii) == 1)
    			{
    				Servers(ii, "Maaf, Tim anda sudah terkalahkan, Harap Coba Lagi lain waktu");
    				pData[playerid][pHospital] = 0;
    				ClearAnimations(ii);
    				RedTeam = 0;
    			}
    		}
    	}
    	SetPlayerTeam(playerid, 0);
    	IsAtEvent[playerid] = 0;
    	pData[playerid][pInjured] = 0;
    	pData[playerid][pSpawned] = 1;
    }
    if(IsAtEvent[playerid] == 0)
    {
    	new asakit = RandomEx(0, 5);
    	new bsakit = RandomEx(0, 9);
    	new csakit = RandomEx(0, 7);
    	new dsakit = RandomEx(0, 6);
    	pData[playerid][pLFoot] -= dsakit;
    	pData[playerid][pLHand] -= bsakit;
    	pData[playerid][pRFoot] -= csakit;
    	pData[playerid][pRHand] -= dsakit;
    	pData[playerid][pHead] -= asakit;
    }
	return 1;
}




CreatePlayerTextDraws(playerid)
{
	//Info textdraw
	InfoTD[playerid] = CreatePlayerTextDraw(playerid, 148.888, 361.385, "Selamat Datang!");
 	PlayerTextDrawLetterSize(playerid, InfoTD[playerid], 0.326, 1.654);
	PlayerTextDrawAlignment(playerid, InfoTD[playerid], 1);
	PlayerTextDrawColor(playerid, InfoTD[playerid], -1);
	PlayerTextDrawSetOutline(playerid, InfoTD[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, InfoTD[playerid], 0x000000FF);
	PlayerTextDrawFont(playerid, InfoTD[playerid], 1);
	PlayerTextDrawSetProportional(playerid, InfoTD[playerid], 1);
	
	ActiveTD[playerid] = CreatePlayerTextDraw(playerid, 274.000000, 176.583435, "Mengisi Ulang...");
	PlayerTextDrawLetterSize(playerid, ActiveTD[playerid], 0.374000, 1.349166);
	PlayerTextDrawAlignment(playerid, ActiveTD[playerid], 1);
	PlayerTextDrawColor(playerid, ActiveTD[playerid], -1);
	PlayerTextDrawSetShadow(playerid, ActiveTD[playerid], 0);
	PlayerTextDrawSetOutline(playerid, ActiveTD[playerid], 1);
	PlayerTextDrawBackgroundColor(playerid, ActiveTD[playerid], 255);
	PlayerTextDrawFont(playerid, ActiveTD[playerid], 1);
	PlayerTextDrawSetProportional(playerid, ActiveTD[playerid], 1);
	PlayerTextDrawSetShadow(playerid, ActiveTD[playerid], 0);
	
	//HBE Textdraw Modern
	DPname[playerid] = CreatePlayerTextDraw(playerid, 537.000000, 367.333251, "Pateeer");
	PlayerTextDrawLetterSize(playerid, DPname[playerid], 0.328999, 1.179998);
	PlayerTextDrawAlignment(playerid, DPname[playerid], 1);
	PlayerTextDrawColor(playerid, DPname[playerid], -1);
	PlayerTextDrawSetShadow(playerid, DPname[playerid], 0);
	PlayerTextDrawSetOutline(playerid, DPname[playerid], 1);
	PlayerTextDrawBackgroundColor(playerid, DPname[playerid], 255);
	PlayerTextDrawFont(playerid, DPname[playerid], 0);
	PlayerTextDrawSetProportional(playerid, DPname[playerid], 1);
	PlayerTextDrawSetShadow(playerid, DPname[playerid], 0);

	DPmoney[playerid] = CreatePlayerTextDraw(playerid, 535.000000, 381.916473, "$50.000");
	PlayerTextDrawLetterSize(playerid, DPmoney[playerid], 0.231499, 1.034165);
	PlayerTextDrawAlignment(playerid, DPmoney[playerid], 1);
	PlayerTextDrawColor(playerid, DPmoney[playerid], 16711935);
	PlayerTextDrawSetShadow(playerid, DPmoney[playerid], 0);
	PlayerTextDrawSetOutline(playerid, DPmoney[playerid], 1);
	PlayerTextDrawBackgroundColor(playerid, DPmoney[playerid], 255);
	PlayerTextDrawFont(playerid, DPmoney[playerid], 1);
	PlayerTextDrawSetProportional(playerid, DPmoney[playerid], 1);
	PlayerTextDrawSetShadow(playerid, DPmoney[playerid], 0);

	DPcoin[playerid] = CreatePlayerTextDraw(playerid, 535.500000, 392.999877, "5000_Coin");
	PlayerTextDrawLetterSize(playerid, DPcoin[playerid], 0.246000, 0.952498);
	PlayerTextDrawAlignment(playerid, DPcoin[playerid], 1);
	PlayerTextDrawColor(playerid, DPcoin[playerid], -65281);
	PlayerTextDrawSetShadow(playerid, DPcoin[playerid], 0);
	PlayerTextDrawSetOutline(playerid, DPcoin[playerid], 1);
	PlayerTextDrawBackgroundColor(playerid, DPcoin[playerid], 255);
	PlayerTextDrawFont(playerid, DPcoin[playerid], 1);
	PlayerTextDrawSetProportional(playerid, DPcoin[playerid], 1);
	PlayerTextDrawSetShadow(playerid, DPcoin[playerid], 0);

	/*TDEditor_PTD[playerid][3] = CreatePlayerTextDraw(playerid, 565.500000, 405.833404, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid, TDEditor_PTD[playerid][3], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, TDEditor_PTD[playerid][3], 68.000000, 8.000000);
	PlayerTextDrawAlignment(playerid, TDEditor_PTD[playerid][3], 1);
	PlayerTextDrawColor(playerid, TDEditor_PTD[playerid][3], 16711935);
	PlayerTextDrawSetShadow(playerid, TDEditor_PTD[playerid][3], 0);
	PlayerTextDrawSetOutline(playerid, TDEditor_PTD[playerid][3], 0);
	PlayerTextDrawBackgroundColor(playerid, TDEditor_PTD[playerid][3], 255);
	PlayerTextDrawFont(playerid, TDEditor_PTD[playerid][3], 4);
	PlayerTextDrawSetProportional(playerid, TDEditor_PTD[playerid][3], 0);
	PlayerTextDrawSetShadow(playerid, TDEditor_PTD[playerid][3], 0);

	TDEditor_PTD[playerid][4] = CreatePlayerTextDraw(playerid, 565.500000, 420.416717, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid, TDEditor_PTD[playerid][4], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, TDEditor_PTD[playerid][4], 68.000000, 8.000000);
	PlayerTextDrawAlignment(playerid, TDEditor_PTD[playerid][4], 1);
	PlayerTextDrawColor(playerid, TDEditor_PTD[playerid][4], 16711935);
	PlayerTextDrawSetShadow(playerid, TDEditor_PTD[playerid][4], 0);
	PlayerTextDrawSetOutline(playerid, TDEditor_PTD[playerid][4], 0);
	PlayerTextDrawBackgroundColor(playerid, TDEditor_PTD[playerid][4], 255);
	PlayerTextDrawFont(playerid, TDEditor_PTD[playerid][4], 4);
	PlayerTextDrawSetProportional(playerid, TDEditor_PTD[playerid][4], 0);
	PlayerTextDrawSetShadow(playerid, TDEditor_PTD[playerid][4], 0);

	TDEditor_PTD[playerid][5] = CreatePlayerTextDraw(playerid, 565.500000, 435.000091, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid, TDEditor_PTD[playerid][5], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, TDEditor_PTD[playerid][5], 68.000000, 8.000000);
	PlayerTextDrawAlignment(playerid, TDEditor_PTD[playerid][5], 1);
	PlayerTextDrawColor(playerid, TDEditor_PTD[playerid][5], 16711935);
	PlayerTextDrawSetShadow(playerid, TDEditor_PTD[playerid][5], 0);
	PlayerTextDrawSetOutline(playerid, TDEditor_PTD[playerid][5], 0);
	PlayerTextDrawBackgroundColor(playerid, TDEditor_PTD[playerid][5], 255);
	PlayerTextDrawFont(playerid, TDEditor_PTD[playerid][5], 4);
	PlayerTextDrawSetProportional(playerid, TDEditor_PTD[playerid][5], 0);
	PlayerTextDrawSetShadow(playerid, TDEditor_PTD[playerid][5], 0);*/

	DPvehname[playerid] = CreatePlayerTextDraw(playerid, 431.000000, 367.333312, "Turismo");
	PlayerTextDrawLetterSize(playerid, DPvehname[playerid], 0.299499, 1.121665);
	PlayerTextDrawAlignment(playerid, DPvehname[playerid], 1);
	PlayerTextDrawColor(playerid, DPvehname[playerid], -1);
	PlayerTextDrawSetShadow(playerid, DPvehname[playerid], 0);
	PlayerTextDrawSetOutline(playerid, DPvehname[playerid], 1);
	PlayerTextDrawBackgroundColor(playerid, DPvehname[playerid], 255);
	PlayerTextDrawFont(playerid, DPvehname[playerid], 1);
	PlayerTextDrawSetProportional(playerid, DPvehname[playerid], 1);
	PlayerTextDrawSetShadow(playerid, DPvehname[playerid], 0);

	DPvehengine[playerid] = CreatePlayerTextDraw(playerid, 462.000000, 381.916778, "ON");
	PlayerTextDrawLetterSize(playerid, DPvehengine[playerid], 0.229000, 0.940832);
	PlayerTextDrawAlignment(playerid, DPvehengine[playerid], 1);
	PlayerTextDrawColor(playerid, DPvehengine[playerid], 16711935);
	PlayerTextDrawSetShadow(playerid, DPvehengine[playerid], 0);
	PlayerTextDrawSetOutline(playerid, DPvehengine[playerid], 1);
	PlayerTextDrawBackgroundColor(playerid, DPvehengine[playerid], 255);
	PlayerTextDrawFont(playerid, DPvehengine[playerid], 1);
	PlayerTextDrawSetProportional(playerid, DPvehengine[playerid], 1);
	PlayerTextDrawSetShadow(playerid, DPvehengine[playerid], 0);

	DPvehspeed[playerid] = CreatePlayerTextDraw(playerid, 460.000000, 391.833312, "120_Mph");
	PlayerTextDrawLetterSize(playerid, DPvehspeed[playerid], 0.266999, 0.946666);
	PlayerTextDrawAlignment(playerid, DPvehspeed[playerid], 1);
	PlayerTextDrawColor(playerid, DPvehspeed[playerid], -1);
	PlayerTextDrawSetShadow(playerid, DPvehspeed[playerid], 0);
	PlayerTextDrawSetOutline(playerid, DPvehspeed[playerid], 1);
	PlayerTextDrawBackgroundColor(playerid, DPvehspeed[playerid], 255);
	PlayerTextDrawFont(playerid, DPvehspeed[playerid], 1);
	PlayerTextDrawSetProportional(playerid, DPvehspeed[playerid], 1);
	PlayerTextDrawSetShadow(playerid, DPvehspeed[playerid], 0);

	DPvehfare[playerid] = TextDrawCreate(462.000000, 401.166687, "$500.000");
	TextDrawLetterSize(DPvehfare[playerid], 0.216000, 0.952498);
	TextDrawAlignment(DPvehfare[playerid], 1);
	TextDrawColor(DPvehfare[playerid], 16711935);
	TextDrawSetShadow(DPvehfare[playerid], 0);
	TextDrawSetOutline(DPvehfare[playerid], 1);
	TextDrawBackgroundColor(DPvehfare[playerid], 255);
	TextDrawFont(DPvehfare[playerid], 1);
	TextDrawSetProportional(DPvehfare[playerid], 1);
	TextDrawSetShadow(DPvehfare[playerid], 0);

	/*TDEditor_PTD[playerid][10] = CreatePlayerTextDraw(playerid, 459.000000, 415.749938, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid, TDEditor_PTD[playerid][10], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, TDEditor_PTD[playerid][10], 61.000000, 9.000000);
	PlayerTextDrawAlignment(playerid, TDEditor_PTD[playerid][10], 1);
	PlayerTextDrawColor(playerid, TDEditor_PTD[playerid][10], 16711935);
	PlayerTextDrawSetShadow(playerid, TDEditor_PTD[playerid][10], 0);
	PlayerTextDrawSetOutline(playerid, TDEditor_PTD[playerid][10], 0);
	PlayerTextDrawBackgroundColor(playerid, TDEditor_PTD[playerid][10], 255);
	PlayerTextDrawFont(playerid, TDEditor_PTD[playerid][10], 4);
	PlayerTextDrawSetProportional(playerid, TDEditor_PTD[playerid][10], 0);
	PlayerTextDrawSetShadow(playerid, TDEditor_PTD[playerid][10], 0);

	TDEditor_PTD[playerid][11] = CreatePlayerTextDraw(playerid, 459.500000, 432.083221, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid, TDEditor_PTD[playerid][11], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, TDEditor_PTD[playerid][11], 61.000000, 9.000000);
	PlayerTextDrawAlignment(playerid, TDEditor_PTD[playerid][11], 1);
	PlayerTextDrawColor(playerid, TDEditor_PTD[playerid][11], 16711935);
	PlayerTextDrawSetShadow(playerid, TDEditor_PTD[playerid][11], 0);
	PlayerTextDrawSetOutline(playerid, TDEditor_PTD[playerid][11], 0);
	PlayerTextDrawBackgroundColor(playerid, TDEditor_PTD[playerid][11], 255);
	PlayerTextDrawFont(playerid, TDEditor_PTD[playerid][11], 4);
	PlayerTextDrawSetProportional(playerid, TDEditor_PTD[playerid][11], 0);
	PlayerTextDrawSetShadow(playerid, TDEditor_PTD[playerid][11], 0);*/
	
	//HBE textdraw Simple
	SPvehname[playerid] = CreatePlayerTextDraw(playerid, 540.000000, 366.749908, "Turismo");
	PlayerTextDrawLetterSize(playerid, SPvehname[playerid], 0.319000, 1.022498);
	PlayerTextDrawAlignment(playerid, SPvehname[playerid], 1);
	PlayerTextDrawColor(playerid, SPvehname[playerid], -1);
	PlayerTextDrawSetShadow(playerid, SPvehname[playerid], 0);
	PlayerTextDrawSetOutline(playerid, SPvehname[playerid], 2);
	PlayerTextDrawBackgroundColor(playerid, SPvehname[playerid], 255);
	PlayerTextDrawFont(playerid, SPvehname[playerid], 1);
	PlayerTextDrawSetProportional(playerid, SPvehname[playerid], 1);
	PlayerTextDrawSetShadow(playerid, SPvehname[playerid], 0);

	SPvehspeed[playerid] = CreatePlayerTextDraw(playerid, 538.000000, 412.833160, "250_Mph");
	PlayerTextDrawLetterSize(playerid, SPvehspeed[playerid], 0.275498, 1.244166);
	PlayerTextDrawAlignment(playerid, SPvehspeed[playerid], 1);
	PlayerTextDrawColor(playerid, SPvehspeed[playerid], -1);
	PlayerTextDrawSetShadow(playerid, SPvehspeed[playerid], 0);
	PlayerTextDrawSetOutline(playerid, SPvehspeed[playerid], 2);
	PlayerTextDrawBackgroundColor(playerid, SPvehspeed[playerid], 255);
	PlayerTextDrawFont(playerid, SPvehspeed[playerid], 1);
	PlayerTextDrawSetProportional(playerid, SPvehspeed[playerid], 1);
	PlayerTextDrawSetShadow(playerid, SPvehspeed[playerid], 0);

	SPvehengine[playerid] = CreatePlayerTextDraw(playerid, 611.500000, 414.000152, "ON");
	PlayerTextDrawLetterSize(playerid, SPvehengine[playerid], 0.280999, 1.104166);
	PlayerTextDrawAlignment(playerid, SPvehengine[playerid], 1);
	PlayerTextDrawColor(playerid, SPvehengine[playerid], 16711935);
	PlayerTextDrawSetShadow(playerid, SPvehengine[playerid], 0);
	PlayerTextDrawSetOutline(playerid, SPvehengine[playerid], 2);
	PlayerTextDrawBackgroundColor(playerid, SPvehengine[playerid], 255);
	PlayerTextDrawFont(playerid, SPvehengine[playerid], 1);
	PlayerTextDrawSetProportional(playerid, SPvehengine[playerid], 1);
	PlayerTextDrawSetShadow(playerid, SPvehengine[playerid], 0);
}


// Info textdraw timer for hiding the textdraw
function InfoTD_MSG(playerid, ms_time, text[])
{
	if(GetPVarInt(playerid, "InfoTDshown") != -1)
	{
	    PlayerTextDrawHide(playerid, InfoTD[playerid]);
	    KillTimer(GetPVarInt(playerid, "InfoTDshown"));
	}

    PlayerTextDrawSetString(playerid, InfoTD[playerid], text);
    PlayerTextDrawShow(playerid, InfoTD[playerid]);
	SetPVarInt(playerid, "InfoTDshown", SetTimerEx("InfoTD_Hide", ms_time, false, "i", playerid));
}

function InfoTD_Hide(playerid)
{
	SetPVarInt(playerid, "InfoTDshown", -1);
	PlayerTextDrawHide(playerid, InfoTD[playerid]);
}


ptask PlayerVehicleUpdate[200](playerid)
{
	if(pData[playerid][pHospital] == 1)
    {
		if(pData[playerid][pInjured] == 1)
		{
			SetPlayerPosition(playerid, -2028.32, -92.87, 1067.43, 275.78, 1);
		
			SetPlayerInterior(playerid, 1);
			SetPlayerVirtualWorld(playerid, playerid + 100);

			SetPlayerCameraPos(playerid, -2024.67, -93.13, 1066.78);
			SetPlayerCameraLookAt(playerid, -2028.32, -92.87, 1067.43);
			ResetPlayerWeaponsEx(playerid);
			TogglePlayerControllable(playerid, 0);
			pData[playerid][pInjured] = 0;
		}
		pData[playerid][pHospitalTime]++;
		new mstr[64];
		format(mstr, sizeof(mstr), "~n~~n~~n~~w~Recovering... %d", 15 - pData[playerid][pHospitalTime]);
		InfoTD_MSG(playerid, 1000, mstr);

		ApplyAnimation(playerid, "CRACK", "crckdeth2", 4.0, 1, 0, 0, 0, 0);
		ApplyAnimation(playerid, "CRACK", "crckdeth2", 4.0, 1, 0, 0, 0, 0);
        if(pData[playerid][pHospitalTime] >= 15)
        {
            pData[playerid][pHospitalTime] = 0;
            pData[playerid][pHospital] = 0;
			pData[playerid][pHunger] = 50;
			pData[playerid][pEnergy] = 50;
			pData[playerid][pBladder] = 50;
			SetPlayerHealthEx(playerid, 50);
			pData[playerid][pSick] = 0;
			GivePlayerMoneyEx(playerid, -150);
			SetPlayerHealthEx(playerid, 50);

            for (new i; i < 20; i++)
            {
                SendClientMessage(playerid, -1, "");
            }

			SendClientMessage(playerid, COLOR_GREY, "--------------------------------------------------------------------------------------------------------");
            SendClientMessage(playerid, COLOR_WHITE, "Kamu telah keluar dari rumah sakit, kamu membayar $150 kerumah sakit.");
            SendClientMessage(playerid, COLOR_GREY, "--------------------------------------------------------------------------------------------------------");
			
			SetPlayerPosition(playerid, 1182.8778, -1324.2023, 13.5784, 269.8747);

            TogglePlayerControllable(playerid, 1);
            SetCameraBehindPlayer(playerid);

            SetPlayerVirtualWorld(playerid, 0);
            SetPlayerInterior(playerid, 0);
			ClearAnimations(playerid);
			pData[playerid][pSpawned] = 1;
			SetPVarInt(playerid, "GiveUptime", -1);
		}
    }
    
if(pData[playerid][pInjured] == 1 && pData[playerid][pHospital] != 1)
    {
		new mstr[64];
        format(mstr, sizeof(mstr), "/death for spawn to hospital");
		InfoTD_MSG(playerid, 1000, mstr);
		
		if(GetPVarInt(playerid, "GiveUptime") == -1)
		{
			SetPVarInt(playerid, "GiveUptime", gettime());
		}
		
		if(GetPVarInt(playerid,"GiveUptime"))
        {
            if((gettime()-GetPVarInt(playerid, "GiveUptime")) > 100)
            {
                Info(playerid, "Now you can spawn, type '/death' for spawn to hospital.");
                SetPVarInt(playerid, "GiveUptime", 0);
            }
        }
		
        ApplyAnimation(playerid, "CRACK", "null", 4.0, 0, 0, 0, 1, 0, 1);
        ApplyAnimation(playerid, "CRACK", "crckdeth4", 4.0, 0, 0, 0, 1, 0, 1);
        SetPlayerHealthEx(playerid, 99999);
    }
}

//----------------------------[ Admin Level 2 ]-----------------------
CMD:sethp(playerid, params[])
{
	if(pData[playerid][pAdmin] < 2)
        return PermissionError(playerid);
	
	new jumlah, otherid;
	if(sscanf(params, "ud", otherid, jumlah))
        return Usage(playerid, "/sethp [playerid id/name] <jumlah>");
	
	if(!IsPlayerConnected(otherid))
        return Error(playerid, "Player belum masuk!");
		
	SetPlayerHealthEx(otherid, jumlah);
	SendStaffMessage(COLOR_RED, "%s telah men set jumlah hp player %s", pData[playerid][pAdminname], pData[otherid][pName]);
	Servers(otherid, "Admin %s telah men set hp anda", pData[playerid][pAdminname]);
	return 1;
}

CMD:revive(playerid, params[])
{
			
	new otherid;
    if(sscanf(params, "u", otherid))
        return Usage(playerid, "/revive [playerid/PartOfName]");

    if(!IsPlayerConnected(otherid))
        return Error(playerid, "Player belum masuk!");

    if(!pData[otherid][pInjured])
        return Error(playerid, "Tidak bisa revive karena tidak injured.");

    if(!IsPlayerConnected(otherid) || !NearPlayer(playerid, otherid, 4.0))
        return Error(playerid, "Player disconnect atau tidak berada didekat anda.");

    if(pData[playerid][pObat] < 1)
    	return Error(playerid, "Tidak dapat Revive karena anda tidak memiliki Obat");

    SetTimerEx("Reviving", 5000, 0, "i", playerid);
    TogglePlayerControllable(playerid, 0);
    GameTextForPlayer(playerid, "~w~REVIVING...", 5000, 3);
    pData[playerid][pObat] -= 1;
    pData[otherid][pInjured] = 0;
    pData[otherid][pHospital] = 0;
    pData[otherid][pSick] = 0;
    pData[otherid][pHead] = 100;
    pData[otherid][pPerut] = 100;
    pData[otherid][pRHand] = 100;
    pData[otherid][pLHand] = 100;
    pData[otherid][pRFoot] = 100;
    pData[otherid][pLFoot] = 100;
    SetPlayerSpecialAction(otherid, SPECIAL_ACTION_NONE);
    ClearAnimations(otherid);
    TogglePlayerControllable(otherid, 1);
    SetPVarInt(playerid, "gcPlayer", otherid);
    ApplyAnimation(playerid,"MEDIC","CPR",4.1, 0, 1, 1, 1, 1, 1);
    SetPlayerHealthEx(otherid, 100.0);
    SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "* %s menyembuhkan segala luka %s.", ReturnName(playerid), ReturnName(otherid));
    Info(otherid, "%s has revived you.", pData[playerid][pAdminname]);
    return 1;
}


CMD:death(playerid, params[])
{
    if(pData[playerid][pInjured] == 0)
        return Error(playerid, "Kamu belum injured.");
		
	if(pData[playerid][pJail] > 0)
		return Error(playerid, "Kamu tidak bisa menggunakan ini saat diJail!");
		
	if(pData[playerid][pArrest] > 0)
		return Error(playerid, "Kamu tidak bisa melakukan ini saat tertangkap polisi!");

    if((gettime()-GetPVarInt(playerid, "GiveUptime")) < 100)
        return Error(playerid, "Kamu harus menunggu 3 menit untuk kembali kerumah sakit");
        
	/*if(pMatiPukul[playerid] == 1)
	{
	    SetPlayerHealthEx(playerid, 50.0);
	    ClearAnimations(playerid);
	    pData[playerid][pInjured] = 0;
	    pMatiPukul[playerid] = 0;
    	Servers(playerid, "You have wake up and accepted death in your position.");
    	return 1;
	}*/
    Servers(playerid, "Kamu telah terbangun dari pingsan.");
	pData[playerid][pHospitalTime] = 0;
	pData[playerid][pHospital] = 1;
    return 1;
}
