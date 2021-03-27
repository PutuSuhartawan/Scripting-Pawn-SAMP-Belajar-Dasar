#define FILTERSCRIPT

#include <a_samp>
#include <a_mysql>
#include <foreach>
#include <streamer>
#include <sscanf2>
#include <CMD>


#define    MYSQL_HOST        "localhost"
#define    MYSQL_USER        "root"
#define    MYSQL_DATABASE    "vehsys"
#define    MYSQL_PASSWORD    ""


#define 	red 	0xFFFF00FF
#define 	green 	0x00FF00FF
#define 	SCM 	SendClientMessage


#define DIALOG_BUY_VEHICLE      5413
#define DIALOG_VEHICLES         5513
#define MAX_SERVER_VEHICLES     2000

enum
{
    MODE_NOLOCK,
    MODE_LOCK,
};

enum VehiclesData
{
    vehID,
    vehSessionID,
    vehModel,
    vehName[25],
    vehOwner[26],
    vehPlate[16],
    vehPrice,
    vehLock,
    vehMod[14],
    vehColorOne,
    vehColorTwo,
    Text3D:vehLabel,
    Float:vehX,
    Float:vehY,
    Float:vehZ,
    Float:vehA
};

new vInfo[MAX_VEHICLES][VehiclesData],
    Iterator: ServerVehicles<MAX_VEHICLES>,
    Iterator: PrivateVehicles[MAX_PLAYERS]<MAX_SERVER_VEHICLES>;

new MySQL:mysql;

new VehicleNames[212][] =
{
    "Landstalker", "Bravura", "Buffalo", "Linerunner", "Pereniel", "Sentinel", "Dumper", "Firetruck", "Trashmaster", "Stretch", "Manana", "Infernus","Voodoo", "Pony",
    "Mule", "Cheetah", "Ambulance", "Leviathan", "Moonbeam", "Esperanto", "Taxi", "Washington", "Bobcat", "Mr Whoopee", "BF Injection", "Hunter", "Premier", "Enforcer",
    "Securicar", "Banshee", "Predator", "Bus", "Rhino", "Barracks", "Hotknife", "Trailer", "Previon", "Coach", "Cabbie", "Stallion", "Rumpo", "RC Bandit", "Romero",
    "Packer", "Monster", "Admiral", "Squalo", "Seasparrow", "Pizzaboy", "Tram", "Trailer 2", "Turismo", "Speeder", "Reefer", "Tropic", "Flatbed", "Yankee", "Caddy",
    "Solair", "Berkley's RC Van", "Skimmer", "PCJ-600", "Faggio", "Freeway", "RC Baron", "RC Raider", "Glendale", "Oceanic", "Sanchez", "Sparrow", "Patriot", "Quad",
    "Coastguard", "Dinghy", "Hermes", "Sabre", "Rustler", "ZR3 50", "Walton", "Regina", "Comet", "BMX", "Burrito", "Camper", "Marquis", "Baggage", "Dozer", "Maverick",
    "News Chopper", "Rancher", "FBI Rancher", "Virgo", "Greenwood", "Jetmax", "Hotring", "Sandking", "Blista Compact", "Police Maverick", "Boxville", "Benson", "Mesa",
    "RC Goblin", "Hotring Racer A", "Hotring Racer B", "Bloodring Banger", "Rancher", "Super GT", "Elegant", "Journey", "Bike", "Mountain Bike", "Beagle", "Cropdust",
    "Stunt", "Tanker", "RoadTrain", "Nebula", "Majestic", "Buccaneer", "Shamal", "Hydra", "FCR-900", "NRG-500", "HPV1000", "Cement Truck", "Tow Truck", "Fortune",
    "Cadrona", "FBI Truck", "Willard", "Forklift", "Tractor", "Combine", "Feltzer", "Remington", "Slamvan", "Blade", "Freight", "Streak", "Vortex", "Vincent", "Bullet",
    "Clover", "Sadler", "Firetruck", "Hustler", "Intruder", "Primo", "Cargobob", "Tampa", "Sunrise", "Merit", "Utility", "Nevada", "Yosemite", "Windsor", "Monster A",
    "Monster B", "Uranus", "Jester", "Sultan", "Stratum", "Elegy", "Raindance", "RC Tiger", "Flash", "Tahoma", "Savanna", "Bandito", "Freight", "Trailer", "Kart", "Mower",
    "Duneride", "Sweeper", "Broadway", "Tornado", "AT-400", "DFT-30", "Huntley", "Stafford", "BF-400", "Newsvan", "Tug", "Trailer A", "Emperor", "Wayfarer", "Euros",
    "Hotdog", "Club", "Trailer B", "Trailer C", "Andromada", "Dodo", "RC Cam", "Launch", "Police Car (LSPD)", "Police Car (SFPD)", "Police Car (LVPD)", "Police Ranger",
    "Picador", "S.W.A.T. Van", "Alpha", "Phoenix", "Glendale", "Sadler", "Luggage Trailer A", "Luggage Trailer B", "Stair Trailer", "Boxville", "Farm Plow", "Utility Trailer"
};


forward LoadDealerVehicles();
forward LoadPlayerVehicles(playerid);


