enum sInfo
{
	sCreated,
    Float:sX,
    Float:sY,
    Float:sZ,
    sObject,
};
new SpikeInfo[MAX_SPIKESTRIPS][sInfo];
 

enum rInfo
{
	sCreated,
    Float:sX,
    Float:sY,
    Float:sZ,
    sObject,
};
new RoadInfo[MAX_ROADBLOCKS][rInfo];

stock IsACop(playerid)
{
	if(IsPlayerConnected(playerid))
	{
	    new leader = PlayerInfo[playerid][pLeader];
	    new member = PlayerInfo[playerid][pMember];
	    if(member == 1 || member == 2 || member == 3 || member == 7) return 1;
		else if(leader == 1 || leader == 2 || leader == 3 || leader == 7) return 1;
		new type = FactionInfo[PlayerInfo[playerid][pMember]][FactionType];
		if(type == 1) return 1;
		else if(type == 2) return 1;
		else if(type == 5) return 1;
	}
	return 0;
}

stock IsASoldier(playerid)
{
	if(IsPlayerConnected(playerid))
	{
	    new leader = PlayerInfo[playerid][pLeader];
	    new member = PlayerInfo[playerid][pMember];
	    if(member == 5) return 1;
		else if(leader == 5) return 1;
		new type = FactionInfo[PlayerInfo[playerid][pMember]][FactionType];
		if(type == 3) return 1;
	}
	return 0;
}



stock CreateRoad(Float:x,Float:y,Float:z,Float:Angle)
{
    for(new i = 0; i < sizeof(RoadInfo); i++)
  	{
  	    if(RoadInfo[i][sCreated] == 0)
  	    {
            RoadInfo[i][sCreated]=1;
            RoadInfo[i][sX]=x;
            RoadInfo[i][sY]=y;
            RoadInfo[i][sZ]=z;
            RoadInfo[i][sObject] = CreateDynamicObject(978, x, y, z, 0, 0, Angle,0,0,-1,250);
	        return 1;
  	    }
  	}
  	return 0;
}

stock DeleteAllRoad()
{
    for(new i = 0; i < sizeof(RoadInfo); i++)
  	{
  	    if(RoadInfo[i][sCreated] == 1)
  	    {
  	        RoadInfo[i][sCreated]=0;
            RoadInfo[i][sX]=0.0;
            RoadInfo[i][sY]=0.0;
            RoadInfo[i][sZ]=0.0;
            DestroyDynamicObject(RoadInfo[i][sObject]);
  	    }
	}
    return 0;
}

stock DeleteClosestRoad(playerid)
{
    for(new i = 0; i < sizeof(RoadInfo); i++)
  	{
  	    if(IsPlayerInRangeOfPoint(playerid, 2.0, RoadInfo[i][sX], RoadInfo[i][sY], RoadInfo[i][sZ]))
        {
  	        if(RoadInfo[i][sCreated] == 1)
            {
                new string[256];
		        new location[MAX_ZONE_NAME];
				GetPlayer2DZone(playerid, location, MAX_ZONE_NAME);
			    format(string, sizeof(string), "HQ: %s %s has deleted a road block at %s.", GetPlayerRank(playerid),PlayerName(playerid), location);
				SendRadioMessage(1, TEAM_BLUE_COLOR, string);
				SendRadioMessage(2, TEAM_BLUE_COLOR, string);
				SendRadioMessage(3, TEAM_BLUE_COLOR, string);
				SendRadioMessage(5, TEAM_BLUE_COLOR, string);
                RoadInfo[i][sCreated] = 0;
                RoadInfo[i][sX] = 0.0;
                RoadInfo[i][sY] =0.0;
                RoadInfo[i][sZ] = 0.0;
                DestroyDynamicObject(RoadInfo[i][sObject]);
                return 1;
  	        }
  	    }
  	}
    return 0;
} 
 
