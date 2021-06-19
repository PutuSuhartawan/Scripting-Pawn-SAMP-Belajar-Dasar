
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

public OnPlayerLogin(playerid,password[])
{
 	new tmp2[256];
    new string2[128];
	format(string2, sizeof(string2), "%s.ini", PlayerName(playerid));
	new File: UserFile = fopen(string2, io_read);
	if ( UserFile )
    {
        new PassData[128];
	    new keytmp[256], valtmp[256];
	    fread( UserFile , PassData , sizeof( PassData ) );
	    keytmp = ini_GetKey( PassData );
	    if( strcmp( keytmp , "Key" , true ) == 0 )
		{
			valtmp = ini_GetValue( PassData );
			strmid(PlayerInfo[playerid][pKey], valtmp, 0, strlen(valtmp)-1, 255);
		}
		if(strcmp(PlayerInfo[playerid][pKey],password, true ) == 0 )
        {
	    	new key[ 256 ] , val[ 256 ];
			new Data[ 256 ];
			while ( fread( UserFile , Data , sizeof( Data ) ) )
			{
			    key = ini_GetKey( Data );
			    if( strcmp( key , "Level" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pLevel] = strvalEx( val ); }
			    if( strcmp( key , "Energy" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pEnergy] = strvalEx( val ); }
			    if( strcmp( key , "Compo" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pCompo] = strvalEx( val ); }
			    if( strcmp( key , "IDC" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pIDC] = strvalEx( val ); }
			    if( strcmp( key , "AdminLevel" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pAdmin] = strvalEx( val ); }
			    if( strcmp( key , "Band" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pBand] = strvalEx( val ); }
				if( strcmp( key , "PermaBand" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pPermBand] = strvalEx( val ); }
			    if( strcmp( key , "Warn" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pWarns] = strvalEx( val ); }
			    if( strcmp( key , "DonateRank" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pDonateRank] = strvalEx( val ); }
			    if( strcmp( key , "DonateTime" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pDonateTime] = strvalEx( val ); }
			    if( strcmp( key , "ATMExterior" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][ATMExterior] = strvalEx( val ); }
		    	if( strcmp( key , "ATMID" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][ATMID] = strvalEx( val ); }
			    if( strcmp( key , "MAPBExterior" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][MAPBExterior] = strvalEx( val ); }
			    if( strcmp( key , "GSTATIONExterior" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][GSTATIONExterior] = strvalEx( val ); }
			    if( strcmp( key , "HSSignExterior" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][HSSignExterior] = strvalEx( val ); }
		    	if( strcmp( key , "MAPBID" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][MAPBID] = strvalEx( val ); }
		    	if( strcmp( key , "GSTATIONID" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][GSTATIONID] = strvalEx( val ); }
		    	if( strcmp( key , "HSSignID" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][HSSignID] = strvalEx( val ); }
				if( strcmp( key , "FactionBanned" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pFactionBanned] = strvalEx( val ); }
   				if( strcmp( key , "FCard" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pFcard] = strvalEx( val ); }
     			if( strcmp( key , "dExtX" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][dExtX] = floatstr( val ); }
			 	if( strcmp( key , "dExtY" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][dExtY] = floatstr( val ); }
			 	if( strcmp( key , "dExtZ" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][dExtZ] = floatstr( val ); }
			    if( strcmp( key , "GangMod" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pGangMod] = strvalEx( val ); }
      			if( strcmp( key , "Famed" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pFamed] = strvalEx( val ); }
   				if( strcmp( key , "FactionMod" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pFactionMod] = strvalEx( val ); }
			 	if( strcmp( key , "UpgradePoints" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][gPupgrade] = strvalEx( val ); }
			    if( strcmp( key , "ConnectedTime" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pConnectTime] = strvalEx( val ); }
			    if( strcmp( key , "Registered" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pReg] = strvalEx( val ); }
			    if( strcmp( key , "Body0" , true ) == 0 ) { val = ini_GetValue( Data ); pBody[playerid][0] = strvalEx( val ); }
			    if( strcmp( key , "Body1" , true ) == 0 ) { val = ini_GetValue( Data ); pBody[playerid][1] = strvalEx( val ); }
			    if( strcmp( key , "Body2" , true ) == 0 ) { val = ini_GetValue( Data ); pBody[playerid][2] = strvalEx( val ); }
			    if( strcmp( key , "Body3" , true ) == 0 ) { val = ini_GetValue( Data ); pBody[playerid][3] = strvalEx( val ); }
			    if( strcmp( key , "Body4" , true ) == 0 ) { val = ini_GetValue( Data ); pBody[playerid][4] = strvalEx( val ); }
			    if( strcmp( key , "Body5" , true ) == 0 ) { val = ini_GetValue( Data ); pBody[playerid][5] = strvalEx( val ); }
			    if( strcmp( key , "Body6" , true ) == 0 ) { val = ini_GetValue( Data ); pBody[playerid][6] = strvalEx( val ); }
			    if( strcmp( key , "Body7" , true ) == 0 ) { val = ini_GetValue( Data ); pBody[playerid][7] = strvalEx( val ); }
			    if( strcmp( key , "Body8" , true ) == 0 ) { val = ini_GetValue( Data ); pBody[playerid][8] = strvalEx( val ); }
			    if( strcmp( key , "Body9" , true ) == 0 ) { val = ini_GetValue( Data ); pBody[playerid][9] = strvalEx( val ); }
			    if( strcmp( key , "Body10" , true ) == 0 ) { val = ini_GetValue( Data ); pBody[playerid][10] = strvalEx( val ); }
			    if( strcmp( key , "Body11" , true ) == 0 ) { val = ini_GetValue( Data ); pBody[playerid][11] = strvalEx( val ); }
			    if( strcmp( key , "Body12" , true ) == 0 ) { val = ini_GetValue( Data ); pBody[playerid][12] = strvalEx( val ); }
			    if( strcmp( key , "Body13" , true ) == 0 ) { val = ini_GetValue( Data ); pBody[playerid][13] = strvalEx( val ); }
			    if( strcmp( key , "Body14" , true ) == 0 ) { val = ini_GetValue( Data ); pBody[playerid][14] = strvalEx( val ); }
			    if( strcmp( key , "Body15" , true ) == 0 ) { val = ini_GetValue( Data ); pBody[playerid][15] = strvalEx( val ); }
			    if( strcmp( key , "Body16" , true ) == 0 ) { val = ini_GetValue( Data ); pBody[playerid][16] = strvalEx( val ); }
			    if( strcmp( key , "Body17" , true ) == 0 ) { val = ini_GetValue( Data ); pBody[playerid][17] = strvalEx( val ); }
			    if( strcmp( key , "Body18" , true ) == 0 ) { val = ini_GetValue( Data ); pBody[playerid][18] = strvalEx( val ); }
				if( strcmp( key , "Fish1" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(Fishes[playerid][pFish1], val, 0, strlen(val)-1, 255); }
				if( strcmp( key , "Fish2" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(Fishes[playerid][pFish2], val, 0, strlen(val)-1, 255); }
				if( strcmp( key , "Fish3" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(Fishes[playerid][pFish3], val, 0, strlen(val)-1, 255); }
				if( strcmp( key , "Fish4" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(Fishes[playerid][pFish4], val, 0, strlen(val)-1, 255); }
				if( strcmp( key , "Fish5" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(Fishes[playerid][pFish5], val, 0, strlen(val)-1, 255); }
				if( strcmp( key , "Weight1" , true ) == 0 ) { val = ini_GetValue( Data ); Fishes[playerid][pWeight1] = strvalEx( val ); }
				if( strcmp( key , "Weight2" , true ) == 0 ) { val = ini_GetValue( Data ); Fishes[playerid][pWeight2] = strvalEx( val ); }
				if( strcmp( key , "Weight3" , true ) == 0 ) { val = ini_GetValue( Data ); Fishes[playerid][pWeight3] = strvalEx( val ); }
				if( strcmp( key , "Weight4" , true ) == 0 ) { val = ini_GetValue( Data ); Fishes[playerid][pWeight4] = strvalEx( val ); }
				if( strcmp( key , "Weight5" , true ) == 0 ) { val = ini_GetValue( Data ); Fishes[playerid][pWeight5] = strvalEx( val ); }
			    if( strcmp( key , "Sex" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pSex] = strvalEx( val ); }
			    if( strcmp( key , "House" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pPhousekey] = strvalEx( val ); }
			    if( strcmp( key , "House2" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pPhousekey2] = strvalEx( val ); }
                if( strcmp( key , "InHouse" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][InHouse] = strvalEx( val ); }
                if( strcmp( key , "InGarage" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][InGarage] = strvalEx( val ); }
                if( strcmp( key , "HouseExterior" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][HouseExterior] = strvalEx( val ); }
                if( strcmp( key , "HouseInterior" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][HouseInterior] = strvalEx( val ); }
                if( strcmp( key , "hIntID" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][hIntID] = strvalEx( val ); }
                if( strcmp( key , "CarTime" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pCarTime] = strvalEx( val ); }
                if( strcmp( key , "hExtID" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][hExtID] = strvalEx( val ); }
			 	if( strcmp( key , "hExtX" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][hExtX] = floatstr( val ); }
			 	if( strcmp( key , "hExtY" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][hExtY] = floatstr( val ); }
			 	if( strcmp( key , "hExtZ" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][hExtZ] = floatstr( val ); }
			 	if( strcmp( key , "hIntX" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][hIntX] = floatstr( val ); }
			 	if( strcmp( key , "hIntY" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][hIntY] = floatstr( val ); }
			 	if( strcmp( key , "hIntZ" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][hIntZ] = floatstr( val ); }
			 	if( strcmp( key , "Inbuilding" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Inbuilding] = strvalEx( val ); }
    			if( strcmp( key , "buildingExterior" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][buildingExterior] = strvalEx( val ); }
                if( strcmp( key , "buildingInterior" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][buildingInterior] = strvalEx( val ); }
                if( strcmp( key , "cIntID" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][cIntID] = strvalEx( val ); }
                if( strcmp( key , "cIntID" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][cIntID] = strvalEx( val ); }
			 	if( strcmp( key , "cExtX" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][cExtX] = floatstr( val ); }
			 	if( strcmp( key , "cExtY" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][cExtY] = floatstr( val ); }
			 	if( strcmp( key , "cExtZ" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][cExtZ] = floatstr( val ); }
			 	if( strcmp( key , "Inmotel" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Inmotel] = strvalEx( val ); }
			 	if( strcmp( key , "motelExterior" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][motelExterior] = strvalEx( val ); }
                if( strcmp( key , "motelInterior" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][motelInterior] = strvalEx( val ); }
                if( strcmp( key , "mIntID" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][mIntID] = strvalEx( val ); }
                if( strcmp( key , "mIntID" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][mIntID] = strvalEx( val ); }
			 	if( strcmp( key , "mExtX" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][mExtX] = floatstr( val ); }
			 	if( strcmp( key , "mExtY" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][mExtY] = floatstr( val ); }
			 	if( strcmp( key , "mExtZ" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][mExtZ] = floatstr( val ); }
			 	if( strcmp( key , "mIntX" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][mIntX] = floatstr( val ); }
			 	if( strcmp( key , "mIntY" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][mIntY] = floatstr( val ); }
			 	if( strcmp( key , "mIntZ" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][mIntZ] = floatstr( val ); }
			 	if( strcmp( key , "cIntX" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][cIntX] = floatstr( val ); }
			 	if( strcmp( key , "cIntY" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][cIntY] = floatstr( val ); }
			 	if( strcmp( key , "cIntZ" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][cIntZ] = floatstr( val ); }
			 	if( strcmp( key , "ItemSlot1" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][ItemSlot1] = strvalEx( val ); }
			 	if( strcmp( key , "ItemHide1" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][ItemHide1] = strvalEx( val ); }
			 	if( strcmp( key , "ItemColor" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][ItemColor] = strvalEx( val ); }
			 	if( strcmp( key , "ItemID" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][ItemID] = strvalEx( val ); }
			 	if( strcmp( key , "ItemBone" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][ItemBone] = strvalEx( val ); }
			 	if( strcmp( key , "ItemOffsetX" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][ItemOffsetX] = floatstr( val ); }
			 	if( strcmp( key , "ItemOffsetY" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][ItemOffsetY] = floatstr( val ); }
			 	if( strcmp( key , "ItemOffsetZ" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][ItemOffsetZ] = floatstr( val ); }
			 	if( strcmp( key , "ItemRotX" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][ItemRotX] = floatstr( val ); }
			 	if( strcmp( key , "ItemRotY" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][ItemRotY] = floatstr( val ); }
			 	if( strcmp( key , "ItemRotZ" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][ItemRotZ] = floatstr( val ); }
			 	if( strcmp( key , "ItemScaleX" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][ItemScaleX] = floatstr( val ); }
			 	if( strcmp( key , "ItemScaleY" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][ItemScaleY] = floatstr( val ); }
			 	if( strcmp( key , "ItemScaleZ" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][ItemScaleZ] = floatstr( val ); }
			 	if( strcmp( key , "ItemSlot2" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][ItemSlot2] = strvalEx( val ); }
			 	if( strcmp( key , "ItemHide2" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][ItemHide2] = strvalEx( val ); }
			 	if( strcmp( key , "Item2Color" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item2Color] = strvalEx( val ); }
			 	if( strcmp( key , "Item2ID" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item2ID] = strvalEx( val ); }
			 	if( strcmp( key , "Item2Bone" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item2Bone] = strvalEx( val ); }
			 	if( strcmp( key , "Item2OffsetX" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item2OffsetX] = floatstr( val ); }
			 	if( strcmp( key , "Item2OffsetY" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item2OffsetY] = floatstr( val ); }
			 	if( strcmp( key , "Item2OffsetZ" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item2OffsetZ] = floatstr( val ); }
			 	if( strcmp( key , "Item2RotX" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item2RotX] = floatstr( val ); }
			 	if( strcmp( key , "Item2RotY" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item2RotY] = floatstr( val ); }
			 	if( strcmp( key , "Item2RotZ" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item2RotZ] = floatstr( val ); }
			 	if( strcmp( key , "Item2ScaleX" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item2ScaleX] = floatstr( val ); }
			 	if( strcmp( key , "Item2ScaleY" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item2ScaleY] = floatstr( val ); }
			 	if( strcmp( key , "Item2ScaleZ" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item2ScaleZ] = floatstr( val ); }
			 	if( strcmp( key , "ItemSlot3" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][ItemSlot3] = strvalEx( val ); }
			 	if( strcmp( key , "ItemHide3" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][ItemHide3] = strvalEx( val ); }
			 	if( strcmp( key , "Item3Color" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item3Color] = strvalEx( val ); }
			 	if( strcmp( key , "Item3ID" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item3ID] = strvalEx( val ); }
			 	if( strcmp( key , "Item3Bone" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item3Bone] = strvalEx( val ); }
			 	if( strcmp( key , "Item3OffsetX" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item3OffsetX] = floatstr( val ); }
			 	if( strcmp( key , "Item3OffsetY" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item3OffsetY] = floatstr( val ); }
			 	if( strcmp( key , "Item3OffsetZ" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item3OffsetZ] = floatstr( val ); }
			 	if( strcmp( key , "Item3RotX" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item3RotX] = floatstr( val ); }
			 	if( strcmp( key , "Item3RotY" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item3RotY] = floatstr( val ); }
			 	if( strcmp( key , "Item3RotZ" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item3RotZ] = floatstr( val ); }
			 	if( strcmp( key , "Item3ScaleX" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item3ScaleX] = floatstr( val ); }
			 	if( strcmp( key , "Item3ScaleY" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item3ScaleY] = floatstr( val ); }
			 	if( strcmp( key , "Item3ScaleZ" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item3ScaleZ] = floatstr( val ); }
			 	if( strcmp( key , "ItemSlot4" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][ItemSlot4] = strvalEx( val ); }
			 	if( strcmp( key , "ItemHide4" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][ItemHide4] = strvalEx( val ); }
			 	if( strcmp( key , "Item4Color" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item4Color] = strvalEx( val ); }
			 	if( strcmp( key , "Item4ID" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item4ID] = strvalEx( val ); }
			 	if( strcmp( key , "Item4Bone" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item4Bone] = strvalEx( val ); }
			 	if( strcmp( key , "Item4OffsetX" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item4OffsetX] = floatstr( val ); }
			 	if( strcmp( key , "Item4OffsetY" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item4OffsetY] = floatstr( val ); }
			 	if( strcmp( key , "Item4OffsetZ" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item4OffsetZ] = floatstr( val ); }
			 	if( strcmp( key , "Item4RotX" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item4RotX] = floatstr( val ); }
			 	if( strcmp( key , "Item4RotY" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item4RotY] = floatstr( val ); }
			 	if( strcmp( key , "Item4RotZ" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item4RotZ] = floatstr( val ); }
			 	if( strcmp( key , "Item4ScaleX" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item4ScaleX] = floatstr( val ); }
			 	if( strcmp( key , "Item4ScaleY" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item4ScaleY] = floatstr( val ); }
			 	if( strcmp( key , "Item4ScaleZ" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item4ScaleZ] = floatstr( val ); }
			 	if( strcmp( key , "ItemSlot5" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][ItemSlot5] = strvalEx( val ); }
			 	if( strcmp( key , "ItemHide5" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][ItemHide5] = strvalEx( val ); }
			 	if( strcmp( key , "Item5Color" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item5Color] = strvalEx( val ); }
			 	if( strcmp( key , "Item5ID" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item5ID] = strvalEx( val ); }
			 	if( strcmp( key , "Item5Bone" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item5Bone] = strvalEx( val ); }
			 	if( strcmp( key , "Item5OffsetX" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item5OffsetX] = floatstr( val ); }
			 	if( strcmp( key , "Item5OffsetY" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item5OffsetY] = floatstr( val ); }
			 	if( strcmp( key , "Item5OffsetZ" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item5OffsetZ] = floatstr( val ); }
			 	if( strcmp( key , "Item5RotX" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item5RotX] = floatstr( val ); }
			 	if( strcmp( key , "Item5RotY" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item5RotY] = floatstr( val ); }
			 	if( strcmp( key , "Item5RotZ" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item5RotZ] = floatstr( val ); }
			 	if( strcmp( key , "Item5ScaleX" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item5ScaleX] = floatstr( val ); }
			 	if( strcmp( key , "Item5ScaleY" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item5ScaleY] = floatstr( val ); }
			 	if( strcmp( key , "Item5ScaleZ" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][Item5ScaleZ] = floatstr( val ); }
			 	if( strcmp( key , "TrashSkill" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pTrashSkill] = strvalEx( val ); } // Trashman
				if( strcmp( key , "Debarrel" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pDebarrel] = strvalEx( val ); }
     			if( strcmp( key , "AKbarrel" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pAKbarrel] = strvalEx( val ); }
     			if( strcmp( key , "CSGbarrel" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pCSGbarrel] = strvalEx( val ); }
				if( strcmp( key , "Destock" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pDestock] = strvalEx( val ); }
     			if( strcmp( key , "AKstock" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pAKstock] = strvalEx( val ); }
     			if( strcmp( key , "CSGstock" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pCSGstock] = strvalEx( val ); }
			 	////////////////Vehicle 1
				if( strcmp( key , "PlayerVehicleModel1" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicleModel1] = strval( val ); }
				if( strcmp( key , "PlayerVehicleFacing1" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicleFacing1] = floatstr( val ); }
				if( strcmp( key , "PlayerVehicle1Color" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pPlayerVehicle1Color] = strval( val ); }
				if( strcmp( key , "PlayerVehicle1Color2" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pPlayerVehicle1Color2] = strval( val ); }
				if( strcmp( key , "PlayerVehiclePosX1" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehiclePosX1] = floatstr( val ); }
				if( strcmp( key , "PlayerVehiclePosY1" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehiclePosY1] = floatstr( val ); }
				if( strcmp( key , "PlayerVehiclePosZ1" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehiclePosZ1] = floatstr( val ); }
				if( strcmp( key , "PlayerVehicle1PaintJob" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle1PaintJob] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle1ModSlot0" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle1ModSlot0] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle1ModSlot1" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle1ModSlot1] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle1ModSlot2" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle1ModSlot2] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle1ModSlot3" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle1ModSlot3] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle1ModSlot4" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle1ModSlot4] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle1ModSlot5" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle1ModSlot5] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle1ModSlot6" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle1ModSlot6] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle1ModSlot7" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle1ModSlot7] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle1ModSlot8" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle1ModSlot8] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle1ModSlot9" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle1ModSlot9] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle1ModSlot10" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle1ModSlot10] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle1ModSlot11" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle1ModSlot11] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle1ModSlot12" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle1ModSlot12] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle1ModSlot13" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle1ModSlot13] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle1ModNeon" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle1ModNeon] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle1Tire" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle1Tire] = strvalEx( val );  }
				if( strcmp( key , "PlayerVehicle1Upgraded" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle1Upgraded] = strvalEx( val );  }
				if( strcmp( key , "PlayerVehicle1Trunk" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle1Trunk] = strvalEx( val );  }
				if( strcmp( key , "PlayerVehicle1Trunk2" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle1Trunk2] = strvalEx( val );  }
				if( strcmp( key , "PlayerVehicle1Trunk3" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle1Trunk3] = strvalEx( val );  }
				if( strcmp( key , "PlayerVehicle1Trunk4" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle1Trunk4] = strvalEx( val );  }
				if( strcmp( key , "PlayerVehicle1Trunk5" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle1Trunk5] = strvalEx( val );  } 
				if( strcmp( key , "PlayerVehicle1Goods" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle1Goods] = strvalEx( val );  }
				if( strcmp( key , "PlayerVehicle1Fuel" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle1Fuel] = strvalEx( val );  }
				if( strcmp( key , "PlayerVehicle1Plate" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[playerid][PlayerVehicle1Plate], val, 0, strlen(val)-1, 255); }
				if( strcmp( key , "PlayerVehicle1Health" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle1Health] = floatstr( val ); }
			 	if( strcmp( key , "VehLock1" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pVehLock1] = strvalEx( val ); }
			 	if( strcmp( key , "VehLocked1" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pVehLocked1] = strvalEx( val ); }
			 	if( strcmp( key , "PlayerVehicle1VirWorld" , true) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle1VirWorld] = strvalEx( val ); }
			 	if( strcmp( key , "PlayerVehicle1Interior" , true) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle1Interior] = strvalEx( val ); }