public OnFilterScriptInit() {

	mysql_log(ALL);
    mysql = mysql_connect(MYSQL_HOST, MYSQL_USER, MYSQL_PASSWORD, MYSQL_DATABASE);
    if(mysql_errno() != 0)
        print("[MySQL] Failed Connection");
    else
        print("[MySQL] Successfully Connected");

    mysql_tquery(mysql, "CREATE TABLE IF NOT EXISTS `Vehicles` (\
      `vehID` int(11) NOT NULL,\
      `vehModel` int(11) NOT NULL,\
      `vehName` varchar(25) NOT NULL,\
      `vehOwner` varchar(25) NOT NULL default '-',\
      `vehPlate` varchar(16) NOT NULL default 'UG',\
      `vehPrice` int(11) NOT NULL,\
      `vehLock` int(11) NOT NULL,\
      `vehMod_1` int(11) NOT NULL,\
      `vehMod_2` int(11) NOT NULL,\
      `vehMod_3` int(11) NOT NULL,\
      `vehMod_4` int(11) NOT NULL,\
      `vehMod_5` int(11) NOT NULL,\
      `vehMod_6` int(11) NOT NULL,\
      `vehMod_7` int(11) NOT NULL,\
      `vehMod_8` int(11) NOT NULL,\
      `vehMod_9` int(11) NOT NULL,\
      `vehMod_10` int(11) NOT NULL,\
      `vehMod_11` int(11) NOT NULL,\
      `vehMod_12` int(11) NOT NULL,\
      `vehMod_13` int(11) NOT NULL,\
      `vehMod_14` int(11) NOT NULL,\
      `vehColorOne` int(11) NOT NULL,\
      `vehColorTwo` int(11) NOT NULL,\
      `vehX` float NOT NULL,\
      `vehY` float NOT NULL,\
      `vehZ` float NOT NULL,\
      `vehA` float NOT NULL,\
      UNIQUE KEY `vehID` (`vehID`))");

    Iter_Init(PrivateVehicles);
    mysql_tquery(mysql, "SELECT * FROM `Vehicles` WHERE `vehOwner` = '-'", "LoadDealerVehicles", "");
	return 1;
}

public OnFilterScriptExit() {

	foreach(new i : ServerVehicles) {

        if(!strcmp(vInfo[i][vehOwner], "-") || strcmp(vInfo[i][vehOwner], "-")) {

            SaveVehicle(i);
            DestroyVehicle(vInfo[i][vehSessionID]);
            DestroyDynamic3DTextLabel(vInfo[i][vehLabel]);
        }
    }
	return 1;
}

public OnPlayerConnect(playerid) {

	new query[65];
    mysql_format(mysql, query, sizeof(query), "SELECT * FROM `Vehicles` WHERE `vehOwner` = '%e'", GetName(playerid));
    mysql_tquery(mysql, query, "LoadPlayerVehicles", "i", playerid);
	return 1;
}

