

enum pInfo
{
	pKey[128],
	pLevel,
	pEnergy,
	pCompo,
	pIDC,
	pBHHeadValue,
	pAdmin,
	pBand,
	pTRoute,
	pBSRoute,
	pPRoute,
	pPermBand,
	pFactionBanned,
	pTrash,
	pDivision,
	pPizza,
	pMail,
	pBanned,
	pBanAdmin[128],
	pBanReason[128],
	pJailAdmin[128],
	pJailReason[128],
	Float: mExtX,
	Float: mExtY,
	Float: mExtZ,
	Float: mIntX,
	Float: mIntY,
	Float: mIntZ,
	mIntID,
	mExtID,
	pFcard,
	pCardRequest,
 	pFactionMod,
 	HoldingObject,
 	pCasinoWinnings,
	pJob2,
	pGiftBoxes,
 	pTikis,
 	ATMID,
 	ATMExterior,
 	MAPBID,
	GSTATIONID,
 	HSSignID,
 	MAPBExterior,
 	GSTATIONExterior,
 	HSSignExterior,
	OOCshopID,
	OOCshopExterior,
	InfoBoardID,
	InfoBoardExterior,
 	pOwnsMask,
 	pTweet,
 	pInternetPack,
 	pForumName[64],
 	pTweetName[64],
	pNormalName[64],
	pAdminName[64],
 	pHelperName[64],
 	pContactOne[64],
 	pContactTwo[64],
 	pContactThree[64],
 	pContactFour[64],
 	pContactFive[64],
 	pContactSix[64],
 	pContactSeven[64],
 	pReportMuted,
	pAdvertiseMuted,
	pWarns,
	pFamed,
	Float: gExtX,
	Float: gExtY,
	Float: gExtZ,
	Float: gIntX,
	Float: gIntY,
	Float: gIntZ,
	gIntID,
	gExtID,
	BeingDraggedBy,
	pTrashSkill, // Trashman
    pDonateRank,
    pDonateTime,
    ////VEHICLE 1
	PlayerVehicleModel1,
	Float:PlayerVehiclePosX1,
	Float:PlayerVehiclePosY1,
	Float:PlayerVehiclePosZ1,
	Float:PlayerVehicleFacing1,
	pPlayerVehicle1Color,
	pPlayerVehicle1Color2,
	pVehLock1,
    pVehLocked1,
 	PlayerVehicle1PaintJob,
	PlayerVehicle1ModSlot0,
	PlayerVehicle1ModSlot1,
	PlayerVehicle1ModSlot2,
	PlayerVehicle1ModSlot3,
	PlayerVehicle1ModSlot4,
	PlayerVehicle1ModSlot5,
	PlayerVehicle1ModSlot6,
	PlayerVehicle1ModSlot7,
	PlayerVehicle1ModSlot8,
	PlayerVehicle1ModSlot9,
	PlayerVehicle1ModSlot10,
	PlayerVehicle1ModSlot11,
	PlayerVehicle1ModSlot12,
	PlayerVehicle1ModSlot13,
	PlayerVehicle1ModNeon,
	PlayerVehicle1Tire,
	PlayerVehicle1Upgraded,
	PlayerVehicle1Trunk,
	PlayerVehicle1Trunk2,
	PlayerVehicle1Trunk3,
	PlayerVehicle1Trunk4,
	PlayerVehicle1Trunk5,
	PlayerVehicle1Goods,
	PlayerVehicle1Fuel,
	PlayerVehicle1Plate[64],
	Float:PlayerVehicle1Health,
	PlayerVehicle1Interior,
	PlayerVehicle1VirWorld,
////VEHICLE 2
	PlayerVehicleModel2,
	Float:PlayerVehiclePosX2,
	Float:PlayerVehiclePosY2,
	Float:PlayerVehiclePosZ2,
	Float:PlayerVehicleFacing2,
	pPlayerVehicle2Color,
	pPlayerVehicle2Color2,
	pVehLock2,
	pVehLocked2,
 	PlayerVehicle2PaintJob,
	PlayerVehicle2ModSlot0,
	PlayerVehicle2ModSlot1,
	PlayerVehicle2ModSlot2,
	PlayerVehicle2ModSlot3,
	PlayerVehicle2ModSlot4,
	PlayerVehicle2ModSlot5,
	PlayerVehicle2ModSlot6,
	PlayerVehicle2ModSlot7,
	PlayerVehicle2ModSlot8,
	PlayerVehicle2ModSlot9,
	PlayerVehicle2ModSlot10,
	PlayerVehicle2ModSlot11,
	PlayerVehicle2ModSlot12,
	PlayerVehicle2ModSlot13,
	PlayerVehicle2ModNeon,
	PlayerVehicle2Tire,
	PlayerVehicle2Upgraded,
	PlayerVehicle2Trunk,
	PlayerVehicle2Trunk2,
	PlayerVehicle2Trunk3,
	PlayerVehicle2Trunk4,
	PlayerVehicle2Trunk5,
	PlayerVehicle2Goods,
	PlayerVehicle2Fuel,
	PlayerVehicle2Plate[64],
	Float:PlayerVehicle2Health,
	PlayerVehicle2Interior,
	PlayerVehicle2VirWorld,
////VEHICLE 3
	PlayerVehicleModel3,
	Float:PlayerVehiclePosX3,
	Float:PlayerVehiclePosY3,
	Float:PlayerVehiclePosZ3,
	Float:PlayerVehicleFacing3,
	pPlayerVehicle3Color,
	pPlayerVehicle3Color2,
	pVehLock3,
	pVehLocked3,
 	PlayerVehicle3PaintJob,
	PlayerVehicle3ModSlot0,
	PlayerVehicle3ModSlot1,
	PlayerVehicle3ModSlot2,
	PlayerVehicle3ModSlot3,
	PlayerVehicle3ModSlot4,
	PlayerVehicle3ModSlot5,
	PlayerVehicle3ModSlot6,
	PlayerVehicle3ModSlot7,
	PlayerVehicle3ModSlot8,
	PlayerVehicle3ModSlot9,
	PlayerVehicle3ModSlot10,
	PlayerVehicle3ModSlot11,
	PlayerVehicle3ModSlot12,
	PlayerVehicle3ModSlot13,
	PlayerVehicle3ModNeon,
	PlayerVehicle3Tire,
	PlayerVehicle3Upgraded,
	PlayerVehicle3Trunk,
	PlayerVehicle3Trunk2,
	PlayerVehicle3Trunk3,
	PlayerVehicle3Trunk4,
	PlayerVehicle3Trunk5,
	PlayerVehicle3Goods,
	PlayerVehicle3Fuel,
	PlayerVehicle3Plate[64],
	Float:PlayerVehicle3Health,
	PlayerVehicle3Interior,
	PlayerVehicle3VirWorld,
////VEHICLE 4
	PlayerVehicleModel4,
	Float:PlayerVehiclePosX4,
	Float:PlayerVehiclePosY4,
	Float:PlayerVehiclePosZ4,
	Float:PlayerVehicleFacing4,
	pPlayerVehicle4Color,
	pPlayerVehicle4Color2,
	pVehLock4,
	pVehLocked4,
 	PlayerVehicle4PaintJob,
	PlayerVehicle4ModSlot0,
	PlayerVehicle4ModSlot1,
	PlayerVehicle4ModSlot2,
	PlayerVehicle4ModSlot3,
	PlayerVehicle4ModSlot4,
	PlayerVehicle4ModSlot5,
	PlayerVehicle4ModSlot6,
	PlayerVehicle4ModSlot7,
	PlayerVehicle4ModSlot8,
	PlayerVehicle4ModSlot9,
	PlayerVehicle4ModSlot10,
	PlayerVehicle4ModSlot11,
	PlayerVehicle4ModSlot12,
	PlayerVehicle4ModSlot13,
	PlayerVehicle4ModNeon,
	PlayerVehicle4Tire,
	PlayerVehicle4Upgraded,
	PlayerVehicle4Trunk,
	PlayerVehicle4Trunk2,
	PlayerVehicle4Trunk3,
	PlayerVehicle4Trunk4,
	PlayerVehicle4Trunk5,
	PlayerVehicle4Goods,
	PlayerVehicle4Fuel,
	PlayerVehicle4Plate[64],
	Float:PlayerVehicle4Health,
	PlayerVehicle4Interior,
	PlayerVehicle4VirWorld,
////VEHICLE 5
	PlayerVehicleModel5,
	Float:PlayerVehiclePosX5,
	Float:PlayerVehiclePosY5,
	Float:PlayerVehiclePosZ5,
	Float:PlayerVehicleFacing5,
	pPlayerVehicle5Color,
	pPlayerVehicle5Color2,
	pVehLock5,
	pVehLocked5,
 	PlayerVehicle5PaintJob,
	PlayerVehicle5ModSlot0,
	PlayerVehicle5ModSlot1,
	PlayerVehicle5ModSlot2,
	PlayerVehicle5ModSlot3,
	PlayerVehicle5ModSlot4,
	PlayerVehicle5ModSlot5,
	PlayerVehicle5ModSlot6,
	PlayerVehicle5ModSlot7,
	PlayerVehicle5ModSlot8,
	PlayerVehicle5ModSlot9,
	PlayerVehicle5ModSlot10,
	PlayerVehicle5ModSlot11,
	PlayerVehicle5ModSlot12,
	PlayerVehicle5ModSlot13,
	PlayerVehicle5ModNeon,
	PlayerVehicle5Tire,
	PlayerVehicle5Upgraded,
	PlayerVehicle5Trunk,
	PlayerVehicle5Trunk2,
	PlayerVehicle5Trunk3,
	PlayerVehicle5Trunk4,
	PlayerVehicle5Trunk5,
	PlayerVehicle5Goods,
	PlayerVehicle5Fuel,
	PlayerVehicle5Plate[64],
	Float:PlayerVehicle5Health,
	PlayerVehicle5Interior,
	PlayerVehicle5VirWorld,
	//
	pPhousekey,
	pPhousekey2,
	pGarageKey,
	pGarageKey2,
	pGateKey,
	pGateKey2,
	pGateKey3,
	pGateKey4,
	pGateKey5,
	pGateKey6,
	pGateKey7,
	pGateKey8,
	pGateKey9,
	pGateKey10,
	pCrimes,
	pRobberTime,
	pRobberSkill,
	pSFMember,
	pSFLeader,
	InHouse,
	InGarage,
	HouseInterior,
	Robbing,
	cIntID,
	cExtID,
	Float: cExtX,
	Float: cExtY,
	Float: cExtZ,
	Float: cIntX,
	Float: cIntY,
	Float: cIntZ,
	buildingInterior,
	buildingExterior,
	Inbuilding,
	InBuilding,
	CashLoaded,
	CashLoading,
	ROffered,
	motelInterior,
	motelExterior,
	ROfferer,
	HouseExterior,
	hIntID,
	hExtID,
	Float: hExtX,
	Float: hExtY,
	Float: hExtZ,
	Float: hIntX,
	Float: hIntY,
	Float: hIntZ,
	pSpecOps,
	ItemSlot1,
	ItemHide1,
	ItemColor,
	ItemID,
 	ItemBone,
 	Float: ItemOffsetX,
 	Float: ItemOffsetY,
 	Float: ItemOffsetZ,
 	Float: ItemRotX,
 	Float: ItemRotY,
 	Float: ItemRotZ,
 	Float: ItemScaleX,
 	Float: ItemScaleY,
 	Float: ItemScaleZ,
 	ItemSlot2,
 	ItemHide2,
 	Item2Color,
	Item2ID,
 	Item2Bone,
 	Float: Item2OffsetX,
 	Float: Item2OffsetY,
 	Float: Item2OffsetZ,
 	Float: Item2RotX,
 	Float: Item2RotY,
 	Float: Item2RotZ,
 	Float: Item2ScaleX,
 	Float: Item2ScaleY,
 	Float: Item2ScaleZ,
 	ItemSlot3,
 	ItemHide3,
 	Item3Color,
	Item3ID,
 	Item3Bone,
 	Float: Item3OffsetX,
 	Float: Item3OffsetY,
 	Float: Item3OffsetZ,
 	Float: Item3RotX,
 	Float: Item3RotY,
 	Float: Item3RotZ,
 	Float: Item3ScaleX,
 	Float: Item3ScaleY,
 	Float: Item3ScaleZ,
 	ItemSlot4,
 	ItemHide4,
 	Item4Color,
	Item4ID,
 	Item4Bone,
 	Float: Item4OffsetX,
 	Float: Item4OffsetY,
 	Float: Item4OffsetZ,
 	Float: Item4RotX,
 	Float: Item4RotY,
 	Float: Item4RotZ,
 	Float: Item4ScaleX,
 	Float: Item4ScaleY,
 	Float: Item4ScaleZ,
 	ItemSlot5,
 	ItemHide5,
 	Item5Color,
	Item5ID,
 	Item5Bone,
 	Float: Item5OffsetX,
 	Float: Item5OffsetY,
 	Float: Item5OffsetZ,
 	Float: Item5RotX,
 	Float: Item5RotY,
 	Float: Item5RotZ,
 	Float: Item5ScaleX,
 	Float: Item5ScaleY,
 	Float: Item5ScaleZ,
	pViewPms,
	pAdMuted,
	pVirWorld,
	pGangMod,
	gPupgrade,
	pConnectTime,
	Float: bExtX,
	Float: bExtY,
	Float: bExtZ,
	Float: bIntX,
	Float: bIntY,
	Float: bIntZ,
	bIntID,
	bExtID,
	BusinessInterior,
	BusinessExterior,
	InBusiness,
	pReg,
	pSex,
	pAge,
	pPIN,
	pRPBoost,
	pOrigin,
	pMuted,
	pExp,
	pCash,
	pAccount,
	pCrimeFR,
	pKills,
	pDeaths,
	pCHits,
	pFHits,
	pArrested,
	pPainkiller,
	pPainEffect,
	pLottoNr,
	pBiggestFish,
	pSironID,
	pJob,
	pJobdelay,
	pJobtime,
	pHadChecks,
	pHeadValue,
	pJailed,
	pJailTime,
	pMats,
	pPot,
	pCrack,
	pLeader,
	pMember,
	pFMember,
	pRank,
	pDetSkill,
	pSexSkill,
	pBoxSkill,
	pLawSkill,
	pMechSkill,
	pJackSkill,
	pCarSkill,
	pNewsSkill,
	pDrugsSkill,
	pArmsSkill,
	pSmugglerSkill,
	pFishSkill,
	pFightingStyle,
	Float:pHealth,
	Float:pArmor,
	pInt,
	pLocal,
	pVirtualWorld,
	pModel,
	pOldModel,
	pPnumber,
	pPcredit,
	Inmotel,
	pPbiskey,
	pPbiskey2,
	pPaptkey,
	pCarLic,
	pFlyLic,
	pBoatLic,
	pATMcard,
	pTruckLic,
	pGunLic,
	pSache,
	pGun0,
	pGun1,
	pGun2,
	pGun3,
	pGun4,
	pGun5,
	pGun6,
	pGun7,
	pGun8,
	pGun9,
	pGun10,
	pGun11,
	pGun12,
	pCarTime,
	pDrugsTime,
	pLawyerTime,
	pLawyerFreeTime,
	pMechTime,
	pSexTime,
	pPayDay,
	pPayDayHad,
	pSuspendLic,//suspendedlicense
	pCDPlayer,
	pDice,
	pScrew,
	pRope,
	pSnack,
	pGoldCoin,
	pBandage,
	pBandageEffect,
	pCookies,
	pWT,
	pWTc,
	pBoomBox,
	pSweeping,
	pBombs,
	pScope,
	pMask,
	pWins,
	pLoses,
	pTut,
	pOnDuty,
	pDutyTime,
	pInjured,
	//-----------[New Weapon system]-----------//
	pAKbarrel,
	pDebarrel,
	pCSGbarrel,
	pAKstock,
	pDestock,
	pCSGstock,
	pAKmagazine,
	pDemagazine,
	pCSGmagazine,
	//------------------------------------------//
	pAdjustable,
	pMarried,
	pMap,
	pMarriedTo[128],
	Float: dExtX,
	Float: dExtY,
	Float: dExtZ,
	Float: dAngle,
	pContractBy[128],
	pIP[16],
	pFishRod,
    pFishBait,
	pNewbieMuted,
	prhmuted,
	pSafeSpawn,
	Float:pSPos_x,
	Float:pSPos_y,
	Float:pSPos_z,
	Float:pSPos_r,
	pHelper,
	pvLoaded,
	pRequestingBackup,
	pCrime[6],
	pCrimeReason0[128],
	pCrimeReason1[128],
	pCrimeReason2[128],
	pCrimeReason3[128],
	pCrimeReason4[128],
	pCrimeReason5[128],
	pCrimeReporter0[MAX_PLAYER_NAME],
	pCrimeReporter1[MAX_PLAYER_NAME],
	pCrimeReporter2[MAX_PLAYER_NAME],
	pCrimeReporter3[MAX_PLAYER_NAME],
	pCrimeReporter4[MAX_PLAYER_NAME],
	pCrimeReporter5[MAX_PLAYER_NAME],
	pCrimeDate0[32],
	pCrimeDate1[32],
	pCrimeDate2[32],
	pCrimeDate3[32],
	pCrimeDate4[32],
	pCrimeDate5[32],
	pBlindfolds,
	pSpeakPhone,
	pSeeds,
};
new PlayerInfo[MAX_PLAYERS][pInfo];

