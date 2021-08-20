
//Text
new Text:Rp;
new Text:sen;
new Text:koma2;
//HBE
new Bar:phealth[MAX_PLAYERS] = {INVALID_BAR_ID, ...};
new Bar:parmor[MAX_PLAYERS] = {INVALID_BAR_ID, ...};
new PlayerText:HBEO[MAX_PLAYERS];
new PlayerText:HBEName[MAX_PLAYERS];
//NPC Bus
new NPCBedjo;
new NPCSanusi;
new BusID[MAX_PLAYERS];
new PlayerSitting[MAX_PLAYERS];
new Float:Playerx[MAX_PLAYERS], Float:Playery[MAX_PLAYERS], Float:Playerz[MAX_PLAYERS], Float:Playera[MAX_PLAYERS], PlayerSkin[MAX_PLAYERS];
forward IsAtBlueBusStop(playerid);
forward IsAtBlackBusStop(playerid);
forward ResetView(playerid);
forward CPOff(playerid);
new Text:Time, Text:Date;
forward settime(playerid);


new Text:LBox[MAX_PLAYERS];
new Text:LLine1[MAX_PLAYERS];
new Text:LLine2[MAX_PLAYERS];
new Text:LLine3[MAX_PLAYERS];
new Text:LCredits[MAX_PLAYERS];
new LuX_SpeedoMeter[MAX_PLAYERS];

new lString[256];

enum ReadPositions{Float:ReadX,Float:ReadY,Float:ReadZ}
new Float:VehPosX[MAX_VEHICLES], Float:VehPosY[MAX_VEHICLES], Float:VehPosZ[MAX_VEHICLES];


public OnPlayerConnect(playerid)
{
  
	HBEO[playerid] = CreatePlayerTextDraw(playerid, 551.199829, 340.479858, "_");
	PlayerTextDrawLetterSize(playerid, HBEO[playerid], 0.449999, 1.600000);
	PlayerTextDrawTextSize(playerid, HBEO[playerid], 129.600006, 145.599990);
	PlayerTextDrawFont(playerid, HBEO[playerid], TEXT_DRAW_FONT_MODEL_PREVIEW);
	PlayerTextDrawUseBox(playerid, HBEO[playerid], true);
	PlayerTextDrawBoxColor(playerid, HBEO[playerid], 0);
	PlayerTextDrawBackgroundColor(playerid, HBEO[playerid], 0);
	PlayerTextDrawSetPreviewModel(playerid, HBEO[playerid], 0);
	PlayerTextDrawSetPreviewRot(playerid, HBEO[playerid], 334.000000, 0.000000, -20.000000, 1.000000);

	HBEName[playerid] = CreatePlayerTextDraw(playerid, 546.399841, 331.519897, "E");
	PlayerTextDrawLetterSize(playerid, HBEName[playerid], 0.425998, 1.712000);
	PlayerTextDrawAlignment(playerid, HBEName[playerid], 2);
	PlayerTextDrawColor(playerid, HBEName[playerid], -1);
	PlayerTextDrawUseBox(playerid, HBEName[playerid], true);
	PlayerTextDrawBoxColor(playerid, HBEName[playerid], 0);
	PlayerTextDrawSetShadow(playerid, HBEName[playerid], 0);
	PlayerTextDrawSetOutline(playerid, HBEName[playerid], 1);
	PlayerTextDrawBackgroundColor(playerid, HBEName[playerid], 51);
	PlayerTextDrawFont(playerid, HBEName[playerid], 0);
	PlayerTextDrawSetProportional(playerid, HBEName[playerid], 1);

	return 1;
}


public OnPlayerSpawn(playerid)
{
	/*/NPC Bus
	if(IsPlayerNPC(playerid))
    {
    	new npcname[MAX_PLAYER_NAME];
        GetPlayerName(playerid, npcname, sizeof(npcname));
        if(!strcmp(npcname, "Bedjo", true))
        {
            SetPlayerColor(playerid, 0xFFFFFF00);
			PutPlayerInVehicle(playerid, NPCBedjo, 0);
        	SetPlayerSkin(playerid, 253);
        	ResetPlayerWeapons(playerid);
        	BusText = CreateDynamic3DTextLabel("[NPC]Bedjo_Wijoyo", COLOR_WHITE, 0, 0, -20, 25, playerid);
			Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, BusText , E_STREAMER_ATTACH_OFFSET_Z, 0.25);
        }
        if(!strcmp(npcname, "Sanusi", true))
        {
            SetPlayerColor(playerid, 0xFFFFFF00);
			PutPlayerInVehicle(playerid, NPCSanusi, 0);
        	SetPlayerSkin(playerid, 7);
        	ResetPlayerWeapons(playerid);
        	BusText1 = CreateDynamic3DTextLabel("[NPC]Sanusi_Wicaksono", COLOR_WHITE, 0, 0, -20, 25, playerid);
			Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, BusText1 , E_STREAMER_ATTACH_OFFSET_Z, 0.25);
        }
        return 1;
    }*/
    if(!gPlayerLogged{playerid})
    {
        SendClientMessageEx(playerid, COLOR_WHITE, "ERROR: You are not logged in!");
        Kick(playerid);
        return 1;
	}
	//hunger system
	PlayerTextDrawShow(playerid, HBEName[playerid]);
 	ShowProgressBarForPlayer(playerid, phealth[playerid]);
	ShowProgressBarForPlayer(playerid, parmor[playerid]);
	ShowProgressBarForPlayer(playerid, hungry[playerid]);
	ShowProgressBarForPlayer(playerid, tired[playerid]);
	ShowProgressBarForPlayer(playerid, clean[playerid]);
//	SetProgressBarColor(hungry[playerid], 0x00FF0033);
//	SetProgressBarColor(tired[playerid], 0x00FF0033);
//	SetProgressBarColor(clean[playerid], 0x00FF0033);
	TextDrawShowForPlayer(playerid, BSText[0]);
	TextDrawShowForPlayer(playerid, BSText[1]);
	TextDrawShowForPlayer(playerid, BSText[2]);
	TextDrawShowForPlayer(playerid, BSText[3]);
	TextDrawShowForPlayer(playerid, BSText[4]);
	TextDrawShowForPlayer(playerid, BSText[5]);
	TextDrawShowForPlayer(playerid, BSText[6]);
	TextDrawShowForPlayer(playerid, BSText[7]);
	FirstSpawn[playerid]+=1;
	if(FirstSpawn[playerid] == 1)
	{
		PBHTimer[playerid] = SetTimerEx("ProgressBarHunger", 200000, true, "i", playerid);
		SetPVarInt(playerid, "HungerBar", 1);
		SetPVarInt(playerid, "hTimerOn", 0);

		PBBTimer[playerid] = SetTimerEx("ProgressBarEnergy", 210000, true, "i", playerid);
		SetPVarInt(playerid, "EnergyBar", 1);
		SetPVarInt(playerid, "eTimerOn", 0);

		PBETimer[playerid] = SetTimerEx("ProgressBarBladder", 250000, true, "i", playerid);
		SetPVarInt(playerid, "BladderBar", 1);
		SetPVarInt(playerid, "bTimerOn", 0);

		PBCTimer[playerid] = SetTimerEx("ProgressBarCondition", 200000, true, "i", playerid);
		SetPVarInt(playerid, "ConditionBar", 1);
		SetPVarInt(playerid, "cTimerOn", 0);
	}
//	PlayerTextDrawHide(playerid, HBEO[playerid]);
 	PlayerTextDrawSetPreviewModel(playerid, HBEO[playerid], GetPlayerSkin(playerid));
 	PlayerTextDrawShow(playerid, HBEO[playerid]);
	Streamer_Update(playerid);
	//Lumberjack Job
	if(PlayerInfo[playerid][pLumber] == 5)
	{
		DisablePlayerCheckpoint(playerid);
		SetPlayerCheckpoint(playerid,-1060.3816,-1195.4048,129.5461,5.0);
		SendClientMessage(playerid,COLOR_GREEN,"Antarkan Kayu yang sudah kamu tebang ke checkpoint");
	}
	if(GetPVarInt(playerid, "NGPassenger") == 1)
	{
	    new Float:X, Float:Y, Float:Z;
	    GetVehiclePos(GetPVarInt(playerid, "NGPassengerVeh"), X, Y, Z);
	    AC_BS_SetPlayerPos(playerid, (X-2.557), (Y-3.049), Z);
	    SetPlayerWeaponsEx(playerid);
        givePlayerValidWeapon(playerid, 46, AMMO_MELEE);
        SetPlayerSkin(playerid, GetPVarInt(playerid, "NGPassengerSkin"));
        AC_BS_SetPlayerHealth(playerid, GetPVarFloat(playerid, "NGPassengerHP"));
        PlayerInfo[playerid][pHealth] = GetPVarFloat(playerid, "NGPassengerHP");
        AC_BS_SetPlayerArmour(playerid, GetPVarFloat(playerid, "NGPassengerArmor"));
		PlayerInfo[playerid][pArmor] = GetPVarFloat(playerid, "NGPassengerArmor");
		DeletePVar(playerid, "NGPassenger");
	    DeletePVar(playerid, "NGPassengerVeh");
		DeletePVar(playerid, "NGPassengerArmor");
		DeletePVar(playerid, "NGPassengerHP");
		DeletePVar(playerid, "NGPassengerSkin");
	    return 1;
	}
	if(InsideShamal[playerid] != INVALID_VEHICLE_ID)
	{
		AC_BS_SetPlayerPos(playerid, GetPVarFloat(playerid, "air_Xpos"), GetPVarFloat(playerid, "air_Ypos"), GetPVarFloat(playerid, "air_Zpos"));
		SetPlayerFacingAngle(playerid, GetPVarFloat(playerid, "air_Rpos"));
		AC_BS_SetPlayerHealth(playerid, GetPVarFloat(playerid, "air_HP"));
		PlayerInfo[playerid][pHealth] = GetPVarFloat(playerid, "air_HP");
		AC_BS_SetPlayerArmour(playerid, GetPVarFloat(playerid, "air_Arm"));
		PlayerInfo[playerid][pArmor] = GetPVarFloat(playerid, "air_Arm");
		SetPlayerWeaponsEx(playerid);
		SetPlayerToTeamColor(playerid);
		SetPlayerSkin(playerid, PlayerInfo[playerid][pModel]);

		DeletePVar(playerid, "air_Xpos");
		DeletePVar(playerid, "air_Ypos");
		DeletePVar(playerid, "air_Zpos");
		DeletePVar(playerid, "air_Rpos");
		DeletePVar(playerid, "air_HP");
		DeletePVar(playerid, "air_Arm");

		SetCameraBehindPlayer(playerid);
		AC_BS_SetPlayerVirtualWorld(playerid, InsideShamal[playerid]);
		return AC_BS_SetPlayerInterior(playerid, 1);
	}
	SyncPlayerTime(playerid);
	SetPVarInt(playerid, "AdminProtect", 0);
    //if(IsPlayerNPC(playerid)) return 1;
	STDPlayer[playerid] = 0;
	gTeam[playerid] = PlayerInfo[playerid][pTeam];

	if(!gPlayerLogged{playerid}) return Kick(playerid);
	SetPlayerSpawn(playerid);
	SetPlayerWeapons(playerid);
	SetPlayerToTeamColor(playerid);

	CheckPH(playerid);
    TogglePlayerControllable(playerid, 1);
    PlayerTextDrawHide(playerid, HBEO[playerid]);
 	PlayerTextDrawSetPreviewModel(playerid, HBEO[playerid], GetPlayerSkin(playerid));
 	PlayerTextDrawShow(playerid, HBEO[playerid]);
	return 1;
}


