

stock LoadWorkshop()
{
	new FileName[128], string[1000];
    for(new i = 0; i < MAX_WORKSHOP; i++)
    {
        format(FileName, sizeof(FileName), "Businesses/Workshop_%d.ini", i);
        if(dini_Exists(FileName))
        {
            WsInfo[i][wsOwned] = dini_Int(FileName, "Owned" );
            WsInfo[i][wsOwner] = dini_Get( FileName, "Owner" );
			WsInfo[i][wsName] = dini_Get( FileName, "Name" );
			WsInfo[i][wsPosX] = dini_Float(FileName, "PosX" );
			WsInfo[i][wsPosY] = dini_Float(FileName, "PosY" );
			WsInfo[i][wsPosZ] = dini_Float(FileName, "PosZ" );
			WsInfo[i][wsStatus] = dini_Int(FileName, "Status" );
			WsInfo[i][wsPrice] = dini_Int(FileName, "Price" );
			WsInfo[i][wsSafeMoney] = dini_Int(FileName, "SafeMoney" );
			WsInfo[i][wsComponent] = dini_Int(FileName, "Component" );
			WsInfo[i][wsPapanX] = dini_Float(FileName, "wsPapanX" );
			WsInfo[i][wsPapanY] = dini_Float(FileName, "wsPapanY" );
			WsInfo[i][wsPapanZ] = dini_Float(FileName, "wsPapanZ" );
			WsInfo[i][wsPapanRotX] = dini_Float(FileName, "wsPapanRotX" );
			WsInfo[i][wsPapanRotY] = dini_Float(FileName, "wsPapanRotY" );
			WsInfo[i][wsPapanRotZ] = dini_Float(FileName, "wsPapanRotZ" );
			WsInfo[i][wsPapanMT] = dini_Int(FileName, "PapanMT" );
			WsInfo[i][wsGate] = dini_Int(FileName, "Gate");
			WsInfo[i][wsGateOX] = dini_Float(FileName, "wsGateOX" );
			WsInfo[i][wsGateOY] = dini_Float(FileName, "wsGateOY" );
			WsInfo[i][wsGateOZ] = dini_Float(FileName, "wsGateOZ" );
			WsInfo[i][wsGateCX] = dini_Float(FileName, "wsGateCX" );
			WsInfo[i][wsGateCY] = dini_Float(FileName, "wsGateCY" );
			WsInfo[i][wsGateCZ] = dini_Float(FileName, "wsGateCZ" );
			WsInfo[i][wsGateORX] = dini_Float(FileName, "wsGateORX" );
			WsInfo[i][wsGateORY] = dini_Float(FileName, "wsGateORY" );
			WsInfo[i][wsGateORZ] = dini_Float(FileName, "wsGateORZ" );
			WsInfo[i][wsGateCRX] = dini_Float(FileName, "wsGateCRX" );
			WsInfo[i][wsGateCRY] = dini_Float(FileName, "wsGateCRY" );
			WsInfo[i][wsGateCRZ] = dini_Float(FileName, "wsGateCRZ" );
			WsInfo[i][wsGate] = dini_Int(FileName, "Gate2");
			WsInfo[i][wsGateOX] = dini_Float(FileName, "wsGateOX2" );
			WsInfo[i][wsGateOY] = dini_Float(FileName, "wsGateOY2" );
			WsInfo[i][wsGateOZ] = dini_Float(FileName, "wsGateOZ2" );
			WsInfo[i][wsGateCX] = dini_Float(FileName, "wsGateCX2" );
			WsInfo[i][wsGateCY] = dini_Float(FileName, "wsGateCY2" );
			WsInfo[i][wsGateCZ] = dini_Float(FileName, "wsGateCZ2" );
			WsInfo[i][wsGateORX] = dini_Float(FileName, "wsGateORX2" );
			WsInfo[i][wsGateORY] = dini_Float(FileName, "wsGateORY2" );
			WsInfo[i][wsGateORZ] = dini_Float(FileName, "wsGateORZ2" );
			WsInfo[i][wsGateCRX] = dini_Float(FileName, "wsGateCRX2" );
			WsInfo[i][wsGateCRY] = dini_Float(FileName, "wsGateCRY2" );
			WsInfo[i][wsGateCRZ] = dini_Float(FileName, "wsGateCRZ2" );
			WsInfo[i][wsPapanText] = dini_Get( FileName, "PapanText" );
			printf( "[system] Workshop %d spawned.", i);
   			SpawnedWS++;
            if(WsInfo[i][wsOwned] == 1)
			{
				WsInfo[i][wsPapan] = CreateDynamicObject(18244, WsInfo[i][wsPapanX], WsInfo[i][wsPapanY], WsInfo[i][wsPapanZ], WsInfo[i][wsPapanRotX], WsInfo[i][wsPapanRotY], WsInfo[i][wsPapanRotZ]);
				format(string, sizeof(string), "%s", WsInfo[i][wsPapanText]);
				WsInfo[i][wsPapanText] = SetDynamicObjectMaterialText(WsInfo[i][wsPapan], 0, string, 120, "Arial", 24, 0, 0xFFFFFFFF, -16777216, 1);
				WsInfo[i][wsGate] = CreateDynamicObject(7709, WsInfo[i][wsGateCX], WsInfo[i][wsGateCY], WsInfo[i][wsGateCZ], WsInfo[i][wsGateCRZ], WsInfo[i][wsGateCRZ], WsInfo[i][wsGateCRZ]);
				WsInfo[i][wsGate2] = CreateDynamicObject(7709, WsInfo[i][wsGateCX2], WsInfo[i][wsGateCY2], WsInfo[i][wsGateCZ2], WsInfo[i][wsGateCRZ2], WsInfo[i][wsGateCRZ2], WsInfo[i][wsGateCRZ2]);
			}
			else
			{
   				WsInfo[i][wsPickup] = CreatePickup(1239, 1, WsInfo[i][wsPosX], WsInfo[i][wsPosY], WsInfo[i][wsPosZ], 0);
				format(string, sizeof(string), "[id:%d]\nthis workshop is for sale\nPrice : $%s\nuse '/buyworkshop' for purchase this workshop", WsInfo[i][wsOwner], FormatMoney(WsInfo[i][wsPrice]), i);
				WsInfo[i][wsText] = CreateStreamed3DTextLabel(string, COLOR_WHITE, WsInfo[i][wsPosX], WsInfo[i][wsPosY], WsInfo[i][wsPosZ], 5, 0, 0);
			}
	    }
    }
	return 1;
}