public OnPlayerDisconnect(playerid, reason) {

	foreach(new i : PrivateVehicles[playerid]) {

        if(!strcmp(vInfo[i][vehOwner], GetName(playerid))) {

            SaveVehicle(i);
            DestroyVehicle(vInfo[i][vehSessionID]);
            Iter_Remove(ServerVehicles, i);
        }
    }
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]) {

	switch(dialogid) {

		case DIALOG_BUY_VEHICLE: {

            if(response) {

                new i = GetPVarInt(playerid, "buyVehicle");
                if(GetPlayerMoney(playerid) < vInfo[i][vehPrice]) return SCM(playerid, red, "You don't have enough money");
                if(strcmp(vInfo[i][vehOwner], "-")) return SCM(playerid, red, "Vehicle is already owned by a player");

                DestroyDynamic3DTextLabel(vInfo[i][vehLabel]);
                SetVehicleToRespawn(vInfo[i][vehSessionID]);

                GivePlayerMoney(playerid, -vInfo[i][vehPrice]);
                GetPlayerName(playerid, vInfo[i][vehOwner], MAX_PLAYER_NAME);

                SetVehicleParamsForPlayer(vInfo[i][vehSessionID], playerid, 0, 0);
                vInfo[i][vehLock] = MODE_NOLOCK;

                format(vInfo[i][vehOwner], MAX_PLAYER_NAME, GetName(playerid));

                Iter_Add(PrivateVehicles[playerid], i);
                SaveVehicle(i);
                return 1;
            }
        }
        case DIALOG_VEHICLES: {

            if(response) {

                new count = 0;
                foreach(new i : PrivateVehicles[playerid]) {

                    if(!strcmp(vInfo[i][vehOwner], GetName(playerid))) {

                        if(count == listitem) {

                            SetPVarInt(playerid, "playerVehID", i);
                            ShowPlayerDialog(playerid, DIALOG_VEHICLES+1, DIALOG_STYLE_LIST, "Vehicles", "Spawn Car\nChange Number Plate\nLock\nUnlock\nEmpty", "Select", "Close");
                            break;
                        }
                        else count++;
                    }
                }
            }
        }
        case DIALOG_VEHICLES+1: {

            if(response) {

                switch(listitem){

                    case 0: {

                        new i = GetPVarInt(playerid, "playerVehID");

                        GetPlayerPos(playerid, vInfo[i][vehX], vInfo[i][vehY], vInfo[i][vehZ]);
                        GetPlayerFacingAngle(playerid, vInfo[i][vehA]);

                        createVehicle(i, vInfo[i][vehX]+3, vInfo[i][vehY], vInfo[i][vehZ], vInfo[i][vehA], true);
                        SaveVehicle(i);
                    }
                    case 1: ShowPlayerDialog(playerid, DIALOG_VEHICLES+2, DIALOG_STYLE_INPUT, "Vehicle Plate", "{FFFFFF}Enter the new vehicle number plate below", "Next", "Close");
                    case 2: {

                        new i = GetPVarInt(playerid, "playerVehID");

                        foreach(new x : Player) if(x != playerid) SetVehicleParamsForPlayer(vInfo[i][vehSessionID], x, 0, 1);

                        vInfo[i][vehLock] = MODE_LOCK;
                        SaveVehicle(i);
                        SCM(playerid, green, "You have locked your vehicle");
                    }
                    case 3: {

                        new i = GetPVarInt(playerid, "playerVehID");

                        foreach(new x : Player) if(x != playerid) SetVehicleParamsForPlayer(vInfo[i][vehSessionID], x, 0, 0);
                        vInfo[i][vehLock] = MODE_NOLOCK;
                        SaveVehicle(i);
                        SCM(playerid, green, "You have unlocked your vehicle");
                    }
                    case 4: {

                        new i = GetPVarInt(playerid, "playerVehID");

                        foreach(new x : Player) {

                            if(IsPlayerInVehicle(x, vInfo[i][vehSessionID])) {

                                RemovePlayerFromVehicle(x);
                            }
                        }
                        SCM(playerid, green, "You have ejected all the players from your vehicle");
                    }
                }
            }
        }
        case DIALOG_VEHICLES+2: {

            if(response) {

                new i = GetPVarInt(playerid, "playerVehID");

                SetVehicleNumberPlate(vInfo[i][vehSessionID], inputtext);
                format(vInfo[i][vehPlate], 16, inputtext);

                SetVehicleToRespawn(vInfo[i][vehSessionID]);

                if(IsPlayerInVehicle(playerid, vInfo[i][vehSessionID])) {

                    new Float:playerX, Float:playerY, Float:playerZ;
                    GetPlayerPos(playerid, playerX, playerY, playerZ);

                    SetVehiclePos(vInfo[i][vehSessionID], playerX, playerY, playerZ);
                    PutPlayerInVehicle(playerid, vInfo[i][vehSessionID], 0);
                }

                SaveVehicle(i);
            }
        }
	}
	return 0;
}

public OnVehicleMod(playerid, vehicleid, componentid) {

	foreach(new i : PrivateVehicles[playerid]) {

        if(IsPlayerInVehicle(playerid, vInfo[i][vehSessionID])) {

            if(!strcmp(vInfo[i][vehOwner], GetName(playerid))) {

                for(new x; x < 14; x++) {

                    if(GetVehicleComponentType(componentid) == x) {

                        vInfo[i][vehMod][x] = componentid;
                    }
                }
                SaveVehicle(i);
            }
        }
    }
	return 1;
}

public OnVehicleSpawn(vehicleid) {

    foreach(new playerid : Player) {

        foreach(new i : PrivateVehicles[playerid]) {

            for(new x = 0; x < 14; x++) {

                if(!strcmp(vInfo[i][vehOwner], GetName(playerid))) {

                    if(vInfo[i][vehMod][x] > 0) AddVehicleComponent(vInfo[i][vehSessionID], vInfo[i][vehMod][x]);
                }
            }
        }
    }
    return 1;
}

public OnVehicleRespray(playerid, vehicleid, color1, color2)
{
    foreach(new i : PrivateVehicles[playerid]) {

        if(IsPlayerInVehicle(playerid, vInfo[i][vehSessionID])) {

            if(!strcmp(vInfo[i][vehOwner], GetName(playerid))) {

                vInfo[i][vehColorOne] = color1;
                vInfo[i][vehColorTwo] = color2;
                ChangeVehicleColor(vInfo[i][vehSessionID], vInfo[i][vehColorOne], vInfo[i][vehColorTwo]);
                SaveVehicle(i);
            }
        }
    }
    return 0;
}

CMD:buyvehicle(playerid, params[])
{
    new id, string[100];
    if(sscanf(params, "i", id)) return SCM(playerid, red, "Buy vehicle: /buyvehicle <VehicleID>");
    if(!Iter_Contains(ServerVehicles, id)) return SendClientMessage(playerid, red, "Invalid vehicle ID");

    if(!strcmp(vInfo[id][vehOwner], "-")) {

        SetPVarInt(playerid, "buyVehicle", id);
        format(string, sizeof(string), "{FFFFFF}Vehicle: {00FF00}%s \n{FFFFFF}Price: {00FF00}$%s \n{FFFFFF}Buy it?", vInfo[id][vehName], cNumber(vInfo[id][vehPrice]));
        ShowPlayerDialog(playerid, DIALOG_BUY_VEHICLE, DIALOG_STYLE_MSGBOX, "Buy Vehicle", string, "Buy", "Close");
        return 1;
    }
    else return SCM(playerid, red, "Vehicle is already owned by a player");
}