public OnGameModeInit()
{
	SetTimer("CheckGate", 1000, true);
	SetTimer("AutoPark", 60000*5, true);
	SetTimer("antiCheat", 300, true);
	SetTimer("HBE", 300, true);
	SetTimer("PLANTUPDATE", 60000*5, true);
	AntiDeAMX();
	djson_OnGameModeInit();
	ServerLocked = false;
	/*/NPC Bus
	//NPCs
	ConnectNPC("Bedjo","Bus");
	ConnectNPC("Sanusi","Bus2");*/

	new String[1000];
	//CheckPoint Door
	//
	toylist = LoadModelSelectionMenu("toylist.txt");
	vtoylist = LoadModelSelectionMenu("vtoylist.txt");
	skinlist = LoadModelSelectionMenu("skins.txt");
	FACTIONSKIN = LoadModelSelectionMenu("skins.txt");
	toy1000list = LoadModelSelectionMenu("toys1000.txt");

	CheckFiles();
    SetTimer("settime",1000,true);
    BUD::Setting(opt.Database, "iAnims.db" );
	BUD::Setting(opt.Asynchronous, true );
	BUD::Setting(opt.KeepAliveTime, 3000 );
	BUD::Initialize();
	BUD::VerifyColumn("speed", BUD::TYPE_FLOAT, IANIM_DEFAULT_SPEED);
	BUD::VerifyColumn("loop", BUD::TYPE_NUMBER, IANIM_DEFAULT_LOOP);
	BUD::VerifyColumn("lockx", BUD::TYPE_NUMBER, IANIM_DEFAULT_LOCKX);
	BUD::VerifyColumn("locky", BUD::TYPE_NUMBER, IANIM_DEFAULT_LOCKY);
	BUD::VerifyColumn("freeze", BUD::TYPE_NUMBER, IANIM_DEFAULT_FREEZE);
	BUD::VerifyColumn("time", BUD::TYPE_NUMBER, IANIM_DEFAULT_TIME);
	BUD::VerifyColumn("forcesync", BUD::TYPE_NUMBER, IANIM_DEFAULT_FORCESYNC);
	#if defined LOAD_ON_START
	new
	dbstr[64];

	for(new i = 1; i < MAX_ANIMS; i++)
	{
		format(dbstr, sizeof( dbstr ), "Animation%d", i);
		if( !BUD::IsNameRegistered( dbstr ) )
		{
			BUD::RegisterName(dbstr, dbstr);
			iAnim_AnimData[ i ][ iAnim_Speed ] = IANIM_DEFAULT_SPEED;
			iAnim_AnimData[ i ][ iAnim_Loop ] = IANIM_DEFAULT_LOOP;
			iAnim_AnimData[ i ][ iAnim_Lockx ] = IANIM_DEFAULT_LOCKX;
			iAnim_AnimData[ i ][ iAnim_Locky ] = IANIM_DEFAULT_LOCKY;
			iAnim_AnimData[ i ][ iAnim_Freeze ] = IANIM_DEFAULT_FREEZE;
			iAnim_AnimData[ i ][ iAnim_Time ] = IANIM_DEFAULT_TIME;
			iAnim_AnimData[ i ][ iAnim_ForceSync ] = IANIM_DEFAULT_FORCESYNC;
		}
		else
		{
			BUD::MultiGet( i , "fiiiiii",
			"speed", iAnim_AnimData[ i ][ iAnim_Speed ],
			"loop", iAnim_AnimData[ i ][ iAnim_Loop ],
			"lockx", iAnim_AnimData[ i ][ iAnim_Lockx ],
			"locky", iAnim_AnimData[ i ][ iAnim_Locky ],
			"freeze", iAnim_AnimData[ i ][ iAnim_Freeze ],
			"time", iAnim_AnimData[ i ][ iAnim_Time ],
			"forcesync",iAnim_AnimData[ i ][ iAnim_ForceSync ]
			);
		}
	}
	#endif
	//Animations
	txtAnimHelper = TextDrawCreate(542.000000, 417.000000, "~r~~k~~PED_SPRINT~ ~w~untuk menghentikan Animations");
	TextDrawUseBox(txtAnimHelper, 0);
	TextDrawFont(txtAnimHelper, 2);
	TextDrawSetShadow(txtAnimHelper,0); // no shadow
	TextDrawSetOutline(txtAnimHelper,1); // thickness 1
	TextDrawBackgroundColor(txtAnimHelper,0x000000FF);
	TextDrawColor(txtAnimHelper,0xFFFFFFFF);
	TextDrawAlignment(txtAnimHelper,3); // align right


	//Body Status
	BSText[0] = TextDrawCreate(687.599609, 333.766571, "usebox");
	TextDrawLetterSize(BSText[0], 0.000000, 14.584074);
	TextDrawTextSize(BSText[0], 469.200042, 0.000000);
	TextDrawAlignment(BSText[0], 1);
	TextDrawColor(BSText[0], 0);
	TextDrawUseBox(BSText[0], true);
	TextDrawBoxColor(BSText[0], 102);
	TextDrawSetShadow(BSText[0], 0);
	TextDrawSetOutline(BSText[0], 0);
	TextDrawFont(BSText[0], 0);

	BSText[1] = TextDrawCreate(510.399993, 344.213348, "-");
	TextDrawLetterSize(BSText[1], 5.769995, 1.376000);
	TextDrawAlignment(BSText[1], 1);
	TextDrawColor(BSText[1], -1);
	TextDrawSetShadow(BSText[1], 0);
	TextDrawSetOutline(BSText[1], 1);
	TextDrawBackgroundColor(BSText[1], 51);
	TextDrawFont(BSText[1], 1);
	TextDrawSetProportional(BSText[1], 1);

	BSText[2] = TextDrawCreate(541.599731, 433.066833, "hud:radar_diner");
	TextDrawLetterSize(BSText[2], 0.000000, 0.000000);
	TextDrawTextSize(BSText[2], 9.599988, 13.439994);
	TextDrawAlignment(BSText[2], 1);
	TextDrawColor(BSText[2], -1);
	TextDrawSetShadow(BSText[2], 0);
	TextDrawSetOutline(BSText[2], 0);
	TextDrawFont(BSText[2], 4);

	BSText[3] = TextDrawCreate(536.799560, 352.426727, "New Textdraw");
	TextDrawLetterSize(BSText[3], 0.449999, 1.600000);
	TextDrawTextSize(BSText[3], 14.400012, 21.653347);
	TextDrawAlignment(BSText[3], 1);
	TextDrawColor(BSText[3], -1);
	TextDrawUseBox(BSText[3], true);
	TextDrawBoxColor(BSText[3], 0);
	TextDrawSetShadow(BSText[3], 0);
	TextDrawSetOutline(BSText[3], 1);
	TextDrawBackgroundColor(BSText[3], -871318784);
	TextDrawFont(BSText[3], 5);
	TextDrawSetProportional(BSText[3], 1);
	TextDrawSetPreviewModel(BSText[3], 1240);
	TextDrawSetPreviewRot(BSText[3], 341.000000, 0.000000, 0.000000, 1.000000);

	BSText[4] = TextDrawCreate(538.399719, 401.707000, "hud:radar_dateFood");
	TextDrawLetterSize(BSText[4], -0.007199, -0.149333);
	TextDrawTextSize(BSText[4], 11.200010, 11.946665);
	TextDrawAlignment(BSText[4], 1);
	TextDrawColor(BSText[4], -1);
	TextDrawSetShadow(BSText[4], 0);
	TextDrawSetOutline(BSText[4], 0);
	TextDrawFont(BSText[4], 4);

	BSText[5] = TextDrawCreate(535.199829, 368.853393, "New Textdraw");
	TextDrawLetterSize(BSText[5], 0.449999, 1.600000);
	TextDrawTextSize(BSText[5], 16.800006, 23.146678);
	TextDrawAlignment(BSText[5], 1);
	TextDrawColor(BSText[5], -1);
	TextDrawUseBox(BSText[5], true);
	TextDrawBoxColor(BSText[5], 0);
	TextDrawSetShadow(BSText[5], 0);
	TextDrawSetOutline(BSText[5], 1);
	TextDrawBackgroundColor(BSText[5], -871318784);
	TextDrawFont(BSText[5], 5);
	TextDrawSetProportional(BSText[5], 1);
	TextDrawSetPreviewModel(BSText[5], 1242);
	TextDrawSetPreviewRot(BSText[5], 0.000000, 0.000000, 0.000000, 1.000000);

	BSText[6] = TextDrawCreate(537.599914, 413.653381, "New Textdraw");
	TextDrawLetterSize(BSText[6], 0.449999, 1.600000);
	TextDrawTextSize(BSText[6], 20.800050, 18.666669);
	TextDrawAlignment(BSText[6], 1);
	TextDrawColor(BSText[6], -1);
	TextDrawUseBox(BSText[6], true);
	TextDrawBoxColor(BSText[6], 0);
	TextDrawSetShadow(BSText[6], 0);
	TextDrawSetOutline(BSText[6], 0);
	TextDrawBackgroundColor(BSText[6], -871318784);
	TextDrawFont(BSText[6], 5);
	TextDrawSetProportional(BSText[6], 1);
	TextDrawSetPreviewModel(BSText[6], 2525);
	TextDrawSetPreviewRot(BSText[6], 343.000000, 0.000000, -110.000000, 1.000000);

	BSText[7] = TextDrawCreate(495.999847, 351.679931, "");
	TextDrawLetterSize(BSText[7], 0.169999, 2.279466);
	TextDrawAlignment(BSText[7], 1);
	TextDrawColor(BSText[7], -1);
	TextDrawUseBox(BSText[7], true);
	TextDrawBoxColor(BSText[7], 0);
	TextDrawSetShadow(BSText[7], 0);
	TextDrawSetOutline(BSText[7], 1);
	TextDrawBackgroundColor(BSText[7], 51);
	TextDrawFont(BSText[7], 2);
	TextDrawSetProportional(BSText[7], 1);

	sen = TextDrawCreate(580.000000, 80.000000, ".");
	TextDrawBackgroundColor(sen, 255);
	TextDrawFont(sen, 1);
	TextDrawLetterSize(sen, 0.549999, 2.200002);
	TextDrawColor(sen, 794437320);
	TextDrawSetOutline(sen, 1);
	TextDrawSetProportional(sen, 1);
	TextDrawSetSelectable(sen, 0);

	koma2 = TextDrawCreate(543.000000, 80.000000, ",");
	TextDrawBackgroundColor(koma2, 255);
	TextDrawFont(koma2, 0);
	TextDrawLetterSize(koma2, 0.549999, 2.200002);
	TextDrawColor(koma2, 794437320);
	TextDrawSetOutline(koma2, 1);
	TextDrawSetProportional(koma2, 1);
	TextDrawSetSelectable(koma2, 0);

	Kotak = TextDrawCreate(636.000000, 152.000000, ".");
	TextDrawBackgroundColor(Kotak, 255);
	TextDrawFont(Kotak, 1);
	TextDrawLetterSize(Kotak, 120.299995, 8.900002);
	TextDrawColor(Kotak, -1);
	TextDrawSetOutline(Kotak, 1);
	TextDrawSetProportional(Kotak, 1);
	TextDrawUseBox(Kotak, 1);
	TextDrawBoxColor(Kotak, 45);
	TextDrawTextSize(Kotak, 533.000000, 92.000000);
	TextDrawSetSelectable(Kotak, 0);

	/*Date = TextDrawCreate(532.000000, 4.000000, "14/01/2014");//Born ArWin14
	TextDrawBackgroundColor(Date, 255);
	TextDrawFont(Date, 1);
	TextDrawLetterSize(Date, 0.410000, 1.000000);
	TextDrawColor(Date, -1);
	TextDrawSetOutline(Date, 0);
	TextDrawSetProportional(Date, 1);
	TextDrawSetShadow(Date, 1);
	TextDrawSetSelectable(Date, 0);

	Time = TextDrawCreate(540.000000, 17.000000, "09:55:00");//Born ArWin14
	TextDrawBackgroundColor(Time, 255);
	TextDrawFont(Time, 1);
	TextDrawLetterSize(Time, 0.410000, 1.000000);
	TextDrawColor(Time, -1);
	TextDrawSetOutline(Time, 0);
	TextDrawSetProportional(Time, 1);
	TextDrawSetShadow(Time, 1);
	TextDrawSetSelectable(Time, 0);*/
	Date = TextDrawCreate(3.000000, 433.000000,"--");
	TextDrawBackgroundColor	(Date, 255);
	TextDrawFont(Date, 1);
	TextDrawLetterSize(Date, 0.40000, 1.400000);
	TextDrawColor(Date, -1);
	TextDrawSetOutline(Date, 1);
	TextDrawSetProportional(Date, 1);

	Time = TextDrawCreate(547.000000,28.000000,"--");
	TextDrawFont(Time,3);
	TextDrawLetterSize(Time, 0.40000, 1.400000);
 	TextDrawFont(Time , 2);
 	TextDrawSetOutline(Time , 1);
    TextDrawSetProportional(Time , 1);
	TextDrawBackgroundColor(Time, 255);
	TextDrawSetShadow(Time, 1);
	TextDrawColor(Time,0xFFFFFFFF);
	SetTimer("LuX_SpeedoMeterUp", UpdateConfig, 1);
    for(new v=0; v<MAX_VEHICLES; v++)
	{
    	LuX_ReadPosition(v);}
		for(new i; i<PLAYERS; i++)
		{
		AntiFlood_InitPlayer(i);
	//---------------------------------------------------------->
		LBox[i] = TextDrawCreate(155.000000, 350.000000, "_");
		TextDrawBackgroundColor(LBox[i], 255);
		TextDrawFont(LBox[i], 0);
		TextDrawLetterSize(LBox[i], 0.600000, 7.899996);
		TextDrawColor(LBox[i], 75);
		TextDrawSetOutline(LBox[i], 0);
		TextDrawSetProportional(LBox[i], 1);
		TextDrawSetShadow(LBox[i], 1);
		TextDrawUseBox(LBox[i], 1);
		TextDrawBoxColor(LBox[i], 0x000000AA);
		TextDrawTextSize(LBox[i], 345.000000, 0.000000);
		TextDrawSetSelectable(LBox[i], 0);

	//---------------------------------------------------------->

		LLine1[i] = TextDrawCreate(216.000000, 348.000000, "Saddler");
		TextDrawBackgroundColor(LLine1[i], 255);
		TextDrawFont(LLine1[i], 0);
		TextDrawLetterSize(LLine1[i], 0.539999, 1.500004);
		TextDrawColor(LLine1[i], -1);
		TextDrawSetOutline(LLine1[i], 0);
		TextDrawSetProportional(LLine1[i], 1);
		TextDrawSetShadow(LLine1[i], 1);
		TextDrawSetSelectable(LLine1[i], 0);

	//---------------------------------------------------------->
		LLine2[i] = TextDrawCreate(160.000000, 370.000000, "");
		TextDrawBackgroundColor(LLine2[i], 255);
		TextDrawFont(LLine2[i], 1);
		TextDrawLetterSize(LLine2[i], 0.539999, 1.500004);
		TextDrawColor(LLine2[i], -1);
		TextDrawSetOutline(LLine2[i], 0);
		TextDrawSetProportional(LLine2[i], 1);
		TextDrawSetShadow(LLine2[i], 1);
		TextDrawSetSelectable(LLine2[i], 0);
	//---------------------------------------------------------->

		LLine3[i] = TextDrawCreate(175.100000, 394.000000, "");
		TextDrawBackgroundColor(LLine3[i], 255);
		TextDrawFont(LLine3[i], 1);
		TextDrawLetterSize(LLine3[i], 0.539999, 1.500004);
		TextDrawColor(LLine3[i], -1);
		TextDrawSetOutline(LLine3[i], 0);
		TextDrawSetProportional(LLine3[i], 1);
		TextDrawSetShadow(LLine3[i], 1);
		TextDrawSetSelectable(LLine3[i], 0);

	//---------------------------------------------------------->

		GPS[i] = TextDrawCreate(11.999984, 322.560089, "Loading");
		TextDrawAlignment(GPS[i], 0);
		TextDrawBackgroundColor(GPS[i], 255);
		TextDrawFont(GPS[i], 1);
		TextDrawLetterSize(GPS[i], 0.449999, 1.600000);
		TextDrawColor(GPS[i], -1);
		TextDrawSetOutline(GPS[i], 0);
		TextDrawSetProportional(GPS[i], 1);
	}
	EnableStuntBonusForAll(0);
	new servergmtextstr[128];
	format(servergmtextstr, 128, "gamemodetext %s", SERVER_GM_TEXT);
	SendRconCommand(servergmtextstr); // DO NOT REMOVE THIS
    format(servergmtextstr, 128, "language %s", SERVER_GM_LANGUAGE);
    SendRconCommand(servergmtextstr);
	new String1[MAX_PLAYER_NAME];
	ShowPlayerMarkers(PLAYER_MARKERS_MODE_STREAMED);
	DisableInteriorEnterExits();
	LoadWorkshop();
 	LoadBizz();
	LoadFarm();
	LoadATM();
	LoadStock();
	LoadMaxLimit();
	LoadDynamicDoors();
	LoadDynamicMapIcons();
	LoadHouses();
	LoadGates();
	LoadcDealerships();
	LoadMod();
 	//LoadPlant();
	LoadBuy();
	LoadGYMObject();
	LoadRent();
	LoadObjects();
	LoadStuff();
	LoadElevatorStuff();
	LoadServerStats();
	LoadFamilies();

	for(new f = 0; f < sizeof(FamilyInfo); f++)
	{
		for(new fv = 0; fv < MAX_GANG_VEHICLES; fv++)
		{
		    FamilyVehicleInfo[f][fv][fvModelId] = 0;
			FamilyVehicleInfo[f][fv][fvSpawnx] = 0.0;
			FamilyVehicleInfo[f][fv][fvSpawny] = 0.0;
			FamilyVehicleInfo[f][fv][fvSpawnz] = 0.0;
			FamilyVehicleInfo[f][fv][fvSpawna] = 0.0;
			FamilyVehicleInfo[f][fv][fvPaintJob] = -1;
			FamilyVehicleInfo[f][fv][fvColor1] = 126;
			FamilyVehicleInfo[f][fv][fvColor2] = 126;
			FamilyVehicleInfo[f][fv][fvPrice] = 0;
			FamilyVehicleInfo[f][fv][fvFuel] = 100.0;
	    	FamilyVehicleInfo[f][fv][fvId] = INVALID_VEHICLE_ID;
		}
	}
	LoadFamiliesHQ();
	LoadMOTDs();
	ClearReports();
	SetNameTagDrawDistance(10.0);
	GiftAllowed = 1;
	News[hTaken1] = 0; News[hTaken2] = 0; News[hTaken3] = 0; News[hTaken4] = 0; News[hTaken5] = 0;
	format(String, sizeof(String), "Nothing");
	strmid(News[hAdd1], String, 0, strlen(String), 255);
	strmid(News[hAdd2], String, 0, strlen(String), 255);
	strmid(News[hAdd3], String, 0, strlen(String), 255);
	strmid(News[hAdd4], String, 0, strlen(String), 255);
	strmid(News[hAdd5], String, 0, strlen(String), 255);
	format(String1, sizeof(String1), "No-one");
	strmid(News[hContact1], String1, 0, strlen(String1), 255);
	strmid(News[hContact2], String1, 0, strlen(String1), 255);
	strmid(News[hContact3], String1, 0, strlen(String1), 255);
	strmid(News[hContact4], String1, 0, strlen(String1), 255);
	strmid(News[hContact5], String1, 0, strlen(String1), 255);
	format(objstore, sizeof(objstore), "MOLE: I got nothing, check back with me later.");
	format(cbjstore, sizeof(cbjstore), "HQ: There is nothing in your Vicinity, Out.");
	gettime(ghour, gminute, gsecond);
	FixHour(ghour);
	ghour = shifthour;

	if(!realtime)
	{
		SetWorldTime(wtime);
		gTime = wtime;
	}

	AllowInteriorWeapons(1);
	// CreatedCars check
	for(new i = 0; i < sizeof(CreatedCars); i++)
	{
		CreatedCars[i] = INVALID_VEHICLE_ID;
	}
	for(new v = 0; v < MAX_VEHICLES; v++)
	{
	    VehicleFuel[v] = 100.0;
	}
	// Player Class's
	for(new i = 0; i <= sizeof(Peds)-1; i++)
	{
		AddPlayerClass(Peds[i][0],1958.3783,1343.1572,1100.3746,269.1425,-1,-1,-1,-1,-1,-1);
	}
	//TextDrawTextSize(MsgBox, 602.000000, 0.000000);
	DisableInteriorEnterExits();
	//Sweeper
	SWEEPERPlate[0] = SWEEPER[0] = AddStaticVehicleEx(574, 1626.1691,-1896.3145,13.2765,357.4089, 1, 1, 1);
	SetVehicleNumberPlate(SWEEPERPlate[0], "SWEEPER");
	SWEEPERPlate[1] = SWEEPER[1] = AddStaticVehicleEx(574, 1622.7128,-1896.3400,13.2757,358.0077, 1, 1, 1);
	SetVehicleNumberPlate(SWEEPERPlate[1], "SWEEPER");
	SWEEPERPlate[2] = SWEEPER[2] = AddStaticVehicleEx(574, 1619.3044,-1896.3998,13.2737,359.5278, 1, 1, 1);
	SetVehicleNumberPlate(SWEEPERPlate[2], "SWEEPER");
	//Bus
	BusPlate[0] = BUS[0] = AddStaticVehicleEx(431, 1698.3337, -1496.5729, 13.4855, 359.1141, 3, 1, 1);
	SetVehicleNumberPlate(BusPlate[0], "BUS");
	BusPlate[1] = BUS[1] = AddStaticVehicleEx(431, 1698.2653, -1511.8468, 13.4872, 359.8352, 6, 1, 1);
	SetVehicleNumberPlate(BusPlate[1], "BUS");
	BusPlate[2] = BUS[2] = AddStaticVehicleEx(431, 1698.4172, -1526.7191, 13.4833, 0.4046, 2, 1, 1);
	SetVehicleNumberPlate(BusPlate[2], "BUS");

	//LSPD VEHICLES
	//Lincol Merah Putih
	LincolnMerah[1] = LSPDVehicles[30] = AddStaticVehicleEx(596,1602.3312,-1684.0071,5.6185,91.2188,3,1, VEHICLE_RESPAWN); // Cruiser
	SetVehicleNumberPlate(LincolnMerah[1], "LINCON-1");
	SetVehicleHealth(LincolnMerah[1], 2000.0);
	AddVehicleComponent(LincolnMerah[1], 1080);
	LincolnMerah[2] = LSPDVehicles[31] = AddStaticVehicleEx(596,1602.5184,-1687.9525,5.6098,89.0430,3,1, VEHICLE_RESPAWN); // Cruiser
	SetVehicleNumberPlate(LincolnMerah[2], "LINCON-2");
	SetVehicleHealth(LincolnMerah[2], 2000.0);
	AddVehicleComponent(LincolnMerah[2], 1080);
	LincolnMerah[3] = LSPDVehicles[32] = AddStaticVehicleEx(596,1602.3141,-1692.2067,5.6149,89.1927,3,1, VEHICLE_RESPAWN); // Cruiser
	SetVehicleNumberPlate(LincolnMerah[3], "LINCON-3");
	SetVehicleHealth(LincolnMerah[3], 2000.0);
	AddVehicleComponent(LincolnMerah[3], 1080);
	LincolnMerah[4] = LSPDVehicles[33] = AddStaticVehicleEx(596,1602.2833,-1696.3682,5.6286,90.2932,3,1, VEHICLE_RESPAWN); // Cruiser
	SetVehicleNumberPlate(LincolnMerah[4], "LINCON-4");
	SetVehicleHealth(LincolnMerah[4], 2000.0);
	AddVehicleComponent(LincolnMerah[4], 1080);
	LincolnMerah[5] = LSPDVehicles[34] = AddStaticVehicleEx(596,1602.1863,-1700.2629,5.6161,88.2802,3,1, VEHICLE_RESPAWN); // Cruiser
	SetVehicleNumberPlate(LincolnMerah[5], "LINCON-5");
	SetVehicleHealth(LincolnMerah[5], 2000.0);
	AddVehicleComponent(LincolnMerah[5], 1080);
	//Lincoln Ungu Putih
	LincolnUngu[1] = LSPDVehicles[35] = AddStaticVehicleEx(596,1595.1029,-1711.1693,5.6132,358.1242,134,1, VEHICLE_RESPAWN); // Cruiser
	SetVehicleNumberPlate(LincolnUngu[1], "LINCON-6");
	SetVehicleHealth(LincolnUngu[1], 2000.0);
	AddVehicleComponent(LincolnUngu[1], 1074);
	LincolnUngu[2] = LSPDVehicles[36] = AddStaticVehicleEx(596,1591.2061,-1711.1152,5.6060,357.9518,134,1, VEHICLE_RESPAWN); // Cruiser
	SetVehicleNumberPlate(LincolnUngu[2], "LINCON-7");
	SetVehicleHealth(LincolnUngu[2], 2000.0);
	AddVehicleComponent(LincolnUngu[2], 1074);
	LincolnUngu[3] = LSPDVehicles[37] = AddStaticVehicleEx(596,1587.8042,-1711.0640,5.6139,0.4377,134,1, VEHICLE_RESPAWN); // Cruiser
	SetVehicleNumberPlate(LincolnUngu[3], "LINCON-8");
	SetVehicleHealth(LincolnUngu[3], 2000.0);
	AddVehicleComponent(LincolnUngu[3], 1074);
	LincolnUngu[4] = LSPDVehicles[38] = AddStaticVehicleEx(596,1583.5166,-1710.9095,5.6262,357.2809,134,1, VEHICLE_RESPAWN); // Cruiser
	SetVehicleNumberPlate(LincolnUngu[4], "LINCON-9");
	SetVehicleHealth(LincolnUngu[4], 2000.0);
	AddVehicleComponent(LincolnUngu[4], 1074);
	//Adam Unit
	Cruiser[1] = LSPDVehicles[0] = AddStaticVehicleEx(596,1602.6895,-1668.1362,5.6290,88.5506,0,1, VEHICLE_RESPAWN); // Cruiser
	SetVehicleNumberPlate(Cruiser[1], "ADAM-1");
	SetVehicleHealth(Cruiser[1], 2000.0);
	AddVehicleComponent(Cruiser[2], 1074);
	Cruiser[2] = LSPDVehicles[1] = AddStaticVehicleEx(596,1602.6876,-1672.0906,5.6202,85.4490,0,1, VEHICLE_RESPAWN); // Cruiser
	SetVehicleNumberPlate(Cruiser[2], "ADAM-2");
	SetVehicleHealth(Cruiser[2], 2000.0);
	AddVehicleComponent(Cruiser[2], 1074);
	Cruiser[3] = LSPDVehicles[2] = AddStaticVehicleEx(596,1602.4028,-1675.8799,5.5399,88.2919,0,1, VEHICLE_RESPAWN); // Cruiser
	SetVehicleNumberPlate(Cruiser[3], "ADAM-3");
	SetVehicleHealth(Cruiser[3], 2000.0);
	AddVehicleComponent(Cruiser[3], 1074);
	Cruiser[4] = LSPDVehicles[3] = AddStaticVehicleEx(596,1602.3943,-1679.8274,5.5385,89.4124,0,1, VEHICLE_RESPAWN); // Cruiser
	SetVehicleNumberPlate(Cruiser[4], "ADAM-4");
	SetVehicleHealth(Cruiser[4], 2000.0);
	AddVehicleComponent(Cruiser[4], 1074);
	//Detective
	LSPDVehicles[4] = AddStaticVehicleEx(468,1545.6774,-1671.9430,5.5675,83.3683,1,99, VEHICLE_RESPAWN); // Sanchez
	LSPDVehicles[5] = AddStaticVehicleEx(445,1545.9200,-1676.2919,5.7573,88.8056,168,168, VEHICLE_RESPAWN); // Admiral
	LSPDVehicles[6] = AddStaticVehicleEx(482,1546.0643,-1680.3092,6.0089,90.3870,6,6, VEHICLE_RESPAWN); // Burrito
	LSPDVehicles[7] = AddStaticVehicleEx(426,1545.7401,-1684.4756,5.6338,89.4337,61,105, VEHICLE_RESPAWN); // Premier
	//KOPASSUS
	Kopassus[0] = LSPDVehicles[9] = AddStaticVehicleEx(601,1526.5850,-1644.1801,5.6494,180.3210,1,1, VEHICLE_RESPAWN); // Splashy
	SetVehicleNumberPlate(Kopassus[0], "KING-3");
	SetVehicleHealth(Kopassus[0], 10000.0);
	Kopassus[1] = LSPDVehicles[10] = AddStaticVehicleEx(601,1530.7244,-1644.2538,5.6494,179.6148,1,1, VEHICLE_RESPAWN); // Splashy
	SetVehicleNumberPlate(Kopassus[1], "KING-4");
	SetVehicleHealth(Kopassus[0], 10000.0);
	Kopassus[2] = LSPDVehicles[11] = AddStaticVehicleEx(427,1534.8553,-1644.8682,6.0226,180.7921,0,0, VEHICLE_RESPAWN); // Enforcer
	SetVehicleNumberPlate(Kopassus[2], "KING-5");
	SetVehicleHealth(Kopassus[2], 10000.0);
	Kopassus[3] = LSPDVehicles[12] = 	AddStaticVehicleEx(427,1538.9325,-1644.9508,6.0226,179.5991,0,0, VEHICLE_RESPAWN); // Enforcer
	SetVehicleNumberPlate(Kopassus[3], "KING-6");
	SetVehicleHealth(Kopassus[3], 10000.0);
	//RAPTOR UNIT
	Lincoln[2] = LSPDVehicles[13] = AddStaticVehicleEx(415,1578.2784,-1711.2347,5.6581,1.8089,7,7, VEHICLE_RESPAWN); // Cheetah
	SetVehicleNumberPlate(Lincoln[2], "RAPTOR-1");
	SetVehicleHealth(Lincoln[2], 2000.0);
	AddVehicleComponent(Lincoln[2], 1074);
	Lincoln[3] = LSPDVehicles[14] = AddStaticVehicleEx(541,1574.4041,-1710.9807,5.5237,1.5713,7,1, VEHICLE_RESPAWN); // Bullet
	SetVehicleNumberPlate(Lincoln[3], "RAPTOR-2");
	SetVehicleHealth(Lincoln[3], 2000.0);
	AddVehicleComponent(Lincoln[3], 1074);
	Lincoln[4] = LSPDVehicles[15] = AddStaticVehicleEx(451,1570.1910,-1710.7435,5.6189,358.7257,7,7, VEHICLE_RESPAWN); // Turismo
	SetVehicleNumberPlate(Lincoln[4], "RAPTOR-3");
	SetVehicleHealth(Lincoln[4], 2000.0);
	AddVehicleComponent(Lincoln[4], 1074);
	Lincoln[5] = LSPDVehicles[16] = AddStaticVehicleEx(411,1558.6840,-1710.7120,5.6177,0.0276,7,7, VEHICLE_RESPAWN); // Infernus
	SetVehicleNumberPlate(Lincoln[5], "RAPTOR-4");
	SetVehicleHealth(Lincoln[5], 2000.0);
	AddVehicleComponent(Lincoln[5], 1074);
}