///////////////Vehicle 2
				if( strcmp( key , "PlayerVehicleModel2" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicleModel2] = strval( val ); }
				if( strcmp( key , "PlayerVehicleFacing2" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicleFacing2] = floatstr( val ); }
				if( strcmp( key , "PlayerVehicle2Color" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pPlayerVehicle2Color] = strval( val ); }
				if( strcmp( key , "PlayerVehicle2Color2" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pPlayerVehicle2Color2] = strval( val ); }
				if( strcmp( key , "PlayerVehiclePosX2" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehiclePosX2] = floatstr( val ); }
				if( strcmp( key , "PlayerVehiclePosY2" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehiclePosY2] = floatstr( val ); }
				if( strcmp( key , "PlayerVehiclePosZ2" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehiclePosZ2] = floatstr( val ); }
				if( strcmp( key , "PlayerVehicle2PaintJob" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle2PaintJob] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle2ModSlot0" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle2ModSlot0] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle2ModSlot1" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle2ModSlot1] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle2ModSlot2" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle2ModSlot2] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle2ModSlot3" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle2ModSlot3] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle2ModSlot4" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle2ModSlot4] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle2ModSlot5" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle2ModSlot5] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle2ModSlot6" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle2ModSlot6] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle2ModSlot7" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle2ModSlot7] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle2ModSlot8" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle2ModSlot8] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle2ModSlot9" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle2ModSlot9] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle2ModSlot10" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle2ModSlot10] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle2ModSlot11" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle2ModSlot11] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle2ModSlot12" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle2ModSlot12] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle2ModSlot13" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle2ModSlot13] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle2ModNeon" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle2ModNeon] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle2Tire" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle2Tire] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle2Upgraded" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle2Upgraded] = strvalEx( val );  }
				if( strcmp( key , "PlayerVehicle2Trunk" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle2Trunk] = strvalEx( val );  }
				if( strcmp( key , "PlayerVehicle2Trunk2" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle2Trunk2] = strvalEx( val );  }
				if( strcmp( key , "PlayerVehicle2Trunk3" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle2Trunk3] = strvalEx( val );  }
				if( strcmp( key , "PlayerVehicle2Trunk4" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle2Trunk4] = strvalEx( val );  }
				if( strcmp( key , "PlayerVehicle2Trunk5" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle2Trunk5] = strvalEx( val );  }
				if( strcmp( key , "PlayerVehicle2Goods" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle2Goods] = strvalEx( val );  }
				if( strcmp( key , "PlayerVehicle2Fuel" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle2Fuel] = strvalEx( val );  }
				if( strcmp( key , "PlayerVehicle2Plate" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[playerid][PlayerVehicle2Plate], val, 0, strlen(val)-1, 255); }
				if( strcmp( key , "PlayerVehicle2Health" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle2Health] = floatstr( val ); }
			 	if( strcmp( key , "VehLock2" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pVehLock2] = strvalEx( val ); }
			 	if( strcmp( key , "VehLocked2" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pVehLocked2] = strvalEx( val ); }
                if( strcmp( key , "PlayerVehicle2VirWorld" , true) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle2VirWorld] = strvalEx( val ); }
			 	if( strcmp( key , "PlayerVehicle2Interior" , true) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle2Interior] = strvalEx( val ); }