stock IPBanPlayer(playerid, reason[])
{
	strmid(PlayerInfo[playerid][pBanReason], reason, 0, strlen(reason), 255);
	PlayerInfo[playerid][pBanned] = 1;
	SetTimerEx("DelayedKick", 1000, false, "i", playerid);
	return 1;
}

public OnPlayerLogin(playerid,password[])
{
 	new tmp2[256];
    new string2[128];
	format(string2, sizeof(string2), "%s.ini", PlayerName(playerid));
	new File: UserFile = fopen(string2, io_read);
	if ( UserFile )
    {
        new PassData[128];
	    new keytmp[256], valtmp[256];
	    fread( UserFile , PassData , sizeof( PassData ) );
	    keytmp = ini_GetKey( PassData );
	    if( strcmp( keytmp , "Key" , true ) == 0 )
		{
			valtmp = ini_GetValue( PassData );
			strmid(PlayerInfo[playerid][pKey], valtmp, 0, strlen(valtmp)-1, 255);
		}
		if(strcmp(PlayerInfo[playerid][pKey],password, true ) == 0 )
        {
	    	new key[ 256 ] , val[ 256 ];
			new Data[ 256 ];
			while ( fread( UserFile , Data , sizeof( Data ) ) )
			{
			    key = ini_GetKey( Data );
			    if( strcmp( key , "Level" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pLevel] = strvalEx( val ); }
			    if( strcmp( key , "Energy" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pEnergy] = strvalEx( val ); }
			    if( strcmp( key , "Compo" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pCompo] = strvalEx( val ); }
			    if( strcmp( key , "IDC" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pIDC] = strvalEx( val ); }
			    if( strcmp( key , "AdminLevel" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pAdmin] = strvalEx( val ); }
			    if( strcmp( key , "Band" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pBand] = strvalEx( val ); }
				if( strcmp( key , "PermaBand" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pPermBand] = strvalEx( val ); }
			    if( strcmp( key , "Warn" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pWarns] = strvalEx( val ); }
			    if( strcmp( key , "DonateRank" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pDonateRank] = strvalEx( val ); }
			    if( strcmp( key , "DonateTime" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pDonateTime] = strvalEx( val ); }
			    if( strcmp( key , "ATMExterior" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][ATMExterior] = strvalEx( val ); }
		    	if( strcmp( key , "ATMID" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][ATMID] = strvalEx( val ); }
			    if( strcmp( key , "MAPBExterior" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][MAPBExterior] = strvalEx( val ); }
			    if( strcmp( key , "GSTATIONExterior" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][GSTATIONExterior] = strvalEx( val ); }
			    if( strcmp( key , "HSSignExterior" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][HSSignExterior] = strvalEx( val ); }
		    	if( strcmp( key , "MAPBID" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][MAPBID] = strvalEx( val ); }
		    	if( strcmp( key , "GSTATIONID" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][GSTATIONID] = strvalEx( val ); }
		    	if( strcmp( key , "HSSignID" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][HSSignID] = strvalEx( val ); }
				if( strcmp( key , "FactionBanned" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pFactionBanned] = strvalEx( val ); }
   				if( strcmp( key , "FCard" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pFcard] = strvalEx( val ); }
     			if( strcmp( key , "dExtX" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][dExtX] = floatstr( val ); }
			 	if( strcmp( key , "dExtY" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][dExtY] = floatstr( val ); }
			 	if( strcmp( key , "dExtZ" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][dExtZ] = floatstr( val ); }
			    if( strcmp( key , "GangMod" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pGangMod] = strvalEx( val ); }
      			if( strcmp( key , "Famed" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pFamed] = strvalEx( val ); }
   				if( strcmp( key , "FactionMod" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pFactionMod] = strvalEx( val ); }
			 	if( strcmp( key , "UpgradePoints" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][gPupgrade] = strvalEx( val ); }
			    if( strcmp( key , "ConnectedTime" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pConnectTime] = strvalEx( val ); }
			    if( strcmp( key , "Registered" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pReg] = strvalEx( val ); }
			    if( strcmp( key , "Body0" , true ) == 0 ) { val = ini_GetValue( Data ); pBody[playerid][0] = strvalEx( val ); }
			    if( strcmp( key , "Body1" , true ) == 0 ) { val = ini_GetValue( Data ); pBody[playerid][1] = strvalEx( val ); }
			    if( strcmp( key , "Body2" , true ) == 0 ) { val = ini_GetValue( Data ); pBody[playerid][2] = strvalEx( val ); }
			    if( strcmp( key , "Body3" , true ) == 0 ) { val = ini_GetValue( Data ); pBody[playerid][3] = strvalEx( val ); }
			    if( strcmp( key , "Body4" , true ) == 0 ) { val = ini_GetValue( Data ); pBody[playerid][4] = strvalEx( val ); }
			    if( strcmp( key , "Body5" , true ) == 0 ) { val = ini_GetValue( Data ); pBody[playerid][5] = strvalEx( val ); }
			    if( strcmp( key , "Body6" , true ) == 0 ) { val = ini_GetValue( Data ); pBody[playerid][6] = strvalEx( val ); }
			    if( strcmp( key , "Body7" , true ) == 0 ) { val = ini_GetValue( Data ); pBody[playerid][7] = strvalEx( val ); }
			    if( strcmp( key , "Body8" , true ) == 0 ) { val = ini_GetValue( Data ); pBody[playerid][8] = strvalEx( val ); }
			    if( strcmp( key , "Body9" , true ) == 0 ) { val = ini_GetValue( Data ); pBody[playerid][9] = strvalEx( val ); }
			    if( strcmp( key , "Body10" , true ) == 0 ) { val = ini_GetValue( Data ); pBody[playerid][10] = strvalEx( val ); }
			    if( strcmp( key , "Body11" , true ) == 0 ) { val = ini_GetValue( Data ); pBody[playerid][11] = strvalEx( val ); }
			    if( strcmp( key , "Body12" , true ) == 0 ) { val = ini_GetValue( Data ); pBody[playerid][12] = strvalEx( val ); }
			    if( strcmp( key , "Body13" , true ) == 0 ) { val = ini_GetValue( Data ); pBody[playerid][13] = strvalEx( val ); }
			    if( strcmp( key , "Body14" , true ) == 0 ) { val = ini_GetValue( Data ); pBody[playerid][14] = strvalEx( val ); }
			    if( strcmp( key , "Body15" , true ) == 0 ) { val = ini_GetValue( Data ); pBody[playerid][15] = strvalEx( val ); }
			    if( strcmp( key , "Body16" , true ) == 0 ) { val = ini_GetValue( Data ); pBody[playerid][16] = strvalEx( val ); }
			    if( strcmp( key , "Body17" , true ) == 0 ) { val = ini_GetValue( Data ); pBody[playerid][17] = strvalEx( val ); }
			    if( strcmp( key , "Body18" , true ) == 0 ) { val = ini_GetValue( Data ); pBody[playerid][18] = strvalEx( val ); }
				if( strcmp( key , "Fish1" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(Fishes[playerid][pFish1], val, 0, strlen(val)-1, 255); }
				if( strcmp( key , "Fish2" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(Fishes[playerid][pFish2], val, 0, strlen(val)-1, 255); }
				if( strcmp( key , "Fish3" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(Fishes[playerid][pFish3], val, 0, strlen(val)-1, 255); }
				if( strcmp( key , "Fish4" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(Fishes[playerid][pFish4], val, 0, strlen(val)-1, 255); }
				if( strcmp( key , "Fish5" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(Fishes[playerid][pFish5], val, 0, strlen(val)-1, 255); }
				if( strcmp( key , "Weight1" , true ) == 0 ) { val = ini_GetValue( Data ); Fishes[playerid][pWeight1] = strvalEx( val ); }
				if( strcmp( key , "Weight2" , true ) == 0 ) { val = ini_GetValue( Data ); Fishes[playerid][pWeight2] = strvalEx( val ); }
				if( strcmp( key , "Weight3" , true ) == 0 ) { val = ini_GetValue( Data ); Fishes[playerid][pWeight3] = strvalEx( val ); }
				if( strcmp( key , "Weight4" , true ) == 0 ) { val = ini_GetValue( Data ); Fishes[playerid][pWeight4] = strvalEx( val ); }
				if( strcmp( key , "Weight5" , true ) == 0 ) { val = ini_GetValue( Data ); Fishes[playerid][pWeight5] = strvalEx( val ); }
			    if( strcmp( key , "Sex" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pSex] = strvalEx( val ); }
			    if( strcmp( key , "House" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pPhousekey] = strvalEx( val ); }
			    if( strcmp( key , "House2" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pPhousekey2] = strvalEx( val ); }
                if( strcmp( key , "InHouse" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][InHouse] = strvalEx( val ); }
                if( strcmp( key , "InGarage" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][InGarage] = strvalEx( val ); }
                if( strcmp( key , "HouseExterior" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][HouseExterior] = strvalEx( val ); }
                if( strcmp( key , "HouseInterior" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][HouseInterior] = strvalEx( val ); }
                if( strcmp( key , "hIntID" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][hIntID] = strvalEx( val ); }
                if( strcmp( key , "CarTime" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pCarTime] = strvalEx( val ); }
                if( strcmp( key , "hExtID" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][hExtID] = strvalEx( val ); }
			 	if( strcmp( key , "hExtX" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][hExtX] = floatstr( val ); }
			 	if( strcmp( key , "hExtY" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][hExtY] = floatstr( val ); }
			 	if( strcmp( key , "hExtZ" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][hExtZ] = floatstr( val ); }
			 	if( strcmp( key , "hIntX" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][hIntX] = floatstr( val ); }
			 	if( strcmp( key , "hIntY" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][hIntY] = floatstr( val ); }
			 	if( strcmp( key , "hIntZ" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][hIntZ] = floatstr( val ); }
			 	if( strcmp( key , "Inbuilding" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Inbuilding] = strvalEx( val ); }
    			if( strcmp( key , "buildingExterior" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][buildingExterior] = strvalEx( val ); }
                if( strcmp( key , "buildingInterior" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][buildingInterior] = strvalEx( val ); }
                if( strcmp( key , "cIntID" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][cIntID] = strvalEx( val ); }
                if( strcmp( key , "cIntID" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][cIntID] = strvalEx( val ); }
			 	if( strcmp( key , "cExtX" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][cExtX] = floatstr( val ); }
			 	if( strcmp( key , "cExtY" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][cExtY] = floatstr( val ); }
			 	if( strcmp( key , "cExtZ" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][cExtZ] = floatstr( val ); }
			 	if( strcmp( key , "Inmotel" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Inmotel] = strvalEx( val ); }
			 	if( strcmp( key , "motelExterior" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][motelExterior] = strvalEx( val ); }
                if( strcmp( key , "motelInterior" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][motelInterior] = strvalEx( val ); }
                if( strcmp( key , "mIntID" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][mIntID] = strvalEx( val ); }
                if( strcmp( key , "mIntID" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][mIntID] = strvalEx( val ); }
			 	if( strcmp( key , "mExtX" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][mExtX] = floatstr( val ); }
			 	if( strcmp( key , "mExtY" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][mExtY] = floatstr( val ); }
			 	if( strcmp( key , "mExtZ" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][mExtZ] = floatstr( val ); }
			 	if( strcmp( key , "mIntX" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][mIntX] = floatstr( val ); }
			 	if( strcmp( key , "mIntY" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][mIntY] = floatstr( val ); }
			 	if( strcmp( key , "mIntZ" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][mIntZ] = floatstr( val ); }
			 	if( strcmp( key , "cIntX" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][cIntX] = floatstr( val ); }
			 	if( strcmp( key , "cIntY" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][cIntY] = floatstr( val ); }
			 	if( strcmp( key , "cIntZ" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][cIntZ] = floatstr( val ); }
			 	if( strcmp( key , "ItemSlot1" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][ItemSlot1] = strvalEx( val ); }
			 	if( strcmp( key , "ItemHide1" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][ItemHide1] = strvalEx( val ); }
			 	if( strcmp( key , "ItemColor" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][ItemColor] = strvalEx( val ); }
			 	if( strcmp( key , "ItemID" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][ItemID] = strvalEx( val ); }
			 	if( strcmp( key , "ItemBone" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][ItemBone] = strvalEx( val ); }
			 	if( strcmp( key , "ItemOffsetX" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][ItemOffsetX] = floatstr( val ); }
			 	if( strcmp( key , "ItemOffsetY" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][ItemOffsetY] = floatstr( val ); }
			 	if( strcmp( key , "ItemOffsetZ" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][ItemOffsetZ] = floatstr( val ); }
			 	if( strcmp( key , "ItemRotX" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][ItemRotX] = floatstr( val ); }
			 	if( strcmp( key , "ItemRotY" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][ItemRotY] = floatstr( val ); }
			 	if( strcmp( key , "ItemRotZ" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][ItemRotZ] = floatstr( val ); }
			 	if( strcmp( key , "ItemScaleX" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][ItemScaleX] = floatstr( val ); }
			 	if( strcmp( key , "ItemScaleY" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][ItemScaleY] = floatstr( val ); }
			 	if( strcmp( key , "ItemScaleZ" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][ItemScaleZ] = floatstr( val ); }
			 	if( strcmp( key , "ItemSlot2" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][ItemSlot2] = strvalEx( val ); }
			 	if( strcmp( key , "ItemHide2" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][ItemHide2] = strvalEx( val ); }
			 	if( strcmp( key , "Item2Color" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item2Color] = strvalEx( val ); }
			 	if( strcmp( key , "Item2ID" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item2ID] = strvalEx( val ); }
			 	if( strcmp( key , "Item2Bone" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item2Bone] = strvalEx( val ); }
			 	if( strcmp( key , "Item2OffsetX" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item2OffsetX] = floatstr( val ); }
			 	if( strcmp( key , "Item2OffsetY" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item2OffsetY] = floatstr( val ); }
			 	if( strcmp( key , "Item2OffsetZ" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item2OffsetZ] = floatstr( val ); }
			 	if( strcmp( key , "Item2RotX" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item2RotX] = floatstr( val ); }
			 	if( strcmp( key , "Item2RotY" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item2RotY] = floatstr( val ); }
			 	if( strcmp( key , "Item2RotZ" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item2RotZ] = floatstr( val ); }
			 	if( strcmp( key , "Item2ScaleX" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item2ScaleX] = floatstr( val ); }
			 	if( strcmp( key , "Item2ScaleY" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item2ScaleY] = floatstr( val ); }
			 	if( strcmp( key , "Item2ScaleZ" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item2ScaleZ] = floatstr( val ); }
			 	if( strcmp( key , "ItemSlot3" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][ItemSlot3] = strvalEx( val ); }
			 	if( strcmp( key , "ItemHide3" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][ItemHide3] = strvalEx( val ); }
			 	if( strcmp( key , "Item3Color" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item3Color] = strvalEx( val ); }
			 	if( strcmp( key , "Item3ID" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item3ID] = strvalEx( val ); }
			 	if( strcmp( key , "Item3Bone" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item3Bone] = strvalEx( val ); }
			 	if( strcmp( key , "Item3OffsetX" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item3OffsetX] = floatstr( val ); }
			 	if( strcmp( key , "Item3OffsetY" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item3OffsetY] = floatstr( val ); }
			 	if( strcmp( key , "Item3OffsetZ" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item3OffsetZ] = floatstr( val ); }
			 	if( strcmp( key , "Item3RotX" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item3RotX] = floatstr( val ); }
			 	if( strcmp( key , "Item3RotY" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item3RotY] = floatstr( val ); }
			 	if( strcmp( key , "Item3RotZ" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item3RotZ] = floatstr( val ); }
			 	if( strcmp( key , "Item3ScaleX" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item3ScaleX] = floatstr( val ); }
			 	if( strcmp( key , "Item3ScaleY" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item3ScaleY] = floatstr( val ); }
			 	if( strcmp( key , "Item3ScaleZ" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item3ScaleZ] = floatstr( val ); }
			 	if( strcmp( key , "ItemSlot4" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][ItemSlot4] = strvalEx( val ); }
			 	if( strcmp( key , "ItemHide4" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][ItemHide4] = strvalEx( val ); }
			 	if( strcmp( key , "Item4Color" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item4Color] = strvalEx( val ); }
			 	if( strcmp( key , "Item4ID" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item4ID] = strvalEx( val ); }
			 	if( strcmp( key , "Item4Bone" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item4Bone] = strvalEx( val ); }
			 	if( strcmp( key , "Item4OffsetX" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item4OffsetX] = floatstr( val ); }
			 	if( strcmp( key , "Item4OffsetY" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item4OffsetY] = floatstr( val ); }
			 	if( strcmp( key , "Item4OffsetZ" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item4OffsetZ] = floatstr( val ); }
			 	if( strcmp( key , "Item4RotX" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item4RotX] = floatstr( val ); }
			 	if( strcmp( key , "Item4RotY" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item4RotY] = floatstr( val ); }
			 	if( strcmp( key , "Item4RotZ" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item4RotZ] = floatstr( val ); }
			 	if( strcmp( key , "Item4ScaleX" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item4ScaleX] = floatstr( val ); }
			 	if( strcmp( key , "Item4ScaleY" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item4ScaleY] = floatstr( val ); }
			 	if( strcmp( key , "Item4ScaleZ" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item4ScaleZ] = floatstr( val ); }
			 	if( strcmp( key , "ItemSlot5" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][ItemSlot5] = strvalEx( val ); }
			 	if( strcmp( key , "ItemHide5" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][ItemHide5] = strvalEx( val ); }
			 	if( strcmp( key , "Item5Color" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item5Color] = strvalEx( val ); }
			 	if( strcmp( key , "Item5ID" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item5ID] = strvalEx( val ); }
			 	if( strcmp( key , "Item5Bone" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item5Bone] = strvalEx( val ); }
			 	if( strcmp( key , "Item5OffsetX" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item5OffsetX] = floatstr( val ); }
			 	if( strcmp( key , "Item5OffsetY" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item5OffsetY] = floatstr( val ); }
			 	if( strcmp( key , "Item5OffsetZ" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item5OffsetZ] = floatstr( val ); }
			 	if( strcmp( key , "Item5RotX" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item5RotX] = floatstr( val ); }
			 	if( strcmp( key , "Item5RotY" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item5RotY] = floatstr( val ); }
			 	if( strcmp( key , "Item5RotZ" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item5RotZ] = floatstr( val ); }
			 	if( strcmp( key , "Item5ScaleX" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item5ScaleX] = floatstr( val ); }
			 	if( strcmp( key , "Item5ScaleY" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item5ScaleY] = floatstr( val ); }
			 	if( strcmp( key , "Item5ScaleZ" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item5ScaleZ] = floatstr( val ); }
			 	if( strcmp( key , "TrashSkill" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pTrashSkill] = strvalEx( val ); } // Trashman
				if( strcmp( key , "Debarrel" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pDebarrel] = strvalEx( val ); }
     			if( strcmp( key , "AKbarrel" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pAKbarrel] = strvalEx( val ); }
     			if( strcmp( key , "CSGbarrel" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pCSGbarrel] = strvalEx( val ); }
				if( strcmp( key , "Destock" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pDestock] = strvalEx( val ); }
     			if( strcmp( key , "AKstock" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pAKstock] = strvalEx( val ); }
     			if( strcmp( key , "CSGstock" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pCSGstock] = strvalEx( val ); }
			 	////////////////Vehicle 1
				if( strcmp( key , "PlayerVehicleModel1" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicleModel1] = strval( val ); }
				if( strcmp( key , "PlayerVehicleFacing1" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicleFacing1] = floatstr( val ); }
				if( strcmp( key , "PlayerVehicle1Color" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pPlayerVehicle1Color] = strval( val ); }
				if( strcmp( key , "PlayerVehicle1Color2" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pPlayerVehicle1Color2] = strval( val ); }
				if( strcmp( key , "PlayerVehiclePosX1" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehiclePosX1] = floatstr( val ); }
				if( strcmp( key , "PlayerVehiclePosY1" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehiclePosY1] = floatstr( val ); }
				if( strcmp( key , "PlayerVehiclePosZ1" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehiclePosZ1] = floatstr( val ); }
				if( strcmp( key , "PlayerVehicle1PaintJob" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle1PaintJob] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle1ModSlot0" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle1ModSlot0] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle1ModSlot1" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle1ModSlot1] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle1ModSlot2" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle1ModSlot2] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle1ModSlot3" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle1ModSlot3] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle1ModSlot4" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle1ModSlot4] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle1ModSlot5" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle1ModSlot5] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle1ModSlot6" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle1ModSlot6] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle1ModSlot7" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle1ModSlot7] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle1ModSlot8" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle1ModSlot8] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle1ModSlot9" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle1ModSlot9] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle1ModSlot10" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle1ModSlot10] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle1ModSlot11" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle1ModSlot11] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle1ModSlot12" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle1ModSlot12] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle1ModSlot13" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle1ModSlot13] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle1ModNeon" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle1ModNeon] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle1Tire" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle1Tire] = strvalEx( val );  }
				if( strcmp( key , "PlayerVehicle1Upgraded" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle1Upgraded] = strvalEx( val );  }
				if( strcmp( key , "PlayerVehicle1Trunk" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle1Trunk] = strvalEx( val );  }
				if( strcmp( key , "PlayerVehicle1Trunk2" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle1Trunk2] = strvalEx( val );  }
				if( strcmp( key , "PlayerVehicle1Trunk3" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle1Trunk3] = strvalEx( val );  }
				if( strcmp( key , "PlayerVehicle1Trunk4" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle1Trunk4] = strvalEx( val );  }
				if( strcmp( key , "PlayerVehicle1Trunk5" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle1Trunk5] = strvalEx( val );  }
				if( strcmp( key , "PlayerVehicle1Goods" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle1Goods] = strvalEx( val );  }
				if( strcmp( key , "PlayerVehicle1Fuel" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle1Fuel] = strvalEx( val );  }
				if( strcmp( key , "PlayerVehicle1Plate" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[playerid][PlayerVehicle1Plate], val, 0, strlen(val)-1, 255); }
				if( strcmp( key , "PlayerVehicle1Health" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle1Health] = floatstr( val ); }
			 	if( strcmp( key , "VehLock1" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pVehLock1] = strvalEx( val ); }
			 	if( strcmp( key , "VehLocked1" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pVehLocked1] = strvalEx( val ); }
			 	if( strcmp( key , "PlayerVehicle1VirWorld" , true) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle1VirWorld] = strvalEx( val ); }
			 	if( strcmp( key , "PlayerVehicle1Interior" , true) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle1Interior] = strvalEx( val ); }