public OnPlayerLogin(playerid, password[])
{
    new string[128];
        format(string, sizeof(string), "%s", GetPlayersName(playerid));
		PlayerTextDrawSetString(playerid, HBEName[playerid], string);
	    TextDrawShowForPlayer(playerid,Time);
		TextDrawShowForPlayer(playerid,Date);
		TextDrawShowForPlayer(playerid,sen);
		TextDrawShowForPlayer(playerid,koma2);
        TextDrawHideForPlayer(playerid, DescriptionText[playerid]);
		if(hungry[playerid] == INVALID_BAR_ID)
		{
			hungry[playerid] = CreateProgressBar(555.00, 404.00, 42.50, 9.19, 16711935, 100.0);
		}
		if(tired[playerid] == INVALID_BAR_ID)
		{
			tired[playerid] = CreateProgressBar(555.00, 437.00, 42.50, 7.19, 16711935, 100.0);
		}
		if(clean[playerid] == INVALID_BAR_ID)
		{
			clean[playerid] = CreateProgressBar(555.00, 421.00, 42.50, 7.19, 16711935, 100.0);
		}
		SetProgressBarValue(hungry[playerid], PlayerInfo[playerid][pHunger]);
		SetProgressBarValue(tired[playerid], PlayerInfo[playerid][pEnergi]);
		SetProgressBarValue(clean[playerid], PlayerInfo[playerid][pBladder]);

		phealth[playerid] = CreateProgressBar(555.00, 362.00, 42.50, 7.19, -16776961, 100.0);
		parmor[playerid] = CreateProgressBar(555.00, 377.00, 42.50, 10.19, -1, 100.0);
    
    
		//Welcome Message
		new kota[1401];
		GetPlayerCity(playerid, kota, sizeof(kota));
		format(String, sizeof(String), "* {FF0000}%s {FFFF00}telah terkoneksi ke server. (%s)", PlayerInfo[playerid][pNormalName], kota);
	 	SendClientMessageToAll(COLOR_YELLOW,String);
        format(String, sizeof(String), "SERVER: {FFFFFF}Selamat Datang {00FF00}%s", PlayerInfo[playerid][pNormalName]);   //memek
	 	SendClientMessageEx(playerid, COLOR_TWAQUA,String);
 	//	PlayerTextDrawHide(playerid, HBEO[playerid]);
	 	PlayerTextDrawSetPreviewModel(playerid, HBEO[playerid], GetPlayerSkin(playerid));
	 	PlayerTextDrawShow(playerid, HBEO[playerid]);
	 	if(PlayerInfo[playerid][pBanned] >= 1 )
		{
			new string1[10000], adminban[MAX_PLAYER_NAME];
			strmid(adminban, PlayerInfo[MAX_PLAYER_NAME][pAdminban], 0, strlen(PlayerInfo[MAX_PLAYER_NAME][pAdminban]), 255);
		 	format(string1, sizeof(string1), "{ffffff}Account: {FF0000}%s{FFFFFF}\nIP: {FF0000}null{FFFFFF}\nDi banned oleh Admin: {FF0000}%s{FFFFFF}\nAlasan: {FF0000}%s{FFFFFF}\nPada: {FF0000}Waktu: %s | Tanggal: %s\n\n{FFFFFF}Silahkan Ambil Screenshoot dengan cara menekan F8/Prt scrn{FFFFFF}\nDan Post di Forum Kami.",PlayerInfo[playerid][pNormalName],PlayerInfo[playerid][pAdminban],PlayerInfo[playerid][pBanReason],PlayerInfo[playerid][pBanExpired],PlayerInfo[playerid][pBanExpired2]);
			ShowPlayerDialog(playerid,BAN_DIALOG,DIALOG_STYLE_MSGBOX,"{FF0000}Banned",string1,"Ok :(","");
			SendClientMessageEx(playerid, RED, "WARNING: You are banned from this server.");
			FixedKick(playerid);
			return 1;
		}
				if(PlayerInfo[playerid][pDonateRank] > 0 && PlayerInfo[playerid][pVIPLeft] < 1) { //autovip
				new days,expTime[128];
				ConvertTime(gettime() - PlayerInfo[playerid][pVIPJoinDate], .ctd=days);
				if (days >= PlayerInfo[playerid][pVIPLeft])
				{
					PlayerInfo[playerid][pDonateRank] = 0;
					PlayerInfo[playerid][pVIPJoinDate] = 0;
					PlayerInfo[playerid][pVIPLeft] = 0;
					format(PlayerInfo[playerid][pVIPExpDate],32,"null");
					SendClientMessageEx(playerid, COLOR_VIP, "Donater anda telah habis hari ini, untuk menjadi Donater lagi, silahkan berdonasi :)");
				}
				else
				{
    			format(expTime,sizeof(expTime),"Status Donater : aktif\n");
       			format(expTime,sizeof(expTime),"%s Terima kasih sudah berdonasi di Indonation Roleplay\n",expTime,PlayerInfo[playerid][pVIPExpDate]);
          		format(expTime,sizeof(expTime),"%s Donater anda akan berakhir pada : %s",expTime,PlayerInfo[playerid][pVIPExpDate]);


					SendClientMessageEx(playerid, COLOR_VIP, expTime);
				}
				}
				else if(PlayerInfo[playerid][pDonateRank] > 0 && PlayerInfo[playerid][pVIPLeft] == 99999){
				SendClientMessageEx(playerid, COLOR_VIP, "Status Donater : Permanent");
				SendClientMessageEx(playerid, COLOR_VIP, "Terima kasih sudah berdonasi di Indonation Roleplay");

			}
			if(PlayerInfo[playerid][pDonateRank] > 0 && PlayerInfo[playerid][pVIPLeft] < 1) { //autovip
					new days;
					ConvertTime(gettime() - PlayerInfo[playerid][pVIPJoinDate], .ctd=days);
					if (days >= PlayerInfo[playerid][pVIPLeft]) {
						PlayerInfo[playerid][pDonateRank] = 0;
						PlayerInfo[playerid][pVIPJoinDate] = 0;
						PlayerInfo[playerid][pVIPLeft] = 0;
						format(PlayerInfo[playerid][pVIPExpDate],32,"null");
						SendClientMessageEx(playerid, COLOR_VIP, "Donater anda telah habis hari ini, untuk menjadi Donater lagi, silahkan berdonasi kembali");
					}
				}
		if(PlayerInfo[playerid][pAdmin] >= 1)
	 	{
	 	    format(String, sizeof(String), "STAFFLOGIN: {FFFF00}[id:%d] %s %s (%s) telah terkoneksi ke server.", playerid, RAN(playerid), PlayerInfo[playerid][pAdminName], PlayerInfo[playerid][pNormalName]);
	 		ABroadCast(COLOR_ARWIN, String, 1);
		}
		AdminReadPm[playerid] = false;
		GetPlayerIp(playerid, PlayerInfo[playerid][pIP], 32);
		SetPlayerScore(playerid, PlayerInfo[playerid][pLevel]);
}

