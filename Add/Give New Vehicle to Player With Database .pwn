
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
            // if it starts automatically with a game, don't delete everything!
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
		        
				Car[idcar][cIDinSvr] = car; // VID is ID vehicle in database, and vehicle id is ID vehicle in server.

				LinkVehicleToInterior(car, Car[idcar][cInt]);
				SetVehicleVirtualWorld(car, 1);
	        	//if(Car[idcar][cOnOffice] == 1)
	        	//{
	        		//SetVehicleVirtualWorld(car, 1);

	        	//}
		        
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
    printf("[All player cars is]: <%i>. Time elapsed: <%i Mili Second>", maxcarveh, GetTickCount()-time);
	return true;
}

forward LoadSalon();
public LoadSalon()
{
    new time = GetTickCount();
    new vresult[15],rows,fields;
    cache_get_data(rows,fields);
    if(rows)
    {
        while(--rows>=0)
        {
            new salon;
            m_salon++;
            cache_get_field_content(rows,"Number",vresult), salon = strval(vresult);
            SalonCar[salon][asNumber]=salon;
            cache_get_field_content(rows,"Owner",vresult), SalonCar[salon][asOwner] = strval(vresult);
            cache_get_field_content(rows,"Leader",vresult), SalonCar[salon][asLeader] = strval(vresult);
            cache_get_field_content(rows,"NoWar",vresult), SalonCar[salon][asNoWar] = strval(vresult);
            cache_get_field_content(rows,"X",vresult), SalonCar[salon][asX] = floatstr(vresult);
            cache_get_field_content(rows,"Y",vresult), SalonCar[salon][asY] = floatstr(vresult);
            cache_get_field_content(rows,"Z",vresult), SalonCar[salon][asZ] = floatstr(vresult);
            cache_get_field_content(rows,"Int",vresult), SalonCar[salon][asInt] = strval(vresult);
            cache_get_field_content(rows,"World",vresult), SalonCar[salon][asWorld] = strval(vresult);
            cache_get_field_content(rows,"Prise",vresult), SalonCar[salon][asPrise] = strval(vresult);
            cache_get_field_content(rows,"Balanse",vresult), SalonCar[salon][asBalanse] = strval(vresult);
            cache_get_field_content(rows,"Money",vresult), SalonCar[salon][asMoney] = strval(vresult);
            cache_get_field_content(rows,"MaxSlot",vresult), SalonCar[salon][asMaxSlot] = strval(vresult);
            cache_get_field_content(rows,"IDsell",vresult), SalonCar[salon][asIDsell] = strval(vresult);
            cache_get_field_content(rows,"MoneySell",vresult), SalonCar[salon][asMoneySell] = strval(vresult);
            cache_get_field_content(rows,"TimerSell",vresult), SalonCar[salon][asTimerSell] = strval(vresult);

            cache_get_field_content(rows,"Job1",vresult), SalonCar[salon][asJob1] = strval(vresult);
            cache_get_field_content(rows,"Job2",vresult), SalonCar[salon][asJob2] = strval(vresult);
            cache_get_field_content(rows,"Job3",vresult), SalonCar[salon][asJob3] = strval(vresult);
            cache_get_field_content(rows,"Job4",vresult), SalonCar[salon][asJob4] = strval(vresult);
            cache_get_field_content(rows,"Job5",vresult), SalonCar[salon][asJob5] = strval(vresult);
            cache_get_field_content(rows,"Job6",vresult), SalonCar[salon][asJob6] = strval(vresult);

            SalonCar[salon][asTextSalon]=CreateDynamic3DTextLabel("Prosses lama...", COLOR_TEXT1, SalonCar[salon][asX],SalonCar[salon][asY],SalonCar[salon][asZ], 10, INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, SalonCar[salon][asWorld], SalonCar[salon][asInt],-1, 15);

            for(new s=1;s<MAX_SALON_SLOT;s++)
            {
                new st[13],resul[88];
                format(st,sizeof(st),"Slot%i",s);
                cache_get_field_content(rows,st,resul);

				new load[7][13];
				split(resul, load, '|');// 0|0|0|0|0|0|0
				SalonModelSlot[salon][s] = strval(load[0]);
				SalonCoordsSlot[salon][s][0] = floatstr(load[1]);
				SalonCoordsSlot[salon][s][1] = floatstr(load[2]);
				SalonCoordsSlot[salon][s][2] = floatstr(load[3]);
				SalonCoordsSlot[salon][s][3] = floatstr(load[4]);
				SalonPriseSlot[salon][s] = strval(load[5]);
				SalonRunSlot[salon][s] = strval(load[6]);

				if(SalonModelSlot[salon][s]==0)continue;

				SalonCarIdSlot[salon][s]=CreateVehicle(SalonModelSlot[salon][s],SalonCoordsSlot[salon][s][0],SalonCoordsSlot[salon][s][1],SalonCoordsSlot[salon][s][2],SalonCoordsSlot[salon][s][3],0,0,60000);
				CarN[SalonCarIdSlot[salon][s]][3]=SalonCarIdSlot[salon][s];

				new string[138];
				format(string,sizeof(string),"Biaya $%i\nCara membeli kendaraan ini,\nPergi ke dalam dealer dan masukkan nomor ini:\nNomor ID transportasi di Dealer: %i",SalonPriseSlot[salon][s],s);
				SalonTextSlot[salon][s]=CreateDynamic3DTextLabel(string, COLOR_TEXT1, 0,0,0, 10, INVALID_PLAYER_ID,SalonCarIdSlot[salon][s], 0, -1, -1,-1, 10);
            }
        }
    }
    Text3dInit[3]=10;
    printf("[Dealer telah spawn kendaraan dimuat sebanyak]: <%i>. Waktu Terbuang: <%i ms>",m_salon,GetTickCount()-time);
	return true;
}

