 
#include <a_samp>
#include <a_players>
#include <YSI\y_ini>
#include <zcmd>
#include <foreach>
#include <streamer>
#include <sscanf2>
 
#define DIALOG_REGISTER 1
#define DIALOG_LOGIN 2
#define DIALOG_SUCCESS_1 3
#define DIALOG_SUCCESS_2 4
#define DIALOG_STYLE_SKIN 5
 
 
#define PATH "/Users/%s.ini"
 
 
 
 
#define COL_WHITE "{FFFFFF}"
#define COL_RED "{F81414}"
#define COL_GREEN "{00FF22}"
#define COL_LIGHTBLUE "{00CED1}"
#define COLOR_LIGHTBLUE 0x33CCFFAA
 
enum pInfo
{
    pPass,
    pCash,
    pAdmin,
    pKills,
    pDeaths,
    pBanned,
    pScore
}
 
new IsSpectating[MAX_PLAYERS];
new PlayerInfo[MAX_PLAYERS][pInfo];
new PlayerText:ConnectTD[12];
 
forward RandomMessage();
 
new Text:randommsg;
 
new RandomMessages[][] =
    {
    "World Stunting Gaming!",
    "Type /cmds to see list of commands",
    "Type /admins to see current online admins.",
    "Obey the /rules otherwise you'll be punished",
    "Type /startstunt to start your stunting world!",
    "Type /lobby to get back to lobby and have some rest",
    "Type /teleports to see whole teleports menu",
    "Type /tune to add nos and repair your car!",
    "Type /weaps to spawn any weaponaries",
    "Type /car to spawn a vehicle"
// You can define more messages, but make sure you have , everywhere, except at the last message
    };
 
 
forward LoadUser_data(playerid,name[],value[]);
public LoadUser_data(playerid,name[],value[])
{
    INI_Int("Password",PlayerInfo[playerid][pPass]);
    INI_Int("Cash",PlayerInfo[playerid][pCash]);
    INI_Int("Admin",PlayerInfo[playerid][pAdmin]);
    INI_Int("Kills",PlayerInfo[playerid][pKills]);
    INI_Int("Deaths",PlayerInfo[playerid][pDeaths]);
    INI_Int("Score",PlayerInfo[playerid][pScore]);
    return 1;
}
 
stock UserPath(playerid)
{
    new string[128],playername[MAX_PLAYER_NAME];
    GetPlayerName(playerid,playername,sizeof(playername));
    format(string,sizeof(string),PATH,playername);
    return string;
}
 
stock udb_hash(buf[])
{
	    new length=strlen(buf);
	    new s1 = 1;
	    new s2 = 0;
	    new n;
	    for (n=0; n<length; n++)
	    {
	       s1 = (s1 + buf[n]) % 65521;
	       s2 = (s2 + s1)     % 65521;
	    }
	    return (s2 << 16) + s1;
}
/*Credits to Dracoblue*/
 
 
main()
{
	print("\n----------------------------------");
	print(" Stunting world by Flaken loaded");
	print("----------------------------------\n");
}
 
public OnGameModeInit()
{
	SetGameModeText("Minigames v.0.1.0");
    AddPlayerClass(0, 1958.3783, 1343.1572, 15.3746, 269.1425, 0, 0, 0, 0, 0, 0);
    SetTimer("RandomMessage",8000,1);
    randommsg = TextDrawCreate(7.000000, 427.000000, "");
	TextDrawBackgroundColor(randommsg, 255);
	TextDrawFont(randommsg, 1);
	TextDrawLetterSize(randommsg, 0.379999, 1.499999);
	TextDrawColor(randommsg, -1);
	TextDrawSetOutline(randommsg, 1);
	TextDrawSetProportional(randommsg, 1);
 
 
 
//Put the maps codes which I uploaded on the page here (below here)
 
	return 1;
}
 
public OnGameModeExit()
{
	return 1;
}
 
public OnPlayerRequestClass(playerid, classid)
{
	SetPlayerPos(playerid, 1958.3783, 1343.1572, 15.3746);
	SetPlayerCameraPos(playerid, 1958.3783, 1343.1572, 15.3746);
	SetPlayerCameraLookAt(playerid, 1958.3783, 1343.1572, 15.3746);
	return 1;
}
 
public OnPlayerConnect(playerid)
{
    PlayAudioStreamForPlayer(playerid, "http://bugi.oulu.fi/~lmanner/out_of_tune/dp/mp3/09-out_of_tune-call_of_duty.mp3");
    LoadPlayerTextDraws(playerid);
    for (new i = 0; i < 12; i++ )
    PlayerTextDrawShow(playerid, ConnectTD[i]);
    if(fexist(UserPath(playerid)))
    {
        INI_ParseFile(UserPath(playerid), "LoadUser_%s", .bExtra = true, .extra = playerid);
        ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_INPUT,""COL_WHITE"Login",""COL_WHITE"Type your password below to login.","Login","Quit");
    }
    else
    {
        ShowPlayerDialog(playerid, DIALOG_REGISTER, DIALOG_STYLE_INPUT,""COL_WHITE"Registering...",""COL_WHITE"Type your password below to register a new account.","Register","Quit");
        PlayerInfo[playerid][pAdmin] = 0;
        PlayerInfo[playerid][pScore] = 0;
        PlayerInfo[playerid][pDeaths] = 0;
        PlayerInfo[playerid][pKills] = 0;
        PlayerInfo[playerid][pCash] = 0;
    }
    return 1;
}
 
public OnPlayerDisconnect(playerid, reason)
{
    new INI:File = INI_Open(UserPath(playerid));
    INI_SetTag(File,"data");
    INI_WriteInt(File,"Cash",GetPlayerMoney(playerid));
    INI_WriteInt(File,"Admin",PlayerInfo[playerid][pAdmin]);
    INI_WriteInt(File,"Kills",PlayerInfo[playerid][pKills]);
    INI_WriteInt(File,"Deaths",PlayerInfo[playerid][pDeaths]);
    INI_WriteInt(File,"Score",PlayerInfo[playerid][pScore]);
    INI_Close(File);
    return 1;
}
 
public OnPlayerSpawn(playerid)
{
	SetPlayerPos(playerid,964.106994,-53.205497,1001.124572);
	SetPlayerInterior(playerid, 5);
	SendClientMessage(playerid, COLOR_LIGHTBLUE,"Welcome to Stunting World server!");
	SendClientMessage(playerid, COLOR_LIGHTBLUE,"Now, type /startstunt to join the Stunting World");
	SendClientMessage(playerid, COLOR_LIGHTBLUE,"To go back to the lobby, type /lobby");
	SendClientMessage(playerid, COLOR_LIGHTBLUE,"Type /tune to add nos turbo and to fix your car");
	SendClientMessage(playerid, COLOR_LIGHTBLUE,"Type /car to spawn a vehicle");
    TextDrawShowForPlayer(playerid, randommsg);
    PlayerTextDrawHide(playerid, ConnectTD[0]);
    PlayerTextDrawHide(playerid, ConnectTD[1]);
    PlayerTextDrawHide(playerid, ConnectTD[2]);
    PlayerTextDrawHide(playerid, ConnectTD[3]);
    PlayerTextDrawHide(playerid, ConnectTD[4]);
    PlayerTextDrawHide(playerid, ConnectTD[5]);
    PlayerTextDrawHide(playerid, ConnectTD[6]);
    PlayerTextDrawHide(playerid, ConnectTD[7]);
    PlayerTextDrawHide(playerid, ConnectTD[8]);
    PlayerTextDrawHide(playerid, ConnectTD[9]);
    PlayerTextDrawHide(playerid, ConnectTD[10]);
    PlayerTextDrawHide(playerid, ConnectTD[11]);
    StopAudioStreamForPlayer(playerid);
	return 1;
}
 
public OnPlayerDeath(playerid, killerid, reason)
{
    PlayerInfo[killerid][pKills]++;
    PlayerInfo[playerid][pDeaths]++;
    PlayerInfo[playerid][pScore] ++;
    if(IsPlayerConnected(killerid)) //Checks if there really is a "killer" - more ways of death are for example falling from great heights, so there isn't a killer there!
		  {
            SetPlayerScore(killerid,GetPlayerScore(playerid)+5);
		    GivePlayerMoney(killerid, 500); //Give the player 500 dollars
			SendClientMessage(killerid, COLOR_LIGHTBLUE, "*You have won $500 and 5 scores from killing someone*"); // Send message to killer
		  }
    return 1;
}
 
public OnVehicleSpawn(vehicleid)
{
	return 1;
}
 
public OnVehicleDeath(vehicleid, killerid)
{
	return 1;
}
 
public OnPlayerText(playerid, text[])
{
	return 1;
}
 
public OnPlayerCommandText(playerid, cmdtext[])
{
	if (strcmp("/mycommand", cmdtext, true, 10) == 0)
	{
		// Do something here
		return 1;
	}
	return 0;
}
 
public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	return 1;
}
 
public OnPlayerExitVehicle(playerid, vehicleid)
{
	return 1;
}
 
public OnPlayerStateChange(playerid, newstate, oldstate)
{
	return 1;
}
 
public OnPlayerEnterCheckpoint(playerid)
{
	return 1;
}
 
public OnPlayerLeaveCheckpoint(playerid)
{
	return 1;
}
 
public OnPlayerEnterRaceCheckpoint(playerid)
{
	return 1;
}
 
public OnPlayerLeaveRaceCheckpoint(playerid)
{
	return 1;
}
 
public OnRconCommand(cmd[])
{
	return 1;
}
 
public OnPlayerRequestSpawn(playerid)
{
	return 1;
}
 
public OnObjectMoved(objectid)
{
	return 1;
}
 
public OnPlayerObjectMoved(playerid, objectid)
{
	return 1;
}
 
public OnPlayerPickUpPickup(playerid, pickupid)
{
	return 1;
}
 
public OnVehicleMod(playerid, vehicleid, componentid)
{
	return 1;
}
 
public OnVehiclePaintjob(playerid, vehicleid, paintjobid)
{
	return 1;
}
 
public OnVehicleRespray(playerid, vehicleid, color1, color2)
{
	return 1;
}
 
public OnPlayerSelectedMenuRow(playerid, row)
{
	return 1;
}
 
public OnPlayerExitedMenu(playerid)
{
	return 1;
}
 
public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid)
{
	return 1;
}
 
public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
        return 1;
}
 
public OnRconLoginAttempt(ip[], password[], success)
{
	return 1;
}
 
public OnPlayerUpdate(playerid)
{
	return 1;
}
 
public OnPlayerStreamIn(playerid, forplayerid)
{
	return 1;
}
 
public OnPlayerStreamOut(playerid, forplayerid)
{
	return 1;
}
 
public OnVehicleStreamIn(vehicleid, forplayerid)
{
	return 1;
}
 
public OnVehicleStreamOut(vehicleid, forplayerid)
{
	return 1;
}
 