///////////////Vehicle 3
				if( strcmp( key , "PlayerVehicleModel3" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicleModel3] = strval( val ); }
				if( strcmp( key , "PlayerVehicleFacing3" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicleFacing3] = floatstr( val ); }
				if( strcmp( key , "PlayerVehicle3Color" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pPlayerVehicle3Color] = strval( val ); }
				if( strcmp( key , "PlayerVehicle3Color2" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pPlayerVehicle3Color2] = strval( val ); }
				if( strcmp( key , "PlayerVehiclePosX3" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehiclePosX3] = floatstr( val ); }
				if( strcmp( key , "PlayerVehiclePosY3" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehiclePosY3] = floatstr( val ); }
				if( strcmp( key , "PlayerVehiclePosZ3" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehiclePosZ3] = floatstr( val ); }
				if( strcmp( key , "PlayerVehicle3PaintJob" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle3PaintJob] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle3ModSlot0" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle3ModSlot0] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle3ModSlot1" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle3ModSlot1] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle3ModSlot2" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle3ModSlot2] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle3ModSlot3" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle3ModSlot3] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle3ModSlot4" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle3ModSlot4] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle3ModSlot5" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle3ModSlot5] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle3ModSlot6" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle3ModSlot6] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle3ModSlot7" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle3ModSlot7] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle3ModSlot8" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle3ModSlot8] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle3ModSlot9" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle3ModSlot9] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle3ModSlot10" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle3ModSlot10] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle3ModSlot11" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle3ModSlot11] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle3ModSlot12" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle3ModSlot12] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle3ModSlot13" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle3ModSlot13] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle3ModNeon" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle3ModNeon] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle3Tire" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle3Tire] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle3Upgraded" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle3Upgraded] = strvalEx( val );  }
				if( strcmp( key , "PlayerVehicle3Trunk" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle3Trunk] = strvalEx( val );  }
				if( strcmp( key , "PlayerVehicle3Trunk2" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle3Trunk2] = strvalEx( val );  }
				if( strcmp( key , "PlayerVehicle3Trunk3" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle3Trunk3] = strvalEx( val );  }
				if( strcmp( key , "PlayerVehicle3Trunk4" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle3Trunk4] = strvalEx( val );  }
				if( strcmp( key , "PlayerVehicle3Trunk5" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle3Trunk5] = strvalEx( val );  }
				if( strcmp( key , "PlayerVehicle3Goods" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle3Goods] = strvalEx( val );  }
				if( strcmp( key , "PlayerVehicle3Fuel" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle3Fuel] = strvalEx( val );  }
				if( strcmp( key , "PlayerVehicle3Plate" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[playerid][PlayerVehicle3Plate], val, 0, strlen(val)-1, 255); }
				if( strcmp( key , "PlayerVehicle3Health" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle3Health] = floatstr( val ); }
			 	if( strcmp( key , "VehLock3" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pVehLock3] = strvalEx( val ); }
			 	if( strcmp( key , "VehLocked3" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pVehLocked3] = strvalEx( val ); }
			 	if( strcmp( key , "PlayerVehicle3VirWorld" , true) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle3VirWorld] = strvalEx( val ); }
			 	if( strcmp( key , "PlayerVehicle3Interior" , true) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle3Interior] = strvalEx( val ); }