forward SaveSalon(s,slot);
public SaveSalon(s,slot)
{
    switch(slot)
    {
        case 0:
        {
		    new string[50],query[492];
			format(string,sizeof(string),"UPDATE `Salon` SET "),strcat(query,string);
			format(string,sizeof(string),"`Owner`='%i',",SalonCar[s][asOwner]),strcat(query,string);
			format(string,sizeof(string),"`Prise`='%i',",SalonCar[s][asPrise]),strcat(query,string);
			format(string,sizeof(string),"`Leader`='%i',",SalonCar[s][asLeader]),strcat(query,string);
			format(string,sizeof(string),"`NoWar`='%i',",SalonCar[s][asNoWar]),strcat(query,string);
			format(string,sizeof(string),"`Balanse`='%i',",SalonCar[s][asBalanse]),strcat(query,string);
			format(string,sizeof(string),"`Money`='%i',",SalonCar[s][asMoney]),strcat(query,string);
			format(string,sizeof(string),"`X`='%f',",SalonCar[s][asX]),strcat(query,string);
			format(string,sizeof(string),"`Y`='%f',",SalonCar[s][asY]),strcat(query,string);
			format(string,sizeof(string),"`Z`='%f',",SalonCar[s][asZ]),strcat(query,string);
			format(string,sizeof(string),"`Int`='%i',",SalonCar[s][asInt]),strcat(query,string);
			format(string,sizeof(string),"`World`='%i',",SalonCar[s][asWorld]),strcat(query,string);
			format(string,sizeof(string),"`MaxSlot`='%i',",SalonCar[s][asMaxSlot]),strcat(query,string);
			format(string,sizeof(string),"`Job1`='%i',",SalonCar[s][asJob1]),strcat(query,string);
			format(string,sizeof(string),"`Job2`='%i',",SalonCar[s][asJob2]),strcat(query,string);
			format(string,sizeof(string),"`Job3`='%i',",SalonCar[s][asJob3]),strcat(query,string);
			format(string,sizeof(string),"`Job4`='%i',",SalonCar[s][asJob4]),strcat(query,string);
			format(string,sizeof(string),"`Job5`='%i',",SalonCar[s][asJob5]),strcat(query,string);
			format(string,sizeof(string),"`Job6`='%i',",SalonCar[s][asJob6]),strcat(query,string);
			format(string,sizeof(string),"`IDsell`='%i',",SalonCar[s][asIDsell]),strcat(query,string);
			format(string,sizeof(string),"`MoneySell`='%i',",SalonCar[s][asMoneySell]),strcat(query,string);
			format(string,sizeof(string),"`TimerSell`='%i' ",SalonCar[s][asTimerSell]),strcat(query,string);
			format(string,sizeof(string),"WHERE `Number` = '%i'",SalonCar[s][asNumber]),strcat(query,string);
		    n_mysql_query(MySQL1 ,query);
        }
        default:
        {
		    new string[200],query[240];
			format(string,sizeof(string),"UPDATE `Salon` SET "),strcat(query,string);
			format(string,sizeof(string),"`Slot%i`='%i|%f|%f|%f|%f|%i|%i' ",slot,SalonModelSlot[s][slot],SalonCoordsSlot[s][slot][0],SalonCoordsSlot[s][slot][1],SalonCoordsSlot[s][slot][2],SalonCoordsSlot[s][slot][3],SalonPriseSlot[s][slot],SalonRunSlot[s][slot]),strcat(query,string);
			format(string,sizeof(string),"WHERE `Number` = '%i'",SalonCar[s][asNumber]),strcat(query,string);
		    n_mysql_query(MySQL1 ,query);
        }
    }
	return true;
}