///////////////Vehicle 2
				if( strcmp( key , "PlayerVehicleModel2" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicleModel2] = strval( val ); }
				if( strcmp( key , "PlayerVehicleFacing2" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicleFacing2] = floatstr( val ); }
				if( strcmp( key , "PlayerVehicle2Color" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pPlayerVehicle2Color] = strval( val ); }
				if( strcmp( key , "PlayerVehicle2Color2" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pPlayerVehicle2Color2] = strval( val ); }
				if( strcmp( key , "PlayerVehiclePosX2" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehiclePosX2] = floatstr( val ); }
				if( strcmp( key , "PlayerVehiclePosY2" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehiclePosY2] = floatstr( val ); }
				if( strcmp( key , "PlayerVehiclePosZ2" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehiclePosZ2] = floatstr( val ); }
				if( strcmp( key , "PlayerVehicle2PaintJob" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle2PaintJob] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle2ModSlot0" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle2ModSlot0] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle2ModSlot1" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle2ModSlot1] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle2ModSlot2" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle2ModSlot2] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle2ModSlot3" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle2ModSlot3] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle2ModSlot4" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle2ModSlot4] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle2ModSlot5" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle2ModSlot5] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle2ModSlot6" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle2ModSlot6] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle2ModSlot7" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle2ModSlot7] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle2ModSlot8" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle2ModSlot8] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle2ModSlot9" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle2ModSlot9] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle2ModSlot10" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle2ModSlot10] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle2ModSlot11" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle2ModSlot11] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle2ModSlot12" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle2ModSlot12] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle2ModSlot13" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle2ModSlot13] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle2ModNeon" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle2ModNeon] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle2Tire" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle2Tire] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle2Upgraded" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle2Upgraded] = strvalEx( val );  }
				if( strcmp( key , "PlayerVehicle2Trunk" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle2Trunk] = strvalEx( val );  }
				if( strcmp( key , "PlayerVehicle2Trunk2" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle2Trunk2] = strvalEx( val );  }
				if( strcmp( key , "PlayerVehicle2Trunk3" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle2Trunk3] = strvalEx( val );  }
				if( strcmp( key , "PlayerVehicle2Trunk4" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle2Trunk4] = strvalEx( val );  }
				if( strcmp( key , "PlayerVehicle2Trunk5" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle2Trunk5] = strvalEx( val );  }
				if( strcmp( key , "PlayerVehicle2Goods" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle2Goods] = strvalEx( val );  }
				if( strcmp( key , "PlayerVehicle2Fuel" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle2Fuel] = strvalEx( val );  }
				if( strcmp( key , "PlayerVehicle2Plate" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[playerid][PlayerVehicle2Plate], val, 0, strlen(val)-1, 255); }
				if( strcmp( key , "PlayerVehicle2Health" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle2Health] = floatstr( val ); }
			 	if( strcmp( key , "VehLock2" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pVehLock2] = strvalEx( val ); }
			 	if( strcmp( key , "VehLocked2" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pVehLocked2] = strvalEx( val ); }
                if( strcmp( key , "PlayerVehicle2VirWorld" , true) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle2VirWorld] = strvalEx( val ); }
			 	if( strcmp( key , "PlayerVehicle2Interior" , true) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle2Interior] = strvalEx( val ); }
