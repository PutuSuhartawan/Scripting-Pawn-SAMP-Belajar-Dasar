
enum pInfo
{
	pTanamanAnggur,
	pTanamanBlueberry,
	pTanamanStrawberry,
	pTanamanGandum,
	pTanamanTomat,
	pBibitAnggur,
	pBibitBlueberry,
	pBibitStrawberry,
	pBibitGandum,
	pBibitTomat,
	pKartuPerdana,
	pGate,
	pPainkiller,
	pUsePainkiller,
	pSQLID,
	pAccent[80],
	pAdminOnDutyTime,
	pWS,
	pWSid,
	pFarm,
	pFarmid,
	pTruckerLic,
	pMissionsTime,
	pKTP,
	pKTime,
	pLumberLic,
	pPBiskey,
	pInBizz,
	pMask,
	pMaskID,
	pMaskUse,
	pPBiskey2,
	pPDTime,
	pHunger,
	pBladder,
	pEnergi,
	pCondition,
	pLumber,
    pCacing,
	pPancingan,
	pJerigen,
	pBensin,
	pAdminDuty,
	pKey[129],
	pSweeperT,
	pAdminban[MAX_PLAYER_NAME],
	pNormalName[MAX_PLAYER_NAME],
	pAdminName[MAX_PLAYER_NAME],
	pVIPName[MAX_PLAYER_NAME],
	pDate[7],
	pWSBos,
	pFarmBos,
	pDutyTime,
	pBanReason[128],
	pBanExpired[128],//waktu
	pBanExpired2[128],//tanggal
	pLevel,
	pAdmin,
	pDonateRank,
	pBandage,
	pConnectTime,
	pReg,
	pSex,
	pAge[128],
	pParacetamol,
	pCash,
	pHospital,
	pMuted,
	pPrisonReason[128],
	pJailedBy[MAX_PLAYER_NAME],
	pRMuted,
	pRMutedTotal,
	pRMutedTime,
	pGYMTime,
	pExp,
	pAccount,
	pCrimes,
	pPaintTeam,
	pKills,
	pDeaths,
	pArrested,
	pFitnessTimer,
	pFitnessType,
	pToggedVIPChat,
	pJob,
	pWSJob,
	pFarmJob,
	//kuli bangunan
	pUseSorry,
	pKuli,
	pAutoTextReply[64],
	pPhonePrivacy,
	pJob2,
	pIllegalJob,
	pSnack,
	pMineralWater,
	pADMute,
	pADMuteTotal,
	pHelpMute,
	pPayCheck,
	pJailed,
	pJailTime,
	pWRestricted,
	pMats,
	pPulsa2,
	pPackages,
	pLeader,
	pMember,
	pDivision,
	pFMember,
	pSpeakerPhone,
	pRank,
	pChar,
	pAmoxicilin,
	pMechSkill,
 	pWantedLevel,
	pSMats,
	pPot,
	pCrack,
	pMeth,
	pSDrugs,
	pBadgeNumber,
	pRoadblock,
	pUltrafluenza,
	pTruckingSkill,
	pArmsSkill,
	pSmugSkill,
	Float:pHealth,
	Float:pArmor,
	Float:pSArmor,
	Float:pSHealth,
	Float:pBodyCondition[6],
	pInt,
	pLocal,
	pTeam,
	pModel,
	pPnumber,
	pPhone,
	pFMax,
	pJTime,
	pLumberTime,
	pFTime,
	pHaulingTime,
	pBusTime,
	pBeratIkan,
 	pPhousekey,
	pPhousekey2,
	Float:pPos_x,
	Float:pPos_y,
	Float:pPos_z,
	Float:pPos_r,
	pCarLic,
	pCTime,
	pCarLicID,
	pFlyLic,
	pBoatLic,
	pGunLic,
	pHackWarnTime,
	pHackWarnings,
	pGuns[13],
	pGunsAmmo[13],
	pSilincedSkill,
	pDesertEagleSkill,
	pRifleSkill,
	pShotgunSkill,
	pSpassSkill,
	pMP5Skill,
	pAK47Skill,
	pM4Skill,
	pSniperSkill,
	pTrainingTime,
	pAGuns[13],
	pAGunsAmmo[13],
	pPayDay,
	pCDPlayer,
	pWins,
	pLoses,
	pTut,
	pTutorial,
	pWarns,
	pWarn1[64],
	pWarn2[64],
	pWarn3[64],
	pWarn4[64],
	pWarn5[64],
	pWarn6[64],
	pWarn7[64],
	pWarn8[64],
	pWarn9[64],
	pWarn10[64],
	pWarn11[64],
	pWarn12[64],
	pWarn13[64],
	pWarn14[64],
	pWarn15[64],
	pWarn16[64],
	pWarn17[64],
	pWarn18[64],
	pWarn19[64],
	pWarn20[64],
	pAdjustable,
	pMarried,
	pMarriedTo[128],
	pLock,
	pLockCar,
	pSprunk,
	pCigar,
	pPole,
	pSpraycan,
	pRope,
	pDice,
	pCangkul,
	pDuty,
	pFightStyle,
	pIP[32],
	pBanned,
	pPermaBanned,
	pDisabled,
	pCrates,
	pVW,
	pHouseInvite,
	pRenting,
	pTempVIP,
	pBuddyInvited,
	pVIPInviteDay,
	pVIPLeft,
	pTokens,
	pPaintTokens,
	pDrugsTime,
	pGangWarn,
	pFactionBanned,
	pCSFBanned,
	pMechTime,
	pGiftTime,
	pDutyTimeTotal,
	pTogReports,
	pRadio,
	pRadioFreq,
	pDutyHours,
	pAcceptedHelp,
	pAcceptReport,
	pTrashReport,
	pInsurance,
	pTriageTime,
	pVehicleKeys,
	pVehicleKeysFrom,
	pTicketTime,
	pScrewdriver,
	pTire,
	pFirstaid,
	pRccam,
	pReceiver,
	pGPS,
	pSweep,
	pSweepLeft,
	pBugged,
	pCheckCash,
	pChecks,
	pWarrant[128],
	pJudgeJailTime,
	pJudgeJailType,
	pBeingSentenced,
	pProbationTime,
	pCallsAccepted,
	pPatientsDelivered,
	pLiveBanned,
	pFreezeBank,
	pServiceTime,
 	BeingDraggedBy,
	pVIPJoinDate,
	pVIPExpDate[32],
	pVIPExpTime[32],
	pComponent,
	pBoomBox,
};
new PlayerInfo[MAX_PLAYERS+1][pInfo];


