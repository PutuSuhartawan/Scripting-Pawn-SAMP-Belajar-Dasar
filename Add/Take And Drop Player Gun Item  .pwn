new Object[MAX_ARMAS];
new ObjectID[MAX_ARMAS][2];
new Float:ObjCoords[MAX_ARMAS][3];
#define MAX_ARMAS 100 

//===============================================
#define COLOR_RED 0xCC3300FF
#define COLOR_GREENYELLOW 0xADFF2FFF
#define COLOR_PLAYER_SPECIALGREEN 0x9292FFDD
#define     DIALOG_MP3          35568
#define     DIALOG_DJ			16595
#define     DIALOG_SLOW		    176969
#define     DIALOG_SAD		    16899
#define DIALOG_NEONTYPES 15025
#define MAX_ARMAS 100 // El m�ximo de armas que pueden haber en el suelo.
#define COLOR_VIOLETA 0xC2A2DAAA
#define DIALOG_SOLID 15163
#define DIALOG_SIMULTANEOUS 1523
#define DIALOG_ALTERNATING 1535
#define COLOR_WHITE 0xFFFFFFAA
#define SCM SendClientMessage
#define MAX_CHANNEL (9999)	//Walkie Talkie Frekuensi
#define CAR_COLOR           0xff00ebFF
#define COLOR_REALRED 		0xFF0606FF
#define COL_WHITE          "{FFFFFF}"
#define COL_YELLOW         "{F3FF02}"
#define COL_NICEGREEN      "{6EF83C}"
#define COL_NICERED        "{F81414}"
#define COL_ORANGE         "{FFAF00}"
#define COLOR_GRAY 0xAFAFAFFF
#define COLOR_LIGHTRED 0xFF6347FF
#define COULEUR_BLANC 0xFFFFFF00
#define COLOR_YELLOW 0xFFFF00AA
#define COLOR_YELLOW 0xFFFF00AA
#define COLOR_ASU 0x1E90FFFF

stock GetWeaponNameEx(id, name[], len) return format(name,len, "%s", GunNames[id]);


stock RemovePlayerWeapon(playerid, weaponid);
public RemovePlayerWeapon(playerid, weaponid)
{
	new plyWeapons[12] = 0;
	new plyAmmo[12] = 0;
	for(new sslot = 0; sslot != 12; sslot++)
	{
		new wep, ammo;
		GetPlayerWeaponData(playerid, sslot, wep, ammo);
		if(wep != weaponid && ammo != 0) GetPlayerWeaponData(playerid, sslot, plyWeapons[sslot], plyAmmo[sslot]);
	}
	ResetPlayerWeapons(playerid);
	for(new sslot = 0; sslot != 12; sslot++)
	{
	    if(plyAmmo[sslot] != 0) GivePlayerWeapon(playerid, plyWeapons[sslot], plyAmmo[sslot]);
	}
	return 1;
}

strtok(const string[], &index)
{
	new length = strlen(string);
	while ((index < length) && (string[index] <= ' '))
	{
		index++;
	}
	new offset = index;
	new result[20];
	while ((index < length) && (string[index] > ' ') && ((index - offset) < (sizeof(result) - 1)))
	{
		result[index - offset] = string[index];
		index++;
	}
	result[index - offset] = EOS;
	return result;
}

stock PlayerName(playerid)
{
    new Nombre[24];
    GetPlayerName(playerid,Nombre,24);
    new N[24];
    strmid(N,Nombre,0,strlen(Nombre),24);
    for(new i = 0; i < MAX_PLAYER_NAME; i++)
    {
        if (N[i] == '_') N[i] = ' ';
    }
    return N;
}
forward EngineStatus(playerid);
public EngineStatus(playerid)
{
		new vehicleid = GetPlayerVehicleID(playerid);
		new engine = (GetVehicleParamsEx(vehicleid, engine)^ VEHICLE_PARAMS_ON);
		if(GetVehicleParamsEx(vehicleid, engine) == VEHICLE_PARAMS_OFF)
		{
			new rand = random(3);
			if(rand == 0)
			{
				SetVehicleParamsEx(vehicleid, engine, engine);
				GameTextForPlayer(playerid, "Engine ~g~START", 4000);
				SetTimerEx("Engine", 4000, false, "i", playerid);
			}
			if(rand == 1)
			{
				GameTextForPlayer(playerid, "Engine ~r~CAN'T START", 4000);
				SetTimerEx("EngineStatus", 1000, false, "i", playerid);
			}
			if(rand == 2)
			{
				SetVehicleParamsEx(vehicleid, engine, engine);
				GameTextForPlayer(playerid, "Engine ~g~START", 4000);
				SetTimerEx("Engine", 1000, false, "i", playerid);
			}
		}
		return 1;
}
forward ProxDetectoD(Float:radi, playerid, string[],col1,col2,col3,col4,col5);
public ProxDetectoD(Float:radi, playerid, string[],col1,col2,col3,col4,col5)
{
	if(IsPlayerConnected(playerid))
	{
		new Float:posx, Float:posy, Float:posz;
		new Float:oldposx, Float:oldposy, Float:oldposz;
		new Float:tempposx, Float:tempposy, Float:tempposz;
		GetPlayerPos(playerid, oldposx, oldposy, oldposz);
		//radi = 2.0; //Trigger Radius
		for(new i = 0; i < MAX_PLAYERS; i++)
		{
			if(IsPlayerConnected(i) && (GetPlayerVirtualWorld(playerid) == GetPlayerVirtualWorld(i)))
			{
				if(!BigEar[i])
				{
         			GetPlayerPos(i, posx, posy, posz);
					tempposx = (oldposx -posx);
					tempposy = (oldposy -posy);
					tempposz = (oldposz -posz);
					if (((tempposx < radi/16) && (tempposx > -radi/16)) && ((tempposy < radi/16) && (tempposy > -radi/16)) && ((tempposz < radi/16) && (tempposz > -radi/16)))
					{
						SendClientMessage(i, col1, string);
					}
					else if (((tempposx < radi/8) && (tempposx > -radi/8)) && ((tempposy < radi/8) && (tempposy > -radi/8)) && ((tempposz < radi/8) && (tempposz > -radi/8)))
					{
						SendClientMessage(i, col2, string);
					}
					else if (((tempposx < radi/4) && (tempposx > -radi/4)) && ((tempposy < radi/4) && (tempposy > -radi/4)) && ((tempposz < radi/4) && (tempposz > -radi/4)))
					{
						SendClientMessage(i, col3, string);
					}
					else if (((tempposx < radi/2) && (tempposx > -radi/2)) && ((tempposy < radi/2) && (tempposy > -radi/2)) && ((tempposz < radi/2) && (tempposz > -radi/2)))
					{
						SendClientMessage(i, col4, string);
					}
					else if (((tempposx < radi) && (tempposx > -radi)) && ((tempposy < radi) && (tempposy > -radi)) && ((tempposz < radi) && (tempposz > -radi)))
					{
						SendClientMessage(i, col5, string);
					}
				}
				else
				{
					SendClientMessage(i, col1, string);
				}
			}
		}
	}//not connected
	return 1;
}