///////////////Vehicle 3
				if( strcmp( key , "PlayerVehicleModel3" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicleModel3] = strval( val ); }
				if( strcmp( key , "PlayerVehicleFacing3" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicleFacing3] = floatstr( val ); }
				if( strcmp( key , "PlayerVehicle3Color" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pPlayerVehicle3Color] = strval( val ); }
				if( strcmp( key , "PlayerVehicle3Color2" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pPlayerVehicle3Color2] = strval( val ); }
				if( strcmp( key , "PlayerVehiclePosX3" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehiclePosX3] = floatstr( val ); }
				if( strcmp( key , "PlayerVehiclePosY3" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehiclePosY3] = floatstr( val ); }
				if( strcmp( key , "PlayerVehiclePosZ3" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehiclePosZ3] = floatstr( val ); }
				if( strcmp( key , "PlayerVehicle3PaintJob" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle3PaintJob] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle3ModSlot0" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle3ModSlot0] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle3ModSlot1" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle3ModSlot1] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle3ModSlot2" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle3ModSlot2] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle3ModSlot3" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle3ModSlot3] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle3ModSlot4" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle3ModSlot4] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle3ModSlot5" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle3ModSlot5] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle3ModSlot6" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle3ModSlot6] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle3ModSlot7" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle3ModSlot7] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle3ModSlot8" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle3ModSlot8] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle3ModSlot9" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle3ModSlot9] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle3ModSlot10" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle3ModSlot10] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle3ModSlot11" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle3ModSlot11] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle3ModSlot12" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle3ModSlot12] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle3ModSlot13" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle3ModSlot13] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle3ModNeon" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle3ModNeon] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle3Tire" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle3Tire] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle3Upgraded" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle3Upgraded] = strvalEx( val );  }
				if( strcmp( key , "PlayerVehicle3Trunk" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle3Trunk] = strvalEx( val );  }
				if( strcmp( key , "PlayerVehicle3Trunk2" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle3Trunk2] = strvalEx( val );  }
				if( strcmp( key , "PlayerVehicle3Trunk3" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle3Trunk3] = strvalEx( val );  }
				if( strcmp( key , "PlayerVehicle3Trunk4" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle3Trunk4] = strvalEx( val );  }
				if( strcmp( key , "PlayerVehicle3Trunk5" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle3Trunk5] = strvalEx( val );  }
				if( strcmp( key , "PlayerVehicle3Goods" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle3Goods] = strvalEx( val );  }
				if( strcmp( key , "PlayerVehicle3Fuel" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle3Fuel] = strvalEx( val );  }
				if( strcmp( key , "PlayerVehicle3Plate" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[playerid][PlayerVehicle3Plate], val, 0, strlen(val)-1, 255); }
				if( strcmp( key , "PlayerVehicle3Health" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle3Health] = floatstr( val ); }
			 	if( strcmp( key , "VehLock3" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pVehLock3] = strvalEx( val ); }
			 	if( strcmp( key , "VehLocked3" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pVehLocked3] = strvalEx( val ); }
			 	if( strcmp( key , "PlayerVehicle3VirWorld" , true) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle3VirWorld] = strvalEx( val ); }
			 	if( strcmp( key , "PlayerVehicle3Interior" , true) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle3Interior] = strvalEx( val ); }