UpDateTextSalon(s)
{
	new str[200];
    if(SalonCar[s][asOwner]==0)
    {
		format(str,sizeof(str),"{FF9728} Nomor ID Dealer: %i telah di jual \n {ADD5E6} Properti bisnis seharga{4682b4} $%i \n {ADD5E6} Kerawanan tempat: {4682b4} %s (/ bizwar)}\n  {ADD5E6} Mulai interaksi tekan 'N'",s,SalonCar[s][asPrise],CheckLeaderName(SalonCar[s][asLeader]));
	}
	else
	{
		format(str,sizeof(str),"{FF9728}ID Dealer kendaraan: %i \n {ADD5E6} Pemiliknya: {4682b4}%s \n {ADD5E6} Tempat rawan: {4682b4}%s (/bizwar) \n {ADD5E6} Mulai interaksi tekan 'N' ",s,GetPlayerNameID(SalonCar[s][asOwner]),CheckLeaderName(SalonCar[s][asLeader]));
	}
    UpdateDynamic3DTextLabelText(SalonCar[s][asTextSalon],COLOR_TEXT1,str);
	return true;
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


SCMAdmin(playerid,admin)
{
	if(Player[playerid][pAdmin]<admin)return SCM(playerid,CG1,"Anda tidak memiliki hak istimewa yang memadai untuk mengakses perintah ini!",1);
	if(Player[playerid][pADostup]==0)return SCM(playerid,-1,"Anda belum masuk ke panel admin! /alogin",1);
	else return false;
}



CMD:giveveh(playerid, params[])
{
	new x, y, z, angle, color1, color2, targetid, modelveh;
	//new s=GetPVarInt(playerid,"UseIdSalon");
	//new slot=GetPVarInt(playerid,"UseSlotSalon");
	GetPlayerPos(playerid, Float:x, Float:y, Float:z);
	GetPlayerFacingAngle(playerid, Float:angle);
	if(SCMAdmin(playerid,1)==1)return true;
    if(sscanf(params, "iiii", targetid, modelveh, color1, color2)) return SCM(playerid, CG1, "Gunakan: /giveveh [targetplayerid] [modelvehid] [color1] [color2]");
    //color1 = strval(color1); color2 = strval(color2);
	
				if(CheckMaxCarPlayer(playerid)>=CheckMaxPlayerCars(playerid))return SCM(playerid,-1,"Karakter tersebut tidak dapat memiliki lebih banyak kendaraan pribadi lagi.",1);
				new VID;
			    for(new v=1;v<=MAX_LOAD_CAR;v++)
			    {
			        if(Car[v][cNumber]>0)continue;
			        if(Car[v][cNumber]==0)
			        {
			            VID=v; break;
			        }
			    }
			    if(VID==0)return SCM(playerid,-1,"Tidak ada slot lagi untuk kendaraan yang bisa di muat di server.",1);
			    if(Car[VID][cNumber]>0)printf("Saya merekamnya di slot yang sama! %i pemain %s",VID,GN(playerid));
				
        		//GlobalInfo[4][giIndex1]+=SalonPriseSlot[s][slot];SaveGlobal(4);
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
				// SSU
				Car[VID][cNumber]=VID;
				//new carid=SalonCarIdSlot[s][slot];
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
				//CreateVehicle(vehicletype, Float:x, Float:y, Float:z, Float:rotation, color1, color2, respawn_delay, addsiren=0)
				
				SetVehicleVirtualWorld(carid, 0);

				SCM(targetid,-1,"Anda di berikan mobil baru oleh admin",1);
				PutPlayerInVehicle( playerid, carid, 0);
				//CarN[SalonCarIdSlot[s][slot]][3]=0;
		        PlayerGPS[playerid]=true;
				SetPlayerRaceCheckpoint( playerid, 1, x+2, y+3, z,0.0,0.0,0.0,5.0);
}
