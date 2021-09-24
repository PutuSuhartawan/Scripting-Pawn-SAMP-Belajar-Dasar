#define Info(%1,%2) SendClientMessageEx(%1, -1, ""LBLUE"INFO: "WHITE_E""%2)
#define Info(%1,%2) SendClientMessageEx(%1, -1, ""LBLUE"INFO: "WHITE_E""%2)

new rands;
new rands2;

new cp[MAX_PLAYERS];

new Tflint[2];
new TollLv[2];
new pTollArea[4];
/////////VEHICLES || PLANES ////////////

new pilotvehs[9] =
{ 460, 511, 512, 513, 519, 553, 577, 592, 593 };

public OnGameModeInit()
{
  
	//Toll - Flint
	CreateObject(8168, 61.25604, -1533.39465, 6.10425,   0.00000, 0.00000, 9.92526);
	CreateObject(8168, 40.96660, -1529.57251, 6.10425,   0.00000, 0.00000, 188.57129);
	CreateObject(966, 35.88975, -1526.00964, 4.24106,   0.00000, 0.00000, 270.67566);
	CreateObject(966, 67.09373, -1536.82751, 3.99106,   0.00000, 0.00000, 87.33780);
	CreateObject(973, 52.97949, -1531.92529, 5.09049,   0.00000, 0.00000, 352.06006);
	CreateObject(973, 49.04207, -1531.50659, 5.17587,   0.00000, 0.00000, 352.05688);

	//Toll - LV
	CreateObject(8168, 1789.83203, 703.18945, 15.84637,   0.00000, 3.00000, 99.24951);
	CreateObject(8168, 1784.83350, 703.94800, 16.07064,   0.00000, 357.00000, 278.61096);
	CreateObject(966, 1781.41223, 697.32532, 14.63691,   0.00000, 0.00000, 348.09009);
	CreateObject(966, 1793.42896, 709.87982, 13.63691,   0.00000, 0.00000, 169.43665);
	CreateObject(973, 1771.58691, 702.35260, 15.03000,   0.00000, 0.00000, 131.87990);
	CreateObject(973, 1804.35840, 710.90863, 13.90900,   0.00000, 0.00000, 206.40012);
	CreateObject(970, 1781.71448, 699.19360, 14.93310,   0.00000, 0.00000, 79.26010);
	CreateObject(970, 1792.94360, 707.78748, 14.22510,   0.00000, 0.00000, 79.80003);

	Tflint[0] = CreateDynamicObject(968, 35.838928222656, -1525.9034423828, 5.0012145042419, 0.000000, -90.000000, 270.67565917969, -1);
	Tflint[1] = CreateDynamicObject(968, 67.116600036621, -1536.8218994141, 4.7504549026489, 0.000000, -90.000000, 87.337799072266, -1);

	TollLv[0] = CreateDynamicObject(968, 1781.4133300781, 697.31750488281, 15.420023918152, 0.000000, -90.000000, 348.10229492188, -1);
	TollLv[1] = CreateDynamicObject(968, 1793.6700439453, 709.84631347656, 14.405718803406, 0.000000, -90.000000, 169.43664550781, -1);
	
  
	pTollArea[0] = CreateDynamicSphere(40.3993, -1522.9064, 5.1910, 4.0, -1, -1);
	pTollArea[1] = CreateDynamicSphere(62.3336, -1540.1075, 5.0645, 4.0, -1, -1);
	pTollArea[2] = CreateDynamicSphere(1795.9447, 704.2550, 15.0006, 4.0, -1, -1);
	pTollArea[3] = CreateDynamicSphere(1778.9886, 702.6728, 15.2574, 4.0, -1, -1);
  
  return 1;
}


//Close Toll

public F1CloseToll(playerid)
{
	SetDynamicObjectRot(Tflint[0], 0.000000, -90.000000, 270.67565917969);
	return 1;
}
public F2CloseToll(playerid)
{
	SetDynamicObjectRot(Tflint[1], 0.000000, -90.000000, 87.337799072266);
	return 1;
}
public LV1CloseToll(playerid)
{
	SetDynamicObjectRot(TollLv[0], 0.000000, -90.000000, 348.10229492188);
	return 1;
}
public LV2CloseToll(playerid)
{
	SetDynamicObjectRot(TollLv[1], 0.000000, -90.000000, 169.43664550781);
	return 1;
}
public ClearPlayerAnim(playerid)
{
	ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.0, 0, 0, 0, 0, 0, 1);
}
public DCC_OnMessageCreate(DCC_Message:message)
{
	new realMsg[100], msg[128];
    DCC_GetMessageContent(message, realMsg, 100);
    new bool:IsBot;
    new DCC_Channel:channel;
 	DCC_GetMessageChannel(message, channel);
    new DCC_User:author;
	DCC_GetMessageAuthor(message, author);
    DCC_IsUserBot(author, IsBot);
    if(channel == g_Discord_Chat && !IsBot) //!IsBot will block BOT's message in game
    {
        new user_name[32 + 1], str[152];
       	DCC_GetUserName(author, user_name, 32);
        format(str,sizeof(str), "{8a6cd1}[DISCORD] {aa1bb5}%s: {ffffff}%s",user_name, realMsg);
        SendClientMessageToAll(-1, str);
    }
    return 1;
}

