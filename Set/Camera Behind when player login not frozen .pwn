
public OnPlayerSpawn(playerid)
{
	SetPlayerAttachedObject(playerid, 5, 3026, 1,-0.1, -0.1, 0.0, 0.0, 0.0, 0.0, 1, 1, 1, 0xFF00FF00);
    GameTextForPlayer(playerid, "~r~Verfication Complete...", 3000, 3);

	TwData[playerid][LoggedIn] = 1;
	LoadTwitter(playerid);

	CheckPlayerFlood(playerid, true, MAX_FLOOD_RATE, 500, FLOOD_RATE_KICK);
	SetPlayerData(playerid, P_IN_HOUSE, 		-1);
	SetPlayerData(playerid, P_IN_BUSINESS, 		-1);
	SetPlayerData(playerid, P_IN_HOTEL_FLOOR, 	-1);
	SetPlayerData(playerid, P_IN_HOTEL_ROOM, 	-1);

	SetPlayerSkillsInit(playerid);

	if(!IsPlayerLogged(playerid))
	{
		if(GetPlayerData(playerid, P_ACCOUNT_STATE) == ACCOUNT_STATE_REG_SKIN)
		{
			//new sex = bool: GetPlayerSex(playerid);

			if(!IsPlayerLogged(playerid))
			{
				if(GetPlayerData(playerid, P_ACCOUNT_STATE) == ACCOUNT_STATE_REG_SKIN)
				{
					new sex = GetPlayerSex(playerid);

					switch(sex)
					{
						case 0: SetPlayerData(playerid, P_SKIN, 46);
						default: SetPlayerData(playerid, P_SKIN, 56);
					}

					new query[90];
					mysql_format(mysql, query, sizeof query, "UPDATE accounts SET skin=%d,last_login=%d WHERE id=%d LIMIT 1", GetPlayerSkinEx(playerid), gettime(), GetPlayerAccountID(playerid));
					mysql_query(mysql, query, false);

					if(!mysql_errno())
					{
						SetPlayerData(playerid, P_MONEY, 800);
						SetPlayerData(playerid, P_PASS, 1);
						UpdatePlayerDatabaseInt(playerid, "pass", GetPlayerData(playerid, P_PASS));

						SetPlayerSpawnInit(playerid);
						SpawnPlayer(playerid);
						SpawnPlayer(playerid);
						SpawnPlayer(playerid);
												
						SetPlayerInit(playerid);

						return 1;
					}
					else SendClientMessage(playerid, 0xCECECEFF, "Simpan kesalahan, coba lagi {FF0000}(equ-code 01)");
				}
			}
		}
	}
	else
	{
		SetPlayerInterior(playerid, 0);
		SetPlayerVirtualWorld(playerid, 0);
		SetPlayerSpawnPos(playerid);

		if(GetPlayerData(playerid, P_HOSPITAL)) SetPlayerHealthEx(playerid, 15.0);

		if(!GetPlayerData(playerid, P_ANIMS_INIT))
		{
			PreLoadPlayerAnims(playerid);
			SetPlayerData(playerid, P_ANIMS_INIT, true);
		}

		if(GetPlayerData(playerid, P_MASK) >= 2)
		{
			SetPlayerColorInit(playerid);
			SetPlayerData(playerid, P_MASK, 0);
		}
	}

	if(GetPlayerAdminEx(playerid) < 1) return 1;

	new fmt_text[80],
	    on_off[2][20] = {"{FF5533}dimatikan", "{66CC33}termasuk"},
	    c_state = GetPVarInt(playerid, "admin_connect");

	SetPVarInt(playerid, "admin_connect", c_state ^ 1);

	format(fmt_text, sizeof fmt_text, "Kamu adalah %s {1E90FF} pesan masuk/pemain keluar", on_off[c_state ^ 1]);
	SendClientMessage(playerid, 0x1E90FFFF, fmt_text);

	SetPlayerData(playerid, P_LAST_MP, 0);
	SetPlayerSpawnInit(playerid);
	SetPlayerSkinInit(playerid);
//	SpawnPlayer(playerid);
	SetCameraBehindPlayer(playerid);
	TogglePlayerControllable(playerid, true);

    return 1;
}