///////////////Vehicle 4
				if( strcmp( key , "PlayerVehicleModel4" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicleModel4] = strval( val ); }
				if( strcmp( key , "PlayerVehicleFacing4" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicleFacing4] = floatstr( val ); }
				if( strcmp( key , "PlayerVehicle4Color" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pPlayerVehicle4Color] = strval( val ); }
				if( strcmp( key , "PlayerVehicle4Color2" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pPlayerVehicle4Color2] = strval( val ); }
				if( strcmp( key , "PlayerVehiclePosX4" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehiclePosX4] = floatstr( val ); }
				if( strcmp( key , "PlayerVehiclePosY4" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehiclePosY4] = floatstr( val ); }
				if( strcmp( key , "PlayerVehiclePosZ4" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehiclePosZ4] = floatstr( val ); }
				if( strcmp( key , "PlayerVehicle4PaintJob" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle4PaintJob] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle4ModSlot0" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle4ModSlot0] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle4ModSlot1" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle4ModSlot1] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle4ModSlot2" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle4ModSlot2] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle4ModSlot3" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle4ModSlot3] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle4ModSlot4" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle4ModSlot4] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle4ModSlot5" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle4ModSlot5] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle4ModSlot6" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle4ModSlot6] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle4ModSlot7" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle4ModSlot7] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle4ModSlot8" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle4ModSlot8] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle4ModSlot9" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle4ModSlot9] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle4ModSlot10" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle4ModSlot10] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle4ModSlot11" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle4ModSlot11] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle4ModSlot12" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle4ModSlot12] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle4ModSlot13" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle4ModSlot13] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle4ModNeon" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle4ModNeon] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle4Tire" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle4Tire] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle4Upgraded" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle4Upgraded] = strvalEx( val );  }
				if( strcmp( key , "PlayerVehicle4Trunk" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle4Trunk] = strvalEx( val );  }
				if( strcmp( key , "PlayerVehicle4Trunk2" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle4Trunk2] = strvalEx( val );  }
				if( strcmp( key , "PlayerVehicle4Trunk3" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle4Trunk3] = strvalEx( val );  }
				if( strcmp( key , "PlayerVehicle4Trunk4" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle4Trunk4] = strvalEx( val );  }
				if( strcmp( key , "PlayerVehicle4Trunk5" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle4Trunk5] = strvalEx( val );  }
				if( strcmp( key , "PlayerVehicle4Goods" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle4Goods] = strvalEx( val );  }
				if( strcmp( key , "PlayerVehicle4Fuel" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle4Fuel] = strvalEx( val );  }
				if( strcmp( key , "PlayerVehicle4Plate" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[playerid][PlayerVehicle4Plate], val, 0, strlen(val)-1, 255); }
				if( strcmp( key , "PlayerVehicle4Health" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle4Health] = floatstr( val ); }
			 	if( strcmp( key , "VehLock4" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pVehLock4] = strvalEx( val ); }
			 	if( strcmp( key , "VehLocked4" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pVehLocked4] = strvalEx( val ); }
			 	if( strcmp( key , "PlayerVehicle4VirWorld" , true) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle4VirWorld] = strvalEx( val ); }
			 	if( strcmp( key , "PlayerVehicle4Interior" , true) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle4Interior] = strvalEx( val ); }
///////////////Vehicle 5
				if( strcmp( key , "PlayerVehicleModel5" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicleModel5] = strval( val ); }
				if( strcmp( key , "PlayerVehicleFacing5" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicleFacing5] = floatstr( val ); }
				if( strcmp( key , "PlayerVehicle5Color" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pPlayerVehicle5Color] = strval( val ); }
				if( strcmp( key , "PlayerVehicle5Color2" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pPlayerVehicle5Color2] = strval( val ); }
				if( strcmp( key , "PlayerVehiclePosX5" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehiclePosX5] = floatstr( val ); }
				if( strcmp( key , "PlayerVehiclePosY5" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehiclePosY5] = floatstr( val ); }
				if( strcmp( key , "PlayerVehiclePosZ5" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehiclePosZ5] = floatstr( val ); }
				if( strcmp( key , "PlayerVehicle5PaintJob" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle5PaintJob] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle5ModSlot0" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle5ModSlot0] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle5ModSlot1" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle5ModSlot1] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle5ModSlot2" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle5ModSlot2] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle5ModSlot3" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle5ModSlot3] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle5ModSlot4" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle5ModSlot4] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle5ModSlot5" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle5ModSlot5] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle5ModSlot6" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle5ModSlot6] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle5ModSlot7" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle5ModSlot7] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle5ModSlot8" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle5ModSlot8] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle5ModSlot9" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle5ModSlot9] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle5ModSlot10" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle5ModSlot10] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle5ModSlot11" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle5ModSlot11] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle5ModSlot12" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle5ModSlot12] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle5ModSlot13" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle5ModSlot13] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle5ModNeon" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle5ModNeon] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle5Tire" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle5Tire] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle5Upgraded" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle5Upgraded] = strvalEx( val );  }
				if( strcmp( key , "PlayerVehicle5Trunk" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle5Trunk] = strvalEx( val );  }
				if( strcmp( key , "PlayerVehicle5Trunk2" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle5Trunk2] = strvalEx( val );  }
				if( strcmp( key , "PlayerVehicle5Trunk3" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle5Trunk3] = strvalEx( val );  }
				if( strcmp( key , "PlayerVehicle5Trunk4" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle5Trunk4] = strvalEx( val );  }
				if( strcmp( key , "PlayerVehicle5Trunk5" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle5Trunk5] = strvalEx( val );  }
				if( strcmp( key , "PlayerVehicle5Goods" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle5Goods] = strvalEx( val );  }
				if( strcmp( key , "PlayerVehicle5Fuel" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle5Fuel] = strvalEx( val );  }
				if( strcmp( key , "PlayerVehicle5Plate" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[playerid][PlayerVehicle5Plate], val, 0, strlen(val)-1, 255); }
				if( strcmp( key , "PlayerVehicle5Health" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle5Health] = floatstr( val ); }
			 	if( strcmp( key , "VehLock5" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pVehLock5] = strvalEx( val ); }
			 	if( strcmp( key , "VehLocked5" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pVehLocked5] = strvalEx( val ); }
			 	if( strcmp( key , "PlayerVehicle5VirWorld" , true) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle5VirWorld] = strvalEx( val ); }
			 	if( strcmp( key , "PlayerVehicle5Interior" , true) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle5Interior] = strvalEx( val ); }
