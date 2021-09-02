//logo
new Text:logo_td[90];
new Text: LoginTD[5];

stock LoadPlayerTextDraw(playerid)
{
	//TEST

	/*logo_td[19][playerid]= CreatePlayerTextDraw(playerid,1600.0, 120.0, "indicators");
    PlayerTextDrawFont(playerid,logo_td[19][playerid], 7);

	logo_td[0][playerid]= CreatePlayerTextDraw(playerid,1640.0, 40.0, "clock");
    PlayerTextDrawFont(playerid,logo_td[0][playerid], 7);


	//ak47icon
	logo_td[18][playerid]= CreatePlayerTextDraw(playerid,1505.0, 140.0, "ak47icon");
    PlayerTextDrawFont(playerid,logo_td[18][playerid], 7);


	//Logo
	logo_td[2][playerid]= CreatePlayerTextDraw(playerid,1450.0, 30.0, "logo");
    PlayerTextDrawFont(playerid,logo_td[2][playerid], 7);


	//wallet
	logo_td[11][playerid]= CreatePlayerTextDraw(playerid,1670.0, 150.0, "wallet");
    PlayerTextDrawFont(playerid,logo_td[11][playerid], 7);

	//heart
	logo_td[5][playerid]= CreatePlayerTextDraw(playerid,1670.0, 190.0, "heart");
    PlayerTextDrawFont(playerid,logo_td[5][playerid], 7);

	//shield
	logo_td[8][playerid]= CreatePlayerTextDraw(playerid,1670.0, 230.0, "shield");
    PlayerTextDrawFont(playerid,logo_td[8][playerid], 7);

	//cutlery
	logo_td[3][playerid]= CreatePlayerTextDraw(playerid,1670.0, 270.0, "cutlery");
    PlayerTextDrawFont(playerid,logo_td[3][playerid], 7);

	//Food Text
	logo_td[10][playerid]= CreatePlayerTextDraw(playerid,1710.0, 150.0, "1111222233");
    PlayerTextDrawFont(playerid,logo_td[10][playerid], 6);


    //Time Text
	logo_td[17][playerid]= CreatePlayerTextDraw(playerid, 1730.0, 70.0, "12:46");
    PlayerTextDrawFont(playerid,logo_td[17][playerid], 8);*/

	//TEST
	for(new i; i < 14; i++) TextDrawShowForPlayer(playerid, logo_td[i]);

	//Speedometer

	speed_player_td[0][playerid] = CreatePlayerTextDraw(playerid, 391.833435, 389.499816, "200"); // speed (120)
	PlayerTextDrawLetterSize(playerid, speed_player_td[0][playerid], 0.422996, 2.089477);
	PlayerTextDrawAlignment(playerid, speed_player_td[0][playerid], 2);
	PlayerTextDrawColor(playerid, speed_player_td[0][playerid], -1);
	PlayerTextDrawUseBox(playerid, speed_player_td[0][playerid], true);
	PlayerTextDrawBoxColor(playerid, speed_player_td[0][playerid], 0);
	PlayerTextDrawSetShadow(playerid, speed_player_td[0][playerid], 0);
	PlayerTextDrawSetOutline(playerid, speed_player_td[0][playerid], 0);
	PlayerTextDrawBackgroundColor(playerid, speed_player_td[0][playerid], -256);
	PlayerTextDrawFont(playerid, speed_player_td[0][playerid], 1);
	PlayerTextDrawSetProportional(playerid, speed_player_td[0][playerid], 1);

	speed_player_td[1][playerid] = CreatePlayerTextDraw(playerid, 479.167053, 406.988372, "100L."); // text (box) amount of fuel
	PlayerTextDrawLetterSize(playerid, speed_player_td[1][playerid], 0.163993, 1.127110);
	PlayerTextDrawAlignment(playerid, speed_player_td[1][playerid], 2);
	PlayerTextDrawColor(playerid, speed_player_td[1][playerid], -1);
	PlayerTextDrawUseBox(playerid, speed_player_td[1][playerid], true);
	PlayerTextDrawBoxColor(playerid, speed_player_td[1][playerid], 0);
	PlayerTextDrawSetShadow(playerid, speed_player_td[1][playerid], 0);
	PlayerTextDrawSetOutline(playerid, speed_player_td[1][playerid], 0);
	PlayerTextDrawBackgroundColor(playerid, speed_player_td[1][playerid], -256);
	PlayerTextDrawFont(playerid, speed_player_td[1][playerid], 2);
	PlayerTextDrawSetProportional(playerid, speed_player_td[1][playerid], 1);

	speed_player_td[2][playerid] = CreatePlayerTextDraw(playerid, 433.666625, 392.818542, "LD_SPAC:white"); // box eng
	PlayerTextDrawLetterSize(playerid, speed_player_td[2][playerid], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, speed_player_td[2][playerid], 4.333374, 5.392578);
	PlayerTextDrawAlignment(playerid, speed_player_td[2][playerid], 1);
	PlayerTextDrawColor(playerid, speed_player_td[2][playerid], 1577421567);
	PlayerTextDrawSetShadow(playerid, speed_player_td[2][playerid], 0);
	PlayerTextDrawSetOutline(playerid, speed_player_td[2][playerid], 0);
	PlayerTextDrawFont(playerid, speed_player_td[2][playerid], 4);

	speed_player_td[3][playerid] = CreatePlayerTextDraw(playerid, 433.666625, 401.818542, "LD_SPAC:white"); // box light
	PlayerTextDrawLetterSize(playerid, speed_player_td[3][playerid], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, speed_player_td[3][playerid], 4.333374, 5.392578);
	PlayerTextDrawAlignment(playerid, speed_player_td[3][playerid], 1);
	PlayerTextDrawColor(playerid, speed_player_td[3][playerid], 1577421567);
	PlayerTextDrawSetShadow(playerid, speed_player_td[3][playerid], 0);
	PlayerTextDrawSetOutline(playerid, speed_player_td[3][playerid], 0);
	PlayerTextDrawFont(playerid, speed_player_td[3][playerid], 4);

	speed_player_td[4][playerid] = CreatePlayerTextDraw(playerid, 433.666625, 410.318542, "LD_SPAC:white"); // box doors
	PlayerTextDrawLetterSize(playerid, speed_player_td[4][playerid], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, speed_player_td[4][playerid], 4.333374, 5.392578);
	PlayerTextDrawAlignment(playerid, speed_player_td[4][playerid], 1);
	PlayerTextDrawColor(playerid, speed_player_td[4][playerid], 623191551);
	PlayerTextDrawSetShadow(playerid, speed_player_td[4][playerid], 0);
	PlayerTextDrawSetOutline(playerid, speed_player_td[4][playerid], 0);
	PlayerTextDrawFont(playerid, speed_player_td[4][playerid], 4);

	speed_player_td[5][playerid] = CreatePlayerTextDraw(playerid, 377.833526, 421.462738, "IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII"); // box speed stripe
	PlayerTextDrawLetterSize(playerid, speed_player_td[5][playerid], 0.275994, 1.371847);
	PlayerTextDrawAlignment(playerid, speed_player_td[5][playerid], 1);
	PlayerTextDrawColor(playerid, speed_player_td[5][playerid], -1);
	PlayerTextDrawUseBox(playerid, speed_player_td[5][playerid], true);
	PlayerTextDrawBoxColor(playerid, speed_player_td[5][playerid], 0);
	PlayerTextDrawSetShadow(playerid, speed_player_td[5][playerid], 0);
	PlayerTextDrawSetOutline(playerid, speed_player_td[5][playerid], 0);
	PlayerTextDrawBackgroundColor(playerid, speed_player_td[5][playerid], -256);
	PlayerTextDrawFont(playerid, speed_player_td[5][playerid], 2);
	PlayerTextDrawSetProportional(playerid, speed_player_td[5][playerid], 1);

	speed_player_td[6][playerid] = CreatePlayerTextDraw(playerid, 451.833312, 390.988708, "000~n~025~n~km"); // text (box) amount of mileage
	PlayerTextDrawLetterSize(playerid, speed_player_td[6][playerid], 0.173329, 0.957032);
	PlayerTextDrawAlignment(playerid, speed_player_td[6][playerid], 2);
	PlayerTextDrawColor(playerid, speed_player_td[6][playerid], -1);
	PlayerTextDrawUseBox(playerid, speed_player_td[6][playerid], true);
	PlayerTextDrawBoxColor(playerid, speed_player_td[6][playerid], 0);
	PlayerTextDrawSetShadow(playerid, speed_player_td[6][playerid], 0);
	PlayerTextDrawSetOutline(playerid, speed_player_td[6][playerid], 0);
	PlayerTextDrawBackgroundColor(playerid, speed_player_td[6][playerid], -256);
	PlayerTextDrawFont(playerid, speed_player_td[6][playerid], 1);
	PlayerTextDrawSetProportional(playerid, speed_player_td[6][playerid], 1);

    //Perampokan

	rob_player_td[playerid] = CreatePlayerTextDraw(playerid, 276.4721, 319.6918, "Box"); // ?????
	PlayerTextDrawLetterSize(playerid, rob_player_td[playerid], 0.0000, 1.5570);
	PlayerTextDrawTextSize(playerid, rob_player_td[playerid], 273.6195, 0.0000);
	PlayerTextDrawAlignment(playerid, rob_player_td[playerid], 1);
	PlayerTextDrawColor(playerid, rob_player_td[playerid], 1193443327);
	PlayerTextDrawUseBox(playerid, rob_player_td[playerid], 1);
	PlayerTextDrawBoxColor(playerid, rob_player_td[playerid], 1193443327);
	PlayerTextDrawBackgroundColor(playerid, rob_player_td[playerid], 255);
	PlayerTextDrawFont(playerid, rob_player_td[playerid], 1);
	PlayerTextDrawSetProportional(playerid, rob_player_td[playerid], 1);
	PlayerTextDrawSetShadow(playerid, rob_player_td[playerid], 0);

	//Grafiti

	graffiti_player_td[playerid] = CreatePlayerTextDraw(playerid, 276.4721, 319.6918, "Box"); // ?????
	PlayerTextDrawLetterSize(playerid, graffiti_player_td[playerid], 0.0000, 1.5570);
	PlayerTextDrawTextSize(playerid, graffiti_player_td[playerid], 273.6195, 0.0000);
	PlayerTextDrawAlignment(playerid, graffiti_player_td[playerid], 1);
	PlayerTextDrawColor(playerid, graffiti_player_td[playerid], 1193443327);
	PlayerTextDrawUseBox(playerid, graffiti_player_td[playerid], 1);
	PlayerTextDrawBoxColor(playerid, graffiti_player_td[playerid], 1193443327);
	PlayerTextDrawBackgroundColor(playerid, graffiti_player_td[playerid], 255);
	PlayerTextDrawFont(playerid, graffiti_player_td[playerid], 1);
	PlayerTextDrawSetProportional(playerid, graffiti_player_td[playerid], 1);
	PlayerTextDrawSetShadow(playerid, graffiti_player_td[playerid], 0);

	//Toko mobil

    autoshop_player_td[playerid][0] = CreatePlayerTextDraw(playerid, 316.4060, 345.2709, "INFERNUS"); // ����?
	PlayerTextDrawLetterSize(playerid, autoshop_player_td[playerid][0], 0.2452, 1.2755);
	PlayerTextDrawTextSize(playerid, autoshop_player_td[playerid][0], 0.0000, 133.0000);
	PlayerTextDrawAlignment(playerid, autoshop_player_td[playerid][0], 2);
	PlayerTextDrawColor(playerid, autoshop_player_td[playerid][0], -1);
	PlayerTextDrawUseBox(playerid, autoshop_player_td[playerid][0], 1);
	PlayerTextDrawBoxColor(playerid, autoshop_player_td[playerid][0], 437918463);
	PlayerTextDrawBackgroundColor(playerid, autoshop_player_td[playerid][0], 255);
	PlayerTextDrawFont(playerid, autoshop_player_td[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, autoshop_player_td[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, autoshop_player_td[playerid][0], 0);

	autoshop_player_td[playerid][1] = CreatePlayerTextDraw(playerid, 313.4375, 362.2340, "2.000.000"); // ����?
	PlayerTextDrawLetterSize(playerid, autoshop_player_td[playerid][1], 0.1605, 0.8883);
	PlayerTextDrawAlignment(playerid, autoshop_player_td[playerid][1], 1);
	PlayerTextDrawColor(playerid, autoshop_player_td[playerid][1], -490838273);
	PlayerTextDrawBackgroundColor(playerid, autoshop_player_td[playerid][1], 255);
	PlayerTextDrawFont(playerid, autoshop_player_td[playerid][1], 2);
	PlayerTextDrawSetProportional(playerid, autoshop_player_td[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, autoshop_player_td[playerid][1], 0);

	autoshop_player_td[playerid][2] = CreatePlayerTextDraw(playerid, 331.7105, 370.4007, "320"); // ����?
	PlayerTextDrawLetterSize(playerid, autoshop_player_td[playerid][2], 0.1605, 0.8883);
	PlayerTextDrawAlignment(playerid, autoshop_player_td[playerid][2], 1);
	PlayerTextDrawColor(playerid, autoshop_player_td[playerid][2], -490838273);
	PlayerTextDrawBackgroundColor(playerid, autoshop_player_td[playerid][2], 255);
	PlayerTextDrawFont(playerid, autoshop_player_td[playerid][2], 2);
	PlayerTextDrawSetProportional(playerid, autoshop_player_td[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, autoshop_player_td[playerid][2], 0);

	autoshop_player_td[playerid][3] = CreatePlayerTextDraw(playerid, 313.4378, 378.5675, "45l"); // ����?
	PlayerTextDrawLetterSize(playerid, autoshop_player_td[playerid][3], 0.1605, 0.8883);
	PlayerTextDrawAlignment(playerid, autoshop_player_td[playerid][3], 1);
	PlayerTextDrawColor(playerid, autoshop_player_td[playerid][3], -490838273);
	PlayerTextDrawBackgroundColor(playerid, autoshop_player_td[playerid][3], 255);
	PlayerTextDrawFont(playerid, autoshop_player_td[playerid][3], 2);
	PlayerTextDrawSetProportional(playerid, autoshop_player_td[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, autoshop_player_td[playerid][3], 0);

	
	// UseLAlt
	UseLAlt[playerid][0] = CreatePlayerTextDraw(playerid, 553.666625, 420.207458, "_"); // use alt
	PlayerTextDrawLetterSize(playerid, UseLAlt[playerid][0], 0.201999, 1.417481);
	PlayerTextDrawAlignment(playerid, UseLAlt[playerid][0], 1);
	PlayerTextDrawColor(playerid, UseLAlt[playerid][0], -1);
	PlayerTextDrawSetShadow(playerid, UseLAlt[playerid][0], 0);
	PlayerTextDrawSetOutline(playerid, UseLAlt[playerid][0], 1);
	PlayerTextDrawBackgroundColor(playerid, UseLAlt[playerid][0], 51);
	PlayerTextDrawFont(playerid, UseLAlt[playerid][0], 2);
	PlayerTextDrawSetProportional(playerid, UseLAlt[playerid][0], 1);

	UseLAlt[playerid][1] = CreatePlayerTextDraw(playerid,525.333435, 419.218597, "usebox");
	PlayerTextDrawLetterSize(playerid, UseLAlt[playerid][1], 0.000000, -0.547118);
	PlayerTextDrawTextSize(playerid, UseLAlt[playerid][1], 626.000122, 0.000000);
	PlayerTextDrawAlignment(playerid, UseLAlt[playerid][1], 1);
	PlayerTextDrawColor(playerid, UseLAlt[playerid][1], 0);
	PlayerTextDrawUseBox(playerid, UseLAlt[playerid][1], true);
	PlayerTextDrawBoxColor(playerid, UseLAlt[playerid][1], -5963521);
	PlayerTextDrawSetShadow(playerid, UseLAlt[playerid][1], 0);
	PlayerTextDrawSetOutline(playerid, UseLAlt[playerid][1], 0);
	PlayerTextDrawFont(playerid, UseLAlt[playerid][1], 0);

	UseLAlt[playerid][2] = CreatePlayerTextDraw(playerid, 628.666687, 419.218505, "usebox");
	PlayerTextDrawLetterSize(playerid, UseLAlt[playerid][2], 0.000000, 1.849589);
	PlayerTextDrawTextSize(playerid, UseLAlt[playerid][2], 522.666687, 0.000000);
	PlayerTextDrawAlignment(playerid, UseLAlt[playerid][2], 1);
	PlayerTextDrawColor(playerid, UseLAlt[playerid][2], 0);
	PlayerTextDrawUseBox(playerid, UseLAlt[playerid][2], true);
	PlayerTextDrawBoxColor(playerid, UseLAlt[playerid][2], 102);
	PlayerTextDrawSetShadow(playerid, UseLAlt[playerid][2], 0);
	PlayerTextDrawSetOutline(playerid, UseLAlt[playerid][2], 0);
	PlayerTextDrawFont(playerid, UseLAlt[playerid][2], 0);
	
	black_display[playerid] = TextDrawCreate(641.500000, 1.500000, "usebox");
	TextDrawLetterSize(black_display[playerid], 0.000000, 49.391975);
	TextDrawTextSize(black_display[playerid], -2.000000, 0.000000);
	TextDrawUseBox( black_display[playerid], true);
	TextDrawBoxColor(black_display[playerid], 0x00000099);
	//textdraw
/*	logo_blackfon_TD[0] = TextDrawCreate(583.7500, 10.3166, "Server~n~");
	TextDrawLetterSize(logo_blackfon_TD[0], 0.4000, 1.6000);
	TextDrawTextSize(logo_blackfon_TD[0], 589.0000, 0.0000);
	TextDrawAlignment(logo_blackfon_TD[0], 1);
	TextDrawColor(logo_blackfon_TD[0], -1);
	TextDrawSetOutline(logo_blackfon_TD[0], 1);
	TextDrawBackgroundColor(logo_blackfon_TD[0], 255);
	TextDrawFont(logo_blackfon_TD[0], 3);
	TextDrawSetProportional(logo_blackfon_TD[0], 1);
	TextDrawSetShadow(logo_blackfon_TD[0], 10);

	logo_blackfon_TD[1] = TextDrawCreate(575.7000, 22.3998, "RolePlay");
	TextDrawLetterSize(logo_blackfon_TD[1], 0.4000, 1.6000);
	TextDrawTextSize(logo_blackfon_TD[1], 581.9500, 0.0000);
	TextDrawAlignment(logo_blackfon_TD[1], 1);
	TextDrawColor(logo_blackfon_TD[1], -1);
	TextDrawSetOutline(logo_blackfon_TD[1], 3);
	TextDrawBackgroundColor(logo_blackfon_TD[1], 255);
	TextDrawFont(logo_blackfon_TD[1], 1);
	TextDrawSetProportional(logo_blackfon_TD[1], 1);
	TextDrawSetShadow(logo_blackfon_TD[1], 0);

	// podarok
	Podarok[playerid][0] = CreatePlayerTextDraw(playerid, 451.333312, 113.085205, "usebox");
	PlayerTextDrawLetterSize(playerid, Podarok[playerid][0], 0.000000, 7.426543);
	PlayerTextDrawTextSize(playerid, Podarok[playerid][0], 194.000015, 0.000000);
	PlayerTextDrawAlignment(playerid, Podarok[playerid][0], 1);
	PlayerTextDrawColor(playerid, Podarok[playerid][0], 0);
	PlayerTextDrawUseBox(playerid, Podarok[playerid][0], true);
	PlayerTextDrawBoxColor(playerid, Podarok[playerid][0], 102);
	PlayerTextDrawSetShadow(playerid, Podarok[playerid][0], 0);
	PlayerTextDrawSetOutline(playerid, Podarok[playerid][0], 0);
	PlayerTextDrawFont(playerid, Podarok[playerid][0], 0);
	
	Podarok[playerid][1] = CreatePlayerTextDraw(playerid, 451.333312, 111.011184, "usebox");
	PlayerTextDrawLetterSize(playerid, Podarok[playerid][1], 0.000000, -0.150823);
	PlayerTextDrawTextSize(playerid, Podarok[playerid][1], 193.999984, 0.000000);
	PlayerTextDrawAlignment(playerid, Podarok[playerid][1], 1);
	PlayerTextDrawColor(playerid, Podarok[playerid][1], 0);
	PlayerTextDrawUseBox(playerid, Podarok[playerid][1], true);
	PlayerTextDrawBoxColor(playerid, Podarok[playerid][1], -5963521);
	PlayerTextDrawSetShadow(playerid, Podarok[playerid][1], 0);
	PlayerTextDrawSetOutline(playerid, Podarok[playerid][1], 0);
	PlayerTextDrawFont(playerid, Podarok[playerid][1], 0);

	Podarok[playerid][2] = CreatePlayerTextDraw(playerid, 209.333282, 121.540664, "New Textdraw");
	PlayerTextDrawLetterSize(playerid, Podarok[playerid][2], 0.449999, 1.600000);
	PlayerTextDrawTextSize(playerid, Podarok[playerid][2], 49.999969, 50.192565);
	PlayerTextDrawAlignment(playerid, Podarok[playerid][2], 1);
	PlayerTextDrawColor(playerid, Podarok[playerid][2], -1);
	PlayerTextDrawUseBox(playerid, Podarok[playerid][2], true);
	PlayerTextDrawBoxColor(playerid, Podarok[playerid][2], 255);
	PlayerTextDrawSetShadow(playerid, Podarok[playerid][2], 0);
	PlayerTextDrawSetOutline(playerid, Podarok[playerid][2], 1);
	PlayerTextDrawBackgroundColor(playerid, Podarok[playerid][2], 51);
	PlayerTextDrawFont(playerid, Podarok[playerid][2], 5);
	PlayerTextDrawSetProportional(playerid, Podarok[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, Podarok[playerid][2], true);
	PlayerTextDrawSetPreviewModel(playerid, Podarok[playerid][2], 19057);
	PlayerTextDrawSetPreviewRot(playerid, Podarok[playerid][2], 0.000000, 0.000000, -40.000000, 1.000000);

	Podarok[playerid][3] = CreatePlayerTextDraw(playerid, 269.333282, 121.540664, "New Textdraw");
	PlayerTextDrawLetterSize(playerid, Podarok[playerid][3], 0.449999, 1.600000);
	PlayerTextDrawTextSize(playerid, Podarok[playerid][3], 49.999969, 50.192565);
	PlayerTextDrawAlignment(playerid, Podarok[playerid][3], 1);
	PlayerTextDrawColor(playerid, Podarok[playerid][3], -1);
	PlayerTextDrawUseBox(playerid, Podarok[playerid][3], true);
	PlayerTextDrawBoxColor(playerid, Podarok[playerid][3], 0);
	PlayerTextDrawSetShadow(playerid, Podarok[playerid][3], 0);
	PlayerTextDrawSetOutline(playerid, Podarok[playerid][3], 1);
	PlayerTextDrawBackgroundColor(playerid, Podarok[playerid][3], 51);
	PlayerTextDrawFont(playerid, Podarok[playerid][3], 5);
	PlayerTextDrawSetProportional(playerid, Podarok[playerid][3], 1);
	PlayerTextDrawSetSelectable(playerid, Podarok[playerid][3], true);
	PlayerTextDrawSetPreviewModel(playerid, Podarok[playerid][3], 19058);
	PlayerTextDrawSetPreviewRot(playerid, Podarok[playerid][3], 0.000000, 0.000000, -40.000000, 1.000000);

	Podarok[playerid][4] = CreatePlayerTextDraw(playerid, 329.333282, 121.540664, "New Textdraw");
	PlayerTextDrawLetterSize(playerid, Podarok[playerid][4], 0.449999, 1.600000);
	PlayerTextDrawTextSize(playerid, Podarok[playerid][4], 49.999969, 50.192565);
	PlayerTextDrawAlignment(playerid, Podarok[playerid][4], 1);
	PlayerTextDrawColor(playerid, Podarok[playerid][4], -1);
	PlayerTextDrawUseBox(playerid, Podarok[playerid][4], true);
	PlayerTextDrawBoxColor(playerid, Podarok[playerid][4], 0);
	PlayerTextDrawSetShadow(playerid, Podarok[playerid][4], 0);
	PlayerTextDrawSetOutline(playerid, Podarok[playerid][4], 1);
	PlayerTextDrawBackgroundColor(playerid, Podarok[playerid][4], 51);
	PlayerTextDrawFont(playerid, Podarok[playerid][4], 5);
	PlayerTextDrawSetProportional(playerid, Podarok[playerid][4], 1);
	PlayerTextDrawSetSelectable(playerid, Podarok[playerid][4], true);
	PlayerTextDrawSetPreviewModel(playerid, Podarok[playerid][4], 19056);
	PlayerTextDrawSetPreviewRot(playerid, Podarok[playerid][4], 0.000000, 0.000000, -40.000000, 1.000000);

	Podarok[playerid][5] = CreatePlayerTextDraw(playerid, 389.333282, 121.540664, "New Textdraw");
	PlayerTextDrawLetterSize(playerid, Podarok[playerid][5], 0.449999, 1.600000);
	PlayerTextDrawTextSize(playerid, Podarok[playerid][5], 49.999969, 50.192565);
	PlayerTextDrawAlignment(playerid, Podarok[playerid][5], 1);
	PlayerTextDrawColor(playerid, Podarok[playerid][5], -1);
	PlayerTextDrawUseBox(playerid, Podarok[playerid][5], true);
	PlayerTextDrawBoxColor(playerid, Podarok[playerid][5], 0);
	PlayerTextDrawSetShadow(playerid, Podarok[playerid][5], 0);
	PlayerTextDrawSetOutline(playerid, Podarok[playerid][5], 1);
	PlayerTextDrawBackgroundColor(playerid, Podarok[playerid][5], 51);
	PlayerTextDrawFont(playerid, Podarok[playerid][5], 5);
	PlayerTextDrawSetProportional(playerid, Podarok[playerid][5], 1);
	PlayerTextDrawSetSelectable(playerid, Podarok[playerid][5], true);
	PlayerTextDrawSetPreviewModel(playerid, Podarok[playerid][5], 19054);
	PlayerTextDrawSetPreviewRot(playerid, Podarok[playerid][5], 0.000000, 0.000000, -40.000000, 1.000000);

	Podarok[playerid][6] = CreatePlayerTextDraw(playerid, 419.666625, 97.066673, "EXIT");
	PlayerTextDrawLetterSize(playerid, Podarok[playerid][6], 0.314666, 1.160296);
	PlayerTextDrawTextSize(playerid, Podarok[playerid][6], 448.333465, 13.273000);
	PlayerTextDrawAlignment(playerid, Podarok[playerid][6], 1);
	PlayerTextDrawColor(playerid, Podarok[playerid][6], -1);
	PlayerTextDrawUseBox(playerid, Podarok[playerid][6], true);
	PlayerTextDrawBoxColor(playerid, Podarok[playerid][6], -256);
	PlayerTextDrawSetShadow(playerid, Podarok[playerid][6], 0);
	PlayerTextDrawSetOutline(playerid, Podarok[playerid][6], 1);
	PlayerTextDrawBackgroundColor(playerid, Podarok[playerid][6], 51);
	PlayerTextDrawFont(playerid, Podarok[playerid][6], 2);
	PlayerTextDrawSetProportional(playerid, Podarok[playerid][6], 1);
	PlayerTextDrawSetSelectable(playerid, Podarok[playerid][6], true);

	Podarok[playerid][7] = CreatePlayerTextDraw(playerid, 279.333435, 94.992591, "_");
	PlayerTextDrawLetterSize(playerid, Podarok[playerid][7], 0.328666, 1.284740);
	PlayerTextDrawTextSize(playerid, Podarok[playerid][7], -44.999996, -0.829629);
	PlayerTextDrawAlignment(playerid, Podarok[playerid][7], 3);
	PlayerTextDrawColor(playerid, Podarok[playerid][7], -1);
	PlayerTextDrawUseBox(playerid, Podarok[playerid][7], true);
	PlayerTextDrawBoxColor(playerid, Podarok[playerid][7], 0);
	PlayerTextDrawSetShadow(playerid, Podarok[playerid][7], 0);
	PlayerTextDrawSetOutline(playerid, Podarok[playerid][7], 1);
	PlayerTextDrawBackgroundColor(playerid, Podarok[playerid][7], 51);
	PlayerTextDrawFont(playerid, Podarok[playerid][7], 0);
	PlayerTextDrawSetProportional(playerid, Podarok[playerid][7], 1);*/

}


epublic: checkBW()
{
    BW_INFO[bw_time]--;

    GangZoneFlashForAll(BW_INFO[bw_zone], COLOR_RED);

	new place_id = BW_INFO[bw_place];
	new b_id = BW_INFO[bw_bizz];

    new gang_owner = BW_INFO[bw_owner];
	new gang_attack = BW_INFO[bw_attack];

	new str[16];

	format(str, 16, "~n~%s", Convert(BW_INFO[bw_time]));
	TextDrawSetString(BW_INFO[bw_td][2], str);

    new members[2];

    foreach(Player, i)
    {
        if(!PlayerToKvadrat(i,bw_place_pos[place_id][0],bw_place_pos[place_id][1],bw_place_pos[place_id][2],bw_place_pos[place_id][3])) continue;

        if(PlayerInfo[i][pMember] == gang_owner) members[0]++;
        if(PlayerInfo[i][pMember] == gang_attack) members[1]++;
    }

	TextDrawSetString(BW_INFO[bw_td][5], IntToString(members[0]));
	TextDrawSetString(BW_INFO[bw_td][6], IntToString(members[1]));

	if(BW_INFO[bw_time] == 0)
	{
        if(members[0] > members[1]) StopBizWar(1);
        else if(members[0] < members[1]) StopBizWar(2);
        else StopBizWar(0);

	    return printf("Perang untuk bisnis %s[%i] berhenti.", BizzInfo[b_id][bMessage], b_id);
	}

	return SetTimer("checkBW", 1000, false);
}


public OnGameModeInit()
{
	//Speedometer

	speed_global_td[0] = TextDrawCreate(372.500030, 378.214599, "LD_BEAT:chit"); // Texture element
	TextDrawLetterSize(speed_global_td[0], 0.000000, 0.000000);
	TextDrawTextSize(speed_global_td[0], 13.333292, 13.688917);
	TextDrawAlignment(speed_global_td[0], 1);
	TextDrawColor(speed_global_td[0], 1577421567);
	TextDrawSetShadow(speed_global_td[0], 0);
	TextDrawSetOutline(speed_global_td[0], 0);
	TextDrawFont(speed_global_td[0], 4);

	speed_global_td[1] = TextDrawCreate(379.166656, 380.618499, "LD_SPAC:white"); // Texture element
	TextDrawLetterSize(speed_global_td[1], 0.000000, 0.000000);
	TextDrawTextSize(speed_global_td[1], 111.333305, 11.199995);
	TextDrawAlignment(speed_global_td[1], 1);
	TextDrawColor(speed_global_td[1], 1577421567);
	TextDrawSetShadow(speed_global_td[1], 0);
	TextDrawSetOutline(speed_global_td[1], 0);
	TextDrawFont(speed_global_td[1], 4);

	speed_global_td[2] = TextDrawCreate(483.500000, 378.214538, "LD_BEAT:chit"); // Texture element
	TextDrawLetterSize(speed_global_td[2], 0.000000, 0.000000);
	TextDrawTextSize(speed_global_td[2], 13.666625, 14.518545);
	TextDrawAlignment(speed_global_td[2], 1);
	TextDrawColor(speed_global_td[2], 1577421567);
	TextDrawSetShadow(speed_global_td[2], 0);
	TextDrawSetOutline(speed_global_td[2], 0);
	TextDrawFont(speed_global_td[2], 4);

	speed_global_td[3] = TextDrawCreate(374.666625, 384.925903, "LD_SPAC:white"); // Texture element
	TextDrawLetterSize(speed_global_td[3], 0.000000, 0.000000);
	TextDrawTextSize(speed_global_td[3], 126.999961, 40.651855);
	TextDrawAlignment(speed_global_td[3], 1);
	TextDrawColor(speed_global_td[3], -1777803882);
	TextDrawSetShadow(speed_global_td[3], 0);
	TextDrawSetOutline(speed_global_td[3], 0);
	TextDrawFont(speed_global_td[3], 4);

	speed_global_td[4] = TextDrawCreate(372.500030, 423.014648, "LD_BEAT:chit"); // Texture element
	TextDrawLetterSize(speed_global_td[4], 0.000000, 0.000000);
	TextDrawTextSize(speed_global_td[4], 13.333292, 13.688917);
	TextDrawAlignment(speed_global_td[4], 1);
	TextDrawColor(speed_global_td[4], 1577421567);
	TextDrawSetShadow(speed_global_td[4], 0);
	TextDrawSetOutline(speed_global_td[4], 0);
	TextDrawFont(speed_global_td[4], 4);

	speed_global_td[5] = TextDrawCreate(483.833190, 423.014648, "LD_BEAT:chit"); // Texture element
	TextDrawLetterSize(speed_global_td[5], 0.000000, 0.000000);
	TextDrawTextSize(speed_global_td[5], 13.333292, 13.688917);
	TextDrawAlignment(speed_global_td[5], 1);
	TextDrawColor(speed_global_td[5], 1577421567);
	TextDrawSetShadow(speed_global_td[5], 0);
	TextDrawSetOutline(speed_global_td[5], 0);
	TextDrawFont(speed_global_td[5], 4);

	speed_global_td[6] = TextDrawCreate(498.166687, 381.851898, "LD_SPAC:white"); // Texture element
	TextDrawLetterSize(speed_global_td[6], 0.000000, 0.000000);
	TextDrawTextSize(speed_global_td[6], 3.999974, 48.118515);
	TextDrawAlignment(speed_global_td[6], 1);
	TextDrawColor(speed_global_td[6], 1577421567);
	TextDrawSetShadow(speed_global_td[6], 0);
	TextDrawSetOutline(speed_global_td[6], 0);
	TextDrawFont(speed_global_td[6], 4);

	speed_global_td[7] = TextDrawCreate(462.166625, 384.659240, "LD_SPAC:white"); // Texture element
	TextDrawLetterSize(speed_global_td[7], 0.000000, 0.000000);
	TextDrawTextSize(speed_global_td[7], 33.000003, 42.725921);
	TextDrawAlignment(speed_global_td[7], 1);
	TextDrawColor(speed_global_td[7], 1577421567);
	TextDrawSetShadow(speed_global_td[7], 0);
	TextDrawSetOutline(speed_global_td[7], 0);
	TextDrawFont(speed_global_td[7], 4);

	speed_global_td[8] = TextDrawCreate(391.500122, 405.274017, "km/h"); // speed (120)
	TextDrawLetterSize(speed_global_td[8], 0.216995, 1.214218);
	TextDrawAlignment(speed_global_td[8], 2);
	TextDrawColor(speed_global_td[8], -1);
	TextDrawUseBox(speed_global_td[8], true);
	TextDrawBoxColor(speed_global_td[8], 0);
	TextDrawSetShadow(speed_global_td[8], 0);
	TextDrawSetOutline(speed_global_td[8], 0);
	TextDrawBackgroundColor(speed_global_td[8], -256);
	TextDrawFont(speed_global_td[8], 1);
	TextDrawSetProportional(speed_global_td[8], 1);

	speed_global_td[9] = TextDrawCreate(379.166595, 428.407379, "LD_SPAC:white"); // Texture element
	TextDrawLetterSize(speed_global_td[9], 0.000000, 0.000000);
	TextDrawTextSize(speed_global_td[9], 28.999950, 6.222239);
	TextDrawAlignment(speed_global_td[9], 1);
	TextDrawColor(speed_global_td[9], 1577421567);
	TextDrawSetShadow(speed_global_td[9], 0);
	TextDrawSetOutline(speed_global_td[9], 0);
	TextDrawFont(speed_global_td[9], 4);

	speed_global_td[10] = TextDrawCreate(407.000061, 422.418457, "LD_SPAC:white"); // Texture element
	TextDrawLetterSize(speed_global_td[10], 0.000000, 0.000000);
	TextDrawTextSize(speed_global_td[10], 83.666610, 12.029644);
	TextDrawAlignment(speed_global_td[10], 1);
	TextDrawColor(speed_global_td[10], 1577421567);
	TextDrawSetShadow(speed_global_td[10], 0);
	TextDrawSetOutline(speed_global_td[10], 0);
	TextDrawFont(speed_global_td[10], 4);

	speed_global_td[11] = TextDrawCreate(490.666870, 422.588836, "LD_SPAC:white"); // Texture element
	TextDrawLetterSize(speed_global_td[11], 0.000000, 0.000000);
	TextDrawTextSize(speed_global_td[11], 4.666604, 7.466682);
	TextDrawAlignment(speed_global_td[11], 1);
	TextDrawColor(speed_global_td[11], 1577421567);
	TextDrawSetShadow(speed_global_td[11], 0);
	TextDrawSetOutline(speed_global_td[11], 0);
	TextDrawFont(speed_global_td[11], 4);

	speed_global_td[12] = TextDrawCreate(411.833496, 389.288635, "engine~n~light~n~doors"); // speed (120)
	TextDrawLetterSize(speed_global_td[12], 0.142655, 0.994368);
	TextDrawAlignment(speed_global_td[12], 1);
	TextDrawColor(speed_global_td[12], -1);
	TextDrawUseBox(speed_global_td[12], true);
	TextDrawBoxColor(speed_global_td[12], 0);
	TextDrawSetShadow(speed_global_td[12], 0);
	TextDrawSetOutline(speed_global_td[12], 0);
	TextDrawBackgroundColor(speed_global_td[12], -256);
	TextDrawFont(speed_global_td[12], 2);
	TextDrawSetProportional(speed_global_td[12], 1);

	speed_global_td[13] = TextDrawCreate(374.666870, 422.514770, "LD_SPAC:white"); // Texture element
	TextDrawLetterSize(speed_global_td[13], 0.000000, 0.000000);
	TextDrawTextSize(speed_global_td[13], 33.333274, 6.637052);
	TextDrawAlignment(speed_global_td[13], 1);
	TextDrawColor(speed_global_td[13], 1577421567);
	TextDrawSetShadow(speed_global_td[13], 0);
	TextDrawSetOutline(speed_global_td[13], 0);
	TextDrawFont(speed_global_td[13], 4);

	speed_global_td[14] = TextDrawCreate(465.000183, 380.948181, "LD_BEAT:chit"); // box decorative
	TextDrawLetterSize(speed_global_td[14], 0.000000, 0.000000);
	TextDrawTextSize(speed_global_td[14], 25.466640, 29.534811);
	TextDrawAlignment(speed_global_td[14], 1);
	TextDrawColor(speed_global_td[14], -1777803777);
	TextDrawSetShadow(speed_global_td[14], 0);
	TextDrawSetOutline(speed_global_td[14], 0);
	TextDrawFont(speed_global_td[14], 4);

	speed_global_td[15] = TextDrawCreate(467.333496, 383.851837, "LD_BEAT:chit"); // box decorative
	TextDrawLetterSize(speed_global_td[15], 0.000000, 0.000000);
	TextDrawTextSize(speed_global_td[15], 20.799974, 23.727405);
	TextDrawAlignment(speed_global_td[15], 1);
	TextDrawColor(speed_global_td[15], 1577421567);
	TextDrawSetShadow(speed_global_td[15], 0);
	TextDrawSetOutline(speed_global_td[15], 0);
	TextDrawFont(speed_global_td[15], 4);

	speed_global_td[16] = TextDrawCreate(475.333496, 396.466674, "LD_BEAT:chit"); // box decorative
	TextDrawLetterSize(speed_global_td[16], 0.000000, 0.000000);
	TextDrawTextSize(speed_global_td[16], 4.466639, 5.475544);
	TextDrawAlignment(speed_global_td[16], 1);
	TextDrawColor(speed_global_td[16], -1777803777);
	TextDrawSetShadow(speed_global_td[16], 0);
	TextDrawSetOutline(speed_global_td[16], 0);
	TextDrawFont(speed_global_td[16], 4);

	speed_global_td[17] = TextDrawCreate(477.166687, 391.744415, "LD_SPAC:white"); // Texture element
	TextDrawLetterSize(speed_global_td[17], 0.000000, 0.000000);
	TextDrawTextSize(speed_global_td[17], 0.999979, 7.051867);
	TextDrawAlignment(speed_global_td[17], 1);
	TextDrawColor(speed_global_td[17], -1777803777);
	TextDrawSetShadow(speed_global_td[17], 0);
	TextDrawSetOutline(speed_global_td[17], 0);
	TextDrawFont(speed_global_td[17], 4);

	speed_global_td[18] = TextDrawCreate(474.333984, 389.173400, "F"); // text (box) amount of fuel
	TextDrawLetterSize(speed_global_td[18], 0.167326, 1.093925);
	TextDrawAlignment(speed_global_td[18], 2);
	TextDrawColor(speed_global_td[18], -1);
	TextDrawUseBox(speed_global_td[18], true);
	TextDrawBoxColor(speed_global_td[18], 0);
	TextDrawSetShadow(speed_global_td[18], 0);
	TextDrawSetOutline(speed_global_td[18], 0);
	TextDrawBackgroundColor(speed_global_td[18], -256);
	TextDrawFont(speed_global_td[18], 2);
	TextDrawSetProportional(speed_global_td[18], 1);

	speed_global_td[19] = TextDrawCreate(466.833557, 417.781402, "LD_SPAC:white"); // Texture element
	TextDrawLetterSize(speed_global_td[19], 0.000000, 0.000000);
	TextDrawTextSize(speed_global_td[19], 22.999969, 0.829635);
	TextDrawAlignment(speed_global_td[19], 1);
	TextDrawColor(speed_global_td[19], -1777803882);
	TextDrawSetShadow(speed_global_td[19], 0);
	TextDrawSetOutline(speed_global_td[19], 0);
	TextDrawFont(speed_global_td[19], 4);

	speed_global_td[20] = TextDrawCreate(476.833435, 392.574005, "LD_BEAT:chit"); // box decorative
	TextDrawLetterSize(speed_global_td[20], 0.000000, 0.000000);
	TextDrawTextSize(speed_global_td[20], 1.799970, -2.405934);
	TextDrawAlignment(speed_global_td[20], 1);
	TextDrawColor(speed_global_td[20], -1777803777);
	TextDrawSetShadow(speed_global_td[20], 0);
	TextDrawSetOutline(speed_global_td[20], 0);
	TextDrawFont(speed_global_td[20], 4);

	speed_global_td[21] = TextDrawCreate(441.166503, 387.681457, "LD_SPAC:white"); // Texture element
	TextDrawLetterSize(speed_global_td[21], 0.000000, 0.000000);
	TextDrawTextSize(speed_global_td[21], 0.666643, 32.355556);
	TextDrawAlignment(speed_global_td[21], 1);
	TextDrawColor(speed_global_td[21], 1577421567);
	TextDrawSetShadow(speed_global_td[21], 0);
	TextDrawSetOutline(speed_global_td[21], 0);
	TextDrawFont(speed_global_td[21], 4);

	speed_global_td[22] = TextDrawCreate(442.333190, 387.681457, "LD_SPAC:white"); // Texture element
	TextDrawLetterSize(speed_global_td[22], 0.000000, 0.000000);
	TextDrawTextSize(speed_global_td[22], 0.666643, 32.355556);
	TextDrawAlignment(speed_global_td[22], 1);
	TextDrawColor(speed_global_td[22], 1577421567);
	TextDrawSetShadow(speed_global_td[22], 0);
	TextDrawSetOutline(speed_global_td[22], 0);
	TextDrawFont(speed_global_td[22], 4);

	speed_global_td[23] = TextDrawCreate(408.833190, 387.681457, "LD_SPAC:white"); // Texture element
	TextDrawLetterSize(speed_global_td[23], 0.000000, 0.000000);
	TextDrawTextSize(speed_global_td[23], 0.666643, 32.355556);
	TextDrawAlignment(speed_global_td[23], 1);
	TextDrawColor(speed_global_td[23], 1577421567);
	TextDrawSetShadow(speed_global_td[23], 0);
	TextDrawSetOutline(speed_global_td[23], 0);
	TextDrawFont(speed_global_td[23], 4);

	speed_global_td[24] = TextDrawCreate(407.999755, 387.851776, "LD_SPAC:white"); // Texture element
	TextDrawLetterSize(speed_global_td[24], 0.000000, 0.000000);
	TextDrawTextSize(speed_global_td[24], 0.666643, 32.355556);
	TextDrawAlignment(speed_global_td[24], 1);
	TextDrawColor(speed_global_td[24], 1577421567);
	TextDrawSetShadow(speed_global_td[24], 0);
	TextDrawSetOutline(speed_global_td[24], 0);
	TextDrawFont(speed_global_td[24], 4);



    //123

	TEST_TD[0] = TextDrawCreate(153.8164, 178.3513, ""); // kosong
	TextDrawTextSize(TEST_TD[0], 90.0000, 90.0000);
	TextDrawAlignment(TEST_TD[0], 1);
	TextDrawColor(TEST_TD[0], -1);
	TextDrawBackgroundColor(TEST_TD[0], 255);
	TextDrawFont(TEST_TD[0], 5);
	TextDrawSetProportional(TEST_TD[0], 0);
	TextDrawSetShadow(TEST_TD[0], 0);
	TextDrawSetPreviewModel(TEST_TD[0], 0);
	TextDrawSetPreviewRot(TEST_TD[0], 0.0000, 0.0000, 0.0000, 1.0000);

 // LOGO

	logo_td[0] = TextDrawCreate(552.3001, 2.5424, ""); // �����
	TextDrawTextSize(logo_td[0], 32.5000, 32.5000);
	TextDrawAlignment(logo_td[0], 1);
	TextDrawColor(logo_td[0], 255);
	TextDrawBackgroundColor(logo_td[0], 255);
	TextDrawFont(logo_td[0], 4);
	TextDrawSetProportional(logo_td[0], 0);
	TextDrawSetShadow(logo_td[0], 0);
	TextDrawSetPreviewModel(logo_td[0], 1248);
	TextDrawSetPreviewRot(logo_td[0], 0.000000, 90.000000, 90.000000, 1.000000);

	logo_td[1] = TextDrawCreate(571.2501, 9.8240, ""); // �����
	TextDrawLetterSize(logo_td[1], 1.0420, 1.3770);
	TextDrawTextSize(logo_td[1], -1.0000, 0.0000);
	TextDrawAlignment(logo_td[1], 1);
	TextDrawColor(logo_td[1], 255);
	TextDrawBackgroundColor(logo_td[1], 255);
	TextDrawFont(logo_td[1], 1);
	TextDrawSetProportional(logo_td[1], 1);
	TextDrawSetShadow(logo_td[1], 0);

	logo_td[2] = TextDrawCreate(564.5834, 11.3796, ""); // �����
	TextDrawLetterSize(logo_td[2], 1.0420, 1.3770);
	TextDrawTextSize(logo_td[2], -1.0000, 0.0000);
	TextDrawAlignment(logo_td[2], 1);
	TextDrawColor(logo_td[2], 255);
	TextDrawBackgroundColor(logo_td[2], 255);
	TextDrawFont(logo_td[2], 1);
	TextDrawSetProportional(logo_td[2], 1);
	TextDrawSetShadow(logo_td[2], 0);

	logo_td[3] = TextDrawCreate(557.8503, 12.7721, ""); // �����
	TextDrawLetterSize(logo_td[3], 1.0420, 1.3770);
	TextDrawTextSize(logo_td[3], -1.0000, 0.0000);
	TextDrawAlignment(logo_td[3], 1);
	TextDrawColor(logo_td[3], 255);
	TextDrawBackgroundColor(logo_td[3], 255);
	TextDrawFont(logo_td[3], 1);
	TextDrawSetProportional(logo_td[3], 1);
	TextDrawSetShadow(logo_td[3], 0);

	logo_td[4] = TextDrawCreate(554.8668, 16.7832, ""); // �����
	TextDrawLetterSize(logo_td[4], 1.0420, 1.3770);
	TextDrawTextSize(logo_td[4], -1.0000, 0.0000);
	TextDrawAlignment(logo_td[4], 1);
	TextDrawColor(logo_td[4], 255);
	TextDrawBackgroundColor(logo_td[4], 255);
	TextDrawFont(logo_td[4], 1);
	TextDrawSetProportional(logo_td[4], 1);
	TextDrawSetShadow(logo_td[4], 0);

	logo_td[5] = TextDrawCreate(574.1836, 12.5612, ""); // �����
	TextDrawLetterSize(logo_td[5], 0.5541, 0.8325);
	TextDrawTextSize(logo_td[5], -0.4200, 0.0199);
	TextDrawAlignment(logo_td[5], 1);
	TextDrawColor(logo_td[5], -4456193);
	TextDrawBackgroundColor(logo_td[5], 255);
	TextDrawFont(logo_td[5], 1);
	TextDrawSetProportional(logo_td[5], 1);
	TextDrawSetShadow(logo_td[5], 0);

	logo_td[6] = TextDrawCreate(567.4169, 14.1537, ""); // �����
	TextDrawLetterSize(logo_td[6], 0.5541, 0.8325);
	TextDrawTextSize(logo_td[6], -0.4200, 0.0199);
	TextDrawAlignment(logo_td[6], 1);
	TextDrawColor(logo_td[6], -4456193);
	TextDrawBackgroundColor(logo_td[6], 255);
	TextDrawFont(logo_td[6], 1);
	TextDrawSetProportional(logo_td[6], 1);
	TextDrawSetShadow(logo_td[6], 0);

	logo_td[7] = TextDrawCreate(560.9169, 15.2277, ""); // �����
	TextDrawLetterSize(logo_td[7], 0.5541, 0.8325);
	TextDrawTextSize(logo_td[7], -0.4200, 0.0199);
	TextDrawAlignment(logo_td[7], 1);
	TextDrawColor(logo_td[7], -4456193);
	TextDrawBackgroundColor(logo_td[7], 255);
	TextDrawFont(logo_td[7], 1);
	TextDrawSetProportional(logo_td[7], 1);
	TextDrawSetShadow(logo_td[7], 0);

	logo_td[8] = TextDrawCreate(493.9995, 6.9703, "S"); // satu huruf
	TextDrawLetterSize(logo_td[8], 0.5541, 2.7186);
	TextDrawTextSize(logo_td[8], 0.2919, 1.3593);
	TextDrawAlignment(logo_td[8], 1);
	TextDrawColor(logo_td[8], 0x0000FFAA);
	TextDrawBackgroundColor(logo_td[8], 255);
	TextDrawFont(logo_td[8], 0);
	TextDrawSetProportional(logo_td[8], 1);
	TextDrawSetShadow(logo_td[8], 0);

	logo_td[9] = TextDrawCreate(555.9501, 6.8906, "LD_SPAC:white"); // �����
	TextDrawTextSize(logo_td[9], 25.4399, 11.8399);
	TextDrawAlignment(logo_td[9], 1);
	TextDrawColor(logo_td[9], 0xFF0000AA);
	TextDrawBackgroundColor(logo_td[9], 255);
	TextDrawFont(logo_td[9], 4);
	TextDrawSetProportional(logo_td[9], 0);
	TextDrawSetShadow(logo_td[9], 0);

	logo_td[10] = TextDrawCreate(556.1000, 18.6913, "LD_SPAC:white"); // ?????
	TextDrawTextSize(logo_td[10], 25.4399, 11.8399);
	TextDrawAlignment(logo_td[10], 1);
	TextDrawColor(logo_td[10], 0xFFFFFFAA);
	TextDrawBackgroundColor(logo_td[10], 255);
	TextDrawFont(logo_td[10], 4);
	TextDrawSetProportional(logo_td[10], 0);
	TextDrawSetShadow(logo_td[10], 0);

	logo_td[11] = TextDrawCreate(510.9995, 6.9703, "UBZERO"); // �����
	TextDrawLetterSize(logo_td[11], 0.2919, 1.3593);
	TextDrawAlignment(logo_td[11], 1);
	TextDrawColor(logo_td[11], 0x0000FFAA);
	TextDrawBackgroundColor(logo_td[11], 255);
	TextDrawFont(logo_td[11], 3);
	TextDrawSetProportional(logo_td[11], 1);
	TextDrawSetShadow(logo_td[11], 0);

	logo_td[12] = TextDrawCreate(510.6662, 18.0962, "ROLEPLAY"); // �����
	TextDrawLetterSize(logo_td[12], 0.2109, 1.3593);
	TextDrawAlignment(logo_td[12], 1);
	TextDrawColor(logo_td[12], -1);
	TextDrawBackgroundColor(logo_td[12], 255);
	TextDrawFont(logo_td[12], 2);
	TextDrawSetProportional(logo_td[12], 1);
	TextDrawSetShadow(logo_td[12], 0);

	logo_td[13] = TextDrawCreate(26.000000, 434.000000, ""); // �����
	TextDrawLetterSize(logo_td[12], 0.2109, 1.3593);
	TextDrawAlignment(logo_td[12], 1);
	TextDrawColor(logo_td[12], -1);
	TextDrawBackgroundColor(logo_td[12], 255);
	TextDrawFont(logo_td[12], 2);
	TextDrawSetProportional(logo_td[12], 1);
	TextDrawSetShadow(logo_td[12], 0);

	LoginTD[0] = TextDrawCreate(215.199996, 12.693316, "");
	TextDrawLetterSize(LoginTD[0], 1.075600, 5.407999);
	TextDrawTextSize(LoginTD[0], 132.000015, 121.706649);
	TextDrawAlignment(LoginTD[0], 1);
	TextDrawColor(LoginTD[0], -16776961);
	TextDrawSetShadow(LoginTD[0], 0);
	TextDrawSetOutline(LoginTD[0], -2);
	TextDrawBackgroundColor(LoginTD[0], 51);
	TextDrawFont(LoginTD[0], 0);
	TextDrawSetProportional(LoginTD[0], 1);

	LoginTD[1] = TextDrawCreate(347.199981, 21.653390, "");
	TextDrawLetterSize(LoginTD[1], 1.043599, 3.787733);
	TextDrawTextSize(LoginTD[1], -4.800001, -2.986665);
	TextDrawAlignment(LoginTD[1], 2);
	TextDrawColor(LoginTD[1], -16776961);
	TextDrawSetShadow(LoginTD[1], 0);
	TextDrawSetOutline(LoginTD[1], 1);
	TextDrawBackgroundColor(LoginTD[1], 51);
	TextDrawFont(LoginTD[1], 2);
	TextDrawSetProportional(LoginTD[1], 1);

	LoginTD[2] = TextDrawCreate(255.199996, 55.253330, "");
	TextDrawLetterSize(LoginTD[2], 0.762799, 2.384001);
	TextDrawAlignment(LoginTD[2], 1);
	TextDrawColor(LoginTD[2], -1);
	TextDrawSetShadow(LoginTD[2], 0);
	TextDrawSetOutline(LoginTD[2], 1);
	TextDrawBackgroundColor(LoginTD[2], 51);
	TextDrawFont(LoginTD[2], 2);
	TextDrawSetProportional(LoginTD[2], 1);

	LoginTD[3] = TextDrawCreate(239.199966, 54.506675, "");
	TextDrawLetterSize(LoginTD[3], 0.000000, 0.000000);
	TextDrawTextSize(LoginTD[3], 218.399993, 2.986663);
	TextDrawAlignment(LoginTD[3], 1);
	TextDrawColor(LoginTD[3], -1);
	TextDrawSetShadow(LoginTD[3], 0);
	TextDrawSetOutline(LoginTD[3], 8);
	TextDrawFont(LoginTD[3], 4);

	//Kasino

	for(new i, z = MAX_BONE_TABLES; i < z; i++)
	{
	    bones_table_td[i][0] = TextDrawCreate(7.1769, 209.4649, "BET:_0rp"); // ?????
		TextDrawLetterSize(bones_table_td[i][0], 0.2477, 1.3707);
		TextDrawAlignment(bones_table_td[i][0], 1);
		TextDrawColor(bones_table_td[i][0], -1271791617);
		TextDrawBackgroundColor(bones_table_td[i][0], -2144370623);
		TextDrawFont(bones_table_td[i][0], 1);
		TextDrawSetProportional(bones_table_td[i][0], 1);
		TextDrawSetShadow(bones_table_td[i][0], 1);

		bones_table_td[i][1] = TextDrawCreate(6.9345, 220.0489, "PLAYERS:_0/4"); // ?????
		TextDrawLetterSize(bones_table_td[i][1], 0.2105, 1.3664);
		TextDrawTextSize(bones_table_td[i][1], 1.0000, 0.0000);
		TextDrawAlignment(bones_table_td[i][1], 1);
		TextDrawColor(bones_table_td[i][1], -1271791617);
		TextDrawBackgroundColor(bones_table_td[i][1], -2144370623);
		TextDrawFont(bones_table_td[i][1], 1);
		TextDrawSetProportional(bones_table_td[i][1], 1);
		TextDrawSetShadow(bones_table_td[i][1], 1);
	}

	bones_global_td[0] = TextDrawCreate(5.4397, 187.8377, "Box"); // ?????
	TextDrawLetterSize(bones_global_td[0], 0.0000, 7.8110);
	TextDrawTextSize(bones_global_td[0], 128.0000, 0.0000);
	TextDrawAlignment(bones_global_td[0], 1);
	TextDrawColor(bones_global_td[0], -1);
	TextDrawUseBox(bones_global_td[0], 1);
	TextDrawBoxColor(bones_global_td[0], 81);
	TextDrawBackgroundColor(bones_global_td[0], 255);
	TextDrawFont(bones_global_td[0], 1);
	TextDrawSetProportional(bones_global_td[0], 1);
	TextDrawSetShadow(bones_global_td[0], 0);

	bones_global_td[1] = TextDrawCreate(5.7871, 205.7574, "Box"); // ?????
	TextDrawLetterSize(bones_global_td[1], 0.0000, -0.1454);
	TextDrawTextSize(bones_global_td[1], 128.0000, 0.0000);
	TextDrawAlignment(bones_global_td[1], 1);
	TextDrawColor(bones_global_td[1], -1);
	TextDrawUseBox(bones_global_td[1], 1);
	TextDrawBoxColor(bones_global_td[1], 437918463);
	TextDrawBackgroundColor(bones_global_td[1], 255);
	TextDrawFont(bones_global_td[1], 1);
	TextDrawSetProportional(bones_global_td[1], 1);
	TextDrawSetShadow(bones_global_td[1], 0);

	bones_global_td[2] = TextDrawCreate(49.2182, 187.4053, "CASINO"); // ?????
	TextDrawLetterSize(bones_global_td[2], 0.2692, 1.3923);
	TextDrawAlignment(bones_global_td[2], 1);
	TextDrawColor(bones_global_td[2], -1271791617);
	TextDrawBackgroundColor(bones_global_td[2], -2144370623);
	TextDrawFont(bones_global_td[2], 1);
	TextDrawSetProportional(bones_global_td[2], 1);
	TextDrawSetShadow(bones_global_td[2], 1);

	bones_global_td[3] = TextDrawCreate(104.7948, 241.8622, "EXIT"); // ?????
	TextDrawLetterSize(bones_global_td[3], 0.2863, 1.3102);
	TextDrawTextSize(bones_global_td[3], 10.0000, 40.0000);
	TextDrawAlignment(bones_global_td[3], 2);
	TextDrawColor(bones_global_td[3], -1271791617);
	TextDrawUseBox(bones_global_td[3], 1);
	TextDrawBoxColor(bones_global_td[3], 0);
	TextDrawBackgroundColor(bones_global_td[3], -2144370623);
	TextDrawFont(bones_global_td[3], 1);
	TextDrawSetProportional(bones_global_td[3], 1);
	TextDrawSetShadow(bones_global_td[3], 1);
	TextDrawSetSelectable(bones_global_td[3], true);

	bones_global_td[4] = TextDrawCreate(24.7318, 241.5973, "BET"); // ?????
	TextDrawLetterSize(bones_global_td[4], 0.2863, 1.3102);
	TextDrawTextSize(bones_global_td[4], 10.0000, 40.0000);
	TextDrawAlignment(bones_global_td[4], 2);
	TextDrawColor(bones_global_td[4], -1271791617);
	TextDrawUseBox(bones_global_td[4], 1);
	TextDrawBoxColor(bones_global_td[4], 0);
	TextDrawBackgroundColor(bones_global_td[4], -2144370623);
	TextDrawFont(bones_global_td[4], 1);
	TextDrawSetProportional(bones_global_td[4], 1);
	TextDrawSetShadow(bones_global_td[4], 1);
	TextDrawSetSelectable(bones_global_td[4], true);

	bones_global_td[5] = TextDrawCreate(5.8448, 237.7630, "Box"); // ?????
	TextDrawLetterSize(bones_global_td[5], 0.0000, -0.1801);
	TextDrawTextSize(bones_global_td[5], 128.0000, 0.0000);
	TextDrawAlignment(bones_global_td[5], 1);
	TextDrawColor(bones_global_td[5], -1);
	TextDrawUseBox(bones_global_td[5], 1);
	TextDrawBoxColor(bones_global_td[5], 437918463);
	TextDrawBackgroundColor(bones_global_td[5], 255);
	TextDrawFont(bones_global_td[5], 1);
	TextDrawSetProportional(bones_global_td[5], 1);
	TextDrawSetShadow(bones_global_td[5], 0);

	bones_global_td[6] = TextDrawCreate(62.6803, 242.0298, "DICE"); // ?????
	TextDrawLetterSize(bones_global_td[6], 0.2863, 1.3102);
	TextDrawTextSize(bones_global_td[6], 10.0000, 40.0000);
	TextDrawAlignment(bones_global_td[6], 2);
	TextDrawColor(bones_global_td[6], -1271791617);
	TextDrawUseBox(bones_global_td[6], 1);
	TextDrawBoxColor(bones_global_td[6], 0);
	TextDrawBackgroundColor(bones_global_td[6], -2144370623);
	TextDrawFont(bones_global_td[6], 1);
	TextDrawSetProportional(bones_global_td[6], 1);
	TextDrawSetShadow(bones_global_td[6], 1);
	TextDrawSetSelectable(bones_global_td[6], true);

	//Tuning

	tune_global_td[0] = TextDrawCreate(227.8067, 79.9686, "AIR_INTAKE"); // kosong
	TextDrawLetterSize(tune_global_td[0], 0.2685, 1.3317);
	TextDrawTextSize(tune_global_td[0], 0.0000, 84.0000);
	TextDrawAlignment(tune_global_td[0], 2);
	TextDrawColor(tune_global_td[0], -1);
	TextDrawUseBox(tune_global_td[0], 1);
	TextDrawBoxColor(tune_global_td[0], 73);
	TextDrawBackgroundColor(tune_global_td[0], 255);
	TextDrawFont(tune_global_td[0], 1);
	TextDrawSetProportional(tune_global_td[0], 1);
	TextDrawSetShadow(tune_global_td[0], 0);
	TextDrawSetSelectable(tune_global_td[0], true);

	tune_global_td[1] = TextDrawCreate(317.1011, 79.9685, "SPOILER"); // kosong
	TextDrawLetterSize(tune_global_td[1], 0.2685, 1.3317);
	TextDrawTextSize(tune_global_td[1], 0.0000, 84.0000);
	TextDrawAlignment(tune_global_td[1], 2);
	TextDrawColor(tune_global_td[1], -1);
	TextDrawUseBox(tune_global_td[1], 1);
	TextDrawBoxColor(tune_global_td[1], 73);
	TextDrawBackgroundColor(tune_global_td[1], 255);
	TextDrawFont(tune_global_td[1], 1);
	TextDrawSetProportional(tune_global_td[1], 1);
	TextDrawSetShadow(tune_global_td[1], 0);
	TextDrawSetSelectable(tune_global_td[1], true);

	tune_global_td[2] = TextDrawCreate(406.3581, 79.9685, "MUFFLER"); // kosong
	TextDrawLetterSize(tune_global_td[2], 0.2685, 1.3317);
	TextDrawTextSize(tune_global_td[2], 0.0000, 84.0000);
	TextDrawAlignment(tune_global_td[2], 2);
	TextDrawColor(tune_global_td[2], -1);
	TextDrawUseBox(tune_global_td[2], 1);
	TextDrawBoxColor(tune_global_td[2], 73);
	TextDrawBackgroundColor(tune_global_td[2], 255);
	TextDrawFont(tune_global_td[2], 1);
	TextDrawSetProportional(tune_global_td[2], 1);
	TextDrawSetShadow(tune_global_td[2], 0);
	TextDrawSetSelectable(tune_global_td[2], true);

	tune_global_td[3] = TextDrawCreate(227.8067, 61.5675, "FRONT_BUMBER"); // kosong
	TextDrawLetterSize(tune_global_td[3], 0.2685, 1.3317);
	TextDrawTextSize(tune_global_td[3], 0.0000, 84.0000);
	TextDrawAlignment(tune_global_td[3], 2);
	TextDrawColor(tune_global_td[3], -1);
	TextDrawUseBox(tune_global_td[3], 1);
	TextDrawBoxColor(tune_global_td[3], 73);
	TextDrawBackgroundColor(tune_global_td[3], 255);
	TextDrawFont(tune_global_td[3], 1);
	TextDrawSetProportional(tune_global_td[3], 1);
	TextDrawSetShadow(tune_global_td[3], 0);
	TextDrawSetSelectable(tune_global_td[3], true);

	tune_global_td[4] = TextDrawCreate(317.1011, 61.5675, "REAR_BUMBER"); // kosong
	TextDrawLetterSize(tune_global_td[4], 0.2685, 1.3317);
	TextDrawTextSize(tune_global_td[4], 0.0000, 84.0000);
	TextDrawAlignment(tune_global_td[4], 2);
	TextDrawColor(tune_global_td[4], -1);
	TextDrawUseBox(tune_global_td[4], 1);
	TextDrawBoxColor(tune_global_td[4], 73);
	TextDrawBackgroundColor(tune_global_td[4], 255);
	TextDrawFont(tune_global_td[4], 1);
	TextDrawSetProportional(tune_global_td[4], 1);
	TextDrawSetShadow(tune_global_td[4], 0);
	TextDrawSetSelectable(tune_global_td[4], true);

	tune_global_td[5] = TextDrawCreate(406.3581, 61.5675, "SIDE_SKIRTS"); // kosong
	TextDrawLetterSize(tune_global_td[5], 0.2685, 1.3317);
	TextDrawTextSize(tune_global_td[5], 0.0000, 84.0000);
	TextDrawAlignment(tune_global_td[5], 2);
	TextDrawColor(tune_global_td[5], -1);
	TextDrawUseBox(tune_global_td[5], 1);
	TextDrawBoxColor(tune_global_td[5], 73);
	TextDrawBackgroundColor(tune_global_td[5], 255);
	TextDrawFont(tune_global_td[5], 1);
	TextDrawSetProportional(tune_global_td[5], 1);
	TextDrawSetShadow(tune_global_td[5], 0);
	TextDrawSetSelectable(tune_global_td[5], true);

	tune_global_td[6] = TextDrawCreate(185.8603, 77.5999, "Box"); // kosong
	TextDrawLetterSize(tune_global_td[6], 0.0000, -0.1988);
	TextDrawTextSize(tune_global_td[6], 449.0000, 0.0000);
	TextDrawAlignment(tune_global_td[6], 1);
	TextDrawColor(tune_global_td[6], -1);
	TextDrawUseBox(tune_global_td[6], 1);
	TextDrawBoxColor(tune_global_td[6], 255);
	TextDrawBackgroundColor(tune_global_td[6], 255);
	TextDrawFont(tune_global_td[6], 1);
	TextDrawSetProportional(tune_global_td[6], 1);
	TextDrawSetShadow(tune_global_td[6], 0);

	tune_global_td[7] = TextDrawCreate(273.3226, 61.5999, "Box"); // kosong
	TextDrawLetterSize(tune_global_td[7], 0.0000, 3.3708);
	TextDrawTextSize(tune_global_td[7], 272.0000, 0.0000);
	TextDrawAlignment(tune_global_td[7], 1);
	TextDrawColor(tune_global_td[7], -1);
	TextDrawUseBox(tune_global_td[7], 1);
	TextDrawBoxColor(tune_global_td[7], 255);
	TextDrawBackgroundColor(tune_global_td[7], 255);
	TextDrawFont(tune_global_td[7], 1);
	TextDrawSetProportional(tune_global_td[7], 1);
	TextDrawSetShadow(tune_global_td[7], 0);

	tune_global_td[8] = TextDrawCreate(362.5220, 61.5323, "Box"); // kosong
	TextDrawLetterSize(tune_global_td[8], 0.0000, 3.3708);
	TextDrawTextSize(tune_global_td[8], 361.0000, 0.0000);
	TextDrawAlignment(tune_global_td[8], 1);
	TextDrawColor(tune_global_td[8], -1);
	TextDrawUseBox(tune_global_td[8], 1);
	TextDrawBoxColor(tune_global_td[8], 255);
	TextDrawBackgroundColor(tune_global_td[8], 255);
	TextDrawFont(tune_global_td[8], 1);
	TextDrawSetProportional(tune_global_td[8], 1);
	TextDrawSetShadow(tune_global_td[8], 0);

    //Perampokan

    rob_global_td[0] = TextDrawCreate(275.4071, 318.4323, "Box"); // ?????
	TextDrawLetterSize(rob_global_td[0], 0.0000, 1.8349);
	TextDrawTextSize(rob_global_td[0], 353.0000, 0.0000);
	TextDrawAlignment(rob_global_td[0], 1);
	TextDrawColor(rob_global_td[0], -1);
	TextDrawUseBox(rob_global_td[0], 1);
	TextDrawBoxColor(rob_global_td[0], 255);
	TextDrawBackgroundColor(rob_global_td[0], 255);
	TextDrawFont(rob_global_td[0], 1);
	TextDrawSetProportional(rob_global_td[0], 1);
	TextDrawSetShadow(rob_global_td[0], 0);

	rob_global_td[1] = TextDrawCreate(276.4494, 319.7296, "Box"); // ?????
	TextDrawLetterSize(rob_global_td[1], 0.0000, 1.5270);
	TextDrawTextSize(rob_global_td[1], 352.0000, 0.0000);
	TextDrawAlignment(rob_global_td[1], 1);
	TextDrawColor(rob_global_td[1], 1204715519);
	TextDrawUseBox(rob_global_td[1], 1);
	TextDrawBoxColor(rob_global_td[1], 1328835519);
	TextDrawBackgroundColor(rob_global_td[1], 255);
	TextDrawFont(rob_global_td[1], 1);
	TextDrawSetProportional(rob_global_td[1], 1);
	TextDrawSetShadow(rob_global_td[1], 0);

    //Grafiti

    graffiti_global_td[0] = TextDrawCreate(275.4071, 318.4323, "Box"); // ?????
	TextDrawLetterSize(graffiti_global_td[0], 0.0000, 1.8349);
	TextDrawTextSize(graffiti_global_td[0], 353.0000, 0.0000);
	TextDrawAlignment(graffiti_global_td[0], 1);
	TextDrawColor(graffiti_global_td[0], -1);
	TextDrawUseBox(graffiti_global_td[0], 1);
	TextDrawBoxColor(graffiti_global_td[0], 255);
	TextDrawBackgroundColor(graffiti_global_td[0], 255);
	TextDrawFont(graffiti_global_td[0], 1);
	TextDrawSetProportional(graffiti_global_td[0], 1);
	TextDrawSetShadow(graffiti_global_td[0], 0);

	graffiti_global_td[1] = TextDrawCreate(276.4494, 319.7296, "Box"); // ?????
	TextDrawLetterSize(graffiti_global_td[1], 0.0000, 1.5270);
	TextDrawTextSize(graffiti_global_td[1], 352.0000, 0.0000);
	TextDrawAlignment(graffiti_global_td[1], 1);
	TextDrawColor(graffiti_global_td[1], 1204715519);
	TextDrawUseBox(graffiti_global_td[1], 1);
	TextDrawBoxColor(graffiti_global_td[1], 1328835519);
	TextDrawBackgroundColor(graffiti_global_td[1], 255);
	TextDrawFont(graffiti_global_td[1], 1);
	TextDrawSetProportional(graffiti_global_td[1], 1);
	TextDrawSetShadow(graffiti_global_td[1], 0);

    //Pilihan kulit

    skinTD[0] = TextDrawCreate(316.0585, 418.7568, "SELECT"); // ?????
	TextDrawLetterSize(skinTD[0], 0.2985, 1.6043);
	TextDrawTextSize(skinTD[0], 15.0000, 97.0000);
	TextDrawAlignment(skinTD[0], 2);
	TextDrawColor(skinTD[0], -1);
	TextDrawUseBox(skinTD[0], 1);
	TextDrawBoxColor(skinTD[0], 68);
	TextDrawBackgroundColor(skinTD[0], 255);
	TextDrawFont(skinTD[0], 1);
	TextDrawSetProportional(skinTD[0], 1);
	TextDrawSetShadow(skinTD[0], 0);
	TextDrawSetSelectable(skinTD[0], true);

	skinTD[1] = TextDrawCreate(288.7846, 398.8649, "NEXT"); // ?????
	TextDrawLetterSize(skinTD[1], 0.2985, 1.6043);
	TextDrawTextSize(skinTD[1], 15.0000, 42.0000);
	TextDrawAlignment(skinTD[1], 2);
	TextDrawColor(skinTD[1], -1);
	TextDrawUseBox(skinTD[1], 1);
	TextDrawBoxColor(skinTD[1], 68);
	TextDrawBackgroundColor(skinTD[1], 255);
	TextDrawFont(skinTD[1], 1);
	TextDrawSetProportional(skinTD[1], 1);
	TextDrawSetShadow(skinTD[1], 0);
	TextDrawSetSelectable(skinTD[1], true);

	skinTD[2] = TextDrawCreate(343.3071, 398.8325, "PREV"); // ?????
	TextDrawLetterSize(skinTD[2], 0.2985, 1.6043);
	TextDrawTextSize(skinTD[2], 15.0000, 42.0000);
	TextDrawAlignment(skinTD[2], 2);
	TextDrawColor(skinTD[2], -1);
	TextDrawUseBox(skinTD[2], 1);
	TextDrawBoxColor(skinTD[2], 68);
	TextDrawBackgroundColor(skinTD[2], 255);
	TextDrawFont(skinTD[2], 1);
	TextDrawSetProportional(skinTD[2], 1);
	TextDrawSetShadow(skinTD[2], 0);
	TextDrawSetSelectable(skinTD[2], true);

    //Pasar mobil

	autoshop_global_td[0] = TextDrawCreate(316.0058, 394.4739, "select"); // kosong
	TextDrawLetterSize(autoshop_global_td[0], 0.2152, 1.3443);
	TextDrawTextSize(autoshop_global_td[0], 0.0000, 75.0000);
	TextDrawAlignment(autoshop_global_td[0], 2);
	TextDrawColor(autoshop_global_td[0], -1);
	TextDrawUseBox(autoshop_global_td[0], 1);
	TextDrawBoxColor(autoshop_global_td[0], 437918463);
	TextDrawBackgroundColor(autoshop_global_td[0], 255);
	TextDrawFont(autoshop_global_td[0], 2);
	TextDrawSetProportional(autoshop_global_td[0], 1);
	TextDrawSetShadow(autoshop_global_td[0], 0);

	autoshop_global_td[1] = TextDrawCreate(370.3475, 394.4190, ">>>"); // Panah warna
	TextDrawLetterSize(autoshop_global_td[1], 0.1682, 1.3559);
	TextDrawTextSize(autoshop_global_td[1], 10.0000, 24.0000);
	TextDrawAlignment(autoshop_global_td[1], 2);
	TextDrawColor(autoshop_global_td[1], -1);
	TextDrawUseBox(autoshop_global_td[1], 1);
	TextDrawBoxColor(autoshop_global_td[1], 437918463);
	TextDrawBackgroundColor(autoshop_global_td[1], 255);
	TextDrawFont(autoshop_global_td[1], 2);
	TextDrawSetProportional(autoshop_global_td[1], 1);
	TextDrawSetShadow(autoshop_global_td[1], 0);
	TextDrawSetSelectable(autoshop_global_td[1], true);

	autoshop_global_td[2] = TextDrawCreate(262.1549, 394.5541, "<<<"); // Panah warna
	TextDrawLetterSize(autoshop_global_td[2], 0.1520, 1.3413);
	TextDrawTextSize(autoshop_global_td[2], 10.0000, 24.0000);
	TextDrawAlignment(autoshop_global_td[2], 2);
	TextDrawColor(autoshop_global_td[2], -1);
	TextDrawUseBox(autoshop_global_td[2], 1);
	TextDrawBoxColor(autoshop_global_td[2], 437918463);
	TextDrawBackgroundColor(autoshop_global_td[2], 255);
	TextDrawFont(autoshop_global_td[2], 2);
	TextDrawSetProportional(autoshop_global_td[2], 1);
	TextDrawSetShadow(autoshop_global_td[2], 0);
	TextDrawSetSelectable(autoshop_global_td[2], true);

	autoshop_global_td[3] = TextDrawCreate(250.1640, 361.9808, "Box"); // kosong
	TextDrawLetterSize(autoshop_global_td[3], 0.0000, 2.9012);
	TextDrawTextSize(autoshop_global_td[3], 383.0000, 0.0000);
	TextDrawAlignment(autoshop_global_td[3], 1);
	TextDrawColor(autoshop_global_td[3], -1);
	TextDrawUseBox(autoshop_global_td[3], 1);
	TextDrawBoxColor(autoshop_global_td[3], 78);
	TextDrawBackgroundColor(autoshop_global_td[3], 255);
	TextDrawFont(autoshop_global_td[3], 1);
	TextDrawSetProportional(autoshop_global_td[3], 1);
	TextDrawSetShadow(autoshop_global_td[3], 0);

	autoshop_global_td[4] = TextDrawCreate(316.1427, 331.0439, "CAR_SHOWROOM"); // kosong
	TextDrawLetterSize(autoshop_global_td[4], 0.2377, 1.2365);
	TextDrawAlignment(autoshop_global_td[4], 2);
	TextDrawColor(autoshop_global_td[4], -1);
	TextDrawBackgroundColor(autoshop_global_td[4], 255);
	TextDrawFont(autoshop_global_td[4], 1);
	TextDrawSetProportional(autoshop_global_td[4], 1);
	TextDrawSetShadow(autoshop_global_td[4], 0);

	autoshop_global_td[5] = TextDrawCreate(281.7983, 418.0679, "BUY"); // kosong
	TextDrawLetterSize(autoshop_global_td[5], 0.3210, 1.3837);
	TextDrawTextSize(autoshop_global_td[5], 10.0000, 63.0000);
	TextDrawAlignment(autoshop_global_td[5], 2);
	TextDrawColor(autoshop_global_td[5], -1);
	TextDrawUseBox(autoshop_global_td[5], 1);
	TextDrawBoxColor(autoshop_global_td[5], 437918463);
	TextDrawBackgroundColor(autoshop_global_td[5], 255);
	TextDrawFont(autoshop_global_td[5], 1);
	TextDrawSetProportional(autoshop_global_td[5], 1);
	TextDrawSetShadow(autoshop_global_td[5], 0);
	TextDrawSetSelectable(autoshop_global_td[5], true);

	autoshop_global_td[6] = TextDrawCreate(350.9559, 418.0679, "CANCEL"); // kosong
	TextDrawLetterSize(autoshop_global_td[6], 0.2876, 1.3967);
	TextDrawTextSize(autoshop_global_td[6], 10.0000, 63.0000);
	TextDrawAlignment(autoshop_global_td[6], 2);
	TextDrawColor(autoshop_global_td[6], -1);
	TextDrawUseBox(autoshop_global_td[6], 1);
	TextDrawBoxColor(autoshop_global_td[6], 437918463);
	TextDrawBackgroundColor(autoshop_global_td[6], 255);
	TextDrawFont(autoshop_global_td[6], 1);
	TextDrawSetProportional(autoshop_global_td[6], 1);
	TextDrawSetShadow(autoshop_global_td[6], 0);
	TextDrawSetSelectable(autoshop_global_td[6], true);

	autoshop_global_td[7] = TextDrawCreate(292.3540, 362.2340, "price:~n~max_speed:~n~tank:"); // kosong
	TextDrawLetterSize(autoshop_global_td[7], 0.1605, 0.8883);
	TextDrawAlignment(autoshop_global_td[7], 1);
	TextDrawColor(autoshop_global_td[7], -1);
	TextDrawBackgroundColor(autoshop_global_td[7], 255);
	TextDrawFont(autoshop_global_td[7], 2);
	TextDrawSetProportional(autoshop_global_td[7], 1);
	TextDrawSetShadow(autoshop_global_td[7], 0);
}