public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if(dialogid == 1)
        {
            if(response)
                {
                    new skinid, message[64];
                    skinid = strval(inputtext);
                    if(skinid < 0 || skinid > 299)
                    {
                    SendClientMessage(playerid, COLOR_LIGHTBLUE, "SERVER: Skin id may be between 0 and 299.");
                    }
                    else
                    {
                    SetPlayerSkin(playerid, skinid);
                    format(message, sizeof(message), "SERVER: You have changed your skin id to %d.", skinid);
                    SendClientMessage(playerid, COLOR_LIGHTBLUE, message);
                    }
                }
        }
    switch( dialogid )
    {
        case DIALOG_REGISTER:
        {
            if (!response) return Kick(playerid);
            if(response)
            {
                if(!strlen(inputtext)) return ShowPlayerDialog(playerid, DIALOG_REGISTER, DIALOG_STYLE_INPUT, ""COL_WHITE"Registering...",""COL_RED"You have entered an invalid password.\n"COL_WHITE"Type your password below to register a new account.","Register","Quit");
                new INI:File = INI_Open(UserPath(playerid));
                INI_SetTag(File,"data");
                INI_WriteInt(File,"Password",udb_hash(inputtext));
                INI_WriteInt(File,"Cash",0);
                INI_WriteInt(File,"Admin",0);
                INI_WriteInt(File,"Kills",0);
                INI_WriteInt(File,"Deaths",0);
                INI_WriteInt(File,"Score",0);
                INI_Close(File);
 
                SetSpawnInfo(playerid, 0, 0, 1958.33, 1343.12, 15.36, 269.15, 0, 0, 0, 0, 0, 0);
                SpawnPlayer(playerid);
                ShowPlayerDialog(playerid, DIALOG_SUCCESS_1, DIALOG_STYLE_MSGBOX,""COL_WHITE"Success!",""COL_GREEN"Great! You now have succesfully registered on our database!","Ok","");
			}
        }
 
        case DIALOG_LOGIN:
        {
            if ( !response ) return Kick ( playerid );
            if( response )
            {
                if(udb_hash(inputtext) == PlayerInfo[playerid][pPass])
                {
                    INI_ParseFile(UserPath(playerid), "LoadUser_%s", .bExtra = true, .extra = playerid);
                    GivePlayerMoney(playerid, PlayerInfo[playerid][pCash]);
					ShowPlayerDialog(playerid, DIALOG_SUCCESS_2, DIALOG_STYLE_MSGBOX,""COL_WHITE"Success!",""COL_GREEN"You have successfully logged in!","Ok","");
                }
                else
                {
                    ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_INPUT,""COL_WHITE"Login",""COL_RED"You have entered an incorrect password.\n"COL_WHITE"Type your password below to login.","Login","Quit");
                }
                return 1;
            }
        }
    }
    return 1;
}
 
public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	return 1;
}
 
CMD:startstunt(playerid, params[])
{
SetPlayerPos(playerid,384.0750,2541.4612,16.5391);
SetPlayerInterior(playerid, 0);
SetPlayerHealth(playerid, 1000);
SendClientMessage(playerid, COLOR_LIGHTBLUE,"You have entered the stunt world, type /lobby to go back to lobby for resting");
SendClientMessage(playerid, COLOR_LIGHTBLUE,"Type /teleports for a list of teleports commands");
return 1;
}
 
CMD:lobby(playerid, params[])
{
	SetPlayerPos(playerid,964.106994,-53.205497,1001.124572);
	SetPlayerInterior(playerid, 5);
	SendClientMessage(playerid, COLOR_LIGHTBLUE,"You have entered the lobby, welcome back, take some rests!");
	SendClientMessage(playerid, COLOR_LIGHTBLUE,"Type /startstunt if you feel you wanna go back stunting.");
	return 1;
}
 
	CMD:kick(playerid, params[])
	{
	    new id, reason[128];
        if(PlayerInfo[playerid][pAdmin] < 2) return SendClientMessage(playerid, COLOR_LIGHTBLUE, "You're not authorized to use this command!");
	    else if(sscanf(params, "us", id, reason))SendClientMessage(playerid, COLOR_LIGHTBLUE, "Usage: /kick [id/name][reason]");
	    else if(id==playerid)SendClientMessage(playerid,COLOR_LIGHTBLUE,"Error: You can not kick yourself!");
	    else if(IsPlayerAdmin(id))SendClientMessage(playerid,COLOR_LIGHTBLUE,"Error: You can not kick another admin!");
	    else if (id==INVALID_PLAYER_ID)SendClientMessage(playerid,COLOR_LIGHTBLUE,"Error: Player is not connected!");
	    else {
	        new Name[MAX_PLAYER_NAME], KickMessage[128];
	        new Name2[MAX_PLAYER_NAME];
	        GetPlayerName(playerid, Name, sizeof(Name));
	        GetPlayerName(id, Name2, sizeof(Name2));
	        format(KickMessage, sizeof(KickMessage), "Administrator %s(%d) has kicked player %s(%d)| Reason: %s", Name, playerid, Name2, id);
	        SendClientMessageToAll(COLOR_LIGHTBLUE, KickMessage);
	        Kick(id);
	    }
	    return 1;
	}
 
	CMD:warn(playerid, params[])
	{
			new id, reason[128];
            if(PlayerInfo[playerid][pAdmin] < 2) return SendClientMessage(playerid, COLOR_LIGHTBLUE, "You're not authorized to use this command!");
			else if(sscanf(params, "us", id, reason))SendClientMessage(playerid, COLOR_LIGHTBLUE,"Usage: /warn [id/name] [reason]");
	        else if(id==playerid)SendClientMessage(playerid,COLOR_LIGHTBLUE,"Error: You can not warn yourself!");
		    else if(IsPlayerAdmin(id))SendClientMessage(playerid,COLOR_LIGHTBLUE,"Error: You can not warn another admin!");
		    else if (id==INVALID_PLAYER_ID)SendClientMessage(playerid,COLOR_LIGHTBLUE,"Error: Player is not connected!");
		    else
			{
	        new Name[MAX_PLAYER_NAME], WarnMessage[128];
	        new Name2[MAX_PLAYER_NAME];
	        GetPlayerName(playerid, Name, sizeof(Name));
	        GetPlayerName(id, Name2, sizeof(Name2));
	        format(WarnMessage, sizeof(WarnMessage), "Administrator %s(%d) has warned  %s(%d) | Reason: %s", Name, playerid, Name2, id);
	        SendClientMessageToAll(COLOR_LIGHTBLUE, WarnMessage);
		    }
		    return 1;
	}
 
    CMD:ban(playerid,params[])
	{
				 if(IsPlayerAdmin(playerid))
	             {
			     new id;
			     new tmp[256], tmp2[256], Index;
			     tmp = strtok(params,Index), tmp2 = strtok(params,Index);
			     if(isnull(params)) return SendClientMessage(playerid, COLOR_LIGHTBLUE, "Usage: /ban [id/name] [reason]"); //Check If Player Does Not Added "Reason and the ID"
			     if(IsPlayerAdmin(id))SendClientMessage(playerid,COLOR_LIGHTBLUE,"Error: You can not kick another admin!");
			     if(id==playerid)SendClientMessage(playerid,COLOR_LIGHTBLUE,"Error: You can not kick yourself!");
			     new player1, playername[MAX_PLAYER_NAME], adminname[MAX_PLAYER_NAME], string[128];
			     player1 = strval(tmp); // << player1 = ID of The Player
			     if(!IsPlayerConnected(player1)) return SendClientMessage(playerid,COLOR_LIGHTBLUE,"Error: Player is not connected!"); //<< Check If Player Connected Or Not
			     GetPlayerName(player1, playername, sizeof(playername)); //get Selected Player Name
			     GetPlayerName(playerid, adminname, sizeof(adminname)); //get Admin Name Who Use This command
		         format(string,sizeof(string),"Administrator %s has banned %s | Reason ( %s )",adminname,playername,params[2]); //adminname = the player Who Use This command || playername = the Player who Going To Be kicked || params[2] = The Reason Of The Kick
		         SendClientMessageToAll(COLOR_LIGHTBLUE,string); // Send Message To all Players.
		         Ban(player1);
	             }
				 else return SendClientMessage(playerid,COLOR_LIGHTBLUE,"You're not authorized to use this command!"); // This Code return the Player IF he's not Login in as RCON admin
				 return 1;
	}
 
 
 
	CMD:rangeban(playerid, params[]) {
	            new id;
	            new reason[50];
	            if(PlayerInfo[playerid][pAdmin] < 5) return SendClientMessage(playerid, COLOR_LIGHTBLUE, "You're not authorized to use this command!");
	            if(sscanf(params, "us[50]", id,reason)) return SendClientMessage(playerid, COLOR_LIGHTBLUE, "[USAGE] - /rangeban [ID] [REASON]");
		        if(PlayerInfo[id][pAdmin] == 7) return SendClientMessage(playerid, COLOR_LIGHTBLUE, "* One does not simply range-ban the server owner!");
 
	            new string[150], sender[MAX_PLAYER_NAME], receiver[MAX_PLAYER_NAME];
		        GetPlayerName(playerid, sender, sizeof(sender));
		        GetPlayerName(id, receiver, sizeof(receiver));
		        //new rbandate[3];
		        //getdate(rbandate[0], rbandate[1], rbandate[2]);
		        format(string, sizeof(string), "[BAN] - %s(%d) has been banned by %s(%d)", receiver, id, sender, playerid);
		        SendClientMessageToAll(COLOR_LIGHTBLUE, string); //Sends the kick message, as seen above ^.
 
		        format(string, sizeof(string), "[BAN] - Reason: %s", reason);
		        SendClientMessageToAll(COLOR_LIGHTBLUE, string); //Sends the kick reasons message, as seen above ^
 
		        SetTimerEx("KickTimer", 500, false, "i", id); //Sets KickTimer to 1 seond(will be kicked after 1 second)
                PlayerInfo[id][pBanned] = 1;
 
	            SendClientMessage(id, COLOR_LIGHTBLUE, "[BAN] - You've been BANNED"); //Sends Target a message, saying that he was kicked.
		        SendClientMessage(id, COLOR_LIGHTBLUE, "[BAN] - For more info read the chat.");
 
		            //{FFFFFF}%s\n\n{FF002B}Reason: {FFFFFF}%s\n\n{FF002B}Date: {FFFFFF}%02d/%02d/%04d\n\n{FFFFFF}Press F8 to take a screenshot and use this in unban appeal!", pname, playerid,Reason, rbandate[2], rbandate[1], rbandate[0]);
		        new ip[50];
		        GetPlayerIp(id,ip,sizeof(ip));
		        strdel(ip,strlen(ip)-4,strlen(ip));
		        format(ip,sizeof(ip),"%s**.**",ip);
		        format(ip,sizeof(ip),"banip %s",ip);
		        SendRconCommand(ip);
 
		        printf("ADMIN %s has RANGE BANNED %s FOR: %s", sender, receiver, reason);
 
                new INI:File = INI_Open(UserPath(id));
                INI_SetTag(File,"ban info");
                INI_WriteString(File,"RANGE-Banned By", sender);
                INI_WriteString(File,"Reason", reason);
                INI_Close(File);
                return 1;
	    }
 
    CMD:announce(playerid, params[])
	{
				new string[128];
                if(PlayerInfo[playerid][pAdmin] < 2) return SendClientMessage(playerid, -COLOR_LIGHTBLUE, "You're not authorized to use this command!");
                if(!strlen(params))
				    {
				        SendClientMessage(playerid, COLOR_LIGHTBLUE, "Usage: /announce [message]");
				        return 1;
					}
			    format(string, sizeof(string), "%s", params);
				GameTextForAll(string, 5000, 0);
				return 1;
				}
 
 
 