CMD:vehicles(playerid, params[])
{
    new bool:found = false, list[512];
    list = "ID\tVehicle\tNumber Plate\n";
    foreach(new i : PrivateVehicles[playerid]) {

        if(!strcmp(vInfo[i][vehOwner], GetName(playerid))) {

            found = true;
            format(list, sizeof(list), "%s%d\t%s\t%s\n", list, i, vInfo[i][vehName], vInfo[i][vehPlate]);
        }
    }
    if(found == true) return ShowPlayerDialog(playerid, DIALOG_VEHICLES, DIALOG_STYLE_TABLIST_HEADERS, "Vehicles", list, "Select", "Close");
    else return ShowPlayerDialog(playerid, 2114, DIALOG_STYLE_MSGBOX, "Vehicles", "{FF0000}No vehicles found", "Close", "");
}
CMD:v(playerid, params[]) return cmd_vehicles(playerid, params);

CMD:changeplate(playerid, params[])
{
    new txt[16];
    if(sscanf(params, "s[16]", txt)) return SCM(playerid, red, "Change vehicle number plate: /changeplate <Text>");
    if(strlen(txt) > 16) return SCM(playerid, red, "Input text is too long");
    if(!IsPlayerInAnyVehicle(playerid)) return SCM(playerid, red, "You are not inside any vheicle");
    if(GetPlayerState(playerid) == PLAYER_STATE_PASSENGER) return SCM(playerid, red, "You must be the driver to use this command");

    foreach(new i : PrivateVehicles[playerid]) {

        if(IsPlayerInVehicle(playerid, vInfo[i][vehSessionID])) {

            if(!strcmp(vInfo[i][vehOwner], GetName(playerid))) { 

                SetVehicleNumberPlate(vInfo[i][vehSessionID], txt);
                vInfo[i][vehPlate] = txt;

                new Float:playerX, Float:playerY, Float:playerZ;
                GetPlayerPos(playerid, playerX, playerY, playerZ);

                SetVehicleToRespawn(vInfo[i][vehSessionID]);
                SetVehiclePos(vInfo[i][vehSessionID], playerX, playerY, playerZ);
                PutPlayerInVehicle(playerid, vInfo[i][vehSessionID], 0);

                SaveVehicle(i);
            }
            else return SCM(playerid, red, "You are not the owner of this vehicle");
        }
    }

    SCM(playerid, red, "You have changed your vehicle's number plate");
    return 1;
}
CMD:cplate(playerid, params[]) return cmd_changeplate(playerid, params);

CMD:lock(playerid, params[])
{
    if(isnull(params))
    {
        foreach(new i : ServerVehicles) {

            if(IsPlayerInVehicle(playerid, vInfo[i][vehSessionID])) {

                if(!strcmp(vInfo[i][vehOwner], GetName(playerid))) {

                    foreach(new x : Player) if(x != playerid) SetVehicleParamsForPlayer(vInfo[i][vehSessionID], x, 0, 1);

                    GameTextForPlayer(playerid, "~w~LOCKED", 2000, 3);
                    vInfo[i][vehLock] = MODE_LOCK;
                    SaveVehicle(i);
                }
                else return SCM(playerid, red, "You are not the owner of this vehicle");
            }
        }
        return 1;
    }

    new id;
    if(sscanf(params, "i", id)) return SCM(playerid, red, "Unlock vehicle: /unlock <VehicleID>");
    if(!Iter_Contains(ServerVehicles, id)) return SendClientMessage(playerid, red, "Invalid vehicle ID");
    if(strcmp(vInfo[id][vehOwner], GetName(playerid))) return SCM(playerid, red, "You are not the owner of this vehicle");

    if(vInfo[id][vehLock] == MODE_NOLOCK) {

        foreach(new x : Player) if(x != playerid) SetVehicleParamsForPlayer(vInfo[id][vehSessionID], x, 0, 1);

        GameTextForPlayer(playerid, "~w~LOCKED", 2000, 3);
        vInfo[id][vehLock] = MODE_LOCK;
        SaveVehicle(id);
        return 1;
    }
    else return SCM(playerid, red, "Vehicles is already locked");
}