stock CreateStrip(Float:x,Float:y,Float:z,Float:Angle)
{
    for(new i = 0; i < sizeof(SpikeInfo); i++)
  	{
  	    if(SpikeInfo[i][sCreated] == 0)
  	    {
            SpikeInfo[i][sCreated]=1;
            SpikeInfo[i][sX]=x;
            SpikeInfo[i][sY]=y;
            SpikeInfo[i][sZ]=z-0.7;
            SpikeInfo[i][sObject] = CreateDynamicObject(2899, x, y, z-0.9, 0, 0, Angle-90);
	        return 1;
  	    }
  	}
  	return 0;
}
stock DeleteAllStrip()
{
    for(new i = 0; i < sizeof(SpikeInfo); i++)
  	{
  	    if(SpikeInfo[i][sCreated] == 1)
  	    {
  	        SpikeInfo[i][sCreated]=0;
            SpikeInfo[i][sX]=0.0;
            SpikeInfo[i][sY]=0.0;
            SpikeInfo[i][sZ]=0.0;
            DestroyDynamicObject(SpikeInfo[i][sObject]);
  	    }
	}
    return 0;
}
stock DeleteClosestStrip(playerid)
{
    for(new i = 0; i < sizeof(SpikeInfo); i++)
  	{
  	    if(IsPlayerInRangeOfPoint(playerid, 2.0, SpikeInfo[i][sX], SpikeInfo[i][sY], SpikeInfo[i][sZ]))
        {
  	        if(SpikeInfo[i][sCreated] == 1)
            {
                new string[256];
		        new location[MAX_ZONE_NAME];
				GetPlayer2DZone(playerid, location, MAX_ZONE_NAME);
			    format(string, sizeof(string), "building: %s %s has deleted a spike strip at %s.", GetPlayerRank(playerid),PlayerName(playerid), location);
				SendRadioMessage(1, TEAM_BLUE_COLOR, string);
				SendRadioMessage(2, TEAM_BLUE_COLOR, string);
				SendRadioMessage(3, TEAM_BLUE_COLOR, string);
				SendRadioMessage(5, TEAM_BLUE_COLOR, string);
                SpikeInfo[i][sCreated]=0;
                SpikeInfo[i][sX]=0.0;
                SpikeInfo[i][sY]=0.0;
                SpikeInfo[i][sZ]=0.0;
                DestroyDynamicObject(SpikeInfo[i][sObject]);
                return 1;
  	        }
  	    }
  	}
    return 0;
} 
  
stock CreateStrip(Float:x,Float:y,Float:z,Float:Angle)
{
    for(new i = 0; i < sizeof(SpikeInfo); i++)
  	{
  	    if(SpikeInfo[i][sCreated] == 0)
  	    {
            SpikeInfo[i][sCreated]=1;
            SpikeInfo[i][sX]=x;
            SpikeInfo[i][sY]=y;
            SpikeInfo[i][sZ]=z-0.7;
            SpikeInfo[i][sObject] = CreateDynamicObject(2899, x, y, z-0.9, 0, 0, Angle-90);
	        return 1;
  	    }
  	}
  	return 0;
}
  
stock SendSplitMessage(playerid, color,final[])
{
    new buffer[EX_SPLITLENGTH+10];
    new len = strlen(final);
    if(len>EX_SPLITLENGTH)
    {
        new times = (len/EX_SPLITLENGTH);
        for(new i = 0; i < times+1; i++)
        {
            strdel(buffer, 0, EX_SPLITLENGTH+5);
            if(len-(i*EX_SPLITLENGTH)>EX_SPLITLENGTH)
            {
                strmid(buffer, final, EX_SPLITLENGTH*i, EX_SPLITLENGTH*(i+1));
                if(!i)
                	format(buffer, sizeof(buffer), "%s ...", buffer);
				else
				    format(buffer, sizeof(buffer), "... %s ...", buffer);
            }
            else
            {
                strmid(buffer, final, EX_SPLITLENGTH*i, len);
				format(buffer, sizeof(buffer), "... %s", buffer);
            }
            SendClientMessage(playerid, color, buffer);
        }
    }
    else
    {
        SendClientMessage(playerid, color, final);
    }
}

