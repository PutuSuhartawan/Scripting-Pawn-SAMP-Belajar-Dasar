
enum cCar
{
	cNumber,
	cIDinSvr,
	cOwner,
	cOwnerIDinSvr,
	cPrise,
	cModel,
	cMoney,
	Float:cX,
	Float:cY,
	Float:cZ,
	Float:cA,
	cInt,
	cWorld,
	cSFill,
	cColorA,
	cColorB,
	cInsu,
	cOnOffice,
	cSavePos,
	Float:cHealth,
	cPanels,
	cDoors,
	cLights,
	cTires,
	cDelTime,
	cService,
	cStraf,
	cRun,
	cRun2,
	cWheel,
	cGidro,
	cNitro,
	cEngineStar,
	cGPS,
	cSignal,
	cOil,
	cAcc,
	cSparkPlug1,
	cSparkPlug2,
	cSparkPlug3,
	cSparkPlug4,
	cSparkPlug5,
	cSparkPlug6,
	cKey1,
	cKey2,
	cKey3,
	cKey4,
	cKey5,
}
new Car[MAX_LOAD_CAR+1][cCar];


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
forward LoadCarsMax();
public LoadCarsMax()
{
	new time = GetTickCount();
    new vresult[15],rows,fields,maxcarveh;
    cache_get_data(rows,fields);
    if(rows)
    {
        while(--rows>=0)
        {
            maxcarveh++;
            new idcar;
            cache_get_field_content(rows,"Number",vresult), idcar = strval(vresult);
            Car[idcar][cNumber]=idcar;
            // åñëè àâòî çàãðóæàåòñÿ ñ èãðîêîì, òî íèæå âñå óäàëèòü!
	        new fill,lock,run,run2,eng,lamp,damage[40],BagInv[240],GloveInv[240],stat2;
	        cache_get_field_content(rows,"Damage",damage);
	        cache_get_field_content(rows,"BagInv",BagInv);
	        cache_get_field_content(rows,"GloveInv",GloveInv);
	        cache_get_field_content(rows,"Owner",vresult), Car[idcar][cOwner] = strval(vresult);
	        cache_get_field_content(rows,"Prise",vresult), Car[idcar][cPrise] = strval(vresult);
	        cache_get_field_content(rows,"Model",vresult), Car[idcar][cModel] = strval(vresult);
	        cache_get_field_content(rows,"Money",vresult), Car[idcar][cMoney] = strval(vresult);
	        cache_get_field_content(rows,"X",vresult), Car[idcar][cX] = floatstr(vresult);
	        cache_get_field_content(rows,"Y",vresult), Car[idcar][cY] = floatstr(vresult);
	        cache_get_field_content(rows,"Z",vresult), Car[idcar][cZ] = floatstr(vresult);
	        cache_get_field_content(rows,"A",vresult), Car[idcar][cA] = floatstr(vresult);
	        cache_get_field_content(rows,"ColorA",vresult), Car[idcar][cColorA] = strval(vresult);
	        cache_get_field_content(rows,"ColorB",vresult), Car[idcar][cColorB] = strval(vresult);
	        cache_get_field_content(rows,"Insu",vresult), Car[idcar][cInsu] = strval(vresult);
	        cache_get_field_content(rows,"OnOffice",vresult), Car[idcar][cOnOffice] = strval(vresult);
	        cache_get_field_content(rows,"Int",vresult), Car[idcar][cInt] = strval(vresult);
	        cache_get_field_content(rows,"World",vresult), Car[idcar][cWorld] = strval(vresult);
	        cache_get_field_content(rows,"Service",vresult), Car[idcar][cService] = strval(vresult);
	        cache_get_field_content(rows,"Straf",vresult), Car[idcar][cStraf] = strval(vresult);
	        cache_get_field_content(rows,"Wheel",vresult), Car[idcar][cWheel] = strval(vresult);
	        cache_get_field_content(rows,"Gidro",vresult), Car[idcar][cGidro] = strval(vresult);
	        cache_get_field_content(rows,"Nitro",vresult), Car[idcar][cNitro] = strval(vresult);
	        cache_get_field_content(rows,"EngineStar",vresult), Car[idcar][cEngineStar] = strval(vresult);
	        cache_get_field_content(rows,"GPS",vresult), Car[idcar][cGPS] = strval(vresult);
	        cache_get_field_content(rows,"Signal",vresult), Car[idcar][cSignal] = strval(vresult);
	        cache_get_field_content(rows,"Oil",vresult), Car[idcar][cOil] = strval(vresult);
	        cache_get_field_content(rows,"Acc",vresult), Car[idcar][cAcc] = strval(vresult);
	        cache_get_field_content(rows,"SparkPlug1",vresult), Car[idcar][cSparkPlug1] = strval(vresult);
	        cache_get_field_content(rows,"SparkPlug2",vresult), Car[idcar][cSparkPlug2] = strval(vresult);
	        cache_get_field_content(rows,"SparkPlug3",vresult), Car[idcar][cSparkPlug3] = strval(vresult);
	        cache_get_field_content(rows,"SparkPlug4",vresult), Car[idcar][cSparkPlug4] = strval(vresult);
	        cache_get_field_content(rows,"SparkPlug5",vresult), Car[idcar][cSparkPlug5] = strval(vresult);
	        cache_get_field_content(rows,"SparkPlug6",vresult), Car[idcar][cSparkPlug6] = strval(vresult);
	        cache_get_field_content(rows,"Key1",vresult), Car[idcar][cKey1] = strval(vresult);
	        cache_get_field_content(rows,"Key2",vresult), Car[idcar][cKey2] = strval(vresult);
	        cache_get_field_content(rows,"Key3",vresult), Car[idcar][cKey3] = strval(vresult);
	        cache_get_field_content(rows,"Key4",vresult), Car[idcar][cKey4] = strval(vresult);
	        cache_get_field_content(rows,"Key5",vresult), Car[idcar][cKey5] = strval(vresult);

	        cache_get_field_content(rows,"Fill",vresult), fill = strval(vresult);
	        cache_get_field_content(rows,"Lock",vresult), lock = strval(vresult);
	        cache_get_field_content(rows,"Run",vresult), run = strval(vresult);
	        cache_get_field_content(rows,"Run2",vresult), run2 = strval(vresult);
	        cache_get_field_content(rows,"Engine",vresult), eng = strval(vresult);
	        cache_get_field_content(rows,"Lamp",vresult), lamp = strval(vresult);
	        cache_get_field_content(rows,"Trunk",vresult), stat2 = strval(vresult);

			new Damm[5][13];
			split(damage, Damm, '|');
			Car[idcar][cHealth] = floatstr(Damm[0]);
			Car[idcar][cPanels] = strval(Damm[1]);
			Car[idcar][cDoors] = strval(Damm[2]);
			Car[idcar][cLights] = strval(Damm[3]);
			Car[idcar][cTires] = strval(Damm[4]);

			Car[idcar][cRun]=run;
			Car[idcar][cRun2]=run2;

	        if(Car[idcar][cService]<=0&&Car[idcar][cStraf]<=0)
	        {
	            new car;
	            //CreateVehicle(vehicletype, Float:x, Float:y, Float:z, Float:rotation, color1, color2, respawn_delay, addsiren=0)
	            car = CreateVehicle(Car[idcar][cModel], Car[idcar][cX],Car[idcar][cY],Car[idcar][cZ],Car[idcar][cA],Car[idcar][cColorA],Car[idcar][cColorB], 0, 0);
		        SetVehicleVirtualWorld(car, Car[idcar][cWorld]);
				LinkVehicleToInterior(car, Car[idcar][cInt]);

	        	if(Car[idcar][cOnOffice] == 1)
	        	{
	        		SetVehicleVirtualWorld(car, 1);

	        	}
		        
				CarN[car][2]=idcar;
		        cFill[car]=fill;
		        Run[car]=run;
		        Run2[car]=run2;
		        RunCars[car]=0;
		        DownFillRun[car]=0;
		        switch(stat2)
		        {
		            case 0:cTrunk[car]=false;
		            case 1:cTrunk[car]=true;
		        }
		        switch(eng)
		        {
		            case 0:cEngine[car]=false;
		            case 1:cEngine[car]=true;
		        }
		        switch(lamp)
		        {
		            case 0:cLamp[car]=false;
		            case 1:cLamp[car]=true;
		        }
		        switch(lock)
		        {
		            case 0:cLock[car]=false;
		            case 1:cLock[car]=true;
		        }
		        new engine, lights, alarm, doors, bonnet, boot, objective;
				GetVehicleParamsEx(car,engine,lights,alarm,doors,bonnet,boot,objective);
		        n_SetVehicleParamsEx(car,cEngine[car],cLamp[car],alarm,cLock[car],bonnet,cTrunk[car],objective);
		        SetVehicleHealth(car,Car[idcar][cHealth]);
				UpdateVehicleDamageStatus(car,Car[idcar][cPanels],Car[idcar][cDoors],Car[idcar][cLights],Car[idcar][cTires]);

                UpDateTun(car);

				new slot[21][12];
			    split(BagInv, slot, '|');
			    VehicleItem1[car][1] = strval(slot[0]);
			    VehicleItem2[car][1] = strval(slot[1]);
			    VehicleItem3[car][1] = strval(slot[2]);
			    VehicleItem1[car][2] = strval(slot[3]);
			    VehicleItem2[car][2] = strval(slot[4]);
			    VehicleItem3[car][2] = strval(slot[5]);
			    VehicleItem1[car][3] = strval(slot[6]);
			    VehicleItem2[car][3] = strval(slot[7]);
			    VehicleItem3[car][3] = strval(slot[8]);
			    VehicleItem1[car][4] = strval(slot[9]);
			    VehicleItem2[car][4] = strval(slot[10]);
			    VehicleItem3[car][4] = strval(slot[11]);
			    VehicleItem1[car][5] = strval(slot[12]);
			    VehicleItem2[car][5] = strval(slot[13]);
			    VehicleItem3[car][5] = strval(slot[14]);
			    VehicleItem1[car][6] = strval(slot[15]);
			    VehicleItem2[car][6] = strval(slot[16]);
			    VehicleItem3[car][6] = strval(slot[17]);
			    VehicleItem1[car][7] = strval(slot[18]);
			    VehicleItem2[car][7] = strval(slot[19]);
			    VehicleItem3[car][7] = strval(slot[20]);

				new slot2[21][12];
			    split(GloveInv, slot, '|');
			    VehicleGloveItem1[car][1] = strval(slot2[0]);
			    VehicleGloveItem2[car][1] = strval(slot2[1]);
			    VehicleGloveItem3[car][1] = strval(slot2[2]);
			    VehicleGloveItem1[car][2] = strval(slot2[3]);
			    VehicleGloveItem2[car][2] = strval(slot2[4]);
			    VehicleGloveItem3[car][2] = strval(slot2[5]);
			    VehicleGloveItem1[car][3] = strval(slot2[6]);
			    VehicleGloveItem2[car][3] = strval(slot2[7]);
			    VehicleGloveItem3[car][3] = strval(slot2[8]);
			    VehicleGloveItem1[car][4] = strval(slot2[9]);
			    VehicleGloveItem2[car][4] = strval(slot2[10]);
			    VehicleGloveItem3[car][4] = strval(slot2[11]);
			    VehicleGloveItem1[car][5] = strval(slot2[12]);
			    VehicleGloveItem2[car][5] = strval(slot2[13]);
			    VehicleGloveItem3[car][5] = strval(slot2[14]);
			    VehicleGloveItem1[car][6] = strval(slot2[15]);
			    VehicleGloveItem2[car][6] = strval(slot2[16]);
			    VehicleGloveItem3[car][6] = strval(slot2[17]);
			    VehicleGloveItem1[car][7] = strval(slot2[18]);
			    VehicleGloveItem2[car][7] = strval(slot2[19]);
			    VehicleGloveItem3[car][7] = strval(slot2[20]);
			}
        }
    }
    printf("[Âñåãî ëè÷íîãî òðàíñïîðòà]: <%i>. Âðåìåíè çàòðà÷åíî: <%i Mili Second>",maxcarveh,GetTickCount()-time);
	return true;
}