CMD:unlock(playerid, params[])
{
    if(isnull(params)){

        foreach(new i : ServerVehicles) {

            if(IsPlayerInVehicle(playerid, vInfo[i][vehSessionID])) {

                if(!strcmp(vInfo[i][vehOwner], GetName(playerid))) {

                    foreach(new x : Player) if(x != playerid) SetVehicleParamsForPlayer(vInfo[i][vehSessionID], x, 0, 0);

                    GameTextForPlayer(playerid, "~w~UNLOCKED", 2000, 3);
                    vInfo[i][vehLock] = MODE_NOLOCK;
                    SaveVehicle(i);
                }
                else return SCM(playerid, red, "You are not the owner of this vehicle");
            }
        }
        return 1;
    }

    new id;
    if(sscanf(params, "i", id)) return SCM(playerid, red, "Unlock vehicle: /unlock <VehicleID>");
    if(!Iter_Contains(ServerVehicles, id)) return SendClientMessage(playerid, red, "Invalid vehicle ID");
    if(strcmp(vInfo[id][vehOwner], GetName(playerid))) return SCM(playerid, red, "You are not the owner of this vehicle");

    if(vInfo[id][vehLock] == MODE_LOCK) {

        foreach(new x : Player) if(x != playerid) SetVehicleParamsForPlayer(vInfo[id][vehSessionID], x, 0, 0);

        GameTextForPlayer(playerid, "~w~UNLOCKED", 2000, 3);
        vInfo[id][vehLock] = MODE_NOLOCK;
        SaveVehicle(id);
        return 1;
    }
    else return SCM(playerid, red, "Vehicles is already unlocked");
}

CMD:createvehicle(playerid, params[])
{
    if(!IsPlayerAdmin(playerid)) return SCM(playerid, red, "You must be administrator to use this command");

    new modelid[30], vehid, color1, color2, price;
    if(sscanf(params, "s[30]iid", modelid, color1, color2, price)) return SCM(playerid, red, "Create vehicle: /createvehicle <ModelID/Vehicle Name> <Color1> <Color2> <Price>");

    if(IsNumeric(modelid)) vehid = strval(modelid);
    else vehid = ReturnVehicleModelID(modelid);

    if(vehid < 400 || vehid > 611) return SCM(playerid, red, "Invalid vehicle model!");

    new index = Iter_Free(ServerVehicles);
    if(index == -1) return SCM(playerid, red, "You can't create more vehicle!");

    if(IsPlayerInAnyVehicle(playerid)) DestroyVehicle(GetPlayerVehicleID(playerid));

    GetPlayerPos(playerid, vInfo[index][vehX], vInfo[index][vehY], vInfo[index][vehZ]);
    GetPlayerFacingAngle(playerid, vInfo[index][vehA]);

    SetPlayerPos(playerid, vInfo[index][vehX] + 3, vInfo[index][vehY], vInfo[index][vehZ]);

    vInfo[index][vehSessionID] = CreateVehicle(vehid, vInfo[index][vehX], vInfo[index][vehY], vInfo[index][vehZ], vInfo[index][vehA], color1, color2, 10);
    SetVehicleParamsEx(vInfo[index][vehSessionID], 0, 0, 0, 1, 0, 0, 0);
    SetVehicleNumberPlate(vInfo[index][vehSessionID], "OMAR");

    format(vInfo[index][vehName], MAX_PLAYER_NAME, GetVehicleName(vehid));
    format(vInfo[index][vehOwner], MAX_PLAYER_NAME, "-");
    format(vInfo[index][vehPlate], 16, "OMAR");

    vInfo[index][vehModel] = vehid;
    vInfo[index][vehPrice] = price;
    vInfo[index][vehLock] = MODE_LOCK;
    vInfo[index][vehColorOne] = color1;
    vInfo[index][vehColorTwo] = color2;

    new query[220];
    format(query, sizeof(query), "VehicleID: %d\nVehicle: %s\nPrice: $%s\nType /buyvehicle to buy!", index, vInfo[index][vehName], cNumber(vInfo[index][vehPrice]));

    vInfo[index][vehLabel] = CreateDynamic3DTextLabel(query, 0xFFFF00FF, vInfo[index][vehX], vInfo[index][vehY], vInfo[index][vehZ], 10.0, INVALID_PLAYER_ID, vInfo[index][vehSessionID]);

    
    mysql_format(mysql, query, sizeof(query),
    "INSERT INTO `Vehicles` (vehModel, vehPrice, vehName, vehPlate, vehColorOne, vehColorTwo, vehX, vehY, vehZ, vehA) VALUES (%d, %d, '%e', '%e', %d, %d, %f, %f, %f, %f)",
    vInfo[index][vehModel], vInfo[index][vehPrice], vInfo[index][vehName], vInfo[index][vehPlate], vInfo[index][vehColorOne], vInfo[index][vehColorTwo], vInfo[index][vehX], 
    vInfo[index][vehY], vInfo[index][vehZ], vInfo[index][vehA]);
    mysql_tquery(mysql, query, "OnDealerVehicleCreated", "i", index);

    format(query, sizeof(query), "You have created a vehicle - ModelID: %d, VehicleID: %d, Price: %d", vInfo[index][vehModel], index, vInfo[index][vehPrice]);
    SCM(playerid, red, query);
    return 1;
}
CMD:vcreate(playerid, params[]) return cmd_createvehicle(playerid, params);

CMD:gotovehicle(playerid, params[])
{
    if(!IsPlayerAdmin(playerid)) return SCM(playerid, red, "You must be administrator to use this command");

    new id;
    if(sscanf(params, "i", id)) return SCM(playerid, red, "Teleport to vehicle: /gotovehicle <VehicleID>");
    if(!Iter_Contains(ServerVehicles, id)) return SendClientMessage(playerid, red, "Invalid vehicle ID");

    GetVehiclePos(vInfo[id][vehSessionID], vInfo[id][vehX], vInfo[id][vehY], vInfo[id][vehZ]);

    SetPlayerPos(playerid, vInfo[id][vehX], vInfo[id][vehY], vInfo[id][vehZ]+3);
    SetPlayerInterior(playerid, 0);
    SetPlayerVirtualWorld(playerid, 0);
    return 1;
}