CMD:spec(playerid, params[])
{
	new ID;
	new pname[128];
	GetPlayerName(ID, pname, sizeof(pname));
    if(PlayerInfo[playerid][pAdmin] < 2) return SendClientMessage(playerid, -COLOR_LIGHTBLUE, "You're not authorized to use this command!");
    if(sscanf(params, "i", ID))
		{
		    SendClientMessage(playerid, COLOR_LIGHTBLUE, "Usage: /spec (playerid)");
		    return 1;
		}
    if(!IsPlayerConnected(ID))
		{
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "Invalid player ID");
			return 1;
		}
    TogglePlayerSpectating(playerid, 1);
    PlayerSpectatePlayer(playerid, ID);
    SetPlayerInterior(playerid, ID);
    SetPlayerInterior(playerid, GetPlayerInterior(ID));
    IsSpectating[playerid] =1;
    return 1;
}
 
 
	CMD:specoff(playerid, params[])
	{
	#pragma unused params
 	if(IsSpectating[playerid] == 1)
 	{
		TogglePlayerSpectating(playerid, 0);
		IsSpectating[playerid] =0;
		return 1;
	}
	return 1;
	}
 
 
CMD:goto(playerid, params[])
{
	new string[128];
	new ID;
	new pname[128];
	GetPlayerName(ID, pname, sizeof(pname));
    if(PlayerInfo[playerid][pAdmin] < 2) return SendClientMessage(playerid, -COLOR_LIGHTBLUE, "You're not authorized to use this command!");
	if(sscanf(params, "i", ID))
		{
		    SendClientMessage(playerid, COLOR_LIGHTBLUE, "Usage: /goto (playerid)");
		    return 1;
		}
	if(!IsPlayerConnected(ID))
		{
		    SendClientMessage(playerid, COLOR_LIGHTBLUE, "That player ID is not connected.");
		    return 1;
		}
	new Float:x, Float:y, Float:z;
	GetPlayerPos(ID, x, y, z);
	SetPlayerPos(playerid, x, y, z);
	SetPlayerPos(playerid,x+1,y,z);
	SetPlayerVirtualWorld(playerid,GetPlayerVirtualWorld(ID));
	SetPlayerInterior(playerid,GetPlayerInterior(ID));
	format(string, sizeof(string), "You have teleported to %s(%d)", pname, ID);
	SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
	return 1;
}
 
CMD:bring(playerid, params[])
{
	new string[128];
	new ID;
	new pname[128];
	GetPlayerName(ID, pname, sizeof(pname));
    if(PlayerInfo[playerid][pAdmin] < 2) return SendClientMessage(playerid, COLOR_LIGHTBLUE, "You're not authorized to use this command!");
    if(sscanf(params, "i", ID))
	    {
	        SendClientMessage(playerid, COLOR_LIGHTBLUE, "Usage: /bring (playerid)");
	        return 1;
		}
	if(!IsPlayerConnected(ID))
		{
		    SendClientMessage(playerid, COLOR_LIGHTBLUE, "Invalid player ID");
		    return 1;
		}
	new Float:x, Float:y, Float:z;
	GetPlayerPos(playerid, x, y, z);
 
    SetPlayerPos(ID, x+1, y, z);
    SetPlayerVirtualWorld(ID, GetPlayerVirtualWorld(playerid));
    SetPlayerInterior(ID, GetPlayerInterior(playerid));
    format(string, sizeof(string), "You have brought %s(%d) to you.", pname, ID);
    SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
    return 1;
}
 
CMD:setscore(playerid, params[])
{
  new id, score;
  if(sscanf(params, "ud", id, score) ) return SendClientMessage(playerid, COLOR_LIGHTBLUE, "Usage: /setscore [id] [score]");
  if(PlayerInfo[playerid][pAdmin] < 5)SendClientMessage(playerid, -COLOR_LIGHTBLUE, "You're not authorized to use this command!");
  SendClientMessage(playerid, COLOR_LIGHTBLUE, "You set the score");
  SetPlayerScore(id, score);
  return 1;
}
 
COMMAND:clearchat(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin] < 2) return SendClientMessage(playerid, COLOR_LIGHTBLUE, "You're not authorized to use this command!");
    for(new i = 0; i < 250; i++) SendClientMessageToAll(0x00000000," ");
	return 1;
}
 
 
CMD:setmoney(playerid, params[])
{
  new id, cash;
  if(sscanf(params, "ud", id, cash) ) return SendClientMessage(playerid, -COLOR_LIGHTBLUE, "Usage: /setcash [id] [cash]");
  if(PlayerInfo[playerid][pAdmin] < 5)SendClientMessage(playerid, -COLOR_LIGHTBLUE, "You're not authorized to use this command!");
  SendClientMessage(playerid, COLOR_LIGHTBLUE, "You set the cash");
  GivePlayerMoney(id, cash);
  return 1;
}
 
COMMAND:explode(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin] < 2) return SendClientMessage(playerid, COLOR_LIGHTBLUE, "You're not authorized to use this command!");
    new Float:x,Float:y,Float:z,id;
    if(sscanf(params,"u",id)) return SendClientMessage(playerid,COLOR_LIGHTBLUE,"Usage: /explode [playerid]");
    GetPlayerPos(id,x,y,z);
    CreateExplosion(x,y,z,6,50.0);
	return 1;
}
 
COMMAND:sethp(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin] < 2) return SendClientMessage(playerid, COLOR_LIGHTBLUE, "You're not authorized to use this command!");
    new id,Float:health;
    if(sscanf(params,"uf",id,health)) return SendClientMessage(playerid,COLOR_LIGHTBLUE,"USAGE: /sethp [playerid] [hp]");
    if(id == INVALID_PLAYER_ID) return SendClientMessage(playerid,COLOR_LIGHTBLUE,"Player not found!");
    SetPlayerHealth(id,health);
	return 1;
}
COMMAND:setarmor(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin] < 2) return SendClientMessage(playerid, COLOR_LIGHTBLUE, "You're not authorized to use this command!");
    new id,Float:ar;
    if(sscanf(params,"uf",id,ar)) return SendClientMessage(playerid,COLOR_LIGHTBLUE,"USAGE: /setarmor [playerid] [armour]");
    if(id == INVALID_PLAYER_ID) return SendClientMessage(playerid,COLOR_LIGHTBLUE,"Player not found!");
    SetPlayerArmour(id,ar);
	return 1;
}
 
COMMAND:makeadmin(playerid,params[])
{
	if(!IsPlayerAdmin(playerid))SendClientMessage(playerid,COLOR_LIGHTBLUE,"You must be rcon admin to use this command");
    new id,level,string[128];
    if(sscanf(params,"ui",id,level)) return SendClientMessage(playerid,COLOR_LIGHTBLUE,"USAGE: /makeadmin [playerid] [level 1-5]");
    if(level > 7) return SendClientMessage(playerid, COLOR_LIGHTBLUE, "Usage: Choose a level beetwen 0-5");
	format(string,sizeof(string),"You have been PROMOTED to admin level %i",level);
	SendClientMessage(id,COLOR_LIGHTBLUE,string);
	PlayerInfo[id][pAdmin] = level;
	return 1;
}
 
CMD:ip(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] < 2) return SendClientMessage(playerid, COLOR_LIGHTBLUE, "You're not authorized to use this command!");
    new id,a[16];
    new string[128];
    if(sscanf(params, "u", id))return SendClientMessage(playerid, -COLOR_LIGHTBLUE, "Usage: /ip [playerid]");
    if(IsPlayerConnected(id))
		{
 			GetPlayerIp(id, a, sizeof(a));
			format(string,sizeof(string),"This player IP is : %s",a);
		 	SendClientMessage(playerid,COLOR_LIGHTBLUE,string);
      		return GameTextForPlayer(playerid,"~w~you have checked player ip",3000,1);
	    }
		else return  SendClientMessage(playerid, COLOR_LIGHTBLUE, "Player is not connected!");
}
 
	CMD:acmds(playerid,params[])
	{
      if(PlayerInfo[playerid][pAdmin] < 2) return SendClientMessage(playerid, COLOR_LIGHTBLUE, "You're not authorized to use this command!");
	  SendClientMessage(playerid,COLOR_LIGHTBLUE,"Welcome to Critical DM admin commands list!");
	  SendClientMessage(playerid,COLOR_LIGHTBLUE,"[STATISTICS] /ban /rangeban /setscore /setmoney");
	  SendClientMessage(playerid,COLOR_LIGHTBLUE,"[PLAYER] /warn /kick /spec /specoff /goto /bring /explode");
	  SendClientMessage(playerid,COLOR_LIGHTBLUE,"[PLAYER] /sethp /setarmor /ip");
	  SendClientMessage(playerid,COLOR_LIGHTBLUE,"[PUBLIC] /announce /asay /clearchat /makeadmin");
	  return 1;
	}
 
	CMD:kill(playerid, params[])
		{
			SetPlayerHealth(playerid, 0);
			SendClientMessage(playerid, 0xFFFFFFAA, "You have successfully killed yourself");
			return 1;
		}
 
	CMD:cmds(playerid, params[])
	{
	SendClientMessage(playerid,COLOR_LIGHTBLUE,"[SERVER] /admins /stats /kill /rules /lobby /startstunt /teleports");
	SendClientMessage(playerid,COLOR_LIGHTBLUE,"[PLAYER] /afk /back /weaps /ask /report");
	SendClientMessage(playerid,COLOR_LIGHTBLUE,"More commands coming soon!");
	return 1;
	}
 
CMD:rules(playerid,params[])
{
SendClientMessage(playerid,COLOR_LIGHTBLUE,"------------------------");
SendClientMessage(playerid,COLOR_LIGHTBLUE,"[RULES] No insulting");
SendClientMessage(playerid,COLOR_LIGHTBLUE,"[RULES] No arguing");
SendClientMessage(playerid,COLOR_LIGHTBLUE,"[RULES] Respect the admins and players");
SendClientMessage(playerid,COLOR_LIGHTBLUE,"[RULES] Do not ask to be admin");
SendClientMessage(playerid,COLOR_LIGHTBLUE,"[RULES] Have fun and enjoy");
SendClientMessage(playerid,COLOR_LIGHTBLUE,"------------------------");
return 1;
}
 
