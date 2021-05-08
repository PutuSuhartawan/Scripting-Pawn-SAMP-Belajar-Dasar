
stock SavePosVehicle(vehicleid)
{
	new VID=CarN[vehicleid][2],nextsave,Float:info[4];
    if(VID>0)
	{
	    GetVehicleZAngle(vehicleid,info[0]);
		GetVehiclePos(vehicleid,info[1],info[2],info[3]);

		if(info[1]==CarSave[VID][csX])nextsave++;
		if(info[2]==CarSave[VID][csY])nextsave++;
		if(info[3]==CarSave[VID][csZ])nextsave++;
		if(info[0]==CarSave[VID][csA])nextsave++;
		if(Car[VID][cInt]==CarSave[VID][csInt])nextsave++;
		if(Car[VID][cWorld]==CarSave[VID][csWorld])nextsave++;
		if(cFill[vehicleid]==CarSave[VID][csFill])nextsave++;
		if(Run[vehicleid]==CarSave[VID][csRun])nextsave++;
		if(Run2[vehicleid]==CarSave[VID][csRun2])nextsave++;
		if(cLamp[vehicleid]==CarSave[VID][csLamp])nextsave++;
		if(cEngine[vehicleid]==CarSave[VID][csEngine])nextsave++;
		if(cLock[vehicleid]==CarSave[VID][csLock])nextsave++;
		if(cTrunk[vehicleid]==CarSave[VID][csTrunk])nextsave++;
		if(Car[VID][cService]==CarSave[VID][csService])nextsave++;
		if(nextsave!=14)
		{
		    GetVehicleZAngle(vehicleid,Car[VID][cA]);
			GetVehiclePos(vehicleid,Car[VID][cX],Car[VID][cY],Car[VID][cZ]);
			GetVehicleHealth(vehicleid,Car[VID][cHealth]);
			GetVehicleDamageStatus(vehicleid,Car[VID][cPanels],Car[VID][cDoors],Car[VID][cLights],Car[VID][cTires]);
			SaveCars(vehicleid,VID,1);

			CarSave[VID][csX]=Car[VID][cX];
			CarSave[VID][csY]=Car[VID][cY];
			CarSave[VID][csZ]=Car[VID][cZ];
			CarSave[VID][csA]=Car[VID][cA];
			CarSave[VID][csInt]=Car[VID][cInt];
			CarSave[VID][csWorld]=Car[VID][cWorld];
			CarSave[VID][csFill]=cFill[vehicleid];
			CarSave[VID][csRun]=Run[vehicleid];
			CarSave[VID][csRun2]=Run2[vehicleid];
			CarSave[VID][csLamp]=cLamp[vehicleid];
			CarSave[VID][csEngine]=cEngine[vehicleid];
			CarSave[VID][csLock]=cLock[vehicleid];
			CarSave[VID][csTrunk]=cTrunk[vehicleid];
			CarSave[VID][csService]=Car[VID][cService];
		}
	}
	return true;
}


