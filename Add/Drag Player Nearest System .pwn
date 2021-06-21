new	DragOffer[MAX_PLAYERS];


#if !defined ReturnUser
stock ReturnUser(text[])
{
	new pos = 0;
	while (text[pos] < 0x21)
	{
		if(text[pos] == 0) return INVALID_PLAYER_ID;
		pos++;
	}
	new userid = INVALID_PLAYER_ID;
	if(isNumeric(text[pos]))
	{
		userid = strval(text[pos]);
		if(userid >=0 && userid < MAX_PLAYERS)
		{
			if(!IsPlayerConnected(userid))
				userid = INVALID_PLAYER_ID;
			else return userid;
		}
	}
	new len = strlen(text[pos]);
	new count = 0;
	new pname[MAX_PLAYER_NAME];
	for (new i = 0; i < MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
  		{
			GetPlayerName(i, pname, sizeof (pname));
			if(strcmp(pname, text[pos], true, len) == 0)
			{
				if(len == strlen(pname)) return i;
				else
				{
					count++;
					userid = i;
				}
			}
		}
	}
	if(count != 1)
	{
		userid = INVALID_PLAYER_ID;
	}
	return userid;
}
#endif

dcmd_stopdrag(playerid, params[])
{
	#pragma unused params
	new string[73];
	for( new i = 0; i < MAX_PLAYERS; i++ )
	{
	    if(IsPlayerConnected( i ) && PlayerInfo[i][BeingDraggedBy] == playerid)
	    {
			format( string, sizeof( string ), "You have stopped dragging %s.", PlayerName(playerid) );
 			SendClientMessage( playerid, COLOR_LIGHTBLUE, string);
 			SendClientMessage( playerid, COLOR_LIGHTBLUE, "You have been release.");
	        PlayerInfo[i][BeingDraggedBy] = -1;
	        ClearAnimations(playerid);
		}
	}
	return 1;
}