CMD:setvehicleprice(playerid, params[])
{
    if(!IsPlayerAdmin(playerid)) return SCM(playerid, red, "You must be administrator to use this command");
    
    new id, price;
    if(sscanf(params, "ii", id, price)) return SCM(playerid, red, "Set vehicle price: /setvehicleprice <VehicleID> <Price>");
    if(!Iter_Contains(ServerVehicles, id)) return SendClientMessage(playerid, red, "Invalid vehicle ID");

    new query[64];
    mysql_format(mysql, query, sizeof(query), "UPDATE `Vehicles` SET `vehPrice` = %i WHERE `vehID` = %d", price, vInfo[id][vehID]);
    mysql_tquery(mysql, query);

    SCM(playerid, red, "Price updated");
    return 1;
}
CMD:setvprice(playerid, params[]) return cmd_setvehicleprice(playerid, params);

CMD:deletevehicle(playerid, params[])
{
    if(!IsPlayerAdmin(playerid)) return SCM(playerid, red, "You must be administrator to use this command");

    new id;
    if(sscanf(params, "i", id)) return SCM(playerid, red, "Delete vehicle: /deletevehicle <VehicleID>");
    if(!Iter_Contains(ServerVehicles, id)) return SendClientMessage(playerid, red, "Invalid vehicle ID");

    ResetVehicle(id);

    Iter_Remove(ServerVehicles, id);

    new query[45];
    mysql_format(mysql, query, sizeof(query), "DELETE FROM `Vehicles` WHERE `vehID` = %d", vInfo[id][vehID]);
    mysql_tquery(mysql, query);

    SCM(playerid, red, "Vehicle deleted");
    return 1;
}
CMD:vdel(playerid, params[]) return cmd_deletevehicle(playerid, params);


public LoadDealerVehicles() {

    new rows = cache_num_rows();
    if(rows) {

        new string[75];
        for(new i; i < rows; i++) {

            new id = Iter_Free(ServerVehicles);
            
            cache_get_value_name(i, "vehOwner", vInfo[id][vehOwner], .max_len = MAX_PLAYER_NAME);
            cache_get_value_name_int(i, "vehModel", vInfo[id][vehModel]);
            cache_get_value_name(i, "vehName", vInfo[id][vehName]);
            cache_get_value_name(i, "vehPlate", vInfo[id][vehPlate]);
            cache_get_value_name_int(i, "vehPrice", vInfo[id][vehPrice]);
            cache_get_value_name_int(i, "vehColorOne", vInfo[id][vehColorOne]);
            cache_get_value_name_int(i, "vehColorTwo", vInfo[id][vehColorTwo]);
            cache_get_value_name_float(i, "vehX", vInfo[id][vehX]);
            cache_get_value_name_float(i, "vehY", vInfo[id][vehY]);
            cache_get_value_name_float(i, "vehZ", vInfo[id][vehZ]);
            cache_get_value_name_float(i, "vehA", vInfo[id][vehA]);

            vInfo[id][vehSessionID] = CreateVehicle(vInfo[id][vehModel], vInfo[id][vehX], vInfo[id][vehY], vInfo[id][vehZ], vInfo[id][vehA], vInfo[id][vehColorOne], vInfo[id][vehColorTwo], -1);

            cache_get_value_name_int(i, "vehID", vInfo[id][vehID]);

            SetVehicleToRespawn(vInfo[id][vehSessionID]);
            SetVehicleParamsEx(vInfo[id][vehSessionID], 0, 0, 0, 1, 0, 0, 0);
            SetVehicleNumberPlate(vInfo[id][vehSessionID], "OMAR");

            format(string, sizeof(string), "VehicleID: %d\nVehicle: %s\nPrice: $%s\nType /buyvehicle to buy!", id, vInfo[id][vehName], cNumber(vInfo[id][vehPrice]));

            vInfo[id][vehLabel] = CreateDynamic3DTextLabel(string, 0xFFFF00FF, vInfo[id][vehX], vInfo[id][vehY], vInfo[id][vehZ], 10.0, INVALID_PLAYER_ID, vInfo[id][vehSessionID]);
            Iter_Add(ServerVehicles, id);
        }
        printf("Loaded %d vehicles for dealership", rows);
    }
    return 1;
}

