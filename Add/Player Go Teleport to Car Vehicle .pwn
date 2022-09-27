
CMD:gotoveh(playerid, params[])
{
	if(GetPlayerAdminEx(playerid) < 3) return 1;
	if(GetPlayerData(playerid, P_ADMIN_DUTY) == 0) //return SendClientMessage(playerid,-1,"{00ff00}Kamu Sedang Tidak OnDuty Admin /aduty untuk OnDuty");

	{
		new carid;
		if(sscanf(params, "d", carid)) return SendClientMessage(playerid, 0xCECECEFF, "USAGE: /gotoveh [carid]");

		new Float:cwx2,Float:cwy2,Float:cwz2;
		GetVehiclePos(carid, cwx2, cwy2, cwz2);
		if (GetPlayerState(playerid) == 2)
		{
			new tmpcar = GetPlayerVehicleID(playerid);
			SetVehiclePos(tmpcar, cwx2, cwy2, cwz2);
			//TelePos[playerid][0] = 0.0;TelePos[playerid][1] = 0.0;
		}
		else
		{
			SetPlayerPos(playerid, cwx2, cwy2, cwz2);
		}
		SendClientMessage(playerid, 0xCECECEFF, "   You have been teleported!");
		//SetPlayerInterior(playerid,0);
	}
	else
	{
		SendClientMessage(playerid, 0xCECECEFF, "ERROR: You don't have the privilege to use this command!");
	}
	return 1;
}


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
	Float:pAro[13],
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
new gh[MAX_PLAYERS];
new musicinternet[MAX_PLAYERS];
new Float:flyPos[MAX_PLAYERS][3];
new pMancing[MAX_PLAYERS];
//new pass[MAX_PLAYERS];
new TakeBox[MAX_PLAYERS];
//new useinternet[MAX_PLAYERS]=0;

new lspddoor1;


//Stock
forward usepainkillerT();
public usepainkillerT()
{
	foreach(Player, i)
	{
	    if(PlayerInfo[i][pUsePainkiller] == 1)
	    {
			PlayerInfo[i][pUsePainkiller] = 0;
			SendClientMessage(i, COLOR_ARWIN, "PAINKILLER: {FFFF00}Painkiller timer was done, you can use Painkiller again with '/usepainkiller'");
		}
	}
	return 1;

}
CarmodDialog(playerid)
{
	ShowPlayerDialog(playerid,1111,DIALOG_STYLE_LIST,"Select things to put in your car","Car Components","Select","Cancel");
	return 1;
}
Lowrider(playerid)
{
    ShowPlayerDialog(playerid,1001,DIALOG_STYLE_LIST,"Choose one","Paintjob\nChrome\nSlamin\n{FF0000}Back","Select","Cancel");
    return 1;
}
RegularCarDialog(playerid)
{
    new closestcar = GetClosestCar(playerid);
    new vehmd = GetVehicleModel(closestcar);
 	new String[1024];
	if(vehmd == 401 || vehmd == 496 || vehmd == 518 || vehmd == 540 || vehmd == 546 || vehmd == 589)
	{String = "Spoiler\nHood\nRoof\nVents\nSideskirt\nLights\n{FF0000}Back";}
	else if(vehmd == 549)
	{String = "Spoiler\nHood\nVents\nSideskirt\nLights\n{FF0000}Back";}
	else if(vehmd == 550)
	{String = "Spoiler\nHood\nRoof\nVents\nLights\n{FF0000}Back";}
	else if(vehmd == 585 || vehmd == 603)
	{String = "Spoiler\nRoof\nVents\nSideskirt\nLights\n{FF0000}Back";}
	else if(vehmd == 410 || vehmd == 436)
	{String = "Spoiler\nRoof\nSideskirt\nLights\n{FF0000}Back";}
	else if(vehmd == 439 || vehmd == 458)
	{String = "Spoiler\nVents\nSideskirt\nLights\n{FF0000}Back";}
	else if(vehmd == 551 || vehmd == 492 || vehmd == 529)
	{String = "Spoiler\nHood\nRoof\nSideskirt\n{FF0000}Back";}
	else if(vehmd == 489 || vehmd == 505)
	{String = "Spoiler\nHood\nRoof\nLights\n{FF0000}Back";}
	else if(vehmd == 516)
	{String = "Spoiler\nHood\nSideskirt\n{FF0000}Back";}
	else if(vehmd == 491 || vehmd == 517)
	{String = "Spoiler\nVents\nSideskirt\n{FF0000}Back";}
	else if(vehmd == 418 || vehmd == 527 || vehmd == 580)
	{String = "Spoiler\nRoof\nSideskirt\n{FF0000}Back";}
	else if(vehmd == 420 || vehmd == 587)
	{String = "Spoiler\nHood\n{FF0000}Back";}
	else if(vehmd == 547)
	{String = "Spoiler\nVents\n{FF0000}Back";}
	else if(vehmd == 415)
	{String = "Spoiler\nSideskirt\n{FF0000}Back";}

    ShowPlayerDialog(playerid,1004,DIALOG_STYLE_LIST,"Choose one",String,"Select","Cancel");
    return 1;
}
Mod0(playerid)//Alien
{
    ShowPlayerDialog(playerid,1511,DIALOG_STYLE_LIST,"Choose one","Right Sideskirt\nLeft Sideskirt\nExhaust\nRoof\nSpoiler\nFront Bumper\nRear Bumper\n{FF0000}Back","Select","Cancle");
    return 1;
}
Mod1(playerid)//X-Flow
{
	ShowPlayerDialog(playerid,1512,DIALOG_STYLE_LIST,"Choose one","Right Sideskirt\nLeft Sideskirt\nExhaust\nRoof\nSpoiler\nFront Bumper\nRear Bumper\n{FF0000}Back","Select","Cancle");
	return 1;
}
Mod2(playerid)//Chrome
{
    new closestcar = GetClosestCar(playerid);
    new vehmd = GetVehicleModel(closestcar);
    new String[1024];
	if(vehmd == 576 || vehmd == 575)
	{String = "Right Sideskirt\nLeft Sideskirt\nExhaust\nFront Bumper\nRear Bumper\n{FF0000}Back";}
	else if(vehmd == 535)
	{String = "Front Bullbars\nRear Bullbars\nExhaust\nFront Bumper\nRight Sideskirt\nLeft Sideskirt\n{FF0000}Back";}
	else if(vehmd == 567 || vehmd == 536)
	{String = "Exhaust\nRight Sideskirt\nLeft Sideskirt\nRear Bumper\nFront Bumper\n{FF0000}Back";}
	else if(vehmd == 534)
	{String = "Grill\nBars\nLights\nExhaust\nFront Bumper\nRear Bumper\n{FF0000}Back";}

    ShowPlayerDialog(playerid,1513,DIALOG_STYLE_LIST,"Choose one",String,"Select","Cancle");
	return 1;
}