//Speedo
public LuX_SpeedoMeterUp()
{
    new Float:x,Float:y,Float:z;

	for(new i=0; i<PLAYERS; i++)
	{
		if(IsPlayerConnected(i) && IsPlayerInAnyVehicle(i) && GetPlayerState(i) == PLAYER_STATE_DRIVER)
		{
 			GetVehicleVelocity(GetPlayerVehicleID(i),x,y,z);
			GetPlayerVehicleID(i);
			new LuxZone[MAX_ZONE_NAME];
			GetPlayer2DZone(i, LuxZone, MAX_ZONE_NAME);
			if(LuX_SpeedoMeter[i] == 0)
			{
				TextDrawShowForPlayer(i, LBox[i]);
			    TextDrawShowForPlayer(i, LLine1[i]);
				TextDrawShowForPlayer(i, LLine2[i]);
				TextDrawShowForPlayer(i, LLine3[i]);
				TextDrawShowForPlayer(i, GPS[i]);
				LuX_SpeedoMeter[i] = 1;
			}
			format(lString,sizeof(lString),"~w~%s",LVehiclesName[GetVehicleModel(GetPlayerVehicleID(i))-400]);
			TextDrawSetString(LLine1[i], lString);
			format(lString,sizeof(lString),"~w~Speed: %d mph",floatround(floatsqroot(((x*x)+(y*y))+(z*z))*156.666667));
			TextDrawSetString(LLine2[i],lString);
			format(lString,sizeof(lString),"~w~Fuel: ~g~%.1f~w~/~b~100.0",VehicleFuel[(GetPlayerVehicleID(i))]);
			TextDrawSetString(LLine3[i],lString);
			TextDrawSetString(GPS[i], LuxZone);
		}
	}
	for(new i=0; i<PLAYERS; i++)
	{
		if(!IsPlayerInAnyVehicle(i))
		{
			TextDrawHideForPlayer(i, LBox[i]);
			TextDrawHideForPlayer(i, LLine1[i]);
			TextDrawHideForPlayer(i, LLine2[i]);
			TextDrawHideForPlayer(i, LLine3[i]);
			TextDrawHideForPlayer(i, GPS[i]);
			LuX_SpeedoMeter[i] = 0;
		}
	}
	return 1;
}