public LoadPlayerVehicles(playerid) {

    new rows = cache_num_rows();
    if(rows) {

        for(new i; i < rows; i++) {

            new id = Iter_Free(ServerVehicles);

            cache_get_value_name(i, "vehOwner", vInfo[id][vehOwner], .max_len = MAX_PLAYER_NAME);
            cache_get_value_name_int(i, "vehModel", vInfo[id][vehModel]);
            cache_get_value_name(i, "vehName", vInfo[id][vehName]);
            cache_get_value_name(i, "vehPlate", vInfo[id][vehPlate]);
            cache_get_value_name_int(i, "vehPrice", vInfo[id][vehPrice]);
            cache_get_value_name_int(i, "vehLock", vInfo[id][vehLock]);
            cache_get_value_name_int(i, "vehColorOne", vInfo[id][vehColorOne]);
            cache_get_value_name_int(i, "vehColorTwo", vInfo[id][vehColorTwo]);
            cache_get_value_name_int(i, "vehMod_1", vInfo[id][vehMod][0]);
            cache_get_value_name_int(i, "vehMod_2", vInfo[id][vehMod][1]);
            cache_get_value_name_int(i, "vehMod_3", vInfo[id][vehMod][2]);
            cache_get_value_name_int(i, "vehMod_4", vInfo[id][vehMod][3]);
            cache_get_value_name_int(i, "vehMod_5", vInfo[id][vehMod][4]);
            cache_get_value_name_int(i, "vehMod_6", vInfo[id][vehMod][5]);
            cache_get_value_name_int(i, "vehMod_7", vInfo[id][vehMod][6]);
            cache_get_value_name_int(i, "vehMod_8", vInfo[id][vehMod][7]);
            cache_get_value_name_int(i, "vehMod_9", vInfo[id][vehMod][8]);
            cache_get_value_name_int(i, "vehMod_10", vInfo[id][vehMod][9]);
            cache_get_value_name_int(i, "vehMod_11", vInfo[id][vehMod][10]);
            cache_get_value_name_int(i, "vehMod_12", vInfo[id][vehMod][11]);
            cache_get_value_name_int(i, "vehMod_13", vInfo[id][vehMod][12]);
            cache_get_value_name_int(i, "vehMod_14", vInfo[id][vehMod][13]);
            cache_get_value_name_float(i, "vehX", vInfo[id][vehX]);
            cache_get_value_name_float(i, "vehY", vInfo[id][vehY]);
            cache_get_value_name_float(i, "vehZ", vInfo[id][vehZ]);
            cache_get_value_name_float(i, "vehA", vInfo[id][vehA]);

            vInfo[id][vehSessionID] = CreateVehicle(vInfo[id][vehModel], vInfo[id][vehX], vInfo[id][vehY], vInfo[id][vehZ], vInfo[id][vehA], vInfo[id][vehColorOne], vInfo[id][vehColorTwo], -1);

            cache_get_value_name_int(i, "vehID", vInfo[id][vehID]);

            format(vInfo[id][vehName], MAX_PLAYER_NAME, GetVehicleName(vInfo[id][vehModel]));
            format(vInfo[id][vehPlate], 16, vInfo[id][vehPlate]);
            format(vInfo[id][vehOwner], MAX_PLAYER_NAME, GetName(playerid));

            SetVehicleToRespawn(vInfo[id][vehSessionID]);
            SetVehicleParamsEx(vInfo[id][vehSessionID], 0, 0, 0, vInfo[id][vehLock], 0, 0, 0);
            SetVehicleNumberPlate(vInfo[id][vehSessionID], vInfo[id][vehPlate]);
            for(new x = 0; x < 14; x++) if(vInfo[id][vehMod][x] > 0) AddVehicleComponent(vInfo[id][vehSessionID], vInfo[id][vehMod][x]);

            Iter_Add(PrivateVehicles[playerid], id);
            Iter_Add(ServerVehicles, id);
        }
        printf("Loaded %d vehicles for %s", rows, GetName(playerid));
    }
    return 1;
}

SaveVehicle(vehicleid) {

    if(!Iter_Contains(ServerVehicles, vehicleid)) return 0;

    format(vInfo[vehicleid][vehName], 16, GetVehicleName(vInfo[vehicleid][vehModel]));
    GetVehiclePos(vInfo[vehicleid][vehSessionID], vInfo[vehicleid][vehX], vInfo[vehicleid][vehY], vInfo[vehicleid][vehZ]);
    GetVehicleZAngle(vInfo[vehicleid][vehSessionID], vInfo[vehicleid][vehA]);

    new query[500];
    mysql_format(mysql, query, sizeof(query), "UPDATE `Vehicles` SET `vehName` = '%e', `vehOwner` = '%e', `vehLock` = %i, `vehModel` = %i,\
    `vehPlate` = '%e', `vehMod_1` = %i, `vehMod_2` = %i, `vehMod_3` = %i, `vehMod_4` = %i, `vehMod_5` = %i, `vehMod_6` = %i, `vehMod_7` = %i,\
    `vehMod_8` = %i, `vehMod_9` = %i, `vehMod_10` = %i, `vehMod_11` = %i, `vehMod_12` = %i, `vehMod_13` = %i, `vehMod_14` = %i, `vehColorOne` = %i,\
    `vehColorTwo` = %i, `vehX` = %f, `vehY` = %f, `vehZ` = %f, `vehA` = %f WHERE `vehID` = %d", vInfo[vehicleid][vehName], vInfo[vehicleid][vehOwner],
    vInfo[vehicleid][vehLock], vInfo[vehicleid][vehModel], vInfo[vehicleid][vehPlate], vInfo[vehicleid][vehMod][0], vInfo[vehicleid][vehMod][1], vInfo[vehicleid][vehMod][2], 
    vInfo[vehicleid][vehMod][3], vInfo[vehicleid][vehMod][4], vInfo[vehicleid][vehMod][5], vInfo[vehicleid][vehMod][6], vInfo[vehicleid][vehMod][7], vInfo[vehicleid][vehMod][8], 
    vInfo[vehicleid][vehMod][9], vInfo[vehicleid][vehMod][10], vInfo[vehicleid][vehMod][11], vInfo[vehicleid][vehMod][12], vInfo[vehicleid][vehMod][13], vInfo[vehicleid][vehColorOne],
    vInfo[vehicleid][vehColorTwo], vInfo[vehicleid][vehX], vInfo[vehicleid][vehY], vInfo[vehicleid][vehZ], vInfo[vehicleid][vehA], vInfo[vehicleid][vehID]);
    mysql_tquery(mysql, query);
    return 1;
}

