new BidPrice, HighestBidder, Itemofferings[50], CountDownAuction = 10, CountOfParticipants = 0, TimerLimitForAuction, AuctionRunning = 0, WinnerOfAuction[50], WinnerOfAuctionID, AuctionMartChartBoard; 
new TempatDisplayIklan, inputtext[2];
new TempatBeriklan;
new layariklanbadara;


	if(dialogid == DIALOG_INPUT_BID_AUCTION) //If Dialog auctiong data offering
    {
					new string[140];
			    	if(!response)
			    	{
						
						format(string, sizeof(string), "* %s cancel input bid auction on his smartphone.", GetRPName(playerid));
						LocalMessage(ACTION_DISTANCE, playerid, ACTION_COLOR, string);
						LocalMessage(ACTION_DISTANCE, playerid, ACTION_COLOR, "* The stock market has changing bid.((Staff of Cityes))");
						
						return 1; //1; // cmd_stats(playerid);
					}


			    	if(response)
			    	{
			    		SendClientMessage(playerid, COLOR_WHITE, "You have to input your bid to a auction.");
						// this is how change variabel string to valuable integer variabel.
						CountDownAuction = CountDownAuction+15;
					      PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
					      BidPrice = strval(inputtext);
			      
			      
			     
						//extract inputtext[20] -> new BidPrice;
						//BidPrice = BidPrice;
						SendClientMessage(playerid, -1, inputtext);
						format(string, sizeof(string), ""COL_WHITE"'%s'\nare Bid new Price \nfor"COL_BLUE"$ %d ", GetRPName(playerid), BidPrice);
						SendClientMessage(playerid, -1, string);
						UpdateDynamic3DTextLabelText(TempatDisplayIklan, COLOR_AQUAGREEN, string);
			      SetDynamicObjectMaterialText(layariklanbadara, 0, string, OBJECT_MATERIAL_SIZE_512x512, "Tahoma", 30, 1, COLOR_GREEN, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_RIGHT);
			      SetDynamicObjectMaterialText(AuctionMartChartBoard, 0, string,  130, "Arial", 40, 1, -1250582, 0, 1);
			                                                                                  // 40 is size of text form id acution mart board
			      
						
						SetPlayerArmedWeapon(playerid, 0);
						ApplyAnimation(playerid, "CARRY", "crry_prtial", 2.0, 0, 0, 0, 1, 1);

						if(pData[playerid][pMoney] < 2000)
						{
							SendClientMessage(playerid, COLOR_LIGHTRED, "AUCTION: You are need more money for joining this auction system, please make a profit able job");
							ApplyAnimation(playerid, "GANGS", "Invite_Yes", 2.0, 0, 0, 0, 1, 1);
							return 1;
						}
						format(string, sizeof(string), "* "COL_LGREEN"%s *\n "COL_WHITE"Bid for "COL_LIME"$%d \n"COL_WHITE"on top chart value\nitem has "COL_LGREEN"%s's", GetRPName(playerid), BidPrice, Itemofferings);
						SendClientMessage(playerid, -1, string);
			      PlayerPlaySound(playerid, 1085, 0.0, 0.0, 0.0);
						SendClientMessage(playerid, COLOR_WHITE, "AUCTION: Thank you for paid bidder cost is $200");
			      ResetPlayerMoney(playerid);
			      GivePlayerMoney(playerid, pData[playerid][pMoney]);
						GivePlayerMoney(playerid, -200);
						pData[playerid][pMoney] = pData[playerid][pMoney]-200;
						if(BidPrice > HighestBidder)
						{
							HighestBidder = BidPrice;
							//GetPlayerName(playerid, WinnerOfAuction, 50);
							strunpack(WinnerOfAuction, GetRPName(playerid), 50);
							SendClientMessage(playerid, -1, WinnerOfAuction);
							SendClientMessage(playerid, -1, "AUCTION: Behavior name winner was reveal");
							GivePlayerMoney(playerid, -BidPrice);
							pData[playerid][pMoney] = pData[playerid][pMoney]-BidPrice;
							SendClientMessage(playerid, COLOR_LGREEN, "AUCTION: You are get top chart on this auction, Congratulation.");
							GameTextForPlayer(playerid, "~g~You are get top chart auction", 2000, 3);
			        UpdateDynamic3DTextLabelText(TempatDisplayIklan, COLOR_AQUAGREEN, string);
			        SetDynamicObjectMaterialText(layariklanbadara, 0, string, OBJECT_MATERIAL_SIZE_512x512, "Tahoma", 30, 1, COLOR_GREEN, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_RIGHT);
			        SetDynamicObjectMaterialText(AuctionMartChartBoard, 0, string,  130, "Arial", 30, 1, -1250582, 0, 1);
			        PlayerPlaySound(playerid, 1100, 0.0, 0.0, 0.0);
							
						} 
						if(BidPrice < HighestBidder)
						{
							ApplyAnimation(playerid, "RIOT", "RIOT_shout", 2.0, 0, 0, 0, 1, 1);
							GameTextForPlayer(playerid, "~r~You are get losing on this auction, sorry sir.", 2000, 1);
							SendClientMessage(playerid, COLOR_LIGHTRED, "AUCTION: You are get losing on this auction, sorry sir.");
						} 

						return inputtext[0]= 0;
			    		
			    		
			    	}
	}

	if(dialogid == DIALOG_ACCEPT_AUCTION) //If Dialog auctiong data offering
    {
						new string[140];
				    	if(!response)
				    	{
							
							format(string, sizeof(string), "* %s stand up and thinking fo be a starter on trader", GetRPName(playerid));
							LocalMessage(ACTION_DISTANCE, playerid, ACTION_COLOR, string);
							LocalMessage(ACTION_DISTANCE, playerid, ACTION_COLOR, "* The stock market has cancel.((Staff of Cityes))");
							
							return 1; // cmd_stats(playerid);
						}


				    	if(response)
				    	{
				    		SendClientMessage(playerid, COLOR_WHITE, "You have thinking to start a auction.");
											if(pData[playerid][JoinedAuction] == 0)
											      {
											        CountOfParticipants = CountOfParticipants+1;
											        format(string, sizeof(string), "* "COL_WHITE"%s *\n new joined auction \nfor price"COL_BLUE"$ %d ", GetRPName(playerid), BidPrice);
											        
											        SendClientMessageToAll( -1, string);
											        pData[playerid][JoinedAuction] = 1;
											      }
											if(AuctionRunning == 0)
											{
										        //strunpack(WinnerOfAuction, "TANPA PEMENANG", 20);
										        strunpack(WinnerOfAuction, GetRPName(playerid), 20);
										        CountDownAuction = 30;

														//TimerLimitForAuction = SetTimer("AuctionWasEnded", 10000, false);
														format(string, sizeof(string), ""COL_LRED"* Wellcome "COL_LGREEN"%s *\nstarting the auction offering \nfor item: "COL_WHITE"%s,\n"COL_LRED"on this auction. Countdown:%d ", GetRPName(playerid), Itemofferings, CountDownAuction);
														UpdateDynamic3DTextLabelText(TempatDisplayIklan, COLOR_AQUAGREEN, string);
										        SetDynamicObjectMaterialText(layariklanbadara, 0, string, OBJECT_MATERIAL_SIZE_512x512, "Tahoma", 30, 1, COLOR_GREEN, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_RIGHT);
										        SetDynamicObjectMaterialText(AuctionMartChartBoard, 0, string,  130, "Arial", 30, 1, -1250582, 0, 1);
										        SendClientMessage(playerid, COLOR_WHITE, string);
										        PlayerPlaySound(playerid, 1100, 0.0, 0.0, 0.0);
														SendClientMessage(playerid, COLOR_WHITE, "You have succes running a Auction");
														AuctionRunning = 1;
														return 1;
											}
											else
											{
												SendClientMessage(playerid, COLOR_WHITE, "* Auction was running please wait until the auction done.");
												KillTimer(TimerLimitForAuction);
												SendClientMessage(playerid, COLOR_WHITE, "* Auction was stopped sir.");
										        AuctionRunning = 0;
										        HighestBidder = 0;
										        CountDownAuction = 0;
										       
										        pData[playerid][JoinedAuction] = 0;
														return 1;
							}
				    		
				    		
				    	}
	}




	if(dialogid == DIALOG_INPUT_offerINGAUCTION) //If Dialog auctiong data offering
    {
						new string[140];
				    	if(!response)
				    	{
							
							format(string, sizeof(string), "* %s stand up and thinking fo be a trader", GetRPName(playerid));
							LocalMessage(ACTION_DISTANCE, playerid, ACTION_COLOR, string);
							LocalMessage(ACTION_DISTANCE, playerid, ACTION_COLOR, "* The stock market has slain.((Staff of Cityes))");
							
							return 1; // cmd_stats(playerid);
						}


				    	if(response)
				    	{
				    	SendClientMessage(playerid, COLOR_WHITE, "* Auction is try offering....");
							//GetSVarString(Itemofferings, inputtext, 50);
				      //SetSVarString(Itemofferings, inputtext);
				      //strpack(Itemofferings, inputtext, 50);
				      strunpack(Itemofferings, inputtext, 50);
				      //strcat(Itemofferings,inputtext, 50);
							//Itemofferings[49] = inputtext[50];

							format(string, sizeof(string), "* "COL_BLUE"UPDATED *\n"COL_GREEN"%s "COL_WHITE"succes offering\n for item:"COL_RED" %s"COL_WHITE", on this auction.", GetRPName(playerid), Itemofferings);
							SendClientMessage(playerid, -1, string);
				    	UpdateDynamic3DTextLabelText(TempatDisplayIklan, COLOR_AQUAGREEN, string);
				      SetDynamicObjectMaterialText(layariklanbadara, 0, string, OBJECT_MATERIAL_SIZE_512x512, "Tahoma", 30, 1, COLOR_GREEN, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_RIGHT);
				      SetDynamicObjectMaterialText(AuctionMartChartBoard, 0, string,  130, "Arial", 30, 1, -1250582, 0, 1);
				      PlayerPlaySound(playerid, 1100, 0.0, 0.0, 0.0);
				      return 1;
				    		
				    	}
	}







