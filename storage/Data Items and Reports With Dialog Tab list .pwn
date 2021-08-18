

CMD:checkguns(playerid, params[])
{
	new String[10000], myweapons[13][2], weaponname[50], encryption[256], name[MAX_PLAYER_NAME];

	GetPlayerName(playerid, name, sizeof(name));
	SendClientMessageEx(playerid, COLOR_GREEN,"_______________________________________");
	format(String, sizeof(String), "Weapons on %s:", name);
	SendClientMessageEx(playerid, COLOR_WHITE, String);
	for (new i = 0; i < 13; i++)
	{
		GetPlayerWeaponData(playerid, i, myweapons[i][0], myweapons[i][1]);
		if(myweapons[i][0] > 0)
		{
			if(PlayerInfo[playerid][pGuns][i] == myweapons[i][0])
			{
				GetWeaponName(myweapons[i][0], weaponname, sizeof(weaponname));
				format(String, sizeof(String), "%s (%d)", weaponname, myweapons[i][0]);
				SendClientMessageEx(playerid, COLOR_GRAD1, String);
				format(encryption, sizeof(encryption), "%s%d", encryption, myweapons[i][0]);
			}
		}
	}
	new year, month, day, hour, minute, second;
	getdate(year, month, day);
	gettime(hour, minute, second);
	format(encryption, sizeof(encryption), "%s%s%d%d%d%d%d6524", encryption, name, day, month, year, hour, minute);
	new encrypt = crc32(encryption);
	format(String, sizeof(String), "[%d/%d/%d %d:%d:%d] - [%d]", day, month, year, hour, minute,second, encrypt);
	SendClientMessageEx(playerid, COLOR_GREEN, String);
	SendClientMessageEx(playerid, COLOR_GREEN,"_______________________________________");
	return 1;
}


