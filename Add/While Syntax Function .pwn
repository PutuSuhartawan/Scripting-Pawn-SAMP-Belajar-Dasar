

GetPlayerCountry(playerid,Country[256]){
   	new IPAddress[256];
   	new a,b,c,d,ipf;
   	new File:IPFile;
   	new Text[256],start,end;
   	GetPlayerIp(playerid,IPAddress,sizeof(IPAddress));
   	GetParams(IPAddress);
   	a=strval(Params[0]);
   	b=strval(Params[1]);
   	c=strval(Params[2]);
   	d=strval(Params[3]);
   	if(a==127 && b==0 && c==0 && d==1){
   		format(Country,sizeof(Country),"Localhost");
   		return 1;
   	}
   	ipf = (16777216*a) + (65536*b) + (256*c) + d;
   	if(!fexist("CountriesIPs/IPLIST.csv")) return SendClientMessage(playerid,0xFF0000FF,"Country file not found.");
   	IPFile=fopen("CountriesIPs/IPLIST.csv",io_read);
   	fread(IPFile,Text,sizeof(Text),false);
	while(strlen(Text)>0){
	    GetFileData(Text);
	    start=strval(FileData[0]);
	    end=strval(FileData[1]);
	    if(ipf>=start && ipf<=end){
			format(Country,sizeof(Country),"%s(%s)",FileData[6],FileData[5]);
			fclose(IPFile);
			return 1;
	    }
	    fread(IPFile,Text,sizeof(Text),false);
	}
	fclose(IPFile);
	return 1;
}


	while(x != MAX_PLAYERS)
	{
		if(IsPlayerConnected(x) && GetPlayerState(x) == PLAYER_STATE_SPECTATING && SpectatedID[x] == playerid)
		{
		    SetPlayerHealth(x, PlayerInfo[x][pHealth]);
			SetPlayerArmour(x, PlayerInfo[x][pArmor]);
			SetPlayerVirtualWorld(x, PlayerInfo[x][pVirtualWorld]);
			SetPlayerInterior(x, PlayerInfo[x][pInt]);
   			SetPlayerPos(x, PlayerInfo[x][pSPos_x], PlayerInfo[x][pSPos_y], PlayerInfo[x][pSPos_z]);
			SetPlayerFacingAngle(x, PlayerInfo[x][pSPos_r]);
			SendClientMessage(x, COLOR_WHITE, "You are no longer spectating.");
   			TogglePlayerSpectating(x, 0);
			CanTalk[playerid] = 1;
   			SpectatedID[x] = INVALID_PLAYER_ID;
   			SpectateType[x] = ADMIN_SPEC_TYPE_NONE;
   			HidePM[x] = 0;
			PhoneOnline[x] = 0;
			ResetPlayerAdminWeaponsEx(x);
		}
		x++;
	}
  
  
  public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid)
{
	if(!newinteriorid)
	{
	    SetPVarInt(playerid, "InGarage", 0);
	}
    new x = 0;
	while(x != MAX_PLAYERS) //new spectate code
	{
	    if(IsPlayerConnected(x) && GetPlayerState(x) == PLAYER_STATE_SPECTATING && SpectatedID[x] == playerid)
   		{
   		    PlayerSpectatePlayer(x,playerid);
   		    SetPlayerVirtualWorld(x, newinteriorid);
			SetPlayerInterior(x, newinteriorid);
		}
		x++;
	}
}