public ProxDetectorS(Float:radi, playerid, targetid)
{
    if(IsPlayerConnected(playerid)&&IsPlayerConnected(targetid))
	{
		new Float:posx, Float:posy, Float:posz;
		new Float:oldposx, Float:oldposy, Float:oldposz;
		new Float:tempposx, Float:tempposy, Float:tempposz;
		GetPlayerPos(playerid, oldposx, oldposy, oldposz);
		GetPlayerPos(targetid, posx, posy, posz);
		tempposx = (oldposx -posx);
		tempposy = (oldposy -posy);
		tempposz = (oldposz -posz);
		if(((tempposx < radi) && (tempposx > -radi)) && ((tempposy < radi) && (tempposy > -radi)) && ((tempposz < radi) && (tempposz > -radi)))
		{
			return 1;
		}
	}
	return 0;
}



	if(strcmp(cmd,"/cancel",true)==0)
    {
        if(IsPlayerConnected(playerid))
	    {
			new x_job[128];
			x_job = strtok(cmdtext, idx);
			if(!strlen(x_job)) {
				SendClientMessage(playerid, COLOR_WHITE, "USAGE: /cancel [name]");
				SendClientMessage(playerid, COLOR_GRAD1, "Available names: Sex, Pot, Crack, Lawyer, Defense, Bodyguard, Live, Boxing");
				SendClientMessage(playerid, COLOR_GRAD2, "Available names: Taxi, Bus, Medic, Mechanic, Ticket, Handshake, Witness, Marriage, Divorce");
				SendClientMessage(playerid, COLOR_GRAD2, "Available names: Family, Faction, Contract, Drag");
				return 1;
			}
			if(strcmp(x_job,"sex",true) == 0) {	SexOffer[playerid] = 999; SexPrice[playerid] = 0; }
			else if(strcmp(x_job,"pot",true) == 0) { PotOffer[playerid] = 999; PotPrice[playerid] = 0; PotGram[playerid] = 0; }
			else if(strcmp(x_job,"crack",true) == 0) { CrackOffer[playerid] = 999; CrackPrice[playerid] = 0; CrackGram[playerid] = 0; }
			else if(strcmp(x_job,"lawyer",true) == 0) { WantLawyer[playerid] = 0; CallLawyer[playerid] = 0; }
			else if(strcmp(x_job,"defense",true) == 0) { DefenseOffer[playerid] = 999; DefensePrice[playerid] = 0; }
			else if(strcmp(x_job,"bodyguard",true) == 0) { GuardOffer[playerid] = 999; GuardPrice[playerid] = 0; }
			else if(strcmp(x_job,"live",true) == 0) { LiveOffer[playerid] = 999; }
			else if(strcmp(x_job,"boxing",true) == 0) { BoxOffer[playerid] = 999; }
			else if(strcmp(x_job,"witness",true) == 0) { MarryWitnessOffer[playerid] = 999; }
			else if(strcmp(x_job,"marriage",true) == 0) { ProposeOffer[playerid] = 999; }
			else if(strcmp(x_job,"divorce",true) == 0) { DivorceOffer[playerid] = 999; }
			else if(strcmp(x_job,"family",true) == 0) { FamilyOffer[playerid] = 999; }
			else if(strcmp(x_job,"faction",true) == 0) { FactionOffer[playerid] = 999; }
			else if(strcmp(x_job,"drag",true) == 0) { DragOffer[playerid] = 999; }
			else if(strcmp(x_job,"handshake",true) == 0) { HandshakeOffer[playerid] = 999; HandshakeType[playerid] = 0; }
			else if(strcmp(x_job,"House",true) == 0) { HouseID[playerid] = 0; HouseOffer[playerid] = 999; HousePrice[playerid] = 0; }
			else if(strcmp(x_job,"contract",true) == 0) { ContractOffer[playerid] = 999; ContractID[playerid] = 999; GoChase[playerid] = 999; }
			else if(strcmp(x_job,"medic",true) == 0) { if(IsPlayerConnected(MedicCall)) { if(MedicCall == playerid) { MedicCall = 999; } else { SendClientMessage(playerid, COLOR_GREY, "   You are not the current Caller !"); return 1; } } }
			else if(strcmp(x_job,"mechanic",true) == 0) { if(IsPlayerConnected(MechanicCall)) { if(MechanicCall == playerid) { MechanicCall = 999; } else { SendClientMessage(playerid, COLOR_GREY, "   You are not the current Caller !"); return 1; } } }
			else if(strcmp(x_job,"bill",true) == 0) { BillOffer[playerid] = 999; BillPrice[playerid] = 0; }
			else if(strcmp(x_job,"taxi",true) == 0)
			{
			    if(TaxiCall < 999)
			    {
			        if(TransportDuty[playerid] == 1 && TaxiCallTime[playerid] > 0)
			        {
			            TaxiAccepted[playerid] = 999;
						GameTextForPlayer(playerid, "~w~You have~n~~r~Canceled the call", 5000, 1);
						TaxiCallTime[playerid] = 0;
						DisablePlayerCheckpoint(playerid);
						TaxiCall = 999;
			        }
			        else
			        {
						if(IsPlayerConnected(TaxiCall)) { if(TaxiCall == playerid) { TaxiCall = 999; } }
						//foreach(Player, i)
                        for(new i; i<MAX_PLAYERS; i++)
						{
						    if(IsPlayerConnected(i))
						    {
						        if(TaxiAccepted[i] < 999)
						        {
							        if(TaxiAccepted[i] == playerid)
							        {
							            TaxiAccepted[i] = 999;
							            GameTextForPlayer(i, "~w~Taxi Caller~n~~r~Canceled the call", 5000, 1);
							            TaxiCallTime[i] = 0;
							            DisablePlayerCheckpoint(i);
							        }
						        }
						    }
						}
					}
				}
			}


	if(strcmp(cmd,"/accept",true)==0)
    {
        if(IsPlayerConnected(playerid))
	    {
			new x_job[128];
			x_job = strtok(cmdtext, idx);
			if(!strlen(x_job)) {
				SendClientMessage(playerid, COLOR_WHITE, "USAGE: /accept [name]");
				SendClientMessage(playerid, COLOR_GRAD1, "Available: Death, Sex, Pot, Crack, Lawyer, Defense, Vest, Job, Live, Vehicle, Divorce");
				SendClientMessage(playerid, COLOR_GRAD2, "Available: Taxi, Bus, Boxing, Medic, Mechanic, Ticket, Faction, Frisk, business, house, Inspect");
				return 1;
			}
			else if(strcmp(x_job,"frisk",true) == 0)
			{
			    if(FriskOffer[playerid] < 999)
			    {
			        if(IsPlayerConnected(FriskOffer[playerid]))
			        {
			            if(ProxDetectorS(10.0, playerid, FriskOffer[playerid]))
						{
						    GetPlayerName(FriskOffer[playerid], giveplayer, sizeof(giveplayer));
							GetPlayerName(playerid, sendername, sizeof(sendername));
							format(string, sizeof(string), "* You have accepted %s's request to frisk you", giveplayer);
							SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
							format(string, sizeof(string), "* %s has accepted your request to frisk them", sendername);
							SendClientMessage(FriskOffer[playerid], COLOR_LIGHTBLUE, string);
							new WeaponName[65];
							SendClientMessage(FriskOffer[playerid], COLOR_GREEN,"__________*** Items ***__________");
							if(PlayerInfo[playerid][pCash] > 0) { format(string, sizeof(string), "Money: %d", PlayerInfo[playerid][pCash]); SendClientMessage(FriskOffer[playerid], COLOR_GRAD3, string); }
							if(PlayerInfo[playerid][pCompo] > 0) { format(string, sizeof(string), "Components: %d", PlayerInfo[playerid][pCompo]); SendClientMessage(FriskOffer[playerid], COLOR_GRAD3, string); }
							if(PlayerInfo[playerid][pPot] > 0) { format(string, sizeof(string), "Pot: %d", PlayerInfo[playerid][pPot]); SendClientMessage(FriskOffer[playerid], COLOR_BITEM, string); }
						    if(PlayerInfo[playerid][pCrack] > 0) { format(string, sizeof(string), "Crack: %d", PlayerInfo[playerid][pCrack]); SendClientMessage(FriskOffer[playerid], COLOR_BITEM, string); }
						    if(PlayerInfo[playerid][pMats] > 0) { format(string, sizeof(string), "Gun Parts: %d", PlayerInfo[playerid][pMats]); SendClientMessage(FriskOffer[playerid], COLOR_BITEM, string); }
						    if(PlayerInfo[playerid][pPainkiller] > 0) { format(string, sizeof(string), "Painkiller: %d", PlayerInfo[playerid][pPainkiller]); SendClientMessage(FriskOffer[playerid], COLOR_GRAD3, string); }
						    if(Packages[playerid] > 0) { SendClientMessage(FriskOffer[playerid], COLOR_BITEM, "Gun/Drug Packages"); }
						    if(Compocrate[playerid] > 0) { SendClientMessage(FriskOffer[playerid], COLOR_GRAD3, "Component Crates"); }
						    if(Prodcrate[playerid] > 0) { SendClientMessage(FriskOffer[playerid], COLOR_GRAD3, "Product Crates"); }
						    if(Fishes[playerid][pWeight1] > 0 || Fishes[playerid][pWeight2] > 0 || Fishes[playerid][pWeight3] > 0 || Fishes[playerid][pWeight4] > 0 || Fishes[playerid][pWeight5] > 0) { SendClientMessage(playerid, COLOR_GRAD3, "Fish"); }
						    if(PlayerInfo[playerid][pCDPlayer] > 0) { SendClientMessage(FriskOffer[playerid], COLOR_GRAD3, "CD Player"); }
						    if(PlayerInfo[playerid][pPnumber] > 0) { SendClientMessage(FriskOffer[playerid], COLOR_GRAD3, "Cellphone"); }
						    if(PlayerInfo[playerid][pScrew] > 0) { SendClientMessage(FriskOffer[playerid], COLOR_GRAD3, "Screwdriver"); }
						    if(PlayerInfo[playerid][pDice] > 0) { SendClientMessage(FriskOffer[playerid], COLOR_GRAD3, "Dice"); }
						    if(PlayerInfo[playerid][pFishBait] > 0) { format(string, sizeof(string), "Bait: %d", PlayerInfo[playerid][pFishBait]); SendClientMessage(FriskOffer[playerid], COLOR_GRAD3, string); }
						    if(PlayerInfo[playerid][pRope] > 0) { format(string, sizeof(string), "Rope: %d", PlayerInfo[playerid][pRope]); SendClientMessage(FriskOffer[playerid], COLOR_GRAD3, string); }
						    if(PlayerInfo[playerid][pSnack] > 0) { format(string, sizeof(string), "Snack: %d", PlayerInfo[playerid][pSnack]); SendClientMessage(FriskOffer[playerid], COLOR_GRAD3, string); }
						    if(PlayerInfo[playerid][pBandage] > 0) { format(string, sizeof(string), "Bandage: %d", PlayerInfo[playerid][pBandage]); SendClientMessage(FriskOffer[playerid], COLOR_GRAD3, string); }
						    if(PlayerInfo[playerid][pBombs] > 0) { SendClientMessage(FriskOffer[playerid], COLOR_GRAD3, "C4 Explosives"); }
						    if(PlayerInfo[playerid][pScope] > 0) { SendClientMessage(FriskOffer[playerid], COLOR_GRAD3, "Sniper Scope"); }
						    if(PlayerInfo[playerid][pBlindfolds] > 0) { format(string, sizeof(string), "Blindfold: %d", PlayerInfo[playerid][pBlindfolds]); SendClientMessage(FriskOffer[playerid], COLOR_GRAD3, string); }
						    if(PlayerInfo[playerid][pGun0] != 0) { GetWeaponName(PlayerInfo[playerid][pGun0], WeaponName, 64); format(string, sizeof(string), "%s", WeaponName); SendClientMessage(FriskOffer[playerid], COLOR_BITEM, string); }
						    if(PlayerInfo[playerid][pGun1] != 0) { GetWeaponName(PlayerInfo[playerid][pGun1], WeaponName, 64); format(string, sizeof(string), "%s", WeaponName); SendClientMessage(FriskOffer[playerid], COLOR_BITEM, string); }
						    if(PlayerInfo[playerid][pGun2] != 0) { GetWeaponName(PlayerInfo[playerid][pGun2], WeaponName, 64); format(string, sizeof(string), "%s", WeaponName); SendClientMessage(FriskOffer[playerid], COLOR_BITEM, string); }
						    if(PlayerInfo[playerid][pGun3] != 0) { GetWeaponName(PlayerInfo[playerid][pGun3], WeaponName, 64); format(string, sizeof(string), "%s", WeaponName); SendClientMessage(FriskOffer[playerid], COLOR_BITEM, string); }
						    if(PlayerInfo[playerid][pGun4] != 0) { GetWeaponName(PlayerInfo[playerid][pGun4], WeaponName, 64); format(string, sizeof(string), "%s", WeaponName); SendClientMessage(FriskOffer[playerid], COLOR_BITEM, string); }
						    if(PlayerInfo[playerid][pGun5] != 0) { GetWeaponName(PlayerInfo[playerid][pGun5], WeaponName, 64); format(string, sizeof(string), "%s", WeaponName); SendClientMessage(FriskOffer[playerid], COLOR_BITEM, string); }
						    if(PlayerInfo[playerid][pGun6] != 0) { GetWeaponName(PlayerInfo[playerid][pGun6], WeaponName, 64); format(string, sizeof(string), "%s", WeaponName); SendClientMessage(FriskOffer[playerid], COLOR_BITEM, string); }
						    if(PlayerInfo[playerid][pGun7] != 0) { GetWeaponName(PlayerInfo[playerid][pGun7], WeaponName, 64); format(string, sizeof(string), "%s", WeaponName); SendClientMessage(FriskOffer[playerid], COLOR_BITEM, string); }
						    if(PlayerInfo[playerid][pGun8] != 0) { GetWeaponName(PlayerInfo[playerid][pGun8], WeaponName, 64); format(string, sizeof(string), "%s", WeaponName); SendClientMessage(FriskOffer[playerid], COLOR_BITEM, string); }
						    if(PlayerInfo[playerid][pGun9] != 0) { GetWeaponName(PlayerInfo[playerid][pGun9], WeaponName, 64); format(string, sizeof(string), "%s", WeaponName); SendClientMessage(FriskOffer[playerid], COLOR_BITEM, string); }
						    if(PlayerInfo[playerid][pGun10] != 0) { GetWeaponName(PlayerInfo[playerid][pGun10], WeaponName, 64); format(string, sizeof(string), "%s", WeaponName); SendClientMessage(FriskOffer[playerid], COLOR_BITEM, string); }
							if(PlayerInfo[playerid][pGun11] == 44) { SendClientMessage(FriskOffer[playerid], COLOR_GRAD3, "Nightvision Goggles"); }
							if(PlayerInfo[playerid][pGun11] == 45) { SendClientMessage(FriskOffer[playerid], COLOR_GRAD3, "Infared Goggles"); }
							if(PlayerInfo[playerid][pGun12] != 0) { GetWeaponName(PlayerInfo[playerid][pGun12], WeaponName, 64); format(string, sizeof(string), "%s", WeaponName); SendClientMessage(FriskOffer[playerid], COLOR_BITEM, string); }
						    for (new weap = 1; weap < 47; weap++)
					        {
					            if(HaveAdminWeapon(giveplayerid, weap) == weap)
					            {
					                GetWeaponName(weap, WeaponName, 64);
								    format(string, sizeof(string), "Admin Weapon %s", WeaponName);
						            SendClientMessage(FriskOffer[playerid], COLOR_WHITE, string);
					            }
					        }
						    SendClientMessage(FriskOffer[playerid], COLOR_GREEN,"_________________________________");
							format(string, sizeof(string), "* %s has frisked %s for any items.", RPN(FriskOffer[playerid]), RPN(playerid));
							ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
                            FriskOffer[playerid] = 999;
							return 1;
						}
						else
						{
						    SendClientMessage(playerid, COLOR_GREY, "   The frisk offerer is not near you !");
						    return 1;
						}
			        }
				}
				else
				{
				    SendClientMessage(playerid, COLOR_GREY, "   Nobody sent you a frisk offer !");
				    return 1;
				}
			}
			else if(strcmp(x_job,"bill",true) == 0)
			{
			    if(BillOffer[playerid] < 999)
			    {
			        if(IsPlayerConnected(BillOffer[playerid]))
			        {
			            if(ProxDetectorS(10.0, playerid, BillOffer[playerid]))
						{
						    GetPlayerName(BillOffer[playerid], giveplayer, sizeof(giveplayer));
							GetPlayerName(playerid, sendername, sizeof(sendername));
							format(string, sizeof(string), "* You have paid your Bill to %s for %d", giveplayer, BillPrice[playerid]);
							SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
							format(string, sizeof(string), "* %s has paid your Bill of %d", sendername, BillPrice[playerid]);
							SendClientMessage(BillOffer[playerid], COLOR_LIGHTBLUE, string);
							PlayerInfo[playerid][pCash] -= BillPrice[playerid];
							BillOffer[playerid] = 999;
							BillPrice[playerid] = 0;
                        }
			        }
				}
				else
				{
				    SendClientMessage(playerid, COLOR_GREY, "   Nobody sent you a Bill offer !");
				    return 1;
				}
			}
			else if(strcmp(x_job,"inspect",true) == 0)
			{
			    if(InspectOffer[playerid] < 999)
			    {
			        if(IsPlayerConnected(InspectOffer[playerid]))
			        {
			            if(ProxDetectorS(10.0, playerid, InspectOffer[playerid]))
						{
						    GetPlayerName(InspectOffer[playerid], giveplayer, sizeof(giveplayer));
							GetPlayerName(playerid, sendername, sizeof(sendername));
							format(string, sizeof(string), "* You have accepted %s's request to inspect you", giveplayer);
							SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
							format(string, sizeof(string), "* %s has accepted your request to inspect them", sendername);
							SendClientMessage(InspectOffer[playerid], COLOR_LIGHTBLUE, string);
							new bodystring[1024];
							for (new i = 0; i < 19; i++)
						    {
                                new bodyname[32];
								if(i == 1) { bodyname = "Left Thigh"; }
								else if(i == 2) { bodyname = "Right Thigh"; }
								else if(i == 3) { bodyname = "Left Upper Arm"; }
								else if(i == 4) { bodyname = "Right Upper Arm"; }
								else if(i == 5) { bodyname = "Left Hand"; }
								else if(i == 6) { bodyname = "Right Hand"; }
								else if(i == 7) { bodyname = "Spine"; }
								else if(i == 8) { bodyname = "Jaw"; }
								else if(i == 9) { bodyname = "Neck"; }
								else if(i == 10) { bodyname = "Head"; }
								else if(i == 11) { bodyname = "Right Calf"; }
								else if(i == 12) { bodyname = "Left Calf"; }
								else if(i == 13) { bodyname = "Left Forearm"; }
								else if(i == 14) { bodyname = "Right Forearm"; }
								else if(i == 15) { bodyname = "Left Clavicle"; }
								else if(i == 16) { bodyname = "Right Clavicle"; }
								else if(i == 17) { bodyname = "Right Foot"; }
								else if(i == 18) { bodyname = "Left Foot"; }
								else if(i == 0) { bodyname = "Unknown"; }
								new disease[64];
								if(pBody[playerid][i] == 0) { disease = "{00C0FF}Normal{FFFFFF}"; }
								else if(pBody[playerid][i] >= 1 && pBody[playerid][i] <= 2) { disease = "{F81414}Gunshot Wound {F3FF02}(Wounded){FFFFFF}"; }
								else if(pBody[playerid][i] >= 3 && pBody[playerid][i] <= 5) { disease = "{F81414}Gunshot Wound (1 Bullet)(Bleeding){FFFFFF}"; }
								else if(pBody[playerid][i] >= 6 && pBody[playerid][i] <= 9) { disease = "{F81414}Gunshot Wound (2 Bullet)(Bleeding){FFFFFF}"; }
								else if(pBody[playerid][i] >= 10 && pBody[playerid][i] <= 13) { disease = "{F81414}Gunshot Wound (3 Bullet)(Bleeding){FFFFFF}"; }
								else if(pBody[playerid][i] >= 14 && pBody[playerid][i] <= 15) { disease = "{F81414}Gunshot Wound (4 Bullet)(Bleeding){FFFFFF}"; }
								else if(pBody[playerid][i] == 16) { disease = "{F3FF02}Bruise{FFFFFF}"; }
								else if(pBody[playerid][i] == 17) { disease = "{F81414}Cut (Bleeding){FFFFFF}"; }
				                format(bodystring, sizeof(bodystring), "{FFFFFF}%s%s:  %s\n", bodystring, bodyname, disease);
						    }
				            ShowPlayerDialog(InspectOffer[playerid], 84, DIALOG_STYLE_MSGBOX, "Bodyparts", bodystring, "Oke", "Cancel");
							format(string, sizeof(string), "* %s has inspect %s for any disease.", RPN(InspectOffer[playerid]), RPN(playerid));
							ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
							if(IsAMedic(InspectOffer[playerid]))
							{
								if(PlayerInfo[playerid][pSache] == 1)
								{
								    SendClientMessage(InspectOffer[playerid], COLOR_DOC, "[INSPECT INFO] Pasien mengalami Sakit Perut dan Dehidrasi");
								}
								else if(PlayerInfo[playerid][pSache] == 0)
								{
								    SendClientMessage(InspectOffer[playerid], COLOR_DOC, "[INSPECT INFO] Pasien tidak mengalami sakit apapun");
								}
							}
							if(PlayerInfo[playerid][pBandageEffect] > 0) SendClientMessage(InspectOffer[playerid], COLOR_DOC, "[INSPECT INFO] Terdapat Perban yang terbalut pada tubuh nya.");
                            InspectOffer[playerid] = 999;
							return 1;
						}
						else
						{
						    SendClientMessage(playerid, COLOR_GREY, "   The inspect offerer is not near you !");
						    return 1;
						}
			        }
				}
				else
				{
				    SendClientMessage(playerid, COLOR_GREY, "   Nobody sent you a inspect offer !");
				    return 1;
				}
			}
			else if(strcmp(x_job,"drag",true) == 0)
			{
			    if(DragOffer[playerid] < 999)
			    {
			        if(IsPlayerConnected(DragOffer[playerid]))
			        {
			            if(ProxDetectorS(10.0, playerid, DragOffer[playerid]))
						{
						    GetPlayerName(DragOffer[playerid], giveplayer, sizeof(giveplayer));
							GetPlayerName(playerid, sendername, sizeof(sendername));
							format(string, sizeof(string), "* You have accepted %s's request to Dragging you", giveplayer);
							SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
							format(string, sizeof(string), "* %s has accepted your request to Drag them", sendername);
							SendClientMessage(DragOffer[playerid], COLOR_LIGHTBLUE, string);
							PlayerInfo[playerid][BeingDraggedBy] = DragOffer[playerid];
							ApplyAnimation(DragOffer[playerid],"BOMBER","BOM_Plant",4.0,0,0,0,0,0,1);
                            DragOffer[playerid] = 999;
							return 1;
						}
						else
						{
						    SendClientMessage(playerid, COLOR_GREY, "   The Drag offerer is not near you !");
						    return 1;
						}
			        }
				}
				else
				{
				    SendClientMessage(playerid, COLOR_GREY, "   Nobody sent you a Drag offer !");
				    return 1;
				}
			}
			else if(strcmp(x_job,"family",true) == 0)
			{
			    if(FamilyOffer[playerid] < 999)
			    {
			        if(IsPlayerConnected(FamilyOffer[playerid]))
			        {
			            if(PlayerInfo[FamilyOffer[playerid]][pFMember] != 255)
			            {
			                if(PlayerInfo[playerid][pMember] != 0 || PlayerInfo[playerid][pLeader] != 0 || PlayerInfo[playerid][pFMember] != 255)
			                {
			                    SendClientMessage(playerid, COLOR_GREY, "   You are already in a Faction !");
						        return 1;
			                }
			            	new family = PlayerInfo[FamilyOffer[playerid]][pFMember];
			            	GetPlayerName(playerid, sendername, sizeof(sendername));
							GetPlayerName(FamilyOffer[playerid], giveplayer, sizeof(giveplayer));
							format(string, sizeof(string), "* You have accepted %s's request to join %s, you are now a Member of it.", giveplayer, FamilyInfo[family][FamilyName]);
							SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
							format(string, sizeof(string), "* %s has accepted your request and is now a Member of your Family.", sendername);
							SendClientMessage(FamilyOffer[playerid], COLOR_LIGHTBLUE, string);
							PlayerInfo[playerid][pFMember] = family;
							PlayerInfo[playerid][pRank] = 1;
							FamilyOffer[playerid] = 999;
							FamilyInfo[family][FamilyMembers] ++;
							SaveFamilies();
							return 1;
						}
						else
						{
						    SendClientMessage(playerid, COLOR_GREY, "   The Player who invited you is no longer a Member of a Family !");
			    			return 1;
						}
			        }
				}
				else
				{
				    SendClientMessage(playerid, COLOR_GREY, "   Nobody sent you a Faction Invite !");
				    return 1;
				}
			}
			else if(strcmp(x_job,"faction",true) == 0)
			{
			    if(FactionOffer[playerid] < 999)
			    {
			        if(IsPlayerConnected(FactionOffer[playerid]))
			        {
			            if(PlayerInfo[FactionOffer[playerid]][pLeader] != 0)
			            {
			                if(PlayerInfo[playerid][pMember] != 0 || PlayerInfo[playerid][pLeader] != 0 || PlayerInfo[playerid][pFMember] != 255)
			                {
			                    SendClientMessage(playerid, COLOR_GREY, "   You are already in a Faction !");
						        return 1;
			                }
							new ftext[20];
							GetPlayerName(playerid, sendername, sizeof(sendername));
							GetPlayerName(FactionOffer[playerid], giveplayer, sizeof(giveplayer));
							new faction = PlayerInfo[FactionOffer[playerid]][pLeader];
							if(faction == 1) { ftext = "LSPD"; }
					        else if(faction == 2) { ftext = "FBI"; }
					        else if(faction == 3) { ftext = "SASD"; }
					        else if(faction == 4) { ftext = "EMS"; }
					        else if(faction == 5) { ftext = "DoC"; }
					        else if(faction == 6) { ftext = "Senate"; }
					        else if(faction == 7) { ftext = "SS"; }
					        else if(faction == 8) { ftext = "Hitman Agency"; }
					        else if(faction == 9) { ftext = "News Agency"; }
					        else if(faction == 10) { ftext = "Taxi Cab Company"; }
							format(string, sizeof(string), "* You have accepted %s's request to join the %s, you are now a Member of it.", giveplayer, ftext);
							SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
							format(string, sizeof(string), "* %s has accepted your request and is now a Member of the %s.", sendername, ftext);
							SendClientMessage(FactionOffer[playerid], COLOR_LIGHTBLUE, string);
							PlayerInfo[playerid][pMember] = PlayerInfo[FactionOffer[playerid]][pLeader];
							PlayerInfo[playerid][pRank] = 1;
							FactionOffer[playerid] = 999;
							PlayerInfo[playerid][pFcard] = 1;
							return 1;
						}
						else
						{
						    SendClientMessage(playerid, COLOR_GREY, "   The Player who invited you is no longer a Faction Leader !");
			    			return 1;
						}
			        }
				}
				else
				{
				    SendClientMessage(playerid, COLOR_GREY, "   Nobody sent you a Faction Invite !");
				    return 1;
				}
			}
            else if(strcmp(x_job,"death",true) == 0)
            {
                if(IsPlayerConnected(playerid))
            	{
                    if(DeathTimer[playerid]) return SendClientMessage(playerid,COLOR_GREY,"   You must wait for 5 minutes to /accept death !");
                    if(PlayerInfo[playerid][pJailed] == 0)
            	    {
            	        if(PlayerInfo[playerid][pInjured] == 0)
            			{
	            		    SendClientMessage(playerid, COLOR_GREY,"[BODY] You are not Injured right now!");
	            			return 1;
	            		}
						for (new x = 0; x < 19; x++)
						{
		            		if(pBody[playerid][x] != 0 && pBody[playerid][x] < 16 || pBody[playerid][x] == 17)
		            		{
								SetPlayerPos(playerid, 1192.256836, -1304.637939, 7.0000);
			            		SetPlayerCameraPos(playerid, 1192.256836, -1304.637939, 20.699181);
			            		SetPlayerCameraLookAt(playerid, 1171.727905, -1328.805542, 14.894935);
		                		DeathTimer[playerid] = 0;
		                		if(UsingMask[playerid] == 1)
		                		{
                                    UsingMask[playerid] = 0;
			                		Delete3DTextLabel(CharText[playerid]);
				             		CharText[playerid] = Text3D:INVALID_3DTEXT_ID;
			                		for(new i=0; i<MAX_PLAYERS; i++)
						   			{
						   		    	if(IsPlayerConnected(i))
						   		    	{
								   			ShowPlayerNameTagForPlayer(i, playerid, true);
										}
									}
		                		}
		                		if(PlayerBlinded[playerid] > 0)
			             		{
			             		   PlayerBlinded[playerid] = 0;
			             		}
			            		if(PlayerHurt[playerid] > 0)
			            		{
			            		    PlayerHurt[playerid] = 0;
			             		}
								BodyParts(playerid);
		                		SetPlayerInterior(playerid, 0);
		                		SetPlayerVirtualWorld(playerid, 0);
		                		PlayerInfo[playerid][pEnergy] = 50;
								PlayerInfo[playerid][pOnDuty] = 0;
			                    PlayerInfo[playerid][pDutyTime] = 5;
			                    PlayerInfo[playerid][pBlindfolds] = 0;
			                    SetPlayerToTeamColor(playerid);
		                		ClearGuns(playerid);
		                		HospitalTime[playerid] = 49;
				            	HospitalSpawn[playerid] = 1;
				            	return 1;
			            	}
						}
						SetPlayerHealth(playerid, 20.0);
						PlayerInfo[playerid][pHealth] = 20.0;
						PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
    		            SetPlayerToTeamColor(playerid);
						SendClientMessage(playerid, COLOR_YELLOW, "[BODY] Kamu telah bangun dari Pingsan.");
						TogglePlayerControllable(playerid, 1);
		               	PlayerInfo[playerid][pInjured] = 0;
		        		DeathTimer[playerid] = 0;
						PlayerFrozen[playerid] = 0;
						SetPlayerCuffed(playerid, 0);
						PlayerCuffed[playerid] = 0;
						PlayerTied[playerid] = 0;
						CanTalk[playerid] = 1;
						return 1;
	            	}
            	}
            	return 1;
			}
			else if(strcmp(x_job,"witness",true) == 0)
			{
			    if(MarryWitnessOffer[playerid] < 999)
			    {
			        if(IsPlayerConnected(MarryWitnessOffer[playerid]))
			        {
			            if(ProxDetectorS(10.0, playerid, MarryWitnessOffer[playerid]))
						{
						    GetPlayerName(MarryWitnessOffer[playerid], giveplayer, sizeof(giveplayer));
							GetPlayerName(playerid, sendername, sizeof(sendername));
							format(string, sizeof(string), "* You have accepted %s's request to be their Marriage Witness.", giveplayer);
							SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
							format(string, sizeof(string), "* %s has accepted your request to be your Marriage Witness.", sendername);
							SendClientMessage(MarryWitnessOffer[playerid], COLOR_LIGHTBLUE, string);
							MarryWitness[MarryWitnessOffer[playerid]] = playerid;
							MarryWitnessOffer[playerid] = 999;
							return 1;
						}
						else
						{
						    SendClientMessage(playerid, COLOR_GREY, "   The player that requested you to be their Marriage Witness is not near you !");
						    return 1;
						}
			        }
				}
				else
				{
				    SendClientMessage(playerid, COLOR_GREY, "   Nobody has asked you to be their Marriage Witness !");
				    return 1;
				}
			}
	        else if(strcmp(x_job,"marriage",true) == 0)
			{
			    if(ProposeOffer[playerid] < 999)
			    {
			        if(!IsPlayerInRangeOfPoint(playerid,10.0,-2023.3164,1096.5204,18.0524))
			        {
			            SendClientMessage(playerid, COLOR_GREY, "   You are not at the Royal Church !");
			            return 1;
			        }
			        if(IsPlayerConnected(ProposeOffer[playerid]))
			        {
			            if(ProxDetectorS(10.0, playerid, ProposeOffer[playerid]))
						{
						    if(MarryWitness[ProposeOffer[playerid]] == 999)
						    {
						        SendClientMessage(playerid, COLOR_GREY, "   The proposer doesn't have a Marriage Witness !");
						        return 1;
						    }
						    if(IsPlayerConnected(MarryWitness[ProposeOffer[playerid]]))
						    {
							    if(ProxDetectorS(12.0, ProposeOffer[playerid], MarryWitness[ProposeOffer[playerid]]))
								{
								    GetPlayerName(ProposeOffer[playerid], giveplayer, sizeof(giveplayer));
									GetPlayerName(playerid, sendername, sizeof(sendername));
									format(string, sizeof(string), "* You have accepted %s's request to be your Husband.", giveplayer);
									SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
									format(string, sizeof(string), "* %s has accepted your request to be your Wife.", sendername);
									SendClientMessage(ProposeOffer[playerid], COLOR_LIGHTBLUE, string);
									format(string, sizeof(string), "Priest: %s do you take %s as your lovely Husband? (type 'yes', anything else will reject the Marriage)", sendername, giveplayer);
									SendClientMessage(playerid, COLOR_WHITE, string);
									MarriageCeremoney[playerid] = 1;
									ProposedTo[ProposeOffer[playerid]] = playerid;
									GotProposedBy[playerid] = ProposeOffer[playerid];
									MarryWitness[ProposeOffer[playerid]] = 999;
									ProposeOffer[playerid] = 999;
									return 1;
								}
								else
								{
								    SendClientMessage(playerid, COLOR_GREY, "   The Marriage Witness is not near your proposer !");
								    return 1;
								}
							}
							return 1;
						}
						else
						{
						    SendClientMessage(playerid, COLOR_GREY, "   The player that proposed to you is not near you !");
						    return 1;
						}
			        }
				}
				else
				{
				    SendClientMessage(playerid, COLOR_GREY, "   Nobody Proposed to you !");
				    return 1;
				}
			}
			else if(strcmp(x_job,"divorce",true) == 0)
			{
			    if(DivorceOffer[playerid] < 999)
			    {
			        if(IsPlayerConnected(DivorceOffer[playerid]))
			        {
			            if(ProxDetectorS(10.0, playerid, DivorceOffer[playerid]))
						{
							GetPlayerName(DivorceOffer[playerid], giveplayer, sizeof(giveplayer));
							GetPlayerName(playerid, sendername, sizeof(sendername));
							format(string, sizeof(string), "* You have accepted %s's request to Divorce.", giveplayer);
							SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
							format(string, sizeof(string), "* %s has accepted your request to Divorce.", sendername);
							SendClientMessage(DivorceOffer[playerid], COLOR_LIGHTBLUE, string);
							ClearMarriage(DivorceOffer[playerid]);
							ClearMarriage(playerid);
							DivorceOffer[playerid] = 999;
							return 1;
						}
						else
						{
						    SendClientMessage(playerid, COLOR_GREY, "   The player that divorced to you is not near you !");
						    return 1;
						}
			        }
				}
				else
				{
				    SendClientMessage(playerid, COLOR_GREY, "   Nobody Divorce to you !");
				    return 1;
				}
            }
			else if(strcmp(x_job,"handshake",true) == 0)
			{
			    if(HandshakeOffer[playerid] < 999)
			    {
			        if(IsPlayerConnected(HandshakeOffer[playerid]))
			        {
			            if(!IsPlayerInAnyVehicle(playerid))
			            {
			            	if(ProxDetectorS(2.0, playerid, HandshakeOffer[playerid]))
							{
				           		GetPlayerName(HandshakeOffer[playerid], giveplayer, sizeof(giveplayer));
								GetPlayerName(playerid, sendername, sizeof(sendername));
								format(string, sizeof(string), "* You have shaken %s's hand.", giveplayer);
								SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
								format(string, sizeof(string), "* %s has accepted the Handshake.", sendername);
								SendClientMessage(HandshakeOffer[playerid], COLOR_LIGHTBLUE, string);
								ClearAnimations(playerid);
								ClearAnimations(HandshakeOffer[playerid]);
								SetPlayerFacingPlayer(playerid, HandshakeOffer[playerid]);
								SetPlayerFacingPlayer(HandshakeOffer[playerid], playerid);
								if(HandshakeType[playerid] == 1)
								{
									ApplyAnimation(playerid, "GANGS","hndshkaa", 4.0,0,0,0,0,0);
									ApplyAnimation(HandshakeOffer[playerid],"GANGS","hndshkaa",4.0,0,0,0,0,0);
								}
								else if(HandshakeType[playerid] == 2)
								{
									ApplyAnimation(playerid,"GANGS","hndshkba",4.0,0,0,0,0,0);
									ApplyAnimation(HandshakeOffer[playerid],"GANGS","hndshkba",4.0,0,0,0,0,0);
								}
								else if(HandshakeType[playerid] == 3)
								{
									ApplyAnimation(playerid,"GANGS","hndshkda",4.0,0,0,0,0,0);
									ApplyAnimation(HandshakeOffer[playerid],"GANGS","hndshkda",4.0,0,0,0,0,0);
								}
								else if(HandshakeType[playerid] == 4)
								{
									ApplyAnimation(playerid,"GANGS","hndshkea",4.0,0,0,0,0,0);
									ApplyAnimation(HandshakeOffer[playerid],"GANGS","hndshkea",4.0,0,0,0,0,0);
								}
								else if(HandshakeType[playerid] == 5)
								{
									ApplyAnimation(playerid,"GANGS","hndshkfa",4.0,0,0,0,0,0);
									ApplyAnimation(HandshakeOffer[playerid],"GANGS","hndshkfa",4.0,0,0,0,0,0);
								}
								else if(HandshakeType[playerid] == 6)
								{
								    ApplyAnimation(playerid,"GANGS","prtial_hndshk_biz_01",4.0,0,0,0,0,0);
								    ApplyAnimation(HandshakeOffer[playerid],"GANGS","prtial_hndshk_biz_01",4.0,0,0,0,0,0);
								}
								HandshakeOffer[playerid] = 999;
								HandshakeType[playerid] = 0;
								return 1;
							}
							else
							{
						    	SendClientMessage(playerid, COLOR_GREY, "   You must be standing closer !");
						    	return 1;
							}
						}
						else
						{
						    SendClientMessage(playerid, COLOR_GREY, "   You must exit the vehicle !");
							return 1;
						}
					}
				}
				else
				{
				    SendClientMessage(playerid, COLOR_GREY, "   Nobody offered to shake your hand !");
				    return 1;
				}
			}
			else if(strcmp(x_job,"contract",true) == 0)
			{
			    if(ContractOffer[playerid] < 999)
			    {
			        if(GoChase[playerid] == 999)
			        {
				        if(IsPlayerConnected(ContractOffer[playerid]))
				        {
				            if(PlayerInfo[ContractID[playerid]][pHeadValue] != 0)
							{
							    new hitname[MAX_PLAYER_NAME];
					            GetPlayerName(playerid, sendername, sizeof(sendername));
					            GetPlayerName(ContractOffer[playerid], giveplayer, sizeof(giveplayer));
					            GetPlayerName(ContractID[playerid], hitname, sizeof(hitname));
					            format(string, sizeof(string), "* You have accepted the contract to kill %s, you will recieve $%d when completed.", hitname, PlayerInfo[ContractID[playerid]][pHeadValue]/2);
								SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
								format(string, sizeof(string), "* %s has accepted the contract to kill %s.", sendername, hitname);
								SendClientMessage(ContractOffer[playerid], COLOR_LIGHTBLUE, string);
								GoChase[playerid] = ContractID[playerid];
								ContractOffer[playerid] = 999;
								ContractID[playerid] = 999;
							}
							else
							{
							    SendClientMessage(playerid, COLOR_GREY, "   The contract has expired !");
					    		return 1;
							}
				        }
					}
					else
					{
					    SendClientMessage(playerid, COLOR_GREY, "   You are currently busy with a contract !");
						return 1;
					}
			    }
			    else
			    {
			        SendClientMessage(playerid, COLOR_GREY, "   Nobody offered you a contract !");
				    return 1;
			    }
			}
			else if(strcmp(x_job,"boxing",true) == 0)
			{
			    if(BoxOffer[playerid] < 999)
			    {
			        if(IsPlayerConnected(BoxOffer[playerid]))
			        {
			            new points;
			            new mypoints;
			            GetPlayerName(BoxOffer[playerid], giveplayer, sizeof(giveplayer));
						GetPlayerName(playerid, sendername, sizeof(sendername));
			            new level = PlayerInfo[BoxOffer[playerid]][pBoxSkill];
						if(level >= 0 && level <= 49) { points = 40; }
						else if(level >= 50 && level <= 99) { points = 50; }
						else if(level >= 100 && level <= 199) { points = 60; }
						else if(level >= 200 && level <= 399) { points = 70; }
						else if(level >= 400) { points = 80; }
						if(PlayerInfo[playerid][pJob] == 12)
						{
							new clevel = PlayerInfo[playerid][pBoxSkill];
							if(clevel >= 0 && clevel <= 49) { mypoints = 40; }
							else if(clevel >= 50 && clevel <= 99) { mypoints = 50; }
							else if(clevel >= 100 && clevel <= 199) { mypoints = 60; }
							else if(clevel >= 200 && clevel <= 399) { mypoints = 70; }
							else if(clevel >= 400) { mypoints = 80; }
						}
						else
						{
						    mypoints = 30;
						}
						format(string, sizeof(string), "* You have accepted the Boxing Challenge from %s, and will fight with %d Health.",giveplayer,mypoints);
						SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
						format(string, sizeof(string), "* %s has accepted your Boxing Challenge Request, you will fight with %d Health.",sendername,points);
						SendClientMessage(BoxOffer[playerid], COLOR_LIGHTBLUE, string);
						SetPlayerHealth(playerid, mypoints);
						SetPlayerHealth(BoxOffer[playerid], points);
						SetPlayerInterior(playerid, 5); SetPlayerInterior(BoxOffer[playerid], 5);
						SetPlayerPos(playerid, 762.9852,2.4439,1001.5942); SetPlayerFacingAngle(playerid, 131.8632);
						SetPlayerPos(BoxOffer[playerid], 758.7064,-1.8038,1001.5942); SetPlayerFacingAngle(BoxOffer[playerid], 313.1165);
						TogglePlayerControllable(playerid, 0); TogglePlayerControllable(BoxOffer[playerid], 0);
						SetCameraBehindPlayer(playerid);
						SetCameraBehindPlayer(BoxOffer[playerid]);
						GameTextForPlayer(playerid, "~r~Waiting", 3000, 1); GameTextForPlayer(BoxOffer[playerid], "~r~Waiting", 3000, 1);
						new name[MAX_PLAYER_NAME];
						new dstring[MAX_PLAYER_NAME];
						new wstring[MAX_PLAYER_NAME];
						GetPlayerName(playerid, name, sizeof(name));
						format(dstring, sizeof(dstring), "%s", name);
						strmid(wstring, dstring, 0, strlen(dstring), 255);
						if(strcmp(Titel[TitelName] ,wstring, true ) == 0 )
						{
						    format(string, sizeof(string), "Boxing News: Boxing Champion %s will fight VS %s, in 60 seconds (Grove Street Gym).",  sendername, giveplayer);
							OOCOff(COLOR_WHITE,string);
							TBoxer = playerid;
							BoxDelay = 60;
						}
						GetPlayerName(BoxOffer[playerid], name, sizeof(name));
						format(dstring, sizeof(dstring), "%s", name);
						strmid(wstring, dstring, 0, strlen(dstring), 255);
						if(strcmp(Titel[TitelName] ,wstring, true ) == 0 )
						{
						    format(string, sizeof(string), "Boxing News: Boxing Champion %s will fight VS %s, in 60 seconds (Grove Street Gym).",  giveplayer, sendername);
							OOCOff(COLOR_WHITE,string);
							TBoxer = BoxOffer[playerid];
							BoxDelay = 60;
						}
						BoxWaitTime[playerid] = 1; BoxWaitTime[BoxOffer[playerid]] = 1;
						if(BoxDelay < 1) { BoxDelay = 20; }
						InRing = 1;
						Boxer1 = BoxOffer[playerid];
						Boxer2 = playerid;
						PlayerBoxing[playerid] = 1;
						PlayerBoxing[BoxOffer[playerid]] = 1;
						BoxOffer[playerid] = 999;
						return 1;
			        }
			        return 1;
			    }
				else
				{
				    SendClientMessage(playerid, COLOR_GREY, "   Nobody offered you a Boxing Challenge !");
				    return 1;
				}
			}
			else if(strcmp(x_job,"taxi",true) == 0)
			{
			    if(TransportDuty[playerid] != 1)
			    {
			        SendClientMessage(playerid, COLOR_GREY, "   You are not a Taxi Driver !");
				    return 1;
			    }
	            if(TaxiCallTime[playerid] > 0)
	            {
	                SendClientMessage(playerid, COLOR_GREY, "   You have already accepted a Taxi Call !");
				    return 1;
	            }
	            if(TaxiCall < 999)
	            {
                    if(JobDuty[playerid] == 1)
			        {
		                if(IsPlayerConnected(TaxiCall))
		                {
		                    GetPlayerName(playerid, sendername, sizeof(sendername));
		                	GetPlayerName(TaxiCall, giveplayer, sizeof(giveplayer));
		                	format(string, sizeof(string), "* You have accepted the Taxi Call from %s (PH: %d), you will see the marker. (use /cancel taxi to cancel the order)",giveplayer, PlayerInfo[TaxiCall][pPnumber]);
							SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
	                        format(string, sizeof(string), "* Taxi Driver %s (PH: %d) has accepted your Taxi Call please wait at your current Position.", RemoveUnderScore(playerid), PlayerInfo[playerid][pPnumber]);
							SendClientMessage(TaxiCall, COLOR_LIGHTBLUE, string);
							GameTextForPlayer(playerid, "~w~Taxi Caller~n~~r~Goto redmarker", 5000, 1);
							TaxiCallTime[playerid] = 1;
							TaxiAccepted[playerid] = TaxiCall;
							TaxiCall = 999;
							return 1;
						}
					}
					else
		            {
		                SendClientMessage(playerid, COLOR_GREY, "   You are not Taxi onduty !");
				    	return 1;
		            }
	            }
	            else
	            {
	                SendClientMessage(playerid, COLOR_GREY, "   Nobody called for a Taxi yet !");
			    	return 1;
	            }
			}
			else if(strcmp(x_job,"bus",true) == 0)
			{
			    if(TransportDuty[playerid] != 2)
			    {
			        SendClientMessage(playerid, COLOR_GREY, "   You are not a Bus Driver !");
				    return 1;
			    }
	            if(BusCallTime[playerid] > 0)
	            {
	                SendClientMessage(playerid, COLOR_GREY, "   You have already accepted a Bus Call !");
				    return 1;
	            }
	            if(BusCall < 999)
	            {
	                if(IsPlayerConnected(BusCall))
	                {
	                    GetPlayerName(playerid, sendername, sizeof(sendername));
	                	GetPlayerName(BusCall, giveplayer, sizeof(giveplayer));
	                	format(string, sizeof(string), "* You have accepted the Bus Call from %s, you will see the marker untill you have reached it.",giveplayer);
						SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
                        format(string, sizeof(string), "* Bus Driver %s has accepted your Bus Call please wait at your current Position.",sendername);
						SendClientMessage(BusCall, COLOR_LIGHTBLUE, string);
						new Float:X,Float:Y,Float:Z;
						GetPlayerPos(BusCall, X, Y, Z);
						SetPlayerCheckpoint(playerid, X, Y, Z, 5);
						GameTextForPlayer(playerid, "~w~Bus Caller~n~~r~Goto redmarker", 5000, 1);
						BusCallTime[playerid] = 1;
						BusAccepted[playerid] = BusCall;
						BusCall = 999;
						return 1;
					}
	            }
	            else
	            {
	                SendClientMessage(playerid, COLOR_GREY, "   Nobody called for a Bus yet !");
			    	return 1;
	            }
			}
			else if(strcmp(x_job,"medic",true) == 0)
			{
			    if(PlayerInfo[playerid][pMember] == 4 || PlayerInfo[playerid][pLeader] == 4)
			    {
		            if(MedicCallTime[playerid] > 0)
		            {
		                SendClientMessage(playerid, COLOR_GREY, "   You have already accepted a Medic Call !");
					    return 1;
		            }
		            if(MedicCall < 999)
		            {
		                if(IsPlayerConnected(MedicCall))
		                {
		                    GetPlayerName(playerid, sendername, sizeof(sendername));
		                	GetPlayerName(MedicCall, giveplayer, sizeof(giveplayer));
		                	format(string, sizeof(string), "* You have accepted the Medic Call from %s, you have 30 Seconds to get there.",giveplayer);
							SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
							SendClientMessage(playerid, COLOR_LIGHTBLUE, "* After the 30 Seconds the Red Marker will disappear.");
	                        format(string, sizeof(string), "* Medic %s has accepted your Medic Call please wait at your current Position.",sendername);
							SendClientMessage(MedicCall, COLOR_LIGHTBLUE, string);
							new Float:X,Float:Y,Float:Z;
							GetPlayerPos(MedicCall, X, Y, Z);
							SetPlayerCheckpoint(playerid, X, Y, Z, 5);
							GameTextForPlayer(playerid, "~w~Medic Caller~n~~r~Goto redmarker", 5000, 1);
							MedicCallTime[playerid] = 1;
							MedicCall = 999;
							return 1;
						}
		            }
		            else
		            {
		                SendClientMessage(playerid, COLOR_GREY, "   Nobody called for a Medic yet !");
				    	return 1;
		            }
				}
				else
				{
				    SendClientMessage(playerid, COLOR_GREY, "   You are not a Medic !");
				    return 1;
				}
			}
			else if(strcmp(x_job,"lawyer",true) == 0)
			{
			    if(PlayerInfo[playerid][pJob] == 2)
			    {
		            if(LawyerCallTime[playerid] > 0)
		            {
		                SendClientMessage(playerid, COLOR_GREY, "   You have already accepted a Lawyer Call !");
					    return 1;
		            }
		            if(LawyerCall < 999)
		            {
		                if(IsPlayerConnected(LawyerCall))
		                {
		                    GetPlayerName(playerid, sendername, sizeof(sendername));
		                	GetPlayerName(LawyerCall, giveplayer, sizeof(giveplayer));
		                	format(string, sizeof(string), "* You have accepted the Lawyer Call from %s, you have 30 Seconds to get there.",giveplayer);
							SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
							SendClientMessage(playerid, COLOR_LIGHTBLUE, "* After the 30 Seconds the Red Marker will disappear.");
	                        format(string, sizeof(string), "* Lawyer %s has accepted your Lawyer Call please wait at your current Position.",sendername);
							SendClientMessage(LawyerCall, COLOR_LIGHTBLUE, string);
							new Float:X,Float:Y,Float:Z;
							GetPlayerPos(LawyerCall, X, Y, Z);
							SetPlayerCheckpoint(playerid, X, Y, Z, 5);
							GameTextForPlayer(playerid, "~w~Lawyer Caller~n~~r~Goto redmarker", 5000, 1);
							LawyerCallTime[playerid] = 1;
							LawyerCall = 999;
							return 1;
						}
		            }
		            else
		            {
		                SendClientMessage(playerid, COLOR_GREY, "   Nobody called for a Lawyer yet !");
				    	return 1;
		            }
				}
				else
				{
				    SendClientMessage(playerid, COLOR_GREY, "   You are not a Lawyer !");
				    return 1;
				}
			}
			else if(strcmp(x_job,"mechanic",true) == 0)
			{
			    if(PlayerInfo[playerid][pJob] != 7)
			    {
			        SendClientMessage(playerid, COLOR_GREY, "   You are not a Mechanic !");
				    return 1;
			    }
	            if(MechanicCallTime[playerid] > 0)
	            {
	                SendClientMessage(playerid, COLOR_GREY, "   You have already accepted a Mechanic Call !");
				    return 1;
	            }
	            if(MechanicCall < 999)
	            {
	                if(IsPlayerConnected(MechanicCall))
	                {
	                	GetPlayerName(MechanicCall, giveplayer, sizeof(giveplayer));
	                	format(string, sizeof(string), "* You have accepted the Mechanic Call from %s (PH: %d), you have 30 Seconds to get there.",giveplayer, PlayerInfo[MechanicCall][pPnumber]);
						SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
						SendClientMessage(playerid, COLOR_LIGHTBLUE, "* After the 30 Seconds the Red Marker will disappear.");
                        format(string, sizeof(string), "* Mechanic %s (PH: %d) has accepted your Mechanic Call please wait at your current Position.", RemoveUnderScore(playerid), PlayerInfo[playerid][pPnumber]);
						SendClientMessage(MechanicCall, COLOR_LIGHTBLUE, string);
						new Float:X,Float:Y,Float:Z;
						GetPlayerPos(MechanicCall, X, Y, Z);
						SetPlayerCheckpoint(playerid, X, Y, Z, 5);
						GameTextForPlayer(playerid, "~w~Mechanic Caller~n~~r~Goto redmarker", 5000, 1);
						MechanicCallTime[playerid] = 1;
						MechanicCall = 999;
						return 1;
					}
	            }
	            else
	            {
	                SendClientMessage(playerid, COLOR_GREY, "   Nobody called for a Mechanic yet !");
			    	return 1;
	            }
			}
		    else if(strcmp(x_job,"job",true) == 0)
			{
			    if(GettingJob[playerid] > 0)
			    {
			        SendClientMessage(playerid, COLOR_WHITE, "Gunakan /help jika kamu butuh bantuan tentang Pekerjaan");
			        PlayerInfo[playerid][pJob] = GettingJob[playerid];
			        GettingJob[playerid] = 0;
			        if(PlayerInfo[playerid][pJob] == 9)
			        {
			        	SendClientMessage(playerid, COLOR_WHITE, "HINT: You'll need to buy GP from P.C Warehouse");
			        }
			        if(PlayerInfo[playerid][pJob] == 17)
			        {
			        	SendClientMessage(playerid, COLOR_WHITE, "HINT: You'll need to buy Drug-Crates from P.C Warehouse.");
			        }
			        return 1;
			    }
			    else
			    {
			        SendClientMessage(playerid, COLOR_GREY, "   You haven't even been at a Job place yet!");
			        return 1;
			    }
			}
			else if(strcmp(x_job,"vehicle",true) == 0)
            {
                new carsellerid = SellVehicleOffer[playerid];
                new carsellerslot = SellVehicleSlot[playerid];
                new carsellerprice = SellVehiclePrice[playerid];
                new Float:X,Float:Y,Float:Z,Float:F;
                if(SellVehicleOffer[playerid] < 999)
                {
                    if(PlayerInfo[playerid][pCash] >= carsellerprice)
                    {
                        if(IsPlayerConnected(carsellerid))
                        {
                            if(ProxDetectorS(10.0, playerid, SellVehicleOffer[playerid]))
                            {
                                if(carsellerslot == 1)
								{
    								GetVehiclePos(PlayerVehicleID1[carsellerid],X,Y,Z);
									GetVehicleZAngle(PlayerVehicleID1[carsellerid],F);
								  	if(PlayerInfo[playerid][PlayerVehicleModel1] == 0)
					    			{
										PlayerInfo[playerid][pCash] -= carsellerprice;
                                        GivePlayerMoney(playerid,-carsellerprice);
                                        PlayerInfo[carsellerid][pCash] += carsellerprice;
                                        GivePlayerMoney(carsellerid,carsellerprice);
										format(string,sizeof(string),"	You have accepted to buy %s's %s For Price : %d.",PlayerName(carsellerid),vehName[PlayerInfo[carsellerid][PlayerVehicleModel1]-400],carsellerprice);
										SendClientMessage(playerid,COLOR_YELLOW,string);
										format(string,sizeof(string),"	You have sold your %s to %s For Price : %d.",vehName[PlayerInfo[carsellerid][PlayerVehicleModel1]-400],PlayerName(playerid),carsellerprice);
										SendClientMessage(carsellerid,COLOR_YELLOW,string);
                                        ReplacePlayerVehicle(carsellerid, playerid, 1,1); // ReplacePlayerVehicle(seller, buyer, sellerslotid,buyerslotid)
										RemovePlayerFromVehicle(carsellerid);
										ResetPlayerVehicle(carsellerid,carsellerslot);
                                        CreatePlayerVehicle(playerid,1);
										SetVehiclePos(PlayerVehicleID1[playerid],X,Y,Z);
										SetVehicleZAngle(PlayerVehicleID1[playerid],F);
										SellVehicleOffer[playerid] = 999;
							            SellVehiclePrice[playerid] = 0;
									}
					  				else if(PlayerInfo[playerid][PlayerVehicleModel2] == 0)
					    			{
										PlayerInfo[playerid][pCash] -= carsellerprice;
                                        GivePlayerMoney(playerid,-carsellerprice);
                                        PlayerInfo[carsellerid][pCash] += carsellerprice;
                                        GivePlayerMoney(carsellerid,carsellerprice);
										format(string,sizeof(string),"	You have accepted to buy %s's %s For Price : %d.",PlayerName(carsellerid),vehName[PlayerInfo[carsellerid][PlayerVehicleModel1]-400],carsellerprice);
										SendClientMessage(playerid,COLOR_YELLOW,string);
										format(string,sizeof(string),"	You have sold your %s to %s For Price : %d.",vehName[PlayerInfo[carsellerid][PlayerVehicleModel1]-400],PlayerName(playerid),carsellerprice);
										SendClientMessage(carsellerid,COLOR_YELLOW,string);
                                        ReplacePlayerVehicle(carsellerid, playerid, 1,2); // ReplacePlayerVehicle(seller, buyer, sellerslotid,buyerslotid)
										RemovePlayerFromVehicle(carsellerid);
										ResetPlayerVehicle(carsellerid,carsellerslot);
                                        CreatePlayerVehicle(playerid,2);
										SetVehiclePos(PlayerVehicleID2[playerid],X,Y,Z);
										SetVehicleZAngle(PlayerVehicleID2[playerid],F);
										SellVehicleOffer[playerid] = 999;
							            SellVehiclePrice[playerid] = 0;
						    		}
									else
									{
										if(PlayerInfo[playerid][pDonateRank] >= 1)
										{
										  	if(PlayerInfo[playerid][PlayerVehicleModel3] == 0)
							    			{
    											PlayerInfo[playerid][pCash] -= carsellerprice;
                                        		GivePlayerMoney(playerid,-carsellerprice);
                                        		PlayerInfo[carsellerid][pCash] += carsellerprice;
                                                GivePlayerMoney(carsellerid,carsellerprice);
												format(string,sizeof(string),"	You have accepted to buy %s's %s For Price : %d.",PlayerName(carsellerid),vehName[PlayerInfo[carsellerid][PlayerVehicleModel1]-400],carsellerprice);
												SendClientMessage(playerid,COLOR_YELLOW,string);
												format(string,sizeof(string),"	You have sold your %s to %s For Price : %d.",vehName[PlayerInfo[carsellerid][PlayerVehicleModel1]-400],PlayerName(playerid),carsellerprice);
												SendClientMessage(carsellerid,COLOR_YELLOW,string);
                                                ReplacePlayerVehicle(carsellerid, playerid, 1,3); // ReplacePlayerVehicle(seller, buyer, sellerslotid,buyerslotid)
												RemovePlayerFromVehicle(carsellerid);
												ResetPlayerVehicle(carsellerid,carsellerslot);
		                                        CreatePlayerVehicle(playerid,3);
												SetVehiclePos(PlayerVehicleID3[playerid],X,Y,Z);
												SetVehicleZAngle(PlayerVehicleID3[playerid],F);
												SellVehicleOffer[playerid] = 999;
							                    SellVehiclePrice[playerid] = 0;
											}
											else if(PlayerInfo[playerid][pDonateRank] >= 2)
											{
										  		if(PlayerInfo[playerid][PlayerVehicleModel4] == 0)
								    			{
													PlayerInfo[playerid][pCash] -= carsellerprice;
			                                        GivePlayerMoney(playerid,-carsellerprice);
			                                        PlayerInfo[carsellerid][pCash] += carsellerprice;
                                                    GivePlayerMoney(carsellerid,carsellerprice);
													format(string,sizeof(string),"	You have accepted to buy %s's %s For Price : %d.",PlayerName(carsellerid),vehName[PlayerInfo[carsellerid][PlayerVehicleModel1]-400],carsellerprice);
													SendClientMessage(playerid,COLOR_YELLOW,string);
													format(string,sizeof(string),"	You have sold your %s to %s For Price : %d.",vehName[PlayerInfo[carsellerid][PlayerVehicleModel1]-400],PlayerName(playerid),carsellerprice);
													SendClientMessage(carsellerid,COLOR_YELLOW,string);
                                                    ReplacePlayerVehicle(carsellerid, playerid, 1,4); // ReplacePlayerVehicle(seller, buyer, sellerslotid,buyerslotid)
													RemovePlayerFromVehicle(carsellerid);
													ResetPlayerVehicle(carsellerid,carsellerslot);
			                                        CreatePlayerVehicle(playerid,4);
													SetVehiclePos(PlayerVehicleID4[playerid],X,Y,Z);
													SetVehicleZAngle(PlayerVehicleID4[playerid],F);
													SellVehicleOffer[playerid] = 999;
							                        SellVehiclePrice[playerid] = 0;
												}
						       					else if(PlayerInfo[playerid][pDonateRank] >= 3)
												{
											  		if(PlayerInfo[playerid][PlayerVehicleModel5] == 0)
									    			{
														PlayerInfo[playerid][pCash] -= carsellerprice;
				                                        GivePlayerMoney(playerid,-carsellerprice);
				                                        PlayerInfo[carsellerid][pCash] += carsellerprice;
                                                        GivePlayerMoney(carsellerid,carsellerprice);
														format(string,sizeof(string),"	You have accepted to buy %s's %s For Price : %d.",PlayerName(carsellerid),vehName[PlayerInfo[carsellerid][PlayerVehicleModel1]-400],carsellerprice);
														SendClientMessage(playerid,COLOR_YELLOW,string);
														format(string,sizeof(string),"	You have sold your %s to %s For Price : %d.",vehName[PlayerInfo[carsellerid][PlayerVehicleModel1]-400],PlayerName(playerid),carsellerprice);
														SendClientMessage(carsellerid,COLOR_YELLOW,string);
                                                        ReplacePlayerVehicle(carsellerid, playerid, 1,5); // ReplacePlayerVehicle(seller, buyer, sellerslotid,buyerslotid)
														RemovePlayerFromVehicle(carsellerid);
														ResetPlayerVehicle(carsellerid,carsellerslot);
    			                                        CreatePlayerVehicle(playerid,5);
														SetVehiclePos(PlayerVehicleID5[playerid],X,Y,Z);
														SetVehicleZAngle(PlayerVehicleID5[playerid],F);
														SellVehicleOffer[playerid] = 999;
							                            SellVehiclePrice[playerid] = 0;
													}
										   			else
													{
														SendClientMessage(playerid, COLOR_GREY, "You have the maximum car limit!");
													}
												}
									   			else
												{
													SendClientMessage(playerid, COLOR_GREY, "You have the maximum car limit!");
												}
											}
								   			else
											{
												SendClientMessage(playerid, COLOR_GREY, "You have the maximum car limit!");
											}
										}
							   			else
										{
											SendClientMessage(playerid, COLOR_GREY, "You have the maximum car limit!");
										}
									}
								}
								else if(carsellerslot == 2)
								{
    								GetVehiclePos(PlayerVehicleID2[carsellerid],X,Y,Z);
									GetVehicleZAngle(PlayerVehicleID2[carsellerid],F);
								  	if(PlayerInfo[playerid][PlayerVehicleModel1] == 0)
					    			{
										PlayerInfo[playerid][pCash] -= carsellerprice;
                                        GivePlayerMoney(playerid,-carsellerprice);
                                        PlayerInfo[carsellerid][pCash] += carsellerprice;
                                        GivePlayerMoney(carsellerid,carsellerprice);
										format(string,sizeof(string),"	You have accepted to buy %s's %s For Price : %d.",PlayerName(carsellerid),vehName[PlayerInfo[carsellerid][PlayerVehicleModel2]-400],carsellerprice);
										SendClientMessage(playerid,COLOR_YELLOW,string);
										format(string,sizeof(string),"	You have sold your %s to %s For Price : %d.",vehName[PlayerInfo[carsellerid][PlayerVehicleModel2]-400],PlayerName(playerid),carsellerprice);
										SendClientMessage(carsellerid,COLOR_YELLOW,string);
                                        ReplacePlayerVehicle(carsellerid, playerid, 2,1); // ReplacePlayerVehicle(seller, buyer, sellerslotid,buyerslotid)
                                        RemovePlayerFromVehicle(carsellerid);
										ResetPlayerVehicle(carsellerid,carsellerslot);
										CreatePlayerVehicle(playerid,1);
										SetVehiclePos(PlayerVehicleID1[playerid],X,Y,Z);
										SetVehicleZAngle(PlayerVehicleID1[playerid],F);
										SellVehicleOffer[playerid] = 999;
							            SellVehiclePrice[playerid] = 0;
									}
					  				else if(PlayerInfo[playerid][PlayerVehicleModel2] == 0)
					    			{
										PlayerInfo[playerid][pCash] -= carsellerprice;
                                        GivePlayerMoney(playerid,-carsellerprice);
                                        PlayerInfo[carsellerid][pCash] += carsellerprice;
                                        GivePlayerMoney(carsellerid,carsellerprice);
										format(string,sizeof(string),"	You have accepted to buy %s's %s For Price : %d.",PlayerName(carsellerid),vehName[PlayerInfo[carsellerid][PlayerVehicleModel2]-400],carsellerprice);
										SendClientMessage(playerid,COLOR_YELLOW,string);
										format(string,sizeof(string),"	You have sold your %s to %s For Price : %d.",vehName[PlayerInfo[carsellerid][PlayerVehicleModel2]-400],PlayerName(playerid),carsellerprice);
										SendClientMessage(carsellerid,COLOR_YELLOW,string);
                                        ReplacePlayerVehicle(carsellerid, playerid, 2,2); // ReplacePlayerVehicle(seller, buyer, sellerslotid,buyerslotid)
                                        RemovePlayerFromVehicle(carsellerid);
										ResetPlayerVehicle(carsellerid,carsellerslot);
                                        CreatePlayerVehicle(playerid,2);
										SetVehiclePos(PlayerVehicleID2[playerid],X,Y,Z);
										SetVehicleZAngle(PlayerVehicleID2[playerid],F);
										SellVehicleOffer[playerid] = 999;
							            SellVehiclePrice[playerid] = 0;
						    		}
									else
									{
										if(PlayerInfo[playerid][pDonateRank] >= 1)
										{
										  	if(PlayerInfo[playerid][PlayerVehicleModel3] == 0)
							    			{
    											PlayerInfo[playerid][pCash] -= carsellerprice;
                                        		GivePlayerMoney(playerid,-carsellerprice);
                                        		PlayerInfo[carsellerid][pCash] += carsellerprice;
                                                GivePlayerMoney(carsellerid,carsellerprice);
												format(string,sizeof(string),"	You have accepted to buy %s's %s For Price : %d.",PlayerName(carsellerid),vehName[PlayerInfo[carsellerid][PlayerVehicleModel2]-400],carsellerprice);
												SendClientMessage(playerid,COLOR_YELLOW,string);
												format(string,sizeof(string),"	You have sold your %s to %s For Price : %d.",vehName[PlayerInfo[carsellerid][PlayerVehicleModel2]-400],PlayerName(playerid),carsellerprice);
												SendClientMessage(carsellerid,COLOR_YELLOW,string);
                                                ReplacePlayerVehicle(carsellerid, playerid, 2,3); // ReplacePlayerVehicle(seller, buyer, sellerslotid,buyerslotid)
                                                RemovePlayerFromVehicle(carsellerid);
												ResetPlayerVehicle(carsellerid,carsellerslot);
                                                CreatePlayerVehicle(playerid,3);
												SetVehiclePos(PlayerVehicleID3[playerid],X,Y,Z);
												SetVehicleZAngle(PlayerVehicleID3[playerid],F);
												SellVehicleOffer[playerid] = 999;
							                    SellVehiclePrice[playerid] = 0;
								    		}
											else if(PlayerInfo[playerid][pDonateRank] >= 2)
											{
										  		if(PlayerInfo[playerid][PlayerVehicleModel4] == 0)
								    			{
													PlayerInfo[playerid][pCash] -= carsellerprice;
			                                        GivePlayerMoney(playerid,-carsellerprice);
			                                        PlayerInfo[carsellerid][pCash] += carsellerprice;
                                                    GivePlayerMoney(carsellerid,carsellerprice);
													format(string,sizeof(string),"	You have accepted to buy %s's %s For Price : %d.",PlayerName(carsellerid),vehName[PlayerInfo[carsellerid][PlayerVehicleModel2]-400],carsellerprice);
													SendClientMessage(playerid,COLOR_YELLOW,string);
													format(string,sizeof(string),"	You have sold your %s to %s For Price : %d.",vehName[PlayerInfo[carsellerid][PlayerVehicleModel2]-400],PlayerName(playerid),carsellerprice);
													SendClientMessage(carsellerid,COLOR_YELLOW,string);
                                                    ReplacePlayerVehicle(carsellerid, playerid, 2,4); // ReplacePlayerVehicle(seller, buyer, sellerslotid,buyerslotid)
                                                    RemovePlayerFromVehicle(carsellerid);
													ResetPlayerVehicle(carsellerid,carsellerslot);
                                                    CreatePlayerVehicle(playerid,4);
													SetVehiclePos(PlayerVehicleID4[playerid],X,Y,Z);
													SetVehicleZAngle(PlayerVehicleID4[playerid],F);
													SellVehicleOffer[playerid] = 999;
							                        SellVehiclePrice[playerid] = 0;
									    		}
						       					else if(PlayerInfo[playerid][pDonateRank] >= 3)
												{
											  		if(PlayerInfo[playerid][PlayerVehicleModel5] == 0)
									    			{
														PlayerInfo[playerid][pCash] -= carsellerprice;
				                                        GivePlayerMoney(playerid,-carsellerprice);
				                                        PlayerInfo[carsellerid][pCash] += carsellerprice;
                                                        GivePlayerMoney(carsellerid,carsellerprice);
														format(string,sizeof(string),"	You have accepted to buy %s's %s For Price : %d.",PlayerName(carsellerid),vehName[PlayerInfo[carsellerid][PlayerVehicleModel2]-400],carsellerprice);
														SendClientMessage(playerid,COLOR_YELLOW,string);
														format(string,sizeof(string),"	You have sold your %s to %s For Price : %d.",vehName[PlayerInfo[carsellerid][PlayerVehicleModel2]-400],PlayerName(playerid),carsellerprice);
														SendClientMessage(carsellerid,COLOR_YELLOW,string);
                                                        ReplacePlayerVehicle(carsellerid, playerid, 2,5); // ReplacePlayerVehicle(seller, buyer, sellerslotid,buyerslotid)
                                                        RemovePlayerFromVehicle(carsellerid);
														ResetPlayerVehicle(carsellerid,carsellerslot);
                                                        CreatePlayerVehicle(playerid,5);
														SetVehiclePos(PlayerVehicleID5[playerid],X,Y,Z);
														SetVehicleZAngle(PlayerVehicleID5[playerid],F);
														SellVehicleOffer[playerid] = 999;
							                            SellVehiclePrice[playerid] = 0;
										    		}
										   			else
													{
														SendClientMessage(playerid, COLOR_GREY, "You have the maximum car limit!");
													}
												}
									   			else
												{
													SendClientMessage(playerid, COLOR_GREY, "You have the maximum car limit!");
												}
											}
								   			else
											{
												SendClientMessage(playerid, COLOR_GREY, "You have the maximum car limit!");
											}
										}
							   			else
										{
											SendClientMessage(playerid, COLOR_GREY, "You have the maximum car limit!");
										}
									}
								}
								else if(carsellerslot == 3)
								{
    								GetVehiclePos(PlayerVehicleID3[carsellerid],X,Y,Z);
									GetVehicleZAngle(PlayerVehicleID3[carsellerid],F);
								  	if(PlayerInfo[playerid][PlayerVehicleModel1] == 0)
					    			{
										PlayerInfo[playerid][pCash] -= carsellerprice;
                                        GivePlayerMoney(playerid,-carsellerprice);
                                        PlayerInfo[carsellerid][pCash] += carsellerprice;
                                        GivePlayerMoney(carsellerid,carsellerprice);
										format(string,sizeof(string),"	You have accepted to buy %s's %s For Price : %d.",PlayerName(carsellerid),vehName[PlayerInfo[carsellerid][PlayerVehicleModel3]-400],carsellerprice);
										SendClientMessage(playerid,COLOR_YELLOW,string);
										format(string,sizeof(string),"	You have sold your %s to %s For Price : %d.",vehName[PlayerInfo[carsellerid][PlayerVehicleModel3]-400],PlayerName(playerid),carsellerprice);
										SendClientMessage(carsellerid,COLOR_YELLOW,string);
										ReplacePlayerVehicle(carsellerid, playerid, 3,1); // ReplacePlayerVehicle(seller, buyer, sellerslotid,buyerslotid)
          								RemovePlayerFromVehicle(carsellerid);
										ResetPlayerVehicle(carsellerid,carsellerslot);
                                        CreatePlayerVehicle(playerid,1);
										SetVehiclePos(PlayerVehicleID1[playerid],X,Y,Z);
										SetVehicleZAngle(PlayerVehicleID1[playerid],F);
										SellVehicleOffer[playerid] = 999;
							            SellVehiclePrice[playerid] = 0;
									}
					  				else if(PlayerInfo[playerid][PlayerVehicleModel2] == 0)
					    			{
										PlayerInfo[playerid][pCash] -= carsellerprice;
                                        GivePlayerMoney(playerid,-carsellerprice);
                                        PlayerInfo[carsellerid][pCash] += carsellerprice;
                                        GivePlayerMoney(carsellerid,carsellerprice);
										format(string,sizeof(string),"	You have accepted to buy %s's %s For Price : %d.",PlayerName(carsellerid),vehName[PlayerInfo[carsellerid][PlayerVehicleModel3]-400],carsellerprice);
										SendClientMessage(playerid,COLOR_YELLOW,string);
										format(string,sizeof(string),"	You have sold your %s to %s For Price : %d.",vehName[PlayerInfo[carsellerid][PlayerVehicleModel3]-400],PlayerName(playerid),carsellerprice);
										SendClientMessage(carsellerid,COLOR_YELLOW,string);
										ReplacePlayerVehicle(carsellerid, playerid, 3,2); // ReplacePlayerVehicle(seller, buyer, sellerslotid,buyerslotid)
          								RemovePlayerFromVehicle(carsellerid);
										ResetPlayerVehicle(carsellerid,carsellerslot);
                                        CreatePlayerVehicle(playerid,2);
										SetVehiclePos(PlayerVehicleID2[playerid],X,Y,Z);
										SetVehicleZAngle(PlayerVehicleID2[playerid],F);
										SellVehicleOffer[playerid] = 999;
							            SellVehiclePrice[playerid] = 0;
						    		}
									else
									{
										if(PlayerInfo[playerid][pDonateRank] >= 1)
										{
										  	if(PlayerInfo[playerid][PlayerVehicleModel3] == 0)
							    			{
    											PlayerInfo[playerid][pCash] -= carsellerprice;
                                        		GivePlayerMoney(playerid,-carsellerprice);
                                        		PlayerInfo[carsellerid][pCash] += carsellerprice;
                                                GivePlayerMoney(carsellerid,carsellerprice);
												format(string,sizeof(string),"	You have accepted to buy %s's %s For Price : %d.",PlayerName(carsellerid),vehName[PlayerInfo[carsellerid][PlayerVehicleModel3]-400],carsellerprice);
												SendClientMessage(playerid,COLOR_YELLOW,string);
												format(string,sizeof(string),"	You have sold your %s to %s For Price : %d.",vehName[PlayerInfo[carsellerid][PlayerVehicleModel3]-400],PlayerName(playerid),carsellerprice);
												SendClientMessage(carsellerid,COLOR_YELLOW,string);
  												ReplacePlayerVehicle(carsellerid, playerid, 3,3); // ReplacePlayerVehicle(seller, buyer, sellerslotid,buyerslotid)
          										RemovePlayerFromVehicle(carsellerid);
												ResetPlayerVehicle(carsellerid,carsellerslot);
  												CreatePlayerVehicle(playerid,3);
												SetVehiclePos(PlayerVehicleID3[playerid],X,Y,Z);
												SetVehicleZAngle(PlayerVehicleID3[playerid],F);
												SellVehicleOffer[playerid] = 999;
							                    SellVehiclePrice[playerid] = 0;
								    		}
											else if(PlayerInfo[playerid][pDonateRank] >= 2)
											{
										  		if(PlayerInfo[playerid][PlayerVehicleModel4] == 0)
								    			{
													PlayerInfo[playerid][pCash] -= carsellerprice;
			                                        GivePlayerMoney(playerid,-carsellerprice);
			                                        PlayerInfo[carsellerid][pCash] += carsellerprice;
                                                    GivePlayerMoney(carsellerid,carsellerprice);
													format(string,sizeof(string),"	You have accepted to buy %s's %s For Price : %d.",PlayerName(carsellerid),vehName[PlayerInfo[carsellerid][PlayerVehicleModel3]-400],carsellerprice);
													SendClientMessage(playerid,COLOR_YELLOW,string);
													format(string,sizeof(string),"	You have sold your %s to %s For Price : %d.",vehName[PlayerInfo[carsellerid][PlayerVehicleModel3]-400],PlayerName(playerid),carsellerprice);
													SendClientMessage(carsellerid,COLOR_YELLOW,string);
   													ReplacePlayerVehicle(carsellerid, playerid, 3,4); // ReplacePlayerVehicle(seller, buyer, sellerslotid,buyerslotid)
          											RemovePlayerFromVehicle(carsellerid);
													ResetPlayerVehicle(carsellerid,carsellerslot);
 													CreatePlayerVehicle(playerid,4);
													SetVehiclePos(PlayerVehicleID4[playerid],X,Y,Z);
													SetVehicleZAngle(PlayerVehicleID4[playerid],F);
													SellVehicleOffer[playerid] = 999;
							                        SellVehiclePrice[playerid] = 0;
									    		}
						       					else if(PlayerInfo[playerid][pDonateRank] >= 3)
												{
											  		if(PlayerInfo[playerid][PlayerVehicleModel5] == 0)
									    			{
														PlayerInfo[playerid][pCash] -= carsellerprice;
				                                        GivePlayerMoney(playerid,-carsellerprice);
				                                        PlayerInfo[carsellerid][pCash] += carsellerprice;
                                                        GivePlayerMoney(carsellerid,carsellerprice);
														format(string,sizeof(string),"	You have accepted to buy %s's %s For Price : %d.",PlayerName(carsellerid),vehName[PlayerInfo[carsellerid][PlayerVehicleModel3]-400],carsellerprice);
														SendClientMessage(playerid,COLOR_YELLOW,string);
														format(string,sizeof(string),"	You have sold your %s to %s For Price : %d.",vehName[PlayerInfo[carsellerid][PlayerVehicleModel3]-400],PlayerName(playerid),carsellerprice);
														SendClientMessage(carsellerid,COLOR_YELLOW,string);
                                                        ReplacePlayerVehicle(carsellerid, playerid, 3,5); // ReplacePlayerVehicle(seller, buyer, sellerslotid,buyerslotid)
          												RemovePlayerFromVehicle(carsellerid);
														ResetPlayerVehicle(carsellerid,carsellerslot);
	 													CreatePlayerVehicle(playerid,5);
														SetVehiclePos(PlayerVehicleID5[playerid],X,Y,Z);
														SetVehicleZAngle(PlayerVehicleID5[playerid],F);
														SellVehicleOffer[playerid] = 999;
							                            SellVehiclePrice[playerid] = 0;
										    		}
										   			else
													{
														SendClientMessage(playerid, COLOR_GREY, "You have the maximum car limit!");
													}
												}
									   			else
												{
													SendClientMessage(playerid, COLOR_GREY, "You have the maximum car limit!");
												}
											}
								   			else
											{
												SendClientMessage(playerid, COLOR_GREY, "You have the maximum car limit!");
											}
										}
							   			else
										{
											SendClientMessage(playerid, COLOR_GREY, "You have the maximum car limit!");
										}
									}
								}
								else if(carsellerslot == 4)
								{
    								GetVehiclePos(PlayerVehicleID4[carsellerid],X,Y,Z);
									GetVehicleZAngle(PlayerVehicleID4[carsellerid],F);
								  	if(PlayerInfo[playerid][PlayerVehicleModel1] == 0)
					    			{
										PlayerInfo[playerid][pCash] -= carsellerprice;
                                        GivePlayerMoney(playerid,-carsellerprice);
                                        PlayerInfo[carsellerid][pCash] += carsellerprice;
                                        GivePlayerMoney(carsellerid,carsellerprice);
										format(string,sizeof(string),"	You have accepted to buy %s's %s For Price : %d.",PlayerName(carsellerid),vehName[PlayerInfo[carsellerid][PlayerVehicleModel4]-400],carsellerprice);
										SendClientMessage(playerid,COLOR_YELLOW,string);
										format(string,sizeof(string),"	You have sold your %s to %s For Price : %d.",vehName[PlayerInfo[carsellerid][PlayerVehicleModel4]-400],PlayerName(playerid),carsellerprice);
										SendClientMessage(carsellerid,COLOR_YELLOW,string);
                                        ReplacePlayerVehicle(carsellerid, playerid, 4,1); // ReplacePlayerVehicle(seller, buyer, sellerslotid,buyerslotid)
										RemovePlayerFromVehicle(carsellerid);
										ResetPlayerVehicle(carsellerid,carsellerslot);
                                        CreatePlayerVehicle(playerid,1);
										SetVehiclePos(PlayerVehicleID1[playerid],X,Y,Z);
										SetVehicleZAngle(PlayerVehicleID1[playerid],F);
										SellVehicleOffer[playerid] = 999;
							            SellVehiclePrice[playerid] = 0;
									}
					  				else if(PlayerInfo[playerid][PlayerVehicleModel2] == 0)
					    			{
										PlayerInfo[playerid][pCash] -= carsellerprice;
                                        GivePlayerMoney(playerid,-carsellerprice);
                                        PlayerInfo[carsellerid][pCash] += carsellerprice;
                                        GivePlayerMoney(carsellerid,carsellerprice);
										format(string,sizeof(string),"	You have accepted to buy %s's %s For Price : %d.",PlayerName(carsellerid),vehName[PlayerInfo[carsellerid][PlayerVehicleModel4]-400],carsellerprice);
										SendClientMessage(playerid,COLOR_YELLOW,string);
										format(string,sizeof(string),"	You have sold your %s to %s For Price : %d.",vehName[PlayerInfo[carsellerid][PlayerVehicleModel4]-400],PlayerName(playerid),carsellerprice);
										SendClientMessage(carsellerid,COLOR_YELLOW,string);
                                        ReplacePlayerVehicle(carsellerid, playerid, 4,2); // ReplacePlayerVehicle(seller, buyer, sellerslotid,buyerslotid)
										RemovePlayerFromVehicle(carsellerid);
										ResetPlayerVehicle(carsellerid,carsellerslot);
                                        CreatePlayerVehicle(playerid,2);
										SetVehiclePos(PlayerVehicleID2[playerid],X,Y,Z);
										SetVehicleZAngle(PlayerVehicleID2[playerid],F);
										SellVehicleOffer[playerid] = 999;
							            SellVehiclePrice[playerid] = 0;
						    		}
									else
									{
										if(PlayerInfo[playerid][pDonateRank] >= 1)
										{
										  	if(PlayerInfo[playerid][PlayerVehicleModel3] == 0)
							    			{
    											PlayerInfo[playerid][pCash] -= carsellerprice;
                                        		GivePlayerMoney(playerid,-carsellerprice);
                                        		PlayerInfo[carsellerid][pCash] += carsellerprice;
                                                GivePlayerMoney(carsellerid,carsellerprice);
												format(string,sizeof(string),"	You have accepted to buy %s's %s For Price : %d.",PlayerName(carsellerid),vehName[PlayerInfo[carsellerid][PlayerVehicleModel4]-400],carsellerprice);
												SendClientMessage(playerid,COLOR_YELLOW,string);
												format(string,sizeof(string),"	You have sold your %s to %s For Price : %d.",vehName[PlayerInfo[carsellerid][PlayerVehicleModel4]-400],PlayerName(playerid),carsellerprice);
												SendClientMessage(carsellerid,COLOR_YELLOW,string);
                                                ReplacePlayerVehicle(carsellerid, playerid, 4,3); // ReplacePlayerVehicle(seller, buyer, sellerslotid,buyerslotid)
												RemovePlayerFromVehicle(carsellerid);
												ResetPlayerVehicle(carsellerid,carsellerslot);
  												CreatePlayerVehicle(playerid,3);
												SetVehiclePos(PlayerVehicleID3[playerid],X,Y,Z);
												SetVehicleZAngle(PlayerVehicleID3[playerid],F);
												SellVehicleOffer[playerid] = 999;
                                                SellVehiclePrice[playerid] = 0;
								    		}
											else if(PlayerInfo[playerid][pDonateRank] >= 2)
											{
										  		if(PlayerInfo[playerid][PlayerVehicleModel4] == 0)
								    			{
													PlayerInfo[playerid][pCash] -= carsellerprice;
			                                        GivePlayerMoney(playerid,-carsellerprice);
			                                        PlayerInfo[carsellerid][pCash] += carsellerprice;
                                                    GivePlayerMoney(carsellerid,carsellerprice);
													format(string,sizeof(string),"	You have accepted to buy %s's %s For Price : %d.",PlayerName(carsellerid),vehName[PlayerInfo[carsellerid][PlayerVehicleModel4]-400],carsellerprice);
													SendClientMessage(playerid,COLOR_YELLOW,string);
													format(string,sizeof(string),"	You have sold your %s to %s For Price : %d.",vehName[PlayerInfo[carsellerid][PlayerVehicleModel4]-400],PlayerName(playerid),carsellerprice);
													SendClientMessage(carsellerid,COLOR_YELLOW,string);
                                                    ReplacePlayerVehicle(carsellerid, playerid, 4,4); // ReplacePlayerVehicle(seller, buyer, sellerslotid,buyerslotid)
													RemovePlayerFromVehicle(carsellerid);
													ResetPlayerVehicle(carsellerid,carsellerslot);
 													CreatePlayerVehicle(playerid,4);
													SetVehiclePos(PlayerVehicleID4[playerid],X,Y,Z);
													SetVehicleZAngle(PlayerVehicleID4[playerid],F);
													SellVehicleOffer[playerid] = 999;
							                        SellVehiclePrice[playerid] = 0;
									    		}
						       					else if(PlayerInfo[playerid][pDonateRank] >= 3)
												{
											  		if(PlayerInfo[playerid][PlayerVehicleModel5] == 0)
									    			{
														PlayerInfo[playerid][pCash] -= carsellerprice;
				                                        GivePlayerMoney(playerid,-carsellerprice);
				                                        PlayerInfo[carsellerid][pCash] += carsellerprice;
                                                        GivePlayerMoney(carsellerid,carsellerprice);
														format(string,sizeof(string),"	You have accepted to buy %s's %s For Price : %d.",PlayerName(carsellerid),vehName[PlayerInfo[carsellerid][PlayerVehicleModel4]-400],carsellerprice);
														SendClientMessage(playerid,COLOR_YELLOW,string);
														format(string,sizeof(string),"	You have sold your %s to %s For Price : %d.",vehName[PlayerInfo[carsellerid][PlayerVehicleModel4]-400],PlayerName(playerid),carsellerprice);
														SendClientMessage(carsellerid,COLOR_YELLOW,string);
                                                        ReplacePlayerVehicle(carsellerid, playerid, 4,5); // ReplacePlayerVehicle(seller, buyer, sellerslotid,buyerslotid)
														RemovePlayerFromVehicle(carsellerid);
														ResetPlayerVehicle(carsellerid,carsellerslot);
 														CreatePlayerVehicle(playerid,5);
														SetVehiclePos(PlayerVehicleID5[playerid],X,Y,Z);
														SetVehicleZAngle(PlayerVehicleID5[playerid],F);
														SellVehicleOffer[playerid] = 999;
							                            SellVehiclePrice[playerid] = 0;
										    		}
										   			else
													{
														SendClientMessage(playerid, COLOR_GREY, "You have the maximum car limit!");
													}
												}
									   			else
												{
													SendClientMessage(playerid, COLOR_GREY, "You have the maximum car limit!");
												}
											}
								   			else
											{
												SendClientMessage(playerid, COLOR_GREY, "You have the maximum car limit!");
											}
										}
							   			else
										{
											SendClientMessage(playerid, COLOR_GREY, "You have the maximum car limit!");
										}
									}
								}
								else if(carsellerslot == 5)
								{
    								GetVehiclePos(PlayerVehicleID5[carsellerid],X,Y,Z);
									GetVehicleZAngle(PlayerVehicleID5[carsellerid],F);
								  	if(PlayerInfo[playerid][PlayerVehicleModel1] == 0)
					    			{
										PlayerInfo[playerid][pCash] -= carsellerprice;
                                        GivePlayerMoney(playerid,-carsellerprice);
                                        PlayerInfo[carsellerid][pCash] += carsellerprice;
                                        GivePlayerMoney(carsellerid,carsellerprice);
										format(string,sizeof(string),"	You have accepted to buy %s's %s For Price : %d.",PlayerName(carsellerid),vehName[PlayerInfo[carsellerid][PlayerVehicleModel5]-400],carsellerprice);
										SendClientMessage(playerid,COLOR_YELLOW,string);
										format(string,sizeof(string),"	You have sold your %s to %s For Price : %d.",vehName[PlayerInfo[carsellerid][PlayerVehicleModel5]-400],PlayerName(playerid),carsellerprice);
										SendClientMessage(carsellerid,COLOR_YELLOW,string);
                                        ReplacePlayerVehicle(carsellerid, playerid, 5,1); // ReplacePlayerVehicle(seller, buyer, sellerslotid,buyerslotid)
										RemovePlayerFromVehicle(carsellerid);
										ResetPlayerVehicle(carsellerid,carsellerslot);
                                        CreatePlayerVehicle(playerid,1);
										SetVehiclePos(PlayerVehicleID1[playerid],X,Y,Z);
										SetVehicleZAngle(PlayerVehicleID1[playerid],F);
										SellVehicleOffer[playerid] = 999;
							            SellVehiclePrice[playerid] = 0;
									}
					  				else if(PlayerInfo[playerid][PlayerVehicleModel2] == 0)
					    			{
										PlayerInfo[playerid][pCash] -= carsellerprice;
                                        GivePlayerMoney(playerid,-carsellerprice);
                                        PlayerInfo[carsellerid][pCash] += carsellerprice;
                                        GivePlayerMoney(carsellerid,carsellerprice);
										format(string,sizeof(string),"	You have accepted to buy %s's %s For Price : %d.",PlayerName(carsellerid),vehName[PlayerInfo[carsellerid][PlayerVehicleModel5]-400],carsellerprice);
										SendClientMessage(playerid,COLOR_YELLOW,string);
										format(string,sizeof(string),"	You have sold your %s to %s For Price : %d.",vehName[PlayerInfo[carsellerid][PlayerVehicleModel5]-400],PlayerName(playerid),carsellerprice);
										SendClientMessage(carsellerid,COLOR_YELLOW,string);
                                        ReplacePlayerVehicle(carsellerid, playerid, 5,2); // ReplacePlayerVehicle(seller, buyer, sellerslotid,buyerslotid)
										RemovePlayerFromVehicle(carsellerid);
										ResetPlayerVehicle(carsellerid,carsellerslot);
                                        CreatePlayerVehicle(playerid,2);
										SetVehiclePos(PlayerVehicleID2[playerid],X,Y,Z);
										SetVehicleZAngle(PlayerVehicleID2[playerid],F);
										SellVehicleOffer[playerid] = 999;
							            SellVehiclePrice[playerid] = 0;
						    		}
									else
									{
										if(PlayerInfo[playerid][pDonateRank] >= 1)
										{
										  	if(PlayerInfo[playerid][PlayerVehicleModel3] == 0)
							    			{
    											PlayerInfo[playerid][pCash] -= carsellerprice;
                                        		GivePlayerMoney(playerid,-carsellerprice);
                                        		PlayerInfo[carsellerid][pCash] += carsellerprice;
                                                GivePlayerMoney(carsellerid,carsellerprice);
												format(string,sizeof(string),"	You have accepted to buy %s's %s For Price : %d.",PlayerName(carsellerid),vehName[PlayerInfo[carsellerid][PlayerVehicleModel5]-400],carsellerprice);
												SendClientMessage(playerid,COLOR_YELLOW,string);
												format(string,sizeof(string),"	You have sold your %s to %s For Price : %d.",vehName[PlayerInfo[carsellerid][PlayerVehicleModel5]-400],PlayerName(playerid),carsellerprice);
												SendClientMessage(carsellerid,COLOR_YELLOW,string);
                                                ReplacePlayerVehicle(carsellerid, playerid, 5,3); // ReplacePlayerVehicle(seller, buyer, sellerslotid,buyerslotid)
												RemovePlayerFromVehicle(carsellerid);
												ResetPlayerVehicle(carsellerid,carsellerslot);
		                                        CreatePlayerVehicle(playerid,3);
												SetVehiclePos(PlayerVehicleID3[playerid],X,Y,Z);
												SetVehicleZAngle(PlayerVehicleID3[playerid],F);
												SellVehicleOffer[playerid] = 999;
                                                SellVehiclePrice[playerid] = 0;
											}
											else if(PlayerInfo[playerid][pDonateRank] >= 2)
											{
										  		if(PlayerInfo[playerid][PlayerVehicleModel4] == 0)
								    			{
													PlayerInfo[playerid][pCash] -= carsellerprice;
			                                        GivePlayerMoney(playerid,-carsellerprice);
			                                        PlayerInfo[carsellerid][pCash] += carsellerprice;
                                                    GivePlayerMoney(carsellerid,carsellerprice);
													format(string,sizeof(string),"	You have accepted to buy %s's %s For Price : %d.",PlayerName(carsellerid),vehName[PlayerInfo[carsellerid][PlayerVehicleModel5]-400],carsellerprice);
													SendClientMessage(playerid,COLOR_YELLOW,string);
													format(string,sizeof(string),"	You have sold your %s to %s For Price : %d.",vehName[PlayerInfo[carsellerid][PlayerVehicleModel5]-400],PlayerName(playerid),carsellerprice);
													SendClientMessage(carsellerid,COLOR_YELLOW,string);
                                                    ReplacePlayerVehicle(carsellerid, playerid, 5,4); // ReplacePlayerVehicle(seller, buyer, sellerslotid,buyerslotid)
													RemovePlayerFromVehicle(carsellerid);
													ResetPlayerVehicle(carsellerid,carsellerslot);
			                                        CreatePlayerVehicle(playerid,4);
													SetVehiclePos(PlayerVehicleID4[playerid],X,Y,Z);
													SetVehicleZAngle(PlayerVehicleID4[playerid],F);
													SellVehicleOffer[playerid] = 999;
							                        SellVehiclePrice[playerid] = 0;
												}
						       					else if(PlayerInfo[playerid][pDonateRank] >= 3)
												{
											  		if(PlayerInfo[playerid][PlayerVehicleModel5] == 0)
									    			{
														PlayerInfo[playerid][pCash] -= carsellerprice;
				                                        GivePlayerMoney(playerid,-carsellerprice);
				                                        PlayerInfo[carsellerid][pCash] += carsellerprice;
                                                        GivePlayerMoney(carsellerid,carsellerprice);
														format(string,sizeof(string),"	You have accepted to buy %s's %s For Price : %d.",PlayerName(carsellerid),vehName[PlayerInfo[carsellerid][PlayerVehicleModel5]-400],carsellerprice);
														SendClientMessage(playerid,COLOR_YELLOW,string);
														format(string,sizeof(string),"	You have sold your %s to %s For Price : %d.",vehName[PlayerInfo[carsellerid][PlayerVehicleModel5]-400],PlayerName(playerid),carsellerprice);
														SendClientMessage(carsellerid,COLOR_YELLOW,string);
                                                        ReplacePlayerVehicle(carsellerid, playerid, 5,5); // ReplacePlayerVehicle(seller, buyer, sellerslotid,buyerslotid)
														RemovePlayerFromVehicle(carsellerid);
														ResetPlayerVehicle(carsellerid,carsellerslot);
    			                                        CreatePlayerVehicle(playerid,5);
														SetVehiclePos(PlayerVehicleID5[playerid],X,Y,Z);
														SetVehicleZAngle(PlayerVehicleID5[playerid],F);
														SellVehicleOffer[playerid] = 999;
							                            SellVehiclePrice[playerid] = 0;
													}
										   			else
													{
														SendClientMessage(playerid, COLOR_GREY, "You have the maximum car limit!");
													}
												}
									   			else
												{
													SendClientMessage(playerid, COLOR_GREY, "You have the maximum car limit!");
												}
											}
								   			else
											{
												SendClientMessage(playerid, COLOR_GREY, "You have the maximum car limit!");
											}
										}
							   			else
										{
											SendClientMessage(playerid, COLOR_GREY, "You have the maximum car limit!");
										}
									}
								}
							}
						}
					}
                    else
                    {
                        SendClientMessage(playerid, COLOR_GREY, " You can't afford that !");
                        return 1;
                    }
                }
                else
                {
                    SendClientMessage(playerid, COLOR_GREY, " Nobody offered you to sell his vehicle !");
                    return 1;
                }
            }
			else if(strcmp(x_job,"live",true) == 0)
			{
			    if(LiveOffer[playerid] < 999)
			    {
			        if(IsPlayerConnected(LiveOffer[playerid]))
			        {
				        if(ProxDetectorS(5.0, playerid, LiveOffer[playerid]))
						{
						    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* You are frozen till the Live Conversation ends.");
							SendClientMessage(LiveOffer[playerid], COLOR_LIGHTBLUE, "* You are frozen till the Live Conversation ends (use /live again).");
							TogglePlayerControllable(playerid, 0);
							TogglePlayerControllable(LiveOffer[playerid], 0);
							TalkingLive[playerid] = LiveOffer[playerid];
							TalkingLive[LiveOffer[playerid]] = playerid;
							LiveOffer[playerid] = 999;
							return 1;
						}
						else
						{
						    SendClientMessage(playerid, COLOR_GREY, "   You are to far away from the News Reporter !");
							return 1;
						}
					}
					return 1;
				}
				else
				{
				    SendClientMessage(playerid, COLOR_GREY, "   Nobody gave you a Live Conversation offer !");
				    return 1;
				}
			}
			else if(strcmp(x_job,"defense",true) == 0)
			{
			    if(DefenseOffer[playerid] < 999)
			    {
			        if(PlayerInfo[playerid][pCash] > DefensePrice[playerid])
			        {
			        	if(IsPlayerConnected(DefenseOffer[playerid]))
			        	{
			        	    GetPlayerName(DefenseOffer[playerid], giveplayer, sizeof(giveplayer));
			        	    GetPlayerName(playerid, sendername, sizeof(sendername));
			        	    format(string, sizeof(string), "* Lawyer %s has defended you and lowered your wanted level for $%d.",giveplayer,DefensePrice[playerid]);
			        	    SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
			        	    format(string, sizeof(string), "* %s accepted the Defense, the $%d was transferred to your Bank Account.",sendername,DefensePrice[playerid]);
                            SendClientMessage(DefenseOffer[playerid], COLOR_LIGHTBLUE, string);
                            format(string, sizeof(string), "%s has accepted the defense from %s for $%d", sendername,giveplayer,DefensePrice[playerid]);
							PayLog(string);
                            PlayerInfo[DefenseOffer[playerid]][pAccount] += DefensePrice[playerid];
                            PlayerInfo[playerid][pCash] = PlayerInfo[playerid][pCash]-DefensePrice[playerid];
                            GivePlayerMoney(playerid, -DefensePrice[playerid]);
							PlayerPlaySound(playerid,1054,0.0,0.0,0.0);
					        DefenseOffer[playerid] = 999;
							DefensePrice[playerid] = 0;
							ClearCrime(playerid);
							return 1;
						}
						return 1;
			        }
			        else
					{
					    SendClientMessage(playerid, COLOR_GREY, "   You can't afford that !");
					    return 1;
					}
			    }
			    else
			    {
			        SendClientMessage(playerid, COLOR_GREY, "   Nobody has offered to defend you !");
			        return 1;
			    }
			}
			else if(strcmp(x_job,"vest",true) == 0)
			{
			    if(GuardOffer[playerid] < 999)
			    {
			        if(PlayerInfo[playerid][pCash] > GuardPrice[playerid])
				    {
					    if(IsPlayerConnected(GuardOffer[playerid]))
					    {
					        if(ProxDetectorS(3.0, playerid, GuardOffer[playerid]))
					        {
					            if(UseAcceptTimer[playerid]) return SendClientMessage(playerid,COLOR_GREY,"   You must wait 60 seconds !");
					        	GetPlayerName(GuardOffer[playerid], giveplayer, sizeof(giveplayer));
								GetPlayerName(playerid, sendername, sizeof(sendername));
								format(string, sizeof(string), "* You accepted the Protection for $%d from Bodyguard %s.",GuardPrice[playerid],giveplayer);
								SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
								format(string, sizeof(string), "* %s accepted your Protection, and the $%d was added to your Bank Account.",sendername,GuardPrice[playerid]);
								SendClientMessage(GuardOffer[playerid], COLOR_LIGHTBLUE, string);
								format(string, sizeof(string), "%s has accepted the protection from %s for $%d", sendername,giveplayer,GuardPrice[playerid]);
								PayLog(string);
								PlayerInfo[GuardOffer[playerid]][pAccount] += GuardPrice[playerid];
								PlayerInfo[playerid][pCash] = PlayerInfo[playerid][pCash]-GuardPrice[playerid];
								GivePlayerMoney(playerid, -GuardPrice[playerid]);
					        	GuardOffer[playerid] = 999;
								GuardPrice[playerid] = 0;
								SetPlayerArmour(playerid, 50.0);
								PlayerInfo[playerid][pArmor] = 50.0;
								UseAcceptTimer[playerid] = 1;
								SetTimerEx("UseAccept",60*1000,0,"i",playerid);
								return 1;
							}
							else
							{
							    SendClientMessage(playerid, COLOR_GRAD1, "   You're too far away !");
							    return 1;
							}
						}
						return 1;
					}
					else
					{
					    SendClientMessage(playerid, COLOR_GREY, "   You can't afford that !");
					    return 1;
					}
			    }
			    else
			    {
			        SendClientMessage(playerid, COLOR_GREY, "   Nobody offered you any Protection !");
			        return 1;
			    }
			}
			else if(strcmp(x_job,"pot",true) == 0)
			{
			    if(PotOffer[playerid] < 999)
			    {
			        if(PlayerInfo[playerid][pCash] > PotPrice[playerid])
				    {
				        if(PlayerInfo[playerid][pPot] < 7)
				        {
					        if(IsPlayerConnected(PotOffer[playerid]))
					        {
					            GetPlayerName(PotOffer[playerid], giveplayer, sizeof(giveplayer));
								GetPlayerName(playerid, sendername, sizeof(sendername));
								format(string, sizeof(string), "* You bought %d grams of pot for $%d from Drug Dealer %s.",PotGram[playerid],PotPrice[playerid],giveplayer);
								SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
								format(string, sizeof(string), "* %s has bought your %d grams, the $%d was added to your Bank Account.",sendername,PotGram[playerid],PotPrice[playerid]);
								SendClientMessage(PotOffer[playerid], COLOR_LIGHTBLUE, string);
								PlayerInfo[PotOffer[playerid]][pAccount] += PotPrice[playerid];
								PlayerInfo[PotOffer[playerid]][pDrugsSkill] ++;
								PlayerInfo[playerid][pCash] = PlayerInfo[playerid][pCash]-PotPrice[playerid];
								GivePlayerMoney(playerid, -PotPrice[playerid]);
								PlayerInfo[playerid][pPot] += PotGram[playerid];
								PlayerInfo[PotOffer[playerid]][pPot] -= PotGram[playerid];
								if(PlayerInfo[PotOffer[playerid]][pDrugsSkill] == 50)
								{ SendClientMessage(PotOffer[playerid], COLOR_YELLOW, "* Your Drug Dealer Skill is now Level 2, you can buy more Grams."); }
								else if(PlayerInfo[PotOffer[playerid]][pDrugsSkill] == 100)
								{ SendClientMessage(PotOffer[playerid], COLOR_YELLOW, "* Your Drug Dealer Skill is now Level 3, you can buy more Grams."); }
								else if(PlayerInfo[PotOffer[playerid]][pDrugsSkill] == 200)
								{ SendClientMessage(PotOffer[playerid], COLOR_YELLOW, "* Your Drug Dealer Skill is now Level 4, you can buy more Grams."); }
								else if(PlayerInfo[PotOffer[playerid]][pDrugsSkill] == 400)
								{ SendClientMessage(PotOffer[playerid], COLOR_YELLOW, "* Your Drug Dealer Skill is now Level 5, you can buy more Grams."); }
					            PotOffer[playerid] = 999;
								PotPrice[playerid] = 0;
								PotGram[playerid] = 0;
								return 1;
							}
							return 1;
						}
						else
						{
						    SendClientMessage(playerid, COLOR_GREY, "   You are fully loaded with Pot, /usepot or /drop it first !");
						    return 1;
						}
					}
					else
					{
					    SendClientMessage(playerid, COLOR_GREY, "   You can't afford that !");
					    return 1;
					}
			    }
			    else
			    {
			        SendClientMessage(playerid, COLOR_GREY, "   Nobody offered you any Pot !");
			        return 1;
			    }
			}
			else if(strcmp(x_job,"crack",true) == 0)
			{
			    if(CrackOffer[playerid] < 999)
			    {
			        if(PlayerInfo[playerid][pCash] > CrackPrice[playerid])
				    {
				        if(PlayerInfo[playerid][pCrack] < 7)
				        {
					        if(IsPlayerConnected(CrackOffer[playerid]))
					        {
					            GetPlayerName(CrackOffer[playerid], giveplayer, sizeof(giveplayer));
								GetPlayerName(playerid, sendername, sizeof(sendername));
								format(string, sizeof(string), "* You bought %d grams of crack for $%d from Drug Dealer %s.",CrackGram[playerid],CrackPrice[playerid],giveplayer);
								SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
								format(string, sizeof(string), "* %s has bought your %d grams, the $%d was added to your Bank Account.",sendername,CrackGram[playerid],CrackPrice[playerid]);
								SendClientMessage(CrackOffer[playerid], COLOR_LIGHTBLUE, string);
								PlayerInfo[CrackOffer[playerid]][pAccount] += CrackPrice[playerid];
								PlayerInfo[CrackOffer[playerid]][pDrugsSkill] ++;
								PlayerInfo[playerid][pCash] = PlayerInfo[playerid][pCash]-CrackPrice[playerid];
								GivePlayerMoney(playerid, -CrackPrice[playerid]);
								PlayerInfo[playerid][pCrack] += CrackGram[playerid];
								PlayerInfo[CrackOffer[playerid]][pCrack] -= CrackGram[playerid];
								if(PlayerInfo[CrackOffer[playerid]][pDrugsSkill] == 50)
								{ SendClientMessage(CrackOffer[playerid], COLOR_YELLOW, "* Your Drug Dealer Skill is now Level 2, you can buy more Grams."); }
								else if(PlayerInfo[CrackOffer[playerid]][pDrugsSkill] == 100)
								{ SendClientMessage(CrackOffer[playerid], COLOR_YELLOW, "* Your Drug Dealer Skill is now Level 3, you can buy more Grams."); }
								else if(PlayerInfo[CrackOffer[playerid]][pDrugsSkill] == 200)
								{ SendClientMessage(CrackOffer[playerid], COLOR_YELLOW, "* Your Drug Dealer Skill is now Level 4, you can buy more Grams."); }
								else if(PlayerInfo[CrackOffer[playerid]][pDrugsSkill] == 400)
								{ SendClientMessage(CrackOffer[playerid], COLOR_YELLOW, "* Your Drug Dealer Skill is now Level 5, you can buy more Grams."); }
					            CrackOffer[playerid] = 999;
								CrackPrice[playerid] = 0;
								CrackGram[playerid] = 0;
								return 1;
							}
							return 1;
						}
						else
						{
						    SendClientMessage(playerid, COLOR_GREY, "   You are fully loaded with Crack, /usecrack or /drop it first !");
						    return 1;
						}
					}
					else
					{
					    SendClientMessage(playerid, COLOR_GREY, "   You can't afford that !");
					    return 1;
					}
			    }
			    else
			    {
			        SendClientMessage(playerid, COLOR_GREY, "   Nobody offered you any Pot !");
			        return 1;
			    }
			}
			else if(strcmp(x_job,"sex",true) == 0)
			{
			    if(SexOffer[playerid] < 999)
				{
					if(PlayerInfo[playerid][pCash] > SexPrice[playerid])
			  		{
						if(IsPlayerConnected(SexOffer[playerid]))
						{
						    new Car = GetPlayerVehicleID(playerid);
						    if(IsPlayerInAnyVehicle(playerid) && IsPlayerInVehicle(SexOffer[playerid], Car))
						    {
						        if(UseAcceptTimer[playerid]) return SendClientMessage(playerid,COLOR_GREY,"   You must wait 60 seconds !");
								GetPlayerName(SexOffer[playerid], giveplayer, sizeof(giveplayer));
								GetPlayerName(playerid, sendername, sizeof(sendername));
								format(string, sizeof(string), "* You had sex with %s, for $%d.", giveplayer, SexPrice[playerid]);
								SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
								format(string, sizeof(string), "* %s had sex with you, the $%d was added to your Bank Account.", sendername, SexPrice[playerid]);
								SendClientMessage(SexOffer[playerid], COLOR_LIGHTBLUE, string);
								format(string, sizeof(string), "%s has accepted the sex from %s for $%d", sendername,giveplayer,SexPrice[playerid]);
								PayLog(string);
								PlayerInfo[SexOffer[playerid]][pAccount] += SexPrice[playerid];
								PlayerInfo[playerid][pCash] = PlayerInfo[playerid][pCash]-SexPrice[playerid];
								GivePlayerMoney(playerid, -SexPrice[playerid]);
								PlayerInfo[SexOffer[playerid]][pSexSkill] ++;
								if(PlayerInfo[SexOffer[playerid]][pSexSkill] == 50)
								{ SendClientMessage(SexOffer[playerid], COLOR_YELLOW, "* Your Sex Skill is now Level 2, you offer better Sex (health)"); }
								else if(PlayerInfo[SexOffer[playerid]][pSexSkill] == 100)
								{ SendClientMessage(SexOffer[playerid], COLOR_YELLOW, "* Your Sex Skill is now Level 3, you offer better Sex (health)."); }
								else if(PlayerInfo[SexOffer[playerid]][pSexSkill] == 200)
								{ SendClientMessage(SexOffer[playerid], COLOR_YELLOW, "* Your Sex Skill is now Level 4, you offer better Sex (health)."); }
								else if(PlayerInfo[SexOffer[playerid]][pSexSkill] == 400)
								{ SendClientMessage(SexOffer[playerid], COLOR_YELLOW, "* Your Sex Skill is now Level 5, you offer better Sex (health)."); }
								UseAcceptTimer[playerid] = 1;
								SetTimerEx("UseAccept",60*1000,0,"i",playerid);
								new Float: playersHP;
						        GetPlayerHealth(playerid, playersHP);
						        if(playersHP > 80) { SetPlayerHealth(playerid, 100.0); }
								else { SetPlayerHealth(playerid, playersHP + 20.0); }
								SexOffer[playerid] = 999;
								return 1;
							}
							else
							{
							    SendClientMessage(playerid, COLOR_GREY, "   You or the Whore are not both in a Car !");
							    return 1;
							}
						}
						return 1;
					}
					else
					{
					    SendClientMessage(playerid, COLOR_GREY, "   You can't afford that !");
					    return 1;
					}
				}
				else
				{
				    SendClientMessage(playerid, COLOR_GREY, "   You dont have any Sex offered by a Whore !");
				    return 1;
				}
			}
			else if(strcmp(x_job,"business",true) == 0)
			{
			    if(BizOffer[playerid] < 999)
			    {
			        if(PlayerInfo[playerid][pCash] > BizPrice[playerid])
				    {
					    if(IsPlayerConnected(BizOffer[playerid]))
					    {
					        if(ProxDetectorS(3.0, playerid, BizOffer[playerid]))
					        {
					            new FileName[128];
					            format(FileName, sizeof(FileName), "Businesses/Business_%d.ini", BizID[playerid]);
					            if(UseAcceptTimer[playerid]) return SendClientMessage(playerid,COLOR_GREY,"   You must wait 60 seconds !");
					        	GetPlayerName(BizOffer[playerid], giveplayer, sizeof(giveplayer));
								GetPlayerName(playerid, sendername, sizeof(sendername));
								if(PlayerInfo[playerid][pPbiskey] == 0)
								{
									format(string, sizeof(string), "* You accepted to buy the Business for $%d from %s.",BizPrice[playerid],giveplayer);
									SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
									format(string, sizeof(string), "* %s accepted your to buy your Business, and you received $%d.",sendername,BizPrice[playerid]);
									SendClientMessage(BizOffer[playerid], COLOR_LIGHTBLUE, string);
									format(string, sizeof(string), "%s has accepted to buy the Business from %s for $%d", sendername,giveplayer,BizPrice[playerid]);
									PayLog(string);
									PlayerInfo[BizOffer[playerid]][pCash] += BizPrice[playerid];
									PlayerInfo[playerid][pCash] = PlayerInfo[playerid][pCash]-BizPrice[playerid];
									GivePlayerMoney(playerid, -BizPrice[playerid]);
									PlayerInfo[playerid][pPbiskey] = BizID[playerid];
									if(PlayerInfo[BizOffer[playerid]][pPbiskey] == BizID[playerid])
								    {
									    PlayerInfo[BizOffer[playerid]][pPbiskey] = 0;
									}
									else
									{
									    PlayerInfo[BizOffer[playerid]][pPbiskey2] = 0;
									}
									dini_Set(FileName, "Owner", GetName(playerid));
									format(BizzInfo[PlayerInfo[playerid][pPbiskey]][bOwner], MAX_PLAYER_NAME, "%s", GetName(playerid));
									format(string, sizeof(string), "{0000FF}[Business]{F0CC00}\nOwner: %s\n%s\nEntrance Fee: $%d\nID: %d", BizzInfo[PlayerInfo[playerid][pPbiskey]][bOwner], BizzInfo[PlayerInfo[playerid][pPbiskey]][bMessage],BizzInfo[PlayerInfo[playerid][pPbiskey]][bEntranceCost], PlayerInfo[playerid][pPbiskey]);
									UpdateDynamic3DTextLabelText(business1[PlayerInfo[playerid][pPbiskey]], COLOR_DCHAT, string);
									BizOffer[playerid] = 999;
									BizPrice[playerid] = 0;
									BizID[playerid] = 0;
									UseAcceptTimer[playerid] = 1;
									SetTimerEx("UseAccept",60*1000,0,"i",playerid);
									SaveBusiness(PlayerInfo[playerid][pPbiskey]);
								}
								else
								{
									format(string, sizeof(string), "* You accepted to buy the Business for $%d from %s.",BizPrice[playerid],giveplayer);
									SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
									format(string, sizeof(string), "* %s accepted your to buy your Business, and you received $%d.",sendername,BizPrice[playerid]);
									SendClientMessage(BizOffer[playerid], COLOR_LIGHTBLUE, string);
									format(string, sizeof(string), "%s has accepted to buy the Business from %s for $%d", sendername,giveplayer,BizPrice[playerid]);
									PayLog(string);
									PlayerInfo[BizOffer[playerid]][pCash] += BizPrice[playerid];
									PlayerInfo[playerid][pCash] = PlayerInfo[playerid][pCash]-BizPrice[playerid];
									GivePlayerMoney(playerid, -BizPrice[playerid]);
									PlayerInfo[playerid][pPbiskey2] = BizID[playerid];
									if(PlayerInfo[BizOffer[playerid]][pPbiskey] == BizID[playerid])
								    {
									    PlayerInfo[BizOffer[playerid]][pPbiskey] = 0;
									}
									else
									{
									    PlayerInfo[BizOffer[playerid]][pPbiskey2] = 0;
									}
									dini_Set(FileName, "Owner", GetName(playerid));
									format(BizzInfo[PlayerInfo[playerid][pPbiskey2]][bOwner], MAX_PLAYER_NAME, "%s", GetName(playerid));
									format(string, sizeof(string), "{0000FF}[Business]{F0CC00}\nOwner: %s\n%s\nEntrance Fee: $%d\nID: %d", BizzInfo[PlayerInfo[playerid][pPbiskey2]][bOwner], BizzInfo[PlayerInfo[playerid][pPbiskey2]][bMessage],BizzInfo[PlayerInfo[playerid][pPbiskey2]][bEntranceCost], PlayerInfo[playerid][pPbiskey2]);
									UpdateDynamic3DTextLabelText(business1[PlayerInfo[playerid][pPbiskey2]], COLOR_DCHAT, string);
									BizOffer[playerid] = 999;
									BizPrice[playerid] = 0;
									BizID[playerid] = 0;
									UseAcceptTimer[playerid] = 1;
									SetTimerEx("UseAccept",60*1000,0,"i",playerid);
									SaveBusiness(PlayerInfo[playerid][pPbiskey2]);
								}
								return 1;
							}
							else
							{
							    SendClientMessage(playerid, COLOR_GRAD1, "   You're too far away !");
							    return 1;
							}
						}
						return 1;
					}
					else
					{
					    SendClientMessage(playerid, COLOR_GREY, "   You can't afford that !");
					    return 1;
					}
			    }
			    else
			    {
			        SendClientMessage(playerid, COLOR_GREY, "   Nobody offered you any Business !");
			        return 1;
			    }
			}
   			else if(strcmp(x_job,"house",true) == 0)
			{
			    if(HouseOffer[playerid] < 999)
			    {
			        if(PlayerInfo[playerid][pCash] > HousePrice[playerid])
				    {
					    if(IsPlayerConnected(HouseOffer[playerid]))
					    {
					        if(ProxDetectorS(3.0, playerid, HouseOffer[playerid]))
					        {
					            new FileName[128];
						        format(FileName, sizeof(FileName), "Houses/House_%d.ini", HouseID[playerid]);
						        if(UseAcceptTimer[playerid]) return SendClientMessage(playerid,COLOR_GREY,"   You must wait 60 seconds !");
						        GetPlayerName(HouseOffer[playerid], giveplayer, sizeof(giveplayer));
								GetPlayerName(playerid, sendername, sizeof(sendername));
                                if(PlayerInfo[playerid][pPbiskey] == 0)
                                {
									format(string, sizeof(string), "* You accepted to buy the House for $%d from %s.",HousePrice[playerid],giveplayer);
									SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
									format(string, sizeof(string), "* %s accepted your to buy your House, and you received $%d.",sendername,HousePrice[playerid]);
									SendClientMessage(HouseOffer[playerid], COLOR_LIGHTBLUE, string);
									format(string, sizeof(string), "%s has accepted to buy the House from %s for $%d", sendername,giveplayer,HousePrice[playerid]);
									PayLog(string);
									PlayerInfo[HouseOffer[playerid]][pCash] += HousePrice[playerid];
									PlayerInfo[playerid][pCash] = PlayerInfo[playerid][pCash]-HousePrice[playerid];
									GivePlayerMoney(playerid, -HousePrice[playerid]);
									PlayerInfo[playerid][pPhousekey] = HouseID[playerid];
									if(PlayerInfo[HouseOffer[playerid]][pPhousekey] == HouseID[playerid])
									{
										PlayerInfo[HouseOffer[playerid]][pPhousekey] = 0;
									}
									else
									{
										PlayerInfo[HouseOffer[playerid]][pPhousekey2] = 0;
									}
									dini_Set(FileName, "Owner", GetName(playerid));
									format(HouseInfo[PlayerInfo[playerid][pPhousekey]][hOwner], MAX_PLAYER_NAME, "%s", GetName(playerid));
									format(string, sizeof(string), "{00F200}[House]{F0CC00}\n%s\nRent: $%d\nLevel: %d\nID: %d\nType /rentroom to rent a room", HouseInfo[PlayerInfo[playerid][pPhousekey]][hOwner],HouseInfo[PlayerInfo[playerid][pPhousekey]][hRent], HouseInfo[PlayerInfo[playerid][pPhousekey]][hLevel], PlayerInfo[playerid][pPhousekey]);
	         						UpdateDynamic3DTextLabelText(house2[PlayerInfo[playerid][pPhousekey]], COLOR_DCHAT, string);
									HouseOffer[playerid] = 999;
									HousePrice[playerid] = 0;
									HouseID[playerid] = 0;
									UseAcceptTimer[playerid] = 1;
									SetTimerEx("UseAccept",60*1000,0,"i",playerid);
									SaveHouse(PlayerInfo[playerid][pPhousekey]);
								}
								else
								{
									format(string, sizeof(string), "* You accepted to buy the House for $%d from %s.",HousePrice[playerid],giveplayer);
									SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
									format(string, sizeof(string), "* %s accepted your to buy your House, and you received $%d.",sendername,HousePrice[playerid]);
									SendClientMessage(HouseOffer[playerid], COLOR_LIGHTBLUE, string);
									format(string, sizeof(string), "%s has accepted to buy the House from %s for $%d", sendername,giveplayer,HousePrice[playerid]);
									PayLog(string);
									PlayerInfo[HouseOffer[playerid]][pCash] += HousePrice[playerid];
									PlayerInfo[playerid][pCash] = PlayerInfo[playerid][pCash]-HousePrice[playerid];
									GivePlayerMoney(playerid, -HousePrice[playerid]);
									PlayerInfo[playerid][pPhousekey2] = HouseID[playerid];
									if(PlayerInfo[HouseOffer[playerid]][pPhousekey] == HouseID[playerid])
									{
										PlayerInfo[HouseOffer[playerid]][pPhousekey] = 0;
									}
									else
									{
										PlayerInfo[HouseOffer[playerid]][pPhousekey2] = 0;
									}
									dini_Set(FileName, "Owner", GetName(playerid));
									format(HouseInfo[PlayerInfo[playerid][pPhousekey2]][hOwner], MAX_PLAYER_NAME, "%s", GetName(playerid));
									format(string, sizeof(string), "{00F200}[House]{F0CC00}\n%s\nRent: $%d\nLevel: %d\nID: %d\nType /rentroom to rent a room", HouseInfo[PlayerInfo[playerid][pPhousekey2]][hOwner],HouseInfo[PlayerInfo[playerid][pPhousekey2]][hRent], HouseInfo[PlayerInfo[playerid][pPhousekey2]][hLevel], PlayerInfo[playerid][pPhousekey2]);
	         						UpdateDynamic3DTextLabelText(house2[PlayerInfo[playerid][pPhousekey2]], COLOR_DCHAT, string);
									HouseOffer[playerid] = 999;
									HousePrice[playerid] = 0;
									HouseID[playerid] = 0;
									UseAcceptTimer[playerid] = 1;
									SetTimerEx("UseAccept",60*1000,0,"i",playerid);
									SaveHouse(PlayerInfo[playerid][pPhousekey2]);
								}
								return 1;
							}
							else
							{
							    SendClientMessage(playerid, COLOR_GRAD1, "   You're too far away !");
							    return 1;
							}
						}
						return 1;
					}
					else
					{
					    SendClientMessage(playerid, COLOR_GREY, "   You can't afford that !");
					    return 1;
					}
			    }
			    else
			    {
			        SendClientMessage(playerid, COLOR_GREY, "   Nobody offered you any House !");
			        return 1;
			    }
			}
			else { return 1; }
		}
		return 1;
	}
	if(strcmp(cmdtext, "/gate", true) == 0)
	{
 		if(IsPlayerInRangeOfPoint(playerid,9,1865.70,-1849.68,11.61))
        { //MechanicINHQ GATE
            if(IsAMechanic(playerid))
			{
            if(mechanicgate1 == 0)
            {
                mechanicgate1 = 1;
            	MoveDynamicObject(mechanicgatesobj, 1865.70, -1849.68, 11.61, 1.500000);
            	format(string, sizeof(string), "* %s Pushes the button on their remote to open the gate.", sendername);
            	SendClientMessage(playerid, COLOR_RED, "Mechanic Gate is closing...");
            	return 1;
			}
			else
			{
			    mechanicgate1 = 0;
			    MoveDynamicObject(mechanicgatesobj, 1865.70, -1849.68, 6.61, 1.500000);
			    SendClientMessage(playerid, COLOR_LIGHTBLUE, "Mechanic Gate is opening...");
			    return 1;
				}
        	}
        }


	    if(IsPlayerInRangeOfPoint(playerid,9,1299.96,-1862.98,12.54))
        { //Mechanic GATE
            if(IsAMechanic(playerid))
			{
            if(mechanicgate == 0)
            {
                mechanicgate = 1;
            	MoveDynamicObject(mechanicgateobj, 1299.96, -1862.98, 12.54, 1.500000);
            	format(string, sizeof(string), "* %s Pushes the button on their remote to open the gate.", sendername);
            	SendClientMessage(playerid, COLOR_RED, "Mechanic Gate is closing...");
            	return 1;
			}
			else
			{
			    mechanicgate = 0;
			    MoveDynamicObject(mechanicgateobj, 1299.96, -1862.98, 7.54, 1.500000);
			    SendClientMessage(playerid, COLOR_LIGHTBLUE, "Mechanic Gate is opening...");
			    return 1;
				}
        	}
        }
	    if(IsPlayerInRangeOfPoint(playerid,9,1588.3058,-1637.9652,13.4227))
		{ //Police Gate
		    if(!IsACop(playerid) || IsAnAgent(playerid)) return SendClientMessage(playerid,COLOR_GREY,"   You are not a member of the LSPD / SASD !");
	    	if(pdgategar==0)
		   	{
		    	pdgategar = 1;
	   			MoveDynamicObject(pdgaragegateobj, 1588.965698, -1637.882690, 7.710285, 1.50);
	   			format(string, sizeof(string), "* %s Pushes the button on their remote to Open/Close the gate.", sendername);
	   			return 1;
	   		}
	   		else if(pdgategar==1)
	  		{
	   			pdgategar = 0;
	   			MoveDynamicObject(pdgaragegateobj, 1588.965698, -1637.882690, 15.260185, 1.50);
	   				format(string, sizeof(string), "* %s Pushes the button on their remote to Open/Close the gate.", sendername);
	   				return 1;
	  		}
		}
		else if(IsPlayerInRangeOfPoint(playerid,9,96.8500, 1923.4334, 15.3518))
  		{ //Prison Gate
    		if(!IsACop(playerid) && PlayerInfo[playerid][pMember] != 5 || IsAnAgent(playerid)) return SendClientMessage(playerid,COLOR_GREY,"   You are not a member of the LSPD / SASD / DoC !");
      		if(Prison_Buttons[GateOpened] == 0)
		    {
		        MoveDynamicObject(Prison_Buttons[PrisonGate], 96.808670, 1923.5, 16.234968, 1.50);
		        format(string, sizeof(string), "* %s Pushes the button on their remote to open the gate.", sendername);
		        Prison_Buttons[GateOpened] = 1;
				Prison_Buttons[GateTimerID]= SetTimer("PrisonGateCheck", 60000, 0);
				return 1;
		    }
		    else
		    {
		        MoveDynamicObject(Prison_Buttons[PrisonGate], 96.808670, 1920.512817, 16.234968, 1.50);
		        format(string, sizeof(string), "* %s Pushes the button on their remote to open the gate.", sendername);
		        Prison_Buttons[GateOpened] = 0;
				KillTimer(Prison_Buttons[GateTimerID]);
				return 1;
		    }
        }
        else if(IsPlayerInRangeOfPoint(playerid,9,1642.9678,-1714.9400,15.6028))
        { //FBI GATE
            if(IsAnAgent(playerid))
			{
            if(fbigateopen == 0)
            {
                fbigateopen = 1;
            	MoveDynamicObject(FBIGate, 1643.4106, -1714.7389, 15.6083, 1.500000);
            	format(string, sizeof(string), "* %s Pushes the button on their remote to open the gate.", sendername);
            	SendClientMessage(playerid, COLOR_RED, "FBI Gate is closing...");
            	return 1;
			}
			else
			{
			    fbigateopen = 0;
			    MoveDynamicObject(FBIGate, 1643.4106, -1714.7389, 9.6083, 1.500000);
			    SendClientMessage(playerid, COLOR_LIGHTBLUE, "FBI Gate is opening...");
			    return 1;
				}
        	}
        }
		/*else if(IsPlayerInRangeOfPoint(playerid, 12.0, -80.057670593262, -352.7497253418, 3.2030787467957))
        { //Doc Gate
           	if(IsASoldier(playerid)) return SendClientMessage(playerid,COLOR_GREY,"   You are not a member of the Department of Correction !");
            if(ssgateopen == 0)
            {
                ssgateopen = 1;
            	MoveDynamicObject(ssgate, -80.057670593262, -352.7497253418, 7.6630787467957, 1.500000);
            	format(string, sizeof(string), "* %s Pushes the button on their remote to open the gate.", sendername);
            	return 1;
			}
			else
			{
			    ssgateopen = 0;
			    MoveDynamicObject(ssgate, -80.057670593262, -352.7497253418, 3.2030787467957, 1.500000);
			    return 1;
			}
        }*/
		return 1;
	}