CMD:ask(playerid,params[])
{
    new str[80];
    if(sscanf(params,"s[80]",str)) SendClientMessage(playerid,COLOR_LIGHTBLUE,"Usage : /ask [HELP]");
    new name[MAX_PLAYER_NAME],msg[110];
    GetPlayerName(playerid,name,20);
    format(msg,sizeof(msg),"[HELP]%s(%d) : %s",name,playerid,str);
    for(new i=0;i<MAX_PLAYERS;++i)
    {
        if(IsPlayerConnected(i) && (PlayerInfo[i][pAdmin] >0 || IsPlayerAdmin(i)))
        SendClientMessage(i,-COLOR_LIGHTBLUE,msg);
    }
    return 1;
}
 
COMMAND:asay(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 1) return SendClientMessage(playerid,COLOR_LIGHTBLUE,"You're not authorized to use this command!");
    new text[128];
    if(sscanf(params,"s[128]",text)) return SendClientMessage(playerid,COLOR_LIGHTBLUE,"Usage: /asay[text]");
    foreach(new i: Player)
		{
		    if(PlayerInfo[i][pAdmin] >= 1)
		    {
		        new string[64];
		        format(string,sizeof(string),"%s",text);
				SendClientMessage(i,COLOR_LIGHTBLUE,string);
			}
		}
	return 1;
}
 
COMMAND:admins(playerid,params[])
{
	new count = 0;
	new string[128];
	new AdminRank[128];
	SendClientMessage(playerid,COLOR_LIGHTBLUE,"");
	SendClientMessage(playerid,COLOR_LIGHTBLUE,"________________|ONLINE ADMINS|________________");
	SendClientMessage(playerid,COLOR_LIGHTBLUE,"");
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
			if(PlayerInfo[i][pAdmin] > 0)
			{
				if(PlayerInfo[i][pAdmin] == 1)
				{
					AdminRank = "Helper";
				}
				else if(PlayerInfo[i][pAdmin] == 2)
				{
					AdminRank = "Moderator";
				}
				else if(PlayerInfo[i][pAdmin] == 3)
				{
					AdminRank = "Administrator";
				}
				else if(PlayerInfo[i][pAdmin] == 4)
				{
					AdminRank = "HR Manager";
				}
				else if(PlayerInfo[i][pAdmin] == 5)
				{
					AdminRank = "Server Owner";
				}
				new aName[MAX_PLAYER_NAME];
				GetPlayerName(i,aName,sizeof(aName));
				format(string, sizeof(string), "Level: %d | Name: %s (ID:%i) | Rank: %s ", PlayerInfo[i][pAdmin], aName,i,AdminRank);
				SendClientMessage(playerid,COLOR_LIGHTBLUE,string);
				count++;
			}
		}
	}
	if(count == 0)
	SendClientMessage(playerid,COLOR_LIGHTBLUE,"No Admins online!");
	SendClientMessage(playerid,COLOR_LIGHTBLUE,"_________________________________________________");
	return 1;
}
 
CMD:stats(playerid, params[])
{
	new str[1000];
	#define DIALOG_STATS    1997
	format(str, sizeof(str), "Admin: %d\nKills: %d\nDeaths: %d\nCash: %d\nScore: %d", PlayerInfo[playerid][pAdmin],PlayerInfo[playerid][pKills],PlayerInfo[playerid][pDeaths],PlayerInfo[playerid][pCash],PlayerInfo[playerid][pScore]);
	ShowPlayerDialog(playerid, DIALOG_STATS, DIALOG_STYLE_MSGBOX , "STATS", str, "CLOSE", "");
	return 1;
}
 
CMD:report(playerid, params[])
{
	new id, reason[60];
	new string[256], Reporter[MAX_PLAYER_NAME];
	new Target[MAX_PLAYER_NAME];
	if(sscanf(params, "us[60]", id, reason)) return SendClientMessage(playerid, COLOR_LIGHTBLUE, "Usage:/report (playerid/partofname) (reason)");
	if(id == INVALID_PLAYER_ID) SendClientMessage(playerid, COLOR_LIGHTBLUE, "[{B4B5B7}System{FF6347}]: {B4B5B7}Player not found!");
	GetPlayerName(playerid, Reporter, sizeof(Reporter));
	GetPlayerName(id, Target, sizeof(Target));
	format(string, sizeof(string),"Player'%s reported Player'%s. Reason:%s.",Reporter,Target,reason);
	ReportMessage(string);
	SendClientMessage(playerid, COLOR_LIGHTBLUE, "You have sent your report's to an Online Admin!");
	return 1;
}
	CMD:weaps(playerid, params[])
	{
		SendClientMessage(playerid,COLOR_LIGHTBLUE,"Deagle - /deagle - gives you a weapon (Deagle)");
		SendClientMessage(playerid,COLOR_LIGHTBLUE,"Combat shotgun - /combat - gives you a weapon (SPAS 12)");
		SendClientMessage(playerid,COLOR_LIGHTBLUE,"M4 - /m4 - gives you a weapon (M4)");
		SendClientMessage(playerid,COLOR_LIGHTBLUE,"Tec-9 - /tec9 - gives you a weapon (TEC-9)");
		SendClientMessage(playerid,COLOR_LIGHTBLUE,"Sniper - /sniper - gives you a weapon (SNIPER)");
		return 1;
	}
 
	CMD:deagle(playerid, params[])
	{
		GivePlayerWeapon(playerid,24,500);
		SendClientMessage(playerid,COLOR_LIGHTBLUE,"You have recieved a weaponary");
		return 1;
	}
 
	CMD:combat(playerid, params[])
	{
		GivePlayerWeapon(playerid,27,500);
		SendClientMessage(playerid,COLOR_LIGHTBLUE,"You have recieved a weaponary");
		return 1;
	}
 
	CMD:m4(playerid, params[])
	{
		GivePlayerWeapon(playerid,31,500);
		SendClientMessage(playerid,COLOR_LIGHTBLUE,"You have recieved a weaponary");
		return 1;
	}
 
	CMD:tec9(playerid, params[])
	{
		GivePlayerWeapon(playerid,32,500);
		SendClientMessage(playerid,COLOR_LIGHTBLUE,"You have recieved a weaponary");
		return 1;
	}
 
	CMD:sniper(playerid, params[])
	{
	GivePlayerWeapon(playerid,34,500);
	SendClientMessage(playerid,COLOR_LIGHTBLUE,"You have recieved a weaponary");
	return 1;
	}
 
 
 
 
 
