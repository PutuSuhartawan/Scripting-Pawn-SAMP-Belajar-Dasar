
public OnPlayerRegister(playerid, password[])
{
	if(IsPlayerConnected(playerid))
	{
			new string3[32];
			if(adminduty[playerid] == 1)
	        {
	             format(string3, sizeof(string3), "%s.ini", PlayerInfo[playerid][pNormalName]);
	        }
   	        else
	        {
                 format(string3, sizeof(string3), "%s.ini", GetName(playerid));
	        }
			new File: hFile = fopen(string3, io_write);
			if(hFile)
			{
			    new var[64];
			    strmid(PlayerInfo[playerid][pKey], password, 0, strlen(password), 255);
				format(var, 32, "Key=%s\n", PlayerInfo[playerid][pKey]);fwrite(hFile, var);
				format(var, 32, "Level=%d\n",PlayerInfo[playerid][pLevel]);fwrite(hFile, var);
				format(var, 32, "Energy=%d\n",PlayerInfo[playerid][pEnergy]);fwrite(hFile, var);
				format(var, 32, "Compo=%d\n",PlayerInfo[playerid][pCompo]);fwrite(hFile, var);
				format(var, 32, "IDC=%d\n",PlayerInfo[playerid][pIDC]);fwrite(hFile, var);
				format(var, 32, "AdminLevel=%d\n",PlayerInfo[playerid][pAdmin]);fwrite(hFile, var);
				format(var, 32, "Band=%d\n",PlayerInfo[playerid][pBand]);fwrite(hFile, var);
				format(var, 32, "PermBand=%d\n",PlayerInfo[playerid][pPermBand]);fwrite(hFile, var);
				format(var, 32, "Warn=%d\n",PlayerInfo[playerid][pWarns]);fwrite(hFile, var);
				format(var, 32, "DonateRank=%d\n",PlayerInfo[playerid][pDonateRank]);fwrite(hFile, var);
				format(var, 32, "DonateTime=%d\n",PlayerInfo[playerid][pDonateTime]);fwrite(hFile, var);
    			format(var, 32, "FactionBanned=%d\n",PlayerInfo[playerid][pFactionBanned]);fwrite(hFile, var);
    			format(var, 32, "FCard=%d\n",PlayerInfo[playerid][pFcard]);fwrite(hFile, var);
    			format(var, 32, "Inbuilding=%d\n",PlayerInfo[playerid][Inbuilding]);fwrite(hFile, var);
				format(var, 32, "GangMod=%d\n",PlayerInfo[playerid][pGangMod]);fwrite(hFile, var);
  				format(var, 32, "buildingInterior=%d\n", PlayerInfo[playerid][buildingInterior]);fwrite(hFile, var);
        		format(var, 32, "buildingExterior=%d\n", PlayerInfo[playerid][buildingExterior]);fwrite(hFile, var);
        		format(var, 32, "cExtX=%.1f\n", PlayerInfo[playerid][cExtX]);fwrite(hFile, var);
        		format(var, 32, "cExtY=%.1f\n", PlayerInfo[playerid][cExtY]);fwrite(hFile, var);
        		format(var, 32, "cExtZ=%.1f\n", PlayerInfo[playerid][cExtZ]);fwrite(hFile, var);
				format(var, 32, "cIntX=%.1f\n", PlayerInfo[playerid][cIntX]);fwrite(hFile, var);
				format(var, 32, "cIntY=%.1f\n", PlayerInfo[playerid][cIntY]);fwrite(hFile, var);
				format(var, 32, "cIntZ=%.1f\n", PlayerInfo[playerid][cIntZ]);fwrite(hFile, var);
  			 	format(var, 32, "FactionMod=%d\n",PlayerInfo[playerid][pFactionMod]);fwrite(hFile, var);
				format(var, 32, "UpgradePoints=%d\n",PlayerInfo[playerid][gPupgrade]);fwrite(hFile, var);
				format(var, 32, "Inmotel=%d\n",PlayerInfo[playerid][Inmotel]);fwrite(hFile, var);
				format(var, 32, "motelInterior=%d\n", PlayerInfo[playerid][motelInterior]);fwrite(hFile, var);
        		format(var, 32, "motelExterior=%d\n", PlayerInfo[playerid][motelExterior]);fwrite(hFile, var);
        		format(var, 32, "mExtX=%.1f\n", PlayerInfo[playerid][mExtX]);fwrite(hFile, var);
        		format(var, 32, "mExtY=%.1f\n", PlayerInfo[playerid][mExtY]);fwrite(hFile, var);
        		format(var, 32, "mExtZ=%.1f\n", PlayerInfo[playerid][mExtZ]);fwrite(hFile, var);
				format(var, 32, "mIntX=%.1f\n", PlayerInfo[playerid][mIntX]);fwrite(hFile, var);
				format(var, 32, "mIntY=%.1f\n", PlayerInfo[playerid][mIntY]);fwrite(hFile, var);
				format(var, 32, "mIntZ=%.1f\n", PlayerInfo[playerid][mIntZ]);fwrite(hFile, var);
				format(var, 32, "ConnectedTime=%d\n",PlayerInfo[playerid][pConnectTime]);fwrite(hFile, var);
				format(var, 32, "dExtX=%.1f\n", PlayerInfo[playerid][dExtX]);fwrite(hFile, var);
        		format(var, 32, "dExtY=%.1f\n", PlayerInfo[playerid][dExtY]);fwrite(hFile, var);
        		format(var, 32, "dExtZ=%.1f\n", PlayerInfo[playerid][dExtZ]);fwrite(hFile, var);
        		format(var, 32, "dAngle=%.1f\n", PlayerInfo[playerid][dAngle]);fwrite(hFile, var);
				format(var, 32, "Registered=%d\n",PlayerInfo[playerid][pReg]);fwrite(hFile, var);
				format(var, 32, "Body0=%d\n",pBody[playerid][0]);fwrite(hFile, var);
				format(var, 32, "Body1=%d\n",pBody[playerid][1]);fwrite(hFile, var);
				format(var, 32, "Body2=%d\n",pBody[playerid][2]);fwrite(hFile, var);
				format(var, 32, "Body3=%d\n",pBody[playerid][3]);fwrite(hFile, var);
				format(var, 32, "Body4=%d\n",pBody[playerid][4]);fwrite(hFile, var);
				format(var, 32, "Body5=%d\n",pBody[playerid][5]);fwrite(hFile, var);
				format(var, 32, "Body6=%d\n",pBody[playerid][6]);fwrite(hFile, var);
				format(var, 32, "Body7=%d\n",pBody[playerid][7]);fwrite(hFile, var);
				format(var, 32, "Body8=%d\n",pBody[playerid][8]);fwrite(hFile, var);
				format(var, 32, "Body9=%d\n",pBody[playerid][9]);fwrite(hFile, var);
				format(var, 32, "Body10=%d\n",pBody[playerid][10]);fwrite(hFile, var);
				format(var, 32, "Body11=%d\n",pBody[playerid][11]);fwrite(hFile, var);
				format(var, 32, "Body12=%d\n",pBody[playerid][12]);fwrite(hFile, var);
				format(var, 32, "Body13=%d\n",pBody[playerid][13]);fwrite(hFile, var);
				format(var, 32, "Body14=%d\n",pBody[playerid][14]);fwrite(hFile, var);
				format(var, 32, "Body15=%d\n",pBody[playerid][15]);fwrite(hFile, var);
				format(var, 32, "Body16=%d\n",pBody[playerid][16]);fwrite(hFile, var);
				format(var, 32, "Body17=%d\n",pBody[playerid][17]);fwrite(hFile, var);
				format(var, 32, "Body18=%d\n",pBody[playerid][18]);fwrite(hFile, var);
				format(var, 32, "Fish1=%s\n",Fishes[playerid][pFish1]);fwrite(hFile, var);
				format(var, 32, "Fish2=%s\n",Fishes[playerid][pFish2]);fwrite(hFile, var);
				format(var, 32, "Fish3=%s\n",Fishes[playerid][pFish3]);fwrite(hFile, var);
				format(var, 32, "Fish4=%s\n",Fishes[playerid][pFish4]);fwrite(hFile, var);
				format(var, 32, "Fish5=%s\n",Fishes[playerid][pFish5]);fwrite(hFile, var);
				format(var, 32, "Weight1=%d\n",Fishes[playerid][pWeight1]);fwrite(hFile, var);
				format(var, 32, "Weight2=%d\n",Fishes[playerid][pWeight2]);fwrite(hFile, var);
				format(var, 32, "Weight3=%d\n",Fishes[playerid][pWeight3]);fwrite(hFile, var);
				format(var, 32, "Weight4=%d\n",Fishes[playerid][pWeight4]);fwrite(hFile, var);
				format(var, 32, "Weight5=%d\n",Fishes[playerid][pWeight5]);fwrite(hFile, var);
				format(var, 32, "Sex=%d\n",PlayerInfo[playerid][pSex]);fwrite(hFile, var);
				format(var, 32, "Age=%d\n",PlayerInfo[playerid][pAge]);fwrite(hFile, var);
				format(var, 32, "PIN=%d\n",PlayerInfo[playerid][pPIN]);fwrite(hFile, var);
				format(var, 32, "RPBoost=%d\n",PlayerInfo[playerid][pRPBoost]);fwrite(hFile, var);
				format(var, 32, "Origin=%d\n",PlayerInfo[playerid][pOrigin]);fwrite(hFile, var);
				format(var, 32, "ATMcard=%d\n",PlayerInfo[playerid][pATMcard]);fwrite(hFile, var);
				format(var, 32, "Muted=%d\n",PlayerInfo[playerid][pMuted]);fwrite(hFile, var);
				format(var, 32, "Respect=%d\n",PlayerInfo[playerid][pExp]);fwrite(hFile, var);
				format(var, 32, "Money=%d\n",PlayerInfo[playerid][pCash]);fwrite(hFile, var);
				format(var, 32, "ATMExterior=%d\n", PlayerInfo[playerid][ATMExterior]);fwrite(hFile, var);
				format(var, 32, "MAPBExterior=%d\n", PlayerInfo[playerid][MAPBExterior]);fwrite(hFile, var);
				format(var, 32, "GSTATIONExterior=%d\n", PlayerInfo[playerid][GSTATIONExterior]);fwrite(hFile, var);
				format(var, 32, "HSSignExterior=%d\n", PlayerInfo[playerid][HSSignExterior]);fwrite(hFile, var);
				format(var, 32, "CasinoWinnings=%d\n",PlayerInfo[playerid][pCasinoWinnings]);fwrite(hFile, var);
				format(var, 32, "Bank=%d\n",PlayerInfo[playerid][pAccount]);fwrite(hFile, var);
				format(var, 32, "Crimes=%d\n",PlayerInfo[playerid][pCrimes]);fwrite(hFile, var);
				format(var, 32, "Accent=%s\n",Accent[playerid]);fwrite(hFile, var);
				format(var, 32, "ATMID=%d\n",PlayerInfo[playerid][ATMID]);fwrite(hFile, var);
   				format(var, 32, "Kills=%d\n",PlayerInfo[playerid][pKills]);fwrite(hFile, var);
				format(var, 32, "Deaths=%d\n",PlayerInfo[playerid][pDeaths]);fwrite(hFile, var);
				format(var, 32, "TrashSkill=%d\n",PlayerInfo[playerid][pTrashSkill]);fwrite(hFile, var); // Trashman
				format(var, 32, "CHits=%d\n",PlayerInfo[playerid][pCHits]);fwrite(hFile, var);
				format(var, 32, "ItemSlot1=%d\n",PlayerInfo[playerid][ItemSlot1]);fwrite(hFile, var);
				format(var, 32, "ItemHide1=%d\n",PlayerInfo[playerid][ItemHide1]);fwrite(hFile, var);
				format(var, 64, "ItemColor=%d\n",PlayerInfo[playerid][ItemColor]);fwrite(hFile, var);
				format(var, 32, "ItemID=%d\n",PlayerInfo[playerid][ItemID]);fwrite(hFile, var);
				format(var, 32, "ItemBone=%d\n",PlayerInfo[playerid][ItemBone]);fwrite(hFile, var);
				format(var, 32, "ItemOffsetX=%f\n", PlayerInfo[playerid][ItemOffsetX]);fwrite(hFile, var);
				format(var, 32, "ItemOffsetY=%f\n", PlayerInfo[playerid][ItemOffsetY]);fwrite(hFile, var);
				format(var, 32, "ItemOffsetZ=%f\n", PlayerInfo[playerid][ItemOffsetZ]);fwrite(hFile, var);
				format(var, 32, "ItemRotX=%f\n", PlayerInfo[playerid][ItemRotX]);fwrite(hFile, var);
				format(var, 32, "ItemRotY=%f\n", PlayerInfo[playerid][ItemRotY]);fwrite(hFile, var);
				format(var, 32, "ItemRotZ=%f\n", PlayerInfo[playerid][ItemRotZ]);fwrite(hFile, var);
				format(var, 32, "ItemScaleX=%f\n", PlayerInfo[playerid][ItemScaleX]);fwrite(hFile, var);
				format(var, 32, "ItemScaleY=%f\n", PlayerInfo[playerid][ItemScaleY]);fwrite(hFile, var);
				format(var, 32, "ItemScaleZ=%f\n", PlayerInfo[playerid][ItemScaleZ]);fwrite(hFile, var);
				format(var, 32, "ItemSlot2=%d\n",PlayerInfo[playerid][ItemSlot2]);fwrite(hFile, var);
				format(var, 32, "ItemHide2=%d\n",PlayerInfo[playerid][ItemHide2]);fwrite(hFile, var);
				format(var, 64, "Item2Color=%d\n",PlayerInfo[playerid][Item2Color]);fwrite(hFile, var);
				format(var, 32, "Item2ID=%d\n",PlayerInfo[playerid][Item2ID]);fwrite(hFile, var);
				format(var, 32, "Item2Bone=%d\n",PlayerInfo[playerid][Item2Bone]);fwrite(hFile, var);
				format(var, 32, "Item2OffsetX=%f\n", PlayerInfo[playerid][Item2OffsetX]);fwrite(hFile, var);
				format(var, 32, "Item2OffsetY=%f\n", PlayerInfo[playerid][Item2OffsetY]);fwrite(hFile, var);
				format(var, 32, "Item2OffsetZ=%f\n", PlayerInfo[playerid][Item2OffsetZ]);fwrite(hFile, var);
				format(var, 32, "Item2RotX=%f\n", PlayerInfo[playerid][Item2RotX]);fwrite(hFile, var);
				format(var, 32, "Item2RotY=%f\n", PlayerInfo[playerid][Item2RotY]);fwrite(hFile, var);
				format(var, 32, "Item2RotZ=%f\n", PlayerInfo[playerid][Item2RotZ]);fwrite(hFile, var);
				format(var, 32, "Item2ScaleX=%f\n", PlayerInfo[playerid][Item2ScaleX]);fwrite(hFile, var);
				format(var, 32, "Item2ScaleY=%f\n", PlayerInfo[playerid][Item2ScaleY]);fwrite(hFile, var);
				format(var, 32, "Item2ScaleZ=%f\n", PlayerInfo[playerid][Item2ScaleZ]);fwrite(hFile, var);
				format(var, 32, "ItemSlot3=%d\n",PlayerInfo[playerid][ItemSlot3]);fwrite(hFile, var);
				format(var, 32, "ItemHide3=%d\n",PlayerInfo[playerid][ItemHide3]);fwrite(hFile, var);
				format(var, 64, "Item3Color=%d\n",PlayerInfo[playerid][Item3Color]);fwrite(hFile, var);
				format(var, 32, "Item3ID=%d\n",PlayerInfo[playerid][Item3ID]);fwrite(hFile, var);
				format(var, 32, "Item3Bone=%d\n",PlayerInfo[playerid][Item3Bone]);fwrite(hFile, var);
				format(var, 32, "Item3OffsetX=%f\n", PlayerInfo[playerid][Item3OffsetX]);fwrite(hFile, var);
				format(var, 32, "Item3OffsetY=%f\n", PlayerInfo[playerid][Item3OffsetY]);fwrite(hFile, var);
				format(var, 32, "Item3OffsetZ=%f\n", PlayerInfo[playerid][Item3OffsetZ]);fwrite(hFile, var);
				format(var, 32, "Item3RotX=%f\n", PlayerInfo[playerid][Item3RotX]);fwrite(hFile, var);
				format(var, 32, "Item3RotY=%f\n", PlayerInfo[playerid][Item3RotY]);fwrite(hFile, var);
				format(var, 32, "Item3RotZ=%f\n", PlayerInfo[playerid][Item3RotZ]);fwrite(hFile, var);
				format(var, 32, "Item3ScaleX=%f\n", PlayerInfo[playerid][Item3ScaleX]);fwrite(hFile, var);
				format(var, 32, "Item3ScaleY=%f\n", PlayerInfo[playerid][Item3ScaleY]);fwrite(hFile, var);
				format(var, 32, "Item3ScaleZ=%f\n", PlayerInfo[playerid][Item3ScaleZ]);fwrite(hFile, var);
				format(var, 32, "ItemSlot4=%d\n",PlayerInfo[playerid][ItemSlot4]);fwrite(hFile, var);
				format(var, 32, "ItemHide4=%d\n",PlayerInfo[playerid][ItemHide4]);fwrite(hFile, var);
				format(var, 64, "Item4Color=%d\n",PlayerInfo[playerid][Item4Color]);fwrite(hFile, var);
				format(var, 32, "Item4ID=%d\n",PlayerInfo[playerid][Item4ID]);fwrite(hFile, var);
				format(var, 32, "Item4Bone=%d\n",PlayerInfo[playerid][Item4Bone]);fwrite(hFile, var);
				format(var, 32, "Item4OffsetX=%f\n", PlayerInfo[playerid][Item4OffsetX]);fwrite(hFile, var);
				format(var, 32, "Item4OffsetY=%f\n", PlayerInfo[playerid][Item4OffsetY]);fwrite(hFile, var);
				format(var, 32, "Item4OffsetZ=%f\n", PlayerInfo[playerid][Item4OffsetZ]);fwrite(hFile, var);
				format(var, 32, "Item4RotX=%f\n", PlayerInfo[playerid][Item4RotX]);fwrite(hFile, var);
				format(var, 32, "Item4RotY=%f\n", PlayerInfo[playerid][Item4RotY]);fwrite(hFile, var);
				format(var, 32, "Item4RotZ=%f\n", PlayerInfo[playerid][Item4RotZ]);fwrite(hFile, var);
				format(var, 32, "Item4ScaleX=%f\n", PlayerInfo[playerid][Item4ScaleX]);fwrite(hFile, var);
				format(var, 32, "Item4ScaleY=%f\n", PlayerInfo[playerid][Item4ScaleY]);fwrite(hFile, var);
				format(var, 32, "Item4ScaleZ=%f\n", PlayerInfo[playerid][Item4ScaleZ]);fwrite(hFile, var);
				format(var, 32, "ItemSlot5=%d\n",PlayerInfo[playerid][ItemSlot5]);fwrite(hFile, var);
				format(var, 32, "ItemHide5=%d\n",PlayerInfo[playerid][ItemHide5]);fwrite(hFile, var);
				format(var, 64, "Item5Color=%d\n",PlayerInfo[playerid][Item5Color]);fwrite(hFile, var);
				format(var, 32, "Item5ID=%d\n",PlayerInfo[playerid][Item5ID]);fwrite(hFile, var);
				format(var, 32, "Item5Bone=%d\n",PlayerInfo[playerid][Item5Bone]);fwrite(hFile, var);
				format(var, 32, "Item5OffsetX=%f\n", PlayerInfo[playerid][Item5OffsetX]);fwrite(hFile, var);
				format(var, 32, "Item5OffsetY=%f\n", PlayerInfo[playerid][Item5OffsetY]);fwrite(hFile, var);
				format(var, 32, "Item5OffsetZ=%f\n", PlayerInfo[playerid][Item5OffsetZ]);fwrite(hFile, var);
				format(var, 32, "Item5RotX=%f\n", PlayerInfo[playerid][Item5RotX]);fwrite(hFile, var);
				format(var, 32, "Item5RotY=%f\n", PlayerInfo[playerid][Item5RotY]);fwrite(hFile, var);
				format(var, 32, "Item5RotZ=%f\n", PlayerInfo[playerid][Item5RotZ]);fwrite(hFile, var);
				format(var, 32, "Item5ScaleX=%f\n", PlayerInfo[playerid][ItemScaleX]);fwrite(hFile, var);
				format(var, 32, "Item5ScaleY=%f\n", PlayerInfo[playerid][ItemScaleY]);fwrite(hFile, var);
				format(var, 32, "Item5ScaleZ=%f\n", PlayerInfo[playerid][ItemScaleZ]);fwrite(hFile, var);
				format(var, 32, "FHits=%d\n",PlayerInfo[playerid][pFHits]);fwrite(hFile, var);
				format(var, 32, "Arrested=%d\n",PlayerInfo[playerid][pArrested]);fwrite(hFile, var);
				////////////////Vehicle 1
				format(var, 32, "PlayerVehicleModel1=%d\n",PlayerInfo[playerid][PlayerVehicleModel1]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicleFacing1=%.1f\n",PlayerInfo[playerid][PlayerVehicleFacing1]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle1Color=%d\n",PlayerInfo[playerid][pPlayerVehicle1Color]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle1Color2=%d\n",PlayerInfo[playerid][pPlayerVehicle1Color2]);fwrite(hFile, var);
				format(var, 32, "PlayerVehiclePosX1=%.1f\n",PlayerInfo[playerid][PlayerVehiclePosX1]);fwrite(hFile, var);
				format(var, 32, "PlayerVehiclePosY1=%.1f\n",PlayerInfo[playerid][PlayerVehiclePosY1]);fwrite(hFile, var);
				format(var, 32, "PlayerVehiclePosZ1=%.1f\n",PlayerInfo[playerid][PlayerVehiclePosZ1]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle1PaintJob=%d\n",PlayerInfo[playerid][PlayerVehicle1PaintJob]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle1ModSlot0=%d\n",PlayerInfo[playerid][PlayerVehicle1ModSlot0]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle1ModSlot1=%d\n",PlayerInfo[playerid][PlayerVehicle1ModSlot1]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle1ModSlot2=%d\n",PlayerInfo[playerid][PlayerVehicle1ModSlot2]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle1ModSlot3=%d\n",PlayerInfo[playerid][PlayerVehicle1ModSlot3]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle1ModSlot4=%d\n",PlayerInfo[playerid][PlayerVehicle1ModSlot4]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle1ModSlot5=%d\n",PlayerInfo[playerid][PlayerVehicle1ModSlot5]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle1ModSlot6=%d\n",PlayerInfo[playerid][PlayerVehicle1ModSlot6]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle1ModSlot7=%d\n",PlayerInfo[playerid][PlayerVehicle1ModSlot7]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle1ModSlot8=%d\n",PlayerInfo[playerid][PlayerVehicle1ModSlot8]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle1ModSlot9=%d\n",PlayerInfo[playerid][PlayerVehicle1ModSlot9]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle1ModSlot10=%d\n",PlayerInfo[playerid][PlayerVehicle1ModSlot10]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle1ModSlot11=%d\n",PlayerInfo[playerid][PlayerVehicle1ModSlot11]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle1ModSlot12=%d\n",PlayerInfo[playerid][PlayerVehicle1ModSlot12]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle1ModSlot13=%d\n",PlayerInfo[playerid][PlayerVehicle1ModSlot13]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle1ModNeon=%d\n",PlayerInfo[playerid][PlayerVehicle1ModNeon]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle1Tire=%d\n",PlayerInfo[playerid][PlayerVehicle1Tire]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle1Upgraded=%d\n",PlayerInfo[playerid][PlayerVehicle1Upgraded]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle1Trunk=%d\n",PlayerInfo[playerid][PlayerVehicle1Trunk]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle1Trunk2=%d\n",PlayerInfo[playerid][PlayerVehicle1Trunk2]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle1Trunk3=%d\n",PlayerInfo[playerid][PlayerVehicle1Trunk3]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle1Trunk4=%d\n",PlayerInfo[playerid][PlayerVehicle1Trunk4]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle1Trunk5=%d\n",PlayerInfo[playerid][PlayerVehicle1Trunk5]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle1Fuel=%d\n",PlayerInfo[playerid][PlayerVehicle1Fuel]);fwrite(hFile, var);
				format(var, 64, "PlayerVehicle1Plate=%s\n",PlayerInfo[playerid][PlayerVehicle1Plate]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle1Goods=%d\n",PlayerInfo[playerid][PlayerVehicle1Goods]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle1Health=%.1f\n",PlayerInfo[playerid][PlayerVehicle1Health]);fwrite(hFile, var);
				format(var, 32, "VehLock1=%d\n",PlayerInfo[playerid][pVehLock1]);fwrite(hFile, var);
				format(var, 32, "VehLocked1=%d\n",PlayerInfo[playerid][pVehLocked1]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle1Interior=%d\n",PlayerInfo[playerid][PlayerVehicle1Interior]);fwrite(hFile, var);
                format(var, 32, "PlayerVehicle1VirWorld=%d\n",PlayerInfo[playerid][PlayerVehicle1VirWorld]);fwrite(hFile, var);
				///////////////Vehicle 2
				format(var, 32, "PlayerVehicleModel2=%d\n",PlayerInfo[playerid][PlayerVehicleModel2]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicleFacing2=%.1f\n",PlayerInfo[playerid][PlayerVehicleFacing2]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle2Color=%d\n",PlayerInfo[playerid][pPlayerVehicle2Color]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle2Color2=%d\n",PlayerInfo[playerid][pPlayerVehicle2Color2]);fwrite(hFile, var);
				format(var, 32, "PlayerVehiclePosX2=%.1f\n",PlayerInfo[playerid][PlayerVehiclePosX2]);fwrite(hFile, var);
				format(var, 32, "PlayerVehiclePosY2=%.1f\n",PlayerInfo[playerid][PlayerVehiclePosY2]);fwrite(hFile, var);
				format(var, 32, "PlayerVehiclePosZ2=%.1f\n",PlayerInfo[playerid][PlayerVehiclePosZ2]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle2PaintJob=%d\n",PlayerInfo[playerid][PlayerVehicle2PaintJob]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle2ModSlot0=%d\n",PlayerInfo[playerid][PlayerVehicle2ModSlot0]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle2ModSlot1=%d\n",PlayerInfo[playerid][PlayerVehicle2ModSlot1]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle2ModSlot2=%d\n",PlayerInfo[playerid][PlayerVehicle2ModSlot2]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle2ModSlot3=%d\n",PlayerInfo[playerid][PlayerVehicle2ModSlot3]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle2ModSlot4=%d\n",PlayerInfo[playerid][PlayerVehicle2ModSlot4]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle2ModSlot5=%d\n",PlayerInfo[playerid][PlayerVehicle2ModSlot5]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle2ModSlot6=%d\n",PlayerInfo[playerid][PlayerVehicle2ModSlot6]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle2ModSlot7=%d\n",PlayerInfo[playerid][PlayerVehicle2ModSlot7]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle2ModSlot8=%d\n",PlayerInfo[playerid][PlayerVehicle2ModSlot8]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle2ModSlot9=%d\n",PlayerInfo[playerid][PlayerVehicle2ModSlot9]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle2ModSlot10=%d\n",PlayerInfo[playerid][PlayerVehicle2ModSlot10]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle2ModSlot11=%d\n",PlayerInfo[playerid][PlayerVehicle2ModSlot11]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle2ModSlot12=%d\n",PlayerInfo[playerid][PlayerVehicle2ModSlot12]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle2ModSlot13=%d\n",PlayerInfo[playerid][PlayerVehicle2ModSlot13]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle2ModNeon=%d\n",PlayerInfo[playerid][PlayerVehicle2ModNeon]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle2Tire=%d\n",PlayerInfo[playerid][PlayerVehicle2Tire]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle2Upgraded=%d\n",PlayerInfo[playerid][PlayerVehicle2Upgraded]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle2Trunk=%d\n",PlayerInfo[playerid][PlayerVehicle2Trunk]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle2Trunk2=%d\n",PlayerInfo[playerid][PlayerVehicle2Trunk2]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle2Trunk3=%d\n",PlayerInfo[playerid][PlayerVehicle2Trunk3]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle2Trunk4=%d\n",PlayerInfo[playerid][PlayerVehicle2Trunk4]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle2Trunk5=%d\n",PlayerInfo[playerid][PlayerVehicle2Trunk5]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle2Goods=%d\n",PlayerInfo[playerid][PlayerVehicle2Goods]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle2Fuel=%d\n",PlayerInfo[playerid][PlayerVehicle2Fuel]);fwrite(hFile, var);
				format(var, 64, "PlayerVehicle2Plate=%s\n",PlayerInfo[playerid][PlayerVehicle2Plate]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle2Health=%.1f\n",PlayerInfo[playerid][PlayerVehicle2Health]);fwrite(hFile, var);
				format(var, 32, "VehLock2=%d\n",PlayerInfo[playerid][pVehLock2]);fwrite(hFile, var);
				format(var, 32, "VehLocked2=%d\n",PlayerInfo[playerid][pVehLocked2]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle2Interior=%d\n",PlayerInfo[playerid][PlayerVehicle2Interior]);fwrite(hFile, var);
                format(var, 32, "PlayerVehicle2VirWorld=%d\n",PlayerInfo[playerid][PlayerVehicle2VirWorld]);fwrite(hFile, var);
				////////////////Vehicle 3
				format(var, 32, "PlayerVehicleModel3=%d\n",PlayerInfo[playerid][PlayerVehicleModel3]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicleFacing3=%.1f\n",PlayerInfo[playerid][PlayerVehicleFacing3]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle3Color=%d\n",PlayerInfo[playerid][pPlayerVehicle3Color]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle3Color2=%d\n",PlayerInfo[playerid][pPlayerVehicle3Color2]);fwrite(hFile, var);
				format(var, 32, "PlayerVehiclePosX3=%.1f\n",PlayerInfo[playerid][PlayerVehiclePosX3]);fwrite(hFile, var);
				format(var, 32, "PlayerVehiclePosY3=%.1f\n",PlayerInfo[playerid][PlayerVehiclePosY3]);fwrite(hFile, var);
				format(var, 32, "PlayerVehiclePosZ3=%.1f\n",PlayerInfo[playerid][PlayerVehiclePosZ3]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle3PaintJob=%d\n",PlayerInfo[playerid][PlayerVehicle3PaintJob]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle3ModSlot0=%d\n",PlayerInfo[playerid][PlayerVehicle3ModSlot0]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle3ModSlot1=%d\n",PlayerInfo[playerid][PlayerVehicle3ModSlot1]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle3ModSlot2=%d\n",PlayerInfo[playerid][PlayerVehicle3ModSlot2]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle3ModSlot3=%d\n",PlayerInfo[playerid][PlayerVehicle3ModSlot3]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle3ModSlot4=%d\n",PlayerInfo[playerid][PlayerVehicle3ModSlot4]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle3ModSlot5=%d\n",PlayerInfo[playerid][PlayerVehicle3ModSlot5]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle3ModSlot6=%d\n",PlayerInfo[playerid][PlayerVehicle3ModSlot6]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle3ModSlot7=%d\n",PlayerInfo[playerid][PlayerVehicle3ModSlot7]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle3ModSlot8=%d\n",PlayerInfo[playerid][PlayerVehicle3ModSlot8]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle3ModSlot9=%d\n",PlayerInfo[playerid][PlayerVehicle3ModSlot9]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle3ModSlot10=%d\n",PlayerInfo[playerid][PlayerVehicle3ModSlot10]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle3ModSlot11=%d\n",PlayerInfo[playerid][PlayerVehicle3ModSlot11]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle3ModSlot12=%d\n",PlayerInfo[playerid][PlayerVehicle3ModSlot12]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle3ModSlot13=%d\n",PlayerInfo[playerid][PlayerVehicle3ModSlot13]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle3ModNeon=%d\n",PlayerInfo[playerid][PlayerVehicle3ModNeon]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle3Tire=%d\n",PlayerInfo[playerid][PlayerVehicle3Tire]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle3Upgraded=%d\n",PlayerInfo[playerid][PlayerVehicle3Upgraded]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle3Trunk=%d\n",PlayerInfo[playerid][PlayerVehicle3Trunk]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle3Trunk2=%d\n",PlayerInfo[playerid][PlayerVehicle3Trunk2]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle3Trunk3=%d\n",PlayerInfo[playerid][PlayerVehicle3Trunk3]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle3Trunk4=%d\n",PlayerInfo[playerid][PlayerVehicle3Trunk4]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle3Trunk5=%d\n",PlayerInfo[playerid][PlayerVehicle3Trunk5]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle3Goods=%d\n",PlayerInfo[playerid][PlayerVehicle3Goods]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle3Fuel=%d\n",PlayerInfo[playerid][PlayerVehicle3Fuel]);fwrite(hFile, var);
				format(var, 64, "PlayerVehicle3Plate=%s\n",PlayerInfo[playerid][PlayerVehicle3Plate]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle3Health=%.1f\n",PlayerInfo[playerid][PlayerVehicle3Health]);fwrite(hFile, var);
				format(var, 32, "VehLock3=%d\n",PlayerInfo[playerid][pVehLock3]);fwrite(hFile, var);
				format(var, 32, "VehLocked3=%d\n",PlayerInfo[playerid][pVehLocked3]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle3Interior=%d\n",PlayerInfo[playerid][PlayerVehicle3Interior]);fwrite(hFile, var);
                format(var, 32, "PlayerVehicle3VirWorld=%d\n",PlayerInfo[playerid][PlayerVehicle3VirWorld]);fwrite(hFile, var);
				////////////////Vehicle 4
				format(var, 32, "PlayerVehicleModel4=%d\n",PlayerInfo[playerid][PlayerVehicleModel4]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicleFacing4=%.1f\n",PlayerInfo[playerid][PlayerVehicleFacing4]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle4Color=%d\n",PlayerInfo[playerid][pPlayerVehicle4Color]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle4Color2=%d\n",PlayerInfo[playerid][pPlayerVehicle4Color2]);fwrite(hFile, var);
				format(var, 32, "PlayerVehiclePosX4=%.1f\n",PlayerInfo[playerid][PlayerVehiclePosX4]);fwrite(hFile, var);
				format(var, 32, "PlayerVehiclePosY4=%.1f\n",PlayerInfo[playerid][PlayerVehiclePosY4]);fwrite(hFile, var);
				format(var, 32, "PlayerVehiclePosZ4=%.1f\n",PlayerInfo[playerid][PlayerVehiclePosZ4]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle4PaintJob=%d\n",PlayerInfo[playerid][PlayerVehicle4PaintJob]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle4ModSlot0=%d\n",PlayerInfo[playerid][PlayerVehicle4ModSlot0]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle4ModSlot1=%d\n",PlayerInfo[playerid][PlayerVehicle4ModSlot1]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle4ModSlot2=%d\n",PlayerInfo[playerid][PlayerVehicle4ModSlot2]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle4ModSlot3=%d\n",PlayerInfo[playerid][PlayerVehicle4ModSlot3]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle4ModSlot4=%d\n",PlayerInfo[playerid][PlayerVehicle4ModSlot4]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle4ModSlot5=%d\n",PlayerInfo[playerid][PlayerVehicle4ModSlot5]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle4ModSlot6=%d\n",PlayerInfo[playerid][PlayerVehicle4ModSlot6]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle4ModSlot7=%d\n",PlayerInfo[playerid][PlayerVehicle4ModSlot7]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle4ModSlot8=%d\n",PlayerInfo[playerid][PlayerVehicle4ModSlot8]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle4ModSlot9=%d\n",PlayerInfo[playerid][PlayerVehicle4ModSlot9]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle4ModSlot10=%d\n",PlayerInfo[playerid][PlayerVehicle4ModSlot10]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle4ModSlot11=%d\n",PlayerInfo[playerid][PlayerVehicle4ModSlot11]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle4ModSlot12=%d\n",PlayerInfo[playerid][PlayerVehicle4ModSlot12]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle4ModSlot13=%d\n",PlayerInfo[playerid][PlayerVehicle4ModSlot13]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle4ModNeon=%d\n",PlayerInfo[playerid][PlayerVehicle4ModNeon]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle4Tire=%d\n",PlayerInfo[playerid][PlayerVehicle4Tire]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle4Upgraded=%d\n",PlayerInfo[playerid][PlayerVehicle4Upgraded]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle4Trunk=%d\n",PlayerInfo[playerid][PlayerVehicle4Trunk]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle4Trunk2=%d\n",PlayerInfo[playerid][PlayerVehicle4Trunk2]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle4Trunk3=%d\n",PlayerInfo[playerid][PlayerVehicle4Trunk3]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle4Trunk4=%d\n",PlayerInfo[playerid][PlayerVehicle4Trunk4]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle4Trunk5=%d\n",PlayerInfo[playerid][PlayerVehicle4Trunk5]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle4Goods=%d\n",PlayerInfo[playerid][PlayerVehicle4Goods]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle4Fuel=%d\n",PlayerInfo[playerid][PlayerVehicle4Fuel]);fwrite(hFile, var);
				format(var, 64, "PlayerVehicle4Plate=%s\n",PlayerInfo[playerid][PlayerVehicle4Plate]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle4Health=%.1f\n",PlayerInfo[playerid][PlayerVehicle4Health]);fwrite(hFile, var);
				format(var, 32, "VehLock4=%d\n",PlayerInfo[playerid][pVehLock4]);fwrite(hFile, var);
				format(var, 32, "VehLocked4=%d\n",PlayerInfo[playerid][pVehLocked4]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle4Interior=%d\n",PlayerInfo[playerid][PlayerVehicle4Interior]);fwrite(hFile, var);
                format(var, 32, "PlayerVehicle4VirWorld=%d\n",PlayerInfo[playerid][PlayerVehicle4VirWorld]);fwrite(hFile, var);
				////////////////Vehicle 5
				format(var, 32, "PlayerVehicleModel5=%d\n",PlayerInfo[playerid][PlayerVehicleModel5]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicleFacing5=%.1f\n",PlayerInfo[playerid][PlayerVehicleFacing5]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle5Color=%d\n",PlayerInfo[playerid][pPlayerVehicle5Color]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle5Color2=%d\n",PlayerInfo[playerid][pPlayerVehicle5Color2]);fwrite(hFile, var);
				format(var, 32, "PlayerVehiclePosX5=%.1f\n",PlayerInfo[playerid][PlayerVehiclePosX5]);fwrite(hFile, var);
				format(var, 32, "PlayerVehiclePosY5=%.1f\n",PlayerInfo[playerid][PlayerVehiclePosY5]);fwrite(hFile, var);
				format(var, 32, "PlayerVehiclePosZ5=%.1f\n",PlayerInfo[playerid][PlayerVehiclePosZ5]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle5PaintJob=%d\n",PlayerInfo[playerid][PlayerVehicle5PaintJob]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle5ModSlot0=%d\n",PlayerInfo[playerid][PlayerVehicle5ModSlot0]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle5ModSlot1=%d\n",PlayerInfo[playerid][PlayerVehicle5ModSlot1]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle5ModSlot2=%d\n",PlayerInfo[playerid][PlayerVehicle5ModSlot2]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle5ModSlot3=%d\n",PlayerInfo[playerid][PlayerVehicle5ModSlot3]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle5ModSlot4=%d\n",PlayerInfo[playerid][PlayerVehicle5ModSlot4]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle5ModSlot5=%d\n",PlayerInfo[playerid][PlayerVehicle5ModSlot5]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle5ModSlot6=%d\n",PlayerInfo[playerid][PlayerVehicle5ModSlot6]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle5ModSlot7=%d\n",PlayerInfo[playerid][PlayerVehicle5ModSlot7]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle5ModSlot8=%d\n",PlayerInfo[playerid][PlayerVehicle5ModSlot8]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle5ModSlot9=%d\n",PlayerInfo[playerid][PlayerVehicle5ModSlot9]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle5ModSlot10=%d\n",PlayerInfo[playerid][PlayerVehicle5ModSlot10]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle5ModSlot11=%d\n",PlayerInfo[playerid][PlayerVehicle5ModSlot11]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle5ModSlot12=%d\n",PlayerInfo[playerid][PlayerVehicle5ModSlot12]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle5ModSlot13=%d\n",PlayerInfo[playerid][PlayerVehicle5ModSlot13]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle5ModNeon=%d\n",PlayerInfo[playerid][PlayerVehicle5ModNeon]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle5Tire=%d\n",PlayerInfo[playerid][PlayerVehicle5Tire]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle5Upgraded=%d\n",PlayerInfo[playerid][PlayerVehicle5Upgraded]);fwrite(hFile, var);
                format(var, 32, "PlayerVehicle5Trunk=%d\n",PlayerInfo[playerid][PlayerVehicle5Trunk]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle5Trunk2=%d\n",PlayerInfo[playerid][PlayerVehicle5Trunk2]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle5Trunk3=%d\n",PlayerInfo[playerid][PlayerVehicle5Trunk3]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle5Trunk4=%d\n",PlayerInfo[playerid][PlayerVehicle5Trunk4]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle5Trunk5=%d\n",PlayerInfo[playerid][PlayerVehicle5Trunk5]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle5Goods=%d\n",PlayerInfo[playerid][PlayerVehicle5Goods]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle5Fuel=%d\n",PlayerInfo[playerid][PlayerVehicle5Fuel]);fwrite(hFile, var);
				format(var, 64, "PlayerVehicle5Plate=%s\n",PlayerInfo[playerid][PlayerVehicle5Plate]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle5Health=%.1f\n",PlayerInfo[playerid][PlayerVehicle5Health]);fwrite(hFile, var);
				format(var, 32, "VehLock5=%d\n",PlayerInfo[playerid][pVehLock5]);fwrite(hFile, var);
				format(var, 32, "VehLocked5=%d\n",PlayerInfo[playerid][pVehLocked5]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle5Interior=%d\n",PlayerInfo[playerid][PlayerVehicle5Interior]);fwrite(hFile, var);
                format(var, 32, "PlayerVehicle5VirWorld=%d\n",PlayerInfo[playerid][PlayerVehicle5VirWorld]);fwrite(hFile, var);
				/////////////////
				format(var, 32, "CarTime=%d\n",PlayerInfo[playerid][pCarTime]);fwrite(hFile, var);
				format(var, 32, "Painkiller=%d\n",PlayerInfo[playerid][pPainkiller]);fwrite(hFile, var);
				format(var, 32, "PainEffect=%d\n",PlayerInfo[playerid][pPainEffect]);fwrite(hFile, var);
				format(var, 32, "BoomBox=%d\n",PlayerInfo[playerid][pBoomBox]);fwrite(hFile, var);
				format(var, 32, "LottoNr=%d\n",PlayerInfo[playerid][pLottoNr]);fwrite(hFile, var);
				format(var, 32, "BiggestFish=%d\n",PlayerInfo[playerid][pBiggestFish]);fwrite(hFile, var);
				format(var, 32, "Job=%d\n",PlayerInfo[playerid][pJob]);fwrite(hFile, var);
				format(var, 32, "JobDelay=%d\n",PlayerInfo[playerid][pJobdelay]);fwrite(hFile, var);
				format(var, 32, "JobTime=%d\n",PlayerInfo[playerid][pJobtime]);fwrite(hFile, var);
    			format(var, 32, "Job2=%d\n",PlayerInfo[playerid][pJob2]);fwrite(hFile, var);
				format(var, 32, "Hadchecks=%d\n",PlayerInfo[playerid][pHadChecks]);fwrite(hFile, var);
				format(var, 32, "HeadValue=%d\n",PlayerInfo[playerid][pHeadValue]);fwrite(hFile, var);
			  	format(var, 32, "BHHeadValue=%d\n",PlayerInfo[playerid][pBHHeadValue]);fwrite(hFile, var);
				format(var, 32, "Jailed=%d\n",PlayerInfo[playerid][pJailed]);fwrite(hFile, var);
				format(var, 32, "JailTime=%d\n",PlayerInfo[playerid][pJailTime]);fwrite(hFile, var);
				format(var, 32, "Gun parts=%d\n",PlayerInfo[playerid][pMats]);fwrite(hFile, var);
				format(var, 32, "Pot=%d\n",PlayerInfo[playerid][pPot]);fwrite(hFile, var);
				format(var, 32, "Crack=%d\n",PlayerInfo[playerid][pCrack]);fwrite(hFile, var);
				format(var, 32, "Leader=%d\n",PlayerInfo[playerid][pLeader]);fwrite(hFile, var);
				format(var, 32, "Member=%d\n",PlayerInfo[playerid][pMember]);fwrite(hFile, var);
				format(var, 32, "FMember=%d\n",PlayerInfo[playerid][pFMember]);fwrite(hFile, var);
				format(var, 32, "Rank=%d\n",PlayerInfo[playerid][pRank]);fwrite(hFile, var);
				format(var, 32, "DetSkill=%d\n",PlayerInfo[playerid][pDetSkill]);fwrite(hFile, var);
				format(var, 32, "SexSkill=%d\n",PlayerInfo[playerid][pSexSkill]);fwrite(hFile, var);
				format(var, 32, "BoxSkill=%d\n",PlayerInfo[playerid][pBoxSkill]);fwrite(hFile, var);
				format(var, 32, "LawSkill=%d\n",PlayerInfo[playerid][pLawSkill]);fwrite(hFile, var);
				format(var, 32, "MechSkill=%d\n",PlayerInfo[playerid][pMechSkill]);fwrite(hFile, var);
				format(var, 32, "JackSkill=%d\n",PlayerInfo[playerid][pJackSkill]);fwrite(hFile, var);
				format(var, 32, "CarSkill=%d\n",PlayerInfo[playerid][pCarSkill]);fwrite(hFile, var);
				format(var, 32, "NewsSkill=%d\n",PlayerInfo[playerid][pNewsSkill]);fwrite(hFile, var);
				format(var, 32, "DrugsSkill=%d\n",PlayerInfo[playerid][pDrugsSkill]);fwrite(hFile, var);
				format(var, 32, "ArmsSkill=%d\n",PlayerInfo[playerid][pArmsSkill]);fwrite(hFile, var);
				format(var, 32, "House=%d\n",PlayerInfo[playerid][pPhousekey]);fwrite(hFile, var);
				format(var, 32, "House2=%d\n",PlayerInfo[playerid][pPhousekey2]);fwrite(hFile, var);
       	 		format(var, 32, "InHouse=%d\n",PlayerInfo[playerid][InHouse]);fwrite(hFile, var);
       	 		format(var, 32, "InGarage=%d\n",PlayerInfo[playerid][InGarage]);fwrite(hFile, var);
       	 		format(var, 32, "HouseExterior=%d\n", PlayerInfo[playerid][HouseInterior]);fwrite(hFile, var);
        		format(var, 32, "HouseInterior=%d\n", PlayerInfo[playerid][HouseInterior]);fwrite(hFile, var);
          		format(var, 32, "hExtX=%.1f\n", PlayerInfo[playerid][hExtX]);fwrite(hFile, var);
        		format(var, 32, "hExtY=%.1f\n", PlayerInfo[playerid][hExtY]);fwrite(hFile, var);
        		format(var, 32, "hExtZ=%.1f\n", PlayerInfo[playerid][hExtZ]);fwrite(hFile, var);
				format(var, 32, "hIntX=%.1f\n", PlayerInfo[playerid][hIntX]);fwrite(hFile, var);
				format(var, 32, "hIntY=%.1f\n", PlayerInfo[playerid][hIntY]);fwrite(hFile, var);
				format(var, 32, "hIntZ=%.1f\n", PlayerInfo[playerid][hIntZ]);fwrite(hFile, var);
				format(var, 32, "SmugglerSkill=%d\n",PlayerInfo[playerid][pSmugglerSkill]);fwrite(hFile, var);
				format(var, 32, "FishSkill=%d\n",PlayerInfo[playerid][pFishSkill]);fwrite(hFile, var);
				format(var, 32, "FightingStyle=%d\n",PlayerInfo[playerid][pFightingStyle]);fwrite(hFile, var);
				format(var, 32, "pHealth=%.1f\n",PlayerInfo[playerid][pHealth]);fwrite(hFile, var);
				format(var, 32, "pArmor=%.1f\n",PlayerInfo[playerid][pArmor]);fwrite(hFile, var);
				format(var, 32, "Int=%d\n",PlayerInfo[playerid][pInt]);fwrite(hFile, var);
				format(var, 32, "Local=%d\n",PlayerInfo[playerid][pLocal]);fwrite(hFile, var);
				format(var, 32, "VirtualWorld=%d\n",PlayerInfo[playerid][pVirtualWorld]);fwrite(hFile, var);
				format(var, 32, "Model=%d\n",PlayerInfo[playerid][pModel]);fwrite(hFile, var);
				format(var, 32, "OldModel=%d\n",PlayerInfo[playerid][pOldModel]);fwrite(hFile, var);
				format(var, 32, "Tikis=%d\n",PlayerInfo[playerid][pTikis]);fwrite(hFile, var);
				format(var, 32, "PhoneNr=%d\n",PlayerInfo[playerid][pPnumber]);fwrite(hFile, var);
				format(var, 32, "PhoneCr=%d\n",PlayerInfo[playerid][pPcredit]);fwrite(hFile, var);
				format(var, 32, "Apartment=%d\n",PlayerInfo[playerid][pPaptkey]);fwrite(hFile, var);
				format(var, 32, "CarLic=%d\n",PlayerInfo[playerid][pCarLic]);fwrite(hFile, var);
                format(var, 32, "FlyLic=%d\n",PlayerInfo[playerid][pFlyLic]);fwrite(hFile, var);
				format(var, 32, "BoatLic=%d\n",PlayerInfo[playerid][pBoatLic]);fwrite(hFile, var);
				format(var, 32, "TruckLic=%d\n",PlayerInfo[playerid][pTruckLic]);fwrite(hFile, var);
				format(var, 32, "GunLic=%d\n",PlayerInfo[playerid][pGunLic]);fwrite(hFile, var);
				format(var, 32, "Sache=%d\n",PlayerInfo[playerid][pSache]);fwrite(hFile, var);
				format(var, 32, "Gun0=%d\n",PlayerInfo[playerid][pGun0]);fwrite(hFile, var);
				format(var, 32, "Gun1=%d\n",PlayerInfo[playerid][pGun1]);fwrite(hFile, var);
				format(var, 32, "Gun2=%d\n",PlayerInfo[playerid][pGun2]);fwrite(hFile, var);
				format(var, 32, "Gun3=%d\n",PlayerInfo[playerid][pGun3]);fwrite(hFile, var);
               	format(var, 32, "InBusiness=%d\n",PlayerInfo[playerid][InBusiness]);fwrite(hFile, var);
       	 		format(var, 32, "BusinessInterior=%d\n", PlayerInfo[playerid][BusinessInterior]);fwrite(hFile, var);
        		format(var, 32, "BusinessExterior=%d\n", PlayerInfo[playerid][BusinessExterior]);fwrite(hFile, var);
        		format(var, 32, "Bizz=%d\n",PlayerInfo[playerid][pPbiskey]);fwrite(hFile, var);
        		format(var, 32, "Bizz2=%d\n",PlayerInfo[playerid][pPbiskey2]);fwrite(hFile, var);
        		format(var, 32, "Garage=%d\n",PlayerInfo[playerid][pGarageKey]);fwrite(hFile, var);
        		format(var, 32, "GarageII=%d\n",PlayerInfo[playerid][pGarageKey2]);fwrite(hFile, var);
        		format(var, 32, "GateKey=%d\n",PlayerInfo[playerid][pGateKey]);fwrite(hFile, var);
        		format(var, 32, "GateKeyIA=%d\n",PlayerInfo[playerid][pGateKey2]);fwrite(hFile, var);
        		format(var, 32, "GateKeyIB=%d\n",PlayerInfo[playerid][pGateKey3]);fwrite(hFile, var);
        		format(var, 32, "GateKeyIC=%d\n",PlayerInfo[playerid][pGateKey4]);fwrite(hFile, var);
        		format(var, 32, "GateKeyID=%d\n",PlayerInfo[playerid][pGateKey5]);fwrite(hFile, var);
        		format(var, 32, "GateKeyIE=%d\n",PlayerInfo[playerid][pGateKey6]);fwrite(hFile, var);
        		format(var, 32, "GateKeyIF=%d\n",PlayerInfo[playerid][pGateKey7]);fwrite(hFile, var);
        		format(var, 32, "GateKeyIG=%d\n",PlayerInfo[playerid][pGateKey8]);fwrite(hFile, var);
        		format(var, 32, "GateKeyIH=%d\n",PlayerInfo[playerid][pGateKey9]);fwrite(hFile, var);
        		format(var, 32, "GateKeyII=%d\n",PlayerInfo[playerid][pGateKey10]);fwrite(hFile, var);
	 			format(var, 32, "bExtX=%.1f\n", PlayerInfo[playerid][bExtX]);fwrite(hFile, var);
        		format(var, 32, "bExtY=%.1f\n", PlayerInfo[playerid][bExtY]);fwrite(hFile, var);
        		format(var, 32, "bExtZ=%.1f\n", PlayerInfo[playerid][bExtZ]);fwrite(hFile, var);
				format(var, 32, "bIntX=%.1f\n", PlayerInfo[playerid][bIntX]);fwrite(hFile, var);
				format(var, 32, "bIntY=%.1f\n", PlayerInfo[playerid][bIntY]);fwrite(hFile, var);
				format(var, 32, "bIntZ=%.1f\n", PlayerInfo[playerid][bIntZ]);fwrite(hFile, var);
				format(var, 32, "Gun4=%d\n",PlayerInfo[playerid][pGun4]);fwrite(hFile, var);
				format(var, 32, "Gun5=%d\n",PlayerInfo[playerid][pGun5]);fwrite(hFile, var);
				format(var, 32, "Gun6=%d\n",PlayerInfo[playerid][pGun6]);fwrite(hFile, var);
				format(var, 32, "Gun7=%d\n",PlayerInfo[playerid][pGun7]);fwrite(hFile, var);
				format(var, 32, "Gun8=%d\n",PlayerInfo[playerid][pGun8]);fwrite(hFile, var);
				format(var, 32, "Gun9=%d\n",PlayerInfo[playerid][pGun9]);fwrite(hFile, var);
				format(var, 32, "Gun10=%d\n",PlayerInfo[playerid][pGun10]);fwrite(hFile, var);
				format(var, 32, "Gun11=%d\n",PlayerInfo[playerid][pGun11]);fwrite(hFile, var);
				format(var, 32, "Gun12=%d\n",PlayerInfo[playerid][pGun12]);fwrite(hFile, var);
				format(var, 32, "CarTime=%d\n",PlayerInfo[playerid][pCarTime]);fwrite(hFile, var);
				format(var, 32, "DrugsTime=%d\n",PlayerInfo[playerid][pDrugsTime]);fwrite(hFile, var);
				format(var, 32, "LawyerTime=%d\n",PlayerInfo[playerid][pLawyerTime]);fwrite(hFile, var);
				format(var, 32, "LawyerFreeTime=%d\n",PlayerInfo[playerid][pLawyerFreeTime]);fwrite(hFile, var);
				format(var, 32, "MechTime=%d\n",PlayerInfo[playerid][pMechTime]);fwrite(hFile, var);
				format(var, 32, "SexTime=%d\n",PlayerInfo[playerid][pSexTime]);fwrite(hFile, var);
				format(var, 32, "PayDay=%d\n",PlayerInfo[playerid][pPayDay]);fwrite(hFile, var);
				format(var, 32, "PayDayHad=%d\n",PlayerInfo[playerid][pPayDayHad]);fwrite(hFile, var);
				format(var, 32, "CDPlayer=%d\n",PlayerInfo[playerid][pCDPlayer]);fwrite(hFile, var);
				format(var, 32, "Dice=%d\n",PlayerInfo[playerid][pDice]);fwrite(hFile, var);
				format(var, 32, "Screw=%d\n",PlayerInfo[playerid][pScrew]);fwrite(hFile, var);
				format(var, 32, "Rope=%d\n",PlayerInfo[playerid][pRope]);fwrite(hFile, var);
				format(var, 32, "AKmagazine=%d\n",PlayerInfo[playerid][pAKmagazine]);fwrite(hFile, var);
				format(var, 32, "CSGmagazine=%d\n",PlayerInfo[playerid][pCSGmagazine]);fwrite(hFile, var);
				format(var, 32, "Demagazine=%d\n",PlayerInfo[playerid][pDemagazine]);fwrite(hFile, var);
				format(var, 32, "Snack=%d\n",PlayerInfo[playerid][pSnack]);fwrite(hFile, var);
				format(var, 32, "GoldCoin=%d\n",PlayerInfo[playerid][pGoldCoin]);fwrite(hFile, var);
				format(var, 32, "Bandage=%d\n",PlayerInfo[playerid][pBandage]);fwrite(hFile, var);
				format(var, 32, "BandageEffect=%d\n",PlayerInfo[playerid][pBandageEffect]);fwrite(hFile, var);
				format(var, 32, "WT=%d\n",PlayerInfo[playerid][pWT]);fwrite(hFile, var);
				format(var, 32, "WTc=%d\n",PlayerInfo[playerid][pWTc]);fwrite(hFile, var);
				format(var, 32, "Bombs=%d\n",PlayerInfo[playerid][pBombs]);fwrite(hFile, var);
				format(var, 32, "Scope=%d\n",PlayerInfo[playerid][pScope]);fwrite(hFile, var);
				format(var, 32, "OwnsMask=%d\n",PlayerInfo[playerid][pOwnsMask]);fwrite(hFile, var);
				format(var, 32, "Wins=%d\n",PlayerInfo[playerid][pWins]);fwrite(hFile, var);
				format(var, 32, "Loses=%d\n",PlayerInfo[playerid][pLoses]);fwrite(hFile, var);
				format(var, 32, "Tutorial=%d\n",PlayerInfo[playerid][pTut]);fwrite(hFile, var);
				format(var, 32, "OnDuty=%d\n",PlayerInfo[playerid][pOnDuty]);fwrite(hFile, var);
				format(var, 32, "DutyTime=%d\n",PlayerInfo[playerid][pDutyTime]);fwrite(hFile, var);
				format(var, 32, "Injured=%d\n",PlayerInfo[playerid][pInjured]);fwrite(hFile, var);
				format(var, 32, "Adjustable=%d\n",PlayerInfo[playerid][pAdjustable]);fwrite(hFile, var);
				format(var, 32, "Married=%d\n",PlayerInfo[playerid][pMarried]);fwrite(hFile, var);
				format(var, 32, "Tweet=%d\n",PlayerInfo[playerid][pTweet]);fwrite(hFile, var);
				format(var, 32, "InternetPack=%d\n",PlayerInfo[playerid][pInternetPack]);fwrite(hFile, var);
				format(var, 32, "MarryTo=%s\n",PlayerInfo[playerid][pMarriedTo]);fwrite(hFile, var);
				format(var, 32, "ForumName=%s\n",PlayerInfo[playerid][pForumName]);fwrite(hFile, var);
				format(var, 32, "NormalName=%s\n",PlayerInfo[playerid][pNormalName]);fwrite(hFile, var);
				format(var, 32, "TweetName=%s\n",PlayerInfo[playerid][pTweetName]);fwrite(hFile, var);
				format(var, 32, "AdminName=%s\n",PlayerInfo[playerid][pAdminName]);fwrite(hFile, var);
				format(var, 32, "HelperName=%s\n",PlayerInfo[playerid][pHelperName]);fwrite(hFile, var);
				format(var, 32, "BanAdmin=%s\n",PlayerInfo[playerid][pBanAdmin]);fwrite(hFile, var);
				format(var, 64, "BanReason=%s\n",PlayerInfo[playerid][pBanReason]);fwrite(hFile, var);
				format(var, 32, "JailAdmin=%s\n",PlayerInfo[playerid][pJailAdmin]);fwrite(hFile, var);
				format(var, 64, "JailReason=%s\n",PlayerInfo[playerid][pJailReason]);fwrite(hFile, var);
				format(var, 64, "ContactOne=%s\n",PlayerInfo[playerid][pContactOne]);fwrite(hFile, var);
 	            format(var, 64, "ContactTwo=%s\n",PlayerInfo[playerid][pContactTwo]);fwrite(hFile, var);
 	            format(var, 64, "ContactThree=%s\n",PlayerInfo[playerid][pContactThree]);fwrite(hFile, var);
 	            format(var, 64, "ContactFour=%s\n",PlayerInfo[playerid][pContactFour]);fwrite(hFile, var);
 	            format(var, 64, "ContactFive=%s\n",PlayerInfo[playerid][pContactFive]);fwrite(hFile, var);
 	            format(var, 64, "ContactSix=%s\n",PlayerInfo[playerid][pContactSix]);fwrite(hFile, var);
 	            format(var, 64, "ContactSeven=%s\n",PlayerInfo[playerid][pContactSeven]);fwrite(hFile, var);
				format(var, 32, "ContractBy=%s\n",PlayerInfo[playerid][pContractBy]);fwrite(hFile, var);
				format(var, 32, "IP=%s\n",PlayerInfo[playerid][pIP]);fwrite(hFile, var);
				format(var, 32, "FishBait=%d\n",PlayerInfo[playerid][pFishBait]);fwrite(hFile, var);
				format(var, 32, "FishRod=%d\n",PlayerInfo[playerid][pFishRod]);fwrite(hFile, var);
				format(var, 32, "NewbieMuted=%d\n",PlayerInfo[playerid][pNewbieMuted]);fwrite(hFile, var);
				format(var, 32, "RHmuted=%d\n",PlayerInfo[playerid][prhmuted]);fwrite(hFile, var);
				format(var, 32, "ReportMuted=%d\n",PlayerInfo[playerid][pReportMuted]);fwrite(hFile, var);
				format(var, 32, "AdvertiseMuted=%d\n",PlayerInfo[playerid][pAdvertiseMuted]);fwrite(hFile, var);
				format(var, 32, "SafeSpawn=%d\n",PlayerInfo[playerid][pSafeSpawn]);fwrite(hFile, var);
				format(var, 32, "SPos_x=%f\n",PlayerInfo[playerid][pSPos_x]);fwrite(hFile, var);
				format(var, 32, "SPos_y=%f\n",PlayerInfo[playerid][pSPos_y]);fwrite(hFile, var);
				format(var, 32, "SPos_z=%f\n",PlayerInfo[playerid][pSPos_z]);fwrite(hFile, var);
				format(var, 32, "SPos_r=%f\n",PlayerInfo[playerid][pSPos_r]);fwrite(hFile, var);
				format(var, 32, "HelperLevel=%d\n",PlayerInfo[playerid][pHelper]);fwrite(hFile, var);
				format(var, 32, "MaskNumber=%d\n",PlayerInfo[playerid][pMask]);fwrite(hFile, var);
				format(var, 32, "Blindfolds=%d\n",PlayerInfo[playerid][pBlindfolds]);fwrite(hFile, var);
				format(var, 32, "Speedo=%d\n",gSpeedo[playerid]);fwrite(hFile, var);
				format(var, 32, "Seeds=%d\n",PlayerInfo[playerid][pSeeds]);fwrite(hFile, var);
				format(var, 32, "Famed=%d\n", PlayerInfo[playerid][pFamed]);fwrite(hFile, var);
				fclose(hFile);
			}
	}
	return 1;
}

public OnPlayerSave(playerid)
{
	if(IsPlayerConnected(playerid))
	{
	    if(IsPlayerNPC(playerid)) return 1;
		if(gPlayerLogged[playerid] != 0 && gPlayerSpawned[playerid] == 1)
		{
			new string3[32];
			new Float:playersHealth, Float:playersArrmor;
	        GetPlayerHealth(playerid, playersHealth);
	        GetPlayerArmour(playerid, playersArrmor);
	        if(PlayerPaintballing[playerid] == 0)
		    {
				PlayerInfo[playerid][pInt] = GetPlayerInterior(playerid);
		    	PlayerInfo[playerid][pVirtualWorld] = GetPlayerVirtualWorld(playerid);
		    	GetPlayerPos(playerid, PlayerInfo[playerid][pSPos_x], PlayerInfo[playerid][pSPos_y], PlayerInfo[playerid][pSPos_z]);
				GetPlayerFacingAngle(playerid, PlayerInfo[playerid][pSPos_r]);
				if(PlayerInfo[playerid][pInjured] == 0)
			    {
					PlayerInfo[playerid][pHealth] = playersHealth;
					PlayerInfo[playerid][pArmor] = playersArrmor;
		        }
			}
            if(adminduty[playerid] == 1)
	        {
	             format(string3, sizeof(string3), "%s.ini", PlayerInfo[playerid][pNormalName]);
	        }
   	        else
	        {
                 format(string3, sizeof(string3), "%s.ini", GetName(playerid));
	        }
			new File: hFile = fopen(string3, io_write);
			if(hFile)
			{
				new var[64];
				format(var, 32, "Key=%s\n", PlayerInfo[playerid][pKey]);fwrite(hFile, var);
				format(var, 32, "Level=%d\n",PlayerInfo[playerid][pLevel]);fwrite(hFile, var);
				format(var, 32, "Energy=%d\n",PlayerInfo[playerid][pEnergy]);fwrite(hFile, var);
				format(var, 32, "Compo=%d\n",PlayerInfo[playerid][pCompo]);fwrite(hFile, var);
				format(var, 32, "IDC=%d\n",PlayerInfo[playerid][pIDC]);fwrite(hFile, var);
				format(var, 32, "AdminLevel=%d\n",PlayerInfo[playerid][pAdmin]);fwrite(hFile, var);
				format(var, 32, "Band=%d\n",PlayerInfo[playerid][pBand]);fwrite(hFile, var);
				format(var, 32, "PermBand=%d\n",PlayerInfo[playerid][pPermBand]);fwrite(hFile, var);
				format(var, 32, "Warn=%d\n",PlayerInfo[playerid][pWarns]);fwrite(hFile, var);
				format(var, 32, "DonateRank=%d\n",PlayerInfo[playerid][pDonateRank]);fwrite(hFile, var);
				format(var, 32, "DonateTime=%d\n",PlayerInfo[playerid][pDonateTime]);fwrite(hFile, var);
    			format(var, 32, "FactionBanned=%d\n",PlayerInfo[playerid][pFactionBanned]);fwrite(hFile, var);
    			format(var, 32, "FCard=%d\n",PlayerInfo[playerid][pFcard]);fwrite(hFile, var);
    			format(var, 32, "Inbuilding=%d\n",PlayerInfo[playerid][Inbuilding]);fwrite(hFile, var);
				format(var, 32, "GangMod=%d\n",PlayerInfo[playerid][pGangMod]);fwrite(hFile, var);
  				format(var, 32, "buildingInterior=%d\n", PlayerInfo[playerid][buildingInterior]);fwrite(hFile, var);
        		format(var, 32, "buildingExterior=%d\n", PlayerInfo[playerid][buildingExterior]);fwrite(hFile, var);
        		format(var, 32, "cExtX=%.1f\n", PlayerInfo[playerid][cExtX]);fwrite(hFile, var);
        		format(var, 32, "cExtY=%.1f\n", PlayerInfo[playerid][cExtY]);fwrite(hFile, var);
        		format(var, 32, "cExtZ=%.1f\n", PlayerInfo[playerid][cExtZ]);fwrite(hFile, var);
				format(var, 32, "cIntX=%.1f\n", PlayerInfo[playerid][cIntX]);fwrite(hFile, var);
				format(var, 32, "cIntY=%.1f\n", PlayerInfo[playerid][cIntY]);fwrite(hFile, var);
				format(var, 32, "cIntZ=%.1f\n", PlayerInfo[playerid][cIntZ]);fwrite(hFile, var);
  			 	format(var, 32, "FactionMod=%d\n",PlayerInfo[playerid][pFactionMod]);fwrite(hFile, var);
				format(var, 32, "UpgradePoints=%d\n",PlayerInfo[playerid][gPupgrade]);fwrite(hFile, var);
				format(var, 32, "Inmotel=%d\n",PlayerInfo[playerid][Inmotel]);fwrite(hFile, var);
				format(var, 32, "motelInterior=%d\n", PlayerInfo[playerid][motelInterior]);fwrite(hFile, var);
        		format(var, 32, "motelExterior=%d\n", PlayerInfo[playerid][motelExterior]);fwrite(hFile, var);
        		format(var, 32, "mExtX=%.1f\n", PlayerInfo[playerid][mExtX]);fwrite(hFile, var);
        		format(var, 32, "mExtY=%.1f\n", PlayerInfo[playerid][mExtY]);fwrite(hFile, var);
        		format(var, 32, "mExtZ=%.1f\n", PlayerInfo[playerid][mExtZ]);fwrite(hFile, var);
				format(var, 32, "mIntX=%.1f\n", PlayerInfo[playerid][mIntX]);fwrite(hFile, var);
				format(var, 32, "mIntY=%.1f\n", PlayerInfo[playerid][mIntY]);fwrite(hFile, var);
				format(var, 32, "mIntZ=%.1f\n", PlayerInfo[playerid][mIntZ]);fwrite(hFile, var);
				format(var, 32, "ConnectedTime=%d\n",PlayerInfo[playerid][pConnectTime]);fwrite(hFile, var);
				format(var, 32, "dExtX=%.1f\n", PlayerInfo[playerid][dExtX]);fwrite(hFile, var);
        		format(var, 32, "dExtY=%.1f\n", PlayerInfo[playerid][dExtY]);fwrite(hFile, var);
        		format(var, 32, "dExtZ=%.1f\n", PlayerInfo[playerid][dExtZ]);fwrite(hFile, var);
        		format(var, 32, "dAngle=%.1f\n", PlayerInfo[playerid][dAngle]);fwrite(hFile, var);
				format(var, 32, "Registered=%d\n",PlayerInfo[playerid][pReg]);fwrite(hFile, var);
				format(var, 32, "Body0=%d\n",pBody[playerid][0]);fwrite(hFile, var);
				format(var, 32, "Body1=%d\n",pBody[playerid][1]);fwrite(hFile, var);
				format(var, 32, "Body2=%d\n",pBody[playerid][2]);fwrite(hFile, var);
				format(var, 32, "Body3=%d\n",pBody[playerid][3]);fwrite(hFile, var);
				format(var, 32, "Body4=%d\n",pBody[playerid][4]);fwrite(hFile, var);
				format(var, 32, "Body5=%d\n",pBody[playerid][5]);fwrite(hFile, var);
				format(var, 32, "Body6=%d\n",pBody[playerid][6]);fwrite(hFile, var);
				format(var, 32, "Body7=%d\n",pBody[playerid][7]);fwrite(hFile, var);
				format(var, 32, "Body8=%d\n",pBody[playerid][8]);fwrite(hFile, var);
				format(var, 32, "Body9=%d\n",pBody[playerid][9]);fwrite(hFile, var);
				format(var, 32, "Body10=%d\n",pBody[playerid][10]);fwrite(hFile, var);
				format(var, 32, "Body11=%d\n",pBody[playerid][11]);fwrite(hFile, var);
				format(var, 32, "Body12=%d\n",pBody[playerid][12]);fwrite(hFile, var);
				format(var, 32, "Body13=%d\n",pBody[playerid][13]);fwrite(hFile, var);
				format(var, 32, "Body14=%d\n",pBody[playerid][14]);fwrite(hFile, var);
				format(var, 32, "Body15=%d\n",pBody[playerid][15]);fwrite(hFile, var);
				format(var, 32, "Body16=%d\n",pBody[playerid][16]);fwrite(hFile, var);
				format(var, 32, "Body17=%d\n",pBody[playerid][17]);fwrite(hFile, var);
				format(var, 32, "Body18=%d\n",pBody[playerid][18]);fwrite(hFile, var);
				format(var, 32, "Fish1=%s\n",Fishes[playerid][pFish1]);fwrite(hFile, var);
				format(var, 32, "Fish2=%s\n",Fishes[playerid][pFish2]);fwrite(hFile, var);
				format(var, 32, "Fish3=%s\n",Fishes[playerid][pFish3]);fwrite(hFile, var);
				format(var, 32, "Fish4=%s\n",Fishes[playerid][pFish4]);fwrite(hFile, var);
				format(var, 32, "Fish5=%s\n",Fishes[playerid][pFish5]);fwrite(hFile, var);
				format(var, 32, "Weight1=%d\n",Fishes[playerid][pWeight1]);fwrite(hFile, var);
				format(var, 32, "Weight2=%d\n",Fishes[playerid][pWeight2]);fwrite(hFile, var);
				format(var, 32, "Weight3=%d\n",Fishes[playerid][pWeight3]);fwrite(hFile, var);
				format(var, 32, "Weight4=%d\n",Fishes[playerid][pWeight4]);fwrite(hFile, var);
				format(var, 32, "Weight5=%d\n",Fishes[playerid][pWeight5]);fwrite(hFile, var);
				format(var, 32, "Sex=%d\n",PlayerInfo[playerid][pSex]);fwrite(hFile, var);
				format(var, 32, "Age=%d\n",PlayerInfo[playerid][pAge]);fwrite(hFile, var);
				format(var, 32, "PIN=%d\n",PlayerInfo[playerid][pPIN]);fwrite(hFile, var);
				format(var, 32, "RPBoost=%d\n",PlayerInfo[playerid][pRPBoost]);fwrite(hFile, var);
				format(var, 32, "Origin=%d\n",PlayerInfo[playerid][pOrigin]);fwrite(hFile, var);
				format(var, 32, "ATMcard=%d\n",PlayerInfo[playerid][pATMcard]);fwrite(hFile, var);
				format(var, 32, "Muted=%d\n",PlayerInfo[playerid][pMuted]);fwrite(hFile, var);
				format(var, 32, "Respect=%d\n",PlayerInfo[playerid][pExp]);fwrite(hFile, var);
				format(var, 32, "Money=%d\n",PlayerInfo[playerid][pCash]);fwrite(hFile, var);
				format(var, 32, "ATMExterior=%d\n", PlayerInfo[playerid][ATMExterior]);fwrite(hFile, var);
				format(var, 32, "MAPBExterior=%d\n", PlayerInfo[playerid][MAPBExterior]);fwrite(hFile, var);
				format(var, 32, "GSTATIONExterior=%d\n", PlayerInfo[playerid][GSTATIONExterior]);fwrite(hFile, var);
				format(var, 32, "HSSignExterior=%d\n", PlayerInfo[playerid][HSSignExterior]);fwrite(hFile, var);
				format(var, 32, "CasinoWinnings=%d\n",PlayerInfo[playerid][pCasinoWinnings]);fwrite(hFile, var);
				format(var, 32, "Bank=%d\n",PlayerInfo[playerid][pAccount]);fwrite(hFile, var);
				format(var, 32, "Crimes=%d\n",PlayerInfo[playerid][pCrimes]);fwrite(hFile, var);
				format(var, 32, "Accent=%s\n",Accent[playerid]);fwrite(hFile, var);
				format(var, 32, "ATMID=%d\n",PlayerInfo[playerid][ATMID]);fwrite(hFile, var);
   				format(var, 32, "Kills=%d\n",PlayerInfo[playerid][pKills]);fwrite(hFile, var);
				format(var, 32, "Deaths=%d\n",PlayerInfo[playerid][pDeaths]);fwrite(hFile, var);
				format(var, 32, "TrashSkill=%d\n",PlayerInfo[playerid][pTrashSkill]);fwrite(hFile, var); // Trashman
				format(var, 32, "CHits=%d\n",PlayerInfo[playerid][pCHits]);fwrite(hFile, var);
				format(var, 32, "ItemSlot1=%d\n",PlayerInfo[playerid][ItemSlot1]);fwrite(hFile, var);
				format(var, 32, "ItemHide1=%d\n",PlayerInfo[playerid][ItemHide1]);fwrite(hFile, var);
				format(var, 64, "ItemColor=%d\n",PlayerInfo[playerid][ItemColor]);fwrite(hFile, var);
				format(var, 32, "ItemID=%d\n",PlayerInfo[playerid][ItemID]);fwrite(hFile, var);
				format(var, 32, "ItemBone=%d\n",PlayerInfo[playerid][ItemBone]);fwrite(hFile, var);
				format(var, 32, "ItemOffsetX=%f\n", PlayerInfo[playerid][ItemOffsetX]);fwrite(hFile, var);
				format(var, 32, "ItemOffsetY=%f\n", PlayerInfo[playerid][ItemOffsetY]);fwrite(hFile, var);
				format(var, 32, "ItemOffsetZ=%f\n", PlayerInfo[playerid][ItemOffsetZ]);fwrite(hFile, var);
				format(var, 32, "ItemRotX=%f\n", PlayerInfo[playerid][ItemRotX]);fwrite(hFile, var);
				format(var, 32, "ItemRotY=%f\n", PlayerInfo[playerid][ItemRotY]);fwrite(hFile, var);
				format(var, 32, "ItemRotZ=%f\n", PlayerInfo[playerid][ItemRotZ]);fwrite(hFile, var);
				format(var, 32, "ItemScaleX=%f\n", PlayerInfo[playerid][ItemScaleX]);fwrite(hFile, var);
				format(var, 32, "ItemScaleY=%f\n", PlayerInfo[playerid][ItemScaleY]);fwrite(hFile, var);
				format(var, 32, "ItemScaleZ=%f\n", PlayerInfo[playerid][ItemScaleZ]);fwrite(hFile, var);
				format(var, 32, "ItemSlot2=%d\n",PlayerInfo[playerid][ItemSlot2]);fwrite(hFile, var);
				format(var, 32, "ItemHide2=%d\n",PlayerInfo[playerid][ItemHide2]);fwrite(hFile, var);
				format(var, 64, "Item2Color=%d\n",PlayerInfo[playerid][Item2Color]);fwrite(hFile, var);
				format(var, 32, "Item2ID=%d\n",PlayerInfo[playerid][Item2ID]);fwrite(hFile, var);
				format(var, 32, "Item2Bone=%d\n",PlayerInfo[playerid][Item2Bone]);fwrite(hFile, var);
				format(var, 32, "Item2OffsetX=%f\n", PlayerInfo[playerid][Item2OffsetX]);fwrite(hFile, var);
				format(var, 32, "Item2OffsetY=%f\n", PlayerInfo[playerid][Item2OffsetY]);fwrite(hFile, var);
				format(var, 32, "Item2OffsetZ=%f\n", PlayerInfo[playerid][Item2OffsetZ]);fwrite(hFile, var);
				format(var, 32, "Item2RotX=%f\n", PlayerInfo[playerid][Item2RotX]);fwrite(hFile, var);
				format(var, 32, "Item2RotY=%f\n", PlayerInfo[playerid][Item2RotY]);fwrite(hFile, var);
				format(var, 32, "Item2RotZ=%f\n", PlayerInfo[playerid][Item2RotZ]);fwrite(hFile, var);
				format(var, 32, "Item2ScaleX=%f\n", PlayerInfo[playerid][Item2ScaleX]);fwrite(hFile, var);
				format(var, 32, "Item2ScaleY=%f\n", PlayerInfo[playerid][Item2ScaleY]);fwrite(hFile, var);
				format(var, 32, "Item2ScaleZ=%f\n", PlayerInfo[playerid][Item2ScaleZ]);fwrite(hFile, var);
				format(var, 32, "ItemSlot3=%d\n",PlayerInfo[playerid][ItemSlot3]);fwrite(hFile, var);
				format(var, 32, "ItemHide3=%d\n",PlayerInfo[playerid][ItemHide3]);fwrite(hFile, var);
				format(var, 64, "Item3Color=%d\n",PlayerInfo[playerid][Item3Color]);fwrite(hFile, var);
				format(var, 32, "Item3ID=%d\n",PlayerInfo[playerid][Item3ID]);fwrite(hFile, var);
				format(var, 32, "Item3Bone=%d\n",PlayerInfo[playerid][Item3Bone]);fwrite(hFile, var);
				format(var, 32, "Item3OffsetX=%f\n", PlayerInfo[playerid][Item3OffsetX]);fwrite(hFile, var);
				format(var, 32, "Item3OffsetY=%f\n", PlayerInfo[playerid][Item3OffsetY]);fwrite(hFile, var);
				format(var, 32, "Item3OffsetZ=%f\n", PlayerInfo[playerid][Item3OffsetZ]);fwrite(hFile, var);
				format(var, 32, "Item3RotX=%f\n", PlayerInfo[playerid][Item3RotX]);fwrite(hFile, var);
				format(var, 32, "Item3RotY=%f\n", PlayerInfo[playerid][Item3RotY]);fwrite(hFile, var);
				format(var, 32, "Item3RotZ=%f\n", PlayerInfo[playerid][Item3RotZ]);fwrite(hFile, var);
				format(var, 32, "Item3ScaleX=%f\n", PlayerInfo[playerid][Item3ScaleX]);fwrite(hFile, var);
				format(var, 32, "Item3ScaleY=%f\n", PlayerInfo[playerid][Item3ScaleY]);fwrite(hFile, var);
				format(var, 32, "Item3ScaleZ=%f\n", PlayerInfo[playerid][Item3ScaleZ]);fwrite(hFile, var);
				format(var, 32, "ItemSlot4=%d\n",PlayerInfo[playerid][ItemSlot4]);fwrite(hFile, var);
				format(var, 32, "ItemHide4=%d\n",PlayerInfo[playerid][ItemHide4]);fwrite(hFile, var);
				format(var, 64, "Item4Color=%d\n",PlayerInfo[playerid][Item4Color]);fwrite(hFile, var);
				format(var, 32, "Item4ID=%d\n",PlayerInfo[playerid][Item4ID]);fwrite(hFile, var);
				format(var, 32, "Item4Bone=%d\n",PlayerInfo[playerid][Item4Bone]);fwrite(hFile, var);
				format(var, 32, "Item4OffsetX=%f\n", PlayerInfo[playerid][Item4OffsetX]);fwrite(hFile, var);
				format(var, 32, "Item4OffsetY=%f\n", PlayerInfo[playerid][Item4OffsetY]);fwrite(hFile, var);
				format(var, 32, "Item4OffsetZ=%f\n", PlayerInfo[playerid][Item4OffsetZ]);fwrite(hFile, var);
				format(var, 32, "Item4RotX=%f\n", PlayerInfo[playerid][Item4RotX]);fwrite(hFile, var);
				format(var, 32, "Item4RotY=%f\n", PlayerInfo[playerid][Item4RotY]);fwrite(hFile, var);
				format(var, 32, "Item4RotZ=%f\n", PlayerInfo[playerid][Item4RotZ]);fwrite(hFile, var);
				format(var, 32, "Item4ScaleX=%f\n", PlayerInfo[playerid][Item4ScaleX]);fwrite(hFile, var);
				format(var, 32, "Item4ScaleY=%f\n", PlayerInfo[playerid][Item4ScaleY]);fwrite(hFile, var);
				format(var, 32, "Item4ScaleZ=%f\n", PlayerInfo[playerid][Item4ScaleZ]);fwrite(hFile, var);
				format(var, 32, "ItemSlot5=%d\n",PlayerInfo[playerid][ItemSlot5]);fwrite(hFile, var);
				format(var, 32, "ItemHide5=%d\n",PlayerInfo[playerid][ItemHide5]);fwrite(hFile, var);
				format(var, 64, "Item5Color=%d\n",PlayerInfo[playerid][Item5Color]);fwrite(hFile, var);
				format(var, 32, "Item5ID=%d\n",PlayerInfo[playerid][Item5ID]);fwrite(hFile, var);
				format(var, 32, "Item5Bone=%d\n",PlayerInfo[playerid][Item5Bone]);fwrite(hFile, var);
				format(var, 32, "Item5OffsetX=%f\n", PlayerInfo[playerid][Item5OffsetX]);fwrite(hFile, var);
				format(var, 32, "Item5OffsetY=%f\n", PlayerInfo[playerid][Item5OffsetY]);fwrite(hFile, var);
				format(var, 32, "Item5OffsetZ=%f\n", PlayerInfo[playerid][Item5OffsetZ]);fwrite(hFile, var);
				format(var, 32, "Item5RotX=%f\n", PlayerInfo[playerid][Item5RotX]);fwrite(hFile, var);
				format(var, 32, "Item5RotY=%f\n", PlayerInfo[playerid][Item5RotY]);fwrite(hFile, var);
				format(var, 32, "Item5RotZ=%f\n", PlayerInfo[playerid][Item5RotZ]);fwrite(hFile, var);
				format(var, 32, "Item5ScaleX=%f\n", PlayerInfo[playerid][Item5ScaleX]);fwrite(hFile, var);
				format(var, 32, "Item5ScaleY=%f\n", PlayerInfo[playerid][Item5ScaleY]);fwrite(hFile, var);
				format(var, 32, "Item5ScaleZ=%f\n", PlayerInfo[playerid][Item5ScaleZ]);fwrite(hFile, var);
				format(var, 32, "FHits=%d\n",PlayerInfo[playerid][pFHits]);fwrite(hFile, var);
				format(var, 32, "Arrested=%d\n",PlayerInfo[playerid][pArrested]);fwrite(hFile, var);
				////////////////Vehicle 1
				format(var, 32, "PlayerVehicleModel1=%d\n",PlayerInfo[playerid][PlayerVehicleModel1]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicleFacing1=%.1f\n",PlayerInfo[playerid][PlayerVehicleFacing1]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle1Color=%d\n",PlayerInfo[playerid][pPlayerVehicle1Color]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle1Color2=%d\n",PlayerInfo[playerid][pPlayerVehicle1Color2]);fwrite(hFile, var);
				format(var, 32, "PlayerVehiclePosX1=%.1f\n",PlayerInfo[playerid][PlayerVehiclePosX1]);fwrite(hFile, var);
				format(var, 32, "PlayerVehiclePosY1=%.1f\n",PlayerInfo[playerid][PlayerVehiclePosY1]);fwrite(hFile, var);
				format(var, 32, "PlayerVehiclePosZ1=%.1f\n",PlayerInfo[playerid][PlayerVehiclePosZ1]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle1PaintJob=%d\n",PlayerInfo[playerid][PlayerVehicle1PaintJob]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle1ModSlot0=%d\n",PlayerInfo[playerid][PlayerVehicle1ModSlot0]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle1ModSlot1=%d\n",PlayerInfo[playerid][PlayerVehicle1ModSlot1]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle1ModSlot2=%d\n",PlayerInfo[playerid][PlayerVehicle1ModSlot2]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle1ModSlot3=%d\n",PlayerInfo[playerid][PlayerVehicle1ModSlot3]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle1ModSlot4=%d\n",PlayerInfo[playerid][PlayerVehicle1ModSlot4]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle1ModSlot5=%d\n",PlayerInfo[playerid][PlayerVehicle1ModSlot5]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle1ModSlot6=%d\n",PlayerInfo[playerid][PlayerVehicle1ModSlot6]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle1ModSlot7=%d\n",PlayerInfo[playerid][PlayerVehicle1ModSlot7]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle1ModSlot8=%d\n",PlayerInfo[playerid][PlayerVehicle1ModSlot8]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle1ModSlot9=%d\n",PlayerInfo[playerid][PlayerVehicle1ModSlot9]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle1ModSlot10=%d\n",PlayerInfo[playerid][PlayerVehicle1ModSlot10]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle1ModSlot11=%d\n",PlayerInfo[playerid][PlayerVehicle1ModSlot11]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle1ModSlot12=%d\n",PlayerInfo[playerid][PlayerVehicle1ModSlot12]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle1ModSlot13=%d\n",PlayerInfo[playerid][PlayerVehicle1ModSlot13]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle1ModNeon=%d\n",PlayerInfo[playerid][PlayerVehicle1ModNeon]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle1Tire=%d\n",PlayerInfo[playerid][PlayerVehicle1Tire]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle1Upgraded=%d\n",PlayerInfo[playerid][PlayerVehicle1Upgraded]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle1Trunk=%d\n",PlayerInfo[playerid][PlayerVehicle1Trunk]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle1Trunk2=%d\n",PlayerInfo[playerid][PlayerVehicle1Trunk2]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle1Trunk3=%d\n",PlayerInfo[playerid][PlayerVehicle1Trunk3]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle1Trunk4=%d\n",PlayerInfo[playerid][PlayerVehicle1Trunk4]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle1Trunk5=%d\n",PlayerInfo[playerid][PlayerVehicle1Trunk5]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle1Fuel=%d\n",PlayerInfo[playerid][PlayerVehicle1Fuel]);fwrite(hFile, var);
				format(var, 64, "PlayerVehicle1Plate=%s\n",PlayerInfo[playerid][PlayerVehicle1Plate]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle1Goods=%d\n",PlayerInfo[playerid][PlayerVehicle1Goods]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle1Health=%.1f\n",PlayerInfo[playerid][PlayerVehicle1Health]);fwrite(hFile, var);
				format(var, 32, "VehLock1=%d\n",PlayerInfo[playerid][pVehLock1]);fwrite(hFile, var);
				format(var, 32, "VehLocked1=%d\n",PlayerInfo[playerid][pVehLocked1]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle1Interior=%d\n",PlayerInfo[playerid][PlayerVehicle1Interior]);fwrite(hFile, var);
                format(var, 32, "PlayerVehicle1VirWorld=%d\n",PlayerInfo[playerid][PlayerVehicle1VirWorld]);fwrite(hFile, var);
				///////////////Vehicle 2
				format(var, 32, "PlayerVehicleModel2=%d\n",PlayerInfo[playerid][PlayerVehicleModel2]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicleFacing2=%.1f\n",PlayerInfo[playerid][PlayerVehicleFacing2]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle2Color=%d\n",PlayerInfo[playerid][pPlayerVehicle2Color]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle2Color2=%d\n",PlayerInfo[playerid][pPlayerVehicle2Color2]);fwrite(hFile, var);
				format(var, 32, "PlayerVehiclePosX2=%.1f\n",PlayerInfo[playerid][PlayerVehiclePosX2]);fwrite(hFile, var);
				format(var, 32, "PlayerVehiclePosY2=%.1f\n",PlayerInfo[playerid][PlayerVehiclePosY2]);fwrite(hFile, var);
				format(var, 32, "PlayerVehiclePosZ2=%.1f\n",PlayerInfo[playerid][PlayerVehiclePosZ2]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle2PaintJob=%d\n",PlayerInfo[playerid][PlayerVehicle2PaintJob]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle2ModSlot0=%d\n",PlayerInfo[playerid][PlayerVehicle2ModSlot0]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle2ModSlot1=%d\n",PlayerInfo[playerid][PlayerVehicle2ModSlot1]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle2ModSlot2=%d\n",PlayerInfo[playerid][PlayerVehicle2ModSlot2]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle2ModSlot3=%d\n",PlayerInfo[playerid][PlayerVehicle2ModSlot3]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle2ModSlot4=%d\n",PlayerInfo[playerid][PlayerVehicle2ModSlot4]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle2ModSlot5=%d\n",PlayerInfo[playerid][PlayerVehicle2ModSlot5]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle2ModSlot6=%d\n",PlayerInfo[playerid][PlayerVehicle2ModSlot6]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle2ModSlot7=%d\n",PlayerInfo[playerid][PlayerVehicle2ModSlot7]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle2ModSlot8=%d\n",PlayerInfo[playerid][PlayerVehicle2ModSlot8]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle2ModSlot9=%d\n",PlayerInfo[playerid][PlayerVehicle2ModSlot9]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle2ModSlot10=%d\n",PlayerInfo[playerid][PlayerVehicle2ModSlot10]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle2ModSlot11=%d\n",PlayerInfo[playerid][PlayerVehicle2ModSlot11]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle2ModSlot12=%d\n",PlayerInfo[playerid][PlayerVehicle2ModSlot12]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle2ModSlot13=%d\n",PlayerInfo[playerid][PlayerVehicle2ModSlot13]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle2ModNeon=%d\n",PlayerInfo[playerid][PlayerVehicle2ModNeon]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle2Tire=%d\n",PlayerInfo[playerid][PlayerVehicle2Tire]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle2Upgraded=%d\n",PlayerInfo[playerid][PlayerVehicle2Upgraded]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle2Trunk=%d\n",PlayerInfo[playerid][PlayerVehicle2Trunk]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle2Trunk2=%d\n",PlayerInfo[playerid][PlayerVehicle2Trunk2]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle2Trunk3=%d\n",PlayerInfo[playerid][PlayerVehicle2Trunk3]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle2Trunk4=%d\n",PlayerInfo[playerid][PlayerVehicle2Trunk4]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle2Trunk5=%d\n",PlayerInfo[playerid][PlayerVehicle2Trunk5]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle2Goods=%d\n",PlayerInfo[playerid][PlayerVehicle2Goods]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle2Fuel=%d\n",PlayerInfo[playerid][PlayerVehicle2Fuel]);fwrite(hFile, var);
				format(var, 64, "PlayerVehicle2Plate=%s\n",PlayerInfo[playerid][PlayerVehicle2Plate]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle2Health=%.1f\n",PlayerInfo[playerid][PlayerVehicle2Health]);fwrite(hFile, var);
				format(var, 32, "VehLock2=%d\n",PlayerInfo[playerid][pVehLock2]);fwrite(hFile, var);
				format(var, 32, "VehLocked2=%d\n",PlayerInfo[playerid][pVehLocked2]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle2Interior=%d\n",PlayerInfo[playerid][PlayerVehicle2Interior]);fwrite(hFile, var);
                format(var, 32, "PlayerVehicle2VirWorld=%d\n",PlayerInfo[playerid][PlayerVehicle2VirWorld]);fwrite(hFile, var);
				////////////////Vehicle 3
				format(var, 32, "PlayerVehicleModel3=%d\n",PlayerInfo[playerid][PlayerVehicleModel3]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicleFacing3=%.1f\n",PlayerInfo[playerid][PlayerVehicleFacing3]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle3Color=%d\n",PlayerInfo[playerid][pPlayerVehicle3Color]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle3Color2=%d\n",PlayerInfo[playerid][pPlayerVehicle3Color2]);fwrite(hFile, var);
				format(var, 32, "PlayerVehiclePosX3=%.1f\n",PlayerInfo[playerid][PlayerVehiclePosX3]);fwrite(hFile, var);
				format(var, 32, "PlayerVehiclePosY3=%.1f\n",PlayerInfo[playerid][PlayerVehiclePosY3]);fwrite(hFile, var);
				format(var, 32, "PlayerVehiclePosZ3=%.1f\n",PlayerInfo[playerid][PlayerVehiclePosZ3]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle3PaintJob=%d\n",PlayerInfo[playerid][PlayerVehicle3PaintJob]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle3ModSlot0=%d\n",PlayerInfo[playerid][PlayerVehicle3ModSlot0]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle3ModSlot1=%d\n",PlayerInfo[playerid][PlayerVehicle3ModSlot1]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle3ModSlot2=%d\n",PlayerInfo[playerid][PlayerVehicle3ModSlot2]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle3ModSlot3=%d\n",PlayerInfo[playerid][PlayerVehicle3ModSlot3]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle3ModSlot4=%d\n",PlayerInfo[playerid][PlayerVehicle3ModSlot4]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle3ModSlot5=%d\n",PlayerInfo[playerid][PlayerVehicle3ModSlot5]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle3ModSlot6=%d\n",PlayerInfo[playerid][PlayerVehicle3ModSlot6]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle3ModSlot7=%d\n",PlayerInfo[playerid][PlayerVehicle3ModSlot7]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle3ModSlot8=%d\n",PlayerInfo[playerid][PlayerVehicle3ModSlot8]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle3ModSlot9=%d\n",PlayerInfo[playerid][PlayerVehicle3ModSlot9]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle3ModSlot10=%d\n",PlayerInfo[playerid][PlayerVehicle3ModSlot10]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle3ModSlot11=%d\n",PlayerInfo[playerid][PlayerVehicle3ModSlot11]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle3ModSlot12=%d\n",PlayerInfo[playerid][PlayerVehicle3ModSlot12]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle3ModSlot13=%d\n",PlayerInfo[playerid][PlayerVehicle3ModSlot13]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle3ModNeon=%d\n",PlayerInfo[playerid][PlayerVehicle3ModNeon]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle3Tire=%d\n",PlayerInfo[playerid][PlayerVehicle3Tire]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle3Upgraded=%d\n",PlayerInfo[playerid][PlayerVehicle3Upgraded]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle3Trunk=%d\n",PlayerInfo[playerid][PlayerVehicle3Trunk]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle3Trunk2=%d\n",PlayerInfo[playerid][PlayerVehicle3Trunk2]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle3Trunk3=%d\n",PlayerInfo[playerid][PlayerVehicle3Trunk3]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle3Trunk4=%d\n",PlayerInfo[playerid][PlayerVehicle3Trunk4]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle3Trunk5=%d\n",PlayerInfo[playerid][PlayerVehicle3Trunk5]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle3Goods=%d\n",PlayerInfo[playerid][PlayerVehicle3Goods]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle3Fuel=%d\n",PlayerInfo[playerid][PlayerVehicle3Fuel]);fwrite(hFile, var);
				format(var, 64, "PlayerVehicle3Plate=%s\n",PlayerInfo[playerid][PlayerVehicle3Plate]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle3Health=%.1f\n",PlayerInfo[playerid][PlayerVehicle3Health]);fwrite(hFile, var);
				format(var, 32, "VehLock3=%d\n",PlayerInfo[playerid][pVehLock3]);fwrite(hFile, var);
				format(var, 32, "VehLocked3=%d\n",PlayerInfo[playerid][pVehLocked3]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle3Interior=%d\n",PlayerInfo[playerid][PlayerVehicle3Interior]);fwrite(hFile, var);
                format(var, 32, "PlayerVehicle3VirWorld=%d\n",PlayerInfo[playerid][PlayerVehicle3VirWorld]);fwrite(hFile, var);
				////////////////Vehicle 4
				format(var, 32, "PlayerVehicleModel4=%d\n",PlayerInfo[playerid][PlayerVehicleModel4]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicleFacing4=%.1f\n",PlayerInfo[playerid][PlayerVehicleFacing4]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle4Color=%d\n",PlayerInfo[playerid][pPlayerVehicle4Color]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle4Color2=%d\n",PlayerInfo[playerid][pPlayerVehicle4Color2]);fwrite(hFile, var);
				format(var, 32, "PlayerVehiclePosX4=%.1f\n",PlayerInfo[playerid][PlayerVehiclePosX4]);fwrite(hFile, var);
				format(var, 32, "PlayerVehiclePosY4=%.1f\n",PlayerInfo[playerid][PlayerVehiclePosY4]);fwrite(hFile, var);
				format(var, 32, "PlayerVehiclePosZ4=%.1f\n",PlayerInfo[playerid][PlayerVehiclePosZ4]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle4PaintJob=%d\n",PlayerInfo[playerid][PlayerVehicle4PaintJob]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle4ModSlot0=%d\n",PlayerInfo[playerid][PlayerVehicle4ModSlot0]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle4ModSlot1=%d\n",PlayerInfo[playerid][PlayerVehicle4ModSlot1]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle4ModSlot2=%d\n",PlayerInfo[playerid][PlayerVehicle4ModSlot2]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle4ModSlot3=%d\n",PlayerInfo[playerid][PlayerVehicle4ModSlot3]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle4ModSlot4=%d\n",PlayerInfo[playerid][PlayerVehicle4ModSlot4]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle4ModSlot5=%d\n",PlayerInfo[playerid][PlayerVehicle4ModSlot5]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle4ModSlot6=%d\n",PlayerInfo[playerid][PlayerVehicle4ModSlot6]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle4ModSlot7=%d\n",PlayerInfo[playerid][PlayerVehicle4ModSlot7]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle4ModSlot8=%d\n",PlayerInfo[playerid][PlayerVehicle4ModSlot8]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle4ModSlot9=%d\n",PlayerInfo[playerid][PlayerVehicle4ModSlot9]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle4ModSlot10=%d\n",PlayerInfo[playerid][PlayerVehicle4ModSlot10]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle4ModSlot11=%d\n",PlayerInfo[playerid][PlayerVehicle4ModSlot11]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle4ModSlot12=%d\n",PlayerInfo[playerid][PlayerVehicle4ModSlot12]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle4ModSlot13=%d\n",PlayerInfo[playerid][PlayerVehicle4ModSlot13]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle4ModNeon=%d\n",PlayerInfo[playerid][PlayerVehicle4ModNeon]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle4Tire=%d\n",PlayerInfo[playerid][PlayerVehicle4Tire]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle4Upgraded=%d\n",PlayerInfo[playerid][PlayerVehicle4Upgraded]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle4Trunk=%d\n",PlayerInfo[playerid][PlayerVehicle4Trunk]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle4Trunk2=%d\n",PlayerInfo[playerid][PlayerVehicle4Trunk2]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle4Trunk3=%d\n",PlayerInfo[playerid][PlayerVehicle4Trunk3]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle4Trunk4=%d\n",PlayerInfo[playerid][PlayerVehicle4Trunk4]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle4Trunk5=%d\n",PlayerInfo[playerid][PlayerVehicle4Trunk5]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle4Goods=%d\n",PlayerInfo[playerid][PlayerVehicle4Goods]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle4Fuel=%d\n",PlayerInfo[playerid][PlayerVehicle4Fuel]);fwrite(hFile, var);
				format(var, 64, "PlayerVehicle4Plate=%s\n",PlayerInfo[playerid][PlayerVehicle4Plate]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle4Health=%.1f\n",PlayerInfo[playerid][PlayerVehicle4Health]);fwrite(hFile, var);
				format(var, 32, "VehLock4=%d\n",PlayerInfo[playerid][pVehLock4]);fwrite(hFile, var);
				format(var, 32, "VehLocked4=%d\n",PlayerInfo[playerid][pVehLocked4]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle4Interior=%d\n",PlayerInfo[playerid][PlayerVehicle4Interior]);fwrite(hFile, var);
                format(var, 32, "PlayerVehicle4VirWorld=%d\n",PlayerInfo[playerid][PlayerVehicle4VirWorld]);fwrite(hFile, var);
				////////////////Vehicle 5
				format(var, 32, "PlayerVehicleModel5=%d\n",PlayerInfo[playerid][PlayerVehicleModel5]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicleFacing5=%.1f\n",PlayerInfo[playerid][PlayerVehicleFacing5]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle5Color=%d\n",PlayerInfo[playerid][pPlayerVehicle5Color]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle5Color2=%d\n",PlayerInfo[playerid][pPlayerVehicle5Color2]);fwrite(hFile, var);
				format(var, 32, "PlayerVehiclePosX5=%.1f\n",PlayerInfo[playerid][PlayerVehiclePosX5]);fwrite(hFile, var);
				format(var, 32, "PlayerVehiclePosY5=%.1f\n",PlayerInfo[playerid][PlayerVehiclePosY5]);fwrite(hFile, var);
				format(var, 32, "PlayerVehiclePosZ5=%.1f\n",PlayerInfo[playerid][PlayerVehiclePosZ5]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle5PaintJob=%d\n",PlayerInfo[playerid][PlayerVehicle5PaintJob]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle5ModSlot0=%d\n",PlayerInfo[playerid][PlayerVehicle5ModSlot0]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle5ModSlot1=%d\n",PlayerInfo[playerid][PlayerVehicle5ModSlot1]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle5ModSlot2=%d\n",PlayerInfo[playerid][PlayerVehicle5ModSlot2]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle5ModSlot3=%d\n",PlayerInfo[playerid][PlayerVehicle5ModSlot3]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle5ModSlot4=%d\n",PlayerInfo[playerid][PlayerVehicle5ModSlot4]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle5ModSlot5=%d\n",PlayerInfo[playerid][PlayerVehicle5ModSlot5]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle5ModSlot6=%d\n",PlayerInfo[playerid][PlayerVehicle5ModSlot6]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle5ModSlot7=%d\n",PlayerInfo[playerid][PlayerVehicle5ModSlot7]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle5ModSlot8=%d\n",PlayerInfo[playerid][PlayerVehicle5ModSlot8]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle5ModSlot9=%d\n",PlayerInfo[playerid][PlayerVehicle5ModSlot9]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle5ModSlot10=%d\n",PlayerInfo[playerid][PlayerVehicle5ModSlot10]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle5ModSlot11=%d\n",PlayerInfo[playerid][PlayerVehicle5ModSlot11]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle5ModSlot12=%d\n",PlayerInfo[playerid][PlayerVehicle5ModSlot12]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle5ModSlot13=%d\n",PlayerInfo[playerid][PlayerVehicle5ModSlot13]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle5ModNeon=%d\n",PlayerInfo[playerid][PlayerVehicle5ModNeon]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle5Tire=%d\n",PlayerInfo[playerid][PlayerVehicle5Tire]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle5Upgraded=%d\n",PlayerInfo[playerid][PlayerVehicle5Upgraded]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle5Trunk=%d\n",PlayerInfo[playerid][PlayerVehicle5Trunk]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle5Trunk2=%d\n",PlayerInfo[playerid][PlayerVehicle5Trunk2]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle5Trunk3=%d\n",PlayerInfo[playerid][PlayerVehicle5Trunk3]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle5Trunk4=%d\n",PlayerInfo[playerid][PlayerVehicle5Trunk4]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle5Trunk5=%d\n",PlayerInfo[playerid][PlayerVehicle5Trunk5]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle5Goods=%d\n",PlayerInfo[playerid][PlayerVehicle5Goods]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle5Fuel=%d\n",PlayerInfo[playerid][PlayerVehicle5Fuel]);fwrite(hFile, var);
				format(var, 64, "PlayerVehicle5Plate=%s\n",PlayerInfo[playerid][PlayerVehicle5Plate]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle5Health=%.1f\n",PlayerInfo[playerid][PlayerVehicle5Health]);fwrite(hFile, var);
				format(var, 32, "VehLock5=%d\n",PlayerInfo[playerid][pVehLock5]);fwrite(hFile, var);
				format(var, 32, "VehLocked5=%d\n",PlayerInfo[playerid][pVehLocked5]);fwrite(hFile, var);
				format(var, 32, "PlayerVehicle5Interior=%d\n",PlayerInfo[playerid][PlayerVehicle5Interior]);fwrite(hFile, var);
                format(var, 32, "PlayerVehicle5VirWorld=%d\n",PlayerInfo[playerid][PlayerVehicle5VirWorld]);fwrite(hFile, var);
				/////////////////
				format(var, 32, "CarTime=%d\n",PlayerInfo[playerid][pCarTime]);fwrite(hFile, var);
				format(var, 32, "Painkiller=%d\n",PlayerInfo[playerid][pPainkiller]);fwrite(hFile, var);
				format(var, 32, "PainEffect=%d\n",PlayerInfo[playerid][pPainEffect]);fwrite(hFile, var);
				format(var, 32, "BoomBox=%d\n",PlayerInfo[playerid][pBoomBox]);fwrite(hFile, var);
				format(var, 32, "LottoNr=%d\n",PlayerInfo[playerid][pLottoNr]);fwrite(hFile, var);
				format(var, 32, "BiggestFish=%d\n",PlayerInfo[playerid][pBiggestFish]);fwrite(hFile, var);
				format(var, 32, "Job=%d\n",PlayerInfo[playerid][pJob]);fwrite(hFile, var);
				format(var, 32, "JobDelay=%d\n",PlayerInfo[playerid][pJobdelay]);fwrite(hFile, var);
				format(var, 32, "JobTime=%d\n",PlayerInfo[playerid][pJobtime]);fwrite(hFile, var);
    			format(var, 32, "Job2=%d\n",PlayerInfo[playerid][pJob2]);fwrite(hFile, var);
				format(var, 32, "Hadchecks=%d\n",PlayerInfo[playerid][pHadChecks]);fwrite(hFile, var);
				format(var, 32, "HeadValue=%d\n",PlayerInfo[playerid][pHeadValue]);fwrite(hFile, var);
			  	format(var, 32, "BHHeadValue=%d\n",PlayerInfo[playerid][pBHHeadValue]);fwrite(hFile, var);
				format(var, 32, "Jailed=%d\n",PlayerInfo[playerid][pJailed]);fwrite(hFile, var);
				format(var, 32, "JailTime=%d\n",PlayerInfo[playerid][pJailTime]);fwrite(hFile, var);
				format(var, 32, "Gun parts=%d\n",PlayerInfo[playerid][pMats]);fwrite(hFile, var);
				format(var, 32, "Pot=%d\n",PlayerInfo[playerid][pPot]);fwrite(hFile, var);
				format(var, 32, "Crack=%d\n",PlayerInfo[playerid][pCrack]);fwrite(hFile, var);
				format(var, 32, "Leader=%d\n",PlayerInfo[playerid][pLeader]);fwrite(hFile, var);
				format(var, 32, "Member=%d\n",PlayerInfo[playerid][pMember]);fwrite(hFile, var);
				format(var, 32, "FMember=%d\n",PlayerInfo[playerid][pFMember]);fwrite(hFile, var);
				format(var, 32, "Rank=%d\n",PlayerInfo[playerid][pRank]);fwrite(hFile, var);
				format(var, 32, "DetSkill=%d\n",PlayerInfo[playerid][pDetSkill]);fwrite(hFile, var);
				format(var, 32, "SexSkill=%d\n",PlayerInfo[playerid][pSexSkill]);fwrite(hFile, var);
				format(var, 32, "BoxSkill=%d\n",PlayerInfo[playerid][pBoxSkill]);fwrite(hFile, var);
				format(var, 32, "LawSkill=%d\n",PlayerInfo[playerid][pLawSkill]);fwrite(hFile, var);
				format(var, 32, "MechSkill=%d\n",PlayerInfo[playerid][pMechSkill]);fwrite(hFile, var);
				format(var, 32, "JackSkill=%d\n",PlayerInfo[playerid][pJackSkill]);fwrite(hFile, var);
				format(var, 32, "CarSkill=%d\n",PlayerInfo[playerid][pCarSkill]);fwrite(hFile, var);
				format(var, 32, "NewsSkill=%d\n",PlayerInfo[playerid][pNewsSkill]);fwrite(hFile, var);
				format(var, 32, "DrugsSkill=%d\n",PlayerInfo[playerid][pDrugsSkill]);fwrite(hFile, var);
				format(var, 32, "ArmsSkill=%d\n",PlayerInfo[playerid][pArmsSkill]);fwrite(hFile, var);
				format(var, 32, "House=%d\n",PlayerInfo[playerid][pPhousekey]);fwrite(hFile, var);
				format(var, 32, "House2=%d\n",PlayerInfo[playerid][pPhousekey2]);fwrite(hFile, var);
       	 		format(var, 32, "InHouse=%d\n",PlayerInfo[playerid][InHouse]);fwrite(hFile, var);
       	 		format(var, 32, "InGarage=%d\n",PlayerInfo[playerid][InGarage]);fwrite(hFile, var);
       	 		format(var, 32, "HouseExterior=%d\n", PlayerInfo[playerid][HouseInterior]);fwrite(hFile, var);
        		format(var, 32, "HouseInterior=%d\n", PlayerInfo[playerid][HouseInterior]);fwrite(hFile, var);
          		format(var, 32, "hExtX=%.1f\n", PlayerInfo[playerid][hExtX]);fwrite(hFile, var);
        		format(var, 32, "hExtY=%.1f\n", PlayerInfo[playerid][hExtY]);fwrite(hFile, var);
        		format(var, 32, "hExtZ=%.1f\n", PlayerInfo[playerid][hExtZ]);fwrite(hFile, var);
				format(var, 32, "hIntX=%.1f\n", PlayerInfo[playerid][hIntX]);fwrite(hFile, var);
				format(var, 32, "hIntY=%.1f\n", PlayerInfo[playerid][hIntY]);fwrite(hFile, var);
				format(var, 32, "hIntZ=%.1f\n", PlayerInfo[playerid][hIntZ]);fwrite(hFile, var);
				format(var, 32, "SmugglerSkill=%d\n",PlayerInfo[playerid][pSmugglerSkill]);fwrite(hFile, var);
				format(var, 32, "FishSkill=%d\n",PlayerInfo[playerid][pFishSkill]);fwrite(hFile, var);
				format(var, 32, "FightingStyle=%d\n",PlayerInfo[playerid][pFightingStyle]);fwrite(hFile, var);
				format(var, 32, "pHealth=%.1f\n",PlayerInfo[playerid][pHealth]);fwrite(hFile, var);
				format(var, 32, "pArmor=%.1f\n",PlayerInfo[playerid][pArmor]);fwrite(hFile, var);
				format(var, 32, "Int=%d\n",PlayerInfo[playerid][pInt]);fwrite(hFile, var);
				format(var, 32, "Local=%d\n",PlayerInfo[playerid][pLocal]);fwrite(hFile, var);
				format(var, 32, "VirtualWorld=%d\n",PlayerInfo[playerid][pVirtualWorld]);fwrite(hFile, var);
				format(var, 32, "Model=%d\n",PlayerInfo[playerid][pModel]);fwrite(hFile, var);
				format(var, 32, "OldModel=%d\n",PlayerInfo[playerid][pOldModel]);fwrite(hFile, var);
				format(var, 32, "Tikis=%d\n",PlayerInfo[playerid][pTikis]);fwrite(hFile, var);
				format(var, 32, "PhoneNr=%d\n",PlayerInfo[playerid][pPnumber]);fwrite(hFile, var);
				format(var, 32, "PhoneCr=%d\n",PlayerInfo[playerid][pPcredit]);fwrite(hFile, var);
				format(var, 32, "Apartment=%d\n",PlayerInfo[playerid][pPaptkey]);fwrite(hFile, var);
				format(var, 32, "CarLic=%d\n",PlayerInfo[playerid][pCarLic]);fwrite(hFile, var);
                format(var, 32, "FlyLic=%d\n",PlayerInfo[playerid][pFlyLic]);fwrite(hFile, var);
				format(var, 32, "BoatLic=%d\n",PlayerInfo[playerid][pBoatLic]);fwrite(hFile, var);
				format(var, 32, "TruckLic=%d\n",PlayerInfo[playerid][pTruckLic]);fwrite(hFile, var);
				format(var, 32, "GunLic=%d\n",PlayerInfo[playerid][pGunLic]);fwrite(hFile, var);
				format(var, 32, "Sache=%d\n",PlayerInfo[playerid][pSache]);fwrite(hFile, var);
				format(var, 32, "Gun0=%d\n",PlayerInfo[playerid][pGun0]);fwrite(hFile, var);
				format(var, 32, "Gun1=%d\n",PlayerInfo[playerid][pGun1]);fwrite(hFile, var);
				format(var, 32, "Gun2=%d\n",PlayerInfo[playerid][pGun2]);fwrite(hFile, var);
				format(var, 32, "Gun3=%d\n",PlayerInfo[playerid][pGun3]);fwrite(hFile, var);
               	format(var, 32, "InBusiness=%d\n",PlayerInfo[playerid][InBusiness]);fwrite(hFile, var);
       	 		format(var, 32, "BusinessInterior=%d\n", PlayerInfo[playerid][BusinessInterior]);fwrite(hFile, var);
        		format(var, 32, "BusinessExterior=%d\n", PlayerInfo[playerid][BusinessExterior]);fwrite(hFile, var);
        		format(var, 32, "Bizz=%d\n",PlayerInfo[playerid][pPbiskey]);fwrite(hFile, var);
        		format(var, 32, "Bizz2=%d\n",PlayerInfo[playerid][pPbiskey2]);fwrite(hFile, var);
        		format(var, 32, "Garage=%d\n",PlayerInfo[playerid][pGarageKey]);fwrite(hFile, var);
        		format(var, 32, "GarageII=%d\n",PlayerInfo[playerid][pGarageKey2]);fwrite(hFile, var);
        		format(var, 32, "GateKey=%d\n",PlayerInfo[playerid][pGateKey]);fwrite(hFile, var);
        		format(var, 32, "GateKeyIA=%d\n",PlayerInfo[playerid][pGateKey2]);fwrite(hFile, var);
        		format(var, 32, "GateKeyIB=%d\n",PlayerInfo[playerid][pGateKey3]);fwrite(hFile, var);
        		format(var, 32, "GateKeyIC=%d\n",PlayerInfo[playerid][pGateKey4]);fwrite(hFile, var);
        		format(var, 32, "GateKeyID=%d\n",PlayerInfo[playerid][pGateKey5]);fwrite(hFile, var);
        		format(var, 32, "GateKeyIE=%d\n",PlayerInfo[playerid][pGateKey6]);fwrite(hFile, var);
        		format(var, 32, "GateKeyIF=%d\n",PlayerInfo[playerid][pGateKey7]);fwrite(hFile, var);
        		format(var, 32, "GateKeyIG=%d\n",PlayerInfo[playerid][pGateKey8]);fwrite(hFile, var);
        		format(var, 32, "GateKeyIH=%d\n",PlayerInfo[playerid][pGateKey9]);fwrite(hFile, var);
        		format(var, 32, "GateKeyII=%d\n",PlayerInfo[playerid][pGateKey10]);fwrite(hFile, var);
	 			format(var, 32, "bExtX=%.1f\n", PlayerInfo[playerid][bExtX]);fwrite(hFile, var);
        		format(var, 32, "bExtY=%.1f\n", PlayerInfo[playerid][bExtY]);fwrite(hFile, var);
        		format(var, 32, "bExtZ=%.1f\n", PlayerInfo[playerid][bExtZ]);fwrite(hFile, var);
				format(var, 32, "bIntX=%.1f\n", PlayerInfo[playerid][bIntX]);fwrite(hFile, var);
				format(var, 32, "bIntY=%.1f\n", PlayerInfo[playerid][bIntY]);fwrite(hFile, var);
				format(var, 32, "bIntZ=%.1f\n", PlayerInfo[playerid][bIntZ]);fwrite(hFile, var);
				format(var, 32, "Gun4=%d\n",PlayerInfo[playerid][pGun4]);fwrite(hFile, var);
				format(var, 32, "Gun5=%d\n",PlayerInfo[playerid][pGun5]);fwrite(hFile, var);
				format(var, 32, "Gun6=%d\n",PlayerInfo[playerid][pGun6]);fwrite(hFile, var);
				format(var, 32, "Gun7=%d\n",PlayerInfo[playerid][pGun7]);fwrite(hFile, var);
				format(var, 32, "Gun8=%d\n",PlayerInfo[playerid][pGun8]);fwrite(hFile, var);
				format(var, 32, "Gun9=%d\n",PlayerInfo[playerid][pGun9]);fwrite(hFile, var);
				format(var, 32, "Gun10=%d\n",PlayerInfo[playerid][pGun10]);fwrite(hFile, var);
				format(var, 32, "Gun11=%d\n",PlayerInfo[playerid][pGun11]);fwrite(hFile, var);
				format(var, 32, "Gun12=%d\n",PlayerInfo[playerid][pGun12]);fwrite(hFile, var);
				format(var, 32, "CarTime=%d\n",PlayerInfo[playerid][pCarTime]);fwrite(hFile, var);
				format(var, 32, "DrugsTime=%d\n",PlayerInfo[playerid][pDrugsTime]);fwrite(hFile, var);
				format(var, 32, "LawyerTime=%d\n",PlayerInfo[playerid][pLawyerTime]);fwrite(hFile, var);
				format(var, 32, "LawyerFreeTime=%d\n",PlayerInfo[playerid][pLawyerFreeTime]);fwrite(hFile, var);
				format(var, 32, "MechTime=%d\n",PlayerInfo[playerid][pMechTime]);fwrite(hFile, var);
				format(var, 32, "SexTime=%d\n",PlayerInfo[playerid][pSexTime]);fwrite(hFile, var);
				format(var, 32, "PayDay=%d\n",PlayerInfo[playerid][pPayDay]);fwrite(hFile, var);
				format(var, 32, "PayDayHad=%d\n",PlayerInfo[playerid][pPayDayHad]);fwrite(hFile, var);
				format(var, 32, "CDPlayer=%d\n",PlayerInfo[playerid][pCDPlayer]);fwrite(hFile, var);
				format(var, 32, "Dice=%d\n",PlayerInfo[playerid][pDice]);fwrite(hFile, var);
				format(var, 32, "Screw=%d\n",PlayerInfo[playerid][pScrew]);fwrite(hFile, var);
				format(var, 32, "Rope=%d\n",PlayerInfo[playerid][pRope]);fwrite(hFile, var);
				format(var, 32, "AKmagazine=%d\n",PlayerInfo[playerid][pAKmagazine]);fwrite(hFile, var);
				format(var, 32, "CSGmagazine=%d\n",PlayerInfo[playerid][pCSGmagazine]);fwrite(hFile, var);
				format(var, 32, "Demagazine=%d\n",PlayerInfo[playerid][pDemagazine]);fwrite(hFile, var);
				format(var, 32, "Snack=%d\n",PlayerInfo[playerid][pSnack]);fwrite(hFile, var);
				format(var, 32, "GoldCoin=%d\n",PlayerInfo[playerid][pGoldCoin]);fwrite(hFile, var);
				format(var, 32, "Bandage=%d\n",PlayerInfo[playerid][pBandage]);fwrite(hFile, var);
				format(var, 32, "BandageEffect=%d\n",PlayerInfo[playerid][pBandageEffect]);fwrite(hFile, var);
				format(var, 32, "WT=%d\n",PlayerInfo[playerid][pWT]);fwrite(hFile, var);
				format(var, 32, "WTc=%d\n",PlayerInfo[playerid][pWTc]);fwrite(hFile, var);
				format(var, 32, "Bombs=%d\n",PlayerInfo[playerid][pBombs]);fwrite(hFile, var);
				format(var, 32, "Scope=%d\n",PlayerInfo[playerid][pScope]);fwrite(hFile, var);
				format(var, 32, "OwnsMask=%d\n",PlayerInfo[playerid][pOwnsMask]);fwrite(hFile, var);
				format(var, 32, "Wins=%d\n",PlayerInfo[playerid][pWins]);fwrite(hFile, var);
				format(var, 32, "Loses=%d\n",PlayerInfo[playerid][pLoses]);fwrite(hFile, var);
				format(var, 32, "Tutorial=%d\n",PlayerInfo[playerid][pTut]);fwrite(hFile, var);
				format(var, 32, "OnDuty=%d\n",PlayerInfo[playerid][pOnDuty]);fwrite(hFile, var);
				format(var, 32, "DutyTime=%d\n",PlayerInfo[playerid][pDutyTime]);fwrite(hFile, var);
				format(var, 32, "Injured=%d\n",PlayerInfo[playerid][pInjured]);fwrite(hFile, var);
				format(var, 32, "Adjustable=%d\n",PlayerInfo[playerid][pAdjustable]);fwrite(hFile, var);
				format(var, 32, "Married=%d\n",PlayerInfo[playerid][pMarried]);fwrite(hFile, var);
				format(var, 32, "Tweet=%d\n",PlayerInfo[playerid][pTweet]);fwrite(hFile, var);
				format(var, 32, "InternetPack=%d\n",PlayerInfo[playerid][pInternetPack]);fwrite(hFile, var);
				format(var, 32, "MarryTo=%s\n",PlayerInfo[playerid][pMarriedTo]);fwrite(hFile, var);
				format(var, 32, "ForumName=%s\n",PlayerInfo[playerid][pForumName]);fwrite(hFile, var);
				format(var, 32, "NormalName=%s\n",PlayerInfo[playerid][pNormalName]);fwrite(hFile, var);
				format(var, 32, "TweetName=%s\n",PlayerInfo[playerid][pTweetName]);fwrite(hFile, var);
				format(var, 32, "AdminName=%s\n",PlayerInfo[playerid][pAdminName]);fwrite(hFile, var);
				format(var, 32, "HelperName=%s\n",PlayerInfo[playerid][pHelperName]);fwrite(hFile, var);
				format(var, 32, "BanAdmin=%s\n",PlayerInfo[playerid][pBanAdmin]);fwrite(hFile, var);
				format(var, 64, "BanReason=%s\n",PlayerInfo[playerid][pBanReason]);fwrite(hFile, var);
				format(var, 32, "JailAdmin=%s\n",PlayerInfo[playerid][pJailAdmin]);fwrite(hFile, var);
				format(var, 64, "JailReason=%s\n",PlayerInfo[playerid][pJailReason]);fwrite(hFile, var);
				format(var, 64, "ContactOne=%s\n",PlayerInfo[playerid][pContactOne]);fwrite(hFile, var);
 	            format(var, 64, "ContactTwo=%s\n",PlayerInfo[playerid][pContactTwo]);fwrite(hFile, var);
 	            format(var, 64, "ContactThree=%s\n",PlayerInfo[playerid][pContactThree]);fwrite(hFile, var);
 	            format(var, 64, "ContactFour=%s\n",PlayerInfo[playerid][pContactFour]);fwrite(hFile, var);
 	            format(var, 64, "ContactFive=%s\n",PlayerInfo[playerid][pContactFive]);fwrite(hFile, var);
 	            format(var, 64, "ContactSix=%s\n",PlayerInfo[playerid][pContactSix]);fwrite(hFile, var);
 	            format(var, 64, "ContactSeven=%s\n",PlayerInfo[playerid][pContactSeven]);fwrite(hFile, var);
				format(var, 32, "ContractBy=%s\n",PlayerInfo[playerid][pContractBy]);fwrite(hFile, var);
				format(var, 32, "IP=%s\n",PlayerInfo[playerid][pIP]);fwrite(hFile, var);
				format(var, 32, "FishBait=%d\n",PlayerInfo[playerid][pFishBait]);fwrite(hFile, var);
				format(var, 32, "FishRod=%d\n",PlayerInfo[playerid][pFishRod]);fwrite(hFile, var);
				format(var, 32, "NewbieMuted=%d\n",PlayerInfo[playerid][pNewbieMuted]);fwrite(hFile, var);
				format(var, 32, "RHmuted=%d\n",PlayerInfo[playerid][prhmuted]);fwrite(hFile, var);
				format(var, 32, "ReportMuted=%d\n",PlayerInfo[playerid][pReportMuted]);fwrite(hFile, var);
				format(var, 32, "AdvertiseMuted=%d\n",PlayerInfo[playerid][pAdvertiseMuted]);fwrite(hFile, var);
				format(var, 32, "SafeSpawn=%d\n",PlayerInfo[playerid][pSafeSpawn]);fwrite(hFile, var);
				format(var, 32, "SPos_x=%f\n",PlayerInfo[playerid][pSPos_x]);fwrite(hFile, var);
				format(var, 32, "SPos_y=%f\n",PlayerInfo[playerid][pSPos_y]);fwrite(hFile, var);
				format(var, 32, "SPos_z=%f\n",PlayerInfo[playerid][pSPos_z]);fwrite(hFile, var);
				format(var, 32, "SPos_r=%f\n",PlayerInfo[playerid][pSPos_r]);fwrite(hFile, var);
				format(var, 32, "HelperLevel=%d\n",PlayerInfo[playerid][pHelper]);fwrite(hFile, var);
				format(var, 32, "MaskNumber=%d\n",PlayerInfo[playerid][pMask]);fwrite(hFile, var);
				format(var, 32, "Blindfolds=%d\n",PlayerInfo[playerid][pBlindfolds]);fwrite(hFile, var);
				format(var, 32, "Speedo=%d\n",gSpeedo[playerid]);fwrite(hFile, var);
				format(var, 32, "Seeds=%d\n",PlayerInfo[playerid][pSeeds]);fwrite(hFile, var);
				format(var, 32, "Famed=%d\n", PlayerInfo[playerid][pFamed]);fwrite(hFile, var);
				fclose(hFile);
			}
		}
	}
	return 1;
}


//-----------------------------------------[Mechanic Help]----------------------------//
	if(strcmp(cmd, "/mechhelp", true) == 0)
	{
        SendClientMessage(playerid,COLOR_YELLOW,"** Mechanic Help [Level 1] : [/repair] and [/fixwreck]");
 		SendClientMessage(playerid,COLOR_YELLOW,"** Mechanic Help [Level 2]: [/carcolor] and [/paintjob]");
 		SendClientMessage(playerid,COLOR_YELLOW,"** Mechanic Help [Level 3]: [/addneon] and [/deleteneon]");
 		SendClientMessage(playerid,COLOR_YELLOW,"** Mechanic Help [Level 4]: [/cartune] and [/deletetune]");
 		SendClientMessage(playerid,COLOR_YELLOW,"** Mechanic Help [Level 5]: [/upgrade]");
 		SendClientMessage(playerid,COLOR_YELLOW,"** Mechanic Help : /mechhelp |-| /mechprice |-| /checkrepair **");
		return 1;
	}
  
  else if(strcmp(x_nr,"8",true) == 0)//Mechanic
			{
			    new level = PlayerInfo[playerid][pMechSkill];
				if(level >= 0 && level <= 50) { SendClientMessage(playerid, COLOR_YELLOW, "Your Mechanic Skill Level = 1."); format(string, sizeof(string), "You need to fix a car for %d skills more to Level up.", 50 - level); SendClientMessage(playerid, COLOR_YELLOW, string); }
				else if(level >= 51 && level <= 100) { SendClientMessage(playerid, COLOR_YELLOW, "Your Mechanic Skill Level = 2."); format(string, sizeof(string), "You need to fix/modift a car for %d skills more to Level up.", 100 - level); SendClientMessage(playerid, COLOR_YELLOW, string); }
				else if(level >= 101 && level <= 200) { SendClientMessage(playerid, COLOR_YELLOW, "Your Mechanic Skill Level = 3."); format(string, sizeof(string), "You need to fix/modift a car for %d skills more to Level up.", 200 - level); SendClientMessage(playerid, COLOR_YELLOW, string); }
				else if(level >= 201 && level <= 400) { SendClientMessage(playerid, COLOR_YELLOW, "Your Mechanic Skill Level = 4."); format(string, sizeof(string), "You need to fix/modift a car for %d e to Level up.", 400 - level); SendClientMessage(playerid, COLOR_YELLOW, string); }
				else if(level >= 401) { SendClientMessage(playerid, COLOR_YELLOW, "Your Mechanic Skill Level = 5."); }
			}
      
  
public upgrade(playerid)
{
    new string[256];
    new savecar = GetClosestCar(playerid);
	if(IsPlayerInRangeOfPoint(playerid,28.0,1607.6606,-2164.7157,13.5619) || IsPlayerInRangeOfPoint(playerid, 28.0,2453.5039,-2713.4714,3.1648))
	{
		if(PlayerInfo[playerid][pCompo] >= 25)
		{
			new Float:V1X, Float:V1Y, Float:V1Z;
			GetVehiclePos(savecar, V1X, V1Y, V1Z);
			if(IsPlayerInRangeOfPoint(playerid, 4, V1X, V1Y, V1Z))
			{
		        for(new i; i<MAX_PLAYERS; i++)
				{
					if(PlayerVehicleID1[i] == savecar)
					{
						if(PlayerInfo[i][PlayerVehicle1Upgraded] == 0)
						{
							SetVehicleHealth(PlayerVehicleID1[i], 2000);
							PlayerPlaySound(playerid,1133,0.0,0.0,0.0);
							PlayerInfo[playerid][pCompo] -= 25;
							PlayerInfo[i][PlayerVehicle1Upgraded] = 1;
						  	FixCarTimer[playerid] = 1;
						  	SetTimerEx("FixCar",60*1000,0,"i",playerid);
						}
					}
					else if(PlayerVehicleID2[i] == savecar)
					{
						if(PlayerInfo[i][PlayerVehicle2Upgraded] == 0)
						{
							SetVehicleHealth(PlayerVehicleID2[i], 2000);
							PlayerPlaySound(playerid,1133,0.0,0.0,0.0);
							PlayerInfo[playerid][pCompo] -= 25;
							PlayerInfo[i][PlayerVehicle2Upgraded] = 1;
						  	FixCarTimer[playerid] = 1;
						  	SetTimerEx("FixCar",60*1000,0,"i",playerid);
						}
					}
					else if(PlayerVehicleID3[i] == savecar)
					{
						if(PlayerInfo[i][PlayerVehicle3Upgraded] == 0)
						{
							SetVehicleHealth(PlayerVehicleID3[i], 2000);
							PlayerPlaySound(playerid,1133,0.0,0.0,0.0);
							PlayerInfo[playerid][pCompo] -= 25;
							PlayerInfo[i][PlayerVehicle3Upgraded] = 1;
						  	FixCarTimer[playerid] = 1;
						  	SetTimerEx("FixCar",60*1000,0,"i",playerid);
						}
					}
					else if(PlayerVehicleID4[i] == savecar)
					{
						if(PlayerInfo[i][PlayerVehicle4Upgraded] == 0)
						{
							SetVehicleHealth(PlayerVehicleID4[i], 2000);
							PlayerPlaySound(playerid,1133,0.0,0.0,0.0);
							PlayerInfo[playerid][pCompo] -= 25;
							PlayerInfo[i][PlayerVehicle4Upgraded] = 1;
						  	FixCarTimer[playerid] = 1;
						  	SetTimerEx("FixCar",60*1000,0,"i",playerid);
						}
					}
					else if(PlayerVehicleID5[i] == savecar)
					{
						if(PlayerInfo[i][PlayerVehicle5Upgraded] == 0)
						{
							SetVehicleHealth(PlayerVehicleID5[i], 2000);
							PlayerPlaySound(playerid,1133,0.0,0.0,0.0);
							PlayerInfo[playerid][pCompo] -= 25;
							PlayerInfo[i][PlayerVehicle5Upgraded] = 1;
						  	FixCarTimer[playerid] = 1;
						  	SetTimerEx("FixCar",60*1000,0,"i",playerid);
						}
					}
				}
			}
			Upgraded[savecar] = 1;
			PlayerFrozen[playerid] = 0;
			TogglePlayerControllable(playerid, 1);
			format(string, sizeof(string), "* %s has upgrading the vehicle engine using 25 Component.", PlayerName(playerid));
			ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
		}
		else
		{
			SendClientMessage(playerid,COLOR_GREY,"   You are not near any vehicle !");
			return 1;
		}
	}
	return 1;
}
 
      
      
if(strcmp(cmd, "/upgrade", true) == 0)
	{
 		if(IsPlayerConnected(playerid))
 		{
			if(PlayerInfo[playerid][pJob] != 7)
			{
			    SendClientMessage(playerid, COLOR_GREY, "[MECHANIC] You are not a Mechanic !");
			}
			else if(PlayerInfo[playerid][pJob] == 7)
			{
                new vehid = GetClosestCar(playerid);
	    	    if(FixCarTimer[playerid]) return SendClientMessage(playerid,COLOR_GREY,"   You must wait 60 seconds to upgrading any vehicle !");
	    	    if(!IsPlayerInRangeOfPoint(playerid,28.0,1607.6606,-2164.7157,13.5619) && !IsPlayerInRangeOfPoint(playerid, 28.0,2453.5039,-2713.4714,3.1648)) return SendClientMessage(playerid, GREY, "[MECHANIC] You are not in Mechanic Center");
	    	    if(PlayerInfo[playerid][pCompo] < 25) return SendClientMessage(playerid, GREY, "[MECHANIC] You need Minimum 25 Component to Upgrading the Vehicle Engine!");
	    	    if(PlayerInfo[playerid][pMechSkill] < 400) return SendClientMessage(playerid, GREY, "[MECHANIC] You need to be Mechanic Level 5 to Upgrading Vehicles (/skill) !");
	    	    if(JobDuty[playerid] == 0) return SendClientMessage(playerid, COLOR_RED, "[MECHANIC] You are not a Mechanic Duty!");
		        if(PlayerInfo[playerid][pInjured] != 0 || IsPlayerInAnyVehicle(playerid))
				{
			  		SendClientMessage(playerid, COLOR_GREY, "   You can't do that at this time !");
					return 1;
				}
				if(!IsABoat(vehid) && IsPlayerInRangeOfPoint(playerid, 28.0,2453.5039,-2713.4714,3.1648))
				{
					SendClientMessage(playerid, COLOR_GREY, "[MECHANIC] You are Not at Mechanic Center");
					return 1;
				}
				if(HoodOpen[vehid] == 0 && IsACar(vehid))
				{
					SendClientMessage(playerid,COLOR_GREY,"   Open the Vehicle Hood first !");
					return 1;
				}
				new Float:V1X, Float:V1Y, Float:V1Z;
				GetVehiclePos(vehid, V1X, V1Y, V1Z);
				if(IsPlayerInRangeOfPoint(playerid, 4, V1X, V1Y, V1Z))
				{
				    if(Upgraded[vehid] != 0) return SendClientMessage(playerid, COLOR_RED, "[MECHANIC] This Vehicle has already Upgraded !");
			    	SendClientMessage(playerid, COLOR_LIGHTBLUE, "[MECHANIC] Upgrading Engine Vehicle, Please Wait.....");
		    	    PlayerFrozen[playerid] = 1;
			        TogglePlayerControllable(playerid, 0);
			        SetTimerEx("upgrade", 12000, false, "i", playerid);
				}
				else
				{
					SendClientMessage(playerid,COLOR_GREY,"   You are not near any vehicle !");
					return 1;
				}
	    	}
		}
		return 1;
	}
  
  
public repair(playerid)
{
    new string[256];
	new vehid = GetClosestCar(playerid);
	new Float: health;
	GetVehicleHealth(vehid, health);
	if(IsPlayerInRangeOfPoint(playerid,28.0,1607.6606,-2164.7157,13.5619) || IsPlayerInRangeOfPoint(playerid, 28.0,2453.5039,-2713.4714,3.1648))
	{
		if(PlayerInfo[playerid][pCompo] >= 10)
		{
			new Float:V1X, Float:V1Y, Float:V1Z;
			GetVehiclePos(vehid, V1X, V1Y, V1Z);
			if(IsPlayerInRangeOfPoint(playerid, 4, V1X, V1Y, V1Z))
			{
				if(Upgraded[vehid] == 1)
				{
				    if(health >= 250.0 && health <= 600.0)
					{
						RepairVehicle(vehid);
						SetVehicleHealth(vehid, 2000);
				        PlayerPlaySound(playerid,1133,0.0,0.0,0.0);
				  		PlayerInfo[playerid][pCompo] -= 10;
				  		PlayerInfo[playerid][pMechSkill] += 5;
						format(string, sizeof(string), "* %s has repaired the vehicle using 10 Component.", PlayerName(playerid));
				  		ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
				  		FixCarTimer[playerid] = 1;
				  		SetTimerEx("FixCar",60*1000,0,"i",playerid);
				    }
					else if(health >= 600.0 && health <= 900.0)
					{
						RepairVehicle(vehid);
						SetVehicleHealth(vehid, 2000);
					    PlayerPlaySound(playerid,1133,0.0,0.0,0.0);
					    PlayerInfo[playerid][pCompo] -= 8;
					    PlayerInfo[playerid][pMechSkill] += 5;
						format(string, sizeof(string), "* %s has repaired the vehicle using 8 Component.", PlayerName(playerid));
					    ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
					    FixCarTimer[playerid] = 1;
					    SetTimerEx("FixCar",60*1000,0,"i",playerid);
					}
					else if(health >= 900.0 && health <= 1200.0)
					{
						RepairVehicle(vehid);
						SetVehicleHealth(vehid, 2000);
					    PlayerPlaySound(playerid,1133,0.0,0.0,0.0);
					    PlayerInfo[playerid][pCompo] -= 6;
					    PlayerInfo[playerid][pMechSkill] += 5;
						format(string, sizeof(string), "* %s has repaired the vehicle using 6 Component.", PlayerName(playerid));
					    ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
					    FixCarTimer[playerid] = 1;
					    SetTimerEx("FixCar",60*1000,0,"i",playerid);
					}
					else if(health >= 1200.0 && health <= 1600.0)
					{
						RepairVehicle(vehid);
						SetVehicleHealth(vehid, 1000);
					    PlayerPlaySound(playerid,1133,0.0,0.0,0.0);
					    PlayerInfo[playerid][pCompo] -= 4;
					    PlayerInfo[playerid][pMechSkill] += 5;
						format(string, sizeof(string), "* %s has repaired the vehicle using 4 Component.", PlayerName(playerid));
					    ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
					    FixCarTimer[playerid] = 1;
					    SetTimerEx("FixCar",60*1000,0,"i",playerid);
					}
					else if(health >= 1600.0 && health <= 2000.0)
					{
						RepairVehicle(vehid);
						SetVehicleHealth(vehid, 2000);
					    PlayerPlaySound(playerid,1133,0.0,0.0,0.0);
					    PlayerInfo[playerid][pCompo] -= 2;
					    PlayerInfo[playerid][pMechSkill] += 5;
						format(string, sizeof(string), "* %s has repaired the vehicle using 2 Component.", PlayerName(playerid));
					    ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
					    FixCarTimer[playerid] = 1;
					    SetTimerEx("FixCar",60*1000,0,"i",playerid);
					}
				}
				else
				{
					if(health >= 250.0 && health <= 400.0)
					{
						RepairVehicle(vehid);
						SetVehicleHealth(vehid, 1000);
				        PlayerPlaySound(playerid,1133,0.0,0.0,0.0);
				  		PlayerInfo[playerid][pCompo] -= 8;
				  		PlayerInfo[playerid][pMechSkill] += 5;
						format(string, sizeof(string), "* %s has repaired the vehicle using 8 Component.", PlayerName(playerid));
				  		ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
				  		FixCarTimer[playerid] = 1;
				  		SetTimerEx("FixCar",60*1000,0,"i",playerid);
				    }
					else if(health >= 400.0 && health <= 600.0)
					{
						RepairVehicle(vehid);
						SetVehicleHealth(vehid, 1000);
					    PlayerPlaySound(playerid,1133,0.0,0.0,0.0);
					    PlayerInfo[playerid][pCompo] -= 6;
					    PlayerInfo[playerid][pMechSkill] += 5;
						format(string, sizeof(string), "* %s has repaired the vehicle using 6 Component.", PlayerName(playerid));
					    ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
					    FixCarTimer[playerid] = 1;
					    SetTimerEx("FixCar",60*1000,0,"i",playerid);
					}
					else if(health >= 600.0 && health <= 800.0)
					{
						RepairVehicle(vehid);
						SetVehicleHealth(vehid, 1000);
					    PlayerPlaySound(playerid,1133,0.0,0.0,0.0);
					    PlayerInfo[playerid][pCompo] -= 4;
					    PlayerInfo[playerid][pMechSkill] += 5;
						format(string, sizeof(string), "* %s has repaired the vehicle using 4 Component.", PlayerName(playerid));
					    ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
					    FixCarTimer[playerid] = 1;
					    SetTimerEx("FixCar",60*1000,0,"i",playerid);
					}
					else if(health >= 800.0 && health <= 1000.0)
					{
						RepairVehicle(vehid);
						SetVehicleHealth(vehid, 1000);
					    PlayerPlaySound(playerid,1133,0.0,0.0,0.0);
					    PlayerInfo[playerid][pCompo] -= 2;
					    PlayerInfo[playerid][pMechSkill] += 5;
						format(string, sizeof(string), "* %s has repaired the vehicle using 2 Component.", PlayerName(playerid));
					    ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
					    FixCarTimer[playerid] = 1;
					    SetTimerEx("FixCar",60*1000,0,"i",playerid);
					}
				}
			}
			PlayerFrozen[playerid] = 0;
	        TogglePlayerControllable(playerid, 1);
		}
		else
		{
			SendClientMessage(playerid,COLOR_GREY,"   You are not near any vehicle !");
			return 1;
		}
	}
	return 1;
}

  

	if(strcmp(cmd, "/checkrepair", true) == 0)
	{
 		if(IsPlayerConnected(playerid))
 		{
			if(PlayerInfo[playerid][pJob] != 7)
			{
			    SendClientMessage(playerid, COLOR_GREY, "[MECHANIC] You are not a Mechanic !");
			}
			else if(PlayerInfo[playerid][pJob] == 7)
			{
	    	    if(FixCarTimer[playerid]) return SendClientMessage(playerid,COLOR_GREY,"   You must wait 60 seconds to repair any vehicle !");
	    	    if(!IsPlayerInRangeOfPoint(playerid,28.0,1607.6606,-2164.7157,13.5619) && !IsPlayerInRangeOfPoint(playerid, 28.0,2453.5039,-2713.4714,3.1648)) return SendClientMessage(playerid, GREY, "[MECHANIC] You are not in Mechanic Center");
	    	    if(JobDuty[playerid] == 0) return SendClientMessage(playerid, COLOR_RED, "[MECHANIC] You are not a Mechanic Duty!");
	    	    new vehid = GetClosestCar(playerid);
		        if(PlayerInfo[playerid][pInjured] != 0 || IsPlayerInAnyVehicle(playerid))
				{
			  		SendClientMessage(playerid, COLOR_GREY, "   You can't do that at this time !");
					return 1;
				}
				if(HoodOpen[vehid] == 0 && IsACar(vehid))
				{
					SendClientMessage(playerid,COLOR_GREY,"   Open the Vehicle Hood first !");
					return 1;
				}
				new Float:V1X, Float:V1Y, Float:V1Z;
				GetVehiclePos(vehid, V1X, V1Y, V1Z);
				if(IsPlayerInRangeOfPoint(playerid, 4, V1X, V1Y, V1Z))
				{
		    	    new Float: health;
				    GetVehicleHealth(vehid, health);
		    	    if(Upgraded[vehid] == 1)
					{
					    if(health >= 250.0 && health <= 600.0)
						{
							SendClientMessage(playerid,COLOR_YELLOW,"[VEHICLE INFO] You need 10 component to Repair this Vehicle !");
					    }
						else if(health >= 600.0 && health <= 900.0)
						{
							SendClientMessage(playerid,COLOR_YELLOW,"[VEHICLE INFO] You need 8 component to Repair this Vehicle !");
						}
						else if(health >= 900.0 && health <= 1200.0)
						{
							SendClientMessage(playerid,COLOR_YELLOW,"[VEHICLE INFO] You need 6 component to Repair this Vehicle !");
						}
						else if(health >= 1200.0 && health <= 1600.0)
						{
							SendClientMessage(playerid,COLOR_YELLOW,"[VEHICLE INFO] You need 4 component to Repair this Vehicle !");
						}
						else if(health >= 1600.0 && health <= 2000.0)
						{
							SendClientMessage(playerid,COLOR_YELLOW,"[VEHICLE INFO] You need 2 component to Repair this Vehicle !");
						}
					}
					else
					{
						if(health >= 250.0 && health <= 400.0)
						{
							SendClientMessage(playerid,COLOR_YELLOW,"[VEHICLE INFO] You need 8 component to Repair this Vehicle !");
					    }
						else if(health >= 400.0 && health <= 600.0)
						{
							SendClientMessage(playerid,COLOR_YELLOW,"[VEHICLE INFO] You need 6 component to Repair this Vehicle !");
						}
						else if(health >= 600.0 && health <= 800.0)
						{
							SendClientMessage(playerid,COLOR_YELLOW,"[VEHICLE INFO] You need 4 component to Repair this Vehicle !");
						}
						else if(health >= 800.0 && health <= 1000.0)
						{
							SendClientMessage(playerid,COLOR_YELLOW,"[VEHICLE INFO] You need 2 component to Repair this Vehicle !");
						}
					}
				}
				else
				{
					SendClientMessage(playerid,COLOR_GREY,"   You are not near any vehicle !");
					return 1;
				}
	    	}
		}
		return 1;
	}
  
  
  
  if(strcmp(cmd, "/carcolor", true) == 0)
	{
        if(IsPlayerConnected(playerid))
		{
			if(!IsPlayerInRangeOfPoint(playerid, 28.0,1607.6606,-2164.7157,13.5619) && !IsPlayerInRangeOfPoint(playerid, 28.0,2453.5039,-2713.4714,3.1648)) return SendClientMessage(playerid, COLOR_GREY, "[MECHANIC] You are Not at Mechanic Center");
			if(PlayerInfo[playerid][pJob] != 7) return SendClientMessage(playerid, COLOR_GREY, "[MECHANIC] You are not a Mechanic");
			if(PlayerInfo[playerid][pCompo] < 5) return SendClientMessage(playerid, GREY, "[MECHANIC] You need 5 Component for Painting Vehicle!");
			if(PlayerInfo[playerid][pMechSkill] < 50) return SendClientMessage(playerid, GREY, "[MECHANIC] You need to be Mechanic Level 2 to Coloring Vehicles (/skill) !");
			if(JobDuty[playerid] == 0) return SendClientMessage(playerid, COLOR_RED, "[MECHANIC] You are not a Mechanic Duty!");
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) { SendClientMessage(playerid, COLOR_WHITE, "USAGE: /carcolor [colorid 1] [colorid 2]"); return 1; }
			new colorid = strvalEx(tmp);
			if(colorid < 0 && colorid > 255) { SendClientMessage(playerid, COLOR_GREY, "   Invalid Color ID [ID1] !"); return 1; }
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) { SendClientMessage(playerid, COLOR_WHITE, "USAGE: /carcolor [colorid 1] [colorid 2]"); return 1; }
			new colorid2 = strvalEx(tmp);
			if(colorid2 < 0 && colorid2 > 255) { SendClientMessage(playerid, COLOR_WHITE, "USAGE: /carcolor [colorid 1] [colorid 2]"); SendClientMessage(playerid, COLOR_GREY, "   Invalid Color ID [ID2] !"); return 1; }
		    if(PlayerInfo[playerid][pInjured] != 0 || IsPlayerInAnyVehicle(playerid))
			{
			  	SendClientMessage(playerid, COLOR_GREY, "   You can't do that at this time !");
				return 1;
			}
			new vehicleid = GetClosestCar(playerid);
			if(!IsABoat(vehicleid) && IsPlayerInRangeOfPoint(playerid, 28.0,2453.5039,-2713.4714,3.1648))
			{
				SendClientMessage(playerid, COLOR_GREY, "[MECHANIC] You are Not at Mechanic Center");
				return 1;
			}
			if(HoodOpen[vehicleid] == 0 && IsACar(vehicleid))
			{
				SendClientMessage(playerid,COLOR_GREY,"   Open the Vehicle Hood first !");
				return 1;
			}
			new Float:V1X, Float:V1Y, Float:V1Z;
			GetVehiclePos(vehicleid, V1X, V1Y, V1Z);
			if(IsPlayerInRangeOfPoint(playerid, 4, V1X, V1Y, V1Z))
			{
				for(new i = 0; i < MAX_PLAYERS; i++)
				{
	                GetPlayerName(playerid, sendername, sizeof(sendername));
		            GetPlayerName(i, giveplayer, sizeof(giveplayer));
			        if(PlayerVehicleID1[i] == vehicleid)
					{
						ChangeVehicleColor(vehicleid,colorid,colorid2);
	            		PlayerInfo[i][pPlayerVehicle1Color] = colorid;
	            		PlayerInfo[i][pPlayerVehicle1Color2] = colorid2;
	            		format(string, sizeof(string), " You has change %s Vehicle color ! [SLOT: 1]",giveplayer);
						SendClientMessage(playerid, COLOR_YELLOW, string);
						format(string, sizeof(string), " %s has change your Vehicle color ! [SLOT: 1]",sendername);
						SendClientMessage(i, COLOR_YELLOW, string);
						PlayerInfo[playerid][pCompo] -= 5;
						PlayerInfo[playerid][pMechSkill] += 10;
						return 1;
					}
					else if(PlayerVehicleID2[i] == vehicleid)
					{
						ChangeVehicleColor(vehicleid,colorid,colorid2);
	            		PlayerInfo[i][pPlayerVehicle2Color] = colorid;
	            		PlayerInfo[i][pPlayerVehicle2Color2] = colorid2;
	            		format(string, sizeof(string), " You has change %s Vehicle color ! [SLOT: 2]",giveplayer);
						SendClientMessage(playerid, COLOR_YELLOW, string);
						format(string, sizeof(string), " %s has change your Vehicle color ! [SLOT: 2]",sendername);
						SendClientMessage(i, COLOR_YELLOW, string);
						PlayerInfo[playerid][pCompo] -= 5;
						PlayerInfo[playerid][pMechSkill] += 10;
						return 1;
					}
					else if(PlayerVehicleID3[i] == vehicleid)
					{
						ChangeVehicleColor(vehicleid,colorid,colorid2);
	            		PlayerInfo[i][pPlayerVehicle3Color] = colorid;
	            		PlayerInfo[i][pPlayerVehicle3Color2] = colorid2;
	            		format(string, sizeof(string), " You has change %s Vehicle color ! [SLOT: 3]",giveplayer);
						SendClientMessage(playerid, COLOR_YELLOW, string);
						format(string, sizeof(string), " %s has change your Vehicle color ! [SLOT: 3]",sendername);
						SendClientMessage(i, COLOR_YELLOW, string);
						PlayerInfo[playerid][pCompo] -= 5;
						PlayerInfo[playerid][pMechSkill] += 10;
						return 1;
					}
					else if(PlayerVehicleID4[i] == vehicleid)
					{
						ChangeVehicleColor(vehicleid,colorid,colorid2);
	            		PlayerInfo[i][pPlayerVehicle4Color] = colorid;
	            		PlayerInfo[i][pPlayerVehicle4Color2] = colorid2;
	            		format(string, sizeof(string), " You has change %s Vehicle color ! [SLOT: 4]",giveplayer);
						SendClientMessage(playerid, COLOR_YELLOW, string);
						format(string, sizeof(string), " %s has change your Vehicle color ! [SLOT: 4]",sendername);
						SendClientMessage(i, COLOR_YELLOW, string);
						PlayerInfo[playerid][pCompo] -= 5;
						PlayerInfo[playerid][pMechSkill] += 10;
						return 1;
					}
					else if(PlayerVehicleID5[i] == vehicleid)
					{
						ChangeVehicleColor(vehicleid,colorid,colorid2);
	            		PlayerInfo[i][pPlayerVehicle5Color] = colorid;
	            		PlayerInfo[i][pPlayerVehicle5Color2] = colorid2;
	            		format(string, sizeof(string), " You has change %s Vehicle color ! [SLOT: 5]",giveplayer);
						SendClientMessage(playerid, COLOR_YELLOW, string);
						format(string, sizeof(string), " %s has change your Vehicle color ! [SLOT: 5]",sendername);
						SendClientMessage(i, COLOR_YELLOW, string);
						PlayerInfo[playerid][pCompo] -= 5;
						PlayerInfo[playerid][pMechSkill] += 10;
						return 1;
					}
				}
			}
			else
			{
			    SendClientMessage(playerid,COLOR_YELLOW,"	You are not near any vehicle.");
			    return 1;
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/paintjob", true) == 0)
	{
		if(!IsPlayerInRangeOfPoint(playerid, 28.0,1607.6606,-2164.7157,13.5619)) return SendClientMessage(playerid, COLOR_GREY, "[MECHANIC] You are Not at the Car Colors Shop");
		if(PlayerInfo[playerid][pJob] != 7) return SendClientMessage(playerid, COLOR_GREY, "[MECHANIC] You are not a Mechanic");
		if(PlayerInfo[playerid][pCompo] < 5) return SendClientMessage(playerid, GREY, "[MECHANIC] You need 5 Component for Paintjob Vehicle!");
		if(PlayerInfo[playerid][pMechSkill] < 50) return SendClientMessage(playerid, GREY, "[MECHANIC] You need to be Mechanic Level 2 to Coloring Vehicles (/skill) !");
		if(JobDuty[playerid] == 0) return SendClientMessage(playerid, COLOR_RED, "[MECHANIC] You are not a Mechanic Duty!");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) { SendClientMessage(playerid, COLOR_WHITE, "USAGE: /paintjob [paintjobid]"); return 1; }
		new paintid = strvalEx(tmp);
		if(paintid < 0 || paintid > 3) { SendClientMessage(playerid, COLOR_GREY, "   Invalid Paintjob ID !"); return 1; }
		if(PlayerInfo[playerid][pInjured] != 0 || IsPlayerInAnyVehicle(playerid))
		{
			SendClientMessage(playerid, COLOR_GREY, "   You can't do that at this time !");
			return 1;
		}
		new vehicleid = GetClosestCar(playerid);
		if(IsAPlane(vehicleid) || IsAHelicopter(vehicleid) || IsABike(vehicleid) || IsATrain(vehicleid) || IsABoat(vehicleid))
		{
			SendClientMessage(playerid,COLOR_GREY,"   Invalid Vehicle (Bike/Plane/Helicopter/Boat) !");
			return 1;
		}
		if(HoodOpen[vehicleid] == 0 && IsACar(vehicleid))
		{
			SendClientMessage(playerid,COLOR_GREY,"   Open the Vehicle Hood first !");
			return 1;
		}
		new Float:V1X, Float:V1Y, Float:V1Z;
		GetVehiclePos(vehicleid, V1X, V1Y, V1Z);
		if(IsPlayerInRangeOfPoint(playerid, 4, V1X, V1Y, V1Z))
		{
			for(new i = 0; i < MAX_PLAYERS; i++)
			{
                GetPlayerName(playerid, sendername, sizeof(sendername));
	            GetPlayerName(i, giveplayer, sizeof(giveplayer));
		        if(PlayerVehicleID1[i] == vehicleid)
				{
					if(paintid == 3)
                    {
						ChangeVehiclePaintjob(vehicleid,255);
	            		PlayerInfo[i][PlayerVehicle1PaintJob] = 255;
					}
					else
					{
						ChangeVehiclePaintjob(vehicleid,paintid);
  					    PlayerInfo[i][PlayerVehicle1PaintJob] = paintid;
					}
					format(string, sizeof(string), " You has change %s Vehicle paintjob ! [SLOT: 1]",giveplayer);
					SendClientMessage(playerid, COLOR_YELLOW, string);
					format(string, sizeof(string), " %s has change your Vehicle paintjob ! [SLOT: 1]",sendername);
					SendClientMessage(i, COLOR_YELLOW, string);
					PlayerInfo[playerid][pCompo] -= 5;
					PlayerInfo[playerid][pMechSkill] += 10;
					return 1;
				}
				else if(PlayerVehicleID2[i] == vehicleid)
				{
					if(paintid == 3)
                    {
						ChangeVehiclePaintjob(vehicleid,255);
	            		PlayerInfo[i][PlayerVehicle2PaintJob] = 255;
					}
					else
					{
						ChangeVehiclePaintjob(vehicleid,paintid);
  					    PlayerInfo[i][PlayerVehicle2PaintJob] = paintid;
					}
					format(string, sizeof(string), " You has change %s Vehicle paintjob ! [SLOT: 2]",giveplayer);
					SendClientMessage(playerid, COLOR_YELLOW, string);
					format(string, sizeof(string), " %s has change your Vehicle paintjob ! [SLOT: 2]",sendername);
					SendClientMessage(i, COLOR_YELLOW, string);
					PlayerInfo[playerid][pCompo] -= 5;
					PlayerInfo[playerid][pMechSkill] += 10;
					return 1;
				}
				else if(PlayerVehicleID3[i] == vehicleid)
				{
					if(paintid == 3)
                    {
						ChangeVehiclePaintjob(vehicleid,255);
	            		PlayerInfo[i][PlayerVehicle3PaintJob] = 255;
					}
					else
					{
						ChangeVehiclePaintjob(vehicleid,paintid);
  					    PlayerInfo[i][PlayerVehicle3PaintJob] = paintid;
					}
					format(string, sizeof(string), " You has change %s Vehicle paintjob ! [SLOT: 3]",giveplayer);
					SendClientMessage(playerid, COLOR_YELLOW, string);
					format(string, sizeof(string), " %s has change your Vehicle paintjob ! [SLOT: 3]",sendername);
					SendClientMessage(i, COLOR_YELLOW, string);
					PlayerInfo[playerid][pCompo] -= 5;
					PlayerInfo[playerid][pMechSkill] += 10;
					return 1;
				}
				else if(PlayerVehicleID4[i] == vehicleid)
				{
					if(paintid == 3)
                    {
						ChangeVehiclePaintjob(vehicleid,255);
	            		PlayerInfo[i][PlayerVehicle4PaintJob] = 255;
					}
					else
					{
						ChangeVehiclePaintjob(vehicleid,paintid);
  					    PlayerInfo[i][PlayerVehicle4PaintJob] = paintid;
					}
					format(string, sizeof(string), " You has change %s Vehicle paintjob ! [SLOT: 4]",giveplayer);
					SendClientMessage(playerid, COLOR_YELLOW, string);
					format(string, sizeof(string), " %s has change your Vehicle paintjob ! [SLOT: 4]",sendername);
					SendClientMessage(i, COLOR_YELLOW, string);
					PlayerInfo[playerid][pCompo] -= 5;
					PlayerInfo[playerid][pMechSkill] += 10;
					return 1;
				}
				else if(PlayerVehicleID5[i] == vehicleid)
				{
					if(paintid == 3)
                    {
						ChangeVehiclePaintjob(vehicleid,255);
	            		PlayerInfo[i][PlayerVehicle5PaintJob] = 255;
					}
					else
					{
						ChangeVehiclePaintjob(vehicleid,paintid);
  					    PlayerInfo[i][PlayerVehicle5PaintJob] = paintid;
					}
					format(string, sizeof(string), " You has change %s Vehicle paintjob ! [SLOT: 5]",giveplayer);
					SendClientMessage(playerid, COLOR_YELLOW, string);
					format(string, sizeof(string), " %s has change your Vehicle paintjob ! [SLOT: 5]",sendername);
					SendClientMessage(i, COLOR_YELLOW, string);
					PlayerInfo[playerid][pCompo] -= 5;
					PlayerInfo[playerid][pMechSkill] += 10;
					return 1;
				}
			}
		}
		else
		{
			SendClientMessage(playerid,COLOR_YELLOW,"	You are not near any vehicle.");
			return 1;
        }
	}
	if(strcmp(cmd, "/deleteneon", true) == 0)
	{
	 	if(!IsPlayerInRangeOfPoint(playerid,28.0,1607.6606,-2164.7157,13.5619)) return SendClientMessage(playerid, COLOR_GREY, "[MECHANIC] You are Not at the Car Colors Shop");
		if(PlayerInfo[playerid][pJob] != 7) return SendClientMessage(playerid, COLOR_GREY, "[MECHANIC] You are not a Mechanic");
		if(PlayerInfo[playerid][pCompo] < 3) return SendClientMessage(playerid, GREY, "[MECHANIC] You need 3 Component for Deleting Neon on Vehicle!");
        if(JobDuty[playerid] == 0) return SendClientMessage(playerid, COLOR_RED, "[MECHANIC] You are not a Mechanic Duty!");
        if(PlayerInfo[playerid][pMechSkill] < 100) return SendClientMessage(playerid, GREY, "[MECHANIC] You need to be Mechanic Level 3 to Adding/Remove Neon from Vehicles (/skill) !");
		if(PlayerInfo[playerid][pInjured] != 0 || IsPlayerInAnyVehicle(playerid))
		{
			SendClientMessage(playerid, COLOR_GREY, "   You can't do that at this time !");
			return 1;
		}
		new vehicleid = GetClosestCar(playerid);
		if(HoodOpen[vehicleid] == 0 && IsACar(vehicleid))
		{
			SendClientMessage(playerid,COLOR_GREY,"   Open the Vehicle Hood first !");
			return 1;
		}
		new Float:V1X, Float:V1Y, Float:V1Z;
		GetVehiclePos(vehicleid, V1X, V1Y, V1Z);
		if(IsPlayerInRangeOfPoint(playerid, 6, V1X, V1Y, V1Z))
		{
			for(new i = 0; i < MAX_PLAYERS; i++)
			{
                GetPlayerName(playerid, sendername, sizeof(sendername));
	            GetPlayerName(i, giveplayer, sizeof(giveplayer));
		        if(PlayerVehicleID1[i] == vehicleid)
				{
					if(PlayerInfo[i][PlayerVehicle1ModNeon] != 0)
					{
                        PlayerInfo[i][PlayerVehicle1ModNeon] = 0;
                        DestroyObject(CarNeon[vehicleid]);
            		    DestroyObject(CarNeon2[vehicleid]);
            		    format(string, sizeof(string), " You has remove neon from %s Vehicle! [SLOT: 1]",giveplayer);
					    SendClientMessage(playerid, COLOR_YELLOW, string);
					    format(string, sizeof(string), " %s has remove neon from your Vehicle ! [SLOT: 1]",sendername);
					    SendClientMessage(i, COLOR_YELLOW, string);
					    PlayerInfo[playerid][pCompo] -= 3;
					    PlayerInfo[playerid][pMechSkill] += 10;
					    return 1;
					}
					else
					{
						SendClientMessage(i, COLOR_GREY, "  [ERROR] Tidak ada Neon pada kendaraan ini");
						return 1;
					}
				}
                else if(PlayerVehicleID2[i] == vehicleid)
				{
					if(PlayerInfo[i][PlayerVehicle2ModNeon] != 0)
					{
                        PlayerInfo[i][PlayerVehicle2ModNeon] = 0;
                        DestroyObject(CarNeon[vehicleid]);
            		    DestroyObject(CarNeon2[vehicleid]);
            		    format(string, sizeof(string), " You has remove neon from %s Vehicle! [SLOT: 2]",giveplayer);
					    SendClientMessage(playerid, COLOR_YELLOW, string);
					    format(string, sizeof(string), " %s has remove neon from your Vehicle ! [SLOT: 2]",sendername);
					    SendClientMessage(i, COLOR_YELLOW, string);
					    PlayerInfo[playerid][pCompo] -= 3;
					    PlayerInfo[playerid][pMechSkill] += 10;
					    return 1;
					}
					else
					{
						SendClientMessage(i, COLOR_GREY, "  [ERROR] Tidak ada Neon pada kendaraan ini");
						return 1;
					}
				}
				else if(PlayerVehicleID3[i] == vehicleid)
				{
					if(PlayerInfo[i][PlayerVehicle3ModNeon] != 0)
					{
                        PlayerInfo[i][PlayerVehicle3ModNeon] = 0;
                        DestroyObject(CarNeon[vehicleid]);
            		    DestroyObject(CarNeon2[vehicleid]);
            		    format(string, sizeof(string), " You has remove neon from %s Vehicle! [SLOT: 3]",giveplayer);
					    SendClientMessage(playerid, COLOR_YELLOW, string);
					    format(string, sizeof(string), " %s has remove neon from your Vehicle ! [SLOT: 3]",sendername);
					    SendClientMessage(i, COLOR_YELLOW, string);
					    PlayerInfo[playerid][pCompo] -= 3;
					    PlayerInfo[playerid][pMechSkill] += 10;
					    return 1;
					}
					else
					{
						SendClientMessage(i, COLOR_GREY, "  [ERROR] Tidak ada Neon pada kendaraan ini");
						return 1;
					}
				}
				else if(PlayerVehicleID4[i] == vehicleid)
				{
					if(PlayerInfo[i][PlayerVehicle4ModNeon] != 0)
					{
                        PlayerInfo[i][PlayerVehicle4ModNeon] = 0;
                        DestroyObject(CarNeon[vehicleid]);
            		    DestroyObject(CarNeon2[vehicleid]);
            		    format(string, sizeof(string), " You has remove neon from %s Vehicle! [SLOT: 4]",giveplayer);
					    SendClientMessage(playerid, COLOR_YELLOW, string);
					    format(string, sizeof(string), " %s has remove neon from your Vehicle ! [SLOT: 4]",sendername);
					    SendClientMessage(i, COLOR_YELLOW, string);
					    PlayerInfo[playerid][pCompo] -= 3;
					    PlayerInfo[playerid][pMechSkill] += 10;
					    return 1;
					}
					else
					{
						SendClientMessage(i, COLOR_GREY, "  [ERROR] Tidak ada Neon pada kendaraan ini");
						return 1;
					}
				}
				else if(PlayerVehicleID5[i] == vehicleid)
				{
					if(PlayerInfo[i][PlayerVehicle5ModNeon] != 0)
					{
                        PlayerInfo[i][PlayerVehicle5ModNeon] = 0;
                        DestroyObject(CarNeon[vehicleid]);
            		    DestroyObject(CarNeon2[vehicleid]);
            		    format(string, sizeof(string), " You has remove neon from %s Vehicle! [SLOT: 5]",giveplayer);
					    SendClientMessage(playerid, COLOR_YELLOW, string);
					    format(string, sizeof(string), " %s has remove neon from your Vehicle ! [SLOT: 5]",sendername);
					    SendClientMessage(i, COLOR_YELLOW, string);
					    PlayerInfo[playerid][pCompo] -= 3;
					    PlayerInfo[playerid][pMechSkill] += 10;
					    return 1;
					}
					else
					{
						SendClientMessage(i, COLOR_GREY, "  [ERROR] Tidak ada Neon pada kendaraan ini");
						return 1;
					}
				}
			}
		}
		else
		{
			SendClientMessage(playerid,COLOR_YELLOW,"	You are not near any vehicle.");
			return 1;
        }
	}
	if(strcmp(cmd, "/locktire", true) == 0)
	{
		if(IsACop(playerid))
		{
			if(PlayerInfo[playerid][pInjured] != 0 || IsPlayerInAnyVehicle(playerid))
			{
				SendClientMessage(playerid, COLOR_GREY, "   You can't do that at this time !");
				return 1;
			}
			new vehicleid = GetClosestCar(playerid);
			new Float:V1X, Float:V1Y, Float:V1Z;
			GetVehiclePos(vehicleid, V1X, V1Y, V1Z);
			if(IsPlayerInRangeOfPoint(playerid, 6, V1X, V1Y, V1Z))
			{
                if(Tirelock[vehicleid] == 1)
				{
					SendClientMessage(playerid, COLOR_YELLOW, "[WARNING] This vehicle has been Tire Locked !");
					return 1;
				}
				new location[MAX_ZONE_NAME];
	    	    GetPlayer2DZone(playerid, location, MAX_ZONE_NAME);
				for(new i = 0; i < MAX_PLAYERS; i++)
				{
					if(PlayerVehicleID1[i] == vehicleid)
					{
						PlayerInfo[i][PlayerVehicle1Tire] = 1;
						Tirelock[PlayerVehicleID1[i]] = 1;
						format(string, sizeof(string), "%s\n{F3FF02}[Tire Locked]", PlayerInfo[i][PlayerVehicle1Plate]);
						Update3DTextLabelText(VehPlate[PlayerVehicleID1[i]], COLOR_CAR, string);
						SendClientMessage(playerid, COLOR_YELLOW, "[WARNING] You have placed Tirelock to this Vehicle");
						format(string, sizeof(string), "HQ: %s %s has placed a tirelock to a vehicles at %s", GetPlayerRank(playerid),RemoveUnderScore(playerid), location);
						SendRadioMessage(1, TEAM_BLUE_COLOR, string);
						SendRadioMessage(2, TEAM_BLUE_COLOR, string);
						SendRadioMessage(3, TEAM_BLUE_COLOR, string);
						SendRadioMessage(5, TEAM_BLUE_COLOR, string);
						format(string, sizeof(string), "* %s has placed a tirelock on this Vehicle", RPN(playerid));
                        ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
						ApplyAnimation(playerid, "BOMBER","BOM_Plant_Loop",4.0, 0, 0, 0, 0, 1); // Plant bomb
						return 1;
					}
					else if(PlayerVehicleID2[i] == vehicleid)
					{
						PlayerInfo[i][PlayerVehicle2Tire] = 1;
						Tirelock[PlayerVehicleID2[i]] = 1;
						format(string, sizeof(string), "%s\n{F3FF02}[Tire Locked]", PlayerInfo[i][PlayerVehicle2Plate]);
						Update3DTextLabelText(VehPlate[PlayerVehicleID2[i]], COLOR_CAR, string);
						SendClientMessage(playerid, COLOR_YELLOW, "[WARNING] You have placed Tirelock to this Vehicle");
						format(string, sizeof(string), "HQ: %s %s has placed a tirelock to a vehicles at %s", GetPlayerRank(playerid),RemoveUnderScore(playerid), location);
						SendRadioMessage(1, TEAM_BLUE_COLOR, string);
						SendRadioMessage(2, TEAM_BLUE_COLOR, string);
						SendRadioMessage(3, TEAM_BLUE_COLOR, string);
						SendRadioMessage(5, TEAM_BLUE_COLOR, string);
						format(string, sizeof(string), "* %s has placed a tirelock on this Vehicle", RPN(playerid));
                        ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
						ApplyAnimation(playerid, "BOMBER","BOM_Plant_Loop",4.0, 0, 0, 0, 0, 1); // Plant bomb
						return 1;
					}
					else if(PlayerVehicleID3[i] == vehicleid)
					{
						PlayerInfo[i][PlayerVehicle3Tire] = 1;
						Tirelock[PlayerVehicleID3[i]] = 1;
						format(string, sizeof(string), "%s\n{F3FF02}[Tire Locked]", PlayerInfo[i][PlayerVehicle3Plate]);
						Update3DTextLabelText(VehPlate[PlayerVehicleID3[i]], COLOR_CAR, string);
						SendClientMessage(playerid, COLOR_YELLOW, "[WARNING] You have placed Tirelock to this Vehicle");
						format(string, sizeof(string), "HQ: %s %s has placed a tirelock to a vehicles at %s", GetPlayerRank(playerid),RemoveUnderScore(playerid), location);
						SendRadioMessage(1, TEAM_BLUE_COLOR, string);
						SendRadioMessage(2, TEAM_BLUE_COLOR, string);
						SendRadioMessage(3, TEAM_BLUE_COLOR, string);
						SendRadioMessage(5, TEAM_BLUE_COLOR, string);
						format(string, sizeof(string), "* %s has placed a tirelock on this Vehicle", RPN(playerid));
                        ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
						ApplyAnimation(playerid, "BOMBER","BOM_Plant_Loop",4.0, 0, 0, 0, 0, 1); // Plant bomb
						return 1;
					}
					else if(PlayerVehicleID4[i] == vehicleid)
					{
						PlayerInfo[i][PlayerVehicle4Tire] = 1;
						Tirelock[PlayerVehicleID4[i]] = 1;
						format(string, sizeof(string), "%s\n{F3FF02}[Tire Locked]", PlayerInfo[i][PlayerVehicle4Plate]);
						Update3DTextLabelText(VehPlate[PlayerVehicleID4[i]], COLOR_CAR, string);
						SendClientMessage(playerid, COLOR_YELLOW, "[WARNING] You have placed Tirelock to this Vehicle");
						format(string, sizeof(string), "HQ: %s %s has placed a tirelock to a vehicles at %s", GetPlayerRank(playerid),RemoveUnderScore(playerid), location);
						SendRadioMessage(1, TEAM_BLUE_COLOR, string);
						SendRadioMessage(2, TEAM_BLUE_COLOR, string);
						SendRadioMessage(3, TEAM_BLUE_COLOR, string);
						SendRadioMessage(5, TEAM_BLUE_COLOR, string);
						format(string, sizeof(string), "* %s has placed a tirelock on this Vehicle", RPN(playerid));
                        ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
						ApplyAnimation(playerid, "BOMBER","BOM_Plant_Loop",4.0, 0, 0, 0, 0, 1); // Plant bomb
						return 1;
					}
					else if(PlayerVehicleID5[i] == vehicleid)
					{
						PlayerInfo[i][PlayerVehicle5Tire] = 1;
						Tirelock[PlayerVehicleID5[i]] = 1;
						format(string, sizeof(string), "%s\n{F3FF02}[Tire Locked]", PlayerInfo[i][PlayerVehicle5Plate]);
						Update3DTextLabelText(VehPlate[PlayerVehicleID5[i]], COLOR_CAR, string);
						SendClientMessage(playerid, COLOR_YELLOW, "[WARNING] You have placed Tirelock to this Vehicle");
						format(string, sizeof(string), "HQ: %s %s has placed a tirelock to a vehicles at %s", GetPlayerRank(playerid),RemoveUnderScore(playerid), location);
						SendRadioMessage(1, TEAM_BLUE_COLOR, string);
						SendRadioMessage(2, TEAM_BLUE_COLOR, string);
						SendRadioMessage(3, TEAM_BLUE_COLOR, string);
						SendRadioMessage(5, TEAM_BLUE_COLOR, string);
						format(string, sizeof(string), "* %s has placed a tirelock on this Vehicle", RPN(playerid));
                        ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
						ApplyAnimation(playerid, "BOMBER","BOM_Plant_Loop",4.0, 0, 0, 0, 0, 1); // Plant bomb
						return 1;
					}
				}
			}
			else
			{
				SendClientMessage(playerid,COLOR_YELLOW,"	You are not near any vehicle.");
				return 1;
	        }
		}
		else
		{
			SendClientMessage(playerid,COLOR_GREY,"	You are not a Cop!");
			return 1;
        }
	}
	if(strcmp(cmd, "/releasetire", true) == 0)
	{
		if(IsACop(playerid))
		{
			if(PlayerInfo[playerid][pInjured] != 0 || IsPlayerInAnyVehicle(playerid))
			{
				SendClientMessage(playerid, COLOR_GREY, "   You can't do that at this time !");
				return 1;
			}
			new vehicleid = GetClosestCar(playerid);
			new Float:V1X, Float:V1Y, Float:V1Z;
			GetVehiclePos(vehicleid, V1X, V1Y, V1Z);
			if(IsPlayerInRangeOfPoint(playerid, 6, V1X, V1Y, V1Z))
			{
                if(Tirelock[vehicleid] == 0)
				{
					SendClientMessage(playerid, COLOR_YELLOW, "[WARNING] This vehicle are not Tire Locked !");
					return 1;
				}
				new location[MAX_ZONE_NAME];
	    	    GetPlayer2DZone(playerid, location, MAX_ZONE_NAME);
				for(new i = 0; i < MAX_PLAYERS; i++)
				{
					if(PlayerVehicleID1[i] == vehicleid)
					{
						PlayerInfo[i][PlayerVehicle1Tire] = 0;
						Tirelock[PlayerVehicleID1[i]] = 0;
						format(string, sizeof(string), "%s", PlayerInfo[i][PlayerVehicle1Plate]);
						Update3DTextLabelText(VehPlate[PlayerVehicleID1[i]], COLOR_CAR, string);
						SendClientMessage(playerid, COLOR_YELLOW, "[WARNING] You have unlocked a Tirelock from this Vehicle");
						format(string, sizeof(string), "HQ: %s %s has unlocked a tirelock from a vehicles at %s", GetPlayerRank(playerid),RemoveUnderScore(playerid), location);
						SendRadioMessage(1, TEAM_BLUE_COLOR, string);
						SendRadioMessage(2, TEAM_BLUE_COLOR, string);
						SendRadioMessage(3, TEAM_BLUE_COLOR, string);
						SendRadioMessage(5, TEAM_BLUE_COLOR, string);
						format(string, sizeof(string), "* %s has unlocked a tirelock from this Vehicle", RPN(playerid));
                        ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
						ApplyAnimation(playerid, "BOMBER","BOM_Plant_Loop",4.0, 0, 0, 0, 0, 1); // Plant bomb
						return 1;
					}
					else if(PlayerVehicleID2[i] == vehicleid)
					{
						PlayerInfo[i][PlayerVehicle2Tire] = 0;
						Tirelock[PlayerVehicleID2[i]] = 0;
						format(string, sizeof(string), "%s", PlayerInfo[i][PlayerVehicle2Plate]);
						Update3DTextLabelText(VehPlate[PlayerVehicleID2[i]], COLOR_CAR, string);
						SendClientMessage(playerid, COLOR_YELLOW, "[WARNING] You have unlocked a Tirelock from this Vehicle");
						format(string, sizeof(string), "HQ: %s %s has unlocked a tirelock from a vehicles at %s", GetPlayerRank(playerid),RemoveUnderScore(playerid), location);
						SendRadioMessage(1, TEAM_BLUE_COLOR, string);
						SendRadioMessage(2, TEAM_BLUE_COLOR, string);
						SendRadioMessage(3, TEAM_BLUE_COLOR, string);
						SendRadioMessage(5, TEAM_BLUE_COLOR, string);
						format(string, sizeof(string), "* %s has unlocked a tirelock from this Vehicle", RPN(playerid));
                        ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
						ApplyAnimation(playerid, "BOMBER","BOM_Plant_Loop",4.0, 0, 0, 0, 0, 1); // Plant bomb
						return 1;
					}
					else if(PlayerVehicleID3[i] == vehicleid)
					{
						PlayerInfo[i][PlayerVehicle3Tire] = 0;
						Tirelock[PlayerVehicleID3[i]] = 0;
						format(string, sizeof(string), "%s", PlayerInfo[i][PlayerVehicle3Plate]);
						Update3DTextLabelText(VehPlate[PlayerVehicleID3[i]], COLOR_CAR, string);
						SendClientMessage(playerid, COLOR_YELLOW, "[WARNING] You have unlocked a Tirelock from this Vehicle");
						format(string, sizeof(string), "HQ: %s %s has unlocked a tirelock from a vehicles at %s", GetPlayerRank(playerid),RemoveUnderScore(playerid), location);
						SendRadioMessage(1, TEAM_BLUE_COLOR, string);
						SendRadioMessage(2, TEAM_BLUE_COLOR, string);
						SendRadioMessage(3, TEAM_BLUE_COLOR, string);
						SendRadioMessage(5, TEAM_BLUE_COLOR, string);
						format(string, sizeof(string), "* %s has unlocked a tirelock from this Vehicle", RPN(playerid));
                        ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
						ApplyAnimation(playerid, "BOMBER","BOM_Plant_Loop",4.0, 0, 0, 0, 0, 1); // Plant bomb
						return 1;
					}
					else if(PlayerVehicleID4[i] == vehicleid)
					{
						PlayerInfo[i][PlayerVehicle4Tire] = 0;
						Tirelock[PlayerVehicleID4[i]] = 0;
						format(string, sizeof(string), "%s", PlayerInfo[i][PlayerVehicle4Plate]);
						Update3DTextLabelText(VehPlate[PlayerVehicleID4[i]], COLOR_CAR, string);
						SendClientMessage(playerid, COLOR_YELLOW, "[WARNING] You have unlocked a Tirelock from this Vehicle");
						format(string, sizeof(string), "HQ: %s %s has unlocked a tirelock from a vehicles at %s", GetPlayerRank(playerid),RemoveUnderScore(playerid), location);
						SendRadioMessage(1, TEAM_BLUE_COLOR, string);
						SendRadioMessage(2, TEAM_BLUE_COLOR, string);
						SendRadioMessage(3, TEAM_BLUE_COLOR, string);
						SendRadioMessage(5, TEAM_BLUE_COLOR, string);
						format(string, sizeof(string), "* %s has unlocked a tirelock from this Vehicle", RPN(playerid));
                        ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
						ApplyAnimation(playerid, "BOMBER","BOM_Plant_Loop",4.0, 0, 0, 0, 0, 1); // Plant bomb
						return 1;
					}
					else if(PlayerVehicleID5[i] == vehicleid)
					{
						PlayerInfo[i][PlayerVehicle5Tire] = 0;
						Tirelock[PlayerVehicleID5[i]] = 0;
						format(string, sizeof(string), "%s", PlayerInfo[i][PlayerVehicle5Plate]);
						Update3DTextLabelText(VehPlate[PlayerVehicleID5[i]], COLOR_CAR, string);
						SendClientMessage(playerid, COLOR_YELLOW, "[WARNING] You have unlocked a Tirelock from this Vehicle");
						format(string, sizeof(string), "HQ: %s %s has unlocked a tirelock from a vehicles at %s", GetPlayerRank(playerid),RemoveUnderScore(playerid), location);
						SendRadioMessage(1, TEAM_BLUE_COLOR, string);
						SendRadioMessage(2, TEAM_BLUE_COLOR, string);
						SendRadioMessage(3, TEAM_BLUE_COLOR, string);
						SendRadioMessage(5, TEAM_BLUE_COLOR, string);
						format(string, sizeof(string), "* %s has unlocked a tirelock from this Vehicle", RPN(playerid));
                        ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
						ApplyAnimation(playerid, "BOMBER","BOM_Plant_Loop",4.0, 0, 0, 0, 0, 1); // Plant bomb
						return 1;
					}
				}
			}
			else
			{
				SendClientMessage(playerid,COLOR_YELLOW,"	You are not near any vehicle.");
				return 1;
	        }
		}
		else
		{
			SendClientMessage(playerid,COLOR_GREY,"	You are not a Cop!");
			return 1;
        }
	}
 	if(strcmp(cmd, "/addneon", true) == 0)
	{
	 	if(!IsPlayerInRangeOfPoint(playerid, 28.0,1607.6606,-2164.7157,13.5619)) return SendClientMessage(playerid, COLOR_GREY, "[MECHANIC] You are Not at the Car Colors Shop");
		if(PlayerInfo[playerid][pJob] != 7) return SendClientMessage(playerid, COLOR_GREY, "[MECHANIC] You are not a Mechanic");
		if(PlayerInfo[playerid][pCompo] < 5) return SendClientMessage(playerid, GREY, "[MECHANIC] You need 5 Component for Added Neon on Vehicle!");
		if(PlayerInfo[playerid][pMechSkill] < 100) return SendClientMessage(playerid, GREY, "[MECHANIC] You need to be Mechanic Level 3 to Adding/Remove Neon from Vehicles (/skill) !");
		if(JobDuty[playerid] == 0) return SendClientMessage(playerid, COLOR_RED, "[MECHANIC] You are not a Mechanic Duty!");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_WHITE, "USAGE: /addneon [neonid]");
			SendClientMessage(playerid, COLOR_WHITE, "NEONID: 1. Blue/2. Red/3. Green/4. White/5. Pink/6. Yellow");
			return 1;
		}
		new neonid = strvalEx(tmp);
		if(neonid < 0 || neonid > 6)
		{
			SendClientMessage(playerid, COLOR_GREY, "   Invalid Neon ID !");
			return 1;
		}
		if(PlayerInfo[playerid][pInjured] != 0 || IsPlayerInAnyVehicle(playerid))
		{
			SendClientMessage(playerid, COLOR_GREY, "   You can't do that at this time !");
			return 1;
		}
		new vehicleid = GetClosestCar(playerid);
		if(IsAPlane(vehicleid) || IsAHelicopter(vehicleid) || IsABike(vehicleid) || IsATrain(vehicleid) || IsABoat(vehicleid))
		{
			SendClientMessage(playerid,COLOR_GREY,"   Invalid Vehicle (Bike/Plane/Helicopter/Boat) !");
			return 1;
		}
		if(HoodOpen[vehicleid] == 0 && IsACar(vehicleid))
		{
			SendClientMessage(playerid,COLOR_GREY,"   Open the Vehicle Hood first !");
			return 1;
		}
		new Float:V1X, Float:V1Y, Float:V1Z;
		GetVehiclePos(vehicleid, V1X, V1Y, V1Z);
		if(IsPlayerInRangeOfPoint(playerid, 6, V1X, V1Y, V1Z))
		{
			for(new i = 0; i < MAX_PLAYERS; i++)
			{
                GetPlayerName(playerid, sendername, sizeof(sendername));
	            GetPlayerName(i, giveplayer, sizeof(giveplayer));
		        if(PlayerVehicleID1[i] == vehicleid)
				{
				    if(!IsPlayerInAnyVehicle(playerid))
					{
						if(PlayerInfo[i][PlayerVehicle1ModNeon] == 0)
						{
							if(neonid == 1)
							{
	            				PlayerInfo[i][PlayerVehicle1ModNeon] = 1;
	            				CarNeon[vehicleid] = CreateObject(18648,0,0,0,0,0,0);
	            				CarNeon2[vehicleid] = CreateObject(18648,0,0,0,0,0,0);
	            		    	format(string, sizeof(string), " You have place %s Vehicle a Blue neon ! [SLOT: 1]",giveplayer);
						    	SendClientMessage(playerid, COLOR_YELLOW, string);
						    	format(string, sizeof(string), " %s has place a Blue neon to your Vehicle ! [SLOT: 1]",sendername);
						    	SendClientMessage(i, COLOR_YELLOW, string);
						    	AttachObjectToVehicle(CarNeon[vehicleid], vehicleid, -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
							    AttachObjectToVehicle(CarNeon2[vehicleid], vehicleid, 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
							    PlayerInfo[playerid][pCompo] -= 5;
							    PlayerInfo[playerid][pMechSkill] += 10;
							    return 1;
							}
							else if(neonid == 2)
							{
	            				PlayerInfo[i][PlayerVehicle1ModNeon] = 2;
	            				CarNeon[vehicleid] = CreateObject(18647,0,0,0,0,0,0);
	            				CarNeon2[vehicleid] = CreateObject(18647,0,0,0,0,0,0);
	            		    	format(string, sizeof(string), " You have place %s Vehicle a Red neon ! [SLOT: 1]",giveplayer);
						    	SendClientMessage(playerid, COLOR_YELLOW, string);
						    	format(string, sizeof(string), " %s has place a Red neon to your Vehicle ! [SLOT: 1]",sendername);
						    	SendClientMessage(i, COLOR_YELLOW, string);
 					    	    AttachObjectToVehicle(CarNeon[vehicleid], vehicleid, -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
							    AttachObjectToVehicle(CarNeon2[vehicleid], vehicleid, 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
							    PlayerInfo[playerid][pCompo] -= 5;
							    PlayerInfo[playerid][pMechSkill] += 10;
							    return 1;
							}
							else if(neonid == 3)
							{
	            				PlayerInfo[i][PlayerVehicle1ModNeon] = 3;
	            				CarNeon[vehicleid] = CreateObject(18649,0,0,0,0,0,0);
	            				CarNeon2[vehicleid] = CreateObject(18649,0,0,0,0,0,0);
	            		    	format(string, sizeof(string), " You have place %s Vehicle a Green neon ! [SLOT: 1]",giveplayer);
						    	SendClientMessage(playerid, COLOR_YELLOW, string);
						    	format(string, sizeof(string), " %s has place a Green neon to your Vehicle ! [SLOT: 1]",sendername);
						    	SendClientMessage(i, COLOR_YELLOW, string);
						    	AttachObjectToVehicle(CarNeon[vehicleid], vehicleid, -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
							    AttachObjectToVehicle(CarNeon2[vehicleid], vehicleid, 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
							    PlayerInfo[playerid][pCompo] -= 5;
							    PlayerInfo[playerid][pMechSkill] += 10;
							    return 1;
							}
							else if(neonid == 4)
							{
	            				PlayerInfo[i][PlayerVehicle1ModNeon] = 4;
	                            CarNeon[vehicleid] = CreateObject(18652,0,0,0,0,0,0);
	                            CarNeon2[vehicleid] = CreateObject(18652,0,0,0,0,0,0);
	            		    	format(string, sizeof(string), " You have place %s Vehicle a White neon ! [SLOT: 1]",giveplayer);
						    	SendClientMessage(playerid, COLOR_YELLOW, string);
						    	format(string, sizeof(string), " %s has place a White neon to your Vehicle ! [SLOT: 1]",sendername);
						    	SendClientMessage(i, COLOR_YELLOW, string);
   			    	            AttachObjectToVehicle(CarNeon[vehicleid], vehicleid, -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
							    AttachObjectToVehicle(CarNeon2[vehicleid], vehicleid, 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
							    PlayerInfo[playerid][pCompo] -= 5;
							    PlayerInfo[playerid][pMechSkill] += 10;
							    return 1;
							}
							else if(neonid == 5)
							{
	            				PlayerInfo[i][PlayerVehicle1ModNeon] = 5;
	            				CarNeon[vehicleid] = CreateObject(18651,0,0,0,0,0,0);
	            				CarNeon2[vehicleid] = CreateObject(18651,0,0,0,0,0,0);
	            		    	format(string, sizeof(string), " You have place %s Vehicle a Pink neon ! [SLOT: 1]",giveplayer);
						    	SendClientMessage(playerid, COLOR_YELLOW, string);
						    	format(string, sizeof(string), " %s has place a Pink neon to your Vehicle ! [SLOT: 1]",sendername);
						    	SendClientMessage(i, COLOR_YELLOW, string);
  				    	        AttachObjectToVehicle(CarNeon[vehicleid], vehicleid, -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
							    AttachObjectToVehicle(CarNeon2[vehicleid], vehicleid, 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
							    PlayerInfo[playerid][pCompo] -= 5;
							    PlayerInfo[playerid][pMechSkill] += 10;
							    return 1;
							}
							else if(neonid == 6)
							{
	            				PlayerInfo[i][PlayerVehicle1ModNeon] = 6;
	            				CarNeon[vehicleid] = CreateObject(18650,0,0,0,0,0,0);
	            				CarNeon2[vehicleid] = CreateObject(18650,0,0,0,0,0,0);
	            		    	format(string, sizeof(string), " You have place %s Vehicle a Yellow neon ! [SLOT: 1]",giveplayer);
						    	SendClientMessage(playerid, COLOR_YELLOW, string);
						    	format(string, sizeof(string), " %s has place a Yellow neon to your Vehicle ! [SLOT: 1]",sendername);
						    	SendClientMessage(i, COLOR_YELLOW, string);
						    	AttachObjectToVehicle(CarNeon[vehicleid], vehicleid, -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
							    AttachObjectToVehicle(CarNeon2[vehicleid], vehicleid, 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
							    PlayerInfo[playerid][pCompo] -= 5;
							    PlayerInfo[playerid][pMechSkill] += 10;
							    return 1;
							}
						}
						else
						{
							SendClientMessage(playerid, COLOR_GREY, "  [ERROR] Masih ada Neon pada kendaraan ini");
						    return 1;
						}
					}
				}
				else if(PlayerVehicleID2[i] == vehicleid)
				{
				    if(!IsPlayerInAnyVehicle(playerid))
					{
						if(PlayerInfo[i][PlayerVehicle2ModNeon] == 0)
						{
							if(neonid == 1)
							{
	            				PlayerInfo[i][PlayerVehicle2ModNeon] = 1;
	            				CarNeon[vehicleid] = CreateObject(18648,0,0,0,0,0,0);
	            				CarNeon2[vehicleid] = CreateObject(18648,0,0,0,0,0,0);
	            		    	format(string, sizeof(string), " You have place %s Vehicle a Blue neon ! [SLOT: 2]",giveplayer);
						    	SendClientMessage(playerid, COLOR_YELLOW, string);
						    	format(string, sizeof(string), " %s has place a Blue neon to your Vehicle ! [SLOT: 2]",sendername);
						    	SendClientMessage(i, COLOR_YELLOW, string);
						    	AttachObjectToVehicle(CarNeon[vehicleid], vehicleid, -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
							    AttachObjectToVehicle(CarNeon2[vehicleid], vehicleid, 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
							    PlayerInfo[playerid][pCompo] -= 5;
							    PlayerInfo[playerid][pMechSkill] += 10;
							    return 1;
							}
							else if(neonid == 2)
							{
	            				PlayerInfo[i][PlayerVehicle2ModNeon] = 2;
	            				CarNeon[vehicleid] = CreateObject(18647,0,0,0,0,0,0);
	            				CarNeon2[vehicleid] = CreateObject(18647,0,0,0,0,0,0);
	            		    	format(string, sizeof(string), " You have place %s Vehicle a Red neon ! [SLOT: 2]",giveplayer);
						    	SendClientMessage(playerid, COLOR_YELLOW, string);
						    	format(string, sizeof(string), " %s has place a Red neon to your Vehicle ! [SLOT: 2]",sendername);
						    	SendClientMessage(i, COLOR_YELLOW, string);
						    	AttachObjectToVehicle(CarNeon[vehicleid], vehicleid, -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
							    AttachObjectToVehicle(CarNeon2[vehicleid], vehicleid, 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
							    PlayerInfo[playerid][pCompo] -= 5;
							    PlayerInfo[playerid][pMechSkill] += 10;
							    return 1;
							}
							else if(neonid == 3)
							{
	            				PlayerInfo[i][PlayerVehicle2ModNeon] = 3;
	            				CarNeon[vehicleid] = CreateObject(18649,0,0,0,0,0,0);
	            				CarNeon2[vehicleid] = CreateObject(18649,0,0,0,0,0,0);
	            		    	format(string, sizeof(string), " You have place %s Vehicle a Green neon ! [SLOT: 2]",giveplayer);
						    	SendClientMessage(playerid, COLOR_YELLOW, string);
						    	format(string, sizeof(string), " %s has place a Green neon to your Vehicle ! [SLOT: 2]",sendername);
						    	SendClientMessage(i, COLOR_YELLOW, string);
						    	AttachObjectToVehicle(CarNeon[vehicleid], vehicleid, -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
							    AttachObjectToVehicle(CarNeon2[vehicleid], vehicleid, 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
							    PlayerInfo[playerid][pCompo] -= 5;
							    PlayerInfo[playerid][pMechSkill] += 10;
							    return 1;
							}
							else if(neonid == 4)
							{
	            				PlayerInfo[i][PlayerVehicle2ModNeon] = 4;
	            				CarNeon[vehicleid] = CreateObject(18652,0,0,0,0,0,0);
	            				CarNeon2[vehicleid] = CreateObject(18652,0,0,0,0,0,0);
	            		    	format(string, sizeof(string), " You have place %s Vehicle a White neon ! [SLOT: 2]",giveplayer);
						    	SendClientMessage(playerid, COLOR_YELLOW, string);
						    	format(string, sizeof(string), " %s has place a White neon to your Vehicle ! [SLOT: 2]",sendername);
						    	SendClientMessage(i, COLOR_YELLOW, string);
						    	AttachObjectToVehicle(CarNeon[vehicleid], vehicleid, -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
							    AttachObjectToVehicle(CarNeon2[vehicleid], vehicleid, 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
							    PlayerInfo[playerid][pCompo] -= 5;
							    PlayerInfo[playerid][pMechSkill] += 10;
							    return 1;
							}
							else if(neonid == 5)
							{
	            				PlayerInfo[i][PlayerVehicle2ModNeon] = 5;
	            				CarNeon[vehicleid] = CreateObject(18651,0,0,0,0,0,0);
	            				CarNeon2[vehicleid] = CreateObject(18651,0,0,0,0,0,0);
	            		    	format(string, sizeof(string), " You have place %s Vehicle a Pink neon ! [SLOT: 2]",giveplayer);
						    	SendClientMessage(playerid, COLOR_YELLOW, string);
						    	format(string, sizeof(string), " %s has place a Pink neon to your Vehicle ! [SLOT: 2]",sendername);
						    	SendClientMessage(i, COLOR_YELLOW, string);
						    	AttachObjectToVehicle(CarNeon[vehicleid], vehicleid, -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
							    AttachObjectToVehicle(CarNeon2[vehicleid], vehicleid, 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
							    PlayerInfo[playerid][pCompo] -= 5;
							    PlayerInfo[playerid][pMechSkill] += 10;
							    return 1;
							}
							else if(neonid == 6)
							{
	            				PlayerInfo[i][PlayerVehicle2ModNeon] = 6;
	            				CarNeon[vehicleid] = CreateObject(18650,0,0,0,0,0,0);
	            				CarNeon2[vehicleid] = CreateObject(18650,0,0,0,0,0,0);
	            		    	format(string, sizeof(string), " You have place %s Vehicle a Yellow neon ! [SLOT: 2]",giveplayer);
						    	SendClientMessage(playerid, COLOR_YELLOW, string);
						    	format(string, sizeof(string), " %s has place a Yellow neon to your Vehicle ! [SLOT: 2]",sendername);
						    	SendClientMessage(i, COLOR_YELLOW, string);
						    	AttachObjectToVehicle(CarNeon[vehicleid], vehicleid, -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
							    AttachObjectToVehicle(CarNeon2[vehicleid], vehicleid, 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
							    PlayerInfo[playerid][pCompo] -= 5;
							    PlayerInfo[playerid][pMechSkill] += 10;
							    return 1;
							}
						}
						else
						{
							SendClientMessage(playerid, COLOR_GREY, "  [ERROR] Masih ada Neon pada kendaraan ini");
						    return 1;
						}
					}
				}
				else if(PlayerVehicleID3[i] == vehicleid)
				{
				    if(!IsPlayerInAnyVehicle(playerid))
					{
					    if(PlayerInfo[i][PlayerVehicle3ModNeon] == 0)
						{
						    if(neonid == 1)
							{
	            				PlayerInfo[i][PlayerVehicle3ModNeon] = 1;
	            				CarNeon[vehicleid] = CreateObject(18648,0,0,0,0,0,0);
	            				CarNeon2[vehicleid] = CreateObject(18648,0,0,0,0,0,0);
	            		    	format(string, sizeof(string), " You have place %s Vehicle a Blue neon ! [SLOT: 3]",giveplayer);
						    	SendClientMessage(playerid, COLOR_YELLOW, string);
						    	format(string, sizeof(string), " %s has place a Blue neon to your Vehicle ! [SLOT: 3]",sendername);
						    	SendClientMessage(i, COLOR_YELLOW, string);
						    	AttachObjectToVehicle(CarNeon[vehicleid], vehicleid, -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
							    AttachObjectToVehicle(CarNeon2[vehicleid], vehicleid, 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
							    PlayerInfo[playerid][pCompo] -= 5;
							    PlayerInfo[playerid][pMechSkill] += 10;
							    return 1;
							}
							else if(neonid == 2)
							{
	            				PlayerInfo[i][PlayerVehicle3ModNeon] = 2;
	            				CarNeon[vehicleid] = CreateObject(18647,0,0,0,0,0,0);
	            				CarNeon2[vehicleid] = CreateObject(18647,0,0,0,0,0,0);
	            		    	format(string, sizeof(string), " You have place %s Vehicle a Red neon ! [SLOT: 3]",giveplayer);
						    	SendClientMessage(playerid, COLOR_YELLOW, string);
						    	format(string, sizeof(string), " %s has place a Red neon to your Vehicle ! [SLOT: 3]",sendername);
						    	SendClientMessage(i, COLOR_YELLOW, string);
						    	AttachObjectToVehicle(CarNeon[vehicleid], vehicleid, -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
							    AttachObjectToVehicle(CarNeon2[vehicleid], vehicleid, 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
							    PlayerInfo[playerid][pCompo] -= 5;
							    PlayerInfo[playerid][pMechSkill] += 10;
							    return 1;
							}
							else if(neonid == 3)
							{
	            				PlayerInfo[i][PlayerVehicle3ModNeon] = 3;
	            				CarNeon[vehicleid] = CreateObject(18649,0,0,0,0,0,0);
	            				CarNeon2[vehicleid] = CreateObject(18649,0,0,0,0,0,0);
	            		    	format(string, sizeof(string), " You have place %s Vehicle a Green neon ! [SLOT: 3]",giveplayer);
						    	SendClientMessage(playerid, COLOR_YELLOW, string);
						    	format(string, sizeof(string), " %s has place a Green neon to your Vehicle ! [SLOT: 3]",sendername);
						    	SendClientMessage(i, COLOR_YELLOW, string);
						    	AttachObjectToVehicle(CarNeon[vehicleid], vehicleid, -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
							    AttachObjectToVehicle(CarNeon2[vehicleid], vehicleid, 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
							    PlayerInfo[playerid][pCompo] -= 5;
							    PlayerInfo[playerid][pMechSkill] += 10;
							    return 1;
							}
							else if(neonid == 4)
							{
	            				PlayerInfo[i][PlayerVehicle3ModNeon] = 4;
	            				CarNeon[vehicleid] = CreateObject(18652,0,0,0,0,0,0);
	            				CarNeon2[vehicleid] = CreateObject(18652,0,0,0,0,0,0);
	            		    	format(string, sizeof(string), " You have place %s Vehicle a White neon ! [SLOT: 3]",giveplayer);
						    	SendClientMessage(playerid, COLOR_YELLOW, string);
						    	format(string, sizeof(string), " %s has place a White neon to your Vehicle ! [SLOT: 3]",sendername);
						    	SendClientMessage(i, COLOR_YELLOW, string);
						    	AttachObjectToVehicle(CarNeon[vehicleid], vehicleid, -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
							    AttachObjectToVehicle(CarNeon2[vehicleid], vehicleid, 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
							    PlayerInfo[playerid][pCompo] -= 5;
							    PlayerInfo[playerid][pMechSkill] += 10;
							    return 1;
							}
							else if(neonid == 5)
							{
	            				PlayerInfo[i][PlayerVehicle3ModNeon] = 5;
	            				CarNeon[vehicleid] = CreateObject(18651,0,0,0,0,0,0);
	            				CarNeon2[vehicleid] = CreateObject(18651,0,0,0,0,0,0);
	            		    	format(string, sizeof(string), " You have place %s Vehicle a Pink neon ! [SLOT: 3]",giveplayer);
						    	SendClientMessage(playerid, COLOR_YELLOW, string);
						    	format(string, sizeof(string), " %s has place a Pink neon to your Vehicle ! [SLOT: 3]",sendername);
						    	SendClientMessage(i, COLOR_YELLOW, string);
						    	AttachObjectToVehicle(CarNeon[vehicleid], vehicleid, -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
							    AttachObjectToVehicle(CarNeon2[vehicleid], vehicleid, 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
							    PlayerInfo[playerid][pCompo] -= 5;
							    PlayerInfo[playerid][pMechSkill] += 10;
							    return 1;
							}
							else if(neonid == 6)
							{
	            				PlayerInfo[i][PlayerVehicle3ModNeon] = 6;
	            				CarNeon[vehicleid] = CreateObject(18650,0,0,0,0,0,0);
	            				CarNeon2[vehicleid] = CreateObject(18650,0,0,0,0,0,0);
	            		    	format(string, sizeof(string), " You have place %s Vehicle a Yellow neon ! [SLOT: 3]",giveplayer);
						    	SendClientMessage(playerid, COLOR_YELLOW, string);
						    	format(string, sizeof(string), " %s has place a Yellow neon to your Vehicle ! [SLOT: 3]",sendername);
						    	SendClientMessage(i, COLOR_YELLOW, string);
						    	AttachObjectToVehicle(CarNeon[vehicleid], vehicleid, -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
							    AttachObjectToVehicle(CarNeon2[vehicleid], vehicleid, 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
							    PlayerInfo[playerid][pCompo] -= 5;
							    PlayerInfo[playerid][pMechSkill] += 10;
							    return 1;
							}
						}
						else
						{
							SendClientMessage(playerid, COLOR_GREY, "  [ERROR] Masih ada Neon pada kendaraan ini");
						    return 1;
						}
					}
				}
				else if(PlayerVehicleID4[i] == vehicleid)
				{
				    if(!IsPlayerInAnyVehicle(playerid))
					{
						if(PlayerInfo[i][PlayerVehicle4ModNeon] == 0)
						{
							if(neonid == 1)
							{
	            				PlayerInfo[i][PlayerVehicle4ModNeon] = 1;
	            				CarNeon[vehicleid] = CreateObject(18648,0,0,0,0,0,0);
	            				CarNeon2[vehicleid] = CreateObject(18648,0,0,0,0,0,0);
	            		    	format(string, sizeof(string), " You have place %s Vehicle a Blue neon ! [SLOT: 4]",giveplayer);
						    	SendClientMessage(playerid, COLOR_YELLOW, string);
						    	format(string, sizeof(string), " %s has place a Blue neon to your Vehicle ! [SLOT: 4]",sendername);
						    	SendClientMessage(i, COLOR_YELLOW, string);
						    	AttachObjectToVehicle(CarNeon[vehicleid], vehicleid, -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
							    AttachObjectToVehicle(CarNeon2[vehicleid], vehicleid, 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
							    PlayerInfo[playerid][pCompo] -= 5;
							    PlayerInfo[playerid][pMechSkill] += 10;
							    return 1;
							}
							else if(neonid == 2)
							{
	            				PlayerInfo[i][PlayerVehicle4ModNeon] = 2;
	            				CarNeon[vehicleid] = CreateObject(18647,0,0,0,0,0,0);
	            				CarNeon2[vehicleid] = CreateObject(18647,0,0,0,0,0,0);
	            		    	format(string, sizeof(string), " You have place %s Vehicle a Red neon ! [SLOT: 4]",giveplayer);
						    	SendClientMessage(playerid, COLOR_YELLOW, string);
						    	format(string, sizeof(string), " %s has place a Red neon to your Vehicle ! [SLOT: 4]",sendername);
						    	SendClientMessage(i, COLOR_YELLOW, string);
						    	AttachObjectToVehicle(CarNeon[vehicleid], vehicleid, -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
							    AttachObjectToVehicle(CarNeon2[vehicleid], vehicleid, 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
							    PlayerInfo[playerid][pCompo] -= 5;
							    PlayerInfo[playerid][pMechSkill] += 10;
							    return 1;
							}
							else if(neonid == 3)
							{
	            				PlayerInfo[i][PlayerVehicle4ModNeon] = 3;
	            				CarNeon[vehicleid] = CreateObject(18649,0,0,0,0,0,0);
	            				CarNeon2[vehicleid] = CreateObject(18649,0,0,0,0,0,0);
	            		    	format(string, sizeof(string), " You have place %s Vehicle a Green neon ! [SLOT: 4]",giveplayer);
						    	SendClientMessage(playerid, COLOR_YELLOW, string);
						    	format(string, sizeof(string), " %s has place a Green neon to your Vehicle ! [SLOT: 4]",sendername);
						    	SendClientMessage(i, COLOR_YELLOW, string);
						    	AttachObjectToVehicle(CarNeon[vehicleid], vehicleid, -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
							    AttachObjectToVehicle(CarNeon2[vehicleid], vehicleid, 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
							    PlayerInfo[playerid][pCompo] -= 5;
							    PlayerInfo[playerid][pMechSkill] += 10;
							    return 1;
							}
							else if(neonid == 4)
							{
	            				PlayerInfo[i][PlayerVehicle4ModNeon] = 4;
	                            CarNeon[vehicleid] = CreateObject(18652,0,0,0,0,0,0);
	                            CarNeon2[vehicleid] = CreateObject(18652,0,0,0,0,0,0);
	            		    	format(string, sizeof(string), " You have place %s Vehicle a White neon ! [SLOT: 4]",giveplayer);
						    	SendClientMessage(playerid, COLOR_YELLOW, string);
						    	format(string, sizeof(string), " %s has place a White neon to your Vehicle ! [SLOT: 4]",sendername);
						    	SendClientMessage(i, COLOR_YELLOW, string);
						    	AttachObjectToVehicle(CarNeon[vehicleid], vehicleid, -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
							    AttachObjectToVehicle(CarNeon2[vehicleid], vehicleid, 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
							    PlayerInfo[playerid][pCompo] -= 5;
							    PlayerInfo[playerid][pMechSkill] += 10;
							    return 1;
							}
							else if(neonid == 5)
							{
	            				PlayerInfo[i][PlayerVehicle4ModNeon] = 5;
	            				CarNeon[vehicleid] = CreateObject(18651,0,0,0,0,0,0);
	            				CarNeon2[vehicleid] = CreateObject(18651,0,0,0,0,0,0);
	            		    	format(string, sizeof(string), " You have place %s Vehicle a Pink neon ! [SLOT: 4]",giveplayer);
						    	SendClientMessage(playerid, COLOR_YELLOW, string);
						    	format(string, sizeof(string), " %s has place a Pink neon to your Vehicle ! [SLOT: 4]",sendername);
						    	SendClientMessage(i, COLOR_YELLOW, string);
						    	AttachObjectToVehicle(CarNeon[vehicleid], vehicleid, -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
							    AttachObjectToVehicle(CarNeon2[vehicleid], vehicleid, 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
							    PlayerInfo[playerid][pCompo] -= 5;
							    PlayerInfo[playerid][pMechSkill] += 10;
							    return 1;
							}
							else if(neonid == 6)
							{
	            				PlayerInfo[i][PlayerVehicle4ModNeon] = 6;
	            				CarNeon[vehicleid] = CreateObject(18650,0,0,0,0,0,0);
	            				CarNeon2[vehicleid] = CreateObject(18650,0,0,0,0,0,0);
	            		    	format(string, sizeof(string), " You have place %s Vehicle a Yellow neon ! [SLOT: 4]",giveplayer);
						    	SendClientMessage(playerid, COLOR_YELLOW, string);
						    	format(string, sizeof(string), " %s has place a Yellow neon to your Vehicle ! [SLOT: 4]",sendername);
						    	SendClientMessage(i, COLOR_YELLOW, string);
						    	AttachObjectToVehicle(CarNeon[vehicleid], vehicleid, -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
							    AttachObjectToVehicle(CarNeon2[vehicleid], vehicleid, 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
							    PlayerInfo[playerid][pCompo] -= 5;
							    PlayerInfo[playerid][pMechSkill] += 10;
							    return 1;
							}
						}
						else
						{
							SendClientMessage(playerid, COLOR_GREY, "  [ERROR] Masih ada Neon pada kendaraan ini");
						    return 1;
						}
					}
				}
				else if(PlayerVehicleID5[i] == vehicleid)
				{
				    if(!IsPlayerInAnyVehicle(playerid))
					{
					    if(PlayerInfo[i][PlayerVehicle5ModNeon] == 0)
						{
						    if(neonid == 1)
							{
	            				PlayerInfo[i][PlayerVehicle5ModNeon] = 1;
	            				CarNeon[vehicleid] = CreateObject(18648,0,0,0,0,0,0);
	            				CarNeon2[vehicleid] = CreateObject(18648,0,0,0,0,0,0);
	            		    	format(string, sizeof(string), " You have place %s Vehicle a Blue neon ! [SLOT: 5]",giveplayer);
						    	SendClientMessage(playerid, COLOR_YELLOW, string);
						    	format(string, sizeof(string), " %s has place a Blue neon to your Vehicle ! [SLOT: 5]",sendername);
						    	SendClientMessage(i, COLOR_YELLOW, string);
						    	AttachObjectToVehicle(CarNeon[vehicleid], vehicleid, -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
							    AttachObjectToVehicle(CarNeon2[vehicleid], vehicleid, 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
							    PlayerInfo[playerid][pCompo] -= 5;
							    PlayerInfo[playerid][pMechSkill] += 10;
							    return 1;
							}
							else if(neonid == 2)
							{
	            				PlayerInfo[i][PlayerVehicle5ModNeon] = 2;
	            				CarNeon[vehicleid] = CreateObject(18647,0,0,0,0,0,0);
	            				CarNeon2[vehicleid] = CreateObject(18647,0,0,0,0,0,0);
	            		    	format(string, sizeof(string), " You have place %s Vehicle a Red neon ! [SLOT: 5]",giveplayer);
						    	SendClientMessage(playerid, COLOR_YELLOW, string);
						    	format(string, sizeof(string), " %s has place a Red neon to your Vehicle ! [SLOT: 5]",sendername);
						    	SendClientMessage(i, COLOR_YELLOW, string);
						    	AttachObjectToVehicle(CarNeon[vehicleid], vehicleid, -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
							    AttachObjectToVehicle(CarNeon2[vehicleid], vehicleid, 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
							    PlayerInfo[playerid][pCompo] -= 5;
							    PlayerInfo[playerid][pMechSkill] += 10;
							    return 1;
							}
							else if(neonid == 3)
							{
	            				PlayerInfo[i][PlayerVehicle5ModNeon] = 3;
	            				CarNeon[vehicleid] = CreateObject(18649,0,0,0,0,0,0);
	            				CarNeon2[vehicleid] = CreateObject(18649,0,0,0,0,0,0);
	            		    	format(string, sizeof(string), " You have place %s Vehicle a Green neon ! [SLOT: 5]",giveplayer);
						    	SendClientMessage(playerid, COLOR_YELLOW, string);
						    	format(string, sizeof(string), " %s has place a Green neon to your Vehicle ! [SLOT: 5]",sendername);
						    	SendClientMessage(i, COLOR_YELLOW, string);
						    	AttachObjectToVehicle(CarNeon[vehicleid], vehicleid, -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
							    AttachObjectToVehicle(CarNeon2[vehicleid], vehicleid, 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
							    PlayerInfo[playerid][pCompo] -= 5;
							    PlayerInfo[playerid][pMechSkill] += 10;
							    return 1;
							}
							else if(neonid == 4)
							{
	            				PlayerInfo[i][PlayerVehicle5ModNeon] = 4;
	            				CarNeon[vehicleid] = CreateObject(18652,0,0,0,0,0,0);
	            				CarNeon2[vehicleid] = CreateObject(18652,0,0,0,0,0,0);
	            		    	format(string, sizeof(string), " You have place %s Vehicle a White neon ! [SLOT: 5]",giveplayer);
						    	SendClientMessage(playerid, COLOR_YELLOW, string);
						    	format(string, sizeof(string), " %s has place a White neon to your Vehicle ! [SLOT: 5]",sendername);
						    	SendClientMessage(i, COLOR_YELLOW, string);
						    	AttachObjectToVehicle(CarNeon[vehicleid], vehicleid, -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
							    AttachObjectToVehicle(CarNeon2[vehicleid], vehicleid, 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
							    PlayerInfo[playerid][pCompo] -= 5;
							    PlayerInfo[playerid][pMechSkill] += 10;
							    return 1;
							}
							else if(neonid == 5)
							{
	            				PlayerInfo[i][PlayerVehicle5ModNeon] = 5;
	            				CarNeon[vehicleid] = CreateObject(18651,0,0,0,0,0,0);
	            				CarNeon2[vehicleid] = CreateObject(18651,0,0,0,0,0,0);
	            		    	format(string, sizeof(string), " You have place %s Vehicle a Pink neon ! [SLOT: 5]",giveplayer);
						    	SendClientMessage(playerid, COLOR_YELLOW, string);
						    	format(string, sizeof(string), " %s has place a Pink neon to your Vehicle ! [SLOT: 5]",sendername);
						    	SendClientMessage(i, COLOR_YELLOW, string);
						    	AttachObjectToVehicle(CarNeon[vehicleid], vehicleid, -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
							    AttachObjectToVehicle(CarNeon2[vehicleid], vehicleid, 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
							    PlayerInfo[playerid][pCompo] -= 5;
							    PlayerInfo[playerid][pMechSkill] += 10;
							    return 1;
							}
							else if(neonid == 6)
							{
	            				PlayerInfo[i][PlayerVehicle5ModNeon] = 6;
	            				CarNeon[vehicleid] = CreateObject(18650,0,0,0,0,0,0);
	            				CarNeon2[vehicleid] = CreateObject(18650,0,0,0,0,0,0);
	            		    	format(string, sizeof(string), " You have place %s Vehicle a Yellow neon ! [SLOT: 5]",giveplayer);
						    	SendClientMessage(playerid, COLOR_YELLOW, string);
						    	format(string, sizeof(string), " %s has place a Yellow neon to your Vehicle ! [SLOT: 5]",sendername);
						    	SendClientMessage(i, COLOR_YELLOW, string);
						    	AttachObjectToVehicle(CarNeon[vehicleid], vehicleid, -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
							    AttachObjectToVehicle(CarNeon2[vehicleid], vehicleid, 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
							    PlayerInfo[playerid][pCompo] -= 5;
							    PlayerInfo[playerid][pMechSkill] += 10;
							    return 1;
							}
						}
						else
						{
							SendClientMessage(playerid, COLOR_GREY, "  [ERROR] Masih ada Neon pada kendaraan ini");
						    return 1;
						}
					}
				}
			}
		}
		else
		{
			SendClientMessage(playerid,COLOR_YELLOW,"	You are not near any vehicle.");
			return 1;
        }
	}
    if(strcmp(cmd, "/loadcompo", true) == 0)
    {
        if(IsPlayerConnected(playerid))
        {
            new vehid = GetPlayerVehicleID(playerid);
            if(PlayerInfo[playerid][pJob] == 19)
            {
				if(IsATruckA(vehid) || IsATruckB(vehid))
				{
					if(IsPlayerInRangeOfPoint(playerid, 7.0,-1912.4484,-1670.8785,23.0156))
					{
                        ShowPlayerDialog(playerid, 1631, DIALOG_STYLE_LIST, "San Andreas Component Factory", "1 Component Crate\t{C9FFAB}$1,000\n{FFFFFF}2 Component Crate\t{C9FFAB}$1,800\n", "Buy", "Cancel" );
					}
					else
					{
					    SendClientMessage(playerid, COLOR_GRAD2," You're not at Component Factory !");
					}
				}
				else
				{
					SendClientMessage(playerid, COLOR_GRAD2,"    You're not in truck!");
				}
			}
			else
			{
			    SendClientMessage(playerid, COLOR_GRAD2,"   You're not a trucker!");
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/loadfish", true) == 0)
    {
        if(IsPlayerConnected(playerid))
        {
            new vehid = GetPlayerVehicleID(playerid);
            if(PlayerInfo[playerid][pJob] == 19)
            {
				if(IsATruckA(vehid) || IsATruckB(vehid))
				{
					if(IsPlayerInRangeOfPoint(playerid, 5.0,797.4240,-617.8522,16.3359))
					{
					    ShowPlayerDialog(playerid, 1692, DIALOG_STYLE_LIST, "Dilimore Seafish Factory", "1 Fish Box\t{C9FFAB}$700\n{FFFFFF}2 Fish Box\t{C9FFAB}$1,200\n", "Buy", "Cancel" );
					}
					else
					{
					    SendClientMessage(playerid, COLOR_GRAD2," You're not at Dilimore Seafish Factory !");
					}
				}
				else
				{
					SendClientMessage(playerid, COLOR_GRAD2,"    You're not in a truck!");
				}
			}
			else
			{
			    SendClientMessage(playerid, COLOR_GRAD2,"   You're not a trucker!");
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/loadprods", true) == 0)
    {
        if(IsPlayerConnected(playerid))
        {
            new vehid = GetPlayerVehicleID(playerid);
            if(PlayerInfo[playerid][pJob] == 19)
            {
				if(IsATruckA(vehid) || IsATruckB(vehid))
				{
					if(IsPlayerInRangeOfPoint(playerid, 7.0,89.7477,-306.2560,1.5781))
					{
						ShowPlayerDialog(playerid, 1632, DIALOG_STYLE_LIST, "Blueberry Food and Industrial Factory", "1 Product Box\t{C9FFAB}$700\n{FFFFFF}2 Product Box\t{C9FFAB}$1,200\n", "Buy", "Cancel" );
					}
					else
					{
					    SendClientMessage(playerid, COLOR_GRAD2," You're not at Blueberry Food and Industrial Factory !");
					}
				}
				else
				{
					SendClientMessage(playerid, COLOR_GRAD2,"    You're not in a truck!");
				}
			}
			else
			{
			    SendClientMessage(playerid, COLOR_GRAD2,"   You're not a trucker!");
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/unloadcompo", true) == 0)
    {
        if(IsPlayerConnected(playerid))
        {
            new vehid = GetPlayerVehicleID(playerid);
            if(PlayerInfo[playerid][pJob] == 19)
            {
				if(IsATruckA(vehid) || IsATruckB(vehid))
				{
					if(IsPlayerInRangeOfPoint(playerid, 5.0,1655.7650,-1829.2653,13.6523))
					{
						if(TruckGoods[vehid] == 1)
						{
                            if(compostock < 425)
                            {
								PlayerInfo[playerid][pCash] += 2200;
								TruckGoods[vehid] = 0;
								SendClientMessage(playerid, COLOR_WHITE," [Truck Radio]: You've delivered 1 Component Crates and get paid $2,200 !");
								compostock = compostock+75;
				        		format(string, sizeof(string), "Component Shop Point \nStock: %d/500 \n [/buycompo]", compostock);
				                Update3DTextLabelText(compotext,0x89FFFFFF,string);
				                for(new i=0; i<MAX_PLAYERS; i++)
								{
									if(PlayerVehicleID1[i] == vehid)
							    	{
										PlayerInfo[i][PlayerVehicle1Goods] = 0;
										return 1;
									}
									else if(PlayerVehicleID2[i] == vehid)
							    	{
										PlayerInfo[i][PlayerVehicle2Goods] = 0;
										return 1;
									}
									else if(PlayerVehicleID3[i] == vehid)
							    	{
										PlayerInfo[i][PlayerVehicle3Goods] = 0;
										return 1;
									}
									else if(PlayerVehicleID4[i] == vehid)
							    	{
										PlayerInfo[i][PlayerVehicle4Goods] = 0;
										return 1;
									}
									else if(PlayerVehicleID5[i] == vehid)
							    	{
										PlayerInfo[i][PlayerVehicle5Goods] = 0;
										return 1;
									}
								}
			                }
			                else
			                {
				                SendClientMessage(playerid, COLOR_GRAD2," The Component Store is currently full!");
						        return 1;
			                }
						}
						else if(TruckGoods[vehid] == 2)
						{
                            if(compostock < 350)
                            {
								PlayerInfo[playerid][pCash] += 3200;
								TruckGoods[vehid] = 0;
								SendClientMessage(playerid, COLOR_WHITE," [Truck Radio]: You've delivered a Component Crates and get paid $3,200 !");
								compostock = compostock+150;
				        		format(string, sizeof(string), "Component Shop Point \nStock: %d/500 \n [/buycompo]", compostock);
				                Update3DTextLabelText(compotext,0x89FFFFFF,string);
				                for(new i=0; i<MAX_PLAYERS; i++)
								{
									if(PlayerVehicleID1[i] == vehid)
							    	{
										PlayerInfo[i][PlayerVehicle1Goods] = 0;
										return 1;
									}
									else if(PlayerVehicleID2[i] == vehid)
							    	{
										PlayerInfo[i][PlayerVehicle2Goods] = 0;
										return 1;
									}
									else if(PlayerVehicleID3[i] == vehid)
							    	{
										PlayerInfo[i][PlayerVehicle3Goods] = 0;
										return 1;
									}
									else if(PlayerVehicleID4[i] == vehid)
							    	{
										PlayerInfo[i][PlayerVehicle4Goods] = 0;
										return 1;
									}
									else if(PlayerVehicleID5[i] == vehid)
							    	{
										PlayerInfo[i][PlayerVehicle5Goods] = 0;
										return 1;
									}
								}
			                }
			                else
			                {
				                SendClientMessage(playerid, COLOR_GRAD2," The Component Store is currently full!");
						        return 1;
			                }
						}
						else
						{
							SendClientMessage(playerid, COLOR_GRAD2," This Truck doesn't have a Component Crates !");
					        return 1;
						}
					}
					else
					{
					    SendClientMessage(playerid, COLOR_GRAD2," You are not at Component Store !");
					    return 1;
					}
				}
				else
				{
					SendClientMessage(playerid, COLOR_GRAD2,"    You're not in a truck!");
					return 1;
				}
			}
			else
			{
			    SendClientMessage(playerid, COLOR_GRAD2,"   You're not a trucker!");
			    return 1;
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/unloadfish", true) == 0)
    {
        if(IsPlayerConnected(playerid))
        {
            new vehid = GetPlayerVehicleID(playerid);
            if(PlayerInfo[playerid][pJob] == 19)
            {
				if(IsATruckA(vehid) || IsATruckB(vehid))
				{
					if(IsPlayerInRangeOfPoint(playerid, 5.0,2417.1985,-2466.8958,13.6250))
					{
						if(TruckGoods[vehid] == 5)
						{
							PlayerInfo[playerid][pCash] += 1400;
							TruckGoods[vehid] = 0;
							SendClientMessage(playerid, COLOR_WHITE," [Truck Radio]: You've delivered 1 Fish Box and get paid $1,400 !");
				            for(new i=0; i<MAX_PLAYERS; i++)
							{
								if(PlayerVehicleID1[i] == vehid)
							    {
									PlayerInfo[i][PlayerVehicle1Goods] = 0;
									return 1;
								}
								else if(PlayerVehicleID2[i] == vehid)
							    {
									PlayerInfo[i][PlayerVehicle2Goods] = 0;
									return 1;
								}
								else if(PlayerVehicleID3[i] == vehid)
							    {
									PlayerInfo[i][PlayerVehicle3Goods] = 0;
									return 1;
								}
								else if(PlayerVehicleID4[i] == vehid)
							    {
									PlayerInfo[i][PlayerVehicle4Goods] = 0;
									return 1;
								}
								else if(PlayerVehicleID5[i] == vehid)
							    {
									PlayerInfo[i][PlayerVehicle5Goods] = 0;
									return 1;
								}
			                }
						}
						else if(TruckGoods[vehid] == 6)
						{
							PlayerInfo[playerid][pCash] += 2800;
							TruckGoods[vehid] = 0;
							SendClientMessage(playerid, COLOR_WHITE," [Truck Radio]: You've delivered 2 Fish Box and get paid $2,800 !");
				            for(new i=0; i<MAX_PLAYERS; i++)
							{
								if(PlayerVehicleID1[i] == vehid)
							    {
									PlayerInfo[i][PlayerVehicle1Goods] = 0;
									return 1;
								}
								else if(PlayerVehicleID2[i] == vehid)
							    {
									PlayerInfo[i][PlayerVehicle2Goods] = 0;
									return 1;
								}
								else if(PlayerVehicleID3[i] == vehid)
							    {
									PlayerInfo[i][PlayerVehicle3Goods] = 0;
									return 1;
								}
								else if(PlayerVehicleID4[i] == vehid)
							    {
									PlayerInfo[i][PlayerVehicle4Goods] = 0;
									return 1;
								}
								else if(PlayerVehicleID5[i] == vehid)
							    {
									PlayerInfo[i][PlayerVehicle5Goods] = 0;
									return 1;
								}
			                }
						}
						else
						{
							SendClientMessage(playerid, COLOR_GRAD2," This Truck doesn't have a Fish Box !");
					        return 1;
						}
					}
					else
					{
					    SendClientMessage(playerid, COLOR_GRAD2," You are not at Ocean Docks Export !");
					    return 1;
					}
				}
				else
				{
					SendClientMessage(playerid, COLOR_GRAD2,"    You're not in a truck!");
					return 1;
				}
			}
			else
			{
			    SendClientMessage(playerid, COLOR_GRAD2,"   You're not a trucker!");
			    return 1;
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/unloadprods", true) == 0)
    {
        if(IsPlayerConnected(playerid))
        {
            new vehid = GetPlayerVehicleID(playerid);
            if(PlayerInfo[playerid][pJob] == 19)
            {
				if(IsATruckA(vehid) || IsATruckB(vehid))
				{
					if(IsPlayerInRangeOfPoint(playerid, 5.0,2209.2100,-2295.6589,14.7647))
					{
						if(TruckGoods[vehid] == 3)
						{
                            if(prodstock < 1700)
                            {
								PlayerInfo[playerid][pCash] += 1400;
								TruckGoods[vehid] = 0;
								SendClientMessage(playerid, COLOR_WHITE," [Truck Radio]: You've delivered 1 Produuct Packages and get paid $1,400 !");
								prodstock = prodstock+300;
				   	    		format(string, sizeof(string), "Product Shop Point \nStock: %d/2000 \n[/getprods]", prodstock);
				                Update3DTextLabelText(prodtext,0x89FFFFFF,string);
				                for(new i=0; i<MAX_PLAYERS; i++)
								{
									if(PlayerVehicleID1[i] == vehid)
							    	{
										PlayerInfo[i][PlayerVehicle1Goods] = 0;
										return 1;
									}
									else if(PlayerVehicleID2[i] == vehid)
							    	{
										PlayerInfo[i][PlayerVehicle2Goods] = 0;
										return 1;
									}
									else if(PlayerVehicleID3[i] == vehid)
							    	{
										PlayerInfo[i][PlayerVehicle3Goods] = 0;
										return 1;
									}
									else if(PlayerVehicleID4[i] == vehid)
							    	{
										PlayerInfo[i][PlayerVehicle4Goods] = 0;
										return 1;
									}
									else if(PlayerVehicleID5[i] == vehid)
							    	{
										PlayerInfo[i][PlayerVehicle5Goods] = 0;
										return 1;
									}
								}
			                }
			                else
			                {
				                SendClientMessage(playerid, COLOR_GRAD2," The Product Store is currently full!");
						        return 1;
			                }
						}
						else if(TruckGoods[vehid] == 4)
						{
                            if(prodstock < 1400)
                            {
								PlayerInfo[playerid][pCash] += 2800;
								TruckGoods[vehid] = 0;
								SendClientMessage(playerid, COLOR_WHITE," [Truck Radio]: You've delivered 2 Produuct Box and get paid $2,800 !");
								prodstock = prodstock+600;
				   	    		format(string, sizeof(string), "Product Shop Point \nStock: %d/2000 \n[/getprods]", prodstock);
				                Update3DTextLabelText(prodtext,0x89FFFFFF,string);
				                for(new i=0; i<MAX_PLAYERS; i++)
								{
									if(PlayerVehicleID1[i] == vehid)
							    	{
										PlayerInfo[i][PlayerVehicle1Goods] = 0;
										return 1;
									}
									else if(PlayerVehicleID2[i] == vehid)
							    	{
										PlayerInfo[i][PlayerVehicle2Goods] = 0;
										return 1;
									}
									else if(PlayerVehicleID3[i] == vehid)
							    	{
										PlayerInfo[i][PlayerVehicle3Goods] = 0;
										return 1;
									}
									else if(PlayerVehicleID4[i] == vehid)
							    	{
										PlayerInfo[i][PlayerVehicle4Goods] = 0;
										return 1;
									}
									else if(PlayerVehicleID5[i] == vehid)
							    	{
										PlayerInfo[i][PlayerVehicle5Goods] = 0;
										return 1;
									}
								}
			                }
			                else
			                {
				                SendClientMessage(playerid, COLOR_GRAD2," The Product Store is currently full!");
						        return 1;
			                }
						}
						else
						{
							SendClientMessage(playerid, COLOR_GRAD2," This Truck doesn't have a Product Box !");
					        return 1;
						}
					}
					else
					{
					    SendClientMessage(playerid, COLOR_GRAD2," You are not at Product Store !");
					    return 1;
					}
				}
				else
				{
					SendClientMessage(playerid, COLOR_GRAD2,"    You're not in a truck!");
					return 1;
				}
			}
			else
			{
			    SendClientMessage(playerid, COLOR_GRAD2,"   You're not a trucker!");
			    return 1;
			}
		}
		return 1;
	}
	/*if(strcmp(cmd, "/loadvan", true) == 0)
    {
        if(IsPlayerConnected(playerid))
        {
            if(PlayerInfo[playerid][pJob] != 24)
            {
                return SendClientMessage(playerid, COLOR_GRAD2,"   You're not a fedex driver!");
			}
			if(PlayerInfo[playerid][pvLoaded] != 0)
			{
   				return SendClientMessage(playerid, COLOR_GRAD2,"   Your van is already loaded!");
			}
			if(!(GetPlayerVehicleID(playerid) >= FedexC[0] && GetPlayerVehicleID(playerid) <= FedexC[2]))
			{
			    return SendClientMessage(playerid, COLOR_GRAD2,"    You're not in a Fedex Truck!");
			}
			if(CP[playerid] != 0)
			{
			    return SendClientMessage(playerid, COLOR_GRAD2,"    You already have an active checkpoint !");
			}
			SendClientMessage(playerid, COLOR_YELLOW,"< Fedex Radio : Take the Truck to the Loading-Bay Point to start your Delivery >");
			SetPlayerCheckpoint(playerid, 1608.3444,-1793.4602,13.9063,3.0);
			CP[playerid] = 2348;
		}
	}*/
	if(strcmp(cmd, "/createmapicon", true) == 0)
	{
		new choice2, string2[128];
		if(PlayerInfo[playerid][pAdmin] < 1339)
		{
		    return SendClientMessage(playerid, COLOR_GREY," You're not authorized to use that command !");
		}
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
		 	SendClientMessage(playerid, COLOR_GREY," USAGE: /createmapicon [name] [value]");
			SendClientMessage(playerid, COLOR_GREY," Available names : type ( Model ID ), location, complete");
			return 1;
		}
		if(strcmp(tmp, "type",true) == 0)
		{
		    tmp = strtok(cmdtext, idx);
		    choice2 = strvalEx(tmp);
		    if(choice2 < 1)
			{
		 		SendClientMessage(playerid, COLOR_GREY," USAGE: /createmapicon [name] [value]");
				SendClientMessage(playerid, COLOR_GREY," Available names : type ( Model ID ), location, complete");
				return 1;
			}
			mapID[playerid] = choice2;
			format(string2,sizeof(string2), " You've edited map icon model type to %d.", choice2);
			SendClientMessage(playerid, COLOR_GREY, string2);
			return 1;
		}
		if(strcmp(tmp, "location", true) == 0)
		{
		    new Float:mX, Float:mY, Float:mZ;
		    GetPlayerPos(playerid, mX,mY,mZ);
			mapX[playerid] = mX; mapY[playerid] = mY; mapZ[playerid] = mZ;
			SendClientMessage(playerid, COLOR_GREY," Map icon location has been changed.");
			return 1;
		}
		if(strcmp(tmp, "complete", true) == 0)
		{
		    if(mapX[playerid] == 0.0)
		    {
				return SendClientMessage(playerid, COLOR_GREY," Map location has not been set ! (/createmapicon location)");
			}
			if(mapID[playerid] == 0)
			{
			    return SendClientMessage(playerid, COLOR_GREY," Map model ID has not been set ! (/createmapicon type)");
			}
			for(new m=0;m<MAX_MAPICONS;m++)
			{
				if(MapInfo[m][mPosX] == 0.0)
				{
				    MapInfo[m][mID] = m;
				    MapInfo[m][mPosX] = mapX[playerid];
				    MapInfo[m][mPosY] = mapY[playerid];
				    MapInfo[m][mPosZ] = mapZ[playerid];
				    MapInfo[m][mModelID] = mapID[playerid];
					for(new i=0;i<MAX_PLAYERS;i++)
					{
						CreateDynamicMapIconEx(MapInfo[m][mPosX], MapInfo[m][mPosY], MapInfo[m][mPosZ], MapInfo[m][mModelID], 0);
					}
					SaveMapIcons();
					format(string2, sizeof(string2), " You've created map icon ID %d with model %d.",m, mapID[playerid]);
					SendClientMessage(playerid, COLOR_GREY,string2);
					mapX[playerid] = 0; mapY[playerid] = 0; mapZ[playerid] = 0; mapID[playerid] = 0;
					break;
				}
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/sbm", true) == 0)
    {
        if(PlayerInfo[playerid][pAdmin] < 1339)
        {
            return SendClientMessage(playerid, COLOR_GREY," You're not authorized to use that command !");
        }
        new rtoggle, bid;
        tmp = strtok(cmdtext, idx);
        bid = strvalEx(tmp);
        tmp = strtok(cmdtext, idx);
        rtoggle = strvalEx(tmp);
        if(bid <= 0 || bid >= MAX_BUILDINGS)
        {
            return SendClientMessage(playerid, COLOR_GREY," USAGE: /sbm [buildingid] [0/1]");
        }
        if(rtoggle < 1)
        {
                BInfo[bid][buRadio] = 0;
                SendClientMessage(playerid, COLOR_GREY," You've turned off the radio in that building.");
                for(new i=0;i<MAX_PLAYERS;i++)
                {
                    if(PlayerInfo[i][InBuilding] == bid)
                    {
                        StopAudioStreamForPlayer(i);
                    }
                }
                return 1;
        }
        if(rtoggle > 1)
        {
            return SendClientMessage(playerid, COLOR_GREY," USAGE: /sbm [buildingid] [0/1]");
        }
        ShowPlayerDialog(playerid, 7331, DIALOG_STYLE_INPUT, "Enter the URL", "Type in the link for the audio stream", "Stream it", "Cancel");
        bEditing[playerid] = bid;
        return 1;
    }
  
  
	if(strcmp(cmd, "/cartune", true) == 0)
	{
    	if(PlayerInfo[playerid][pJob] != 7) return SendClientMessage(playerid, GREY, "[MECHANIC] You are not a Mechanic!");
    	if(!IsPlayerInRangeOfPoint(playerid,28.0,1607.6606,-2164.7157,13.5619)) return SendClientMessage(playerid, GREY, "[MECHANIC] You are not in Mechanic Garage");
    	if(PlayerInfo[playerid][pCompo] < 5) return SendClientMessage(playerid, GREY, "[MECHANIC] You need 5 Component for tuning Vehicle!");
    	if(PlayerInfo[playerid][pMechSkill] < 200) return SendClientMessage(playerid, GREY, "[MECHANIC] You need to be Mechanic Level 4 to Adding/Remove Tuning from Vehicles (/skill) !");
		if(JobDuty[playerid] == 0) return SendClientMessage(playerid, COLOR_RED, "[MECHANIC] You are not a Mechanic Duty!");
		new carstring[2048]; //enough?
    	new component;
 		ccount[playerid] = 1;
 		if(PlayerInfo[playerid][pInjured] != 0 || IsPlayerInAnyVehicle(playerid))
		{
			SendClientMessage(playerid, COLOR_GREY, "   You can't do that at this time !");
			return 1;
		}
		new vehicleid = GetClosestCar(playerid);
		if(HoodOpen[vehicleid] == 0 && IsACar(vehicleid))
		{
			SendClientMessage(playerid,COLOR_GREY,"   Open the Vehicle Hood first !");
			return 1;
		}
		new Float:V1X, Float:V1Y, Float:V1Z;
		GetVehiclePos(vehicleid, V1X, V1Y, V1Z);
		if(IsPlayerInRangeOfPoint(playerid, 4, V1X, V1Y, V1Z))
		{
			new vehiclemodel = GetVehicleModel(vehicleid);
			if(vehiclemodel < 400 || vehiclemodel > 611) return SendClientMessage(playerid, COLOR_RED, "[MECHANIC] You can't tune this vehicle!");
	    	while(GetVehicleCompatibleUpgrades(vehiclemodel, ccount[playerid], component))
	    	{
				if(ccount[playerid] <= MAX_COMP)
				{
					if(ccount[playerid] == 1) format(carstring, sizeof(carstring), "%s", GetComponentName(component));
					else format(carstring, sizeof(carstring), "%s\n%s", carstring, GetComponentName(component));
					componentsid[playerid][ccount[playerid]-1] = component;
					ccount[playerid]++;
				}
				else break; //in case that MAX_COMP gets passed
	  	    }
			new title[80];
			format(title, sizeof(title), "Tuning for Vehicle Model {FF6400}%d", vehiclemodel);
			ShowPlayerDialog(playerid, DIALOGID, DIALOG_STYLE_LIST, title, carstring, "Select", "Cancel");
	 	    return 1;
 	    }
 	    else
 	    {
 	    	SendClientMessage(playerid,COLOR_GREY,"   You are not near any vehicle !");
			return 1;
 	    }
	}
	if(strcmp(cmd, "/deletetune", true) == 0)
	{
        if(IsPlayerConnected(playerid))
		{
	    	if(PlayerInfo[playerid][pJob] != 7) return SendClientMessage(playerid, GREY, "[MECHANIC] You are not a Mechanic!");
	    	if(!IsPlayerInRangeOfPoint(playerid,28.0,1607.6606,-2164.7157,13.5619)) return SendClientMessage(playerid, GREY, "[MECHANIC] You are not in Mechanic Garage");
	    	if(PlayerInfo[playerid][pCompo] < 3) return SendClientMessage(playerid, GREY, "[MECHANIC] You need 3 Component for tuning Vehicle!");
	    	if(PlayerInfo[playerid][pMechSkill] < 200) return SendClientMessage(playerid, GREY, "[MECHANIC] You need to be Mechanic Level 4 to Adding/Remove Tuning from Vehicles (/skill) !");
	    	if(JobDuty[playerid] == 0) return SendClientMessage(playerid, COLOR_RED, "[MECHANIC] You are not a Mechanic Duty!");
			new savecar = GetClosestCar(playerid), componentid;
			if(PlayerInfo[playerid][pInjured] != 0 || IsPlayerInAnyVehicle(playerid))
			{
				SendClientMessage(playerid, COLOR_GREY, "   You can't do that at this time !");
				return 1;
			}
			if(HoodOpen[savecar] == 0 && IsACar(savecar))
			{
				SendClientMessage(playerid,COLOR_GREY,"   Open the Vehicle Hood first !");
				return 1;
			}
			new Float:V1X, Float:V1Y, Float:V1Z;
			GetVehiclePos(savecar, V1X, V1Y, V1Z);
			if(IsPlayerInRangeOfPoint(playerid, 4, V1X, V1Y, V1Z))
			{
				for( new a; a < 14; a++ )
				{
					componentid = GetVehicleComponentInSlot(savecar, a);
					if(componentid != 0)
					{
						RemoveVehicleComponent(savecar, componentid);
						for(new i = 0; i < MAX_PLAYERS; i++)
						{
							GetPlayerName(playerid, sendername, sizeof(sendername));
							GetPlayerName(i, giveplayer, sizeof(giveplayer));
							if(IsPlayerConnected(i))
							{
								if(PlayerVehicleID1[i] == savecar)
								{
									PlayerInfo[i][PlayerVehicle1ModSlot0] = GetVehicleComponentInSlot(PlayerVehicleID1[i], 0);
									PlayerInfo[i][PlayerVehicle1ModSlot1] = GetVehicleComponentInSlot(PlayerVehicleID1[i], 1);
									PlayerInfo[i][PlayerVehicle1ModSlot2] = GetVehicleComponentInSlot(PlayerVehicleID1[i], 2);
									PlayerInfo[i][PlayerVehicle1ModSlot3] = GetVehicleComponentInSlot(PlayerVehicleID1[i], 3);
									PlayerInfo[i][PlayerVehicle1ModSlot4] = GetVehicleComponentInSlot(PlayerVehicleID1[i], 4);
									PlayerInfo[i][PlayerVehicle1ModSlot5] = GetVehicleComponentInSlot(PlayerVehicleID1[i], 5);
									PlayerInfo[i][PlayerVehicle1ModSlot6] = GetVehicleComponentInSlot(PlayerVehicleID1[i], 6);
									PlayerInfo[i][PlayerVehicle1ModSlot7] = GetVehicleComponentInSlot(PlayerVehicleID1[i], 7);
									PlayerInfo[i][PlayerVehicle1ModSlot8] = GetVehicleComponentInSlot(PlayerVehicleID1[i], 8);
									PlayerInfo[i][PlayerVehicle1ModSlot9] = GetVehicleComponentInSlot(PlayerVehicleID1[i], 9);
									PlayerInfo[i][PlayerVehicle1ModSlot10] = GetVehicleComponentInSlot(PlayerVehicleID1[i], 10);
									PlayerInfo[i][PlayerVehicle1ModSlot11] = GetVehicleComponentInSlot(PlayerVehicleID1[i], 11);
									PlayerInfo[i][PlayerVehicle1ModSlot12] = GetVehicleComponentInSlot(PlayerVehicleID1[i], 12);
									PlayerInfo[i][PlayerVehicle1ModSlot13] = GetVehicleComponentInSlot(PlayerVehicleID1[i], 13);
									format(string, sizeof(string), " You have removed all tune from %s's Vehicles [SLOT: 1]",giveplayer);
							    	SendClientMessage(playerid, COLOR_YELLOW, string);
							    	format(string, sizeof(string), " %s has removed all tune from your Vehicles [SLOT: 1]",sendername);
							    	SendClientMessage(i, COLOR_YELLOW, string);
							    	PlayerInfo[playerid][pCompo] -= 3;
								}
							    else if(PlayerVehicleID2[i] == savecar)
								{
									PlayerInfo[i][PlayerVehicle2ModSlot0] = GetVehicleComponentInSlot(PlayerVehicleID2[i], 0);
									PlayerInfo[i][PlayerVehicle2ModSlot1] = GetVehicleComponentInSlot(PlayerVehicleID2[i], 1);
									PlayerInfo[i][PlayerVehicle2ModSlot2] = GetVehicleComponentInSlot(PlayerVehicleID2[i], 2);
									PlayerInfo[i][PlayerVehicle2ModSlot3] = GetVehicleComponentInSlot(PlayerVehicleID2[i], 3);
									PlayerInfo[i][PlayerVehicle2ModSlot4] = GetVehicleComponentInSlot(PlayerVehicleID2[i], 4);
									PlayerInfo[i][PlayerVehicle2ModSlot5] = GetVehicleComponentInSlot(PlayerVehicleID2[i], 5);
									PlayerInfo[i][PlayerVehicle2ModSlot6] = GetVehicleComponentInSlot(PlayerVehicleID2[i], 6);
									PlayerInfo[i][PlayerVehicle2ModSlot7] = GetVehicleComponentInSlot(PlayerVehicleID2[i], 7);
									PlayerInfo[i][PlayerVehicle2ModSlot8] = GetVehicleComponentInSlot(PlayerVehicleID2[i], 8);
									PlayerInfo[i][PlayerVehicle2ModSlot9] = GetVehicleComponentInSlot(PlayerVehicleID2[i], 9);
									PlayerInfo[i][PlayerVehicle2ModSlot10] = GetVehicleComponentInSlot(PlayerVehicleID2[i], 10);
									PlayerInfo[i][PlayerVehicle2ModSlot11] = GetVehicleComponentInSlot(PlayerVehicleID2[i], 11);
									PlayerInfo[i][PlayerVehicle2ModSlot12] = GetVehicleComponentInSlot(PlayerVehicleID2[i], 12);
									PlayerInfo[i][PlayerVehicle2ModSlot13] = GetVehicleComponentInSlot(PlayerVehicleID2[i], 13);
									format(string, sizeof(string), " You have removed all tune from %s's Vehicles [SLOT: 2]",giveplayer);
							    	SendClientMessage(playerid, COLOR_YELLOW, string);
							    	format(string, sizeof(string), " %s has removed all tune from your Vehicles [SLOT: 2]",sendername);
							    	SendClientMessage(i, COLOR_YELLOW, string);
							    	PlayerInfo[playerid][pCompo] -= 3;
								}
							    else if(PlayerVehicleID3[i] == savecar)
								{
									PlayerInfo[i][PlayerVehicle3ModSlot0] = GetVehicleComponentInSlot(PlayerVehicleID3[i], 0);
									PlayerInfo[i][PlayerVehicle3ModSlot1] = GetVehicleComponentInSlot(PlayerVehicleID3[i], 1);
									PlayerInfo[i][PlayerVehicle3ModSlot2] = GetVehicleComponentInSlot(PlayerVehicleID3[i], 2);
									PlayerInfo[i][PlayerVehicle3ModSlot3] = GetVehicleComponentInSlot(PlayerVehicleID3[i], 3);
									PlayerInfo[i][PlayerVehicle3ModSlot4] = GetVehicleComponentInSlot(PlayerVehicleID3[i], 4);
									PlayerInfo[i][PlayerVehicle3ModSlot5] = GetVehicleComponentInSlot(PlayerVehicleID3[i], 5);
									PlayerInfo[i][PlayerVehicle3ModSlot6] = GetVehicleComponentInSlot(PlayerVehicleID3[i], 6);
									PlayerInfo[i][PlayerVehicle3ModSlot7] = GetVehicleComponentInSlot(PlayerVehicleID3[i], 7);
									PlayerInfo[i][PlayerVehicle3ModSlot8] = GetVehicleComponentInSlot(PlayerVehicleID3[i], 8);
									PlayerInfo[i][PlayerVehicle3ModSlot9] = GetVehicleComponentInSlot(PlayerVehicleID3[i], 9);
									PlayerInfo[i][PlayerVehicle3ModSlot10] = GetVehicleComponentInSlot(PlayerVehicleID3[i], 10);
									PlayerInfo[i][PlayerVehicle3ModSlot11] = GetVehicleComponentInSlot(PlayerVehicleID3[i], 11);
									PlayerInfo[i][PlayerVehicle3ModSlot12] = GetVehicleComponentInSlot(PlayerVehicleID3[i], 12);
									PlayerInfo[i][PlayerVehicle3ModSlot13] = GetVehicleComponentInSlot(PlayerVehicleID3[i], 13);
									format(string, sizeof(string), " You have removed all tune from %s's Vehicles [SLOT: 3]",giveplayer);
							    	SendClientMessage(playerid, COLOR_YELLOW, string);
							    	format(string, sizeof(string), " %s has removed all tune from your Vehicles [SLOT: 3]",sendername);
							    	SendClientMessage(i, COLOR_YELLOW, string);
							    	PlayerInfo[playerid][pCompo] -= 3;
								}
				                else if(PlayerVehicleID4[i] == savecar)
								{
									PlayerInfo[i][PlayerVehicle4ModSlot0] = GetVehicleComponentInSlot(PlayerVehicleID4[i], 0);
									PlayerInfo[i][PlayerVehicle4ModSlot1] = GetVehicleComponentInSlot(PlayerVehicleID4[i], 1);
									PlayerInfo[i][PlayerVehicle4ModSlot2] = GetVehicleComponentInSlot(PlayerVehicleID4[i], 2);
									PlayerInfo[i][PlayerVehicle4ModSlot3] = GetVehicleComponentInSlot(PlayerVehicleID4[i], 3);
									PlayerInfo[i][PlayerVehicle4ModSlot4] = GetVehicleComponentInSlot(PlayerVehicleID4[i], 4);
									PlayerInfo[i][PlayerVehicle4ModSlot5] = GetVehicleComponentInSlot(PlayerVehicleID4[i], 5);
									PlayerInfo[i][PlayerVehicle4ModSlot6] = GetVehicleComponentInSlot(PlayerVehicleID4[i], 6);
									PlayerInfo[i][PlayerVehicle4ModSlot7] = GetVehicleComponentInSlot(PlayerVehicleID4[i], 7);
									PlayerInfo[i][PlayerVehicle4ModSlot8] = GetVehicleComponentInSlot(PlayerVehicleID4[i], 8);
									PlayerInfo[i][PlayerVehicle4ModSlot9] = GetVehicleComponentInSlot(PlayerVehicleID4[i], 9);
									PlayerInfo[i][PlayerVehicle4ModSlot10] = GetVehicleComponentInSlot(PlayerVehicleID4[i], 10);
									PlayerInfo[i][PlayerVehicle4ModSlot11] = GetVehicleComponentInSlot(PlayerVehicleID4[i], 11);
									PlayerInfo[i][PlayerVehicle4ModSlot12] = GetVehicleComponentInSlot(PlayerVehicleID4[i], 12);
									PlayerInfo[i][PlayerVehicle4ModSlot13] = GetVehicleComponentInSlot(PlayerVehicleID4[i], 13);
									format(string, sizeof(string), " You have removed all tune from %s's Vehicles [SLOT: 4]",giveplayer);
							    	SendClientMessage(playerid, COLOR_YELLOW, string);
							    	format(string, sizeof(string), " %s has removed all tune from your Vehicles [SLOT: 4]",sendername);
							    	SendClientMessage(i, COLOR_YELLOW, string);
							    	PlayerInfo[playerid][pCompo] -= 3;
								}
				                else if(PlayerVehicleID5[i] == savecar)
								{
									PlayerInfo[i][PlayerVehicle5ModSlot0] = GetVehicleComponentInSlot(PlayerVehicleID5[i], 0);
									PlayerInfo[i][PlayerVehicle5ModSlot1] = GetVehicleComponentInSlot(PlayerVehicleID5[i], 1);
									PlayerInfo[i][PlayerVehicle5ModSlot2] = GetVehicleComponentInSlot(PlayerVehicleID5[i], 2);
									PlayerInfo[i][PlayerVehicle5ModSlot3] = GetVehicleComponentInSlot(PlayerVehicleID5[i], 3);
									PlayerInfo[i][PlayerVehicle5ModSlot4] = GetVehicleComponentInSlot(PlayerVehicleID5[i], 4);
									PlayerInfo[i][PlayerVehicle5ModSlot5] = GetVehicleComponentInSlot(PlayerVehicleID5[i], 5);
									PlayerInfo[i][PlayerVehicle5ModSlot6] = GetVehicleComponentInSlot(PlayerVehicleID5[i], 6);
									PlayerInfo[i][PlayerVehicle5ModSlot7] = GetVehicleComponentInSlot(PlayerVehicleID5[i], 7);
									PlayerInfo[i][PlayerVehicle5ModSlot8] = GetVehicleComponentInSlot(PlayerVehicleID5[i], 8);
									PlayerInfo[i][PlayerVehicle5ModSlot9] = GetVehicleComponentInSlot(PlayerVehicleID5[i], 9);
									PlayerInfo[i][PlayerVehicle5ModSlot10] = GetVehicleComponentInSlot(PlayerVehicleID5[i], 10);
									PlayerInfo[i][PlayerVehicle5ModSlot11] = GetVehicleComponentInSlot(PlayerVehicleID5[i], 11);
									PlayerInfo[i][PlayerVehicle5ModSlot12] = GetVehicleComponentInSlot(PlayerVehicleID5[i], 12);
									PlayerInfo[i][PlayerVehicle5ModSlot13] = GetVehicleComponentInSlot(PlayerVehicleID5[i], 13);
									format(string, sizeof(string), " You have removed all tune from %s's Vehicles [SLOT: 5]",giveplayer);
							    	SendClientMessage(playerid, COLOR_YELLOW, string);
							    	format(string, sizeof(string), " %s has removed all tune from your Vehicles [SLOT: 5]",sendername);
							    	SendClientMessage(i, COLOR_YELLOW, string);
							    	PlayerInfo[playerid][pCompo] -= 3;
								}
							}
						}
					}
				}
			}
			else
			{
				SendClientMessage(playerid,COLOR_GREY,"   You are not near any vehicle !");
				return 1;
			}
		}
 	    return 1;
	}
  
  
	if(strcmp(cmd, "/setstat", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        if(PlayerInfo[playerid][pAdmin] < 1338)
			{
				SendClientMessage(playerid, COLOR_GREY,"   You are not authorized to use that command !");
				return 1;
			}
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_WHITE, "USAGE: /setstat [playerid/PartOfName] [statcode] [amount]");
				SendClientMessage(playerid, COLOR_GRAD1, "|1 Level |2 Armor Upgrade |3 UpgradePoints |4 Model |5 BankAccount |6 PhoneNumber |7 RespectPoints");
				SendClientMessage(playerid, COLOR_GRAD2, "|11 FMember |12 Det |13 Lawyer |14 Fixer |15 News |16 Jack |17 Drug");
				SendClientMessage(playerid, COLOR_GRAD3, "|18 Sex |19 Box |20 Arms |21 Gun parts |22 Pot |23 Crack |24 Fishing |25 Job |26 Rank |27 Packages |28 Crates");
				SendClientMessage(playerid, COLOR_GRAD4, "|29 Smuggler |30 CarKey 31| Warnings");
				return 1;
			}
			giveplayerid = ReturnUser(tmp);
            if(IsPlayerConnected(giveplayerid))
	    	{
	    	    if(giveplayerid != INVALID_PLAYER_ID)
	    	    {
					tmp = strtok(cmdtext, idx);
					if(!strlen(tmp))
					{
						SendClientMessage(playerid, COLOR_WHITE, "USAGE: /setstat [playerid/PartOfName] [statcode] [amount]");
						SendClientMessage(playerid, COLOR_GRAD1, "|1 Level |2 Armor Upgrade |3 UpgradePoints |4 Model |5 BankAccount |6 PhoneNumber |7 RespectPoints");
						SendClientMessage(playerid, COLOR_GRAD2, "|11 FMember |12 Det |13 Lawyer |14 Fixer |15 News |16 Jack |17 Drug");
						SendClientMessage(playerid, COLOR_GRAD3, "|18 Sex |19 Box |20 Arms |21 Gun parts |22 Pot |23 Crack |24 Fishing |25 Job |26 Rank |27 Packages |28 Crates");
						SendClientMessage(playerid, COLOR_GRAD4, "|29 Smuggler |30 CarKey 31| Warnings");
						return 1;
					}
					new stat;
					stat = strvalEx(tmp);
					tmp = strtok(cmdtext, idx);
					if(!strlen(tmp))
					{
						SendClientMessage(playerid, COLOR_WHITE, "USAGE: /setstat [playerid/PartOfName] [statcode] [amount]");
						SendClientMessage(playerid, COLOR_GRAD1, "|1 Level |2 Armor Upgrade |3 UpgradePoints |4 Model |5 BankAccount |6 PhoneNumber |7 RespectPoints");
						SendClientMessage(playerid, COLOR_GRAD2, "|11 FMember |12 Det |13 Lawyer |14 Fixer |15 News |16 Jack |17 Drug");
						SendClientMessage(playerid, COLOR_GRAD3, "|18 Sex |19 Box |20 Arms |21 Gun parts |22 Pot |23 Crack |24 Fishing |25 Job |26 Rank |27 Packages |28 Crates");
						SendClientMessage(playerid, COLOR_GRAD4, "|29 Smuggler |30 CarKey 31| Warnings");
						return 1;
					}
					new amount;
					new logstring[128];
					new year, month, day;
					getdate(year, month, day);
					GetPlayerName(playerid, sendername, sizeof(sendername));
					GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
					amount = strvalEx(tmp);
					switch (stat)
					{
							case 1:
							{
								PlayerInfo[giveplayerid][pLevel] = amount;
								format(string, sizeof(string), "   That players Level was set to %d", amount);
								format(logstring, sizeof(logstring), "[%d/%d/%d] %s has set %s's Level to %d", day, month, year, sendername, giveplayer, amount);
							}
							case 2:
							{
								SendClientMessage(playerid, COLOR_GREY, "   Invalid Model !");
								return 1;
							}
							case 3:
							{
								PlayerInfo[giveplayerid][gPupgrade] = amount;
								format(string, sizeof(string), "   That players Upgradepoints were set to %d", amount);
								format(logstring, sizeof(logstring), "[%d/%d/%d] %s has set %s's Upgradepoints to %d", day, month, year, sendername, giveplayer, amount);
							}
							case 4:
							{
							    if(amount < 0 || amount > 299) { SendClientMessage(playerid, COLOR_GREY, "   Model Number can't be below 0 or above 299 !"); return 1; }
								if(IsInvalidSkin(amount))
								{
								    SendClientMessage(playerid, COLOR_GREY, "   Invalid Model !");
								    return 1;
								}
								else
								{
									PlayerInfo[giveplayerid][pModel] = amount;
									SetPlayerSkin(giveplayerid, amount);
									format(string, sizeof(string), "   That players Model was set to %d", amount);
									format(logstring, sizeof(logstring), "[%d/%d/%d] %s has set %s's Model to %d", day, month, year, sendername, giveplayer, amount);
								}
							}
							case 5:
							{
								PlayerInfo[giveplayerid][pAccount] = amount;
								format(string, sizeof(string), "   That players Account was set to $%d", amount);
								format(logstring, sizeof(logstring), "[%d/%d/%d] %s has set %s's BankAccount to %d", day, month, year, sendername, giveplayer, amount);
							}
							case 6:
							{
								PlayerInfo[giveplayerid][pPnumber] = amount;
								format(string, sizeof(string), "   That players Phone Number was set to %d", amount);
								format(logstring, sizeof(logstring), "[%d/%d/%d] %s has set %s's Phone Number to %d", day, month, year, sendername, giveplayer, amount);
							}
							case 7:
							{
								PlayerInfo[giveplayerid][pExp] = amount;
								format(string, sizeof(string), "   That players Respect Points was set to %d", amount);
								format(logstring, sizeof(logstring), "[%d/%d/%d] %s has set %s's Respect Points to %d", day, month, year, sendername, giveplayer, amount);
							}
							case 11:
							{
							    if(amount < 1 || amount > 14) { SendClientMessage(playerid, COLOR_GREY, "   FMember can't be below 1 or above 14 !"); return 1; }
								PlayerInfo[giveplayerid][pFMember] = amount-1;
								format(string, sizeof(string), "   That players Family was set to %d", amount);
								format(logstring, sizeof(logstring), "[%d/%d/%d] %s has set %s's Family to %d", day, month, year, sendername, giveplayer, amount);
							}
							case 12:
							{
								PlayerInfo[giveplayerid][pDetSkill] = amount;
								format(string, sizeof(string), "   That players Detective Skill was set to %d", amount);
								format(logstring, sizeof(logstring), "[%d/%d/%d] %s has set %s's Detective Skill to %d", day, month, year, sendername, giveplayer, amount);
							}
							case 13:
							{
								PlayerInfo[giveplayerid][pLawSkill] = amount;
								format(string, sizeof(string), "   That players Lawyer Skill was set to %d", amount);
								format(logstring, sizeof(logstring), "[%d/%d/%d] %s has set %s's Lawyer Skill to %d", day, month, year, sendername, giveplayer, amount);
							}
							case 14:
							{
								PlayerInfo[giveplayerid][pMechSkill] = amount;
								format(string, sizeof(string), "   That players Mechanic Skill was set to %d", amount);
								format(logstring, sizeof(logstring), "[%d/%d/%d] %s has set %s's Mechanic Skill to %d", day, month, year, sendername, giveplayer, amount);
							}
							case 15:
							{
								PlayerInfo[giveplayerid][pNewsSkill] = amount;
								format(string, sizeof(string), "   That players News Reporter Skill was set to %d", amount);
								format(logstring, sizeof(logstring), "[%d/%d/%d] %s has set %s's News Reporter Skill to %d", day, month, year, sendername, giveplayer, amount);
							}
							case 16:
							{
								PlayerInfo[giveplayerid][pJackSkill] = amount;
								format(string, sizeof(string), "   That players Car Jacker Skill was set to %d", amount);
								format(logstring, sizeof(logstring), "[%d/%d/%d] %s has set %s's Car Jacker Skill to %d", day, month, year, sendername, giveplayer, amount);
							}
							case 17:
							{
								PlayerInfo[giveplayerid][pDrugsSkill] = amount;
								format(string, sizeof(string), "   That players Drug Dealer Skill was set to %d", amount);
								format(logstring, sizeof(logstring), "[%d/%d/%d] %s has set %s's Drug Dealer Skill to %d", day, month, year, sendername, giveplayer, amount);
							}
							case 18:
							{
								PlayerInfo[giveplayerid][pSexSkill] = amount;
								format(string, sizeof(string), "   That players Sex Skill was set to %d", amount);
								format(logstring, sizeof(logstring), "[%d/%d/%d] %s has set %s's Sex Skill to %d", day, month, year, sendername, giveplayer, amount);
							}
							case 19:
							{
								PlayerInfo[giveplayerid][pBoxSkill] = amount;
								format(string, sizeof(string), "   That players Box Skill was set to %d", amount);
								format(logstring, sizeof(logstring), "[%d/%d/%d] %s has set %s's Box Skill to %d", day, month, year, sendername, giveplayer, amount);
							}
							case 20:
							{
								PlayerInfo[giveplayerid][pArmsSkill] = amount;
								format(string, sizeof(string), "   That players Arms Dealer Skill was set to %d", amount);
								format(logstring, sizeof(logstring), "[%d/%d/%d] %s has set %s's Arms Dealer Skill to %d", day, month, year, sendername, giveplayer, amount);
							}
							case 21:
							{
								PlayerInfo[giveplayerid][pMats] = amount;
								format(string, sizeof(string), "   That players Gun parts were set to %d", amount);
								format(logstring, sizeof(logstring), "[%d/%d/%d] %s has set %s's Gun parts to %d", day, month, year, sendername, giveplayer, amount);
							}
							case 22:
							{
								PlayerInfo[giveplayerid][pPot] = amount;
								format(string, sizeof(string), "   That players Pot was set to %d", amount);
								format(logstring, sizeof(logstring), "[%d/%d/%d] %s has set %s's Pot to %d", day, month, year, sendername, giveplayer, amount);
							}
							case 23:
							{
								PlayerInfo[giveplayerid][pCrack] = amount;
								format(string, sizeof(string), "   That players Crack was set to %d", amount);
								format(logstring, sizeof(logstring), "[%d/%d/%d] %s has set %s's Crack to %d", day, month, year, sendername, giveplayer, amount);
							}
							case 24:
							{
								PlayerInfo[giveplayerid][pFishSkill] = amount;
								format(string, sizeof(string), "   That players Fishing Skill was set to %d", amount);
								format(logstring, sizeof(logstring), "[%d/%d/%d] %s has set %s's Fishing Skill to %d", day, month, year, sendername, giveplayer, amount);
							}
							case 25:
							{
							    if(amount < 0 || amount > 17) { SendClientMessage(playerid, COLOR_GREY, "   Job can't be below 0 or above 17 !"); return 1; }
								PlayerInfo[giveplayerid][pJob] = amount;
								format(string, sizeof(string), "   That players Job was set to %d", amount);
								format(logstring, sizeof(logstring), "[%d/%d/%d] %s has set %s's Job to %d", day, month, year, sendername, giveplayer, amount);
							}
							case 26:
							{
							    if(amount < 1 || amount > 6) { SendClientMessage(playerid, COLOR_GREY, "   Rank can't be below 1 or above 6 !"); return 1; }
								PlayerInfo[giveplayerid][pRank] = amount;
								format(string, sizeof(string), "   That players Rank was set to %d", amount);
								format(logstring, sizeof(logstring), "[%d/%d/%d] %s has set %s's Rank to %d", day, month, year, sendername, giveplayer, amount);
							}
							case 27:
							{
								Packages[playerid] = amount;
								format(string, sizeof(string), "   That players Packages were set to %d", amount);
								format(logstring, sizeof(logstring), "[%d/%d/%d] %s has set %s's Gun Packages to %d", day, month, year, sendername, giveplayer, amount);
							}
							case 28:
							{
								return 1;
							}
							case 29:
							{
								PlayerInfo[giveplayerid][pSmugglerSkill] = amount;
								format(string, sizeof(string), "   That players Smuggler Skill was set to %d", amount);
								format(logstring, sizeof(logstring), "[%d/%d/%d] %s has set %s's Smuggler to %d", day, month, year, sendername, giveplayer, amount);
							}
							case 30:
							{
								format(string, sizeof(string), "   That players Car Key was set to %d", amount);
								format(logstring, sizeof(logstring), "[%d/%d/%d] %s has set %s's Car Key to %d", day, month, year, sendername, giveplayer, amount);
							}
							case 31:
							{
								PlayerInfo[giveplayerid][pWarns] = amount;
								format(string, sizeof(string), "   That players Warnings were set to %d", amount);
								format(logstring, sizeof(logstring), "[%d/%d/%d] %s has set %s's Warnings to %d", day, month, year, sendername, giveplayer, amount);
							}
							case 9999991:
							{
							    PlayerInfo[giveplayerid][pCHits] = amount;
								format(string, sizeof(string), "   That players CompletedHits was set to %d", amount);
								format(logstring, sizeof(logstring), "[%d/%d/%d] %s has set %s's CompletedHits to %d", day, month, year, sendername, giveplayer, amount);
							}
							case 9999992:
							{
							    PlayerInfo[giveplayerid][pFHits] = amount;
								format(string, sizeof(string), "   That players CompletedHits was set to %d", amount);
								format(logstring, sizeof(logstring), "[%d/%d/%d] %s has set %s's CompletedHits to %d", day, month, year, sendername, giveplayer, amount);
							}
							case 34: // Trashman
							{
								PlayerInfo[giveplayerid][pTrashSkill] = amount;
								format(string, sizeof(string), "   That players Trashman Skill was set to %d", amount);
								format(logstring, sizeof(logstring), "[%d/%d/%d] %s has set %s's Trashman Skill to %d", day, month, year, sendername, giveplayer, amount);
							}
							default:
							{
								format(string, sizeof(string), "   Invalid stat code %d !", amount);
								return 1;
							}
					}
					SendClientMessage(playerid, COLOR_GRAD1, string);
					StatLog(logstring);
				}
			}
		}
		return 1;
	}
  
	if(strcmp(cmd, "/fixwreck", true) == 0)
	{
 		if(IsPlayerConnected(playerid))
 		{
			if(PlayerInfo[playerid][pJob] == 7)
			{
	    	    //if(FixCarTimer[playerid]) return SendClientMessage(playerid,COLOR_GREY,"   Anda harus menunggu 60 detik untuk memperbaiki kendaraan apa pun !");
	    	    if(PlayerInfo[playerid][pCompo] < 18) return SendClientMessage(playerid, GREY, "[MECHANIC] Anda memerlukan minimal 18 komponen untuk memperbaiki kendaraan!");
	    	    new vehid = GetClosestCar(playerid);
	    	    new Float: health;
			    GetVehicleHealth(vehid, health);
			    if(PlayerInfo[playerid][pInjured] != 0 || IsPlayerInAnyVehicle(playerid))
				{
			  		SendClientMessage(playerid, COLOR_GREY, "   Anda tidak dapat melakukan itu di Tim ini !");
					return 1;
				}
				if(HoodOpen[vehid] == 0 && IsACar(vehid))
				{
					SendClientMessage(playerid,COLOR_GREY,"   Buka hood kendaraan terlebih dahulu !");
					return 1;
				}
				new Float:V1X, Float:V1Y, Float:V1Z;
				GetVehiclePos(vehid, V1X, V1Y, V1Z);
				if(IsPlayerInRangeOfPoint(playerid, 4, V1X, V1Y, V1Z))
				{
	    		    if(health >= 280.0 && health <= 300.0)
		    	    {
	                    GetPlayerName(playerid, sendername, sizeof(sendername));
						SetVehicleHealth(vehid, 600);
		        		PlayerPlaySound(playerid,1133,0.0,0.0,0.0);
						Wrecked[vehid] = 0;
		        		PlayerInfo[playerid][pCompo] -= 18;
		        		PlayerInfo[playerid][pMechSkill] += 5;
						format(string, sizeof(string), "* %s telah memperbaiki mesin mulai dengan menggunakan 18 komponen.", sendername);
		        		ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
		        		FixCarTimer[playerid] = 1;
		        		SetTimerEx("FixCar",60*1000,0,"i",playerid);
		    	    }
		    	    else
		    	    {
						SendClientMessage(playerid, COLOR_GREY, "[MECHANIC] Kendaraan ini tidak rusak !");
						return 1;
		    	    }
	    	    }
	    	    else
				{
					SendClientMessage(playerid,COLOR_GREY,"   Anda tidak dekat dengan kendaraan apa pun !");
					return 1;
				}
	    	}
	    	else
	    	{
	    	    SendClientMessage(playerid, COLOR_GREY, "[MECHANIC] Anda bukan mekanik !");
	    	    return 1;
	    	}
		}
		return 1;
	}
  