public AuctionWasEnded(playerid)
{
			  //GameTextForPlayer(playerid, "Auction Done\nChoice your offer and start it", 1000, 5);
			  SendClientMessage(playerid, -1, "AUCTION: Auction command to end has called.");

			  
			  //KillTimer(TimerLimitForAuction);
			  AuctionRunning = 0;
			  CountDownAuction = 0;
			  
			  pData[playerid][JoinedAuction] = 0;
			  new string[250];
			  
			  if(BidPrice > 1)
			  {
			    format(string, sizeof(string), ""COL_BLUE"'%s'\n"COL_WHITE"THE WINNER\nwith auction item:\na "COL_LGREEN"$%i of "COL_BLUE"%s's", WinnerOfAuction, BidPrice, Itemofferings);
			    SendClientMessage(playerid, -1, string);
			    SendClientMessage(playerid, -1, "AUCTION: Auction Time Up, you are left from this section");
			    if(!strcmp(WinnerOfAuction, GetRPName(playerid), true, 10))
			    {
			      ResetPlayerMoney(playerid);
			      GivePlayerMoney(playerid, pData[playerid][pMoney]);
			      GivePlayerMoney(playerid, - HighestBidder);
			      pData[playerid][pMoney] = pData[playerid][pMoney]- HighestBidder;
			      SendClientMessage(playerid, -1, "AUCTION: Money Highest Bidder taken.");
			    }
			  }
			  else
			  {
			    format(string, sizeof(string), ""COL_RED"**FAILED**"COL_WHITE"\nSorry we canceled\nthe auction for \nitem:"COL_BLUE"%s", Itemofferings);
			    SendClientMessage(playerid, -1, string);
			    SendClientMessage(playerid, -1, "AUCTION: Auction Time Up, Please rejoin with "COL_YELLOW"'/auction bid'");
			    
			  }
			  BidPrice = 0;
			  HighestBidder = 0;
			  CountOfParticipants = 0;
			  strunpack(WinnerOfAuction, "TANPA PEMENANG", 20);
			  UpdateDynamic3DTextLabelText(TempatDisplayIklan, COLOR_AQUAGREEN, string);
			  //SetDynamicObjectMaterialText(layariklanbadara, 0, string, OBJECT_MATERIAL_SIZE_512x512, "Tahoma", 30, 1, COLOR_GREEN, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_RIGHT);
			  SetDynamicObjectMaterialText(layariklanbadara, 0, string, OBJECT_MATERIAL_SIZE_512x512, "Tahoma", 45, 1, -1250582, 0, OBJECT_MATERIAL_TEXT_ALIGN_LEFT);
			  
			  SetDynamicObjectMaterialText(AuctionMartChartBoard, 0, string, 130, "Arial", 40, 1, 0x208000FF, 0, 1);
			  PlayerPlaySound(playerid, 1100, 0.0, 0.0, 0.0);
			  pData[playerid][JoinedAuction] = 0;

			  return 1;

}



