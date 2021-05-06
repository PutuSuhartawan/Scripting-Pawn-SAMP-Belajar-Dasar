new Text:RedScreen;


enum pInfo
{
	bool:pConnect,
	bool:pDeath,
	bool:pFreez,
	pName1[32],
	pName2[32],
	pIp[20],
	pRegIp[20],
	pAFK,
	pAFK2,
	Float:pAfkX,
	Float:pAfkY,
	Float:pAfkZ,
	Float:pTPX,
	Float:pTPY,
	Float:pTPZ,
	pTime,
	pName[32],
	pID,
	pIDinSvr,
	pPass[43],
	pMail[64],
	pAdmin,
	pAdminPass,
	pMoney,
	pSex,
	pSkin,
	pBSkin,
	pLevel,
	ptLevel,
	Float:pX,
	Float:pY,
	Float:pZ,
	Float:pA,
	
	pInt,
	pWorld,
	Float:pHealth,
	pEndurance,
	ptEndurance,
	pPhoto,
	pPasport,
	pPasNum[10],
	pAge[11],
	pDay,
	pMond,
	pGod,
	pGorod,
	pSlot1,
	pSlot8,
	pSlot2,
	pSlot3,
	pSlot4,
	pSlot9,
	pSlot5,
	pSlot6,
	pSlot7,
	pSlot10,
	pSlot11,
	pSlot12,
	pSlot13,
	pSlot14,
	pLicA,
	pLicB,
	pLicC,
	pLicF,
	pLicG,
	pDownLicABC,
	pDownLicF,
	pDownLicG,
	pGunLic,
	pSLicA,
	pSLicB,
	pSLicC,
	pSLicF,
	pSLicG,
	pBank,
	pPayDay,
	pDeposit,
	pVehicleS1,
	pVehicleS2,
	pVehicleS3,
	pVehicleS4,
	pVehicleS5,
	pDepTime,
	pHospital,
	pDoc1,
	pDoc2,
	pDoc3,
	pDoc4,
	pVip,
	pHSpawn,
	pMute1,
	pMute2,
	pMute3,
	pMute4,
	pPrison,
	ptBan,
	ptBanN[32],
	ptBanR[128],
	pWarn,
	pRace,
	pTimeDis,
	pEat,
	pNeed,
	pSoif,
	pJob,
	pSkillFerm,
	pSkillVor,
	pSkillMech,
	pSkillDalno,
	pPhone,
	pPhoneNumber,
	pMaxInv,
	pChetInv,
	pLeader,
	pMember,
	pGroup,
	pRank,
	pRebuke,
	pFMute,
	pPauseRob,
	pDrugTime,
	pWanted,
	pTimWanted,
	pArest,
	pJail,
	pNewTime,
	pEnergy,
	pPauseEnergy,
	pSportUse,
	pSportTrener,
	pSportTrenerIP,
	pPauseSkill,
	Float:pRvol,
	pSellProp,
	Float:pDeathX,
	Float:pDeathY,
	Float:pDeathZ,
	pWaitingAccD,
	pWound,
	pTimPayDay,
	pPauseGraf,
	pUseStyle,
	pBoxing,
	pKungfu,
	pKneeHead,
	pGrabKick,
	pElbow,
	pTrenerID,
	pTrenerStyle,
	pTreningMax,
	pStopTrenStyle,
	pNoTir,
	pSkillGun0,
	pSkillGun1,
	pSkillGun2,
	pSkillGun3,
	pSkillGun4,
	pSkillGun5,
	pSkillGun6,
	pSkillGun7,
	pSkillGun8,
	pSkillGun9,
	pSkillGun10,
	pCrystal,
	bool:pStatsAction,
    Text3D:pAction,
    pMaxAsk,
    pMaxGame,
    pTofic,
    pBrulev,
    pADostup,
}
new Player[MAX_PLAYERS+1][pInfo];


