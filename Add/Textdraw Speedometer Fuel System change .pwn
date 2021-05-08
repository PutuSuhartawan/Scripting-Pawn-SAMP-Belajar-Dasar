


UpDateSpeed(playerid)
{
	if(ShowTextSpeed[playerid]==false)return true;
	if(GetPVarInt(playerid,"TickOneSpeed")<2){SetPVarInt(playerid,"TickOneSpeed",1+GetPVarInt(playerid,"TickOneSpeed"));return true;}
	DeletePVar(playerid,"TickOneSpeed");
	new carid=GetPlayerVehicleID(playerid),VID=CarN[carid][2];
	if(cFill[carid]>GetCarBak(carid))cFill[carid]=GetCarBak(carid);
	else if(cFill[carid]<0)cFill[carid]=0;

	new fillcan[16];
	format(fillcan,sizeof(fillcan),"FUEL: %i/%i",cFill[carid],GetCarBak(carid));
	PlayerTextDrawSetString(playerid,Playaspeed[playerid][5],fillcan);

	if(cLock[carid]!=cLock2[carid])
	{
	    cLock2[carid]=cLock[carid];
		switch(cLock[carid])
		{
		    case 0:PlayerTextDrawColor(playerid, Playaspeed[playerid][2], 0xFF9900AA);
		    case 1:PlayerTextDrawColor(playerid, Playaspeed[playerid][2], 0x00490CFF);
		}
		PlayerTextDrawShow(playerid,Playaspeed[playerid][2]);
	}
	if(cEngine[carid]!=cEngine2[carid])
	{
	    cEngine2[carid]=cEngine[carid];
		switch(cEngine[carid])
		{
		    case 0:PlayerTextDrawColor(playerid, Playaspeed[playerid][1], 0xFF9900AA);
		    case 1:PlayerTextDrawColor(playerid, Playaspeed[playerid][1], 0x00490CFF);
		}
		PlayerTextDrawShow(playerid,Playaspeed[playerid][1]);
	}
	if(gRem[playerid]!=gRem2[playerid])
	{
	    gRem2[playerid]=gRem[playerid];
		switch(gRem[playerid])
		{
		    case 0:
			{
				PlayerTextDrawColor(playerid, Playaspeed2[playerid][0], 0xFF9900AA);
				PlayerTextDrawColor(playerid, Playaspeed2[playerid][1], 0xFF9900AA);
				PlayerTextDrawColor(playerid, Playaspeed2[playerid][2], 0xFF9900AA);
				PlayerTextDrawColor(playerid, Playaspeed2[playerid][3], 0xFF9900AA);
				PlayerTextDrawColor(playerid, Playaspeed2[playerid][4], 0xFF9900AA);
				PlayerTextDrawColor(playerid, Playaspeed2[playerid][5], 0xFF9900AA);
			}
		    case 1:
			{
				PlayerTextDrawColor(playerid, Playaspeed2[playerid][0], 0xA84609FF);
				PlayerTextDrawColor(playerid, Playaspeed2[playerid][1], 0xA84609FF);
				PlayerTextDrawColor(playerid, Playaspeed2[playerid][2], 0xA84609FF);
				PlayerTextDrawColor(playerid, Playaspeed2[playerid][3], 0x303030FF);
				PlayerTextDrawColor(playerid, Playaspeed2[playerid][4], 0x404040FF);
				PlayerTextDrawColor(playerid, Playaspeed2[playerid][5], 0x404040FF);
			}
		}
		PlayerTextDrawShow(playerid,Playaspeed2[playerid][0]);
		PlayerTextDrawShow(playerid,Playaspeed2[playerid][1]);
		PlayerTextDrawShow(playerid,Playaspeed2[playerid][2]);
		PlayerTextDrawShow(playerid,Playaspeed2[playerid][3]);
		PlayerTextDrawShow(playerid,Playaspeed2[playerid][4]);
		PlayerTextDrawShow(playerid,Playaspeed2[playerid][5]);
	}
	if(cLamp[carid]!=cLamp2[carid])
	{
	    cLamp2[carid]=cLamp[carid];
		switch(cLamp[carid])
		{
		    case 0:
			{
				PlayerTextDrawColor(playerid, Playaspeed3[playerid][0], 0xFF9900AA);
				PlayerTextDrawColor(playerid, Playaspeed3[playerid][1], 0xFF9900AA);
				PlayerTextDrawColor(playerid, Playaspeed3[playerid][2], 0xFF9900AA);
				PlayerTextDrawColor(playerid, Playaspeed3[playerid][3], 0xFF9900AA);
				PlayerTextDrawColor(playerid, Playaspeed3[playerid][4], 0xFF9900AA);
			}
		    case 1:
			{
				PlayerTextDrawColor(playerid, Playaspeed3[playerid][0], 0xC8A000FF);
				PlayerTextDrawColor(playerid, Playaspeed3[playerid][1], 0xC8A000FF);
				PlayerTextDrawColor(playerid, Playaspeed3[playerid][2], 0xC8A000FF);
				PlayerTextDrawColor(playerid, Playaspeed3[playerid][3], 0xC8A000FF);
				PlayerTextDrawColor(playerid, Playaspeed3[playerid][4], 0xC8A000FF);
			}
		}
		PlayerTextDrawShow(playerid,Playaspeed3[playerid][0]);
		PlayerTextDrawShow(playerid,Playaspeed3[playerid][1]);
		PlayerTextDrawShow(playerid,Playaspeed3[playerid][2]);
		PlayerTextDrawShow(playerid,Playaspeed3[playerid][3]);
		PlayerTextDrawShow(playerid,Playaspeed3[playerid][4]);
	}
	new stat[4];
	GetVehicleDamageStatus(carid,stat[0],stat[1],stat[2],stat[3]);
	if(stat[2]!=0&&StatLights[playerid]==false)
	{
		PlayerTextDrawSetString(playerid,Playaspeed3[playerid][5],"!");
		StatLights[playerid]=true;
	}
	if(stat[2]==0&&StatLights[playerid]==true)
	{
		PlayerTextDrawSetString(playerid,Playaspeed3[playerid][5],"_");
		StatLights[playerid]=false;
	}
	new Float:hpcar;
	GetVehicleHealth(carid,hpcar);
	if(hpcar<=647&&cHPpanel[playerid]==false)
	{
	    cHPpanel[playerid]=true;
		PlayerTextDrawColor(playerid, Playaspeed6[playerid][0], 0xFF0000FF);
		PlayerTextDrawColor(playerid, Playaspeed6[playerid][1], 0xFF0000FF);
		PlayerTextDrawColor(playerid, Playaspeed6[playerid][2], 0xFF0000FF);
		PlayerTextDrawColor(playerid, Playaspeed6[playerid][3], 0xFF0000FF);
		PlayerTextDrawColor(playerid, Playaspeed6[playerid][4], 0xFF0000FF);
		PlayerTextDrawColor(playerid, Playaspeed6[playerid][5], 0xFF0000FF);
		PlayerTextDrawShow(playerid,Playaspeed6[playerid][0]);
		PlayerTextDrawShow(playerid,Playaspeed6[playerid][1]);
		PlayerTextDrawShow(playerid,Playaspeed6[playerid][2]);
		PlayerTextDrawShow(playerid,Playaspeed6[playerid][3]);
		PlayerTextDrawShow(playerid,Playaspeed6[playerid][4]);
		PlayerTextDrawShow(playerid,Playaspeed6[playerid][5]);
	}
	if(hpcar>647&&cHPpanel[playerid]==true)
	{
	    cHPpanel[playerid]=false;
		PlayerTextDrawColor(playerid, Playaspeed6[playerid][0], 0xFF9900AA);
		PlayerTextDrawColor(playerid, Playaspeed6[playerid][1], 0xFF9900AA);
		PlayerTextDrawColor(playerid, Playaspeed6[playerid][2], 0xFF9900AA);
		PlayerTextDrawColor(playerid, Playaspeed6[playerid][3], 0xFF9900AA);
		PlayerTextDrawColor(playerid, Playaspeed6[playerid][4], 0xFF9900AA);
		PlayerTextDrawColor(playerid, Playaspeed6[playerid][5], 0xFF9900AA);
		PlayerTextDrawShow(playerid,Playaspeed6[playerid][0]);
		PlayerTextDrawShow(playerid,Playaspeed6[playerid][1]);
		PlayerTextDrawShow(playerid,Playaspeed6[playerid][2]);
		PlayerTextDrawShow(playerid,Playaspeed6[playerid][3]);
		PlayerTextDrawShow(playerid,Playaspeed6[playerid][4]);
		PlayerTextDrawShow(playerid,Playaspeed6[playerid][5]);
	}
	if(VID>0)
	{
		if(Car[VID][cOil]<1100&&cOilpanel[playerid]==false)
		{
		    cOilpanel[playerid]=true;
			PlayerTextDrawColor(playerid, Playaspeed5[playerid][0], 0xFF0000FF);
			PlayerTextDrawColor(playerid, Playaspeed5[playerid][1], 0xFF0000FF);
			PlayerTextDrawColor(playerid, Playaspeed5[playerid][2], 0xFF0000FF);
			PlayerTextDrawShow(playerid,Playaspeed5[playerid][0]);
			PlayerTextDrawShow(playerid,Playaspeed5[playerid][1]);
			PlayerTextDrawShow(playerid,Playaspeed5[playerid][2]);
		}
		if(Car[VID][cOil]>=1100&&cOilpanel[playerid]==true)
		{
		    cOilpanel[playerid]=false;
			PlayerTextDrawColor(playerid, Playaspeed5[playerid][0], 0xFF9900AA);
			PlayerTextDrawColor(playerid, Playaspeed5[playerid][1], 0xFF9900AA);
			PlayerTextDrawColor(playerid, Playaspeed5[playerid][2], 0xFF9900AA);
			PlayerTextDrawShow(playerid,Playaspeed5[playerid][0]);
			PlayerTextDrawShow(playerid,Playaspeed5[playerid][1]);
			PlayerTextDrawShow(playerid,Playaspeed5[playerid][2]);
		}
		if(Car[VID][cAcc]<100&&cAccpanel[playerid]==false)
		{
		    cAccpanel[playerid]=true;
			PlayerTextDrawColor(playerid, Playaspeed4[playerid][0], 0xFF0000FF);
			PlayerTextDrawColor(playerid, Playaspeed4[playerid][1], 0xFF0000FF);
			PlayerTextDrawColor(playerid, Playaspeed4[playerid][2], 0xFF0000FF);
			PlayerTextDrawColor(playerid, Playaspeed4[playerid][4], 0xFF0000FF);
			PlayerTextDrawColor(playerid, Playaspeed4[playerid][5], 0xFF0000FF);
			PlayerTextDrawShow(playerid,Playaspeed4[playerid][0]);
			PlayerTextDrawShow(playerid,Playaspeed4[playerid][1]);
			PlayerTextDrawShow(playerid,Playaspeed4[playerid][2]);
			PlayerTextDrawShow(playerid,Playaspeed4[playerid][4]);
			PlayerTextDrawShow(playerid,Playaspeed4[playerid][5]);
		}
		if(Car[VID][cAcc]>=100&&cAccpanel[playerid]==true)
		{
		    cAccpanel[playerid]=false;
			PlayerTextDrawColor(playerid, Playaspeed4[playerid][0], 0xFF9900AA);
			PlayerTextDrawColor(playerid, Playaspeed4[playerid][1], 0xFF9900AA);
			PlayerTextDrawColor(playerid, Playaspeed4[playerid][2], 0xFF9900AA);
			PlayerTextDrawColor(playerid, Playaspeed4[playerid][4], 0xFF9900AA);
			PlayerTextDrawColor(playerid, Playaspeed4[playerid][5], 0xFF9900AA);
			PlayerTextDrawShow(playerid,Playaspeed4[playerid][0]);
			PlayerTextDrawShow(playerid,Playaspeed4[playerid][1]);
			PlayerTextDrawShow(playerid,Playaspeed4[playerid][2]);
			PlayerTextDrawShow(playerid,Playaspeed4[playerid][4]);
			PlayerTextDrawShow(playerid,Playaspeed4[playerid][5]);
		}
	}
	return true;
}
UpDateVehiclePanel(playerid)
{
	PlayerTextDrawSetString(playerid,Playaspeed3[playerid][5],"_");

	PlayerTextDrawColor(playerid, Playaspeed4[playerid][0], 0xFF9900AA);
	PlayerTextDrawColor(playerid, Playaspeed4[playerid][1], 0xFF9900AA);
	PlayerTextDrawColor(playerid, Playaspeed4[playerid][2], 0xFF9900AA);
	PlayerTextDrawColor(playerid, Playaspeed4[playerid][4], 0xFF9900AA);
	PlayerTextDrawColor(playerid, Playaspeed4[playerid][5], 0xFF9900AA);
	PlayerTextDrawShow(playerid,Playaspeed4[playerid][0]);
	PlayerTextDrawShow(playerid,Playaspeed4[playerid][1]);
	PlayerTextDrawShow(playerid,Playaspeed4[playerid][2]);
	PlayerTextDrawShow(playerid,Playaspeed4[playerid][4]);
	PlayerTextDrawShow(playerid,Playaspeed4[playerid][5]);

	PlayerTextDrawColor(playerid, Playaspeed5[playerid][0], 0xFF9900AA);
	PlayerTextDrawColor(playerid, Playaspeed5[playerid][1], 0xFF9900AA);
	PlayerTextDrawColor(playerid, Playaspeed5[playerid][2], 0xFF9900AA);
	PlayerTextDrawShow(playerid,Playaspeed5[playerid][0]);
	PlayerTextDrawShow(playerid,Playaspeed5[playerid][1]);
	PlayerTextDrawShow(playerid,Playaspeed5[playerid][2]);

	PlayerTextDrawColor(playerid, Playaspeed6[playerid][0], 0xFF9900AA);
	PlayerTextDrawColor(playerid, Playaspeed6[playerid][1], 0xFF9900AA);
	PlayerTextDrawColor(playerid, Playaspeed6[playerid][2], 0xFF9900AA);
	PlayerTextDrawColor(playerid, Playaspeed6[playerid][3], 0xFF9900AA);
	PlayerTextDrawColor(playerid, Playaspeed6[playerid][4], 0x202020FF);
	PlayerTextDrawColor(playerid, Playaspeed6[playerid][5], 0x202020FF);
	PlayerTextDrawShow(playerid,Playaspeed6[playerid][0]);
	PlayerTextDrawShow(playerid,Playaspeed6[playerid][1]);
	PlayerTextDrawShow(playerid,Playaspeed6[playerid][2]);
	PlayerTextDrawShow(playerid,Playaspeed6[playerid][3]);
	PlayerTextDrawShow(playerid,Playaspeed6[playerid][4]);
	PlayerTextDrawShow(playerid,Playaspeed6[playerid][5]);

	PlayerTextDrawColor(playerid, Playaspeed2[playerid][0], 0xFF9900AA);
	PlayerTextDrawColor(playerid, Playaspeed2[playerid][1], 0xFF9900AA);
	PlayerTextDrawColor(playerid, Playaspeed2[playerid][2], 0xFF9900AA);
	PlayerTextDrawColor(playerid, Playaspeed2[playerid][3], 0xFF9900AA);
	PlayerTextDrawColor(playerid, Playaspeed2[playerid][4], 0xFF9900AA);
	PlayerTextDrawColor(playerid, Playaspeed2[playerid][5], 0xFF9900AA);
	PlayerTextDrawShow(playerid,Playaspeed2[playerid][0]);
	PlayerTextDrawShow(playerid,Playaspeed2[playerid][1]);
	PlayerTextDrawShow(playerid,Playaspeed2[playerid][2]);
	PlayerTextDrawShow(playerid,Playaspeed2[playerid][3]);
	PlayerTextDrawShow(playerid,Playaspeed2[playerid][4]);
	PlayerTextDrawShow(playerid,Playaspeed2[playerid][5]);
	return true;
}
CheckModelRunFuel(vehicleid)
{
	new prob[7];
	new model = GetVehicleModel(vehicleid);
    switch(model)
    {
        case 432,605:{prob="1.0";}
        case 604:{prob="1.1";}
        case 406,444,463,568,594:{prob="1.2";}
        case 408,429,433,451,455,482,483,506,571:{prob="1.3";}
        case 407,477,486,494,581:{prob="1.4";}
        case 416,423,434,443,456,480,522,531,564,582,601:{prob="1.5";}
        case 403,414,437,461,495,515,541,587,603:{prob="1.6";}
		case 400,413,415,427,431,459,466,467,468,478,485,499,501,508,514,530,556,557,602:{prob="1.7";}
		case 411,440,462,471,475,490,521,524,544,552,559,579:{prob="1.8";}
		case 402,418,422,428,439,442,457,473,479,489,498,505,507,523,528,534,536,555,560,567,572,573,580,583,586,588:{prob="1.9";}
		case 420,470,504,518,527,532,535,540,600:{prob="2.0";}
		case 401,409,419,421,438,448,454,458,464,465,474,516,517,526,533,539,542,562,578,585,599,609:{prob="2.1";}
		case 405,412,424,426,491,496,503,554,558,565,575:{prob="2.2";}
		case 404,445,492,500,502,525,529,546,561,566,596,597,598:{prob="2.3";}
		case 436,543,547,549,550:{prob="2.4";}
		case 410,447,452,545,576:{prob="2.5";}
		case 417,453,551,589,595:{prob="2.6";}
		case 430,469,484,488:{prob="2.7";}
		case 460,472,476:{prob="2.8";}
		case 425,487:{prob="2.9";}
		case 446,512,574:{prob="3.0";}
		case 493,513,593:{prob="3.1";}
		case 497,511,563:{prob="3.2";}
		case 519,548:{prob="3.3";}
		case 592:{prob="3.5";}
		case 553:{prob="3.7";}
		case 441,520,577:{prob="4.0";}
		default:{prob="2.1";}
    }
    return prob;
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
PlayerLicDrunk(playerid)
{
	switch(GetVehicleModel(GetPlayerVehicleID(playerid)))
	{
	    case 448,457,461..463,468,471,485,521..523,571,581,586,594:{if(Player[playerid][pSLicA]==0)return true;}
	    case 400..402,404,405,409..412,415,419..422,424,426,429,434,436,438,439,441,442,445,451,458,466,467,474,477..480,
		489..492,494..496,500,502..507,516..518,525..527,529,533..536,540..543,545..547,549..551,554,555,558..562,565..568,
		575,576,579,580,585,587,589,596..598,600,602..605:{if(Player[playerid][pSLicB]==0)return true;}
		case 403,406..408,413..414,416,418,423,427,428,431..433,435,437,440,443,444,449,450,455,456,459,470475,483,544,486,
		498,499,508,514,515,524,528,530,531,532,537,538,552,556,557,569,570,572,
		573,574,578,582..584,588,590..591,599,601,606..611:{if(Player[playerid][pSLicC]==0)return true;}
		case 417,425,447,460,464,465,469,476,487,488,497,501,511..513,519,
		520,548,553,563,564,577,592,593:{if(Player[playerid][pSLicF]==0)return true;}
		case 430,446,452..454,472,473,484,493,539,595:{if(Player[playerid][pSLicG]==0)return true;}
	    default:return false;
	}
	return false;
}

n_mysql_query(con,query[],bool:cache = true)
{
    if(MySQLconnect==false)return SCMALL(CG1,"Saving in MySQL");
    new time = GetTickCount();
	if(cache==true)mysql_query(con ,query);
	else if(cache==false)mysql_query(con ,query,false);
    if(DeBag==true){printf("%s - <%i Mili Second>",query,GetTickCount()-time);}
	return true;
}

GivePlayerHealth(playerid,Float:hp,save=0)
{
    PauseHP[playerid]=10;
	Player[playerid][pHealth]+=hp;
	if(Player[playerid][pHealth]>100){Player[playerid][pHealth]=100;}
	if(Player[playerid][pHealth]<0){Player[playerid][pHealth]=0;}
	SetPlayerHealth(playerid,Player[playerid][pHealth]);
	if(save==1)SavePlayer(playerid,Healthx);
	return true;
}

DeleteCar(veh,num=0)
{
	cEngine[veh]=false;
	cLamp[veh]=false;
	cLock[veh]=false;
	cTrunk[veh]=false;
    cGlove[veh]=false;
    cBonnet[veh]=false;
	cFill[veh]=20;
	cFillTick[veh]=false;
	gCarH[veh]=1000;
	Run[veh]=0;
	Run2[veh]=0;
	DownRun[veh]=0;
	VehicleGasFuel[veh]=0;
	DownFuel[veh]=0;
	RunCars[veh]=0;
	DownFillRun[veh]=0;
	if(CarN[veh][2]>0&&num==1)
	{
		Car[CarN[veh][2]] = Car[MAX_LOAD_CAR];
		CarSave[CarN[veh][2]] = CarSave[MAX_LOAD_CAR];
	}
	if(CarN[veh][2]>0&&num==0)
	{
//	    new idscar=Car[CarN[veh][2]][cNumber],owner=Car[CarN[veh][2]][cOwner];
//		Car[CarN[veh][2]] = Car[MAX_LOAD_CAR];
		CarSave[CarN[veh][2]] = CarSave[MAX_LOAD_CAR];
//		Car[CarN[veh][2]][cNumber]=idscar;
//		Car[CarN[veh][2]][cOwner]=owner;
	}
	for(new i;i<7;i++)
	{
		CarN[veh][i]=0;
	}
	for(new i=1;i<8;i++)
	{
	    VehicleItem1[veh][i]=0;
	    VehicleItem2[veh][i]=0;
	    VehicleItem3[veh][i]=0;
	}
	for(new i=1;i<8;i++)
	{
	    VehicleGloveItem1[veh][i]=0;
	    VehicleGloveItem2[veh][i]=0;
	    VehicleGloveItem3[veh][i]=0;
	}
	for(new t=1000;t<=1193;t++)RemoveVehicleComponent(veh,t);
/*
	RemoveVehicleComponent(carid, GetVehicleComponentInSlot(carid, CARMODTYPE_SPOILER));
	RemoveVehicleComponent(carid, GetVehicleComponentInSlot(carid, CARMODTYPE_HOOD));
	RemoveVehicleComponent(carid, GetVehicleComponentInSlot(carid, CARMODTYPE_ROOF));
	RemoveVehicleComponent(carid, GetVehicleComponentInSlot(carid, CARMODTYPE_SIDESKIRT));
	RemoveVehicleComponent(carid, GetVehicleComponentInSlot(carid, CARMODTYPE_LAMPS));
	RemoveVehicleComponent(carid, GetVehicleComponentInSlot(carid, CARMODTYPE_NITRO));
	RemoveVehicleComponent(carid, GetVehicleComponentInSlot(carid, CARMODTYPE_EXHAUST));
	RemoveVehicleComponent(carid, GetVehicleComponentInSlot(carid, CARMODTYPE_WHEELS));
	RemoveVehicleComponent(carid, GetVehicleComponentInSlot(carid, CARMODTYPE_STEREO));
	RemoveVehicleComponent(carid, GetVehicleComponentInSlot(carid, CARMODTYPE_HYDRAULICS));
	RemoveVehicleComponent(carid, GetVehicleComponentInSlot(carid, CARMODTYPE_FRONT_BUMPER));
	RemoveVehicleComponent(carid, GetVehicleComponentInSlot(carid, CARMODTYPE_REAR_BUMPER));
	RemoveVehicleComponent(carid, GetVehicleComponentInSlot(carid, CARMODTYPE_VENT_RIGHT));
	RemoveVehicleComponent(carid, GetVehicleComponentInSlot(carid, CARMODTYPE_VENT_LEFT));
	*/
	DestroyVehicle(veh);
	return true;
}

stock NameCars(vehicleid)
{
	new text[64];
	switch(vehicleid)
	{
	    case 400: text="Landstalker";
		case 401: text="Bravura";
		case 402: text="Buffalo";
		case 403: text="Linerunner";
		case 404: text="Perenniel";
		case 405: text="Sentinel";
		case 406: text="Dumper";
		case 407: text="Firetruck";
		case 408: text="Trashmaster";
		case 409: text="Stretch";
		case 410: text="Manana";
		case 411: text="Infernus";
		case 412: text="Voodoo";
		case 413: text="Pony";
		case 414: text="Mule";
		case 415: text="Cheetah";
		case 416: text="Ambulance";
		case 417: text="Leviathan";
		case 418: text="Moonbeam";
		case 419: text="Esperanto";
		case 420: text="Taxi";
		case 421: text="Washington";
		case 422: text="Bobcat";
		case 423: text="Mr Whoopee";
		case 424: text="BF Injection";
		case 425: text="Hunter";
		case 426: text="Premier";
		case 427: text="Enforcer";
		case 428: text="Securicar";
		case 429: text="Banshee";
		case 430: text="Predator";
		case 431: text="Bus";
		case 432: text="Rhino";
		case 433: text="Barracks";
		case 434: text="Hotknife";
		case 435: text="Article Trailer";
		case 436: text="Previon";
		case 437: text="Coach";
		case 438: text="Cabbie";
		case 439: text="Stallion";
		case 440: text="Rumpo";
		case 441: text="RC Bandit";
		case 442: text="Romero";
		case 443: text="Packer";
		case 444: text="Monster";
		case 445: text="Admiral";
		case 446: text="Squallo";
		case 447: text="Seasparrow";
		case 448: text="Pizzaboy";
		case 449: text="Tram";
		case 450: text="Article Trailer 2";
		case 451: text="Turismo";
		case 452: text="Speeder";
		case 453: text="Reefer";
		case 454: text="Tropic";
		case 455: text="Flatbed";
		case 456: text="Yankee";
		case 457: text="Caddy";
		case 458: text="Solair";
		case 459: text="Topfun Van (Berkley's RC)";
		case 460: text="Skimmer";
		case 461: text="PCJ-600";
		case 462: text="Faggio";
		case 463: text="Freeway";
		case 464: text="RC Baron";
		case 465: text="RC Raider";
		case 466: text="Glendale";
		case 467: text="Oceanic";
		case 468: text="Sanchez";
		case 469: text="Sparrow";
		case 470: text="Patriot";
		case 471: text="Quad";
		case 472: text="Coastguard";
		case 473: text="Dinghy";
		case 474: text="Hermes";
		case 475: text="Sabre";
		case 476: text="Rustler";
		case 477: text="ZR-350";
		case 478: text="Walton";
		case 479: text="Regina";
		case 480: text="Comet";
		case 481: text="BMX";
		case 482: text="Burrito";
		case 483: text="Camper";
		case 484: text="Marquis";
		case 485: text="Baggage";
		case 486: text="Dozer";
		case 487: text="Maverick";
		case 488: text="SAN News Maverick";
		case 489: text="Rancher";
		case 490: text="FBI Rancher";
		case 491: text="Virgo";
		case 492: text="Greenwood";
		case 493: text="Jetmax";
		case 494: text="Hotring Racer";
		case 495: text="Sandking";
		case 496: text="Blista Compact";
		case 497: text="Police Maverick";
		case 498: text="Boxville";
		case 499: text="Benson";
		case 500: text="Mesa";
		case 501: text="RC Goblin";
		case 502: text="Hotring Racer";
		case 503: text="Hotring Racer";
		case 504: text="Bloodring Banger";
		case 505: text="Rancher";
		case 506: text="Super GT";
		case 507: text="Elegant";
		case 508: text="Journey";
		case 509: text="Bike";
		case 510: text="Mountain Bike";
		case 511: text="Beagle";
		case 512: text="Cropduster";
		case 513: text="Stuntplane";
		case 514: text="Tanker";
		case 515: text="Roadtrain";
		case 516: text="Nebula";
		case 517: text="Majestic";
		case 518: text="Buccaneer";
		case 519: text="Shamal";
		case 520: text="Hydra";
		case 521: text="FCR-900";
		case 522: text="NRG-500";
		case 523: text="HPV1000";
		case 524: text="Cement Truck";
		case 525: text="Towtruck";
		case 526: text="Fortune";
		case 527: text="Cadrona";
		case 528: text="FBI Truck";
		case 529: text="Willard";
		case 530: text="Forklift";
		case 531: text="Tractor";
		case 532: text="Combine Harvester";
		case 533: text="Feltzer";
		case 534: text="Remington";
		case 535: text="Slamvan";
		case 536: text="Blade";
		case 537: text="Freight (Train)";
		case 538: text="Brownstreak(Train)";
		case 539: text="Vortex";
		case 540: text="Vincent";
		case 541: text="Bullet";
		case 542: text="Clover";
		case 543: text="Sadler";
		case 544: text="Firetruck LA";
		case 545: text="Hustler";
		case 546: text="Intruder";
		case 547: text="Primo";
		case 548: text="Cargobob";
		case 549: text="Tampa";
		case 550: text="Sunrise";
		case 551: text="Merit";
		case 552: text="Utility Van";
		case 553: text="Nevada";
		case 554: text="Yosemite";
		case 555: text="Windsor";
		case 556: text="Monster";
		case 557: text="Monster";
		case 558: text="Uranus";
		case 559: text="Jester";
		case 560: text="Sultan";
		case 561: text="Stratum";
		case 562: text="Elegy";
		case 563: text="Raindance";
		case 564: text="RC Tiger";
		case 565: text="Flash";
		case 566: text="Tahoma";
		case 567: text="Savanna";
		case 568: text="Bandito";
		case 569: text="Freight Flat Trailer (Train)";
		case 570: text="Streak Trailer (Train)";
		case 571: text="Kart";
		case 572: text="Mower";
		case 573: text="Dune";
		case 574: text="Sweeper";
		case 575: text="Broadway";
		case 576: text="Tornado";
		case 577: text="AT400";
		case 578: text="DFT-30";
		case 579: text="Huntley";
		case 580: text="Stafford";
		case 581: text="BF-400";
		case 582: text="Newsvan";
		case 583: text="Tug";
		case 584: text="Petrol Trailer";
		case 585: text="Emperor";
		case 586: text="Wayfarer";
		case 587: text="Euros";
		case 588: text="Hotdog";
		case 589: text="Club";
		case 590: text="Freight Box Trailer (Train)";
		case 591: text="Article Trailer 3";
		case 592: text="Andromada";
		case 593: text="Dodo";
		case 594: text="RC Cam";
		case 595: text="Launch";
		case 596: text="Police Car (LSPD)";
		case 597: text="Police Car (SFPD)";
		case 598: text="Police Car (LVPD)";
		case 599: text="Police Ranger";
		case 600: text="Picador";
		case 601: text="S.W.A.T.";
		case 602: text="Alpha";
		case 603: text="Phoenix";
		case 604: text="Glendale Shit";
		case 605: text="Sadler Shit";
		case 606: text="Baggage Trailer";
		case 607: text="Baggage Trailer";
		case 608: text="Tug Stairs Trailer";
		case 609: text="Boxville";
		case 610: text="Farm Trailer";
		case 611: text="Utility Trailer";
		default: text="None";
	}
	return text;
}

stock PriseCars(vehicleid)
{
	new prise;
	switch(vehicleid)
	{
	    case 400:prise=13600;
		case 401:prise=10020;
		case 402:prise=21090;
		case 404:prise=6500;
		case 405:prise=9290;
		case 410:prise=8790;
		case 411:prise=86700;
		case 412:prise=9200;
		case 413:prise=5500;
		case 415:prise=59600;
		case 418:prise=6600;
		case 419:prise=8990;
		case 421:prise=7860;
		case 422:prise=5780;
		case 424:prise=8200;
		case 426:prise=9450;
		case 429:prise=70280;
		case 434:prise=26700;
		case 436:prise=8920;
		case 439:prise=11560;
		case 440:prise=6400;
		case 445:prise=9560;
		case 451:prise=53270;
		case 458:prise=7620;
		case 459:prise=6680;
		case 461:prise=12300;
		case 462:prise=920;
		case 463:prise=11600;
		case 466:prise=7280;
		case 467:prise=6970;
		case 468:prise=9780;
		case 471:prise=3400;
		case 474:prise=5980;
		case 475:prise=8720;
		case 477:prise=18000;
		case 478:prise=5600;
		case 479:prise=6250;
		case 480:prise=34980;
		case 482:prise=6700;
		case 483:prise=6400;
		case 489:prise=12050;
		case 491:prise=11670;
		case 492:prise=10670;
		case 496:prise=8670;
		case 500:prise=5690;
		case 505:prise=12760;
		case 506:prise=32900;
		case 507:prise=14600;
		case 516:prise=7980;
		case 517:prise=8790;
		case 518:prise=7620;
		case 521:prise=28290;
		case 522:prise=57200;
		case 526:prise=19990;
		case 527:prise=14560;
		case 529:prise=12600;
		case 533:prise=10720;
		case 534:prise=12690;
		case 535:prise=13490;
		case 536:prise=10670;
		case 540:prise=11860;
		case 541:prise=69200;
		case 542:prise=9500;
		case 543:prise=7211;
		case 545:prise=54090;
		case 546:prise=14600;
		case 547:prise=12460;
		case 549:prise=10670;
		case 550:prise=11980;
		case 551:prise=15600;
		case 554:prise=15760;
		case 555:prise=33690;
		case 558:prise=36300;
		case 559:prise=65240;
		case 560:prise=67290;
		case 561:prise=25600;
		case 562:prise=66200;
		case 565:prise=25620;
		case 566:prise=12650;
		case 567:prise=10620;
		case 568:prise=12500;
		case 575:prise=8200;
		case 576:prise=8720;
		case 579:prise=67280;
		case 580:prise=18200;
		case 581:prise=25200;
		case 585:prise=18720;
		case 586:prise=10720;
		case 587:prise=67200;
		case 589:prise=25200;
		case 600:prise=12300;
		case 602:prise=65270;
		case 603:prise=67200;
		default:prise=0;
	}
	return prise;
}
GetPlayerNameID(playerid,&id=-1)
{
	new name[32];
	if(playerid<=0){format(name,sizeof(name),"Kosong");}
	else
	{
		for(new i=0;i<=GetPlayerPoolSize();i++)
		{
		    if(Player[i][pID]==playerid)
			{
			    name="";
			    format(name,sizeof(name),"%s",GN(i));
			    id=i;
				return name;
			}
		}
		new str[168];
		format(str, sizeof(str),"SELECT `Name` FROM `PlayaRP` WHERE `ID` = '%i'",playerid);
		n_mysql_query(MySQL1, str);
		new rows,fields;
	    cache_get_data(rows,fields);
	    if(rows)
	    {
			name="";
	    	cache_get_field_content(0, "Name",name);
	    	return name;
	    }
	}
    return name;
}
stock CheckModelCar(vehicleid,model=0)
{
    if(model<=0){model = GetVehicleModel(vehicleid);}
    switch(model)
    {
        case 400..416,418..424,426..429,431..434,436..440,442..445,451,455..459,466,467,476,474,475,477..480,482,483,485,486,489..492,494,495,496,498: return true;
        case 499,500,502..508,514..518,524..536,540..547,549..552,554..562,565..568,572..576,579,580,582,583,585,587..589,596..605,609:return true;
    }
	return false;
}


AllDownFuel()
{
    for(new v=0;v<=GetVehiclePoolSize();v++)
	{
	    if(!IsValidVehicle(v))continue;
	    MinusLifeProdVehisle(v);
		if(CarN[v][6]>0)
		{
			new oks;
			for(new i;i<=GetPlayerPoolSize();i++)
		    {
		        if(!IsPlayerConnected(i))continue;
		        if(IsPlayerNPC(i))continue;
		        if(Player[i][pConnect]==false)continue;
		        if(GetPlayerVehicleID(i)==CarN[v][6])oks++;
		    }
		    if(oks<=0)
		    {
				CarN[v][6]=0;
		        DeleteCar(v);
		    }
		}
	    if(CarStartEngine[v]>0)
	    {
	        CarStartEngine[v]--;
	        if(CarStartEngine[v]==100)
	        {
			    if(CarStartEngPlaya[v]>=0)
			    {
					new string[86];
					format(string, sizeof(string), "** Mesin berhenti bekerja -: %s",GN(CarStartEngPlaya[v]));
					//SayAllVeh(10, v, string, 0xC87DD8FF);//COLOR_PURPLE);
					SCM(CarStartEngPlaya[v],0xC87DD8FF,string);
	            }
	            CarStartEngPlaya[v]=-1;
	            CarStartEngine[v]=0;
	        }
	        else if(CarStartEngine[v]<=0)
	        {
	            CarStartEngine[v]=0;
	            new EngRand=random(6),vid=CarN[v][2];
	            if(Car[vid][cEngineStar]==1)
	            {
	                EngRand=0;
	            }
	            if(Car[vid][cOil]<1000&&vid>0)
	            {
	                EngRand=random(14);
	            }
				switch(EngRand)
				{
				    case 0,1,3,4,5:
				    {
						new engine,lights,alarm,doors,bonnet,boot,objective;
						GetVehicleParamsEx(v,engine,lights,alarm,doors,bonnet,boot,objective);
					    n_SetVehicleParamsEx(v,1,lights,alarm,doors,bonnet,boot,objective);
					    cEngine[v]=true;
						if(vid>0)SaveCars(v,vid,1);
					    if(CarStartEngPlaya[v]>=0)
					    {
							new string[86];
							format(string, sizeof(string), "** Mesin mulai -: %s",GN(CarStartEngPlaya[v]));
							//SayAllVeh(10, v, string, 0xC87DD8FF);//COLOR_PURPLE);
							SCM(CarStartEngPlaya[v],0xC87DD8FF,string);
							SetPlayerChatBubble(CarStartEngPlaya[v], "** Mesinnya hidup.", COLOR_PURPLE, 20.0, 3000);
			            }
			            CarStartEngPlaya[v]=-1;
					}
					default:
					{
					    if(CarStartEngPlaya[v]>=0)
					    {
							new string[86];
							format(string, sizeof(string), "** Mesin macet -: %s",GN(CarStartEngPlaya[v]));
							//SayAllVeh(10, v, string, 0xC87DD8FF);//COLOR_PURPLE);
							SCM(CarStartEngPlaya[v],0xC87DD8FF,string);
							SetPlayerChatBubble(CarStartEngPlaya[v], "** Mesinnya macet.", COLOR_PURPLE, 20.0, 3000);
							if(EngRand==100)
							{
							    SCM(CarStartEngPlaya[v],CG1,"Anda terlalu cepat menekan gas. (Jangan pegang tombol W dan S saat mesin baru hidup!)");
							}
			            }
			            CarStartEngPlaya[v]=-1;
					}
			    }
	        }
	    }
	    new Float:hp;
	    GetVehicleHealth(v,hp);
	    if(hp<400)
		{
			SetVehicleHealth(v,400);
			if(cEngine[v]==true)
			{
				new engine,lights,alarm,doors,bonnet,boot,objective;
				GetVehicleParamsEx(v,engine,lights,alarm,doors,bonnet,boot,objective);
			    n_SetVehicleParamsEx(v,0, lights, alarm, doors, bonnet, boot, objective);
			    cEngine[v]=false;
			    SavePosVehicle(v);
			}
		}
	    if(CarN[v][2]>0)
	    {
	        Car[CarN[v][2]][cSavePos]++;
	        if(Car[CarN[v][2]][cSavePos]>=300)
	        {
	            Car[CarN[v][2]][cSavePos]=0;
	            SavePosVehicle(v);
	        }
		    /*if(Car[CarN[v][2]][cDelTime]>0&&Car[CarN[v][2]][cDelTime]<Time)
		    {
				DeleteCar(v);
		    }*/
	    }
	    if(IsVelo(v))
	    {
			new engine,lights,alarm,doors,bonnet,boot,objective;
			GetVehicleParamsEx(v,engine,lights,alarm,doors,bonnet,boot,objective);
			n_SetVehicleParamsEx(v,engine,lights,alarm,0,bonnet,boot,objective);
	    }
		if(VehicleGasFuel[v]>0)
		{
		    VehicleGasFuel[v]--;
		    if(cFill[v]<GetCarBak(v))
		    {
		        cFill[v]++;
		    }
		    else
		    {
		        VehicleGasFuel[v]=0;
		    }
		    if(VehicleGasFuel[v]<=0)
		    {
		        VehicleGasFuel[v]=0;
		    }
		}
		if(cEngine[v]==true)DownFuel[v]++;
		if(DownFuel[v]>=120)
		{
		    DownFuel[v]=0;
			if(cFill[v]>0)cFill[v]--;
			if(CarN[v][2]>0&&Car[CarN[v][2]][cAcc]>0)
			{
			    if(random(4)==2)Car[CarN[v][2]][cAcc]--;
			    if(Car[CarN[v][2]][cAcc]<=0&&cEngine[v]==true)
			    {
				    cFill[v]=0;
					new engine,lights,alarm,doors,bonnet,boot,objective;
					GetVehicleParamsEx(v,engine,lights,alarm,doors,bonnet,boot,objective);
				    n_SetVehicleParamsEx(v,0, lights, alarm, doors, bonnet, boot, objective);
				    cEngine[v]=false;
				    new vid=CarN[v][2];
					if(vid>0)SaveCars(v,vid,1);
			    }
			}
			if(cFill[v]<=0&&cEngine[v]==true)
			{
			    cFill[v]=0;
				new engine,lights,alarm,doors,bonnet,boot,objective;
				GetVehicleParamsEx(v,engine,lights,alarm,doors,bonnet,boot,objective);
			    n_SetVehicleParamsEx(v,0, lights, alarm, doors, bonnet, boot, objective);
			    cEngine[v]=false;
			    new vid=CarN[v][2];
				if(vid>0)SaveCars(v,vid,1);
			}
		}
	}
}



public OnPlayerConnect(playerid)
{

    

	Playaspeed[playerid][0] = CreatePlayerTextDraw(playerid, 536.799987, 370.296875, "0");
	PlayerTextDrawLetterSize(playerid, Playaspeed[playerid][0], 0.449999, 1.600000);
	PlayerTextDrawAlignment(playerid, Playaspeed[playerid][0], 2);
	PlayerTextDrawColor(playerid, Playaspeed[playerid][0], -1869573889);
	PlayerTextDrawSetShadow(playerid, Playaspeed[playerid][0], 0);
	PlayerTextDrawSetOutline(playerid, Playaspeed[playerid][0], 1);
	PlayerTextDrawBackgroundColor(playerid, Playaspeed[playerid][0], 51);
	PlayerTextDrawFont(playerid, Playaspeed[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, Playaspeed[playerid][0], 1);

	Playaspeed[playerid][1] = CreatePlayerTextDraw(playerid, 547.800170, 350.236328, "E");
	PlayerTextDrawLetterSize(playerid, Playaspeed[playerid][1], 0.297998, 1.017598);
	PlayerTextDrawAlignment(playerid, Playaspeed[playerid][1], 1);
	PlayerTextDrawColor(playerid, Playaspeed[playerid][1], 0xFF9900AA);
	PlayerTextDrawSetShadow(playerid, Playaspeed[playerid][1], 0);
	PlayerTextDrawSetOutline(playerid, Playaspeed[playerid][1], 0);
	PlayerTextDrawBackgroundColor(playerid, Playaspeed[playerid][1], 51);
	PlayerTextDrawFont(playerid, Playaspeed[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, Playaspeed[playerid][1], 1);

	Playaspeed[playerid][2] = CreatePlayerTextDraw(playerid, 557.360046, 359.992614, "L");
	PlayerTextDrawLetterSize(playerid, Playaspeed[playerid][2], 0.297998, 1.017598);
	PlayerTextDrawAlignment(playerid, Playaspeed[playerid][2], 1);
	PlayerTextDrawColor(playerid, Playaspeed[playerid][2], 0xFF9900AA);
	PlayerTextDrawSetShadow(playerid, Playaspeed[playerid][2], 0);
	PlayerTextDrawSetOutline(playerid, Playaspeed[playerid][2], 0);
	PlayerTextDrawBackgroundColor(playerid, Playaspeed[playerid][2], 51);
	PlayerTextDrawFont(playerid, Playaspeed[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, Playaspeed[playerid][2], 1);

	Playaspeed[playerid][3] = CreatePlayerTextDraw(playerid, 620.241027, 387.420349, "0000000");
	PlayerTextDrawLetterSize(playerid, Playaspeed[playerid][3], 0.431199, 0.944921);
	PlayerTextDrawAlignment(playerid, Playaspeed[playerid][3], 3);
	PlayerTextDrawColor(playerid, Playaspeed[playerid][3], -1869573889);
	PlayerTextDrawSetShadow(playerid, Playaspeed[playerid][3], 0);
	PlayerTextDrawSetOutline(playerid, Playaspeed[playerid][3], 1);
	PlayerTextDrawBackgroundColor(playerid, Playaspeed[playerid][3], 51);
	PlayerTextDrawFont(playerid, Playaspeed[playerid][3], 1);
	PlayerTextDrawSetProportional(playerid, Playaspeed[playerid][3], 1);

	Playaspeed[playerid][4] = CreatePlayerTextDraw(playerid, 636.600769, 387.420349, "0");
	PlayerTextDrawLetterSize(playerid, Playaspeed[playerid][4], 0.431199, 0.944921);
	PlayerTextDrawAlignment(playerid, Playaspeed[playerid][4], 3);
	PlayerTextDrawColor(playerid, Playaspeed[playerid][4], -1869573889);
	PlayerTextDrawSetShadow(playerid, Playaspeed[playerid][4], 0);
	PlayerTextDrawSetOutline(playerid, Playaspeed[playerid][4], 1);
	PlayerTextDrawBackgroundColor(playerid, Playaspeed[playerid][4], 51);
	PlayerTextDrawFont(playerid, Playaspeed[playerid][4], 1);
	PlayerTextDrawSetProportional(playerid, Playaspeed[playerid][4], 1);

	Playaspeed[playerid][5] = CreatePlayerTextDraw(playerid, 614.680725, 373.980316, "FUEL: 100/100");
	PlayerTextDrawLetterSize(playerid, Playaspeed[playerid][5], 0.175199, 0.835412);
	PlayerTextDrawAlignment(playerid, Playaspeed[playerid][5], 2);
	PlayerTextDrawColor(playerid, Playaspeed[playerid][5], -1869573889);
	PlayerTextDrawSetShadow(playerid, Playaspeed[playerid][5], 0);
	PlayerTextDrawSetOutline(playerid, Playaspeed[playerid][5], 1);
	PlayerTextDrawBackgroundColor(playerid, Playaspeed[playerid][5], 51);
	PlayerTextDrawFont(playerid, Playaspeed[playerid][5], 1);
	PlayerTextDrawSetProportional(playerid, Playaspeed[playerid][5], 1);

	Playaspeed2[playerid][0] = CreatePlayerTextDraw(playerid, 532.239746, 383.438079, ".");
	PlayerTextDrawLetterSize(playerid, Playaspeed2[playerid][0], 0.731598, 3.277508);
	PlayerTextDrawAlignment(playerid, Playaspeed2[playerid][0], 1);
	PlayerTextDrawColor(playerid, Playaspeed2[playerid][0], 0xFF9900AA);
	PlayerTextDrawSetShadow(playerid, Playaspeed2[playerid][0], 0);
	PlayerTextDrawSetOutline(playerid, Playaspeed2[playerid][0], 0);
	PlayerTextDrawBackgroundColor(playerid, Playaspeed2[playerid][0], 51);
	PlayerTextDrawFont(playerid, Playaspeed2[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, Playaspeed2[playerid][0], 1);

	Playaspeed2[playerid][1] = CreatePlayerTextDraw(playerid, 531.239379, 420.323577, "v");
	PlayerTextDrawLetterSize(playerid, Playaspeed2[playerid][1], 0.406798, -1.665420);
	PlayerTextDrawAlignment(playerid, Playaspeed2[playerid][1], 1);
	PlayerTextDrawColor(playerid, Playaspeed2[playerid][1], 0xFF9900AA);
	PlayerTextDrawSetShadow(playerid, Playaspeed2[playerid][1], 0);
	PlayerTextDrawSetOutline(playerid, Playaspeed2[playerid][1], 0);
	PlayerTextDrawBackgroundColor(playerid, Playaspeed2[playerid][1], 51);
	PlayerTextDrawFont(playerid, Playaspeed2[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, Playaspeed2[playerid][1], 1);

	Playaspeed2[playerid][2] = CreatePlayerTextDraw(playerid, 533.279968, 409.621337, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid, Playaspeed2[playerid][2], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, Playaspeed2[playerid][2], 3.279998, 4.679141);
	PlayerTextDrawAlignment(playerid, Playaspeed2[playerid][2], 1);
	PlayerTextDrawColor(playerid, Playaspeed2[playerid][2], 0xFF9900AA);
	PlayerTextDrawSetShadow(playerid, Playaspeed2[playerid][2], 0);
	PlayerTextDrawSetOutline(playerid, Playaspeed2[playerid][2], 0);
	PlayerTextDrawFont(playerid, Playaspeed2[playerid][2], 4);

	Playaspeed2[playerid][3] = CreatePlayerTextDraw(playerid, 530.200317, 407.032653, "-");
	PlayerTextDrawLetterSize(playerid, Playaspeed2[playerid][3], 0.871599, 0.762238);
	PlayerTextDrawAlignment(playerid, Playaspeed2[playerid][3], 1);
	PlayerTextDrawColor(playerid, Playaspeed2[playerid][3], 0xFF9900AA);
	PlayerTextDrawSetShadow(playerid, Playaspeed2[playerid][3], 0);
	PlayerTextDrawSetOutline(playerid, Playaspeed2[playerid][3], 0);
	PlayerTextDrawBackgroundColor(playerid, Playaspeed2[playerid][3], 51);
	PlayerTextDrawFont(playerid, Playaspeed2[playerid][3], 1);
	PlayerTextDrawSetProportional(playerid, Playaspeed2[playerid][3], 1);

	Playaspeed2[playerid][4] = CreatePlayerTextDraw(playerid, 528.759765, 389.859375, "-");
	PlayerTextDrawLetterSize(playerid, Playaspeed2[playerid][4], 0.232795, 3.828552);
	PlayerTextDrawAlignment(playerid, Playaspeed2[playerid][4], 1);
	PlayerTextDrawColor(playerid, Playaspeed2[playerid][4], 0xFF9900AA);
	PlayerTextDrawSetShadow(playerid, Playaspeed2[playerid][4], 0);
	PlayerTextDrawSetOutline(playerid, Playaspeed2[playerid][4], 0);
	PlayerTextDrawBackgroundColor(playerid, Playaspeed2[playerid][4], 51);
	PlayerTextDrawFont(playerid, Playaspeed2[playerid][4], 1);
	PlayerTextDrawSetProportional(playerid, Playaspeed2[playerid][4], 1);

	Playaspeed2[playerid][5] = CreatePlayerTextDraw(playerid, 538.359619, 389.859375, "-");
	PlayerTextDrawLetterSize(playerid, Playaspeed2[playerid][5], 0.232795, 3.828552);
	PlayerTextDrawAlignment(playerid, Playaspeed2[playerid][5], 1);
	PlayerTextDrawColor(playerid, Playaspeed2[playerid][5], 0xFF9900AA);
	PlayerTextDrawSetShadow(playerid, Playaspeed2[playerid][5], 0);
	PlayerTextDrawSetOutline(playerid, Playaspeed2[playerid][5], 0);
	PlayerTextDrawBackgroundColor(playerid, Playaspeed2[playerid][5], 51);
	PlayerTextDrawFont(playerid, Playaspeed2[playerid][5], 1);
	PlayerTextDrawSetProportional(playerid, Playaspeed2[playerid][5], 1);

	Playaspeed3[playerid][0] = CreatePlayerTextDraw(playerid, 558.120178, 400.113922, "D");
	PlayerTextDrawLetterSize(playerid, Playaspeed3[playerid][0], -0.375999, 1.828976);
	PlayerTextDrawAlignment(playerid, Playaspeed3[playerid][0], 1);
	PlayerTextDrawColor(playerid, Playaspeed3[playerid][0], 0xFF9900AA);
	PlayerTextDrawSetShadow(playerid, Playaspeed3[playerid][0], 0);
	PlayerTextDrawSetOutline(playerid, Playaspeed3[playerid][0], 0);
	PlayerTextDrawBackgroundColor(playerid, Playaspeed3[playerid][0], 51);
	PlayerTextDrawFont(playerid, Playaspeed3[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, Playaspeed3[playerid][0], 1);

	Playaspeed3[playerid][1] = CreatePlayerTextDraw(playerid, 553.080810, 405.440063, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid, Playaspeed3[playerid][1], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, Playaspeed3[playerid][1], 3.959996, 7.068416);
	PlayerTextDrawAlignment(playerid, Playaspeed3[playerid][1], 1);
	PlayerTextDrawColor(playerid, Playaspeed3[playerid][1], 0xFF9900AA);
	PlayerTextDrawSetShadow(playerid, Playaspeed3[playerid][1], 0);
	PlayerTextDrawSetOutline(playerid, Playaspeed3[playerid][1], 0);
	PlayerTextDrawFont(playerid, Playaspeed3[playerid][1], 4);

	Playaspeed3[playerid][2] = CreatePlayerTextDraw(playerid, 558.800292, 404.494445, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid, Playaspeed3[playerid][2], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, Playaspeed3[playerid][2], 4.479998, 1.144858);
	PlayerTextDrawAlignment(playerid, Playaspeed3[playerid][2], 1);
	PlayerTextDrawColor(playerid, Playaspeed3[playerid][2], 0xFF9900AA);
	PlayerTextDrawSetShadow(playerid, Playaspeed3[playerid][2], 0);
	PlayerTextDrawSetOutline(playerid, Playaspeed3[playerid][2], 0);
	PlayerTextDrawFont(playerid, Playaspeed3[playerid][2], 4);

	Playaspeed3[playerid][3] = CreatePlayerTextDraw(playerid, 558.760192, 408.476409, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid, Playaspeed3[playerid][3], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, Playaspeed3[playerid][3], 5.719995, 1.144858);
	PlayerTextDrawAlignment(playerid, Playaspeed3[playerid][3], 1);
	PlayerTextDrawColor(playerid, Playaspeed3[playerid][3], 0xFF9900AA);
	PlayerTextDrawSetShadow(playerid, Playaspeed3[playerid][3], 0);
	PlayerTextDrawSetOutline(playerid, Playaspeed3[playerid][3], 0);
	PlayerTextDrawFont(playerid, Playaspeed3[playerid][3], 4);

	Playaspeed3[playerid][4] = CreatePlayerTextDraw(playerid, 558.760314, 412.309112, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid, Playaspeed3[playerid][4], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, Playaspeed3[playerid][4], 4.479998, 1.144858);
	PlayerTextDrawAlignment(playerid, Playaspeed3[playerid][4], 1);
	PlayerTextDrawColor(playerid, Playaspeed3[playerid][4], 0xFF9900AA);
	PlayerTextDrawSetShadow(playerid, Playaspeed3[playerid][4], 0);
	PlayerTextDrawSetOutline(playerid, Playaspeed3[playerid][4], 0);
	PlayerTextDrawFont(playerid, Playaspeed3[playerid][4], 4);

	Playaspeed3[playerid][5] = CreatePlayerTextDraw(playerid, 554.079589, 403.249633, "!");
	PlayerTextDrawLetterSize(playerid, Playaspeed3[playerid][5], 0.252837, 1.178879);
	PlayerTextDrawAlignment(playerid, Playaspeed3[playerid][5], 1);
	PlayerTextDrawColor(playerid, Playaspeed3[playerid][5], -2147483393);
	PlayerTextDrawSetShadow(playerid, Playaspeed3[playerid][5], 0);
	PlayerTextDrawSetOutline(playerid, Playaspeed3[playerid][5], 0);
	PlayerTextDrawBackgroundColor(playerid, Playaspeed3[playerid][5], 51);
	PlayerTextDrawFont(playerid, Playaspeed3[playerid][5], 1);
	PlayerTextDrawSetProportional(playerid, Playaspeed3[playerid][5], 1);

	Playaspeed4[playerid][0] = CreatePlayerTextDraw(playerid, 574.920166, 405.788299, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid, Playaspeed4[playerid][0], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, Playaspeed4[playerid][0], 11.999984, 8.462224);
	PlayerTextDrawAlignment(playerid, Playaspeed4[playerid][0], 1);
	PlayerTextDrawColor(playerid, Playaspeed4[playerid][0], 0xFF9900AA);
	PlayerTextDrawSetShadow(playerid, Playaspeed4[playerid][0], 0);
	PlayerTextDrawSetOutline(playerid, Playaspeed4[playerid][0], 0);
	PlayerTextDrawFont(playerid, Playaspeed4[playerid][0], 4);

	Playaspeed4[playerid][1] = CreatePlayerTextDraw(playerid, 576.080566, 403.896545, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid, Playaspeed4[playerid][1], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, Playaspeed4[playerid][1], 3.599987, 2.140445);
	PlayerTextDrawAlignment(playerid, Playaspeed4[playerid][1], 1);
	PlayerTextDrawColor(playerid, Playaspeed4[playerid][1], 0xFF9900AA);
	PlayerTextDrawSetShadow(playerid, Playaspeed4[playerid][1], 0);
	PlayerTextDrawSetOutline(playerid, Playaspeed4[playerid][1], 0);
	PlayerTextDrawFont(playerid, Playaspeed4[playerid][1], 4);

	Playaspeed4[playerid][2] = CreatePlayerTextDraw(playerid, 582.080871, 403.896545, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid, Playaspeed4[playerid][2], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, Playaspeed4[playerid][2], 3.599987, 2.140445);
	PlayerTextDrawAlignment(playerid, Playaspeed4[playerid][2], 1);
	PlayerTextDrawColor(playerid, Playaspeed4[playerid][2], 0xFF9900AA);
	PlayerTextDrawSetShadow(playerid, Playaspeed4[playerid][2], 0);
	PlayerTextDrawSetOutline(playerid, Playaspeed4[playerid][2], 0);
	PlayerTextDrawFont(playerid, Playaspeed4[playerid][2], 4);

	Playaspeed4[playerid][3] = CreatePlayerTextDraw(playerid, 575.640014, 406.734039, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid, Playaspeed4[playerid][3], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, Playaspeed4[playerid][3], 10.639986, 6.869336);
	PlayerTextDrawAlignment(playerid, Playaspeed4[playerid][3], 1);
	PlayerTextDrawColor(playerid, Playaspeed4[playerid][3], 387389439);
	PlayerTextDrawSetShadow(playerid, Playaspeed4[playerid][3], 0);
	PlayerTextDrawSetOutline(playerid, Playaspeed4[playerid][3], 0);
	PlayerTextDrawFont(playerid, Playaspeed4[playerid][3], 4);

	Playaspeed4[playerid][4] = CreatePlayerTextDraw(playerid, 576.800415, 405.191040, "-");
	PlayerTextDrawLetterSize(playerid, Playaspeed4[playerid][4], 0.281159, 0.725902);
	PlayerTextDrawAlignment(playerid, Playaspeed4[playerid][4], 1);
	PlayerTextDrawColor(playerid, Playaspeed4[playerid][4], 0xFF9900AA);
	PlayerTextDrawSetShadow(playerid, Playaspeed4[playerid][4], 0);
	PlayerTextDrawSetOutline(playerid, Playaspeed4[playerid][4], 0);
	PlayerTextDrawBackgroundColor(playerid, Playaspeed4[playerid][4], 51);
	PlayerTextDrawFont(playerid, Playaspeed4[playerid][4], 1);
	PlayerTextDrawSetProportional(playerid, Playaspeed4[playerid][4], 1);

	Playaspeed4[playerid][5] = CreatePlayerTextDraw(playerid, 582.039978, 405.937652, "+");
	PlayerTextDrawLetterSize(playerid, Playaspeed4[playerid][5], 0.189959, 0.720924);
	PlayerTextDrawAlignment(playerid, Playaspeed4[playerid][5], 1);
	PlayerTextDrawColor(playerid, Playaspeed4[playerid][5], 0xFF9900AA);
	PlayerTextDrawSetShadow(playerid, Playaspeed4[playerid][5], 0);
	PlayerTextDrawSetOutline(playerid, Playaspeed4[playerid][5], 0);
	PlayerTextDrawBackgroundColor(playerid, Playaspeed4[playerid][5], 51);
	PlayerTextDrawFont(playerid, Playaspeed4[playerid][5], 1);
	PlayerTextDrawSetProportional(playerid, Playaspeed4[playerid][5], 1);

	Playaspeed5[playerid][0] = CreatePlayerTextDraw(playerid, 598.439575, 408.326934, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid, Playaspeed5[playerid][0], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, Playaspeed5[playerid][0], 8.319998, 5.973347);
	PlayerTextDrawAlignment(playerid, Playaspeed5[playerid][0], 1);
	PlayerTextDrawColor(playerid, Playaspeed5[playerid][0], 0xFF9900AA);
	PlayerTextDrawSetShadow(playerid, Playaspeed5[playerid][0], 0);
	PlayerTextDrawSetOutline(playerid, Playaspeed5[playerid][0], 0);
	PlayerTextDrawFont(playerid, Playaspeed5[playerid][0], 4);

	Playaspeed5[playerid][1] = CreatePlayerTextDraw(playerid, 597.040283, 407.032775, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid, Playaspeed5[playerid][1], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, Playaspeed5[playerid][1], 2.640002, 3.584012);
	PlayerTextDrawAlignment(playerid, Playaspeed5[playerid][1], 1);
	PlayerTextDrawColor(playerid, Playaspeed5[playerid][1], 0xFF9900AA);
	PlayerTextDrawSetShadow(playerid, Playaspeed5[playerid][1], 0);
	PlayerTextDrawSetOutline(playerid, Playaspeed5[playerid][1], 0);
	PlayerTextDrawFont(playerid, Playaspeed5[playerid][1], 4);

	Playaspeed5[playerid][2] = CreatePlayerTextDraw(playerid, 603.440856, 402.254058, "/");
	PlayerTextDrawLetterSize(playerid, Playaspeed5[playerid][2], 0.642400, 1.512889);
	PlayerTextDrawAlignment(playerid, Playaspeed5[playerid][2], 1);
	PlayerTextDrawColor(playerid, Playaspeed5[playerid][2], 0xFF9900AA);
	PlayerTextDrawSetShadow(playerid, Playaspeed5[playerid][2], 0);
	PlayerTextDrawSetOutline(playerid, Playaspeed5[playerid][2], 0);
	PlayerTextDrawBackgroundColor(playerid, Playaspeed5[playerid][2], 51);
	PlayerTextDrawFont(playerid, Playaspeed5[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, Playaspeed5[playerid][2], 1);

	Playaspeed5[playerid][3] = CreatePlayerTextDraw(playerid, 608.200195, 405.340332, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid, Playaspeed5[playerid][3], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, Playaspeed5[playerid][3], 3.200001, 2.439125);
	PlayerTextDrawAlignment(playerid, Playaspeed5[playerid][3], 1);
	PlayerTextDrawColor(playerid, Playaspeed5[playerid][3], 0xFF9900AA);
	PlayerTextDrawSetShadow(playerid, Playaspeed5[playerid][3], 0);
	PlayerTextDrawSetOutline(playerid, Playaspeed5[playerid][3], 0);
	PlayerTextDrawFont(playerid, Playaspeed5[playerid][3], 4);

	Playaspeed5[playerid][4] = CreatePlayerTextDraw(playerid, 599.360107, 409.372283, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid, Playaspeed5[playerid][4], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, Playaspeed5[playerid][4], 9.519989, 3.882668);
	PlayerTextDrawAlignment(playerid, Playaspeed5[playerid][4], 1);
	PlayerTextDrawColor(playerid, Playaspeed5[playerid][4], 387389439);
	PlayerTextDrawSetShadow(playerid, Playaspeed5[playerid][4], 0);
	PlayerTextDrawSetOutline(playerid, Playaspeed5[playerid][4], 0);
	PlayerTextDrawFont(playerid, Playaspeed5[playerid][4], 4);

	Playaspeed5[playerid][5] = CreatePlayerTextDraw(playerid, 603.641235, 407.878509, "/");
	PlayerTextDrawLetterSize(playerid, Playaspeed5[playerid][5], 0.337599, 0.696532);
	PlayerTextDrawAlignment(playerid, Playaspeed5[playerid][5], 1);
	PlayerTextDrawColor(playerid, Playaspeed5[playerid][5], 387389439);
	PlayerTextDrawSetShadow(playerid, Playaspeed5[playerid][5], 0);
	PlayerTextDrawSetOutline(playerid, Playaspeed5[playerid][5], 0);
	PlayerTextDrawBackgroundColor(playerid, Playaspeed5[playerid][5], 51);
	PlayerTextDrawFont(playerid, Playaspeed5[playerid][5], 1);
	PlayerTextDrawSetProportional(playerid, Playaspeed5[playerid][5], 1);

	Playaspeed6[playerid][0] = CreatePlayerTextDraw(playerid, 621.361083, 405.340637, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid, Playaspeed6[playerid][0], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, Playaspeed6[playerid][0], 1.000018, 7.367121);
	PlayerTextDrawAlignment(playerid, Playaspeed6[playerid][0], 1);
	PlayerTextDrawColor(playerid, Playaspeed6[playerid][0], 0xFF9900AA);
	PlayerTextDrawSetShadow(playerid, Playaspeed6[playerid][0], 0);
	PlayerTextDrawSetOutline(playerid, Playaspeed6[playerid][0], 0);
	PlayerTextDrawFont(playerid, Playaspeed6[playerid][0], 4);

	Playaspeed6[playerid][1] = CreatePlayerTextDraw(playerid, 621.481750, 408.277526, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid, Playaspeed6[playerid][1], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, Playaspeed6[playerid][1], 1.640017, 1.393787);
	PlayerTextDrawAlignment(playerid, Playaspeed6[playerid][1], 1);
	PlayerTextDrawColor(playerid, Playaspeed6[playerid][1], 0xFF9900AA);
	PlayerTextDrawSetShadow(playerid, Playaspeed6[playerid][1], 0);
	PlayerTextDrawSetOutline(playerid, Playaspeed6[playerid][1], 0);
	PlayerTextDrawFont(playerid, Playaspeed6[playerid][1], 4);

	Playaspeed6[playerid][2] = CreatePlayerTextDraw(playerid, 622.960754, 405.340637, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid, Playaspeed6[playerid][2], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, Playaspeed6[playerid][2], 10.120013, 7.367121);
	PlayerTextDrawAlignment(playerid, Playaspeed6[playerid][2], 1);
	PlayerTextDrawColor(playerid, Playaspeed6[playerid][2], 0xFF9900AA);
	PlayerTextDrawSetShadow(playerid, Playaspeed6[playerid][2], 0);
	PlayerTextDrawSetOutline(playerid, Playaspeed6[playerid][2], 0);
	PlayerTextDrawFont(playerid, Playaspeed6[playerid][2], 4);

	Playaspeed6[playerid][3] = CreatePlayerTextDraw(playerid, 625.320739, 403.349639, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid, Playaspeed6[playerid][3], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, Playaspeed6[playerid][3], 7.880012, 11.200007);
	PlayerTextDrawAlignment(playerid, Playaspeed6[playerid][3], 1);
	PlayerTextDrawColor(playerid, Playaspeed6[playerid][3], 0xFF9900AA);
	PlayerTextDrawSetShadow(playerid, Playaspeed6[playerid][3], 0);
	PlayerTextDrawSetOutline(playerid, Playaspeed6[playerid][3], 0);
	PlayerTextDrawFont(playerid, Playaspeed6[playerid][3], 4);

	Playaspeed6[playerid][4] = CreatePlayerTextDraw(playerid, 632.481201, 405.440338, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid, Playaspeed6[playerid][4], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, Playaspeed6[playerid][4], 1.960015, 5.127117);
	PlayerTextDrawAlignment(playerid, Playaspeed6[playerid][4], 1);
	PlayerTextDrawColor(playerid, Playaspeed6[playerid][4], 0xFF9900AA);
	PlayerTextDrawSetShadow(playerid, Playaspeed6[playerid][4], 0);
	PlayerTextDrawSetOutline(playerid, Playaspeed6[playerid][4], 0);
	PlayerTextDrawFont(playerid, Playaspeed6[playerid][4], 4);

	Playaspeed6[playerid][5] = CreatePlayerTextDraw(playerid, 634.040588, 403.648437, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid, Playaspeed6[playerid][5], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, Playaspeed6[playerid][5], 1.960015, 9.358222);
	PlayerTextDrawAlignment(playerid, Playaspeed6[playerid][5], 1);
	PlayerTextDrawColor(playerid, Playaspeed6[playerid][5], 0xFF9900AA);
	PlayerTextDrawSetShadow(playerid, Playaspeed6[playerid][5], 0);
	PlayerTextDrawSetOutline(playerid, Playaspeed6[playerid][5], 0);
	PlayerTextDrawFont(playerid, Playaspeed6[playerid][5], 4);

	Playaspeed6[playerid][6] = CreatePlayerTextDraw(playerid, 623.640258, 406.485382, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid, Playaspeed6[playerid][6], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, Playaspeed6[playerid][6], 8.759985, 5.575109);
	PlayerTextDrawAlignment(playerid, Playaspeed6[playerid][6], 1);
	PlayerTextDrawColor(playerid, Playaspeed6[playerid][6], 387389439);
	PlayerTextDrawSetShadow(playerid, Playaspeed6[playerid][6], 0);
	PlayerTextDrawSetOutline(playerid, Playaspeed6[playerid][6], 0);
	PlayerTextDrawFont(playerid, Playaspeed6[playerid][6], 4);

	Playaspeed6[playerid][7] = CreatePlayerTextDraw(playerid, 626.039489, 404.345092, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid, Playaspeed6[playerid][7], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, Playaspeed6[playerid][7], 6.359988, 9.159111);
	PlayerTextDrawAlignment(playerid, Playaspeed6[playerid][7], 1);
	PlayerTextDrawColor(playerid, Playaspeed6[playerid][7], 387389439);
	PlayerTextDrawSetShadow(playerid, Playaspeed6[playerid][7], 0);
	PlayerTextDrawSetOutline(playerid, Playaspeed6[playerid][7], 0);
	PlayerTextDrawFont(playerid, Playaspeed6[playerid][7], 4);

	Playaspeed6[playerid][8] = CreatePlayerTextDraw(playerid, 629.399536, 406.087310, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid, Playaspeed6[playerid][8], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, Playaspeed6[playerid][8], 5.119987, 3.932446);
	PlayerTextDrawAlignment(playerid, Playaspeed6[playerid][8], 1);
	PlayerTextDrawColor(playerid, Playaspeed6[playerid][8], 387389439);
	PlayerTextDrawSetShadow(playerid, Playaspeed6[playerid][8], 0);
	PlayerTextDrawSetOutline(playerid, Playaspeed6[playerid][8], 0);
	PlayerTextDrawFont(playerid, Playaspeed6[playerid][8], 4);


}