public OnVehicleDeath(vehicleid, killerid)
{
	new str[300];
	new VID=CarN[vehicleid][2];
/*	new Float:hp[4];
	GetVehicleHealth(vehicleid,hp[3]);
	GetVehiclePos(vehicleid,hp[0],hp[1],hp[2]);
	if(hp[3]>500&&killerid!=-1&&hp[2]>1)
	{
	    if(GetPVarInt(playerid,"AC_DEAT_CAR")>Time)
	    {
		    SetVehicleToRespawn(vehicleid);
		    return r_Kick(killerid,"(No 0019)");
	    }
	    SetPVarInt(playerid,"AC_DEAT_CAR",Time+60);
	    return true;
	}*/
	//Car[VID][cIDinSvr]=0;

	format(str,sizeof(str),"UPDATE `car` SET `IDinSvr`='%i' WHERE `ID`='%i'", vehicleid, Car[VID][cNumber]);
	n_mysql_query( MySQL1, str, false); // query for saving ID vehicle in saver to DB SQL
	
	if(Car[VID][cInsu] > 1 ) // insurance system have insu more than 0
	{
	    //DestroyVehicle(vehicleid);
	    Car[VID][cInsu]=Car[VID][cInsu]-1;
	    Car[VID][cOnOffice] = 1;
	    Car[VID][cWorld] = 1;
	        	

		format(str,sizeof(str),"UPDATE `car` SET `World`='1',`OnOffice`='1',`Insu`='%i' WHERE `ID`='%i'", Car[VID][cInsu], Car[VID][cNumber]);
		n_mysql_query( MySQL1, str, false);
		SaveCars(vehicleid, VID, 2);
		GameTextForPlayer( Car[VID][cOwnerIDinSvr], str, 5000, 1);
	    SCM( Car[VID][cOwnerIDinSvr], 0xAACCFFFF, "PLAYERCAR: Your vehicle has been destroyed and you can claim it in insurance Office. with '/claiminsu'");
	    return 1;
	}

	if(Car[VID][cInsu]<=0) // insurance system if they are have no insurance
	{
	    Car[VID][cInsu]=0;
	    
	    DestroyVehicle(vehicleid); // removing vehicle on server
    		//car = car-1;
    		format(str, sizeof(str), "DELETE FROM `car` WHERE `number` = '%i'", Car[VID][cNumber]);
    		n_mysql_query(MySQL1 ,str,false); // removing vehilce player car from DB SQL
    		GameTextForPlayer( Car[VID][cOwnerIDinSvr], str, 5000, 1);
    		// Car[VID][cOwner]
    		SCM(Car[VID][cOwnerIDinSvr], 0xAACCFFFF, str); SCM( Car[VID][cOwnerIDinSvr], 0xAACCFFFF, "PLAYERCAR: Your vehicle has been destroyed forever cause no insurace office service again, sorry.");
    		Car[VID][cOnOffice]=0;

	    return 1;
	}




	if(AC_CarBoom[killerid]>0)
	{
	    SCMALL(-1,"1");
	    SetVehicleToRespawn(vehicleid);
	    return r_Kick(killerid,"(No 0019) - Anti BOOM car");
	}

	VehicleGasFuel[vehicleid]=0;
	DownFuel[vehicleid]=0;
	new vid=CarN[vehicleid][2];
	if(vid>0)
	{
	    Car[vid][cService]=300;
	    Car[vid][cX]=844.6816;
	    Car[vid][cY]=-595.6004;
	    Car[vid][cZ]=18.0698;
	    Car[vid][cA]=0;
	    Car[vid][cInt]=0;
	    Car[vid][cWorld]=0;
	    cFill[vehicleid]=GetCarBak(vehicleid);
	   	Car[vid][cOil]=3000;
	   	Car[vid][cAcc]=1000;
	   	Car[vid][cSparkPlug1]=100;
	   	Car[vid][cSparkPlug2]=100;
	   	Car[vid][cSparkPlug3]=100;
	   	Car[vid][cSparkPlug4]=100;
	   	Car[vid][cSparkPlug5]=100;
	   	Car[vid][cSparkPlug6]=100;
	    cLamp[vehicleid]=false;
	    cEngine[vehicleid]=false;
	    cLock[vehicleid]=true;
	    cTrunk[vehicleid]=false;
    	cGlove[vehicleid]=false;
    	cBonnet[vehicleid]=false;
	    SaveCars(vehicleid,vid,1);
	    DeleteCar(vehicleid,0);
	    UpDateBonnetTextInfo(vehicleid,1);
	}
	for(new playerid;playerid<=GetPlayerPoolSize();playerid++)
	{
		if(GetPVarInt(playerid,"PortCarID")==vehicleid)
		{
		    StartSalonGPS[playerid]=false;PlayerGPS[playerid]=false;
		    DisablePlayerRaceCheckpoint(playerid);
			new s=GetPVarInt(playerid,"SalonIdPort");
			new slot=GetPVarInt(playerid,"SalonSlot");
			SalonZakazCarIdSlot[s][slot]=0;
			DeleteCar(vehicleid);
			DeletePVar(playerid,"PortCarID");
			DeletePVar(playerid,"SalonIdPort");
			DeletePVar(playerid,"SalonSlot");
			SCM(playerid,-1,"Kamu gagal mengangkut kendaraan di pasar mobil!",1);
			break;
		}
	}
	return true;
}