public OnGameModeInit()
{

			  Text:RedScreen = TextDrawCreate(317.000000, 
		    -400.000000, // ini adalah sumbu y supaya bisa pindah atas bawah
		     "Tabrakan");
		  TextDrawFont(Text:RedScreen, 1);
		  TextDrawLetterSize(Text:RedScreen, 200.258332, 100.750000);
		  TextDrawTextSize(Text:RedScreen, 1000.500000, 1000.500000);
		  TextDrawSetOutline(Text:RedScreen, 1);
		  TextDrawSetShadow(Text:RedScreen, 0);
		  TextDrawAlignment(Text:RedScreen, 2);
		  TextDrawColor(Text:RedScreen, 0xFF000011);
		  TextDrawBackgroundColor(Text:RedScreen, 255);
		  TextDrawBoxColor(Text:RedScreen, 0xFF000011);
		  TextDrawUseBox(Text:RedScreen, 1);
		  //TextDrawSetProportional(Text:RedScreen, 1);
		  //TextDrawSetSelectable(Text:RedScreen, 0);
      
}

public OnPlayerDeath(playerid, killerid, reason)
{
	new strID[100];
	ApplyAnimation(playerid,"CRACK","crckidle2",4.1,1,1,1,1,1,1);
	GetPlayerPos(playerid, Float:Player[playerid][pDeathX], Float:Player[playerid][pDeathY], Float:Player[playerid][pDeathZ]);
	Player[playerid][pWaitingAccD]=1; //Player[playerid][pWound]=1;
	if(Player[playerid][pWaitingAccD] == 1 )
	{
		Player[playerid][pWorld] = GetPlayerVirtualWorld(playerid);
	   	Player[playerid][pInt] = GetPlayerInterior(playerid);
		SetPlayerHealth(playerid, Float:100.0);
		ChowTextPhone(playerid,0);
		PlayerTazer[playerid]=0;
		PlayerLeadPlaya[playerid]=-1;
	    PlayerDownCall(playerid);
		OnPlayerStopZaxvat(playerid);
		Player[playerid][pEat]=100;
		Player[playerid][pNeed]=100;
		Player[playerid][pSoif]=100;
		PlayerUpDateNeedBar(playerid);
		TimerNoUpItem[playerid]=0;
		TimerRanenie[playerid]=0;
		TimeUseBint[playerid]=0;
		TimeUseZgyt[playerid]=0;
	    Player[playerid][pWound]=0;
	  	SavePlayer(playerid,Woundx);



		ApplyAnimation(playerid,"CRACK","crckidle2",4.1,1,1,1,1,1);
		SetPlayerDrunkLevel(playerid, 999999);
		TextDrawShowForPlayer(playerid, Text:RedScreen);
		//SetPlayerVirtualWorld(playerid, Player[playerid][pWorld]);
	   	//SetPlayerInterior(playerid, Player[playerid][pInt]);
	   	//SetPlayerSkin(playerid,Player[playerid][pSkin]); 
		//PlayerFreeze(playerid, 1, 60000); // wtih timer freeze in 1 minute.
		SetPlayerHealth(playerid, Float:20.0);
		
		//n_ApplyAnimation(playerid,"CRACK","crckidle2",4.1,0,1,1,1,1,1);
		//SetPlayerPos(playerid, Float:Player[playerid][pDeathX], Float:Player[playerid][pDeathY], Float:Player[playerid][pDeathZ]);
		//format(strID,sizeof(strID),"INJURED: Please use {FFFF00}'/acceptdeath'{FFFFFF} to roleplay in hospital. now your are coordinate is: %f, %f, %f ", Float:Player[playerid][pDeathX], Float:Player[playerid][pDeathY], Float:Player[playerid][pDeathZ] );
		//SCM(playerid,-1,strID);

		//TogglePlayerControllable(playerid,0);
		TogglePlayerControllable(playerid,0);
		return 0;//SpawnPlayer(playerid);
	}

}


