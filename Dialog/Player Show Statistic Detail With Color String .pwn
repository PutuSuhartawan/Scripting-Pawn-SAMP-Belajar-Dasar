
#define DIALOG_INVENTORY (3123)
#define BAN_DIALOG (3124)

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
	pAdminDiv,
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

ShowStats(playerid, targetid)
{
	if(IsPlayerConnected(targetid)) {
		new sext[16], employer[64], rank[64], division[64], jtext[20], jtext2[20], ijtext[20], pnumber[20], facfam[20];
		if(PlayerInfo[targetid][pPnumber] == 0) pnumber = "None"; else format(pnumber, sizeof(pnumber), "%d", PlayerInfo[targetid][pPnumber]);
		if(PlayerInfo[targetid][pSex] == 1) { sext = "Male"; } else { sext = "Female"; }
		facfam = "Faction";
		if(PlayerInfo[targetid][pFMember] < 255)
		{
		    facfam = "Family"; division = "None";
			format(employer, sizeof(employer), "%s", FamilyInfo[PlayerInfo[targetid][pFMember]][FamilyName]);
			switch(PlayerInfo[targetid][pRank])
			{
				case 1: format(rank, sizeof(rank), "%s", FamilyInfo[PlayerInfo[targetid][pFMember]][FamilyRank1]);
				case 2: format(rank, sizeof(rank), "%s", FamilyInfo[PlayerInfo[targetid][pFMember]][FamilyRank2]);
				case 3: format(rank, sizeof(rank), "%s", FamilyInfo[PlayerInfo[targetid][pFMember]][FamilyRank3]);
				case 4: format(rank, sizeof(rank), "%s", FamilyInfo[PlayerInfo[targetid][pFMember]][FamilyRank4]);
				case 5: format(rank, sizeof(rank), "%s", FamilyInfo[PlayerInfo[targetid][pFMember]][FamilyRank5]);
	  			case 6: format(rank, sizeof(rank), "%s", FamilyInfo[PlayerInfo[targetid][pFMember]][FamilyRank6]);
				default: format(rank, sizeof(rank), "%s", FamilyInfo[PlayerInfo[targetid][pFMember]][FamilyRank1]);
			}
		}
		else GetPlayerFactionInfo(targetid, rank, division, employer);
		switch(PlayerInfo[targetid][pJob])
		{
			case 7: jtext = "Mechanic";
			case 8: jtext = "Lumberjack";
			case 20: jtext = "Trucker";
			case 1401: jtext = "Farmer";
			default: jtext = "None";
		}
		switch(PlayerInfo[targetid][pJob2])
		{
			case 7: jtext2 = "Mechanic";
			case 8: jtext2 = "Lumberjack";
			case 20: jtext2 = "Trucker";
			case 1401: jtext2 = "Farmer";
			default: jtext2 = "None";
		}
		switch(PlayerInfo[targetid][pIllegalJob])
		{
			case 1: ijtext = "Arms Dealer";
			case 2: ijtext = "Drug Dealer";
			default: ijtext = "None";
		}
		new drank[32];
		switch(PlayerInfo[targetid][pDonateRank])
		{
			case 1: drank = "Basic Donator";
			case 2: drank = "Advanced Donator";
			case 3: drank = "Professional Donator";
			case 4: drank = "Lifetime Donator";
			default: drank = "{00FF00}None{FFFFFF}";
		}
		new married[20];
		strmid(married, PlayerInfo[targetid][pMarriedTo], 0, strlen(PlayerInfo[targetid][pMarriedTo]), 255);
		new ptime = PlayerInfo[targetid][pConnectTime];
		new housekey = PlayerInfo[targetid][pPhousekey];
		new bizkey = PlayerInfo[targetid][pPBiskey];
		new workshop = PlayerInfo[targetid][pWSid];
		new warns = PlayerInfo[targetid][pWarns];
		new farm = PlayerInfo[targetid][pFarmid];
		new dealership = -1;
		for(new d = 0 ; d < MAX_CARDEALERSHIPS; d++)
		{
            if(IsPlayerOwnerOfCDEx(targetid, d))
			{
				dealership = d;
                break;
	        }
	    }
		//new dealership = CarDealershipInfo[targetid][cdOwner];
		new coordsString[10000], S3MP4K[10000], idiot[1401];
		format(idiot, sizeof(idiot), "{FFFFFF}Statistic {00CCFF}%s", PlayerInfo[targetid][pNormalName]);
		//SendClientMessageEx(playerid,COLOR_WHITE,coordsString);
		format(coordsString, sizeof(coordsString), "{F7FF00}IC Information:\n");
		strcat(S3MP4K, coordsString);
		//SendClientMessageEx(playerid, 0xFFFF00FF,coordsString);
		format(coordsString, sizeof(coordsString), "{FFFFFF}Origin: [{C6E2FF}%s{FFFFFF}] Gender: [{C6E2FF}%s{FFFFFF}] Married with: [%s] Bank: [{00FF00}$%s{FFFFFF}] Phone number: [{C6E2FF}%s{FFFFFF}] Phone credit: [{C6E2FF}%d Point{FFFFFF}]\n",PlayerInfo[targetid][pAge], sext, married, FormatMoney(PlayerInfo[targetid][pAccount]), pnumber,PlayerInfo[targetid][pPulsa2]);
        strcat(S3MP4K, coordsString);
		//SendClientMessageEx(playerid, 0xFFFFFFAA,coordsString);
		format(coordsString, sizeof(coordsString), "Money: [{00FF00}$%s{FFFFFF}] Job: [{C6E2FF}%s{FFFFFF}, {C6E2FF}%s{FFFFFF}, {FF0000}%s{FFFFFF}] JobSalary: [{00FF00}$%s{FFFFFF}] %s: [%s] Rank : [%s]\n", FormatMoney(GetPlayerCash(targetid)), jtext, jtext2, ijtext, FormatMoney(PlayerInfo[targetid][pPayCheck]), facfam, employer, rank);
        strcat(S3MP4K, coordsString);
		//SendClientMessageEx(playerid, 0xFFFFFFAA,coordsString);
		format(coordsString, sizeof(coordsString), "{F7FF00}OOC Information:\n");
        strcat(S3MP4K, coordsString);
		//SendClientMessageEx(playerid, 0xFFFF00FF,coordsString);
		format(coordsString, sizeof(coordsString), "{FFFFFF}Player rank: [{C6E2FF}%s{FFFFFF}] Warns: [{FF0000}%d{FFFFFF}/20] Paycheck: [{C6E2FF}%d{FFFFFF}]\n",ORANK(targetid),warns,ptime);
        strcat(S3MP4K, coordsString);
		//SendClientMessageEx(playerid, 0xFFFFFFAA,coordsString);
		format(coordsString, sizeof(coordsString), "Donator rank: [{00FF00}%s{FFFFFF}] Expired: [{FF0000}%s{FFFFFF}] JailTime: [{FF0000}%d {FFFFFF}Minutes]\n", drank, PlayerInfo[targetid][pVIPExpDate],PlayerInfo[targetid][pJailTime]/60);
        strcat(S3MP4K, coordsString);
		//SendClientMessageEx(playerid, 0xFFFFFFAA,coordsString);
		format(coordsString, sizeof(coordsString), "WID: [{C6E2FF}%d{FFFFFF}] IID: [{C6E2FF}%d{FFFFFF}] HP: [{ff0000}%.1f{FFFFFF}] AP: [%.1f]\n",PlayerInfo[targetid][pVW],PlayerInfo[targetid][pInt], PlayerInfo[targetid][pHealth], PlayerInfo[targetid][pArmor]);
        strcat(S3MP4K, coordsString);
        format(coordsString, sizeof(coordsString), "House: [{FF0000}%d{FFFFFF}] Business: [{FF0000}%d{FFFFFF}] Workshop: [{FF0000}%d{FFFFFF}] Farm: [{FF0000}%d{FFFFFF}] Dealer: [{FF0000}%d{FFFFFF}]",housekey,bizkey,workshop,farm,dealership);
        strcat(S3MP4K, coordsString);
		//SendClientMessageEx(playerid, 0xFFFFFFAA,coordsString);
		ShowPlayerDialog(playerid, DIALOG_INVENTORY, DIALOG_STYLE_MSGBOX, idiot,S3MP4K,"Close","");
	}
}


public OnPlayerRegister(playerid, password[])
{
	if(IsPlayerConnected(playerid))
	{
			new String3[32];
			new playername3[MAX_PLAYER_NAME];
			GetPlayerName(playerid, playername3, sizeof(playername3));
			format(String3, sizeof(String3), "users/%s.ini", playername3);
			new File: hFile = fopen(String3, io_write);
   			if (hFile)
			{
				strmid(PlayerInfo[playerid][pKey], password, 0, strlen(password), 255);
				new var[1024];
				format(var, 1024, "Key=%s\n", PlayerInfo[playerid][pKey]);fwrite(hFile, var);
				format(var, 1024, "AdminOnDuty=%d\n", PlayerInfo[playerid][pAdminDuty]);fwrite(hFile, var);
				format(var, 1024, "AdminName=%s\n",PlayerInfo[playerid][pAdminName]);fwrite(hFile, var);
				format(var, 1024, "NormalName=%s\n",PlayerInfo[playerid][pNormalName]);fwrite(hFile, var);
				format(var, 1024, "VIPName=%s\n", PlayerInfo[playerid][pVIPName]);fwrite(hFile, var);
				format(var, 1024, "AdminBan=%s\n", PlayerInfo[playerid][pAdminban]);fwrite(hFile, var);
				format(var, 1024, "BanReason=%s\n", PlayerInfo[playerid][pBanReason]);fwrite(hFile, var);
				format(var, 1024, "BanExpired=%s\n", PlayerInfo[playerid][pBanExpired]);fwrite(hFile, var);
       			format(var, 1024, "BanExpired2=%s\n", PlayerInfo[playerid][pBanExpired2]);fwrite(hFile, var);
				format(var, 1024, "Accent=%s\n", PlayerInfo[playerid][pAccent]);fwrite(hFile, var);
				format(var, 1024, "SweeperT=%d\n",PlayerInfo[playerid][pSweeperT]);fwrite(hFile, var);
				format(var, 1024, "WSBos=%d\n", PlayerInfo[playerid][pWSBos]);fwrite(hFile, var);
				format(var, 1024, "DutyTime=%d\n", PlayerInfo[playerid][pDutyTime]);fwrite(hFile, var);
				format(var, 1024, "LadangBos=%d\n", PlayerInfo[playerid][pFarmBos]);fwrite(hFile, var);
				format(var, 1024, "Level=%d\n",PlayerInfo[playerid][pLevel]);fwrite(hFile, var);
				format(var, 1024, "AdminLevel=%d\n",PlayerInfo[playerid][pAdmin]);fwrite(hFile, var);
				format(var, 1024, "Band=%d\n",PlayerInfo[playerid][pBanned]);fwrite(hFile, var);
				format(var, 1024, "PermBand=%d\n",PlayerInfo[playerid][pPermaBanned]);fwrite(hFile, var);
				format(var, 1024, "Warnings=%d\n",PlayerInfo[playerid][pWarns]);fwrite(hFile, var);
				format(var, 1024, "Disabled=%d\n",PlayerInfo[playerid][pDisabled]);fwrite(hFile, var);
				format(var, 1024, "DonateRank=%d\n",PlayerInfo[playerid][pDonateRank]);fwrite(hFile, var);
				format(var, 1024, "DutyTimeTotal=%d\n",PlayerInfo[playerid][pDutyTimeTotal]);fwrite(hFile, var);
				format(var, 1024, "TogReports=%d\n",PlayerInfo[playerid][pTogReports]);fwrite(hFile, var);
				format(var, 1024, "Radio=%d\n",PlayerInfo[playerid][pRadio]);fwrite(hFile, var);
				format(var, 1024, "RadioFreq=%d\n",PlayerInfo[playerid][pRadioFreq]);fwrite(hFile, var);
				format(var, 1024, "Bandage=%d\n",PlayerInfo[playerid][pBandage]);fwrite(hFile, var);
				format(var, 1024, "ConnectedTime=%d\n",PlayerInfo[playerid][pConnectTime]);fwrite(hFile, var);
				format(var, 1024, "Registered=%d\n",PlayerInfo[playerid][pReg]);fwrite(hFile, var);
				format(var, 1024, "Sex=%d\n",PlayerInfo[playerid][pSex]);fwrite(hFile, var);
				format(var, 1024, "Lumber=%d\n",PlayerInfo[playerid][pLumber]);fwrite(hFile, var);
				format(var, 1024, "Cacing=%d\n",PlayerInfo[playerid][pCacing]);fwrite(hFile, var);
				format(var, 1024, "AdminOnDutyTime=%d\n",PlayerInfo[playerid][pAdminOnDutyTime]);fwrite(hFile, var);
				format(var, 1024, "PBiskey2=%d\n",PlayerInfo[playerid][pPBiskey2]);fwrite(hFile, var);
				format(var, 1024, "PDTime=%d\n",PlayerInfo[playerid][pPDTime]);fwrite(hFile, var);
				format(var, 1024, "Hunger=%d\n",PlayerInfo[playerid][pHunger]);fwrite(hFile, var);
				format(var, 1024, "Bladder=%d\n",PlayerInfo[playerid][pBladder]);fwrite(hFile, var);
				format(var, 1024, "Energi=%d\n",PlayerInfo[playerid][pEnergi]);fwrite(hFile, var);
				format(var, 1024, "Condition=%d\n",PlayerInfo[playerid][pCondition]);fwrite(hFile, var);
				format(var, 1024, "SilincedSkill=%d\n",PlayerInfo[playerid][pSilincedSkill]);fwrite(hFile, var);
				format(var, 1024, "DesertEagleSkill=%d\n",PlayerInfo[playerid][pDesertEagleSkill]);fwrite(hFile, var);
				format(var, 1024, "RifleSkill=%d\n",PlayerInfo[playerid][pRifleSkill]);fwrite(hFile, var);
				format(var, 1024, "ShotgunSkill=%d\n",PlayerInfo[playerid][pShotgunSkill]);fwrite(hFile, var);
				format(var, 1024, "SpassSkill=%d\n",PlayerInfo[playerid][pSpassSkill]);fwrite(hFile, var);
				format(var, 1024, "MP5Skill=%d\n",PlayerInfo[playerid][pMP5Skill]);fwrite(hFile, var);
				format(var, 1024, "AK47Skill=%d\n",PlayerInfo[playerid][pAK47Skill]);fwrite(hFile, var);
				format(var, 1024, "M4Skill=%d\n",PlayerInfo[playerid][pM4Skill]);fwrite(hFile, var);
				format(var, 1024, "SniperSkill=%d\n",PlayerInfo[playerid][pSniperSkill]);fwrite(hFile, var);
				format(var, 1024, "TrainingTime=%d\n",PlayerInfo[playerid][pTrainingTime]);fwrite(hFile, var);
				format(var, 1024, "PBiskey=%d\n",PlayerInfo[playerid][pPBiskey]);fwrite(hFile, var);
				format(var, 1024, "InBizz=%d\n",PlayerInfo[playerid][pInBizz]);fwrite(hFile, var);
				format(var, 1024, "Mask=%d\n",PlayerInfo[playerid][pMask]);fwrite(hFile, var);
				format(var, 1024, "MaskUse=%d\n",PlayerInfo[playerid][pMaskUse]);fwrite(hFile, var);
				format(var, 1024, "MaskID=%d\n",PlayerInfo[playerid][pMaskID]);fwrite(hFile, var);
				format(var, 1024, "Pancingan=%d\n",PlayerInfo[playerid][pPancingan]);fwrite(hFile, var);
				format(var, 1024, "Age=%s\n",PlayerInfo[playerid][pAge]);fwrite(hFile, var);
				format(var, 1024, "Paracetamol=%d\n",PlayerInfo[playerid][pParacetamol]);fwrite(hFile, var);
				format(var, 1024, "Muted=%d\n",PlayerInfo[playerid][pMuted]);fwrite(hFile, var);
				format(var, 1024, "Respect=%d\n",PlayerInfo[playerid][pExp]);fwrite(hFile, var);
				format(var, 1024, "Money=%d\n",GetPVarInt(playerid, "Cash"));fwrite(hFile, var);
				format(var, 1024, "Bank=%d\n",PlayerInfo[playerid][pAccount]);fwrite(hFile, var);
				format(var, 1024, "Crimes=%d\n",PlayerInfo[playerid][pCrimes]);fwrite(hFile, var);
				format(var, 1024, "Arrested=%d\n",PlayerInfo[playerid][pArrested]);fwrite(hFile, var);
				format(var, 1024, "FitnessTimer=%d\n",PlayerInfo[playerid][pFitnessTimer]);fwrite(hFile, var);
				format(var, 1024, "Job=%d\n",PlayerInfo[playerid][pJob]);fwrite(hFile, var);
				format(var, 1024, "WSJob=%d\n",PlayerInfo[playerid][pWSJob]);fwrite(hFile, var);
				format(var, 1024, "FarmJob=%d\n",PlayerInfo[playerid][pFarmJob]);fwrite(hFile, var);
				format(var, 1024, "Jerigen=%d\n",PlayerInfo[playerid][pJerigen]);fwrite(hFile, var);
				format(var, 1024, "Bensin=%d\n",PlayerInfo[playerid][pBensin]);fwrite(hFile, var);
				format(var, 1024, "UseSorry=%d\n",PlayerInfo[playerid][pUseSorry]);fwrite(hFile, var);
                format(var, 1024, "Kuli=%d\n",PlayerInfo[playerid][pKuli]);fwrite(hFile, var);
				format(var, 1024, "Job2=%d\n",PlayerInfo[playerid][pJob2]);fwrite(hFile, var);
				format(var, 1024, "IllegalJob=%d\n",PlayerInfo[playerid][pIllegalJob]);fwrite(hFile, var);
				format(var, 1024, "Paycheck=%d\n",PlayerInfo[playerid][pPayCheck]);fwrite(hFile, var);
				format(var, 1024, "Jailed=%d\n",PlayerInfo[playerid][pJailed]);fwrite(hFile, var);
				format(var, 1024, "JailTime=%d\n",PlayerInfo[playerid][pJailTime]);fwrite(hFile, var);
				format(var, 1024, "WRestricted=%d\n",PlayerInfo[playerid][pWRestricted]);fwrite(hFile, var);
				format(var, 1024, "Materials=%d\n",PlayerInfo[playerid][pMats]);fwrite(hFile, var);
				format(var, 1024, "Pulsa2=%d\n",PlayerInfo[playerid][pPulsa2]);fwrite(hFile, var);
				format(var, 1024, "Packages=%d\n",GetPVarInt(MAX_PLAYERS, "Packages"));fwrite(hFile, var);
				format(var, 1024, "Crates=%d\n",PlayerInfo[playerid][pCrates]);fwrite(hFile, var);
				format(var, 1024, "Pot=%d\n",PlayerInfo[playerid][pPot]);fwrite(hFile, var);
				format(var, 1024, "Crack=%d\n",PlayerInfo[playerid][pCrack]);fwrite(hFile, var);
				format(var, 1024, "Leader=%d\n",PlayerInfo[playerid][pLeader]);fwrite(hFile, var);
				format(var, 1024, "Member=%d\n",PlayerInfo[playerid][pMember]);fwrite(hFile, var);
				format(var, 1024, "Division=%d\n",PlayerInfo[playerid][pDivision]);fwrite(hFile, var);
				format(var, 1024, "FMember=%d\n",PlayerInfo[playerid][pFMember]);fwrite(hFile, var);
				format(var, 1024, "Rank=%d\n",PlayerInfo[playerid][pRank]);fwrite(hFile, var);
				format(var, 1024, "Amoxicilin=%d\n",PlayerInfo[playerid][pAmoxicilin]);fwrite(hFile, var);
				format(var, 1024, "MechSkill=%d\n",PlayerInfo[playerid][pMechSkill]);fwrite(hFile, var);
				format(var, 1024, "Ultrafluenza=%d\n",PlayerInfo[playerid][pUltrafluenza]);fwrite(hFile, var);
				format(var, 1024, "DrugsSkill=%d\n",PlayerInfo[playerid][pTruckingSkill]);fwrite(hFile, var);
				format(var, 1024, "ArmsSkill=%d\n",PlayerInfo[playerid][pArmsSkill]);fwrite(hFile, var);
				format(var, 1024, "SmugglerSkill=%d\n",PlayerInfo[playerid][pSmugSkill]);fwrite(hFile, var);
				format(var, 1024, "FightingStyle=%d\n",PlayerInfo[playerid][pFightStyle]);fwrite(hFile, var);
				GetPlayerHealth(MAX_PLAYERS,PlayerInfo[playerid][pHealth]);
				format(var, 1024, "pHealth=%.1f\n",PlayerInfo[playerid][pHealth]);fwrite(hFile, var);
				GetPlayerArmour(MAX_PLAYERS,PlayerInfo[playerid][pArmor]);
				format(var, 1024, "pArmor=%.1f\n",PlayerInfo[playerid][pArmor]);fwrite(hFile, var);
				format(var, 1024, "pSHealth=%.1f\n",PlayerInfo[playerid][pSHealth]);fwrite(hFile, var);
				format(var, 1024, "pGroin=%.1f\n",PlayerInfo[playerid][pBodyCondition][0]);fwrite(hFile, var);
				format(var, 1024, "pTorso=%.1f\n",PlayerInfo[playerid][pBodyCondition][1]);fwrite(hFile, var);
				format(var, 1024, "pRArm=%.1f\n",PlayerInfo[playerid][pBodyCondition][2]);fwrite(hFile, var);
				format(var, 1024, "pLArm=%.1f\n",PlayerInfo[playerid][pBodyCondition][3]);fwrite(hFile, var);
				format(var, 1024, "pRLeg=%.1f\n",PlayerInfo[playerid][pBodyCondition][4]);fwrite(hFile, var);
				format(var, 1024, "pLLeg=%.1f\n",PlayerInfo[playerid][pBodyCondition][5]);fwrite(hFile, var);
				//format(var, 1024, "pSArmor=%.1f\n",PlayerInfo[playerid][pSArmor]);fwrite(hFile, var);
				format(var, 1024, "Int=%d\n",PlayerInfo[playerid][pInt]);fwrite(hFile, var);
				format(var, 1024, "Local=%d\n",PlayerInfo[playerid][pLocal]);fwrite(hFile, var);
				format(var, 1024, "VirtualWorld=%d\n",PlayerInfo[playerid][pVW]);fwrite(hFile, var);
				format(var, 1024, "HouseInvite=%d\n",PlayerInfo[playerid][pHouseInvite]);fwrite(hFile, var);
				format(var, 1024, "Model=%d\n",PlayerInfo[playerid][pModel]);fwrite(hFile, var);
				format(var, 1024, "PhoneNr=%d\n",PlayerInfo[playerid][pPnumber]);fwrite(hFile, var);
				format(var, 1024, "FMax=%d\n",PlayerInfo[playerid][pFMax]);fwrite(hFile, var);
				format(var, 1024, "FTime=%d\n",PlayerInfo[playerid][pFTime]);fwrite(hFile, var);
				format(var, 1024, "pLumberTime=%d\n",PlayerInfo[playerid][pLumberTime]);fwrite(hFile, var);
				format(var, 1024, "JTime=%d\n",PlayerInfo[playerid][pJTime]);fwrite(hFile, var);
				format(var, 1024, "HaulingTime=%d\n",PlayerInfo[playerid][pHaulingTime]);fwrite(hFile, var);
				format(var, 1024, "Phone=%d\n",PlayerInfo[playerid][pPhone]);fwrite(hFile, var);
				format(var, 1024, "KartuPerdana=%d\n",PlayerInfo[playerid][pKartuPerdana]);fwrite(hFile, var);
				format(var, 1024, "Gate=%d\n",PlayerInfo[playerid][pGate]);fwrite(hFile, var);
				format(var, 1024, "Painkiller=%d\n",PlayerInfo[playerid][pPainkiller]);fwrite(hFile, var);
				format(var, 1024, "BusTime=%d\n",PlayerInfo[playerid][pBusTime]);fwrite(hFile, var);
				format(var, 1024, "BeratIkan=%d\n",PlayerInfo[playerid][pBeratIkan]);fwrite(hFile, var);
				format(var, 1024, "Apartment=%d\n",PlayerInfo[playerid][pPhousekey]);fwrite(hFile, var);
				format(var, 1024, "Apartment2=%d\n",PlayerInfo[playerid][pPhousekey2]);fwrite(hFile, var);
				format(var, 1024, "Renting=%d\n",PlayerInfo[playerid][pRenting]);fwrite(hFile, var);
				format(var, 1024, "CarLic=%d\n",PlayerInfo[playerid][pCarLic]);fwrite(hFile, var);
				format(var, 1024, "CTime=%d\n",PlayerInfo[playerid][pCTime]);fwrite(hFile, var);
				format(var, 1024, "CarLicID=%d\n",PlayerInfo[playerid][pCarLicID]);fwrite(hFile, var);
				format(var, 1024, "KTP=%d\n",PlayerInfo[playerid][pKTP]);fwrite(hFile, var);
				format(var, 1024, "WorkShop=%d\n",PlayerInfo[playerid][pWS]);fwrite(hFile, var);
				format(var, 1024, "Ladang=%d\n",PlayerInfo[playerid][pFarm]);fwrite(hFile, var);
				format(var, 1024, "pTruckerLic=%d\n",PlayerInfo[playerid][pTruckerLic]);fwrite(hFile, var);
				format(var, 1024, "WSid=%d\n",PlayerInfo[playerid][pWSid]);fwrite(hFile, var);
				format(var, 1024, "Farmid=%d\n",PlayerInfo[playerid][pFarmid]);fwrite(hFile, var);
				format(var, 1024, "MissionTime=%d\n",PlayerInfo[playerid][pMissionsTime]);fwrite(hFile, var);
				format(var, 1024, "KTime=%d\n",PlayerInfo[playerid][pKTime]);fwrite(hFile, var);
				format(var, 1024, "pLumberLic=%d\n",PlayerInfo[playerid][pLumberLic]);fwrite(hFile, var);
				format(var, 1024, "FlyLic=%d\n",PlayerInfo[playerid][pFlyLic]);fwrite(hFile, var);
				format(var, 1024, "BoatLic=%d\n",PlayerInfo[playerid][pBoatLic]);fwrite(hFile, var);
				format(var, 1024, "CheckCash=%d\n",PlayerInfo[playerid][pCheckCash]);fwrite(hFile, var);
				format(var, 1024, "Checks=%d\n",PlayerInfo[playerid][pChecks]);fwrite(hFile, var);
				//format(var, 1024, "MInsure=%d\n",PlayerInfo[playerid][pMInsure]);fwrite(hFile, var);
				format(var, 1024, "GunLic=%d\n",PlayerInfo[playerid][pGunLic]);fwrite(hFile, var);
				for(new s = 0; s < 12; s++)
				{
					format(var, 1024, "Gun%d=%d\n", s, PlayerInfo[playerid][pGuns][s]);fwrite(hFile, var);
					format(var, 1024, "GunAmmo%d=%d\n", s, PlayerInfo[playerid][pGunsAmmo][s]);fwrite(hFile, var);
				}
				format(var, 1024, "DrugsTime=%d\n",PlayerInfo[playerid][pDrugsTime]);fwrite(hFile, var);
				format(var, 1024, "MechTime=%d\n",PlayerInfo[playerid][pMechTime]);fwrite(hFile, var);
				format(var, 1024, "PayDay=%d\n",PlayerInfo[playerid][pPayDay]);fwrite(hFile, var);
				format(var, 1024, "CDPlayer=%d\n",PlayerInfo[playerid][pCDPlayer]);fwrite(hFile, var);
				format(var, 1024, "Dice=%d\n",PlayerInfo[playerid][pDice]);fwrite(hFile, var);
				format(var, 1024, "Cangkul=%d\n",PlayerInfo[playerid][pCangkul]);fwrite(hFile, var);
				format(var, 1024, "Spraycan=%d\n",PlayerInfo[playerid][pSpraycan]);fwrite(hFile, var);
				format(var, 1024, "Rope=%d\n",PlayerInfo[playerid][pRope]);fwrite(hFile, var);
				format(var, 1024, "Cigars=%d\n",PlayerInfo[playerid][pCigar]);fwrite(hFile, var);
				format(var, 1024, "Sprunk=%d\n",PlayerInfo[playerid][pSprunk]);fwrite(hFile, var);
				format(var, 1024, "Wins=%d\n",PlayerInfo[playerid][pWins]);fwrite(hFile, var);
				format(var, 1024, "Loses=%d\n",PlayerInfo[playerid][pLoses]);fwrite(hFile, var);
				format(var, 1024, "Tutorial=%d\n",PlayerInfo[playerid][pTut]);fwrite(hFile, var);
				format(var, 1024, "Tutor=%d\n",PlayerInfo[playerid][pTutorial]);fwrite(hFile, var);
				format(var, 1024, "OnDuty=%d\n",PlayerInfo[playerid][pDuty]);fwrite(hFile, var);
				format(var, 1024, "Hospital=%d\n",GetPVarInt(MAX_PLAYERS, "Hospital"));fwrite(hFile, var);
				format(var, 1024, "Adjustable=%d\n",PlayerInfo[playerid][pAdjustable]);fwrite(hFile, var);
				format(var, 1024, "Married=%d\n",PlayerInfo[playerid][pMarried]);fwrite(hFile, var);
				format(var, 1024, "MarriedTo=%s\n",PlayerInfo[playerid][pMarriedTo]);fwrite(hFile, var);
				format(var, 1024, "IP=%s\n",PlayerInfo[playerid][pIP]);fwrite(hFile, var);
				format(var, 1024, "WantedLevel=%d\n",PlayerInfo[playerid][pWantedLevel]);fwrite(hFile, var);
				format(var, 1024, "Insurance=%d\n",PlayerInfo[playerid][pInsurance]);fwrite(hFile, var);
				format(var, 1024, "Snack=%d\n",PlayerInfo[playerid][pSnack]);fwrite(hFile, var);
				format(var, 1024, "MineralWater=%d\n",PlayerInfo[playerid][pMineralWater]);fwrite(hFile, var);
				format(var, 1024, "AdMuted=%d\n",PlayerInfo[playerid][pADMute]);fwrite(hFile, var);
				format(var, 1024, "AdMutedTotal=%d\n",PlayerInfo[playerid][pADMuteTotal]);fwrite(hFile, var);
				format(var, 1024, "HelpMute=%d\n",PlayerInfo[playerid][pHelpMute]);fwrite(hFile, var);
				format(var, 1024, "SPos_x=%.1f\n",PlayerInfo[playerid][pPos_x]);fwrite(hFile, var);
				format(var, 1024, "SPos_y=%.1f\n",PlayerInfo[playerid][pPos_y]);fwrite(hFile, var);
				format(var, 1024, "SPos_z=%.1f\n",PlayerInfo[playerid][pPos_z]);fwrite(hFile, var);
				format(var, 1024, "SPos_r=%.1f\n",PlayerInfo[playerid][pPos_r]);fwrite(hFile, var);
				format(var, 1024, "ReportMuted=%d\n",PlayerInfo[playerid][pRMuted]);fwrite(hFile, var);
    			format(var, 1024, "ReportMutedTotal=%d\n",PlayerInfo[playerid][pRMutedTotal]);fwrite(hFile, var);
    			format(var, 1024, "ReportMutedTime=%d\n",PlayerInfo[playerid][pRMutedTime]);fwrite(hFile, var);
    			format(var, 1024, "UsePainkiller=%d\n",PlayerInfo[playerid][pUsePainkiller]);fwrite(hFile, var);
    			format(var, 1024, "GYMTime=%d\n",PlayerInfo[playerid][pGYMTime]);fwrite(hFile, var);
    			format(var, 1024, "GiftTime=%d\n",PlayerInfo[playerid][pGiftTime]);fwrite(hFile, var);
    			format(var, 1024, "AdvisorDutyHours=%d\n",PlayerInfo[playerid][pDutyHours]);fwrite(hFile, var);
    			format(var, 1024, "AcceptedHelp=%d\n",PlayerInfo[playerid][pAcceptedHelp]);fwrite(hFile, var);
    			format(var, 1024, "AcceptReport=%d\n",PlayerInfo[playerid][pAcceptReport]);fwrite(hFile, var);
    			format(var, 1024, "TrashReport=%d\n",PlayerInfo[playerid][pTrashReport]);fwrite(hFile, var);
    			format(var, 1024, "GangWarn=%d\n",PlayerInfo[playerid][pGangWarn]);fwrite(hFile, var);
    			format(var, 1024, "FactionBanned=%d\n",PlayerInfo[playerid][pFactionBanned]);fwrite(hFile, var);
    			format(var, 1024, "CSFBanned=%d\n",PlayerInfo[playerid][pCSFBanned]);fwrite(hFile, var);
				for(new v = 0; v < MAX_PLAYERVEHICLES; v++)
	    		{
	        		format(var, 1024, "pv%dPosX=%.1f\n", v, PlayerVehicleInfo[playerid][v][pvPosX]);fwrite(hFile, var);
	    			format(var, 1024, "pv%dPosY=%.1f\n", v, PlayerVehicleInfo[playerid][v][pvPosY]);fwrite(hFile, var);
	    			format(var, 1024, "pv%dPosZ=%.1f\n", v, PlayerVehicleInfo[playerid][v][pvPosZ]);fwrite(hFile, var);
	    			format(var, 1024, "pv%dPosAngle=%.1f\n", v, PlayerVehicleInfo[playerid][v][pvPosAngle]);fwrite(hFile, var);
	    			format(var, 1024, "pv%dModelId=%d\n", v, PlayerVehicleInfo[playerid][v][pvModelId]);fwrite(hFile, var);
	    			format(var, 1024, "pv%dLock=%d\n", v, PlayerVehicleInfo[playerid][v][pvLock]);fwrite(hFile, var);
	    			format(var, 1024, "pv%dLocked=%d\n", v, PlayerVehicleInfo[playerid][v][pvLocked]);fwrite(hFile, var);
	    			format(var, 1024, "pv%dPaintJob=%d\n", v, PlayerVehicleInfo[playerid][v][pvPaintJob]);fwrite(hFile, var);
	    			format(var, 1024, "pv%dColor1=%d\n", v, PlayerVehicleInfo[playerid][v][pvColor1]);fwrite(hFile, var);
	    			format(var, 1024, "pv%dNeon=%d\n", v, PlayerVehicleInfo[playerid][v][pvNeon]);fwrite(hFile, var);
	   			 	format(var, 1024, "pv%dColor2=%d\n", v, PlayerVehicleInfo[playerid][v][pvColor2]);fwrite(hFile, var);
	   			 	format(var, 1024, "pv%dPrice=%d\n", v, PlayerVehicleInfo[playerid][v][pvPrice]);fwrite(hFile, var);
	   			 	format(var, 1024, "pv%dTicket=%d\n", v, PlayerVehicleInfo[playerid][v][pvTicket]);fwrite(hFile, var);
	   			 	format(var, 1024, "pv%dWeapon0=%d\n", v, PlayerVehicleInfo[playerid][v][pvWeapons][0]);fwrite(hFile, var);
	   			 	format(var, 1024, "pv%dWeapon1=%d\n", v, PlayerVehicleInfo[playerid][v][pvWeapons][1]);fwrite(hFile, var);
	   			 	format(var, 1024, "pv%dWeapon2=%d\n", v, PlayerVehicleInfo[playerid][v][pvWeapons][2]);fwrite(hFile, var);
	   			 	format(var, 1024, "pv%dWeaponAmmo0=%d\n", v, PlayerVehicleInfo[playerid][v][pvWeaponsAmmo][0]);fwrite(hFile, var);
	   			 	format(var, 1024, "pv%dWeaponAmmo1=%d\n", v, PlayerVehicleInfo[playerid][v][pvWeaponsAmmo][1]);fwrite(hFile, var);
	   			 	format(var, 1024, "pv%dWeaponAmmo2=%d\n", v, PlayerVehicleInfo[playerid][v][pvWeaponsAmmo][2]);fwrite(hFile, var);
	   			 	format(var, 1024, "pv%dWepUpgrade=%d\n", v, PlayerVehicleInfo[playerid][v][pvWepUpgrade]);fwrite(hFile, var);
	   			 	if(PlayerVehicleInfo[playerid][v][pvImpounded] == 0) PlayerVehicleInfo[playerid][v][pvFuel] = VehicleFuel[PlayerVehicleInfo[playerid][v][pvId]];
	   			 	format(var, 32, "pv%dFuel=%.1f\n", v, PlayerVehicleInfo[playerid][v][pvFuel]);fwrite(hFile, var);
	   			 	format(var, 1024, "pv%dHealth=%.1f\n", v, PlayerVehicleInfo[playerid][v][pvHealth]);fwrite(hFile, var);
					format(var, 1024, "pv%dInsurances=%d\n", v, PlayerVehicleInfo[playerid][v][pvInsurances]);fwrite(hFile, var);
					format(var, 1024, "pv%dMesinUpgrade=%d\n", v, PlayerVehicleInfo[playerid][v][pvMesinUpgrade]);fwrite(hFile, var);
					format(var, 1024, "pv%dBodyUpgrade=%d\n", v, PlayerVehicleInfo[playerid][v][pvBodyUpgrade]);fwrite(hFile, var);
	   			 	format(var, 1024, "pv%dStatus0=%d\n", v, PlayerVehicleInfo[playerid][v][pvStatus][0]);fwrite(hFile, var);
					format(var, 1024, "pv%dStatus1=%d\n", v, PlayerVehicleInfo[playerid][v][pvStatus][1]);fwrite(hFile, var);
					format(var, 1024, "pv%dStatus2=%d\n", v, PlayerVehicleInfo[playerid][v][pvStatus][2]);fwrite(hFile, var);
					format(var, 1024, "pv%dStatus3=%d\n", v, PlayerVehicleInfo[playerid][v][pvStatus][3]);fwrite(hFile, var);
					format(var, 1024, "pv%dLicense=%d\n", v, PlayerVehicleInfo[playerid][v][pvLicense]);fwrite(hFile, var);
					format(var, 1024, "pv%dLicenseTime=%d\n", v, PlayerVehicleInfo[playerid][v][pvLicenseTime]);fwrite(hFile, var);
					format(var, 1024, "pv%dLicenseExpired=%s\n", v, PlayerVehicleInfo[playerid][v][pvLicenseExpired]);fwrite(hFile, var);
					format(var, 1024, "pv%dImpound=%d\n", v, PlayerVehicleInfo[playerid][v][pvImpounded]);fwrite(hFile, var);
					format(var, 1024, "pv%dStored=%d\n", v, PlayerVehicleInfo[playerid][v][pvStored]);fwrite(hFile, var);
					format(var, 1024, "pv%dDestroyed=%d\n", v, PlayerVehicleInfo[playerid][v][pvDestroyed]);fwrite(hFile, var);
	   			 	format(var, 1024, "pv%dNumPlate=%s\n", v, PlayerVehicleInfo[playerid][v][pvNumberPlate]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyText1=%s\n", v, PlayerVehicleInfo[playerid][v][pvToyText1]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyText2=%s\n", v, PlayerVehicleInfo[playerid][v][pvToyText2]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyText3=%s\n", v, PlayerVehicleInfo[playerid][v][pvToyText3]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyText4=%s\n", v, PlayerVehicleInfo[playerid][v][pvToyText4]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyText5=%s\n", v, PlayerVehicleInfo[playerid][v][pvToyText5]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyText6=%s\n", v, PlayerVehicleInfo[playerid][v][pvToyText6]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyText7=%s\n", v, PlayerVehicleInfo[playerid][v][pvToyText7]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyText8=%s\n", v, PlayerVehicleInfo[playerid][v][pvToyText8]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyText9=%s\n", v, PlayerVehicleInfo[playerid][v][pvToyText9]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyText10=%s\n", v, PlayerVehicleInfo[playerid][v][pvToyText10]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextCol1=%d\n", v, PlayerVehicleInfo[playerid][v][pvToyTextCol1]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextCol2=%d\n", v, PlayerVehicleInfo[playerid][v][pvToyTextCol2]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextCol3=%d\n", v, PlayerVehicleInfo[playerid][v][pvToyTextCol3]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextCol4=%d\n", v, PlayerVehicleInfo[playerid][v][pvToyTextCol4]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextCol5=%d\n", v, PlayerVehicleInfo[playerid][v][pvToyTextCol5]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextCol6=%d\n", v, PlayerVehicleInfo[playerid][v][pvToyTextCol6]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextCol7=%d\n", v, PlayerVehicleInfo[playerid][v][pvToyTextCol7]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextCol8=%d\n", v, PlayerVehicleInfo[playerid][v][pvToyTextCol8]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextCol9=%d\n", v, PlayerVehicleInfo[playerid][v][pvToyTextCol9]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextCol10=%d\n", v, PlayerVehicleInfo[playerid][v][pvToyTextCol10]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextSize1=%d\n", v, PlayerVehicleInfo[playerid][v][pvToyTextSize1]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextSize2=%d\n", v, PlayerVehicleInfo[playerid][v][pvToyTextSize2]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextSize3=%d\n", v, PlayerVehicleInfo[playerid][v][pvToyTextSize3]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextSize4=%d\n", v, PlayerVehicleInfo[playerid][v][pvToyTextSize4]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextSize5=%d\n", v, PlayerVehicleInfo[playerid][v][pvToyTextSize5]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextSize6=%d\n", v, PlayerVehicleInfo[playerid][v][pvToyTextSize6]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextSize7=%d\n", v, PlayerVehicleInfo[playerid][v][pvToyTextSize7]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextSize8=%d\n", v, PlayerVehicleInfo[playerid][v][pvToyTextSize8]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextSize9=%d\n", v, PlayerVehicleInfo[playerid][v][pvToyTextSize9]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextSize10=%d\n", v, PlayerVehicleInfo[playerid][v][pvToyTextSize10]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextID1=%d\n", v, PlayerVehicleInfo[playerid][v][pvToyTextID1]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextID2=%d\n", v, PlayerVehicleInfo[playerid][v][pvToyTextID2]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextID3=%d\n", v, PlayerVehicleInfo[playerid][v][pvToyTextID3]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextID4=%d\n", v, PlayerVehicleInfo[playerid][v][pvToyTextID4]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextID5=%d\n", v, PlayerVehicleInfo[playerid][v][pvToyTextID5]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextID6=%d\n", v, PlayerVehicleInfo[playerid][v][pvToyTextID6]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextID7=%d\n", v, PlayerVehicleInfo[playerid][v][pvToyTextID7]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextID8=%d\n", v, PlayerVehicleInfo[playerid][v][pvToyTextID8]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextID9=%d\n", v, PlayerVehicleInfo[playerid][v][pvToyTextID9]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextID10=%d\n", v, PlayerVehicleInfo[playerid][v][pvToyTextID10]);fwrite(hFile, var);
	    			for(new m = 0; m < MAX_MODS; m++)
	     	   		{
                		format(var, 1024, "pv%dMod%d=%d\n", v, m, PlayerVehicleInfo[playerid][v][pvMods][m]);fwrite(hFile, var);
	        		}
	        		for(new vt = 0; vt < MAX_OBJECTS_PER_PLAYER; vt++)
	        		{
	        		    format(var, 1024, "pv%dToyID%d=%d\n", v, vt, PlayerVehicleInfo[playerid][v][pvToyID][vt]);fwrite(hFile, var);
	        		    format(var, 1024, "pv%dToyPosX%d=%.5f\n", v, vt, PlayerVehicleInfo[playerid][v][pvToyPosX][vt]);fwrite(hFile, var);
	        		    format(var, 1024, "pv%dToyPosY%d=%.5f\n", v, vt, PlayerVehicleInfo[playerid][v][pvToyPosY][vt]);fwrite(hFile, var);
	        		    format(var, 1024, "pv%dToyPosZ%d=%.5f\n", v, vt, PlayerVehicleInfo[playerid][v][pvToyPosZ][vt]);fwrite(hFile, var);
	        		    format(var, 1024, "pv%dToyRotX%d=%.5f\n", v, vt, PlayerVehicleInfo[playerid][v][pvToyRotX][vt]);fwrite(hFile, var);
	        		    format(var, 1024, "pv%dToyRotY%d=%.5f\n", v, vt, PlayerVehicleInfo[playerid][v][pvToyRotY][vt]);fwrite(hFile, var);
	        		    format(var, 1024, "pv%dToyRotZ%d=%.5f\n", v, vt, PlayerVehicleInfo[playerid][v][pvToyRotZ][vt]);fwrite(hFile, var);
	        		    format(var, 1024, "pv%dToyColor%d=%d\n", v, vt, PlayerVehicleInfo[playerid][v][pvToyColor][vt]);fwrite(hFile, var);
	        		    format(var, 1024, "pv%dToyIndex%d=%d\n", v, vt, PlayerVehicleInfo[playerid][v][pvToyIndex][vt]);fwrite(hFile, var);
	        		    format(var, 1024, "pv%dToyTexture1%d=%d\n", v, vt, PlayerVehicleInfo[playerid][v][pvToyTexture1][vt]);fwrite(hFile, var);
	        		    format(var, 1024, "pv%dToyTexture2%d=%d\n", v, vt, PlayerVehicleInfo[playerid][v][pvToyTexture2][vt]);fwrite(hFile, var);
	        		    format(var, 1024, "pv%dToyTextureID%d=%d\n", v, vt, PlayerVehicleInfo[playerid][v][pvToyTextureID][vt]);fwrite(hFile, var);
					}
	        		//format(var, 1024, "pv%dAllowedPlayer=%s\n", v, PlayerVehicleInfo[playerid][v][pvAllowPlayer]);fwrite(hFile, var);
				}
				format(var, 1024, "prTax=%d\n", PlayerRentInfo[playerid][prTax]);fwrite(hFile, var);
				format(var, 1024, "prRentTime=%d\n", PlayerRentInfo[playerid][prRentTime]);fwrite(hFile, var);
				format(var, 1024, "prVehicleRent=%d\n", PlayerRentInfo[playerid][prVehicleRent]);fwrite(hFile, var);
				format(var, 1024, "prModelId=%d\n", PlayerRentInfo[playerid][prModelId]);fwrite(hFile, var);
				format(var, 1024, "prPosX=%.1f\n", PlayerRentInfo[playerid][prPosX]);fwrite(hFile, var);
				format(var, 1024, "prPosY=%.1f\n", PlayerRentInfo[playerid][prPosY]);fwrite(hFile, var);
				format(var, 1024, "prPosZ=%.1f\n", PlayerRentInfo[playerid][prPosZ]);fwrite(hFile, var);
				format(var, 1024, "prPosAngle=%.1f\n", PlayerRentInfo[playerid][prPosAngle]);fwrite(hFile, var);
				format(var, 1024, "prColor1=%d\n", PlayerRentInfo[playerid][prColor1]);fwrite(hFile, var);
				format(var, 1024, "prColor2=%d\n", PlayerRentInfo[playerid][prColor2]);fwrite(hFile, var);
				format(var, 1024, "prLock=%d\n", PlayerRentInfo[playerid][prLock]);fwrite(hFile, var);
				format(var, 1024, "prLocked=%d\n", PlayerRentInfo[playerid][prLocked]);fwrite(hFile, var);
				format(var, 1024, "prTicket=%d\n", PlayerRentInfo[playerid][prTicket]);fwrite(hFile, var);
				format(var, 1024, "prFuel=%d\n", PlayerRentInfo[playerid][prFuel]);fwrite(hFile, var);
				format(var, 1024, "prHealth=%.1f\n", PlayerRentInfo[playerid][prHealth]);fwrite(hFile, var);
				format(var, 1024, "prStatus0=%d\n", PlayerRentInfo[playerid][prStatus][0]);fwrite(hFile, var);
				format(var, 1024, "prStatus1=%d\n", PlayerRentInfo[playerid][prStatus][1]);fwrite(hFile, var);
				format(var, 1024, "prStatus2=%d\n", PlayerRentInfo[playerid][prStatus][2]);fwrite(hFile, var);
				format(var, 1024, "prStatus3=%d\n", PlayerRentInfo[playerid][prStatus][3]);fwrite(hFile, var);
	    		for(new vv = 0; vv < MAX_PLAYERTOYS; vv++)
	    		{
					format(var, 1024, "pt%dModelID=%d\n", vv, PlayerToyInfo[playerid][vv][ptModelID]);fwrite(hFile, var);
					format(var, 1024, "pt%dBone=%d\n", vv, PlayerToyInfo[playerid][vv][ptBone]);fwrite(hFile, var);
	        		format(var, 1024, "pt%dPosX=%.5f\n", vv, PlayerToyInfo[playerid][vv][ptPosX]);fwrite(hFile, var);
	    			format(var, 1024, "pt%dPosY=%.5f\n", vv, PlayerToyInfo[playerid][vv][ptPosY]);fwrite(hFile, var);
	    			format(var, 1024, "pt%dPosZ=%.5f\n", vv, PlayerToyInfo[playerid][vv][ptPosZ]);fwrite(hFile, var);
	    			format(var, 1024, "pt%dRotX=%.5f\n", vv, PlayerToyInfo[playerid][vv][ptRotX]);fwrite(hFile, var);
	    			format(var, 1024, "pt%dRotY=%.5f\n", vv, PlayerToyInfo[playerid][vv][ptRotY]);fwrite(hFile, var);
	    			format(var, 1024, "pt%dRotZ=%.5f\n", vv, PlayerToyInfo[playerid][vv][ptRotZ]);fwrite(hFile, var);
	    			format(var, 1024, "pt%dScaX=%.5f\n", vv, PlayerToyInfo[playerid][vv][ptScaX]);fwrite(hFile, var);
	    			format(var, 1024, "pt%dScaY=%.5f\n", vv, PlayerToyInfo[playerid][vv][ptScaY]);fwrite(hFile, var);
	    			format(var, 1024, "pt%dScaZ=%.5f\n", vv, PlayerToyInfo[playerid][vv][ptScaZ]);fwrite(hFile, var);
	    		}
	    		format(var, 1024, "VIPJoinDate=%s\n",PlayerInfo[playerid][pVIPJoinDate]);fwrite(hFile, var);//vip
				format(var, 1024, "VIPExpDate=%s\n",PlayerInfo[playerid][pVIPExpDate]);fwrite(hFile, var);//vip
				format(var, 1024, "VIPExpTime=%s\n",PlayerInfo[playerid][pVIPExpTime]);fwrite(hFile, var);//vip
	    		format(var, 1024, "VIPInviteDay=%d\n",PlayerInfo[playerid][pVIPInviteDay]);fwrite(hFile, var);
	    		format(var, 1024, "TempVIP=%d\n",PlayerInfo[playerid][pTempVIP]);fwrite(hFile, var);
	    		format(var, 1024, "BuddyInvite=%d\n",PlayerInfo[playerid][pBuddyInvited]);fwrite(hFile, var);
	    		format(var, 1024, "VIPLeft=%d\n",PlayerInfo[playerid][pVIPLeft]);fwrite(hFile, var);
	    		format(var, 1024, "Tokens=%d\n",PlayerInfo[playerid][pTokens]);fwrite(hFile, var);
	    		format(var, 1024, "TriageTime=%d\n",PlayerInfo[playerid][pTriageTime]);fwrite(hFile, var);
	    		format(var, 1024, "jailedBy=%s\n", PlayerInfo[playerid][pJailedBy]);fwrite(hFile, var);
	    		format(var, 1024, "PrisonReason=%s\n", PlayerInfo[playerid][pPrisonReason]);fwrite(hFile, var);
	    		format(var, 1024, "TicketTime=%d\n",PlayerInfo[playerid][pTicketTime]);fwrite(hFile, var);
	    		format(var, 1024, "Screwdriver=%d\n",PlayerInfo[playerid][pScrewdriver]);fwrite(hFile, var);
	    		format(var, 1024, "Tire=%d\n",PlayerInfo[playerid][pTire]);fwrite(hFile, var);
	    		format(var, 1024, "Firstaid=%d\n",PlayerInfo[playerid][pFirstaid]);fwrite(hFile, var);
	    		format(var, 1024, "Rccam=%d\n",PlayerInfo[playerid][pRccam]);fwrite(hFile, var);
	    		format(var, 1024, "Receiver=%d\n",PlayerInfo[playerid][pReceiver]);fwrite(hFile, var);
	    		format(var, 1024, "GPS=%d\n",PlayerInfo[playerid][pGPS]);fwrite(hFile, var);
	    		format(var, 1024, "Sweep=%d\n",PlayerInfo[playerid][pSweep]);fwrite(hFile, var);
	    		format(var, 1024, "SweepLeft=%d\n",PlayerInfo[playerid][pSweepLeft]);fwrite(hFile, var);
	    		format(var, 1024, "Bugged=%d\n",PlayerInfo[playerid][pBugged]);fwrite(hFile, var);
	    		format(var, 1024, "Hospital=%d\n",PlayerInfo[playerid][pHospital]);fwrite(hFile, var);
				format(var, 1024, "TanamanAnggur=%d\n",PlayerInfo[playerid][pTanamanAnggur]);fwrite(hFile, var);
				format(var, 1024, "TanamanBlueberry=%d\n",PlayerInfo[playerid][pTanamanBlueberry]);fwrite(hFile, var);
				format(var, 1024, "TanamanStrawberry=%d\n",PlayerInfo[playerid][pTanamanStrawberry]);fwrite(hFile, var);
				format(var, 1024, "TanamanGandum=%d\n",PlayerInfo[playerid][pTanamanGandum]);fwrite(hFile, var);
				format(var, 1024, "TanamanTomat=%d\n",PlayerInfo[playerid][pTanamanTomat]);fwrite(hFile, var);
				format(var, 1024, "BibitAnggur=%d\n",PlayerInfo[playerid][pBibitAnggur]);fwrite(hFile, var);
				format(var, 1024, "BibitBlueberry=%d\n",PlayerInfo[playerid][pBibitBlueberry]);fwrite(hFile, var);
				format(var, 1024, "BibitStrawberry=%d\n",PlayerInfo[playerid][pBibitStrawberry]);fwrite(hFile, var);
				format(var, 1024, "BibitGandum=%d\n",PlayerInfo[playerid][pBibitGandum]);fwrite(hFile, var);
				format(var, 1024, "BibitTomat=%d\n",PlayerInfo[playerid][pBibitTomat]);fwrite(hFile, var);
				format(var, 1024, "Warrants=%s\n",PlayerInfo[playerid][pWarrant]);fwrite(hFile, var);
				format(var, 1024, "JudgeJailTime=%d\n",PlayerInfo[playerid][pJudgeJailTime]);fwrite(hFile, var);
				format(var, 1024, "JudgeJailType=%d\n",PlayerInfo[playerid][pJudgeJailType]);fwrite(hFile, var);
				format(var, 1024, "BeingSentenced=%d\n",PlayerInfo[playerid][pBeingSentenced]);fwrite(hFile, var);
				format(var, 1024, "ProbationTime=%d\n",PlayerInfo[playerid][pProbationTime]);fwrite(hFile, var);
	    		format(var, 1024, "CallsAccepted=%d\n", PlayerInfo[playerid][pCallsAccepted]);fwrite(hFile, var);
	    		format(var, 1024, "PatientsDelivered=%d\n",PlayerInfo[playerid][pPatientsDelivered]);fwrite(hFile, var);
	    		format(var, 1024, "LiveBanned=%d\n",PlayerInfo[playerid][pLiveBanned]);fwrite(hFile, var);
	    		format(var, 1024, "FreezeBank=%d\n",PlayerInfo[playerid][pFreezeBank]);fwrite(hFile, var);
				format(var, 1024, "Component=%d\n",PlayerInfo[playerid][pComponent]);fwrite(hFile, var);
				format(var, 1024, "BoomBox=%d\n",PlayerInfo[playerid][pBoomBox]);fwrite(hFile, var);
	    		//if( strcmp( key, "jailedBy", true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[playerid][pJailedBy], val, 0, strlen(val)-1, 255); }
				fclose(hFile);
				new String[200];
				OnPlayerLogin(playerid, password);
				format(String, sizeof(String), "[DATABASE] {FFFFFF}Akun dengan Nama {FFFF00}%s {FFFFFF}telah berhasil terdaftar di Database", PlayerInfo[playerid][pNormalName]);
				SendClientMessage(playerid, COLOR_ARWIN, String);
				TotalRegister++;
			}
	}
	return 1;
}