forward LuX_SpeedoMeterUp();


public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    new vehid = GetClosestCar(playerid);
	new vehmd = GetVehicleModel(vehid);
	new sendername[MAX_PLAYER_NAME];
	new String[512];
	// Crash Bug Fix
	if(dialogid == DUTYMENU3)
	{
 		if(response)
		{
			if(listitem == 0) // LSPD Uniforms
			{
				SetPlayerSkin(playerid, PlayerInfo[playerid][pChar]);
				PlayerInfo[playerid][pModel] = 71;
				PlayerInfo[playerid][pChar] = 71;
				PlayerTextDrawHide(playerid, HBEO[playerid]);
				PlayerTextDrawSetPreviewModel(playerid, HBEO[playerid], GetPlayerSkin(playerid));
				PlayerTextDrawShow(playerid, HBEO[playerid]);
			}
			if(listitem == 1) //LSPD Uniforms
			{
				SetPlayerSkin(playerid, PlayerInfo[playerid][pChar]);
				PlayerInfo[playerid][pModel] = 141;
				PlayerInfo[playerid][pChar] = 141;
				PlayerTextDrawHide(playerid, HBEO[playerid]);
				PlayerTextDrawSetPreviewModel(playerid, HBEO[playerid], GetPlayerSkin(playerid));
				PlayerTextDrawShow(playerid, HBEO[playerid]);
			}
			if(listitem == 2) // LSPD Uniforms
			{
				SetPlayerSkin(playerid, PlayerInfo[playerid][pChar]);
				PlayerInfo[playerid][pModel] = 280;
				PlayerInfo[playerid][pChar] = 280;
				PlayerTextDrawHide(playerid, HBEO[playerid]);
				PlayerTextDrawSetPreviewModel(playerid, HBEO[playerid], GetPlayerSkin(playerid));
				PlayerTextDrawShow(playerid, HBEO[playerid]);
			}
			if(listitem == 3) //LSPD Uniforms
			{
				SetPlayerSkin(playerid, PlayerInfo[playerid][pChar]);
				PlayerInfo[playerid][pModel] = 266;
				PlayerInfo[playerid][pChar] = 266;
				PlayerTextDrawHide(playerid, HBEO[playerid]);
				PlayerTextDrawSetPreviewModel(playerid, HBEO[playerid], GetPlayerSkin(playerid));
				PlayerTextDrawShow(playerid, HBEO[playerid]);
			}
			if(listitem == 4) //LSPD Uniforms
			{
				SetPlayerSkin(playerid, PlayerInfo[playerid][pChar]);
				PlayerInfo[playerid][pModel] = 281;
				PlayerInfo[playerid][pChar] = 281;
				PlayerTextDrawHide(playerid, HBEO[playerid]);
				PlayerTextDrawSetPreviewModel(playerid, HBEO[playerid], GetPlayerSkin(playerid));
				PlayerTextDrawShow(playerid, HBEO[playerid]);
			}
			if(listitem == 5) // LSPD Uniforms
			{
				SetPlayerSkin(playerid, PlayerInfo[playerid][pChar]);
				PlayerInfo[playerid][pModel] = 265;
				PlayerInfo[playerid][pChar] = 265;
				PlayerTextDrawHide(playerid, HBEO[playerid]);
				PlayerTextDrawSetPreviewModel(playerid, HBEO[playerid], GetPlayerSkin(playerid));
				PlayerTextDrawShow(playerid, HBEO[playerid]);
			}

			if(listitem == 6) // LSPD Uniforms
			{
				SetPlayerSkin(playerid, PlayerInfo[playerid][pChar]);
				PlayerInfo[playerid][pModel] = 267;
				PlayerInfo[playerid][pChar] = 267;
				PlayerTextDrawHide(playerid, HBEO[playerid]);
				PlayerTextDrawSetPreviewModel(playerid, HBEO[playerid], GetPlayerSkin(playerid));
				PlayerTextDrawShow(playerid, HBEO[playerid]);
			}
			if(listitem == 7) // LSPD Uniforms
			{
				SetPlayerSkin(playerid, PlayerInfo[playerid][pChar]);
				PlayerInfo[playerid][pModel] = 284;
				PlayerInfo[playerid][pChar] = 284;
				PlayerTextDrawHide(playerid, HBEO[playerid]);
				PlayerTextDrawSetPreviewModel(playerid, HBEO[playerid], GetPlayerSkin(playerid));
				PlayerTextDrawShow(playerid, HBEO[playerid]);
			}
			if(listitem == 8) // LSPD Uniforms
			{
				SetPlayerSkin(playerid, PlayerInfo[playerid][pChar]);
				PlayerInfo[playerid][pModel] = 285;
				PlayerInfo[playerid][pChar] = 285;
				PlayerTextDrawHide(playerid, HBEO[playerid]);
				PlayerTextDrawSetPreviewModel(playerid, HBEO[playerid], GetPlayerSkin(playerid));
				PlayerTextDrawShow(playerid, HBEO[playerid]);
			}
			if(listitem == 9) //LSPD Uniforms
			{
				SetPlayerSkin(playerid, PlayerInfo[playerid][pChar]);
				PlayerInfo[playerid][pModel] = 282;
				PlayerInfo[playerid][pChar] = 282;
				PlayerTextDrawHide(playerid, HBEO[playerid]);
				PlayerTextDrawSetPreviewModel(playerid, HBEO[playerid], GetPlayerSkin(playerid));
				PlayerTextDrawShow(playerid, HBEO[playerid]);
			}
			if(listitem == 10) //LSPD Uniforms
			{
				SetPlayerSkin(playerid, PlayerInfo[playerid][pChar]);
				PlayerInfo[playerid][pModel] = 283;
				PlayerInfo[playerid][pChar] = 283;
				PlayerTextDrawHide(playerid, HBEO[playerid]);
				PlayerTextDrawSetPreviewModel(playerid, HBEO[playerid], GetPlayerSkin(playerid));
				PlayerTextDrawShow(playerid, HBEO[playerid]);
			}
			if(listitem == 11) //LSPD Uniforms
			{
				SetPlayerSkin(playerid, PlayerInfo[playerid][pChar]);
				PlayerInfo[playerid][pModel] = 288;
				PlayerInfo[playerid][pChar] = 288;
				PlayerTextDrawHide(playerid, HBEO[playerid]);
				PlayerTextDrawSetPreviewModel(playerid, HBEO[playerid], GetPlayerSkin(playerid));
				PlayerTextDrawShow(playerid, HBEO[playerid]);
			}
		}
		EquipmentStock --;
	}
	if(dialogid == DUTYMENU4)
	{
 		if(response)
		{
			if(listitem == 0) // LSPD Uniforms
			{
				SetPlayerSkin(playerid, PlayerInfo[playerid][pChar]);
				PlayerInfo[playerid][pModel] = 223;
				PlayerInfo[playerid][pChar] = 223;
				PlayerTextDrawHide(playerid, HBEO[playerid]);
				PlayerTextDrawSetPreviewModel(playerid, HBEO[playerid], GetPlayerSkin(playerid));
				PlayerTextDrawShow(playerid, HBEO[playerid]);
			}
			if(listitem == 1) //LSPD Uniforms
			{
				SetPlayerSkin(playerid, PlayerInfo[playerid][pChar]);
				PlayerInfo[playerid][pModel] = 120;
				PlayerInfo[playerid][pChar] = 120;
				PlayerTextDrawHide(playerid, HBEO[playerid]);
				PlayerTextDrawSetPreviewModel(playerid, HBEO[playerid], GetPlayerSkin(playerid));
				PlayerTextDrawShow(playerid, HBEO[playerid]);
			}
			if(listitem == 2) // LSPD Uniforms
			{
				SetPlayerSkin(playerid, PlayerInfo[playerid][pChar]);
				PlayerInfo[playerid][pModel] = 240;
				PlayerInfo[playerid][pChar] = 240;
				PlayerTextDrawHide(playerid, HBEO[playerid]);
				PlayerTextDrawSetPreviewModel(playerid, HBEO[playerid], GetPlayerSkin(playerid));
				PlayerTextDrawShow(playerid, HBEO[playerid]);
			}
			if(listitem == 3) //LSPD Uniforms
			{
				SetPlayerSkin(playerid, PlayerInfo[playerid][pChar]);
				PlayerInfo[playerid][pModel] = 296;
				PlayerInfo[playerid][pChar] = 296;
				PlayerTextDrawHide(playerid, HBEO[playerid]);
				PlayerTextDrawSetPreviewModel(playerid, HBEO[playerid], GetPlayerSkin(playerid));
				PlayerTextDrawShow(playerid, HBEO[playerid]);
			}
			if(listitem == 4) //LSPD Uniforms
			{
				SetPlayerSkin(playerid, PlayerInfo[playerid][pChar]);
				PlayerInfo[playerid][pModel] = 137;
				PlayerInfo[playerid][pChar] = 137;
				PlayerTextDrawHide(playerid, HBEO[playerid]);
				PlayerTextDrawSetPreviewModel(playerid, HBEO[playerid], GetPlayerSkin(playerid));
				PlayerTextDrawShow(playerid, HBEO[playerid]);
			}
			if(listitem == 5) // LSPD Uniforms
			{
				SetPlayerSkin(playerid, PlayerInfo[playerid][pChar]);
				PlayerInfo[playerid][pModel] = 214;
				PlayerInfo[playerid][pChar] = 214;
				PlayerTextDrawHide(playerid, HBEO[playerid]);
				PlayerTextDrawSetPreviewModel(playerid, HBEO[playerid], GetPlayerSkin(playerid));
				PlayerTextDrawShow(playerid, HBEO[playerid]);
			}
			if(listitem == 6) // LSPD Uniforms
			{
				SetPlayerSkin(playerid, PlayerInfo[playerid][pChar]);
				PlayerInfo[playerid][pModel] = 147;
            	PlayerInfo[playerid][pChar] = 147;
            	PlayerTextDrawHide(playerid, HBEO[playerid]);
				PlayerTextDrawSetPreviewModel(playerid, HBEO[playerid], GetPlayerSkin(playerid));
				PlayerTextDrawShow(playerid, HBEO[playerid]);
			}
			if(listitem == 7) //LSPD Uniforms
			{
				SetPlayerSkin(playerid, PlayerInfo[playerid][pChar]);
				PlayerInfo[playerid][pModel] = 150;
				PlayerInfo[playerid][pChar] = 150;
				PlayerTextDrawHide(playerid, HBEO[playerid]);
				PlayerTextDrawSetPreviewModel(playerid, HBEO[playerid], GetPlayerSkin(playerid));
				PlayerTextDrawShow(playerid, HBEO[playerid]);
			}
			if(listitem == 8) //LSPD Uniforms
			{
				SetPlayerSkin(playerid, PlayerInfo[playerid][pChar]);
				PlayerInfo[playerid][pModel] = 201;
				PlayerInfo[playerid][pChar] = 201;
				PlayerTextDrawHide(playerid, HBEO[playerid]);
				PlayerTextDrawSetPreviewModel(playerid, HBEO[playerid], GetPlayerSkin(playerid));
				PlayerTextDrawShow(playerid, HBEO[playerid]);
			}
			if(listitem == 9) //LSPD Uniforms
			{
				SetPlayerSkin(playerid, PlayerInfo[playerid][pChar]);
				PlayerInfo[playerid][pModel] = 162;
				PlayerInfo[playerid][pChar] = 162;
				PlayerTextDrawHide(playerid, HBEO[playerid]);
				PlayerTextDrawSetPreviewModel(playerid, HBEO[playerid], GetPlayerSkin(playerid));
				PlayerTextDrawShow(playerid, HBEO[playerid]);
			}
			if(listitem == 10) //LSPD Uniforms
			{
				SetPlayerSkin(playerid, PlayerInfo[playerid][pChar]);
				PlayerInfo[playerid][pModel] = 29;
				PlayerInfo[playerid][pChar] = 29;
				PlayerTextDrawHide(playerid, HBEO[playerid]);
				PlayerTextDrawSetPreviewModel(playerid, HBEO[playerid], GetPlayerSkin(playerid));
				PlayerTextDrawShow(playerid, HBEO[playerid]);
			}
			if(listitem == 11) //LSPD Uniforms
			{
				SetPlayerSkin(playerid, PlayerInfo[playerid][pChar]);
				PlayerInfo[playerid][pModel] = 270;
                PlayerInfo[playerid][pChar] = 270;
                PlayerTextDrawHide(playerid, HBEO[playerid]);
				PlayerTextDrawSetPreviewModel(playerid, HBEO[playerid], GetPlayerSkin(playerid));
				PlayerTextDrawShow(playerid, HBEO[playerid]);
			}
			if(listitem == 12) //LSPD Uniforms
			{
				SetPlayerSkin(playerid, PlayerInfo[playerid][pChar]);
				PlayerInfo[playerid][pModel] = 59;
				PlayerInfo[playerid][pChar] = 59;
				PlayerTextDrawHide(playerid, HBEO[playerid]);
				PlayerTextDrawSetPreviewModel(playerid, HBEO[playerid], GetPlayerSkin(playerid));
				PlayerTextDrawShow(playerid, HBEO[playerid]);
			}
		}
		EquipmentStock --;
	}
	if(dialogid == FDUTYMENU4)
	{
 		if(response)
		{
			ShowModelSelectionMenu(playerid, FACTIONSKIN, "Select Skin");
		}
		EquipmentStock --;
	}
    if(dialogid == DUTYMENU5)
	{
	    if(response)
    	{
            new giveplayerid = ReturnUser(inputtext);
			//giveplayerid = strval(inputtext);
			if(IsPlayerConnected(giveplayerid))
			{
				if(giveplayerid != INVALID_PLAYER_ID)
				{
					format(String, sizeof(String), "* You cleared the records and wanted points of %s.", GetPlayerNameEx(giveplayerid));
					SendClientMessageEx(playerid, COLOR_LIGHTBLUE, String);
					format(String, sizeof(String), "* Officer %s has cleared your records and wanted points.", GetPlayerNameEx(playerid));
					SendClientMessageEx(giveplayerid, COLOR_LIGHTBLUE, String);
					format(String, sizeof(String), "* Officer %s has cleared %s's records and wanted points.", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid));
					SendRadioMessage(1, RADIO, String);
					SendRadioMessage(2, RADIO, String);
					SendRadioMessage(5, RADIO, String);
					SendRadioMessage(7, RADIO, String);
					SendRadioMessage(11, RADIO, String);
					SendRadioMessage(13, RADIO, String);
					WantedPoints[giveplayerid] = 0;
					PlayerInfo[giveplayerid][pWantedLevel] = 0;
					SetPlayerToTeamColor(giveplayerid);
    				ClearCrime(giveplayerid);
				}
				else
				{
					SendClientMessageEx(playerid, COLOR_GREY, "Invalid player specified.");
				}
			}
		}
	}
	if(dialogid == SAGSMENU)
	{
		if(response)
		{
			if(listitem == 0) // SENATE Duty
			{
				if(PlayerInfo[playerid][pDuty]==0)
				{
					SetPlayerSkin(playerid, PlayerInfo[playerid][pChar]);
					PlayerInfo[playerid][pModel] = 71;
					PlayerInfo[playerid][pChar] = 71;
                    PlayerTextDrawHide(playerid, HBEO[playerid]);
					PlayerTextDrawSetPreviewModel(playerid, HBEO[playerid], GetPlayerSkin(playerid));
					PlayerTextDrawShow(playerid, HBEO[playerid]);
	    			AC_BS_SetPlayerHealth(playerid, 100);
					PlayerInfo[playerid][pHealth] = 100.0;
					AC_BS_SetPlayerArmour(playerid, 100);
					PlayerInfo[playerid][pArmor] = 100.0;
	    			SetPlayerColor(playerid, COLOR_TWAQUA);
					OnDuty[playerid] = 1;
					PlayerInfo[playerid][pDuty] = 1;
				}
				else
				{
					SetPlayerSkin(playerid, PlayerInfo[playerid][pChar]);
					PlayerInfo[playerid][pChar] = 46;
					PlayerTextDrawHide(playerid, HBEO[playerid]);
					PlayerTextDrawSetPreviewModel(playerid, HBEO[playerid], GetPlayerSkin(playerid));
					PlayerTextDrawShow(playerid, HBEO[playerid]);
					SetPlayerColor(playerid, TEAM_HIT_COLOR);
					AC_BS_SetPlayerArmour(playerid, 0);
					PlayerInfo[playerid][pArmor] = 0;
					PlayerInfo[playerid][pModel] = 46;
					OnDuty[playerid] = 0;
					PlayerInfo[playerid][pDuty] = 0;
				}
			}
			else if(listitem == 1) // SE Uniforms
			{
				ShowPlayerDialog(playerid, SESKINS, DIALOG_STYLE_LIST, "San Andreas Government Uniforms","Intern\nStaff Member\nSenior Staff\nSecretary\nLieutenant Governor\nGovernor", "Put On", "Cancel");
			}
		}
	}
	if(dialogid == SESKINS) // SE Uniforms
	{
 		if(response)
		{
			if(listitem == 0) // SE Uniforms
			{
				SetPlayerSkin(playerid, PlayerInfo[playerid][pChar]);
				PlayerInfo[playerid][pModel] = 71;
				PlayerInfo[playerid][pChar] = 71;
				PlayerTextDrawHide(playerid, HBEO[playerid]);
				PlayerTextDrawSetPreviewModel(playerid, HBEO[playerid], GetPlayerSkin(playerid));
				PlayerTextDrawShow(playerid, HBEO[playerid]);

			}
			if(listitem == 1) //SE Uniforms
			{
				if(PlayerInfo[playerid][pRank] >= 2)
				{
					SetPlayerSkin(playerid, PlayerInfo[playerid][pChar]);
					PlayerInfo[playerid][pModel] = 17;
					PlayerInfo[playerid][pChar] = 17;
					PlayerTextDrawHide(playerid, HBEO[playerid]);
					PlayerTextDrawSetPreviewModel(playerid, HBEO[playerid], GetPlayerSkin(playerid));
					PlayerTextDrawShow(playerid, HBEO[playerid]);
				}
				else
				{
					SendClientMessageEx(playerid, COLOR_GRAD2, " You are not the required rank!");
					return 1;
				}
			}
			if(listitem == 2) //SE Uniforms
			{
				if(PlayerInfo[playerid][pRank] >= 3)
				{
					SetPlayerSkin(playerid, 163);
					PlayerInfo[playerid][pModel] = 163;
				}
				else
				{
					SendClientMessageEx(playerid, COLOR_GRAD2, " You are not the required rank!");
					return 1;
				}
			}
			if(listitem == 3) //SE Uniforms
			{
				if(PlayerInfo[playerid][pRank] >= 4)
				{
					SetPlayerSkin(playerid, 227);
					PlayerInfo[playerid][pModel] = 227;
				}
				else
				{
					SendClientMessageEx(playerid, COLOR_GRAD2, " You are not the required rank!");
					return 1;
				}
			}
			if(listitem == 4) //SE Uniforms
			{
				if(PlayerInfo[playerid][pRank] >= 5)
				{
					SetPlayerSkin(playerid, 295);
					PlayerInfo[playerid][pModel] = 295;
				}
				else
				{
					SendClientMessageEx(playerid, COLOR_GRAD2, " You are not the required rank!");
					return 1;
				}
			}
			if(listitem == 5) //SE Uniforms
			{
				if(PlayerInfo[playerid][pLeader] == 6)
				{
					SetPlayerSkin(playerid, 147);
					PlayerInfo[playerid][pModel] = 147;
				}
				else
				{
					SendClientMessageEx(playerid, COLOR_GRAD2, " You are not the required rank!");
					return 1;
				}
			}
		}
		EquipmentStock --;
	}
 }