public OnVehicleSpawn(vehicleid)
{
	new strID[300];
    cTrunk[vehicleid]=false;
    cBonnet[vehicleid]=false;
    cGlove[vehicleid]=false;
	VehicleGasFuel[vehicleid]=0;
	DownFuel[vehicleid]=0;
	gCarH[vehicleid]=1000;
	new VID = CarN[vehicleid][2];
	Car[VID][cIDinSvr] = vehicleid; // VID is ID vehicle in database, and vehicle id is ID vehicle in server.

	format(strID,sizeof(strID),"UPDATE `car` SET `IDinSvr`='%i' WHERE `ID`='%i'", Car[VID][cIDinSvr], Car[VID][cNumber]);
	n_mysql_query( MySQL1, strID, false);



	if(Car[VID][cOnOffice] == 1) // vehicle have problem in insurance office.
	{

		SetVehicleVirtualWorld(vehicleid, 1); // worl for insurace office.
		SCM( Car[VID][cOwnerIDinSvr], 0xAACCFFFF, "PLAYERCAR: {FFFFFF}Your vehicle has arraive and serviced in insurance Office. {EEFFAA}'/claiminsu [Number ID in DB]'");
	   	
	   	format(strID, sizeof(strID), "INSURANCE: Sir you are have verhicle Number in DB is: [%i], with insurance time: [%i] years, That vehicle have ID in Server: [%d]", Car[VID][cNumber], Car[VID][cInsu], Car[VID][cIDinSvr]);
		SendClientMessage( Car[VID][cOwnerIDinSvr], -1, strID);
	}


	format(strID,sizeof(strID),"UPDATE `car` SET `IDinSvr`='%i' WHERE `ID`='%i'", vehicleid, Car[VID][cNumber]);
	n_mysql_query( MySQL1, strID, false);

	new playerid=0;
	for(playerid; playerid<=GetPlayerPoolSize(); playerid++)
	{
				if(Car[VID][cOwner]==Player[playerid][pID]) // same ID player in database
				{
					Car[VID][cOwnerIDinSvr] = playerid; // will be have same id player is server
					
					
					break;

				}
		    
			
		
	}

	format(strID,sizeof(strID),"UPDATE `car` SET `OwnerinSvr`='%i' WHERE `ID`='%i'", Car[VID][cOwnerIDinSvr], Car[VID][cNumber]);
	n_mysql_query( MySQL1, strID, false); // query function for saving owner id in server to DB SQL

	new vip=CarN[vehicleid][2];
    if(vip>0)
    {
        SetVehiclePos(vehicleid, Car[vip][cX], Car[vip][cY], Car[vip][cZ]);
        SetVehicleZAngle(vehicleid, Car[vip][cA]);
        SetVehicleHealth(vehicleid,Car[vip][cHealth]);
		UpdateVehicleDamageStatus(vehicleid,Car[vip][cPanels],Car[vip][cDoors],Car[vip][cLights],Car[vip][cTires]);
    }
    if(CarN[vehicleid][0]==0&&CarN[vehicleid][1]==0&&CarN[vehicleid][2]==0&&CarN[vehicleid][3]==0&&CarN[vehicleid][4]==0)
    {
		cFill[vehicleid]=GetCarBak(vehicleid);
    }
	return true;
}