public SendRadioMessage(member, color, string[])
{
	//foreach(Player, i)
    for(new i; i<MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
		    if(PlayerInfo[i][pMember] == member || PlayerInfo[i][pLeader] == member)
		    {
				SendSplitMessage(i, color, string);
			}
		}
	}
}

  
  if(strcmp(cmd, "/deployspikes", true) == 0)
	{
	    if(IsACop(playerid) || IsAnAgent(playerid) || IsASoldier(playerid))
	    {
	        new Float:plocx,Float:plocy,Float:plocz,Float:ploca;
	        GetPlayerPos(playerid,plocx,plocy,plocz);
	        GetPlayerFacingAngle(playerid,ploca);
	        new location[MAX_ZONE_NAME];
	    	GetPlayer2DZone(playerid, location, MAX_ZONE_NAME);
	    	new Float:x, Float:y, Float:z, Float:angle;
	        GetPlayerFacingAngle(playerid, angle);
	        GetPlayerPos(playerid, x, y, z);
	    	CreateStrip(x, y, z, angle);
	        format(string, sizeof(string), "building: %s %s has placed a spike strip at %s", GetPlayerRank(playerid),RemoveUnderScore(playerid), location);
	    	SendRadioMessage(1, TEAM_BLUE_COLOR, string);
	    	SendRadioMessage(2, TEAM_BLUE_COLOR, string);
	    	SendRadioMessage(3, TEAM_BLUE_COLOR, string);
	    	SendRadioMessage(5, TEAM_BLUE_COLOR, string);
	    	ApplyAnimation(playerid, "BOMBER","BOM_Plant_Loop",4.0,0,0,0,0,0); // Plant bomb
	    	return 1;
		}
		SendClientMessage(playerid, COLOR_GREY, "You are not a Cop!");
	    return 1;
	}
  
  	if(strcmp(cmd, "/deletespike", true) == 0)
	{
	    if(!IsACop(playerid) || !IsAnAgent(playerid) || IsASoldier(playerid))
	    {
	        return SendClientMessage(playerid,COLOR_GREY,"   You are not a member of the LSPD / SASD / DoC !");
	    }
	    if(PlayerInfo[playerid][pMember] == 1)
	    {
		    if(PlayerInfo[playerid][pRank] < 4)
		    {
		        return SendClientMessage(playerid,COLOR_GREY,"   Your rank is too low to be removing spike strips !");
		    }
		}
		else
		{
		    if(PlayerInfo[playerid][pRank] < 5)
		    {
		        return SendClientMessage(playerid,COLOR_GREY,"   Your rank is too low to be removing spike strips !");
		    }
		}
        DeleteClosestStrip(playerid);
	    return 1;
	}
	if(strcmp(cmd, "/deletespikes", true) == 0)
	{
	    if(!IsACop(playerid) || PlayerInfo[playerid][pMember] == 5)
	    {
	        return SendClientMessage(playerid,COLOR_GREY,"   You are not a member of the LSPD / SASD / DoC !");
	    }
	    if(PlayerInfo[playerid][pMember] == 1)
	    {
		    if(PlayerInfo[playerid][pRank] < 4)
		    {
		        return SendClientMessage(playerid,COLOR_GREY,"   Your rank is too low to be removing spike strips !");
		    }
		}
		else
		{
		    if(PlayerInfo[playerid][pRank] < 5)
		    {
		        return SendClientMessage(playerid,COLOR_GREY,"   Your rank is too low to be removing spike strips !");
		    }
		}
	    format(string, sizeof(string), "building: %s %s has deleted all spike strips.", GetPlayerRank(playerid),RemoveUnderScore(playerid));
		SendRadioMessage(1, TEAM_BLUE_COLOR, string);
		SendRadioMessage(2, TEAM_BLUE_COLOR, string);
		SendRadioMessage(3, TEAM_BLUE_COLOR, string);
		SendRadioMessage(5, TEAM_BLUE_COLOR, string);
        DeleteAllStrip();
	    return 1;
	}
  
  if(strcmp(cmd, "/deployblocks", true) == 0)
	{
	    if(!IsACop(playerid) && !IsASoldier(playerid))
	    {
	        return SendClientMessage(playerid,COLOR_GREY,"   You are not part of a Team!");
	    }
	    if(IsACop(playerid) || IsASoldier(playerid) || IsAnAgent(playerid))
	    {
		    if(PlayerInfo[playerid][pRank] < 4)
		    {
		        return SendClientMessage(playerid,COLOR_GREY,"   Your rank is too low to be deploying road blocks!");
		    }
		}
		else
		{
		    if(PlayerInfo[playerid][pRank] < 5)
		    {
		        return SendClientMessage(playerid,COLOR_GREY,"   Your rank is too low to be removing road blocks!");
		    }
		}
	    if(IsPlayerInAnyVehicle(playerid))
	    {
	        return SendClientMessage(playerid,COLOR_GREY,"   You cannot place a road block while inside a vehicle!");
	    }
	    new Float:plocx,Float:plocy,Float:plocz,Float:ploca;
	    GetPlayerPos(playerid,plocx,plocy,plocz);
	    GetPlayerFacingAngle(playerid,ploca);
	    new location[MAX_ZONE_NAME];
		GetPlayer2DZone(playerid, location, MAX_ZONE_NAME);
		GetPlayerFacingAngle(playerid,ploca);
        CreateRoad(plocx,plocy,plocz,ploca);
	    format(string, sizeof(string), "HQ: %s %s has placed a road block at %s", GetPlayerRank(playerid),RemoveUnderScore(playerid), location);
		SendRadioMessage(1, TEAM_BLUE_COLOR, string);
		SendRadioMessage(2, TEAM_BLUE_COLOR, string);
		SendRadioMessage(3, TEAM_BLUE_COLOR, string);
		SendRadioMessage(5, TEAM_BLUE_COLOR, string);
		ApplyAnimation(playerid, "BOMBER","BOM_Plant_Loop",4.0, 0, 0, 0, 0, 1); // Plant bomb
	    return 1;
	}
  
  
