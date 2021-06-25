
public BodyParts(playerid)
{
	if(IsPlayerConnected(playerid))
	{
        pBody[playerid][0] = 0;
		pBody[playerid][1] = 0;
		pBody[playerid][2] = 0;
		pBody[playerid][3] = 0;
		pBody[playerid][4] = 0;
		pBody[playerid][5] = 0;
		pBody[playerid][6] = 0;
		pBody[playerid][7] = 0;
		pBody[playerid][8] = 0;
		pBody[playerid][9] = 0;
		pBody[playerid][10] = 0;
		pBody[playerid][11] = 0;
		pBody[playerid][12] = 0;
		pBody[playerid][13] = 0;
		pBody[playerid][14] = 0;
		pBody[playerid][15] = 0;
		pBody[playerid][16] = 0;
		pBody[playerid][17] = 0;
		pBody[playerid][18] = 0;
	}
    return 1;
}



public OnPlayerTakeDamage(playerid, issuerid, Float: amount, weaponid, bodypart)
{
	if(PlayerInfo[playerid][pInjured] == 0)
	{
	    new Float:HP;
	    new Float:AM;
	    GetPlayerHealth(playerid, HP);
	    GetPlayerArmour(playerid, AM);
	    new string[64];
	    new WeaponName[65];
	    new hit[32];
	    if(bodypart == 1) { hit = "Left Thigh"; }
        else if(bodypart == 2) { hit = "Right Thigh"; }
		else if(bodypart == 3) { hit = "Left Upper Arm"; }
		else if(bodypart == 4) { hit = "Right Upper Arm"; }
		else if(bodypart == 5) { hit = "Left Hand"; }
		else if(bodypart == 6) { hit = "Right Hand"; }
		else if(bodypart == 7) { hit = "Spine"; }
		else if(bodypart == 8) { hit = "Jaw"; }
		else if(bodypart == 9) { hit = "Neck"; }
		else if(bodypart == 10) { hit = "Head"; }
		else if(bodypart == 11) { hit = "Right Calf"; }
		else if(bodypart == 12) { hit = "Left Calf"; }
		else if(bodypart == 13) { hit = "Left Forearm"; }
		else if(bodypart == 14) { hit = "Right Forearm"; }
		else if(bodypart == 15) { hit = "Left Clavicle"; }
		else if(bodypart == 16) { hit = "Right Clavicle"; }
		else if(bodypart == 17) { hit = "Right Foot"; }
		else if(bodypart == 18) { hit = "Left Foot"; }
		else if(bodypart == 0) { hit = "Unknown"; }
		GetWeaponName(weaponid, WeaponName, 64);
	    if(!weaponid)
		{
	        SetPlayerArmour(playerid, AM);
	        amount = 5.0;
		    if(HP > 5.0)
		    {
		        SetPlayerHealth(playerid, HP-amount);
		        if(pBody[playerid][bodypart] == 0 && PlayerPaintballing[playerid] == 0) pBody[playerid][bodypart] = 16;
		        format(string, sizeof(string), "%s ~r~-%.1f", hit, amount);
		        GameTextForPlayer(playerid, string, 5000, 5);
		        return 1;
		    }
		    else if(HP >= 0.0 && HP < 5.0)
		    {
		        SetPlayerHealth(playerid, 0);
		        if(pBody[playerid][bodypart] == 0 && PlayerPaintballing[playerid] == 0) pBody[playerid][bodypart] = 16;
		        format(string, sizeof(string), "%s ~r~-%.1f", hit, amount);
		        GameTextForPlayer(playerid, string, 5000, 5);
		        return 1;
		    }
		}
		if(weaponid == 3)
		{
	        SetPlayerArmour(playerid, AM);
	        amount = 7.0;
		    if(HP > 7.0)
		    {
		        SetPlayerHealth(playerid, HP-amount);
		        if(pBody[playerid][bodypart] == 0 && PlayerPaintballing[playerid] == 0) pBody[playerid][bodypart] = 16;
		        format(string, sizeof(string), "%s~n~%s~n~~r~-%.1f", hit, WeaponName, amount);
		        GameTextForPlayer(playerid, string, 5000, 5);
		        return 1;
		    }
		    else if(HP >= 0.0 && HP < 7.0)
		    {
		        SetPlayerHealth(playerid, 0);
		        if(pBody[playerid][bodypart] == 0 && PlayerPaintballing[playerid] == 0) pBody[playerid][bodypart] = 16;
		        format(string, sizeof(string), "%s~n~%s~n~~r~-%.1f", hit, WeaponName, amount);
		        GameTextForPlayer(playerid, string, 5000, 5);
		        return 1;
		    }
		}
		if(weaponid == 4)
		{
		    SetPlayerArmour(playerid, AM);
		    amount = 18.0;
		    if(HP > 18.0)
		    {
		        SetPlayerHealth(playerid, HP-amount);
		        if(pBody[playerid][bodypart] == 0 && PlayerPaintballing[playerid] == 0) pBody[playerid][bodypart] = 17;
		        format(string, sizeof(string), "%s~n~%s~n~~r~-%.1f", hit, WeaponName, amount);
		        GameTextForPlayer(playerid, string, 5000, 5);
		        return 1;
		    }
		    else if(HP >= 0.0 && HP < 18.0)
		    {
		        SetPlayerHealth(playerid, 0);
		        if(pBody[playerid][bodypart] == 0 && PlayerPaintballing[playerid] == 0) pBody[playerid][bodypart] = 17;
		        format(string, sizeof(string), "%s~n~%s~n~~r~-%.1f", hit, WeaponName, amount);
		        GameTextForPlayer(playerid, string, 5000, 5);
		        return 1;
		    }
		}
		if(weaponid == 5)
		{
		    SetPlayerArmour(playerid, AM);
		    amount = 7.0;
		    if(HP > 7.0)
		    {
		        SetPlayerHealth(playerid, HP-amount);
		        if(pBody[playerid][bodypart] == 0 && PlayerPaintballing[playerid] == 0) pBody[playerid][bodypart] = 16;
		        format(string, sizeof(string), "%s~n~%s~n~~r~-%.1f", hit, WeaponName, amount);
		        GameTextForPlayer(playerid, string, 5000, 5);
		        return 1;
		    }
		    else if(HP >= 0.0 && HP < 7.0)
		    {
		        SetPlayerHealth(playerid, 0);
	            if(pBody[playerid][bodypart] == 0 && PlayerPaintballing[playerid] == 0) pBody[playerid][bodypart] = 16;
		        format(string, sizeof(string), "%s~n~%s~n~~r~-%.1f", hit, WeaponName, amount);
		        GameTextForPlayer(playerid, string, 5000, 5);
		        return 1;
		    }
		}
	    if(weaponid == 24)
		{
	        amount = 32.0;
			if(AM > 32.0)
			{
		        SetPlayerArmour(playerid, AM-amount);
		        format(string, sizeof(string), "%s~n~%s~n~~r~-%.1f", hit, WeaponName, amount);
		        GameTextForPlayer(playerid, string, 5000, 5);
		        return 1;
		    }
		    else if(AM > 0.0 && AM < 32.0)
		    {
		        SetPlayerArmour(playerid, 0);
		        format(string, sizeof(string), "%s~n~%s~n~~r~-%.1f", hit, WeaponName, amount);
		        GameTextForPlayer(playerid, string, 5000, 5);
		        return 1;
		    }
		    else
		    {
		        SetPlayerArmour(playerid, 0);
		    }
		    if(HP > 32.0)
		    {
		        SetPlayerHealth(playerid, HP-amount);
		        if(PlayerPaintballing[playerid] == 0)
		        {
			        if(pBody[playerid][bodypart] == 16 || pBody[playerid][bodypart] == 17) pBody[playerid][bodypart] = 0;
			        if(pBody[playerid][bodypart] < 14) pBody[playerid][bodypart]+=2;
		        }
		        format(string, sizeof(string), "%s~n~%s~n~~r~-%.1f", hit, WeaponName, amount);
		        GameTextForPlayer(playerid, string, 5000, 5);
		        return 1;
		    }
		    else if(HP >= 0.0 && HP < 32.0)
		    {
		        SetPlayerHealth(playerid, 0);
		        if(PlayerPaintballing[playerid] == 0)
		        {
			        if(pBody[playerid][bodypart] == 16 || pBody[playerid][bodypart] == 17) pBody[playerid][bodypart] = 0;
			        if(pBody[playerid][bodypart] < 14) pBody[playerid][bodypart]+=2;
		        }
		        format(string, sizeof(string), "%s~n~%s~n~~r~-%.1f", hit, WeaponName, amount);
		        GameTextForPlayer(playerid, string, 5000, 5);
		        return 1;
		    }
		}
		if(weaponid == 23)
		{
		    amount = 10.0;
			if(AM > 10.0)
			{
		        SetPlayerArmour(playerid, AM-amount);
		        format(string, sizeof(string), "%s~n~%s~n~~r~-%.1f", hit, WeaponName, amount);
		        GameTextForPlayer(playerid, string, 5000, 5);
		        return 1;
		    }
		    else if(AM > 0.0 && AM < 10.0)
		    {
		        SetPlayerArmour(playerid, 0);
		        format(string, sizeof(string), "%s~n~%s~n~~r~-%.1f", hit, WeaponName, amount);
		        GameTextForPlayer(playerid, string, 5000, 5);
		        return 1;
		    }
		    else
		    {
		        SetPlayerArmour(playerid, 0);
		    }
		    if(HP > 10.0)
		    {
		        SetPlayerHealth(playerid, HP-amount);
		        if(PlayerPaintballing[playerid] == 0)
		        {
			        if(pBody[playerid][bodypart] == 16 || pBody[playerid][bodypart] == 17) pBody[playerid][bodypart] = 0;
			        if(pBody[playerid][bodypart] < 15) pBody[playerid][bodypart]++;
		        }
		        format(string, sizeof(string), "%s~n~%s~n~~r~-%.1f", hit, WeaponName, amount);
		        GameTextForPlayer(playerid, string, 5000, 5);
		        return 1;
		    }
		    else if(HP >= 0.0 && HP < 10.0)
		    {
		        SetPlayerHealth(playerid, 0);
		        if(PlayerPaintballing[playerid] == 0)
		        {
			        if(pBody[playerid][bodypart] == 16 || pBody[playerid][bodypart] == 17) pBody[playerid][bodypart] = 0;
			        if(pBody[playerid][bodypart] < 15) pBody[playerid][bodypart]++;
		        }
		        format(string, sizeof(string), "%s~n~%s~n~~r~-%.1f", hit, WeaponName, amount);
		        GameTextForPlayer(playerid, string, 5000, 5);
		        return 1;
		    }
		}
		if(weaponid == 29)
		{
		    amount = 4.0;
			if(AM > 4.0)
			{
		        SetPlayerArmour(playerid, AM-amount);
		        format(string, sizeof(string), "%s~n~~w~ -%.1f", hit, WeaponName, amount);
		        GameTextForPlayer(playerid, string, 5000, 5);
		        return 1;
		    }
		    else if(AM > 0.0 && AM < 4.0)
		    {
		        SetPlayerArmour(playerid, 0);
		        format(string, sizeof(string), "%s~n~%s~n~~r~-%.1f", hit, WeaponName, amount);
		        GameTextForPlayer(playerid, string, 5000, 5);
		        return 1;
		    }
		    else
		    {
		        SetPlayerArmour(playerid, 0);
		    }
		    if(HP > 4.0)
		    {
		        SetPlayerHealth(playerid, HP-amount);
		        if(PlayerPaintballing[playerid] == 0)
		        {
			        if(pBody[playerid][bodypart] == 16 || pBody[playerid][bodypart] == 17) pBody[playerid][bodypart] = 0;
			        if(pBody[playerid][bodypart] < 15) pBody[playerid][bodypart]++;
		        }
		        format(string, sizeof(string), "%s~n~%s~n~~r~-%.1f", hit, WeaponName, amount);
		        GameTextForPlayer(playerid, string, 5000, 5);
		        return 1;
		    }
		    else if(HP > 0.0 && HP < 4.0)
		    {
		        SetPlayerHealth(playerid, 0);
		        if(PlayerPaintballing[playerid] == 0)
		        {
			        if(pBody[playerid][bodypart] == 16 || pBody[playerid][bodypart] == 17) pBody[playerid][bodypart] = 0;
			        if(pBody[playerid][bodypart] < 15) pBody[playerid][bodypart]++;
		        }
		        format(string, sizeof(string), "%s~n~%s~n~~r~-%.1f", hit, WeaponName, amount);
		        GameTextForPlayer(playerid, string, 5000, 5);
		        return 1;
		    }
		}
		if(weaponid == 31)
		{
		    amount = 9.0;
			if(AM > 9.0)
			{
		        SetPlayerArmour(playerid, AM-amount);
		        format(string, sizeof(string), "%s~n~%s~n~~r~-%.1f", hit, WeaponName, amount);
		        GameTextForPlayer(playerid, string, 5000, 5);
		        return 1;
		    }
		    else if(AM > 0.0 && AM < 9.0)
		    {
		        SetPlayerArmour(playerid, 0);
		        format(string, sizeof(string), "%s~n~%s~n~~r~-%.1f", hit, WeaponName, amount);
		        GameTextForPlayer(playerid, string, 5000, 5);
		        return 1;
		    }
		    else
		    {
		        SetPlayerArmour(playerid, 0);
		    }
		    if(HP > 9.0)
		    {
		        SetPlayerHealth(playerid, HP-amount);
		        if(PlayerPaintballing[playerid] == 0)
		        {
			        if(pBody[playerid][bodypart] == 16 || pBody[playerid][bodypart] == 17) pBody[playerid][bodypart] = 0;
			        if(pBody[playerid][bodypart] < 14) pBody[playerid][bodypart]+=2;
		        }
		        format(string, sizeof(string), "%s~n~%s~n~~r~-%.1f", hit, WeaponName, amount);
		        GameTextForPlayer(playerid, string, 5000, 5);
		        return 1;
		    }
		    else if(HP >= 0.0 && HP < 9.0)
		    {
		        SetPlayerHealth(playerid, 0);
		        if(PlayerPaintballing[playerid] == 0)
		        {
			        if(pBody[playerid][bodypart] == 16 || pBody[playerid][bodypart] == 17) pBody[playerid][bodypart] = 0;
			        if(pBody[playerid][bodypart] < 14) pBody[playerid][bodypart]+=2;
		        }
		        format(string, sizeof(string), "%s~n~%s~n~~r~-%.1f", hit, WeaponName, amount);
		        GameTextForPlayer(playerid, string, 5000, 5);
		        return 1;
		    }
		}
	    if(weaponid == 30)
		{
		    amount = 10.0;
			if(AM > 10.0)
			{
		        SetPlayerArmour(playerid, AM-amount);
		        format(string, sizeof(string), "%s~n~%s~n~~r~-%.1f", hit, WeaponName, amount);
		        GameTextForPlayer(playerid, string, 5000, 5);
		        return 1;
		    }
		    else if(AM > 0.0 && AM < 10.0)
		    {
		        SetPlayerArmour(playerid, 0);
		        format(string, sizeof(string), "%s~n~%s~n~~r~-%.1f", hit, WeaponName, amount);
		        GameTextForPlayer(playerid, string, 5000, 5);
		        return 1;
		    }
		    else
		    {
		        SetPlayerArmour(playerid, 0);
		    }
		    if(HP > 10.0)
		    {
		        SetPlayerHealth(playerid, HP-amount);
		        if(PlayerPaintballing[playerid] == 0)
		        {
			        if(pBody[playerid][bodypart] == 16 || pBody[playerid][bodypart] == 17) pBody[playerid][bodypart] = 0;
			        if(pBody[playerid][bodypart] < 14) pBody[playerid][bodypart]+=2;
		        }
		        format(string, sizeof(string), "%s~n~%s~n~~r~-%.1f", hit, WeaponName, amount);
		        GameTextForPlayer(playerid, string, 5000, 5);
		        return 1;
		    }
		    else if(HP >= 0.0 && HP < 10.0)
		    {
		        SetPlayerHealth(playerid, 0);
		        if(PlayerPaintballing[playerid] == 0)
		        {
			        if(pBody[playerid][bodypart] == 16 || pBody[playerid][bodypart] == 17) pBody[playerid][bodypart] = 0;
			        if(pBody[playerid][bodypart] < 14) pBody[playerid][bodypart]+=2;
		        }
		        format(string, sizeof(string), "%s~n~%s~n~~r~-%.1f", hit, WeaponName, amount);
		        GameTextForPlayer(playerid, string, 5000, 5);
		        return 1;
		    }
		}
		if(weaponid == 25)
		{
		    amount = 24.0;
			if(AM > 24.0)
			{
		        SetPlayerArmour(playerid, AM-amount);
		        format(string, sizeof(string), "%s~n~%s~n~~r~-%.1f", hit, WeaponName, amount);
		        GameTextForPlayer(playerid, string, 5000, 5);
		        return 1;
		    }
		    else if(AM > 0.0 && AM < 24.0)
		    {
		        SetPlayerArmour(playerid, 0);
		        format(string, sizeof(string), "%s~n~%s~n~~r~-%.1f", hit, WeaponName, amount);
		        GameTextForPlayer(playerid, string, 5000, 5);
		        return 1;
		    }
		    else
		    {
		        SetPlayerArmour(playerid, 0);
		    }
		    if(HP > 24.0)
		    {
		        SetPlayerHealth(playerid, HP-amount);
		        if(PlayerPaintballing[playerid] == 0)
		        {
			        if(pBody[playerid][bodypart] == 16 || pBody[playerid][bodypart] == 17) pBody[playerid][bodypart] = 0;
			        if(pBody[playerid][bodypart] < 15) pBody[playerid][bodypart]++;
		        }
		        format(string, sizeof(string), "%s~n~%s~n~~r~-%.1f", hit, WeaponName, amount);
		        GameTextForPlayer(playerid, string, 5000, 5);
		        return 1;
		    }
		    else if(HP >= 0.0 && HP < 24.0)
		    {
		        SetPlayerHealth(playerid, 0);
		        if(PlayerPaintballing[playerid] == 0)
		        {
			        if(pBody[playerid][bodypart] == 16 || pBody[playerid][bodypart] == 17) pBody[playerid][bodypart] = 0;
			        if(pBody[playerid][bodypart] < 15) pBody[playerid][bodypart]++;
		        }
		        format(string, sizeof(string), "%s~n~%s~n~~r~-%.1f", hit, WeaponName, amount);
		        GameTextForPlayer(playerid, string, 5000, 5);
		        return 1;
		    }
		}
		if(weaponid == 27)
		{
		    amount = 32.0;
			if(AM > 32.0)
			{
		        SetPlayerArmour(playerid, AM-amount);
		        format(string, sizeof(string), "%s~n~%s~n~~r~-%.1f", hit, WeaponName, amount);
		        GameTextForPlayer(playerid, string, 5000, 5);
		        return 1;
		    }
		    else if(AM > 0.0 && AM < 32.0)
		    {
		        SetPlayerArmour(playerid, 0);
		        format(string, sizeof(string), "%s~n~%s~n~~r~-%.1f", hit, WeaponName, amount);
		        GameTextForPlayer(playerid, string, 5000, 5);
		        return 1;
		    }
		    else
		    {
		        SetPlayerArmour(playerid, 0);
		    }
		    if(HP > 32.0)
		    {
		        SetPlayerHealth(playerid, HP-amount);
		        if(PlayerPaintballing[playerid] == 0)
		        {
			        if(pBody[playerid][bodypart] == 16 || pBody[playerid][bodypart] == 17) pBody[playerid][bodypart] = 0;
			        if(pBody[playerid][bodypart] < 14) pBody[playerid][bodypart]+=2;
		        }
		        format(string, sizeof(string), "%s~n~%s~n~~r~-%.1f", hit, WeaponName, amount);
		        GameTextForPlayer(playerid, string, 5000, 5);
		        return 1;
		    }
		    else if(HP >= 0.0 && HP < 32.0)
		    {
		        SetPlayerHealth(playerid, 0);
		        if(PlayerPaintballing[playerid] == 0)
		        {
			        if(pBody[playerid][bodypart] == 16 || pBody[playerid][bodypart] == 17) pBody[playerid][bodypart] = 0;
			        if(pBody[playerid][bodypart] < 14) pBody[playerid][bodypart]+=2;
		        }
		        format(string, sizeof(string), "%s~n~%s~n~~r~-%.1f", hit, WeaponName, amount);
		        GameTextForPlayer(playerid, string, 5000, 5);
		        return 1;
		    }
		}
	}
    return 1;
}

