






CMD:unban(playerid, params[])
{
	new username[MAX_PLAYER_NAME];

	if(PlayerInfo[playerid][pAdmin] < 3 && !PlayerInfo[playerid][pBanAppealer])
	{
	    return SCM(playerid, COLOR_SYNTAX, "[SYSTEM]: "RED" Anda Tidak Diizinkan Menggunakan Perintah.");
	}
	if(sscanf(params, "s[24]", username))
	{
	    return SCM(playerid, COLOR_SYNTAX, "[USAGE]: /unban [username]");
	}

	mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "SELECT id, permanent FROM bans WHERE username = '%e'", username);
	mysql_tquery(connectionID, queryBuffer, "OnAdminUnbanUser", "is", playerid, username);
	return 1;
}

CMD:unbanip(playerid, params[])
{
	new string[25];

    if(PlayerInfo[playerid][pAdmin] < 3 && !PlayerInfo[playerid][pBanAppealer])
	{
	    return SCM(playerid, COLOR_SYNTAX, "[SYSTEM]: "RED" Anda Tidak Diizinkan Menggunakan Perintah.");
	}
	if(!IsAnIP(params))
	{
	    return SCM(playerid, COLOR_SYNTAX, "[USAGE]: /unbanip [ip address]");
	}

	mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "DELETE FROM bans WHERE ip = '%s'", params);
	mysql_tquery(connectionID, queryBuffer);

	format(string, sizeof(string), "unbanip %s", params);
	SendRconCommand(string);
	SendRconCommand("reloadbans");

	UnBlockIpAddress(params);
	SAM(COLOR_YELLOW, "[SYSTEM]: "WHITE"  %s has unbanned IP '%s'.", GetRPName(playerid), params);
	return 1;
}

CMD:banip(playerid, params[])
{
	new ip[16], reason[128];

    if(PlayerInfo[playerid][pAdmin] < 3 && !PlayerInfo[playerid][pBanAppealer])
	{
	    return SCM(playerid, COLOR_SYNTAX, "[SYSTEM]: "RED" Anda Tidak Diizinkan Menggunakan Perintah.");
	}
	if(sscanf(params, "s[16]S(N/A)[128]", ip, reason))
	{
	    return SCM(playerid, COLOR_SYNTAX, "[USAGE]: /banip [ip address] [reason (optional)]");
	}
	if(!IsAnIP(ip))
	{
	    return SCM(playerid, COLOR_SYNTAX, "Invalid IP address.");
	}

	mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "SELECT id FROM bans WHERE ip = '%s'", ip);
	mysql_tquery(connectionID, queryBuffer, "OnAdminBanIP", "iss", playerid, ip, reason);
	return 1;
}

CMD:whitelist(playerid, params[])
{


	new username[MAX_PLAYER_NAME];

	if(PlayerInfo[playerid][pAdmin] < 4)
	{
	    return SCM(playerid, COLOR_SYNTAX, "[SYSTEM]: "RED" Anda Tidak Diizinkan Menggunakan Perintah.");
	}
	if(sscanf(params, "s[24]", params))
	{
	    return SCM(playerid, COLOR_SYNTAX, "[USAGE]: /whitelist [username]");
	}

  	mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "INSERT INTO `whitelist` SET `username` ='%s", params);
   	mysql_tquery(connectionID, queryBuffer);
    PlayerInfo[playerid][pWhitelisted]=0;
    SAM(COLOR_YELLOW, "[SYSTEM]: "WHITE"  %s has whitelist %s's account.", GetRPName(playerid), params);
    Log_Write("log_admin", "%s (uid: %i) whitelist %s's account.", GetPlayerNameEx(playerid), PlayerInfo[playerid][pID], username);
    printf("[cmd] %s: [%s]", GetRPName(playerid), queryBuffer);





	/*
	// at the unlocked whitelist
	new username[MAX_PLAYER_NAME];

	if(PlayerInfo[playerid][pAdmin] < 4)
	{
	    return SCM(playerid, COLOR_SYNTAX, "[SYSTEM]: "RED" Anda Tidak Diizinkan Menggunakan Perintah.");
	}
	if(sscanf(params, "s[24]", username))
	{
	    return SCM(playerid, COLOR_SYNTAX, "[USAGE]: /whitelist [username]");
	}

	mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "SELECT locked FROM users WHERE username = '%e'", username);
	printf("[cmd] %s: [%s]", GetRPName(playerid), connectionID);
	mysql_tquery(connectionID, queryBuffer, "OnAdminUnlockAccount", "is", playerid, username);
	PlayerInfo[playerid][pLocked]=0;
	*/
	// end the unlocked whitelist
	return 1;
}



CMD:unwhitelist(playerid, params[])
{

    new username[MAX_PLAYER_NAME];

	if(PlayerInfo[playerid][pAdmin] < 4)
	{
	    return SCM(playerid, COLOR_SYNTAX, "[SYSTEM]: "RED" Anda Tidak Diizinkan Menggunakan Perintah.");
	}
	if(sscanf(params, "s[24]", params))
	{
	    return SCM(playerid, COLOR_SYNTAX, "[USAGE]: /whitelist [username]");
	}

  	mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "DELETE FROM `whitelist` WHERE `username` ='%s", params);
   	mysql_tquery(connectionID, queryBuffer);
    PlayerInfo[playerid][pWhitelisted]=1;
    SAM(COLOR_YELLOW, "[SYSTEM]: "WHITE"  %s has whitelist %s's account.", GetRPName(playerid), params);
    Log_Write("log_admin", "%s (uid: %i) whitelist %s's account.", GetPlayerNameEx(playerid), PlayerInfo[playerid][pID], username);
    printf("[cmd] %s: [%s]", GetRPName(playerid), queryBuffer);




	/*
	// at the locked whitelist

	new username[MAX_PLAYER_NAME];

	if(PlayerInfo[playerid][pAdmin] < 4)
	{
	    return SCM(playerid, COLOR_SYNTAX, "[SYSTEM]: "RED" Anda Tidak Diizinkan Menggunakan Perintah.");
	}
	if(sscanf(params, "s[24]", username))
	{
	    return SCM(playerid, COLOR_SYNTAX, "[USAGE]: /unwhitelist [username]");
	}

	mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "SELECT uid FROM users WHERE username = '%e' AND locked = 1", username);
	printf("[cmd] %s: [%s]", GetRPName(playerid), connectionID);
	mysql_tquery(connectionID, queryBuffer, "OnAdminLockAccount", "is", playerid, username);
	PlayerInfo[playerid][pLocked]=1;
    // end the locked whitelist
	*/
	
	
	return 1;
}