CMD:specveh(playerid, params[])
{
	new targetvehicleid, str[200];
    if(SCMAdmin(playerid,1)==1)return true;
	if(sscanf( params, "i", targetvehicleid) ) return SCM(playerid, CG1, "Gunakan: /:specveh [targetvehicleserverid]");
    
	PlayerSpectateVehicle(playerid, targetvehicleid, SPECTATE_MODE_NORMAL);
}




CMD:claiminsu(playerid, params[])
{
	new vehicleid, v, cNumberReq, str[300], Float:x, Float:y, Float:z, Float:ang;
    new VID=CarN[vehicleid][2];
    if(sscanf( params, "i", cNumberReq) ) return SCM(playerid, CG1, "Gunakan: /:claiminsu [Number ID Vehicle in Database]");
    
    for(new v=1;v<=MAX_LOAD_CAR;v++)
			    {
			   
			        if(Car[v][cNumber]==cNumberReq) // take ID vehicle from Database
			        {
			            VID=v; break; // find  slot vehicle ID. with find number primary car player
			        }
			    }
	format(str, sizeof(str), "INSURANCE: Wellcome ot Insurance Office, Sir you are request Car Number in DB is: %i, with insurance time: [%i] year, di kendaraan anda yang ber IDserver: %d", Car[VID][cNumber], Car[VID][cInsu], Car[VID][cIDinSvr]);
	SendClientMessage(playerid, -1, str);
	//vehicleid=cNumberReq;		    
	//VID=CarN[vehicleid][2];
    GetPlayerPos(playerid, Float:x, Float:y, Float:z); // your position
    GetPlayerFacingAngle(playerid, Float:ang); // your angle

    if(Car[VID][cOnOffice] == 1) // status of vehicle just in insurance office
    {
    	//vehicleid = CreateVehicle(Car[VID][cModel], Float:x, Float:y, Float:z, Float:ang, Car[VID][cColorA], Car[VID][cColorB], 600000);
    	SetVehicleVirtualWorld(Car[VID][cIDinSvr], 0); // just back from vehicle in insurance office status.
    	SetVehiclePos(Car[VID][cIDinSvr], Float:x, Float:y, Float:z);
    	PutPlayerInVehicle(playerid, Car[VID][cIDinSvr], 0);
    	SetVehicleHealth( Car[VID][cIDinSvr], 1000);
	   	RepairVehicle( Car[VID][cIDinSvr]);
	    if(VID>0)
		{
		    Car[VID][cHealth]=1000;
			Car[VID][cPanels]=0;
			Car[VID][cDoors]=0;
			Car[VID][cLights]=0;
			Car[VID][cTires]=0;
			SaveCars( Car[VID][cIDinSvr], VID,1);
		}
		Car[VID][cInsu]=Car[VID][cInsu]-1;
		format(str,sizeof(str),"UPDATE `car` SET `OnOffice`='0',`World`='0',`IDinSvr`='%i',`Insu`='%i' WHERE `ID`='%i'", vehicleid, Car[VID][cInsu], Car[VID][cNumber]);
		n_mysql_query( MySQL1, str, false);
		SendClientMessage(playerid, -1, str);
		format(str, sizeof(str), "INSURANCE: Now you just have insurance for: %i years, and this vehicle IDin Server: %d", Car[VID][cInsu], vehicleid);
		SendClientMessage(playerid, -1, str);
		format(str, sizeof(str), "INSURANCE: Admin berhasil mengatur jumlah insurance sebesar: %i di kendaraan anda yang ber IDserver: %d", Car[VID][cInsu], vehicleid);
		SendClientMessage(Car[VID][cOwnerIDinSvr], -1, str);
		PutPlayerInVehicle(playerid, vehicleid, 0);
		SaveCars(vehicleid, VID, 1);
		return 1;
    }
	else
	{
		SendClientMessage( playerid, -1, "INSURANCE: Sorry sir, that vehicle was not longer at office service.");
		format(str, sizeof(str), "INSURANCE: ID number yang di mohon di DB:%i, Ketersediaan di kantor:%i, insurance selama: %i tahun, di kendaraan anda yang ber IDserver: %d", Car[VID][cNumber], Car[VID][cOnOffice], Car[VID][cInsu], vehicleid);
		SendClientMessage(Car[VID][cOwnerIDinSvr], 0xFFBBBBFF, str);
		return 1;
	}

}



