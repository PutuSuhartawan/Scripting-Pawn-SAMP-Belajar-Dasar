
stock SaveInfoBoard(i)
{
    new FileName[128];
    format(FileName, sizeof(FileName), "InfoBoards/InfoBoard_%d.ini", i);
    if(dini_Exists(FileName))
    {
        dini_IntSet(FileName, "TDString", InfoBoardInfo[i][InfoBoardTDstring]);
        dini_IntSet(FileName, "PickupID", InfoBoardInfo[i][InfoBoardPickupID]);
        dini_IntSet(FileName, "ObjectID", InfoBoardInfo[i][InfoBoardObjectID]);
        dini_FloatSet(FileName, "X", InfoBoardInfo[i][InfoBoardX]);
        dini_FloatSet(FileName, "Y", InfoBoardInfo[i][InfoBoardY]);
        dini_FloatSet(FileName, "Z", InfoBoardInfo[i][InfoBoardZ]);
        dini_FloatSet(FileName, "Angle", InfoBoardInfo[i][InfoBoardAngle]);
  		printf( "[system] Information Board %d saved.", i);
    }
	return 1;
}



stock SaveATM(i)
{
    new FileName[128];
    format(FileName, sizeof(FileName), "ATMs/ATM_%d.ini", i);
    if(dini_Exists(FileName))
    {
        dini_IntSet(FileName, "Cash", ATMInfo[i][ATMCash]);
        dini_IntSet(FileName, "Locked", ATMInfo[i][ATMLocked]);
        dini_IntSet(FileName, "Fee", ATMInfo[i][ATMFee]);
        dini_IntSet(FileName, "ObjectID", ATMInfo[i][ATMObjectID]);
        dini_FloatSet(FileName, "X", ATMInfo[i][ATMX]);
        dini_FloatSet(FileName, "Y", ATMInfo[i][ATMY]);
        dini_FloatSet(FileName, "Z", ATMInfo[i][ATMZ]);
        dini_FloatSet(FileName, "Angle", ATMInfo[i][ATMAngle]);
  		printf( "[system] ATM %d saved.", i);
    }
	return 1;
}


stock Savebuilding(i)
{
    new FileName[128];
    format(FileName, sizeof(FileName), "buildings/Building_%d.ini", i);
    if(dini_Exists(FileName))
    {
        dini_Set(FileName, "Name", BInfo[i][bName]);
        dini_IntSet(FileName, "Locked", BInfo[i][bLocked]);
        dini_IntSet(FileName, "VIP", BInfo[i][bVIP]);
        dini_IntSet(FileName, "ExteriorID", BInfo[i][bExteriorID]);
        dini_IntSet(FileName, "InteriorID", BInfo[i][bInteriorID]);
        dini_IntSet(FileName, "VirtualWorld", BInfo[i][bVirWorld]);
		dini_FloatSet(FileName, "InteriorX", BInfo[i][bInteriorX]);
    	dini_FloatSet(FileName, "InteriorY", BInfo[i][bInteriorY]);
		dini_FloatSet(FileName, "InteriorZ", BInfo[i][bInteriorZ]);
        dini_FloatSet(FileName, "ExteriorX", BInfo[i][bExteriorX]);
        dini_FloatSet(FileName, "ExteriorY", BInfo[i][bExteriorY]);
        dini_FloatSet(FileName, "ExteriorZ", BInfo[i][bExteriorZ]);
  		printf( "[system] Building %d saved.", i);
    }
	return 1;
}

