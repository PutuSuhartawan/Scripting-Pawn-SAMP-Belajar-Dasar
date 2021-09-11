
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
