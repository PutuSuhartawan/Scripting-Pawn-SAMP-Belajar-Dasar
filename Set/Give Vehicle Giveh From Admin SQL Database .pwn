
CheckMaxPlayerCars(playerid)// Âûäàñò ìàêñèìàëüíîå äîñòóïíîå çíà÷åíèå ñëîòîâ ïîä òðàíñïîðò
{
	new car=10; //setting for max player basic slot of veh.
	switch(Player[playerid][pVip])
	{
	    
	    case 1:car+1;// âñåãî 2 ìàøèíû
	    case 2:car+2;// âñåãî 3 ìàøèíû
	    case 3:car+2;// âñåãî 3 ìàøèíû
	    case 4:car+3;// âñåãî 4 ìàøèíû
	}
	return car;
}
CheckMaxCarPlayer(playerid)// Âûäàñò êîë-âî ëè÷íûõ ìàøèí ó èãðîêà
{
	new car;
	for(new v;v<MAX_VEHICLES;v++)
	{
	    if(Car[v][cOwner]==0)continue;
	    if(Car[v][cOwner]!=Player[playerid][pID])continue;
	    PlayerCarKey[playerid][car]=v;
	    car++;
	}
	return car;
}
CheckVIDPlayerKeyCar(playerid,vid)// Ñêàæåò, åñëè åñòü êëþ÷è îò äàííîãî ëè÷íîãî òðàíñïîðòà
{
    for(new c;c<MAX_PL_KEY;c++)
    {
        if(PlayerCarKey[playerid][c]<=0)continue;
		if(PlayerCarKey[playerid][c]==vid)
		{
		    return true;
		}
    }
    return false;
}
GetRealIdCar(vid)
{
	new car;
	for(new v;v<MAX_VEHICLES;v++)
	{
	    if(CarN[v][2]==0)continue;
	    if(CarN[v][2]!=vid)continue;
	    car=v;break;
	}
	return car;
}