public OnPlayerStatsUpdate(playerid)
{
	if(GetPVarInt(playerid, "TempName") == 1) return 1;
	if(IsPlayerConnected(playerid))
	{
		if(gPlayerLogged{playerid})
		{
		    new String3[32];
			new playername3[MAX_PLAYER_NAME];
			GetPlayerName(playerid, playername3, sizeof(playername3));
   			format(String3, sizeof(String3), "users/%s.ini", playername3);
			new File: hFile = fopen(String3, io_write);
			if (hFile)
			{
				new var[1024];
				format(var, 1024, "Key=%s\n", PlayerInfo[playerid][pKey]);fwrite(hFile, var);
				format(var, 1024, "AdminOnDuty=%d\n", PlayerInfo[playerid][pAdminDuty]);fwrite(hFile, var);
				format(var, 1024, "AdminName=%s\n", PlayerInfo[playerid][pAdminName]);fwrite(hFile, var);
				format(var, 1024, "NormalName=%s\n", PlayerInfo[playerid][pNormalName]);fwrite(hFile, var);
				format(var, 1024, "VIPName=%s\n", PlayerInfo[playerid][pVIPName]);fwrite(hFile, var);
				format(var, 1024, "AdminBan=%s\n", PlayerInfo[playerid][pAdminban]);fwrite(hFile, var);
				format(var, 1024, "BanReason=%s\n", PlayerInfo[playerid][pBanReason]);fwrite(hFile, var);
				format(var, 1024, "BanExpired=%s\n", PlayerInfo[playerid][pBanExpired]);fwrite(hFile, var);
       			format(var, 1024, "BanExpired2=%s\n", PlayerInfo[playerid][pBanExpired2]);fwrite(hFile, var);
				format(var, 1024, "Accent=%s\n", PlayerInfo[playerid][pAccent]);fwrite(hFile, var);
				format(var, 1024, "SweeperT=%d\n",PlayerInfo[playerid][pSweeperT]);fwrite(hFile, var);
				format(var, 1024, "WSBos=%d\n", PlayerInfo[playerid][pWSBos]);fwrite(hFile, var);
				format(var, 1024, "DutyTime=%d\n", PlayerInfo[playerid][pDutyTime]);fwrite(hFile, var);
				format(var, 1024, "LadangBos=%d\n", PlayerInfo[playerid][pFarmBos]);fwrite(hFile, var);
				format(var, 1024, "Level=%d\n",PlayerInfo[playerid][pLevel]);fwrite(hFile, var);
				format(var, 1024, "AdminLevel=%d\n",PlayerInfo[playerid][pAdmin]);fwrite(hFile, var);
				format(var, 1024, "Band=%d\n",PlayerInfo[playerid][pBanned]);fwrite(hFile, var);
				format(var, 1024, "PermBand=%d\n",PlayerInfo[playerid][pPermaBanned]);fwrite(hFile, var);
				format(var, 1024, "Warnings=%d\n",PlayerInfo[playerid][pWarns]);fwrite(hFile, var);
				format(var, 1024, "Disabled=%d\n",PlayerInfo[playerid][pDisabled]);fwrite(hFile, var);
				format(var, 1024, "DonateRank=%d\n",PlayerInfo[playerid][pDonateRank]);fwrite(hFile, var);
				format(var, 1024, "DutyTimeTotal=%d\n",PlayerInfo[playerid][pDutyTimeTotal]);fwrite(hFile, var);
				format(var, 1024, "TogReports=%d\n",PlayerInfo[playerid][pTogReports]);fwrite(hFile, var);
				format(var, 1024, "Radio=%d\n",PlayerInfo[playerid][pRadio]);fwrite(hFile, var);
				format(var, 1024, "RadioFreq=%d\n",PlayerInfo[playerid][pRadioFreq]);fwrite(hFile, var);
				format(var, 1024, "Bandage=%d\n",PlayerInfo[playerid][pBandage]);fwrite(hFile, var);
				format(var, 1024, "ConnectedTime=%d\n",PlayerInfo[playerid][pConnectTime]);fwrite(hFile, var);
				format(var, 1024, "Registered=%d\n",PlayerInfo[playerid][pReg]);fwrite(hFile, var);
				format(var, 1024, "Sex=%d\n",PlayerInfo[playerid][pSex]);fwrite(hFile, var);
				format(var, 1024, "Lumber=%d\n",PlayerInfo[playerid][pLumber]);fwrite(hFile, var);
				format(var, 1024, "Cacing=%d\n",PlayerInfo[playerid][pCacing]);fwrite(hFile, var);
				format(var, 1024, "AdminOnDutyTime=%d\n",PlayerInfo[playerid][pAdminOnDutyTime]);fwrite(hFile, var);
				format(var, 1024, "PBiskey2=%d\n",PlayerInfo[playerid][pPBiskey2]);fwrite(hFile, var);
				format(var, 1024, "PDTime=%d\n",PlayerInfo[playerid][pPDTime]);fwrite(hFile, var);
				format(var, 1024, "Hunger=%d\n",PlayerInfo[playerid][pHunger]);fwrite(hFile, var);
				format(var, 1024, "Bladder=%d\n",PlayerInfo[playerid][pBladder]);fwrite(hFile, var);
				format(var, 1024, "Energi=%d\n",PlayerInfo[playerid][pEnergi]);fwrite(hFile, var);
				format(var, 1024, "Condition=%d\n",PlayerInfo[playerid][pCondition]);fwrite(hFile, var);
				format(var, 1024, "SilincedSkill=%d\n",PlayerInfo[playerid][pSilincedSkill]);fwrite(hFile, var);
				format(var, 1024, "DesertEagleSkill=%d\n",PlayerInfo[playerid][pDesertEagleSkill]);fwrite(hFile, var);
				format(var, 1024, "RifleSkill=%d\n",PlayerInfo[playerid][pRifleSkill]);fwrite(hFile, var);
				format(var, 1024, "ShotgunSkill=%d\n",PlayerInfo[playerid][pShotgunSkill]);fwrite(hFile, var);
				format(var, 1024, "SpassSkill=%d\n",PlayerInfo[playerid][pSpassSkill]);fwrite(hFile, var);
				format(var, 1024, "MP5Skill=%d\n",PlayerInfo[playerid][pMP5Skill]);fwrite(hFile, var);
				format(var, 1024, "AK47Skill=%d\n",PlayerInfo[playerid][pAK47Skill]);fwrite(hFile, var);
				format(var, 1024, "M4Skill=%d\n",PlayerInfo[playerid][pM4Skill]);fwrite(hFile, var);
				format(var, 1024, "SniperSkill=%d\n",PlayerInfo[playerid][pSniperSkill]);fwrite(hFile, var);
				format(var, 1024, "TrainingTime=%d\n",PlayerInfo[playerid][pTrainingTime]);fwrite(hFile, var);
				format(var, 1024, "PBiskey=%d\n",PlayerInfo[playerid][pPBiskey]);fwrite(hFile, var);
				format(var, 1024, "InBizz=%d\n",PlayerInfo[playerid][pInBizz]);fwrite(hFile, var);
				format(var, 1024, "Mask=%d\n",PlayerInfo[playerid][pMask]);fwrite(hFile, var);
				format(var, 1024, "MaskUse=%d\n",PlayerInfo[playerid][pMaskUse]);fwrite(hFile, var);
				format(var, 1024, "MaskID=%d\n",PlayerInfo[playerid][pMaskID]);fwrite(hFile, var);
				format(var, 1024, "Pancingan=%d\n",PlayerInfo[playerid][pPancingan]);fwrite(hFile, var);
				format(var, 1024, "Age=%s\n",PlayerInfo[playerid][pAge]);fwrite(hFile, var);
				format(var, 1024, "Paracetamol=%d\n",PlayerInfo[playerid][pParacetamol]);fwrite(hFile, var);
				format(var, 1024, "Muted=%d\n",PlayerInfo[playerid][pMuted]);fwrite(hFile, var);
				format(var, 1024, "Respect=%d\n",PlayerInfo[playerid][pExp]);fwrite(hFile, var);
				format(var, 1024, "Money=%d\n",GetPVarInt(playerid, "Cash"));fwrite(hFile, var);
				format(var, 1024, "Bank=%d\n",PlayerInfo[playerid][pAccount]);fwrite(hFile, var);
				format(var, 1024, "Crimes=%d\n",PlayerInfo[playerid][pCrimes]);fwrite(hFile, var);
				format(var, 1024, "Arrested=%d\n",PlayerInfo[playerid][pArrested]);fwrite(hFile, var);
				format(var, 1024, "FitnessTimer=%d\n",PlayerInfo[playerid][pFitnessTimer]);fwrite(hFile, var);
				format(var, 1024, "Job=%d\n",PlayerInfo[playerid][pJob]);fwrite(hFile, var);
				format(var, 1024, "WSJob=%d\n",PlayerInfo[playerid][pWSJob]);fwrite(hFile, var);
				format(var, 1024, "FarmJob=%d\n",PlayerInfo[playerid][pFarmJob]);fwrite(hFile, var);
				format(var, 1024, "Jerigen=%d\n",PlayerInfo[playerid][pJerigen]);fwrite(hFile, var);
				format(var, 1024, "Bensin=%d\n",PlayerInfo[playerid][pBensin]);fwrite(hFile, var);
				format(var, 1024, "UseSorry=%d\n",PlayerInfo[playerid][pUseSorry]);fwrite(hFile, var);
				format(var, 1024, "Kuli=%d\n",PlayerInfo[playerid][pKuli]);fwrite(hFile, var);
				format(var, 1024, "Job2=%d\n",PlayerInfo[playerid][pJob2]);fwrite(hFile, var);
				format(var, 1024, "IllegalJob=%d\n",PlayerInfo[playerid][pIllegalJob]);fwrite(hFile, var);
				format(var, 1024, "Paycheck=%d\n",PlayerInfo[playerid][pPayCheck]);fwrite(hFile, var);
				format(var, 1024, "Jailed=%d\n",PlayerInfo[playerid][pJailed]);fwrite(hFile, var);
				format(var, 1024, "JailTime=%d\n",PlayerInfo[playerid][pJailTime]);fwrite(hFile, var);
				format(var, 1024, "WRestricted=%d\n",PlayerInfo[playerid][pWRestricted]);fwrite(hFile, var);
				format(var, 1024, "Materials=%d\n",PlayerInfo[playerid][pMats]);fwrite(hFile, var);
				format(var, 1024, "Pulsa2=%d\n",PlayerInfo[playerid][pPulsa2]);fwrite(hFile, var);
				format(var, 1024, "Packages=%d\n",GetPVarInt(playerid, "Packages"));fwrite(hFile, var);
				format(var, 1024, "Crates=%d\n",PlayerInfo[playerid][pCrates]);fwrite(hFile, var);
				format(var, 1024, "Pot=%d\n",PlayerInfo[playerid][pPot]);fwrite(hFile, var);
				format(var, 1024, "Crack=%d\n",PlayerInfo[playerid][pCrack]);fwrite(hFile, var);
				format(var, 1024, "Leader=%d\n",PlayerInfo[playerid][pLeader]);fwrite(hFile, var);
				format(var, 1024, "Member=%d\n",PlayerInfo[playerid][pMember]);fwrite(hFile, var);
				format(var, 1024, "Division=%d\n",PlayerInfo[playerid][pDivision]);fwrite(hFile, var);
				format(var, 1024, "FMember=%d\n",PlayerInfo[playerid][pFMember]);fwrite(hFile, var);
				format(var, 1024, "Rank=%d\n",PlayerInfo[playerid][pRank]);fwrite(hFile, var);
				format(var, 1024, "Amoxicilin=%d\n",PlayerInfo[playerid][pAmoxicilin]);fwrite(hFile, var);
				format(var, 1024, "MechSkill=%d\n",PlayerInfo[playerid][pMechSkill]);fwrite(hFile, var);
				format(var, 1024, "Ultrafluenza=%d\n",PlayerInfo[playerid][pUltrafluenza]);fwrite(hFile, var);
				format(var, 1024, "DrugsSkill=%d\n",PlayerInfo[playerid][pTruckingSkill]);fwrite(hFile, var);
				format(var, 1024, "ArmsSkill=%d\n",PlayerInfo[playerid][pArmsSkill]);fwrite(hFile, var);
				format(var, 1024, "SmugglerSkill=%d\n",PlayerInfo[playerid][pSmugSkill]);fwrite(hFile, var);
				format(var, 1024, "FightingStyle=%d\n",PlayerInfo[playerid][pFightStyle]);fwrite(hFile, var);
				if(GetPVarInt(playerid, "EventToken") != 2 && GetPVarInt(playerid, "IsInArena") == -1)
				{
				    GetPlayerHealth(playerid,PlayerInfo[playerid][pHealth]);
				}
				format(var, 1024, "pHealth=%.1f\n",PlayerInfo[playerid][pHealth]);fwrite(hFile, var);
				if(GetPVarInt(playerid, "EventToken") != 2 || GetPVarInt(playerid, "IsInArena") == -1)
				{
					GetPlayerArmour(playerid,PlayerInfo[playerid][pArmor]);
				}
				format(var, 1024, "pArmor=%.1f\n",PlayerInfo[playerid][pArmor]);fwrite(hFile, var);
				format(var, 1024, "pSHealth=%.1f\n",PlayerInfo[playerid][pSHealth]);fwrite(hFile, var);
				format(var, 1024, "pGroin=%.1f\n",PlayerInfo[playerid][pBodyCondition][0]);fwrite(hFile, var);
				format(var, 1024, "pTorso=%.1f\n",PlayerInfo[playerid][pBodyCondition][1]);fwrite(hFile, var);
				format(var, 1024, "pRArm=%.1f\n",PlayerInfo[playerid][pBodyCondition][2]);fwrite(hFile, var);
				format(var, 1024, "pLArm=%.1f\n",PlayerInfo[playerid][pBodyCondition][3]);fwrite(hFile, var);
				format(var, 1024, "pRLeg=%.1f\n",PlayerInfo[playerid][pBodyCondition][4]);fwrite(hFile, var);
				format(var, 1024, "pLLeg=%.1f\n",PlayerInfo[playerid][pBodyCondition][5]);fwrite(hFile, var);
				//format(var, 1024, "pSArmor=%.1f\n",PlayerInfo[playerid][pSArmor]);fwrite(hFile, var);
				format(var, 1024, "Int=%d\n",PlayerInfo[playerid][pInt]);fwrite(hFile, var);
				format(var, 1024, "Local=%d\n",PlayerInfo[playerid][pLocal]);fwrite(hFile, var);
				format(var, 1024, "VirtualWorld=%d\n",PlayerInfo[playerid][pVW]);fwrite(hFile, var);
				format(var, 1024, "HouseInvite=%d\n",PlayerInfo[playerid][pHouseInvite]);fwrite(hFile, var);
				format(var, 1024, "Model=%d\n",PlayerInfo[playerid][pModel]);fwrite(hFile, var);
				format(var, 1024, "PhoneNr=%d\n",PlayerInfo[playerid][pPnumber]);fwrite(hFile, var);
				format(var, 1024, "FMax=%d\n",PlayerInfo[playerid][pFMax]);fwrite(hFile, var);
				format(var, 1024, "FTime=%d\n",PlayerInfo[playerid][pFTime]);fwrite(hFile, var);
				format(var, 1024, "pLumberTime=%d\n",PlayerInfo[playerid][pLumberTime]);fwrite(hFile, var);
				format(var, 1024, "JTime=%d\n",PlayerInfo[playerid][pJTime]);fwrite(hFile, var);
				format(var, 1024, "HaulingTime=%d\n",PlayerInfo[playerid][pHaulingTime]);fwrite(hFile, var);
				format(var, 1024, "Phone=%d\n",PlayerInfo[playerid][pPhone]);fwrite(hFile, var);
				format(var, 1024, "KartuPerdana=%d\n",PlayerInfo[playerid][pKartuPerdana]);fwrite(hFile, var);
				format(var, 1024, "Gate=%d\n",PlayerInfo[playerid][pGate]);fwrite(hFile, var);
				format(var, 1024, "Painkiller=%d\n",PlayerInfo[playerid][pPainkiller]);fwrite(hFile, var);
				format(var, 1024, "BusTime=%d\n",PlayerInfo[playerid][pBusTime]);fwrite(hFile, var);
				format(var, 1024, "BeratIkan=%d\n",PlayerInfo[playerid][pBeratIkan]);fwrite(hFile, var);
				format(var, 1024, "Apartment=%d\n",PlayerInfo[playerid][pPhousekey]);fwrite(hFile, var);
				format(var, 1024, "Apartment2=%d\n",PlayerInfo[playerid][pPhousekey2]);fwrite(hFile, var);
				format(var, 1024, "Renting=%d\n",PlayerInfo[playerid][pRenting]);fwrite(hFile, var);
				format(var, 1024, "CarLic=%d\n",PlayerInfo[playerid][pCarLic]);fwrite(hFile, var);
				format(var, 1024, "CTime=%d\n",PlayerInfo[playerid][pCTime]);fwrite(hFile, var);
				format(var, 1024, "CarLicID=%d\n",PlayerInfo[playerid][pCarLicID]);fwrite(hFile, var);
				format(var, 1024, "KTP=%d\n",PlayerInfo[playerid][pKTP]);fwrite(hFile, var);
				format(var, 1024, "WorkShop=%d\n",PlayerInfo[playerid][pWS]);fwrite(hFile, var);
				format(var, 1024, "Ladang=%d\n",PlayerInfo[playerid][pFarm]);fwrite(hFile, var);
				format(var, 1024, "pTruckerLic=%d\n",PlayerInfo[playerid][pTruckerLic]);fwrite(hFile, var);
				format(var, 1024, "WSid=%d\n",PlayerInfo[playerid][pWSid]);fwrite(hFile, var);
				format(var, 1024, "Farmid=%d\n",PlayerInfo[playerid][pFarmid]);fwrite(hFile, var);
				format(var, 1024, "MissionTime=%d\n",PlayerInfo[playerid][pMissionsTime]);fwrite(hFile, var);
				format(var, 1024, "KTime=%d\n",PlayerInfo[playerid][pKTime]);fwrite(hFile, var);
				format(var, 1024, "pLumberLic=%d\n",PlayerInfo[playerid][pLumberLic]);fwrite(hFile, var);
				format(var, 1024, "FlyLic=%d\n",PlayerInfo[playerid][pFlyLic]);fwrite(hFile, var);
				format(var, 1024, "BoatLic=%d\n",PlayerInfo[playerid][pBoatLic]);fwrite(hFile, var);
				format(var, 1024, "CheckCash=%d\n",PlayerInfo[playerid][pCheckCash]);fwrite(hFile, var);
				format(var, 1024, "Checks=%d\n",PlayerInfo[playerid][pChecks]);fwrite(hFile, var);
				//format(var, 1024, "MInsure=%d\n",PlayerInfo[playerid][pMInsure]);fwrite(hFile, var);
				format(var, 1024, "GunLic=%d\n",PlayerInfo[playerid][pGunLic]);fwrite(hFile, var);
				for(new s = 0; s < 12; s++)
				{
					format(var, 1024, "Gun%d=%d\n", s, PlayerInfo[playerid][pGuns][s]);fwrite(hFile, var);
					format(var, 1024, "GunAmmo%d=%d\n", s, PlayerInfo[playerid][pGunsAmmo][s]);fwrite(hFile, var);
				}
				format(var, 1024, "DrugsTime=%d\n",PlayerInfo[playerid][pDrugsTime]);fwrite(hFile, var);
				format(var, 1024, "MechTime=%d\n",PlayerInfo[playerid][pMechTime]);fwrite(hFile, var);
				format(var, 1024, "Insurance=%d\n",PlayerInfo[playerid][pInsurance]);fwrite(hFile, var);
				format(var, 1024, "PayDay=%d\n",PlayerInfo[playerid][pPayDay]);fwrite(hFile, var);
				format(var, 1024, "CDPlayer=%d\n",PlayerInfo[playerid][pCDPlayer]);fwrite(hFile, var);
				format(var, 1024, "Dice=%d\n",PlayerInfo[playerid][pDice]);fwrite(hFile, var);
				format(var, 1024, "Cangkul=%d\n",PlayerInfo[playerid][pCangkul]);fwrite(hFile, var);
				format(var, 1024, "Spraycan=%d\n",PlayerInfo[playerid][pSpraycan]);fwrite(hFile, var);
				format(var, 1024, "Rope=%d\n",PlayerInfo[playerid][pRope]);fwrite(hFile, var);
				format(var, 1024, "Cigars=%d\n",PlayerInfo[playerid][pCigar]);fwrite(hFile, var);
				format(var, 1024, "Sprunk=%d\n",PlayerInfo[playerid][pSprunk]);fwrite(hFile, var);
				format(var, 1024, "Wins=%d\n",PlayerInfo[playerid][pWins]);fwrite(hFile, var);
				format(var, 1024, "Loses=%d\n",PlayerInfo[playerid][pLoses]);fwrite(hFile, var);
				format(var, 1024, "Tutorial=%d\n",PlayerInfo[playerid][pTut]);fwrite(hFile, var);
				format(var, 1024, "Tutor=%d\n",PlayerInfo[playerid][pTutorial]);fwrite(hFile, var);
				format(var, 1024, "OnDuty=%d\n",PlayerInfo[playerid][pDuty]);fwrite(hFile, var);
				format(var, 1024, "Hospital=%d\n",GetPVarInt(playerid, "Hospital"));fwrite(hFile, var);
				format(var, 1024, "Adjustable=%d\n",PlayerInfo[playerid][pAdjustable]);fwrite(hFile, var);
				format(var, 1024, "Married=%d\n",PlayerInfo[playerid][pMarried]);fwrite(hFile, var);
				format(var, 1024, "MarriedTo=%s\n",PlayerInfo[playerid][pMarriedTo]);fwrite(hFile, var);
				format(var, 1024, "IP=%s\n",PlayerInfo[playerid][pIP]);fwrite(hFile, var);
				format(var, 1024, "WantedLevel=%d\n",PlayerInfo[playerid][pWantedLevel]);fwrite(hFile, var);
				format(var, 1024, "Snack=%d\n",PlayerInfo[playerid][pSnack]);fwrite(hFile, var);
				format(var, 1024, "MineralWater=%d\n",PlayerInfo[playerid][pMineralWater]);fwrite(hFile, var);
				format(var, 1024, "AdMuted=%d\n",PlayerInfo[playerid][pADMute]);fwrite(hFile, var);
				format(var, 1024, "AdMutedTotal=%d\n",PlayerInfo[playerid][pADMuteTotal]);fwrite(hFile, var);
                format(var, 1024, "HelpMute=%d\n",PlayerInfo[playerid][pHelpMute]);fwrite(hFile, var);
				format(var, 1024, "SPos_x=%.1f\n",PlayerInfo[playerid][pPos_x]);fwrite(hFile, var);
				format(var, 1024, "SPos_y=%.1f\n",PlayerInfo[playerid][pPos_y]);fwrite(hFile, var);
				format(var, 1024, "SPos_z=%.1f\n",PlayerInfo[playerid][pPos_z]);fwrite(hFile, var);
				format(var, 1024, "SPos_r=%.1f\n",PlayerInfo[playerid][pPos_r]);fwrite(hFile, var);
				format(var, 1024, "ReportMuted=%d\n",PlayerInfo[playerid][pRMuted]);fwrite(hFile, var);
    			format(var, 1024, "ReportMutedTotal=%d\n",PlayerInfo[playerid][pRMutedTotal]);fwrite(hFile, var);
    			format(var, 1024, "ReportMutedTime=%d\n",PlayerInfo[playerid][pRMutedTime]);fwrite(hFile, var);
    			format(var, 1024, "UsePainkiller=%d\n",PlayerInfo[playerid][pUsePainkiller]);fwrite(hFile, var);
    			format(var, 1024, "GYMTime=%d\n",PlayerInfo[playerid][pGYMTime]);fwrite(hFile, var);
    			format(var, 1024, "GiftTime=%d\n",PlayerInfo[playerid][pGiftTime]);fwrite(hFile, var);
    			format(var, 1024, "AdvisorDutyHours=%d\n",PlayerInfo[playerid][pDutyHours]);fwrite(hFile, var);
    			format(var, 1024, "AcceptedHelp=%d\n",PlayerInfo[playerid][pAcceptedHelp]);fwrite(hFile, var);
    			format(var, 1024, "AcceptReport=%d\n",PlayerInfo[playerid][pAcceptReport]);fwrite(hFile, var);
    			format(var, 1024, "TrashReport=%d\n",PlayerInfo[playerid][pTrashReport]);fwrite(hFile, var);
    			format(var, 1024, "GangWarn=%d\n",PlayerInfo[playerid][pGangWarn]);fwrite(hFile, var);
    			format(var, 1024, "FactionBanned=%d\n",PlayerInfo[playerid][pFactionBanned]);fwrite(hFile, var);
    			format(var, 1024, "CSFBanned=%d\n",PlayerInfo[playerid][pCSFBanned]);fwrite(hFile, var);
				for(new v = 0; v < MAX_PLAYERVEHICLES; v++)
	    		{
               		format(var, 1024, "pv%dPosX=%.1f\n", v, PlayerVehicleInfo[playerid][v][pvPosX]);fwrite(hFile, var);
	    			format(var, 1024, "pv%dPosY=%.1f\n", v, PlayerVehicleInfo[playerid][v][pvPosY]);fwrite(hFile, var);
	    			format(var, 1024, "pv%dPosZ=%.1f\n", v, PlayerVehicleInfo[playerid][v][pvPosZ]);fwrite(hFile, var);
	    			format(var, 1024, "pv%dPosAngle=%.1f\n", v, PlayerVehicleInfo[playerid][v][pvPosAngle]);fwrite(hFile, var);
	    			format(var, 1024, "pv%dModelId=%d\n", v, PlayerVehicleInfo[playerid][v][pvModelId]);fwrite(hFile, var);
	    			format(var, 1024, "pv%dLock=%d\n", v, PlayerVehicleInfo[playerid][v][pvLock]);fwrite(hFile, var);
	    			format(var, 1024, "pv%dLocked=%d\n", v, PlayerVehicleInfo[playerid][v][pvLocked]);fwrite(hFile, var);
	    			format(var, 1024, "pv%dPaintJob=%d\n", v, PlayerVehicleInfo[playerid][v][pvPaintJob]);fwrite(hFile, var);
	    			format(var, 1024, "pv%dColor1=%d\n", v, PlayerVehicleInfo[playerid][v][pvColor1]);fwrite(hFile, var);
	    			format(var, 1024, "pv%dNeon=%d\n", v, PlayerVehicleInfo[playerid][v][pvNeon]);fwrite(hFile, var);
	   			 	format(var, 1024, "pv%dColor2=%d\n", v, PlayerVehicleInfo[playerid][v][pvColor2]);fwrite(hFile, var);
	   			 	format(var, 1024, "pv%dPrice=%d\n", v, PlayerVehicleInfo[playerid][v][pvPrice]);fwrite(hFile, var);
	   			 	format(var, 1024, "pv%dTicket=%d\n", v, PlayerVehicleInfo[playerid][v][pvTicket]);fwrite(hFile, var);
	   			 	format(var, 1024, "pv%dWeapon0=%d\n", v, PlayerVehicleInfo[playerid][v][pvWeapons][0]);fwrite(hFile, var);
	   			 	format(var, 1024, "pv%dWeapon1=%d\n", v, PlayerVehicleInfo[playerid][v][pvWeapons][1]);fwrite(hFile, var);
	   			 	format(var, 1024, "pv%dWeapon2=%d\n", v, PlayerVehicleInfo[playerid][v][pvWeapons][2]);fwrite(hFile, var);
	   			 	format(var, 1024, "pv%dWeaponAmmo0=%d\n", v, PlayerVehicleInfo[playerid][v][pvWeaponsAmmo][0]);fwrite(hFile, var);
	   			 	format(var, 1024, "pv%dWeaponAmmo1=%d\n", v, PlayerVehicleInfo[playerid][v][pvWeaponsAmmo][1]);fwrite(hFile, var);
	   			 	format(var, 1024, "pv%dWeaponAmmo2=%d\n", v, PlayerVehicleInfo[playerid][v][pvWeaponsAmmo][2]);fwrite(hFile, var);
	   			 	format(var, 1024, "pv%dWepUpgrade=%d\n", v, PlayerVehicleInfo[playerid][v][pvWepUpgrade]);fwrite(hFile, var);
	   			 	PlayerVehicleInfo[playerid][v][pvFuel] = VehicleFuel[PlayerVehicleInfo[playerid][v][pvId]];
	   			 	format(var, 1024, "pv%dFuel=%.1f\n", v, PlayerVehicleInfo[playerid][v][pvFuel]);fwrite(hFile, var);
         			format(var, 1024, "pv%dHealth=%.1f\n", v, PlayerVehicleInfo[playerid][v][pvHealth]);fwrite(hFile, var);
	   			 	format(var, 1024, "pv%dInsurances=%d\n", v, PlayerVehicleInfo[playerid][v][pvInsurances]);fwrite(hFile, var);
	   			 	format(var, 1024, "pv%dMesinUpgrade=%d\n", v, PlayerVehicleInfo[playerid][v][pvMesinUpgrade]);fwrite(hFile, var);
	   			 	format(var, 1024, "pv%dBodyUpgrade=%d\n", v, PlayerVehicleInfo[playerid][v][pvBodyUpgrade]);fwrite(hFile, var);
         			format(var, 1024, "pv%dStatus0=%d\n", v, PlayerVehicleInfo[playerid][v][pvStatus][0]);fwrite(hFile, var);
					format(var, 1024, "pv%dStatus1=%d\n", v, PlayerVehicleInfo[playerid][v][pvStatus][1]);fwrite(hFile, var);
					format(var, 1024, "pv%dStatus2=%d\n", v, PlayerVehicleInfo[playerid][v][pvStatus][2]);fwrite(hFile, var);
					format(var, 1024, "pv%dStatus3=%d\n", v, PlayerVehicleInfo[playerid][v][pvStatus][3]);fwrite(hFile, var);
					format(var, 1024, "pv%dLicense=%d\n", v, PlayerVehicleInfo[playerid][v][pvLicense]);fwrite(hFile, var);
					format(var, 1024, "pv%dLicenseTime=%d\n", v, PlayerVehicleInfo[playerid][v][pvLicenseTime]);fwrite(hFile, var);
					format(var, 1024, "pv%dLicenseExpired=%s\n", v, PlayerVehicleInfo[playerid][v][pvLicenseExpired]);fwrite(hFile, var);
					format(var, 1024, "pv%dImpound=%d\n", v, PlayerVehicleInfo[playerid][v][pvImpounded]);fwrite(hFile, var);
					format(var, 1024, "pv%dStored=%d\n", v, PlayerVehicleInfo[playerid][v][pvStored]);fwrite(hFile, var);
					format(var, 1024, "pv%dDestroyed=%d\n", v, PlayerVehicleInfo[playerid][v][pvDestroyed]);fwrite(hFile, var);
	   			 	format(var, 1024, "pv%dNumPlate=%s\n", v, PlayerVehicleInfo[playerid][v][pvNumberPlate]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyText1=%s\n", v, PlayerVehicleInfo[playerid][v][pvToyText1]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyText2=%s\n", v, PlayerVehicleInfo[playerid][v][pvToyText2]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyText3=%s\n", v, PlayerVehicleInfo[playerid][v][pvToyText3]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyText4=%s\n", v, PlayerVehicleInfo[playerid][v][pvToyText4]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyText5=%s\n", v, PlayerVehicleInfo[playerid][v][pvToyText5]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyText6=%s\n", v, PlayerVehicleInfo[playerid][v][pvToyText6]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyText7=%s\n", v, PlayerVehicleInfo[playerid][v][pvToyText7]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyText8=%s\n", v, PlayerVehicleInfo[playerid][v][pvToyText8]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyText9=%s\n", v, PlayerVehicleInfo[playerid][v][pvToyText9]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyText10=%s\n", v, PlayerVehicleInfo[playerid][v][pvToyText10]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextCol1=%d\n", v, PlayerVehicleInfo[playerid][v][pvToyTextCol1]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextCol2=%d\n", v, PlayerVehicleInfo[playerid][v][pvToyTextCol2]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextCol3=%d\n", v, PlayerVehicleInfo[playerid][v][pvToyTextCol3]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextCol4=%d\n", v, PlayerVehicleInfo[playerid][v][pvToyTextCol4]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextCol5=%d\n", v, PlayerVehicleInfo[playerid][v][pvToyTextCol5]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextCol6=%d\n", v, PlayerVehicleInfo[playerid][v][pvToyTextCol6]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextCol7=%d\n", v, PlayerVehicleInfo[playerid][v][pvToyTextCol7]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextCol8=%d\n", v, PlayerVehicleInfo[playerid][v][pvToyTextCol8]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextCol9=%d\n", v, PlayerVehicleInfo[playerid][v][pvToyTextCol9]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextCol10=%d\n", v, PlayerVehicleInfo[playerid][v][pvToyTextCol10]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextSize1=%d\n", v, PlayerVehicleInfo[playerid][v][pvToyTextSize1]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextSize2=%d\n", v, PlayerVehicleInfo[playerid][v][pvToyTextSize2]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextSize3=%d\n", v, PlayerVehicleInfo[playerid][v][pvToyTextSize3]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextSize4=%d\n", v, PlayerVehicleInfo[playerid][v][pvToyTextSize4]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextSize5=%d\n", v, PlayerVehicleInfo[playerid][v][pvToyTextSize5]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextSize6=%d\n", v, PlayerVehicleInfo[playerid][v][pvToyTextSize6]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextSize7=%d\n", v, PlayerVehicleInfo[playerid][v][pvToyTextSize7]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextSize8=%d\n", v, PlayerVehicleInfo[playerid][v][pvToyTextSize8]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextSize9=%d\n", v, PlayerVehicleInfo[playerid][v][pvToyTextSize9]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextSize10=%d\n", v, PlayerVehicleInfo[playerid][v][pvToyTextSize10]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextID1=%d\n", v, PlayerVehicleInfo[playerid][v][pvToyTextID1]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextID2=%d\n", v, PlayerVehicleInfo[playerid][v][pvToyTextID2]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextID3=%d\n", v, PlayerVehicleInfo[playerid][v][pvToyTextID3]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextID4=%d\n", v, PlayerVehicleInfo[playerid][v][pvToyTextID4]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextID5=%d\n", v, PlayerVehicleInfo[playerid][v][pvToyTextID5]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextID6=%d\n", v, PlayerVehicleInfo[playerid][v][pvToyTextID6]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextID7=%d\n", v, PlayerVehicleInfo[playerid][v][pvToyTextID7]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextID8=%d\n", v, PlayerVehicleInfo[playerid][v][pvToyTextID8]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextID9=%d\n", v, PlayerVehicleInfo[playerid][v][pvToyTextID9]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextID10=%d\n", v, PlayerVehicleInfo[playerid][v][pvToyTextID10]);fwrite(hFile, var);
	    			for(new m = 0; m < MAX_MODS; m++)
	     	   		{
                		format(var, 1024, "pv%dMod%d=%d\n", v, m, PlayerVehicleInfo[playerid][v][pvMods][m]);fwrite(hFile, var);
	        		}
	        		for(new vt = 0; vt < MAX_OBJECTS_PER_PLAYER; vt++)
	        		{
	        		    format(var, 1024, "pv%dToyID%d=%d\n", v, vt, PlayerVehicleInfo[playerid][v][pvToyID][vt]);fwrite(hFile, var);
	        		    format(var, 1024, "pv%dToyPosX%d=%.5f\n", v, vt, PlayerVehicleInfo[playerid][v][pvToyPosX][vt]);fwrite(hFile, var);
	        		    format(var, 1024, "pv%dToyPosY%d=%.5f\n", v, vt, PlayerVehicleInfo[playerid][v][pvToyPosY][vt]);fwrite(hFile, var);
	        		    format(var, 1024, "pv%dToyPosZ%d=%.5f\n", v, vt, PlayerVehicleInfo[playerid][v][pvToyPosZ][vt]);fwrite(hFile, var);
	        		    format(var, 1024, "pv%dToyRotX%d=%.5f\n", v, vt, PlayerVehicleInfo[playerid][v][pvToyRotX][vt]);fwrite(hFile, var);
	        		    format(var, 1024, "pv%dToyRotY%d=%.5f\n", v, vt, PlayerVehicleInfo[playerid][v][pvToyRotY][vt]);fwrite(hFile, var);
	        		    format(var, 1024, "pv%dToyRotZ%d=%.5f\n", v, vt, PlayerVehicleInfo[playerid][v][pvToyRotZ][vt]);fwrite(hFile, var);
	        		    format(var, 1024, "pv%dToyColor%d=%d\n", v, vt, PlayerVehicleInfo[playerid][v][pvToyColor][vt]);fwrite(hFile, var);
	        		    format(var, 1024, "pv%dToyIndex%d=%d\n", v, vt, PlayerVehicleInfo[playerid][v][pvToyIndex][vt]);fwrite(hFile, var);
	        		    format(var, 1024, "pv%dToyTexture1%d=%d\n", v, vt, PlayerVehicleInfo[playerid][v][pvToyTexture1][vt]);fwrite(hFile, var);
	        		    format(var, 1024, "pv%dToyTexture2%d=%d\n", v, vt, PlayerVehicleInfo[playerid][v][pvToyTexture2][vt]);fwrite(hFile, var);
	        		    format(var, 1024, "pv%dToyTextureID%d=%d\n", v, vt, PlayerVehicleInfo[playerid][v][pvToyTextureID][vt]);fwrite(hFile, var);
					}
	        		//format(var, 1024, "pv%dAllowedPlayer=%s\n", v, PlayerVehicleInfo[playerid][v][pvAllowPlayer]);fwrite(hFile, var);
				}
				format(var, 1024, "prTax=%d\n", PlayerRentInfo[playerid][prTax]);fwrite(hFile, var);
				format(var, 1024, "prRentTime=%d\n", PlayerRentInfo[playerid][prRentTime]);fwrite(hFile, var);
				format(var, 1024, "prVehicleRent=%d\n", PlayerRentInfo[playerid][prVehicleRent]);fwrite(hFile, var);
				format(var, 1024, "prModelId=%d\n", PlayerRentInfo[playerid][prModelId]);fwrite(hFile, var);
				format(var, 1024, "prPosX=%.1f\n", PlayerRentInfo[playerid][prPosX]);fwrite(hFile, var);
				format(var, 1024, "prPosY=%.1f\n", PlayerRentInfo[playerid][prPosY]);fwrite(hFile, var);
				format(var, 1024, "prPosZ=%.1f\n", PlayerRentInfo[playerid][prPosZ]);fwrite(hFile, var);
				format(var, 1024, "prPosAngle=%.1f\n", PlayerRentInfo[playerid][prPosAngle]);fwrite(hFile, var);
				format(var, 1024, "prColor1=%d\n", PlayerRentInfo[playerid][prColor1]);fwrite(hFile, var);
				format(var, 1024, "prColor2=%d\n", PlayerRentInfo[playerid][prColor2]);fwrite(hFile, var);
				format(var, 1024, "prLock=%d\n", PlayerRentInfo[playerid][prLock]);fwrite(hFile, var);
				format(var, 1024, "prLocked=%d\n", PlayerRentInfo[playerid][prLocked]);fwrite(hFile, var);
				format(var, 1024, "prTicket=%d\n", PlayerRentInfo[playerid][prTicket]);fwrite(hFile, var);
				format(var, 1024, "prFuel=%d\n", PlayerRentInfo[playerid][prFuel]);fwrite(hFile, var);
				format(var, 1024, "prHealth=%.1f\n", PlayerRentInfo[playerid][prHealth]);fwrite(hFile, var);
				format(var, 1024, "prStatus0=%d\n", PlayerRentInfo[playerid][prStatus][0]);fwrite(hFile, var);
				format(var, 1024, "prStatus1=%d\n", PlayerRentInfo[playerid][prStatus][1]);fwrite(hFile, var);
				format(var, 1024, "prStatus2=%d\n", PlayerRentInfo[playerid][prStatus][2]);fwrite(hFile, var);
				format(var, 1024, "prStatus3=%d\n", PlayerRentInfo[playerid][prStatus][3]);fwrite(hFile, var);
	    		for(new v = 0; v < MAX_PLAYERTOYS; v++)
	    		{
					format(var, 1024, "pt%dModelID=%d\n", v, PlayerToyInfo[playerid][v][ptModelID]);fwrite(hFile, var);
					format(var, 1024, "pt%dBone=%d\n", v, PlayerToyInfo[playerid][v][ptBone]);fwrite(hFile, var);
	        		format(var, 1024, "pt%dPosX=%.5f\n", v, PlayerToyInfo[playerid][v][ptPosX]);fwrite(hFile, var);
	    			format(var, 1024, "pt%dPosY=%.5f\n", v, PlayerToyInfo[playerid][v][ptPosY]);fwrite(hFile, var);
	    			format(var, 1024, "pt%dPosZ=%.5f\n", v, PlayerToyInfo[playerid][v][ptPosZ]);fwrite(hFile, var);
	    			format(var, 1024, "pt%dRotX=%.5f\n", v, PlayerToyInfo[playerid][v][ptRotX]);fwrite(hFile, var);
	    			format(var, 1024, "pt%dRotY=%.5f\n", v, PlayerToyInfo[playerid][v][ptRotY]);fwrite(hFile, var);
	    			format(var, 1024, "pt%dRotZ=%.5f\n", v, PlayerToyInfo[playerid][v][ptRotZ]);fwrite(hFile, var);
	    			format(var, 1024, "pt%dScaX=%.5f\n", v, PlayerToyInfo[playerid][v][ptScaX]);fwrite(hFile, var);
	    			format(var, 1024, "pt%dScaY=%.5f\n", v, PlayerToyInfo[playerid][v][ptScaY]);fwrite(hFile, var);
	    			format(var, 1024, "pt%dScaZ=%.5f\n", v, PlayerToyInfo[playerid][v][ptScaZ]);fwrite(hFile, var);
	    		}
	    		format(var, 1024, "VIPJoinDate=%s\n",PlayerInfo[playerid][pVIPJoinDate]);fwrite(hFile, var);//vip
				format(var, 1024, "VIPExpDate=%s\n",PlayerInfo[playerid][pVIPExpDate]);fwrite(hFile, var);//vip
				format(var, 1024, "VIPExpTime=%s\n",PlayerInfo[playerid][pVIPExpTime]);fwrite(hFile, var);//vip
	    		format(var, 1024, "VIPInviteDay=%d\n",PlayerInfo[playerid][pVIPInviteDay]);fwrite(hFile, var);
	    		format(var, 1024, "TempVIP=%d\n",PlayerInfo[playerid][pTempVIP]);fwrite(hFile, var);
	    		format(var, 1024, "BuddyInvite=%d\n",PlayerInfo[playerid][pBuddyInvited]);fwrite(hFile, var);
	    		format(var, 1024, "VIPLeft=%d\n",PlayerInfo[playerid][pVIPLeft]);fwrite(hFile, var);
	    		format(var, 1024, "Tokens=%d\n",PlayerInfo[playerid][pTokens]);fwrite(hFile, var);
	    		format(var, 1024, "TriageTime=%d\n",PlayerInfo[playerid][pTriageTime]);fwrite(hFile, var);
	    		format(var, 1024, "jailedBy=%s\n", PlayerInfo[playerid][pJailedBy]);fwrite(hFile, var);
	    		format(var, 1024, "PrisonReason=%s\n", PlayerInfo[playerid][pPrisonReason]);fwrite(hFile, var);
	    		format(var, 1024, "TicketTime=%d\n",PlayerInfo[playerid][pTicketTime]);fwrite(hFile, var);
	    		format(var, 1024, "Screwdriver=%d\n",PlayerInfo[playerid][pScrewdriver]);fwrite(hFile, var);
	    		format(var, 1024, "Tire=%d\n",PlayerInfo[playerid][pTire]);fwrite(hFile, var);
	    		format(var, 1024, "Firstaid=%d\n",PlayerInfo[playerid][pFirstaid]);fwrite(hFile, var);
	    		format(var, 1024, "Rccam=%d\n",PlayerInfo[playerid][pRccam]);fwrite(hFile, var);
	    		format(var, 1024, "Receiver=%d\n",PlayerInfo[playerid][pReceiver]);fwrite(hFile, var);
	    		format(var, 1024, "GPS=%d\n",PlayerInfo[playerid][pGPS]);fwrite(hFile, var);
	    		format(var, 1024, "Sweep=%d\n",PlayerInfo[playerid][pSweep]);fwrite(hFile, var);
	    		format(var, 1024, "SweepLeft=%d\n",PlayerInfo[playerid][pSweepLeft]);fwrite(hFile, var);
	    		format(var, 1024, "Bugged=%d\n",PlayerInfo[playerid][pBugged]);fwrite(hFile, var);
	    		format(var, 1024, "Hospital=%d\n",PlayerInfo[playerid][pHospital]);fwrite(hFile, var);
				format(var, 1024, "TanamanAnggur=%d\n",PlayerInfo[playerid][pTanamanAnggur]);fwrite(hFile, var);
				format(var, 1024, "TanamanBlueberry=%d\n",PlayerInfo[playerid][pTanamanBlueberry]);fwrite(hFile, var);
				format(var, 1024, "TanamanStrawberry=%d\n",PlayerInfo[playerid][pTanamanStrawberry]);fwrite(hFile, var);
				format(var, 1024, "TanamanGandum=%d\n",PlayerInfo[playerid][pTanamanGandum]);fwrite(hFile, var);
				format(var, 1024, "TanamanTomat=%d\n",PlayerInfo[playerid][pTanamanTomat]);fwrite(hFile, var);
				format(var, 1024, "BibitAnggur=%d\n",PlayerInfo[playerid][pBibitAnggur]);fwrite(hFile, var);
				format(var, 1024, "BibitBlueberry=%d\n",PlayerInfo[playerid][pBibitBlueberry]);fwrite(hFile, var);
				format(var, 1024, "BibitStrawberry=%d\n",PlayerInfo[playerid][pBibitStrawberry]);fwrite(hFile, var);
				format(var, 1024, "BibitGandum=%d\n",PlayerInfo[playerid][pBibitGandum]);fwrite(hFile, var);
				format(var, 1024, "BibitTomat=%d\n",PlayerInfo[playerid][pBibitTomat]);fwrite(hFile, var);
				format(var, 1024, "Warrants=%s\n",PlayerInfo[playerid][pWarrant]);fwrite(hFile, var);
				format(var, 1024, "JudgeJailTime=%d\n",PlayerInfo[playerid][pJudgeJailTime]);fwrite(hFile, var);
				format(var, 1024, "JudgeJailType=%d\n",PlayerInfo[playerid][pJudgeJailType]);fwrite(hFile, var);
				format(var, 1024, "BeingSentenced=%d\n",PlayerInfo[playerid][pBeingSentenced]);fwrite(hFile, var);
                format(var, 1024, "ProbationTime=%d\n",PlayerInfo[playerid][pProbationTime]);fwrite(hFile, var);
	    		format(var, 1024, "CallsAccepted=%d\n",PlayerInfo[playerid][pCallsAccepted]);fwrite(hFile, var);
	    		format(var, 1024, "PatientsDelivered=%d\n",PlayerInfo[playerid][pPatientsDelivered]);fwrite(hFile, var);
	    		format(var, 1024, "LiveBanned=%d\n",PlayerInfo[playerid][pLiveBanned]);fwrite(hFile, var);
	    		format(var, 1024, "FreezeBank=%d\n",PlayerInfo[playerid][pFreezeBank]);fwrite(hFile, var);
				format(var, 1024, "Component=%d\n",PlayerInfo[playerid][pComponent]);fwrite(hFile, var);
				format(var, 1024, "BoomBox=%d\n",PlayerInfo[playerid][pBoomBox]);fwrite(hFile, var);
				fclose(hFile);
			}
		}
	}
	return 1;
}