/*AC-Balkan Security v0.7 R1 by Maki187 (Marko_Dimitrijevic)
http://www.balkan-rising.info/index.php?topic=10.0

http://balkan-samp.com/forum/index.php?topic=35102.0
PLEASE DON'T RENAME ANTICHEAT, AND UNDER THIS TEXT, DON'T CHANGE NOTHING, OR ANTICHEAT WON'T WORK!!*/
#include <a_players>
stock AC_BS_ResetPlayerMoney(playerid)
{
	ResetPlayerMoney(playerid);
	SetPVarInt(playerid, "SafeMoney", 1);
	return 1;
}
stock AC_BS_GivePlayerMoney(playerid, novac)
{
	GivePlayerMoney(playerid, novac);
	SetPVarInt(playerid, "SafeMoney", 1);
	return 1;
}
stock AC_BS_SetPlayerVirtualWorld(playerid, vw)
{
	SetPVarFloat(playerid,"TeleportProtection",1);
	SetPlayerVirtualWorld(playerid,vw);
	SetPVarInt(playerid, "SafeVW", vw);
	return 1;
}
stock AC_BS_SetPlayerInterior(playerid, intid)
{
	SetPVarFloat(playerid,"TeleportProtection",1);
	SetPlayerInterior(playerid, intid);
	SetPVarInt(playerid, "SafeInt", intid);
	return 1;
}
stock AC_BS_SetPlayerPos(playerid, Float:xx, Float:yy, Float:zz)
{
	SetPVarFloat(playerid,"TeleportProtection",1);
	SetPlayerPos(playerid, xx,yy,zz);
	SetPVarInt(playerid, "SafeTeleport", 1);
	return 1;
}
#define acime "[AC-Balkan Security]:"
stock AC_BS_SetPlayerHealth(playerid,Float:helti)
{
	SetPVarFloat(playerid,"HealthProtection",1);
	SetPlayerHealth(playerid,helti);
	SetPVarFloat(playerid,"SafeHealth",helti);
}
stock AC_BS_SetPlayerArmour(playerid,Float:armor)
{
	SetPVarFloat(playerid,"ArmourProtection",1);
	SetPlayerArmour(playerid,armor);
	SetPVarFloat(playerid,"SigurniArmor",armor);
}

CMD:gotocar(playerid, params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 2)
	{
		new carid;
		if(sscanf(params, "d", carid)) return SendClientMessageEx(playerid, COLOR_WHITE, "KEGUNAAN: /gotocar [carid]");

		new Float:cwx2,Float:cwy2,Float:cwz2;
		GetVehiclePos(carid, cwx2, cwy2, cwz2);
		if (GetPlayerState(playerid) == 2)
		{
			new tmpcar = GetPlayerVehicleID(playerid);
			SetVehiclePos(tmpcar, cwx2, cwy2, cwz2);
			TelePos[playerid][0] = 0.0;TelePos[playerid][1] = 0.0;
		}
		else
		{
			AC_BS_SetPlayerPos(playerid, cwx2, cwy2, cwz2);
		}
		SendClientMessageEx(playerid, COLOR_GRAD1, "   You have been teleported!");
		AC_BS_SetPlayerInterior(playerid,0);
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD1, "ERROR: You don't have the privilege to use this command!");
	}
	return 1;
}