LoadPlayerTextDraws(playerid)
{
        ConnectTD[0] = CreatePlayerTextDraw(playerid,-11.000000, 342.000000, "-");
        PlayerTextDrawBackgroundColor(playerid,ConnectTD[0], 255);
        PlayerTextDrawFont(playerid,ConnectTD[0], 1);
        PlayerTextDrawLetterSize(playerid,ConnectTD[0], 0.500000, 16.200000);
        PlayerTextDrawColor(playerid,ConnectTD[0], -1);
        PlayerTextDrawSetOutline(playerid,ConnectTD[0], 0);
        PlayerTextDrawSetProportional(playerid,ConnectTD[0], 1);
        PlayerTextDrawSetShadow(playerid,ConnectTD[0], 1);
        PlayerTextDrawUseBox(playerid,ConnectTD[0], 1);
        PlayerTextDrawBoxColor(playerid,ConnectTD[0], 180);
        PlayerTextDrawTextSize(playerid,ConnectTD[0], 692.000000, 32.000000);
        PlayerTextDrawSetSelectable(playerid,ConnectTD[0], 0);
 
        ConnectTD[1] = CreatePlayerTextDraw(playerid,-12.000000, 339.000000, "-");
        PlayerTextDrawBackgroundColor(playerid,ConnectTD[1], 255);
        PlayerTextDrawFont(playerid,ConnectTD[1], 1);
        PlayerTextDrawLetterSize(playerid,ConnectTD[1], 0.500000, 0.000000);
        PlayerTextDrawColor(playerid,ConnectTD[1], -1);
        PlayerTextDrawSetOutline(playerid,ConnectTD[1], 0);
        PlayerTextDrawSetProportional(playerid,ConnectTD[1], 1);
        PlayerTextDrawSetShadow(playerid,ConnectTD[1], 1);
        PlayerTextDrawUseBox(playerid,ConnectTD[1], 1);
        PlayerTextDrawBoxColor(playerid,ConnectTD[1], -6750038);
        PlayerTextDrawTextSize(playerid,ConnectTD[1], 692.000000, 42.000000);
        PlayerTextDrawSetSelectable(playerid,ConnectTD[1], 0);
 
        ConnectTD[2] = CreatePlayerTextDraw(playerid,-11.000000, -49.000000, "-");
        PlayerTextDrawBackgroundColor(playerid,ConnectTD[2], 255);
        PlayerTextDrawFont(playerid,ConnectTD[2], 1);
        PlayerTextDrawLetterSize(playerid,ConnectTD[2], 0.500000, 16.200000);
        PlayerTextDrawColor(playerid,ConnectTD[2], -1);
        PlayerTextDrawSetOutline(playerid,ConnectTD[2], 0);
        PlayerTextDrawSetProportional(playerid,ConnectTD[2], 1);
        PlayerTextDrawSetShadow(playerid,ConnectTD[2], 1);
        PlayerTextDrawUseBox(playerid,ConnectTD[2], 1);
        PlayerTextDrawBoxColor(playerid,ConnectTD[2], 180);
        PlayerTextDrawTextSize(playerid,ConnectTD[2], 692.000000, 32.000000);
        PlayerTextDrawSetSelectable(playerid,ConnectTD[2], 0);
 
        ConnectTD[3] = CreatePlayerTextDraw(playerid,-12.000000, 100.000000, "-");
        PlayerTextDrawBackgroundColor(playerid,ConnectTD[3], 255);
        PlayerTextDrawFont(playerid,ConnectTD[3], 1);
        PlayerTextDrawLetterSize(playerid,ConnectTD[3], 0.500000, 0.000000);
        PlayerTextDrawColor(playerid,ConnectTD[3], -1);
        PlayerTextDrawSetOutline(playerid,ConnectTD[3], 0);
        PlayerTextDrawSetProportional(playerid,ConnectTD[3], 1);
        PlayerTextDrawSetShadow(playerid,ConnectTD[3], 1);
        PlayerTextDrawUseBox(playerid,ConnectTD[3], 1);
        PlayerTextDrawBoxColor(playerid,ConnectTD[3], -6750038);
        PlayerTextDrawTextSize(playerid,ConnectTD[3], 692.000000, 42.000000);
        PlayerTextDrawSetSelectable(playerid,ConnectTD[3], 0);
 
        ConnectTD[4] = CreatePlayerTextDraw(playerid,123.000000, 347.000000, "~r~Stunting ~w~World ~b~Gaming.");
        PlayerTextDrawBackgroundColor(playerid,ConnectTD[4], 255);
        PlayerTextDrawFont(playerid,ConnectTD[4], 3);
        PlayerTextDrawLetterSize(playerid,ConnectTD[4], 0.400000, 1.200000);
        PlayerTextDrawColor(playerid,ConnectTD[4], -1);
        PlayerTextDrawSetOutline(playerid,ConnectTD[4], 1);
        PlayerTextDrawSetProportional(playerid,ConnectTD[4], 1);
        PlayerTextDrawSetSelectable(playerid,ConnectTD[4], 0);
 
        ConnectTD[5] = CreatePlayerTextDraw(playerid,266.000000, 356.000000, "-");
        PlayerTextDrawBackgroundColor(playerid,ConnectTD[5], 0);
        PlayerTextDrawFont(playerid,ConnectTD[5], 5);
        PlayerTextDrawLetterSize(playerid,ConnectTD[5], 0.500000, 1.000000);
        PlayerTextDrawColor(playerid,ConnectTD[5], -1);
        PlayerTextDrawSetOutline(playerid,ConnectTD[5], 1);
        PlayerTextDrawSetProportional(playerid,ConnectTD[5], 1);
        PlayerTextDrawUseBox(playerid,ConnectTD[5], 1);
        PlayerTextDrawBoxColor(playerid,ConnectTD[5], 0);
        PlayerTextDrawTextSize(playerid,ConnectTD[5], 89.000000, 59.000000);
        PlayerTextDrawSetPreviewModel(playerid, ConnectTD[5], 406);
        PlayerTextDrawSetPreviewRot(playerid, ConnectTD[5], -16.000000, 0.000000, 0.000000, 1.000000);
        PlayerTextDrawSetSelectable(playerid,ConnectTD[5], 0);
 
        ConnectTD[6] = CreatePlayerTextDraw(playerid,254.000000, 361.000000, "Server Version ~r~~h~0.3x");
        PlayerTextDrawBackgroundColor(playerid,ConnectTD[6], 255);
        PlayerTextDrawFont(playerid,ConnectTD[6], 2);
        PlayerTextDrawLetterSize(playerid,ConnectTD[6], 0.339998, 1.699998);
        PlayerTextDrawColor(playerid,ConnectTD[6], -1);
        PlayerTextDrawSetOutline(playerid,ConnectTD[6], 1);
        PlayerTextDrawSetProportional(playerid,ConnectTD[6], 1);
        PlayerTextDrawSetSelectable(playerid,ConnectTD[6], 0);
 
        ConnectTD[7] = CreatePlayerTextDraw(playerid,186.000000, 366.000000, "-");
        PlayerTextDrawBackgroundColor(playerid,ConnectTD[7], 0);
        PlayerTextDrawFont(playerid,ConnectTD[7], 5);
        PlayerTextDrawLetterSize(playerid,ConnectTD[7], 0.500000, 1.000000);
        PlayerTextDrawColor(playerid,ConnectTD[7], -1);
        PlayerTextDrawSetOutline(playerid,ConnectTD[7], 1);
        PlayerTextDrawSetProportional(playerid,ConnectTD[7], 1);
        PlayerTextDrawUseBox(playerid,ConnectTD[7], 1);
        PlayerTextDrawBoxColor(playerid,ConnectTD[7], 0);
        PlayerTextDrawTextSize(playerid,ConnectTD[7], 106.000000, 56.000000);
        PlayerTextDrawSetPreviewModel(playerid, ConnectTD[7], 6986);
        PlayerTextDrawSetPreviewRot(playerid, ConnectTD[7], -16.000000, 0.000000, 130.000000, 1.000000);
        PlayerTextDrawSetSelectable(playerid,ConnectTD[7], 0);
 
        ConnectTD[8] = CreatePlayerTextDraw(playerid,232.000000, 375.000000, "-");
        PlayerTextDrawBackgroundColor(playerid,ConnectTD[8], 0);
        PlayerTextDrawFont(playerid,ConnectTD[8], 5);
        PlayerTextDrawLetterSize(playerid,ConnectTD[8], 0.500000, 2.299998);
        PlayerTextDrawColor(playerid,ConnectTD[8], -1);
        PlayerTextDrawSetOutline(playerid,ConnectTD[8], 1);
        PlayerTextDrawSetProportional(playerid,ConnectTD[8], 1);
        PlayerTextDrawUseBox(playerid,ConnectTD[8], 1);
        PlayerTextDrawBoxColor(playerid,ConnectTD[8], 0);
        PlayerTextDrawTextSize(playerid,ConnectTD[8], 153.000000, 101.000000);
        PlayerTextDrawSetPreviewModel(playerid, ConnectTD[8], 18750);
        PlayerTextDrawSetPreviewRot(playerid, ConnectTD[8], 90.000000, 180.000000, 0.000000, 1.000000);
        PlayerTextDrawSetSelectable(playerid,ConnectTD[8], 0);
 
        ConnectTD[9] = CreatePlayerTextDraw(playerid,38.000000, 350.000000, "-");
        PlayerTextDrawBackgroundColor(playerid,ConnectTD[9], 0);
        PlayerTextDrawFont(playerid,ConnectTD[9], 5);
        PlayerTextDrawLetterSize(playerid,ConnectTD[9], 0.500000, 7.099998);
        PlayerTextDrawColor(playerid,ConnectTD[9], -1);
        PlayerTextDrawSetOutline(playerid,ConnectTD[9], 1);
        PlayerTextDrawSetProportional(playerid,ConnectTD[9], 1);
        PlayerTextDrawUseBox(playerid,ConnectTD[9], 1);
        PlayerTextDrawBoxColor(playerid,ConnectTD[9], 0);
        PlayerTextDrawTextSize(playerid,ConnectTD[9], 93.000000, 86.000000);
        PlayerTextDrawSetPreviewModel(playerid, ConnectTD[9], 7392);
        PlayerTextDrawSetPreviewRot(playerid, ConnectTD[9], -16.000000, 0.000000, 90.000000, 1.000000);
        PlayerTextDrawSetSelectable(playerid,ConnectTD[9], 0);
 
        ConnectTD[10] = CreatePlayerTextDraw(playerid,506.000000, 350.000000, "-");
        PlayerTextDrawBackgroundColor(playerid,ConnectTD[10], 0);
        PlayerTextDrawFont(playerid,ConnectTD[10], 5);
        PlayerTextDrawLetterSize(playerid,ConnectTD[10], 0.500000, 7.099998);
        PlayerTextDrawColor(playerid,ConnectTD[10], -1);
        PlayerTextDrawSetOutline(playerid,ConnectTD[10], 1);
        PlayerTextDrawSetProportional(playerid,ConnectTD[10], 1);
        PlayerTextDrawUseBox(playerid,ConnectTD[10], 1);
        PlayerTextDrawBoxColor(playerid,ConnectTD[10], 0);
        PlayerTextDrawTextSize(playerid,ConnectTD[10], 93.000000, 86.000000);
        PlayerTextDrawSetPreviewModel(playerid, ConnectTD[10], 7392);
        PlayerTextDrawSetPreviewRot(playerid, ConnectTD[10], -16.000000, 0.000000, -90.000000, 1.000000);
        PlayerTextDrawSetSelectable(playerid,ConnectTD[10], 0);
 
        ConnectTD[11] = CreatePlayerTextDraw(playerid,329.000000, 367.000000, "-");
        PlayerTextDrawBackgroundColor(playerid,ConnectTD[11], 0);
        PlayerTextDrawFont(playerid,ConnectTD[11], 5);
        PlayerTextDrawLetterSize(playerid,ConnectTD[11], 0.500000, 1.000000);
        PlayerTextDrawColor(playerid,ConnectTD[11], -1);
        PlayerTextDrawSetOutline(playerid,ConnectTD[11], 1);
        PlayerTextDrawSetProportional(playerid,ConnectTD[11], 1);
        PlayerTextDrawUseBox(playerid,ConnectTD[11], 1);
        PlayerTextDrawBoxColor(playerid,ConnectTD[11], 0);
        PlayerTextDrawTextSize(playerid,ConnectTD[11], 106.000000, 56.000000);
        PlayerTextDrawSetPreviewModel(playerid, ConnectTD[11], 6986);
        PlayerTextDrawSetPreviewRot(playerid, ConnectTD[11], -16.000000, 0.000000, -130.000000, 1.000000);
        PlayerTextDrawSetSelectable(playerid,ConnectTD[11], 0);
}
 
 
stock ReportMessage(const string[])
{
    for(new i = 0; i < MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1)
		{
			if(PlayerInfo[i][pAdmin] > 0)
			{
				SendClientMessage(i, COLOR_LIGHTBLUE, string);
			}
		}
	}
    return 0;
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
 
CMD:skin(playerid, params[])
{
                ShowPlayerDialog(playerid,DIALOG_STYLE_SKIN, DIALOG_STYLE_INPUT, "Skin Change", "Enter the skin id you wish to have below", "Confirm", "Cancel");
                return 1;
}
 
forward CreateVehicleForPlayer(playerid, vehiclename[], color1, color2, Float:Health);
forward DeletePlayerVehicle(playerid);
 
enum PV_User
{
        vehicle
};
static P_DATA_VEH[ MAX_PLAYERS ][ PV_User ];
 