CMD:asetinsu(playerid, params[])
{
	new vehicleid, value, ammo, str[200];
    if(SCMAdmin(playerid,1)==1)return true;
    if(sscanf(params, "ii", vehicleid, value)) return SCM(playerid, CG1, "Gunakan: /asetinsu [vehicleid in server] [value years of insurace]");
    new VID=CarN[vehicleid][2]; // VID is meaning id vehicle of database player cars ID primary key.
	


	Car[VID][cInsu] = value;
	format(str,sizeof(str),"UPDATE `car` SET `Insu`='%i' WHERE `ID`='%i'", Car[VID][cInsu], Car[VID][cNumber]);
	n_mysql_query( MySQL1, str, false); // this is quey to update amount of year insurance of vehicle id in DB SQL
	SendClientMessage(playerid, -1, str);
	format(str, sizeof(str), "INSURANCE: Berhasil mengatur jumlah insurance sebesar: %i di kendaraan IDserver: %d", Car[VID][cInsu], vehicleid);
	SendClientMessage(playerid, -1, str);
	format(str, sizeof(str), "INSURANCE: Admin berhasil mengatur jumlah insurance sebesar: %i di kendaraan anda yang ber IDserver: %d", Car[VID][cInsu], vehicleid);
	SendClientMessage(Car[VID][cOwnerIDinSvr], -1, str);
	SaveCars(vehicleid, VID, 1);
	return 1;


}