public DelayedKick(playerid)
{
    if (!IsPlayerConnected(playerid)) return 1;
    Kick(playerid);
    return 1;
}

public OnPlayerEnterDynamicArea(playerid, areaid)
{
	//butcher
    if(areaid == meatsp)
	{
	    if(!GetPVarInt(playerid,"OnWork")) 
	    {
	    	ShowPlayerDialog(playerid,D_WORK,DIALOG_STYLE_MSGBOX,"Butcher Job","Do you want to start working on the Assembly line?","Yes","");
	    }
	    else ShowPlayerDialog(playerid,D_WORK,DIALOG_STYLE_MSGBOX,"Butcher Job","Do you want to finish working on the Assembly line?","Yes","");
	}
    foreach(new i : Player)
	{
	    if(GetPVarType(i, "BBArea"))
	    {
	        if(areaid == GetPVarInt(i, "BBArea"))
	        {
	            new station[256];
	            GetPVarString(i, "BBStation", station, sizeof(station));
	            if(!isnull(station))
				{
					PlayStream(playerid, station, GetPVarFloat(i, "BBX"), GetPVarFloat(i, "BBY"), GetPVarFloat(i, "BBZ"), 30.0, 1);
				 	SendClientMessage(playerid, -1, "you enter boombox area");
	            }
				return 1;
	        }
	    }
	}
	for(new i; i < sizeof(pTollArea); i++)
	{
		if(areaid == pTollArea[i] && IsPlayerInAnyVehicle(playerid))
		{
			GameTextForPlayer(playerid, "~w~Pay Toll Area~n~~w~ Type ~r~'/paytoll' ~w~Or Press~r~ H", 1000, 3);
		}
	}
	return 1;
}


public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
  	if(newkeys == KEY_CROUCH)
   	{
      	if(IsPlayerInAnyVehicle(playerid))
      	{
        	return callcmd::paytoll(playerid);
      	}
   	}
}


//Open Toll
CMD:paytoll(playerid)
{
	if(IsPlayerInRangeOfPoint(playerid, 3.0, 40.3993, -1522.9064, 5.1910))
	{
		SetDynamicObjectRot(Tflint[0], 0.000000, 0.000000, 270.67565917969);
		GivePlayerMoneyEx(playerid, -50);
		GameTextForPlayer(playerid, "~w~Good~Y~Bye", 2000, 1);
		Info(playerid, "You Has Paid "GREEN_E"$50.0"WHITE_E" To open toll"RED_E" - Good Bye");
		SetTimer("F1CloseToll", 5500, 0);
	}
	else if(IsPlayerInRangeOfPoint(playerid, 3.0, 62.3336, -1540.1075, 5.0645))
	{
		SetDynamicObjectRot(Tflint[1], 0.000000, 0.000000, 87.337799072266);
		GivePlayerMoneyEx(playerid, -50);
		GameTextForPlayer(playerid, "~w~Good~Y~Bye", 2000, 1);
		Info(playerid, "You Has Paid "GREEN_E"$50.0"WHITE_E" To open toll"RED_E" - Good Bye");
		SetTimer("F2CloseToll", 5500, 0);
	}
	//LV toll
	else if(IsPlayerInRangeOfPoint(playerid, 3.0, 1795.9447, 704.2550, 15.0006))
	{
		SetDynamicObjectRot(TollLv[1], 0.000000, 0.000000, 169.43664550781);
		GivePlayerMoneyEx(playerid, -50);
		GameTextForPlayer(playerid, "~w~Good~Y~Bye", 2000, 1);
		Info(playerid, "You Has Paid "GREEN_E"$50.0"WHITE_E" To open toll"RED_E" - Good Bye");
		SetTimer("LV1CloseToll", 5500, 0);
	}
	else if(IsPlayerInRangeOfPoint(playerid, 3.0, 1778.9886, 702.6728, 15.2574))
	{
		SetDynamicObjectRot(TollLv[0], 0.000000, 0.000000, 348.10229492188);
		GivePlayerMoneyEx(playerid, -50);
		GameTextForPlayer(playerid, "~w~Good~Y~Bye", 2000, 1);
		Info(playerid, "You Has Paid "GREEN_E"$50.0"WHITE_E" To open toll"RED_E" - Good Bye");
		SetTimer("LV2CloseToll", 5500, 0);
	}
	return 1;
}