public OnPlayerDeath(playerid, killerid, reason)
{
    ResetRobbery(playerid, 1);
    new gunID = GetPlayerWeapon(playerid);
	new gunAmmo = GetPlayerAmmo(playerid);
	if(gunID != 0 && gunAmmo != 0)
	{
		new f = MAX_ARMAS+1;
		for(new a = 0; a < sizeof(ObjCoords); a++)
		{
			if(ObjCoords[a][0] == 0.0)
			{
				f = a;
				break;
			}
		}
  		ObjectID[f][0] = gunID;
		ObjectID[f][1] = gunAmmo;
 		GetPlayerPos(playerid, ObjCoords[f][0], ObjCoords[f][1], ObjCoords[f][2]);
 		Object[f] = CreateObject(GunObjects[gunID][0],ObjCoords[f][0],ObjCoords[f][1],ObjCoords[f][2]-1,93.7,120.0,120.0);
	}
  
}



CMD:ambil(playerid, params[])
{
	new f = MAX_ARMAS+1;
	for(new a = 0; a < sizeof(ObjCoords); a++)
	{
		if(IsPlayerInRangeOfPoint(playerid, 5.0, ObjCoords[a][0], ObjCoords[a][1], ObjCoords[a][2]))
		{
			f = a;
			break;
		}
	}
	if(f > MAX_ARMAS) return SendClientMessage(playerid, 0x33AA3300, "Kamu berhasil mengambil senjatanya.");
	else
	{
 	new gunname[25];
 	new string[100];

	ObjCoords[f][0] = 0.0;
	ObjCoords[f][1] = 0.0;
	ObjCoords[f][2] = 0.0;

	DestroyObject(Object[f]);
	GivePlayerWeapon(playerid, ObjectID[f][0], ObjectID[f][1]);
	GetWeaponNameEx(ObjectID[f][0], gunname, sizeof(gunname));
	format(string, sizeof(string), "* %s Mengambil %s Di Bawah.", GetPlayerNameEx(playerid), gunname);
	ProxDetectoD(30.0, playerid, string, COLOR_VIOLETA,COLOR_VIOLETA,COLOR_VIOLETA,COLOR_VIOLETA,COLOR_VIOLETA);
	}
	return 1;
}


CMD:buang(playerid, params[])
{
	new gunID = GetPlayerWeapon(playerid);
	new gunAmmo = GetPlayerAmmo(playerid);
	if(gunID != 0 && gunAmmo != 0)
	{
		new f = MAX_ARMAS+1;
		for(new a = 0; a < sizeof(ObjCoords); a++)
		{
		if(ObjCoords[a][0] == 0.0)
		{
		f = a;
		break;
		}
		}
		if(f > MAX_ARMAS) return SendClientMessage(playerid, 0x33AA3300, "Kamu berhasil membuang senjatamu!."); // �ste mensaje aparece si se super� el l�mite [MAX_ARMAS]
  		new gunname[25];
    	new string[100];
		GetWeaponNameEx(gunID, gunname, sizeof(gunname));
		format(string, sizeof(string), "* %s Menaruh %s Ke Lantai.", PlayerName(playerid), gunname);
		ProxDetectoD(30.0, playerid, string, COLOR_VIOLETA,COLOR_VIOLETA,COLOR_VIOLETA,COLOR_VIOLETA,COLOR_VIOLETA);
		RemovePlayerWeapon(playerid, gunID);
		ObjectID[f][0] = gunID;
		ObjectID[f][1] = gunAmmo;
  		GetPlayerPos(playerid, ObjCoords[f][0], ObjCoords[f][1], ObjCoords[f][2]);
    	Object[f] = CreateObject(GunObjects[gunID][0],ObjCoords[f][0],ObjCoords[f][1],ObjCoords[f][2]-1,93.7,120.0,120.0);
		return 1;
	}
}