public CreateVehicleForPlayer(playerid, vehiclename[], color1, color2, Float:Health)
{
        new pvmid;
        if(strfind("Landstalker", vehiclename,true,0) != -1) pvmid = 400;
        if(strfind("Bravura", vehiclename,true,0) != -1) pvmid = 401;
        if(strfind("Buffalo", vehiclename,true,0) != -1) pvmid = 402;
        if(strfind("Linerunner", vehiclename,true,0) != -1) pvmid = 403;
        if(strfind("Perenniel", vehiclename,true,0) != -1) pvmid = 404;
        if(strfind("Sentinel", vehiclename,true,0) != -1) pvmid = 405;
        if(strfind("Dumper", vehiclename,true,0) != -1) pvmid = 406;
        if(strfind("Firetuck", vehiclename,true,0) != -1) pvmid = 407;
        if(strfind("Trashmaster", vehiclename,true,0) != -1) pvmid = 408;
        if(strfind("Stretch", vehiclename,true,0) != -1) pvmid = 409;
        if(strfind("Manana", vehiclename,true,0) != -1) pvmid = 410;
        if(strfind("Infernus", vehiclename,true,0) != -1) pvmid = 411;
        if(strfind("Voodoo", vehiclename,true,0) != -1) pvmid = 412;
        if(strfind("Pony", vehiclename,true,0) != -1) pvmid = 413;
        if(strfind("Mule", vehiclename,true,0) != -1) pvmid = 414;
        if(strfind("Cheetah", vehiclename,true,0) != -1) pvmid = 415;
        if(strfind("Ambulance", vehiclename,true,0) != -1) pvmid = 416;
        if(strfind("Leviathan", vehiclename,true,0) != -1) pvmid = 417;
        if(strfind("Moonbeam", vehiclename,true,0) != -1) pvmid = 418;
        if(strfind("Esperanto", vehiclename,true,0) != -1) pvmid = 419;
        if(strfind("Taxi", vehiclename,true,0) != -1) pvmid = 420;
        if(strfind("Washington", vehiclename,true,0) != -1) pvmid = 421;
        if(strfind("Bobcat", vehiclename,true,0) != -1) pvmid = 422;
        if(strfind("Mr Whoopie", vehiclename,true,0) != -1) pvmid = 423;
        if(strfind("BF Injection", vehiclename,true,0) != -1) pvmid = 424;
        if(strfind("Hunter", vehiclename,true,0) != -1) pvmid = 425;
        if(strfind("Premier", vehiclename,true,0) != -1) pvmid = 426;
        if(strfind("Enforcer", vehiclename,true,0) != -1) pvmid = 427;
        if(strfind("Securicar", vehiclename,true,0) != -1) pvmid = 428;
        if(strfind("Banshee", vehiclename,true,0) != -1) pvmid = 429;
        if(strfind("Predator", vehiclename,true,0) != -1) pvmid = 430;
        if(strfind("Bus", vehiclename,true,0) != -1) pvmid = 431;
        if(strfind("Rhino", vehiclename,true,0) != -1) pvmid = 432;
        if(strfind("Barracks", vehiclename,true,0) != -1) pvmid = 433;
        if(strfind("Hotknife", vehiclename,true,0) != -1) pvmid = 434;
        if(strfind("ArticleTrailer", vehiclename,true,0) != -1) pvmid = 435;
        if(strfind("Previon", vehiclename,true,0) != -1) pvmid = 436;
        if(strfind("Coach", vehiclename,true,0) != -1) pvmid = 437;
        if(strfind("Cabbie", vehiclename,true,0) != -1) pvmid = 438;
        if(strfind("Stallion", vehiclename,true,0) != -1) pvmid = 439;
        if(strfind("Rumpo", vehiclename,true,0) != -1) pvmid = 440;
        if(strfind("RCBandit", vehiclename,true,0) != -1) pvmid = 441;
        if(strfind("Romero", vehiclename,true,0) != -1) pvmid = 442;
        if(strfind("Packer", vehiclename,true,0) != -1) pvmid = 443;
        if(strfind("Monster", vehiclename,true,0) != -1) pvmid = 444;
        if(strfind("Admiral", vehiclename,true,0) != -1) pvmid = 445;
        if(strfind("Squallo", vehiclename,true,0) != -1) pvmid = 446;
        if(strfind("Seasparrow", vehiclename,true,0) != -1) pvmid = 447;
        if(strfind("Pizzaboy", vehiclename,true,0) != -1) pvmid = 448;
        if(strfind("Tram", vehiclename,true,0) != -1) pvmid = 449;
        if(strfind("Article Trailer 2", vehiclename,true,0) != -1) pvmid = 450;
        if(strfind("Turismo", vehiclename,true,0) != -1) pvmid = 451;
        if(strfind("Speeder", vehiclename,true,0) != -1) pvmid = 452;
        if(strfind("Reefer", vehiclename,true,0) != -1) pvmid = 453;
        if(strfind("Tropic", vehiclename,true,0) != -1) pvmid = 454;
        if(strfind("Flatbed", vehiclename,true,0) != -1) pvmid = 455;
        if(strfind("Yankee", vehiclename,true,0) != -1) pvmid = 456;
        if(strfind("Caddy", vehiclename,true,0) != -1) pvmid = 457;
        if(strfind("Solair", vehiclename,true,0) != -1) pvmid = 458;
        if(strfind("Berkley's RC Van", vehiclename,true,0) != -1) pvmid = 459;
        if(strfind("Skimmer", vehiclename,true,0) != -1) pvmid = 460;
        if(strfind("PCJ600", vehiclename,true,0) != -1) pvmid = 461;
        if(strfind("Faggio", vehiclename,true,0) != -1) pvmid = 462;
        if(strfind("Freeway", vehiclename,true,0) != -1) pvmid = 463;
        if(strfind("RCBaron", vehiclename,true,0) != -1) pvmid = 464;
        if(strfind("RCRaider", vehiclename,true,0) != -1) pvmid = 465;
        if(strfind("Glendale", vehiclename,true,0) != -1) pvmid = 466;
        if(strfind("Oceanic", vehiclename,true,0) != -1) pvmid = 467;
        if(strfind("Sanchez", vehiclename,true,0) != -1) pvmid = 468;
        if(strfind("Sparrow", vehiclename,true,0) != -1) pvmid = 469;
        if(strfind("Patriot", vehiclename,true,0) != -1) pvmid = 470;
        if(strfind("Quad", vehiclename,true,0) != -1) pvmid = 471;
        if(strfind("Coastguard", vehiclename,true,0) != -1) pvmid = 472;
        if(strfind("Dinghy", vehiclename,true,0) != -1) pvmid = 473;
        if(strfind("Hermes", vehiclename,true,0) != -1) pvmid = 474;
        if(strfind("Sabre", vehiclename,true,0) != -1) pvmid = 475;
        if(strfind("Rustler", vehiclename,true,0) != -1) pvmid = 476;
        if(strfind("ZR350", vehiclename,true,0) != -1) pvmid = 477;
        if(strfind("Walton", vehiclename,true,0) != -1) pvmid = 478;
        if(strfind("Regina", vehiclename,true,0) != -1) pvmid = 479;
        if(strfind("Comet", vehiclename,true,0) != -1) pvmid = 480;
        if(strfind("BMX", vehiclename,true,0) != -1) pvmid = 481;
        if(strfind("Burrito", vehiclename,true,0) != -1) pvmid = 482;
        if(strfind("Camper", vehiclename,true,0) != -1) pvmid = 483;
        if(strfind("Marquis", vehiclename,true,0) != -1) pvmid = 484;
        if(strfind("Baggage", vehiclename,true,0) != -1) pvmid = 485;
        if(strfind("Dozer", vehiclename,true,0) != -1) pvmid = 486;
        if(strfind("Maverick", vehiclename,true,0) != -1) pvmid = 487;
        if(strfind("SAN News Maverick", vehiclename,true,0) != -1) pvmid = 488;
        if(strfind("Rancher", vehiclename,true,0) != -1) pvmid = 489;
        if(strfind("FBI Rancher", vehiclename,true,0) != -1) pvmid = 490;
        if(strfind("Virgo", vehiclename,true,0) != -1) pvmid = 491;
        if(strfind("Greenwood", vehiclename,true,0) != -1) pvmid = 492;
        if(strfind("Jetmax", vehiclename,true,0) != -1) pvmid = 493;
        if(strfind("Hotring Racer", vehiclename,true,0) != -1) pvmid = 494;
        if(strfind("Sandking", vehiclename,true,0) != -1) pvmid = 495;
        if(strfind("Blista Compact", vehiclename,true,0) != -1) pvmid = 496;
        if(strfind("Police Maverick", vehiclename,true,0) != -1) pvmid = 497;
        if(strfind("Boxville", vehiclename,true,0) != -1) pvmid = 498;
        if(strfind("Benson", vehiclename,true,0) != -1) pvmid = 499;
        if(strfind("Mesa", vehiclename,true,0) != -1) pvmid = 500;
        if(strfind("RC Goblin", vehiclename,true,0) != -1) pvmid = 501;
        if(strfind("Hotring Racer", vehiclename,true,0) != -1) pvmid = 502;
        if(strfind("Hotring Racer", vehiclename,true,0) != -1) pvmid = 503;
        if(strfind("Bloodring Banger", vehiclename,true,0) != -1) pvmid = 505;
        if(strfind("Rancher", vehiclename,true,0) != -1) pvmid = 505;
        if(strfind("Super GT", vehiclename,true,0) != -1) pvmid = 506;
        if(strfind("Elegant", vehiclename,true,0) != -1) pvmid = 507;
        if(strfind("Journey", vehiclename,true,0) != -1) pvmid = 508;
        if(strfind("Bike", vehiclename,true,0) != -1) pvmid = 509;
        if(strfind("Mountain Bike", vehiclename,true,0) != -1) pvmid = 510;
        if(strfind("Beagle", vehiclename,true,0) != -1) pvmid = 511;
        if(strfind("Cropduster", vehiclename,true,0) != -1) pvmid = 512;
        if(strfind("Stuntplane", vehiclename,true,0) != -1) pvmid = 513;
        if(strfind("Tanker", vehiclename,true,0) != -1) pvmid = 515;
        if(strfind("Roadtrain", vehiclename,true,0) != -1) pvmid = 515;
        if(strfind("Nebula", vehiclename,true,0) != -1) pvmid = 516;
        if(strfind("Majestic", vehiclename,true,0) != -1) pvmid = 517;
        if(strfind("Buccaneer", vehiclename,true,0) != -1) pvmid = 518;
        if(strfind("Shamal", vehiclename,true,0) != -1) pvmid = 519;
        if(strfind("Hydra", vehiclename,true,0) != -1) pvmid = 520;
        if(strfind("FCR900", vehiclename,true,0) != -1) pvmid = 521;
        if(strfind("NRG500", vehiclename,true,0) != -1) pvmid = 522;
        if(strfind("HPV1000", vehiclename,true,0) != -1) pvmid = 523;
        if(strfind("Cement Truck", vehiclename,true,0) != -1) pvmid = 525;
        if(strfind("Towtruck", vehiclename,true,0) != -1) pvmid = 525;
        if(strfind("Fortune", vehiclename,true,0) != -1) pvmid = 526;
        if(strfind("Cadrona", vehiclename,true,0) != -1) pvmid = 527;
        if(strfind("FBI Truck", vehiclename,true,0) != -1) pvmid = 528;
        if(strfind("Willard", vehiclename,true,0) != -1) pvmid = 529;
        if(strfind("Forklift", vehiclename,true,0) != -1) pvmid = 530;
        if(strfind("Tractor", vehiclename,true,0) != -1) pvmid = 531;
        if(strfind("Combine Harvester", vehiclename,true,0) != -1) pvmid = 532;
        if(strfind("Feltzer", vehiclename,true,0) != -1) pvmid = 533;
        if(strfind("Remington", vehiclename,true,0) != -1) pvmid = 535;
        if(strfind("Slamvan", vehiclename,true,0) != -1) pvmid = 535;
        if(strfind("Blade", vehiclename,true,0) != -1) pvmid = 536;
        if(strfind("Freight Train", vehiclename,true,0) != -1) pvmid = 537;
        if(strfind("Brownstreak Train", vehiclename,true,0) != -1) pvmid = 538;
        if(strfind("Vortex", vehiclename,true,0) != -1) pvmid = 539;
        if(strfind("Vincent", vehiclename,true,0) != -1) pvmid = 540;
        if(strfind("Bullet", vehiclename,true,0) != -1) pvmid = 541;
        if(strfind("Clover", vehiclename,true,0) != -1) pvmid = 542;
        if(strfind("Sadler", vehiclename,true,0) != -1) pvmid = 543;
        if(strfind("Firetruck LA", vehiclename,true,0) != -1) pvmid = 544;
        if(strfind("Hustler", vehiclename,true,0) != -1) pvmid = 545;
        if(strfind("Intruder", vehiclename,true,0) != -1) pvmid = 546;
        if(strfind("Primo", vehiclename,true,0) != -1) pvmid = 547;
        if(strfind("Cargobob", vehiclename,true,0) != -1) pvmid = 548;
        if(strfind("Tampa", vehiclename,true,0) != -1) pvmid = 549;
        if(strfind("Sunrise", vehiclename,true,0) != -1) pvmid = 550;
        if(strfind("Merit", vehiclename,true,0) != -1) pvmid = 551;
        if(strfind("Utility Van", vehiclename,true,0) != -1) pvmid = 552;
        if(strfind("Nevada", vehiclename,true,0) != -1) pvmid = 553;
        if(strfind("Yosemite", vehiclename,true,0) != -1) pvmid = 555;
        if(strfind("Windsor", vehiclename,true,0) != -1) pvmid = 555;
        if(strfind("MonsterA", vehiclename,true,0) != -1) pvmid = 556;
        if(strfind("MonsterB", vehiclename,true,0) != -1) pvmid = 557;
        if(strfind("Uranus", vehiclename,true,0) != -1) pvmid = 558;
        if(strfind("Jester", vehiclename,true,0) != -1) pvmid = 559;
        if(strfind("Sultan", vehiclename,true,0) != -1) pvmid = 560;
        if(strfind("Stratum", vehiclename,true,0) != -1) pvmid = 561;
        if(strfind("Elegy", vehiclename,true,0) != -1) pvmid = 562;
        if(strfind("Raindance", vehiclename,true,0) != -1) pvmid = 563;
        if(strfind("RC Tiger", vehiclename,true,0) != -1) pvmid = 564;
        if(strfind("Flash", vehiclename,true,0) != -1) pvmid = 565;
        if(strfind("Tahoma", vehiclename,true,0) != -1) pvmid = 566;
        if(strfind("Savanna", vehiclename,true,0) != -1) pvmid = 567;
        if(strfind("Bandito", vehiclename,true,0) != -1) pvmid = 568;
        if(strfind("Freight Flat Trailer", vehiclename,true,0) != -1) pvmid = 569;
        if(strfind("Streak Trailer", vehiclename,true,0) != -1) pvmid = 570;
        if(strfind("Kart", vehiclename,true,0) != -1) pvmid = 571;
        if(strfind("Mower", vehiclename,true,0) != -1) pvmid = 572;
        if(strfind("Dune", vehiclename,true,0) != -1) pvmid = 573;
        if(strfind("Sweeper", vehiclename,true,0) != -1) pvmid = 574;
        if(strfind("Broadway", vehiclename,true,0) != -1) pvmid = 575;
        if(strfind("Tornado", vehiclename,true,0) != -1) pvmid = 576;
        if(strfind("AT400", vehiclename,true,0) != -1) pvmid = 577;
        if(strfind("DFT30", vehiclename,true,0) != -1) pvmid = 578;
        if(strfind("Huntley", vehiclename,true,0) != -1) pvmid = 579;
        if(strfind("Stafford", vehiclename,true,0) != -1) pvmid = 580;
        if(strfind("BF400", vehiclename,true,0) != -1) pvmid = 581;
        if(strfind("Newsvan", vehiclename,true,0) != -1) pvmid = 582;
        if(strfind("Tug", vehiclename,true,0) != -1) pvmid = 583;
        if(strfind("Petrol Trailer", vehiclename,true,0) != -1) pvmid = 584;
        if(strfind("Emperor", vehiclename,true,0) != -1) pvmid = 585;
        if(strfind("Wayfarer", vehiclename,true,0) != -1) pvmid = 586;
        if(strfind("Euros", vehiclename,true,0) != -1) pvmid = 587;
        if(strfind("Hotdog", vehiclename,true,0) != -1) pvmid = 588;
        if(strfind("Club", vehiclename,true,0) != -1) pvmid = 589;
        if(strfind("Freight Box Trailer", vehiclename,true,0) != -1) pvmid = 590;
        if(strfind("Article Trailer 3", vehiclename,true,0) != -1) pvmid = 591;
        if(strfind("Andromada", vehiclename,true,0) != -1) pvmid = 592;
        if(strfind("Dodo", vehiclename,true,0) != -1) pvmid = 593;
        if(strfind("RCCam", vehiclename,true,0) != -1) pvmid = 595;
        if(strfind("Launch", vehiclename,true,0) != -1) pvmid = 595;
        if(strfind("Police Car LSPD", vehiclename,true,0) != -1) pvmid = 596;
        if(strfind("Police Car SFPP", vehiclename,true,0) != -1) pvmid = 597;
        if(strfind("Police Car LVPD", vehiclename,true,0) != -1) pvmid = 598;
        if(strfind("Police Ranger", vehiclename,true,0) != -1) pvmid = 599;
        if(strfind("S.W.A.T. SWAT", vehiclename,true,0) != -1) pvmid = 601;
        if(strfind("Alpha", vehiclename,true,0) != -1) pvmid = 602;
        if(strfind("Phoenix", vehiclename,true,0) != -1) pvmid = 603;
        if(strfind("Glendale Shit", vehiclename,true,0) != -1) pvmid = 604;
        if(strfind("Sadler Shit", vehiclename,true,0) != -1) pvmid = 605;
        if(strfind("Baggage Trailer A", vehiclename,true,0) != -1) pvmid = 606;
        if(strfind("Baggage Trailer B", vehiclename,true,0) != -1) pvmid = 607;
        if(strfind("Tug Stairs Trailer", vehiclename,true,0) != -1) pvmid = 608;
        if(strfind("Boxville", vehiclename,true,0) != -1) pvmid = 609;
        if(strfind("Farm Trailer", vehiclename,true,0) != -1) pvmid = 610;
        if(strfind("Utility Trailer", vehiclename,true,0) != -1) pvmid = 611;
 
        if(strlen(vehiclename) == 3 && strval(vehiclename) >= 400 && strval(vehiclename) <= 611) pvmid = strval(vehiclename);
        if(pvmid == 0) return SendClientMessage(playerid, COLOR_LIGHTBLUE, "Incorrect Vehicle Name/Model ID");
        new Float:pVposX, Float:pVposY, Float:pVposZ, Float:pVposFA;
        GetPlayerPos(playerid, pVposX, pVposY, pVposZ);
        GetPlayerFacingAngle(playerid, pVposFA);
        if(IsPlayerInAnyVehicle(playerid))
        {
            new VID;
            VID = GetPlayerVehicleID(playerid);
            GetVehicleZAngle(VID, pVposFA);
        }
        new CVID, pVW, pINT;
        pVW = GetPlayerVirtualWorld(playerid);
        pINT = GetPlayerInterior(playerid);
        CVID = CreateVehicle(pvmid, pVposX, pVposY, pVposZ+0.6, pVposFA,color1,color2,0);
        SetVehicleVirtualWorld(CVID, pVW);
        LinkVehicleToInterior(CVID, pINT);
        SetVehicleHealth(CVID, Health);
        PutPlayerInVehicle(playerid,CVID,0);
        P_DATA_VEH[playerid][vehicle] = CVID;
        new pmsg[64];
        format(pmsg,sizeof(pmsg),"[pVehicle] Vehicle ID: %i Created (Model %i).",CVID,pvmid);
        print(pmsg);
        return CVID;
}
 
 
CMD:car(playerid, params[])
{
    new vname[20];
    if(!sscanf(params,"s[20]",vname))
    {
        if(!IsPlayerInAnyVehicle(playerid))
        {
            CreateVehicleForPlayer(playerid, vname, -1, -1, 1000.0);
        } else SendClientMessage(playerid, COLOR_LIGHTBLUE, "You already have a vehicle.");
    } else SendClientMessage(playerid, COLOR_LIGHTBLUE, "Usage: /car [vehicle name]");
    return true;
}
 
