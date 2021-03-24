

stock AuctionMart()
{
	print("\n--------------------------------------");
	printf("\nAdd Auction Mart Building Done\n");
	print("\n--------------------------------------");
	

	//MAPPINGINDOMARET
	
	//SIGNINDOMART
	new signindomart[1];
	signindomart[0] = CreateDynamicObject(18244, 1351.04651, -1759.54700, 17.95660,   90.00000, 0.00000, 180.00000);
	for (new i = 0; i < sizeof(signindomart); i++)
	{
	    SetDynamicObjectMaterial(signindomart[i],  0, 2361, "shopping_freezers", "white", 0xFF006ECF);
	}
	//TEMBOK
	new tmbkindomart[6];
	tmbkindomart[0] = CreateDynamicObject(18765, 1359.08105, -1764.49963, 12.73390,   0.00000, 0.00000, 0.00000);
	tmbkindomart[1] = CreateDynamicObject(18765, 1339.13916, -1764.49963, 17.73340,   0.00000, 0.00000, 0.00000);
	tmbkindomart[2] = CreateDynamicObject(18765, 1349.10645, -1764.49963, 17.73340,   0.00000, 0.00000, 0.00000);
	tmbkindomart[3] = CreateDynamicObject(18765, 1359.08105, -1764.49963, 17.73343,   0.00000, 0.00000, 0.00000);
	tmbkindomart[4] = CreateDynamicObject(18765, 1349.10645, -1764.49963, 12.73390,   0.00000, 0.00000, 0.00000);
	tmbkindomart[5] = CreateDynamicObject(18765, 1339.13916, -1764.49963, 12.73390,   0.00000, 0.00000, 0.00000);
	for (new i = 0; i < sizeof(tmbkindomart); i++)
	{
	    SetDynamicObjectMaterial(tmbkindomart[i],  0, 8675, "wddngchpl02", "vgschapelwall01_64", 0xFFFFFFFF);
	}
	//ROPEPINTU
	new rpindomart[2];
	rpindomart[0] = CreateDynamicObject(19089, 1351.04431, -1759.42700, 15.70810,   0.00000, 0.00000, 0.00000);
	rpindomart[1] = CreateDynamicObject(19089, 1351.01843, -1759.42700, 15.70810,   0.00000, 0.00000, 0.00000);
	for(new i = 0; i < sizeof(rpindomart); i++)
	{
	    SetDynamicObjectMaterial(rpindomart[i], 0, 3673, "xrf_refineryla", "Metal3_128", 0xFFFFFFFF);
	}
	//PINTUDEPAN
	new pdindomart[1];
	pdindomart[0] = CreateDynamicObject(19353, 1351.06665, -1759.51575, 13.95650,   0.00000, 0.00000, 90.00000);
	for(new i = 0; i < sizeof(pdindomart); i++)
	{
	    SetDynamicObjectMaterial(pdindomart[i], 0, 3255, "refinery", "ws_greymetal", 0xFFFFFFFF);
	}
	//PINTUBELAKANG
	new pbindomart[1];
	pbindomart[0] = CreateDynamicObject(19355, 1347.23621, -1769.41565, 13.87026,   0.00000, 0.00000, 90.00000);
	for(new i = 0; i < sizeof(pbindomart); i++)
	{
	    SetDynamicObjectMaterial(pbindomart[i], 0, 8390, "vegasemulticar", "ws_doubledoor1", 0xFFFFFFFF);
	}
	//TEPIKACA
	new tkindomart[7];
	tkindomart[0] = CreateDynamicObject(19460, 1336.66785, -1764.22168, 14.12760,   0.00000, 0.00000, 0.00000);
	tkindomart[1] = CreateDynamicObject(19460, 1339.98682, -1761.15552, 15.78660,   0.00000, 90.00000, 90.00000);
	tkindomart[2] = CreateDynamicObject(19460, 1349.37317, -1764.22168, 14.12360,   0.00000, 0.00000, 0.00000);
	tkindomart[3] = CreateDynamicObject(19460, 1359.25232, -1761.15552, 15.78660,   0.00000, 90.00000, 90.00000);
	tkindomart[4] = CreateDynamicObject(19460, 1349.62219, -1761.15552, 15.78660,   0.00000, 90.00000, 90.00000);
	tkindomart[5] = CreateDynamicObject(19460, 1363.97131, -1764.22168, 14.12360,   0.00000, 0.00000, 0.00000);
	tkindomart[6] = CreateDynamicObject(19460, 1352.69019, -1764.22168, 14.12360,   0.00000, 0.00000, 0.00000);
	for(new i = 0; i < sizeof(tkindomart); i++)
	{
	    SetDynamicObjectMaterial(tkindomart[i], 0, 1676, "wshxrefpump", "metalic128", 0xFFFFFFFF);
	}
	//KACA
	new winindomart[3];
	winindomart[0] = CreateDynamicObject(19458, 1341.39099, -1759.58386, 13.95280,   0.00000, 0.00000, 90.00000);
	winindomart[1] = CreateDynamicObject(19458, 1350.88696, -1759.58191, 13.95280,   0.00000, 0.00000, 90.00000);
	winindomart[2] = CreateDynamicObject(19458, 1359.26074, -1759.58386, 13.95280,   0.00000, 0.00000, 90.00000);
	for(new i = 0; i < sizeof(winindomart); i++)
	{
	    SetDynamicObjectMaterial(winindomart[i], 0, 5040, "shopliquor_las", "sw_wind16", 0xFFFFFFFF);
	}
	//KACAATAS
	new kaindomart[4];
	kaindomart[0] = CreateDynamicObject(18880, 1341.19482, -1756.11731, 15.87800,   0.00000, 90.00000, -90.00000);
	kaindomart[1] = CreateDynamicObject(18880, 1360.97852, -1756.11731, 15.87800,   0.00000, 90.00000, -90.00000);
	kaindomart[2] = CreateDynamicObject(18880, 1354.41638, -1756.11731, 15.87800,   0.00000, 90.00000, -90.00000);
	kaindomart[3] = CreateDynamicObject(18880, 1347.76880, -1756.11731, 15.87800,   0.00000, 90.00000, -90.00000);
	for(new i = 0; i < sizeof(kaindomart); i++)
	{
	    SetDynamicObjectMaterial(kaindomart[i], 0, 1676, "wshxrefpump", "metalic128", 0xFFFFFFFF);
	    SetDynamicObjectMaterial(kaindomart[i], 2, 8572, "vgssstairs1", "metalic_64", 0xFFFFFFFF);
	}
	//REDLINEINDOMART
	new rlindomart[12];
	rlindomart[0] = CreateDynamicObject(19834, 1362.71460, -1759.41321, 14.21700,   0.00000, 0.00000, 0.00000);
	rlindomart[1] = CreateDynamicObject(19834, 1360.38110, -1759.41321, 14.21700,   0.00000, 0.00000, 0.00000);
	rlindomart[2] = CreateDynamicObject(19834, 1358.04810, -1759.41321, 14.21700,   0.00000, 0.00000, 0.00000);
	rlindomart[3] = CreateDynamicObject(19834, 1355.71326, -1759.41321, 14.21700,   0.00000, 0.00000, 0.00000);
	rlindomart[4] = CreateDynamicObject(19834, 1353.38062, -1759.41321, 14.21700,   0.00000, 0.00000, 0.00000);
	rlindomart[5] = CreateDynamicObject(19834, 1351.04712, -1759.41321, 14.21700,   0.00000, 0.00000, 0.00000);
	rlindomart[6] = CreateDynamicObject(19834, 1348.71313, -1759.41321, 14.21700,   0.00000, 0.00000, 0.00000);
	rlindomart[7] = CreateDynamicObject(19834, 1346.38025, -1759.41321, 14.21700,   0.00000, 0.00000, 0.00000);
	rlindomart[8] = CreateDynamicObject(19834, 1344.04944, -1759.41321, 14.21700,   0.00000, 0.00000, 0.00000);
	rlindomart[9] = CreateDynamicObject(19834, 1341.71045, -1759.41321, 14.21700,   0.00000, 0.00000, 0.00000);
	rlindomart[10] = CreateDynamicObject(19834, 1339.37280, -1759.41321, 14.21700,   0.00000, 0.00000, 0.00000);
	rlindomart[11] = CreateDynamicObject(19834, 1337.03650, -1759.41321, 14.21700,   0.00000, 0.00000, 0.00000);
	for (new i = 0; i < sizeof(rlindomart); i++)
	{
	    SetDynamicObjectMaterial(rlindomart[i], 0, 2361, "shopping_freezers", "white", 0xFFCF0000);
	}
	//BLUELINEINDOMART
	new blindomart[12];
	blindomart[0] = CreateDynamicObject(19834, 1362.71460, -1759.41321, 14.06500,   0.00000, 0.00000, 0.00000);
	blindomart[1] = CreateDynamicObject(19834, 1337.03650, -1759.41321, 14.06500,   0.00000, 0.00000, 0.00000);
	blindomart[2] = CreateDynamicObject(19834, 1355.71326, -1759.41321, 14.06500,   0.00000, 0.00000, 0.00000);
	blindomart[3] = CreateDynamicObject(19834, 1358.04810, -1759.41321, 14.06500,   0.00000, 0.00000, 0.00000);
	blindomart[4] = CreateDynamicObject(19834, 1360.38110, -1759.41321, 14.06500,   0.00000, 0.00000, 0.00000);
	blindomart[5] = CreateDynamicObject(19834, 1353.38062, -1759.41321, 14.06500,   0.00000, 0.00000, 0.00000);
	blindomart[6] = CreateDynamicObject(19834, 1351.04712, -1759.41321, 14.06500,   0.00000, 0.00000, 0.00000);
	blindomart[7] = CreateDynamicObject(19834, 1348.71313, -1759.41321, 14.06500,   0.00000, 0.00000, 0.00000);
	blindomart[8] = CreateDynamicObject(19834, 1346.38025, -1759.41321, 14.06500,   0.00000, 0.00000, 0.00000);
	blindomart[9] = CreateDynamicObject(19834, 1344.04944, -1759.41321, 14.06500,   0.00000, 0.00000, 0.00000);
	blindomart[10] = CreateDynamicObject(19834, 1341.71045, -1759.41321, 14.06500,   0.00000, 0.00000, 0.00000);
	blindomart[11] = CreateDynamicObject(19834, 1339.37280, -1759.41321, 14.06500,   0.00000, 0.00000, 0.00000);
	for (new i = 0; i < sizeof(blindomart); i++)
	{
	    SetDynamicObjectMaterial(blindomart[i], 0, 2361, "shopping_freezers", "white", 0xFF006ECF);
	}
	//YELLOWLINEINDOMART
	new ylindomart[12];
	ylindomart[0] = CreateDynamicObject(19834, 1362.71460, -1759.41321, 13.91300,   0.00000, 0.00000, 0.00000);
	ylindomart[1] = CreateDynamicObject(19834, 1360.38110, -1759.41321, 13.91300,   0.00000, 0.00000, 0.00000);
	ylindomart[2] = CreateDynamicObject(19834, 1358.04810, -1759.41321, 13.91300,   0.00000, 0.00000, 0.00000);
	ylindomart[3] = CreateDynamicObject(19834, 1355.71326, -1759.41321, 13.91300,   0.00000, 0.00000, 0.00000);
	ylindomart[4] = CreateDynamicObject(19834, 1353.38062, -1759.41321, 13.91300,   0.00000, 0.00000, 0.00000);
	ylindomart[5] = CreateDynamicObject(19834, 1351.04712, -1759.41321, 13.91300,   0.00000, 0.00000, 0.00000);
	ylindomart[6] = CreateDynamicObject(19834, 1348.71313, -1759.41321, 13.91300,   0.00000, 0.00000, 0.00000);
	ylindomart[7] = CreateDynamicObject(19834, 1346.38025, -1759.41321, 13.91300,   0.00000, 0.00000, 0.00000);
	ylindomart[8] = CreateDynamicObject(19834, 1344.04944, -1759.41321, 13.91300,   0.00000, 0.00000, 0.00000);
	ylindomart[9] = CreateDynamicObject(19834, 1341.71045, -1759.41321, 13.91300,   0.00000, 0.00000, 0.00000);
	ylindomart[10] = CreateDynamicObject(19834, 1339.37280, -1759.41321, 13.91300,   0.00000, 0.00000, 0.00000);
	ylindomart[11] = CreateDynamicObject(19834, 1337.03650, -1759.41321, 13.91300,   0.00000, 0.00000, 0.00000);
	for (new i = 0; i < sizeof(ylindomart); i++)
	{
	    SetDynamicObjectMaterial(ylindomart[i], 0, 2361, "shopping_freezers", "white", 0xFFCFC500);
	}
	//NOTEXTUREINDOMART
	CreateDynamicObject(19325, 1364.29700, -1759.41821, 13.76040,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19325, 1337.74707, -1759.41821, 13.76040,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19325, 1351.02954, -1759.41821, 13.76040,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19325, 1344.38794, -1759.41821, 13.76040,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19325, 1357.65454, -1759.41821, 13.76040,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1635, 1341.52173, -1770.06372, 17.83020,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1635, 1360.66565, -1770.08777, 17.83020,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1372, 1339.32153, -1769.99280, 12.54270,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1372, 1337.43811, -1769.98035, 12.54270,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2957, 1354.37793, -1769.46375, 14.08710,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(792, 1362.55701, -1754.32715, 12.81680,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(792, 1339.33447, -1752.32324, 12.81680,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(792, 1362.58826, -1745.36670, 12.81680,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(792, 1355.82019, -1742.65479, 12.81680,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(792, 1340.10510, -1744.07507, 12.81680,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19121, 1354.39575, -1742.30359, 12.95860,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19325, 1357.67725, -1758.18286, 15.86760,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19325, 1344.46667, -1758.18286, 15.86760,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19325, 1351.11304, -1758.18286, 15.86760,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(1349, 1345.84155, -1759.10657, 13.07520,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1349, 1347.86987, -1759.05103, 13.07520,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1349, 1347.46399, -1759.06213, 13.07520,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1349, 1347.05811, -1759.07324, 13.07520,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1349, 1346.65332, -1759.08435, 13.07520,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1349, 1346.24744, -1759.09546, 13.07520,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1594, 1359.62061, -1757.89587, 12.96340,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1594, 1355.89453, -1758.05139, 12.96340,   0.00000, 0.00000, 0.00000);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
}



stock RemoveOldAuctionMartBuilding(playerid)
{
	print("\n--------------------------------------");
	printf("\nRemove Old Auction Mart Building Done\n");
	print("\n--------------------------------------");
	RemoveBuildingForPlayer(playerid, 4191, 1353.2578, -1764.5313, 15.5938, 0.25);
	RemoveBuildingForPlayer(playerid, 4022, 1353.2578, -1764.5313, 15.5938, 0.25);
	RemoveBuildingForPlayer(playerid, 1532, 1353.1328, -1759.6563, 12.5000, 0.25);
}