public OnPlayerLogin(playerid, password[])
{
    new string[128];
        format(string, sizeof(string), "%s", GetPlayersName(playerid));
		PlayerTextDrawSetString(playerid, HBEName[playerid], string);
	    TextDrawShowForPlayer(playerid,Time);
		TextDrawShowForPlayer(playerid,Date);
		TextDrawShowForPlayer(playerid,sen);
		TextDrawShowForPlayer(playerid,koma2);
        TextDrawHideForPlayer(playerid, DescriptionText[playerid]);
		if(hungry[playerid] == INVALID_BAR_ID)
		{
			hungry[playerid] = CreateProgressBar(555.00, 404.00, 42.50, 9.19, 16711935, 100.0);
		}
		if(tired[playerid] == INVALID_BAR_ID)
		{
			tired[playerid] = CreateProgressBar(555.00, 437.00, 42.50, 7.19, 16711935, 100.0);
		}
		if(clean[playerid] == INVALID_BAR_ID)
		{
			clean[playerid] = CreateProgressBar(555.00, 421.00, 42.50, 7.19, 16711935, 100.0);
		}
		SetProgressBarValue(hungry[playerid], PlayerInfo[playerid][pHunger]);
		SetProgressBarValue(tired[playerid], PlayerInfo[playerid][pEnergi]);
		SetProgressBarValue(clean[playerid], PlayerInfo[playerid][pBladder]);

		phealth[playerid] = CreateProgressBar(555.00, 362.00, 42.50, 7.19, -16776961, 100.0);
		parmor[playerid] = CreateProgressBar(555.00, 377.00, 42.50, 10.19, -1, 100.0);

		if(IsPlayerNPC(playerid)) //Checks if the player that just spawned is an NPC.
	  	{
			return 1;
	  	}
	  	else
	  	{
		new String2[128], String[10000];
		new playername2[MAX_PLAYER_NAME];
		GetPlayerName(playerid, playername2, sizeof(playername2));
       		//INI_ParseFile(UserPath(playerid), "LoadUser_%s", .bExtra = true, .extra = playerid);
			format(String2, sizeof(String2), "users/%s.ini", playername2);
			new File: UserFile = fopen(String2, io_read);
			if ( UserFile )
			{
				new PassData[256];
				new keytmp[256], valtmp[256];
				fread( UserFile , PassData , sizeof( PassData ) );
				keytmp = ini_GetKey( PassData );
				if( strcmp( keytmp , "Key" , true ) == 0 )
				{
					valtmp = ini_GetValue( PassData );
					strmid(PlayerInfo[playerid][pKey], valtmp, 0, strlen(valtmp)-1, 255);
				}
		   		if( strfind( PlayerInfo[playerid][pKey], "\r", true) != -1)
		   		{
		   		    format(String, sizeof(String), "Warning: \\r found in player %s's password.  Removing now. Password Before: %s", PlayerInfo[playerid][pNormalName], PlayerInfo[playerid][pKey]);
					Log("logs/password.log", String);
					new pos = strfind( PlayerInfo[playerid][pKey], "\r", true);
		   		    strdel(PlayerInfo[playerid][pKey], pos, pos+2);
		   		    format(String, sizeof(String), "%s's Password After: %s  (Note these passwords are encrypted)", PlayerInfo[playerid][pNormalName], PlayerInfo[playerid][pKey]);
					Log("logs/password.log", String);
				}
				//if(strcmp(PlayerInfo[playerid][pKey],password, true ) == 0 )
				if(strcmp(PlayerInfo[playerid][pKey],password,true) == 0)
				{
						new key[ 256 ] , val[ 256 ];
						new Data[ 256 ];
						while ( fread( UserFile , Data , sizeof( Data ) ) )
						{
							key = ini_GetKey( Data );
							if( strcmp( key , "Key" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[playerid][pKey], val, 0, strlen(val)-1, 255); }
                            if( strcmp( key , "AdminOnDuty" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pAdminDuty] = strval( val ); }
							if( strcmp( key , "AdminName" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[playerid][pAdminName], val, 0, strlen(val)-1, 255); }
							if( strcmp( key , "NormalName" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[playerid][pNormalName], val, 0, strlen(val)-1, 255); }
							if( strcmp( key , "VIPName" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[playerid][pVIPName], val, 0, strlen(val)-1, 255); }
		                    if( strcmp( key , "AdminBan" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[playerid][pAdminban], val, 0, strlen(val)-1, 255); }
							if( strcmp( key , "BanReason" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[playerid][pBanReason], val, 0, strlen(val)-1, 255); }
							if( strcmp( key , "BanExpired" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[playerid][pBanExpired], val, 0, strlen(val)-1, 255); }
		                    if( strcmp( key , "BanExpired2" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[playerid][pBanExpired2], val, 0, strlen(val)-1, 255); }
		                    if( strcmp( key , "Accent" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[playerid][pAccent], val, 0, strlen(val)-1, 255); }
		                    if( strcmp( key , "SweeperT" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pSweeperT] = strval( val ); }
		                    if( strcmp( key , "SilincedSkill" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pSilincedSkill] = strval( val ); }
							if( strcmp( key , "DesertEagleSkill" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pDesertEagleSkill] = strval( val ); }
							if( strcmp( key , "RifleSkill" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pRifleSkill] = strval( val ); }
							if( strcmp( key , "ShotgunSkill" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pShotgunSkill] = strval( val ); }
							if( strcmp( key , "SpassSkill" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pSpassSkill] = strval( val ); }
							if( strcmp( key , "MP5Skill" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pMP5Skill] = strval( val ); }
							if( strcmp( key , "AK47Skill" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pAK47Skill] = strval( val ); }
							if( strcmp( key , "M4Skill" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pM4Skill] = strval( val ); }
							if( strcmp( key , "SniperSkill" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pSniperSkill] = strval( val ); }
		                    if( strcmp( key , "TrainingTime" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pTrainingTime] = strval( val ); }
		                    if( strcmp( key , "WSBos" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pWSBos] = strval( val ); }
		                    if( strcmp( key , "DutyTime" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pDutyTime] = strval( val ); }
		                    if( strcmp( key , "LadangBos" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pFarmBos] = strval( val ); }
		                    if( strcmp( key , "Level" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pLevel] = strval( val ); }
							if( strcmp( key , "AdminLevel" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pAdmin] = strval( val ); }
							if( strcmp( key , "Band" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pBanned] = strval( val ); }
							if( strcmp( key , "PermBand" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pPermaBanned] = strval( val ); }
							if( strcmp( key , "Warnings" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pWarns] = strval( val ); }
							if( strcmp( key , "Disabled" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pDisabled] = strval( val ); }
							if( strcmp( key , "DonateRank" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pDonateRank] = strval( val ); }
							if( strcmp( key , "DutyTimeTotal" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pDutyTimeTotal] = strval( val ); }
							if( strcmp( key , "TogReports" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pTogReports] = strval( val ); }
							if( strcmp( key , "Radio" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pRadio] = strval( val ); }
							if( strcmp( key , "RadioFreq" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pRadioFreq] = strval( val ); }
							if( strcmp( key , "Bandage" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pBandage] = strval( val ); }
							if( strcmp( key , "ConnectedTime" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pConnectTime] = strval( val ); }
							if( strcmp( key , "Registered" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pReg] = strval( val ); }
							if( strcmp( key , "Sex" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pSex] = strval( val ); }
							if( strcmp( key , "Lumber" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pLumber] = strval( val ); }
							if( strcmp( key , "Cacing" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pCacing] = strval( val ); }
							if( strcmp( key , "AdminOnDutyTime" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pAdminOnDutyTime] = strval( val ); }
							if( strcmp( key , "PBiskey2" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pPBiskey2] = strval( val ); }
							if( strcmp( key , "PDTime" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pPDTime] = strval( val ); }
							if( strcmp( key , "Hunger" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pHunger] = strval( val ); }
							if( strcmp( key , "Bladder" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pBladder] = strval( val ); }
							if( strcmp( key , "Energi" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pEnergi] = strval( val ); }
							if( strcmp( key , "Condition" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pCondition] = strval( val ); }
							if( strcmp( key , "InBizz" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pInBizz] = strval( val ); }
							if( strcmp( key , "PBiskey" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pPBiskey] = strval( val ); }
		                    if( strcmp( key , "Mask" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pMask] = strval( val ); }
		                    if( strcmp( key , "MaskUse" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pMaskUse] = strval( val ); }
		                    if( strcmp( key , "MaskID" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pMaskID] = strval( val ); }
							if( strcmp( key , "Pancingan" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pPancingan] = strval( val ); }
							if( strcmp( key , "Age" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[playerid][pAge], val, 0, strlen(val)-1, 255); }
							if( strcmp( key , "Paracetamol" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pParacetamol] = strval( val ); }
							if( strcmp( key , "Muted" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pMuted] = strval( val ); }
							if( strcmp( key , "Respect" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pExp] = strval( val ); }
							if( strcmp( key , "Money" , true ) == 0 ) { val = ini_GetValue( Data ); SetPVarInt(playerid, "Cash", strval( val )); }
							if( strcmp( key , "Bank" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pAccount] = strval( val ); }
							if( strcmp( key , "Crimes" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pCrimes] = strval( val ); }
							if( strcmp( key , "Arrested" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pArrested] = strval( val ); }
							if( strcmp( key , "FitnessTimer" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pFitnessTimer] = strval( val ); }
							if( strcmp( key , "Job" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pJob] = strval( val ); }
							if( strcmp( key , "WSJob" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pWSJob] = strval( val ); }
							if( strcmp( key , "FarmJob" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pFarmJob] = strval( val ); }
							if( strcmp( key , "Jerigen" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pJerigen] = strval( val ); }
							if( strcmp( key , "Bensin" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pBensin] = strval( val ); }
							if( strcmp( key , "UseSorry" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pUseSorry] = strval( val ); }
							if( strcmp( key , "Kuli" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pKuli] = strval( val ); }
		                    if( strcmp( key , "Job2" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pJob2] = strval( val ); }
		                    if( strcmp( key , "IllegalJob" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pIllegalJob] = strval( val ); }
							if( strcmp( key , "Paycheck" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pPayCheck] = strval( val ); }
							if( strcmp( key , "Jailed" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pJailed] = strval( val ); }
							if( strcmp( key , "JailTime" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pJailTime] = strval( val ); }
							if( strcmp( key , "WRestricted" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pWRestricted] = strval( val ); }
							if( strcmp( key , "Materials" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pMats] = strval( val ); }
							if( strcmp( key , "Pulsa2" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pPulsa2] = strval( val ); }
							if( strcmp( key , "Packages" , true ) == 0 ) { val = ini_GetValue( Data ); SetPVarInt(playerid, key, strval( val )); }
							if( strcmp( key , "Crates" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pCrates] = strval( val ); }
							if( strcmp( key , "Pot" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pPot] = strval( val ); }
							if( strcmp( key , "Crack" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pCrack] = strval( val ); }
							if( strcmp( key , "Leader" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pLeader] = strval( val ); }
							if( strcmp( key , "Member" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pMember] = strval( val ); }
							if( strcmp( key , "Division" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pDivision] = strval( val ); }
							if( strcmp( key , "FMember" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pFMember] = strval( val ); }
							if( strcmp( key , "Rank" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pRank] = strval( val ); }
							if( strcmp( key , "Amoxicilin" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pAmoxicilin] = strval( val ); }
							if( strcmp( key , "MechSkill" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pMechSkill] = strval( val ); }
							if( strcmp( key , "Ultrafluenza" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pUltrafluenza] = strval( val ); }
							if( strcmp( key , "DrugsSkill" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pTruckingSkill] = strval( val ); }
							if( strcmp( key , "ArmsSkill" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pArmsSkill] = strval( val ); }
							if( strcmp( key , "SmugglerSkill" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pSmugSkill] = strval( val ); }
							if( strcmp( key , "FightingStyle" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pFightStyle] = strval( val ); }
							if( strcmp( key , "pHealth" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pHealth] = floatstr( val ); }
							if( strcmp( key , "pArmor" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pArmor] = floatstr( val ); }
							if( strcmp( key , "pSHealth" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pSHealth] = floatstr( val ); }
							if( strcmp( key , "pGroin" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pBodyCondition][0] = floatstr( val ); }
							if( strcmp( key , "pTorso" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pBodyCondition][1] = floatstr( val ); }
							if( strcmp( key , "pRArm" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pBodyCondition][2] = floatstr( val ); }
							if( strcmp( key , "pLArm" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pBodyCondition][3] = floatstr( val ); }
							if( strcmp( key , "pRLeg" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pBodyCondition][4] = floatstr( val ); }
							if( strcmp( key , "pLLeg" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pBodyCondition][5] = floatstr( val ); }
							//if( strcmp( key , "pSArmor" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pSArmor] = floatstr( val ); }
							if( strcmp( key , "Int" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pInt] = strval( val ); }
							if( strcmp( key , "Local" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pLocal] = strval( val ); }
							if( strcmp( key , "VirtualWorld" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pVW] = strval( val ); }
							if( strcmp( key , "HouseInvite" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pHouseInvite] = strval( val ); }
							if( strcmp( key , "Model" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pModel] = strval( val ); }
							if( strcmp( key , "PhoneNr" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pPnumber] = strval( val ); }
							if( strcmp( key , "FMax" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pFMax] = strval( val ); }
							if( strcmp( key , "FTime" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pFTime] = strval( val ); }
							if( strcmp( key , "pLumberTime" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pLumberTime] = strval( val ); }
							if( strcmp( key , "JTime" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pJTime] = strval( val ); }
							if( strcmp( key , "HaulingTime" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pHaulingTime] = strval( val ); }
							if( strcmp( key , "Phone" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pPhone] = strval( val ); }
							if( strcmp( key , "KartuPerdana" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pKartuPerdana] = strval( val ); }
							if( strcmp( key , "Gate" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pGate] = strval( val ); }
							if( strcmp( key , "Painkiller" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pPainkiller] = strval( val ); }
							if( strcmp( key , "BusTime" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pBusTime] = strval( val ); }
							if( strcmp( key , "BeratIkan" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pBeratIkan] = strval( val ); }
							if( strcmp( key , "Apartment" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pPhousekey] = strval( val ); }
							if( strcmp( key , "Apartment2" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pPhousekey2] = strval( val ); }
							if( strcmp( key , "Renting" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pRenting] = strval( val ); }
							if( strcmp( key , "CarLic" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pCarLic] = strval( val ); }
							if( strcmp( key , "CTime" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pCTime] = strval( val ); }
							if( strcmp( key , "CarLicID" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pCarLicID] = strval( val ); }
							if( strcmp( key , "KTP" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pKTP] = strval( val ); }
							if( strcmp( key , "WorkShop" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pWS] = strval( val ); }
							if( strcmp( key , "Ladang" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pFarm] = strval( val ); }
							if( strcmp( key , "pTruckerLic" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pTruckerLic] = strval( val ); }
							if( strcmp( key , "WSid" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pWSid] = strval( val ); }
							if( strcmp( key , "Farmid" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pFarmid] = strval( val ); }
							if( strcmp( key , "MissionTime" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pMissionsTime] = strval( val ); }
							if( strcmp( key , "KTime" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pKTime] = strval( val ); }
							if( strcmp( key , "pLumberLic" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pLumberLic] = strval( val ); }
							if( strcmp( key , "FlyLic" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pFlyLic] = strval( val ); }
							if( strcmp( key , "BoatLic" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pBoatLic] = strval( val ); }
							if( strcmp( key , "CheckCash" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pCheckCash] = strval( val ); }
							if( strcmp( key , "Checks" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pChecks] = strval( val ); }
							if( strcmp( key , "GunLic" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pGunLic] = strval( val ); }
							for(new s = 0; s < 12; s++)
							{
								format(String, 128, "Gun%d", s);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pGuns][s] = strval( val ); }
								format(String, 128, "GunAmmo%d", s);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pGunsAmmo][s] = strval( val ); }
							}
							if( strcmp( key , "DrugsTime" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pDrugsTime] = strval( val ); }
							if( strcmp( key , "MechTime" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pMechTime] = strval( val ); }
							if( strcmp( key , "PayDay" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pPayDay] = strval( val ); }
							if( strcmp( key , "CDPlayer" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pCDPlayer] = strval( val ); }
							if( strcmp( key , "Dice" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pDice] = strval( val ); }
							if( strcmp( key , "Spraycan" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pSpraycan] = strval( val ); }
							if( strcmp( key , "Rope" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pRope] = strval( val ); }
							if( strcmp( key , "Cigars" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pCigar] = strval( val ); }
							if( strcmp( key , "Sprunk" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pSprunk] = strval( val ); }
							if( strcmp( key , "Wins" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pWins] = strval( val ); }
							if( strcmp( key , "Loses" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pLoses] = strval( val ); }
							if( strcmp( key , "Tutorial" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pTut] = strval( val ); }
							if( strcmp( key , "Tutor" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pTutorial] = strval( val ); }
							if( strcmp( key , "OnDuty" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pDuty] = strval( val ); }
							if( strcmp( key , "Hospital" , true ) == 0 ) { val = ini_GetValue( Data ); SetPVarInt(playerid, key, strval( val )); }
							if( strcmp( key , "Adjustable" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pAdjustable] = strval( val ); }
							if( strcmp( key , "Married" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pMarried] = strval( val ); }
							if( strcmp( key , "MarriedTo" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[playerid][pMarriedTo], val, 0, strlen(val)-1, 255); }
							if( strcmp( key , "IP" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[playerid][pIP], val, 0, strlen(val)-1, 255); }
							if( strcmp( key , "WantedLevel" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pWantedLevel] = strval( val ); }
							if( strcmp( key , "Insurance" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pInsurance] = strval( val ); }
							if( strcmp( key , "Snack" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pSnack] = strval( val ); }
							if( strcmp( key , "MineralWater" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pMineralWater] = strval( val ); }
							if( strcmp( key , "AdMuted" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pADMute] = strval( val ); }
							if( strcmp( key , "AdMutedTotal" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pADMuteTotal] = strval( val ); }
		                    if( strcmp( key , "HelpMute" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pHelpMute] = strval( val ); }
							if( strcmp( key , "SPos_x" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pPos_x] = floatstr( val ); }
							if( strcmp( key , "SPos_y" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pPos_y] = floatstr( val ); }
							if( strcmp( key , "SPos_z" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pPos_z] = floatstr( val ); }
							if( strcmp( key , "SPos_r" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pPos_r] = floatstr( val ); }
							if( strcmp( key , "ReportMuted" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pRMuted] = strval( val ); }
		                    if( strcmp( key , "ReportMutedTotal" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pRMutedTotal] = strval( val ); }
							if( strcmp( key , "ReportMutedTime" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pRMutedTime] = strval( val ); }
							if( strcmp( key , "UsePainkiller" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pUsePainkiller] = strval( val ); }
							if( strcmp( key , "GYMTime" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pGYMTime] = strval( val ); }
							if( strcmp( key , "GiftTime" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pGiftTime] = strval( val ); }
							if( strcmp( key , "AdvisorDutyHours" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pDutyHours] = strval( val ); }
							if( strcmp( key , "AcceptedHelp" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pAcceptedHelp] = strval( val ); }
							if( strcmp( key , "AcceptReport" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pAcceptReport] = strval( val ); }
							if( strcmp( key , "TrashReport" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pTrashReport] = strval( val ); }
		                    if( strcmp( key , "GangWarn" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pGangWarn] = strval( val ); }
							if( strcmp( key , "FactionBanned" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pFactionBanned] = strval( val ); }
							if( strcmp( key , "CSFBanned" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pCSFBanned] = strval( val ); }
							for(new v = 0; v < MAX_PLAYERVEHICLES; v++)
			        		{
								format(String, 128, "pv%dPosX",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[playerid][v][pvPosX] = floatstr( val ); }
								format(String, 128, "pv%dPosY",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[playerid][v][pvPosY] = floatstr( val ); }
								format(String, 128, "pv%dPosZ",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[playerid][v][pvPosZ] = floatstr( val ); }
								format(String, 128, "pv%dPosAngle",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[playerid][v][pvPosAngle] = floatstr( val ); }
								format(String, 128, "pv%dModelId",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[playerid][v][pvModelId] = strval( val ); }
								format(String, 128, "pv%dLock",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[playerid][v][pvLock] = strval( val ); }
								format(String, 128, "pv%dLocked",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[playerid][v][pvLocked] = strval( val ); }
								format(String, 128, "pv%dPaintJob",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[playerid][v][pvPaintJob] = strval( val ); }
								format(String, 128, "pv%dColor1",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[playerid][v][pvColor1] = strval( val ); }
								format(String, 128, "pv%dNeon",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[playerid][v][pvNeon] = strval( val ); }
								format(String, 128, "pv%dColor2",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[playerid][v][pvColor2] = strval( val ); }
								format(String, 128, "pv%dPrice",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[playerid][v][pvPrice] = strval( val ); }
								format(String, 128, "pv%dTicket",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[playerid][v][pvTicket] = strval( val ); }
								format(String, 128, "pv%dWeapon0",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[playerid][v][pvWeapons][0] = strval( val ); }
								format(String, 128, "pv%dWeapon1",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[playerid][v][pvWeapons][1] = strval( val ); }
								format(String, 128, "pv%dWeapon2",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[playerid][v][pvWeapons][2] = strval( val ); }
								format(String, 128, "pv%dWeaponAmmo0",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[playerid][v][pvWeaponsAmmo][0] = strval( val ); }
								format(String, 128, "pv%dWeaponAmmo1",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[playerid][v][pvWeaponsAmmo][1] = strval( val ); }
								format(String, 128, "pv%dWeaponAmmo2",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[playerid][v][pvWeaponsAmmo][2] = strval( val ); }
								format(String, 128, "pv%dWepUpgrade",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[playerid][v][pvWepUpgrade] = strval( val ); }
								format(String, 128, "pv%dFuel",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[playerid][v][pvFuel] = floatstr( val ); }
								format(String, 128, "pv%dHealth",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[playerid][v][pvHealth] = floatstr( val ); }
								format(String, 128, "pv%dInsurances",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[playerid][v][pvInsurances] = strval( val ); }
								format(String, 128, "pv%dMesinUpgrade",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[playerid][v][pvMesinUpgrade] = strval( val ); }
								format(String, 128, "pv%dBodyUpgrade",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[playerid][v][pvBodyUpgrade] = strval( val ); }
								format(String, 128, "pv%dStatus0",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[playerid][v][pvStatus][0] = strval( val ); }
								format(String, 128, "pv%dStatus1",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[playerid][v][pvStatus][1] = strval( val ); }
								format(String, 128, "pv%dStatus2",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[playerid][v][pvStatus][2] = strval( val ); }
								format(String, 128, "pv%dStatus3",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[playerid][v][pvStatus][3] = strval( val ); }
								format(String, 128, "pv%dLicense",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[playerid][v][pvLicense] = strval( val ); }
								format(String, 128, "pv%dLicenseTime",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[playerid][v][pvLicenseTime] = strval( val ); }
								format(String, 128, "pv%dLicenseExpired",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerVehicleInfo[playerid][v][pvLicenseExpired], val, 0, strlen(val)-1, 255); }
								format(String, 128, "pv%dImpound",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[playerid][v][pvImpounded] = strval( val ); }
								format(String, 128, "pv%dStored",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[playerid][v][pvStored] = strval( val ); }
								format(String, 128, "pv%dDestroyed",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[playerid][v][pvDestroyed] = strval( val ); }
								format(String, 128, "pv%dNumPlate",v); //Plate
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerVehicleInfo[playerid][v][pvNumberPlate], val, 0, strlen(val)-1, 255); }
			        		    format(String, 128, "pv%dToyText1", v);
			        		    if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerVehicleInfo[playerid][v][pvToyText1], val, 0, strlen(val)-1, 255); }
			        		    format(String, 128, "pv%dToyText2", v);
			        		    if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerVehicleInfo[playerid][v][pvToyText2], val, 0, strlen(val)-1, 255); }
			        		    format(String, 128, "pv%dToyText3", v);
			        		    if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerVehicleInfo[playerid][v][pvToyText3], val, 0, strlen(val)-1, 255); }
			        		    format(String, 128, "pv%dToyText4", v);
			        		    if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerVehicleInfo[playerid][v][pvToyText4], val, 0, strlen(val)-1, 255); }
			        		    format(String, 128, "pv%dToyText5", v);
			        		    if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerVehicleInfo[playerid][v][pvToyText5], val, 0, strlen(val)-1, 255); }
			        		    format(String, 128, "pv%dToyText6", v);
			        		    if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerVehicleInfo[playerid][v][pvToyText6], val, 0, strlen(val)-1, 255); }
			        		    format(String, 128, "pv%dToyText7", v);
			        		    if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerVehicleInfo[playerid][v][pvToyText7], val, 0, strlen(val)-1, 255); }
			        		    format(String, 128, "pv%dToyText8", v);
			        		    if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerVehicleInfo[playerid][v][pvToyText8], val, 0, strlen(val)-1, 255); }
			        		    format(String, 128, "pv%dToyText9", v);
			        		    if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerVehicleInfo[playerid][v][pvToyText9], val, 0, strlen(val)-1, 255); }
			        		    format(String, 128, "pv%dToyText10", v);
			        		    if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerVehicleInfo[playerid][v][pvToyText10], val, 0, strlen(val)-1, 255); }
			        		    format(String, 128, "pv%dToyTextCol1", v);
			        		    if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[playerid][v][pvToyTextCol1] = strval( val ); }
			        		    format(String, 128, "pv%dToyTextCol2", v);
			        		    if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[playerid][v][pvToyTextCol2] = strval( val ); }
			        		    format(String, 128, "pv%dToyTextCol3", v);
			        		    if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[playerid][v][pvToyTextCol3] = strval( val ); }
			        		    format(String, 128, "pv%dToyTextCol4", v);
			        		    if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[playerid][v][pvToyTextCol4] = strval( val ); }
			        		    format(String, 128, "pv%dToyTextCol5", v);
			        		    if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[playerid][v][pvToyTextCol5] = strval( val ); }
			        		    format(String, 128, "pv%dToyTextCol6", v);
			        		    if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[playerid][v][pvToyTextCol6] = strval( val ); }
			        		    format(String, 128, "pv%dToyTextCol7", v);
			        		    if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[playerid][v][pvToyTextCol7] = strval( val ); }
			        		    format(String, 128, "pv%dToyTextCol8", v);
			        		    if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[playerid][v][pvToyTextCol8] = strval( val ); }
			        		    format(String, 128, "pv%dToyTextCol9", v);
			        		    if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[playerid][v][pvToyTextCol9] = strval( val ); }
			        		    format(String, 128, "pv%dToyTextCol10", v);
			        		    if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[playerid][v][pvToyTextCol10] = strval( val ); }
			        		    format(String, 128, "pv%dToyTextSize1", v);
			        		    if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[playerid][v][pvToyTextSize1] = strval( val ); }
			        		    format(String, 128, "pv%dToyTextSize2", v);
			        		    if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[playerid][v][pvToyTextSize2] = strval( val ); }
			        		    format(String, 128, "pv%dToyTextSize3", v);
			        		    if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[playerid][v][pvToyTextSize3] = strval( val ); }
			        		    format(String, 128, "pv%dToyTextSize4", v);
			        		    if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[playerid][v][pvToyTextSize4] = strval( val ); }
			        		    format(String, 128, "pv%dToyTextSize5", v);
			        		    if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[playerid][v][pvToyTextSize5] = strval( val ); }
			        		    format(String, 128, "pv%dToyTextSize6", v);
			        		    if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[playerid][v][pvToyTextSize6] = strval( val ); }
			        		    format(String, 128, "pv%dToyTextSize7", v);
			        		    if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[playerid][v][pvToyTextSize7] = strval( val ); }
			        		    format(String, 128, "pv%dToyTextSize8", v);
			        		    if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[playerid][v][pvToyTextSize8] = strval( val ); }
			        		    format(String, 128, "pv%dToyTextSize9", v);
			        		    if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[playerid][v][pvToyTextSize9] = strval( val ); }
			        		    format(String, 128, "pv%dToyTextSize10", v);
			        		    if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[playerid][v][pvToyTextSize10] = strval( val ); }
			        		    format(String, 128, "pv%dToyTextID1", v);
			        		    if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[playerid][v][pvToyTextID1] = strval( val ); }
			        		    format(String, 128, "pv%dToyTextID2", v);
			        		    if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[playerid][v][pvToyTextID2] = strval( val ); }
			        		    format(String, 128, "pv%dToyTextID3", v);
			        		    if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[playerid][v][pvToyTextID3] = strval( val ); }
			        		    format(String, 128, "pv%dToyTextID4", v);
			        		    if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[playerid][v][pvToyTextID4] = strval( val ); }
			        		    format(String, 128, "pv%dToyTextID5", v);
			        		    if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[playerid][v][pvToyTextID5] = strval( val ); }
			        		    format(String, 128, "pv%dToyTextID6", v);
			        		    if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[playerid][v][pvToyTextID6] = strval( val ); }
			        		    format(String, 128, "pv%dToyTextID7", v);
			        		    if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[playerid][v][pvToyTextID7] = strval( val ); }
			        		    format(String, 128, "pv%dToyTextID8", v);
			        		    if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[playerid][v][pvToyTextID8] = strval( val ); }
			        		    format(String, 128, "pv%dToyTextID9", v);
			        		    if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[playerid][v][pvToyTextID9] = strval( val ); }
			        		    format(String, 128, "pv%dToyTextID10", v);
			        		    if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[playerid][v][pvToyTextID10] = strval( val ); }
								//if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); strcpy(PlayerVehicleInfo[playerid][v][pvNumberPlate], Data, 32); } //PlayerVehicleInfo[playerid][v][pvNumberPlate] = floatstr( val ); }
								for(new m = 0; m < MAX_MODS; m++)
			            		{
		                		    format(String, 128, "pv%dMod%d", v, m);
		            		        if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[playerid][v][pvMods][m] = strval( val ); }
			        		    }
			        		    for(new vt = 0; vt < MAX_OBJECTS_PER_PLAYER; vt++)
			        		    {
			        		        format(String, 128, "pv%dToyID%d", v, vt);
			        		        if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[playerid][v][pvToyID][vt] = strval( val ); }
			        		        format(String, 128, "pv%dToyPosX%d", v, vt);
			        		        if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[playerid][v][pvToyPosX][vt] = floatstr( val ); }
			        		        format(String, 128, "pv%dToyPosY%d", v, vt);
			        		        if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[playerid][v][pvToyPosY][vt] = floatstr( val ); }
			        		        format(String, 128, "pv%dToyPosZ%d", v, vt);
			        		        if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[playerid][v][pvToyPosZ][vt] = floatstr( val ); }
			        		        format(String, 128, "pv%dToyRotX%d", v, vt);
			        		        if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[playerid][v][pvToyRotX][vt] = floatstr( val ); }
			        		        format(String, 128, "pv%dToyRotY%d", v, vt);
			        		        if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[playerid][v][pvToyRotY][vt] = floatstr( val ); }
			        		        format(String, 128, "pv%dToyRotZ%d", v, vt);
			        		        if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[playerid][v][pvToyRotZ][vt] = floatstr( val ); }
			        		        format(String, 128, "pv%dToyColor%d", v, vt);
			        		        if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[playerid][v][pvToyColor][vt] = strval( val ); }
			        		        format(String, 128, "pv%dToyIndex%d", v, vt);
			        		        if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[playerid][v][pvToyIndex][vt] = strval( val ); }
			        		        format(String, 128, "pv%dToyTexture1%d", v, vt);
			        		        if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[playerid][v][pvToyTexture1][vt] = strval( val ); }
			        		        format(String, 128, "pv%dToyTexture2%d", v, vt);
			        		        if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[playerid][v][pvToyTexture2][vt] = strval( val ); }
			        		        format(String, 128, "pv%dToyTextureID%d", v, vt);
			        		        if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[playerid][v][pvToyTextureID][vt] = strval( val ); }
								}
  		    			      //format(String, 128, "pv%dAllowedPlayer",v);
			        		    //if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerVehicleInfo[playerid][v][pvAllowPlayer], val, 0, strlen(val)-1, 255); }
		 					}
		 					if( strcmp( key , "prTax", true ) == 0 ) { val = ini_GetValue( Data ); PlayerRentInfo[playerid][prTax] = strval( val ); }
		 					if( strcmp( key , "prRentTime", true ) == 0 ) { val = ini_GetValue( Data ); PlayerRentInfo[playerid][prRentTime] = strval( val ); }
		 					if( strcmp( key , "prVehicleRent", true ) == 0 ) { val = ini_GetValue( Data ); PlayerRentInfo[playerid][prVehicleRent] = strval( val ); }
		 					if( strcmp( key , "prModelId", true ) == 0 ) { val = ini_GetValue( Data ); PlayerRentInfo[playerid][prModelId] = strval( val ); }
		 					if( strcmp( key , "prPosX", true ) == 0 ) { val = ini_GetValue( Data ); PlayerRentInfo[playerid][prPosX] = floatstr( val ); }
		 					if( strcmp( key , "prPosY", true ) == 0 ) { val = ini_GetValue( Data ); PlayerRentInfo[playerid][prPosY] = floatstr( val ); }
		 					if( strcmp( key , "prPosZ", true ) == 0 ) { val = ini_GetValue( Data ); PlayerRentInfo[playerid][prPosZ] = floatstr( val ); }
		 					if( strcmp( key , "prPosAngle", true ) == 0 ) { val = ini_GetValue( Data ); PlayerRentInfo[playerid][prPosAngle] = floatstr( val ); }
		 					if( strcmp( key , "prColor1", true ) == 0 ) { val = ini_GetValue( Data ); PlayerRentInfo[playerid][prColor1] = strval( val ); }
		 					if( strcmp( key , "prColor2", true ) == 0 ) { val = ini_GetValue( Data ); PlayerRentInfo[playerid][prColor2] = strval( val ); }
		 					if( strcmp( key , "prLock", true ) == 0 ) { val = ini_GetValue( Data ); PlayerRentInfo[playerid][prLock] = strval( val ); }
		 					if( strcmp( key , "prLocked", true ) == 0 ) { val = ini_GetValue( Data ); PlayerRentInfo[playerid][prLocked] = strval( val ); }
		 					if( strcmp( key , "prTicket", true ) == 0 ) { val = ini_GetValue( Data ); PlayerRentInfo[playerid][prTicket] = strval( val ); }
		 					if( strcmp( key , "prFuel", true ) == 0 ) { val = ini_GetValue( Data ); PlayerRentInfo[playerid][prFuel] = strval( val ); }
		 					if( strcmp( key , "prHealth", true ) == 0 ) { val = ini_GetValue( Data ); PlayerRentInfo[playerid][prHealth] = floatstr( val ); }
		 					if( strcmp( key , "prStatus0", true ) == 0 ) { val = ini_GetValue( Data ); PlayerRentInfo[playerid][prStatus][0] = strval( val ); }
		 					if( strcmp( key , "prStatus1", true ) == 0 ) { val = ini_GetValue( Data ); PlayerRentInfo[playerid][prStatus][1] = strval( val ); }
		 					if( strcmp( key , "prStatus2", true ) == 0 ) { val = ini_GetValue( Data ); PlayerRentInfo[playerid][prStatus][2] = strval( val ); }
		 					if( strcmp( key , "prStatus3", true ) == 0 ) { val = ini_GetValue( Data ); PlayerRentInfo[playerid][prStatus][3] = strval( val ); }
		            		for(new v = 0; v < MAX_PLAYERTOYS; v++)
			        		{
			        		    format(String, 128, "pt%dModelID",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerToyInfo[playerid][v][ptModelID] = strval( val ); }
								format(String, 128, "pt%dBone",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerToyInfo[playerid][v][ptBone] = strval( val ); }
								format(String, 128, "pt%dPosX",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerToyInfo[playerid][v][ptPosX] = floatstr( val ); }
								format(String, 128, "pt%dPosY",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerToyInfo[playerid][v][ptPosY] = floatstr( val ); }
								format(String, 128, "pt%dPosZ",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerToyInfo[playerid][v][ptPosZ] = floatstr( val ); }
								format(String, 128, "pt%dRotX",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerToyInfo[playerid][v][ptRotX] = floatstr( val ); }
								format(String, 128, "pt%dRotY",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerToyInfo[playerid][v][ptRotY] = floatstr( val ); }
								format(String, 128, "pt%dRotZ",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerToyInfo[playerid][v][ptRotZ] = floatstr( val ); }
								format(String, 128, "pt%dScaX",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerToyInfo[playerid][v][ptScaX] = floatstr( val ); }
								format(String, 128, "pt%dScaY",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerToyInfo[playerid][v][ptScaY] = floatstr( val ); }
								format(String, 128, "pt%dScaZ",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerToyInfo[playerid][v][ptScaZ] = floatstr( val ); }
							}
							if( strcmp( key , "VIPJoinDate" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[playerid][pVIPJoinDate], val, 0, strlen(val)-1, 255); }//vip
		                	if( strcmp( key , "VIPExpDate" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[playerid][pVIPExpDate], val, 0, strlen(val)-1, 255); }//vip
		                	if( strcmp( key , "VIPExpTime" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[playerid][pVIPExpTime], val, 0, strlen(val)-1, 255); }//vip
		            		if( strcmp( key , "VIPInviteDay" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pVIPInviteDay] = strval( val ); }
		            		if( strcmp( key , "TempVIP" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pTempVIP] = strval( val ); }
		            		if( strcmp( key , "BuddyInvite" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pBuddyInvited] = strval( val ); }
		           		 	if( strcmp( key , "VIPLeft" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pVIPLeft] = strval( val ); }
		            		if( strcmp( key , "Tokens" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pTokens] = strval( val ); }
		            		if( strcmp( key , "TriageTime" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pTriageTime] = strval( val ); }
		            		if( strcmp( key, "jailedBy", true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[playerid][pJailedBy], val, 0, strlen(val)-1, 255); }
		            		if( strcmp( key, "PrisonReason", true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[playerid][pPrisonReason], val, 0, strlen(val)-1, 255); }
		            		if( strcmp( key , "TicketTime" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pTicketTime] = strval( val ); }
		            		if( strcmp( key , "Screwdriver" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pScrewdriver] = strval( val ); }
		            		if( strcmp( key , "Tire" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pTire] = strval( val ); }
		            		if( strcmp( key , "Firstaid" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pFirstaid] = strval( val ); }
		            		if( strcmp( key , "Rccam" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pRccam] = strval( val ); }
							if( strcmp( key , "Receiver" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pReceiver] = strval( val ); }
							if( strcmp( key , "GPS" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pGPS] = strval( val ); }
							if( strcmp( key , "Sweep" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pSweep] = strval( val ); }
							if( strcmp( key , "SweepLeft" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pSweepLeft] = strval( val ); }
							if( strcmp( key , "Bugged" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pBugged] = strval( val ); }
							if( strcmp( key , "Hospital" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pHospital] = strval( val ); }
							if( strcmp( key , "TanamanAnggur" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pTanamanAnggur] = strval( val ); }
							if( strcmp( key , "TanamanBlueberry" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pTanamanBlueberry] = strval( val ); }
							if( strcmp( key , "TanamanStrawberry" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pTanamanStrawberry] = strval( val ); }
							if( strcmp( key , "TanamanGandum" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pTanamanGandum] = strval( val ); }
							if( strcmp( key , "TanamanTomat" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pTanamanTomat] = strval( val ); }
							if( strcmp( key , "BibitAnggur" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pBibitAnggur] = strval( val ); }
							if( strcmp( key , "BibitBlueberry" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pBibitBlueberry] = strval( val ); }
							if( strcmp( key , "BibitStrawberry" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pBibitStrawberry] = strval( val ); }
							if( strcmp( key , "BibitGandum" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pBibitGandum] = strval( val ); }
							if( strcmp( key , "BibitTomat" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pBibitTomat] = strval( val ); }
							if( strcmp( key , "Warrants" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[playerid][pWarrant], val, 0, strlen(val)-1, 255); }
							if( strcmp( key , "JudgeJailTime" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pJudgeJailTime] = strval( val ); }
							if( strcmp( key , "JudgeJailType" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pJudgeJailType] = strval( val ); }
		                    if( strcmp( key , "BeingSentenced" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pBeingSentenced] = strval( val ); }
		                    if( strcmp( key , "ProbationTime" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pProbationTime] = strval( val ); }
							if( strcmp( key , "CallsAccepted" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pCallsAccepted] = strval( val ); }
							if( strcmp( key , "PatientsDelivered" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pPatientsDelivered] = strval( val ); }
							if( strcmp( key , "LiveBanned" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pLiveBanned] = strval( val ); }
							if( strcmp( key , "FreezeBank" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pFreezeBank] = strval( val ); }
							if( strcmp( key , "Component" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pComponent] = strval( val ); }
							if( strcmp( key , "BoomBox" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pBoomBox] = strval( val ); }
							}//end while
						fclose(UserFile);//close the file after everything has been read in the while*/
				}
		else
		{
			ShowMainMenuDialog(playerid, 3);
			gPlayerLogTries[playerid] += 1;
			if(gPlayerLogTries[playerid] == 2) { SendClientMessageEx(playerid, COLOR_RED, "SERVER: Wrong password, you have been kicked out automatically."); Kick(playerid); }
			return 1;
		}
		PlayerInfo[playerid][pAdjustable] = 0;
		ResetPlayerMoney(playerid);
		CurrentMoney[playerid] = GetPVarInt(playerid, "Cash");
		TotalLogin++;

		//Welcome Message
		new kota[1401];
		GetPlayerCity(playerid, kota, sizeof(kota));
		format(String, sizeof(String), "* {FF0000}%s {FFFF00}telah terkoneksi ke server. (%s)", PlayerInfo[playerid][pNormalName], kota);
	 	SendClientMessageToAll(COLOR_YELLOW,String);
        format(String, sizeof(String), "SERVER: {FFFFFF}Selamat Datang {00FF00}%s", PlayerInfo[playerid][pNormalName]);   //memek
	 	SendClientMessageEx(playerid, COLOR_TWAQUA,String);
 	//	PlayerTextDrawHide(playerid, HBEO[playerid]);
	 	PlayerTextDrawSetPreviewModel(playerid, HBEO[playerid], GetPlayerSkin(playerid));
	 	PlayerTextDrawShow(playerid, HBEO[playerid]);
	 	if(PlayerInfo[playerid][pBanned] >= 1 )
		{
			new string1[10000], adminban[MAX_PLAYER_NAME];
			strmid(adminban, PlayerInfo[MAX_PLAYER_NAME][pAdminban], 0, strlen(PlayerInfo[MAX_PLAYER_NAME][pAdminban]), 255);
		 	format(string1, sizeof(string1), "{ffffff}Account: {FF0000}%s{FFFFFF}\nIP: {FF0000}null{FFFFFF}\nDi banned oleh Admin: {FF0000}%s{FFFFFF}\nAlasan: {FF0000}%s{FFFFFF}\nPada: {FF0000}Waktu: %s | Tanggal: %s\n\n{FFFFFF}Silahkan Ambil Screenshoot dengan cara menekan F8/Prt scrn{FFFFFF}\nDan Post di Forum Kami.",PlayerInfo[playerid][pNormalName],PlayerInfo[playerid][pAdminban],PlayerInfo[playerid][pBanReason],PlayerInfo[playerid][pBanExpired],PlayerInfo[playerid][pBanExpired2]);
			ShowPlayerDialog(playerid,BAN_DIALOG,DIALOG_STYLE_MSGBOX,"{FF0000}Banned",string1,"Ok :(","");
			SendClientMessageEx(playerid, RED, "WARNING: You are banned from this server.");
			FixedKick(playerid);
			return 1;
		}
				if(PlayerInfo[playerid][pDonateRank] > 0 && PlayerInfo[playerid][pVIPLeft] < 1) { //autovip
				new days,expTime[128];
				ConvertTime(gettime() - PlayerInfo[playerid][pVIPJoinDate], .ctd=days);
				if (days >= PlayerInfo[playerid][pVIPLeft])
				{
					PlayerInfo[playerid][pDonateRank] = 0;
					PlayerInfo[playerid][pVIPJoinDate] = 0;
					PlayerInfo[playerid][pVIPLeft] = 0;
					format(PlayerInfo[playerid][pVIPExpDate],32,"null");
					SendClientMessageEx(playerid, COLOR_VIP, "Donater anda telah habis hari ini, untuk menjadi Donater lagi, silahkan berdonasi :)");
				}
				else
				{
    			format(expTime,sizeof(expTime),"Status Donater : aktif\n");
       			format(expTime,sizeof(expTime),"%s Terima kasih sudah berdonasi di Indonation Roleplay\n",expTime,PlayerInfo[playerid][pVIPExpDate]);
          		format(expTime,sizeof(expTime),"%s Donater anda akan berakhir pada : %s",expTime,PlayerInfo[playerid][pVIPExpDate]);


					SendClientMessageEx(playerid, COLOR_VIP, expTime);
				}
				}
				else if(PlayerInfo[playerid][pDonateRank] > 0 && PlayerInfo[playerid][pVIPLeft] == 99999){
				SendClientMessageEx(playerid, COLOR_VIP, "Status Donater : Permanent");
				SendClientMessageEx(playerid, COLOR_VIP, "Terima kasih sudah berdonasi di Indonation Roleplay");

			}
			if(PlayerInfo[playerid][pDonateRank] > 0 && PlayerInfo[playerid][pVIPLeft] < 1) { //autovip
					new days;
					ConvertTime(gettime() - PlayerInfo[playerid][pVIPJoinDate], .ctd=days);
					if (days >= PlayerInfo[playerid][pVIPLeft]) {
						PlayerInfo[playerid][pDonateRank] = 0;
						PlayerInfo[playerid][pVIPJoinDate] = 0;
						PlayerInfo[playerid][pVIPLeft] = 0;
						format(PlayerInfo[playerid][pVIPExpDate],32,"null");
						SendClientMessageEx(playerid, COLOR_VIP, "Donater anda telah habis hari ini, untuk menjadi Donater lagi, silahkan berdonasi kembali");
					}
				}
		if(PlayerInfo[playerid][pAdmin] >= 1)
	 	{
	 	    format(String, sizeof(String), "STAFFLOGIN: {FFFF00}[id:%d] %s %s (%s) telah terkoneksi ke server.", playerid, RAN(playerid), PlayerInfo[playerid][pAdminName], PlayerInfo[playerid][pNormalName]);
	 		ABroadCast(COLOR_ARWIN, String, 1);
		}
		AdminReadPm[playerid] = false;
		GetPlayerIp(playerid, PlayerInfo[playerid][pIP], 32);
		SetPlayerScore(playerid, PlayerInfo[playerid][pLevel]);
		if(PlayerInfo[playerid][pReg] == 0)
		{
			PlayerInfo[playerid][pLevel] = 1;
			PlayerInfo[playerid][pConnectTime] = 1;
			PlayerInfo[playerid][pSHealth] = 0.0;
			PlayerInfo[playerid][pSArmor] = 0.0;
			PlayerInfo[playerid][pHealth] = 100.0;
			PlayerInfo[playerid][pLocal] = 255;
			PlayerInfo[playerid][pTeam] = 3;
			PlayerInfo[playerid][pPnumber] = 0;
			PlayerInfo[playerid][pPulsa2] = 0;
			PlayerInfo[playerid][pFMax] = 0;
			PlayerInfo[playerid][pFTime] = 0;
			PlayerInfo[playerid][pLumberTime] = 0;
			PlayerInfo[playerid][pPDTime] = 3600;
			PlayerInfo[playerid][pPBiskey2] = 0;
			PlayerInfo[playerid][pJTime] = 0;
			PlayerInfo[playerid][pHaulingTime] = 0;
			PlayerInfo[playerid][pBusTime] = 0;
			PlayerInfo[playerid][pTrainingTime] = 0;
			PlayerInfo[playerid][pBeratIkan] = 0;
			PlayerInfo[playerid][pPhousekey] = INVALID_HOUSE_ID;
			PlayerInfo[playerid][pPhousekey2] = INVALID_HOUSE_ID;
			PlayerInfo[playerid][pReg] = 1;
			PlayerInfo[playerid][pHunger] = 99;
			PlayerInfo[playerid][pBladder] = 99;
			PlayerInfo[playerid][pEnergi] = 99;
			PlayerInfo[playerid][pCondition] = 99;
			PlayerInfo[playerid][pJerigen] = 0;
			PlayerInfo[playerid][pKuli] = 0;
			PlayerInfo[playerid][pAccount] = 5000;
			PlayerInfo[playerid][pComponent] = 0;
			PlayerInfo[playerid][pBoomBox] = 0;
			PlayerInfo[playerid][pSilincedSkill] = 1;
		  	PlayerInfo[playerid][pDesertEagleSkill] = 1;
		  	PlayerInfo[playerid][pShotgunSkill] = 1;
		   	PlayerInfo[playerid][pSpassSkill] = 1;
		    PlayerInfo[playerid][pMP5Skill] = 1;
		    PlayerInfo[playerid][pAK47Skill] = 1;
		    PlayerInfo[playerid][pM4Skill] = 1;
		    PlayerInfo[playerid][pSniperSkill] = 1;
			GivePlayerCash(playerid, 2500);
		}
		SetPlayerSkillLevel(playerid, WEAPONSKILL_PISTOL_SILENCED, PlayerInfo[playerid][pSilincedSkill] * 100);
	  	SetPlayerSkillLevel(playerid, WEAPONSKILL_DESERT_EAGLE, PlayerInfo[playerid][pDesertEagleSkill]* 100);
	  	SetPlayerSkillLevel(playerid, WEAPONSKILL_SHOTGUN, PlayerInfo[playerid][pShotgunSkill]* 100);
	   	SetPlayerSkillLevel(playerid, WEAPONSKILL_SPAS12_SHOTGUN, PlayerInfo[playerid][pSpassSkill]* 100);
	    SetPlayerSkillLevel(playerid, WEAPONSKILL_MP5, PlayerInfo[playerid][pMP5Skill]* 100);
	    SetPlayerSkillLevel(playerid, WEAPONSKILL_AK47, PlayerInfo[playerid][pAK47Skill]* 100);
	    SetPlayerSkillLevel(playerid, WEAPONSKILL_M4, PlayerInfo[playerid][pM4Skill]* 100);
	    SetPlayerSkillLevel(playerid, WEAPONSKILL_SNIPERRIFLE, PlayerInfo[playerid][pSniperSkill]* 100);
		if(PlayerInfo[playerid][pHospital] == 1)
		{
		    PlayerInfo[playerid][pHospital] = 0;
		    SetPVarInt(playerid, "MedicBill", 1);
		}
		if(PlayerInfo[playerid][pDisabled] != 0)
		{
            SendClientMessageEx(playerid, RED, "WARNING: Your account has been disabled.");
		    Kick(playerid);
		    return 1;
		}
		if(PlayerInfo[playerid][pPDTime] <= 0) { SendClientMessageEx(playerid,COLOR_YELLOW,"PAYCHECK: Pergi ke bank dan /signcheck untuk mendapatkan paycheck anda atau pergi ke salah satu ATM!"); }
		printf("%s has logged in.",playername2);
        PlayerPlaySound(playerid, 1186, 0, 0, 0);
		SetSpawnInfo(playerid, 0, PlayerInfo[playerid][pModel], PlayerInfo[playerid][pPos_x], PlayerInfo[playerid][pPos_y], PlayerInfo[playerid][pPos_z], 0, 0, 0, 0, 0, 0, 0);
		SkinDelay(playerid);

		if(PlayerInfo[playerid][pInt] > 0 || PlayerInfo[playerid][pVW] > 0)
		{
		    TogglePlayerControllable(playerid, 0);
  			GameTextForPlayer(playerid, "Objects loading...", 4000, 5);
	    	SetPVarInt(playerid, "LoadingObjects", 1);
		    SetTimerEx("SafeLoadObjects", 4000, 0, "d", playerid);
	    }
		if(gTeam[playerid] == 0)
		{
			gTeam[playerid] = 3;
		}
		else
		{
			gTeam[playerid] = PlayerInfo[playerid][pTeam];
		}
		gPlayerLogged{playerid} = 1;
		SetPVarInt(playerid, "MedicBill", 0);
		SpawnPlayer(playerid);
		new MOTD1[10000];
		format(MOTD1, sizeof(MOTD1), "{C6E2FF}MOTD:{F7FF00} %s", GlobalMOTD);
		SendClientMessageEx(playerid, COLOR_GREY, MOTD1);
		if(PlayerInfo[playerid][pAdmin] >= 2)
		{
			format(MOTD1, sizeof(MOTD1), "STAFF MOTD:{FFFFFF} %s", AdminMOTD);
			SendClientMessageEx(playerid, COLOR_REALRED, MOTD1);
		}
		SetPlayerFightingStyle(playerid, PlayerInfo[playerid][pFightStyle]);
		LoadPlayerVehicles(playerid);
		SetPlayerToTeamColor(playerid);
		new tmp2[128];
		if(PlayerInfo[playerid][pFMember] < 255)
		{
			format(tmp2, sizeof(tmp2), "FAMILY: {FFFF00}%s.", FamilyInfo[PlayerInfo[playerid][pFMember]][FamilyMOTD]);
			SendClientMessageEx(playerid, COLOR_ARWIN, tmp2);
		}
	 	new hcheck, hcheck2, name[MAX_PLAYER_NAME];
 		hcheck = INVALID_HOUSE_ID;
		hcheck2 = INVALID_HOUSE_ID;
		GetPlayerName(playerid, name, sizeof(name));
		for(new i = 0; i < MAX_HOUSES; i++)
		{
	  		if(!strcmp(name, HouseInfo[i][hOwner], false))
	   		{
	   		    if(hcheck != INVALID_HOUSE_ID)
	   		    {
	   		        hcheck2 = i;
				}
				else
				{
					hcheck = i;
				}
    		}
		}
		if(hcheck != INVALID_HOUSE_ID)
	   	{
     		PlayerInfo[playerid][pPhousekey] = hcheck;
		}
		if(hcheck2 != INVALID_HOUSE_ID)
	   	{
     		PlayerInfo[playerid][pPhousekey2] = hcheck2;
		}
		if(hcheck == INVALID_HOUSE_ID)
		{
			PlayerInfo[playerid][pPhousekey] = INVALID_HOUSE_ID;
			return 1;
		}
		if(hcheck2 == INVALID_HOUSE_ID)
		{
			PlayerInfo[playerid][pPhousekey2] = INVALID_HOUSE_ID;
			return 1;
		}
 	}
	return 1;
  }
}