public RandomMessage()
{
        TextDrawSetString(randommsg, RandomMessages[random(sizeof(RandomMessages))]); // We need this to make the timer working
        return 1;
}
 
CMD:teleports(playerid, params[])
{
SendClientMessage(playerid, COLOR_LIGHTBLUE,"[PARKOUR] /parkour /parkour2 /parkourcity /parkourtower");
SendClientMessage(playerid, COLOR_LIGHTBLUE,"[STUNTSPOT] /skatepark /loop");
SendClientMessage(playerid, COLOR_LIGHTBLUE,"[STUNTSPOT] /ls /lv /sf /lsairport /lvairport /sfairport /aa");
SendClientMessage(playerid, COLOR_LIGHTBLUE,"[STUNTSPOT] /chilliad /drag /longjump /sfpark");
SendClientMessage(playerid, COLOR_LIGHTBLUE,"[STUNTSPOT] /nrg /area51");
SendClientMessage(playerid, COLOR_LIGHTBLUE," More stunting teleports are coming..");
return 1;
}
 
CMD:skatepark(playerid, params[])
{
	if(GetPlayerState(playerid) != 1 && GetPlayerState(playerid) != 2 && GetPlayerState(playerid) != 3 && GetPlayerState(playerid) != 7)
	return SendClientMessage(playerid, COLOR_LIGHTBLUE, "[Spawned]: You must be spawned, To use this command!");
	if(GetPlayerState(playerid) == PLAYER_STATE_PASSENGER) return SendClientMessage(playerid, COLOR_LIGHTBLUE, "[Error]: You cannot teleport while in Passenger seat!");
	SetCameraBehindPlayer(playerid);
	if(IsPlayerInAnyVehicle(playerid))
	{
	    LinkVehicleToInterior(GetPlayerVehicleID(playerid), 0);
	    SetVehiclePos(GetPlayerVehicleID(playerid), 1912.7152,-1400.0713,13.1329);
	    SetVehicleZAngle(GetPlayerVehicleID(playerid), 298.7019);
	}
	else
	{
	    SetPlayerInterior(playerid, 0);
	    SetPlayerPos(playerid, 1922.0667,-1412.6779,13.5703);
	    SetPlayerFacingAngle(playerid, 86.2690);
	}
	new Name[MAX_PLAYER_NAME], TeleMessage[128];
	GetPlayerName(playerid, Name, sizeof(Name));
	format(TeleMessage, sizeof(TeleMessage), "[Teleport]: %s(%d) has teleport to Skate Park (/skatepark)", Name);
	SendClientMessageToAll(COLOR_LIGHTBLUE, TeleMessage);
	return 1;
}
 