CMD:stats(playerid, params[])
{
	ShowStatsPlayer(playerid,playerid);
}



CMD:jp(playerid, params[])
{
	if(SCMAdmin(playerid,1)==1)return true;
	    SetPlayerSpecialAction(playerid,SPECIAL_ACTION_USEJETPACK);
		return 1;
}
ALTX:jp("/jetpack","/terbang");



CMD:asettime(playerid, params[])
{
	if(SCMAdmin(playerid,1)==1)return true;
      new
   Float:x, Float:y, Float:z;
   extract params -> new hour;
   //new ID=strval(params);

  if(sscanf(params, "d", hour)) return SendClientMessage(playerid, -1, "[USAGE]: /asettime [hour].");
  
  SetWorldTime(hour);
  
  new notif[200];
  format(notif, 200, "{AACCFF}TIME:{FFFFFF} Changed to hour: %d", hour);
  SendClientMessageToAll(-1, notif);

}




CMD:asetweather(playerid, params[])
{
	if(SCMAdmin(playerid,1)==1)return true;
      new
   Float:x, Float:y, Float:z;
   extract params -> new WeatherID;
   //new ID=strval(params);

  if(sscanf(params, "d", WeatherID)) return SendClientMessage(playerid, -1, "[USAGE]: /asetweather [ID].");
  
  
  SetWeather(WeatherID);
  new notif[200];
  format(notif, 200, "{AACCFF}WEATHER:{FFFFBB} Changed to ID: %d", WeatherID);
  SendClientMessageToAll( -1, notif);

}