CMD:setskin(playerid, params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 2)
	{
		new String[10000], giveplayerid, skinid;
		if(sscanf(params, "ud", giveplayerid, skinid)) return SendClientMessageEx(playerid, COLOR_WHITE, "KEGUNAAN: /setskin [playerid] [skinid]");

		if(IsPlayerConnected(giveplayerid))
		{
			if(!IsInvalidSkin(skinid))
			{
				if(GetPlayerSkin(giveplayerid) == skinid)
				{
					SendClientMessageEx( playerid, COLOR_WHITE, "The player you're trying to change skins of already is using the skin you're trying to set." );
				}
				else
				{
					PlayerInfo[giveplayerid][pChar] = skinid;
					PlayerInfo[giveplayerid][pModel] = skinid;
					format(String, sizeof(String), "Your skin has been changed to ID %d by Administrator %s.", skinid, GetName(playerid));
					SendClientMessageEx(giveplayerid, COLOR_WHITE, String);
					format(String, sizeof(String), "You have given %s skin ID %d.", GetPlayerNameEx(giveplayerid), skinid);
					SendClientMessageEx(playerid, COLOR_WHITE, String);
					SetPlayerSkin(giveplayerid, PlayerInfo[giveplayerid][pChar]);
					PlayerTextDrawHide(playerid, HBEO[playerid]);
					PlayerTextDrawSetPreviewModel(playerid, HBEO[playerid], GetPlayerSkin(playerid));
					PlayerTextDrawShow(playerid, HBEO[playerid]);
				}
			}
			else
			{
				SendClientMessageEx(playerid, COLOR_GREY, "Invalid skin ID!");
			}
		}
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD1, "ERROR: You don't have the privilege to use this command!");
	}
	return 1;
}

