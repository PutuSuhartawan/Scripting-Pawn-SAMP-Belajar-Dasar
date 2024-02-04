



DisplayInventory(playerid, targetid = INVALID_PLAYER_ID)
{
	if(targetid == INVALID_PLAYER_ID) targetid = playerid;

	new package[12];
	switch(PlayerInfo[playerid][pSmuggleDrugs])
	{
	    case 0: package = "None";
	    case 1: package = "Seeds";
	    case 2: package = "Crack";
	    case 3: package = "Ephedrine";
	}
	SM(targetid, COLOR_REALRED, "_______ %s's inventory [Inventory Skill: %i/5] [%s] _______", GetRPName(playerid), PlayerInfo[playerid][pInventoryUpgrade], GetDate());
	SM(targetid, COLOR_WHITE, "(Pot: %i/%ig) - (Crack: %i/%ig) - (Meth: %i/%ig) - (Painkillers: %i/%i) - (Seeds: %i/%i)\n", PlayerInfo[playerid][pPot], GetPlayerCapacity(playerid, CAPACITY_WEED),
		PlayerInfo[playerid][pCrack], GetPlayerCapacity(playerid, CAPACITY_COCAINE), PlayerInfo[playerid][pMeth], GetPlayerCapacity(playerid, CAPACITY_METH), PlayerInfo[playerid][pPainkillers], GetPlayerCapacity(playerid, CAPACITY_PAINKILLERS), PlayerInfo[playerid][pSeeds], GetPlayerCapacity(playerid, CAPACITY_SEEDS));
	SM(targetid, SERVER_COLOR, "(Materials: %s/%i) - (Ephedrine: %i/%ig) - (Muriatic acid: %i/20) - (Baking soda: %i/20)\n", AddCommas(PlayerInfo[playerid][pMaterials]), GetPlayerCapacity(playerid, CAPACITY_MATERIALS),
		PlayerInfo[playerid][pEphedrine], GetPlayerCapacity(playerid, CAPACITY_EPHEDRINE), PlayerInfo[playerid][pMuriaticAcid], PlayerInfo[playerid][pBakingSoda]);

	SM(targetid, COLOR_WHITE, "(Fishing rod: %s) - (Fish bait: %i/20) - (Boombox: %s) - (MP3 player: %s) - (Phonebook: %s)\n", (PlayerInfo[playerid][pFishingRod]) ? ("Yes") : ("No"), PlayerInfo[playerid][pFishingBait], (PlayerInfo[playerid][pBoombox]) ? ("Yes") : ("No"), (PlayerInfo[playerid][pMP3Player]) ? ("Yes") : ("No"), (PlayerInfo[playerid][pPhonebook]) ? ("Yes") : ("No"));
	SM(targetid, SERVER_COLOR, "(Drivers License: %s) - (Cigars: %i) - (Spraycans: %i/20) - (Bombs: %i/3)\n", (PlayerInfo[playerid][pCarLicense]) ? ("Yes") : ("No"), PlayerInfo[playerid][pCigars], PlayerInfo[playerid][pSpraycans], PlayerInfo[playerid][pBombs]);
	SM(targetid, COLOR_WHITE, "(Gasoline: %i/20L) - (Portable Radio: %s) - (Mobile Phone: %s) - (Drug Package: %s) - (Rope: %i/10) - (Bandage: %i/10)\n", PlayerInfo[playerid][pGasCan], (PlayerInfo[playerid][pWalkieTalkie]) ? ("Yes") : ("No"), (PlayerInfo[playerid][pPhone]) ? ("Yes") : ("No"), package, PlayerInfo[playerid][pRope], PlayerInfo[playerid][pBandage]);
    SM(targetid, SERVER_COLOR, "(Watch: %s) - (GPS: %s) - (Diamonds: %i) - (Dirty Cash: %i) - (Foods: %i) - (Drinks: %i)", (PlayerInfo[playerid][pWatch]) ? ("Yes") : ("No"), (PlayerInfo[playerid][pGPS]) ? ("Yes") : ("No"), PlayerInfo[playerid][pDiamonds], PlayerInfo[playerid][pDirtyCash], PlayerInfo[playerid][pFood], PlayerInfo[playerid][pDrink]);
    SM(targetid, SERVER_COLOR, "(Lockpick: %i) - (Goldrim: %i) - (Weapon Clip: %i) - (Repairkit: %i) (Cookies: %i)", PlayerInfo[playerid][pLockpick], PlayerInfo[playerid][pGoldrim], PlayerInfo[playerid][pWeaponClip], PlayerInfo[playerid][pRepairKit], PlayerInfo[playerid][pCookies]);
    SCM(targetid, COLOR_REALRED, "______________________________________________________________________");
	return 1;
}

