stock IsAGang(playerid)
{
	switch(PlayerInfo[playerid][pMember])
	{
		case FRACTION_BALLAS, FRACTION_VAGOS, FRACTION_GROVE, FRACTION_AZTEC, FRACTION_RIFA: return 1;
	}

	return false;
}


alias:plant("nanam");
CMD:plant(playerid)
{
    //SendClientError(playerid, "Mohon request fitur nanam yang cocok di discord secara resmi.");

	if(IsPlayerInRangeOfPoint(playerid,200.0,-358.9692,-1440.1328,24.4144))
 	{
      if(!IsAGang(playerid) && !IsAMafia(playerid)) return SCM(playerid, COLOR_GREY, "Anda tidak dapat menggunakannya. Hanya gangstar yang panen ganjos.");
	    if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}Kamu tidak bisa menggunakan command ini di dalam kendaraan");
        if(IsPlayerInAnyVehicle(playerid)) return SendClientError(playerid, "You can't plant while in a vehicle.");
    	new Float:ps[4];
    	GetPlayerPos(playerid, ps[0], ps[1], ps[2]);
    	new id = GetUnusedSeed();
    	myStrcpy(Seeds[id][sOwner], PlayerName(playerid));
    	format(iStr, sizeof(iStr), "{3a7a16}[Seed]\n{3a7a16}.. growing seed ..\n{c2d6b7}Planted By(%s)", PlayerName(playerid));
    	Seeds[id][sLabel] = CreateDynamic3DTextLabel(iStr, COLOR_PLAYER_SPECIALGREEN,ps[0], ps[1], ps[2], 15.0);
    	Seeds[id][sPickup] = CreateDynamicObject(3409, ps[0], ps[1], ps[2]-1.0, -1, -1, -1);
   		Seeds[id][sGrams] = 0;
    	Seeds[id][sActive] = 1;
    	Seeds[id][seedX] = ps[0];
    	Seeds[id][seedY] = ps[1];
    	Seeds[id][seedZ] = ps[2];
    	Seeds[id][plantTimer] = SetTimerEx("PlantGrowth", Seed_Growing * 1000, true, "i", id);
    	
 	}
 	else
 	{
 	    SendClientMessage(playerid, 0xCECECEFF, "Anda perlu pergi ke tempat nanam ladang ilegal Flint");
    	SetPlayerCheckpoint(playerid,-358.9692,-1440.1328,24.4144,150);
 	
 	}
	//return 1;
    
    
    
	/*

		if(PlayerDrugData[playerid][Seeds] < 1) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}Kamu tidak memiliki seeds drugs");
	    if(Player_PlantCount(playerid) >= MAKSIMAL_PLANT_DITANAM) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}Kamu tidak bisa menanam drugs seeds lagi max 10 bibit yang ditanam!");
	    if(GetClosestPlant(playerid) != -1) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}Tidak bisa plant drugs lagi dikarenakan ada plant lain yang dekat kamu");
	    new id = Iter_Free(Plants);
	    if(id == -1) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}Server drug plant limited telah tercapai!");
	    GetPlayerName(playerid, PlantData[id][plantedBy], MAX_PLAYER_NAME);
	    GetPlayerPos(playerid, PlantData[id][plantX], PlantData[id][plantY], PlantData[id][plantZ]);
        PlantData[id][plantGrowth] = 0;
	    PlantData[id][plantObj] = CreateDynamicObject(3409, PlantData[id][plantX], PlantData[id][plantY], PlantData[id][plantZ] - 1.70, 0.0, 0.0, 0.0);
	    SetDynamicObjectMaterial(PlantData[id][plantObj], 2, 19478, "signsurf", "sign", 0xFFFFFFFF);
	    new label_string[128];
	    format(label_string, sizeof(label_string), "Drug Plant (%d)\n\n{FFFFFF}Placed by %s\nGrowth: {E74C3C}0%%\n\n{FFFFFF}Gunakan /harvest untuk memanen", id, PlantData[id][plantedBy]);
	    PlantData[id][plantLabel] = CreateDynamic3DTextLabel(label_string, 0xF1C40FFF, PlantData[id][plantX], PlantData[id][plantY], PlantData[id][plantZ], 5.0);
	    PlantData[id][plantTimer] = SetTimerEx("PlantGrowth", LAMA_WAKTU_PANEN * 1000, true, "i", id);
	    Iter_Add(Plants, id);
	    PlayerDrugData[playerid][Seeds]--;
	    PlayerDrugData[playerid][TotalPlanted]++;
    */
    return 1;
    
}


alias:harvest("panen");
CMD:harvest(playerid)
{

	if(IsPlayerInRangeOfPoint(playerid,200.0,-358.9692,-1440.1328,24.4144))
 	{
 	    if(!IsAGang(playerid) && !IsAMafia(playerid)) return SCM(playerid, COLOR_GREY, "Anda tidak dapat menggunakannya. Hanya gangstar yang panen ganjos.");
	    if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}Kamu tidak bisa menggunakan command ini di dalam kendaraan");
        if(IsPlayerInAnyVehicle(playerid)) return SendClientError(playerid, "You can't plant while in a vehicle.");
   	 	new seedid = IsAtSeed(playerid);
    	if(seedid == -1) return SendClientError(playerid, "You are not at any seeds!");
    	if(strcmp(PlayerName(playerid), Seeds[seedid][sOwner], false)) return SendClientError(playerid, "This is not your seed dude! try to /plant");
    	new Float:ps[4];
    	GetPlayerPos(playerid, ps[0], ps[1], ps[2]);
    	format(iStr, sizeof(iStr), "You have collected [%d grams] from your seed", Seeds[seedid][sGrams]);
    	PlayerInfo[playerid][pDrugs] += Seeds[seedid][sGrams];
    	// tambah seeds di database
   		OnPlayerUpdateAccountsPer( playerid, "pDrugs", PlayerInfo[playerid][pDrugs]);
    	SendClientInfo(playerid, iStr);
    	//PlayerInfo[playerid]pDrugs] += Seeds[seedid][sGrams];
    	ResetSeed(seedid);

 	}
 	else
 	{
 	    SendClientMessage(playerid, 0xCECECEFF, "Anda perlu pergi ke tempat nanam ladang ilegal Flint");
    	SetPlayerCheckpoint(playerid,-358.9692,-1440.1328,24.4144,150);

 	}