stock SaveCars(carid,c,mod)
{
	switch(mod)
	{
	    case 0:// Ñîõðàíåíèå ïðè ïîêóïêå àâòî
	    {
	        new string[80],query[620];
			format(string,sizeof(string),"UPDATE `Car` SET "),strcat(query,string);
			format(string,sizeof(string),"`Number`='%i',",Car[c][cNumber]),strcat(query,string);
			format(string,sizeof(string),"`Owner`='%i' ",Car[c][cOwner]),strcat(query,string);
			format(string,sizeof(string),"WHERE `Number` = '%i'",Car[c][cNumber]),strcat(query,string);
		    n_mysql_query(MySQL1 ,query);
	    }
	    case 1:// Ñîõðàíåíèå êîîðäèíàò è õàðàêòåðèñòèê
	    {
	        new ststatus[60];
	        format(ststatus,sizeof(ststatus),"%f|%i|%i|%i|%i",Car[c][cHealth],Car[c][cPanels],Car[c][cDoors],Car[c][cLights],Car[c][cTires]);
	        new string[60],query[1000];
			format(string,sizeof(string),"UPDATE `Car` SET "),strcat(query,string);
			format(string,sizeof(string),"`X`='%f',",Car[c][cX]),strcat(query,string);
			format(string,sizeof(string),"`Y`='%f',",Car[c][cY]),strcat(query,string);
			format(string,sizeof(string),"`Z`='%f',",Car[c][cZ]),strcat(query,string);
			format(string,sizeof(string),"`A`='%f',",Car[c][cA]),strcat(query,string);
			format(string,sizeof(string),"`Int`='%i',",Car[c][cInt]),strcat(query,string);
			format(string,sizeof(string),"`World`='%i',",Car[c][cWorld]),strcat(query,string);
			format(string,sizeof(string),"`Fill`='%i',",cFill[carid]),strcat(query,string);
			format(string,sizeof(string),"`Run`='%i',",Run[carid]),strcat(query,string);
			format(string,sizeof(string),"`Run2`='%i',",Run2[carid]),strcat(query,string);
			format(string,sizeof(string),"`Lamp`='%i',",cLamp[carid]),strcat(query,string);
			format(string,sizeof(string),"`Engine`='%i',",cEngine[carid]),strcat(query,string);
			format(string,sizeof(string),"`Lock`='%i',",cLock[carid]),strcat(query,string);
			format(string,sizeof(string),"`Trunk`='%i',",cTrunk[carid]),strcat(query,string);
			format(string,sizeof(string),"`Service`='%i',",Car[c][cService]),strcat(query,string);
			format(string,sizeof(string),"`Straf`='%i',",Car[c][cStraf]),strcat(query,string);
			format(string,sizeof(string),"`Damage`='%s',",ststatus),strcat(query,string);
			format(string,sizeof(string),"`Oil`='%i',",Car[c][cOil]),strcat(query,string);
			format(string,sizeof(string),"`Acc`='%i',",Car[c][cAcc]),strcat(query,string);
			format(string,sizeof(string),"`SparkPlug1`='%i',",Car[c][cSparkPlug1]),strcat(query,string);
			format(string,sizeof(string),"`SparkPlug2`='%i',",Car[c][cSparkPlug2]),strcat(query,string);
			format(string,sizeof(string),"`SparkPlug3`='%i',",Car[c][cSparkPlug3]),strcat(query,string);
			format(string,sizeof(string),"`SparkPlug4`='%i',",Car[c][cSparkPlug4]),strcat(query,string);
			format(string,sizeof(string),"`SparkPlug5`='%i',",Car[c][cSparkPlug5]),strcat(query,string);
			format(string,sizeof(string),"`SparkPlug6`='%i',",Car[c][cSparkPlug6]),strcat(query,string);
			format(string,sizeof(string),"`Insu`='%i' ",Car[c][cInsu]),strcat(query,string);
			format(string,sizeof(string),"WHERE `Number` = '%i'",Car[c][cNumber]),strcat(query,string);
		    n_mysql_query(MySQL1 ,query);
	    }
	    case 2:// Ñîõðàíåíèå ñåðâèñà
	    {
	        new string[60],query[200];
			format(string,sizeof(string),"UPDATE `Car` SET "),strcat(query,string);
			format(string,sizeof(string),"`Service`='%i' ",Car[c][cService]),strcat(query,string);
			format(string,sizeof(string),"WHERE `Number` = '%i'",Car[c][cNumber]),strcat(query,string);
		    n_mysql_query(MySQL1 ,query);
	    }
	    case 3:
	    {
		    for(new i=1;i<8;i++)
		    {
		        if(VehicleItem1[carid][i]>0&&VehicleItem2[carid][i]<=0)
		        {
		            VehicleItem1[carid][i]=0;
					VehicleItem2[carid][i]=0;
					VehicleItem3[carid][i]=0;
		        }
		        if(VehicleItem1[carid][i]>0&&VehicleItem2[carid][i]>1)
		        {
		        	if(Item[VehicleItem1[carid][i]][iStek]==0&&VehicleItem1[carid][i]!=104)
		        	{
		        	    VehicleItem2[carid][i]=1;
		        	}
		        }
		    }
		    new strinv[700];
			format(strinv,sizeof(strinv),"UPDATE `Car` SET `BagInv` = '%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d' WHERE `Number`='%i'",
			VehicleItem1[carid][1],VehicleItem2[carid][1],VehicleItem3[carid][1],VehicleItem1[carid][2],VehicleItem2[carid][2],VehicleItem3[carid][2],
			VehicleItem1[carid][3],VehicleItem2[carid][3],VehicleItem3[carid][3],VehicleItem1[carid][4],VehicleItem2[carid][4],VehicleItem3[carid][4],
			VehicleItem1[carid][5],VehicleItem2[carid][5],VehicleItem3[carid][5],VehicleItem1[carid][6],VehicleItem2[carid][6],VehicleItem3[carid][6],
			VehicleItem1[carid][7],VehicleItem2[carid][7],VehicleItem3[carid][7],Car[c][cNumber]);
			n_mysql_query(MySQL1 ,strinv,false);
			return true;
		}
		case 4:
		{
	        new string[34],query[184];
			format(string,sizeof(string),"UPDATE `Car` SET "),strcat(query,string);
			format(string,sizeof(string),"`Wheel`='%i',",Car[c][cWheel]),strcat(query,string);
			format(string,sizeof(string),"`Gidro`='%i',",Car[c][cGidro]),strcat(query,string);
			format(string,sizeof(string),"`Nitro`='%i',",Car[c][cNitro]),strcat(query,string);
			format(string,sizeof(string),"`EngineStar`='%i',",Car[c][cEngineStar]),strcat(query,string);
			format(string,sizeof(string),"`GPS`='%i',",Car[c][cGPS]),strcat(query,string);
			format(string,sizeof(string),"`Signal`='%i',",Car[c][cSignal]),strcat(query,string);
			format(string,sizeof(string),"`ColorA`='%i',",Car[c][cColorA]),strcat(query,string);
			format(string,sizeof(string),"`ColorB`='%i' ",Car[c][cColorB]),strcat(query,string);
			format(string,sizeof(string),"WHERE `Number` = '%i'",Car[c][cNumber]),strcat(query,string);
		    n_mysql_query(MySQL1 ,query);
		}
	    case 5:
	    {
		    for(new i=1;i<8;i++)
		    {
		        if(VehicleGloveItem1[carid][i]>0&&VehicleGloveItem2[carid][i]<=0)
		        {
		            VehicleGloveItem1[carid][i]=0;
					VehicleGloveItem2[carid][i]=0;
					VehicleGloveItem3[carid][i]=0;
		        }
		        if(VehicleGloveItem1[carid][i]>0&&VehicleGloveItem2[carid][i]>1)
		        {
		        	if(Item[VehicleGloveItem1[carid][i]][iStek]==0&&VehicleGloveItem1[carid][i]!=104)
		        	{
		        	    VehicleGloveItem2[carid][i]=1;
		        	}
		        }
		    }
		    new strinv[700];
			format(strinv,sizeof(strinv),"UPDATE `Car` SET `GloveInv` = '%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d' WHERE `Number`='%i'",
			VehicleGloveItem1[carid][1],VehicleGloveItem2[carid][1],VehicleGloveItem3[carid][1],VehicleGloveItem1[carid][2],VehicleGloveItem2[carid][2],VehicleGloveItem3[carid][2],
			VehicleGloveItem1[carid][3],VehicleGloveItem2[carid][3],VehicleGloveItem3[carid][3],VehicleGloveItem1[carid][4],VehicleGloveItem2[carid][4],VehicleGloveItem3[carid][4],
			VehicleGloveItem1[carid][5],VehicleGloveItem2[carid][5],VehicleGloveItem3[carid][5],VehicleGloveItem1[carid][6],VehicleGloveItem2[carid][6],VehicleGloveItem3[carid][6],
			VehicleGloveItem1[carid][7],VehicleGloveItem2[carid][7],VehicleGloveItem3[carid][7],Car[c][cNumber]);
			n_mysql_query(MySQL1 ,strinv,false);
			return true;
		}
		case 6:
		{
	        new string[60],query[200];
			format(string,sizeof(string),"UPDATE `Car` SET "),strcat(query,string);
			format(string,sizeof(string),"`Money`='%i' ",Car[c][cMoney]),strcat(query,string);
			format(string,sizeof(string),"WHERE `Number` = '%i'",Car[c][cNumber]),strcat(query,string);
		    n_mysql_query(MySQL1 ,query);
		}
		case 7:
		{
	        new string[35],query[170];
			format(string,sizeof(string),"UPDATE `Car` SET "),strcat(query,string);
			format(string,sizeof(string),"`Key1`='%i',",Car[c][cKey1]),strcat(query,string);
			format(string,sizeof(string),"`Key2`='%i',",Car[c][cKey2]),strcat(query,string);
			format(string,sizeof(string),"`Key3`='%i',",Car[c][cKey3]),strcat(query,string);
			format(string,sizeof(string),"`Key4`='%i',",Car[c][cKey4]),strcat(query,string);
			format(string,sizeof(string),"`Key5`='%i' ",Car[c][cKey5]),strcat(query,string);
			format(string,sizeof(string),"WHERE `Number` = '%i'",Car[c][cNumber]),strcat(query,string);
		    n_mysql_query(MySQL1 ,query);
		}
		case 8:
		{
		    for(new i=1;i<8;i++)
		    {
		        if(VehicleItem1[carid][i]>0&&VehicleItem2[carid][i]<=0)
		        {
		            VehicleItem1[carid][i]=0;
					VehicleItem2[carid][i]=0;
					VehicleItem3[carid][i]=0;
		        }
		        if(VehicleItem1[carid][i]>0&&VehicleItem2[carid][i]>1)
		        {
		        	if(Item[VehicleItem1[carid][i]][iStek]==0&&VehicleItem1[carid][i]!=104)
		        	{
		        	    VehicleItem2[carid][i]=1;
		        	}
		        }
		        if(VehicleGloveItem1[carid][i]>0&&VehicleGloveItem2[carid][i]<=0)
		        {
		            VehicleGloveItem1[carid][i]=0;
					VehicleGloveItem2[carid][i]=0;
					VehicleGloveItem3[carid][i]=0;
		        }
		        if(VehicleGloveItem1[carid][i]>0&&VehicleGloveItem2[carid][i]>1)
		        {
		        	if(Item[VehicleGloveItem1[carid][i]][iStek]==0&&VehicleGloveItem1[carid][i]!=104)
		        	{
		        	    VehicleGloveItem2[carid][i]=1;
		        	}
		        }
		    }
		    new str1[700],query[1400];
			format(str1,sizeof(str1),"UPDATE `Car` SET "),strcat(query,str1),str1="";
			format(str1,sizeof(str1),"`BagInv` = '%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d',",
			VehicleItem1[carid][1],VehicleItem2[carid][1],VehicleItem3[carid][1],VehicleItem1[carid][2],VehicleItem2[carid][2],VehicleItem3[carid][2],
			VehicleItem1[carid][3],VehicleItem2[carid][3],VehicleItem3[carid][3],VehicleItem1[carid][4],VehicleItem2[carid][4],VehicleItem3[carid][4],
			VehicleItem1[carid][5],VehicleItem2[carid][5],VehicleItem3[carid][5],VehicleItem1[carid][6],VehicleItem2[carid][6],VehicleItem3[carid][6],
			VehicleItem1[carid][7],VehicleItem2[carid][7],VehicleItem3[carid][7]),strcat(query,str1),str1="";
			format(str1,sizeof(str1),"`GloveInv` = '%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d' ",
			VehicleGloveItem1[carid][1],VehicleGloveItem2[carid][1],VehicleGloveItem3[carid][1],VehicleGloveItem1[carid][2],VehicleGloveItem2[carid][2],VehicleGloveItem3[carid][2],
			VehicleGloveItem1[carid][3],VehicleGloveItem2[carid][3],VehicleGloveItem3[carid][3],VehicleGloveItem1[carid][4],VehicleGloveItem2[carid][4],VehicleGloveItem3[carid][4],
			VehicleGloveItem1[carid][5],VehicleGloveItem2[carid][5],VehicleGloveItem3[carid][5],VehicleGloveItem1[carid][6],VehicleGloveItem2[carid][6],VehicleGloveItem3[carid][6],
			VehicleGloveItem1[carid][7],VehicleGloveItem2[carid][7],VehicleGloveItem3[carid][7]),strcat(query,str1);str1="";
			format(str1,sizeof(str1),"WHERE `Number` = '%i'",Car[c][cNumber]),strcat(query,str1),str1="";
			n_mysql_query(MySQL1,query,false);
		}
	    default:return true;
	}
	return true;
}