CMD:playervehdel(playerid, params[])
{
	if(SCMAdmin(playerid,1)==1)return true;
	new veh;
    if(IsPlayerInAnyVehicle(playerid)){veh = GetPlayerVehicleID(playerid);}
	else {fGetAroundPlayerVehicleID(playerid, veh,4);}
	if(veh==0)return SCM(playerid,-1,"Tidak ada transportasi di dekat Anda.",1);
	new strrr[300];
	new VID = CarN[veh][2]; // Car[VID][cOwner]
	new targetid;
    
    if(sscanf(params, "i",targetid)) return SCM(playerid, 0xFFDDEEFF, "USAGE: '/playervehdel [targetid]'");
    if(Car[VID][cOwner] == Player[targetid][pID])
    {
    	if(GetVehicleModel(veh) == Car[VID][cModel])
    	{

    		DestroyVehicle(veh);
    		//car = car-1;
    		format(strrr, sizeof(strrr), "DELETE FROM `car` WHERE `number` = '%i'", Car[VID][cNumber]);
    		n_mysql_query(MySQL1 ,strrr,false);
    		SCM(playerid, 0xAACCFFFF, strrr); SCM( targetid, 0xAACCFFFF, "PLAYERCAR: Admin has been delete your vehicle from database, sorry.");
    		
    	}
    	else
    	{ 
    		format(strrr, sizeof(strrr), "PLAYERCAR: Wrong modelid vehicle, you in {FFAAAA}modelvehID:%i but need model ID %i {FFCCCC}please find same model.", GetVehicleModel(veh), Car[VID][cModel]);
    		SCM(playerid, 0xFFCCCCFF, strrr);
    	}
    	
    }
    else
    {
    	format(strrr, sizeof(strrr), "PLAYERCAR: Sir you need near player car location wanna to delete, Owner this veh IDdatabase:%i but target OwnerIDinDatabase:%i", Car[VID][cOwner], Player[targetid][pID]);
    		
    	SCM(playerid, 0xFFCCCCFF, strrr);
    }
}