CMD:sprison(playerid, params[])
{
	new targetid, minutes, reason[128];

	if(PlayerInfo[playerid][pAdmin] < 3)
	{
	    return SCM(playerid, COLOR_SYNTAX, "[SYSTEM]: "RED" Anda Tidak Diizinkan Menggunakan Perintah.");
	}
	if(sscanf(params, "uis[128]", targetid, minutes, reason))
	{
	    return SCM(playerid, COLOR_SYNTAX, "[USAGE]: /sprison [playerid] [minutes] [reason]");
	}
	if(!IsPlayerConnected(targetid))
	{
	    return SCM(playerid, COLOR_SYNTAX, "[SYSTEM]: "RED"pemain telah disconnect.");
	}
	if(PlayerInfo[targetid][pAdmin] > PlayerInfo[playerid][pAdmin])
	{
	    return SCM(playerid, COLOR_SYNTAX, "The player specified has a higher admin level than you. They cannot be prisoned.");
	}
	if(!PlayerInfo[targetid][pLogged])
	{
	    return SCM(playerid, COLOR_SYNTAX, "pemain itu belum masuk. You can wait until they login or use /oprison.");
	}
	if(minutes < 1)
	{
	    return SCM(playerid, COLOR_SYNTAX, "The amount of minutes cannot be below one. Use /release instead.");
	}

    PlayerInfo[targetid][pJailType] = 2;
    PlayerInfo[targetid][pJailTime] = minutes * 60;

    PlayerTextDrawShow(targetid, customHUD[targetid][1]);

    ResetPlayerWeaponsEx(targetid);
    ResetPlayer(targetid);
    SetPlayerInJail(targetid);

    Log_Write("log_punishments", "%s (uid: %i) silently prisoned %s (uid: %i) for %i minutes, reason: %s", GetPlayerNameEx(playerid), PlayerInfo[playerid][pID], GetPlayerNameEx(targetid), PlayerInfo[targetid][pID], minutes, reason);
    SMA(COLOR_YELLOW, "[SYSTEM]: "WHITE"  %s was prisoned for %i minutes by an Admin, reason: %s", GetRPName(targetid), minutes, reason);
    SM(targetid, COLOR_AQUA, "** You have been admin prisoned for %i minutes by an admin.", minutes);
    return 1;
}

CMD:sethpall(playerid, params[])
{
	new Float:amount;

    if(PlayerInfo[playerid][pAdmin] < 4)
	{
	    return SCM(playerid, COLOR_SYNTAX, "[SYSTEM]: "RED" Anda Tidak Diizinkan Menggunakan Perintah.");
	}
	if(!PlayerInfo[playerid][pAdminDuty] && PlayerInfo[playerid][pAdmin] < 5)
	{
	    return SCM(playerid, COLOR_SYNTAX, "This command requires you to be on admin duty. /aduty to go on duty.");
	}
	if(sscanf(params, "f", amount))
	{
	    return SCM(playerid, COLOR_SYNTAX, "[USAGE]: /sethpall [amount]");
	}
	if(amount < 1.0)
	{
	    return SCM(playerid, COLOR_SYNTAX, "Health can't be under 1.0.");
	}

	foreach(new i : Player)
	{
	    SetPlayerHealth(i, amount);
	}

	SAM(COLOR_YELLOW, "[SYSTEM]: "WHITE"  %s set everyone's health to %.1f.", GetRPName(playerid), amount);
	return 1;
}

CMD:setarmorall(playerid, params[])
{
	new Float:amount;

    if(PlayerInfo[playerid][pAdmin] < 4)
	{
	    return SCM(playerid, COLOR_SYNTAX, "[SYSTEM]: "RED" Anda Tidak Diizinkan Menggunakan Perintah.");
	}
	if(!PlayerInfo[playerid][pAdminDuty] && PlayerInfo[playerid][pAdmin] < 5)
	{
	    return SCM(playerid, COLOR_SYNTAX, "This command requires you to be on admin duty. /aduty to go on duty.");
	}
	if(sscanf(params, "f", amount))
	{
	    return SCM(playerid, COLOR_SYNTAX, "[USAGE]: /setarmorall [amount]");
	}
	if(amount < 0.0 || amount > 150.0)
	{
	    return SCM(playerid, COLOR_SYNTAX, "Armor can't be under 0.0 or above 150.0.");
	}

	foreach(new i : Player)
	{
	    SetScriptArmour(i, amount);
	}

	SAM(COLOR_YELLOW, "[SYSTEM]: "WHITE"  %s set everyone's armor to %.1f.", GetRPName(playerid), amount);
	return 1;
}

CMD:givegun(playerid, params[])
{
	new targetid, weaponid;

    if(PlayerInfo[playerid][pAdmin] < 4)
	{
	    return SCM(playerid, COLOR_SYNTAX, "[SYSTEM]: "RED" Anda Tidak Diizinkan Menggunakan Perintah.");
	}
	if(!PlayerInfo[playerid][pAdminDuty] && PlayerInfo[playerid][pAdmin] < 8)
	{
	    return SCM(playerid, COLOR_SYNTAX, "This command requires you to be on admin duty. /aduty to go on duty.");
	}
	if(sscanf(params, "ui", targetid, weaponid))
	{
	    return SCM(playerid, COLOR_SYNTAX, "Usage: /givegun [playerid] [weaponid]");
	}
	if(!IsPlayerConnected(targetid))
	{
	    return SCM(playerid, COLOR_SYNTAX, "[SYSTEM]: "RED"pemain telah disconnect.");
	}
	if(PlayerInfo[targetid][pWeaponRestricted] > 0)
    {
        return SCM(playerid, COLOR_SYNTAX, "That player is either weapon restricted or played less than two playing hours.");
    }
	if(!(1 <= weaponid <= 46))
	{
	    return SCM(playerid, COLOR_SYNTAX, "Invalid weapon.");
	}

	GiveWeapon(targetid, weaponid);

	SM(targetid, COLOR_AQUA, "You have received a "SVRCLR"%s{CCFFFF} from %s.", GetWeaponNameEx(weaponid), GetRPName(playerid));
	SAM(COLOR_YELLOW, "[SYSTEM]: "WHITE" %s has given a %s to %s.", GetRPName(playerid), GetWeaponNameEx(weaponid), GetRPName(targetid));
	return 1;
}

CMD:settime(playerid, params[])
{
	new hour;

	if(PlayerInfo[playerid][pAdmin] < 4)
	{
	    return SCM(playerid, COLOR_SYNTAX, "[SYSTEM]: "RED" Anda Tidak Diizinkan Menggunakan Perintah.");
	}
	if(sscanf(params, "i", hour))
	{
	    return SCM(playerid, COLOR_SYNTAX, "[USAGE]: /settime [hour]");
	}
	if(!(0 <= hour <= 23))
	{
	    return SCM(playerid, COLOR_SYNTAX, "The hour must range from 0 to 23.");
	}

	gWorldTime = hour;

	SetWorldTime(hour);
	SMA(COLOR_GREY2, "Time of day changed to %i hours.", hour);
	return 1;
}