SavePlayerPos(playerid)
{
    if(Player[playerid][pConnect]==false){return true;}
    if(IsPlayerNPC(playerid)){return true;}
    if(PlayerToPoint(playerid,20,504.9615,-1638.4474,58.5904))return true;
    new string[100],query[540];
    format(string,sizeof(string),"UPDATE `PlayaRP` SET "),strcat(query,string);
    format(string,sizeof(string),"`X`='%f',",Player[playerid][pX]),strcat(query,string);
    format(string,sizeof(string),"`Y`='%f',",Player[playerid][pY]),strcat(query,string);
    format(string,sizeof(string),"`Z`='%f',",Player[playerid][pZ]),strcat(query,string);
    format(string,sizeof(string),"`A`='%f',",Player[playerid][pA]),strcat(query,string);
    format(string,sizeof(string),"`Health`='%f',",Player[playerid][pHealth]),strcat(query,string);
    format(string,sizeof(string),"`Int`='%i',",Player[playerid][pInt]),strcat(query,string);
    format(string,sizeof(string),"`World`='%i'",Player[playerid][pWorld]),strcat(query,string);
    format(string,sizeof(string),"WHERE `ID`='%i'",Player[playerid][pID]),strcat(query,string);
    n_mysql_query(MySQL1 ,query);
	return true;
}