public OnPlayerOfflineLogin(playername[])
{
	new String[64];
	format(String, sizeof(String), "users/%s.ini", playername);
	new File: UserFile = fopen(String, io_read);
	//printf("[DEBUG] OnPlayerOfflineLogin: String2 (%s) | MAX_PLAYERS (%d)", String2, MAX_PLAYERS);
	if ( UserFile )
	{
     new key[ 256 ] , val[ 256 ];
						new Data[ 256 ];
						while ( fread( UserFile , Data , sizeof( Data ) ) )
						{
							key = ini_GetKey( Data );
							if( strcmp( key , "Key" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[MAX_PLAYERS][pKey], val, 0, strlen(val)-1, 255); }
                            if( strcmp( key , "AdminOnDuty" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pAdminDuty] = strval( val ); }
							if( strcmp( key , "AdminName" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[MAX_PLAYERS][pAdminName], val, 0, strlen(val)-1, 255); }
							if( strcmp( key , "NormalName" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[MAX_PLAYERS][pNormalName], val, 0, strlen(val)-1, 255); }
							if( strcmp( key , "VIPName" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[MAX_PLAYERS][pVIPName], val, 0, strlen(val)-1, 255); }
		                    if( strcmp( key , "AdminBan" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[MAX_PLAYERS][pAdminban], val, 0, strlen(val)-1, 255); }
							if( strcmp( key , "BanReason" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[MAX_PLAYERS][pBanReason], val, 0, strlen(val)-1, 255); }
							if( strcmp( key , "BanExpired" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[MAX_PLAYERS][pBanExpired], val, 0, strlen(val)-1, 255); }
		                    if( strcmp( key , "BanExpired2" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[MAX_PLAYERS][pBanExpired2], val, 0, strlen(val)-1, 255); }
		                    if( strcmp( key , "Accent" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[MAX_PLAYERS][pAccent], val, 0, strlen(val)-1, 255); }
		                    if( strcmp( key , "SweeperT" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pSweeperT] = strval( val ); }
		                    if( strcmp( key , "SilincedSkill" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pSilincedSkill] = strval( val ); }
							if( strcmp( key , "DesertEagleSkill" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pDesertEagleSkill] = strval( val ); }
							if( strcmp( key , "RifleSkill" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pRifleSkill] = strval( val ); }
							if( strcmp( key , "ShotgunSkill" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pShotgunSkill] = strval( val ); }
							if( strcmp( key , "SpassSkill" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pSpassSkill] = strval( val ); }
							if( strcmp( key , "MP5Skill" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pMP5Skill] = strval( val ); }
							if( strcmp( key , "AK47Skill" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pAK47Skill] = strval( val ); }
							if( strcmp( key , "M4Skill" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pM4Skill] = strval( val ); }
							if( strcmp( key , "SniperSkill" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pSniperSkill] = strval( val ); }
		                    if( strcmp( key , "TrainingTime" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pTrainingTime] = strval( val ); }
		                    if( strcmp( key , "WSBos" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pWSBos] = strval( val ); }
		                    if( strcmp( key , "DutyTime" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pDutyTime] = strval( val ); }
		                    if( strcmp( key , "LadangBos" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pFarmBos] = strval( val ); }
		                    if( strcmp( key , "Level" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pLevel] = strval( val ); }
							if( strcmp( key , "AdminLevel" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pAdmin] = strval( val ); }
							if( strcmp( key , "Band" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pBanned] = strval( val ); }
							if( strcmp( key , "PermBand" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pPermaBanned] = strval( val ); }
							if( strcmp( key , "Warnings" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pWarns] = strval( val ); }
							if( strcmp( key , "Disabled" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pDisabled] = strval( val ); }
							if( strcmp( key , "DonateRank" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pDonateRank] = strval( val ); }
							if( strcmp( key , "DutyTimeTotal" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pDutyTimeTotal] = strval( val ); }
							if( strcmp( key , "TogReports" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pTogReports] = strval( val ); }
							if( strcmp( key , "Radio" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pRadio] = strval( val ); }
							if( strcmp( key , "RadioFreq" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pRadioFreq] = strval( val ); }
							if( strcmp( key , "Bandage" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pBandage] = strval( val ); }
							if( strcmp( key , "ConnectedTime" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pConnectTime] = strval( val ); }
							if( strcmp( key , "Registered" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pReg] = strval( val ); }
							if( strcmp( key , "Sex" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pSex] = strval( val ); }
							if( strcmp( key , "Lumber" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pLumber] = strval( val ); }
							if( strcmp( key , "Cacing" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pCacing] = strval( val ); }
							if( strcmp( key , "AdminOnDutyTime" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pAdminOnDutyTime] = strval( val ); }
							if( strcmp( key , "PBiskey2" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pPBiskey2] = strval( val ); }
							if( strcmp( key , "PDTime" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pPDTime] = strval( val ); }
							if( strcmp( key , "Hunger" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pHunger] = strval( val ); }
							if( strcmp( key , "Bladder" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pBladder] = strval( val ); }
							if( strcmp( key , "Energi" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pEnergi] = strval( val ); }
							if( strcmp( key , "Condition" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pCondition] = strval( val ); }
							if( strcmp( key , "InBizz" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pInBizz] = strval( val ); }
							if( strcmp( key , "PBiskey" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pPBiskey] = strval( val ); }
		                    if( strcmp( key , "Mask" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pMask] = strval( val ); }
		                    if( strcmp( key , "MaskUse" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pMaskUse] = strval( val ); }
		                    if( strcmp( key , "MaskID" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pMaskID] = strval( val ); }
							if( strcmp( key , "Pancingan" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pPancingan] = strval( val ); }
							if( strcmp( key , "Age" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[MAX_PLAYERS][pAge], val, 0, strlen(val)-1, 255); }
							if( strcmp( key , "Paracetamol" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pParacetamol] = strval( val ); }
							if( strcmp( key , "Muted" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pMuted] = strval( val ); }
							if( strcmp( key , "Respect" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pExp] = strval( val ); }
							if( strcmp( key , "Money" , true ) == 0 ) { val = ini_GetValue( Data ); SetPVarInt(MAX_PLAYERS, "Cash", strval( val )); }
							if( strcmp( key , "Bank" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pAccount] = strval( val ); }
							if( strcmp( key , "Crimes" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pCrimes] = strval( val ); }
							if( strcmp( key , "Arrested" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pArrested] = strval( val ); }
							if( strcmp( key , "FitnessTimer" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pFitnessTimer] = strval( val ); }
							if( strcmp( key , "Job" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pJob] = strval( val ); }
							if( strcmp( key , "WSJob" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pWSJob] = strval( val ); }
							if( strcmp( key , "FarmJob" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pFarmJob] = strval( val ); }
							if( strcmp( key , "Jerigen" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pJerigen] = strval( val ); }
							if( strcmp( key , "Bensin" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pBensin] = strval( val ); }
							if( strcmp( key , "UseSorry" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pUseSorry] = strval( val ); }
							if( strcmp( key , "Kuli" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pKuli] = strval( val ); }
		                    if( strcmp( key , "Job2" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pJob2] = strval( val ); }
		                    if( strcmp( key , "IllegalJob" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pIllegalJob] = strval( val ); }
							if( strcmp( key , "Paycheck" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pPayCheck] = strval( val ); }
							if( strcmp( key , "Jailed" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pJailed] = strval( val ); }
							if( strcmp( key , "JailTime" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pJailTime] = strval( val ); }
							if( strcmp( key , "WRestricted" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pWRestricted] = strval( val ); }
							if( strcmp( key , "Materials" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pMats] = strval( val ); }
							if( strcmp( key , "Pulsa2" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pPulsa2] = strval( val ); }
							if( strcmp( key , "Packages" , true ) == 0 ) { val = ini_GetValue( Data ); SetPVarInt(MAX_PLAYERS, key, strval( val )); }
							if( strcmp( key , "Crates" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pCrates] = strval( val ); }
							if( strcmp( key , "Pot" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pPot] = strval( val ); }
							if( strcmp( key , "Crack" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pCrack] = strval( val ); }
							if( strcmp( key , "Leader" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pLeader] = strval( val ); }
							if( strcmp( key , "Member" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pMember] = strval( val ); }
							if( strcmp( key , "Division" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pDivision] = strval( val ); }
							if( strcmp( key , "FMember" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pFMember] = strval( val ); }
							if( strcmp( key , "Rank" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pRank] = strval( val ); }
							if( strcmp( key , "Amoxicilin" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pAmoxicilin] = strval( val ); }
							if( strcmp( key , "MechSkill" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pMechSkill] = strval( val ); }
							if( strcmp( key , "Ultrafluenza" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pUltrafluenza] = strval( val ); }
							if( strcmp( key , "DrugsSkill" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pTruckingSkill] = strval( val ); }
							if( strcmp( key , "ArmsSkill" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pArmsSkill] = strval( val ); }
							if( strcmp( key , "SmugglerSkill" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pSmugSkill] = strval( val ); }
							if( strcmp( key , "FightingStyle" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pFightStyle] = strval( val ); }
							if( strcmp( key , "pHealth" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pHealth] = floatstr( val ); }
							if( strcmp( key , "pArmor" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pArmor] = floatstr( val ); }
							if( strcmp( key , "pSHealth" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pSHealth] = floatstr( val ); }
							if( strcmp( key , "pGroin" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pBodyCondition][0] = floatstr( val ); }
							if( strcmp( key , "pTorso" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pBodyCondition][1] = floatstr( val ); }
							if( strcmp( key , "pRArm" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pBodyCondition][2] = floatstr( val ); }
							if( strcmp( key , "pLArm" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pBodyCondition][3] = floatstr( val ); }
							if( strcmp( key , "pRLeg" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pBodyCondition][4] = floatstr( val ); }
							if( strcmp( key , "pLLeg" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pBodyCondition][5] = floatstr( val ); }
							//if( strcmp( key , "pSArmor" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pSArmor] = floatstr( val ); }
							if( strcmp( key , "Int" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pInt] = strval( val ); }
							if( strcmp( key , "Local" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pLocal] = strval( val ); }
							if( strcmp( key , "VirtualWorld" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pVW] = strval( val ); }
							if( strcmp( key , "HouseInvite" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pHouseInvite] = strval( val ); }
							if( strcmp( key , "Model" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pModel] = strval( val ); }
							if( strcmp( key , "PhoneNr" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pPnumber] = strval( val ); }
							if( strcmp( key , "FMax" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pFMax] = strval( val ); }
							if( strcmp( key , "FTime" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pFTime] = strval( val ); }
							if( strcmp( key , "pLumberTime" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pLumberTime] = strval( val ); }
							if( strcmp( key , "JTime" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pJTime] = strval( val ); }
							if( strcmp( key , "HaulingTime" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pHaulingTime] = strval( val ); }
							if( strcmp( key , "Phone" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pPhone] = strval( val ); }
							if( strcmp( key , "KartuPerdana" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pKartuPerdana] = strval( val ); }
							if( strcmp( key , "Gate" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pGate] = strval( val ); }
							if( strcmp( key , "Painkiller" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pPainkiller] = strval( val ); }
							if( strcmp( key , "BusTime" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pBusTime] = strval( val ); }
							if( strcmp( key , "BeratIkan" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pBeratIkan] = strval( val ); }
							if( strcmp( key , "Apartment" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pPhousekey] = strval( val ); }
							if( strcmp( key , "Apartment2" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pPhousekey2] = strval( val ); }
							if( strcmp( key , "Renting" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pRenting] = strval( val ); }
							if( strcmp( key , "CarLic" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pCarLic] = strval( val ); }
							if( strcmp( key , "CTime" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pCTime] = strval( val ); }
							if( strcmp( key , "CarLicID" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pCarLicID] = strval( val ); }
							if( strcmp( key , "KTP" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pKTP] = strval( val ); }
							if( strcmp( key , "WorkShop" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pWS] = strval( val ); }
							if( strcmp( key , "Ladang" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pFarm] = strval( val ); }
							if( strcmp( key , "pTruckerLic" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pTruckerLic] = strval( val ); }
							if( strcmp( key , "WSid" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pWSid] = strval( val ); }
							if( strcmp( key , "Farmid" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pFarmid] = strval( val ); }
							if( strcmp( key , "MissionTime" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pMissionsTime] = strval( val ); }
							if( strcmp( key , "KTime" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pKTime] = strval( val ); }
							if( strcmp( key , "pLumberLic" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pLumberLic] = strval( val ); }
							if( strcmp( key , "FlyLic" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pFlyLic] = strval( val ); }
							if( strcmp( key , "BoatLic" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pBoatLic] = strval( val ); }
							if( strcmp( key , "CheckCash" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pCheckCash] = strval( val ); }
							if( strcmp( key , "Checks" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pChecks] = strval( val ); }
							if( strcmp( key , "GunLic" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pGunLic] = strval( val ); }
							for(new s = 0; s < 12; s++)
							{
								format(String, 128, "Gun%d", s);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pGuns][s] = strval( val ); }
								format(String, 128, "GunAmmo%d", s);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pGunsAmmo][s] = strval( val ); }
							}
							if( strcmp( key , "DrugsTime" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pDrugsTime] = strval( val ); }
							if( strcmp( key , "MechTime" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pMechTime] = strval( val ); }
							if( strcmp( key , "PayDay" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pPayDay] = strval( val ); }
							if( strcmp( key , "CDPlayer" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pCDPlayer] = strval( val ); }
							if( strcmp( key , "Dice" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pDice] = strval( val ); }
							if( strcmp( key , "Spraycan" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pSpraycan] = strval( val ); }
							if( strcmp( key , "Rope" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pRope] = strval( val ); }
							if( strcmp( key , "Cigars" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pCigar] = strval( val ); }
							if( strcmp( key , "Sprunk" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pSprunk] = strval( val ); }
							if( strcmp( key , "Wins" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pWins] = strval( val ); }
							if( strcmp( key , "Loses" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pLoses] = strval( val ); }
							if( strcmp( key , "Tutorial" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pTut] = strval( val ); }
							if( strcmp( key , "Tutor" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pTutorial] = strval( val ); }
							if( strcmp( key , "OnDuty" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pDuty] = strval( val ); }
							if( strcmp( key , "Hospital" , true ) == 0 ) { val = ini_GetValue( Data ); SetPVarInt(MAX_PLAYERS, key, strval( val )); }
							if( strcmp( key , "Adjustable" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pAdjustable] = strval( val ); }
							if( strcmp( key , "Married" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pMarried] = strval( val ); }
							if( strcmp( key , "MarriedTo" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[MAX_PLAYERS][pMarriedTo], val, 0, strlen(val)-1, 255); }
							if( strcmp( key , "IP" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[MAX_PLAYERS][pIP], val, 0, strlen(val)-1, 255); }
							if( strcmp( key , "WantedLevel" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pWantedLevel] = strval( val ); }
							if( strcmp( key , "Insurance" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pInsurance] = strval( val ); }
							if( strcmp( key , "Snack" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pSnack] = strval( val ); }
							if( strcmp( key , "MineralWater" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pMineralWater] = strval( val ); }
							if( strcmp( key , "AdMuted" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pADMute] = strval( val ); }
							if( strcmp( key , "AdMutedTotal" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pADMuteTotal] = strval( val ); }
		                    if( strcmp( key , "HelpMute" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pHelpMute] = strval( val ); }
							if( strcmp( key , "SPos_x" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pPos_x] = floatstr( val ); }
							if( strcmp( key , "SPos_y" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pPos_y] = floatstr( val ); }
							if( strcmp( key , "SPos_z" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pPos_z] = floatstr( val ); }
							if( strcmp( key , "SPos_r" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pPos_r] = floatstr( val ); }
							if( strcmp( key , "ReportMuted" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pRMuted] = strval( val ); }
		                    if( strcmp( key , "ReportMutedTotal" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pRMutedTotal] = strval( val ); }
							if( strcmp( key , "ReportMutedTime" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pRMutedTime] = strval( val ); }
							if( strcmp( key , "UsePainkiller" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pUsePainkiller] = strval( val ); }
							if( strcmp( key , "GYMTime" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pGYMTime] = strval( val ); }
							if( strcmp( key , "GiftTime" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pGiftTime] = strval( val ); }
							if( strcmp( key , "AdvisorDutyHours" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pDutyHours] = strval( val ); }
							if( strcmp( key , "AcceptedHelp" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pAcceptedHelp] = strval( val ); }
							if( strcmp( key , "AcceptReport" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pAcceptReport] = strval( val ); }
							if( strcmp( key , "TrashReport" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pTrashReport] = strval( val ); }
		                    if( strcmp( key , "GangWarn" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pGangWarn] = strval( val ); }
							if( strcmp( key , "FactionBanned" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pFactionBanned] = strval( val ); }
							if( strcmp( key , "CSFBanned" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pCSFBanned] = strval( val ); }
							for(new v = 0; v < MAX_PLAYERVEHICLES; v++)
			        		{
								format(String, 128, "pv%dPosX",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[MAX_PLAYERS][v][pvPosX] = floatstr( val ); }
								format(String, 128, "pv%dPosY",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[MAX_PLAYERS][v][pvPosY] = floatstr( val ); }
								format(String, 128, "pv%dPosZ",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[MAX_PLAYERS][v][pvPosZ] = floatstr( val ); }
								format(String, 128, "pv%dPosAngle",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[MAX_PLAYERS][v][pvPosAngle] = floatstr( val ); }
								format(String, 128, "pv%dModelId",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[MAX_PLAYERS][v][pvModelId] = strval( val ); }
								format(String, 128, "pv%dLock",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[MAX_PLAYERS][v][pvLock] = strval( val ); }
								format(String, 128, "pv%dLocked",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[MAX_PLAYERS][v][pvLocked] = strval( val ); }
								format(String, 128, "pv%dPaintJob",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[MAX_PLAYERS][v][pvPaintJob] = strval( val ); }
								format(String, 128, "pv%dColor1",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[MAX_PLAYERS][v][pvColor1] = strval( val ); }
								format(String, 128, "pv%dNeon",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[MAX_PLAYERS][v][pvNeon] = strval( val ); }
								format(String, 128, "pv%dColor2",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[MAX_PLAYERS][v][pvColor2] = strval( val ); }
								format(String, 128, "pv%dPrice",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[MAX_PLAYERS][v][pvPrice] = strval( val ); }
								format(String, 128, "pv%dTicket",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[MAX_PLAYERS][v][pvTicket] = strval( val ); }
								format(String, 128, "pv%dWeapon0",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[MAX_PLAYERS][v][pvWeapons][0] = strval( val ); }
								format(String, 128, "pv%dWeapon1",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[MAX_PLAYERS][v][pvWeapons][1] = strval( val ); }
								format(String, 128, "pv%dWeapon2",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[MAX_PLAYERS][v][pvWeapons][2] = strval( val ); }
								format(String, 128, "pv%dWeaponAmmo0",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[MAX_PLAYERS][v][pvWeaponsAmmo][0] = strval( val ); }
								format(String, 128, "pv%dWeaponAmmo1",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[MAX_PLAYERS][v][pvWeaponsAmmo][1] = strval( val ); }
								format(String, 128, "pv%dWeaponAmmo2",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[MAX_PLAYERS][v][pvWeaponsAmmo][2] = strval( val ); }
								format(String, 128, "pv%dWepUpgrade",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[MAX_PLAYERS][v][pvWepUpgrade] = strval( val ); }
								format(String, 128, "pv%dFuel",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[MAX_PLAYERS][v][pvFuel] = floatstr( val ); }
								format(String, 128, "pv%dHealth",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[MAX_PLAYERS][v][pvHealth] = floatstr( val ); }
								format(String, 128, "pv%dInsurances",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[MAX_PLAYERS][v][pvInsurances] = strval( val ); }
								format(String, 128, "pv%dMesinUpgrade",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[MAX_PLAYERS][v][pvMesinUpgrade] = strval( val ); }
								format(String, 128, "pv%dBodyUpgrade",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[MAX_PLAYERS][v][pvBodyUpgrade] = strval( val ); }
								format(String, 128, "pv%dStatus0",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[MAX_PLAYERS][v][pvStatus][0] = strval( val ); }
								format(String, 128, "pv%dStatus1",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[MAX_PLAYERS][v][pvStatus][1] = strval( val ); }
								format(String, 128, "pv%dStatus2",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[MAX_PLAYERS][v][pvStatus][2] = strval( val ); }
								format(String, 128, "pv%dStatus3",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[MAX_PLAYERS][v][pvStatus][3] = strval( val ); }
								format(String, 128, "pv%dLicense",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[MAX_PLAYERS][v][pvLicense] = strval( val ); }
								format(String, 128, "pv%dLicenseTime",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[MAX_PLAYERS][v][pvLicenseTime] = strval( val ); }
								format(String, 128, "pv%dLicenseExpired",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerVehicleInfo[MAX_PLAYERS][v][pvLicenseExpired], val, 0, strlen(val)-1, 255); }
								format(String, 128, "pv%dImpound",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[MAX_PLAYERS][v][pvImpounded] = strval( val ); }
								format(String, 128, "pv%dStored",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[MAX_PLAYERS][v][pvStored] = strval( val ); }
								format(String, 128, "pv%dDestroyed",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[MAX_PLAYERS][v][pvDestroyed] = strval( val ); }
								format(String, 128, "pv%dNumPlate",v); //Plate
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerVehicleInfo[MAX_PLAYERS][v][pvNumberPlate], val, 0, strlen(val)-1, 255); }
			        		    format(String, 128, "pv%dToyText1", v);
			        		    if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerVehicleInfo[MAX_PLAYERS][v][pvToyText1], val, 0, strlen(val)-1, 255); }
			        		    format(String, 128, "pv%dToyText2", v);
			        		    if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerVehicleInfo[MAX_PLAYERS][v][pvToyText2], val, 0, strlen(val)-1, 255); }
			        		    format(String, 128, "pv%dToyText3", v);
			        		    if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerVehicleInfo[MAX_PLAYERS][v][pvToyText3], val, 0, strlen(val)-1, 255); }
			        		    format(String, 128, "pv%dToyText4", v);
			        		    if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerVehicleInfo[MAX_PLAYERS][v][pvToyText4], val, 0, strlen(val)-1, 255); }
			        		    format(String, 128, "pv%dToyText5", v);
			        		    if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerVehicleInfo[MAX_PLAYERS][v][pvToyText5], val, 0, strlen(val)-1, 255); }
			        		    format(String, 128, "pv%dToyText6", v);
			        		    if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerVehicleInfo[MAX_PLAYERS][v][pvToyText6], val, 0, strlen(val)-1, 255); }
			        		    format(String, 128, "pv%dToyText7", v);
			        		    if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerVehicleInfo[MAX_PLAYERS][v][pvToyText7], val, 0, strlen(val)-1, 255); }
			        		    format(String, 128, "pv%dToyText8", v);
			        		    if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerVehicleInfo[MAX_PLAYERS][v][pvToyText8], val, 0, strlen(val)-1, 255); }
			        		    format(String, 128, "pv%dToyText9", v);
			        		    if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerVehicleInfo[MAX_PLAYERS][v][pvToyText9], val, 0, strlen(val)-1, 255); }
			        		    format(String, 128, "pv%dToyText10", v);
			        		    if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerVehicleInfo[MAX_PLAYERS][v][pvToyText10], val, 0, strlen(val)-1, 255); }
			        		    format(String, 128, "pv%dToyTextCol1", v);
			        		    if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[MAX_PLAYERS][v][pvToyTextCol1] = strval( val ); }
			        		    format(String, 128, "pv%dToyTextCol2", v);
			        		    if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[MAX_PLAYERS][v][pvToyTextCol2] = strval( val ); }
			        		    format(String, 128, "pv%dToyTextCol3", v);
			        		    if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[MAX_PLAYERS][v][pvToyTextCol3] = strval( val ); }
			        		    format(String, 128, "pv%dToyTextCol4", v);
			        		    if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[MAX_PLAYERS][v][pvToyTextCol4] = strval( val ); }
			        		    format(String, 128, "pv%dToyTextCol5", v);
			        		    if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[MAX_PLAYERS][v][pvToyTextCol5] = strval( val ); }
			        		    format(String, 128, "pv%dToyTextCol6", v);
			        		    if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[MAX_PLAYERS][v][pvToyTextCol6] = strval( val ); }
			        		    format(String, 128, "pv%dToyTextCol7", v);
			        		    if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[MAX_PLAYERS][v][pvToyTextCol7] = strval( val ); }
			        		    format(String, 128, "pv%dToyTextCol8", v);
			        		    if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[MAX_PLAYERS][v][pvToyTextCol8] = strval( val ); }
			        		    format(String, 128, "pv%dToyTextCol9", v);
			        		    if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[MAX_PLAYERS][v][pvToyTextCol9] = strval( val ); }
			        		    format(String, 128, "pv%dToyTextCol10", v);
			        		    if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[MAX_PLAYERS][v][pvToyTextCol10] = strval( val ); }
			        		    format(String, 128, "pv%dToyTextSize1", v);
			        		    if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[MAX_PLAYERS][v][pvToyTextSize1] = strval( val ); }
			        		    format(String, 128, "pv%dToyTextSize2", v);
			        		    if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[MAX_PLAYERS][v][pvToyTextSize2] = strval( val ); }
			        		    format(String, 128, "pv%dToyTextSize3", v);
			        		    if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[MAX_PLAYERS][v][pvToyTextSize3] = strval( val ); }
			        		    format(String, 128, "pv%dToyTextSize4", v);
			        		    if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[MAX_PLAYERS][v][pvToyTextSize4] = strval( val ); }
			        		    format(String, 128, "pv%dToyTextSize5", v);
			        		    if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[MAX_PLAYERS][v][pvToyTextSize5] = strval( val ); }
			        		    format(String, 128, "pv%dToyTextSize6", v);
			        		    if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[MAX_PLAYERS][v][pvToyTextSize6] = strval( val ); }
			        		    format(String, 128, "pv%dToyTextSize7", v);
			        		    if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[MAX_PLAYERS][v][pvToyTextSize7] = strval( val ); }
			        		    format(String, 128, "pv%dToyTextSize8", v);
			        		    if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[MAX_PLAYERS][v][pvToyTextSize8] = strval( val ); }
			        		    format(String, 128, "pv%dToyTextSize9", v);
			        		    if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[MAX_PLAYERS][v][pvToyTextSize9] = strval( val ); }
			        		    format(String, 128, "pv%dToyTextSize10", v);
			        		    if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[MAX_PLAYERS][v][pvToyTextSize10] = strval( val ); }
			        		    format(String, 128, "pv%dToyTextID1", v);
			        		    if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[MAX_PLAYERS][v][pvToyTextID1] = strval( val ); }
			        		    format(String, 128, "pv%dToyTextID2", v);
			        		    if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[MAX_PLAYERS][v][pvToyTextID2] = strval( val ); }
			        		    format(String, 128, "pv%dToyTextID3", v);
			        		    if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[MAX_PLAYERS][v][pvToyTextID3] = strval( val ); }
			        		    format(String, 128, "pv%dToyTextID4", v);
			        		    if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[MAX_PLAYERS][v][pvToyTextID4] = strval( val ); }
			        		    format(String, 128, "pv%dToyTextID5", v);
			        		    if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[MAX_PLAYERS][v][pvToyTextID5] = strval( val ); }
			        		    format(String, 128, "pv%dToyTextID6", v);
			        		    if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[MAX_PLAYERS][v][pvToyTextID6] = strval( val ); }
			        		    format(String, 128, "pv%dToyTextID7", v);
			        		    if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[MAX_PLAYERS][v][pvToyTextID7] = strval( val ); }
			        		    format(String, 128, "pv%dToyTextID8", v);
			        		    if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[MAX_PLAYERS][v][pvToyTextID8] = strval( val ); }
			        		    format(String, 128, "pv%dToyTextID9", v);
			        		    if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[MAX_PLAYERS][v][pvToyTextID9] = strval( val ); }
			        		    format(String, 128, "pv%dToyTextID10", v);
			        		    if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[MAX_PLAYERS][v][pvToyTextID10] = strval( val ); }
								//if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); strcpy(PlayerVehicleInfo[MAX_PLAYERS][v][pvNumberPlate], Data, 32); } //PlayerVehicleInfo[MAX_PLAYERS][v][pvNumberPlate] = floatstr( val ); }
								for(new m = 0; m < MAX_MODS; m++)
			            		{
		                		    format(String, 128, "pv%dMod%d", v, m);
		            		        if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[MAX_PLAYERS][v][pvMods][m] = strval( val ); }
			        		    }
			        		    for(new vt = 0; vt < MAX_OBJECTS_PER_PLAYER; vt++)
			        		    {
			        		        format(String, 128, "pv%dToyID%d", v, vt);
			        		        if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[MAX_PLAYERS][v][pvToyID][vt] = strval( val ); }
			        		        format(String, 128, "pv%dToyPosX%d", v, vt);
			        		        if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[MAX_PLAYERS][v][pvToyPosX][vt] = floatstr( val ); }
			        		        format(String, 128, "pv%dToyPosY%d", v, vt);
			        		        if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[MAX_PLAYERS][v][pvToyPosY][vt] = floatstr( val ); }
			        		        format(String, 128, "pv%dToyPosZ%d", v, vt);
			        		        if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[MAX_PLAYERS][v][pvToyPosZ][vt] = floatstr( val ); }
			        		        format(String, 128, "pv%dToyRotX%d", v, vt);
			        		        if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[MAX_PLAYERS][v][pvToyRotX][vt] = floatstr( val ); }
			        		        format(String, 128, "pv%dToyRotY%d", v, vt);
			        		        if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[MAX_PLAYERS][v][pvToyRotY][vt] = floatstr( val ); }
			        		        format(String, 128, "pv%dToyRotZ%d", v, vt);
			        		        if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[MAX_PLAYERS][v][pvToyRotZ][vt] = floatstr( val ); }
			        		        format(String, 128, "pv%dToyColor%d", v, vt);
			        		        if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[MAX_PLAYERS][v][pvToyColor][vt] = strval( val ); }
			        		        format(String, 128, "pv%dToyIndex%d", v, vt);
			        		        if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[MAX_PLAYERS][v][pvToyIndex][vt] = strval( val ); }
			        		        format(String, 128, "pv%dToyTexture1%d", v, vt);
			        		        if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[MAX_PLAYERS][v][pvToyTexture1][vt] = strval( val ); }
			        		        format(String, 128, "pv%dToyTexture2%d", v, vt);
			        		        if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[MAX_PLAYERS][v][pvToyTexture2][vt] = strval( val ); }
			        		        format(String, 128, "pv%dToyTextureID%d", v, vt);
			        		        if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerVehicleInfo[MAX_PLAYERS][v][pvToyTextureID][vt] = strval( val ); }
								}
  		    			      //format(String, 128, "pv%dAllowedPlayer",v);
			        		    //if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerVehicleInfo[MAX_PLAYERS][v][pvAllowPlayer], val, 0, strlen(val)-1, 255); }
		 					}
		 					if( strcmp( key , "prTax", true ) == 0 ) { val = ini_GetValue( Data ); PlayerRentInfo[MAX_PLAYERS][prTax] = strval( val ); }
		 					if( strcmp( key , "prRentTime", true ) == 0 ) { val = ini_GetValue( Data ); PlayerRentInfo[MAX_PLAYERS][prRentTime] = strval( val ); }
		 					if( strcmp( key , "prVehicleRent", true ) == 0 ) { val = ini_GetValue( Data ); PlayerRentInfo[MAX_PLAYERS][prVehicleRent] = strval( val ); }
		 					if( strcmp( key , "prModelId", true ) == 0 ) { val = ini_GetValue( Data ); PlayerRentInfo[MAX_PLAYERS][prModelId] = strval( val ); }
		 					if( strcmp( key , "prPosX", true ) == 0 ) { val = ini_GetValue( Data ); PlayerRentInfo[MAX_PLAYERS][prPosX] = floatstr( val ); }
		 					if( strcmp( key , "prPosY", true ) == 0 ) { val = ini_GetValue( Data ); PlayerRentInfo[MAX_PLAYERS][prPosY] = floatstr( val ); }
		 					if( strcmp( key , "prPosZ", true ) == 0 ) { val = ini_GetValue( Data ); PlayerRentInfo[MAX_PLAYERS][prPosZ] = floatstr( val ); }
		 					if( strcmp( key , "prPosAngle", true ) == 0 ) { val = ini_GetValue( Data ); PlayerRentInfo[MAX_PLAYERS][prPosAngle] = floatstr( val ); }
		 					if( strcmp( key , "prColor1", true ) == 0 ) { val = ini_GetValue( Data ); PlayerRentInfo[MAX_PLAYERS][prColor1] = strval( val ); }
		 					if( strcmp( key , "prColor2", true ) == 0 ) { val = ini_GetValue( Data ); PlayerRentInfo[MAX_PLAYERS][prColor2] = strval( val ); }
		 					if( strcmp( key , "prLock", true ) == 0 ) { val = ini_GetValue( Data ); PlayerRentInfo[MAX_PLAYERS][prLock] = strval( val ); }
		 					if( strcmp( key , "prLocked", true ) == 0 ) { val = ini_GetValue( Data ); PlayerRentInfo[MAX_PLAYERS][prLocked] = strval( val ); }
		 					if( strcmp( key , "prTicket", true ) == 0 ) { val = ini_GetValue( Data ); PlayerRentInfo[MAX_PLAYERS][prTicket] = strval( val ); }
		 					if( strcmp( key , "prFuel", true ) == 0 ) { val = ini_GetValue( Data ); PlayerRentInfo[MAX_PLAYERS][prFuel] = strval( val ); }
		 					if( strcmp( key , "prHealth", true ) == 0 ) { val = ini_GetValue( Data ); PlayerRentInfo[MAX_PLAYERS][prHealth] = floatstr( val ); }
		 					if( strcmp( key , "prStatus0", true ) == 0 ) { val = ini_GetValue( Data ); PlayerRentInfo[MAX_PLAYERS][prStatus][0] = strval( val ); }
		 					if( strcmp( key , "prStatus1", true ) == 0 ) { val = ini_GetValue( Data ); PlayerRentInfo[MAX_PLAYERS][prStatus][1] = strval( val ); }
		 					if( strcmp( key , "prStatus2", true ) == 0 ) { val = ini_GetValue( Data ); PlayerRentInfo[MAX_PLAYERS][prStatus][2] = strval( val ); }
		 					if( strcmp( key , "prStatus3", true ) == 0 ) { val = ini_GetValue( Data ); PlayerRentInfo[MAX_PLAYERS][prStatus][3] = strval( val ); }
		            		for(new v = 0; v < MAX_PLAYERTOYS; v++)
			        		{
			        		    format(String, 128, "pt%dModelID",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerToyInfo[MAX_PLAYERS][v][ptModelID] = strval( val ); }
								format(String, 128, "pt%dBone",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerToyInfo[MAX_PLAYERS][v][ptBone] = strval( val ); }
								format(String, 128, "pt%dPosX",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerToyInfo[MAX_PLAYERS][v][ptPosX] = floatstr( val ); }
								format(String, 128, "pt%dPosY",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerToyInfo[MAX_PLAYERS][v][ptPosY] = floatstr( val ); }
								format(String, 128, "pt%dPosZ",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerToyInfo[MAX_PLAYERS][v][ptPosZ] = floatstr( val ); }
								format(String, 128, "pt%dRotX",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerToyInfo[MAX_PLAYERS][v][ptRotX] = floatstr( val ); }
								format(String, 128, "pt%dRotY",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerToyInfo[MAX_PLAYERS][v][ptRotY] = floatstr( val ); }
								format(String, 128, "pt%dRotZ",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerToyInfo[MAX_PLAYERS][v][ptRotZ] = floatstr( val ); }
								format(String, 128, "pt%dScaX",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerToyInfo[MAX_PLAYERS][v][ptScaX] = floatstr( val ); }
								format(String, 128, "pt%dScaY",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerToyInfo[MAX_PLAYERS][v][ptScaY] = floatstr( val ); }
								format(String, 128, "pt%dScaZ",v);
								if( strcmp( key , String , true ) == 0 ) { val = ini_GetValue( Data ); PlayerToyInfo[MAX_PLAYERS][v][ptScaZ] = floatstr( val ); }
							}
							if( strcmp( key , "VIPJoinDate" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[MAX_PLAYERS][pVIPJoinDate], val, 0, strlen(val)-1, 255); }//vip
		                	if( strcmp( key , "VIPExpDate" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[MAX_PLAYERS][pVIPExpDate], val, 0, strlen(val)-1, 255); }//vip
		                	if( strcmp( key , "VIPExpTime" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[MAX_PLAYERS][pVIPExpTime], val, 0, strlen(val)-1, 255); }//vip
		            		if( strcmp( key , "VIPInviteDay" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pVIPInviteDay] = strval( val ); }
		            		if( strcmp( key , "TempVIP" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pTempVIP] = strval( val ); }
		            		if( strcmp( key , "BuddyInvite" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pBuddyInvited] = strval( val ); }
		           		 	if( strcmp( key , "VIPLeft" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pVIPLeft] = strval( val ); }
		            		if( strcmp( key , "Tokens" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pTokens] = strval( val ); }
		            		if( strcmp( key , "TriageTime" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pTriageTime] = strval( val ); }
		            		if( strcmp( key, "jailedBy", true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[MAX_PLAYERS][pJailedBy], val, 0, strlen(val)-1, 255); }
		            		if( strcmp( key, "PrisonReason", true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[MAX_PLAYERS][pPrisonReason], val, 0, strlen(val)-1, 255); }
		            		if( strcmp( key , "TicketTime" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pTicketTime] = strval( val ); }
		            		if( strcmp( key , "Screwdriver" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pScrewdriver] = strval( val ); }
		            		if( strcmp( key , "Tire" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pTire] = strval( val ); }
		            		if( strcmp( key , "Firstaid" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pFirstaid] = strval( val ); }
		            		if( strcmp( key , "Rccam" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pRccam] = strval( val ); }
							if( strcmp( key , "Receiver" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pReceiver] = strval( val ); }
							if( strcmp( key , "GPS" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pGPS] = strval( val ); }
							if( strcmp( key , "Sweep" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pSweep] = strval( val ); }
							if( strcmp( key , "SweepLeft" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pSweepLeft] = strval( val ); }
							if( strcmp( key , "Bugged" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pBugged] = strval( val ); }
							if( strcmp( key , "Hospital" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pHospital] = strval( val ); }
							if( strcmp( key , "TanamanAnggur" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pTanamanAnggur] = strval( val ); }
							if( strcmp( key , "TanamanBlueberry" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pTanamanBlueberry] = strval( val ); }
							if( strcmp( key , "TanamanStrawberry" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pTanamanStrawberry] = strval( val ); }
							if( strcmp( key , "TanamanGandum" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pTanamanGandum] = strval( val ); }
							if( strcmp( key , "TanamanTomat" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pTanamanTomat] = strval( val ); }
							if( strcmp( key , "BibitAnggur" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pBibitAnggur] = strval( val ); }
							if( strcmp( key , "BibitBlueberry" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pBibitBlueberry] = strval( val ); }
							if( strcmp( key , "BibitStrawberry" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pBibitStrawberry] = strval( val ); }
							if( strcmp( key , "BibitGandum" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pBibitGandum] = strval( val ); }
							if( strcmp( key , "BibitTomat" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pBibitTomat] = strval( val ); }
							if( strcmp( key , "Warrants" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[MAX_PLAYERS][pWarrant], val, 0, strlen(val)-1, 255); }
							if( strcmp( key , "JudgeJailTime" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pJudgeJailTime] = strval( val ); }
							if( strcmp( key , "JudgeJailType" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pJudgeJailType] = strval( val ); }
		                    if( strcmp( key , "BeingSentenced" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pBeingSentenced] = strval( val ); }
		                    if( strcmp( key , "ProbationTime" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pProbationTime] = strval( val ); }
							if( strcmp( key , "CallsAccepted" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pCallsAccepted] = strval( val ); }
							if( strcmp( key , "PatientsDelivered" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pPatientsDelivered] = strval( val ); }
							if( strcmp( key , "LiveBanned" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pLiveBanned] = strval( val ); }
							if( strcmp( key , "FreezeBank" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pFreezeBank] = strval( val ); }
							if( strcmp( key , "Component" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pComponent] = strval( val ); }
							if( strcmp( key , "BoomBox" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[MAX_PLAYERS][pBoomBox] = strval( val ); }
							}//end while
					fclose(UserFile);//close the file after everything has been read in the while*/
				}
	return 1;
}
public OnPlayerOfflineSave(playername[])
{
	new string3[32];
	//GetPlayerName(MAX_PLAYERS, playername, MAX_PLAYER_NAME);
 	format(string3, sizeof(string3), "users/%s.ini", playername);
	new File: hFile = fopen(string3, io_write);
	if (hFile)
	{
				new var[1024];
    			format(var, 1024, "Key=%s\n", PlayerInfo[MAX_PLAYERS][pKey]);fwrite(hFile, var);
    			format(var, 1024, "AdminOnDuty=%d\n", PlayerInfo[MAX_PLAYERS][pAdminDuty]);fwrite(hFile, var);
				format(var, 1024, "AdminName=%s\n",PlayerInfo[MAX_PLAYERS][pAdminName]);fwrite(hFile, var);
				format(var, 1024, "NormalName=%s\n",PlayerInfo[MAX_PLAYERS][pNormalName]);fwrite(hFile, var);
				format(var, 1024, "VIPName=%s\n", PlayerInfo[MAX_PLAYERS][pVIPName]);fwrite(hFile, var);
				format(var, 1024, "AdminBan=%s\n", PlayerInfo[MAX_PLAYERS][pAdminban]);fwrite(hFile, var);
				format(var, 1024, "BanReason=%s\n", PlayerInfo[MAX_PLAYERS][pBanReason]);fwrite(hFile, var);
				format(var, 1024, "BanExpired=%s\n", PlayerInfo[MAX_PLAYERS][pBanExpired]);fwrite(hFile, var);
       			format(var, 1024, "BanExpired2=%s\n", PlayerInfo[MAX_PLAYERS][pBanExpired2]);fwrite(hFile, var);
				format(var, 1024, "Accent=%s\n", PlayerInfo[MAX_PLAYERS][pAccent]);fwrite(hFile, var);
				format(var, 1024, "SweeperT=%d\n",PlayerInfo[MAX_PLAYERS][pSweeperT]);fwrite(hFile, var);
				format(var, 1024, "WSBos=%d\n", PlayerInfo[MAX_PLAYERS][pWSBos]);fwrite(hFile, var);
				format(var, 1024, "DutyTime=%d\n", PlayerInfo[MAX_PLAYERS][pDutyTime]);fwrite(hFile, var);
				format(var, 1024, "LadangBos=%d\n", PlayerInfo[MAX_PLAYERS][pFarmBos]);fwrite(hFile, var);
				format(var, 1024, "Level=%d\n",PlayerInfo[MAX_PLAYERS][pLevel]);fwrite(hFile, var);
				format(var, 1024, "AdminLevel=%d\n",PlayerInfo[MAX_PLAYERS][pAdmin]);fwrite(hFile, var);
				format(var, 1024, "Band=%d\n",PlayerInfo[MAX_PLAYERS][pBanned]);fwrite(hFile, var);
				format(var, 1024, "PermBand=%d\n",PlayerInfo[MAX_PLAYERS][pPermaBanned]);fwrite(hFile, var);
				format(var, 1024, "Warnings=%d\n",PlayerInfo[MAX_PLAYERS][pWarns]);fwrite(hFile, var);
				format(var, 1024, "Disabled=%d\n",PlayerInfo[MAX_PLAYERS][pDisabled]);fwrite(hFile, var);
				format(var, 1024, "DonateRank=%d\n",PlayerInfo[MAX_PLAYERS][pDonateRank]);fwrite(hFile, var);
				format(var, 1024, "DutyTimeTotal=%d\n",PlayerInfo[MAX_PLAYERS][pDutyTimeTotal]);fwrite(hFile, var);
				format(var, 1024, "TogReports=%d\n",PlayerInfo[MAX_PLAYERS][pTogReports]);fwrite(hFile, var);
				format(var, 1024, "Radio=%d\n",PlayerInfo[MAX_PLAYERS][pRadio]);fwrite(hFile, var);
				format(var, 1024, "RadioFreq=%d\n",PlayerInfo[MAX_PLAYERS][pRadioFreq]);fwrite(hFile, var);
				format(var, 1024, "Bandage=%d\n",PlayerInfo[MAX_PLAYERS][pBandage]);fwrite(hFile, var);
				format(var, 1024, "ConnectedTime=%d\n",PlayerInfo[MAX_PLAYERS][pConnectTime]);fwrite(hFile, var);
				format(var, 1024, "Registered=%d\n",PlayerInfo[MAX_PLAYERS][pReg]);fwrite(hFile, var);
				format(var, 1024, "Sex=%d\n",PlayerInfo[MAX_PLAYERS][pSex]);fwrite(hFile, var);
				format(var, 1024, "Lumber=%d\n",PlayerInfo[MAX_PLAYERS][pLumber]);fwrite(hFile, var);
				format(var, 1024, "Cacing=%d\n",PlayerInfo[MAX_PLAYERS][pCacing]);fwrite(hFile, var);
				format(var, 1024, "AdminOnDutyTime=%d\n",PlayerInfo[MAX_PLAYERS][pAdminOnDutyTime]);fwrite(hFile, var);
				format(var, 1024, "PBiskey2=%d\n",PlayerInfo[MAX_PLAYERS][pPBiskey2]);fwrite(hFile, var);
				format(var, 1024, "PDTime=%d\n",PlayerInfo[MAX_PLAYERS][pPDTime]);fwrite(hFile, var);
				format(var, 1024, "Hunger=%d\n",PlayerInfo[MAX_PLAYERS][pHunger]);fwrite(hFile, var);
				format(var, 1024, "Bladder=%d\n",PlayerInfo[MAX_PLAYERS][pBladder]);fwrite(hFile, var);
				format(var, 1024, "Energi=%d\n",PlayerInfo[MAX_PLAYERS][pEnergi]);fwrite(hFile, var);
				format(var, 1024, "Condition=%d\n",PlayerInfo[MAX_PLAYERS][pCondition]);fwrite(hFile, var);
				format(var, 1024, "SilincedSkill=%d\n",PlayerInfo[MAX_PLAYERS][pSilincedSkill]);fwrite(hFile, var);
				format(var, 1024, "DesertEagleSkill=%d\n",PlayerInfo[MAX_PLAYERS][pDesertEagleSkill]);fwrite(hFile, var);
				format(var, 1024, "RifleSkill=%d\n",PlayerInfo[MAX_PLAYERS][pRifleSkill]);fwrite(hFile, var);
				format(var, 1024, "ShotgunSkill=%d\n",PlayerInfo[MAX_PLAYERS][pShotgunSkill]);fwrite(hFile, var);
				format(var, 1024, "SpassSkill=%d\n",PlayerInfo[MAX_PLAYERS][pSpassSkill]);fwrite(hFile, var);
				format(var, 1024, "MP5Skill=%d\n",PlayerInfo[MAX_PLAYERS][pMP5Skill]);fwrite(hFile, var);
				format(var, 1024, "AK47Skill=%d\n",PlayerInfo[MAX_PLAYERS][pAK47Skill]);fwrite(hFile, var);
				format(var, 1024, "M4Skill=%d\n",PlayerInfo[MAX_PLAYERS][pM4Skill]);fwrite(hFile, var);
				format(var, 1024, "SniperSkill=%d\n",PlayerInfo[MAX_PLAYERS][pSniperSkill]);fwrite(hFile, var);
				format(var, 1024, "TrainingTime=%d\n",PlayerInfo[MAX_PLAYERS][pTrainingTime]);fwrite(hFile, var);
				format(var, 1024, "PBiskey=%d\n",PlayerInfo[MAX_PLAYERS][pPBiskey]);fwrite(hFile, var);
				format(var, 1024, "InBizz=%d\n",PlayerInfo[MAX_PLAYERS][pInBizz]);fwrite(hFile, var);
				format(var, 1024, "Mask=%d\n",PlayerInfo[MAX_PLAYERS][pMask]);fwrite(hFile, var);
				format(var, 1024, "MaskUse=%d\n",PlayerInfo[MAX_PLAYERS][pMaskUse]);fwrite(hFile, var);
				format(var, 1024, "MaskID=%d\n",PlayerInfo[MAX_PLAYERS][pMaskID]);fwrite(hFile, var);
				format(var, 1024, "Pancingan=%d\n",PlayerInfo[MAX_PLAYERS][pPancingan]);fwrite(hFile, var);
				format(var, 1024, "Age=%s\n",PlayerInfo[MAX_PLAYERS][pAge]);fwrite(hFile, var);
				format(var, 1024, "Paracetamol=%d\n",PlayerInfo[MAX_PLAYERS][pParacetamol]);fwrite(hFile, var);
				format(var, 1024, "Muted=%d\n",PlayerInfo[MAX_PLAYERS][pMuted]);fwrite(hFile, var);
				format(var, 1024, "Respect=%d\n",PlayerInfo[MAX_PLAYERS][pExp]);fwrite(hFile, var);
				format(var, 1024, "Money=%d\n",GetPVarInt(MAX_PLAYERS, "Cash"));fwrite(hFile, var);
				format(var, 1024, "Bank=%d\n",PlayerInfo[MAX_PLAYERS][pAccount]);fwrite(hFile, var);
				format(var, 1024, "Crimes=%d\n",PlayerInfo[MAX_PLAYERS][pCrimes]);fwrite(hFile, var);
				format(var, 1024, "Arrested=%d\n",PlayerInfo[MAX_PLAYERS][pArrested]);fwrite(hFile, var);
				format(var, 1024, "FitnessTimer=%d\n",PlayerInfo[MAX_PLAYERS][pFitnessTimer]);fwrite(hFile, var);
				format(var, 1024, "Job=%d\n",PlayerInfo[MAX_PLAYERS][pJob]);fwrite(hFile, var);
				format(var, 1024, "WSJob=%d\n",PlayerInfo[MAX_PLAYERS][pWSJob]);fwrite(hFile, var);
				format(var, 1024, "FarmJob=%d\n",PlayerInfo[MAX_PLAYERS][pFarmJob]);fwrite(hFile, var);
				format(var, 1024, "Jerigen=%d\n",PlayerInfo[MAX_PLAYERS][pJerigen]);fwrite(hFile, var);
				format(var, 1024, "Bensin=%d\n",PlayerInfo[MAX_PLAYERS][pBensin]);fwrite(hFile, var);
				format(var, 1024, "UseSorry=%d\n",PlayerInfo[MAX_PLAYERS][pUseSorry]);fwrite(hFile, var);
                format(var, 1024, "Kuli=%d\n",PlayerInfo[MAX_PLAYERS][pKuli]);fwrite(hFile, var);
				format(var, 1024, "Job2=%d\n",PlayerInfo[MAX_PLAYERS][pJob2]);fwrite(hFile, var);
				format(var, 1024, "IllegalJob=%d\n",PlayerInfo[MAX_PLAYERS][pIllegalJob]);fwrite(hFile, var);
				format(var, 1024, "Paycheck=%d\n",PlayerInfo[MAX_PLAYERS][pPayCheck]);fwrite(hFile, var);
				format(var, 1024, "Jailed=%d\n",PlayerInfo[MAX_PLAYERS][pJailed]);fwrite(hFile, var);
				format(var, 1024, "JailTime=%d\n",PlayerInfo[MAX_PLAYERS][pJailTime]);fwrite(hFile, var);
				format(var, 1024, "WRestricted=%d\n",PlayerInfo[MAX_PLAYERS][pWRestricted]);fwrite(hFile, var);
				format(var, 1024, "Materials=%d\n",PlayerInfo[MAX_PLAYERS][pMats]);fwrite(hFile, var);
				format(var, 1024, "Pulsa2=%d\n",PlayerInfo[MAX_PLAYERS][pPulsa2]);fwrite(hFile, var);
				format(var, 1024, "Packages=%d\n",GetPVarInt(MAX_PLAYERS, "Packages"));fwrite(hFile, var);
				format(var, 1024, "Crates=%d\n",PlayerInfo[MAX_PLAYERS][pCrates]);fwrite(hFile, var);
				format(var, 1024, "Pot=%d\n",PlayerInfo[MAX_PLAYERS][pPot]);fwrite(hFile, var);
				format(var, 1024, "Crack=%d\n",PlayerInfo[MAX_PLAYERS][pCrack]);fwrite(hFile, var);
				format(var, 1024, "Leader=%d\n",PlayerInfo[MAX_PLAYERS][pLeader]);fwrite(hFile, var);
				format(var, 1024, "Member=%d\n",PlayerInfo[MAX_PLAYERS][pMember]);fwrite(hFile, var);
				format(var, 1024, "Division=%d\n",PlayerInfo[MAX_PLAYERS][pDivision]);fwrite(hFile, var);
				format(var, 1024, "FMember=%d\n",PlayerInfo[MAX_PLAYERS][pFMember]);fwrite(hFile, var);
				format(var, 1024, "Rank=%d\n",PlayerInfo[MAX_PLAYERS][pRank]);fwrite(hFile, var);
				format(var, 1024, "Amoxicilin=%d\n",PlayerInfo[MAX_PLAYERS][pAmoxicilin]);fwrite(hFile, var);
				format(var, 1024, "MechSkill=%d\n",PlayerInfo[MAX_PLAYERS][pMechSkill]);fwrite(hFile, var);
				format(var, 1024, "Ultrafluenza=%d\n",PlayerInfo[MAX_PLAYERS][pUltrafluenza]);fwrite(hFile, var);
				format(var, 1024, "DrugsSkill=%d\n",PlayerInfo[MAX_PLAYERS][pTruckingSkill]);fwrite(hFile, var);
				format(var, 1024, "ArmsSkill=%d\n",PlayerInfo[MAX_PLAYERS][pArmsSkill]);fwrite(hFile, var);
				format(var, 1024, "SmugglerSkill=%d\n",PlayerInfo[MAX_PLAYERS][pSmugSkill]);fwrite(hFile, var);
				format(var, 1024, "FightingStyle=%d\n",PlayerInfo[MAX_PLAYERS][pFightStyle]);fwrite(hFile, var);
				GetPlayerHealth(MAX_PLAYERS,PlayerInfo[MAX_PLAYERS][pHealth]);
				format(var, 1024, "pHealth=%.1f\n",PlayerInfo[MAX_PLAYERS][pHealth]);fwrite(hFile, var);
				GetPlayerArmour(MAX_PLAYERS,PlayerInfo[MAX_PLAYERS][pArmor]);
				format(var, 1024, "pArmor=%.1f\n",PlayerInfo[MAX_PLAYERS][pArmor]);fwrite(hFile, var);
				format(var, 1024, "pSHealth=%.1f\n",PlayerInfo[MAX_PLAYERS][pSHealth]);fwrite(hFile, var);
				format(var, 1024, "pGroin=%.1f\n",PlayerInfo[MAX_PLAYERS][pBodyCondition][0]);fwrite(hFile, var);
				format(var, 1024, "pTorso=%.1f\n",PlayerInfo[MAX_PLAYERS][pBodyCondition][1]);fwrite(hFile, var);
				format(var, 1024, "pRArm=%.1f\n",PlayerInfo[MAX_PLAYERS][pBodyCondition][2]);fwrite(hFile, var);
				format(var, 1024, "pLArm=%.1f\n",PlayerInfo[MAX_PLAYERS][pBodyCondition][3]);fwrite(hFile, var);
				format(var, 1024, "pRLeg=%.1f\n",PlayerInfo[MAX_PLAYERS][pBodyCondition][4]);fwrite(hFile, var);
				format(var, 1024, "pLLeg=%.1f\n",PlayerInfo[MAX_PLAYERS][pBodyCondition][5]);fwrite(hFile, var);
				//format(var, 1024, "pSArmor=%.1f\n",PlayerInfo[MAX_PLAYERS][pSArmor]);fwrite(hFile, var);
				format(var, 1024, "Int=%d\n",PlayerInfo[MAX_PLAYERS][pInt]);fwrite(hFile, var);
				format(var, 1024, "Local=%d\n",PlayerInfo[MAX_PLAYERS][pLocal]);fwrite(hFile, var);
				format(var, 1024, "VirtualWorld=%d\n",PlayerInfo[MAX_PLAYERS][pVW]);fwrite(hFile, var);
				format(var, 1024, "HouseInvite=%d\n",PlayerInfo[MAX_PLAYERS][pHouseInvite]);fwrite(hFile, var);
				format(var, 1024, "Model=%d\n",PlayerInfo[MAX_PLAYERS][pModel]);fwrite(hFile, var);
				format(var, 1024, "PhoneNr=%d\n",PlayerInfo[MAX_PLAYERS][pPnumber]);fwrite(hFile, var);
				format(var, 1024, "FMax=%d\n",PlayerInfo[MAX_PLAYERS][pFMax]);fwrite(hFile, var);
				format(var, 1024, "FTime=%d\n",PlayerInfo[MAX_PLAYERS][pFTime]);fwrite(hFile, var);
				format(var, 1024, "pLumberTime=%d\n",PlayerInfo[MAX_PLAYERS][pLumberTime]);fwrite(hFile, var);
				format(var, 1024, "JTime=%d\n",PlayerInfo[MAX_PLAYERS][pJTime]);fwrite(hFile, var);
				format(var, 1024, "HaulingTime=%d\n",PlayerInfo[MAX_PLAYERS][pHaulingTime]);fwrite(hFile, var);
				format(var, 1024, "Phone=%d\n",PlayerInfo[MAX_PLAYERS][pPhone]);fwrite(hFile, var);
				format(var, 1024, "KartuPerdana=%d\n",PlayerInfo[MAX_PLAYERS][pKartuPerdana]);fwrite(hFile, var);
				format(var, 1024, "Gate=%d\n",PlayerInfo[MAX_PLAYERS][pGate]);fwrite(hFile, var);
				format(var, 1024, "Painkiller=%d\n",PlayerInfo[MAX_PLAYERS][pPainkiller]);fwrite(hFile, var);
				format(var, 1024, "BusTime=%d\n",PlayerInfo[MAX_PLAYERS][pBusTime]);fwrite(hFile, var);
				format(var, 1024, "BeratIkan=%d\n",PlayerInfo[MAX_PLAYERS][pBeratIkan]);fwrite(hFile, var);
				format(var, 1024, "Apartment=%d\n",PlayerInfo[MAX_PLAYERS][pPhousekey]);fwrite(hFile, var);
				format(var, 1024, "Apartment2=%d\n",PlayerInfo[MAX_PLAYERS][pPhousekey2]);fwrite(hFile, var);
				format(var, 1024, "Renting=%d\n",PlayerInfo[MAX_PLAYERS][pRenting]);fwrite(hFile, var);
				format(var, 1024, "CarLic=%d\n",PlayerInfo[MAX_PLAYERS][pCarLic]);fwrite(hFile, var);
				format(var, 1024, "CTime=%d\n",PlayerInfo[MAX_PLAYERS][pCTime]);fwrite(hFile, var);
				format(var, 1024, "CarLicID=%d\n",PlayerInfo[MAX_PLAYERS][pCarLicID]);fwrite(hFile, var);
				format(var, 1024, "KTP=%d\n",PlayerInfo[MAX_PLAYERS][pKTP]);fwrite(hFile, var);
				format(var, 1024, "WorkShop=%d\n",PlayerInfo[MAX_PLAYERS][pWS]);fwrite(hFile, var);
				format(var, 1024, "Ladang=%d\n",PlayerInfo[MAX_PLAYERS][pFarm]);fwrite(hFile, var);
				format(var, 1024, "pTruckerLic=%d\n",PlayerInfo[MAX_PLAYERS][pTruckerLic]);fwrite(hFile, var);
				format(var, 1024, "WSid=%d\n",PlayerInfo[MAX_PLAYERS][pWSid]);fwrite(hFile, var);
				format(var, 1024, "Farmid=%d\n",PlayerInfo[MAX_PLAYERS][pFarmid]);fwrite(hFile, var);
				format(var, 1024, "MissionTime=%d\n",PlayerInfo[MAX_PLAYERS][pMissionsTime]);fwrite(hFile, var);
				format(var, 1024, "KTime=%d\n",PlayerInfo[MAX_PLAYERS][pKTime]);fwrite(hFile, var);
				format(var, 1024, "pLumberLic=%d\n",PlayerInfo[MAX_PLAYERS][pLumberLic]);fwrite(hFile, var);
				format(var, 1024, "FlyLic=%d\n",PlayerInfo[MAX_PLAYERS][pFlyLic]);fwrite(hFile, var);
				format(var, 1024, "BoatLic=%d\n",PlayerInfo[MAX_PLAYERS][pBoatLic]);fwrite(hFile, var);
				format(var, 1024, "CheckCash=%d\n",PlayerInfo[MAX_PLAYERS][pCheckCash]);fwrite(hFile, var);
				format(var, 1024, "Checks=%d\n",PlayerInfo[MAX_PLAYERS][pChecks]);fwrite(hFile, var);
				//format(var, 1024, "MInsure=%d\n",PlayerInfo[MAX_PLAYERS][pMInsure]);fwrite(hFile, var);
				format(var, 1024, "GunLic=%d\n",PlayerInfo[MAX_PLAYERS][pGunLic]);fwrite(hFile, var);
				for(new s = 0; s < 12; s++)
				{
					format(var, 1024, "Gun%d=%d\n", s, PlayerInfo[MAX_PLAYERS][pGuns][s]);fwrite(hFile, var);
					format(var, 1024, "GunAmmo%d=%d\n", s, PlayerInfo[MAX_PLAYERS][pGunsAmmo][s]);fwrite(hFile, var);
				}
				format(var, 1024, "DrugsTime=%d\n",PlayerInfo[MAX_PLAYERS][pDrugsTime]);fwrite(hFile, var);
				format(var, 1024, "MechTime=%d\n",PlayerInfo[MAX_PLAYERS][pMechTime]);fwrite(hFile, var);
				format(var, 1024, "PayDay=%d\n",PlayerInfo[MAX_PLAYERS][pPayDay]);fwrite(hFile, var);
				format(var, 1024, "CDPlayer=%d\n",PlayerInfo[MAX_PLAYERS][pCDPlayer]);fwrite(hFile, var);
				format(var, 1024, "Dice=%d\n",PlayerInfo[MAX_PLAYERS][pDice]);fwrite(hFile, var);
				format(var, 1024, "Cangkul=%d\n",PlayerInfo[MAX_PLAYERS][pCangkul]);fwrite(hFile, var);
				format(var, 1024, "Spraycan=%d\n",PlayerInfo[MAX_PLAYERS][pSpraycan]);fwrite(hFile, var);
				format(var, 1024, "Rope=%d\n",PlayerInfo[MAX_PLAYERS][pRope]);fwrite(hFile, var);
				format(var, 1024, "Cigars=%d\n",PlayerInfo[MAX_PLAYERS][pCigar]);fwrite(hFile, var);
				format(var, 1024, "Sprunk=%d\n",PlayerInfo[MAX_PLAYERS][pSprunk]);fwrite(hFile, var);
				format(var, 1024, "Wins=%d\n",PlayerInfo[MAX_PLAYERS][pWins]);fwrite(hFile, var);
				format(var, 1024, "Loses=%d\n",PlayerInfo[MAX_PLAYERS][pLoses]);fwrite(hFile, var);
				format(var, 1024, "Tutorial=%d\n",PlayerInfo[MAX_PLAYERS][pTut]);fwrite(hFile, var);
				format(var, 1024, "Tutor=%d\n",PlayerInfo[MAX_PLAYERS][pTutorial]);fwrite(hFile, var);
				format(var, 1024, "OnDuty=%d\n",PlayerInfo[MAX_PLAYERS][pDuty]);fwrite(hFile, var);
				format(var, 1024, "Hospital=%d\n",GetPVarInt(MAX_PLAYERS, "Hospital"));fwrite(hFile, var);
				format(var, 1024, "Adjustable=%d\n",PlayerInfo[MAX_PLAYERS][pAdjustable]);fwrite(hFile, var);
				format(var, 1024, "Married=%d\n",PlayerInfo[MAX_PLAYERS][pMarried]);fwrite(hFile, var);
				format(var, 1024, "MarriedTo=%s\n",PlayerInfo[MAX_PLAYERS][pMarriedTo]);fwrite(hFile, var);
				format(var, 1024, "IP=%s\n",PlayerInfo[MAX_PLAYERS][pIP]);fwrite(hFile, var);
				format(var, 1024, "WantedLevel=%d\n",PlayerInfo[MAX_PLAYERS][pWantedLevel]);fwrite(hFile, var);
				format(var, 1024, "Insurance=%d\n",PlayerInfo[MAX_PLAYERS][pInsurance]);fwrite(hFile, var);
				format(var, 1024, "Snack=%d\n",PlayerInfo[MAX_PLAYERS][pSnack]);fwrite(hFile, var);
				format(var, 1024, "MineralWater=%d\n",PlayerInfo[MAX_PLAYERS][pMineralWater]);fwrite(hFile, var);
				format(var, 1024, "AdMuted=%d\n",PlayerInfo[MAX_PLAYERS][pADMute]);fwrite(hFile, var);
				format(var, 1024, "AdMutedTotal=%d\n",PlayerInfo[MAX_PLAYERS][pADMuteTotal]);fwrite(hFile, var);
				format(var, 1024, "HelpMute=%d\n",PlayerInfo[MAX_PLAYERS][pHelpMute]);fwrite(hFile, var);
				format(var, 1024, "SPos_x=%.1f\n",PlayerInfo[MAX_PLAYERS][pPos_x]);fwrite(hFile, var);
				format(var, 1024, "SPos_y=%.1f\n",PlayerInfo[MAX_PLAYERS][pPos_y]);fwrite(hFile, var);
				format(var, 1024, "SPos_z=%.1f\n",PlayerInfo[MAX_PLAYERS][pPos_z]);fwrite(hFile, var);
				format(var, 1024, "SPos_r=%.1f\n",PlayerInfo[MAX_PLAYERS][pPos_r]);fwrite(hFile, var);
				format(var, 1024, "ReportMuted=%d\n",PlayerInfo[MAX_PLAYERS][pRMuted]);fwrite(hFile, var);
    			format(var, 1024, "ReportMutedTotal=%d\n",PlayerInfo[MAX_PLAYERS][pRMutedTotal]);fwrite(hFile, var);
    			format(var, 1024, "ReportMutedTime=%d\n",PlayerInfo[MAX_PLAYERS][pRMutedTime]);fwrite(hFile, var);
    			format(var, 1024, "UsePainkiller=%d\n",PlayerInfo[MAX_PLAYERS][pUsePainkiller]);fwrite(hFile, var);
    			format(var, 1024, "GYMTime=%d\n",PlayerInfo[MAX_PLAYERS][pGYMTime]);fwrite(hFile, var);
    			format(var, 1024, "GiftTime=%d\n",PlayerInfo[MAX_PLAYERS][pGiftTime]);fwrite(hFile, var);
    			format(var, 1024, "AdvisorDutyHours=%d\n",PlayerInfo[MAX_PLAYERS][pDutyHours]);fwrite(hFile, var);
    			format(var, 1024, "AcceptedHelp=%d\n",PlayerInfo[MAX_PLAYERS][pAcceptedHelp]);fwrite(hFile, var);
    			format(var, 1024, "AcceptReport=%d\n",PlayerInfo[MAX_PLAYERS][pAcceptReport]);fwrite(hFile, var);
    			format(var, 1024, "TrashReport=%d\n",PlayerInfo[MAX_PLAYERS][pTrashReport]);fwrite(hFile, var);
    			format(var, 1024, "GangWarn=%d\n",PlayerInfo[MAX_PLAYERS][pGangWarn]);fwrite(hFile, var);
    			format(var, 1024, "FactionBanned=%d\n",PlayerInfo[MAX_PLAYERS][pFactionBanned]);fwrite(hFile, var);
    			format(var, 1024, "CSFBanned=%d\n",PlayerInfo[MAX_PLAYERS][pCSFBanned]);fwrite(hFile, var);
				for(new v = 0; v < MAX_PLAYERVEHICLES; v++)
	    		{
	        		format(var, 1024, "pv%dPosX=%.1f\n", v, PlayerVehicleInfo[MAX_PLAYERS][v][pvPosX]);fwrite(hFile, var);
	    			format(var, 1024, "pv%dPosY=%.1f\n", v, PlayerVehicleInfo[MAX_PLAYERS][v][pvPosY]);fwrite(hFile, var);
	    			format(var, 1024, "pv%dPosZ=%.1f\n", v, PlayerVehicleInfo[MAX_PLAYERS][v][pvPosZ]);fwrite(hFile, var);
	    			format(var, 1024, "pv%dPosAngle=%.1f\n", v, PlayerVehicleInfo[MAX_PLAYERS][v][pvPosAngle]);fwrite(hFile, var);
	    			format(var, 1024, "pv%dModelId=%d\n", v, PlayerVehicleInfo[MAX_PLAYERS][v][pvModelId]);fwrite(hFile, var);
	    			format(var, 1024, "pv%dLock=%d\n", v, PlayerVehicleInfo[MAX_PLAYERS][v][pvLock]);fwrite(hFile, var);
	    			format(var, 1024, "pv%dLocked=%d\n", v, PlayerVehicleInfo[MAX_PLAYERS][v][pvLocked]);fwrite(hFile, var);
	    			format(var, 1024, "pv%dPaintJob=%d\n", v, PlayerVehicleInfo[MAX_PLAYERS][v][pvPaintJob]);fwrite(hFile, var);
	    			format(var, 1024, "pv%dColor1=%d\n", v, PlayerVehicleInfo[MAX_PLAYERS][v][pvColor1]);fwrite(hFile, var);
	    			format(var, 1024, "pv%dNeon=%d\n", v, PlayerVehicleInfo[MAX_PLAYERS][v][pvNeon]);fwrite(hFile, var);
	   			 	format(var, 1024, "pv%dColor2=%d\n", v, PlayerVehicleInfo[MAX_PLAYERS][v][pvColor2]);fwrite(hFile, var);
	   			 	format(var, 1024, "pv%dPrice=%d\n", v, PlayerVehicleInfo[MAX_PLAYERS][v][pvPrice]);fwrite(hFile, var);
	   			 	format(var, 1024, "pv%dTicket=%d\n", v, PlayerVehicleInfo[MAX_PLAYERS][v][pvTicket]);fwrite(hFile, var);
	   			 	format(var, 1024, "pv%dWeapon0=%d\n", v, PlayerVehicleInfo[MAX_PLAYERS][v][pvWeapons][0]);fwrite(hFile, var);
	   			 	format(var, 1024, "pv%dWeapon1=%d\n", v, PlayerVehicleInfo[MAX_PLAYERS][v][pvWeapons][1]);fwrite(hFile, var);
	   			 	format(var, 1024, "pv%dWeapon2=%d\n", v, PlayerVehicleInfo[MAX_PLAYERS][v][pvWeapons][2]);fwrite(hFile, var);
	   			 	format(var, 1024, "pv%dWeaponAmmo0=%d\n", v, PlayerVehicleInfo[MAX_PLAYERS][v][pvWeaponsAmmo][0]);fwrite(hFile, var);
	   			 	format(var, 1024, "pv%dWeaponAmmo1=%d\n", v, PlayerVehicleInfo[MAX_PLAYERS][v][pvWeaponsAmmo][1]);fwrite(hFile, var);
	   			 	format(var, 1024, "pv%dWeaponAmmo2=%d\n", v, PlayerVehicleInfo[MAX_PLAYERS][v][pvWeaponsAmmo][2]);fwrite(hFile, var);
	   			 	format(var, 1024, "pv%dWepUpgrade=%d\n", v, PlayerVehicleInfo[MAX_PLAYERS][v][pvWepUpgrade]);fwrite(hFile, var);
	   			 	format(var, 1024, "pv%dFuel=%.1f\n", v, PlayerVehicleInfo[MAX_PLAYERS][v][pvFuel]);fwrite(hFile, var);
	   			 	format(var, 1024, "pv%dHealth=%.1f\n", v, PlayerVehicleInfo[MAX_PLAYERS][v][pvHealth]);fwrite(hFile, var);
					format(var, 1024, "pv%dInsurances=%d\n", v, PlayerVehicleInfo[MAX_PLAYERS][v][pvInsurances]);fwrite(hFile, var);
					format(var, 1024, "pv%dMesinUpgrade=%d\n", v, PlayerVehicleInfo[MAX_PLAYERS][v][pvMesinUpgrade]);fwrite(hFile, var);
					format(var, 1024, "pv%dBodyUpgrade=%d\n", v, PlayerVehicleInfo[MAX_PLAYERS][v][pvBodyUpgrade]);fwrite(hFile, var);
	   			 	format(var, 1024, "pv%dStatus0=%d\n", v, PlayerVehicleInfo[MAX_PLAYERS][v][pvStatus][0]);fwrite(hFile, var);
					format(var, 1024, "pv%dStatus1=%d\n", v, PlayerVehicleInfo[MAX_PLAYERS][v][pvStatus][1]);fwrite(hFile, var);
					format(var, 1024, "pv%dStatus2=%d\n", v, PlayerVehicleInfo[MAX_PLAYERS][v][pvStatus][2]);fwrite(hFile, var);
					format(var, 1024, "pv%dStatus3=%d\n", v, PlayerVehicleInfo[MAX_PLAYERS][v][pvStatus][3]);fwrite(hFile, var);
					format(var, 1024, "pv%dLicense=%d\n", v, PlayerVehicleInfo[MAX_PLAYERS][v][pvLicense]);fwrite(hFile, var);
					format(var, 1024, "pv%dLicenseTime=%d\n", v, PlayerVehicleInfo[MAX_PLAYERS][v][pvLicenseTime]);fwrite(hFile, var);
					format(var, 1024, "pv%dLicenseExpired=%s\n", v, PlayerVehicleInfo[MAX_PLAYERS][v][pvLicenseExpired]);fwrite(hFile, var);
					format(var, 1024, "pv%dImpound=%d\n", v, PlayerVehicleInfo[MAX_PLAYERS][v][pvImpounded]);fwrite(hFile, var);
					format(var, 1024, "pv%dStored=%d\n", v, PlayerVehicleInfo[MAX_PLAYERS][v][pvStored]);fwrite(hFile, var);
					format(var, 1024, "pv%dDestroyed=%d\n", v, PlayerVehicleInfo[MAX_PLAYERS][v][pvDestroyed]);fwrite(hFile, var);
	   			 	format(var, 1024, "pv%dNumPlate=%s\n", v, PlayerVehicleInfo[MAX_PLAYERS][v][pvNumberPlate]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyText1=%s\n", v, PlayerVehicleInfo[MAX_PLAYERS][v][pvToyText1]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyText2=%s\n", v, PlayerVehicleInfo[MAX_PLAYERS][v][pvToyText2]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyText3=%s\n", v, PlayerVehicleInfo[MAX_PLAYERS][v][pvToyText3]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyText4=%s\n", v, PlayerVehicleInfo[MAX_PLAYERS][v][pvToyText4]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyText5=%s\n", v, PlayerVehicleInfo[MAX_PLAYERS][v][pvToyText5]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyText6=%s\n", v, PlayerVehicleInfo[MAX_PLAYERS][v][pvToyText6]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyText7=%s\n", v, PlayerVehicleInfo[MAX_PLAYERS][v][pvToyText7]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyText8=%s\n", v, PlayerVehicleInfo[MAX_PLAYERS][v][pvToyText8]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyText9=%s\n", v, PlayerVehicleInfo[MAX_PLAYERS][v][pvToyText9]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyText10=%s\n", v, PlayerVehicleInfo[MAX_PLAYERS][v][pvToyText10]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextCol1=%d\n", v, PlayerVehicleInfo[MAX_PLAYERS][v][pvToyTextCol1]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextCol2=%d\n", v, PlayerVehicleInfo[MAX_PLAYERS][v][pvToyTextCol2]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextCol3=%d\n", v, PlayerVehicleInfo[MAX_PLAYERS][v][pvToyTextCol3]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextCol4=%d\n", v, PlayerVehicleInfo[MAX_PLAYERS][v][pvToyTextCol4]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextCol5=%d\n", v, PlayerVehicleInfo[MAX_PLAYERS][v][pvToyTextCol5]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextCol6=%d\n", v, PlayerVehicleInfo[MAX_PLAYERS][v][pvToyTextCol6]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextCol7=%d\n", v, PlayerVehicleInfo[MAX_PLAYERS][v][pvToyTextCol7]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextCol8=%d\n", v, PlayerVehicleInfo[MAX_PLAYERS][v][pvToyTextCol8]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextCol9=%d\n", v, PlayerVehicleInfo[MAX_PLAYERS][v][pvToyTextCol9]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextCol10=%d\n", v, PlayerVehicleInfo[MAX_PLAYERS][v][pvToyTextCol10]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextSize1=%d\n", v, PlayerVehicleInfo[MAX_PLAYERS][v][pvToyTextSize1]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextSize2=%d\n", v, PlayerVehicleInfo[MAX_PLAYERS][v][pvToyTextSize2]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextSize3=%d\n", v, PlayerVehicleInfo[MAX_PLAYERS][v][pvToyTextSize3]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextSize4=%d\n", v, PlayerVehicleInfo[MAX_PLAYERS][v][pvToyTextSize4]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextSize5=%d\n", v, PlayerVehicleInfo[MAX_PLAYERS][v][pvToyTextSize5]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextSize6=%d\n", v, PlayerVehicleInfo[MAX_PLAYERS][v][pvToyTextSize6]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextSize7=%d\n", v, PlayerVehicleInfo[MAX_PLAYERS][v][pvToyTextSize7]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextSize8=%d\n", v, PlayerVehicleInfo[MAX_PLAYERS][v][pvToyTextSize8]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextSize9=%d\n", v, PlayerVehicleInfo[MAX_PLAYERS][v][pvToyTextSize9]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextSize10=%d\n", v, PlayerVehicleInfo[MAX_PLAYERS][v][pvToyTextSize10]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextID1=%d\n", v, PlayerVehicleInfo[MAX_PLAYERS][v][pvToyTextID1]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextID2=%d\n", v, PlayerVehicleInfo[MAX_PLAYERS][v][pvToyTextID2]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextID3=%d\n", v, PlayerVehicleInfo[MAX_PLAYERS][v][pvToyTextID3]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextID4=%d\n", v, PlayerVehicleInfo[MAX_PLAYERS][v][pvToyTextID4]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextID5=%d\n", v, PlayerVehicleInfo[MAX_PLAYERS][v][pvToyTextID5]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextID6=%d\n", v, PlayerVehicleInfo[MAX_PLAYERS][v][pvToyTextID6]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextID7=%d\n", v, PlayerVehicleInfo[MAX_PLAYERS][v][pvToyTextID7]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextID8=%d\n", v, PlayerVehicleInfo[MAX_PLAYERS][v][pvToyTextID8]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextID9=%d\n", v, PlayerVehicleInfo[MAX_PLAYERS][v][pvToyTextID9]);fwrite(hFile, var);
	        		format(var, 1024, "pv%dToyTextID10=%d\n", v, PlayerVehicleInfo[MAX_PLAYERS][v][pvToyTextID10]);fwrite(hFile, var);
	    			for(new m = 0; m < MAX_MODS; m++)
	     	   		{
                		format(var, 1024, "pv%dMod%d=%d\n", v, m, PlayerVehicleInfo[MAX_PLAYERS][v][pvMods][m]);fwrite(hFile, var);
	        		}
	        		for(new vt = 0; vt < MAX_OBJECTS_PER_PLAYER; vt++)
	        		{
	        		    format(var, 1024, "pv%dToyID%d=%d\n", v, vt, PlayerVehicleInfo[MAX_PLAYERS][v][pvToyID][vt]);fwrite(hFile, var);
	        		    format(var, 1024, "pv%dToyPosX%d=%.5f\n", v, vt, PlayerVehicleInfo[MAX_PLAYERS][v][pvToyPosX][vt]);fwrite(hFile, var);
	        		    format(var, 1024, "pv%dToyPosY%d=%.5f\n", v, vt, PlayerVehicleInfo[MAX_PLAYERS][v][pvToyPosY][vt]);fwrite(hFile, var);
	        		    format(var, 1024, "pv%dToyPosZ%d=%.5f\n", v, vt, PlayerVehicleInfo[MAX_PLAYERS][v][pvToyPosZ][vt]);fwrite(hFile, var);
	        		    format(var, 1024, "pv%dToyRotX%d=%.5f\n", v, vt, PlayerVehicleInfo[MAX_PLAYERS][v][pvToyRotX][vt]);fwrite(hFile, var);
	        		    format(var, 1024, "pv%dToyRotY%d=%.5f\n", v, vt, PlayerVehicleInfo[MAX_PLAYERS][v][pvToyRotY][vt]);fwrite(hFile, var);
	        		    format(var, 1024, "pv%dToyRotZ%d=%.5f\n", v, vt, PlayerVehicleInfo[MAX_PLAYERS][v][pvToyRotZ][vt]);fwrite(hFile, var);
	        		    format(var, 1024, "pv%dToyColor%d=%d\n", v, vt, PlayerVehicleInfo[MAX_PLAYERS][v][pvToyColor][vt]);fwrite(hFile, var);
	        		    format(var, 1024, "pv%dToyIndex%d=%d\n", v, vt, PlayerVehicleInfo[MAX_PLAYERS][v][pvToyIndex][vt]);fwrite(hFile, var);
	        		    format(var, 1024, "pv%dToyTexture1%d=%d\n", v, vt, PlayerVehicleInfo[MAX_PLAYERS][v][pvToyTexture1][vt]);fwrite(hFile, var);
	        		    format(var, 1024, "pv%dToyTexture2%d=%d\n", v, vt, PlayerVehicleInfo[MAX_PLAYERS][v][pvToyTexture2][vt]);fwrite(hFile, var);
	        		    format(var, 1024, "pv%dToyTextureID%d=%d\n", v, vt, PlayerVehicleInfo[MAX_PLAYERS][v][pvToyTextureID][vt]);fwrite(hFile, var);
					}
	        		//format(var, 1024, "pv%dAllowedPlayer=%s\n", v, PlayerVehicleInfo[MAX_PLAYERS][v][pvAllowPlayer]);fwrite(hFile, var);
				}
				format(var, 1024, "prTax=%d\n", PlayerRentInfo[MAX_PLAYERS][prTax]);fwrite(hFile, var);
				format(var, 1024, "prRentTime=%d\n", PlayerRentInfo[MAX_PLAYERS][prRentTime]);fwrite(hFile, var);
				format(var, 1024, "prVehicleRent=%d\n", PlayerRentInfo[MAX_PLAYERS][prVehicleRent]);fwrite(hFile, var);
				format(var, 1024, "prModelId=%d\n", PlayerRentInfo[MAX_PLAYERS][prModelId]);fwrite(hFile, var);
				format(var, 1024, "prPosX=%.1f\n", PlayerRentInfo[MAX_PLAYERS][prPosX]);fwrite(hFile, var);
				format(var, 1024, "prPosY=%.1f\n", PlayerRentInfo[MAX_PLAYERS][prPosY]);fwrite(hFile, var);
				format(var, 1024, "prPosZ=%.1f\n", PlayerRentInfo[MAX_PLAYERS][prPosZ]);fwrite(hFile, var);
				format(var, 1024, "prPosAngle=%.1f\n", PlayerRentInfo[MAX_PLAYERS][prPosAngle]);fwrite(hFile, var);
				format(var, 1024, "prColor1=%d\n", PlayerRentInfo[MAX_PLAYERS][prColor1]);fwrite(hFile, var);
				format(var, 1024, "prColor2=%d\n", PlayerRentInfo[MAX_PLAYERS][prColor2]);fwrite(hFile, var);
				format(var, 1024, "prLock=%d\n", PlayerRentInfo[MAX_PLAYERS][prLock]);fwrite(hFile, var);
				format(var, 1024, "prLocked=%d\n", PlayerRentInfo[MAX_PLAYERS][prLocked]);fwrite(hFile, var);
				format(var, 1024, "prTicket=%d\n", PlayerRentInfo[MAX_PLAYERS][prTicket]);fwrite(hFile, var);
				format(var, 1024, "prFuel=%d\n", PlayerRentInfo[MAX_PLAYERS][prFuel]);fwrite(hFile, var);
				format(var, 1024, "prHealth=%.1f\n", PlayerRentInfo[MAX_PLAYERS][prHealth]);fwrite(hFile, var);
				format(var, 1024, "prStatus0=%d\n", PlayerRentInfo[MAX_PLAYERS][prStatus][0]);fwrite(hFile, var);
				format(var, 1024, "prStatus1=%d\n", PlayerRentInfo[MAX_PLAYERS][prStatus][1]);fwrite(hFile, var);
				format(var, 1024, "prStatus2=%d\n", PlayerRentInfo[MAX_PLAYERS][prStatus][2]);fwrite(hFile, var);
				format(var, 1024, "prStatus3=%d\n", PlayerRentInfo[MAX_PLAYERS][prStatus][3]);fwrite(hFile, var);
	    		for(new vv = 0; vv < MAX_PLAYERTOYS; vv++)
	    		{
					format(var, 1024, "pt%dModelID=%d\n", vv, PlayerToyInfo[MAX_PLAYERS][vv][ptModelID]);fwrite(hFile, var);
					format(var, 1024, "pt%dBone=%d\n", vv, PlayerToyInfo[MAX_PLAYERS][vv][ptBone]);fwrite(hFile, var);
	        		format(var, 1024, "pt%dPosX=%.5f\n", vv, PlayerToyInfo[MAX_PLAYERS][vv][ptPosX]);fwrite(hFile, var);
	    			format(var, 1024, "pt%dPosY=%.5f\n", vv, PlayerToyInfo[MAX_PLAYERS][vv][ptPosY]);fwrite(hFile, var);
	    			format(var, 1024, "pt%dPosZ=%.5f\n", vv, PlayerToyInfo[MAX_PLAYERS][vv][ptPosZ]);fwrite(hFile, var);
	    			format(var, 1024, "pt%dRotX=%.5f\n", vv, PlayerToyInfo[MAX_PLAYERS][vv][ptRotX]);fwrite(hFile, var);
	    			format(var, 1024, "pt%dRotY=%.5f\n", vv, PlayerToyInfo[MAX_PLAYERS][vv][ptRotY]);fwrite(hFile, var);
	    			format(var, 1024, "pt%dRotZ=%.5f\n", vv, PlayerToyInfo[MAX_PLAYERS][vv][ptRotZ]);fwrite(hFile, var);
	    			format(var, 1024, "pt%dScaX=%.5f\n", vv, PlayerToyInfo[MAX_PLAYERS][vv][ptScaX]);fwrite(hFile, var);
	    			format(var, 1024, "pt%dScaY=%.5f\n", vv, PlayerToyInfo[MAX_PLAYERS][vv][ptScaY]);fwrite(hFile, var);
	    			format(var, 1024, "pt%dScaZ=%.5f\n", vv, PlayerToyInfo[MAX_PLAYERS][vv][ptScaZ]);fwrite(hFile, var);
	    		}
	    		format(var, 1024, "VIPJoinDate=%s\n",PlayerInfo[MAX_PLAYERS][pVIPJoinDate]);fwrite(hFile, var);//vip
				format(var, 1024, "VIPExpDate=%s\n",PlayerInfo[MAX_PLAYERS][pVIPExpDate]);fwrite(hFile, var);//vip
				format(var, 1024, "VIPExpTime=%s\n",PlayerInfo[MAX_PLAYERS][pVIPExpTime]);fwrite(hFile, var);//vip
	    		format(var, 1024, "VIPInviteDay=%d\n",PlayerInfo[MAX_PLAYERS][pVIPInviteDay]);fwrite(hFile, var);
	    		format(var, 1024, "TempVIP=%d\n",PlayerInfo[MAX_PLAYERS][pTempVIP]);fwrite(hFile, var);
	    		format(var, 1024, "BuddyInvite=%d\n",PlayerInfo[MAX_PLAYERS][pBuddyInvited]);fwrite(hFile, var);
	    		format(var, 1024, "VIPLeft=%d\n",PlayerInfo[MAX_PLAYERS][pVIPLeft]);fwrite(hFile, var);
	    		format(var, 1024, "Tokens=%d\n",PlayerInfo[MAX_PLAYERS][pTokens]);fwrite(hFile, var);
	    		format(var, 1024, "TriageTime=%d\n",PlayerInfo[MAX_PLAYERS][pTriageTime]);fwrite(hFile, var);
	    		format(var, 1024, "jailedBy=%s\n", PlayerInfo[MAX_PLAYERS][pJailedBy]);fwrite(hFile, var);
	    		format(var, 1024, "PrisonReason=%s\n", PlayerInfo[MAX_PLAYERS][pPrisonReason]);fwrite(hFile, var);
	    		format(var, 1024, "TicketTime=%d\n",PlayerInfo[MAX_PLAYERS][pTicketTime]);fwrite(hFile, var);
	    		format(var, 1024, "Screwdriver=%d\n",PlayerInfo[MAX_PLAYERS][pScrewdriver]);fwrite(hFile, var);
	    		format(var, 1024, "Tire=%d\n",PlayerInfo[MAX_PLAYERS][pTire]);fwrite(hFile, var);
	    		format(var, 1024, "Firstaid=%d\n",PlayerInfo[MAX_PLAYERS][pFirstaid]);fwrite(hFile, var);
	    		format(var, 1024, "Rccam=%d\n",PlayerInfo[MAX_PLAYERS][pRccam]);fwrite(hFile, var);
	    		format(var, 1024, "Receiver=%d\n",PlayerInfo[MAX_PLAYERS][pReceiver]);fwrite(hFile, var);
	    		format(var, 1024, "GPS=%d\n",PlayerInfo[MAX_PLAYERS][pGPS]);fwrite(hFile, var);
	    		format(var, 1024, "Sweep=%d\n",PlayerInfo[MAX_PLAYERS][pSweep]);fwrite(hFile, var);
	    		format(var, 1024, "SweepLeft=%d\n",PlayerInfo[MAX_PLAYERS][pSweepLeft]);fwrite(hFile, var);
	    		format(var, 1024, "Bugged=%d\n",PlayerInfo[MAX_PLAYERS][pBugged]);fwrite(hFile, var);
	    		format(var, 1024, "Hospital=%d\n",PlayerInfo[MAX_PLAYERS][pHospital]);fwrite(hFile, var);
				format(var, 1024, "TanamanAnggur=%d\n",PlayerInfo[MAX_PLAYERS][pTanamanAnggur]);fwrite(hFile, var);
				format(var, 1024, "TanamanBlueberry=%d\n",PlayerInfo[MAX_PLAYERS][pTanamanBlueberry]);fwrite(hFile, var);
				format(var, 1024, "TanamanStrawberry=%d\n",PlayerInfo[MAX_PLAYERS][pTanamanStrawberry]);fwrite(hFile, var);
				format(var, 1024, "TanamanGandum=%d\n",PlayerInfo[MAX_PLAYERS][pTanamanGandum]);fwrite(hFile, var);
				format(var, 1024, "TanamanTomat=%d\n",PlayerInfo[MAX_PLAYERS][pTanamanTomat]);fwrite(hFile, var);
				format(var, 1024, "BibitAnggur=%d\n",PlayerInfo[MAX_PLAYERS][pBibitAnggur]);fwrite(hFile, var);
				format(var, 1024, "BibitBlueberry=%d\n",PlayerInfo[MAX_PLAYERS][pBibitBlueberry]);fwrite(hFile, var);
				format(var, 1024, "BibitStrawberry=%d\n",PlayerInfo[MAX_PLAYERS][pBibitStrawberry]);fwrite(hFile, var);
				format(var, 1024, "BibitGandum=%d\n",PlayerInfo[MAX_PLAYERS][pBibitGandum]);fwrite(hFile, var);
				format(var, 1024, "BibitTomat=%d\n",PlayerInfo[MAX_PLAYERS][pBibitTomat]);fwrite(hFile, var);
				format(var, 1024, "Warrants=%s\n",PlayerInfo[MAX_PLAYERS][pWarrant]);fwrite(hFile, var);
				format(var, 1024, "JudgeJailTime=%d\n",PlayerInfo[MAX_PLAYERS][pJudgeJailTime]);fwrite(hFile, var);
				format(var, 1024, "JudgeJailType=%d\n",PlayerInfo[MAX_PLAYERS][pJudgeJailType]);fwrite(hFile, var);
				format(var, 1024, "BeingSentenced=%d\n",PlayerInfo[MAX_PLAYERS][pBeingSentenced]);fwrite(hFile, var);
				format(var, 1024, "ProbationTime=%d\n",PlayerInfo[MAX_PLAYERS][pProbationTime]);fwrite(hFile, var);
	    		format(var, 1024, "CallsAccepted=%d\n", PlayerInfo[MAX_PLAYERS][pCallsAccepted]);fwrite(hFile, var);
	    		format(var, 1024, "PatientsDelivered=%d\n",PlayerInfo[MAX_PLAYERS][pPatientsDelivered]);fwrite(hFile, var);
	    		format(var, 1024, "LiveBanned=%d\n",PlayerInfo[MAX_PLAYERS][pLiveBanned]);fwrite(hFile, var);
	    		format(var, 1024, "FreezeBank=%d\n",PlayerInfo[MAX_PLAYERS][pFreezeBank]);fwrite(hFile, var);
				format(var, 1024, "Component=%d\n",PlayerInfo[MAX_PLAYERS][pComponent]);fwrite(hFile, var);
				format(var, 1024, "BoomBox=%d\n",PlayerInfo[MAX_PLAYERS][pBoomBox]);fwrite(hFile, var);
				fclose(hFile);
	}
	return 1;
}

//----- End of file handling for players

stock ini_GetKey( line[] )
{
	new keyRes[256];
	keyRes[0] = 0;
	if ( strfind( line , "=" , true ) == -1 ) return keyRes;
	strmid( keyRes , line , 0 , strfind( line , "=" , true ) , sizeof( keyRes) );
	return keyRes;
}

stock ini_GetValue( line[] )
{
	new valRes[256];
	valRes[0]=0;
	if ( strfind( line , "=" , true ) == -1 ) return valRes;
	strmid( valRes , line , strfind( line , "=" , true )+1 , strlen( line ) , sizeof( valRes ) );
	return valRes;
}

SaveDynamicDoors() {

	new	szFileStr[512],
		File: fHandle = fopen("dynamicdoors.cfg", io_write);

		for(new iIndex; iIndex < MAX_DDOORS; iIndex++) {
			format(szFileStr, sizeof(szFileStr), "%s|%d|%d|%d|%d|%d|%f|%f|%f|%f|%f|%f|%f|%f|%d|%d|%d|%d|%d|%d|%d|%d|%d|%s|%d\r\n",
			DDoorsInfo[iIndex][ddDescription],
			DDoorsInfo[iIndex][ddCustomInterior],
			DDoorsInfo[iIndex][ddExteriorVW],
			DDoorsInfo[iIndex][ddExteriorInt],
			DDoorsInfo[iIndex][ddInteriorVW],
			DDoorsInfo[iIndex][ddInteriorInt],
			DDoorsInfo[iIndex][ddExteriorX],
			DDoorsInfo[iIndex][ddExteriorY],
			DDoorsInfo[iIndex][ddExteriorZ],
			DDoorsInfo[iIndex][ddExteriorA],
			DDoorsInfo[iIndex][ddInteriorX],
			DDoorsInfo[iIndex][ddInteriorY],
			DDoorsInfo[iIndex][ddInteriorZ],
			DDoorsInfo[iIndex][ddInteriorA],
			DDoorsInfo[iIndex][ddCustomExterior],
			DDoorsInfo[iIndex][ddVIP],
	  		DDoorsInfo[iIndex][ddFamily],
	  		DDoorsInfo[iIndex][ddFaction],
	  		DDoorsInfo[iIndex][ddAdmin],
	  		DDoorsInfo[iIndex][ddWanted],
	  		DDoorsInfo[iIndex][ddVehicleAble],
	  		DDoorsInfo[iIndex][ddColor],
	  		DDoorsInfo[iIndex][ddPickupModel],
	  		DDoorsInfo[iIndex][dPass],
	  		DDoorsInfo[iIndex][dLocked]
		);
		fwrite(fHandle, szFileStr);
	}
	return fclose(fHandle);
}

SaveDynamicMapIcons() {

	new
		szFileStr[326],
		File: fHandle = fopen("dynamicmapicons.cfg", io_write);

	for(new iIndex; iIndex < MAX_DMAPICONS; iIndex++) {
		format(szFileStr, sizeof(szFileStr), "%d|%d|%d|%d|%f|%f|%f\r\n",
			DMPInfo[iIndex][dmpMarkerType],
			DMPInfo[iIndex][dmpColor],
			DMPInfo[iIndex][dmpVW],
			DMPInfo[iIndex][dmpInt],
			DMPInfo[iIndex][dmpPosX],
			DMPInfo[iIndex][dmpPosY],
			DMPInfo[iIndex][dmpPosZ]
		);
		fwrite(fHandle, szFileStr);
	}
	return fclose(fHandle);
}

stock SaveGates()
{
	new idx = 1, File:file;
	new string[350];
	while(idx < MAX_GATES)
	{
	    format(string, sizeof(string), "%d|%f|%f|%f|%f|%f|%f|%f|%f|%f|%f|%f|%f|%s|%f|%i|%i|%i|%i|%i|%f|%d\r\n",
		GateInfo[idx][gModel],
		GateInfo[idx][gCX],
		GateInfo[idx][gCY],
		GateInfo[idx][gCZ],
		GateInfo[idx][gCRX],
		GateInfo[idx][gCRY],
		GateInfo[idx][gCRZ],
		GateInfo[idx][gOX],
		GateInfo[idx][gOY],
		GateInfo[idx][gOZ],
		GateInfo[idx][gORX],
		GateInfo[idx][gORY],
		GateInfo[idx][gORZ],
		GateInfo[idx][gPassword],
		GateInfo[idx][gRange],
		GateInfo[idx][gFaction],
		GateInfo[idx][gWorkshop],
		GateInfo[idx][gHID],
		GateInfo[idx][gVW],
		GateInfo[idx][gInt],
		GateInfo[idx][gSpeed],
		GateInfo[idx][gOwner]);
		GateInfo[idx][gStatus] = 0;
	    if(idx == 1)
	    {
	        file = fopen("gates.cfg", io_write);
	    }
	    else
	    {
	    	file = fopen("gates.cfg", io_append);
	    }
		fwrite(file, string);
		fclose(file);
		idx++;
	}
	print("Gates saved successfully.");
	return 1;
}

public BroadCast(color,String[])
{
	SendClientMessageToAllEx(color, String);
	return 1;
}

stock ShopTechBroadCast(color,String[])
{
	foreach(Player, i)
	{
		if (PlayerInfo[i][pAdmin] >= 6)
		{
			SendClientMessageEx(i, color, String);
		}
	}
	return 1;
}

stock ABroadCast(color,String[],level)
{
	foreach(Player, i)
	{
		if (PlayerInfo[i][pAdmin] >= level && PlayerInfo[i][pTogReports] != 1)
		{
			SendClientMessageEx(i, color, String);
			//printf("%s", String);
		}
	}
	return 1;
}

public OOCOff(color,String[])
{
	foreach(Player, i)
	{
		if(!gOoc[i])
		{
			SendClientMessageEx(i, color, String);
		}
	}
}

public OOCNews(color,String[])
{
	foreach(Player, i)
	{
		if(!gNews[i])
		{
			SendClientMessageEx(i, color, String);
		}
	}
}

public SendRadioMessage(team, color, String[])
{
	foreach(Player, i)
	{
		if(PlayerInfo[i][pMember] == team)
		{
		    new S3MP4K[256];
			SendClientMessageEx(i, color, String);
			format(S3MP4K, sizeof(S3MP4K), "[<RADIO>]\n* %s *", String);
			SetPlayerChatBubble(i, S3MP4K, COLOR_FBI, 10.0, 3000);
		}
	}
}

public SendDepartmentMessage(member, color, String[])
{
	foreach(Player, i)
	{
		if(PlayerInfo[i][pMember] == member)
		{
		    new S3MP4K[1000];
			SendClientMessageEx(i, color, String);
			format(S3MP4K, sizeof(S3MP4K), "[<DEPARTMENT>]\n* %s *", String);
			SetPlayerChatBubble(i, S3MP4K, DEPTRADIO, 10.0, 3000);
		}
	}
}

stock ORANK(playerid)
{
	new name[32];
	if(PlayerInfo[playerid][pLevel] == 1) format(name, sizeof(name), "Newbie");
	else if(PlayerInfo[playerid][pLevel] == 2) format(name, sizeof(name), "Regular Player");
	else if(PlayerInfo[playerid][pLevel] == 3) format(name, sizeof(name), "Junior Player");
	else if(PlayerInfo[playerid][pLevel] == 4) format(name, sizeof(name), "Second Player");
	else if(PlayerInfo[playerid][pLevel] == 5) format(name, sizeof(name), "Senior Player");
	else if(PlayerInfo[playerid][pLevel] == 6) format(name, sizeof(name), "Big Slave");
	else if(PlayerInfo[playerid][pLevel] == 7) format(name, sizeof(name), "Royal Slave");
	else if(PlayerInfo[playerid][pLevel] == 8) format(name, sizeof(name), "Perfect Slave");
	else if(PlayerInfo[playerid][pLevel] == 9) format(name, sizeof(name), "Get a Life");
	else if(PlayerInfo[playerid][pLevel] == 10) format(name, sizeof(name), "Take a Life");
	else if(PlayerInfo[playerid][pLevel] == 11) format(name, sizeof(name), "9 Life");
	else if(PlayerInfo[playerid][pLevel] == 12) format(name, sizeof(name), "Big Ranked");
	else if(PlayerInfo[playerid][pLevel] == 13) format(name, sizeof(name), "High Ranked");
	else if(PlayerInfo[playerid][pLevel] == 14) format(name, sizeof(name), "Big Roller");
	else if(PlayerInfo[playerid][pLevel] == 15) format(name, sizeof(name), "High Roller");
	else if(PlayerInfo[playerid][pLevel] == 16) format(name, sizeof(name), "Get a Roller");
	else if(PlayerInfo[playerid][pLevel] == 17) format(name, sizeof(name), "9 Life Roller");
	else if(PlayerInfo[playerid][pLevel] == 18) format(name, sizeof(name), "Loyal Player");
	else if(PlayerInfo[playerid][pLevel] == 19) format(name, sizeof(name), "Perfect Player");
	else if(PlayerInfo[playerid][pLevel] == 20) format(name, sizeof(name), "Legend Of Player");
	else if(PlayerInfo[playerid][pLevel] == 21) format(name, sizeof(name), "Level 21");
	else if(PlayerInfo[playerid][pLevel] == 22) format(name, sizeof(name), "Level 22");
	else if(PlayerInfo[playerid][pLevel] == 23) format(name, sizeof(name), "Level 23");
	else if(PlayerInfo[playerid][pLevel] == 24) format(name, sizeof(name), "Level 24");
	else if(PlayerInfo[playerid][pLevel] == 25) format(name, sizeof(name), "Level 25");
	else if(PlayerInfo[playerid][pLevel] == 26) format(name, sizeof(name), "Level 26");
	else if(PlayerInfo[playerid][pLevel] == 27) format(name, sizeof(name), "Level 27");
	else if(PlayerInfo[playerid][pLevel] == 28) format(name, sizeof(name), "Level 28");
	else if(PlayerInfo[playerid][pLevel] == 29) format(name, sizeof(name), "Level 29");
	else if(PlayerInfo[playerid][pLevel] == 30) format(name, sizeof(name), "Level 30");
	else if(PlayerInfo[playerid][pLevel] == 31) format(name, sizeof(name), "Level 31");
	else if(PlayerInfo[playerid][pLevel] == 32) format(name, sizeof(name), "Level 32");
	else if(PlayerInfo[playerid][pLevel] == 33) format(name, sizeof(name), "Level 33");
	else if(PlayerInfo[playerid][pLevel] == 34) format(name, sizeof(name), "Level 34");
	else if(PlayerInfo[playerid][pLevel] == 35) format(name, sizeof(name), "Level 35");
	return name;
}

stock FormatMoney(Float:amount, delimiter[2]=".", comma[2]=",")
{
	#define MAX_MONEY_String 16
	new txt[MAX_MONEY_String];
	format(txt, MAX_MONEY_String, "%d", floatround(amount));
	new l = strlen(txt);
	if (amount < 0) // -
	{
		if (l > 2) strins(txt,delimiter,l-2);
		if (l > 5) strins(txt,comma,l-5);
		if (l > 8) strins(txt,comma,l-8);
	}
	else
	{//1000000
		if (l > 2) strins(txt,delimiter,l-2);
		if (l > 5) strins(txt,comma,l-5);
		if (l > 9) strins(txt,comma,l-8);
	}
//	if (l <= 2) format(txt,sizeof( szStr ),"00,%s",txt);
	return txt;
}


stock IsPlayerOwnerOfCDEx(playerid, dealershipid)
{
	new owner[MAX_PLAYER_NAME];
	GetPlayerName(playerid, owner, sizeof(owner));
	if(strcmp(CarDealershipInfo[dealershipid][cdOwner],owner, true ) == 0)
	{
	    return 1;
	}
	return 0;
}

stock SendCopMessage(color, String[])
{
	foreach(Player, i)
	{
		if((IsPlayerConnected(i) && PlayerInfo[i][pMember] == 1) ||(IsPlayerConnected(i) && PlayerInfo[i][pMember] == 2) ||(IsPlayerConnected(i) && PlayerInfo[i][pMember] == 3) || (IsPlayerConnected(i) && PlayerInfo[i][pMember] == 7) || (IsPlayerConnected(i) && PlayerInfo[i][pMember] == 11))
		{
		    SendClientMessage(i, color, String);
		}
	}
	return 1;
}
public SendRadioOOCMessage(member, color, String[])
{
	foreach(Player, i)
	{
		if(PlayerInfo[i][pMember] == member)
		{
			SendClientMessageEx(i, color, String);
		}
	}
}

public SendJobMessage(job, color, String[])
{
	foreach(Player, i)
	{
		if((PlayerInfo[i][pJob] == job || PlayerInfo[i][pJob2] == job) && JobDuty[i] == 1)
		{
			SendClientMessageEx(i, color, String);
		}
	}
}


//---------------------------------------------------------


CMD:stats(playerid, params[]) {
	if (gPlayerLogged{playerid} != 0) {
		ShowStats(playerid,playerid);
	}
	return 1;
}

CMD:check(playerid, params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 2)
	{
		new giveplayerid;
		if(sscanf(params, "u", giveplayerid)) return SendClientMessageEx(playerid, COLOR_GRAD1, "KEGUNAAN: /check [playerid]");
		if(IsPlayerConnected(giveplayerid))
		{
			ShowStats(playerid,giveplayerid);
		}
		else
		{
			SendClientMessageEx(playerid, COLOR_GRAD1, "Invalid player specified.");
		}
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD1, "You're not an administrator.");
	}
	return 1;
}