///////////////Vehicle 4
				if( strcmp( key , "PlayerVehicleModel4" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicleModel4] = strval( val ); }
				if( strcmp( key , "PlayerVehicleFacing4" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicleFacing4] = floatstr( val ); }
				if( strcmp( key , "PlayerVehicle4Color" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pPlayerVehicle4Color] = strval( val ); }
				if( strcmp( key , "PlayerVehicle4Color2" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pPlayerVehicle4Color2] = strval( val ); }
				if( strcmp( key , "PlayerVehiclePosX4" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehiclePosX4] = floatstr( val ); }
				if( strcmp( key , "PlayerVehiclePosY4" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehiclePosY4] = floatstr( val ); }
				if( strcmp( key , "PlayerVehiclePosZ4" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehiclePosZ4] = floatstr( val ); }
				if( strcmp( key , "PlayerVehicle4PaintJob" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle4PaintJob] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle4ModSlot0" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle4ModSlot0] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle4ModSlot1" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle4ModSlot1] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle4ModSlot2" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle4ModSlot2] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle4ModSlot3" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle4ModSlot3] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle4ModSlot4" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle4ModSlot4] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle4ModSlot5" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle4ModSlot5] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle4ModSlot6" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle4ModSlot6] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle4ModSlot7" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle4ModSlot7] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle4ModSlot8" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle4ModSlot8] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle4ModSlot9" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle4ModSlot9] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle4ModSlot10" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle4ModSlot10] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle4ModSlot11" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle4ModSlot11] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle4ModSlot12" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle4ModSlot12] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle4ModSlot13" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle4ModSlot13] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle4ModNeon" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle4ModNeon] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle4Tire" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle4Tire] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle4Upgraded" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle4Upgraded] = strvalEx( val );  }
				if( strcmp( key , "PlayerVehicle4Trunk" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle4Trunk] = strvalEx( val );  }
				if( strcmp( key , "PlayerVehicle4Trunk2" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle4Trunk2] = strvalEx( val );  }
				if( strcmp( key , "PlayerVehicle4Trunk3" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle4Trunk3] = strvalEx( val );  }
				if( strcmp( key , "PlayerVehicle4Trunk4" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle4Trunk4] = strvalEx( val );  }
				if( strcmp( key , "PlayerVehicle4Trunk5" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle4Trunk5] = strvalEx( val );  }
				if( strcmp( key , "PlayerVehicle4Goods" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle4Goods] = strvalEx( val );  }
				if( strcmp( key , "PlayerVehicle4Fuel" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle4Fuel] = strvalEx( val );  }
				if( strcmp( key , "PlayerVehicle4Plate" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[playerid][PlayerVehicle4Plate], val, 0, strlen(val)-1, 255); }
				if( strcmp( key , "PlayerVehicle4Health" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle4Health] = floatstr( val ); }
			 	if( strcmp( key , "VehLock4" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pVehLock4] = strvalEx( val ); }
			 	if( strcmp( key , "VehLocked4" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pVehLocked4] = strvalEx( val ); }
			 	if( strcmp( key , "PlayerVehicle4VirWorld" , true) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle4VirWorld] = strvalEx( val ); }
			 	if( strcmp( key , "PlayerVehicle4Interior" , true) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle4Interior] = strvalEx( val ); }
