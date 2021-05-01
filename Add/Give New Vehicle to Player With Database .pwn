
CMD:giveveh(playerid, targetid, modelveh, params[])
{
	new x, y, z, angle, color1, color2;
	new s=GetPVarInt(playerid,"UseIdSalon");
	new slot=GetPVarInt(playerid,"UseSlotSalon");
	GetPlayerPos(playerid, Float:x, Float:y, Float:z);
	GetPlayerFacingAngle(playerid, Float:angle);
	if(SCMAdmin(playerid,1)==1)return true;
    if(sscanf(params, "iiii", targetid, modelveh, color1, color2)) return SCM(playerid, CG1, "Gunakan: /giveveh [targetid] [modelvehid] [color1] [color2]");

	
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
			    if(VID==0)return SCM(playerid,-1,"Tidak ada slot lagi untuk karakter tersebut.",1);
			    if(Car[VID][cNumber]>0)printf("Saya merekamnya di slot yang sama! %i pemain %s",VID,GN(playerid));
				
        		GlobalInfo[4][giIndex1]+=SalonPriseSlot[s][slot];SaveGlobal(4);
				Car[VID][cOwner]=Player[targetid][pID];
			    Car[VID][cModel]=SalonModelSlot[s][slot]=modelveh;
				Car[VID][cPrise]=SalonPriseSlot[s][slot];
			    Car[VID][cInt]=0;
				Car[VID][cWorld]=0;
				Car[VID][cHealth]=1000;
				Car[VID][cX]=x;
				Car[VID][cY]=y;
				Car[VID][cZ]=z;
				Car[VID][cA]=angle;
				// SSU
				Car[VID][cNumber]=VID;
				new carid=SalonCarIdSlot[s][slot];
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
				format(str, sizeof(str), "INSERT INTO `Car` (`Number`,`Prise`,`Model`,`Owner`) VALUES ('%i','%i','%i','%i')",Car[VID][cNumber],SalonPriseSlot[s][slot],SalonModelSlot[s][slot],Car[VID][cOwner]);
				mysql_query(MySQL1, str);
				SaveCars(carid,VID,1);
				//CreateVehicle(vehicletype, Float:x, Float:y, Float:z, Float:rotation, color1, color2, respawn_delay, addsiren=0)
				new car=CreateVehicle(Car[VID][cModel],x+2, y+3, z, angle, color1, color2);
				SCM(targetid,-1,"Anda di berikan mobil baru oleh admin",1);
				PutPlayerInVehicle( playerid, car, 0);
				CarN[SalonCarIdSlot[s][slot]][3]=0;
		        PlayerGPS[playerid]=true;
				SetPlayerRaceCheckpoint( targetid, 1, x+2, y+3, z,0.0,0.0,0.0,5.0);
}