///////////////
			  	if( strcmp( key , "Age" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pAge] = strvalEx( val ); }
			  	if( strcmp( key , "PIN" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pPIN] = strvalEx( val ); }
			  	if( strcmp( key , "RPBoost" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pRPBoost] = strvalEx( val ); }
			   	if( strcmp( key , "Origin" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pOrigin] = strvalEx( val ); }
			   	if( strcmp( key , "Muted" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pMuted] = strvalEx( val ); }
		        if( strcmp( key , "Respect" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pExp] = strvalEx( val ); }
		        if( strcmp( key , "Money" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pCash] = strvalEx( val ); }
	            if( strcmp( key , "CasinoWinnings" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pCasinoWinnings] = strvalEx( val ); }
		        if( strcmp( key , "Bank" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pAccount] = strvalEx( val ); }
		        if( strcmp( key , "Crimes" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pCrimes] = strvalEx( val ); }
		        if( strcmp( key , "Accent" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(Accent[playerid], val, 0, strlen(val)-1, 255); }
		        if( strcmp( key , "Kills" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pKills] = strvalEx( val ); }
				if( strcmp( key , "Deaths" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pDeaths] = strvalEx( val ); }
	            if( strcmp( key , "CHits" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pCHits] = strvalEx( val ); }
				if( strcmp( key , "FHits" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pFHits] = strvalEx( val ); }
	            if( strcmp( key , "Arrested" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pArrested] = strvalEx( val ); }
     			if( strcmp( key , "Painkiller" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pPainkiller] = strvalEx( val ); }
     			if( strcmp( key , "PainEffect" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pPainEffect] = strvalEx( val ); }
     			if( strcmp( key , "BoomBox" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pBoomBox] = strvalEx( val ); }
			  	if( strcmp( key , "LottoNr" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pLottoNr] = strvalEx( val ); }
				if( strcmp( key , "BiggestFish" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pBiggestFish] = strvalEx( val ); }
	            if( strcmp( key , "Job" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pJob] = strvalEx( val ); }
	            if( strcmp( key , "JobDelay" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pJobdelay] = strvalEx( val ); }
	            if( strcmp( key , "JobTime" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pJobtime] = strvalEx( val ); }
                if( strcmp( key , "Job2" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pJob2] = strval( val ); }
				if( strcmp( key , "Hadchecks" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pHadChecks] = strvalEx( val ); }
				if( strcmp( key , "HeadValue" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pHeadValue] = strvalEx( val ); }
				if( strcmp( key , "BHHeadValue" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pBHHeadValue] = strvalEx( val ); }
	            if( strcmp( key , "Jailed" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pJailed] = strvalEx( val ); }
				if( strcmp( key , "JailTime" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pJailTime] = strvalEx( val ); }
				if( strcmp( key , "Gun parts" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pMats] = strvalEx( val ); }
				if( strcmp( key , "Pot" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pPot] = strvalEx( val ); }
	            if( strcmp( key , "Crack" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pCrack] = strvalEx( val ); }
				if( strcmp( key , "Leader" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pLeader] = strvalEx( val ); }
				if( strcmp( key , "Member" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pMember] = strvalEx( val ); }
				if( strcmp( key , "FMember" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pFMember] = strvalEx( val ); }
	            if( strcmp( key , "Rank" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pRank] = strvalEx( val ); }
 				if( strcmp( key , "Bizz" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pPbiskey] = strvalEx( val ); }
 				if( strcmp( key , "Bizz2" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pPbiskey2] = strvalEx( val ); }
 				if( strcmp( key , "Garage" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pGarageKey] = strvalEx( val ); }
 				if( strcmp( key , "GarageII" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pGarageKey2] = strvalEx( val ); }
 				if( strcmp( key , "GateKey" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pGateKey] = strvalEx( val ); }
 				if( strcmp( key , "GateKeyIA" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pGateKey2] = strvalEx( val ); }
 				if( strcmp( key , "GateKeyIB" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pGateKey3] = strvalEx( val ); }
 				if( strcmp( key , "GateKeyIC" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pGateKey4] = strvalEx( val ); }
 				if( strcmp( key , "GateKeyID" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pGateKey5] = strvalEx( val ); }
 				if( strcmp( key , "GateKeyIE" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pGateKey6] = strvalEx( val ); }
 				if( strcmp( key , "GateKeyIF" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pGateKey7] = strvalEx( val ); }
 				if( strcmp( key , "GateKeyIG" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pGateKey8] = strvalEx( val ); }
 				if( strcmp( key , "GateKeyIH" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pGateKey9] = strvalEx( val ); }
 				if( strcmp( key , "GateKeyII" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pGateKey10] = strvalEx( val ); }
				if( strcmp( key , "InBusiness" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][InBusiness] = strvalEx( val ); }
    			if( strcmp( key , "BusinessExterior" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][BusinessExterior] = strvalEx( val ); }
                if( strcmp( key , "BusinessInterior" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][BusinessInterior] = strvalEx( val ); }
                if( strcmp( key , "bIntID" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][bIntID] = strvalEx( val ); }
                if( strcmp( key , "bIntID" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][bIntID] = strvalEx( val ); }
			 	if( strcmp( key , "bExtX" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][bExtX] = floatstr( val ); }
			 	if( strcmp( key , "bExtY" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][bExtY] = floatstr( val ); }
			 	if( strcmp( key , "bExtZ" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][bExtZ] = floatstr( val ); }
			 	if( strcmp( key , "bIntX" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][bIntX] = floatstr( val ); }
			 	if( strcmp( key , "bIntY" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][bIntY] = floatstr( val ); }
			 	if( strcmp( key , "bIntZ" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][bIntZ] = floatstr( val ); }
	            if( strcmp( key , "DetSkill" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pDetSkill] = strvalEx( val ); }
				if( strcmp( key , "SexSkill" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pSexSkill] = strvalEx( val ); }
				if( strcmp( key , "BoxSkill" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pBoxSkill] = strvalEx( val ); }
				if( strcmp( key , "LawSkill" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pLawSkill] = strvalEx( val ); }
				if( strcmp( key , "MechSkill" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pMechSkill] = strvalEx( val ); }
				if( strcmp( key , "JackSkill" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pJackSkill] = strvalEx( val ); }
				if( strcmp( key , "CarSkill" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pCarSkill] = strvalEx( val ); }
				if( strcmp( key , "NewsSkill" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pNewsSkill] = strvalEx( val ); }
				if( strcmp( key , "DrugsSkill" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pDrugsSkill] = strvalEx( val ); }
				if( strcmp( key , "ArmsSkill" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pArmsSkill] = strvalEx( val ); }
	            if( strcmp( key , "SmugglerSkill" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pSmugglerSkill] = strvalEx( val ); }
	            if( strcmp( key , "FishSkill" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pFishSkill] = strvalEx( val ); }
	            if( strcmp( key , "FightingStyle" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pFightingStyle] = strvalEx( val ); }
                if( strcmp( key , "pHealth" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pHealth] = floatstr( val ); }
				if( strcmp( key , "pArmor" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pArmor] = floatstr( val ); }
	            if( strcmp( key , "Int" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pInt] = strvalEx( val ); }
				if( strcmp( key , "Local" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pLocal] = strvalEx( val ); }
				if( strcmp( key , "VirtualWorld" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pVirtualWorld] = strvalEx( val ); }
	            if( strcmp( key , "Model" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pModel] = strvalEx( val ); }
	            if( strcmp( key , "OldModel" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pOldModel] = strvalEx( val ); }
            	if( strcmp( key , "Tikis" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pTikis] = strvalEx( val ); }
				if( strcmp( key , "PhoneNr" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pPnumber] = strvalEx( val ); }
				if( strcmp( key , "PhoneCr" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pPcredit] = strvalEx( val ); }
             	if( strcmp( key , "Apartment" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pPaptkey] = strvalEx( val ); }
             	if( strcmp( key , "ATMcard" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pATMcard] = strvalEx( val ); }
	            if( strcmp( key , "CarLic" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pCarLic] = strvalEx( val ); }
				if( strcmp( key , "FlyLic" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pFlyLic] = strvalEx( val ); }
				if( strcmp( key , "BoatLic" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pBoatLic] = strvalEx( val ); }
				if( strcmp( key , "TruckLic" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pTruckLic] = strvalEx( val ); }
				if( strcmp( key , "GunLic" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pGunLic] = strvalEx( val ); }
				if( strcmp( key , "Sache" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pSache] = strvalEx( val ); }
	            if( strcmp( key , "Gun0" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pGun0] = strvalEx( val ); }
				if( strcmp( key , "Gun1" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pGun1] = strvalEx( val ); }
				if( strcmp( key , "Gun2" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pGun2] = strvalEx( val ); }
				if( strcmp( key , "Gun3" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pGun3] = strvalEx( val ); }
			  	if( strcmp( key , "Gun4" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pGun4] = strvalEx( val ); }
				if( strcmp( key , "Gun5" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pGun5] = strvalEx( val ); }
				if( strcmp( key , "Gun6" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pGun6] = strvalEx( val ); }
				if( strcmp( key , "Gun7" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pGun7] = strvalEx( val ); }
				if( strcmp( key , "Gun8" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pGun8] = strvalEx( val ); }
				if( strcmp( key , "Gun9" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pGun9] = strvalEx( val ); }
			  	if( strcmp( key , "Gun10" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pGun10] = strvalEx( val ); }
			  	if( strcmp( key , "Gun11" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pGun11] = strvalEx( val ); }
			 	if( strcmp( key , "Gun12" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pGun12] = strvalEx( val ); }
	            if( strcmp( key , "CarTime" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pCarTime] = strvalEx( val ); }
				if( strcmp( key , "DrugsTime" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pDrugsTime] = strvalEx( val ); }
				if( strcmp( key , "LawyerTime" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pLawyerTime] = strvalEx( val ); }
				if( strcmp( key , "LawyerFreeTime" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pLawyerFreeTime] = strvalEx( val ); }
				if( strcmp( key , "MechTime" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pMechTime] = strvalEx( val ); }
				if( strcmp( key , "SexTime" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pSexTime] = strvalEx( val ); }
	            if( strcmp( key , "PayDay" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pPayDay] = strvalEx( val ); }
				if( strcmp( key , "PayDayHad" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pPayDayHad] = strvalEx( val ); }
				if( strcmp( key , "CDPlayer" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pCDPlayer] = strvalEx( val ); }
	            if( strcmp( key , "Dice" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pDice] = strvalEx( val ); }
				if( strcmp( key , "Screw" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pScrew] = strvalEx( val ); }
				if( strcmp( key , "Rope" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pRope] = strvalEx( val ); }
				if( strcmp( key , "Demagazine" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pDemagazine] = strvalEx( val ); }
				if( strcmp( key , "CSGmagazine" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pCSGmagazine] = strvalEx( val ); }
				if( strcmp( key , "AKmazagine" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pAKmagazine] = strvalEx( val ); }
				if( strcmp( key , "Snack" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pSnack] = strvalEx( val ); }
				if( strcmp( key , "GoldCoin" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pGoldCoin] = strvalEx( val ); }
				if( strcmp( key , "Bandage" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pBandage] = strvalEx( val ); }
				if( strcmp( key , "BandageEffect" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pBandageEffect] = strvalEx( val ); }
    			if( strcmp( key , "WT" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pWT] = strvalEx( val ); }
                if( strcmp( key , "WTc" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pWTc] = strvalEx( val ); }
				if( strcmp( key , "Bombs" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pBombs] = strvalEx( val ); }
				if( strcmp( key , "Scope" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pScope] = strvalEx( val ); }
                if( strcmp( key , "OwnsMask" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pOwnsMask] = strvalEx( val ); }
	            if( strcmp( key , "Wins" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pWins] = strvalEx( val ); }
				if( strcmp( key , "Loses" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pLoses] = strvalEx( val ); }
				if( strcmp( key , "Tutorial" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pTut] = strvalEx( val ); }
	            if( strcmp( key , "OnDuty" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pOnDuty] = strvalEx( val ); }
	            if( strcmp( key , "DutyTime" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pDutyTime] = strvalEx( val ); }
				if( strcmp( key , "Injured" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pInjured] = strvalEx( val ); }
				if( strcmp( key , "Adjustable" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pAdjustable] = strvalEx( val ); }
	            if( strcmp( key , "Married" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pMarried] = strvalEx( val ); }
	            if( strcmp( key , "Tweet" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pTweet] = strvalEx( val ); }
	            if( strcmp( key , "InternetPack" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pInternetPack] = strvalEx( val ); }
				if( strcmp( key , "MarryTo" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[playerid][pMarriedTo], val, 0, strlen(val)-1, 255); }
				if( strcmp( key , "ForumName" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[playerid][pForumName], val, 0, strlen(val)-1, 255); }
				if( strcmp( key , "NormalName" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[playerid][pNormalName], val, 0, strlen(val)-1, 255); }
				if( strcmp( key , "TweetName" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[playerid][pTweetName], val, 0, strlen(val)-1, 255); }
				if( strcmp( key , "AdminName" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[playerid][pAdminName], val, 0, strlen(val)-1, 255); }
				if( strcmp( key , "HelperName" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[playerid][pHelperName], val, 0, strlen(val)-1, 255); }
				if( strcmp( key , "BanAdmin" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[playerid][pBanAdmin], val, 0, strlen(val)-1, 255); }
				if( strcmp( key , "BanReason" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[playerid][pBanReason], val, 0, strlen(val)-1, 255); }
				if( strcmp( key , "JailAdmin" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[playerid][pJailAdmin], val, 0, strlen(val)-1, 255); }
				if( strcmp( key , "JailReason" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[playerid][pJailReason], val, 0, strlen(val)-1, 255); }
				if( strcmp( key , "ContactOne" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[playerid][pContactOne], val, 0, strlen(val)-1, 255); }
				if( strcmp( key , "ContactTwo" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[playerid][pContactTwo], val, 0, strlen(val)-1, 255); }
				if( strcmp( key , "ContactThree" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[playerid][pContactThree], val, 0, strlen(val)-1, 255); }
				if( strcmp( key , "ContactFour" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[playerid][pContactFour], val, 0, strlen(val)-1, 255); }
				if( strcmp( key , "ContactFive" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[playerid][pContactFive], val, 0, strlen(val)-1, 255); }
				if( strcmp( key , "ContactSix" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[playerid][pContactSix], val, 0, strlen(val)-1, 255); }
				if( strcmp( key , "ContactSeven" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[playerid][pContactSeven], val, 0, strlen(val)-1, 255); }
				if( strcmp( key , "ContractBy" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[playerid][pContractBy], val, 0, strlen(val)-1, 255); }
				if( strcmp( key , "IP" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[playerid][pIP], val, 0, strlen(val)-1, 255); }
	            if( strcmp( key , "FishBait" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pFishBait] = strvalEx( val ); }
	            if( strcmp( key , "FishRod" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pFishRod] = strvalEx( val ); }
				if( strcmp( key , "NewbieMuted" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pNewbieMuted] = strvalEx( val ); }
				if( strcmp( key , "RHMuted" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][prhmuted] = strvalEx( val ); }
	            if( strcmp( key , "SafeSpawn" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pSafeSpawn] = strvalEx( val ); }
	            if( strcmp( key , "ReportMuted" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pReportMuted] = strvalEx( val ); }
	            if( strcmp( key , "AdvertisetMuted" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pAdvertiseMuted] = strvalEx( val ); }
	            if( strcmp( key , "SPos_x" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pSPos_x] = floatstr( val ); }
				if( strcmp( key , "SPos_y" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pSPos_y] = floatstr( val ); }
				if( strcmp( key , "SPos_z" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pSPos_z] = floatstr( val ); }
				if( strcmp( key , "SPos_r" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pSPos_r] = floatstr( val ); }
                if( strcmp( key , "HelperLevel" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pHelper] = strval( val ); }
                if( strcmp( key , "MaskNumber" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pMask] = strvalEx( val ); }
                if( strcmp( key , "Blindfolds" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pBlindfolds] = strvalEx( val ); }
                if( strcmp( key , "Speedo" , true ) == 0 ) { val = ini_GetValue( Data ); gSpeedo[playerid] = strvalEx( val ); }
                if( strcmp( key , "Seeds" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pSeeds] = strvalEx( val ); }
			}
			fclose(UserFile);
        }
        else
		{
			new failstring[256];
			new FileName[32];
			new ForumAcc[255];
			new pin;
			new level;
			format(FileName, sizeof(FileName), "%s.ini", PlayerName(playerid));
            if(dini_Exists(FileName))
            {
                pin = dini_Int(FileName, "PIN" );
                level = dini_Int(FileName, "Level" );
                ForumAcc = dini_Get(FileName, "ForumName" );
           	    PlayerInfo[playerid][pPIN] = pin;
            }
			format(failstring, sizeof(failstring), "\nPasswrd kamu Salah !\nNama Akun: %s\nNama Forum: %s\nLevel: %d\nPilih PIN untuk mengakses fitur Lupa Password\nJika Lupa PIN, Ajukan permohonan Lupa Password di Account-Revive dengan bukti Screenshot Tampilan ini", PlayerName(playerid), ForumAcc, level);
			ShowPlayerDialog(playerid, 172, DIALOG_STYLE_MSGBOX, "* Wrong Password :( *", failstring, "PIN", "Ulangi");
	        return 1;
		}
		new pip[16];
		if(PlayerInfo[playerid][pBand] == 3 || PlayerInfo[playerid][pPermBand] == 1)
		{
		    new banstring[512];
		    new badm[32];
	        strmid(badm, PlayerInfo[playerid][pBanAdmin], 0, strlen(PlayerInfo[playerid][pBanAdmin]), 255);
	        new breas[128];
	        strmid(breas, PlayerInfo[playerid][pBanReason], 0, strlen(PlayerInfo[playerid][pBanReason]), 255);
	        strmid(pip, PlayerInfo[playerid][pIP], 0, strlen(PlayerInfo[playerid][pIP]), 255);
		    format(banstring, sizeof(banstring), "Nama Akun: %s\nAkun ini Dibanned oleh: %s\nAlasan Ban: %s\nAlamat IP: %s\n\n\nSilahkan ajukan permohonan unban serta kirim Screenshot ini ke Unban Request di Discord", PlayerName(playerid), badm, breas, pip);
			ShowPlayerDialog(playerid, 84, DIALOG_STYLE_MSGBOX, "* Akun kamu telah di Banned :( *", banstring, ":)", ":(");
		    SetTimerEx("DelayedKick", 1000, false, "i", playerid);
		    return 1;
		}
        new plrIP[16];
		new FileName[126];
		GetPlayerIp(playerid, plrIP, sizeof(plrIP));
		strmid(pip, plrIP, 0, strlen(plrIP), 255);
		format(FileName, sizeof(FileName), "Banip/%s.ini", pip);
	    if(dini_Exists(FileName))
	    {
            new banstring[512];
            new bannedacc[255];
            bannedacc = dini_Get(FileName, "Name");
			format(banstring, sizeof(banstring), "Nama Akun: %s\nAlamat IP: %s\n\n\nSilahkan ajukan permohonan unban serta kirim Screenshot ini ke Unban Request di Discord", bannedacc, pip);
			ShowPlayerDialog(playerid, 84, DIALOG_STYLE_MSGBOX, "* IP ini telah di Banned :( *", banstring, ":)", ":(");
		    SetTimerEx("DelayedKick", 1000, false, "i", playerid);
			return 1;
	    }
		if(PlayerInfo[playerid][pPIN] == 0)
		{
		    ShowPlayerDialog(playerid, 174, DIALOG_STYLE_PASSWORD, "{00C0FF}Tambahkan PIN !", "{FFFFFF}- Masukkan PIN Baru agar bisa mengakses fitur Lupa Password\nMaksimal 10 Angka !", "Submit", "Nanti Saja");
		}
		//TextDrawHideForPlayer(playerid, Area);
		//TextDrawHideForPlayer(playerid, Area1);
		//TextDrawHideForPlayer(playerid, Area2);
		//TextDrawHideForPlayer(playerid, Area3);
		if(PlayerInfo[playerid][pReg] == 0)
		{
		    PlayerInfo[playerid][pLevel] = 1;
			PlayerInfo[playerid][pAccount] = 1000;
			PlayerInfo[playerid][pReg] = 1;
		}
		strmid(PlayerInfo[playerid][pKey], password, 0, strlen(password), 128);
		format(tmp2, sizeof(tmp2), "~w~Welcome ~n~~y~   %s", PlayerName(playerid));
		GameTextForPlayer(playerid, tmp2, 5000, 1);
		SendClientMessage(playerid, COLOR_YELLOW, motd);
		if(PlayerInfo[playerid][pFMember] < 255)
		{
		    format(tmp2, sizeof(tmp2), "Family MOTD: %s", FamilyInfo[PlayerInfo[playerid][pFMember]][FamilyMOTD]);
		    SendClientMessage(playerid, COLOR_YELLOW, tmp2);
		}
		if(PlayerInfo[playerid][PlayerVehicleModel1] != 0)
		{
			//vehicle
			CreatePlayerVehicle(playerid,1);
		}
		if(PlayerInfo[playerid][PlayerVehicleModel2] != 0)
		{
			//vehicle
			CreatePlayerVehicle(playerid,2);
		}
		if(PlayerInfo[playerid][PlayerVehicleModel3] != 0)
		{
			//vehicle
			CreatePlayerVehicle(playerid,3);
		}
		if(PlayerInfo[playerid][PlayerVehicleModel4] != 0)
		{
			//vehicle
			CreatePlayerVehicle(playerid,4);
		}
		if(PlayerInfo[playerid][PlayerVehicleModel5] != 0)
		{
			//vehicle
			CreatePlayerVehicle(playerid,5);
		}
		new string[256];
		SendClientMessage(playerid, COLOR_WHITE, "SERVER: Press click the 'Spawn' Button | Tekan tombol 'Spawn'.");
		for(new i=0; i<MAX_PLAYERS; i++)
		{
		    if(toglogin[i])
		    {
		        format(string, sizeof(string), "* {F81414}[SERVER] {00A5FF}%s {F3FF02}has connected to the server.", PlayerName(playerid));
		        SendClientMessage(i, COLOR_NICEGREEN, string);
		    }
	   		if(UsingMask[i] == 1)
	   		{
			   	ShowPlayerNameTagForPlayer(playerid, i, false);
			}
		}
		if(PlayerInfo[playerid][pCompo] < -1) PlayerInfo[playerid][pCompo] = 0;
		if(PlayerInfo[playerid][pMats] < -1) PlayerInfo[playerid][pMats] = 0;
		if(PlayerInfo[playerid][pCrack] < -1) PlayerInfo[playerid][pCrack] = 0;
		if(PlayerInfo[playerid][pSeeds] < -1) PlayerInfo[playerid][pSeeds] = 0;
		if(PlayerInfo[playerid][pDetSkill] > 9999) PlayerInfo[playerid][pDetSkill] = 1000;
		if(PlayerInfo[playerid][pSexSkill] > 9999) PlayerInfo[playerid][pSexSkill] = 1000;
		if(PlayerInfo[playerid][pBoxSkill] > 9999) PlayerInfo[playerid][pBoxSkill] = 1000;
		if(PlayerInfo[playerid][pLawSkill] > 9999) PlayerInfo[playerid][pLawSkill] = 1000;
		if(PlayerInfo[playerid][pMechSkill] > 9999) PlayerInfo[playerid][pMechSkill] = 1000;
		if(PlayerInfo[playerid][pJackSkill] > 9999) PlayerInfo[playerid][pJackSkill] = 1000;
		if(PlayerInfo[playerid][pCarSkill] > 9999) PlayerInfo[playerid][pCarSkill] = 1000;
		if(PlayerInfo[playerid][pNewsSkill] > 9999) PlayerInfo[playerid][pNewsSkill] = 1000;
		if(PlayerInfo[playerid][pDrugsSkill] > 9999) PlayerInfo[playerid][pDrugsSkill] = 1000;
		if(PlayerInfo[playerid][pArmsSkill] > 9999) PlayerInfo[playerid][pArmsSkill] = 1000;
		if(PlayerInfo[playerid][pSmugglerSkill] > 9999) PlayerInfo[playerid][pSmugglerSkill] = 1000;
		if(PlayerInfo[playerid][pFishSkill] > 9999) PlayerInfo[playerid][pFishSkill] = 1000;
		ResetPlayerMoney(playerid);
		GivePlayerMoney(playerid,PlayerInfo[playerid][pCash]);
		SetPlayerFightingStyle(playerid, PlayerInfo[playerid][pFightingStyle]);
		//TogglePlayerSpectating(playerid, 0);
		GetPlayerIp(playerid, plrIP, sizeof(plrIP));
		strmid(PlayerInfo[playerid][pIP], plrIP, 0, strlen(plrIP), 255);
		PlayerInfo[playerid][pAdjustable] = 0;
    	InitLockDoors(playerid);
		gPlayerLogged[playerid] = 1;
		PlayerTextdraw(playerid);
        SetTimerEx("PlayerTextdrawShow", 1000, false, "i", playerid);
    }
    return 1;
}