public OnPlayerDisconnect(playerid, reason)
{
	new Float:x, Float:y, Float:z;
    GetPlayerPos(playerid, x, y, z);
      
    new strID[300];
	format(strID,sizeof(strID),"UPDATE `PlayaRP` SET `IDinSvr`='0' WHERE `ID`='%i'", Player[playerid][pID]);
	n_mysql_query( MySQL1, strID, false);


		 			for(new c=1;c<MAX_VEHICLES;c++)
					{
						
						
					   
					    for(new i;i<=GetPlayerPoolSize();i++)
						{
						    if(Player[i][pConnect]==false)continue;
						    if(Car[c][cOwner]==Player[i][pID])
						    {
						    	
								 // VID is ID vehicle in database, and vehicle id is ID vehicle in server.


						    	if(Car[c][cOnOffice] == 0) // vehicle have problem in insurance office.
								{

											SetVehicleVirtualWorld( Car[c][cIDinSvr], 1);
				    						new strID[100];
				    						format(strID, sizeof(strID), "PLAYERCARS: Despawned in DB is: [%i], with insurance time: [%i] years, ID in Server: [%d]", Car[c][cNumber], Car[c][cInsu], Car[c][cIDinSvr]);
											SendClientMessage( Car[c][cOwnerIDinSvr], -1, strID);


								        
								}
						    	break;
						    }
						}
					}



      foreach(new ii : Player)
      {
        if(IsPlayerInRangeOfPoint(ii, 40.0, x, y, z))
        {
          //if(pInfo[ii][TogLoginNotif] == true)
          {
                        switch(reason)
                       {
                        case 0:
                        {

                          SendClientMessageEx(ii,-1, "[SERVER] %s(%d) has leave from the server.(timeout/crash)", Player[playerid][pName], playerid);
                        }
                        case 1:
                        {
                          SendClientMessageEx(ii, -1, "[SERVER] %s(%d) has leave from the server.(leaving)", Player[playerid][pName], playerid);
                        }
                        case 2:
                        {
                          SendClientMessageEx(ii, -1, "[SERVER] %s(%d) has leave from the server.(kicked/banned)", Player[playerid][pName], playerid);
                        }
                      }

          }
         
        }
      }


    RemoveBuildingForPlayer(playerid, 4504, 56.3828, -1531.4531, 6.7266, 0.25);
	RemoveBuildingForPlayer(playerid, 4518, 1694.3203, 395.1094, 31.1641, 0.25);
	
    REST_PLAYER(playerid);
    StopAudioStreamForPlayer(playerid);
    SetPlayerColor(playerid, 0xFFFFFF00);
    ShowPlayerDialog(playerid,-1, BOX, " ", " ", " ", " ");
	ExitCookingCocaine(playerid);
    PlayerStopJob(playerid);
    DeletePlayerAllReport(playerid);
	if(Rentbike[playerid]>0)
	{
	    new carid=Rentbike[playerid];
		CarN[carid][1]=0;
	    DeleteCar(carid);
	    Rentbike[playerid]=0;
	}
    if(PlayerCuff[playerid]==true)
	{
	    PlayerCuff[playerid]=false;
	    NewDropItem(106,1,0,Player[playerid][pInt],Player[playerid][pWorld],Player[playerid][pX],Player[playerid][pY],Player[playerid][pZ],0);
	}
	if(Player[playerid][pHSpawn]>0){SavePlayer(playerid,HSpawnx);}
    DeletePVar(playerid,"usePediatr");
    DeletePVar(playerid,"TimerPediatr");
    DeletePVar(playerid,"IDgas");
    for(new i;i<sizeof(UseDoctor);i++){if(UseDoctor[i]==playerid){UseDoctor[i]=-1;}}
    PlayerGasCheck[playerid]=0;
    PlayerGasLiter[playerid]=0;
    SetNoEatDrinkItem[playerid]=0;
    PlayerNeedHelp[playerid]=false;
    PlayerHelpPlaya[playerid]=-1;
	TimerNoUpItem[playerid]=0;
	TimerRanenie[playerid]=0;
	TimeUseBint[playerid]=0;
	TimeUseZgyt[playerid]=0;
    PassBuilding[playerid]=0;
    for(new i=1;i<4;i++){ Weapons[playerid][i]=0;AmmoInfo[playerid][i]=0;}
    SavePlayerPos(playerid);
    ChowTextLogo(playerid,0);
    ChowTextPhone(playerid,0);
    ChowTextSpeed(playerid,0);
    ChowTextClothesShop(playerid,0);
    ChowTextReg(playerid,0);
    ChowTextLogin(playerid,0);
	ChowTextPass(playerid,0);
	ChowTextEmail(playerid,0);
	ChowTextSex(playerid,0);
	ChowTextStatus(playerid,0);
	ChowTextRace(playerid,0);
	ChowTextInv1(playerid,0);
	ChowTextInv2(playerid,0);
	ChowTextInv3(playerid,0);
	ChowTextInv4(playerid,0);
	ChowTextSteal(playerid,0);
	ChowTextBesoin(playerid,0);
	ChowTextPlayaID(playerid,0);
    ChowTextLeaderKPK(playerid,0);
    ChowTextLeaderKPK2(playerid,0);
    ChowTextLeaderKPK3(playerid,0);
    ChowTextLeaderKPK4(playerid,0);
    ChowTextLeaderKPK5(playerid,0);
    ChowTextLeaderKPK6(playerid,0);
    ChowTextLeaderKPK7(playerid,0);
    ChowTextLeaderKPK8(playerid,0);
    ChowTextLeaderKPK9(playerid,0);
    ChowTextShopAcc(playerid,0);
    ChowTextCTO(playerid,0);
    ChowTextCTO2(playerid,0);
    ChowTextCTO3(playerid,0);
    ChowTextCTO4(playerid,0);
    ChowTextTest(playerid,0);
    ChowTextRadio(playerid,0);
    ChowTextSkinLeader(playerid,0);
    ChowTextCapture(playerid,0);
    ChowTextCaptMafia(playerid,0);
    ChowTextGym(playerid,0);
	ChowTextAdminCheat(playerid,0);
	ChowTextAdminCheat2(playerid,0);
	ChowTextCrystal(playerid,0);
    SavePlayer(playerid,Slotx);
    DeletePVar(playerid,"PlayseShopObjectID");
    StatsPlayerJobSklad[playerid]=false;
	if(ModerPlayaReport==playerid)
	{
	    ModerUseReport=-1;ModerPlayaReport=-1;
	}
	if(PlayerCreateShopObject[playerid]!=0)
	{
	    DestroyDynamicObject(PlayerCreateShopIDObject[playerid]);
		DestroyDynamicObject(ShopTextInfoObject[playerid]);
	}
	PlayerCreateShopObject[playerid]=0;
    if(IsPlayerInAnyVehicle(playerid))
    {
    	new idcar = GetPlayerVehicleID(playerid);
		if(CarN[idcar][2]>0){SavePosVehicle(idcar);}
	}
    if(PlayerProdItemShop[playerid]>0&&GetPVarInt(playerid,"ShopID")>0)
    {
        Shop24[GetPVarInt(playerid,"ShopID")][sSkladProd]+=PlayerProdItemShop[playerid];
        SaveShop24(GetPVarInt(playerid,"ShopID"),1002);
        PlayerProdItemShop[playerid]=0;
		SetPlayerSpecialAction(playerid, 0);
		UpDateShop(GetPVarInt(playerid,"ShopID"),6);
    }
    if(ArentProdKey[playerid]>0)
    {
		DeleteArentProdKeyCar(playerid);
	}
    if(ArentFuraKey[playerid]>0)
    {
		DeleteArentFuraKeyCar(playerid);
	}
	if(TimeJobCreateClother[playerid]>0)
	{
		for(new i=1;i<16;i++)
		{
		    if(JobClothesInfo[i][stJobPlayer]==playerid)
		    {
		        JobClothesInfo[i][stJobStatus]=0;
		        JobClothesInfo[i][stJobPlayer]=0;
	    		DestroyDynamicObject(JobClothesInfo[i][stJobObject]);
	    		UpdateDynamic3DTextLabelText(JobClothesInfo[i][stJobText],COLOR_TEXT1,"Desktop gratis\ngunakan 'N'");
		    }
		}
	    PlayerJobGetClother[playerid]=0;
	    TimeJobCreateClother[playerid]=0;
	    RemovePlayerAttachedObject(playerid,0);
	}
	if(TimeJobCreateMebel[playerid]>0)
	{
		for(new i=1;i<45;i++)
		{
		    if(JobMebelInfo[i][stJobPlayerMebel]==playerid)
		    {
		        JobMebelInfo[i][stJobStatusMebel]=0;
		        JobMebelInfo[i][stJobPlayerMebel]=0;
	    		UpdateDynamic3DTextLabelText(JobMebelInfo[i][stJobTextMebel],COLOR_TEXT1,"Desktop gratis\ngunakan 'N'");
		    }
		}
	    PlayerJobGetMebel[playerid]=0;
	    TimeJobCreateMebel[playerid]=0;
	    RemovePlayerAttachedObject(playerid,0);
	}
	if(GetPVarInt(playerid,"PortCarID")>0)
	{
	    StartSalonGPS[playerid]=false;PlayerGPS[playerid]=false;
	    DisablePlayerRaceCheckpoint(playerid);
	    new carid=GetPVarInt(playerid,"PortCarID");
		new s=GetPVarInt(playerid,"SalonIdPort");
		new slot=GetPVarInt(playerid,"SalonSlot");
		SalonZakazCarIdSlot[s][slot]=0;
		DeleteCar(carid);
		DeletePVar(playerid,"PortCarID");
		DeletePVar(playerid,"SalonIdPort");
		DeletePVar(playerid,"SalonSlot");
	}
    if(PlayerUseTelega[playerid]==true)
    {
        PlayerUseTelega[playerid]=false;
        RemovePlayerAttachedObject(playerid,0);
    }
    if(Player[playerid][pPrison]>0){SavePlayer(playerid,pPrison);}
    if(GetPVarInt(playerid,"TestSchoolCar")>0)
    {
        DeletePVar(playerid,"TestSchoolCar");
        DeletePVar(playerid,"GetLic");
        DeletePVar(playerid,"FailSchool");
        if(SchoolCarPlayerCar[playerid]>0)
        {
            new idcar=SchoolCarPlayerCar[playerid];
            if(CheckShcoolCarA(idcar)||CheckShcoolCarB(idcar)||CheckShcoolCarC(idcar))
            {
				n_SetVehicleParamsEx(idcar,0, 0, 0, 0, 0, 0, 0);
				cLamp[idcar]=false;
			    cEngine[idcar]=false;
			    cLock[idcar]=false;
			    cTrunk[idcar]=false;
		    	cGlove[idcar]=false;
		    	cBonnet[idcar]=false;
		        SetVehicleToRespawn(idcar);
			   	SchoolCarPlayer[idcar]=-1;
			   	SchoolCarPlayerCar[playerid]=0;
			}
        }
        return true;
    }
    if(PlayerCheckBoonned[playerid]>0)
	{
		VehicleCheckBoonned[PlayerCheckBoonned[playerid]]=-1;
		PlayerCheckBoonned[playerid]=0;
	}
	if(Player[playerid][pStatsAction]==true)
	{
	    Player[playerid][pStatsAction]=false;
	    DestroyDynamic3DTextLabel(Player[playerid][pAction]);
	}
    PlayerDownCall(playerid);
	PhoneCall[playerid]=-1;
	PhoneTimer[playerid]=0;
	PhoneStats[playerid]=-1;
	PhoneInfoSt[playerid]=0;
	PlayerTazer[playerid]=0;
	ArentProdTime[playerid]=0;
	PlayerLeadPlaya[playerid]=-1;
	PlayerTimerCraftGun[playerid]=0;
	for(new i;i<10;i++)RemovePlayerAttachedObject(playerid, i);
	SavePlayer(playerid,Eatx);
	SavePlayer(playerid,Soifx);
	SavePlayer(playerid,Needx);
	Player[playerid][pTimeDis]=Time+(3600);
	SavePlayer(playerid,TimeDisx);
    Player[playerid] = Player[MAX_PLAYERS];// hapus semua info untuk pemain ini
    PlayerItem1[playerid] = PlayerItem1[MAX_PLAYERS];
    PlayerItem2[playerid] = PlayerItem2[MAX_PLAYERS];
    PlayerItem3[playerid] = PlayerItem3[MAX_PLAYERS];
    for(new i;i<sizeof(CallMech);i++)
	{
		if(CallMech[i]==0)continue;
		if(CallMechID[i]==playerid)
		{
		    CallMech[i]=0;
		    CallMechID[i]=-1;
		    CallMechTime[i]=0;
		}
	}
	for(new i;i<sizeof(CallTaxi);i++)
	{
		if(CallTaxi[i]==0)continue;
		if(CallTaxiID[i]==playerid)
		{
		    CallTaxi[i]=0;
		    CallTaxiID[i]=-1;
		    CallTaxiTime[i]=0;
		}
	}
	for(new i;i<sizeof(CallCop);i++)
	{
		if(CallCop[i]==0)continue;
		if(CallCopID[i]==playerid)
		{
		    CallCop[i]=0;
		    CallCopID[i]=-1;
		    CallCopTime[i]=0;
		    format(CallCopText[i],2,"");
		}
	}
	for(new i;i<sizeof(CallMed);i++)
	{
		if(CallMed[i]==0)continue;
		if(CallMedID[i]==playerid)
		{
		    CallMed[i]=0;
		    CallMedID[i]=-1;
		    CallMedTime[i]=0;
		    format(CallMedText[i],2,"");
		}
	}
	if(PhoneCNNCall[playerid]>0)
	{
		PhoneCNNCall[playerid]=0;
		PhoneCNNTimer[playerid]=0;
		PhoneCNNStats[playerid]=0;
		for(new i;i<sizeof(CallCnn);i++)
	    {
	        if(CallCnn[i]==0)continue;
	        if(CallCnnID[i]!=playerid)continue;
	        CallCnn[i]=0;
	        CallCnnID[i]=-1;
	        break;
	    }
	}
    


      

      format(Player[playerid][pName],32,"");
	return true;
}