CMD:giveweap(playerid, params[])
{
	new targetid, weaponid, ammo;
    if(SCMAdmin(playerid,1)==1)return true;
    if(sscanf(params, "iii",targetid, weaponid, ammo)) return SCM(playerid, CG1, "Gunakan: /giveweap [targetid] [weaponid] [ammo]");

	
    
    GivePlayerWeapon(targetid, weaponid, ammo);
    SCM(playerid, CG1, "Have new weapon sir.");
    return 1;
}



CMD:giveveh(playerid, params[])
{
	new x, y, z, angle, color1, color2, targetid, modelveh, str[300];
	
	GetPlayerPos(playerid, Float:x, Float:y, Float:z);
	GetPlayerFacingAngle(playerid, Float:angle);
	if(SCMAdmin(playerid,1)==1)return true;
    if(sscanf(params, "iiii", targetid, modelveh, color1, color2)) return SCM(playerid, CG1, "Gunakan: /giveveh [targetplayerid] [modelvehid] [color1] [color2]");
   
	
				if(CheckMaxCarPlayer(playerid)>=CheckMaxPlayerCars(playerid))return SCM( playerid, -1, "Karakter tersebut tidak dapat memiliki lebih banyak kendaraan pribadi lagi karena server sudah penuh.");
				format(str, sizeof(str), "DEBUG: modelveh Database=%i", modelveh); SCM(playerid, 0xFFCCCCFF, str);
				new VID;
			    for(new v=1;v<=MAX_LOAD_CAR;v++)
			    {
			        if(Car[v][cNumber]>0)continue;
			        if(Car[v][cNumber]==0)
			        {
			            VID=v; break; // find emty slot vehicle ID. with find number primary car player
			        }
			    }
			    format(str, sizeof(str), "DEBUG: VID Database=%i", VID); SCM(playerid, 0xFFCCCCFF, str);

			    if(VID==0)return SCM(playerid, -1, "Tidak ada slot lagi untuk kendaraan yang bisa di muat di server.");
			    if(Car[VID][cNumber]>0)printf("GIVEVEH: Replacet with same slot %i pemain %s",VID,GN(playerid));
				
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
				
				new carid=CreateVehicle(Car[VID][cModel],Float:x+Float:2.0, Float:y+Float:3.0, Float:z, Float:angle, color1, color2, 0, 0);
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

			    
				format(str, sizeof(str), "INSERT INTO `Car` (`Number`,`Prise`,`Model`,`Owner`,`ColorA`,`ColorB`) VALUES ('%i','%i','%i','%i','%i','%i')", Car[VID][cNumber], Car[VID][cPrise], Car[VID][cModel], Car[VID][cOwner], color1, color2);
				mysql_query(MySQL1, str);
				SaveCars(carid,VID,2);
				
				SetVehicleVirtualWorld(carid, 0);

				SCM(targetid,-1,"{AADDFF}VEHICLE:{FFFFFF} Anda di berikan mobil baru oleh admin.");
				GameTextForPlayer( targetid, "~g~Bonus kendaraan dari\nadmin", 5000, 3);
				GameTextForPlayer( playerid, "~g~Thanks for duty as\nadmin", 5000, 3);
				PutPlayerInVehicle( playerid, carid, 0);
				
		        PlayerGPS[targetid]=false;
		        GetVehiclePos(carid, Float:x, Float:y, Float:z);
		        //SetPlayerCheckpoint(targetid, Float:x, Float:y, Float:z, Float:5.0);
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



