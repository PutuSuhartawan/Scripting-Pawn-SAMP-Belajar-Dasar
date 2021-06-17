CMD: addcoordinat (playerid)
{
new Float: x, Float: y, Float: z;
new Float: facing, work [50];
new skinid = GetPlayerSkin (playerid);
// this is for cmd / stats

// pInfo [playerid] [pJobMechanic] = 1; // try changing strings

if (pInfo [playerid] [pJobMechanic] == 1)
{
job = "" COL_LIGHTBLUE "Mechanic";
}
else
{
job = "" COL_GREEN "City Guest";
}

    GetPlayerPos (playerid, x, y, z);
    GetPlayerFacingAngle (playerid, facing);

new infocharacter [1000];
format (infocharacter, 1000, "Working: [% s]" COL_RWHITE "Virtuarl Word in numbers: [% d] Current interior numbers: [% d] \ n You are the owner of% s registered in code% i \ n has now changed password to "COL_RED" [% s] \ n The skin ID used is [% d] \ n "COL_YELLOW" Coordinates are now at% f,% f,% f and facing towards% f. \ n You are in a status login (% i) ",
job, GetPlayerVirtualWorld (playerid), GetPlayerInterior (playerid), pInfo [playerid] [Nick], pInfo [playerid] [ID], pInfo [playerid] [Password], skinid, x, y, z, facing, pInfo [playerid] [Logged]);

ShowPlayerDialog (playerid, RESPONDDIALOGKOSONG, DIALOG_STYLE_MSGBOX, "Character Database", infoccharacter, "Understood", "");
 new string[140];
 format(string, sizeof(string), "Coordinates are now at% f,% f,% f ",  x, y, z);
SendClientMessage(playerid, 0xFFFFFFFF, string);
}


CMD:mydata(playerid)
{
	new Float: x, Float: y, Float:z, animLib[32], animName[32];
	new Float: facing, work [50];
	new skinid = GetPlayerSkin (playerid);
	GetPlayerPos (playerid, x, y, z);
	GetPlayerFacingAngle (playerid, facing);
    GetAnimationName(GetPlayerAnimationIndex(playerid), animLib, sizeof animLib, animName, sizeof animName);
	new infocharacter[1000];
	format(infocharacter, 1000, "{FFAAAA}Virtuarl Word in numbers: [%d] Current interior numbers: [%d] \n The skin ID used is [% d] \n {FFFF00} Coordinates are now at %0.1f, %0.1f, %0.1f and facing towards %0.1f. \n You are in anim [lib:%s][name:%s] ",
	GetPlayerVirtualWorld(playerid), GetPlayerInterior (playerid), skinid, x, y, z, facing,  animLib, animName);
	ShowPlayerDialog (playerid, 154, DIALOG_STYLE_MSGBOX, "Character Database", infocharacter, "Understood", "");
	new string[140];
	format(string, sizeof(string), "Coordinates are now at %0.1f, %0.1f, %0.1f ",  x, y, z);
	return SendClientMessage(playerid, 0xFFFFFFFF, string);
}

CMD:teleport(playerid, params[])
{
	new Float:gotoPos[3];
	//sscanf(const data[], const format[], ...)

    if(sscanf(params, "fffdd", gotoPos[0], gotoPos[1], gotoPos[2], params[4], params[5])) return SendClientMessage(playerid, -1, "Caranya: /teleport (X) (Y) (Z) (world ID) (Interior ID) ");
    GameTextForPlayer(playerid, "~g~Type /savecordsql to get the coordinate.", 10000, 5);
	SetPlayerPos(playerid, gotoPos[0], gotoPos[1], gotoPos[2]);
    SetPlayerVirtualWorld( playerid, params[4] );
    SetPlayerInterior(playerid, params[5]);

    TogglePlayerControllable(playerid, 0); // supaya karakter yang spawn itu diam tidak bergerak
 	//unfreezeplayer = playerid; // variabel playerid itu sama dengan variabel unfreeplayer
 	//SetTimer("UnFreezeMe",3000,0);
    SetTimerEx("UnFreezeMe", 3000, false, "d", playerid);
    return 1;
}