///////////////Vehicle 5
				if( strcmp( key , "PlayerVehicleModel5" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicleModel5] = strval( val ); }
				if( strcmp( key , "PlayerVehicleFacing5" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicleFacing5] = floatstr( val ); }
				if( strcmp( key , "PlayerVehicle5Color" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pPlayerVehicle5Color] = strval( val ); }
				if( strcmp( key , "PlayerVehicle5Color2" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pPlayerVehicle5Color2] = strval( val ); }
				if( strcmp( key , "PlayerVehiclePosX5" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehiclePosX5] = floatstr( val ); }
				if( strcmp( key , "PlayerVehiclePosY5" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehiclePosY5] = floatstr( val ); }
				if( strcmp( key , "PlayerVehiclePosZ5" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehiclePosZ5] = floatstr( val ); }
				if( strcmp( key , "PlayerVehicle5PaintJob" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle5PaintJob] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle5ModSlot0" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle5ModSlot0] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle5ModSlot1" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle5ModSlot1] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle5ModSlot2" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle5ModSlot2] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle5ModSlot3" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle5ModSlot3] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle5ModSlot4" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle5ModSlot4] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle5ModSlot5" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle5ModSlot5] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle5ModSlot6" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle5ModSlot6] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle5ModSlot7" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle5ModSlot7] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle5ModSlot8" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle5ModSlot8] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle5ModSlot9" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle5ModSlot9] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle5ModSlot10" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle5ModSlot10] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle5ModSlot11" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle5ModSlot11] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle5ModSlot12" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle5ModSlot12] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle5ModSlot13" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle5ModSlot13] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle5ModNeon" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle5ModNeon] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle5Tire" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle5Tire] = strvalEx( val ); }
				if( strcmp( key , "PlayerVehicle5Upgraded" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle5Upgraded] = strvalEx( val );  }
				if( strcmp( key , "PlayerVehicle5Trunk" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle5Trunk] = strvalEx( val );  }
				if( strcmp( key , "PlayerVehicle5Trunk2" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle5Trunk2] = strvalEx( val );  }
				if( strcmp( key , "PlayerVehicle5Trunk3" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle5Trunk3] = strvalEx( val );  }
				if( strcmp( key , "PlayerVehicle5Trunk4" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle5Trunk4] = strvalEx( val );  }
				if( strcmp( key , "PlayerVehicle5Trunk5" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle5Trunk5] = strvalEx( val );  }
				if( strcmp( key , "PlayerVehicle5Goods" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle5Goods] = strvalEx( val );  }
				if( strcmp( key , "PlayerVehicle5Fuel" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle5Fuel] = strvalEx( val );  }
				if( strcmp( key , "PlayerVehicle5Plate" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[playerid][PlayerVehicle5Plate], val, 0, strlen(val)-1, 255); }
				if( strcmp( key , "PlayerVehicle5Health" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle5Health] = floatstr( val ); }
			 	if( strcmp( key , "VehLock5" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pVehLock5] = strvalEx( val ); }
			 	if( strcmp( key , "VehLocked5" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pVehLocked5] = strvalEx( val ); }
			 	if( strcmp( key , "PlayerVehicle5VirWorld" , true) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle5VirWorld] = strvalEx( val ); }
			 	if( strcmp( key , "PlayerVehicle5Interior" , true) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][PlayerVehicle5Interior] = strvalEx( val ); }