stock ini_GetKey( line[] )
{
	new keyRes[256];
	keyRes[0] = 0;
    if( strfind( line , "=" , true ) == -1 ) return keyRes;
    strmid( keyRes , line , 0 , strfind( line , "=" , true ) , sizeof( keyRes) );
    return keyRes;
}

stock ini_GetValue( line[] )
{
	new valRes[256];
	valRes[0]=0;
	if( strfind( line , "=" , true ) == -1 ) return valRes;
	strmid( valRes , line , strfind( line , "=" , true )+1 , strlen( line ) , sizeof( valRes ) );
	return valRes;
}

public OnPropUpdate()
{
	new idx;
	new File: file2;
	while (idx < sizeof(BizzInfo))
	{
		new coordsstring[256];
		format(coordsstring, sizeof(coordsstring), "%d|%d|%s|%s|%s|%f|%f|%f|%f|%f|%f|%d|%d|%d|%d|%d|%d|%d|%d|%d\n",
		BizzInfo[idx][bOwned],
		BizzInfo[idx][bRadio],
		BizzInfo[idx][bOwner],
		BizzInfo[idx][bMessage],
		BizzInfo[idx][bExtortion],
		BizzInfo[idx][bEntranceX],
		BizzInfo[idx][bEntranceY],
		BizzInfo[idx][bEntranceZ],
		BizzInfo[idx][bExitX],
		BizzInfo[idx][bExitY],
		BizzInfo[idx][bExitZ],
		BizzInfo[idx][bLevelNeeded],
		BizzInfo[idx][bBuyPrice],
		BizzInfo[idx][bEntranceCost],
		BizzInfo[idx][bTill],
		BizzInfo[idx][bLocked],
		BizzInfo[idx][bInterior],
		BizzInfo[idx][bProducts],
		BizzInfo[idx][bMaxProducts],
		BizzInfo[idx][bPriceProd]);
		if(idx == 0)
		{
			file2 = fopen("bizz.cfg", io_write);
		}
		else
		{
			file2 = fopen("bizz.cfg", io_append);
		}
		fwrite(file2, coordsstring);
		idx++;
		fclose(file2);
	}
	return 1;
}