public ChangeServerEverySecond(playerid, closestcar)
{
 
			if(AuctionRunning == true)
	         	 {
				            if(CountDownAuction <= 0)
				            {
				              AuctionWasEnded(playerid);
				            }
			    


					    if(pData[playerid][JoinedAuction] == 1)
					    {
					    	new string[300];
					    	/*
					      SendClientMessage(playerid, COLOR_WHITE, "INFO: Auction has running");
					      
					      SendClientMessage(playerid, COLOR_WHITE, "INFO: you are was joinned the auction");
					      */
					      CountDownAuction--;
					      
					      //CountDownAuction = CountDownAuction - 1;
					      if(!strcmp(WinnerOfAuction, "TANPA PEMENANG", true, 20))
					      {
					        format(string, sizeof(string), ""COL_RED"WARNING IN: %d\n"COL_LRED2" ***%s***\n"COL_WHITE"Penawaran tertinggi hanya\nsampai seharga:\na "COL_LGREEN"$%i "COL_BLUE"%s's\n%d Participants", CountDownAuction, WinnerOfAuction, BidPrice, Itemofferings, CountOfParticipants);
					      
					      }
					      else
					      {
					        format(string, sizeof(string), "Countdown"COL_RED": %d\n"COL_BLUE" ***%s***\n"COL_WHITE"Menawar paling tinggi\ndengan seharga:\na "COL_LGREEN"$%i untuk aset "COL_BLUE"%s's\n%d Participants", CountDownAuction, WinnerOfAuction, BidPrice, Itemofferings, CountOfParticipants);
					      }
					      

					      UpdateDynamic3DTextLabelText(TempatDisplayIklan, COLOR_AQUAGREEN, string);
					      //SetDynamicObjectMaterialText(layariklanbadara, 0, string, OBJECT_MATERIAL_SIZE_512x512, "Tahoma", 30, 1, COLOR_GREEN, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_RIGHT);
					      SetDynamicObjectMaterialText(layariklanbadara, 0, string, OBJECT_MATERIAL_SIZE_512x512, "Tahoma", 45, 1, -1250582, 0, OBJECT_MATERIAL_TEXT_ALIGN_LEFT);
					      
					      SetDynamicObjectMaterialText(AuctionMartChartBoard, 0, string, 130, "Arial", 40, 1, -1250582, 0, 1);
					      //GameTextForPlayer(playerid, "Auction has available now", 500, 5);
					      //SendClientMessage(playerid, -1, "AUCTION: "COL_YELLOW"'/auction bid' "COL_WHITE" will cost for "COL_LGREEN"$200 per your bid sir, "COL_WHITE"Just try your price"COL_RED" is fast");
					      
					    }
					    else
					    {
					      //SendClientMessage(playerid, COLOR_WHITE, "INFO: you are not joinned the auction");
					    }
					    

		  }       

}


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