///////////////
			  	if( strcmp( key , "Age" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pAge] = strvalEx( val ); }
			  	if( strcmp( key , "PIN" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pPIN] = strvalEx( val ); }
			  	if( strcmp( key , "RPBoost" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pRPBoost] = strvalEx( val ); }
			   	if( strcmp( key , "Origin" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pOrigin] = strvalEx( val ); }
			   	if( strcmp( key , "Muted" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pMuted] = strvalEx( val ); }
		        if( strcmp( key , "Respect" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pExp] = strvalEx( val ); }
		        if( strcmp( key , "Money" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pCash] = strvalEx( val ); }
	            if( strcmp( key , "CasinoWinnings" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pCasinoWinnings] = strvalEx( val ); }
		        if( strcmp( key , "Bank" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pAccount] = strvalEx( val ); }
		        if( strcmp( key , "Crimes" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pCrimes] = strvalEx( val ); }
		        if( strcmp( key , "Accent" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(Accent[playerid], val, 0, strlen(val)-1, 255); }
		        if( strcmp( key , "Kills" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pKills] = strvalEx( val ); }
				if( strcmp( key , "Deaths" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pDeaths] = strvalEx( val ); }
	            if( strcmp( key , "CHits" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pCHits] = strvalEx( val ); }
				if( strcmp( key , "FHits" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pFHits] = strvalEx( val ); }
	            if( strcmp( key , "Arrested" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pArrested] = strvalEx( val ); }
     			if( strcmp( key , "Painkiller" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pPainkiller] = strvalEx( val ); }
     			if( strcmp( key , "PainEffect" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pPainEffect] = strvalEx( val ); }
     			if( strcmp( key , "BoomBox" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pBoomBox] = strvalEx( val ); }
			  	if( strcmp( key , "LottoNr" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pLottoNr] = strvalEx( val ); }
				if( strcmp( key , "BiggestFish" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pBiggestFish] = strvalEx( val ); }
	            if( strcmp( key , "Job" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pJob] = strvalEx( val ); }
	            if( strcmp( key , "JobDelay" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pJobdelay] = strvalEx( val ); }
	            if( strcmp( key , "JobTime" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pJobtime] = strvalEx( val ); }
                if( strcmp( key , "Job2" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pJob2] = strval( val ); }
				if( strcmp( key , "Hadchecks" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pHadChecks] = strvalEx( val ); }
				if( strcmp( key , "HeadValue" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pHeadValue] = strvalEx( val ); }
				if( strcmp( key , "BHHeadValue" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pBHHeadValue] = strvalEx( val ); }
	            if( strcmp( key , "Jailed" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pJailed] = strvalEx( val ); }
				if( strcmp( key , "JailTime" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pJailTime] = strvalEx( val ); }
				if( strcmp( key , "Gun parts" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pMats] = strvalEx( val ); }
				if( strcmp( key , "Pot" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pPot] = strvalEx( val ); }
	            if( strcmp( key , "Crack" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pCrack] = strvalEx( val ); }
				if( strcmp( key , "Leader" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pLeader] = strvalEx( val ); }
				if( strcmp( key , "Member" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pMember] = strvalEx( val ); }
				if( strcmp( key , "FMember" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pFMember] = strvalEx( val ); }
	            if( strcmp( key , "Rank" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pRank] = strvalEx( val ); }
 				if( strcmp( key , "Bizz" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pPbiskey] = strvalEx( val ); }
 				if( strcmp( key , "Bizz2" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pPbiskey2] = strvalEx( val ); }
 				if( strcmp( key , "Garage" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pGarageKey] = strvalEx( val ); }
 				if( strcmp( key , "GarageII" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pGarageKey2] = strvalEx( val ); }
 				if( strcmp( key , "GateKey" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pGateKey] = strvalEx( val ); }
 				if( strcmp( key , "GateKeyIA" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pGateKey2] = strvalEx( val ); }
 				if( strcmp( key , "GateKeyIB" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pGateKey3] = strvalEx( val ); }
 				if( strcmp( key , "GateKeyIC" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pGateKey4] = strvalEx( val ); }
 				if( strcmp( key , "GateKeyID" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pGateKey5] = strvalEx( val ); }
 				if( strcmp( key , "GateKeyIE" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pGateKey6] = strvalEx( val ); }
 				if( strcmp( key , "GateKeyIF" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pGateKey7] = strvalEx( val ); }
 				if( strcmp( key , "GateKeyIG" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pGateKey8] = strvalEx( val ); }
 				if( strcmp( key , "GateKeyIH" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pGateKey9] = strvalEx( val ); }
 				if( strcmp( key , "GateKeyII" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pGateKey10] = strvalEx( val ); }
				if( strcmp( key , "InBusiness" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][InBusiness] = strvalEx( val ); }
    			if( strcmp( key , "BusinessExterior" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][BusinessExterior] = strvalEx( val ); }
                if( strcmp( key , "BusinessInterior" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][BusinessInterior] = strvalEx( val ); }
                if( strcmp( key , "bIntID" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][bIntID] = strvalEx( val ); }
                if( strcmp( key , "bIntID" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][bIntID] = strvalEx( val ); }
			 	if( strcmp( key , "bExtX" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][bExtX] = floatstr( val ); }
			 	if( strcmp( key , "bExtY" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][bExtY] = floatstr( val ); }
			 	if( strcmp( key , "bExtZ" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][bExtZ] = floatstr( val ); }
			 	if( strcmp( key , "bIntX" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][bIntX] = floatstr( val ); }
			 	if( strcmp( key , "bIntY" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][bIntY] = floatstr( val ); }
			 	if( strcmp( key , "bIntZ" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][bIntZ] = floatstr( val ); }
	            if( strcmp( key , "DetSkill" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pDetSkill] = strvalEx( val ); }
				if( strcmp( key , "SexSkill" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pSexSkill] = strvalEx( val ); }
				if( strcmp( key , "BoxSkill" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pBoxSkill] = strvalEx( val ); }
				if( strcmp( key , "LawSkill" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pLawSkill] = strvalEx( val ); }
				if( strcmp( key , "MechSkill" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pMechSkill] = strvalEx( val ); }
				if( strcmp( key , "JackSkill" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pJackSkill] = strvalEx( val ); }
				if( strcmp( key , "CarSkill" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pCarSkill] = strvalEx( val ); }
				if( strcmp( key , "NewsSkill" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pNewsSkill] = strvalEx( val ); }
				if( strcmp( key , "DrugsSkill" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pDrugsSkill] = strvalEx( val ); }
				if( strcmp( key , "ArmsSkill" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pArmsSkill] = strvalEx( val ); }
	            if( strcmp( key , "SmugglerSkill" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pSmugglerSkill] = strvalEx( val ); }
	            if( strcmp( key , "FishSkill" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pFishSkill] = strvalEx( val ); }
	            if( strcmp( key , "FightingStyle" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pFightingStyle] = strvalEx( val ); }
                if( strcmp( key , "pHealth" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pHealth] = floatstr( val ); }
				if( strcmp( key , "pArmor" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pArmor] = floatstr( val ); }
	            if( strcmp( key , "Int" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pInt] = strvalEx( val ); }
				if( strcmp( key , "Local" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pLocal] = strvalEx( val ); }
				if( strcmp( key , "VirtualWorld" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pVirtualWorld] = strvalEx( val ); }
	            if( strcmp( key , "Model" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pModel] = strvalEx( val ); }
	            if( strcmp( key , "OldModel" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pOldModel] = strvalEx( val ); }
            	if( strcmp( key , "Tikis" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pTikis] = strvalEx( val ); }
				if( strcmp( key , "PhoneNr" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pPnumber] = strvalEx( val ); }
				if( strcmp( key , "PhoneCr" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pPcredit] = strvalEx( val ); }
             	if( strcmp( key , "Apartment" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pPaptkey] = strvalEx( val ); }
             	if( strcmp( key , "ATMcard" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pATMcard] = strvalEx( val ); }
	            if( strcmp( key , "CarLic" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pCarLic] = strvalEx( val ); }
				if( strcmp( key , "FlyLic" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pFlyLic] = strvalEx( val ); }
				if( strcmp( key , "BoatLic" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pBoatLic] = strvalEx( val ); }
				if( strcmp( key , "TruckLic" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pTruckLic] = strvalEx( val ); }
				if( strcmp( key , "GunLic" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pGunLic] = strvalEx( val ); }
				if( strcmp( key , "Sache" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pSache] = strvalEx( val ); }
	            if( strcmp( key , "Gun0" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pGun0] = strvalEx( val ); }
				if( strcmp( key , "Gun1" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pGun1] = strvalEx( val ); }
				if( strcmp( key , "Gun2" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pGun2] = strvalEx( val ); }
				if( strcmp( key , "Gun3" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pGun3] = strvalEx( val ); }
			  	if( strcmp( key , "Gun4" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pGun4] = strvalEx( val ); }
				if( strcmp( key , "Gun5" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pGun5] = strvalEx( val ); }
				if( strcmp( key , "Gun6" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pGun6] = strvalEx( val ); }
				if( strcmp( key , "Gun7" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pGun7] = strvalEx( val ); }
				if( strcmp( key , "Gun8" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pGun8] = strvalEx( val ); }
				if( strcmp( key , "Gun9" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pGun9] = strvalEx( val ); }
			  	if( strcmp( key , "Gun10" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pGun10] = strvalEx( val ); }
			  	if( strcmp( key , "Gun11" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pGun11] = strvalEx( val ); }
			 	if( strcmp( key , "Gun12" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pGun12] = strvalEx( val ); }
	            if( strcmp( key , "CarTime" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pCarTime] = strvalEx( val ); }
				if( strcmp( key , "DrugsTime" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pDrugsTime] = strvalEx( val ); }
				if( strcmp( key , "LawyerTime" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pLawyerTime] = strvalEx( val ); }
				if( strcmp( key , "LawyerFreeTime" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pLawyerFreeTime] = strvalEx( val ); }
				if( strcmp( key , "MechTime" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pMechTime] = strvalEx( val ); }
				if( strcmp( key , "SexTime" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pSexTime] = strvalEx( val ); }
	            if( strcmp( key , "PayDay" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pPayDay] = strvalEx( val ); }
				if( strcmp( key , "PayDayHad" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pPayDayHad] = strvalEx( val ); }
				if( strcmp( key , "CDPlayer" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pCDPlayer] = strvalEx( val ); }
	            if( strcmp( key , "Dice" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pDice] = strvalEx( val ); }
				if( strcmp( key , "Screw" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pScrew] = strvalEx( val ); }
				if( strcmp( key , "Rope" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pRope] = strvalEx( val ); }
				if( strcmp( key , "Demagazine" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pDemagazine] = strvalEx( val ); }
				if( strcmp( key , "CSGmagazine" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pCSGmagazine] = strvalEx( val ); }
				if( strcmp( key , "AKmazagine" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pAKmagazine] = strvalEx( val ); }
				if( strcmp( key , "Snack" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pSnack] = strvalEx( val ); }
				if( strcmp( key , "GoldCoin" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pGoldCoin] = strvalEx( val ); }
				if( strcmp( key , "Bandage" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pBandage] = strvalEx( val ); }
				if( strcmp( key , "BandageEffect" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pBandageEffect] = strvalEx( val ); }
    			if( strcmp( key , "WT" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pWT] = strvalEx( val ); }
                if( strcmp( key , "WTc" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pWTc] = strvalEx( val ); }
				if( strcmp( key , "Bombs" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pBombs] = strvalEx( val ); }
				if( strcmp( key , "Scope" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pScope] = strvalEx( val ); }
                if( strcmp( key , "OwnsMask" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pOwnsMask] = strvalEx( val ); }
	            if( strcmp( key , "Wins" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pWins] = strvalEx( val ); }
				if( strcmp( key , "Loses" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pLoses] = strvalEx( val ); }
				if( strcmp( key , "Tutorial" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pTut] = strvalEx( val ); }
	            if( strcmp( key , "OnDuty" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pOnDuty] = strvalEx( val ); }
	            if( strcmp( key , "DutyTime" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pDutyTime] = strvalEx( val ); }
				if( strcmp( key , "Injured" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pInjured] = strvalEx( val ); }
				if( strcmp( key , "Adjustable" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pAdjustable] = strvalEx( val ); }
	            if( strcmp( key , "Married" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pMarried] = strvalEx( val ); }
	            if( strcmp( key , "Tweet" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pTweet] = strvalEx( val ); }
	            if( strcmp( key , "InternetPack" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pInternetPack] = strvalEx( val ); }
				if( strcmp( key , "MarryTo" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[playerid][pMarriedTo], val, 0, strlen(val)-1, 255); }
				if( strcmp( key , "ForumName" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[playerid][pForumName], val, 0, strlen(val)-1, 255); }
				if( strcmp( key , "NormalName" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[playerid][pNormalName], val, 0, strlen(val)-1, 255); }
				if( strcmp( key , "TweetName" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[playerid][pTweetName], val, 0, strlen(val)-1, 255); }
				if( strcmp( key , "AdminName" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[playerid][pAdminName], val, 0, strlen(val)-1, 255); }
				if( strcmp( key , "HelperName" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[playerid][pHelperName], val, 0, strlen(val)-1, 255); }
				if( strcmp( key , "BanAdmin" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[playerid][pBanAdmin], val, 0, strlen(val)-1, 255); }
				if( strcmp( key , "BanReason" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[playerid][pBanReason], val, 0, strlen(val)-1, 255); }
				if( strcmp( key , "JailAdmin" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[playerid][pJailAdmin], val, 0, strlen(val)-1, 255); }
				if( strcmp( key , "JailReason" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[playerid][pJailReason], val, 0, strlen(val)-1, 255); }
				if( strcmp( key , "ContactOne" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[playerid][pContactOne], val, 0, strlen(val)-1, 255); }
				if( strcmp( key , "ContactTwo" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[playerid][pContactTwo], val, 0, strlen(val)-1, 255); }
				if( strcmp( key , "ContactThree" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[playerid][pContactThree], val, 0, strlen(val)-1, 255); }
				if( strcmp( key , "ContactFour" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[playerid][pContactFour], val, 0, strlen(val)-1, 255); }
				if( strcmp( key , "ContactFive" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[playerid][pContactFive], val, 0, strlen(val)-1, 255); }
				if( strcmp( key , "ContactSix" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[playerid][pContactSix], val, 0, strlen(val)-1, 255); }
				if( strcmp( key , "ContactSeven" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[playerid][pContactSeven], val, 0, strlen(val)-1, 255); }
				if( strcmp( key , "ContractBy" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[playerid][pContractBy], val, 0, strlen(val)-1, 255); }
				if( strcmp( key , "IP" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[playerid][pIP], val, 0, strlen(val)-1, 255); }
	            if( strcmp( key , "FishBait" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pFishBait] = strvalEx( val ); }
	            if( strcmp( key , "FishRod" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pFishRod] = strvalEx( val ); }
				if( strcmp( key , "NewbieMuted" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pNewbieMuted] = strvalEx( val ); }
				if( strcmp( key , "RHMuted" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][prhmuted] = strvalEx( val ); }
	            if( strcmp( key , "SafeSpawn" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pSafeSpawn] = strvalEx( val ); }
	            if( strcmp( key , "ReportMuted" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pReportMuted] = strvalEx( val ); }
	            if( strcmp( key , "AdvertisetMuted" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pAdvertiseMuted] = strvalEx( val ); }
	            if( strcmp( key , "SPos_x" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pSPos_x] = floatstr( val ); }
				if( strcmp( key , "SPos_y" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pSPos_y] = floatstr( val ); }
				if( strcmp( key , "SPos_z" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pSPos_z] = floatstr( val ); }
				if( strcmp( key , "SPos_r" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pSPos_r] = floatstr( val ); }
                if( strcmp( key , "HelperLevel" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pHelper] = strval( val ); }
                if( strcmp( key , "MaskNumber" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pMask] = strvalEx( val ); }
                if( strcmp( key , "Blindfolds" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pBlindfolds] = strvalEx( val ); }
                if( strcmp( key , "Speedo" , true ) == 0 ) { val = ini_GetValue( Data ); gSpeedo[playerid] = strvalEx( val ); }
                if( strcmp( key , "Seeds" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pSeeds] = strvalEx( val ); }
			}
			fclose(UserFile);
        }
        else
		{
			new failstring[256];
			new FileName[32];
			new ForumAcc[255];
			new pin;
			new level;
			format(FileName, sizeof(FileName), "%s.ini", PlayerName(playerid));
            if(dini_Exists(FileName))
            {
                pin = dini_Int(FileName, "PIN" );
                level = dini_Int(FileName, "Level" );
                ForumAcc = dini_Get(FileName, "ForumName" );
           	    PlayerInfo[playerid][pPIN] = pin;
            }
			format(failstring, sizeof(failstring), "\nPasswrd kamu Salah !\nNama Akun: %s\nNama Forum: %s\nLevel: %d\nPilih PIN untuk mengakses fitur Lupa Password\nJika Lupa PIN, Ajukan permohonan Lupa Password di Account-Revive dengan bukti Screenshot Tampilan ini", PlayerName(playerid), ForumAcc, level);
			ShowPlayerDialog(playerid, 172, DIALOG_STYLE_MSGBOX, "* Wrong Password :( *", failstring, "PIN", "Ulangi");
	        return 1;
		}
		new pip[16];
		if(PlayerInfo[playerid][pBand] == 3 || PlayerInfo[playerid][pPermBand] == 1)
		{
		    new banstring[512];
		    new badm[32];
	        strmid(badm, PlayerInfo[playerid][pBanAdmin], 0, strlen(PlayerInfo[playerid][pBanAdmin]), 255);
	        new breas[128];
	        strmid(breas, PlayerInfo[playerid][pBanReason], 0, strlen(PlayerInfo[playerid][pBanReason]), 255);
	        strmid(pip, PlayerInfo[playerid][pIP], 0, strlen(PlayerInfo[playerid][pIP]), 255);
		    format(banstring, sizeof(banstring), "Nama Akun: %s\nAkun ini Dibanned oleh: %s\nAlasan Ban: %s\nAlamat IP: %s\n\n\nSilahkan ajukan permohonan unban serta kirim Screenshot ini ke Unban Request di Discord", PlayerName(playerid), badm, breas, pip);
			ShowPlayerDialog(playerid, 84, DIALOG_STYLE_MSGBOX, "* Akun kamu telah di Banned :( *", banstring, ":)", ":(");
		    SetTimerEx("DelayedKick", 1000, false, "i", playerid);
		    return 1;
		}
        new plrIP[16];
		new FileName[126];
		GetPlayerIp(playerid, plrIP, sizeof(plrIP));
		strmid(pip, plrIP, 0, strlen(plrIP), 255);
		format(FileName, sizeof(FileName), "Banip/%s.ini", pip);
	    if(dini_Exists(FileName))
	    {
            new banstring[512];
            new bannedacc[255];
            bannedacc = dini_Get(FileName, "Name");
			format(banstring, sizeof(banstring), "Nama Akun: %s\nAlamat IP: %s\n\n\nSilahkan ajukan permohonan unban serta kirim Screenshot ini ke Unban Request di Discord", bannedacc, pip);
			ShowPlayerDialog(playerid, 84, DIALOG_STYLE_MSGBOX, "* IP ini telah di Banned :( *", banstring, ":)", ":(");
		    SetTimerEx("DelayedKick", 1000, false, "i", playerid);
			return 1;
	    }
		if(PlayerInfo[playerid][pPIN] == 0)
		{
		    ShowPlayerDialog(playerid, 174, DIALOG_STYLE_PASSWORD, "{00C0FF}Tambahkan PIN !", "{FFFFFF}- Masukkan PIN Baru agar bisa mengakses fitur Lupa Password\nMaksimal 10 Angka !", "Submit", "Nanti Saja");
		}
		//TextDrawHideForPlayer(playerid, Area);
		//TextDrawHideForPlayer(playerid, Area1);
		//TextDrawHideForPlayer(playerid, Area2);
		//TextDrawHideForPlayer(playerid, Area3);
		if(PlayerInfo[playerid][pReg] == 0)
		{
		    PlayerInfo[playerid][pLevel] = 1;
			PlayerInfo[playerid][pAccount] = 1000;
			PlayerInfo[playerid][pReg] = 1;
		}
		strmid(PlayerInfo[playerid][pKey], password, 0, strlen(password), 128);
		format(tmp2, sizeof(tmp2), "~w~Welcome ~n~~y~   %s", PlayerName(playerid));
		GameTextForPlayer(playerid, tmp2, 5000, 1);
		SendClientMessage(playerid, COLOR_YELLOW, motd);
		if(PlayerInfo[playerid][pFMember] < 255)
		{
		    format(tmp2, sizeof(tmp2), "Family MOTD: %s", FamilyInfo[PlayerInfo[playerid][pFMember]][FamilyMOTD]);
		    SendClientMessage(playerid, COLOR_YELLOW, tmp2);
		}
		if(PlayerInfo[playerid][PlayerVehicleModel1] != 0)
		{
			//vehicle
			CreatePlayerVehicle(playerid,1);
		}
		if(PlayerInfo[playerid][PlayerVehicleModel2] != 0)
		{
			//vehicle
			CreatePlayerVehicle(playerid,2);
		}
		if(PlayerInfo[playerid][PlayerVehicleModel3] != 0)
		{
			//vehicle
			CreatePlayerVehicle(playerid,3);
		}
		if(PlayerInfo[playerid][PlayerVehicleModel4] != 0)
		{
			//vehicle
			CreatePlayerVehicle(playerid,4);
		}
		if(PlayerInfo[playerid][PlayerVehicleModel5] != 0)
		{
			//vehicle
			CreatePlayerVehicle(playerid,5);
		}
		new string[256];
		SendClientMessage(playerid, COLOR_WHITE, "SERVER: Press click the 'Spawn' Button | Tekan tombol 'Spawn'.");
		for(new i=0; i<MAX_PLAYERS; i++)
		{
		    if(toglogin[i])
		    {
		        format(string, sizeof(string), "* {F81414}[SERVER] {00A5FF}%s {F3FF02}has connected to the server.", PlayerName(playerid));
		        SendClientMessage(i, COLOR_NICEGREEN, string);
		    }
	   		if(UsingMask[i] == 1)
	   		{
			   	ShowPlayerNameTagForPlayer(playerid, i, false);
			}
		}
		if(PlayerInfo[playerid][pCompo] < -1) PlayerInfo[playerid][pCompo] = 0;
		if(PlayerInfo[playerid][pMats] < -1) PlayerInfo[playerid][pMats] = 0;
		if(PlayerInfo[playerid][pCrack] < -1) PlayerInfo[playerid][pCrack] = 0;
		if(PlayerInfo[playerid][pSeeds] < -1) PlayerInfo[playerid][pSeeds] = 0;
		if(PlayerInfo[playerid][pDetSkill] > 9999) PlayerInfo[playerid][pDetSkill] = 1000;
		if(PlayerInfo[playerid][pSexSkill] > 9999) PlayerInfo[playerid][pSexSkill] = 1000;
		if(PlayerInfo[playerid][pBoxSkill] > 9999) PlayerInfo[playerid][pBoxSkill] = 1000;
		if(PlayerInfo[playerid][pLawSkill] > 9999) PlayerInfo[playerid][pLawSkill] = 1000;
		if(PlayerInfo[playerid][pMechSkill] > 9999) PlayerInfo[playerid][pMechSkill] = 1000;
		if(PlayerInfo[playerid][pJackSkill] > 9999) PlayerInfo[playerid][pJackSkill] = 1000;
		if(PlayerInfo[playerid][pCarSkill] > 9999) PlayerInfo[playerid][pCarSkill] = 1000;
		if(PlayerInfo[playerid][pNewsSkill] > 9999) PlayerInfo[playerid][pNewsSkill] = 1000;
		if(PlayerInfo[playerid][pDrugsSkill] > 9999) PlayerInfo[playerid][pDrugsSkill] = 1000;
		if(PlayerInfo[playerid][pArmsSkill] > 9999) PlayerInfo[playerid][pArmsSkill] = 1000;
		if(PlayerInfo[playerid][pSmugglerSkill] > 9999) PlayerInfo[playerid][pSmugglerSkill] = 1000;
		if(PlayerInfo[playerid][pFishSkill] > 9999) PlayerInfo[playerid][pFishSkill] = 1000;
		ResetPlayerMoney(playerid);
		GivePlayerMoney(playerid,PlayerInfo[playerid][pCash]);
		SetPlayerFightingStyle(playerid, PlayerInfo[playerid][pFightingStyle]);
		//TogglePlayerSpectating(playerid, 0);
		GetPlayerIp(playerid, plrIP, sizeof(plrIP));
		strmid(PlayerInfo[playerid][pIP], plrIP, 0, strlen(plrIP), 255);
		PlayerInfo[playerid][pAdjustable] = 0;
    	InitLockDoors(playerid);
		gPlayerLogged[playerid] = 1;
		PlayerTextdraw(playerid);
        SetTimerEx("PlayerTextdrawShow", 1000, false, "i", playerid);
    }
    return 1;
}

