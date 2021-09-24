
epublic: OnServerRegistration(playerid)
{
    PlayerInfo[playerid][pID] = cache_insert_id();

    PlayerInfo[playerid][pSatiety] = 100;
	CreatePlayerSatietyBar(playerid);
    PlayerInfo[playerid][pHeals] = 2;
    PlayerInfo[playerid][pCash] = 150;
	cskin[playerid] = 0, PlayerInfo[playerid][pLogin] = 1, SetPlayerHealthEx(playerid, 100);
	Send(playerid, 0x7DD900FF, "Selamat atas pendaftaran sukses Anda, kami sarankan Anda membaca bagian ini {02BED9}'Bantuan'");
	PlayerInfo[playerid][pSetSpawn] = 0;
	SpawnPlayerEx(playerid);
	return 1;
}



stock InitRadar(Float:x, Float:y, Float:z, Float:angle, r_speed, save = false)
{
	new r = GetFreeRadarID(),
		radar_string[164];
	if(r == -1) return printf("Init Radar Error: MAX_COUNT_RADARS");

	//_radar[r][radar_object_id] = CreateDynamicObject(RADAR_OBJECT_ID, x,y,z,0.0,0.0,angle);// - RADAR_OBJECT_OFFSET
	_radar[r][radar_area] = CreateDynamicSphere(x, y, z, 25.0);
	_radar[r][radar_max_speed] = r_speed;
	if(save){
		new sql_radar[512];
		format(sql_radar,512,"INSERT INTO `radars`(`radar_x`, `radar_y`, `radar_z`, `radar_a`, `radar_speed`) VALUES ('%.2f','%.2f','%.2f','%.2f','%d')",x,y,z,angle,r_speed);
		mysql_tquery(mMysql,sql_radar);
		//_radar[r][radar_sql_id] = cache_insert_id();
		//cache_delete(result);
	}
	format(radar_string,sizeof(radar_string),RADAR_STRING, r + 1,_radar[r][radar_max_speed]);
	_radar[r][radar_text] = CreateDynamic3DTextLabel(radar_string,-1,x,y,z + 0.9,50.0);// + (RADAR_OBJECT_OFFSET + 0.5)
	if(_radar[r][radar_text_timer] != -1) KillTimer(_radar[r][radar_text_timer]);
	_radar[r][radar_text_timer] = SetTimerEx("UpdateLabelRadar", 400,1,"i", r);
	printf("RADAR_CREATE , ID: %d", r + 1);
	return true;
}


function OnPlayerRegister(playerid)
{
	if(pData[playerid][IsLoggedIn] == true)
		return Error(playerid, "You already logged in!");
		
	pData[playerid][pID] = cache_insert_id();
	pData[playerid][IsLoggedIn] = true;

	pData[playerid][pPosX] = DEFAULT_POS_X;
	pData[playerid][pPosY] = DEFAULT_POS_Y;
	pData[playerid][pPosZ] = DEFAULT_POS_Z;
	pData[playerid][pPosA] = DEFAULT_POS_A;
	pData[playerid][pInt] = 0;
	pData[playerid][pWorld] = 0;
	pData[playerid][pGender] = 0;
	
	format(pData[playerid][pAdminname], MAX_PLAYER_NAME, "None");
	format(pData[playerid][pEmail], 40, "None");
	pData[playerid][pHealth] = 100.0;
	pData[playerid][pArmour] = 0.0;
	pData[playerid][pLevel] = 1;
	pData[playerid][pHunger] = 100;
	pData[playerid][pBladder] = 100;
	pData[playerid][pEnergy] = 100;
	pData[playerid][pMoney] = 1000;
	pData[playerid][pBankMoney] = 1000;
	
	new query[128], rand = RandomEx(111111, 999999);
	new rek = rand+pData[playerid][pID];
	mysql_format(g_SQL, query, sizeof(query), "SELECT brek FROM players WHERE brek='%d'", rek);
	mysql_tquery(g_SQL, query, "BankRek", "id", playerid, rek);
	
	SetSpawnInfo(playerid, NO_TEAM, 0, pData[playerid][pPosX], pData[playerid][pPosY], pData[playerid][pPosZ], pData[playerid][pPosA], 0, 0, 0, 0, 0, 0);
	SpawnPlayer(playerid);
	return 1;
}


forward OnContactAdd(playerid, id);
public OnContactAdd(playerid, id)
{
	ContactData[playerid][id][contactID] = cache_insert_id();
	return 1;
}

