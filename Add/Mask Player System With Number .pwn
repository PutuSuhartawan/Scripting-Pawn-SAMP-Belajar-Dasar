
    if(strcmp(cmd, "/mask", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        if(PlayerInfo[playerid][pMask] != 0)
	        {
				if(PlayerInfo[playerid][pInjured] != 0 || PlayerInfo[playerid][pJailed] != 0 || adminduty[playerid] == 1 || PlayerPaintballing[playerid] != 0)
				{
					SendClientMessage(playerid, COLOR_GREY, "   You cannot do that on this time");
					return 1;
				}
		    	
		    	if(UsingMask[playerid] == 0)
		   	 	{
				    UsingMask[playerid] = 1;
				    JobDuty[playerid] = 0;
				    SetPlayerToTeamColor(playerid);
					format(string, sizeof(string), "Mask_%d", PlayerInfo[playerid][pMask]);
					CharText[playerid] = Create3DTextLabel(string, 0xFFFFFFFF, 30.0, 40.0, 50.0, 15.0, 0);
					SetPlayerName(playerid, string);
				    Attach3DTextLabelToPlayer(CharText[playerid], playerid, 0.0, 0.0, 0.2);
	      		    format(string, sizeof(string), "* %s Takes out his Mask and puts it over his face.", RemoveUnderScore(playerid));
	      		    ProxDetector(15.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);

	      		}
	      		else if(UsingMask[playerid] == 1)
		   	 	{
				    UsingMask[playerid] = 0;
				    SetPlayerToTeamColor(playerid);
				    Delete3DTextLabel(CharText[playerid]);
				    CharText[playerid] = Text3D:INVALID_3DTEXT_ID;
				    for(new i=0; i<MAX_PLAYERS; i++)
	   			    {
	   		    	    if(IsPlayerConnected(i))
	   		    	    {
			   			    ShowPlayerNameTagForPlayer(i, playerid, true);
					    }
				    }
					new normalname[20];
		     		strmid(normalname, PlayerInfo[playerid][pNormalName], 0, strlen(PlayerInfo[playerid][pNormalName]), 255);
		     		SetPlayerName(playerid, normalname);
	      		    format(string, sizeof(string), "* %s Takes off his mask and hides it in his belt.", RemoveUnderScore(playerid));
	      		    ProxDetector(15.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
		   	 	}
	   	 	}
	   	 	else
	   	 	{
	            SendClientMessage(playerid, COLOR_GREY, "You don't have a mask.");
	            return 1;
	        }
		}
		return 1;
	}
	if(strcmp(cmd, "/listmasked", true) == 0)
	{
		if(IsPlayerConnected(playerid))
		{
			if(PlayerInfo[playerid][pAdmin] >= 2)
			{
			    SendClientMessage(playerid, COLOR_YELLOW, "Players who are masked:");
				for(new i; i<MAX_PLAYERS; i++)
				{
					if(IsPlayerConnected(i))
					{
						if(UsingMask[i] == 1)
						{
						    format(string, sizeof(string), "- %s: Mask %d", PlayerName(i), PlayerInfo[i][pMask]);
							SendClientMessage(playerid, COLOR_GREY, string);
						}
					}
				}
			}
		}
		return 1;
	}
  
  
	if(strcmp(cmd, "/aod", true) == 0)
	{
	   if(PlayerInfo[playerid][pAdmin] >= 2)
	   {
          if(UsingMask[playerid] == 1)
		  {
			 SendClientMessage(playerid, COLOR_GREY, "   Lepas Mask dulu !");
	         return 1;
		  }
		  if(PlayerPaintballing[playerid] == 1)
		  {
			 SendClientMessage(playerid, COLOR_GREY, "   Selesain Event dulu !");
	         return 1;
		  }
	      if(adminduty[playerid] != 1)
	      {
	         new adminname[20];
		     strmid(adminname, PlayerInfo[playerid][pAdminName], 0, strlen(PlayerInfo[playerid][pAdminName]), 255);
		     SetPlayerName(playerid, adminname);
             adminduty[playerid] = 1;
             SendClientMessage(playerid, COLOR_YELLOW, "You are now an on-duty Administrator!");
             SetPlayerColor(playerid, FLASH);
		  }
		  else
		  {
             new normalname[20];
		     strmid(normalname, PlayerInfo[playerid][pNormalName], 0, strlen(PlayerInfo[playerid][pNormalName]), 255);
		     SetPlayerName(playerid, normalname);
             adminduty[playerid] = 0;
             SendClientMessage(playerid, COLOR_YELLOW, "you are no longer an on-duty Administrator!");
             SetPlayerToTeamColor(playerid);
		  }
	   }
	   return 1;
	}