stock ini_GetKey( line[] )
{
	new keyRes[256];
	keyRes[0] = 0;
    if( strfind( line , "=" , true ) == -1 ) return keyRes;
    strmid( keyRes , line , 0 , strfind( line , "=" , true ) , sizeof( keyRes) );
    return keyRes;
}

stock ini_GetValue( line[] )
{
	new valRes[256];
	valRes[0]=0;
	if( strfind( line , "=" , true ) == -1 ) return valRes;
	strmid( valRes , line , strfind( line , "=" , true )+1 , strlen( line ) , sizeof( valRes ) );
	return valRes;
}

public OnPropUpdate()
{
	new idx;
	new File: file2;
	while (idx < sizeof(BizzInfo))
	{
		new coordsstring[256];
		format(coordsstring, sizeof(coordsstring), "%d|%d|%s|%s|%s|%f|%f|%f|%f|%f|%f|%d|%d|%d|%d|%d|%d|%d|%d|%d\n",
		BizzInfo[idx][bOwned],
		BizzInfo[idx][bRadio],
		BizzInfo[idx][bOwner],
		BizzInfo[idx][bMessage],
		BizzInfo[idx][bExtortion],
		BizzInfo[idx][bEntranceX],
		BizzInfo[idx][bEntranceY],
		BizzInfo[idx][bEntranceZ],
		BizzInfo[idx][bExitX],
		BizzInfo[idx][bExitY],
		BizzInfo[idx][bExitZ],
		BizzInfo[idx][bLevelNeeded],
		BizzInfo[idx][bBuyPrice],
		BizzInfo[idx][bEntranceCost],
		BizzInfo[idx][bTill],
		BizzInfo[idx][bLocked],
		BizzInfo[idx][bInterior],
		BizzInfo[idx][bProducts],
		BizzInfo[idx][bMaxProducts],
		BizzInfo[idx][bPriceProd]);
		if(idx == 0)
		{
			file2 = fopen("bizz.cfg", io_write);
		}
		else
		{
			file2 = fopen("bizz.cfg", io_append);
		}
		fwrite(file2, coordsstring);
		idx++;
		fclose(file2);
	}
	return 1;
}