new InsideShamal[MAX_PLAYERS];
new InsideMainMenu[MAX_PLAYERS];
new InsideTut[MAX_PLAYERS];


SendClientMessageEx(playerid, color, String[])
{
	if(InsideMainMenu[playerid] == 1 || InsideTut[playerid] == 1)
		return 0;

	else SendClientMessage(playerid, color, String);
	return 1;
}

SendClientMessageToAllEx(color, String[])
{
	foreach(Player, i)
	{
		if(InsideMainMenu[i] == 1 || InsideTut[i] == 1) {}
		else SendClientMessage(i, color, String);
	}
	return 1;
}



forward Three();
public Three()
{
 	SendClientMessageToAllEx(COLOR_LIGHTBLUE, "3");
	return 1;
}

forward Two();
public Two()
{
	SendClientMessageToAllEx(COLOR_LIGHTBLUE, "2");
	return 1;
}

forward One();
public One()
{
	SendClientMessageToAllEx(COLOR_LIGHTBLUE, "1");
 	return 1;
}


CMD:countdown(playerid, params[])
{
 if(PlayerInfo[playerid][pAdmin] >= 2)
	{
		SetTimer("Three", 1000, 0);
		SetTimer("Two", 2000, 0);
		SetTimer("One", 3000, 0);
	}
	return 1;
}

