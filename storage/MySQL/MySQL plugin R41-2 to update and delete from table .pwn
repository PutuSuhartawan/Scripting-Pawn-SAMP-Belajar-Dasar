	
enum xv_data
{
	xv_Veh,
	xv_ModelID,
	xv_OwnerIDinSvr,
	xv_Renk[2],
	Float:xv_Pos[4],
	xv_Paintjob,
	xv_Parca[14],
	xv_Sahip[24],
	xv_Plaka[8],
	xv_Garajda,
	Text3D:xv_Text,
	xv_Fiyat,
	xv_HizliPark,
	Float:xv_darahbyricho,
	xv_bensin,
	xv_taneman,
	xv_asuransi,
	xv_OnOffice,
	xv_world,
	xv_kayu,
	xv_boxtrucker,
	xv_tirelock,
	xv_lockstats,
	xv_object[2],
	Float:xv_objectpos[12]
};

new
	xVehicle[MAX_VEHICLES][xv_data],
	xVeh[MAX_VEHICLES],
	offerTimer[MAX_PLAYERS],
	Iterator:xVehicles<MAX_VEHICLES>,
	Iterator:xVehicleKeys<MAX_PLAYERS, MAX_VEHICLES>,
	MySQL:mysqlB
;

new VehicleNames[][] =
{
    "Landstalker", "Bravura", "Buffalo", "Linerunner", "Perrenial", "Sentinel",
	"Dumper", "Firetruck", "Trashmaster", "Stretch", "Manana", "Infernus",
	"Voodoo", "Pony", "Mule", "Cheetah", "Ambulance", "Leviathan", "Moonbeam",
    "Esperanto", "Taxi", "Washington", "Bobcat", "Whoopee", "BFInjection",
	"Hunter", "Premier", "Enforcer", "Securicar", "Banshee", "Predator", "Bus",
	"Rhino", "Barracks", "Hotknife", "Trailer", "Previon", "Coach", "Cabbie",
	"Stallion", "Rumpo", "RC Bandit", "Romero", "Packer", "Monster", "Admiral",
	"Squalo", "Seasparrow", "Pizzaboy", "Tram", "Trailer", "Turismo", "Speeder",
	"Reefer", "Tropic", "Flatbed", "Yankee", "Caddy", "Solair", "BerkleysRCVan",
	"Skimmer", "PCJ-600", "Faggio", "Freeway", "RCBaron", "RCRaider", "Glendale",
	"Oceanic","Sanchez", "Sparrow", "Patriot", "Quad", "Coastguard", "Dinghy",
	"Hermes", "Sabre", "Rustler", "ZR-350", "Walton", "Regina", "Comet", "BMX",
	"Burrito", "Camper", "Marquis", "Baggage", "Dozer", "Maverick", "NewsChopper",
	"Rancher", "FBI Rancher", "Virgo", "Greenwood", "Jetmax", "Hotring", "Sandking",
	"BlistaCompact", "PoliceMaverick", "Boxvillde", "Benson", "Mesa", "RCGoblin",
	"HotringRacerA", "HotringRacerB", "BloodringBanger", "Rancher", "SuperGT",
	"Elegant", "Journey", "Bike", "MountainBike", "Beagle", "Cropduster", "Stunt",
 	"Tanker", "Roadtrain", "Nebula", "Majestic", "Buccaneer", "Shamal", "Hydra",
 	"FCR-900", "NRG-500", "HPV1000", "CementTruck", "TowTruck", "Fortune",
 	"Cadrona", "FBITruck", "Willard", "Forklift", "Tractor", "Combine", "Feltzer",
 	"Remington", "Slamvan", "Blade", "Freight", "Streak", "Vortex", "Vincent",
    "Bullet", "Clover", "Sadler", "Firetruck", "Hustler", "Intruder", "Primo",
	"Cargobob", "Tampa", "Sunrise", "Merit", "Utility", "Nevada", "Yosemite",
	"Windsor", "Monster", "Monster", "Uranus", "Jester", "Sultan", "Stratium",
	"Elegy", "Raindance", "RCTiger", "Flash", "Tahoma", "Savanna", "Bandito",
    "FreightFlat", "StreakCarriage", "Kart", "Mower", "Dune", "Sweeper",
	"Broadway", "Tornado", "AT-400", "DFT-30", "Huntley", "Stafford", "BF-400",
	"News Van", "Tug", "Trailer", "Emperor", "Wayfarer", "Euros", "Hotdog", "Club",
	"FreightBox", "Trailer", "Andromada", "Dodo", "RC Cam", "Launch", "SAPD",
 	"SFPD", "LVPD", "PoliceRanger", "Picador", "S.W.A.T", "Alpha",
 	"Phoenix", "Glendale", "Sadler", "Luggage", "Luggage", "Stairs", "Boxville",
 	"Tiller", "UtilityTrailer"
};



  
  
  // xv_asuransi
	new query[128];

	if(xVehicle[xid][xv_asuransi] > 1 ) // insurance system have insu more than 0
	{
	    //DestroyVehicle(vehicleid);
		// butuh enum xv
	    xVehicle[xid][xv_asuransi]=xVehicle[xid][xv_asuransi]-1;
	    xVehicle[xid][xv_OnOffice] = 1;
	    xVehicle[xid][xv_world] = 1;
	        	

		
		mysql_format(mysqlB, query, sizeof(query), "UPDATE `xVehicle` SET `World`='1',`OnOffice`='1',`Insu`='%i' WHERE `ID`='%i'",
		xVehicle[xid][xv_asuransi], xVehicle[xid][xv_Veh]);
		mysql_query(mysqlB, query);
		//format(str,sizeof(str),"UPDATE `car` SET `World`='1',`OnOffice`='1',`Insu`='%i' WHERE `ID`='%i'", xVehicle[xid][xv_asuransi], xVehicle[xid][xv_Veh]);
		//n_mysql_query( MySQL1, str, false);
		SavexVehicle(xid); //SaveCars(vehicleid, VID, 2);
		GameTextForPlayer( xVehicle[xid][xv_OwnerIDinSvr], query, 5000, 1);
	    SendClientMessage( xVehicle[xid][xv_OwnerIDinSvr], 0xAACCFFFF, "PLAYERCAR: Your vehicle has been destroyed and you can claim it in insurance Office. with '/claiminsu'");
	    return 1;
	}

	if(xVehicle[xid][xv_asuransi]<=0) // insurance system if they are have no insurance
	{
	    xVehicle[xid][xv_asuransi]=0;
	    
	    DestroyVehicle(vehicleid); // removing vehicle on server
    		//car = car-1;
    		mysql_format(mysqlB, query, sizeof(query), "DELETE FROM `xVehicle` WHERE `ID` = '%i'", xVehicle[xid][xv_Veh]);
    		mysql_query(mysqlB, query); // removing vehilce player car from DB SQL
    		GameTextForPlayer( xVehicle[xid][xv_OwnerIDinSvr], query, 5000, 1);
    		// xVehicle[xid][cOwner]
    		SendClientMessage(xVehicle[xid][xv_OwnerIDinSvr], 0xAACCFFFF, query); SendClientMessage( xVehicle[xid][xv_OwnerIDinSvr], 0xAACCFFFF, "PLAYERCAR: Your vehicle has been destroyed forever cause no insurace office service again, sorry.");
    		xVehicle[xid][xv_OnOffice]=0;

	    return 1;
	}