CMD:loop(playerid, params[])
{
SetPlayerInterior(playerid, 0);
SetPlayerPos(playerid, 1312.0313,1604.5643,5560.4512);
new Name[MAX_PLAYER_NAME], TeleMessage[128];
GetPlayerName(playerid, Name, sizeof(Name));
format(TeleMessage, sizeof(TeleMessage), "[Teleport]: %s(%d) has teleport to Loop (/loop)",Name);
SendClientMessageToAll(COLOR_LIGHTBLUE, TeleMessage);
return 1;
}
 
CMD:ls(playerid, params[])
{
SetPlayerInterior(playerid, 0);
SetPlayerPos(playerid, 1500.8813,-1616.5336,14.789);
new Name[MAX_PLAYER_NAME], TeleMessage[128];
GetPlayerName(playerid, Name, sizeof(Name));
format(TeleMessage, sizeof(TeleMessage), "[Teleport]: %s(%d) has teleport to Los Santos (/ls)",Name);
SendClientMessageToAll(COLOR_LIGHTBLUE, TeleMessage);
return 1;
}
 
CMD:sf(playerid, params[])
{
SetPlayerInterior(playerid, 0);
SetPlayerPos(playerid, -2097.0488,-394.3982,35.5313);
new Name[MAX_PLAYER_NAME], TeleMessage[128];
GetPlayerName(playerid, Name, sizeof(Name));
format(TeleMessage, sizeof(TeleMessage), "[Teleport]: %s(%d) has teleport to San Fierro (/sf)",Name);
SendClientMessageToAll(COLOR_LIGHTBLUE, TeleMessage);
return 1;
}
 
CMD:lv(playerid, params[])
{
SetPlayerInterior(playerid, 0);
SetPlayerPos(playerid, 1097.6732,1452.2833,12.5469);
new Name[MAX_PLAYER_NAME], TeleMessage[128];
GetPlayerName(playerid, Name, sizeof(Name));
format(TeleMessage, sizeof(TeleMessage), "[Teleport]: %s(%d) has teleport to Las Venturas (/lv)",Name);
SendClientMessageToAll(COLOR_LIGHTBLUE, TeleMessage);
return 1;
}
 
CMD:sfairport(playerid, params[])
{
SetPlayerInterior(playerid, 0);
SetPlayerPos(playerid, -1274.2908,42.7297,14.1484);
new Name[MAX_PLAYER_NAME], TeleMessage[128];
GetPlayerName(playerid, Name, sizeof(Name));
format(TeleMessage, sizeof(TeleMessage), "[Teleport]: %s(%d) has teleport to San Fierro Airport (/sfairport)",Name);
SendClientMessageToAll(COLOR_LIGHTBLUE, TeleMessage);
return 1;
}
 
CMD:lvairport(playerid, params[])
{
SetPlayerInterior(playerid, 0);
SetPlayerPos(playerid, 1307.6665,1350.6819,10.8203);
new Name[MAX_PLAYER_NAME], TeleMessage[128];
GetPlayerName(playerid, Name, sizeof(Name));
format(TeleMessage, sizeof(TeleMessage), "[Teleport]: %s(%d) has teleport to Las Venturas Airport (/lvairport)",Name);
SendClientMessageToAll(COLOR_LIGHTBLUE, TeleMessage);
return 1;
}
 
CMD:lsairport(playerid, params[])
{
SetPlayerInterior(playerid, 0);
SetPlayerPos(playerid, 1838.6377,-2404.4272,13.5547);
new Name[MAX_PLAYER_NAME], TeleMessage[128];
GetPlayerName(playerid, Name, sizeof(Name));
format(TeleMessage, sizeof(TeleMessage), "[Teleport]: %s(%d) has teleport to Los Santos Airport (/lsairport)",Name);
SendClientMessageToAll(COLOR_LIGHTBLUE, TeleMessage);
return 1;
}
 
 
CMD:chilliad(playerid, params[])
{
SetPlayerInterior(playerid, 0);
SetPlayerPos(playerid, -2314.1245,-1693.3069,482.5130);
new Name[MAX_PLAYER_NAME], TeleMessage[128];
GetPlayerName(playerid, Name, sizeof(Name));
format(TeleMessage, sizeof(TeleMessage), "[Teleport]: %s(%d) has teleport to Mountain Chilliad (/chilliad)",Name);
SendClientMessageToAll(COLOR_LIGHTBLUE, TeleMessage);
return 1;
}
 
CMD:drag(playerid, params[])
{
SetPlayerInterior(playerid, 0);
SetPlayerPos(playerid, 1570.2462,-1222.1364,277.8779);
new Name[MAX_PLAYER_NAME], TeleMessage[128];
GetPlayerName(playerid, Name, sizeof(Name));
format(TeleMessage, sizeof(TeleMessage), "[Teleport]: %s(%d) has teleport to Drag Stunt (/drag)",Name);
SendClientMessageToAll(COLOR_LIGHTBLUE, TeleMessage);
return 1;
}
 
CMD:sfpark(playerid, params[])
{
SetPlayerInterior(playerid, 0);
SetPlayerPos(playerid, -2629.9939,1402.4919,7.0994);
new Name[MAX_PLAYER_NAME], TeleMessage[128];
GetPlayerName(playerid, Name, sizeof(Name));
format(TeleMessage, sizeof(TeleMessage), "[Teleport]: %s(%d) has teleport to San Fierro Park (/sfpark)",Name);
SendClientMessageToAll(COLOR_LIGHTBLUE, TeleMessage);
return 1;
}
 
CMD:longjump(playerid, params[])
{
SetPlayerInterior(playerid, 0);
SetPlayerPos(playerid, -620.7425,-21.9257,992.6344);
new Name[MAX_PLAYER_NAME], TeleMessage[128];
GetPlayerName(playerid, Name, sizeof(Name));
format(TeleMessage, sizeof(TeleMessage), "[Teleport]: %s(%d) has teleport to Long Jump (/longjump)",Name);
SendClientMessageToAll(COLOR_LIGHTBLUE, TeleMessage);
return 1;
}
 
CMD:nrg(playerid, params[])
{
SetPlayerInterior(playerid, 0);
SetPlayerPos(playerid, 1468.1033,-1104.4773,93.3606);
new Name[MAX_PLAYER_NAME], TeleMessage[128];
GetPlayerName(playerid, Name, sizeof(Name));
format(TeleMessage, sizeof(TeleMessage), "[Teleport]: %s(%d) has teleport to NRG Stunts (/nrg)",Name);
SendClientMessageToAll(COLOR_LIGHTBLUE, TeleMessage);
return 1;
}
 
CMD:area51(playerid, params[])
{
SetPlayerInterior(playerid, 0);
SetPlayerPos(playerid, 275.6482,2026.9867,17.6406);
new Name[MAX_PLAYER_NAME], TeleMessage[128];
GetPlayerName(playerid, Name, sizeof(Name));
format(TeleMessage, sizeof(TeleMessage), "[Teleport]: %s(%d) has teleport to Area 51 Stunts(/area51)",Name);
SendClientMessageToAll(COLOR_LIGHTBLUE, TeleMessage);
return 1;
}
 
CMD:aa(playerid, params[])
{
SetPlayerInterior(playerid, 0);
SetPlayerPos(playerid, 391.2109,2539.9592,16.5427);
new Name[MAX_PLAYER_NAME], TeleMessage[128];
GetPlayerName(playerid, Name, sizeof(Name));
format(TeleMessage, sizeof(TeleMessage), "[Teleport]: %s(%d) has teleport to Abondenad Airport(/aa)",Name);
SendClientMessageToAll(COLOR_LIGHTBLUE, TeleMessage);
return 1;
}
 
CMD:parkour(playerid, params[])
{
	SetPlayerInterior(playerid, 0);
	SetPlayerPos(playerid, 1172.6453,-2063.0654,432.7773);
	new Name[MAX_PLAYER_NAME], TeleMessage[128];
    GetPlayerName(playerid, Name, sizeof(Name));
	format(TeleMessage, sizeof(TeleMessage), "[Parkour]: %s(%d) has teleport to Parkour 1 (/parkour)", Name);
	SendClientMessageToAll(COLOR_LIGHTBLUE, TeleMessage);
	return 1;
}
 
CMD:parkour2(playerid, params[])
{
	SetPlayerInterior(playerid, 0);
	SetPlayerPos(playerid, 2014.4009,1076.6163,48.8961);
	new Name[MAX_PLAYER_NAME], TeleMessage[128];
    GetPlayerName(playerid, Name, sizeof(Name));
	format(TeleMessage, sizeof(TeleMessage), "[Parkour]: %s(%d) has teleport to Parkour 2 (/parkour2)", Name);
	SendClientMessageToAll(COLOR_LIGHTBLUE, TeleMessage);
	return 1;
}
 
CMD:parkourcity(playerid, params[])
{
	SetPlayerInterior(playerid, 0);
	SetPlayerPos(playerid, 2584.4878,-1349.7924,232.2472);
	new Name[MAX_PLAYER_NAME], TeleMessage[128];
    GetPlayerName(playerid, Name, sizeof(Name));
	format(TeleMessage, sizeof(TeleMessage), "[Parkour]: %s(%d) has teleport to Parkour City (/parkourcity)", Name);
	SendClientMessageToAll(COLOR_LIGHTBLUE, TeleMessage);
	return 1;
}
 
CMD:parkourtower(playerid, params[])
{
	SetPlayerInterior(playerid, 0);
	SetPlayerPos(playerid, 1544.9349,-1354.6836,329.4720);
	new Name[MAX_PLAYER_NAME], TeleMessage[128];
    GetPlayerName(playerid, Name, sizeof(Name));
	format(TeleMessage, sizeof(TeleMessage), "[Parkour]: %s(%d) has teleport to Parkour Tower (/parkourtower)", Name);
	SendClientMessageToAll(COLOR_LIGHTBLUE, TeleMessage);
	return 1;
}
 
 
 
CMD:tune(playerid, params[])
{
if(IsPlayerInAnyVehicle(playerid))
{
SetVehicleHealth(GetPlayerVehicleID(playerid),1000.0);
RepairVehicle(GetPlayerVehicleID(playerid));
PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
}
else SendClientMessage(playerid, COLOR_LIGHTBLUE,"You are not in a vehicle");
if(IsPlayerInAnyVehicle(playerid))
{
AddVehicleComponent(GetPlayerVehicleID(playerid), 1010);
}
else SendClientMessage(playerid,COLOR_LIGHTBLUE,"You are not in a vehicle");
return 1;
}