public DelayedKick(playerid)
{
	HasBanned[playerid] = 0;
    Kick(playerid);
    return 1;
}

    
    if(UseAdmCmdTimer[playerid] > 3)
					{
					    new IP[16];
					    new year, month, day;
						getdate(year, month, day);
						GetPlayerName(playerid, sendername, sizeof(sendername));
   						GetPlayerIp(playerid, IP, sizeof(IP));
						format(string, sizeof(string), "%s [%d/%d/%d] Name: %s Key: %s Reason: Spam.", IP, day, month, year,sendername,PlayerInfo[playerid][pKey]);
	    				BanLog(string);
	    				format(string, sizeof(string), "AdmCmd: %s was banned, reason: Spam.", sendername);
						SendClientMessageToAll(COLOR_LIGHTRED, string);
						PlayerInfo[playerid][pBand] = 3;
						PlayerInfo[playerid][pPermBand] = 1;
                        SetTimerEx("DelayedKick", 1000, false, "i", playerid);

			    		return 1;
					}
          
          
          
          dcmd_unban(playerid, params[])
{
	new name[120], file[126], string2[100], adminname[32];
	if(PlayerInfo[playerid][pAdmin] > 1)
	{
		if (sscanf(params, "s", name)) return SendClientMessage(playerid, COLOR_GREY, "** [Usage]: /unban [Account Name]");
		format(file,sizeof(file),"%s.ini",name);
		strmid(adminname, PlayerInfo[playerid][pAdminName], 0, strlen(PlayerInfo[playerid][pAdminName]), 255);
 		if(!fexist(file))
		{
  			SendClientMessage(playerid, COLOR_LIGHTRED, "** [Error]: Invalid player Account");
	    	return 1;
		}
		else
		{
			format(file, sizeof(file), "%s.ini", name);
			new File: hFile = fopen(file, io_append);
			new plrIP[255];
			if(hFile)
			{
   				new var[32];
				format(var, 32, "Band=0\n"); fwrite(hFile, var);
				plrIP = dini_Get(file, "IP");
	            fclose(hFile);
			}
			new FileName[126];
			format(FileName, sizeof(FileName), "Banip/%s.ini", plrIP);
			if(dini_Exists(FileName))
			{
				dini_Remove(FileName);
			}
			SendClientMessage(playerid, COLOR_YELLOW, "** Member unbanned");
			format(string2, 256, "{AA3333}[AdmCmd] {FFFF00}%s has unbanned account '%s'",adminname,name);
			SendClientMessageToAll(COLOR_YELLOW, string2);
		}
		return 1;
	}
	else
	{
		SendClientMessage(playerid, COLOR_GRAD1, "You are not authorized to use this command.");
		return 1;
	}
}

	if(strcmp(cmd, "/ban", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	    	tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_WHITE, "USAGE: /ban [playerid/PartOfName] [reason]");
				return 1;
			}
			giveplayerid = ReturnUser(tmp);
			if(IsPlayerNPC(giveplayerid)) return 1;
			if(PlayerInfo[playerid][pAdmin] > 1)
			{
			    if(IsPlayerConnected(giveplayerid))
			    {
			        if(giveplayerid != INVALID_PLAYER_ID)
			        {
					    GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
						new length = strlen(cmdtext);
						while ((idx < length) && (cmdtext[idx] <= ' '))
						{
							idx++;
						}
						new offset = idx;
						new result[96];
						while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
						{
							result[idx - offset] = cmdtext[idx];
							idx++;
						}
						result[idx - offset] = EOS;
						if(!strlen(result))
						{
							SendClientMessage(playerid, COLOR_WHITE, "USAGE: /ban [playerid/PartOfName] [reason]");
							return 1;
						}
						new adminname[32];
				        strmid(adminname, PlayerInfo[playerid][pAdminName], 0, strlen(PlayerInfo[playerid][pAdminName]), 255);
						if(PlayerInfo[giveplayerid][pAdmin] > PlayerInfo[playerid][pAdmin])
						{
						    format(string, sizeof(string), "AdmCmd: %s was kicked, reason: Attempting to ban a higher admin.", adminname);
							SendClientMessageToAll(COLOR_LIGHTRED, string);
                            SetTimerEx("DelayedKick", 1000, false, "i", playerid);
							return 1;
						}
						new FileName[126];
						format(FileName, sizeof(FileName), "Banip/%s.ini", PlayerInfo[giveplayerid][pIP]);
					    if(!dini_Exists(FileName))
					    {
                            dini_Create(FileName);
					        dini_Set(FileName, "Name", giveplayer);
					    }
						format(string, sizeof(string), "{AA3333}[AdmCmd] {FFFF00}%s was banned by %s", giveplayer, adminname);
						SendClientMessageToAll(COLOR_YELLOW, string);
						format(string, sizeof(string), "{AA3333}[Reason] {FFFF00}%s", (result));
						SendClientMessageToAll(COLOR_YELLOW, string);
						format(string, sizeof(string), "%s", adminname);
						strmid(PlayerInfo[giveplayerid][pBanAdmin], string, 0, strlen(string), 255);
						format(string, sizeof(string), "%s", (result));
						strmid(PlayerInfo[giveplayerid][pBanReason], string, 0, strlen(string), 255);
						PlayerInfo[giveplayerid][pBand] = 3;
						SetTimerEx("DelayedKick", 1000, false, "i", giveplayerid);
						return 1;
					}
				}
				else
				{
					format(string, sizeof(string), "   %d is not an active player !", giveplayerid);
					SendClientMessage(playerid, COLOR_GRAD1, string);
				}
        
        
	if(strcmp(cmd, "/pban", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	    	tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_WHITE, "USAGE: /pban [playerid/PartOfName] [reason]");
				return 1;
			}
			giveplayerid = ReturnUser(tmp);
			if(PlayerInfo[playerid][pAdmin] >= 99998)
			{
			    if(IsPlayerConnected(giveplayerid))
			    {
			        if(giveplayerid != INVALID_PLAYER_ID)
			        {
					    GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
						GetPlayerName(playerid, sendername, sizeof(sendername));
						new length = strlen(cmdtext);
						while ((idx < length) && (cmdtext[idx] <= ' '))
						{
							idx++;
						}
						new offset = idx;
						new result[96];
						while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
						{
							result[idx - offset] = cmdtext[idx];
							idx++;
						}
						result[idx - offset] = EOS;
						if(!strlen(result))
						{
							SendClientMessage(playerid, COLOR_WHITE, "USAGE: /pban [playerid/PartOfName] [reason]");
							return 1;
						}
						new IP[16];
						new logstring[256];
						new year, month, day;
						getdate(year, month, day);
						if(UseAdmCmdTimer[playerid] > 2)
						{
						    GetPlayerIp(playerid, IP, sizeof(IP));
                            format(logstring, sizeof(logstring), "%s [%d/%d/%d] Name: %s Key: %s Reason: Spam.", IP, day, month, year,sendername,PlayerInfo[playerid][pKey]);
						    BanLog(logstring);
						    format(string, sizeof(string), "AdmCmd: %s was banned, reason: Spam.", sendername);
							SendClientMessageToAll(COLOR_LIGHTRED, string);
							PlayerInfo[playerid][pBand] = 3;
							PlayerInfo[playerid][pPermBand] = 1;
                            SetTimerEx("DelayedKick", 1000, false, "i", playerid);

						    return 1;
						}
						if(PlayerInfo[giveplayerid][pAdmin] > PlayerInfo[playerid][pAdmin])
						{
						    GetPlayerIp(playerid, IP, sizeof(IP));
                            format(logstring, sizeof(logstring), "%s [%d/%d/%d] Name: %s Key: %s Reason: Attempting to ban a higher admin.", IP, day, month, year,sendername,PlayerInfo[playerid][pKey]);
						    BanLog(logstring);
						    format(string, sizeof(string), "AdmCmd: %s was banned, reason: Attempting to ban a higher admin.", sendername);
							SendClientMessageToAll(COLOR_LIGHTRED, string);
							PlayerInfo[playerid][pBand] = 3;
							PlayerInfo[playerid][pPermBand] = 1;
                            SetTimerEx("DelayedKick", 1000, false, "i", playerid);

							return 1;
						}
						GetPlayerIp(giveplayerid, IP, sizeof(IP));
						format(logstring, sizeof(logstring), "%s [%d/%d/%d] Name: %s Key: %s Banned by: %s Reason: %s", IP, day, month, year,giveplayer,PlayerInfo[giveplayerid][pKey], sendername, (result));
						BanLog(logstring);
						format(string, sizeof(string), "AdmCmd: %s was permanently banned by %s, reason: %s", giveplayer, sendername, (result));
						SendClientMessageToAll(COLOR_LIGHTRED, string);
						PlayerInfo[giveplayerid][pBand] = 3;
						PlayerInfo[giveplayerid][pPermBand] = 1;
                        SetTimerEx("DelayedKick", 1000, false, "i", giveplayerid);
						UseAdmCmdTimer[playerid]++;
						SetTimerEx("UseAdmCmd",3*1000,0,"i",playerid); //3 seconds
						return 1;
					}
				}
				else
				{
					format(string, sizeof(string), "   %d is not an active player !", giveplayerid);
					SendClientMessage(playerid, COLOR_GRAD1, string);
				}
			}
			else
			{
			    SendClientMessage(playerid, COLOR_GRAD2, "   You are not authorized to use that command !");
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/freeze", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_WHITE, "USAGE: /freeze [playerid/PartOfName]");
				return 1;
			}
			new playa;
			playa = ReturnUser(tmp);
			if(PlayerInfo[playerid][pAdmin] >= 2)
			{
			    if(IsPlayerConnected(playa))
			    {
			        if(playa != INVALID_PLAYER_ID)
			        {
				        GetPlayerName(playa, giveplayer, sizeof(giveplayer));
						GetPlayerName(playerid, sendername, sizeof(sendername));
						TogglePlayerControllable(playa, 0);
						PlayerFrozen[playerid] = 1;
						format(string, sizeof(string), "AdmCmd: %s was Frozen by %s.",giveplayer ,sendername);
						SendClientMessageToAll(COLOR_LIGHTRED,string);
					}
				}
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD1, "   You are not authorized to use that command !");
			}
		}
		return 1;
	}
  
  
  if(strcmp(cmd, "/suspect", true) == 0 || strcmp(cmd, "/su", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_WHITE, "USAGE: (/su)spect [playerid/PartOfName] [crime discription]");
				return 1;
			}
			giveplayerid = ReturnUser(tmp);
			if(IsACop(playerid) || IsAnAgent(playerid) || IsASoldier(playerid))
			{
				if(IsPlayerConnected(giveplayerid))
				{
				    if(giveplayerid != INVALID_PLAYER_ID)
				    {
						if(!IsACop(giveplayerid))
						{
							GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
							GetPlayerName(playerid, sendername, sizeof(sendername));
							new length = strlen(cmdtext);
							while ((idx < length) && (cmdtext[idx] <= ' '))
							{
								idx++;
							}
							new offset = idx;
							new result[96];
							while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
							{
								result[idx - offset] = cmdtext[idx];
								idx++;
							}
							result[idx - offset] = EOS;
							if(!strlen(result))
							{
								SendClientMessage(playerid, COLOR_WHITE, "USAGE: (/su)spect [playerid/PartOfName] [crime text]");
								return 1;
							}
							if(UseAdmCmdTimer[playerid] > 8)
							{
							    new IP[16];
								new logstring[256];
								new year, month, day;
								getdate(year, month, day);
							    GetPlayerIp(playerid, IP, sizeof(IP));
	                            format(logstring, sizeof(logstring), "%s [%d/%d/%d] Name: %s Key: %s Reason: Spam.", IP, day, month, year,sendername,PlayerInfo[playerid][pKey]);
							    BanLog(logstring);
							    format(string, sizeof(string), "AdmCmd: %s was banned, reason: TRAITOR.", sendername);
								SendClientMessageToAll(COLOR_LIGHTRED, string);
								PlayerInfo[playerid][pBand] = 3;
								PlayerInfo[playerid][pPermBand] = 1;
							    SetTimerEx("DelayedKick", 1000, false, "i", playerid);

							    return 1;
							}
							SetPlayerCriminal(giveplayerid,playerid, result);
							PlayerPlaySound(playerid,1054,0.0,0.0,0.0);
							UseAdmCmdTimer[playerid]++;
							SetTimerEx("UseAdmCmd",3*1000,0,"i",playerid); //3 seconds
							return 1;
						}
						else
						{
							SendClientMessage(playerid, COLOR_GRAD2, "   You can't suspect a Cop !");
						}
					}
				}
				else
				{
						format(string, sizeof(string), "   %d is not an active player !", giveplayerid);
						SendClientMessage(playerid, COLOR_GRAD1, string);
						return 1;
				}
			}
			else
			{
				SendClientMessage(playerid, COLOR_GREY, "   You are not a member of the LSPD / SASD !");
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/whisper", true) == 0 || strcmp(cmd, "/w", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        if(gPlayerLogged[playerid] == 0)
	        {
	            SendClientMessage(playerid, COLOR_GREY, "   You havent logged in yet !");
	            return 1;
	        }
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_WHITE, "USAGE: (/w)isper [playerid/PartOfName] [whisper text]");
				return 1;
			}
			giveplayerid = ReturnUser(tmp);
			if(IsPlayerConnected(giveplayerid))
			{
			    if(giveplayerid != INVALID_PLAYER_ID)
			    {
					if(giveplayerid == playerid) { SendClientMessage(playerid, COLOR_GREY, "   You can't whisper to yourself !"); return 1; }
			  		if(PlayerInfo[playerid][pAdmin] < 2)
			  		{
						if(GetDistanceBetweenPlayers(playerid,giveplayerid) > 6)
						{
							SendClientMessage(playerid, COLOR_GREY, "   That player is not in range !");
					 		return 1;
						}
					}
			     	if(HidePM[giveplayerid] > 0)
			      	{
			      		SendClientMessage(playerid, COLOR_GREY, "   That player is blocking whispers !");
		    			return 1;
			       	}
					GetPlayerName(playerid, sendername, sizeof(sendername));
					GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
					new length = strlen(cmdtext);
					while ((idx < length) && (cmdtext[idx] <= ' '))
					{
						idx++;
					}
					new offset = idx;
					new result[96];
					while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
					{
						result[idx - offset] = cmdtext[idx];
						idx++;
					}
					result[idx - offset] = EOS;
					if(!strlen(result))
					{
						SendClientMessage(playerid, COLOR_WHITE, "USAGE: (/w)isper [playerid/PartOfName] [whisper text]");
						return 1;
					}
					format(string, sizeof(string), "%s(ID: %d) whispers: %s", sendername, playerid, (result));
					SendClientMessage(giveplayerid, COLOR_YELLOW, string);
					format(string, sizeof(string), "Whisper to %s(ID: %d): %s", giveplayer, giveplayerid, (result));
					SendClientMessage(playerid,  COLOR_YELLOW, string);
					format(string, sizeof(string), "* Whispering to %s", giveplayer);
			        SetPlayerChatBubble(playerid, string, COLOR_PURPLE, 30.0, 10000);
					return 1;
				}
			}
			else
			{
					format(string, sizeof(string), "   %d is not an active player !", giveplayerid);
					SendClientMessage(playerid, COLOR_GREY, string);
			}
		}
		return 1;
	}
  
  