//------------------------------------------------------------------------------------------------------
public OnPlayerDisconnect(playerid, reason)
{
    if(PlayerInfo[playerid][pAdminDuty] == 1)
    {
        PlayerInfo[playerid][pAdminDuty] = 0;
		AC_BS_SetPlayerHealth(playerid, PlayerInfo[playerid][pHealth]);
		AC_BS_SetPlayerArmour(playerid, PlayerInfo[playerid][pArmor]);
		SetPlayerName(playerid, PlayerInfo[playerid][pNormalName]);
		SetPlayerColor(playerid, 0xFFFFFF00);
		SetPVarInt(playerid, "AdminProtect", 0);
	}
    GetPlayerPos(playerid, PlayerInfo[playerid][pPos_x], PlayerInfo[playerid][pPos_y], PlayerInfo[playerid][pPos_z]);
    TextDrawHideForPlayer(playerid, LBox[playerid]);
	TextDrawHideForPlayer(playerid, LLine1[playerid]);
	TextDrawHideForPlayer(playerid, LLine2[playerid]);
	TextDrawHideForPlayer(playerid, LLine3[playerid]);
	TextDrawHideForPlayer(playerid, LCredits[playerid]);
	HideProgressBarForPlayer(playerid, phealth[playerid]);
	HideProgressBarForPlayer(playerid, parmor[playerid]);
	LuX_SpeedoMeter[playerid] = 0;
 	SaveWeaponInfo(playerid);
	KillTimer(WeaponCheckTimer[playerid]);
	for(new v; v < MAX_PLAYERVEHICLES; ++v)
	{
	    for(new vt = 0; vt < MAX_OBJECTS_PER_PLAYER; vt++)
     	{
	         	new Float:x, Float:y, Float:z, Float:angle, Float:health, Float:fuel;
         	 	DestroyDynamicObject(PlayerVehicleInfo[playerid][v][pvToy][vt]);
	            DestroyDynamicObject(PlayerVehicleInfo[playerid][v][pvNeonObj]);
				DestroyDynamicObject(PlayerVehicleInfo[playerid][v][pvNeonObj2]);
				DestroyDynamicObject(PlayerVehicleInfo[playerid][v][pvNeonObj3]);
				DestroyDynamicObject(PlayerVehicleInfo[playerid][v][pvNeonObj4]);
			 	GetVehicleDamageStatus(PlayerVehicleInfo[playerid][v][pvId], PlayerVehicleInfo[playerid][v][pvStatus][0], PlayerVehicleInfo[playerid][v][pvStatus][1], PlayerVehicleInfo[playerid][v][pvStatus][2], PlayerVehicleInfo[playerid][v][pvStatus][3]);
				GetVehicleHealth(PlayerVehicleInfo[playerid][v][pvId], health);
				if(PlayerInfo[playerid][pLockCar] == GetPlayerVehicleID(playerid)) PlayerInfo[playerid][pLockCar] = INVALID_VEHICLE_ID;
				GetVehiclePos(PlayerVehicleInfo[playerid][v][pvId], x, y, z);
				GetVehicleZAngle(PlayerVehicleInfo[playerid][v][pvId], angle);
				PlayerVehicleInfo[playerid][v][pvPosX] = x;
				PlayerVehicleInfo[playerid][v][pvPosY] = y;
				PlayerVehicleInfo[playerid][v][pvPosZ] = z;
				PlayerVehicleInfo[playerid][v][pvPosAngle] = angle;
				PlayerVehicleInfo[playerid][v][pvFuel] = fuel;
				PlayerVehicleInfo[playerid][v][pvHealth] = health;
		}
	}
	if(GetPVarInt(playerid, "HaveADO") == 1) RemovePlayerADO(playerid);
	new Float:x,Float:y,Float:z,Float:a, Float:health;
 	GetVehicleDamageStatus(PlayerRentInfo[playerid][prId], PlayerRentInfo[playerid][prStatus][0], PlayerRentInfo[playerid][prStatus][1], PlayerRentInfo[playerid][prStatus][2], PlayerRentInfo[playerid][prStatus][3]);
	GetVehicleHealth(PlayerRentInfo[playerid][prId], health);
	GetVehiclePos(PlayerRentInfo[playerid][prId], x, y, z);
	GetVehicleZAngle(PlayerRentInfo[playerid][prId], a);
	PlayerRentInfo[playerid][prPosX] = x;
	PlayerRentInfo[playerid][prPosY] = y;
	PlayerRentInfo[playerid][prPosZ] = z;
	PlayerRentInfo[playerid][prPosAngle] = a;
	PlayerRentInfo[playerid][prHealth] = health;
	new weapons[13][2];
	for(new s = 0; s < 12; s++)
	{
	    GetPlayerWeaponData(playerid, s, weapons[s][0], weapons[s][1]);
	    PlayerInfo[playerid][pGuns][s] = weapons[s][0];
	    PlayerInfo[playerid][pGunsAmmo][s] = weapons[s][1];
	}
	for(new i; i <= 9; i++) // 9 = Total Dialog , Jadi kita mau tau kalau Player Ini Apakah Ambil Dialog dari 3 tersebut apa ga !
	{
		if(DialogSaya[playerid][i] == true) // Cari apakah dia punya salah satu diantara 10 dialog tersebut
		{
		    DialogSaya[playerid][i] = false; // Ubah Jadi Dia ga punya dialog lagi Kalau Udah Disconnect (Bukan dia lagi pemilik)
		    DialogHauling[i] = false; // Jadi ga ada yang punya nih dialog
		    DialogSweeper[i] = false; // Jadi ga ada yang punya nih dialog
		    DialogBus[i] = false; // Jadi ga ada yang punya nih dialog
		    DestroyVehicle(TrailerHauling[playerid]);
		}
	}
	//FlyMode
    PlayerPressedJump[playerid] = 0;
    TextDrawHideForPlayer(playerid, Time), TextDrawHideForPlayer(playerid, Date);
	if(GetPVarType(playerid, "BoomboxObject"))
    {
        DestroyDynamicObject(GetPVarInt(playerid, "BoomboxObject"));
        if(GetPVarType(playerid, "bboxareaid"))
        {
            foreach(Player,i)
            {
                if(IsPlayerInDynamicArea(i, GetPVarInt(playerid, "bboxareaid")))
                {
                    StopAudioStreamForPlayer(i);
                     SendClientMessage(i, COLOR_GREY, " The boombox creator has disconnected from the server.");
                }
            }
        }
    }
 	new VID = GetPlayerVehicleID(playerid);
    DestroyDynamicObject(SirenObject[VID]);
 	{
	 	DestroyDynamicObject(GetPVarInt(playerid, "neon")); DeletePVar(playerid, "Status"); DestroyDynamicObject(GetPVarInt(playerid, "neon1")); DeletePVar(playerid, "Status"); DestroyDynamicObject(GetPVarInt(playerid, "neon2")); DeletePVar(playerid, "Status"); DestroyDynamicObject(GetPVarInt(playerid, "neon3"));
	  	DeletePVar(playerid, "Status"); DestroyDynamicObject(GetPVarInt(playerid, "neon4")); DeletePVar(playerid, "Status"); DestroyDynamicObject(GetPVarInt(playerid, "neon5")); DeletePVar(playerid, "Status"); DestroyDynamicObject(GetPVarInt(playerid, "neon6")); DeletePVar(playerid, "Status"); DestroyDynamicObject(GetPVarInt(playerid, "neon7"));
	  	DeletePVar(playerid, "Status"); DestroyDynamicObject(GetPVarInt(playerid, "neon8")); DeletePVar(playerid, "Status"); DestroyDynamicObject(GetPVarInt(playerid, "neon9")); DeletePVar(playerid, "Status"); DestroyDynamicObject(GetPVarInt(playerid, "neon10")); DeletePVar(playerid, "Status"); DestroyDynamicObject(GetPVarInt(playerid, "neon11"));
	  	DeletePVar(playerid, "Status"); DestroyDynamicObject(GetPVarInt(playerid, "neon12")); DeletePVar(playerid, "Status"); DestroyDynamicObject(GetPVarInt(playerid, "neon13")); DeletePVar(playerid, "Status"); DestroyDynamicObject(GetPVarInt(playerid, "neon14")); DeletePVar(playerid, "Status"); DestroyDynamicObject(GetPVarInt(playerid, "neon15"));
	  	DeletePVar(playerid, "Status"); DestroyDynamicObject(GetPVarInt(playerid, "neon16")); DeletePVar(playerid, "Status"); DestroyDynamicObject(GetPVarInt(playerid, "neon17")); DeletePVar(playerid, "Status"); DestroyDynamicObject(GetPVarInt(playerid, "neon18")); DeletePVar(playerid, "Status"); DestroyDynamicObject(GetPVarInt(playerid, "neon19"));
	  	DeletePVar(playerid, "Status"); DestroyDynamicObject(GetPVarInt(playerid, "neon20")); DeletePVar(playerid, "Status"); DestroyDynamicObject(GetPVarInt(playerid, "neon21")); DeletePVar(playerid, "Status"); DestroyDynamicObject(GetPVarInt(playerid, "neon22")); DeletePVar(playerid, "Status"); DestroyDynamicObject(GetPVarInt(playerid, "neon23"));
	  	DeletePVar(playerid, "Status"); DestroyDynamicObject(GetPVarInt(playerid, "neon24")); DeletePVar(playerid, "Status"); DestroyDynamicObject(GetPVarInt(playerid, "neon25")); DeletePVar(playerid, "Status"); DestroyDynamicObject(GetPVarInt(playerid, "neon26")); DeletePVar(playerid, "Status"); DestroyDynamicObject(GetPVarInt(playerid, "neon27"));
	  	DeletePVar(playerid, "Status"); DestroyDynamicObject(GetPVarInt(playerid, "neon28")); DeletePVar(playerid, "Status"); DestroyDynamicObject(GetPVarInt(playerid, "neon29")); DeletePVar(playerid, "Status"); DestroyDynamicObject(GetPVarInt(playerid, "neon30")); DeletePVar(playerid, "Status"); DestroyDynamicObject(GetPVarInt(playerid, "neon31"));
	  	DeletePVar(playerid, "Status"); DestroyDynamicObject(GetPVarInt(playerid, "neon32")); DeletePVar(playerid, "Status"); DestroyDynamicObject(GetPVarInt(playerid, "neon33")); DeletePVar(playerid, "Status"); DestroyDynamicObject(GetPVarInt(playerid, "neon34")); DeletePVar(playerid, "Status"); DestroyDynamicObject(GetPVarInt(playerid, "neon35"));
	}
	// Crash Fix - GhoulSlayeR
	new name[MAX_PLAYER_NAME];
	GetPlayerName(playerid, name, sizeof(name));
	if(!strcmp(name, "InvalidNick", true)) return 1;
	if(!strcmp(name, "BannedPlayer", true)) return 1;

	TextDrawDestroy(DescriptionText[playerid]);
	TextDrawHideForPlayer(playerid, Kotak);
	TextDrawHideForPlayer(playerid, Rp);
	TextDrawHideForPlayer(playerid, forum);
	TextDrawHideForPlayer(playerid, sen);
	TextDrawHideForPlayer(playerid, koma2);
}