WeaponInfoFile(playerid)
{
	new name[MAX_PLAYER_NAME], file[40];

	GetPlayerName(playerid, name, sizeof(name));
	format(file, sizeof(file), "Weapons/%s.ini", name);

	return file;
}

LoadServerStats()
{
	#define SERVER_STATS "serverstat.ini"

	if(!fexist(SERVER_STATS)) return 1;

	new	File: i_FileHandle = fopen("serverstat.ini", io_read), sz_FileStr[256];

	fread(i_FileHandle, sz_FileStr);
	sscanf(sz_FileStr, "p<,>iiiiiiiiiii", TotalLogin, TotalConnect, TotalAutoBan, TotalRegister, MaxPlayersConnected, MPDay, MPMonth, MPYear, MPHour, MPMinute, TotalUptime);
	return fclose(i_FileHandle);
}


LoadStock()
{
	new arrCoords[20][64];
	new strFromFile2[256];
	new File: file = fopen("stock.ini", io_read);
	if (file)
	{
		fread(file, strFromFile2);
		splits(strFromFile2, arrCoords, ',');
		StockIkan = strval(arrCoords[0]);
		IDPlate = strval(arrCoords[1]);
		stockcomp = strval(arrCoords[2]);
		StockDPU = strval(arrCoords[3]);
		stockplant = strval(arrCoords[4]);
		stockpot = strval(arrCoords[5]);
		stockcrack = strval(arrCoords[6]);
		EquipmentStock = strval(arrCoords[7]);
		cutt = strval(arrCoords[8]);
		fclose(file);
	}
	else
	{
		GameModeExit();
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



LoadStuff()
{
	new arrCoords[12][64];
	new strFromFile2[256];
	new File: file = fopen("stuff.ini", io_read);
	if (file)
	{
		fread(file, strFromFile2);
		splits(strFromFile2, arrCoords, ',');
		Jackpot = strval(arrCoords[0]);
		if(Jackpot < 0)
		{
		    Jackpot = 0;
		}
		Tax = strval(arrCoords[1]);
		TaxValue = strval(arrCoords[2]);
		if(TaxValue < 0)
		{
		    TaxValue = 0;
		}
		Security = strval(arrCoords[3]);
		SpecTimer = strval(arrCoords[5]);
		fclose(file);
  		if(Security == 0 || Security == 1)
		{
		}
		else
		{
			GameModeExit();
		}
	}
	else
	{
		GameModeExit();
	}
	return 1;
}