public OnPlayerSpawn(playerid)
{
	new health;
	
	SetPlayerHealth(playerid, Float:100.0);
	
    SetPlayerSkin(playerid,Player[playerid][pSkin]);
    UpMoneyData(playerid);
    Player[playerid][pIDinSvr]=playerid;
    // update player IDinServer to Database
    
    new strID[300];
	format(strID,sizeof(strID),"UPDATE `PlayaRP` SET `IDinSvr`='%i' WHERE `ID`='%i'", playerid, Player[playerid][pID]);
	n_mysql_query( MySQL1, strID, false);

	if(Player[playerid][pWaitingAccD] == 1)
	{
		ApplyAnimation(playerid,"CRACK","crckidle2",4.1,1,1,1,1,1);
		SetPlayerDrunkLevel(playerid, 999999);
		TextDrawShowForPlayer(playerid, Text:RedScreen);
		SetPlayerVirtualWorld(playerid, Player[playerid][pWorld]);
	   	SetPlayerInterior(playerid, Player[playerid][pInt]);
	   	SetPlayerSkin(playerid,Player[playerid][pSkin]); 
		//PlayerFreeze(playerid, 1, 60000); // wtih timer freeze in 1 minute.
		SetPlayerHealth(playerid, Float:20.0);
		
		//n_ApplyAnimation(playerid,"CRACK","crckidle2",4.1,0,1,1,1,1,1);
		SetPlayerPos(playerid, Float:Player[playerid][pDeathX], Float:Player[playerid][pDeathY], Float:Player[playerid][pDeathZ]);
		format(strID,sizeof(strID),"INJURED: Please use {FFFF00}'/acceptdeath'{FFFFFF} to roleplay in hospital. now your are coordinate is: %f, %f, %f ", Float:Player[playerid][pDeathX], Float:Player[playerid][pDeathY], Float:Player[playerid][pDeathZ] );
		SCM(playerid,-1,strID);

		//TogglePlayerControllable(playerid,0);
		return TogglePlayerControllable(playerid,0);
	}
	
}

CMD:acceptdeath(playerid, params[])
{
	if(Player[playerid][pWaitingAccD] == 1)
	{
		Player[playerid][pWaitingAccD] = 0;
		
		Player[playerid][pWound]=0;
		SetPlayerDrunkLevel(playerid, 0);
		//PlayerFreeze(playerid, 0, 0); // with timer is not freeze 
		SendClientMessage(playerid, -1, "HOSPITAL: You are need calling medic service.");
		TextDrawHideForPlayer(playerid, Text:RedScreen); 
		SetPlayerHealth(playerid, Float:5.0);
		//ClearAnimations(playerid, 1);
		//ApplyAnimation(playerid,"RYDER","RYD_Die_PT1",0,0,0,0,0,0);
		//SpawnPlayer(playerid);
		TogglePlayerControllable(playerid,1);
		return 1;
	}
		
}



CMD:sethp(playerid, params[])
{
	new  Float:x, Float:y, Float:z;
    if(SCMAdmin(playerid,3)==1)return true;
    if(sscanf(params, "ii",params[0],params[1])) return SCM(playerid, CG1, "Gunakan: /sethp [ID] [Jumlah]");
    if(Player[params[0]][pConnect]==false)return SCM(playerid,CG1,"Pemain tidak terhubung!",1);
    GetPlayerPos(params[0], Float:x, Float:y, Float:z);
    //GivePlayerHealth(params[0],params[1],1);
    if(params[1] < 1 )
    {
    	Player[params[0]][pWaitingAccD] = 1;
    	SetSpawnInfo(params[0],0,Player[params[0]][pSkin], Float:x, Float:y, Float:z,64.0,0,0,0,0,0,0);
    	SetPlayerHealth(params[0], Float:100.0);
    	return SpawnPlayer(params[0]);
    }
    PauseHP[params[0]]=20;
    Player[params[0]][pHealth]=params[1];
    SetPlayerHealth(params[0],params[1]);

    
    new sethp[150];
	format(sethp,sizeof(sethp),"%s menentukan %i HP. Pemain: %s",GN(params[0]),params[1],CheckAdmin(playerid));
    if(params[0]!=playerid)SCM(params[0],0xff0033FF,sethp,2);
	ADMINchat(0xff0033FF,sethp);

    return true;
}