GetCarBak(vehicleid)
{
    new model = GetVehicleModel(vehicleid);
    switch(model)
    {
    	case 400,494,495,565:return 77;
        case 401,541:return 78;
        case 402,508,545,578:return 75;
        case 403:return 90;
        case 404,423,529,539,576:return 51;
        case 405,409,440,505,535,536,575,580:return 65;
        case 406..408,460:return 100;
        case 410,530,566:return 45;
        case 411,413,416,427..428,431,433,437,443,451,455..456,459,470,486,506,514..515,524,525,556..557,573,601:return 80;
        case 412,434,419,474,475,478,572,582,534:return 55;
        case 414,461..463,468,482,483,496,562,579,559,560,502..504:return 70;
        case 415,521..523,554,602..603,500,498,499,489,490,477,480,420,421,424,426,429,438,439,445:return 60;
        case 417,425,447,469,476,487,488,497,511..513,577,592,593,563,553,548,519,520:return 250;
        case 418,422,432,436,442,444,458,466,467,485,491,492,507,516..518,526,527,549..551,558,585,588,589,604..605:return 50;
        case 430,452..454,472,473,446,484,493,595:return 150;
        case 448:return 35;
        case 457,471,571,581,583,586:return 40;
        case 479:return 49;
        case 528,555:return 72;
        case 531:return 73;
        case 532:return 93;
        case 533:return 64;
        case 540:return 58;
        case 542,596..599:return 61;
        case 543:return 54;
        case 544:return 86;
        case 546,547:return 52;
        case 552,568:return 62;
        case 561,567:return 53;
        case 574,600:return 43;
        case 587:return 66;
        case 609:return 65;
        default:return 100;
    }
	return false;
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
			format(string,sizeof(string),"`SparkPlug6`='%i' ",Car[c][cSparkPlug6]),strcat(query,string);
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

SCMAdmin(playerid,admin)
{
	if(Player[playerid][pAdmin]<admin)return SCM(playerid,CG1,"Anda tidak memiliki hak istimewa yang memadai untuk mengakses perintah ini!",1);
	if(Player[playerid][pADostup]==0)return SCM(playerid,-1,"Anda belum masuk ke panel admin! /alogin",1);
	else return false;
}


CMD:playervehdel(playerid, params[])
{
	if(SCMAdmin(playerid,1)==1)return true;
	new veh;
    if(IsPlayerInAnyVehicle(playerid)){veh = GetPlayerVehicleID(playerid);}
	else {fGetAroundPlayerVehicleID(playerid, veh,4);}
	if(veh==0)return SCM(playerid,-1,"Tidak ada transportasi di dekat Anda.",1);
	new strrr[300];
	new vehicleid = CarN[veh][2]; // Car[vehicleid][cOwner]
	new targetid;
    
    if(sscanf(params, "i",targetid)) return SCM(playerid, 0xFFDDEEFF, "USAGE: '/playervehdel [targetid]'");
    if(Car[vehicleid][cOwner] == Player[targetid][pID])
    {
    	if(GetVehicleModel(veh) == Car[vehicleid][cModel])
    	{

    		DestroyVehicle(veh);
    		//car = car-1;
    		format(strrr, sizeof(strrr), "DELETE FROM `car` WHERE `number` = '%i'", Car[vehicleid][cNumber]);
    		n_mysql_query(MySQL1 ,strrr,false);
    		SCM(playerid, 0xAACCFFFF, strrr);
    		
    	}
    	else
    	{ 
    		format(strrr, sizeof(strrr), "PLAYERCAR: Wrong modelid vehicle, you in {FFAAAA}modelvehID:%i but need model ID %i {FFCCCC}please find same model.", GetVehicleModel(veh), Car[vehicleid][cModel]);
    		SCM(playerid, 0xFFCCCCFF, strrr);
    	}
    	
    }
    else
    {
    	format(strrr, sizeof(strrr), "PLAYERCAR: Sir you need near player car location wanna to delete, Owner this veh IDdatabase:%i but target OwnerIDinDatabase:%i", Car[vehicleid][cOwner], Player[targetid][pID]);
    		
    	SCM(playerid, 0xFFCCCCFF, strrr);
    }
}


CMD:giveveh(playerid, params[])
{
	new x, y, z, angle, color1, color2, targetid, modelveh;
	
	GetPlayerPos(playerid, Float:x, Float:y, Float:z);
	GetPlayerFacingAngle(playerid, Float:angle);
	if(SCMAdmin(playerid,1)==1)return true;
    if(sscanf(params, "iiii", targetid, modelveh, color1, color2)) return SCM(playerid, CG1, "Gunakan: /giveveh [targetplayerid] [modelvehid] [color1] [color2]");
   
	
				if(CheckMaxCarPlayer(playerid)>=CheckMaxPlayerCars(playerid))return SCM(playerid,-1,"Karakter tersebut tidak dapat memiliki lebih banyak kendaraan pribadi lagi karena server sudah penuh.",1);
				new VID;
			    for(new v=1;v<=MAX_LOAD_CAR;v++)
			    {
			        if(Car[v][cNumber]>0)continue;
			        if(Car[v][cNumber]==0)
			        {
			            VID=v; break; // find emty slot vehicle ID. with find number primary car player
			        }
			    }
			    if(VID==0)return SCM(playerid,-1,"Tidak ada slot lagi untuk kendaraan yang bisa di muat di server.",1);
			    if(Car[VID][cNumber]>0)printf("GIVEVEH: Replacet with same slot player vehicler on car function! %i pemain %s",VID,GN(playerid));
				
				Car[VID][cOwner]=Player[targetid][pID];
			    Car[VID][cModel]= modelveh;
				Car[VID][cPrise]=0;
			    Car[VID][cInt]=0;
				Car[VID][cWorld]=0;
				Car[VID][cHealth]=1000;
				Car[VID][cX]= Float:x;
				Car[VID][cY]= Float:y;
				Car[VID][cZ]= Float:z;
				Car[VID][cA]= Float:angle;
				
				Car[VID][cNumber]=VID;
				
				new carid=CreateVehicle(Car[VID][cModel],Float:x+Float:2.0, Float:y+Float:3.0, Float:z, Float:angle, color1, color2, -1, 0);
			    cFill[carid]=GetCarBak(carid);
				Car[VID][cOil]=3000;
				Car[VID][cAcc]=1000;
				Car[VID][cSparkPlug1]=100;
				Car[VID][cSparkPlug2]=100;
				Car[VID][cSparkPlug3]=100;
				Car[VID][cSparkPlug4]=100;
				Car[VID][cSparkPlug5]=100;
				Car[VID][cSparkPlug6]=100;
			    Run[carid]=0;
			    Run2[carid]=0;
			    DownRun[carid]=0;
			    cEngine[carid]=false;
			    cLamp[carid]=false;
			    cLock[carid]=false;
			    cTrunk[carid]=false;
    			cGlove[carid]=false;
    			cBonnet[carid]=false;
				CarN[carid][2]=VID;

			    new str[170];
				format(str, sizeof(str), "INSERT INTO `Car` (`Number`,`Prise`,`Model`,`Owner`,`ColorA`,`ColorB`) VALUES ('%i','%i','%i','%i','%i','%i')", Car[VID][cNumber], Car[VID][cPrise], Car[VID][cModel], Car[VID][cOwner], color1, color2);
				mysql_query(MySQL1, str);
				SaveCars(carid,VID,1);
				
				SetVehicleVirtualWorld(carid, 0);

				SCM(targetid,-1,"{AADDFF}VEHICLE:{FFFFFF} Anda di berikan mobil baru oleh admin.",1);
				GameTextForPlayer( targetid, "~g~Bonus kendaraan dari\nadmin", 5000, 3);
				GameTextForPlayer( playerid, "~g~Thanks for duty as\nadmin", 5000, 3);
				PutPlayerInVehicle( playerid, carid, 0);
				
		        PlayerGPS[targetid]=true;
		        GetVehiclePos(carid, Float:x, Float:y, Float:z);
				SetPlayerRaceCheckpoint( targetid, 1, Float:x, Float:y, Float:z ,0.0,0.0,0.0,5.0);
				return 1;
}


CMD:setvehhealth(playerid, params[])
{
	if(SCMAdmin(playerid,1)==1)return true;
    if(sscanf(params, "i",params[0])) return SCM(playerid, 0xFFFFAAFF, "Gunakan: '/setvehhealth [Health Value]'");

    extract params -> new Float:health;
    new vehicleid = GetClosestCar(playerid, INVALID_VEHICLE_ID);
    SetVehicleHealth(vehicleid, Float:health);


    //================================================================================

    if(IsPlayerInAnyVehicle(playerid))
    {
        
        SendClientMessage(playerid, -1, "ENGINE: Your changed the vehicle healt from inside");
        return 1;
    }
    else return GameTextForPlayer(playerid, "ENGINE: Your changed the vehicle healt from outside", 5000, 4);
}