CMD:items(playerid, params[])
{
    new String[10000], S3MP4K[10000];
    strcat(S3MP4K, "Item\tAmount\n");
	if(GetPlayerCash(playerid) < 0)
    {
    	format(String, sizeof(String), "Cash\t{FF0000}($%s)\n{FFFFFF}", FormatMoney(GetPlayerCash(playerid)));
     	strcat(S3MP4K, String);
	}
	if(GetPlayerCash(playerid) > 0)
    {
    	format(String, sizeof(String), "Cash\t$%s\n", FormatMoney(GetPlayerCash(playerid)));
     	strcat(S3MP4K, String);
	}
    if(PlayerInfo[playerid][pCacing] > 0)
    {
	    format(String, sizeof(String), "Bait\t%d\n", PlayerInfo[playerid][pCacing]);
	    strcat(S3MP4K, String);
    }
    if(PlayerInfo[playerid][pPancingan] > 0)
    {
		format(String, sizeof(String), "Fish pole\t%d use(s) left\n", PlayerInfo[playerid][pPancingan]);
	    strcat(S3MP4K, String);
	}
	if(PlayerInfo[playerid][pBeratIkan] > 0)
    {
		format(String, sizeof(String), "Fish total\t%d Kilograms\n", PlayerInfo[playerid][pBeratIkan]);
	    strcat(S3MP4K, String);
	}
    if(PlayerInfo[playerid][pCangkul] > 0)
    {
		format(String, sizeof(String), "Farm hoe\t%d use(s) left\n", PlayerInfo[playerid][pCangkul]);
	    strcat(S3MP4K, String);
    }
    if(PlayerInfo[playerid][pComponent] > 0)
    {
		format(String, sizeof(String), "Component\t%d\n", PlayerInfo[playerid][pComponent]);
	    strcat(S3MP4K, String);
    }
    if(PlayerInfo[playerid][pTire] > 0)
    {
		format(String, sizeof(String), "Wrench\t%d use(s) left\n", PlayerInfo[playerid][pTire]);
	    strcat(S3MP4K, String);
    }
    if(PlayerInfo[playerid][pBibitAnggur] > 0)
    {
		format(String, sizeof(String), "[SEED] Anggur\t%d left\n", PlayerInfo[playerid][pBibitAnggur]);
	    strcat(S3MP4K, String);
    }
    if(PlayerInfo[playerid][pBibitBlueberry] > 0)
    {
		format(String, sizeof(String), "[SEED] Blueberry\t%d left\n", PlayerInfo[playerid][pBibitBlueberry]);
	    strcat(S3MP4K, String);
    }
    if(PlayerInfo[playerid][pBibitStrawberry] > 0)
    {
		format(String, sizeof(String), "[SEED] Strawberry\t%d left\n", PlayerInfo[playerid][pBibitStrawberry]);
	    strcat(S3MP4K, String);
    }
    if(PlayerInfo[playerid][pBibitGandum] > 0)
    {
		format(String, sizeof(String), "[SEED] Gandum\t%d left\n", PlayerInfo[playerid][pBibitGandum]);
	    strcat(S3MP4K, String);
    }
    if(PlayerInfo[playerid][pBibitTomat] > 0)
    {
		format(String, sizeof(String), "[SEED] Tomat\t%d left\n", PlayerInfo[playerid][pBibitTomat]);
	    strcat(S3MP4K, String);
    }
    if(PlayerInfo[playerid][pTanamanAnggur] > 0)
    {
		format(String, sizeof(String), "[PLANT] Anggur\t%d left\n", PlayerInfo[playerid][pTanamanAnggur]);
	    strcat(S3MP4K, String);
    }
    if(PlayerInfo[playerid][pTanamanBlueberry] > 0)
    {
		format(String, sizeof(String), "[PLANT] Blueberry\t%d left\n", PlayerInfo[playerid][pTanamanBlueberry]);
	    strcat(S3MP4K, String);
    }
    if(PlayerInfo[playerid][pTanamanStrawberry] > 0)
    {
		format(String, sizeof(String), "[PLANT] Strawberry\t%d left\n", PlayerInfo[playerid][pTanamanStrawberry]);
	    strcat(S3MP4K, String);
    }
    if(PlayerInfo[playerid][pTanamanGandum] > 0)
    {
		format(String, sizeof(String), "[PLANT] Gandum\t%d left\n", PlayerInfo[playerid][pTanamanGandum]);
	    strcat(S3MP4K, String);
    }
    if(PlayerInfo[playerid][pTanamanTomat] > 0)
    {
		format(String, sizeof(String), "[PLANT] Tomat\t%d left\n", PlayerInfo[playerid][pTanamanTomat]);
	    strcat(S3MP4K, String);
    }
    if(PlayerInfo[playerid][pAmoxicilin] > 0)
    {
		format(String, sizeof(String), "[MEDICINE]Amoxicilin\t%d use(s) left\n", PlayerInfo[playerid][pAmoxicilin]);
	    strcat(S3MP4K, String);
    }
    if(PlayerInfo[playerid][pUltrafluenza] > 0)
    {
		format(String, sizeof(String), "[MEDICINE]Ultrafluenza\t%d use(s) left\n", PlayerInfo[playerid][pUltrafluenza]);
	    strcat(S3MP4K, String);
    }
    if(PlayerInfo[playerid][pCrack] > 0)
    {
	    format(String, sizeof(String), "{FF0000}Crack\t%d\n", PlayerInfo[playerid][pCrack]);
	    strcat(S3MP4K, String);
    }
    if(PlayerInfo[playerid][pPot] > 0)
    {
	    format(String, sizeof(String), "{FF0000}Pot\t%d\n", PlayerInfo[playerid][pPot]);
	    strcat(S3MP4K, String);
    }
    if(PlayerInfo[playerid][pMats] > 0)
    {
	    format(String, sizeof(String), "{FF0000}Materials\t%d\n", PlayerInfo[playerid][pMats]);
	    strcat(S3MP4K, String);
    }
    if(PlayerInfo[playerid][pScrewdriver] > 0)
    {
	    format(String, sizeof(String), "{FF0000}Gun Schematic\n");
	    strcat(S3MP4K, String);
    }
    for(new i; i < 12; ++i)
   	{
		if(PlayerInfo[playerid][pGuns][i] > 0)
		{
			new wname[10000];
			GetWeaponName(PlayerInfo[playerid][pGuns][i], wname, sizeof(wname));
			format(String, sizeof(String), "{FF0000}[WEAPON] %s\t%d Ammo\n", wname, PlayerInfo[playerid][pGunsAmmo][i]);
			strcat(S3MP4K, String);
		}
	}
	ShowPlayerDialog(playerid, DIALOG_INVENTORY, DIALOG_STYLE_TABLIST_HEADERS, "Items", S3MP4K, "Close", "");
    return 1;
}