stock LoadCars()
{
    new FileName[128];
	new carstring[256];
    for(new i = 0; i < MAX_CARS; i++)
    {
        format(FileName, sizeof(FileName), "Cars/car_%d.ini", i);
        if(fexist(FileName))
		{
		    CarInfo[i][CarModel] = dini_Int(FileName, "CarModel");
            CarInfo[i][CarPrice] = dini_Int(FileName, "CarPrice");
			CarInfo[i][CarX] = dini_Float(FileName, "CarX");
			CarInfo[i][CarY] = dini_Float(FileName, "CarY");
			CarInfo[i][CarZ] = dini_Float(FileName, "CarZ");
			CarInfo[i][CarF] = dini_Float(FileName, "CarF");
			CarInfo[i][CarSpawnX] = dini_Float(FileName, "CarSpawnX");
			CarInfo[i][CarSpawnY] = dini_Float(FileName, "CarSpawnY");
			CarInfo[i][CarSpawnZ] = dini_Float(FileName, "CarSpawnZ");
			CarInfo[i][CarSpawnF] = dini_Float(FileName, "CarSpawnF");
            CarInfo[i][CarColor] = dini_Int(FileName, "CarColor");
            CarInfo[i][CarColor] = dini_Int(FileName, "CarColor2");
			if(i == 1)
			{
				format(carstring,sizeof(carstring),"%s For Sale | {FFF1AF}Price: $%d | {6EF83C}ID: %d",vehName[CarInfo[i][CarModel]-400],CarInfo[i][CarPrice],i);
				CarInfo[i][CarText] = Create3DTextLabel(carstring, COLOR_CAR, 0.0, 0.0, 0.0, 15.0, 0);
			 	CarInfo[i][CarID] = AddStaticVehicleEx(CarInfo[i][CarModel],CarInfo[i][CarX],CarInfo[i][CarY],CarInfo[i][CarZ],CarInfo[i][CarF],CarInfo[i][CarColor],CarInfo[i][CarColor2],1);
				Attach3DTextLabelToVehicle(CarInfo[i][CarText], CarInfo[i][CarID], 0.0, 0.0, 0.0);
	//		    SetVehicleVirtualWorld(i,255);
				CarInfo[i][DealerShipCar] = 1;
			}
			else
			{
				format(carstring,sizeof(carstring),"%s For Sale | {FFF1AF}Price: $%d | {6EF83C}ID: %d",vehName[CarInfo[i][CarModel]-400],CarInfo[i][CarPrice],i);
				CarInfo[i][CarText] = Create3DTextLabel(carstring, COLOR_CAR, 0.0, 0.0, 0.0, 15.0, 0);
			 	CarInfo[i][CarID] = AddStaticVehicleEx(CarInfo[i][CarModel],CarInfo[i][CarX],CarInfo[i][CarY],CarInfo[i][CarZ],CarInfo[i][CarF],CarInfo[i][CarColor],CarInfo[i][CarColor2],1); // Blade ID 56
				Attach3DTextLabelToVehicle(CarInfo[i][CarText], CarInfo[i][CarID], 0.0, 0.0, 0.0);
				CarInfo[i][DealerShipCar] = 1;
			}
			SpawnedCars++;
		}
	}
	return 1;
}
stock CreatePlayerVehicle(playerid, slotid)
{
	if(IsPlayerConnected(playerid))
	{
        new string[64];
		switch(slotid)
		{
		    case 1:
		    {
		        if(PlayerInfo[playerid][PlayerVehicleModel1] != 0)
		        {
          			PlayerVehicleID1[playerid] = 0;
		    		PlayerVehicleID1[playerid] = CreateVehicle(PlayerInfo[playerid][PlayerVehicleModel1], PlayerInfo[playerid][PlayerVehiclePosX1], PlayerInfo[playerid][PlayerVehiclePosY1], PlayerInfo[playerid][PlayerVehiclePosZ1], PlayerInfo[playerid][PlayerVehicleFacing1], PlayerInfo[playerid][pPlayerVehicle1Color], PlayerInfo[playerid][pPlayerVehicle1Color2], -1);
                    VehicleInfo[PlayerVehicleID1[playerid]][VehicleDealership] = 1;
					VehicleInfo[PlayerVehicleID1[playerid]][VehicleLock] = PlayerInfo[playerid][pVehLock1];
            		VehicleInfo[PlayerVehicleID1[playerid]][VehicleLocked] = PlayerInfo[playerid][pVehLocked1];
            		SetVehicleVirtualWorld(PlayerVehicleID1[playerid], PlayerInfo[playerid][PlayerVehicle1VirWorld]);
					LinkVehicleToInterior(PlayerVehicleID1[playerid], PlayerInfo[playerid][PlayerVehicle1Interior]);
					strmid(VehicleInfo[PlayerVehicleID1[playerid]][VehicleOwner], PlayerName(playerid), 0, strlen(PlayerName(playerid)), 255);
					TruckGoods[PlayerVehicleID1[playerid]] = PlayerInfo[playerid][PlayerVehicle1Goods];
					Gas[PlayerVehicleID1[playerid]] = PlayerInfo[playerid][PlayerVehicle1Fuel];
					CarTrunk[PlayerVehicleID1[playerid]] = PlayerInfo[playerid][PlayerVehicle1Trunk];
					CarTrunk2[PlayerVehicleID1[playerid]] = PlayerInfo[playerid][PlayerVehicle1Trunk2];
					CarTrunk3[PlayerVehicleID1[playerid]] = PlayerInfo[playerid][PlayerVehicle1Trunk3];
					CarTrunk4[PlayerVehicleID1[playerid]] = PlayerInfo[playerid][PlayerVehicle1Trunk4];
					CarTrunk5[PlayerVehicleID1[playerid]] = PlayerInfo[playerid][PlayerVehicle1Trunk5];
					if(PlayerInfo[playerid][PlayerVehicle1Tire] == 1)
					{
						Tirelock[PlayerVehicleID1[playerid]] = 1;
						format(string, sizeof(string), "%s\n{F3FF02}[Tire Locked]", PlayerInfo[playerid][PlayerVehicle1Plate]);
					}
					else
					{
					    format(string, sizeof(string), "%s", PlayerInfo[playerid][PlayerVehicle1Plate]);
					}
					VehPlate[PlayerVehicleID1[playerid]] = Create3DTextLabel(string, COLOR_CAR, 0.0, 0.0, 0.0, 15.0, 0);
					Attach3DTextLabelToVehicle(VehPlate[PlayerVehicleID1[playerid]], PlayerVehicleID1[playerid], 0.0, 0.0, 1.3);
					if(IsValidObject(CarNeon[PlayerVehicleID1[playerid]]) || IsValidObject(CarNeon2[PlayerVehicleID1[playerid]]))
					{
						DestroyObject(CarNeon[PlayerVehicleID1[playerid]]);
					    DestroyObject(CarNeon2[PlayerVehicleID1[playerid]]);
					}
					if(PlayerInfo[playerid][pVehLock1] == 1)
					{
						if(PlayerInfo[playerid][pVehLocked1] == 1)
						{
							LockCar(PlayerVehicleID1[playerid]);
						}
						else
						{
						    UnLockCar(PlayerVehicleID1[playerid]);
						}
					}
					if(PlayerInfo[playerid][PlayerVehicle1PaintJob] != 255)
					{
						ChangeVehiclePaintjob(PlayerVehicleID1[playerid], PlayerInfo[playerid][PlayerVehicle1PaintJob]);
					}
					if(PlayerInfo[playerid][PlayerVehicle1ModSlot0] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID1[playerid], PlayerInfo[playerid][PlayerVehicle1ModSlot0]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle1ModSlot1] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID1[playerid], PlayerInfo[playerid][PlayerVehicle1ModSlot1]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle1ModSlot2] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID1[playerid], PlayerInfo[playerid][PlayerVehicle1ModSlot2]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle1ModSlot3] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID1[playerid], PlayerInfo[playerid][PlayerVehicle1ModSlot3]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle1ModSlot4] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID1[playerid], PlayerInfo[playerid][PlayerVehicle1ModSlot4]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle1ModSlot5] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID1[playerid], PlayerInfo[playerid][PlayerVehicle1ModSlot5]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle1ModSlot6] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID1[playerid], PlayerInfo[playerid][PlayerVehicle1ModSlot6]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle1ModSlot7] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID1[playerid], PlayerInfo[playerid][PlayerVehicle1ModSlot7]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle1ModSlot8] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID1[playerid], PlayerInfo[playerid][PlayerVehicle1ModSlot8]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle1ModSlot9] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID1[playerid], PlayerInfo[playerid][PlayerVehicle1ModSlot9]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle1ModSlot10] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID1[playerid], PlayerInfo[playerid][PlayerVehicle1ModSlot10]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle1ModSlot11] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID1[playerid], PlayerInfo[playerid][PlayerVehicle1ModSlot11]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle1ModSlot12] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID1[playerid], PlayerInfo[playerid][PlayerVehicle1ModSlot12]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle1ModSlot13] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID1[playerid], PlayerInfo[playerid][PlayerVehicle1ModSlot13]);
				    }
			        if(PlayerInfo[playerid][PlayerVehicle1Health] >= 250)
			        {
					    SetVehicleHealth(PlayerVehicleID1[playerid], PlayerInfo[playerid][PlayerVehicle1Health]);
			        }
			        if(Wrecked[PlayerVehicleID1[playerid]] == 1)
			        {
					    SetVehicleHealth(PlayerVehicleID1[playerid], 300.0);
			        }
			        if(PlayerInfo[playerid][PlayerVehicle1Upgraded] == 1)
			        {
					    Upgraded[PlayerVehicleID1[playerid]] = 1;
			        }
			        else
			        {
					    Upgraded[PlayerVehicleID1[playerid]] = 0;
			        }
				    if(PlayerInfo[playerid][PlayerVehicle1ModNeon] != 0)
				    {
						if(PlayerInfo[playerid][PlayerVehicle1ModNeon] == 1)
						{
                            CarNeon[PlayerVehicleID1[playerid]] = CreateObject(18648,0,0,0,0,0,0);
                            CarNeon2[PlayerVehicleID1[playerid]] = CreateObject(18648,0,0,0,0,0,0);
						}
						else if(PlayerInfo[playerid][PlayerVehicle1ModNeon] == 2)
						{
                            CarNeon[PlayerVehicleID1[playerid]] = CreateObject(18647,0,0,0,0,0,0);
                            CarNeon2[PlayerVehicleID1[playerid]] = CreateObject(18647,0,0,0,0,0,0);
						}
						else if(PlayerInfo[playerid][PlayerVehicle1ModNeon] == 3)
						{
                            CarNeon[PlayerVehicleID1[playerid]] = CreateObject(18649,0,0,0,0,0,0);
                            CarNeon2[PlayerVehicleID1[playerid]] = CreateObject(18649,0,0,0,0,0,0);
						}
						else if(PlayerInfo[playerid][PlayerVehicle1ModNeon] == 4)
						{
                            CarNeon[PlayerVehicleID1[playerid]] = CreateObject(18652,0,0,0,0,0,0);
                            CarNeon2[PlayerVehicleID1[playerid]] = CreateObject(18652,0,0,0,0,0,0);
						}
						else if(PlayerInfo[playerid][PlayerVehicle1ModNeon] == 5)
						{
                            CarNeon[PlayerVehicleID1[playerid]] = CreateObject(18651,0,0,0,0,0,0);
                            CarNeon2[PlayerVehicleID1[playerid]] = CreateObject(18651,0,0,0,0,0,0);
						}
						else if(PlayerInfo[playerid][PlayerVehicle1ModNeon] == 6)
						{
                            CarNeon[PlayerVehicleID1[playerid]] = CreateObject(18650,0,0,0,0,0,0);
                            CarNeon2[PlayerVehicleID1[playerid]] = CreateObject(18650,0,0,0,0,0,0);
						}
				    }
				}
		    }
		    case 2:
		    {
		        if(PlayerInfo[playerid][PlayerVehicleModel2] != 0)
		        {
          			PlayerVehicleID2[playerid] = 0;
		    		PlayerVehicleID2[playerid] = CreateVehicle(PlayerInfo[playerid][PlayerVehicleModel2], PlayerInfo[playerid][PlayerVehiclePosX2], PlayerInfo[playerid][PlayerVehiclePosY2], PlayerInfo[playerid][PlayerVehiclePosZ2], PlayerInfo[playerid][PlayerVehicleFacing2], PlayerInfo[playerid][pPlayerVehicle2Color], PlayerInfo[playerid][pPlayerVehicle2Color2], -1);
                    VehicleInfo[PlayerVehicleID2[playerid]][VehicleDealership] = 1;
                    SetVehicleVirtualWorld(PlayerVehicleID2[playerid], PlayerInfo[playerid][PlayerVehicle2VirWorld]);
					LinkVehicleToInterior(PlayerVehicleID2[playerid], PlayerInfo[playerid][PlayerVehicle2Interior]);
					VehicleInfo[PlayerVehicleID2[playerid]][VehicleLock] = PlayerInfo[playerid][pVehLock2];
            		VehicleInfo[PlayerVehicleID2[playerid]][VehicleLocked] = PlayerInfo[playerid][pVehLocked2];
					strmid(VehicleInfo[PlayerVehicleID2[playerid]][VehicleOwner], PlayerName(playerid), 0, strlen(PlayerName(playerid)), 255);
					TruckGoods[PlayerVehicleID2[playerid]] = PlayerInfo[playerid][PlayerVehicle2Goods];
					Gas[PlayerVehicleID2[playerid]] = PlayerInfo[playerid][PlayerVehicle2Fuel];
					CarTrunk[PlayerVehicleID2[playerid]] = PlayerInfo[playerid][PlayerVehicle2Trunk];
					CarTrunk2[PlayerVehicleID2[playerid]] = PlayerInfo[playerid][PlayerVehicle2Trunk2];
					CarTrunk3[PlayerVehicleID2[playerid]] = PlayerInfo[playerid][PlayerVehicle2Trunk3];
					CarTrunk4[PlayerVehicleID2[playerid]] = PlayerInfo[playerid][PlayerVehicle2Trunk4];
					CarTrunk5[PlayerVehicleID2[playerid]] = PlayerInfo[playerid][PlayerVehicle2Trunk5];
					if(PlayerInfo[playerid][PlayerVehicle2Tire] == 1)
					{
						Tirelock[PlayerVehicleID2[playerid]] = 1;
						format(string, sizeof(string), "%s\n{F3FF02}[Tire Locked]", PlayerInfo[playerid][PlayerVehicle2Plate]);
					}
					else
					{
					    format(string, sizeof(string), "%s", PlayerInfo[playerid][PlayerVehicle2Plate]);
					}
					VehPlate[PlayerVehicleID2[playerid]] = Create3DTextLabel(string, COLOR_CAR, 0.0, 0.0, 0.0, 15.0, 0);
					Attach3DTextLabelToVehicle(VehPlate[PlayerVehicleID2[playerid]], PlayerVehicleID2[playerid], 0.0, 0.0, 1.3);
					if(IsValidObject(CarNeon[PlayerVehicleID2[playerid]]) || IsValidObject(CarNeon2[PlayerVehicleID2[playerid]]))
					{
						DestroyObject(CarNeon[PlayerVehicleID2[playerid]]);
					    DestroyObject(CarNeon2[PlayerVehicleID2[playerid]]);
					}
					if(PlayerInfo[playerid][pVehLock2] == 1)
					{
						if(PlayerInfo[playerid][pVehLocked2] == 1)
						{
							LockCar(PlayerVehicleID2[playerid]);
						}
						else
						{
						    UnLockCar(PlayerVehicleID2[playerid]);
						}
					}
					if(PlayerInfo[playerid][PlayerVehicle2PaintJob] != 255)
					{
				    	ChangeVehiclePaintjob(PlayerVehicleID2[playerid], PlayerInfo[playerid][PlayerVehicle2PaintJob]);
					}
					if(PlayerInfo[playerid][PlayerVehicle2ModSlot0] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID2[playerid], PlayerInfo[playerid][PlayerVehicle2ModSlot0]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle2ModSlot1] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID2[playerid], PlayerInfo[playerid][PlayerVehicle2ModSlot1]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle2ModSlot2] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID2[playerid], PlayerInfo[playerid][PlayerVehicle2ModSlot2]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle2ModSlot3] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID2[playerid], PlayerInfo[playerid][PlayerVehicle2ModSlot3]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle2ModSlot4] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID2[playerid], PlayerInfo[playerid][PlayerVehicle2ModSlot4]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle2ModSlot5] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID2[playerid], PlayerInfo[playerid][PlayerVehicle2ModSlot5]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle2ModSlot6] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID2[playerid], PlayerInfo[playerid][PlayerVehicle2ModSlot6]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle2ModSlot7] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID2[playerid], PlayerInfo[playerid][PlayerVehicle2ModSlot7]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle2ModSlot8] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID2[playerid], PlayerInfo[playerid][PlayerVehicle2ModSlot8]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle2ModSlot9] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID2[playerid], PlayerInfo[playerid][PlayerVehicle2ModSlot9]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle2ModSlot10] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID2[playerid], PlayerInfo[playerid][PlayerVehicle2ModSlot10]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle2ModSlot11] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID2[playerid], PlayerInfo[playerid][PlayerVehicle2ModSlot11]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle2ModSlot12] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID2[playerid], PlayerInfo[playerid][PlayerVehicle2ModSlot12]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle2ModSlot13] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID2[playerid], PlayerInfo[playerid][PlayerVehicle2ModSlot13]);
				    }
				    if(PlayerInfo[playerid][PlayerVehicle2Health] >= 250)
			        {
					    SetVehicleHealth(PlayerVehicleID2[playerid], PlayerInfo[playerid][PlayerVehicle2Health]);
			        }
			        if(Wrecked[PlayerVehicleID2[playerid]] == 1)
			        {
					    SetVehicleHealth(PlayerVehicleID2[playerid], 300.0);
			        }
			        if(PlayerInfo[playerid][PlayerVehicle2Upgraded] == 1)
			        {
					    Upgraded[PlayerVehicleID2[playerid]] = 1;
			        }
			        else
			        {
					    Upgraded[PlayerVehicleID2[playerid]] = 0;
			        }
				    if(PlayerInfo[playerid][PlayerVehicle2ModNeon] != 0)
				    {
						if(PlayerInfo[playerid][PlayerVehicle2ModNeon] == 1)
						{
                            CarNeon[PlayerVehicleID2[playerid]] = CreateObject(18648,0,0,0,0,0,0);
                            CarNeon2[PlayerVehicleID2[playerid]] = CreateObject(18648,0,0,0,0,0,0);
						}
						else if(PlayerInfo[playerid][PlayerVehicle2ModNeon] == 2)
						{
                            CarNeon[PlayerVehicleID2[playerid]] = CreateObject(18647,0,0,0,0,0,0);
                            CarNeon2[PlayerVehicleID2[playerid]] = CreateObject(18647,0,0,0,0,0,0);
						}
						else if(PlayerInfo[playerid][PlayerVehicle2ModNeon] == 3)
						{
                            CarNeon[PlayerVehicleID2[playerid]] = CreateObject(18649,0,0,0,0,0,0);
                            CarNeon2[PlayerVehicleID2[playerid]] = CreateObject(18649,0,0,0,0,0,0);
						}
						else if(PlayerInfo[playerid][PlayerVehicle2ModNeon] == 4)
						{
                            CarNeon[PlayerVehicleID2[playerid]] = CreateObject(18652,0,0,0,0,0,0);
                            CarNeon2[PlayerVehicleID2[playerid]] = CreateObject(18652,0,0,0,0,0,0);
						}
						else if(PlayerInfo[playerid][PlayerVehicle2ModNeon] == 5)
						{
                            CarNeon[PlayerVehicleID2[playerid]] = CreateObject(18651,0,0,0,0,0,0);
                            CarNeon2[PlayerVehicleID2[playerid]] = CreateObject(18651,0,0,0,0,0,0);
						}
						else if(PlayerInfo[playerid][PlayerVehicle2ModNeon] == 6)
						{
                            CarNeon[PlayerVehicleID2[playerid]] = CreateObject(18650,0,0,0,0,0,0);
                            CarNeon2[PlayerVehicleID2[playerid]] = CreateObject(18650,0,0,0,0,0,0);
						}
				    }
				}
		    }
		    case 3:
		    {
		        if(PlayerInfo[playerid][PlayerVehicleModel3] != 0)
		        {
          			PlayerVehicleID3[playerid] = 0;
		    		PlayerVehicleID3[playerid] = CreateVehicle(PlayerInfo[playerid][PlayerVehicleModel3], PlayerInfo[playerid][PlayerVehiclePosX3], PlayerInfo[playerid][PlayerVehiclePosY3], PlayerInfo[playerid][PlayerVehiclePosZ3], PlayerInfo[playerid][PlayerVehicleFacing3], PlayerInfo[playerid][pPlayerVehicle3Color], PlayerInfo[playerid][pPlayerVehicle3Color2], -1);
                    VehicleInfo[PlayerVehicleID3[playerid]][VehicleDealership] = 1;
                    SetVehicleVirtualWorld(PlayerVehicleID3[playerid], PlayerInfo[playerid][PlayerVehicle3VirWorld]);
					LinkVehicleToInterior(PlayerVehicleID3[playerid], PlayerInfo[playerid][PlayerVehicle3Interior]);
					VehicleInfo[PlayerVehicleID3[playerid]][VehicleLock] = PlayerInfo[playerid][pVehLock3];
            		VehicleInfo[PlayerVehicleID3[playerid]][VehicleLocked] = PlayerInfo[playerid][pVehLocked3];
					strmid(VehicleInfo[PlayerVehicleID3[playerid]][VehicleOwner], PlayerName(playerid), 0, strlen(PlayerName(playerid)), 255);
					TruckGoods[PlayerVehicleID3[playerid]] = PlayerInfo[playerid][PlayerVehicle3Goods];
					Gas[PlayerVehicleID3[playerid]] = PlayerInfo[playerid][PlayerVehicle3Fuel];
					CarTrunk[PlayerVehicleID3[playerid]] = PlayerInfo[playerid][PlayerVehicle3Trunk];
					CarTrunk2[PlayerVehicleID3[playerid]] = PlayerInfo[playerid][PlayerVehicle3Trunk2];
					CarTrunk3[PlayerVehicleID3[playerid]] = PlayerInfo[playerid][PlayerVehicle3Trunk3];
					CarTrunk4[PlayerVehicleID3[playerid]] = PlayerInfo[playerid][PlayerVehicle3Trunk4];
					CarTrunk5[PlayerVehicleID3[playerid]] = PlayerInfo[playerid][PlayerVehicle3Trunk5];
					if(PlayerInfo[playerid][PlayerVehicle3Tire] == 1)
					{
						Tirelock[PlayerVehicleID3[playerid]] = 1;
						format(string, sizeof(string), "%s\n{F3FF02}[Tire Locked]", PlayerInfo[playerid][PlayerVehicle3Plate]);
					}
					else
					{
					    format(string, sizeof(string), "%s", PlayerInfo[playerid][PlayerVehicle3Plate]);
					}
					VehPlate[PlayerVehicleID3[playerid]] = Create3DTextLabel(string, COLOR_CAR, 0.0, 0.0, 0.0, 15.0, 0);
					Attach3DTextLabelToVehicle(VehPlate[PlayerVehicleID3[playerid]], PlayerVehicleID3[playerid], 0.0, 0.0, 1.3);
					if(IsValidObject(CarNeon[PlayerVehicleID3[playerid]]) || IsValidObject(CarNeon2[PlayerVehicleID3[playerid]]))
					{
						DestroyObject(CarNeon[PlayerVehicleID3[playerid]]);
					    DestroyObject(CarNeon2[PlayerVehicleID3[playerid]]);
					}
					if(PlayerInfo[playerid][pVehLock3] == 1)
					{
						if(PlayerInfo[playerid][pVehLocked3] == 1)
						{
							LockCar(PlayerVehicleID3[playerid]);
						}
						else
						{
						    UnLockCar(PlayerVehicleID3[playerid]);
						}
					}
					if(PlayerInfo[playerid][PlayerVehicle3PaintJob] != 255)
					{
   	 					ChangeVehiclePaintjob(PlayerVehicleID3[playerid], PlayerInfo[playerid][PlayerVehicle3PaintJob]);
					}
					if(PlayerInfo[playerid][PlayerVehicle3ModSlot0] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID3[playerid], PlayerInfo[playerid][PlayerVehicle3ModSlot0]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle3ModSlot1] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID3[playerid], PlayerInfo[playerid][PlayerVehicle3ModSlot1]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle3ModSlot2] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID3[playerid], PlayerInfo[playerid][PlayerVehicle3ModSlot2]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle3ModSlot3] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID3[playerid], PlayerInfo[playerid][PlayerVehicle3ModSlot3]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle3ModSlot4] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID3[playerid], PlayerInfo[playerid][PlayerVehicle3ModSlot4]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle3ModSlot5] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID3[playerid], PlayerInfo[playerid][PlayerVehicle3ModSlot5]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle3ModSlot6] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID3[playerid], PlayerInfo[playerid][PlayerVehicle3ModSlot6]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle3ModSlot7] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID3[playerid], PlayerInfo[playerid][PlayerVehicle3ModSlot7]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle3ModSlot8] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID3[playerid], PlayerInfo[playerid][PlayerVehicle3ModSlot8]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle3ModSlot9] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID3[playerid], PlayerInfo[playerid][PlayerVehicle3ModSlot9]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle3ModSlot10] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID3[playerid], PlayerInfo[playerid][PlayerVehicle3ModSlot10]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle3ModSlot11] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID3[playerid], PlayerInfo[playerid][PlayerVehicle3ModSlot11]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle3ModSlot12] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID3[playerid], PlayerInfo[playerid][PlayerVehicle3ModSlot12]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle3ModSlot13] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID3[playerid], PlayerInfo[playerid][PlayerVehicle3ModSlot13]);
				    }
				    if(PlayerInfo[playerid][PlayerVehicle3Health] >= 250)
			        {
					    SetVehicleHealth(PlayerVehicleID3[playerid], PlayerInfo[playerid][PlayerVehicle3Health]);
			        }
			        if(Wrecked[PlayerVehicleID3[playerid]] == 1)
			        {
					    SetVehicleHealth(PlayerVehicleID3[playerid], 300.0);
			        }
			        if(PlayerInfo[playerid][PlayerVehicle3Upgraded] == 1)
			        {
					    Upgraded[PlayerVehicleID3[playerid]] = 1;
			        }
			        else
			        {
					    Upgraded[PlayerVehicleID3[playerid]] = 0;
			        }
				    if(PlayerInfo[playerid][PlayerVehicle3ModNeon] != 0)
				    {
						if(PlayerInfo[playerid][PlayerVehicle3ModNeon] == 1)
						{
                            CarNeon[PlayerVehicleID3[playerid]] = CreateObject(18648,0,0,0,0,0,0);
                            CarNeon2[PlayerVehicleID3[playerid]] = CreateObject(18648,0,0,0,0,0,0);
						}
						else if(PlayerInfo[playerid][PlayerVehicle3ModNeon] == 2)
						{
                            CarNeon[PlayerVehicleID3[playerid]] = CreateObject(18647,0,0,0,0,0,0);
                            CarNeon2[PlayerVehicleID3[playerid]] = CreateObject(18647,0,0,0,0,0,0);
						}
						else if(PlayerInfo[playerid][PlayerVehicle3ModNeon] == 3)
						{
                            CarNeon[PlayerVehicleID3[playerid]] = CreateObject(18649,0,0,0,0,0,0);
                            CarNeon2[PlayerVehicleID3[playerid]] = CreateObject(18649,0,0,0,0,0,0);
						}
						else if(PlayerInfo[playerid][PlayerVehicle3ModNeon] == 4)
						{
                            CarNeon[PlayerVehicleID3[playerid]] = CreateObject(18652,0,0,0,0,0,0);
                            CarNeon2[PlayerVehicleID3[playerid]] = CreateObject(18652,0,0,0,0,0,0);
						}
						else if(PlayerInfo[playerid][PlayerVehicle3ModNeon] == 5)
						{
                            CarNeon[PlayerVehicleID3[playerid]] = CreateObject(18651,0,0,0,0,0,0);
                            CarNeon2[PlayerVehicleID3[playerid]] = CreateObject(18651,0,0,0,0,0,0);
						}
						else if(PlayerInfo[playerid][PlayerVehicle3ModNeon] == 6)
						{
                            CarNeon[PlayerVehicleID3[playerid]] = CreateObject(18650,0,0,0,0,0,0);
                            CarNeon2[PlayerVehicleID3[playerid]] = CreateObject(18650,0,0,0,0,0,0);
						}
				    }
				}
		    }
		    case 4:
		    {
		        if(PlayerInfo[playerid][PlayerVehicleModel4] != 0)
		        {
          			PlayerVehicleID4[playerid] = 0;
		    		PlayerVehicleID4[playerid] = CreateVehicle(PlayerInfo[playerid][PlayerVehicleModel4], PlayerInfo[playerid][PlayerVehiclePosX4], PlayerInfo[playerid][PlayerVehiclePosY4], PlayerInfo[playerid][PlayerVehiclePosZ4], PlayerInfo[playerid][PlayerVehicleFacing4], PlayerInfo[playerid][pPlayerVehicle4Color], PlayerInfo[playerid][pPlayerVehicle4Color2], -1);
                    VehicleInfo[PlayerVehicleID4[playerid]][VehicleDealership] = 1;
					VehicleInfo[PlayerVehicleID4[playerid]][VehicleLock] = PlayerInfo[playerid][pVehLock4];
            		VehicleInfo[PlayerVehicleID4[playerid]][VehicleLocked] = PlayerInfo[playerid][pVehLocked4];
            		SetVehicleVirtualWorld(PlayerVehicleID4[playerid], PlayerInfo[playerid][PlayerVehicle4VirWorld]);
					LinkVehicleToInterior(PlayerVehicleID4[playerid], PlayerInfo[playerid][PlayerVehicle4Interior]);
					strmid(VehicleInfo[PlayerVehicleID4[playerid]][VehicleOwner], PlayerName(playerid), 0, strlen(PlayerName(playerid)), 255);
					TruckGoods[PlayerVehicleID4[playerid]] = PlayerInfo[playerid][PlayerVehicle4Goods];
					Gas[PlayerVehicleID4[playerid]] = PlayerInfo[playerid][PlayerVehicle4Fuel];
					CarTrunk[PlayerVehicleID4[playerid]] = PlayerInfo[playerid][PlayerVehicle4Trunk];
					CarTrunk2[PlayerVehicleID4[playerid]] = PlayerInfo[playerid][PlayerVehicle4Trunk2];
					CarTrunk3[PlayerVehicleID4[playerid]] = PlayerInfo[playerid][PlayerVehicle4Trunk3];
					CarTrunk4[PlayerVehicleID4[playerid]] = PlayerInfo[playerid][PlayerVehicle4Trunk4];
					CarTrunk5[PlayerVehicleID4[playerid]] = PlayerInfo[playerid][PlayerVehicle4Trunk5];
					if(PlayerInfo[playerid][PlayerVehicle4Tire] == 1)
					{
						Tirelock[PlayerVehicleID4[playerid]] = 1;
						format(string, sizeof(string), "%s\n{F3FF02}[Tire Locked]", PlayerInfo[playerid][PlayerVehicle4Plate]);
					}
					else
					{
					    format(string, sizeof(string), "%s", PlayerInfo[playerid][PlayerVehicle4Plate]);
					}
					VehPlate[PlayerVehicleID4[playerid]] = Create3DTextLabel(string, COLOR_CAR, 0.0, 0.0, 0.0, 15.0, 0);
					Attach3DTextLabelToVehicle(VehPlate[PlayerVehicleID4[playerid]], PlayerVehicleID4[playerid], 0.0, 0.0, 1.3);
					if(IsValidObject(CarNeon[PlayerVehicleID4[playerid]]) || IsValidObject(CarNeon2[PlayerVehicleID4[playerid]]))
					{
						DestroyObject(CarNeon[PlayerVehicleID4[playerid]]);
					    DestroyObject(CarNeon2[PlayerVehicleID4[playerid]]);
					}
					if(PlayerInfo[playerid][pVehLock4] == 1)
					{
						if(PlayerInfo[playerid][pVehLocked4] == 1)
						{
							LockCar(PlayerVehicleID4[playerid]);
						}
						else
						{
						    UnLockCar(PlayerVehicleID4[playerid]);
						}
					}
					if(PlayerInfo[playerid][PlayerVehicle4PaintJob] != 255)
					{
						ChangeVehiclePaintjob(PlayerVehicleID4[playerid], PlayerInfo[playerid][PlayerVehicle4PaintJob]);
					}
					if(PlayerInfo[playerid][PlayerVehicle4ModSlot0] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID4[playerid], PlayerInfo[playerid][PlayerVehicle4ModSlot0]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle4ModSlot1] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID4[playerid], PlayerInfo[playerid][PlayerVehicle4ModSlot1]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle4ModSlot2] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID4[playerid], PlayerInfo[playerid][PlayerVehicle4ModSlot2]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle4ModSlot3] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID4[playerid], PlayerInfo[playerid][PlayerVehicle4ModSlot3]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle4ModSlot4] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID4[playerid], PlayerInfo[playerid][PlayerVehicle4ModSlot4]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle4ModSlot5] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID4[playerid], PlayerInfo[playerid][PlayerVehicle4ModSlot5]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle4ModSlot6] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID4[playerid], PlayerInfo[playerid][PlayerVehicle4ModSlot6]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle4ModSlot7] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID4[playerid], PlayerInfo[playerid][PlayerVehicle4ModSlot7]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle4ModSlot8] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID4[playerid], PlayerInfo[playerid][PlayerVehicle4ModSlot8]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle4ModSlot9] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID4[playerid], PlayerInfo[playerid][PlayerVehicle4ModSlot9]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle4ModSlot10] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID4[playerid], PlayerInfo[playerid][PlayerVehicle4ModSlot10]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle4ModSlot11] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID4[playerid], PlayerInfo[playerid][PlayerVehicle4ModSlot11]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle4ModSlot12] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID4[playerid], PlayerInfo[playerid][PlayerVehicle4ModSlot12]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle4ModSlot13] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID4[playerid], PlayerInfo[playerid][PlayerVehicle4ModSlot13]);
				    }
				    if(PlayerInfo[playerid][PlayerVehicle4Health] >= 250)
			        {
					    SetVehicleHealth(PlayerVehicleID4[playerid], PlayerInfo[playerid][PlayerVehicle4Health]);
			        }
			        if(Wrecked[PlayerVehicleID4[playerid]] == 1)
			        {
					    SetVehicleHealth(PlayerVehicleID4[playerid], 300.0);
			        }
			        if(PlayerInfo[playerid][PlayerVehicle4Upgraded] == 1)
			        {
					    Upgraded[PlayerVehicleID4[playerid]] = 1;
			        }
			        else
			        {
					    Upgraded[PlayerVehicleID4[playerid]] = 0;
			        }
				    if(PlayerInfo[playerid][PlayerVehicle4ModNeon] != 0)
				    {
						if(PlayerInfo[playerid][PlayerVehicle4ModNeon] == 1)
						{
                            CarNeon[PlayerVehicleID4[playerid]] = CreateObject(18648,0,0,0,0,0,0);
                            CarNeon2[PlayerVehicleID4[playerid]] = CreateObject(18648,0,0,0,0,0,0);
						}
						else if(PlayerInfo[playerid][PlayerVehicle4ModNeon] == 2)
						{
                            CarNeon[PlayerVehicleID4[playerid]] = CreateObject(18647,0,0,0,0,0,0);
                            CarNeon2[PlayerVehicleID4[playerid]] = CreateObject(18647,0,0,0,0,0,0);
						}
						else if(PlayerInfo[playerid][PlayerVehicle4ModNeon] == 3)
						{
                            CarNeon[PlayerVehicleID4[playerid]] = CreateObject(18649,0,0,0,0,0,0);
                            CarNeon2[PlayerVehicleID4[playerid]] = CreateObject(18649,0,0,0,0,0,0);
						}
						else if(PlayerInfo[playerid][PlayerVehicle4ModNeon] == 4)
						{
                            CarNeon[PlayerVehicleID4[playerid]] = CreateObject(18652,0,0,0,0,0,0);
                            CarNeon2[PlayerVehicleID4[playerid]] = CreateObject(18652,0,0,0,0,0,0);
						}
						else if(PlayerInfo[playerid][PlayerVehicle4ModNeon] == 5)
						{
                            CarNeon[PlayerVehicleID4[playerid]] = CreateObject(18651,0,0,0,0,0,0);
                            CarNeon2[PlayerVehicleID4[playerid]] = CreateObject(18651,0,0,0,0,0,0);
						}
						else if(PlayerInfo[playerid][PlayerVehicle4ModNeon] == 6)
						{
                            CarNeon[PlayerVehicleID4[playerid]] = CreateObject(18650,0,0,0,0,0,0);
                            CarNeon2[PlayerVehicleID4[playerid]] = CreateObject(18650,0,0,0,0,0,0);
						}
				    }
				}
		    }
		    case 5:
		    {
		        if(PlayerInfo[playerid][PlayerVehicleModel5] != 0)
		        {
          			PlayerVehicleID5[playerid] = 0;
		    		PlayerVehicleID5[playerid] = CreateVehicle(PlayerInfo[playerid][PlayerVehicleModel5], PlayerInfo[playerid][PlayerVehiclePosX5], PlayerInfo[playerid][PlayerVehiclePosY5], PlayerInfo[playerid][PlayerVehiclePosZ5], PlayerInfo[playerid][PlayerVehicleFacing5], PlayerInfo[playerid][pPlayerVehicle5Color], PlayerInfo[playerid][pPlayerVehicle5Color2], -1);
                    VehicleInfo[PlayerVehicleID5[playerid]][VehicleDealership] = 1;
                    SetVehicleVirtualWorld(PlayerVehicleID5[playerid], PlayerInfo[playerid][PlayerVehicle5VirWorld]);
					LinkVehicleToInterior(PlayerVehicleID5[playerid], PlayerInfo[playerid][PlayerVehicle5Interior]);
					VehicleInfo[PlayerVehicleID5[playerid]][VehicleLock] = PlayerInfo[playerid][pVehLock5];
            		VehicleInfo[PlayerVehicleID5[playerid]][VehicleLocked] = PlayerInfo[playerid][pVehLocked5];
					strmid(VehicleInfo[PlayerVehicleID5[playerid]][VehicleOwner], PlayerName(playerid), 0, strlen(PlayerName(playerid)), 255);
					TruckGoods[PlayerVehicleID5[playerid]] = PlayerInfo[playerid][PlayerVehicle5Goods];
					Gas[PlayerVehicleID5[playerid]] = PlayerInfo[playerid][PlayerVehicle5Fuel];
					CarTrunk[PlayerVehicleID5[playerid]] = PlayerInfo[playerid][PlayerVehicle5Trunk];
					CarTrunk2[PlayerVehicleID5[playerid]] = PlayerInfo[playerid][PlayerVehicle5Trunk2];
					CarTrunk3[PlayerVehicleID5[playerid]] = PlayerInfo[playerid][PlayerVehicle5Trunk3];
					CarTrunk4[PlayerVehicleID5[playerid]] = PlayerInfo[playerid][PlayerVehicle5Trunk4];
					CarTrunk5[PlayerVehicleID5[playerid]] = PlayerInfo[playerid][PlayerVehicle5Trunk5];
					if(PlayerInfo[playerid][PlayerVehicle5Tire] == 1)
					{
						Tirelock[PlayerVehicleID5[playerid]] = 1;
						format(string, sizeof(string), "%s\n{F3FF02}[Tire Locked]", PlayerInfo[playerid][PlayerVehicle5Plate]);
					}
					else
					{
					    format(string, sizeof(string), "%s", PlayerInfo[playerid][PlayerVehicle5Plate]);
					}
					VehPlate[PlayerVehicleID5[playerid]] = Create3DTextLabel(string, COLOR_CAR, 0.0, 0.0, 0.0, 15.0, 0);
					Attach3DTextLabelToVehicle(VehPlate[PlayerVehicleID5[playerid]], PlayerVehicleID5[playerid], 0.0, 0.0, 1.3);
					if(IsValidObject(CarNeon[PlayerVehicleID5[playerid]]) || IsValidObject(CarNeon2[PlayerVehicleID5[playerid]]))
					{
						DestroyObject(CarNeon[PlayerVehicleID5[playerid]]);
					    DestroyObject(CarNeon2[PlayerVehicleID5[playerid]]);
					}
					if(PlayerInfo[playerid][pVehLock5] == 1)
					{
						if(PlayerInfo[playerid][pVehLocked5] == 1)
						{
							LockCar(PlayerVehicleID5[playerid]);
						}
						else
						{
							UnLockCar(PlayerVehicleID5[playerid]);
						}
					}
					if(PlayerInfo[playerid][PlayerVehicle5PaintJob] != 255)
					{
						ChangeVehiclePaintjob(PlayerVehicleID5[playerid], PlayerInfo[playerid][PlayerVehicle5PaintJob]);
					}
					if(PlayerInfo[playerid][PlayerVehicle5ModSlot0] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID5[playerid], PlayerInfo[playerid][PlayerVehicle5ModSlot0]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle5ModSlot1] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID5[playerid], PlayerInfo[playerid][PlayerVehicle5ModSlot1]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle5ModSlot2] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID5[playerid], PlayerInfo[playerid][PlayerVehicle5ModSlot2]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle5ModSlot3] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID5[playerid], PlayerInfo[playerid][PlayerVehicle5ModSlot3]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle5ModSlot4] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID5[playerid], PlayerInfo[playerid][PlayerVehicle5ModSlot4]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle5ModSlot5] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID5[playerid], PlayerInfo[playerid][PlayerVehicle5ModSlot5]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle5ModSlot6] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID5[playerid], PlayerInfo[playerid][PlayerVehicle5ModSlot6]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle5ModSlot7] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID5[playerid], PlayerInfo[playerid][PlayerVehicle5ModSlot7]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle5ModSlot8] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID5[playerid], PlayerInfo[playerid][PlayerVehicle5ModSlot8]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle5ModSlot9] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID5[playerid], PlayerInfo[playerid][PlayerVehicle5ModSlot9]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle5ModSlot10] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID5[playerid], PlayerInfo[playerid][PlayerVehicle5ModSlot10]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle5ModSlot11] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID5[playerid], PlayerInfo[playerid][PlayerVehicle5ModSlot11]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle5ModSlot12] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID5[playerid], PlayerInfo[playerid][PlayerVehicle5ModSlot12]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle5ModSlot13] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID5[playerid], PlayerInfo[playerid][PlayerVehicle5ModSlot13]);
				    }
				    if(PlayerInfo[playerid][PlayerVehicle5Health] >= 250)
			        {
					    SetVehicleHealth(PlayerVehicleID5[playerid], PlayerInfo[playerid][PlayerVehicle5Health]);
			        }
			        if(Wrecked[PlayerVehicleID5[playerid]] == 1)
			        {
					    SetVehicleHealth(PlayerVehicleID5[playerid], 300.0);
			        }
			        if(PlayerInfo[playerid][PlayerVehicle5Upgraded] == 1)
			        {
					    Upgraded[PlayerVehicleID5[playerid]] = 1;
			        }
			        else
			        {
					    Upgraded[PlayerVehicleID5[playerid]] = 0;
			        }
				    if(PlayerInfo[playerid][PlayerVehicle5ModNeon] != 0)
				    {
						if(PlayerInfo[playerid][PlayerVehicle5ModNeon] == 1)
						{
                            CarNeon[PlayerVehicleID5[playerid]] = CreateObject(18648,0,0,0,0,0,0);
                            CarNeon2[PlayerVehicleID5[playerid]] = CreateObject(18648,0,0,0,0,0,0);
						}
						else if(PlayerInfo[playerid][PlayerVehicle5ModNeon] == 2)
						{
                            CarNeon[PlayerVehicleID5[playerid]] = CreateObject(18647,0,0,0,0,0,0);
                            CarNeon2[PlayerVehicleID5[playerid]] = CreateObject(18647,0,0,0,0,0,0);
						}
						else if(PlayerInfo[playerid][PlayerVehicle5ModNeon] == 3)
						{
                            CarNeon[PlayerVehicleID5[playerid]] = CreateObject(18649,0,0,0,0,0,0);
                            CarNeon2[PlayerVehicleID5[playerid]] = CreateObject(18649,0,0,0,0,0,0);
						}
						else if(PlayerInfo[playerid][PlayerVehicle5ModNeon] == 4)
						{
                            CarNeon[PlayerVehicleID5[playerid]] = CreateObject(18652,0,0,0,0,0,0);
                            CarNeon2[PlayerVehicleID5[playerid]] = CreateObject(18652,0,0,0,0,0,0);
						}
						else if(PlayerInfo[playerid][PlayerVehicle5ModNeon] == 5)
						{
                            CarNeon[PlayerVehicleID5[playerid]] = CreateObject(18651,0,0,0,0,0,0);
                            CarNeon2[PlayerVehicleID5[playerid]] = CreateObject(18651,0,0,0,0,0,0);
						}
						else if(PlayerInfo[playerid][PlayerVehicle5ModNeon] == 6)
						{
                            CarNeon[PlayerVehicleID5[playerid]] = CreateObject(18650,0,0,0,0,0,0);
                            CarNeon2[PlayerVehicleID5[playerid]] = CreateObject(18650,0,0,0,0,0,0);
						}
				    }
				}
		    }
		}
	}
}
stock CreatePlayerVehicleEx(playerid, slotid)
{
	if(IsPlayerConnected(playerid))
	{
		switch(slotid)
		{
		    case 1:
		    {
		        if(PlayerInfo[playerid][PlayerVehicleModel1] != 0)
		        {
                    VehicleInfo[PlayerVehicleID1[playerid]][VehicleDealership] = 1;
                    PlayerInfo[playerid][PlayerVehicle1Interior] = GetPlayerInterior(playerid);
                    PlayerInfo[playerid][PlayerVehicle1VirWorld] = GetPlayerVirtualWorld(playerid);
					VehicleInfo[PlayerVehicleID1[playerid]][VehicleLock] = PlayerInfo[playerid][pVehLock1];
            		VehicleInfo[PlayerVehicleID1[playerid]][VehicleLocked] = PlayerInfo[playerid][pVehLocked1];
            		SetVehicleVirtualWorld(PlayerVehicleID1[playerid], PlayerInfo[playerid][PlayerVehicle1VirWorld]);
					LinkVehicleToInterior(PlayerVehicleID1[playerid], PlayerInfo[playerid][PlayerVehicle1Interior]);
					ChangeVehicleColor(PlayerVehicleID1[playerid], PlayerInfo[playerid][pPlayerVehicle1Color],PlayerInfo[playerid][pPlayerVehicle1Color2]);
					strmid(VehicleInfo[PlayerVehicleID1[playerid]][VehicleOwner], PlayerName(playerid), 0, strlen(PlayerName(playerid)), 255);
					if(PlayerInfo[playerid][pVehLock1] == 1)
					{
						if(PlayerInfo[playerid][pVehLocked1] == 1)
						{
							LockCar(PlayerVehicleID1[playerid]);
						}
						else
						{
						    UnLockCar(PlayerVehicleID1[playerid]);
						}
					}
					if(PlayerInfo[playerid][PlayerVehicle1PaintJob] != 255)
					{
						ChangeVehiclePaintjob(PlayerVehicleID1[playerid], PlayerInfo[playerid][PlayerVehicle1PaintJob]);
					}
					if(PlayerInfo[playerid][PlayerVehicle1ModSlot0] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID1[playerid], PlayerInfo[playerid][PlayerVehicle1ModSlot0]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle1ModSlot1] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID1[playerid], PlayerInfo[playerid][PlayerVehicle1ModSlot1]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle1ModSlot2] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID1[playerid], PlayerInfo[playerid][PlayerVehicle1ModSlot2]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle1ModSlot3] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID1[playerid], PlayerInfo[playerid][PlayerVehicle1ModSlot3]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle1ModSlot4] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID1[playerid], PlayerInfo[playerid][PlayerVehicle1ModSlot4]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle1ModSlot5] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID1[playerid], PlayerInfo[playerid][PlayerVehicle1ModSlot5]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle1ModSlot6] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID1[playerid], PlayerInfo[playerid][PlayerVehicle1ModSlot6]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle1ModSlot7] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID1[playerid], PlayerInfo[playerid][PlayerVehicle1ModSlot7]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle1ModSlot8] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID1[playerid], PlayerInfo[playerid][PlayerVehicle1ModSlot8]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle1ModSlot9] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID1[playerid], PlayerInfo[playerid][PlayerVehicle1ModSlot9]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle1ModSlot10] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID1[playerid], PlayerInfo[playerid][PlayerVehicle1ModSlot10]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle1ModSlot11] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID1[playerid], PlayerInfo[playerid][PlayerVehicle1ModSlot11]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle1ModSlot12] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID1[playerid], PlayerInfo[playerid][PlayerVehicle1ModSlot12]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle1ModSlot13] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID1[playerid], PlayerInfo[playerid][PlayerVehicle1ModSlot13]);
				    }
				    if(PlayerInfo[playerid][PlayerVehicle1Health] >= 250)
			        {
					    SetVehicleHealth(PlayerVehicleID1[playerid], PlayerInfo[playerid][PlayerVehicle1Health]);
			        }
				}
		    }
		    case 2:
		    {
		        if(PlayerInfo[playerid][PlayerVehicleModel2] != 0)
		        {
                    VehicleInfo[PlayerVehicleID2[playerid]][VehicleDealership] = 1;
                    PlayerInfo[playerid][PlayerVehicle2Interior] = GetPlayerInterior(playerid);
                    PlayerInfo[playerid][PlayerVehicle2VirWorld] = GetPlayerVirtualWorld(playerid);
					VehicleInfo[PlayerVehicleID2[playerid]][VehicleLock] = PlayerInfo[playerid][pVehLock2];
            		VehicleInfo[PlayerVehicleID2[playerid]][VehicleLocked] = PlayerInfo[playerid][pVehLocked2];
            		SetVehicleVirtualWorld(PlayerVehicleID2[playerid], PlayerInfo[playerid][PlayerVehicle2VirWorld]);
					LinkVehicleToInterior(PlayerVehicleID2[playerid], PlayerInfo[playerid][PlayerVehicle2Interior]);
					strmid(VehicleInfo[PlayerVehicleID2[playerid]][VehicleOwner], PlayerName(playerid), 0, strlen(PlayerName(playerid)), 255);
					ChangeVehicleColor(PlayerVehicleID2[playerid], PlayerInfo[playerid][pPlayerVehicle2Color],PlayerInfo[playerid][pPlayerVehicle2Color2]);
					if(PlayerInfo[playerid][pVehLock2] == 1)
					{
						if(PlayerInfo[playerid][pVehLocked2] == 1)
						{
							LockCar(PlayerVehicleID2[playerid]);
						}
						else
						{
						    UnLockCar(PlayerVehicleID2[playerid]);
						}
					}
					if(PlayerInfo[playerid][PlayerVehicle2PaintJob] != 255)
					{
				    	ChangeVehiclePaintjob(PlayerVehicleID2[playerid], PlayerInfo[playerid][PlayerVehicle2PaintJob]);
					}
					if(PlayerInfo[playerid][PlayerVehicle2ModSlot0] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID2[playerid], PlayerInfo[playerid][PlayerVehicle2ModSlot0]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle2ModSlot1] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID2[playerid], PlayerInfo[playerid][PlayerVehicle2ModSlot1]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle2ModSlot2] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID2[playerid], PlayerInfo[playerid][PlayerVehicle2ModSlot2]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle2ModSlot3] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID2[playerid], PlayerInfo[playerid][PlayerVehicle2ModSlot3]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle2ModSlot4] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID2[playerid], PlayerInfo[playerid][PlayerVehicle2ModSlot4]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle2ModSlot5] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID2[playerid], PlayerInfo[playerid][PlayerVehicle2ModSlot5]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle2ModSlot6] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID2[playerid], PlayerInfo[playerid][PlayerVehicle2ModSlot6]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle2ModSlot7] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID2[playerid], PlayerInfo[playerid][PlayerVehicle2ModSlot7]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle2ModSlot8] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID2[playerid], PlayerInfo[playerid][PlayerVehicle2ModSlot8]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle2ModSlot9] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID2[playerid], PlayerInfo[playerid][PlayerVehicle2ModSlot9]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle2ModSlot10] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID2[playerid], PlayerInfo[playerid][PlayerVehicle2ModSlot10]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle2ModSlot11] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID2[playerid], PlayerInfo[playerid][PlayerVehicle2ModSlot11]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle2ModSlot12] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID2[playerid], PlayerInfo[playerid][PlayerVehicle2ModSlot12]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle2ModSlot13] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID2[playerid], PlayerInfo[playerid][PlayerVehicle2ModSlot13]);
				    }
				    if(PlayerInfo[playerid][PlayerVehicle2Health] >= 250)
			        {
					    SetVehicleHealth(PlayerVehicleID2[playerid], PlayerInfo[playerid][PlayerVehicle2Health]);
			        }
				}
		    }
		    case 3:
		    {
		        if(PlayerInfo[playerid][PlayerVehicleModel3] != 0)
		        {
                    VehicleInfo[PlayerVehicleID3[playerid]][VehicleDealership] = 1;
                    PlayerInfo[playerid][PlayerVehicle3Interior] = GetPlayerInterior(playerid);
                    PlayerInfo[playerid][PlayerVehicle3VirWorld] = GetPlayerVirtualWorld(playerid);
					VehicleInfo[PlayerVehicleID3[playerid]][VehicleLock] = PlayerInfo[playerid][pVehLock3];
            		VehicleInfo[PlayerVehicleID3[playerid]][VehicleLocked] = PlayerInfo[playerid][pVehLocked3];
            		SetVehicleVirtualWorld(PlayerVehicleID3[playerid], PlayerInfo[playerid][PlayerVehicle3VirWorld]);
					LinkVehicleToInterior(PlayerVehicleID3[playerid], PlayerInfo[playerid][PlayerVehicle3Interior]);
					strmid(VehicleInfo[PlayerVehicleID3[playerid]][VehicleOwner], PlayerName(playerid), 0, strlen(PlayerName(playerid)), 255);
					ChangeVehicleColor(PlayerVehicleID3[playerid], PlayerInfo[playerid][pPlayerVehicle3Color],PlayerInfo[playerid][pPlayerVehicle3Color2]);
					if(PlayerInfo[playerid][pVehLock3] == 1)
					{
						if(PlayerInfo[playerid][pVehLocked3] == 1)
						{
							LockCar(PlayerVehicleID3[playerid]);
						}
						else
						{
						    UnLockCar(PlayerVehicleID3[playerid]);
						}
					}
					if(PlayerInfo[playerid][PlayerVehicle3PaintJob] != 255)
					{
   	 					ChangeVehiclePaintjob(PlayerVehicleID3[playerid], PlayerInfo[playerid][PlayerVehicle3PaintJob]);
					}
					if(PlayerInfo[playerid][PlayerVehicle3ModSlot0] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID3[playerid], PlayerInfo[playerid][PlayerVehicle3ModSlot0]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle3ModSlot1] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID3[playerid], PlayerInfo[playerid][PlayerVehicle3ModSlot1]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle3ModSlot2] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID3[playerid], PlayerInfo[playerid][PlayerVehicle3ModSlot2]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle3ModSlot3] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID3[playerid], PlayerInfo[playerid][PlayerVehicle3ModSlot3]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle3ModSlot4] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID3[playerid], PlayerInfo[playerid][PlayerVehicle3ModSlot4]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle3ModSlot5] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID3[playerid], PlayerInfo[playerid][PlayerVehicle3ModSlot5]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle3ModSlot6] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID3[playerid], PlayerInfo[playerid][PlayerVehicle3ModSlot6]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle3ModSlot7] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID3[playerid], PlayerInfo[playerid][PlayerVehicle3ModSlot7]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle3ModSlot8] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID3[playerid], PlayerInfo[playerid][PlayerVehicle3ModSlot8]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle3ModSlot9] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID3[playerid], PlayerInfo[playerid][PlayerVehicle3ModSlot9]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle3ModSlot10] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID3[playerid], PlayerInfo[playerid][PlayerVehicle3ModSlot10]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle3ModSlot11] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID3[playerid], PlayerInfo[playerid][PlayerVehicle3ModSlot11]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle3ModSlot12] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID3[playerid], PlayerInfo[playerid][PlayerVehicle3ModSlot12]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle3ModSlot13] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID3[playerid], PlayerInfo[playerid][PlayerVehicle3ModSlot13]);
				    }
				    if(PlayerInfo[playerid][PlayerVehicle3Health] >= 250)
			        {
					    SetVehicleHealth(PlayerVehicleID3[playerid], PlayerInfo[playerid][PlayerVehicle3Health]);
			        }
				}
		    }
		    case 4:
		    {
		        if(PlayerInfo[playerid][PlayerVehicleModel4] != 0)
		        {
                    VehicleInfo[PlayerVehicleID4[playerid]][VehicleDealership] = 1;
                    PlayerInfo[playerid][PlayerVehicle4Interior] = GetPlayerInterior(playerid);
                    PlayerInfo[playerid][PlayerVehicle4VirWorld] = GetPlayerVirtualWorld(playerid);
					VehicleInfo[PlayerVehicleID4[playerid]][VehicleLock] = PlayerInfo[playerid][pVehLock4];
            		VehicleInfo[PlayerVehicleID4[playerid]][VehicleLocked] = PlayerInfo[playerid][pVehLocked4];
            		SetVehicleVirtualWorld(PlayerVehicleID4[playerid], PlayerInfo[playerid][PlayerVehicle4VirWorld]);
					LinkVehicleToInterior(PlayerVehicleID4[playerid], PlayerInfo[playerid][PlayerVehicle4Interior]);
					strmid(VehicleInfo[PlayerVehicleID4[playerid]][VehicleOwner], PlayerName(playerid), 0, strlen(PlayerName(playerid)), 255);
					ChangeVehicleColor(PlayerVehicleID4[playerid], PlayerInfo[playerid][pPlayerVehicle4Color],PlayerInfo[playerid][pPlayerVehicle4Color2]);
					if(PlayerInfo[playerid][pVehLock4] == 1)
					{
						if(PlayerInfo[playerid][pVehLocked4] == 1)
						{
							LockCar(PlayerVehicleID4[playerid]);
						}
						else
						{
						    UnLockCar(PlayerVehicleID4[playerid]);
						}
					}
					if(PlayerInfo[playerid][PlayerVehicle4PaintJob] != 255)
					{
						ChangeVehiclePaintjob(PlayerVehicleID4[playerid], PlayerInfo[playerid][PlayerVehicle4PaintJob]);
					}
					if(PlayerInfo[playerid][PlayerVehicle4ModSlot0] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID4[playerid], PlayerInfo[playerid][PlayerVehicle4ModSlot0]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle4ModSlot1] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID4[playerid], PlayerInfo[playerid][PlayerVehicle4ModSlot1]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle4ModSlot2] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID4[playerid], PlayerInfo[playerid][PlayerVehicle4ModSlot2]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle4ModSlot3] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID4[playerid], PlayerInfo[playerid][PlayerVehicle4ModSlot3]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle4ModSlot4] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID4[playerid], PlayerInfo[playerid][PlayerVehicle4ModSlot4]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle4ModSlot5] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID4[playerid], PlayerInfo[playerid][PlayerVehicle4ModSlot5]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle4ModSlot6] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID4[playerid], PlayerInfo[playerid][PlayerVehicle4ModSlot6]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle4ModSlot7] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID4[playerid], PlayerInfo[playerid][PlayerVehicle4ModSlot7]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle4ModSlot8] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID4[playerid], PlayerInfo[playerid][PlayerVehicle4ModSlot8]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle4ModSlot9] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID4[playerid], PlayerInfo[playerid][PlayerVehicle4ModSlot9]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle4ModSlot10] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID4[playerid], PlayerInfo[playerid][PlayerVehicle4ModSlot10]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle4ModSlot11] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID4[playerid], PlayerInfo[playerid][PlayerVehicle4ModSlot11]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle4ModSlot12] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID4[playerid], PlayerInfo[playerid][PlayerVehicle4ModSlot12]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle4ModSlot13] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID4[playerid], PlayerInfo[playerid][PlayerVehicle4ModSlot13]);
				    }
				    if(PlayerInfo[playerid][PlayerVehicle4Health] >= 250)
			        {
					    SetVehicleHealth(PlayerVehicleID4[playerid], PlayerInfo[playerid][PlayerVehicle4Health]);
			        }
				}
		    }
		    case 5:
		    {
		        if(PlayerInfo[playerid][PlayerVehicleModel5] != 0)
		        {
                    VehicleInfo[PlayerVehicleID5[playerid]][VehicleDealership] = 1;
                    PlayerInfo[playerid][PlayerVehicle5Interior] = GetPlayerInterior(playerid);
                    PlayerInfo[playerid][PlayerVehicle5VirWorld] = GetPlayerVirtualWorld(playerid);
					VehicleInfo[PlayerVehicleID5[playerid]][VehicleLock] = PlayerInfo[playerid][pVehLock5];
            		VehicleInfo[PlayerVehicleID5[playerid]][VehicleLocked] = PlayerInfo[playerid][pVehLocked5];
            		SetVehicleVirtualWorld(PlayerVehicleID5[playerid], PlayerInfo[playerid][PlayerVehicle5VirWorld]);
					LinkVehicleToInterior(PlayerVehicleID5[playerid], PlayerInfo[playerid][PlayerVehicle5Interior]);
					strmid(VehicleInfo[PlayerVehicleID5[playerid]][VehicleOwner], PlayerName(playerid), 0, strlen(PlayerName(playerid)), 255);
					ChangeVehicleColor(PlayerVehicleID5[playerid], PlayerInfo[playerid][pPlayerVehicle5Color],PlayerInfo[playerid][pPlayerVehicle5Color2]);
					if(PlayerInfo[playerid][pVehLock5] == 1)
					{
						if(PlayerInfo[playerid][pVehLocked5] == 1)
						{
							LockCar(PlayerVehicleID5[playerid]);
						}
						else
						{
						    UnLockCar(PlayerVehicleID5[playerid]);
						}
					}
					if(PlayerInfo[playerid][PlayerVehicle5PaintJob] != 255)
					{
						ChangeVehiclePaintjob(PlayerVehicleID5[playerid], PlayerInfo[playerid][PlayerVehicle5PaintJob]);
					}
					if(PlayerInfo[playerid][PlayerVehicle5ModSlot0] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID5[playerid], PlayerInfo[playerid][PlayerVehicle5ModSlot0]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle5ModSlot1] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID5[playerid], PlayerInfo[playerid][PlayerVehicle5ModSlot1]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle5ModSlot2] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID5[playerid], PlayerInfo[playerid][PlayerVehicle5ModSlot2]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle5ModSlot3] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID5[playerid], PlayerInfo[playerid][PlayerVehicle5ModSlot3]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle5ModSlot4] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID5[playerid], PlayerInfo[playerid][PlayerVehicle5ModSlot4]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle5ModSlot5] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID5[playerid], PlayerInfo[playerid][PlayerVehicle5ModSlot5]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle5ModSlot6] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID5[playerid], PlayerInfo[playerid][PlayerVehicle5ModSlot6]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle5ModSlot7] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID5[playerid], PlayerInfo[playerid][PlayerVehicle5ModSlot7]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle5ModSlot8] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID5[playerid], PlayerInfo[playerid][PlayerVehicle5ModSlot8]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle5ModSlot9] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID5[playerid], PlayerInfo[playerid][PlayerVehicle5ModSlot9]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle5ModSlot10] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID5[playerid], PlayerInfo[playerid][PlayerVehicle5ModSlot10]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle5ModSlot11] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID5[playerid], PlayerInfo[playerid][PlayerVehicle5ModSlot11]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle5ModSlot12] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID5[playerid], PlayerInfo[playerid][PlayerVehicle5ModSlot12]);
				    }
					if(PlayerInfo[playerid][PlayerVehicle5ModSlot13] > 0)
				    {
				        AddVehicleComponent(PlayerVehicleID5[playerid], PlayerInfo[playerid][PlayerVehicle5ModSlot13]);
				    }
				    if(PlayerInfo[playerid][PlayerVehicle5Health] >= 250)
			        {
					    SetVehicleHealth(PlayerVehicleID5[playerid], PlayerInfo[playerid][PlayerVehicle5Health]);
			        }
				}
		    }
		}
	}
}
stock ReplacePlayerVehicle(playerid, giveplayerid, slotid,vehslotid) // ReplacePlayerVehicle(seller, buyer, sellerslotid,buyerslotid)
{
	if(IsPlayerConnected(playerid))
	{
		if(IsPlayerConnected(giveplayerid))
		{
			switch(slotid)
			{
			    case 1:
			    {
					switch(vehslotid)
					{
					    case 1:
					    {
							PlayerInfo[giveplayerid][PlayerVehicleModel1] = PlayerInfo[playerid][PlayerVehicleModel1];
							PlayerInfo[giveplayerid][pVehLock1] = PlayerInfo[playerid][pVehLock1];
							PlayerInfo[giveplayerid][pVehLocked1] = PlayerInfo[playerid][pVehLocked1];
							PlayerInfo[giveplayerid][pPlayerVehicle1Color] = PlayerInfo[playerid][pPlayerVehicle1Color];
				            PlayerInfo[giveplayerid][pPlayerVehicle1Color2] = PlayerInfo[playerid][pPlayerVehicle1Color2];
							PlayerInfo[giveplayerid][PlayerVehiclePosX1] = PlayerInfo[playerid][PlayerVehiclePosX1];
			   				PlayerInfo[giveplayerid][PlayerVehiclePosY1] = PlayerInfo[playerid][PlayerVehiclePosY1];
			   				PlayerInfo[giveplayerid][PlayerVehiclePosZ1] = PlayerInfo[playerid][PlayerVehiclePosZ1];
							PlayerInfo[giveplayerid][PlayerVehicleFacing1] = PlayerInfo[playerid][PlayerVehicleFacing1];
							PlayerInfo[giveplayerid][PlayerVehicle1PaintJob] = PlayerInfo[playerid][PlayerVehicle1PaintJob];
							PlayerInfo[giveplayerid][PlayerVehicle1ModSlot0] = PlayerInfo[playerid][PlayerVehicle1ModSlot0];
							PlayerInfo[giveplayerid][PlayerVehicle1ModSlot1] = PlayerInfo[playerid][PlayerVehicle1ModSlot1];
							PlayerInfo[giveplayerid][PlayerVehicle1ModSlot2] = PlayerInfo[playerid][PlayerVehicle1ModSlot2];
							PlayerInfo[giveplayerid][PlayerVehicle1ModSlot3] = PlayerInfo[playerid][PlayerVehicle1ModSlot3];
							PlayerInfo[giveplayerid][PlayerVehicle1ModSlot4] = PlayerInfo[playerid][PlayerVehicle1ModSlot4];
							PlayerInfo[giveplayerid][PlayerVehicle1ModSlot5] = PlayerInfo[playerid][PlayerVehicle1ModSlot5];
							PlayerInfo[giveplayerid][PlayerVehicle1ModSlot6] = PlayerInfo[playerid][PlayerVehicle1ModSlot6];
							PlayerInfo[giveplayerid][PlayerVehicle1ModSlot7] = PlayerInfo[playerid][PlayerVehicle1ModSlot7];
							PlayerInfo[giveplayerid][PlayerVehicle1ModSlot8] = PlayerInfo[playerid][PlayerVehicle1ModSlot8];
							PlayerInfo[giveplayerid][PlayerVehicle1ModSlot9] = PlayerInfo[playerid][PlayerVehicle1ModSlot9];
							PlayerInfo[giveplayerid][PlayerVehicle1ModSlot10] = PlayerInfo[playerid][PlayerVehicle1ModSlot10];
							PlayerInfo[giveplayerid][PlayerVehicle1ModSlot11] = PlayerInfo[playerid][PlayerVehicle1ModSlot11];
							PlayerInfo[giveplayerid][PlayerVehicle1ModSlot12] = PlayerInfo[playerid][PlayerVehicle1ModSlot12];
							PlayerInfo[giveplayerid][PlayerVehicle1ModSlot13] = PlayerInfo[playerid][PlayerVehicle1ModSlot13];
							PlayerInfo[giveplayerid][PlayerVehicle1ModNeon] = PlayerInfo[playerid][PlayerVehicle1ModNeon];
							PlayerInfo[giveplayerid][PlayerVehicle1Upgraded] = PlayerInfo[playerid][PlayerVehicle1Upgraded];
							PlayerInfo[giveplayerid][PlayerVehicle1Trunk] = PlayerInfo[playerid][PlayerVehicle1Trunk];
							PlayerInfo[giveplayerid][PlayerVehicle1Trunk2] = PlayerInfo[playerid][PlayerVehicle1Trunk2];
							PlayerInfo[giveplayerid][PlayerVehicle1Trunk3] = PlayerInfo[playerid][PlayerVehicle1Trunk3];
							PlayerInfo[giveplayerid][PlayerVehicle1Trunk4] = PlayerInfo[playerid][PlayerVehicle1Trunk4];
							PlayerInfo[giveplayerid][PlayerVehicle1Trunk5] = PlayerInfo[playerid][PlayerVehicle1Trunk5];
							PlayerInfo[giveplayerid][PlayerVehicle1Health] = PlayerInfo[playerid][PlayerVehicle1Health];
							PlayerInfo[giveplayerid][PlayerVehicle1Goods] = PlayerInfo[playerid][PlayerVehicle1Goods];
							PlayerInfo[giveplayerid][PlayerVehicle1Fuel] = PlayerInfo[playerid][PlayerVehicle1Fuel];
							strmid(PlayerInfo[giveplayerid][PlayerVehicle1Plate], PlayerInfo[playerid][PlayerVehicle1Plate], 0, strlen(PlayerInfo[playerid][PlayerVehicle1Plate]), 255);
	                    }
	                    case 2:
					    {
							PlayerInfo[giveplayerid][PlayerVehicleModel2] = PlayerInfo[playerid][PlayerVehicleModel1];
							PlayerInfo[giveplayerid][pVehLock2] = PlayerInfo[playerid][pVehLock1];
							PlayerInfo[giveplayerid][pVehLocked2] = PlayerInfo[playerid][pVehLocked1];
							PlayerInfo[giveplayerid][pPlayerVehicle2Color] = PlayerInfo[playerid][pPlayerVehicle1Color];
				            PlayerInfo[giveplayerid][pPlayerVehicle2Color2] = PlayerInfo[playerid][pPlayerVehicle1Color2];
							PlayerInfo[giveplayerid][PlayerVehiclePosX2] = PlayerInfo[playerid][PlayerVehiclePosX1];
			   				PlayerInfo[giveplayerid][PlayerVehiclePosY2] = PlayerInfo[playerid][PlayerVehiclePosY1];
			   				PlayerInfo[giveplayerid][PlayerVehiclePosZ2] = PlayerInfo[playerid][PlayerVehiclePosZ1];
							PlayerInfo[giveplayerid][PlayerVehicleFacing2] = PlayerInfo[playerid][PlayerVehicleFacing1];
							PlayerInfo[giveplayerid][PlayerVehicle2PaintJob] = PlayerInfo[playerid][PlayerVehicle1PaintJob];
							PlayerInfo[giveplayerid][PlayerVehicle2ModSlot0] = PlayerInfo[playerid][PlayerVehicle1ModSlot0];
							PlayerInfo[giveplayerid][PlayerVehicle2ModSlot1] = PlayerInfo[playerid][PlayerVehicle1ModSlot1];
							PlayerInfo[giveplayerid][PlayerVehicle2ModSlot2] = PlayerInfo[playerid][PlayerVehicle1ModSlot2];
							PlayerInfo[giveplayerid][PlayerVehicle2ModSlot3] = PlayerInfo[playerid][PlayerVehicle1ModSlot3];
							PlayerInfo[giveplayerid][PlayerVehicle2ModSlot4] = PlayerInfo[playerid][PlayerVehicle1ModSlot4];
							PlayerInfo[giveplayerid][PlayerVehicle2ModSlot5] = PlayerInfo[playerid][PlayerVehicle1ModSlot5];
							PlayerInfo[giveplayerid][PlayerVehicle2ModSlot6] = PlayerInfo[playerid][PlayerVehicle1ModSlot6];
							PlayerInfo[giveplayerid][PlayerVehicle2ModSlot7] = PlayerInfo[playerid][PlayerVehicle1ModSlot7];
							PlayerInfo[giveplayerid][PlayerVehicle2ModSlot8] = PlayerInfo[playerid][PlayerVehicle1ModSlot8];
							PlayerInfo[giveplayerid][PlayerVehicle2ModSlot9] = PlayerInfo[playerid][PlayerVehicle1ModSlot9];
							PlayerInfo[giveplayerid][PlayerVehicle2ModSlot10] = PlayerInfo[playerid][PlayerVehicle1ModSlot10];
							PlayerInfo[giveplayerid][PlayerVehicle2ModSlot11] = PlayerInfo[playerid][PlayerVehicle1ModSlot11];
							PlayerInfo[giveplayerid][PlayerVehicle2ModSlot12] = PlayerInfo[playerid][PlayerVehicle1ModSlot12];
							PlayerInfo[giveplayerid][PlayerVehicle2ModSlot13] = PlayerInfo[playerid][PlayerVehicle1ModSlot13];
							PlayerInfo[giveplayerid][PlayerVehicle2ModNeon] = PlayerInfo[playerid][PlayerVehicle1ModNeon];
							PlayerInfo[giveplayerid][PlayerVehicle2Upgraded] = PlayerInfo[playerid][PlayerVehicle1Upgraded];
							PlayerInfo[giveplayerid][PlayerVehicle2Trunk] = PlayerInfo[playerid][PlayerVehicle1Trunk];
							PlayerInfo[giveplayerid][PlayerVehicle2Trunk2] = PlayerInfo[playerid][PlayerVehicle1Trunk2];
							PlayerInfo[giveplayerid][PlayerVehicle2Trunk3] = PlayerInfo[playerid][PlayerVehicle1Trunk3];
							PlayerInfo[giveplayerid][PlayerVehicle2Trunk4] = PlayerInfo[playerid][PlayerVehicle1Trunk4];
							PlayerInfo[giveplayerid][PlayerVehicle2Trunk5] = PlayerInfo[playerid][PlayerVehicle1Trunk5];
							PlayerInfo[giveplayerid][PlayerVehicle2Health] = PlayerInfo[playerid][PlayerVehicle1Health];
							PlayerInfo[giveplayerid][PlayerVehicle2Goods] = PlayerInfo[playerid][PlayerVehicle1Goods];
							PlayerInfo[giveplayerid][PlayerVehicle2Fuel] = PlayerInfo[playerid][PlayerVehicle1Fuel];
							strmid(PlayerInfo[giveplayerid][PlayerVehicle2Plate], PlayerInfo[playerid][PlayerVehicle1Plate], 0, strlen(PlayerInfo[playerid][PlayerVehicle1Plate]), 255);
	                    }
	                    case 3:
					    {
							PlayerInfo[giveplayerid][PlayerVehicleModel3] = PlayerInfo[playerid][PlayerVehicleModel1];
							PlayerInfo[giveplayerid][pVehLock3] = PlayerInfo[playerid][pVehLock1];
							PlayerInfo[giveplayerid][pVehLocked3] = PlayerInfo[playerid][pVehLocked1];
							PlayerInfo[giveplayerid][pPlayerVehicle3Color] = PlayerInfo[playerid][pPlayerVehicle1Color];
				            PlayerInfo[giveplayerid][pPlayerVehicle3Color2] = PlayerInfo[playerid][pPlayerVehicle1Color2];
							PlayerInfo[giveplayerid][PlayerVehiclePosX3] = PlayerInfo[playerid][PlayerVehiclePosX1];
			   				PlayerInfo[giveplayerid][PlayerVehiclePosY3] = PlayerInfo[playerid][PlayerVehiclePosY1];
			   				PlayerInfo[giveplayerid][PlayerVehiclePosZ3] = PlayerInfo[playerid][PlayerVehiclePosZ1];
							PlayerInfo[giveplayerid][PlayerVehicleFacing3] = PlayerInfo[playerid][PlayerVehicleFacing1];
							PlayerInfo[giveplayerid][PlayerVehicle3PaintJob] = PlayerInfo[playerid][PlayerVehicle1PaintJob];
							PlayerInfo[giveplayerid][PlayerVehicle3ModSlot0] = PlayerInfo[playerid][PlayerVehicle1ModSlot0];
							PlayerInfo[giveplayerid][PlayerVehicle3ModSlot1] = PlayerInfo[playerid][PlayerVehicle1ModSlot1];
							PlayerInfo[giveplayerid][PlayerVehicle3ModSlot2] = PlayerInfo[playerid][PlayerVehicle1ModSlot2];
							PlayerInfo[giveplayerid][PlayerVehicle3ModSlot3] = PlayerInfo[playerid][PlayerVehicle1ModSlot3];
							PlayerInfo[giveplayerid][PlayerVehicle3ModSlot4] = PlayerInfo[playerid][PlayerVehicle1ModSlot4];
							PlayerInfo[giveplayerid][PlayerVehicle3ModSlot5] = PlayerInfo[playerid][PlayerVehicle1ModSlot5];
							PlayerInfo[giveplayerid][PlayerVehicle3ModSlot6] = PlayerInfo[playerid][PlayerVehicle1ModSlot6];
							PlayerInfo[giveplayerid][PlayerVehicle3ModSlot7] = PlayerInfo[playerid][PlayerVehicle1ModSlot7];
							PlayerInfo[giveplayerid][PlayerVehicle3ModSlot8] = PlayerInfo[playerid][PlayerVehicle1ModSlot8];
							PlayerInfo[giveplayerid][PlayerVehicle3ModSlot9] = PlayerInfo[playerid][PlayerVehicle1ModSlot9];
							PlayerInfo[giveplayerid][PlayerVehicle3ModSlot10] = PlayerInfo[playerid][PlayerVehicle1ModSlot10];
							PlayerInfo[giveplayerid][PlayerVehicle3ModSlot11] = PlayerInfo[playerid][PlayerVehicle1ModSlot11];
							PlayerInfo[giveplayerid][PlayerVehicle3ModSlot12] = PlayerInfo[playerid][PlayerVehicle1ModSlot12];
							PlayerInfo[giveplayerid][PlayerVehicle3ModSlot13] = PlayerInfo[playerid][PlayerVehicle1ModSlot13];
							PlayerInfo[giveplayerid][PlayerVehicle3ModNeon] = PlayerInfo[playerid][PlayerVehicle1ModNeon];
							PlayerInfo[giveplayerid][PlayerVehicle3Upgraded] = PlayerInfo[playerid][PlayerVehicle1Upgraded];
							PlayerInfo[giveplayerid][PlayerVehicle3Trunk] = PlayerInfo[playerid][PlayerVehicle1Trunk];
							PlayerInfo[giveplayerid][PlayerVehicle3Trunk2] = PlayerInfo[playerid][PlayerVehicle1Trunk2];
							PlayerInfo[giveplayerid][PlayerVehicle3Trunk3] = PlayerInfo[playerid][PlayerVehicle1Trunk3];
							PlayerInfo[giveplayerid][PlayerVehicle3Trunk4] = PlayerInfo[playerid][PlayerVehicle1Trunk4];
							PlayerInfo[giveplayerid][PlayerVehicle3Trunk5] = PlayerInfo[playerid][PlayerVehicle1Trunk5];
							PlayerInfo[giveplayerid][PlayerVehicle3Health] = PlayerInfo[playerid][PlayerVehicle1Health];
							PlayerInfo[giveplayerid][PlayerVehicle3Goods] = PlayerInfo[playerid][PlayerVehicle1Goods];
							PlayerInfo[giveplayerid][PlayerVehicle3Fuel] = PlayerInfo[playerid][PlayerVehicle1Fuel];
							strmid(PlayerInfo[giveplayerid][PlayerVehicle3Plate], PlayerInfo[playerid][PlayerVehicle1Plate], 0, strlen(PlayerInfo[playerid][PlayerVehicle1Plate]), 255);
	                    }
	                    case 4:
					    {
							PlayerInfo[giveplayerid][PlayerVehicleModel4] = PlayerInfo[playerid][PlayerVehicleModel1];
							PlayerInfo[giveplayerid][pVehLock4] = PlayerInfo[playerid][pVehLock1];
							PlayerInfo[giveplayerid][pVehLocked4] = PlayerInfo[playerid][pVehLocked1];
							PlayerInfo[giveplayerid][pPlayerVehicle4Color] = PlayerInfo[playerid][pPlayerVehicle1Color];
				            PlayerInfo[giveplayerid][pPlayerVehicle4Color2] = PlayerInfo[playerid][pPlayerVehicle1Color2];
							PlayerInfo[giveplayerid][PlayerVehiclePosX4] = PlayerInfo[playerid][PlayerVehiclePosX1];
			   				PlayerInfo[giveplayerid][PlayerVehiclePosY4] = PlayerInfo[playerid][PlayerVehiclePosY1];
			   				PlayerInfo[giveplayerid][PlayerVehiclePosZ4] = PlayerInfo[playerid][PlayerVehiclePosZ1];
							PlayerInfo[giveplayerid][PlayerVehicleFacing4] = PlayerInfo[playerid][PlayerVehicleFacing1];
							PlayerInfo[giveplayerid][PlayerVehicle4PaintJob] = PlayerInfo[playerid][PlayerVehicle1PaintJob];
							PlayerInfo[giveplayerid][PlayerVehicle4ModSlot0] = PlayerInfo[playerid][PlayerVehicle1ModSlot0];
							PlayerInfo[giveplayerid][PlayerVehicle4ModSlot1] = PlayerInfo[playerid][PlayerVehicle1ModSlot1];
							PlayerInfo[giveplayerid][PlayerVehicle4ModSlot2] = PlayerInfo[playerid][PlayerVehicle1ModSlot2];
							PlayerInfo[giveplayerid][PlayerVehicle4ModSlot3] = PlayerInfo[playerid][PlayerVehicle1ModSlot3];
							PlayerInfo[giveplayerid][PlayerVehicle4ModSlot4] = PlayerInfo[playerid][PlayerVehicle1ModSlot4];
							PlayerInfo[giveplayerid][PlayerVehicle4ModSlot5] = PlayerInfo[playerid][PlayerVehicle1ModSlot5];
							PlayerInfo[giveplayerid][PlayerVehicle4ModSlot6] = PlayerInfo[playerid][PlayerVehicle1ModSlot6];
							PlayerInfo[giveplayerid][PlayerVehicle4ModSlot7] = PlayerInfo[playerid][PlayerVehicle1ModSlot7];
							PlayerInfo[giveplayerid][PlayerVehicle4ModSlot8] = PlayerInfo[playerid][PlayerVehicle1ModSlot8];
							PlayerInfo[giveplayerid][PlayerVehicle4ModSlot9] = PlayerInfo[playerid][PlayerVehicle1ModSlot9];
							PlayerInfo[giveplayerid][PlayerVehicle4ModSlot10] = PlayerInfo[playerid][PlayerVehicle1ModSlot10];
							PlayerInfo[giveplayerid][PlayerVehicle4ModSlot11] = PlayerInfo[playerid][PlayerVehicle1ModSlot11];
							PlayerInfo[giveplayerid][PlayerVehicle4ModSlot12] = PlayerInfo[playerid][PlayerVehicle1ModSlot12];
							PlayerInfo[giveplayerid][PlayerVehicle4ModSlot13] = PlayerInfo[playerid][PlayerVehicle1ModSlot13];
							PlayerInfo[giveplayerid][PlayerVehicle4ModNeon] = PlayerInfo[playerid][PlayerVehicle1ModNeon];
							PlayerInfo[giveplayerid][PlayerVehicle4Upgraded] = PlayerInfo[playerid][PlayerVehicle1Upgraded];
							PlayerInfo[giveplayerid][PlayerVehicle4Trunk] = PlayerInfo[playerid][PlayerVehicle1Trunk];
							PlayerInfo[giveplayerid][PlayerVehicle4Trunk2] = PlayerInfo[playerid][PlayerVehicle1Trunk2];
							PlayerInfo[giveplayerid][PlayerVehicle4Trunk3] = PlayerInfo[playerid][PlayerVehicle1Trunk3];
							PlayerInfo[giveplayerid][PlayerVehicle4Trunk4] = PlayerInfo[playerid][PlayerVehicle1Trunk4];
							PlayerInfo[giveplayerid][PlayerVehicle4Trunk5] = PlayerInfo[playerid][PlayerVehicle1Trunk5];
							PlayerInfo[giveplayerid][PlayerVehicle4Health] = PlayerInfo[playerid][PlayerVehicle1Health];
							PlayerInfo[giveplayerid][PlayerVehicle4Goods] = PlayerInfo[playerid][PlayerVehicle1Goods];
							PlayerInfo[giveplayerid][PlayerVehicle4Fuel] = PlayerInfo[playerid][PlayerVehicle1Fuel];
							strmid(PlayerInfo[giveplayerid][PlayerVehicle4Plate], PlayerInfo[playerid][PlayerVehicle1Plate], 0, strlen(PlayerInfo[playerid][PlayerVehicle1Plate]), 255);
	                    }
	                    case 5:
					    {
							PlayerInfo[giveplayerid][PlayerVehicleModel5] = PlayerInfo[playerid][PlayerVehicleModel1];
							PlayerInfo[giveplayerid][pVehLock5] = PlayerInfo[playerid][pVehLock1];
							PlayerInfo[giveplayerid][pVehLocked5] = PlayerInfo[playerid][pVehLocked1];
							PlayerInfo[giveplayerid][pPlayerVehicle5Color] = PlayerInfo[playerid][pPlayerVehicle1Color];
				            PlayerInfo[giveplayerid][pPlayerVehicle5Color2] = PlayerInfo[playerid][pPlayerVehicle1Color2];
							PlayerInfo[giveplayerid][PlayerVehiclePosX5] = PlayerInfo[playerid][PlayerVehiclePosX1];
			   				PlayerInfo[giveplayerid][PlayerVehiclePosY5] = PlayerInfo[playerid][PlayerVehiclePosY1];
			   				PlayerInfo[giveplayerid][PlayerVehiclePosZ5] = PlayerInfo[playerid][PlayerVehiclePosZ1];
							PlayerInfo[giveplayerid][PlayerVehicleFacing5] = PlayerInfo[playerid][PlayerVehicleFacing1];
							PlayerInfo[giveplayerid][PlayerVehicle5PaintJob] = PlayerInfo[playerid][PlayerVehicle1PaintJob];
							PlayerInfo[giveplayerid][PlayerVehicle5ModSlot0] = PlayerInfo[playerid][PlayerVehicle1ModSlot0];
							PlayerInfo[giveplayerid][PlayerVehicle5ModSlot1] = PlayerInfo[playerid][PlayerVehicle1ModSlot1];
							PlayerInfo[giveplayerid][PlayerVehicle5ModSlot2] = PlayerInfo[playerid][PlayerVehicle1ModSlot2];
							PlayerInfo[giveplayerid][PlayerVehicle5ModSlot3] = PlayerInfo[playerid][PlayerVehicle1ModSlot3];
							PlayerInfo[giveplayerid][PlayerVehicle5ModSlot4] = PlayerInfo[playerid][PlayerVehicle1ModSlot4];
							PlayerInfo[giveplayerid][PlayerVehicle5ModSlot5] = PlayerInfo[playerid][PlayerVehicle1ModSlot5];
							PlayerInfo[giveplayerid][PlayerVehicle5ModSlot6] = PlayerInfo[playerid][PlayerVehicle1ModSlot6];
							PlayerInfo[giveplayerid][PlayerVehicle5ModSlot7] = PlayerInfo[playerid][PlayerVehicle1ModSlot7];
							PlayerInfo[giveplayerid][PlayerVehicle5ModSlot8] = PlayerInfo[playerid][PlayerVehicle1ModSlot8];
							PlayerInfo[giveplayerid][PlayerVehicle5ModSlot9] = PlayerInfo[playerid][PlayerVehicle1ModSlot9];
							PlayerInfo[giveplayerid][PlayerVehicle5ModSlot10] = PlayerInfo[playerid][PlayerVehicle1ModSlot10];
							PlayerInfo[giveplayerid][PlayerVehicle5ModSlot11] = PlayerInfo[playerid][PlayerVehicle1ModSlot11];
							PlayerInfo[giveplayerid][PlayerVehicle5ModSlot12] = PlayerInfo[playerid][PlayerVehicle1ModSlot12];
							PlayerInfo[giveplayerid][PlayerVehicle5ModSlot13] = PlayerInfo[playerid][PlayerVehicle1ModSlot13];
							PlayerInfo[giveplayerid][PlayerVehicle5ModNeon] = PlayerInfo[playerid][PlayerVehicle1ModNeon];
							PlayerInfo[giveplayerid][PlayerVehicle5Upgraded] = PlayerInfo[playerid][PlayerVehicle1Upgraded];
							PlayerInfo[giveplayerid][PlayerVehicle5Trunk] = PlayerInfo[playerid][PlayerVehicle1Trunk];
							PlayerInfo[giveplayerid][PlayerVehicle5Trunk2] = PlayerInfo[playerid][PlayerVehicle1Trunk2];
							PlayerInfo[giveplayerid][PlayerVehicle5Trunk3] = PlayerInfo[playerid][PlayerVehicle1Trunk3];
							PlayerInfo[giveplayerid][PlayerVehicle5Trunk4] = PlayerInfo[playerid][PlayerVehicle1Trunk4];
							PlayerInfo[giveplayerid][PlayerVehicle5Trunk5] = PlayerInfo[playerid][PlayerVehicle1Trunk5];
							PlayerInfo[giveplayerid][PlayerVehicle5Health] = PlayerInfo[playerid][PlayerVehicle1Health];
							PlayerInfo[giveplayerid][PlayerVehicle5Goods] = PlayerInfo[playerid][PlayerVehicle1Goods];
							PlayerInfo[giveplayerid][PlayerVehicle5Fuel] = PlayerInfo[playerid][PlayerVehicle1Fuel];
							strmid(PlayerInfo[giveplayerid][PlayerVehicle5Plate], PlayerInfo[playerid][PlayerVehicle1Plate], 0, strlen(PlayerInfo[playerid][PlayerVehicle1Plate]), 255);
	                    }
					}
			    }
			    case 2:
			    {
					switch(vehslotid)
					{
						case 1:
					    {
							PlayerInfo[giveplayerid][PlayerVehicleModel1] = PlayerInfo[playerid][PlayerVehicleModel2];
							PlayerInfo[giveplayerid][pVehLock1] = PlayerInfo[playerid][pVehLock2];
							PlayerInfo[giveplayerid][pVehLocked1] = PlayerInfo[playerid][pVehLocked2];
							PlayerInfo[giveplayerid][pPlayerVehicle1Color] = PlayerInfo[playerid][pPlayerVehicle2Color];
				            PlayerInfo[giveplayerid][pPlayerVehicle1Color2] = PlayerInfo[playerid][pPlayerVehicle2Color2];
							PlayerInfo[giveplayerid][PlayerVehiclePosX1] = PlayerInfo[playerid][PlayerVehiclePosX2];
			   				PlayerInfo[giveplayerid][PlayerVehiclePosY1] = PlayerInfo[playerid][PlayerVehiclePosY2];
			   				PlayerInfo[giveplayerid][PlayerVehiclePosZ1] = PlayerInfo[playerid][PlayerVehiclePosZ2];
							PlayerInfo[giveplayerid][PlayerVehicleFacing1] = PlayerInfo[playerid][PlayerVehicleFacing2];
							PlayerInfo[giveplayerid][PlayerVehicle1PaintJob] = PlayerInfo[playerid][PlayerVehicle2PaintJob];
							PlayerInfo[giveplayerid][PlayerVehicle1ModSlot0] = PlayerInfo[playerid][PlayerVehicle2ModSlot0];
							PlayerInfo[giveplayerid][PlayerVehicle1ModSlot1] = PlayerInfo[playerid][PlayerVehicle2ModSlot1];
							PlayerInfo[giveplayerid][PlayerVehicle1ModSlot2] = PlayerInfo[playerid][PlayerVehicle2ModSlot2];
							PlayerInfo[giveplayerid][PlayerVehicle1ModSlot3] = PlayerInfo[playerid][PlayerVehicle2ModSlot3];
							PlayerInfo[giveplayerid][PlayerVehicle1ModSlot4] = PlayerInfo[playerid][PlayerVehicle2ModSlot4];
							PlayerInfo[giveplayerid][PlayerVehicle1ModSlot5] = PlayerInfo[playerid][PlayerVehicle2ModSlot5];
							PlayerInfo[giveplayerid][PlayerVehicle1ModSlot6] = PlayerInfo[playerid][PlayerVehicle2ModSlot6];
							PlayerInfo[giveplayerid][PlayerVehicle1ModSlot7] = PlayerInfo[playerid][PlayerVehicle2ModSlot7];
							PlayerInfo[giveplayerid][PlayerVehicle1ModSlot8] = PlayerInfo[playerid][PlayerVehicle2ModSlot8];
							PlayerInfo[giveplayerid][PlayerVehicle1ModSlot9] = PlayerInfo[playerid][PlayerVehicle2ModSlot9];
							PlayerInfo[giveplayerid][PlayerVehicle1ModSlot10] = PlayerInfo[playerid][PlayerVehicle2ModSlot10];
							PlayerInfo[giveplayerid][PlayerVehicle1ModSlot11] = PlayerInfo[playerid][PlayerVehicle2ModSlot11];
							PlayerInfo[giveplayerid][PlayerVehicle1ModSlot12] = PlayerInfo[playerid][PlayerVehicle2ModSlot12];
							PlayerInfo[giveplayerid][PlayerVehicle1ModSlot13] = PlayerInfo[playerid][PlayerVehicle2ModSlot13];
							PlayerInfo[giveplayerid][PlayerVehicle1ModNeon] = PlayerInfo[playerid][PlayerVehicle2ModNeon];
							PlayerInfo[giveplayerid][PlayerVehicle1Upgraded] = PlayerInfo[playerid][PlayerVehicle2Upgraded];
							PlayerInfo[giveplayerid][PlayerVehicle1Trunk] = PlayerInfo[playerid][PlayerVehicle2Trunk];
							PlayerInfo[giveplayerid][PlayerVehicle1Trunk2] = PlayerInfo[playerid][PlayerVehicle2Trunk2];
							PlayerInfo[giveplayerid][PlayerVehicle1Trunk3] = PlayerInfo[playerid][PlayerVehicle2Trunk3];
							PlayerInfo[giveplayerid][PlayerVehicle1Trunk4] = PlayerInfo[playerid][PlayerVehicle2Trunk4];
							PlayerInfo[giveplayerid][PlayerVehicle1Trunk5] = PlayerInfo[playerid][PlayerVehicle2Trunk5];
							PlayerInfo[giveplayerid][PlayerVehicle1Health] = PlayerInfo[playerid][PlayerVehicle2Health];
							PlayerInfo[giveplayerid][PlayerVehicle1Goods] = PlayerInfo[playerid][PlayerVehicle2Goods];
							PlayerInfo[giveplayerid][PlayerVehicle1Fuel] = PlayerInfo[playerid][PlayerVehicle2Fuel];
							strmid(PlayerInfo[giveplayerid][PlayerVehicle1Plate], PlayerInfo[playerid][PlayerVehicle2Plate], 0, strlen(PlayerInfo[playerid][PlayerVehicle2Plate]), 255);
	                    }
	                    case 2:
					    {
							PlayerInfo[giveplayerid][PlayerVehicleModel2] = PlayerInfo[playerid][PlayerVehicleModel2];
							PlayerInfo[giveplayerid][pVehLock2] = PlayerInfo[playerid][pVehLock2];
							PlayerInfo[giveplayerid][pVehLocked2] = PlayerInfo[playerid][pVehLocked2];
							PlayerInfo[giveplayerid][pPlayerVehicle2Color] = PlayerInfo[playerid][pPlayerVehicle2Color];
				            PlayerInfo[giveplayerid][pPlayerVehicle2Color2] = PlayerInfo[playerid][pPlayerVehicle2Color2];
							PlayerInfo[giveplayerid][PlayerVehiclePosX2] = PlayerInfo[playerid][PlayerVehiclePosX2];
			   				PlayerInfo[giveplayerid][PlayerVehiclePosY2] = PlayerInfo[playerid][PlayerVehiclePosY2];
			   				PlayerInfo[giveplayerid][PlayerVehiclePosZ2] = PlayerInfo[playerid][PlayerVehiclePosZ2];
							PlayerInfo[giveplayerid][PlayerVehicleFacing2] = PlayerInfo[playerid][PlayerVehicleFacing2];
							PlayerInfo[giveplayerid][PlayerVehicle2PaintJob] = PlayerInfo[playerid][PlayerVehicle2PaintJob];
							PlayerInfo[giveplayerid][PlayerVehicle2ModSlot0] = PlayerInfo[playerid][PlayerVehicle2ModSlot0];
							PlayerInfo[giveplayerid][PlayerVehicle2ModSlot1] = PlayerInfo[playerid][PlayerVehicle2ModSlot1];
							PlayerInfo[giveplayerid][PlayerVehicle2ModSlot2] = PlayerInfo[playerid][PlayerVehicle2ModSlot2];
							PlayerInfo[giveplayerid][PlayerVehicle2ModSlot3] = PlayerInfo[playerid][PlayerVehicle2ModSlot3];
							PlayerInfo[giveplayerid][PlayerVehicle2ModSlot4] = PlayerInfo[playerid][PlayerVehicle2ModSlot4];
							PlayerInfo[giveplayerid][PlayerVehicle2ModSlot5] = PlayerInfo[playerid][PlayerVehicle2ModSlot5];
							PlayerInfo[giveplayerid][PlayerVehicle2ModSlot6] = PlayerInfo[playerid][PlayerVehicle2ModSlot6];
							PlayerInfo[giveplayerid][PlayerVehicle2ModSlot7] = PlayerInfo[playerid][PlayerVehicle2ModSlot7];
							PlayerInfo[giveplayerid][PlayerVehicle2ModSlot8] = PlayerInfo[playerid][PlayerVehicle2ModSlot8];
							PlayerInfo[giveplayerid][PlayerVehicle2ModSlot9] = PlayerInfo[playerid][PlayerVehicle2ModSlot9];
							PlayerInfo[giveplayerid][PlayerVehicle2ModSlot10] = PlayerInfo[playerid][PlayerVehicle2ModSlot10];
							PlayerInfo[giveplayerid][PlayerVehicle2ModSlot11] = PlayerInfo[playerid][PlayerVehicle2ModSlot11];
							PlayerInfo[giveplayerid][PlayerVehicle2ModSlot12] = PlayerInfo[playerid][PlayerVehicle2ModSlot12];
							PlayerInfo[giveplayerid][PlayerVehicle2ModSlot13] = PlayerInfo[playerid][PlayerVehicle2ModSlot13];
							PlayerInfo[giveplayerid][PlayerVehicle2ModNeon] = PlayerInfo[playerid][PlayerVehicle2ModNeon];
							PlayerInfo[giveplayerid][PlayerVehicle2Upgraded] = PlayerInfo[playerid][PlayerVehicle2Upgraded];
							PlayerInfo[giveplayerid][PlayerVehicle2Trunk] = PlayerInfo[playerid][PlayerVehicle2Trunk];
							PlayerInfo[giveplayerid][PlayerVehicle2Trunk2] = PlayerInfo[playerid][PlayerVehicle2Trunk2];
							PlayerInfo[giveplayerid][PlayerVehicle2Trunk3] = PlayerInfo[playerid][PlayerVehicle2Trunk3];
							PlayerInfo[giveplayerid][PlayerVehicle2Trunk4] = PlayerInfo[playerid][PlayerVehicle2Trunk4];
							PlayerInfo[giveplayerid][PlayerVehicle2Trunk5] = PlayerInfo[playerid][PlayerVehicle2Trunk5];
							PlayerInfo[giveplayerid][PlayerVehicle2Health] = PlayerInfo[playerid][PlayerVehicle2Health];
							PlayerInfo[giveplayerid][PlayerVehicle2Goods] = PlayerInfo[playerid][PlayerVehicle2Goods];
							PlayerInfo[giveplayerid][PlayerVehicle2Fuel] = PlayerInfo[playerid][PlayerVehicle2Fuel];
							strmid(PlayerInfo[giveplayerid][PlayerVehicle2Plate], PlayerInfo[playerid][PlayerVehicle2Plate], 0, strlen(PlayerInfo[playerid][PlayerVehicle2Plate]), 255);
	                    }
	                    case 3:
					    {
							PlayerInfo[giveplayerid][PlayerVehicleModel3] = PlayerInfo[playerid][PlayerVehicleModel2];
							PlayerInfo[giveplayerid][pVehLock3] = PlayerInfo[playerid][pVehLock2];
							PlayerInfo[giveplayerid][pVehLocked3] = PlayerInfo[playerid][pVehLocked2];
							PlayerInfo[giveplayerid][pPlayerVehicle3Color] = PlayerInfo[playerid][pPlayerVehicle2Color];
				            PlayerInfo[giveplayerid][pPlayerVehicle3Color2] = PlayerInfo[playerid][pPlayerVehicle2Color2];
							PlayerInfo[giveplayerid][PlayerVehiclePosX3] = PlayerInfo[playerid][PlayerVehiclePosX2];
			   				PlayerInfo[giveplayerid][PlayerVehiclePosY3] = PlayerInfo[playerid][PlayerVehiclePosY2];
			   				PlayerInfo[giveplayerid][PlayerVehiclePosZ3] = PlayerInfo[playerid][PlayerVehiclePosZ2];
							PlayerInfo[giveplayerid][PlayerVehicleFacing3] = PlayerInfo[playerid][PlayerVehicleFacing2];
							PlayerInfo[giveplayerid][PlayerVehicle3PaintJob] = PlayerInfo[playerid][PlayerVehicle2PaintJob];
							PlayerInfo[giveplayerid][PlayerVehicle3ModSlot0] = PlayerInfo[playerid][PlayerVehicle2ModSlot0];
							PlayerInfo[giveplayerid][PlayerVehicle3ModSlot1] = PlayerInfo[playerid][PlayerVehicle2ModSlot1];
							PlayerInfo[giveplayerid][PlayerVehicle3ModSlot2] = PlayerInfo[playerid][PlayerVehicle2ModSlot2];
							PlayerInfo[giveplayerid][PlayerVehicle3ModSlot3] = PlayerInfo[playerid][PlayerVehicle2ModSlot3];
							PlayerInfo[giveplayerid][PlayerVehicle3ModSlot4] = PlayerInfo[playerid][PlayerVehicle2ModSlot4];
							PlayerInfo[giveplayerid][PlayerVehicle3ModSlot5] = PlayerInfo[playerid][PlayerVehicle2ModSlot5];
							PlayerInfo[giveplayerid][PlayerVehicle3ModSlot6] = PlayerInfo[playerid][PlayerVehicle2ModSlot6];
							PlayerInfo[giveplayerid][PlayerVehicle3ModSlot7] = PlayerInfo[playerid][PlayerVehicle2ModSlot7];
							PlayerInfo[giveplayerid][PlayerVehicle3ModSlot8] = PlayerInfo[playerid][PlayerVehicle2ModSlot8];
							PlayerInfo[giveplayerid][PlayerVehicle3ModSlot9] = PlayerInfo[playerid][PlayerVehicle2ModSlot9];
							PlayerInfo[giveplayerid][PlayerVehicle3ModSlot10] = PlayerInfo[playerid][PlayerVehicle2ModSlot10];
							PlayerInfo[giveplayerid][PlayerVehicle3ModSlot11] = PlayerInfo[playerid][PlayerVehicle2ModSlot11];
							PlayerInfo[giveplayerid][PlayerVehicle3ModSlot12] = PlayerInfo[playerid][PlayerVehicle2ModSlot12];
							PlayerInfo[giveplayerid][PlayerVehicle3ModSlot13] = PlayerInfo[playerid][PlayerVehicle2ModSlot13];
							PlayerInfo[giveplayerid][PlayerVehicle3ModNeon] = PlayerInfo[playerid][PlayerVehicle2ModNeon];
							PlayerInfo[giveplayerid][PlayerVehicle3Upgraded] = PlayerInfo[playerid][PlayerVehicle2Upgraded];
							PlayerInfo[giveplayerid][PlayerVehicle3Trunk] = PlayerInfo[playerid][PlayerVehicle2Trunk];
							PlayerInfo[giveplayerid][PlayerVehicle3Trunk2] = PlayerInfo[playerid][PlayerVehicle2Trunk2];
							PlayerInfo[giveplayerid][PlayerVehicle3Trunk3] = PlayerInfo[playerid][PlayerVehicle2Trunk3];
							PlayerInfo[giveplayerid][PlayerVehicle3Trunk4] = PlayerInfo[playerid][PlayerVehicle2Trunk4];
							PlayerInfo[giveplayerid][PlayerVehicle3Trunk5] = PlayerInfo[playerid][PlayerVehicle2Trunk5];
							PlayerInfo[giveplayerid][PlayerVehicle3Health] = PlayerInfo[playerid][PlayerVehicle2Health];
							PlayerInfo[giveplayerid][PlayerVehicle3Goods] = PlayerInfo[playerid][PlayerVehicle2Goods];
							PlayerInfo[giveplayerid][PlayerVehicle3Fuel] = PlayerInfo[playerid][PlayerVehicle2Fuel];
							strmid(PlayerInfo[giveplayerid][PlayerVehicle3Plate], PlayerInfo[playerid][PlayerVehicle2Plate], 0, strlen(PlayerInfo[playerid][PlayerVehicle2Plate]), 255);
	                    }
	                    case 4:
					    {
							PlayerInfo[giveplayerid][PlayerVehicleModel4] = PlayerInfo[playerid][PlayerVehicleModel2];
							PlayerInfo[giveplayerid][pVehLock4] = PlayerInfo[playerid][pVehLock2];
							PlayerInfo[giveplayerid][pVehLocked4] = PlayerInfo[playerid][pVehLocked2];
							PlayerInfo[giveplayerid][pPlayerVehicle4Color] = PlayerInfo[playerid][pPlayerVehicle2Color];
				            PlayerInfo[giveplayerid][pPlayerVehicle4Color2] = PlayerInfo[playerid][pPlayerVehicle2Color2];
							PlayerInfo[giveplayerid][PlayerVehiclePosX4] = PlayerInfo[playerid][PlayerVehiclePosX2];
			   				PlayerInfo[giveplayerid][PlayerVehiclePosY4] = PlayerInfo[playerid][PlayerVehiclePosY2];
			   				PlayerInfo[giveplayerid][PlayerVehiclePosZ4] = PlayerInfo[playerid][PlayerVehiclePosZ2];
							PlayerInfo[giveplayerid][PlayerVehicleFacing4] = PlayerInfo[playerid][PlayerVehicleFacing2];
							PlayerInfo[giveplayerid][PlayerVehicle4PaintJob] = PlayerInfo[playerid][PlayerVehicle2PaintJob];
							PlayerInfo[giveplayerid][PlayerVehicle4ModSlot0] = PlayerInfo[playerid][PlayerVehicle2ModSlot0];
							PlayerInfo[giveplayerid][PlayerVehicle4ModSlot1] = PlayerInfo[playerid][PlayerVehicle2ModSlot1];
							PlayerInfo[giveplayerid][PlayerVehicle4ModSlot2] = PlayerInfo[playerid][PlayerVehicle2ModSlot2];
							PlayerInfo[giveplayerid][PlayerVehicle4ModSlot3] = PlayerInfo[playerid][PlayerVehicle2ModSlot3];
							PlayerInfo[giveplayerid][PlayerVehicle4ModSlot4] = PlayerInfo[playerid][PlayerVehicle2ModSlot4];
							PlayerInfo[giveplayerid][PlayerVehicle4ModSlot5] = PlayerInfo[playerid][PlayerVehicle2ModSlot5];
							PlayerInfo[giveplayerid][PlayerVehicle4ModSlot6] = PlayerInfo[playerid][PlayerVehicle2ModSlot6];
							PlayerInfo[giveplayerid][PlayerVehicle4ModSlot7] = PlayerInfo[playerid][PlayerVehicle2ModSlot7];
							PlayerInfo[giveplayerid][PlayerVehicle4ModSlot8] = PlayerInfo[playerid][PlayerVehicle2ModSlot8];
							PlayerInfo[giveplayerid][PlayerVehicle4ModSlot9] = PlayerInfo[playerid][PlayerVehicle2ModSlot9];
							PlayerInfo[giveplayerid][PlayerVehicle4ModSlot10] = PlayerInfo[playerid][PlayerVehicle2ModSlot10];
							PlayerInfo[giveplayerid][PlayerVehicle4ModSlot11] = PlayerInfo[playerid][PlayerVehicle2ModSlot11];
							PlayerInfo[giveplayerid][PlayerVehicle4ModSlot12] = PlayerInfo[playerid][PlayerVehicle2ModSlot12];
							PlayerInfo[giveplayerid][PlayerVehicle4ModSlot13] = PlayerInfo[playerid][PlayerVehicle2ModSlot13];
							PlayerInfo[giveplayerid][PlayerVehicle4ModNeon] = PlayerInfo[playerid][PlayerVehicle2ModNeon];
							PlayerInfo[giveplayerid][PlayerVehicle4Upgraded] = PlayerInfo[playerid][PlayerVehicle2Upgraded];
							PlayerInfo[giveplayerid][PlayerVehicle4Trunk] = PlayerInfo[playerid][PlayerVehicle2Trunk];
							PlayerInfo[giveplayerid][PlayerVehicle4Trunk2] = PlayerInfo[playerid][PlayerVehicle2Trunk2];
							PlayerInfo[giveplayerid][PlayerVehicle4Trunk3] = PlayerInfo[playerid][PlayerVehicle2Trunk3];
							PlayerInfo[giveplayerid][PlayerVehicle4Trunk4] = PlayerInfo[playerid][PlayerVehicle2Trunk4];
							PlayerInfo[giveplayerid][PlayerVehicle4Trunk5] = PlayerInfo[playerid][PlayerVehicle2Trunk5];
							PlayerInfo[giveplayerid][PlayerVehicle4Health] = PlayerInfo[playerid][PlayerVehicle2Health];
							PlayerInfo[giveplayerid][PlayerVehicle4Goods] = PlayerInfo[playerid][PlayerVehicle2Goods];
							PlayerInfo[giveplayerid][PlayerVehicle4Fuel] = PlayerInfo[playerid][PlayerVehicle2Fuel];
							strmid(PlayerInfo[giveplayerid][PlayerVehicle4Plate], PlayerInfo[playerid][PlayerVehicle2Plate], 0, strlen(PlayerInfo[playerid][PlayerVehicle2Plate]), 255);
	                    }
	                    case 5:
					    {
							PlayerInfo[giveplayerid][PlayerVehicleModel5] = PlayerInfo[playerid][PlayerVehicleModel2];
							PlayerInfo[giveplayerid][pVehLock5] = PlayerInfo[playerid][pVehLock2];
							PlayerInfo[giveplayerid][pVehLocked5] = PlayerInfo[playerid][pVehLocked2];
							PlayerInfo[giveplayerid][pPlayerVehicle5Color] = PlayerInfo[playerid][pPlayerVehicle2Color];
				            PlayerInfo[giveplayerid][pPlayerVehicle5Color2] = PlayerInfo[playerid][pPlayerVehicle2Color2];
							PlayerInfo[giveplayerid][PlayerVehiclePosX5] = PlayerInfo[playerid][PlayerVehiclePosX2];
			   				PlayerInfo[giveplayerid][PlayerVehiclePosY5] = PlayerInfo[playerid][PlayerVehiclePosY2];
			   				PlayerInfo[giveplayerid][PlayerVehiclePosZ5] = PlayerInfo[playerid][PlayerVehiclePosZ2];
							PlayerInfo[giveplayerid][PlayerVehicleFacing5] = PlayerInfo[playerid][PlayerVehicleFacing2];
							PlayerInfo[giveplayerid][PlayerVehicle5PaintJob] = PlayerInfo[playerid][PlayerVehicle2PaintJob];
							PlayerInfo[giveplayerid][PlayerVehicle5ModSlot0] = PlayerInfo[playerid][PlayerVehicle2ModSlot0];
							PlayerInfo[giveplayerid][PlayerVehicle5ModSlot1] = PlayerInfo[playerid][PlayerVehicle2ModSlot1];
							PlayerInfo[giveplayerid][PlayerVehicle5ModSlot2] = PlayerInfo[playerid][PlayerVehicle2ModSlot2];
							PlayerInfo[giveplayerid][PlayerVehicle5ModSlot3] = PlayerInfo[playerid][PlayerVehicle2ModSlot3];
							PlayerInfo[giveplayerid][PlayerVehicle5ModSlot4] = PlayerInfo[playerid][PlayerVehicle2ModSlot4];
							PlayerInfo[giveplayerid][PlayerVehicle5ModSlot5] = PlayerInfo[playerid][PlayerVehicle2ModSlot5];
							PlayerInfo[giveplayerid][PlayerVehicle5ModSlot6] = PlayerInfo[playerid][PlayerVehicle2ModSlot6];
							PlayerInfo[giveplayerid][PlayerVehicle5ModSlot7] = PlayerInfo[playerid][PlayerVehicle2ModSlot7];
							PlayerInfo[giveplayerid][PlayerVehicle5ModSlot8] = PlayerInfo[playerid][PlayerVehicle2ModSlot8];
							PlayerInfo[giveplayerid][PlayerVehicle5ModSlot9] = PlayerInfo[playerid][PlayerVehicle2ModSlot9];
							PlayerInfo[giveplayerid][PlayerVehicle5ModSlot10] = PlayerInfo[playerid][PlayerVehicle2ModSlot10];
							PlayerInfo[giveplayerid][PlayerVehicle5ModSlot11] = PlayerInfo[playerid][PlayerVehicle2ModSlot11];
							PlayerInfo[giveplayerid][PlayerVehicle5ModSlot12] = PlayerInfo[playerid][PlayerVehicle2ModSlot12];
							PlayerInfo[giveplayerid][PlayerVehicle5ModSlot13] = PlayerInfo[playerid][PlayerVehicle2ModSlot13];
							PlayerInfo[giveplayerid][PlayerVehicle5ModNeon] = PlayerInfo[playerid][PlayerVehicle2ModNeon];
							PlayerInfo[giveplayerid][PlayerVehicle5Upgraded] = PlayerInfo[playerid][PlayerVehicle2Upgraded];
							PlayerInfo[giveplayerid][PlayerVehicle5Trunk] = PlayerInfo[playerid][PlayerVehicle2Trunk];
							PlayerInfo[giveplayerid][PlayerVehicle5Trunk2] = PlayerInfo[playerid][PlayerVehicle2Trunk2];
							PlayerInfo[giveplayerid][PlayerVehicle5Trunk3] = PlayerInfo[playerid][PlayerVehicle2Trunk3];
							PlayerInfo[giveplayerid][PlayerVehicle5Trunk4] = PlayerInfo[playerid][PlayerVehicle2Trunk4];
							PlayerInfo[giveplayerid][PlayerVehicle5Trunk5] = PlayerInfo[playerid][PlayerVehicle2Trunk5];
							PlayerInfo[giveplayerid][PlayerVehicle5Health] = PlayerInfo[playerid][PlayerVehicle2Health];
							PlayerInfo[giveplayerid][PlayerVehicle5Goods] = PlayerInfo[playerid][PlayerVehicle2Goods];
							PlayerInfo[giveplayerid][PlayerVehicle5Fuel] = PlayerInfo[playerid][PlayerVehicle2Fuel];
							strmid(PlayerInfo[giveplayerid][PlayerVehicle5Plate], PlayerInfo[playerid][PlayerVehicle2Plate], 0, strlen(PlayerInfo[playerid][PlayerVehicle2Plate]), 255);
						}
					}
			    }
			    case 3:
			    {
					switch(vehslotid)
					{
						case 1:
					    {
							PlayerInfo[giveplayerid][PlayerVehicleModel1] = PlayerInfo[playerid][PlayerVehicleModel3];
							PlayerInfo[giveplayerid][pVehLock1] = PlayerInfo[playerid][pVehLock3];
							PlayerInfo[giveplayerid][pVehLocked1] = PlayerInfo[playerid][pVehLocked3];
							PlayerInfo[giveplayerid][pPlayerVehicle1Color] = PlayerInfo[playerid][pPlayerVehicle3Color];
				            PlayerInfo[giveplayerid][pPlayerVehicle1Color2] = PlayerInfo[playerid][pPlayerVehicle3Color2];
							PlayerInfo[giveplayerid][PlayerVehiclePosX1] = PlayerInfo[playerid][PlayerVehiclePosX3];
			   				PlayerInfo[giveplayerid][PlayerVehiclePosY1] = PlayerInfo[playerid][PlayerVehiclePosY3];
			   				PlayerInfo[giveplayerid][PlayerVehiclePosZ1] = PlayerInfo[playerid][PlayerVehiclePosZ3];
							PlayerInfo[giveplayerid][PlayerVehicleFacing1] = PlayerInfo[playerid][PlayerVehicleFacing3];
							PlayerInfo[giveplayerid][PlayerVehicle1PaintJob] = PlayerInfo[playerid][PlayerVehicle3PaintJob];
							PlayerInfo[giveplayerid][PlayerVehicle1ModSlot0] = PlayerInfo[playerid][PlayerVehicle3ModSlot0];
							PlayerInfo[giveplayerid][PlayerVehicle1ModSlot1] = PlayerInfo[playerid][PlayerVehicle3ModSlot1];
							PlayerInfo[giveplayerid][PlayerVehicle1ModSlot2] = PlayerInfo[playerid][PlayerVehicle3ModSlot2];
							PlayerInfo[giveplayerid][PlayerVehicle1ModSlot3] = PlayerInfo[playerid][PlayerVehicle3ModSlot3];
							PlayerInfo[giveplayerid][PlayerVehicle1ModSlot4] = PlayerInfo[playerid][PlayerVehicle3ModSlot4];
							PlayerInfo[giveplayerid][PlayerVehicle1ModSlot5] = PlayerInfo[playerid][PlayerVehicle3ModSlot5];
							PlayerInfo[giveplayerid][PlayerVehicle1ModSlot6] = PlayerInfo[playerid][PlayerVehicle3ModSlot6];
							PlayerInfo[giveplayerid][PlayerVehicle1ModSlot7] = PlayerInfo[playerid][PlayerVehicle3ModSlot7];
							PlayerInfo[giveplayerid][PlayerVehicle1ModSlot8] = PlayerInfo[playerid][PlayerVehicle3ModSlot8];
							PlayerInfo[giveplayerid][PlayerVehicle1ModSlot9] = PlayerInfo[playerid][PlayerVehicle3ModSlot9];
							PlayerInfo[giveplayerid][PlayerVehicle1ModSlot10] = PlayerInfo[playerid][PlayerVehicle3ModSlot10];
							PlayerInfo[giveplayerid][PlayerVehicle1ModSlot11] = PlayerInfo[playerid][PlayerVehicle3ModSlot11];
							PlayerInfo[giveplayerid][PlayerVehicle1ModSlot12] = PlayerInfo[playerid][PlayerVehicle3ModSlot12];
							PlayerInfo[giveplayerid][PlayerVehicle1ModSlot13] = PlayerInfo[playerid][PlayerVehicle3ModSlot13];
							PlayerInfo[giveplayerid][PlayerVehicle1ModNeon] = PlayerInfo[playerid][PlayerVehicle3ModNeon];
							PlayerInfo[giveplayerid][PlayerVehicle1Upgraded] = PlayerInfo[playerid][PlayerVehicle3Upgraded];
							PlayerInfo[giveplayerid][PlayerVehicle1Trunk] = PlayerInfo[playerid][PlayerVehicle3Trunk];
							PlayerInfo[giveplayerid][PlayerVehicle1Trunk2] = PlayerInfo[playerid][PlayerVehicle3Trunk2];
							PlayerInfo[giveplayerid][PlayerVehicle1Trunk3] = PlayerInfo[playerid][PlayerVehicle3Trunk3];
							PlayerInfo[giveplayerid][PlayerVehicle1Trunk4] = PlayerInfo[playerid][PlayerVehicle3Trunk4];
							PlayerInfo[giveplayerid][PlayerVehicle1Trunk5] = PlayerInfo[playerid][PlayerVehicle3Trunk5];
							PlayerInfo[giveplayerid][PlayerVehicle1Health] = PlayerInfo[playerid][PlayerVehicle3Health];
							PlayerInfo[giveplayerid][PlayerVehicle1Goods] = PlayerInfo[playerid][PlayerVehicle3Goods];
							PlayerInfo[giveplayerid][PlayerVehicle1Fuel] = PlayerInfo[playerid][PlayerVehicle3Fuel];
							strmid(PlayerInfo[giveplayerid][PlayerVehicle1Plate], PlayerInfo[playerid][PlayerVehicle3Plate], 0, strlen(PlayerInfo[playerid][PlayerVehicle3Plate]), 255);
	                    }
	                    case 2:
					    {
							PlayerInfo[giveplayerid][PlayerVehicleModel2] = PlayerInfo[playerid][PlayerVehicleModel3];
							PlayerInfo[giveplayerid][pVehLock2] = PlayerInfo[playerid][pVehLock3];
							PlayerInfo[giveplayerid][pVehLocked2] = PlayerInfo[playerid][pVehLocked3];
							PlayerInfo[giveplayerid][pPlayerVehicle2Color] = PlayerInfo[playerid][pPlayerVehicle3Color];
				            PlayerInfo[giveplayerid][pPlayerVehicle2Color2] = PlayerInfo[playerid][pPlayerVehicle3Color2];
							PlayerInfo[giveplayerid][PlayerVehiclePosX2] = PlayerInfo[playerid][PlayerVehiclePosX3];
			   				PlayerInfo[giveplayerid][PlayerVehiclePosY2] = PlayerInfo[playerid][PlayerVehiclePosY3];
			   				PlayerInfo[giveplayerid][PlayerVehiclePosZ2] = PlayerInfo[playerid][PlayerVehiclePosZ3];
							PlayerInfo[giveplayerid][PlayerVehicleFacing2] = PlayerInfo[playerid][PlayerVehicleFacing3];
							PlayerInfo[giveplayerid][PlayerVehicle2PaintJob] = PlayerInfo[playerid][PlayerVehicle3PaintJob];
							PlayerInfo[giveplayerid][PlayerVehicle2ModSlot0] = PlayerInfo[playerid][PlayerVehicle3ModSlot0];
							PlayerInfo[giveplayerid][PlayerVehicle2ModSlot1] = PlayerInfo[playerid][PlayerVehicle3ModSlot1];
							PlayerInfo[giveplayerid][PlayerVehicle2ModSlot2] = PlayerInfo[playerid][PlayerVehicle3ModSlot2];
							PlayerInfo[giveplayerid][PlayerVehicle2ModSlot3] = PlayerInfo[playerid][PlayerVehicle3ModSlot3];
							PlayerInfo[giveplayerid][PlayerVehicle2ModSlot4] = PlayerInfo[playerid][PlayerVehicle3ModSlot4];
							PlayerInfo[giveplayerid][PlayerVehicle2ModSlot5] = PlayerInfo[playerid][PlayerVehicle3ModSlot5];
							PlayerInfo[giveplayerid][PlayerVehicle2ModSlot6] = PlayerInfo[playerid][PlayerVehicle3ModSlot6];
							PlayerInfo[giveplayerid][PlayerVehicle2ModSlot7] = PlayerInfo[playerid][PlayerVehicle3ModSlot7];
							PlayerInfo[giveplayerid][PlayerVehicle2ModSlot8] = PlayerInfo[playerid][PlayerVehicle3ModSlot8];
							PlayerInfo[giveplayerid][PlayerVehicle2ModSlot9] = PlayerInfo[playerid][PlayerVehicle3ModSlot9];
							PlayerInfo[giveplayerid][PlayerVehicle2ModSlot10] = PlayerInfo[playerid][PlayerVehicle3ModSlot10];
							PlayerInfo[giveplayerid][PlayerVehicle2ModSlot11] = PlayerInfo[playerid][PlayerVehicle3ModSlot11];
							PlayerInfo[giveplayerid][PlayerVehicle2ModSlot12] = PlayerInfo[playerid][PlayerVehicle3ModSlot12];
							PlayerInfo[giveplayerid][PlayerVehicle2ModSlot13] = PlayerInfo[playerid][PlayerVehicle3ModSlot13];
							PlayerInfo[giveplayerid][PlayerVehicle2ModNeon] = PlayerInfo[playerid][PlayerVehicle3ModNeon];
							PlayerInfo[giveplayerid][PlayerVehicle2Upgraded] = PlayerInfo[playerid][PlayerVehicle3Upgraded];
							PlayerInfo[giveplayerid][PlayerVehicle2Trunk] = PlayerInfo[playerid][PlayerVehicle3Trunk];
							PlayerInfo[giveplayerid][PlayerVehicle2Trunk2] = PlayerInfo[playerid][PlayerVehicle3Trunk2];
							PlayerInfo[giveplayerid][PlayerVehicle2Trunk3] = PlayerInfo[playerid][PlayerVehicle3Trunk3];
							PlayerInfo[giveplayerid][PlayerVehicle2Trunk4] = PlayerInfo[playerid][PlayerVehicle3Trunk4];
							PlayerInfo[giveplayerid][PlayerVehicle2Trunk5] = PlayerInfo[playerid][PlayerVehicle3Trunk5];
							PlayerInfo[giveplayerid][PlayerVehicle2Health] = PlayerInfo[playerid][PlayerVehicle3Health];
							PlayerInfo[giveplayerid][PlayerVehicle2Goods] = PlayerInfo[playerid][PlayerVehicle3Goods];
							PlayerInfo[giveplayerid][PlayerVehicle2Fuel] = PlayerInfo[playerid][PlayerVehicle3Fuel];
							strmid(PlayerInfo[giveplayerid][PlayerVehicle2Plate], PlayerInfo[playerid][PlayerVehicle3Plate], 0, strlen(PlayerInfo[playerid][PlayerVehicle3Plate]), 255);
	                    }
	                    case 3:
					    {
							PlayerInfo[giveplayerid][PlayerVehicleModel3] = PlayerInfo[playerid][PlayerVehicleModel3];
							PlayerInfo[giveplayerid][pVehLock3] = PlayerInfo[playerid][pVehLock3];
							PlayerInfo[giveplayerid][pVehLocked3] = PlayerInfo[playerid][pVehLocked3];
							PlayerInfo[giveplayerid][pPlayerVehicle3Color] = PlayerInfo[playerid][pPlayerVehicle3Color];
				            PlayerInfo[giveplayerid][pPlayerVehicle3Color2] = PlayerInfo[playerid][pPlayerVehicle3Color2];
							PlayerInfo[giveplayerid][PlayerVehiclePosX3] = PlayerInfo[playerid][PlayerVehiclePosX3];
			   				PlayerInfo[giveplayerid][PlayerVehiclePosY3] = PlayerInfo[playerid][PlayerVehiclePosY3];
			   				PlayerInfo[giveplayerid][PlayerVehiclePosZ3] = PlayerInfo[playerid][PlayerVehiclePosZ3];
							PlayerInfo[giveplayerid][PlayerVehicleFacing3] = PlayerInfo[playerid][PlayerVehicleFacing3];
							PlayerInfo[giveplayerid][PlayerVehicle3PaintJob] = PlayerInfo[playerid][PlayerVehicle3PaintJob];
							PlayerInfo[giveplayerid][PlayerVehicle3ModSlot0] = PlayerInfo[playerid][PlayerVehicle3ModSlot0];
							PlayerInfo[giveplayerid][PlayerVehicle3ModSlot1] = PlayerInfo[playerid][PlayerVehicle3ModSlot1];
							PlayerInfo[giveplayerid][PlayerVehicle3ModSlot2] = PlayerInfo[playerid][PlayerVehicle3ModSlot2];
							PlayerInfo[giveplayerid][PlayerVehicle3ModSlot3] = PlayerInfo[playerid][PlayerVehicle3ModSlot3];
							PlayerInfo[giveplayerid][PlayerVehicle3ModSlot4] = PlayerInfo[playerid][PlayerVehicle3ModSlot4];
							PlayerInfo[giveplayerid][PlayerVehicle3ModSlot5] = PlayerInfo[playerid][PlayerVehicle3ModSlot5];
							PlayerInfo[giveplayerid][PlayerVehicle3ModSlot6] = PlayerInfo[playerid][PlayerVehicle3ModSlot6];
							PlayerInfo[giveplayerid][PlayerVehicle3ModSlot7] = PlayerInfo[playerid][PlayerVehicle3ModSlot7];
							PlayerInfo[giveplayerid][PlayerVehicle3ModSlot8] = PlayerInfo[playerid][PlayerVehicle3ModSlot8];
							PlayerInfo[giveplayerid][PlayerVehicle3ModSlot9] = PlayerInfo[playerid][PlayerVehicle3ModSlot9];
							PlayerInfo[giveplayerid][PlayerVehicle3ModSlot10] = PlayerInfo[playerid][PlayerVehicle3ModSlot10];
							PlayerInfo[giveplayerid][PlayerVehicle3ModSlot11] = PlayerInfo[playerid][PlayerVehicle3ModSlot11];
							PlayerInfo[giveplayerid][PlayerVehicle3ModSlot12] = PlayerInfo[playerid][PlayerVehicle3ModSlot12];
							PlayerInfo[giveplayerid][PlayerVehicle3ModSlot13] = PlayerInfo[playerid][PlayerVehicle3ModSlot13];
							PlayerInfo[giveplayerid][PlayerVehicle3ModNeon] = PlayerInfo[playerid][PlayerVehicle3ModNeon];
							PlayerInfo[giveplayerid][PlayerVehicle3Upgraded] = PlayerInfo[playerid][PlayerVehicle3Upgraded];
							PlayerInfo[giveplayerid][PlayerVehicle3Trunk] = PlayerInfo[playerid][PlayerVehicle3Trunk];
							PlayerInfo[giveplayerid][PlayerVehicle3Trunk2] = PlayerInfo[playerid][PlayerVehicle3Trunk2];
							PlayerInfo[giveplayerid][PlayerVehicle3Trunk3] = PlayerInfo[playerid][PlayerVehicle3Trunk3];
							PlayerInfo[giveplayerid][PlayerVehicle3Trunk4] = PlayerInfo[playerid][PlayerVehicle3Trunk4];
							PlayerInfo[giveplayerid][PlayerVehicle3Trunk5] = PlayerInfo[playerid][PlayerVehicle3Trunk5];
							PlayerInfo[giveplayerid][PlayerVehicle3Health] = PlayerInfo[playerid][PlayerVehicle3Health];
							PlayerInfo[giveplayerid][PlayerVehicle3Goods] = PlayerInfo[playerid][PlayerVehicle3Goods];
							PlayerInfo[giveplayerid][PlayerVehicle3Fuel] = PlayerInfo[playerid][PlayerVehicle3Fuel];
							strmid(PlayerInfo[giveplayerid][PlayerVehicle3Plate], PlayerInfo[playerid][PlayerVehicle3Plate], 0, strlen(PlayerInfo[playerid][PlayerVehicle3Plate]), 255);
	                    }
	                    case 4:
					    {
							PlayerInfo[giveplayerid][PlayerVehicleModel4] = PlayerInfo[playerid][PlayerVehicleModel3];
							PlayerInfo[giveplayerid][pVehLock4] = PlayerInfo[playerid][pVehLock3];
							PlayerInfo[giveplayerid][pVehLocked4] = PlayerInfo[playerid][pVehLocked3];
							PlayerInfo[giveplayerid][pPlayerVehicle4Color] = PlayerInfo[playerid][pPlayerVehicle3Color];
				            PlayerInfo[giveplayerid][pPlayerVehicle4Color2] = PlayerInfo[playerid][pPlayerVehicle3Color2];
							PlayerInfo[giveplayerid][PlayerVehiclePosX4] = PlayerInfo[playerid][PlayerVehiclePosX3];
			   				PlayerInfo[giveplayerid][PlayerVehiclePosY4] = PlayerInfo[playerid][PlayerVehiclePosY3];
			   				PlayerInfo[giveplayerid][PlayerVehiclePosZ4] = PlayerInfo[playerid][PlayerVehiclePosZ3];
							PlayerInfo[giveplayerid][PlayerVehicleFacing4] = PlayerInfo[playerid][PlayerVehicleFacing3];
							PlayerInfo[giveplayerid][PlayerVehicle4PaintJob] = PlayerInfo[playerid][PlayerVehicle3PaintJob];
							PlayerInfo[giveplayerid][PlayerVehicle4ModSlot0] = PlayerInfo[playerid][PlayerVehicle3ModSlot0];
							PlayerInfo[giveplayerid][PlayerVehicle4ModSlot1] = PlayerInfo[playerid][PlayerVehicle3ModSlot1];
							PlayerInfo[giveplayerid][PlayerVehicle4ModSlot2] = PlayerInfo[playerid][PlayerVehicle3ModSlot2];
							PlayerInfo[giveplayerid][PlayerVehicle4ModSlot3] = PlayerInfo[playerid][PlayerVehicle3ModSlot3];
							PlayerInfo[giveplayerid][PlayerVehicle4ModSlot4] = PlayerInfo[playerid][PlayerVehicle3ModSlot4];
							PlayerInfo[giveplayerid][PlayerVehicle4ModSlot5] = PlayerInfo[playerid][PlayerVehicle3ModSlot5];
							PlayerInfo[giveplayerid][PlayerVehicle4ModSlot6] = PlayerInfo[playerid][PlayerVehicle3ModSlot6];
							PlayerInfo[giveplayerid][PlayerVehicle4ModSlot7] = PlayerInfo[playerid][PlayerVehicle3ModSlot7];
							PlayerInfo[giveplayerid][PlayerVehicle4ModSlot8] = PlayerInfo[playerid][PlayerVehicle3ModSlot8];
							PlayerInfo[giveplayerid][PlayerVehicle4ModSlot9] = PlayerInfo[playerid][PlayerVehicle3ModSlot9];
							PlayerInfo[giveplayerid][PlayerVehicle4ModSlot10] = PlayerInfo[playerid][PlayerVehicle3ModSlot10];
							PlayerInfo[giveplayerid][PlayerVehicle4ModSlot11] = PlayerInfo[playerid][PlayerVehicle3ModSlot11];
							PlayerInfo[giveplayerid][PlayerVehicle4ModSlot12] = PlayerInfo[playerid][PlayerVehicle3ModSlot12];
							PlayerInfo[giveplayerid][PlayerVehicle4ModSlot13] = PlayerInfo[playerid][PlayerVehicle3ModSlot13];
							PlayerInfo[giveplayerid][PlayerVehicle4ModNeon] = PlayerInfo[playerid][PlayerVehicle3ModNeon];
							PlayerInfo[giveplayerid][PlayerVehicle4Upgraded] = PlayerInfo[playerid][PlayerVehicle3Upgraded];
							PlayerInfo[giveplayerid][PlayerVehicle4Trunk] = PlayerInfo[playerid][PlayerVehicle3Trunk];
							PlayerInfo[giveplayerid][PlayerVehicle4Trunk2] = PlayerInfo[playerid][PlayerVehicle3Trunk2];
							PlayerInfo[giveplayerid][PlayerVehicle4Trunk3] = PlayerInfo[playerid][PlayerVehicle3Trunk3];
							PlayerInfo[giveplayerid][PlayerVehicle4Trunk4] = PlayerInfo[playerid][PlayerVehicle3Trunk4];
							PlayerInfo[giveplayerid][PlayerVehicle4Trunk5] = PlayerInfo[playerid][PlayerVehicle3Trunk5];
							PlayerInfo[giveplayerid][PlayerVehicle4Health] = PlayerInfo[playerid][PlayerVehicle3Health];
							PlayerInfo[giveplayerid][PlayerVehicle4Goods] = PlayerInfo[playerid][PlayerVehicle3Goods];
							PlayerInfo[giveplayerid][PlayerVehicle4Fuel] = PlayerInfo[playerid][PlayerVehicle3Fuel];
							strmid(PlayerInfo[giveplayerid][PlayerVehicle4Plate], PlayerInfo[playerid][PlayerVehicle3Plate], 0, strlen(PlayerInfo[playerid][PlayerVehicle3Plate]), 255);
	                    }
	                    case 5:
					    {
							PlayerInfo[giveplayerid][PlayerVehicleModel5] = PlayerInfo[playerid][PlayerVehicleModel3];
							PlayerInfo[giveplayerid][pVehLock5] = PlayerInfo[playerid][pVehLock3];
							PlayerInfo[giveplayerid][pVehLocked5] = PlayerInfo[playerid][pVehLocked3];
							PlayerInfo[giveplayerid][pPlayerVehicle5Color] = PlayerInfo[playerid][pPlayerVehicle3Color];
				            PlayerInfo[giveplayerid][pPlayerVehicle5Color2] = PlayerInfo[playerid][pPlayerVehicle3Color2];
							PlayerInfo[giveplayerid][PlayerVehiclePosX5] = PlayerInfo[playerid][PlayerVehiclePosX3];
			   				PlayerInfo[giveplayerid][PlayerVehiclePosY5] = PlayerInfo[playerid][PlayerVehiclePosY3];
			   				PlayerInfo[giveplayerid][PlayerVehiclePosZ5] = PlayerInfo[playerid][PlayerVehiclePosZ3];
							PlayerInfo[giveplayerid][PlayerVehicleFacing5] = PlayerInfo[playerid][PlayerVehicleFacing3];
							PlayerInfo[giveplayerid][PlayerVehicle5PaintJob] = PlayerInfo[playerid][PlayerVehicle3PaintJob];
							PlayerInfo[giveplayerid][PlayerVehicle5ModSlot0] = PlayerInfo[playerid][PlayerVehicle3ModSlot0];
							PlayerInfo[giveplayerid][PlayerVehicle5ModSlot1] = PlayerInfo[playerid][PlayerVehicle3ModSlot1];
							PlayerInfo[giveplayerid][PlayerVehicle5ModSlot2] = PlayerInfo[playerid][PlayerVehicle3ModSlot2];
							PlayerInfo[giveplayerid][PlayerVehicle5ModSlot3] = PlayerInfo[playerid][PlayerVehicle3ModSlot3];
							PlayerInfo[giveplayerid][PlayerVehicle5ModSlot4] = PlayerInfo[playerid][PlayerVehicle3ModSlot4];
							PlayerInfo[giveplayerid][PlayerVehicle5ModSlot5] = PlayerInfo[playerid][PlayerVehicle3ModSlot5];
							PlayerInfo[giveplayerid][PlayerVehicle5ModSlot6] = PlayerInfo[playerid][PlayerVehicle3ModSlot6];
							PlayerInfo[giveplayerid][PlayerVehicle5ModSlot7] = PlayerInfo[playerid][PlayerVehicle3ModSlot7];
							PlayerInfo[giveplayerid][PlayerVehicle5ModSlot8] = PlayerInfo[playerid][PlayerVehicle3ModSlot8];
							PlayerInfo[giveplayerid][PlayerVehicle5ModSlot9] = PlayerInfo[playerid][PlayerVehicle3ModSlot9];
							PlayerInfo[giveplayerid][PlayerVehicle5ModSlot10] = PlayerInfo[playerid][PlayerVehicle3ModSlot10];
							PlayerInfo[giveplayerid][PlayerVehicle5ModSlot11] = PlayerInfo[playerid][PlayerVehicle3ModSlot11];
							PlayerInfo[giveplayerid][PlayerVehicle5ModSlot12] = PlayerInfo[playerid][PlayerVehicle3ModSlot12];
							PlayerInfo[giveplayerid][PlayerVehicle5ModSlot13] = PlayerInfo[playerid][PlayerVehicle3ModSlot13];
							PlayerInfo[giveplayerid][PlayerVehicle5ModNeon] = PlayerInfo[playerid][PlayerVehicle3ModNeon];
							PlayerInfo[giveplayerid][PlayerVehicle5Upgraded] = PlayerInfo[playerid][PlayerVehicle3Upgraded];
							PlayerInfo[giveplayerid][PlayerVehicle5Trunk] = PlayerInfo[playerid][PlayerVehicle3Trunk];
							PlayerInfo[giveplayerid][PlayerVehicle5Trunk2] = PlayerInfo[playerid][PlayerVehicle3Trunk2];
							PlayerInfo[giveplayerid][PlayerVehicle5Trunk3] = PlayerInfo[playerid][PlayerVehicle3Trunk3];
							PlayerInfo[giveplayerid][PlayerVehicle5Trunk4] = PlayerInfo[playerid][PlayerVehicle3Trunk4];
							PlayerInfo[giveplayerid][PlayerVehicle5Trunk5] = PlayerInfo[playerid][PlayerVehicle3Trunk5];
							PlayerInfo[giveplayerid][PlayerVehicle5Health] = PlayerInfo[playerid][PlayerVehicle3Health];
							PlayerInfo[giveplayerid][PlayerVehicle5Goods] = PlayerInfo[playerid][PlayerVehicle3Goods];
							PlayerInfo[giveplayerid][PlayerVehicle5Fuel] = PlayerInfo[playerid][PlayerVehicle3Fuel];
							strmid(PlayerInfo[giveplayerid][PlayerVehicle5Plate], PlayerInfo[playerid][PlayerVehicle3Plate], 0, strlen(PlayerInfo[playerid][PlayerVehicle3Plate]), 255);
						}
					}
			    }
			    case 4:
			    {
					switch(vehslotid)
					{
						case 1:
					    {
							PlayerInfo[giveplayerid][PlayerVehicleModel1] = PlayerInfo[playerid][PlayerVehicleModel4];
							PlayerInfo[giveplayerid][pVehLock1] = PlayerInfo[playerid][pVehLock4];
							PlayerInfo[giveplayerid][pVehLocked1] = PlayerInfo[playerid][pVehLocked4];
							PlayerInfo[giveplayerid][pPlayerVehicle1Color] = PlayerInfo[playerid][pPlayerVehicle4Color];
				            PlayerInfo[giveplayerid][pPlayerVehicle1Color2] = PlayerInfo[playerid][pPlayerVehicle4Color2];
							PlayerInfo[giveplayerid][PlayerVehiclePosX1] = PlayerInfo[playerid][PlayerVehiclePosX4];
			   				PlayerInfo[giveplayerid][PlayerVehiclePosY1] = PlayerInfo[playerid][PlayerVehiclePosY4];
			   				PlayerInfo[giveplayerid][PlayerVehiclePosZ1] = PlayerInfo[playerid][PlayerVehiclePosZ4];
							PlayerInfo[giveplayerid][PlayerVehicleFacing1] = PlayerInfo[playerid][PlayerVehicleFacing4];
							PlayerInfo[giveplayerid][PlayerVehicle1PaintJob] = PlayerInfo[playerid][PlayerVehicle4PaintJob];
							PlayerInfo[giveplayerid][PlayerVehicle1ModSlot0] = PlayerInfo[playerid][PlayerVehicle4ModSlot0];
							PlayerInfo[giveplayerid][PlayerVehicle1ModSlot1] = PlayerInfo[playerid][PlayerVehicle4ModSlot1];
							PlayerInfo[giveplayerid][PlayerVehicle1ModSlot2] = PlayerInfo[playerid][PlayerVehicle4ModSlot2];
							PlayerInfo[giveplayerid][PlayerVehicle1ModSlot3] = PlayerInfo[playerid][PlayerVehicle4ModSlot3];
							PlayerInfo[giveplayerid][PlayerVehicle1ModSlot4] = PlayerInfo[playerid][PlayerVehicle4ModSlot4];
							PlayerInfo[giveplayerid][PlayerVehicle1ModSlot5] = PlayerInfo[playerid][PlayerVehicle4ModSlot5];
							PlayerInfo[giveplayerid][PlayerVehicle1ModSlot6] = PlayerInfo[playerid][PlayerVehicle4ModSlot6];
							PlayerInfo[giveplayerid][PlayerVehicle1ModSlot7] = PlayerInfo[playerid][PlayerVehicle4ModSlot7];
							PlayerInfo[giveplayerid][PlayerVehicle1ModSlot8] = PlayerInfo[playerid][PlayerVehicle4ModSlot8];
							PlayerInfo[giveplayerid][PlayerVehicle1ModSlot9] = PlayerInfo[playerid][PlayerVehicle4ModSlot9];
							PlayerInfo[giveplayerid][PlayerVehicle1ModSlot10] = PlayerInfo[playerid][PlayerVehicle4ModSlot10];
							PlayerInfo[giveplayerid][PlayerVehicle1ModSlot11] = PlayerInfo[playerid][PlayerVehicle4ModSlot11];
							PlayerInfo[giveplayerid][PlayerVehicle1ModSlot12] = PlayerInfo[playerid][PlayerVehicle4ModSlot12];
							PlayerInfo[giveplayerid][PlayerVehicle1ModSlot13] = PlayerInfo[playerid][PlayerVehicle4ModSlot13];
							PlayerInfo[giveplayerid][PlayerVehicle1ModNeon] = PlayerInfo[playerid][PlayerVehicle4ModNeon];
							PlayerInfo[giveplayerid][PlayerVehicle1Upgraded] = PlayerInfo[playerid][PlayerVehicle4Upgraded];
							PlayerInfo[giveplayerid][PlayerVehicle1Trunk] = PlayerInfo[playerid][PlayerVehicle4Trunk];
							PlayerInfo[giveplayerid][PlayerVehicle1Trunk2] = PlayerInfo[playerid][PlayerVehicle4Trunk2];
							PlayerInfo[giveplayerid][PlayerVehicle1Trunk3] = PlayerInfo[playerid][PlayerVehicle4Trunk3];
							PlayerInfo[giveplayerid][PlayerVehicle1Trunk4] = PlayerInfo[playerid][PlayerVehicle4Trunk4];
							PlayerInfo[giveplayerid][PlayerVehicle1Trunk5] = PlayerInfo[playerid][PlayerVehicle4Trunk5];
							PlayerInfo[giveplayerid][PlayerVehicle1Health] = PlayerInfo[playerid][PlayerVehicle4Health];
							PlayerInfo[giveplayerid][PlayerVehicle1Goods] = PlayerInfo[playerid][PlayerVehicle4Goods];
							PlayerInfo[giveplayerid][PlayerVehicle1Fuel] = PlayerInfo[playerid][PlayerVehicle4Fuel];
							strmid(PlayerInfo[giveplayerid][PlayerVehicle1Plate], PlayerInfo[playerid][PlayerVehicle4Plate], 0, strlen(PlayerInfo[playerid][PlayerVehicle4Plate]), 255);
	                    }
	                    case 2:
					    {
							PlayerInfo[giveplayerid][PlayerVehicleModel2] = PlayerInfo[playerid][PlayerVehicleModel4];
							PlayerInfo[giveplayerid][pVehLock2] = PlayerInfo[playerid][pVehLock4];
							PlayerInfo[giveplayerid][pVehLocked2] = PlayerInfo[playerid][pVehLocked4];
							PlayerInfo[giveplayerid][pPlayerVehicle2Color] = PlayerInfo[playerid][pPlayerVehicle4Color];
				            PlayerInfo[giveplayerid][pPlayerVehicle2Color2] = PlayerInfo[playerid][pPlayerVehicle4Color2];
							PlayerInfo[giveplayerid][PlayerVehiclePosX2] = PlayerInfo[playerid][PlayerVehiclePosX4];
			   				PlayerInfo[giveplayerid][PlayerVehiclePosY2] = PlayerInfo[playerid][PlayerVehiclePosY4];
			   				PlayerInfo[giveplayerid][PlayerVehiclePosZ2] = PlayerInfo[playerid][PlayerVehiclePosZ4];
							PlayerInfo[giveplayerid][PlayerVehicleFacing2] = PlayerInfo[playerid][PlayerVehicleFacing4];
							PlayerInfo[giveplayerid][PlayerVehicle2PaintJob] = PlayerInfo[playerid][PlayerVehicle4PaintJob];
							PlayerInfo[giveplayerid][PlayerVehicle2ModSlot0] = PlayerInfo[playerid][PlayerVehicle4ModSlot0];
							PlayerInfo[giveplayerid][PlayerVehicle2ModSlot1] = PlayerInfo[playerid][PlayerVehicle4ModSlot1];
							PlayerInfo[giveplayerid][PlayerVehicle2ModSlot2] = PlayerInfo[playerid][PlayerVehicle4ModSlot2];
							PlayerInfo[giveplayerid][PlayerVehicle2ModSlot3] = PlayerInfo[playerid][PlayerVehicle4ModSlot3];
							PlayerInfo[giveplayerid][PlayerVehicle2ModSlot4] = PlayerInfo[playerid][PlayerVehicle4ModSlot4];
							PlayerInfo[giveplayerid][PlayerVehicle2ModSlot5] = PlayerInfo[playerid][PlayerVehicle4ModSlot5];
							PlayerInfo[giveplayerid][PlayerVehicle2ModSlot6] = PlayerInfo[playerid][PlayerVehicle4ModSlot6];
							PlayerInfo[giveplayerid][PlayerVehicle2ModSlot7] = PlayerInfo[playerid][PlayerVehicle4ModSlot7];
							PlayerInfo[giveplayerid][PlayerVehicle2ModSlot8] = PlayerInfo[playerid][PlayerVehicle4ModSlot8];
							PlayerInfo[giveplayerid][PlayerVehicle2ModSlot9] = PlayerInfo[playerid][PlayerVehicle4ModSlot9];
							PlayerInfo[giveplayerid][PlayerVehicle2ModSlot10] = PlayerInfo[playerid][PlayerVehicle4ModSlot10];
							PlayerInfo[giveplayerid][PlayerVehicle2ModSlot11] = PlayerInfo[playerid][PlayerVehicle4ModSlot11];
							PlayerInfo[giveplayerid][PlayerVehicle2ModSlot12] = PlayerInfo[playerid][PlayerVehicle4ModSlot12];
							PlayerInfo[giveplayerid][PlayerVehicle2ModSlot13] = PlayerInfo[playerid][PlayerVehicle4ModSlot13];
							PlayerInfo[giveplayerid][PlayerVehicle2ModNeon] = PlayerInfo[playerid][PlayerVehicle4ModNeon];
							PlayerInfo[giveplayerid][PlayerVehicle2Upgraded] = PlayerInfo[playerid][PlayerVehicle4Upgraded];
							PlayerInfo[giveplayerid][PlayerVehicle2Trunk] = PlayerInfo[playerid][PlayerVehicle4Trunk];
							PlayerInfo[giveplayerid][PlayerVehicle2Trunk2] = PlayerInfo[playerid][PlayerVehicle4Trunk2];
							PlayerInfo[giveplayerid][PlayerVehicle2Trunk3] = PlayerInfo[playerid][PlayerVehicle4Trunk3];
							PlayerInfo[giveplayerid][PlayerVehicle2Trunk4] = PlayerInfo[playerid][PlayerVehicle4Trunk4];
							PlayerInfo[giveplayerid][PlayerVehicle2Trunk5] = PlayerInfo[playerid][PlayerVehicle4Trunk5];
							PlayerInfo[giveplayerid][PlayerVehicle2Health] = PlayerInfo[playerid][PlayerVehicle4Health];
							PlayerInfo[giveplayerid][PlayerVehicle2Goods] = PlayerInfo[playerid][PlayerVehicle4Goods];
							PlayerInfo[giveplayerid][PlayerVehicle2Fuel] = PlayerInfo[playerid][PlayerVehicle4Fuel];
							strmid(PlayerInfo[giveplayerid][PlayerVehicle2Plate], PlayerInfo[playerid][PlayerVehicle4Plate], 0, strlen(PlayerInfo[playerid][PlayerVehicle4Plate]), 255);
	                    }
	                    case 3:
					    {
							PlayerInfo[giveplayerid][PlayerVehicleModel3] = PlayerInfo[playerid][PlayerVehicleModel4];
							PlayerInfo[giveplayerid][pVehLock3] = PlayerInfo[playerid][pVehLock4];
							PlayerInfo[giveplayerid][pVehLocked3] = PlayerInfo[playerid][pVehLocked4];
							PlayerInfo[giveplayerid][pPlayerVehicle3Color] = PlayerInfo[playerid][pPlayerVehicle4Color];
				            PlayerInfo[giveplayerid][pPlayerVehicle3Color2] = PlayerInfo[playerid][pPlayerVehicle4Color2];
							PlayerInfo[giveplayerid][PlayerVehiclePosX3] = PlayerInfo[playerid][PlayerVehiclePosX4];
			   				PlayerInfo[giveplayerid][PlayerVehiclePosY3] = PlayerInfo[playerid][PlayerVehiclePosY4];
			   				PlayerInfo[giveplayerid][PlayerVehiclePosZ3] = PlayerInfo[playerid][PlayerVehiclePosZ4];
							PlayerInfo[giveplayerid][PlayerVehicleFacing3] = PlayerInfo[playerid][PlayerVehicleFacing4];
							PlayerInfo[giveplayerid][PlayerVehicle3PaintJob] = PlayerInfo[playerid][PlayerVehicle4PaintJob];
							PlayerInfo[giveplayerid][PlayerVehicle3ModSlot0] = PlayerInfo[playerid][PlayerVehicle4ModSlot0];
							PlayerInfo[giveplayerid][PlayerVehicle3ModSlot1] = PlayerInfo[playerid][PlayerVehicle4ModSlot1];
							PlayerInfo[giveplayerid][PlayerVehicle3ModSlot2] = PlayerInfo[playerid][PlayerVehicle4ModSlot2];
							PlayerInfo[giveplayerid][PlayerVehicle3ModSlot3] = PlayerInfo[playerid][PlayerVehicle4ModSlot3];
							PlayerInfo[giveplayerid][PlayerVehicle3ModSlot4] = PlayerInfo[playerid][PlayerVehicle4ModSlot4];
							PlayerInfo[giveplayerid][PlayerVehicle3ModSlot5] = PlayerInfo[playerid][PlayerVehicle4ModSlot5];
							PlayerInfo[giveplayerid][PlayerVehicle3ModSlot6] = PlayerInfo[playerid][PlayerVehicle4ModSlot6];
							PlayerInfo[giveplayerid][PlayerVehicle3ModSlot7] = PlayerInfo[playerid][PlayerVehicle4ModSlot7];
							PlayerInfo[giveplayerid][PlayerVehicle3ModSlot8] = PlayerInfo[playerid][PlayerVehicle4ModSlot8];
							PlayerInfo[giveplayerid][PlayerVehicle3ModSlot9] = PlayerInfo[playerid][PlayerVehicle4ModSlot9];
							PlayerInfo[giveplayerid][PlayerVehicle3ModSlot10] = PlayerInfo[playerid][PlayerVehicle4ModSlot10];
							PlayerInfo[giveplayerid][PlayerVehicle3ModSlot11] = PlayerInfo[playerid][PlayerVehicle4ModSlot11];
							PlayerInfo[giveplayerid][PlayerVehicle3ModSlot12] = PlayerInfo[playerid][PlayerVehicle4ModSlot12];
							PlayerInfo[giveplayerid][PlayerVehicle3ModSlot13] = PlayerInfo[playerid][PlayerVehicle4ModSlot13];
							PlayerInfo[giveplayerid][PlayerVehicle3ModNeon] = PlayerInfo[playerid][PlayerVehicle4ModNeon];
							PlayerInfo[giveplayerid][PlayerVehicle3Upgraded] = PlayerInfo[playerid][PlayerVehicle4Upgraded];
							PlayerInfo[giveplayerid][PlayerVehicle3Trunk] = PlayerInfo[playerid][PlayerVehicle4Trunk];
							PlayerInfo[giveplayerid][PlayerVehicle3Trunk2] = PlayerInfo[playerid][PlayerVehicle4Trunk2];
							PlayerInfo[giveplayerid][PlayerVehicle3Trunk3] = PlayerInfo[playerid][PlayerVehicle4Trunk3];
							PlayerInfo[giveplayerid][PlayerVehicle3Trunk4] = PlayerInfo[playerid][PlayerVehicle4Trunk4];
							PlayerInfo[giveplayerid][PlayerVehicle3Trunk5] = PlayerInfo[playerid][PlayerVehicle4Trunk5];
							PlayerInfo[giveplayerid][PlayerVehicle3Health] = PlayerInfo[playerid][PlayerVehicle4Health];
							PlayerInfo[giveplayerid][PlayerVehicle3Goods] = PlayerInfo[playerid][PlayerVehicle4Goods];
							PlayerInfo[giveplayerid][PlayerVehicle3Fuel] = PlayerInfo[playerid][PlayerVehicle4Fuel];
							strmid(PlayerInfo[giveplayerid][PlayerVehicle3Plate], PlayerInfo[playerid][PlayerVehicle4Plate], 0, strlen(PlayerInfo[playerid][PlayerVehicle4Plate]), 255);
	                    }
	                    case 4:
					    {
							PlayerInfo[giveplayerid][PlayerVehicleModel4] = PlayerInfo[playerid][PlayerVehicleModel4];
							PlayerInfo[giveplayerid][pVehLock4] = PlayerInfo[playerid][pVehLock4];
							PlayerInfo[giveplayerid][pVehLocked4] = PlayerInfo[playerid][pVehLocked4];
							PlayerInfo[giveplayerid][pPlayerVehicle4Color] = PlayerInfo[playerid][pPlayerVehicle4Color];
				            PlayerInfo[giveplayerid][pPlayerVehicle4Color2] = PlayerInfo[playerid][pPlayerVehicle4Color2];
							PlayerInfo[giveplayerid][PlayerVehiclePosX4] = PlayerInfo[playerid][PlayerVehiclePosX4];
			   				PlayerInfo[giveplayerid][PlayerVehiclePosY4] = PlayerInfo[playerid][PlayerVehiclePosY4];
			   				PlayerInfo[giveplayerid][PlayerVehiclePosZ4] = PlayerInfo[playerid][PlayerVehiclePosZ4];
							PlayerInfo[giveplayerid][PlayerVehicleFacing4] = PlayerInfo[playerid][PlayerVehicleFacing4];
							PlayerInfo[giveplayerid][PlayerVehicle4PaintJob] = PlayerInfo[playerid][PlayerVehicle4PaintJob];
							PlayerInfo[giveplayerid][PlayerVehicle4ModSlot0] = PlayerInfo[playerid][PlayerVehicle4ModSlot0];
							PlayerInfo[giveplayerid][PlayerVehicle4ModSlot1] = PlayerInfo[playerid][PlayerVehicle4ModSlot1];
							PlayerInfo[giveplayerid][PlayerVehicle4ModSlot2] = PlayerInfo[playerid][PlayerVehicle4ModSlot2];
							PlayerInfo[giveplayerid][PlayerVehicle4ModSlot3] = PlayerInfo[playerid][PlayerVehicle4ModSlot3];
							PlayerInfo[giveplayerid][PlayerVehicle4ModSlot4] = PlayerInfo[playerid][PlayerVehicle4ModSlot4];
							PlayerInfo[giveplayerid][PlayerVehicle4ModSlot5] = PlayerInfo[playerid][PlayerVehicle4ModSlot5];
							PlayerInfo[giveplayerid][PlayerVehicle4ModSlot6] = PlayerInfo[playerid][PlayerVehicle4ModSlot6];
							PlayerInfo[giveplayerid][PlayerVehicle4ModSlot7] = PlayerInfo[playerid][PlayerVehicle4ModSlot7];
							PlayerInfo[giveplayerid][PlayerVehicle4ModSlot8] = PlayerInfo[playerid][PlayerVehicle4ModSlot8];
							PlayerInfo[giveplayerid][PlayerVehicle4ModSlot9] = PlayerInfo[playerid][PlayerVehicle4ModSlot9];
							PlayerInfo[giveplayerid][PlayerVehicle4ModSlot10] = PlayerInfo[playerid][PlayerVehicle4ModSlot10];
							PlayerInfo[giveplayerid][PlayerVehicle4ModSlot11] = PlayerInfo[playerid][PlayerVehicle4ModSlot11];
							PlayerInfo[giveplayerid][PlayerVehicle4ModSlot12] = PlayerInfo[playerid][PlayerVehicle4ModSlot12];
							PlayerInfo[giveplayerid][PlayerVehicle4ModSlot13] = PlayerInfo[playerid][PlayerVehicle4ModSlot13];
							PlayerInfo[giveplayerid][PlayerVehicle4ModNeon] = PlayerInfo[playerid][PlayerVehicle4ModNeon];
							PlayerInfo[giveplayerid][PlayerVehicle4Upgraded] = PlayerInfo[playerid][PlayerVehicle4Upgraded];
							PlayerInfo[giveplayerid][PlayerVehicle4Trunk] = PlayerInfo[playerid][PlayerVehicle4Trunk];
							PlayerInfo[giveplayerid][PlayerVehicle4Trunk2] = PlayerInfo[playerid][PlayerVehicle4Trunk2];
							PlayerInfo[giveplayerid][PlayerVehicle4Trunk3] = PlayerInfo[playerid][PlayerVehicle4Trunk3];
							PlayerInfo[giveplayerid][PlayerVehicle4Trunk4] = PlayerInfo[playerid][PlayerVehicle4Trunk4];
							PlayerInfo[giveplayerid][PlayerVehicle4Trunk5] = PlayerInfo[playerid][PlayerVehicle4Trunk5];
							PlayerInfo[giveplayerid][PlayerVehicle4Health] = PlayerInfo[playerid][PlayerVehicle4Health];
							PlayerInfo[giveplayerid][PlayerVehicle4Goods] = PlayerInfo[playerid][PlayerVehicle4Goods];
							PlayerInfo[giveplayerid][PlayerVehicle4Fuel] = PlayerInfo[playerid][PlayerVehicle4Fuel];
							strmid(PlayerInfo[giveplayerid][PlayerVehicle4Plate], PlayerInfo[playerid][PlayerVehicle4Plate], 0, strlen(PlayerInfo[playerid][PlayerVehicle4Plate]), 255);
	                    }
	                    case 5:
					    {
							PlayerInfo[giveplayerid][PlayerVehicleModel5] = PlayerInfo[playerid][PlayerVehicleModel4];
							PlayerInfo[giveplayerid][pVehLock5] = PlayerInfo[playerid][pVehLock4];
							PlayerInfo[giveplayerid][pVehLocked5] = PlayerInfo[playerid][pVehLocked4];
							PlayerInfo[giveplayerid][pPlayerVehicle5Color] = PlayerInfo[playerid][pPlayerVehicle4Color];
				            PlayerInfo[giveplayerid][pPlayerVehicle5Color2] = PlayerInfo[playerid][pPlayerVehicle4Color2];
							PlayerInfo[giveplayerid][PlayerVehiclePosX5] = PlayerInfo[playerid][PlayerVehiclePosX4];
			   				PlayerInfo[giveplayerid][PlayerVehiclePosY5] = PlayerInfo[playerid][PlayerVehiclePosY4];
			   				PlayerInfo[giveplayerid][PlayerVehiclePosZ5] = PlayerInfo[playerid][PlayerVehiclePosZ4];
							PlayerInfo[giveplayerid][PlayerVehicleFacing5] = PlayerInfo[playerid][PlayerVehicleFacing4];
							PlayerInfo[giveplayerid][PlayerVehicle5PaintJob] = PlayerInfo[playerid][PlayerVehicle4PaintJob];
							PlayerInfo[giveplayerid][PlayerVehicle5ModSlot0] = PlayerInfo[playerid][PlayerVehicle4ModSlot0];
							PlayerInfo[giveplayerid][PlayerVehicle5ModSlot1] = PlayerInfo[playerid][PlayerVehicle4ModSlot1];
							PlayerInfo[giveplayerid][PlayerVehicle5ModSlot2] = PlayerInfo[playerid][PlayerVehicle4ModSlot2];
							PlayerInfo[giveplayerid][PlayerVehicle5ModSlot3] = PlayerInfo[playerid][PlayerVehicle4ModSlot3];
							PlayerInfo[giveplayerid][PlayerVehicle5ModSlot4] = PlayerInfo[playerid][PlayerVehicle4ModSlot4];
							PlayerInfo[giveplayerid][PlayerVehicle5ModSlot5] = PlayerInfo[playerid][PlayerVehicle4ModSlot5];
							PlayerInfo[giveplayerid][PlayerVehicle5ModSlot6] = PlayerInfo[playerid][PlayerVehicle4ModSlot6];
							PlayerInfo[giveplayerid][PlayerVehicle5ModSlot7] = PlayerInfo[playerid][PlayerVehicle4ModSlot7];
							PlayerInfo[giveplayerid][PlayerVehicle5ModSlot8] = PlayerInfo[playerid][PlayerVehicle4ModSlot8];
							PlayerInfo[giveplayerid][PlayerVehicle5ModSlot9] = PlayerInfo[playerid][PlayerVehicle4ModSlot9];
							PlayerInfo[giveplayerid][PlayerVehicle5ModSlot10] = PlayerInfo[playerid][PlayerVehicle4ModSlot10];
							PlayerInfo[giveplayerid][PlayerVehicle5ModSlot11] = PlayerInfo[playerid][PlayerVehicle4ModSlot11];
							PlayerInfo[giveplayerid][PlayerVehicle5ModSlot12] = PlayerInfo[playerid][PlayerVehicle4ModSlot12];
							PlayerInfo[giveplayerid][PlayerVehicle5ModSlot13] = PlayerInfo[playerid][PlayerVehicle4ModSlot13];
							PlayerInfo[giveplayerid][PlayerVehicle5ModNeon] = PlayerInfo[playerid][PlayerVehicle4ModNeon];
							PlayerInfo[giveplayerid][PlayerVehicle5Upgraded] = PlayerInfo[playerid][PlayerVehicle4Upgraded];
							PlayerInfo[giveplayerid][PlayerVehicle5Trunk] = PlayerInfo[playerid][PlayerVehicle4Trunk];
							PlayerInfo[giveplayerid][PlayerVehicle5Trunk2] = PlayerInfo[playerid][PlayerVehicle4Trunk2];
							PlayerInfo[giveplayerid][PlayerVehicle5Trunk3] = PlayerInfo[playerid][PlayerVehicle4Trunk3];
							PlayerInfo[giveplayerid][PlayerVehicle5Trunk4] = PlayerInfo[playerid][PlayerVehicle4Trunk4];
							PlayerInfo[giveplayerid][PlayerVehicle5Trunk5] = PlayerInfo[playerid][PlayerVehicle4Trunk5];
							PlayerInfo[giveplayerid][PlayerVehicle5Health] = PlayerInfo[playerid][PlayerVehicle4Health];
							PlayerInfo[giveplayerid][PlayerVehicle5Goods] = PlayerInfo[playerid][PlayerVehicle4Goods];
							PlayerInfo[giveplayerid][PlayerVehicle5Fuel] = PlayerInfo[playerid][PlayerVehicle4Fuel];
							strmid(PlayerInfo[giveplayerid][PlayerVehicle5Plate], PlayerInfo[playerid][PlayerVehicle4Plate], 0, strlen(PlayerInfo[playerid][PlayerVehicle4Plate]), 255);
						}
					}
			    }
			    case 5:
			    {
					switch(vehslotid)
					{
						case 1:
					    {
							PlayerInfo[giveplayerid][PlayerVehicleModel1] = PlayerInfo[playerid][PlayerVehicleModel5];
							PlayerInfo[giveplayerid][pVehLock1] = PlayerInfo[playerid][pVehLock5];
							PlayerInfo[giveplayerid][pVehLocked1] = PlayerInfo[playerid][pVehLocked5];
							PlayerInfo[giveplayerid][pPlayerVehicle1Color] = PlayerInfo[playerid][pPlayerVehicle5Color];
				            PlayerInfo[giveplayerid][pPlayerVehicle1Color2] = PlayerInfo[playerid][pPlayerVehicle5Color2];
							PlayerInfo[giveplayerid][PlayerVehiclePosX1] = PlayerInfo[playerid][PlayerVehiclePosX5];
			   				PlayerInfo[giveplayerid][PlayerVehiclePosY1] = PlayerInfo[playerid][PlayerVehiclePosY5];
			   				PlayerInfo[giveplayerid][PlayerVehiclePosZ1] = PlayerInfo[playerid][PlayerVehiclePosZ5];
							PlayerInfo[giveplayerid][PlayerVehicleFacing1] = PlayerInfo[playerid][PlayerVehicleFacing5];
							PlayerInfo[giveplayerid][PlayerVehicle1PaintJob] = PlayerInfo[playerid][PlayerVehicle5PaintJob];
							PlayerInfo[giveplayerid][PlayerVehicle1ModSlot0] = PlayerInfo[playerid][PlayerVehicle5ModSlot0];
							PlayerInfo[giveplayerid][PlayerVehicle1ModSlot1] = PlayerInfo[playerid][PlayerVehicle5ModSlot1];
							PlayerInfo[giveplayerid][PlayerVehicle1ModSlot2] = PlayerInfo[playerid][PlayerVehicle5ModSlot2];
							PlayerInfo[giveplayerid][PlayerVehicle1ModSlot3] = PlayerInfo[playerid][PlayerVehicle5ModSlot3];
							PlayerInfo[giveplayerid][PlayerVehicle1ModSlot4] = PlayerInfo[playerid][PlayerVehicle5ModSlot4];
							PlayerInfo[giveplayerid][PlayerVehicle1ModSlot5] = PlayerInfo[playerid][PlayerVehicle5ModSlot5];
							PlayerInfo[giveplayerid][PlayerVehicle1ModSlot6] = PlayerInfo[playerid][PlayerVehicle5ModSlot6];
							PlayerInfo[giveplayerid][PlayerVehicle1ModSlot7] = PlayerInfo[playerid][PlayerVehicle5ModSlot7];
							PlayerInfo[giveplayerid][PlayerVehicle1ModSlot8] = PlayerInfo[playerid][PlayerVehicle5ModSlot8];
							PlayerInfo[giveplayerid][PlayerVehicle1ModSlot9] = PlayerInfo[playerid][PlayerVehicle5ModSlot9];
							PlayerInfo[giveplayerid][PlayerVehicle1ModSlot10] = PlayerInfo[playerid][PlayerVehicle5ModSlot10];
							PlayerInfo[giveplayerid][PlayerVehicle1ModSlot11] = PlayerInfo[playerid][PlayerVehicle5ModSlot11];
							PlayerInfo[giveplayerid][PlayerVehicle1ModSlot12] = PlayerInfo[playerid][PlayerVehicle5ModSlot12];
							PlayerInfo[giveplayerid][PlayerVehicle1ModSlot13] = PlayerInfo[playerid][PlayerVehicle5ModSlot13];
							PlayerInfo[giveplayerid][PlayerVehicle1ModNeon] = PlayerInfo[playerid][PlayerVehicle5ModNeon];
							PlayerInfo[giveplayerid][PlayerVehicle1Upgraded] = PlayerInfo[playerid][PlayerVehicle5Upgraded];
							PlayerInfo[giveplayerid][PlayerVehicle1Trunk] = PlayerInfo[playerid][PlayerVehicle5Trunk];
							PlayerInfo[giveplayerid][PlayerVehicle1Trunk2] = PlayerInfo[playerid][PlayerVehicle5Trunk2];
							PlayerInfo[giveplayerid][PlayerVehicle1Trunk3] = PlayerInfo[playerid][PlayerVehicle5Trunk3];
							PlayerInfo[giveplayerid][PlayerVehicle1Trunk4] = PlayerInfo[playerid][PlayerVehicle5Trunk4];
							PlayerInfo[giveplayerid][PlayerVehicle1Trunk5] = PlayerInfo[playerid][PlayerVehicle5Trunk5];
							PlayerInfo[giveplayerid][PlayerVehicle1Health] = PlayerInfo[playerid][PlayerVehicle5Health];
							PlayerInfo[giveplayerid][PlayerVehicle1Goods] = PlayerInfo[playerid][PlayerVehicle5Goods];
							PlayerInfo[giveplayerid][PlayerVehicle1Fuel] = PlayerInfo[playerid][PlayerVehicle5Fuel];
							strmid(PlayerInfo[giveplayerid][PlayerVehicle1Plate], PlayerInfo[playerid][PlayerVehicle5Plate], 0, strlen(PlayerInfo[playerid][PlayerVehicle5Plate]), 255);
	                    }
	                    case 2:
					    {
							PlayerInfo[giveplayerid][PlayerVehicleModel2] = PlayerInfo[playerid][PlayerVehicleModel5];
							PlayerInfo[giveplayerid][pVehLock2] = PlayerInfo[playerid][pVehLock5];
							PlayerInfo[giveplayerid][pVehLocked2] = PlayerInfo[playerid][pVehLocked5];
							PlayerInfo[giveplayerid][pPlayerVehicle2Color] = PlayerInfo[playerid][pPlayerVehicle5Color];
				            PlayerInfo[giveplayerid][pPlayerVehicle2Color2] = PlayerInfo[playerid][pPlayerVehicle5Color2];
							PlayerInfo[giveplayerid][PlayerVehiclePosX2] = PlayerInfo[playerid][PlayerVehiclePosX5];
			   				PlayerInfo[giveplayerid][PlayerVehiclePosY2] = PlayerInfo[playerid][PlayerVehiclePosY5];
			   				PlayerInfo[giveplayerid][PlayerVehiclePosZ2] = PlayerInfo[playerid][PlayerVehiclePosZ5];
							PlayerInfo[giveplayerid][PlayerVehicleFacing2] = PlayerInfo[playerid][PlayerVehicleFacing5];
							PlayerInfo[giveplayerid][PlayerVehicle2PaintJob] = PlayerInfo[playerid][PlayerVehicle5PaintJob];
							PlayerInfo[giveplayerid][PlayerVehicle2ModSlot0] = PlayerInfo[playerid][PlayerVehicle5ModSlot0];
							PlayerInfo[giveplayerid][PlayerVehicle2ModSlot1] = PlayerInfo[playerid][PlayerVehicle5ModSlot1];
							PlayerInfo[giveplayerid][PlayerVehicle2ModSlot2] = PlayerInfo[playerid][PlayerVehicle5ModSlot2];
							PlayerInfo[giveplayerid][PlayerVehicle2ModSlot3] = PlayerInfo[playerid][PlayerVehicle5ModSlot3];
							PlayerInfo[giveplayerid][PlayerVehicle2ModSlot4] = PlayerInfo[playerid][PlayerVehicle5ModSlot4];
							PlayerInfo[giveplayerid][PlayerVehicle2ModSlot5] = PlayerInfo[playerid][PlayerVehicle5ModSlot5];
							PlayerInfo[giveplayerid][PlayerVehicle2ModSlot6] = PlayerInfo[playerid][PlayerVehicle5ModSlot6];
							PlayerInfo[giveplayerid][PlayerVehicle2ModSlot7] = PlayerInfo[playerid][PlayerVehicle5ModSlot7];
							PlayerInfo[giveplayerid][PlayerVehicle2ModSlot8] = PlayerInfo[playerid][PlayerVehicle5ModSlot8];
							PlayerInfo[giveplayerid][PlayerVehicle2ModSlot9] = PlayerInfo[playerid][PlayerVehicle5ModSlot9];
							PlayerInfo[giveplayerid][PlayerVehicle2ModSlot10] = PlayerInfo[playerid][PlayerVehicle5ModSlot10];
							PlayerInfo[giveplayerid][PlayerVehicle2ModSlot11] = PlayerInfo[playerid][PlayerVehicle5ModSlot11];
							PlayerInfo[giveplayerid][PlayerVehicle2ModSlot12] = PlayerInfo[playerid][PlayerVehicle5ModSlot12];
							PlayerInfo[giveplayerid][PlayerVehicle2ModSlot13] = PlayerInfo[playerid][PlayerVehicle5ModSlot13];
							PlayerInfo[giveplayerid][PlayerVehicle2ModNeon] = PlayerInfo[playerid][PlayerVehicle5ModNeon];
							PlayerInfo[giveplayerid][PlayerVehicle2Upgraded] = PlayerInfo[playerid][PlayerVehicle5Upgraded];
							PlayerInfo[giveplayerid][PlayerVehicle2Trunk] = PlayerInfo[playerid][PlayerVehicle5Trunk];
							PlayerInfo[giveplayerid][PlayerVehicle2Trunk2] = PlayerInfo[playerid][PlayerVehicle5Trunk2];
							PlayerInfo[giveplayerid][PlayerVehicle2Trunk3] = PlayerInfo[playerid][PlayerVehicle5Trunk3];
							PlayerInfo[giveplayerid][PlayerVehicle2Trunk4] = PlayerInfo[playerid][PlayerVehicle5Trunk4];
							PlayerInfo[giveplayerid][PlayerVehicle2Trunk5] = PlayerInfo[playerid][PlayerVehicle5Trunk5];
							PlayerInfo[giveplayerid][PlayerVehicle2Health] = PlayerInfo[playerid][PlayerVehicle5Health];
							PlayerInfo[giveplayerid][PlayerVehicle2Goods] = PlayerInfo[playerid][PlayerVehicle5Goods];
							PlayerInfo[giveplayerid][PlayerVehicle2Fuel] = PlayerInfo[playerid][PlayerVehicle5Fuel];
							strmid(PlayerInfo[giveplayerid][PlayerVehicle2Plate], PlayerInfo[playerid][PlayerVehicle5Plate], 0, strlen(PlayerInfo[playerid][PlayerVehicle5Plate]), 255);
	                    }
	                    case 3:
					    {
							PlayerInfo[giveplayerid][PlayerVehicleModel3] = PlayerInfo[playerid][PlayerVehicleModel5];
							PlayerInfo[giveplayerid][pVehLock3] = PlayerInfo[playerid][pVehLock5];
							PlayerInfo[giveplayerid][pVehLocked3] = PlayerInfo[playerid][pVehLocked5];
							PlayerInfo[giveplayerid][pPlayerVehicle3Color] = PlayerInfo[playerid][pPlayerVehicle5Color];
				            PlayerInfo[giveplayerid][pPlayerVehicle3Color2] = PlayerInfo[playerid][pPlayerVehicle5Color2];
							PlayerInfo[giveplayerid][PlayerVehiclePosX3] = PlayerInfo[playerid][PlayerVehiclePosX5];
			   				PlayerInfo[giveplayerid][PlayerVehiclePosY3] = PlayerInfo[playerid][PlayerVehiclePosY5];
			   				PlayerInfo[giveplayerid][PlayerVehiclePosZ3] = PlayerInfo[playerid][PlayerVehiclePosZ5];
							PlayerInfo[giveplayerid][PlayerVehicleFacing3] = PlayerInfo[playerid][PlayerVehicleFacing5];
							PlayerInfo[giveplayerid][PlayerVehicle3PaintJob] = PlayerInfo[playerid][PlayerVehicle5PaintJob];
							PlayerInfo[giveplayerid][PlayerVehicle3ModSlot0] = PlayerInfo[playerid][PlayerVehicle5ModSlot0];
							PlayerInfo[giveplayerid][PlayerVehicle3ModSlot1] = PlayerInfo[playerid][PlayerVehicle5ModSlot1];
							PlayerInfo[giveplayerid][PlayerVehicle3ModSlot2] = PlayerInfo[playerid][PlayerVehicle5ModSlot2];
							PlayerInfo[giveplayerid][PlayerVehicle3ModSlot3] = PlayerInfo[playerid][PlayerVehicle5ModSlot3];
							PlayerInfo[giveplayerid][PlayerVehicle3ModSlot4] = PlayerInfo[playerid][PlayerVehicle5ModSlot4];
							PlayerInfo[giveplayerid][PlayerVehicle3ModSlot5] = PlayerInfo[playerid][PlayerVehicle5ModSlot5];
							PlayerInfo[giveplayerid][PlayerVehicle3ModSlot6] = PlayerInfo[playerid][PlayerVehicle5ModSlot6];
							PlayerInfo[giveplayerid][PlayerVehicle3ModSlot7] = PlayerInfo[playerid][PlayerVehicle5ModSlot7];
							PlayerInfo[giveplayerid][PlayerVehicle3ModSlot8] = PlayerInfo[playerid][PlayerVehicle5ModSlot8];
							PlayerInfo[giveplayerid][PlayerVehicle3ModSlot9] = PlayerInfo[playerid][PlayerVehicle5ModSlot9];
							PlayerInfo[giveplayerid][PlayerVehicle3ModSlot10] = PlayerInfo[playerid][PlayerVehicle5ModSlot10];
							PlayerInfo[giveplayerid][PlayerVehicle3ModSlot11] = PlayerInfo[playerid][PlayerVehicle5ModSlot11];
							PlayerInfo[giveplayerid][PlayerVehicle3ModSlot12] = PlayerInfo[playerid][PlayerVehicle5ModSlot12];
							PlayerInfo[giveplayerid][PlayerVehicle3ModSlot13] = PlayerInfo[playerid][PlayerVehicle5ModSlot13];
							PlayerInfo[giveplayerid][PlayerVehicle3ModNeon] = PlayerInfo[playerid][PlayerVehicle5ModNeon];
							PlayerInfo[giveplayerid][PlayerVehicle3Upgraded] = PlayerInfo[playerid][PlayerVehicle5Upgraded];
							PlayerInfo[giveplayerid][PlayerVehicle3Trunk] = PlayerInfo[playerid][PlayerVehicle5Trunk];
							PlayerInfo[giveplayerid][PlayerVehicle3Trunk2] = PlayerInfo[playerid][PlayerVehicle5Trunk2];
							PlayerInfo[giveplayerid][PlayerVehicle3Trunk3] = PlayerInfo[playerid][PlayerVehicle5Trunk3];
							PlayerInfo[giveplayerid][PlayerVehicle3Trunk4] = PlayerInfo[playerid][PlayerVehicle5Trunk4];
							PlayerInfo[giveplayerid][PlayerVehicle3Trunk5] = PlayerInfo[playerid][PlayerVehicle5Trunk5];
							PlayerInfo[giveplayerid][PlayerVehicle3Health] = PlayerInfo[playerid][PlayerVehicle5Health];
							PlayerInfo[giveplayerid][PlayerVehicle3Goods] = PlayerInfo[playerid][PlayerVehicle5Goods];
							PlayerInfo[giveplayerid][PlayerVehicle3Fuel] = PlayerInfo[playerid][PlayerVehicle5Fuel];
							strmid(PlayerInfo[giveplayerid][PlayerVehicle3Plate], PlayerInfo[playerid][PlayerVehicle5Plate], 0, strlen(PlayerInfo[playerid][PlayerVehicle5Plate]), 255);
	                    }
	                    case 4:
					    {
							PlayerInfo[giveplayerid][PlayerVehicleModel4] = PlayerInfo[playerid][PlayerVehicleModel5];
							PlayerInfo[giveplayerid][pVehLock4] = PlayerInfo[playerid][pVehLock5];
							PlayerInfo[giveplayerid][pVehLocked4] = PlayerInfo[playerid][pVehLocked5];
							PlayerInfo[giveplayerid][pPlayerVehicle4Color] = PlayerInfo[playerid][pPlayerVehicle5Color];
				            PlayerInfo[giveplayerid][pPlayerVehicle4Color2] = PlayerInfo[playerid][pPlayerVehicle5Color2];
							PlayerInfo[giveplayerid][PlayerVehiclePosX4] = PlayerInfo[playerid][PlayerVehiclePosX5];
			   				PlayerInfo[giveplayerid][PlayerVehiclePosY4] = PlayerInfo[playerid][PlayerVehiclePosY5];
			   				PlayerInfo[giveplayerid][PlayerVehiclePosZ4] = PlayerInfo[playerid][PlayerVehiclePosZ5];
							PlayerInfo[giveplayerid][PlayerVehicleFacing4] = PlayerInfo[playerid][PlayerVehicleFacing5];
							PlayerInfo[giveplayerid][PlayerVehicle4PaintJob] = PlayerInfo[playerid][PlayerVehicle5PaintJob];
							PlayerInfo[giveplayerid][PlayerVehicle4ModSlot0] = PlayerInfo[playerid][PlayerVehicle5ModSlot0];
							PlayerInfo[giveplayerid][PlayerVehicle4ModSlot1] = PlayerInfo[playerid][PlayerVehicle5ModSlot1];
							PlayerInfo[giveplayerid][PlayerVehicle4ModSlot2] = PlayerInfo[playerid][PlayerVehicle5ModSlot2];
							PlayerInfo[giveplayerid][PlayerVehicle4ModSlot3] = PlayerInfo[playerid][PlayerVehicle5ModSlot3];
							PlayerInfo[giveplayerid][PlayerVehicle4ModSlot4] = PlayerInfo[playerid][PlayerVehicle5ModSlot4];
							PlayerInfo[giveplayerid][PlayerVehicle4ModSlot5] = PlayerInfo[playerid][PlayerVehicle5ModSlot5];
							PlayerInfo[giveplayerid][PlayerVehicle4ModSlot6] = PlayerInfo[playerid][PlayerVehicle5ModSlot6];
							PlayerInfo[giveplayerid][PlayerVehicle4ModSlot7] = PlayerInfo[playerid][PlayerVehicle5ModSlot7];
							PlayerInfo[giveplayerid][PlayerVehicle4ModSlot8] = PlayerInfo[playerid][PlayerVehicle5ModSlot8];
							PlayerInfo[giveplayerid][PlayerVehicle4ModSlot9] = PlayerInfo[playerid][PlayerVehicle5ModSlot9];
							PlayerInfo[giveplayerid][PlayerVehicle4ModSlot10] = PlayerInfo[playerid][PlayerVehicle5ModSlot10];
							PlayerInfo[giveplayerid][PlayerVehicle4ModSlot11] = PlayerInfo[playerid][PlayerVehicle5ModSlot11];
							PlayerInfo[giveplayerid][PlayerVehicle4ModSlot12] = PlayerInfo[playerid][PlayerVehicle5ModSlot12];
							PlayerInfo[giveplayerid][PlayerVehicle4ModSlot13] = PlayerInfo[playerid][PlayerVehicle5ModSlot13];
							PlayerInfo[giveplayerid][PlayerVehicle4ModNeon] = PlayerInfo[playerid][PlayerVehicle5ModNeon];
							PlayerInfo[giveplayerid][PlayerVehicle4Upgraded] = PlayerInfo[playerid][PlayerVehicle5Upgraded];
							PlayerInfo[giveplayerid][PlayerVehicle4Trunk] = PlayerInfo[playerid][PlayerVehicle5Trunk];
							PlayerInfo[giveplayerid][PlayerVehicle4Trunk2] = PlayerInfo[playerid][PlayerVehicle5Trunk2];
							PlayerInfo[giveplayerid][PlayerVehicle4Trunk3] = PlayerInfo[playerid][PlayerVehicle5Trunk3];
							PlayerInfo[giveplayerid][PlayerVehicle4Trunk4] = PlayerInfo[playerid][PlayerVehicle5Trunk4];
							PlayerInfo[giveplayerid][PlayerVehicle4Trunk5] = PlayerInfo[playerid][PlayerVehicle5Trunk5];
							PlayerInfo[giveplayerid][PlayerVehicle4Health] = PlayerInfo[playerid][PlayerVehicle5Health];
							PlayerInfo[giveplayerid][PlayerVehicle4Goods] = PlayerInfo[playerid][PlayerVehicle5Goods];
							PlayerInfo[giveplayerid][PlayerVehicle4Fuel] = PlayerInfo[playerid][PlayerVehicle5Fuel];
							strmid(PlayerInfo[giveplayerid][PlayerVehicle4Plate], PlayerInfo[playerid][PlayerVehicle5Plate], 0, strlen(PlayerInfo[playerid][PlayerVehicle5Plate]), 255);
	                    }
	                    case 5:
					    {
							PlayerInfo[giveplayerid][PlayerVehicleModel5] = PlayerInfo[playerid][PlayerVehicleModel5];
							PlayerInfo[giveplayerid][pVehLock5] = PlayerInfo[playerid][pVehLock5];
							PlayerInfo[giveplayerid][pVehLocked5] = PlayerInfo[playerid][pVehLocked5];
							PlayerInfo[giveplayerid][pPlayerVehicle5Color] = PlayerInfo[playerid][pPlayerVehicle5Color];
				            PlayerInfo[giveplayerid][pPlayerVehicle5Color2] = PlayerInfo[playerid][pPlayerVehicle5Color2];
							PlayerInfo[giveplayerid][PlayerVehiclePosX5] = PlayerInfo[playerid][PlayerVehiclePosX5];
			   				PlayerInfo[giveplayerid][PlayerVehiclePosY5] = PlayerInfo[playerid][PlayerVehiclePosY5];
			   				PlayerInfo[giveplayerid][PlayerVehiclePosZ5] = PlayerInfo[playerid][PlayerVehiclePosZ5];
							PlayerInfo[giveplayerid][PlayerVehicleFacing5] = PlayerInfo[playerid][PlayerVehicleFacing5];
							PlayerInfo[giveplayerid][PlayerVehicle5PaintJob] = PlayerInfo[playerid][PlayerVehicle5PaintJob];
							PlayerInfo[giveplayerid][PlayerVehicle5ModSlot0] = PlayerInfo[playerid][PlayerVehicle5ModSlot0];
							PlayerInfo[giveplayerid][PlayerVehicle5ModSlot1] = PlayerInfo[playerid][PlayerVehicle5ModSlot1];
							PlayerInfo[giveplayerid][PlayerVehicle5ModSlot2] = PlayerInfo[playerid][PlayerVehicle5ModSlot2];
							PlayerInfo[giveplayerid][PlayerVehicle5ModSlot3] = PlayerInfo[playerid][PlayerVehicle5ModSlot3];
							PlayerInfo[giveplayerid][PlayerVehicle5ModSlot4] = PlayerInfo[playerid][PlayerVehicle5ModSlot4];
							PlayerInfo[giveplayerid][PlayerVehicle5ModSlot5] = PlayerInfo[playerid][PlayerVehicle5ModSlot5];
							PlayerInfo[giveplayerid][PlayerVehicle5ModSlot6] = PlayerInfo[playerid][PlayerVehicle5ModSlot6];
							PlayerInfo[giveplayerid][PlayerVehicle5ModSlot7] = PlayerInfo[playerid][PlayerVehicle5ModSlot7];
							PlayerInfo[giveplayerid][PlayerVehicle5ModSlot8] = PlayerInfo[playerid][PlayerVehicle5ModSlot8];
							PlayerInfo[giveplayerid][PlayerVehicle5ModSlot9] = PlayerInfo[playerid][PlayerVehicle5ModSlot9];
							PlayerInfo[giveplayerid][PlayerVehicle5ModSlot10] = PlayerInfo[playerid][PlayerVehicle5ModSlot10];
							PlayerInfo[giveplayerid][PlayerVehicle5ModSlot11] = PlayerInfo[playerid][PlayerVehicle5ModSlot11];
							PlayerInfo[giveplayerid][PlayerVehicle5ModSlot12] = PlayerInfo[playerid][PlayerVehicle5ModSlot12];
							PlayerInfo[giveplayerid][PlayerVehicle5ModSlot13] = PlayerInfo[playerid][PlayerVehicle5ModSlot13];
							PlayerInfo[giveplayerid][PlayerVehicle5ModNeon] = PlayerInfo[playerid][PlayerVehicle5ModNeon];
							PlayerInfo[giveplayerid][PlayerVehicle5Upgraded] = PlayerInfo[playerid][PlayerVehicle5Upgraded];
							PlayerInfo[giveplayerid][PlayerVehicle5Trunk] = PlayerInfo[playerid][PlayerVehicle5Trunk];
							PlayerInfo[giveplayerid][PlayerVehicle5Trunk2] = PlayerInfo[playerid][PlayerVehicle5Trunk2];
							PlayerInfo[giveplayerid][PlayerVehicle5Trunk3] = PlayerInfo[playerid][PlayerVehicle5Trunk3];
							PlayerInfo[giveplayerid][PlayerVehicle5Trunk4] = PlayerInfo[playerid][PlayerVehicle5Trunk4];
							PlayerInfo[giveplayerid][PlayerVehicle5Trunk5] = PlayerInfo[playerid][PlayerVehicle5Trunk5];
							PlayerInfo[giveplayerid][PlayerVehicle5Health] = PlayerInfo[playerid][PlayerVehicle5Health];
							PlayerInfo[giveplayerid][PlayerVehicle5Goods] = PlayerInfo[playerid][PlayerVehicle5Goods];
							PlayerInfo[giveplayerid][PlayerVehicle5Fuel] = PlayerInfo[playerid][PlayerVehicle5Fuel];
							strmid(PlayerInfo[giveplayerid][PlayerVehicle5Plate], PlayerInfo[playerid][PlayerVehicle5Plate], 0, strlen(PlayerInfo[playerid][PlayerVehicle5Plate]), 255);
						}
					}
			    }
			}
		}
	}
}
stock ResetPlayerVehicle(playerid, slotid)
{
    new string[128];
	if(!IsPlayerNPC(playerid))
	{
		switch(slotid)
		{
		    case 1:
		    {
                VehicleInfo[PlayerVehicleID1[playerid]][VehicleDealership] = 0;
				VehicleInfo[PlayerVehicleID1[playerid]][VehicleLock] = 0;
				VehicleInfo[PlayerVehicleID1[playerid]][VehicleLocked] = 0;
				PlayerInfo[playerid][PlayerVehicleModel1] = 0;
				PlayerInfo[playerid][pVehLock1] = 0;
				PlayerInfo[playerid][pVehLocked1] = 0;
				if(PlayerInfo[playerid][PlayerVehicle1ModNeon] != 0)
        		{
            		DestroyObject(CarNeon[PlayerVehicleID1[playerid]]);
            		DestroyObject(CarNeon2[PlayerVehicleID1[playerid]]);
				}
				Delete3DTextLabel(VehPlate[PlayerVehicleID1[playerid]]);
				VehPlate[PlayerVehicleID1[playerid]] = Text3D:INVALID_3DTEXT_ID;
				TruckGoods[PlayerVehicleID1[playerid]] = 0;
				Wrecked[PlayerVehicleID1[playerid]] = 0;
				Tirelock[PlayerVehicleID1[playerid]] = 0;
				CarTrunk[PlayerVehicleID1[playerid]] = 0;
				CarTrunk2[PlayerVehicleID1[playerid]] = 0;
				CarTrunk3[PlayerVehicleID1[playerid]] = 0;
				CarTrunk4[PlayerVehicleID1[playerid]] = 0;
				CarTrunk5[PlayerVehicleID1[playerid]] = 0;
				DestroyVehicle(PlayerVehicleID1[playerid]);
                PlayerVehicleID1[playerid] = 0;
				PlayerInfo[playerid][pPlayerVehicle1Color] = 0;
				PlayerInfo[playerid][pPlayerVehicle1Color2] = 0;
				PlayerInfo[playerid][PlayerVehiclePosX1] = 0;
               	PlayerInfo[playerid][PlayerVehiclePosY1] = 0;
               	PlayerInfo[playerid][PlayerVehiclePosZ1] = 0;
 				PlayerInfo[playerid][PlayerVehicleFacing1] = 0;
				PlayerInfo[playerid][PlayerVehicle1PaintJob] = 255;
				PlayerInfo[playerid][PlayerVehicle1ModSlot0] = 0;
				PlayerInfo[playerid][PlayerVehicle1ModSlot1] = 0;
				PlayerInfo[playerid][PlayerVehicle1ModSlot2] = 0;
				PlayerInfo[playerid][PlayerVehicle1ModSlot3] = 0;
				PlayerInfo[playerid][PlayerVehicle1ModSlot4] = 0;
				PlayerInfo[playerid][PlayerVehicle1ModSlot5] = 0;
				PlayerInfo[playerid][PlayerVehicle1ModSlot6] = 0;
				PlayerInfo[playerid][PlayerVehicle1ModSlot7] = 0;
				PlayerInfo[playerid][PlayerVehicle1ModSlot8] = 0;
				PlayerInfo[playerid][PlayerVehicle1ModSlot9] = 0;
				PlayerInfo[playerid][PlayerVehicle1ModSlot10] = 0;
				PlayerInfo[playerid][PlayerVehicle1ModSlot11] = 0;
				PlayerInfo[playerid][PlayerVehicle1ModSlot12] = 0;
				PlayerInfo[playerid][PlayerVehicle1ModSlot13] = 0;
				PlayerInfo[playerid][PlayerVehicle1Health] = 0;
				PlayerInfo[playerid][PlayerVehicle1Tire] = 0;
				PlayerInfo[playerid][PlayerVehicle1Upgraded] = 0;
				PlayerInfo[playerid][PlayerVehicle1Trunk] = 0;
				PlayerInfo[playerid][PlayerVehicle1Trunk2] = 0;
				PlayerInfo[playerid][PlayerVehicle1Trunk3] = 0;
				PlayerInfo[playerid][PlayerVehicle1Trunk4] = 0;
				PlayerInfo[playerid][PlayerVehicle1Trunk5] = 0;
				PlayerInfo[playerid][PlayerVehicle1Goods] = 0;
				PlayerInfo[playerid][PlayerVehicle1Fuel] = 0;
				PlayerInfo[playerid][PlayerVehicle1ModNeon] = 0;
				format(string, sizeof(string), "No Plate");
		        strmid(PlayerInfo[playerid][PlayerVehicle1Plate], string, 0, strlen(string), 255);
		    }
		    case 2:
		    {
                VehicleInfo[PlayerVehicleID2[playerid]][VehicleDealership] = 0;
				VehicleInfo[PlayerVehicleID2[playerid]][VehicleLock] = 0;
				VehicleInfo[PlayerVehicleID2[playerid]][VehicleLocked] = 0;
				PlayerInfo[playerid][PlayerVehicleModel2] = 0;
				PlayerInfo[playerid][pVehLock2] = 0;
				PlayerInfo[playerid][pVehLocked2] = 0;
				if(PlayerInfo[playerid][PlayerVehicle2ModNeon] != 0)
        		{
                    DestroyObject(CarNeon[PlayerVehicleID2[playerid]]);
            		DestroyObject(CarNeon2[PlayerVehicleID2[playerid]]);
        		}
        		Delete3DTextLabel(VehPlate[PlayerVehicleID2[playerid]]);
        		VehPlate[PlayerVehicleID2[playerid]] = Text3D:INVALID_3DTEXT_ID;
        		TruckGoods[PlayerVehicleID2[playerid]] = 0;
        		Wrecked[PlayerVehicleID2[playerid]] = 0;
        		Tirelock[PlayerVehicleID2[playerid]] = 0;
				CarTrunk[PlayerVehicleID2[playerid]] = 0;
				CarTrunk2[PlayerVehicleID2[playerid]] = 0;
				CarTrunk3[PlayerVehicleID2[playerid]] = 0;
				CarTrunk4[PlayerVehicleID2[playerid]] = 0;
				CarTrunk5[PlayerVehicleID2[playerid]] = 0;
				DestroyVehicle(PlayerVehicleID2[playerid]);
				PlayerVehicleID2[playerid] = 0;
				PlayerInfo[playerid][pPlayerVehicle2Color] = 0;
				PlayerInfo[playerid][pPlayerVehicle2Color2] = 0;
				PlayerInfo[playerid][PlayerVehiclePosX2] = 0;
   				PlayerInfo[playerid][PlayerVehiclePosY2] = 0;
      			PlayerInfo[playerid][PlayerVehiclePosZ2] = 0;
 				PlayerInfo[playerid][PlayerVehicleFacing2] = 0;
				PlayerInfo[playerid][PlayerVehicle2PaintJob] = 255;
				PlayerInfo[playerid][PlayerVehicle2ModSlot0] = 0;
				PlayerInfo[playerid][PlayerVehicle2ModSlot1] = 0;
				PlayerInfo[playerid][PlayerVehicle2ModSlot2] = 0;
				PlayerInfo[playerid][PlayerVehicle2ModSlot3] = 0;
				PlayerInfo[playerid][PlayerVehicle2ModSlot4] = 0;
				PlayerInfo[playerid][PlayerVehicle2ModSlot5] = 0;
				PlayerInfo[playerid][PlayerVehicle2ModSlot6] = 0;
				PlayerInfo[playerid][PlayerVehicle2ModSlot7] = 0;
				PlayerInfo[playerid][PlayerVehicle2ModSlot8] = 0;
				PlayerInfo[playerid][PlayerVehicle2ModSlot9] = 0;
				PlayerInfo[playerid][PlayerVehicle2ModSlot10] = 0;
				PlayerInfo[playerid][PlayerVehicle2ModSlot11] = 0;
				PlayerInfo[playerid][PlayerVehicle2ModSlot12] = 0;
				PlayerInfo[playerid][PlayerVehicle2ModSlot13] = 0;
				PlayerInfo[playerid][PlayerVehicle2Health] = 0;
				PlayerInfo[playerid][PlayerVehicle2Tire] = 0;
				PlayerInfo[playerid][PlayerVehicle2Upgraded] = 0;
				PlayerInfo[playerid][PlayerVehicle2Trunk] = 0;
				PlayerInfo[playerid][PlayerVehicle2Trunk2] = 0;
				PlayerInfo[playerid][PlayerVehicle2Trunk3] = 0;
				PlayerInfo[playerid][PlayerVehicle2Trunk4] = 0;
				PlayerInfo[playerid][PlayerVehicle2Trunk5] = 0;
				PlayerInfo[playerid][PlayerVehicle2Goods] = 0;
				PlayerInfo[playerid][PlayerVehicle2Fuel] = 0;
				PlayerInfo[playerid][PlayerVehicle2ModNeon] = 0;
				format(string, sizeof(string), "No Plate");
		        strmid(PlayerInfo[playerid][PlayerVehicle2Plate], string, 0, strlen(string), 255);
		    }
		    case 3:
		    {
                VehicleInfo[PlayerVehicleID3[playerid]][VehicleDealership] = 0;
				VehicleInfo[PlayerVehicleID3[playerid]][VehicleLock] = 0;
				VehicleInfo[PlayerVehicleID3[playerid]][VehicleLocked] = 0;
				PlayerInfo[playerid][PlayerVehicleModel3] = 0;
				PlayerInfo[playerid][pVehLock3] = 0;
				PlayerInfo[playerid][pVehLocked3] = 0;
				if(PlayerInfo[playerid][PlayerVehicle3ModNeon] != 0)
        		{
                    DestroyObject(CarNeon[PlayerVehicleID3[playerid]]);
            		DestroyObject(CarNeon2[PlayerVehicleID3[playerid]]);
        		}
        		Delete3DTextLabel(VehPlate[PlayerVehicleID3[playerid]]);
        		VehPlate[PlayerVehicleID3[playerid]] = Text3D:INVALID_3DTEXT_ID;
        		TruckGoods[PlayerVehicleID3[playerid]] = 0;
        		Wrecked[PlayerVehicleID3[playerid]] = 0;
        		Tirelock[PlayerVehicleID3[playerid]] = 0;
				CarTrunk[PlayerVehicleID3[playerid]] = 0;
				CarTrunk2[PlayerVehicleID3[playerid]] = 0;
				CarTrunk3[PlayerVehicleID3[playerid]] = 0;
				CarTrunk4[PlayerVehicleID3[playerid]] = 0;
				CarTrunk5[PlayerVehicleID3[playerid]] = 0;
				DestroyVehicle(PlayerVehicleID3[playerid]);
				PlayerVehicleID3[playerid] = 0;
				PlayerInfo[playerid][pPlayerVehicle3Color] = 0;
				PlayerInfo[playerid][pPlayerVehicle3Color2] = 0;
				PlayerInfo[playerid][PlayerVehiclePosX3] = 0;
   				PlayerInfo[playerid][PlayerVehiclePosY3] = 0;
               	PlayerInfo[playerid][PlayerVehiclePosZ3] = 0;
 				PlayerInfo[playerid][PlayerVehicleFacing3] = 0;
				PlayerInfo[playerid][PlayerVehicle3PaintJob] = 255;
				PlayerInfo[playerid][PlayerVehicle3ModSlot0] = 0;
				PlayerInfo[playerid][PlayerVehicle3ModSlot1] = 0;
				PlayerInfo[playerid][PlayerVehicle3ModSlot2] = 0;
				PlayerInfo[playerid][PlayerVehicle3ModSlot3] = 0;
				PlayerInfo[playerid][PlayerVehicle3ModSlot4] = 0;
				PlayerInfo[playerid][PlayerVehicle3ModSlot5] = 0;
				PlayerInfo[playerid][PlayerVehicle3ModSlot6] = 0;
				PlayerInfo[playerid][PlayerVehicle3ModSlot7] = 0;
				PlayerInfo[playerid][PlayerVehicle3ModSlot8] = 0;
				PlayerInfo[playerid][PlayerVehicle3ModSlot9] = 0;
				PlayerInfo[playerid][PlayerVehicle3ModSlot10] = 0;
				PlayerInfo[playerid][PlayerVehicle3ModSlot11] = 0;
				PlayerInfo[playerid][PlayerVehicle3ModSlot12] = 0;
				PlayerInfo[playerid][PlayerVehicle3ModSlot13] = 0;
				PlayerInfo[playerid][PlayerVehicle3Health] = 0;
				PlayerInfo[playerid][PlayerVehicle3Tire] = 0;
				PlayerInfo[playerid][PlayerVehicle3Upgraded] = 0;
				PlayerInfo[playerid][PlayerVehicle3Trunk] = 0;
				PlayerInfo[playerid][PlayerVehicle3Trunk2] = 0;
				PlayerInfo[playerid][PlayerVehicle3Trunk3] = 0;
				PlayerInfo[playerid][PlayerVehicle3Trunk4] = 0;
				PlayerInfo[playerid][PlayerVehicle3Trunk5] = 0;
				PlayerInfo[playerid][PlayerVehicle3Goods] = 0;
				PlayerInfo[playerid][PlayerVehicle3Fuel] = 0;
				PlayerInfo[playerid][PlayerVehicle3ModNeon] = 0;
				format(string, sizeof(string), "No Plate");
		        strmid(PlayerInfo[playerid][PlayerVehicle3Plate], string, 0, strlen(string), 255);
		    }
		    case 4:
		    {
                VehicleInfo[PlayerVehicleID4[playerid]][VehicleDealership] = 0;
				VehicleInfo[PlayerVehicleID4[playerid]][VehicleLock] = 0;
				VehicleInfo[PlayerVehicleID4[playerid]][VehicleLocked] = 0;
				PlayerInfo[playerid][PlayerVehicleModel4] = 0;
				PlayerInfo[playerid][pVehLock4] = 0;
				PlayerInfo[playerid][pVehLocked4] = 0;
				if(PlayerInfo[playerid][PlayerVehicle4ModNeon] != 0)
        		{
                    DestroyObject(CarNeon[PlayerVehicleID4[playerid]]);
            		DestroyObject(CarNeon2[PlayerVehicleID4[playerid]]);
        		}
        		Delete3DTextLabel(VehPlate[PlayerVehicleID4[playerid]]);
        		VehPlate[PlayerVehicleID4[playerid]] = Text3D:INVALID_3DTEXT_ID;
        		TruckGoods[PlayerVehicleID4[playerid]] = 0;
        		Wrecked[PlayerVehicleID4[playerid]] = 0;
        		Tirelock[PlayerVehicleID4[playerid]] = 0;
				CarTrunk[PlayerVehicleID4[playerid]] = 0;
				CarTrunk2[PlayerVehicleID4[playerid]] = 0;
				CarTrunk3[PlayerVehicleID4[playerid]] = 0;
				CarTrunk4[PlayerVehicleID4[playerid]] = 0;
				CarTrunk5[PlayerVehicleID4[playerid]] = 0;
				DestroyVehicle(PlayerVehicleID4[playerid]);
				PlayerVehicleID4[playerid] = 0;
				PlayerInfo[playerid][pPlayerVehicle4Color] = 0;
				PlayerInfo[playerid][pPlayerVehicle4Color2] = 0;
				PlayerInfo[playerid][PlayerVehiclePosX4] = 0;
               	PlayerInfo[playerid][PlayerVehiclePosY4] = 0;
               	PlayerInfo[playerid][PlayerVehiclePosZ4] = 0;
 				PlayerInfo[playerid][PlayerVehicleFacing4] = 0;
				PlayerInfo[playerid][PlayerVehicle4PaintJob] = 255;
				PlayerInfo[playerid][PlayerVehicle4ModSlot0] = 0;
				PlayerInfo[playerid][PlayerVehicle4ModSlot1] = 0;
				PlayerInfo[playerid][PlayerVehicle4ModSlot2] = 0;
				PlayerInfo[playerid][PlayerVehicle4ModSlot3] = 0;
				PlayerInfo[playerid][PlayerVehicle4ModSlot4] = 0;
				PlayerInfo[playerid][PlayerVehicle4ModSlot5] = 0;
				PlayerInfo[playerid][PlayerVehicle4ModSlot6] = 0;
				PlayerInfo[playerid][PlayerVehicle4ModSlot7] = 0;
				PlayerInfo[playerid][PlayerVehicle4ModSlot8] = 0;
				PlayerInfo[playerid][PlayerVehicle4ModSlot9] = 0;
				PlayerInfo[playerid][PlayerVehicle4ModSlot10] = 0;
				PlayerInfo[playerid][PlayerVehicle4ModSlot11] = 0;
				PlayerInfo[playerid][PlayerVehicle4ModSlot12] = 0;
				PlayerInfo[playerid][PlayerVehicle4ModSlot13] = 0;
				PlayerInfo[playerid][PlayerVehicle4Health] = 0;
				PlayerInfo[playerid][PlayerVehicle4Tire] = 0;
				PlayerInfo[playerid][PlayerVehicle4Upgraded] = 0;
				PlayerInfo[playerid][PlayerVehicle4Trunk] = 0;
				PlayerInfo[playerid][PlayerVehicle4Trunk2] = 0;
				PlayerInfo[playerid][PlayerVehicle4Trunk3] = 0;
				PlayerInfo[playerid][PlayerVehicle4Trunk4] = 0;
				PlayerInfo[playerid][PlayerVehicle4Trunk5] = 0;
				PlayerInfo[playerid][PlayerVehicle4Goods] = 0;
				PlayerInfo[playerid][PlayerVehicle4Fuel] = 0;
				PlayerInfo[playerid][PlayerVehicle4ModNeon] = 0;
				format(string, sizeof(string), "No Plate");
		        strmid(PlayerInfo[playerid][PlayerVehicle4Plate], string, 0, strlen(string), 255);
		    }
		    case 5:
		    {
                VehicleInfo[PlayerVehicleID5[playerid]][VehicleDealership] = 0;
				VehicleInfo[PlayerVehicleID5[playerid]][VehicleLock] = 0;
				VehicleInfo[PlayerVehicleID5[playerid]][VehicleLocked] = 0;
                PlayerInfo[playerid][PlayerVehicleModel5] = 0;
				PlayerInfo[playerid][pVehLock5] = 0;
				PlayerInfo[playerid][pVehLocked5] = 0;
				if(PlayerInfo[playerid][PlayerVehicle5ModNeon] != 0)
        		{
                    DestroyObject(CarNeon[PlayerVehicleID5[playerid]]);
            		DestroyObject(CarNeon2[PlayerVehicleID5[playerid]]);
        		}
        		Delete3DTextLabel(VehPlate[PlayerVehicleID5[playerid]]);
        		VehPlate[PlayerVehicleID5[playerid]] = Text3D:INVALID_3DTEXT_ID;
        		TruckGoods[PlayerVehicleID5[playerid]] = 0;
        		Wrecked[PlayerVehicleID5[playerid]] = 0;
        		Tirelock[PlayerVehicleID5[playerid]] = 0;
				CarTrunk[PlayerVehicleID5[playerid]] = 0;
				CarTrunk2[PlayerVehicleID5[playerid]] = 0;
				CarTrunk3[PlayerVehicleID5[playerid]] = 0;
				CarTrunk4[PlayerVehicleID5[playerid]] = 0;
				CarTrunk5[PlayerVehicleID5[playerid]] = 0;
				DestroyVehicle(PlayerVehicleID5[playerid]);
				PlayerVehicleID5[playerid] = 0;
				PlayerInfo[playerid][pPlayerVehicle5Color] = 0;
				PlayerInfo[playerid][pPlayerVehicle5Color2] = 0;
				PlayerInfo[playerid][PlayerVehiclePosX5] = 0;
   				PlayerInfo[playerid][PlayerVehiclePosY5] = 0;
               	PlayerInfo[playerid][PlayerVehiclePosZ5] = 0;
 				PlayerInfo[playerid][PlayerVehicleFacing5] = 0;
				PlayerInfo[playerid][PlayerVehicle5PaintJob] = 255;
				PlayerInfo[playerid][PlayerVehicle5ModSlot0] = 0;
				PlayerInfo[playerid][PlayerVehicle5ModSlot1] = 0;
				PlayerInfo[playerid][PlayerVehicle5ModSlot2] = 0;
				PlayerInfo[playerid][PlayerVehicle5ModSlot3] = 0;
				PlayerInfo[playerid][PlayerVehicle5ModSlot4] = 0;
				PlayerInfo[playerid][PlayerVehicle5ModSlot5] = 0;
				PlayerInfo[playerid][PlayerVehicle5ModSlot6] = 0;
				PlayerInfo[playerid][PlayerVehicle5ModSlot7] = 0;
				PlayerInfo[playerid][PlayerVehicle5ModSlot8] = 0;
				PlayerInfo[playerid][PlayerVehicle5ModSlot9] = 0;
				PlayerInfo[playerid][PlayerVehicle5ModSlot10] = 0;
				PlayerInfo[playerid][PlayerVehicle5ModSlot11] = 0;
				PlayerInfo[playerid][PlayerVehicle5ModSlot12] = 0;
				PlayerInfo[playerid][PlayerVehicle5ModSlot13] = 0;
				PlayerInfo[playerid][PlayerVehicle5Health] = 0;
				PlayerInfo[playerid][PlayerVehicle5Tire] = 0;
				PlayerInfo[playerid][PlayerVehicle5Upgraded] = 0;
				PlayerInfo[playerid][PlayerVehicle5Trunk] = 0;
				PlayerInfo[playerid][PlayerVehicle5Trunk2] = 0;
				PlayerInfo[playerid][PlayerVehicle5Trunk3] = 0;
				PlayerInfo[playerid][PlayerVehicle5Trunk4] = 0;
				PlayerInfo[playerid][PlayerVehicle5Trunk5] = 0;
				PlayerInfo[playerid][PlayerVehicle5Goods] = 0;
				PlayerInfo[playerid][PlayerVehicle5Fuel] = 0;
				PlayerInfo[playerid][PlayerVehicle5ModNeon] = 0;
				format(string, sizeof(string), "No Plate");
		        strmid(PlayerInfo[playerid][PlayerVehicle5Plate], string, 0, strlen(string), 255);
		    }
		}
	}
}
stock ResetPlayerVehicleEx(playerid, slotid)
{
	if(!IsPlayerNPC(playerid))
	{
		switch(slotid)
		{
		    case 1:
		    {
		        PlayerVehicleID1[playerid] = 0;
				PlayerInfo[playerid][PlayerVehicleModel1] = 0;
				PlayerInfo[playerid][pVehLock1] = 0;
				PlayerInfo[playerid][pVehLocked1] = 0;
				PlayerInfo[playerid][pPlayerVehicle1Color] = 0;
				PlayerInfo[playerid][pPlayerVehicle1Color2] = 0;
				PlayerInfo[playerid][PlayerVehiclePosX1] = 0;
               	PlayerInfo[playerid][PlayerVehiclePosY1] = 0;
               	PlayerInfo[playerid][PlayerVehiclePosZ1] = 0;
 				PlayerInfo[playerid][PlayerVehicleFacing1] = 0;
				PlayerInfo[playerid][PlayerVehicle1PaintJob] = 255;
				PlayerInfo[playerid][PlayerVehicle1ModSlot0] = 0;
				PlayerInfo[playerid][PlayerVehicle1ModSlot1] = 0;
				PlayerInfo[playerid][PlayerVehicle1ModSlot2] = 0;
				PlayerInfo[playerid][PlayerVehicle1ModSlot3] = 0;
				PlayerInfo[playerid][PlayerVehicle1ModSlot4] = 0;
				PlayerInfo[playerid][PlayerVehicle1ModSlot5] = 0;
				PlayerInfo[playerid][PlayerVehicle1ModSlot6] = 0;
				PlayerInfo[playerid][PlayerVehicle1ModSlot7] = 0;
				PlayerInfo[playerid][PlayerVehicle1ModSlot8] = 0;
				PlayerInfo[playerid][PlayerVehicle1ModSlot9] = 0;
				PlayerInfo[playerid][PlayerVehicle1ModSlot10] = 0;
				PlayerInfo[playerid][PlayerVehicle1ModSlot11] = 0;
				PlayerInfo[playerid][PlayerVehicle1ModSlot12] = 0;
				PlayerInfo[playerid][PlayerVehicle1ModSlot13] = 0;
				PlayerInfo[playerid][PlayerVehicle1Health] = 0;
				PlayerInfo[playerid][PlayerVehicle1Tire] = 0;
				PlayerInfo[playerid][PlayerVehicle1Upgraded] = 0;
				PlayerInfo[playerid][PlayerVehicle1Trunk] = 0;
				PlayerInfo[playerid][PlayerVehicle1Trunk2] = 0;
				PlayerInfo[playerid][PlayerVehicle1Trunk3] = 0;
				PlayerInfo[playerid][PlayerVehicle1Trunk4] = 0;
				PlayerInfo[playerid][PlayerVehicle1Trunk5] = 0;
				PlayerInfo[playerid][PlayerVehicle1Goods] = 0;
				PlayerInfo[playerid][PlayerVehicle1Fuel] = 0;
				PlayerInfo[playerid][PlayerVehicle1ModNeon] = 0;
		    }
		    case 2:
		    {
		        PlayerVehicleID2[playerid] = 0;
				PlayerInfo[playerid][PlayerVehicleModel2] = 0;
				PlayerInfo[playerid][pVehLock2] = 0;
				PlayerInfo[playerid][pVehLocked2] = 0;
				PlayerInfo[playerid][pPlayerVehicle2Color] = 0;
				PlayerInfo[playerid][pPlayerVehicle2Color2] = 0;
				PlayerInfo[playerid][PlayerVehiclePosX2] = 0;
   				PlayerInfo[playerid][PlayerVehiclePosY2] = 0;
      			PlayerInfo[playerid][PlayerVehiclePosZ2] = 0;
 				PlayerInfo[playerid][PlayerVehicleFacing2] = 0;
				PlayerInfo[playerid][PlayerVehicle2PaintJob] = 255;
				PlayerInfo[playerid][PlayerVehicle2ModSlot0] = 0;
				PlayerInfo[playerid][PlayerVehicle2ModSlot1] = 0;
				PlayerInfo[playerid][PlayerVehicle2ModSlot2] = 0;
				PlayerInfo[playerid][PlayerVehicle2ModSlot3] = 0;
				PlayerInfo[playerid][PlayerVehicle2ModSlot4] = 0;
				PlayerInfo[playerid][PlayerVehicle2ModSlot5] = 0;
				PlayerInfo[playerid][PlayerVehicle2ModSlot6] = 0;
				PlayerInfo[playerid][PlayerVehicle2ModSlot7] = 0;
				PlayerInfo[playerid][PlayerVehicle2ModSlot8] = 0;
				PlayerInfo[playerid][PlayerVehicle2ModSlot9] = 0;
				PlayerInfo[playerid][PlayerVehicle2ModSlot10] = 0;
				PlayerInfo[playerid][PlayerVehicle2ModSlot11] = 0;
				PlayerInfo[playerid][PlayerVehicle2ModSlot12] = 0;
				PlayerInfo[playerid][PlayerVehicle2ModSlot13] = 0;
				PlayerInfo[playerid][PlayerVehicle2Health] = 0;
				PlayerInfo[playerid][PlayerVehicle2Tire] = 0;
				PlayerInfo[playerid][PlayerVehicle2Upgraded] = 0;
				PlayerInfo[playerid][PlayerVehicle2Trunk] = 0;
				PlayerInfo[playerid][PlayerVehicle2Trunk2] = 0;
				PlayerInfo[playerid][PlayerVehicle2Trunk3] = 0;
				PlayerInfo[playerid][PlayerVehicle2Trunk4] = 0;
				PlayerInfo[playerid][PlayerVehicle2Trunk5] = 0;
				PlayerInfo[playerid][PlayerVehicle2Goods] = 0;
				PlayerInfo[playerid][PlayerVehicle2Fuel] = 0;
        		PlayerInfo[playerid][PlayerVehicle2ModNeon] = 0;
		    }
		    case 3:
		    {
                PlayerVehicleID3[playerid] = 0;
				PlayerInfo[playerid][PlayerVehicleModel3] = 0;
				PlayerInfo[playerid][pVehLock3] = 0;
				PlayerInfo[playerid][pVehLocked3] = 0;
				PlayerInfo[playerid][pPlayerVehicle3Color] = 0;
				PlayerInfo[playerid][pPlayerVehicle3Color2] = 0;
				PlayerInfo[playerid][PlayerVehiclePosX3] = 0;
   				PlayerInfo[playerid][PlayerVehiclePosY3] = 0;
               	PlayerInfo[playerid][PlayerVehiclePosZ3] = 0;
 				PlayerInfo[playerid][PlayerVehicleFacing3] = 0;
				PlayerInfo[playerid][PlayerVehicle3PaintJob] = 255;
				PlayerInfo[playerid][PlayerVehicle3ModSlot0] = 0;
				PlayerInfo[playerid][PlayerVehicle3ModSlot1] = 0;
				PlayerInfo[playerid][PlayerVehicle3ModSlot2] = 0;
				PlayerInfo[playerid][PlayerVehicle3ModSlot3] = 0;
				PlayerInfo[playerid][PlayerVehicle3ModSlot4] = 0;
				PlayerInfo[playerid][PlayerVehicle3ModSlot5] = 0;
				PlayerInfo[playerid][PlayerVehicle3ModSlot6] = 0;
				PlayerInfo[playerid][PlayerVehicle3ModSlot7] = 0;
				PlayerInfo[playerid][PlayerVehicle3ModSlot8] = 0;
				PlayerInfo[playerid][PlayerVehicle3ModSlot9] = 0;
				PlayerInfo[playerid][PlayerVehicle3ModSlot10] = 0;
				PlayerInfo[playerid][PlayerVehicle3ModSlot11] = 0;
				PlayerInfo[playerid][PlayerVehicle3ModSlot12] = 0;
				PlayerInfo[playerid][PlayerVehicle3ModSlot13] = 0;
				PlayerInfo[playerid][PlayerVehicle3Health] = 0;
				PlayerInfo[playerid][PlayerVehicle3Tire] = 0;
				PlayerInfo[playerid][PlayerVehicle3Upgraded] = 0;
				PlayerInfo[playerid][PlayerVehicle3Trunk] = 0;
				PlayerInfo[playerid][PlayerVehicle3Trunk2] = 0;
				PlayerInfo[playerid][PlayerVehicle3Trunk3] = 0;
				PlayerInfo[playerid][PlayerVehicle3Trunk4] = 0;
				PlayerInfo[playerid][PlayerVehicle3Trunk5] = 0;
				PlayerInfo[playerid][PlayerVehicle3Goods] = 0;
				PlayerInfo[playerid][PlayerVehicle3Fuel] = 0;
        		PlayerInfo[playerid][PlayerVehicle3ModNeon] = 0;
		    }
		    case 4:
		    {
		        PlayerVehicleID4[playerid] = 0;
				PlayerInfo[playerid][PlayerVehicleModel4] = 0;
				PlayerInfo[playerid][pVehLock4] = 0;
				PlayerInfo[playerid][pVehLocked4] = 0;
				PlayerInfo[playerid][pPlayerVehicle4Color] = 0;
				PlayerInfo[playerid][pPlayerVehicle4Color2] = 0;
				PlayerInfo[playerid][PlayerVehiclePosX4] = 0;
               	PlayerInfo[playerid][PlayerVehiclePosY4] = 0;
               	PlayerInfo[playerid][PlayerVehiclePosZ4] = 0;
 				PlayerInfo[playerid][PlayerVehicleFacing4] = 0;
				PlayerInfo[playerid][PlayerVehicle4PaintJob] = 255;
				PlayerInfo[playerid][PlayerVehicle4ModSlot0] = 0;
				PlayerInfo[playerid][PlayerVehicle4ModSlot1] = 0;
				PlayerInfo[playerid][PlayerVehicle4ModSlot2] = 0;
				PlayerInfo[playerid][PlayerVehicle4ModSlot3] = 0;
				PlayerInfo[playerid][PlayerVehicle4ModSlot4] = 0;
				PlayerInfo[playerid][PlayerVehicle4ModSlot5] = 0;
				PlayerInfo[playerid][PlayerVehicle4ModSlot6] = 0;
				PlayerInfo[playerid][PlayerVehicle4ModSlot7] = 0;
				PlayerInfo[playerid][PlayerVehicle4ModSlot8] = 0;
				PlayerInfo[playerid][PlayerVehicle4ModSlot9] = 0;
				PlayerInfo[playerid][PlayerVehicle4ModSlot10] = 0;
				PlayerInfo[playerid][PlayerVehicle4ModSlot11] = 0;
				PlayerInfo[playerid][PlayerVehicle4ModSlot12] = 0;
				PlayerInfo[playerid][PlayerVehicle4ModSlot13] = 0;
				PlayerInfo[playerid][PlayerVehicle4Health] = 0;
				PlayerInfo[playerid][PlayerVehicle4Tire] = 0;
				PlayerInfo[playerid][PlayerVehicle4Upgraded] = 0;
				PlayerInfo[playerid][PlayerVehicle4Trunk] = 0;
				PlayerInfo[playerid][PlayerVehicle4Trunk2] = 0;
				PlayerInfo[playerid][PlayerVehicle4Trunk3] = 0;
				PlayerInfo[playerid][PlayerVehicle4Trunk4] = 0;
				PlayerInfo[playerid][PlayerVehicle4Trunk5] = 0;
				PlayerInfo[playerid][PlayerVehicle4Goods] = 0;
				PlayerInfo[playerid][PlayerVehicle4Fuel] = 0;
       			PlayerInfo[playerid][PlayerVehicle4ModNeon] = 0;
		    }
		    case 5:
		    {
		        PlayerVehicleID5[playerid] = 0;
                PlayerInfo[playerid][PlayerVehicleModel5] = 0;
				PlayerInfo[playerid][pVehLock5] = 0;
				PlayerInfo[playerid][pVehLocked5] = 0;
				PlayerInfo[playerid][pPlayerVehicle5Color] = 0;
				PlayerInfo[playerid][pPlayerVehicle5Color2] = 0;
				PlayerInfo[playerid][PlayerVehiclePosX5] = 0;
   				PlayerInfo[playerid][PlayerVehiclePosY5] = 0;
               	PlayerInfo[playerid][PlayerVehiclePosZ5] = 0;
 				PlayerInfo[playerid][PlayerVehicleFacing5] = 0;
				PlayerInfo[playerid][PlayerVehicle5PaintJob] = 255;
				PlayerInfo[playerid][PlayerVehicle5ModSlot0] = 0;
				PlayerInfo[playerid][PlayerVehicle5ModSlot1] = 0;
				PlayerInfo[playerid][PlayerVehicle5ModSlot2] = 0;
				PlayerInfo[playerid][PlayerVehicle5ModSlot3] = 0;
				PlayerInfo[playerid][PlayerVehicle5ModSlot4] = 0;
				PlayerInfo[playerid][PlayerVehicle5ModSlot5] = 0;
				PlayerInfo[playerid][PlayerVehicle5ModSlot6] = 0;
				PlayerInfo[playerid][PlayerVehicle5ModSlot7] = 0;
				PlayerInfo[playerid][PlayerVehicle5ModSlot8] = 0;
				PlayerInfo[playerid][PlayerVehicle5ModSlot9] = 0;
				PlayerInfo[playerid][PlayerVehicle5ModSlot10] = 0;
				PlayerInfo[playerid][PlayerVehicle5ModSlot11] = 0;
				PlayerInfo[playerid][PlayerVehicle5ModSlot12] = 0;
				PlayerInfo[playerid][PlayerVehicle5ModSlot13] = 0;
				PlayerInfo[playerid][PlayerVehicle5Health] = 0;
				PlayerInfo[playerid][PlayerVehicle5Tire] = 0;
				PlayerInfo[playerid][PlayerVehicle5Upgraded] = 0;
				PlayerInfo[playerid][PlayerVehicle5Trunk] = 0;
				PlayerInfo[playerid][PlayerVehicle5Trunk2] = 0;
				PlayerInfo[playerid][PlayerVehicle5Trunk3] = 0;
				PlayerInfo[playerid][PlayerVehicle5Trunk4] = 0;
				PlayerInfo[playerid][PlayerVehicle5Trunk5] = 0;
				PlayerInfo[playerid][PlayerVehicle5Goods] = 0;
				PlayerInfo[playerid][PlayerVehicle5Fuel] = 0;
				PlayerInfo[playerid][PlayerVehicle5ModNeon] = 0;
		    }
		}
	}
}
stock ReloadCar(i)
{
	new carstring[256];
	new FileName[128];
 	format(FileName, sizeof(FileName), "Cars/car_%d.ini", i);
  	if(fexist(FileName))
	{
		if(i == 1)
		{
			format(carstring,sizeof(carstring),"%s For Sale | {FFF1AF}Price: $%d | {6EF83C}ID: %d",vehName[CarInfo[i][CarModel]-400],CarInfo[i][CarPrice],i);
			CarInfo[i][CarText] = Create3DTextLabel(carstring, COLOR_CAR, 0.0, 0.0, 0.0, 15.0, 0);
		 	CarInfo[i][CarID] = AddStaticVehicleEx(CarInfo[i][CarModel],CarInfo[i][CarX],CarInfo[i][CarY],CarInfo[i][CarZ],CarInfo[i][CarF],CarInfo[i][CarColor],CarInfo[i][CarColor2],1);
			Attach3DTextLabelToVehicle(CarInfo[i][CarText], CarInfo[i][CarID], 0.0, 0.0, 0.0);
			VehPlate[i] = Create3DTextLabel("(( Static Vehicle ))", COLOR_GREY, 0.0, 0.0, 0.0, 15.0, 0);
		    Attach3DTextLabelToVehicle(VehPlate[i], CarInfo[i][CarID], 0.0, 0.0, 1.3);
//		    SetVehicleVirtualWorld(i,255);
			CarInfo[i][DealerShipCar] = 1;
		}
		else
		{
			format(carstring,sizeof(carstring),"%s For Sale | {FFF1AF}Price: $%d | {6EF83C}ID: %d",vehName[CarInfo[i][CarModel]-400],CarInfo[i][CarPrice],i);
			CarInfo[i][CarText] = Create3DTextLabel(carstring, COLOR_CAR, 0.0, 0.0, 0.0, 15.0, 0);
		 	CarInfo[i][CarID] = AddStaticVehicleEx(CarInfo[i][CarModel],CarInfo[i][CarX],CarInfo[i][CarY],CarInfo[i][CarZ],CarInfo[i][CarF],CarInfo[i][CarColor],CarInfo[i][CarColor2],1);
			Attach3DTextLabelToVehicle(CarInfo[i][CarText], CarInfo[i][CarID], 0.0, 0.0, 0.0);
			VehPlate[i] = Create3DTextLabel("(( Static Vehicle ))", COLOR_GREY, 0.0, 0.0, 0.0, 15.0, 0);
		    Attach3DTextLabelToVehicle(VehPlate[i], CarInfo[i][CarID], 0.0, 0.0, 1.3);
			CarInfo[i][DealerShipCar] = 1;
		}
	}
	return 1;
}
stock ReloadCarEx(i)
{
	new carstring[256];
	new FileName[128];
 	format(FileName, sizeof(FileName), "Cars/car_%d.ini", i);
  	if(fexist(FileName))
	{
		DestroyVehicle(CarInfo[i][CarID]);
		Delete3DTextLabel(CarInfo[i][CarText]);
		Delete3DTextLabel(VehPlate[i]);
		if(i == 1)
		{
			format(carstring,sizeof(carstring),"%s For Sale | {FFF1AF}Price: $%d | {6EF83C}ID: %d",vehName[CarInfo[i][CarModel]-400],CarInfo[i][CarPrice],i);
			CarInfo[i][CarText] = Create3DTextLabel(carstring, COLOR_CAR, 0.0, 0.0, 0.0, 15.0, 0);
		 	CarInfo[i][CarID] = AddStaticVehicleEx(CarInfo[i][CarModel],CarInfo[i][CarX],CarInfo[i][CarY],CarInfo[i][CarZ],CarInfo[i][CarF],CarInfo[i][CarColor],CarInfo[i][CarColor2],1);
			Attach3DTextLabelToVehicle(CarInfo[i][CarText], CarInfo[i][CarID], 0.0, 0.0, 0.0);
			VehPlate[i] = Create3DTextLabel("(( Static Vehicle ))", COLOR_GREY, 0.0, 0.0, 0.0, 15.0, 0);
		    Attach3DTextLabelToVehicle(VehPlate[i], CarInfo[i][CarID], 0.0, 0.0, 1.3);
//		    SetVehicleVirtualWorld(i,255);
			CarInfo[i][DealerShipCar] = 1;
		}
		else
		{
			format(carstring,sizeof(carstring),"%s For Sale | {FFF1AF}Price: $%d | {6EF83C}ID: %d",vehName[CarInfo[i][CarModel]-400],CarInfo[i][CarPrice],i);
			CarInfo[i][CarText] = Create3DTextLabel(carstring, COLOR_CAR, 0.0, 0.0, 0.0, 15.0, 0);
		 	CarInfo[i][CarID] = AddStaticVehicleEx(CarInfo[i][CarModel],CarInfo[i][CarX],CarInfo[i][CarY],CarInfo[i][CarZ],CarInfo[i][CarF],CarInfo[i][CarColor],CarInfo[i][CarColor2],1); // Blade ID 56
			Attach3DTextLabelToVehicle(CarInfo[i][CarText], CarInfo[i][CarID], 0.0, 0.0, 0.0);
			VehPlate[i] = Create3DTextLabel("(( Static Vehicle ))", COLOR_GREY, 0.0, 0.0, 0.0, 15.0, 0);
		    Attach3DTextLabelToVehicle(VehPlate[i], CarInfo[i][CarID], 0.0, 0.0, 1.3);
			CarInfo[i][DealerShipCar] = 1;
		}
	}
	return 1;
}
stock SaveCar(i)
{
    new FileName[128];
   	format(FileName, sizeof(FileName), "Cars/car_%d.ini", i);
    if(fexist(FileName))
	{
       	dini_IntSet(FileName, "CarModel", CarInfo[i][CarModel]);
       	dini_IntSet(FileName, "CarPrice", CarInfo[i][CarPrice]);
		dini_FloatSet(FileName, "CarX", CarInfo[i][CarX]);
		dini_FloatSet(FileName, "CarY", CarInfo[i][CarY]);
		dini_FloatSet(FileName, "CarZ", CarInfo[i][CarZ]);
		dini_FloatSet(FileName, "CarF", CarInfo[i][CarF]);
		dini_FloatSet(FileName, "CarSpawnX", CarInfo[i][CarSpawnX]);
		dini_FloatSet(FileName, "CarSpawnY", CarInfo[i][CarSpawnY]);
		dini_FloatSet(FileName, "CarSpawnZ", CarInfo[i][CarSpawnZ]);
		dini_FloatSet(FileName, "CarSpawnF", CarInfo[i][CarSpawnF]);
       	dini_IntSet(FileName, "CarColor", CarInfo[i][CarColor]);
       	dini_IntSet(FileName, "CarColor2", CarInfo[i][CarColor2]);
		printf("[SERVER]Car_%d Saved ,Model: %s | Price: $%d",i,vehName[CarInfo[i][CarModel]-400],CarInfo[i][CarPrice]);
	}
	return 1;
}
stock SaveCars()
{
	for(new i = 0; i < SpawnedCars; i++)
	{
	    SaveCar(i);
	}
	return 1;
}
stock SaveHouse(i)
{
    new FileName[23], string[128];
    format(FileName, sizeof(FileName), "Houses/House_%d.ini", i);
    if(dini_Exists(FileName))
    {
        dini_Set(FileName, "Owner", HouseInfo[i][hOwner]);
        dini_IntSet(FileName, "Owned", HouseInfo[i][hOwned]);
        dini_IntSet(FileName, "Locked", HouseInfo[i][hLocked]);
        dini_IntSet(FileName, "Level", HouseInfo[i][hLevel]);
        dini_IntSet(FileName, "Price", HouseInfo[i][hPrice]);
        dini_IntSet(FileName, "Cash", HouseInfo[i][hCash]);
        dini_IntSet(FileName, "Crack", HouseInfo[i][hCrack]);
		dini_IntSet(FileName, "Pot", HouseInfo[i][hPot]);
		dini_IntSet(FileName, "GunParts", HouseInfo[i][hGunParts]);
		dini_IntSet(FileName, "GunLocker", HouseInfo[i][hGL]);
		dini_IntSet(FileName, "AlarmNumber", HouseInfo[i][hAlarmNumber]);
		dini_IntSet(FileName, "WeaponSlot1", HouseInfo[i][hWeaponSlot1]);
        dini_IntSet(FileName, "WeaponSlot2", HouseInfo[i][hWeaponSlot2]);
        dini_IntSet(FileName, "WeaponSlot3", HouseInfo[i][hWeaponSlot3]);
        dini_IntSet(FileName, "WeaponSlot4", HouseInfo[i][hWeaponSlot4]);
        dini_IntSet(FileName, "WeaponSlot5", HouseInfo[i][hWeaponSlot5]);
        dini_IntSet(FileName, "Rent", HouseInfo[i][hRent]);
        dini_IntSet(FileName, "Rentable", HouseInfo[i][hRentabil]);
        dini_IntSet(FileName, "ExteriorID", HouseInfo[i][hExteriorID]);
        dini_IntSet(FileName, "InteriorID", HouseInfo[i][hInteriorID]);
        dini_IntSet(FileName, "VirWorld", HouseInfo[i][hVirWorld]);
		dini_FloatSet(FileName, "InteriorX", HouseInfo[i][hInteriorX]);
    	dini_FloatSet(FileName, "InteriorY", HouseInfo[i][hInteriorY]);
		dini_FloatSet(FileName, "InteriorZ", HouseInfo[i][hInteriorZ]);
        dini_FloatSet(FileName, "ExteriorX", HouseInfo[i][hExteriorX]);
        dini_FloatSet(FileName, "ExteriorY", HouseInfo[i][hExteriorY]);
        dini_FloatSet(FileName, "ExteriorZ", HouseInfo[i][hExteriorZ]);
        if(HouseInfo[i][hOwned] == 0)
		{
			format(string, sizeof(string), "{00F200}[House For Sale]{F0CC00}\nPrice: $%d\nLevel: %d\nID: %d\nTo buy type /buyhouse", HouseInfo[i][hPrice],HouseInfo[i][hLevel], i);
			UpdateDynamic3DTextLabelText(house1[i], COLOR_DCHAT, string);
		}
		else
		{
			format(string, sizeof(string), "{00F200}[House]{F0CC00}\n%s\nRent: $%d\nLevel: %d\nID: %d\nType /rentroom to rent a room", HouseInfo[i][hOwner],HouseInfo[i][hRent], HouseInfo[i][hLevel], i);
			UpdateDynamic3DTextLabelText(house2[i], COLOR_DCHAT, string);
		}
		printf( "[system] House %d saved.", i);
    }
	return 1;
}