ResetVehicle(vehicleid)
{
    if(!Iter_Contains(ServerVehicles, vehicleid)) return 0;

    foreach(new i : Player) {

        if(!strcmp(vInfo[vehicleid][vehOwner], GetName(i))) {

            Iter_Remove(PrivateVehicles[i], vehicleid);
        }
    }

    format(vInfo[vehicleid][vehOwner], MAX_PLAYER_NAME, "-");
    format(vInfo[vehicleid][vehPlate], 16, "UG");
    vInfo[vehicleid][vehModel] = -1; 
    vInfo[vehicleid][vehLock] = MODE_NOLOCK;
    vInfo[vehicleid][vehPrice] = 0;
    vInfo[vehicleid][vehColorOne] = -1;
    vInfo[vehicleid][vehColorTwo] = -1;

    for(new i = 0; i < 14; i++) {

        if(vInfo[vehicleid][vehMod][i] > 0) {

            RemoveVehicleComponent(vInfo[vehicleid][vehSessionID], vInfo[vehicleid][vehMod][i]);
            vInfo[vehicleid][vehMod][i] = 0;
        }
    }

    if(IsValidDynamic3DTextLabel(vInfo[vehicleid][vehLabel])) DestroyDynamic3DTextLabel(vInfo[vehicleid][vehLabel]);
    DestroyVehicle(vInfo[vehicleid][vehSessionID]);
    return 1;
}

forward OnDealerVehicleCreated(vehicleid);
public OnDealerVehicleCreated(vehicleid) {

    vInfo[vehicleid][vehID] = cache_insert_id(); 
    Iter_Add(ServerVehicles, vehicleid);
    return 1;
}

createVehicle(vehicleid, Float:itsX, Float:itsY, Float:itsZ, Float:itsA, bool:removeold = false) {

    if(removeold == true) {

        DestroyVehicle(vInfo[vehicleid][vehSessionID]);
    }

    vInfo[vehicleid][vehSessionID] = CreateVehicle(vInfo[vehicleid][vehModel], itsX, itsY, itsZ, itsA, vInfo[vehicleid][vehColorOne], vInfo[vehicleid][vehColorTwo], -1);
    format(vInfo[vehicleid][vehName], MAX_PLAYER_NAME, GetVehicleName(vInfo[vehicleid][vehModel]));
    SetVehicleParamsEx(vInfo[vehicleid][vehSessionID], 0, 0, 0, 1, 0, 0, 0);
    SetVehicleNumberPlate(vInfo[vehicleid][vehSessionID], vInfo[vehicleid][vehPlate]);
    for(new x = 0; x < 14; x++) if(vInfo[vehicleid][vehMod][x] > 0) AddVehicleComponent(vInfo[vehicleid][vehSessionID], vInfo[vehicleid][vehMod][x]);
    ChangeVehicleColor(vInfo[vehicleid][vehSessionID], vInfo[vehicleid][vehColorOne], vInfo[vehicleid][vehColorTwo]);
    SetVehicleToRespawn(vInfo[vehicleid][vehSessionID]);
    return 1;
}

GetVehicleName(modelid) {

    new string[20];
    format(string,sizeof(string),"%s",VehicleNames[modelid - 400]);
    return string;
}

GetName(playerid) {

    new pName[MAX_PLAYER_NAME+1];
    GetPlayerName(playerid, pName, MAX_PLAYER_NAME);
    return pName;
}

cNumber(integer, const separator[] = ",") { 

    new string[16]; 
    format(string, sizeof(string), "%i", integer);

    if(integer >= 1000) { 

        for(new i = (strlen(string) - 3); i > 0; i -= 3) { 

            strins(string, separator, i); 
        } 
    } 
    return string; 
}

IsNumeric(string[]) {

    for (new i = 0, j = strlen(string); i < j; i++) {

    	if (string[i] > '9' || string[i] < '0') return 0;
    }
    return 1;
}

ReturnVehicleModelID(Name[]) {

    for(new i; i != 211; i++) if(strfind(VehicleNames[i], Name, true) != -1) return i + 400;
    return INVALID_VEHICLE_ID;
}