CMD:setstat(playerid, params[])
{
	new targetid, option[24], param[32], value;

    if(PlayerInfo[playerid][pAdmin] < 7)
	{
	    return SCM(playerid, COLOR_SYNTAX, "[SYSTEM]: "RED" Anda Tidak Diizinkan Menggunakan Perintah.");
	}
	if(!PlayerInfo[playerid][pAdminDuty] && PlayerInfo[playerid][pAdmin] < 5)
	{
	    return SCM(playerid, COLOR_SYNTAX, "This command requires you to be on admin duty. /aduty to go on duty.");
	}
	if(sscanf(params, "us[24]S()[32]", targetid, option, param))
	{
	    SCM(playerid, COLOR_SYNTAX, "[USAGE]: /setstat [playerid] [option]");
	    SM(playerid, COLOR_WHITE, "Available options: Gender, Age, Cash, Bank, Level, Respect, Hours, Warnings");
	    SM(playerid, COLOR_WHITE, "Available options: SpawnHealth, SpawnArmor, FightStyle, Accent, Phone, Crimes, Arrested");
	    SM(playerid, COLOR_WHITE, "Available options: WantedLevel, Materials, Pot, Crack, Meth, Painkillers, Cigars, PortableRadio");
	    SM(playerid, COLOR_WHITE, "Available options: Channel, Spraycans, Boombox, Phonebook, Paycheck, CarLicense, Seeds, Ephedrine");
		SM(playerid, COLOR_WHITE, "Available options: InventoryUpgrade, AddictUpgrade, TraderUpgrade, AssetUpgrade, MP3Player, Job");
        SM(playerid, COLOR_WHITE, "Available options: MuriaticAcid, BakingSoda, HPAmmo, PoisonAmmo, FMJAmmo, DMWarnings, WeaponRestricted");
        SM(playerid, COLOR_WHITE, "Available options: Components, Watch, GPS, GasCan, FishingSkill, TruckerSkill, GuardSkill, WeaponSkill");
        SM(playerid, COLOR_WHITE, "Available options: LawyerSkill, SmugglerSkill, DetectiveSkill");
        SM(playerid, COLOR_WHITE, "Available options: Mask, Marriage, GunLicense, Hunger, Thirst, Food, Drinks, Repairkit, Skates");
        SM(playerid, COLOR_WHITE, "Available options: Diamonds, Lockpick");
	    return 1;
	}
	if(!strcmp(option, "gender", true))
	{
	    if(isnull(param))
	    {
	        return SCM(playerid, COLOR_SYNTAX, "[USAGE]: /setstat [playerid] [gender] [male | female]");
		}
		if(!strcmp(param, "male", true))
		{
		    PlayerInfo[targetid][pGender] = 1;
		    SM(playerid, COLOR_WHITE, "** You have set %s's gender to Male.", GetRPName(targetid));

		    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET gender = 1 WHERE uid = %i", PlayerInfo[targetid][pID]);
		    mysql_tquery(connectionID, queryBuffer);
		}
		else if(!strcmp(param, "female", true))
		{
		    PlayerInfo[targetid][pGender] = 2;
		    SM(playerid, COLOR_WHITE, "** You have set %s's gender to Female.", GetRPName(targetid));

		    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET gender = 2 WHERE uid = %i", PlayerInfo[targetid][pID]);
		    mysql_tquery(connectionID, queryBuffer);
		}
	}
	else if(!strcmp(option, "lockpick", true))
	{
	    if(sscanf(param, "i", value))
	    {
			return SCM(playerid, -1, ""BLUE"[USAGE] "WHITE" /setstat [playerid] [lockpick] [value]");
		}

		PlayerInfo[targetid][pLockpick] = value;
	    SM(playerid, COLOR_WHITE, "** You have set %s's lockpick to %i.", GetRPName(targetid), value);

	    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET lockpick = %i WHERE uid = %i", value, PlayerInfo[targetid][pID]);
	    mysql_tquery(connectionID, queryBuffer);
	}
	else if(!strcmp(option, "skates", true))
	{
	    if(sscanf(param, "i", value) || !(0<=value<=1))
	    {
			return SendClientMessage(playerid, COLOR_SYNTAX, "[USAGE]: /setstat [playerid] [skates] [1/0]");
		}
		else
		{
			PlayerInfo[targetid][pSkates] = value;
	    	SendClientMessageEx(playerid, COLOR_WHITE, "You have set %s's skates to %i.", GetRPName(targetid), value);

			mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET rollerskates = %i WHERE uid = %i", value, PlayerInfo[targetid][pID]);
	    	mysql_tquery(connectionID, queryBuffer);
		}
	}
	else if(!strcmp(option, "thirst", true))
	{
	    if(sscanf(param, "i", value))
	    {
	        return SendClientMessage(playerid, COLOR_WHITE, "[USAGE]: /setstat [playerid] [thirst] [value]");
		}
		if(value <= 0)
		{
			value = 2;
			PlayerInfo[playerid][pThirstTimer] = 420;
		}
		else if(value > 100)
		{
				value = 100;
		}
		PlayerInfo[targetid][pThirst] = value;

	    SendMessage(playerid, COLOR_WHITE, "** You have set %s's thirst to %i.", GetRPName(targetid), value);

		mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET thirst = %i, thirsttimer = %i WHERE uid = %i", PlayerInfo[playerid][pThirst], PlayerInfo[playerid][pThirstTimer], PlayerInfo[playerid][pID]);
		mysql_tquery(connectionID, queryBuffer);

	}
	else if(!strcmp(option, "hunger", true))
	{
	    if(sscanf(param, "i", value))
	    {
	        return SendClientMessage(playerid, COLOR_WHITE, "[USAGE]: /setstat [playerid] [hunger] [value]");
		}
		if(value <= 0)
		{
			value = 2;
			PlayerInfo[playerid][pHungerTimer] = 600;
		}
		else if(value > 100)
		{
				value = 100;
		}
		PlayerInfo[targetid][pHunger] = value;

	    SendMessage(playerid, COLOR_WHITE, "** You have set %s's hunger to %i.", GetRPName(targetid), value);

		mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET hunger = %i, hungertimer = %i WHERE uid = %i", PlayerInfo[playerid][pHunger], PlayerInfo[playerid][pHungerTimer], PlayerInfo[playerid][pID]);
		mysql_tquery(connectionID, queryBuffer);

	}
	else if(!strcmp(option, "food", true))
	{
	    if(sscanf(param, "i", value))
	    {
	        return SendClientMessage(playerid, COLOR_WHITE, "[USAGE]: /setstat [playerid] [food] [value]");
		}
		PlayerInfo[targetid][pFood] = value;
	    SendMessage(playerid, COLOR_WHITE, "** You have set %s's food to %i.", GetRPName(targetid), value);
	}
	else if(!strcmp(option, "repairkit", true))
	{
	    if(sscanf(param, "i", value))
	    {
	        return SendClientMessage(playerid, COLOR_WHITE, "[USAGE]: /setstat [playerid] [repairkit] [value]");
		}
		PlayerInfo[targetid][pRepairKit] = value;
	    SendMessage(playerid, COLOR_WHITE, "** You have set %s's Repairkit to %i.", GetRPName(targetid), value);

	    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET repairkit = %i WHERE uid = %i", PlayerInfo[playerid][pRepairKit], PlayerInfo[playerid][pID]);
		mysql_tquery(connectionID, queryBuffer);
	}
	else if(!strcmp(option, "drinks", true))
	{
	    if(sscanf(param, "i", value))
	    {
	        return SendClientMessage(playerid, COLOR_WHITE, "[USAGE]: /setstat [playerid] [drinks] [value]");
		}
		PlayerInfo[targetid][pDrink] = value;
	    SendMessage(playerid, COLOR_WHITE, "** You have set %s's drinks to %i.", GetRPName(targetid), value);
	}
	else if(!strcmp(option, "marriage", true))
	{
	    if(sscanf(param, "i", value))
	    {
			return SCM(playerid, COLOR_SYNTAX, "[USAGE]: /setstat [playerid] [marriedto] [playerid(-1 to reset)]");
		}

		if(IsPlayerConnected(value))
		{
			PlayerInfo[targetid][pMarriedTo] = PlayerInfo[value][pID];
			strcpy(PlayerInfo[targetid][pMarriedName], GetPlayerNameEx(value), MAX_PLAYER_NAME);
	    	SM(playerid, COLOR_WHITE, "You have set %s's marriage to %s.", GetRPName(targetid), GetRPName(value));

			mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET marriedto = %i WHERE uid = %i", PlayerInfo[value][pID], PlayerInfo[targetid][pID]);
	    	mysql_tquery(connectionID, queryBuffer);
		}
		else if(value == -1)
		{
			PlayerInfo[targetid][pMarriedTo] = -1;
			strcpy(PlayerInfo[targetid][pMarriedName], "Nobody", MAX_PLAYER_NAME);
	    	SM(playerid, COLOR_WHITE, "You have reset %s's marriage.", GetRPName(targetid));

			mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET marriedto = -1 WHERE uid = %i",  PlayerInfo[targetid][pID]);
	    	mysql_tquery(connectionID, queryBuffer);
		}
	}
	else if(!strcmp(option, "age", true))
	{
	    if(sscanf(param, "i", value))
	    {
			return SCM(playerid, COLOR_SYNTAX, "[USAGE]: /setstat [playerid] [age] [value]");
		}
		if(!(0 <= value <= 128))
		{
		    return SCM(playerid, COLOR_WHITE, "The value specified can't be under 0 or above 128.");
		}

		PlayerInfo[targetid][pAge] = value;
	    SM(playerid, COLOR_WHITE, "** You have set %s's age to %i.", GetRPName(targetid), value);

	    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET age = %i WHERE uid = %i", value, PlayerInfo[targetid][pID]);
	    mysql_tquery(connectionID, queryBuffer);
	}
	else if(!strcmp(option, "cash", true))
	{
	    if(sscanf(param, "i", value))
	    {
			return SCM(playerid, COLOR_SYNTAX, "[USAGE]: /setstat [playerid] [cash] [value]");
		}

		PlayerInfo[targetid][pCash] = value;
	    SM(playerid, COLOR_WHITE, "** You have set %s's cash to $%i.", GetRPName(targetid), value);

	    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET cash = %i WHERE uid = %i", value, PlayerInfo[targetid][pID]);
	    mysql_tquery(connectionID, queryBuffer);
	}
	else if(!strcmp(option, "bank", true))
	{
	    if(sscanf(param, "i", value))
	    {
			return SCM(playerid, COLOR_SYNTAX, "[USAGE]: /setstat [playerid] [bank] [value]");
		}

		PlayerInfo[targetid][pBank] = value;
	    SM(playerid, COLOR_WHITE, "** You have set %s's bank money to $%i.", GetRPName(targetid), value);

	    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET bank = %i WHERE uid = %i", value, PlayerInfo[targetid][pID]);
	    mysql_tquery(connectionID, queryBuffer);
	}
	else if(!strcmp(option, "level", true))
	{
	    if(sscanf(param, "i", value))
	    {
			return SCM(playerid, COLOR_SYNTAX, "[USAGE]: /setstat [playerid] [level] [value]");
		}

		PlayerInfo[targetid][pLevel] = value;
	    //SCM(playerid, COLOR_WHITE, "I can see you Imao");

	    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET level = %i WHERE uid = %i", value, PlayerInfo[targetid][pID]);
	    mysql_tquery(connectionID, queryBuffer);
	}
    else if(!strcmp(option, "respect", true))
	{
	    if(sscanf(param, "i", value))
	    {
			return SCM(playerid, COLOR_SYNTAX, "[USAGE]: /setstat [playerid] [respect] [value]");
		}

		PlayerInfo[targetid][pEXP] = value;
	    SM(playerid, COLOR_WHITE, "** You have set %s's respect points to %i.", GetRPName(targetid), value);

	    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET exp = %i WHERE uid = %i", value, PlayerInfo[targetid][pID]);
	    mysql_tquery(connectionID, queryBuffer);
	}
    else if(!strcmp(option, "hours", true))
	{
	    if(sscanf(param, "i", value))
	    {
			return SCM(playerid, COLOR_SYNTAX, "[USAGE]: /setstat [playerid] [hours] [value]");
		}

		PlayerInfo[targetid][pHours] = value;
	    SM(playerid, COLOR_WHITE, "** You have set %s's playing hours to %i.", GetRPName(targetid), value);

	    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET hours = %i WHERE uid = %i", value, PlayerInfo[targetid][pID]);
	    mysql_tquery(connectionID, queryBuffer);
	}
	else if(!strcmp(option, "warnings", true))
	{
	    if(sscanf(param, "i", value))
	    {
			return SCM(playerid, COLOR_SYNTAX, "[USAGE]: /setstat [playerid] [warnings] [value]");
		}
		if(!(0 <= value <= 3))
		{
		    return SCM(playerid, COLOR_WHITE, "The value specified can't be under 0 or above 3.");
		}

		PlayerInfo[targetid][pWarnings] = value;
	    SM(playerid, COLOR_WHITE, "** You have set %s's warnings to %i.", GetRPName(targetid), value);

	    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET warnings = %i WHERE uid = %i", value, PlayerInfo[targetid][pID]);
	    mysql_tquery(connectionID, queryBuffer);
	}
	else if(!strcmp(option, "spawnhealth", true))
	{
	    new Float:amount;

	    if(sscanf(param, "f", amount))
	    {
			return SCM(playerid, COLOR_SYNTAX, "[USAGE]: /setstat [playerid] [spawnhealth] [value]");
		}

		PlayerInfo[targetid][pSpawnHealth] = amount;
	    SM(playerid, COLOR_WHITE, "** You have set %s's spawn health to %.1f.", GetRPName(targetid), amount);

	    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET spawnhealth = '%f' WHERE uid = %i", amount, PlayerInfo[targetid][pID]);
	    mysql_tquery(connectionID, queryBuffer);
	}
	else if(!strcmp(option, "spawnarmor", true))
	{
	    new Float:amount;

	    if(sscanf(param, "f", amount))
	    {
			return SCM(playerid, COLOR_SYNTAX, "[USAGE]: /setstat [playerid] [spawnarmor] [value]");
		}

		PlayerInfo[targetid][pSpawnArmor] = amount;
	    SM(playerid, COLOR_WHITE, "** You have set %s's spawn armor to %.1f.", GetRPName(targetid), amount);

	    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET spawnarmor = '%f' WHERE uid = %i", amount, PlayerInfo[targetid][pID]);
	    mysql_tquery(connectionID, queryBuffer);
	}
	else if(!strcmp(option, "fightstyle", true))
	{
	    if(isnull(param))
	    {
	        SCM(playerid, COLOR_SYNTAX, "[USAGE]: /setstat [playerid] [fightstyle] [option]");
	        SCM(playerid, COLOR_WHITE, "Available options: Normal, Boxing, Kungfu, Kneehead, Grabkick, Elbow");
	        return 1;
		}
		if(!strcmp(param, "normal", true))
		{
		    PlayerInfo[targetid][pFightStyle] = FIGHT_STYLE_NORMAL;

		    SM(playerid, COLOR_WHITE, "** You have set %s's fight style to Normal.", GetRPName(targetid));
		    SetPlayerFightingStyle(targetid, PlayerInfo[targetid][pFightStyle]);

		    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET fightstyle = %i WHERE uid = %i", PlayerInfo[targetid][pFightStyle], PlayerInfo[targetid][pID]);
		    mysql_tquery(connectionID, queryBuffer);
		}
		else if(!strcmp(param, "boxing", true))
		{
		    PlayerInfo[targetid][pFightStyle] = FIGHT_STYLE_BOXING;

		    SM(playerid, COLOR_WHITE, "** You have set %s's fight style to Boxing.", GetRPName(targetid));
		    SetPlayerFightingStyle(targetid, PlayerInfo[targetid][pFightStyle]);

		    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET fightstyle = %i WHERE uid = %i", PlayerInfo[targetid][pFightStyle], PlayerInfo[targetid][pID]);
		    mysql_tquery(connectionID, queryBuffer);
		}
		else if(!strcmp(param, "kungfu", true))
		{
		    PlayerInfo[targetid][pFightStyle] = FIGHT_STYLE_KUNGFU;

		    SM(playerid, COLOR_WHITE, "** You have set %s's fight style to Kung Fu.", GetRPName(targetid));
		    SetPlayerFightingStyle(targetid, PlayerInfo[targetid][pFightStyle]);

		    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET fightstyle = %i WHERE uid = %i", PlayerInfo[targetid][pFightStyle], PlayerInfo[targetid][pID]);
		    mysql_tquery(connectionID, queryBuffer);
		}
		else if(!strcmp(param, "kneehead", true))
		{
		    PlayerInfo[targetid][pFightStyle] = FIGHT_STYLE_KNEEHEAD;

		    SM(playerid, COLOR_WHITE, "** You have set %s's fight style to Kneehead.", GetRPName(targetid));
		    SetPlayerFightingStyle(targetid, PlayerInfo[targetid][pFightStyle]);

		    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET fightstyle = %i WHERE uid = %i", PlayerInfo[targetid][pFightStyle], PlayerInfo[targetid][pID]);
		    mysql_tquery(connectionID, queryBuffer);
		}
		else if(!strcmp(param, "grabkick", true))
		{
		    PlayerInfo[targetid][pFightStyle] = FIGHT_STYLE_GRABKICK;

		    SM(playerid, COLOR_WHITE, "** You have set %s's fight style to Grabkick.", GetRPName(targetid));
		    SetPlayerFightingStyle(targetid, PlayerInfo[targetid][pFightStyle]);

		    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET fightstyle = %i WHERE uid = %i", PlayerInfo[targetid][pFightStyle], PlayerInfo[targetid][pID]);
		    mysql_tquery(connectionID, queryBuffer);
		}
		else if(!strcmp(param, "elbow", true))
		{
		    PlayerInfo[targetid][pFightStyle] = FIGHT_STYLE_ELBOW;

		    SM(playerid, COLOR_WHITE, "** You have set %s's fight style to Elbow.", GetRPName(targetid));
		    SetPlayerFightingStyle(targetid, PlayerInfo[targetid][pFightStyle]);

		    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET fightstyle = %i WHERE uid = %i", PlayerInfo[targetid][pFightStyle], PlayerInfo[targetid][pID]);
		    mysql_tquery(connectionID, queryBuffer);
		}
	}
    else if(!strcmp(option, "accent", true))
	{
	    new accent[16];

	    if(sscanf(param, "s[16]", accent))
	    {
	        return SCM(playerid, COLOR_SYNTAX, "[USAGE]: /setstat [playerid] [accent] [text]");
		}

		strcpy(PlayerInfo[targetid][pAccent], accent, 16);
		SM(playerid, COLOR_WHITE, "** You have set %s's accent to '%s'.", GetRPName(targetid), accent);

		mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET accent = '%e' WHERE uid = %i", accent, PlayerInfo[targetid][pID]);
  		mysql_tquery(connectionID, queryBuffer);
	}
	else if(!strcmp(option, "diamonds", true))
	{
	    if(sscanf(param, "i", value))
	    {
			return SendClientMessage(playerid, COLOR_SYNTAX, "[USAGE]: /setstat [playerid] [diamonds] [value]");
		}

		PlayerInfo[targetid][pDiamonds] = value;
	    SM(playerid, COLOR_WHITE, "You have set %s's diamonds to %i.", GetRPName(targetid), value);

	    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET diamonds = %i WHERE uid = %i", value, PlayerInfo[targetid][pID]);
	    mysql_tquery(connectionID, queryBuffer);
	}

	else if(!strcmp(option, "phone", true))
	{
	    if(sscanf(param, "i", value))
	    {
			return SCM(playerid, COLOR_SYNTAX, "[USAGE]: /setstat [playerid] [phone] [number]");
		}
		if(value == 911 || value == 6397 || value == 6324 || value == 8294)
		{
		    return SCM(playerid, COLOR_SYNTAX, "Invalid number.");
		}

		PlayerInfo[targetid][pPhone] = value;
	    SM(playerid, COLOR_WHITE, "** You have set %s's phone number to %i.", GetRPName(targetid), value);

	    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET phone = %i WHERE uid = %i", value, PlayerInfo[targetid][pID]);
	    mysql_tquery(connectionID, queryBuffer);
	}
	else if(!strcmp(option, "crimes", true))
	{
	    if(sscanf(param, "i", value))
	    {
			return SCM(playerid, COLOR_SYNTAX, "[USAGE]: /setstat [playerid] [crimes] [value]");
		}

		PlayerInfo[targetid][pCrimes] = value;
	    SM(playerid, COLOR_WHITE, "** You have set %s's commited crimes to %i.", GetRPName(targetid), value);

	    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET crimes = %i WHERE uid = %i", value, PlayerInfo[targetid][pID]);
	    mysql_tquery(connectionID, queryBuffer);
	}
	else if(!strcmp(option, "arrested", true))
	{
	    if(sscanf(param, "i", value))
	    {
			return SCM(playerid, COLOR_SYNTAX, "[USAGE]: /setstat [playerid] [arrested] [value]");
		}

		PlayerInfo[targetid][pArrested] = value;
	    SM(playerid, COLOR_WHITE, "** You have set %s's arrested count to %i.", GetRPName(targetid), value);

	    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET arrested = %i WHERE uid = %i", value, PlayerInfo[targetid][pID]);
	    mysql_tquery(connectionID, queryBuffer);
	}
	else if(!strcmp(option, "wantedlevel", true))
	{
	    if(sscanf(param, "i", value))
	    {
			return SCM(playerid, COLOR_SYNTAX, "[USAGE]: /setstat [playerid] [wantedlevel] [value]");
		}
		if(!(0 <= value <= 6))
		{
		    return SCM(playerid, COLOR_WHITE, "The value specified can't be under 0 or above 6.");
		}

		PlayerInfo[targetid][pWantedLevel] = value;
	    SM(playerid, COLOR_WHITE, "** You have set %s's wanted level to %i.", GetRPName(targetid), value);

	    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET wantedlevel = %i WHERE uid = %i", value, PlayerInfo[targetid][pID]);
	    mysql_tquery(connectionID, queryBuffer);
	}
	else if(!strcmp(option, "materials", true))
	{
	    if(sscanf(param, "i", value))
	    {
			return SCM(playerid, COLOR_SYNTAX, "[USAGE]: /setstat [playerid] [materials] [value]");
		}

		PlayerInfo[targetid][pMaterials] = value;
	    SM(playerid, COLOR_WHITE, "** You have set %s's materials to %i.", GetRPName(targetid), value);

	    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET materials = %i WHERE uid = %i", value, PlayerInfo[targetid][pID]);
	    mysql_tquery(connectionID, queryBuffer);
	}
	else if(!strcmp(option, "pot", true))
	{
	    if(sscanf(param, "i", value))
	    {
			return SCM(playerid, COLOR_SYNTAX, "[USAGE]: /setstat [playerid] [pot] [value]");
		}

		PlayerInfo[targetid][pPot] = value;
	    SM(playerid, COLOR_WHITE, "** You have set %s's pot to %i.", GetRPName(targetid), value);

	    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET pot = %i WHERE uid = %i", value, PlayerInfo[targetid][pID]);
	    mysql_tquery(connectionID, queryBuffer);
	}
	else if(!strcmp(option, "crack", true))
	{
	    if(sscanf(param, "i", value))
	    {
			return SCM(playerid, COLOR_SYNTAX, "[USAGE]: /setstat [playerid] [Crack] [value]");
		}

		PlayerInfo[targetid][pCrack] = value;
	    SM(playerid, COLOR_WHITE, "** You have set %s's Crack to %i.", GetRPName(targetid), value);

	    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET crack = %i WHERE uid = %i", value, PlayerInfo[targetid][pID]);
	    mysql_tquery(connectionID, queryBuffer);
	}
	else if(!strcmp(option, "meth", true))
	{
	    if(sscanf(param, "i", value))
	    {
			return SCM(playerid, COLOR_SYNTAX, "[USAGE]: /setstat [playerid] [meth] [value]");
		}

		PlayerInfo[targetid][pMeth] = value;
	    SM(playerid, COLOR_WHITE, "** You have set %s's meth to %i.", GetRPName(targetid), value);

	    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET meth = %i WHERE uid = %i", value, PlayerInfo[targetid][pID]);
	    mysql_tquery(connectionID, queryBuffer);
	}
	else if(!strcmp(option, "painkillers", true))
	{
	    if(sscanf(param, "i", value))
	    {
			return SCM(playerid, COLOR_SYNTAX, "[USAGE]: /setstat [playerid] [painkillers] [value]");
		}

		PlayerInfo[targetid][pPainkillers] = value;
	    SM(playerid, COLOR_WHITE, "** You have set %s's painkillers to %i.", GetRPName(targetid), value);

	    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET painkillers = %i WHERE uid = %i", value, PlayerInfo[targetid][pID]);
	    mysql_tquery(connectionID, queryBuffer);
	}
 	else if(!strcmp(option, "cigars", true))
	{
	    if(sscanf(param, "i", value))
	    {
			return SCM(playerid, COLOR_SYNTAX, "[USAGE]: /setstat [playerid] [cigars] [value]");
		}

		PlayerInfo[targetid][pCigars] = value;
	    SM(playerid, COLOR_WHITE, "** You have set %s's cigars to %i.", GetRPName(targetid), value);

	    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET cigars = %i WHERE uid = %i", value, PlayerInfo[targetid][pID]);
	    mysql_tquery(connectionID, queryBuffer);
	}
	else if(!strcmp(option, "portableradio", true))
	{
	    if(sscanf(param, "i", value) || !(0 <= value <= 1))
	    {
			return SCM(playerid, COLOR_SYNTAX, "[USAGE]: /setstat [playerid] [portableradio] [0/1]");
		}

		PlayerInfo[targetid][pWalkieTalkie] = value;
	    SM(playerid, COLOR_WHITE, "** You have set %s's Portable Radio to %i.", GetRPName(targetid), value);

	    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET walkietalkie = %i WHERE uid = %i", value, PlayerInfo[targetid][pID]);
	    mysql_tquery(connectionID, queryBuffer);
	}
	else if(!strcmp(option, "channel", true))
	{
	    if(sscanf(param, "i", value))
	    {
			return SCM(playerid, COLOR_SYNTAX, "[USAGE]: /setstat [playerid] [channel] [value]");
		}

		PlayerInfo[targetid][pChannel] = value;
	    SM(playerid, COLOR_WHITE, "** You have set %s's radio channel to %i.", GetRPName(targetid), value);

	    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET channel = %i WHERE uid = %i", value, PlayerInfo[targetid][pID]);
	    mysql_tquery(connectionID, queryBuffer);
	}
	else if(!strcmp(option, "spraycans", true))
	{
	    if(sscanf(param, "i", value))
	    {
			return SCM(playerid, COLOR_SYNTAX, "[USAGE]: /setstat [playerid] [spraycans] [value]");
		}

		PlayerInfo[targetid][pSpraycans] = value;
	    SM(playerid, COLOR_WHITE, "** You have set %s's spraycans to %i.", GetRPName(targetid), value);

	    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET spraycans = %i WHERE uid = %i", value, PlayerInfo[targetid][pID]);
	    mysql_tquery(connectionID, queryBuffer);
	}
    else if(!strcmp(option, "boombox", true))
	{
	    if(sscanf(param, "i", value) || !(0 <= value <= 1))
	    {
			return SCM(playerid, COLOR_SYNTAX, "[USAGE]: /setstat [playerid] [boombox] [0/1]");
		}

		if((value == 0) && PlayerInfo[targetid][pBoomboxPlaced])
		{
		    DestroyBoombox(targetid);
		}

		PlayerInfo[targetid][pBoombox] = value;
	    SM(playerid, COLOR_WHITE, "** You have set %s's boombox to %i.", GetRPName(targetid), value);

	    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET boombox = %i WHERE uid = %i", value, PlayerInfo[targetid][pID]);
	    mysql_tquery(connectionID, queryBuffer);
	}
	else if(!strcmp(option, "phonebook", true))
	{
	    if(sscanf(param, "i", value) || !(0 <= value <= 1))
	    {
			return SCM(playerid, COLOR_SYNTAX, "[USAGE]: /setstat [playerid] [phonebook] [0/1]");
		}

		PlayerInfo[targetid][pPhonebook] = value;
	    SM(playerid, COLOR_WHITE, "** You have set %s's phonebook to %i.", GetRPName(targetid), value);

	    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET phonebook = %i WHERE uid = %i", value, PlayerInfo[targetid][pID]);
	    mysql_tquery(connectionID, queryBuffer);
	}
	else if(!strcmp(option, "paycheck", true))
	{
	    if(sscanf(param, "i", value))
	    {
			return SCM(playerid, COLOR_SYNTAX, "[USAGE]: /setstat [playerid] [paycheck] [value]");
		}

		PlayerInfo[targetid][pPaycheck] = value;
	    SM(playerid, COLOR_WHITE, "** You have set %s's paycheck to $%i.", GetRPName(targetid), value);

	    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET paycheck = %i WHERE uid = %i", value, PlayerInfo[targetid][pID]);
	    mysql_tquery(connectionID, queryBuffer);
	}
	else if(!strcmp(option, "carlicense", true))
	{
	    if(sscanf(param, "i", value) || !(0 <= value <= 1))
	    {
			return SCM(playerid, COLOR_SYNTAX, "[USAGE]: /setstat [playerid] [carlicense] [0/1]");
		}

		PlayerInfo[targetid][pCarLicense] = value;
	    SM(playerid, COLOR_WHITE, "** You have set %s's car license to %i.", GetRPName(targetid), value);

	    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET carlicense = %i WHERE uid = %i", value, PlayerInfo[targetid][pID]);
	    mysql_tquery(connectionID, queryBuffer);
	}
	else if(!strcmp(option, "gunlicense", true))
	{
	    if(sscanf(param, "i", value) || !(0 <= value <= 1))
	    {
			return SCM(playerid, COLOR_SYNTAX, "[USAGE]: /setstat [playerid] [gunlicense] [0/1]");
		}

		PlayerInfo[targetid][pWeaponLicense] = value;
	    SM(playerid, COLOR_WHITE, "** You have set %s's gun license to %i.", GetRPName(targetid), value);

	    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET gunlicense = %i WHERE uid = %i", value, PlayerInfo[targetid][pID]);
	    mysql_tquery(connectionID, queryBuffer);
	}
	else if(!strcmp(option, "seeds", true))
	{
	    if(sscanf(param, "i", value))
	    {
			return SCM(playerid, COLOR_SYNTAX, "[USAGE]: /setstat [playerid] [seeds] [value]");
		}

		PlayerInfo[targetid][pSeeds] = value;
	    SM(playerid, COLOR_WHITE, "** You have set %s's seeds to %i.", GetRPName(targetid), value);

	    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET seeds = %i WHERE uid = %i", value, PlayerInfo[targetid][pID]);
	    mysql_tquery(connectionID, queryBuffer);
	}
	else if(!strcmp(option, "ephedrine", true))
	{
	    if(sscanf(param, "i", value))
	    {
			return SCM(playerid, COLOR_SYNTAX, "[USAGE]: /setstat [playerid] [ephedrine] [value]");
		}

		PlayerInfo[targetid][pEphedrine] = value;
	    SM(playerid, COLOR_WHITE, "** You have set %s's ephedrine to %i.", GetRPName(targetid), value);

	    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET ephedrine = %i WHERE uid = %i", value, PlayerInfo[targetid][pID]);
	    mysql_tquery(connectionID, queryBuffer);
	}
	/*else if(!strcmp(option, "job", true))
	{
	    if(sscanf(param, "i", value))
	    {
			SCM(playerid, COLOR_SYNTAX, "[USAGE]: /setstat [playerid] [job] [value (-1 = none)]");
			SCM(playerid, COLOR_GREY2, "List of jobs: (0) Foodpanda (1) Fisherman (2) Bodyguard (3) Arms Dealer (4) Miner");
			SCM(playerid, COLOR_GREY2, "List of jobs: (5) Taxi Driver (6) Drug Dealer (7) Lawyer (8) Detective (10) Garbageman (11) Forklifter (12) Lumber Jack (13) Consturction Job");
			return 1;
		}
		if(!(-1 <= value <= 13))
		{
		    return SCM(playerid, COLOR_SYNTAX, "Invalid job.");
		}

		PlayerInfo[targetid][pJob] = value;
	    SM(playerid, COLOR_WHITE, "** You have set %s's job to %s.", GetRPName(targetid), GetJobName(value));

	    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET job = %i WHERE uid = %i", value, PlayerInfo[targetid][pID]);
	    mysql_tquery(connectionID, queryBuffer);
	}*/
	else if(!strcmp(option, "mask", true))
	{
	    if(sscanf(param, "i", value))
	    {
			return SCM(playerid, COLOR_SYNTAX, "[USAGE]: /setstat [playerid] [mask] [0/1]");
		}
		if(!(-1 <= value <= 1))
		{
		    return SCM(playerid, COLOR_SYNTAX, "Invalid value.");
		}

		PlayerInfo[targetid][pMask] = value;
	    SM(playerid, COLOR_WHITE, "** You have set %s's mask to %i.", GetRPName(targetid), value);

	    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET mask = %i WHERE uid = %i", value, PlayerInfo[targetid][pID]);
	    mysql_tquery(connectionID, queryBuffer);
	}
	else if(!strcmp(option, "mp3player", true))
	{
	    if(sscanf(param, "i", value) || !(0 <= value <= 1))
	    {
			return SCM(playerid, COLOR_SYNTAX, "[USAGE]: /setstat [playerid] [mp3player] [0/1]");
		}

		PlayerInfo[targetid][pMP3Player] = value;
	    SM(playerid, COLOR_WHITE, "** You have set %s's MP3 Player to %i.", GetRPName(targetid), value);

	    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET mp3player = %i WHERE uid = %i", value, PlayerInfo[targetid][pID]);
	    mysql_tquery(connectionID, queryBuffer);
	}
	else if(!strcmp(option, "muriaticacid", true))
	{
	    if(sscanf(param, "i", value))
	    {
			return SCM(playerid, COLOR_SYNTAX, "[USAGE]: /setstat [playerid] [muriaticacid] [value]");
		}

		PlayerInfo[targetid][pMuriaticAcid] = value;
	    SM(playerid, COLOR_WHITE, "** You have set %s's muriatic acid to %i.", GetRPName(targetid), value);

	    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET muriaticacid = %i WHERE uid = %i", value, PlayerInfo[targetid][pID]);
	    mysql_tquery(connectionID, queryBuffer);
	}
	else if(!strcmp(option, "bakingsoda", true))
	{
	    if(sscanf(param, "i", value))
	    {
			return SCM(playerid, COLOR_SYNTAX, "[USAGE]: /setstat [playerid] [bakingsoda] [value]");
		}

		PlayerInfo[targetid][pBakingSoda] = value;
	    SM(playerid, COLOR_WHITE, "** You have set %s's baking soda to %i.", GetRPName(targetid), value);

	    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET bakingsoda = %i WHERE uid = %i", value, PlayerInfo[targetid][pID]);
	    mysql_tquery(connectionID, queryBuffer);
	}
	else if(!strcmp(option, "hpammo", true))
	{
	    if(sscanf(param, "i", value))
	    {
			return SCM(playerid, COLOR_SYNTAX, "[USAGE]: /setstat [playerid] [hpammo] [value]");
		}

		SetWeaponAmmo(targetid, AMMO_HP, value);
	    SM(playerid, COLOR_WHITE, "** You have set %s's hollow point ammunition to %i.", GetRPName(targetid), value);

	    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET hpammo = %i WHERE uid = %i", value, PlayerInfo[targetid][pID]);
	    mysql_tquery(connectionID, queryBuffer);
	}
	else if(!strcmp(option, "poisonammo", true))
	{
	    if(sscanf(param, "i", value))
	    {
			return SCM(playerid, COLOR_SYNTAX, "[USAGE]: /setstat [playerid] [poisonammo] [value]");
		}

		SetWeaponAmmo(targetid, AMMO_POISON, value);
	    SM(playerid, COLOR_WHITE, "** You have set %s's poison tip ammunition to %i.", GetRPName(targetid), value);

	    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET poisonammo = %i WHERE uid = %i", value, PlayerInfo[targetid][pID]);
	    mysql_tquery(connectionID, queryBuffer);
	}
	else if(!strcmp(option, "fmjammo", true))
	{
	    if(sscanf(param, "i", value))
	    {
			return SCM(playerid, COLOR_SYNTAX, "[USAGE]: /setstat [playerid] [fmjammo] [value]");
		}

		SetWeaponAmmo(targetid, AMMO_FMJ, value);
	    SM(playerid, COLOR_WHITE, "** You have set %s's full metal jacket ammunition to %i.", GetRPName(targetid), value);

	    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET fmjammo = %i WHERE uid = %i", value, PlayerInfo[targetid][pID]);
	    mysql_tquery(connectionID, queryBuffer);
	}
	else if(!strcmp(option, "dmwarnings", true))
	{
	    if(sscanf(param, "i", value))
	    {
			return SCM(playerid, COLOR_SYNTAX, "[USAGE]: /setstat [playerid] [dmwarnings] [value]");
		}
		if(!(0 <= value <= 4))
		{
		    return SCM(playerid, COLOR_SYNTAX, "The value must range from 0 to 4.");
		}

		PlayerInfo[targetid][pDMWarnings] = value;
	    SM(playerid, COLOR_WHITE, "** You have set %s's DM warnings to %i.", GetRPName(targetid), value);

	    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET dmwarnings = %i WHERE uid = %i", value, PlayerInfo[targetid][pID]);
	    mysql_tquery(connectionID, queryBuffer);
	}
	else if(!strcmp(option, "weaponrestricted", true))
	{
	    if(sscanf(param, "i", value))
	    {
			return SCM(playerid, COLOR_SYNTAX, "[USAGE]: /setstat [playerid] [weaponrestricted] [hours]");
		}

		PlayerInfo[targetid][pWeaponRestricted] = value;
	    SM(playerid, COLOR_WHITE, "** You have set %s's weapon restriction to %i hours.", GetRPName(targetid), value);

	    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET weaponrestricted = %i WHERE uid = %i", value, PlayerInfo[targetid][pID]);
	    mysql_tquery(connectionID, queryBuffer);
	}
    else if(!strcmp(option, "watch", true))
	{
	    if(sscanf(param, "i", value) || !(0 <= value <= 1))
	    {
			return SCM(playerid, COLOR_SYNTAX, "[USAGE]: /setstat [playerid] [watch] [0/1]");
		}

		PlayerInfo[targetid][pWatch] = value;
	    SM(playerid, COLOR_WHITE, "** You have set %s's watch to %i.", GetRPName(targetid), value);

	    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET watch = %i WHERE uid = %i", value, PlayerInfo[targetid][pID]);
	    mysql_tquery(connectionID, queryBuffer);
	}
	else if(!strcmp(option, "gps", true))
	{
	    if(sscanf(param, "i", value) || !(0 <= value <= 1))
	    {
			return SCM(playerid, COLOR_SYNTAX, "[USAGE]: /setstat [playerid] [gps] [0/1]");
		}

		PlayerInfo[targetid][pGPS] = value;
	    SM(playerid, COLOR_WHITE, "** You have set %s's GPS to %i.", GetRPName(targetid), value);

	    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET gps = %i WHERE uid = %i", value, PlayerInfo[targetid][pID]);
	    mysql_tquery(connectionID, queryBuffer);
	}
	else if(!strcmp(option, "gascan", true))
	{
	    if(sscanf(param, "i", value))
	    {
			return SCM(playerid, COLOR_SYNTAX, "[USAGE]: /setstat [playerid] [gascan] [value]");
		}

		PlayerInfo[targetid][pGasCan] = value;
	    SM(playerid, COLOR_WHITE, "** You have set %s's gas can to %i.", GetRPName(targetid), value);

	    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET gascan = %i WHERE uid = %i", value, PlayerInfo[targetid][pID]);
	    mysql_tquery(connectionID, queryBuffer);
	}
    else if(!strcmp(option, "truckerskill", true))
	{
	    if(sscanf(param, "i", value))
	    {
			return SCM(playerid, COLOR_SYNTAX, "[USAGE]: /setstat [playerid] [truckerskill] [value]");
		}

		PlayerInfo[targetid][pCourierSkill] = value;
	    SM(playerid, COLOR_WHITE, "** You have set %s's trucker skill to %i.", GetRPName(targetid), value);

	    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET courierskill = %i WHERE uid = %i", value, PlayerInfo[targetid][pID]);
	    mysql_tquery(connectionID, queryBuffer);
	}
	else if(!strcmp(option, "fishingskill", true))
	{
	    if(sscanf(param, "i", value))
	    {
			return SCM(playerid, COLOR_SYNTAX, "[USAGE]: /setstat [playerid] [fishingskill] [value]");
		}

		PlayerInfo[targetid][pFishingSkill] = value;
	    SM(playerid, COLOR_WHITE, "** You have set %s's fishing skill to %i.", GetRPName(targetid), value);

	    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET fishingskill = %i WHERE uid = %i", value, PlayerInfo[targetid][pID]);
	    mysql_tquery(connectionID, queryBuffer);
	}
	else if(!strcmp(option, "guardskill", true))
	{
	    if(sscanf(param, "i", value))
	    {
			return SCM(playerid, COLOR_SYNTAX, "[USAGE]: /setstat [playerid] [guardskill] [value]");
		}

		PlayerInfo[targetid][pGuardSkill] = value;
	    SM(playerid, COLOR_WHITE, "** You have set %s's bodyguard skill to %i.", GetRPName(targetid), value);

	    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET guardskill = %i WHERE uid = %i", value, PlayerInfo[targetid][pID]);
	    mysql_tquery(connectionID, queryBuffer);
	}
	else if(!strcmp(option, "weaponskill", true))
	{
	    if(sscanf(param, "i", value))
	    {
			return SCM(playerid, COLOR_SYNTAX, "[USAGE]: /setstat [playerid] [weaponskill] [value]");
		}

		PlayerInfo[targetid][pWeaponSkill] = value;
	    SM(playerid, COLOR_WHITE, "** You have set %s's weapon skill to %i.", GetRPName(targetid), value);

	    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET weaponskill = %i WHERE uid = %i", value, PlayerInfo[targetid][pID]);
	    mysql_tquery(connectionID, queryBuffer);
	}
	else if(!strcmp(option, "lawyerskill", true))
	{
	    if(sscanf(param, "i", value))
	    {
			return SCM(playerid, COLOR_SYNTAX, "[USAGE]: /setstat [playerid] [lawyerskill] [value]");
		}

		PlayerInfo[targetid][pLawyerSkill] = value;
	    SM(playerid, COLOR_WHITE, "** You have set %s's lawyer skill to %i.", GetRPName(targetid), value);

	    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET lawyerskill = %i WHERE uid = %i", value, PlayerInfo[targetid][pID]);
	    mysql_tquery(connectionID, queryBuffer);
	}
	else if(!strcmp(option, "detectiveskill", true))
	{
	    if(sscanf(param, "i", value))
	    {
			return SCM(playerid, COLOR_SYNTAX, "[USAGE]: /setstat [playerid] [detectiveskill] [value]");
		}

		PlayerInfo[targetid][pDetectiveSkill] = value;
	    SM(playerid, COLOR_WHITE, "** You have set %s's detective skill to %i.", GetRPName(targetid), value);

	    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET detectiveskill = %i WHERE uid = %i", value, PlayerInfo[targetid][pID]);
	    mysql_tquery(connectionID, queryBuffer);
	}
	else
	{
	    return 1;
	}

	Log_Write("log_admin", "%s (uid: %i) set %s's (uid: %i) %s to %s", GetPlayerNameEx(playerid), PlayerInfo[playerid][pID], GetPlayerNameEx(targetid), PlayerInfo[targetid][pID], option, param);
	return 1;
}