DisplayStats(playerid, targetid = INVALID_PLAYER_ID)
{
	if(targetid == INVALID_PLAYER_ID) targetid = playerid;

    new name[24], gender[8], faction[48], facrank[32], gang[32], gangrank[32], insurance[24], division[32], Float:health, Float:armor, Float:maxarmor;

	if(playerid == MAX_PLAYERS)
	{
		strcpy(name, PlayerInfo[playerid][pUsername]);
	}
	else
	{
		strcat(name, GetRPName(playerid));
	}

	if(PlayerInfo[playerid][pGender] == 1) gender = "Male";
	else if(PlayerInfo[playerid][pGender] == 2) gender = "Female";
	else if(PlayerInfo[playerid][pGender] == 3) gender = "Shemale";

	switch(PlayerInfo[playerid][pInsurance])
	{
	    case HOSPITAL_COUNTY: insurance = "County General";
	    case HOSPITAL_ALLSAINTS: insurance = "All Saints";
	    default: insurance = "None";
	}

	if(PlayerInfo[playerid][pFaction] >= 0)
	{
	    if(!strcmp(FactionInfo[PlayerInfo[playerid][pFaction]][fShortName], "None", true))
	    {
		    strcpy(faction, FactionInfo[PlayerInfo[playerid][pFaction]][fName]);
		}
		else
		{
		    strcpy(faction, FactionInfo[PlayerInfo[playerid][pFaction]][fShortName]);
		}

	    format(facrank, sizeof(facrank), "%s (%i)", FactionRanks[PlayerInfo[playerid][pFaction]][PlayerInfo[playerid][pFactionRank]], PlayerInfo[playerid][pFactionRank]);

	    if(PlayerInfo[playerid][pDivision] >= 0)
	    {
	        strcpy(division, FactionDivisions[PlayerInfo[playerid][pFaction]][PlayerInfo[playerid][pDivision]]);
		}
		else
		{
		    division = "None";
		}
	}
	else
	{
	    faction = "None";
	    facrank = "N/A";
	    division = "None";
	}

	if(PlayerInfo[playerid][pGang] >= 0)
	{
	    strcpy(gang, GangInfo[PlayerInfo[playerid][pGang]][gName]);
	    strcpy(gangrank, GangRanks[PlayerInfo[playerid][pGang]][PlayerInfo[playerid][pGangRank]]);
	}
	else
	{
	    gang = "None";
	    gangrank = "N/A";
	}

	switch(PlayerInfo[playerid][pVIPPackage])
	{
		case 0:
			maxarmor = 100.0;
		case 1, 2:
			maxarmor = 125.0;
		case 3:
		    maxarmor = 150.0;
	}

	if(playerid == MAX_PLAYERS)
	{
	    health = PlayerInfo[playerid][pHealth];
	    armor = PlayerInfo[playerid][pArmor];
	}
	else
	{
		GetPlayerHealth(playerid, health);
		GetPlayerArmour(playerid, armor);
	}

	SM(targetid, 0x7514F6FF,  	"_______________________________________________________________________________");
 	SM(targetid, COLOR_WHITE, 		"%s - (Level: %i) - (Gender: %s) - (Age: %i) - (Cash: $%s) - (Bank: $%s) - (Hours: %i) - (Ph: %i)\n", name, PlayerInfo[playerid][pLevel], gender, PlayerInfo[playerid][pAge], AddCommas(PlayerInfo[playerid][pCash]), AddCommas(PlayerInfo[playerid][pBank]), PlayerInfo[playerid][pHours], PlayerInfo[playerid][pPhone]);
	SM(targetid, COLOR_NAVYBLUE,  	 	"(Total Wealth: $%s) - (Addict: %i/3) - (Asset: %i/4) - (Channel: %i) - (Report Warnings: %i/3)\n", AddCommas(PlayerInfo[playerid][pCash] + PlayerInfo[playerid][pBank]), PlayerInfo[playerid][pAddictUpgrade], PlayerInfo[playerid][pAssetUpgrade], PlayerInfo[playerid][pChannel], PlayerInfo[playerid][pReportWarns]);
	SM(targetid, COLOR_WHITE, 		"(Job: %s / %s) - (Job Skill: %i) - (Crimes: %i) - (Arrested: %i) - (Jail Time: %i seconds)\n", GetJobName(PlayerInfo[playerid][pJob]), GetJobName(PlayerInfo[playerid][pSecondJob]), GetJobLevel(playerid, PlayerInfo[playerid][pJob]), PlayerInfo[playerid][pCrimes], PlayerInfo[playerid][pArrested], PlayerInfo[playerid][pJailTime]);
	SM(targetid, COLOR_NAVYBLUE,  	 	"(Spawn Health: %.1f/100.0) - (Spawn Armor: %.1f/%.1f) - (Insurance: %s) - (Paycheck: $%i)\n", PlayerInfo[playerid][pSpawnHealth], PlayerInfo[playerid][pSpawnArmor], maxarmor, insurance, PlayerInfo[playerid][pPaycheck]);
    SM(targetid, COLOR_WHITE, 		"(Faction: %s [%s %i -%s]) - (Gang: %s [%s %i]) - (Helper: %s) - (DM Warnings: %i/5) - (Weapon Restriction: %i Hrs)\n", faction, facrank, PlayerInfo[playerid][pFactionRank], division, gang, gangrank, PlayerInfo[playerid][pGangRank], GetHelperRank(playerid), PlayerInfo[playerid][pDMWarnings], PlayerInfo[playerid][pWeaponRestricted]);
	SM(targetid, COLOR_NAVYBLUE, 		"(VIP Package: %s) - (Married to: %s) - (Warnings: %i) - (Wanted Level: %i)\n", GetDonatorRank(PlayerInfo[playerid][pVIPPackage]), PlayerInfo[playerid][pMarriedName], PlayerInfo[playerid][pWarnings], PlayerInfo[playerid][pWantedLevel]);
	SM(targetid, COLOR_WHITE,       "(Experience: %s/%s) - (Next Level: %s)\n",  FormatNumber(PlayerInfo[playerid][pEXP], 0), FormatNumber((PlayerInfo[playerid][pLevel] * 4), 0), FormatNumber((PlayerInfo[playerid][pLevel] + 1) * 5000));

	if(PlayerInfo[targetid][pAdmin] > 0)
	{
	    SM(targetid, COLOR_WHITE, 	"(Interior: %i) - (Virtual: %i) - (AFK: %s) - (Reports: %i) - (Help Requests: %i)", (playerid == MAX_PLAYERS) ? (PlayerInfo[playerid][pInterior]) : (GetPlayerInterior(playerid)), (playerid == MAX_PLAYERS) ? (PlayerInfo[playerid][pWorld]) : (GetPlayerVirtualWorld(playerid)), (playerid == MAX_PLAYERS) ? ("No") : ((PlayerInfo[playerid][pAFK]) ? ("Yes") : ("No")),
			PlayerInfo[playerid][pReports], PlayerInfo[playerid][pHelpRequests]);
	}
	SM(targetid, 0x7514F6FF,  	"_______________________________________________________________________________");
	return 1;
}






CMD:inventory(playerid, params[])
{
	DisplayInventory(playerid);
	return 1;
}
