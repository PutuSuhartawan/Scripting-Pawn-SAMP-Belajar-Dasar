
stock LocalMessage(Float:dist, playerid, color, message[], chatbubble=0)
{
  if(!strlen(message)) return;

  if(IsPlayerConnected(playerid))
  {
    new Float:fPlayerX, Float:fPlayerY, Float:fPlayerZ;
    new Float:fPlayerToPlayerDist;
    
    // send to the origin player
    PlayerMessage(playerid, color, message);
    
    
    // if it requires a chat bubble, show it.
    if(chatbubble) {
      SetPlayerChatBubble(playerid, message, color, dist, CHAT_BUBBLE_TIME);
    }

    GetPlayerPos(playerid, fPlayerX, fPlayerY, fPlayerZ);
    
    for(new i = 0; i < MAX_PLAYERS; i++) { // for every player
        if(IsPlayerConnected(i) && (i != playerid) && IsPlayerStreamedIn(playerid,i)) {
            fPlayerToPlayerDist = GetPlayerDistanceFromPoint(i, fPlayerX, fPlayerY, fPlayerZ);
        if(fPlayerToPlayerDist < dist) { // receiving player is within the specified distance
          PlayerMessage(i, color, message);
        }
      }
    }
  }
}


stock GetClosestCar(playerid, exception = INVALID_VEHICLE_ID) 
{

    new
    Float: Distance,
    target = -1,
    Float: vPos[3];

  if(!IsPlayerInAnyVehicle(playerid)) GetPlayerPos(playerid, vPos[0], vPos[1], vPos[2]);
  else GetVehiclePos(GetPlayerVehicleID(playerid), vPos[0], vPos[1], vPos[2]);

    for(new v; v < MAX_VEHICLES; v++) if(GetVehicleModel(v) >= 400) {
        if(v != exception && (target < 0 || Distance > GetDistanceToCar(playerid, v, vPos[0], vPos[1], vPos[2]))) {
            target = v;
            Distance = GetDistanceToCar(playerid, v, vPos[0], vPos[1], vPos[2]); // Before the rewrite, we'd be running GetPlayerPos 2000 times...
        }
    }
    return target;
}

stock SendClientMessageEx(playerid, color, const text[], {Float, _}:...)
{
  static
      args,
      str[144];

  /*
     *  Custom function that uses #emit to format variables into a string.
     *  This code is very fragile; touching any code here will cause crashing!
  */
  if ((args = numargs()) == 3)
  {
      SendClientMessage(playerid, color, text);
  }
  else
  {
    while (--args >= 3)
    {
      #emit LCTRL 5
      #emit LOAD.alt args
      #emit SHL.C.alt 2
      #emit ADD.C 12
      #emit ADD
      #emit LOAD.I
      #emit PUSH.pri
    }
    #emit PUSH.S text
    #emit PUSH.C 144
    #emit PUSH.C str
    #emit PUSH.S 8
    #emit SYSREQ.C format
    #emit LCTRL 5
    #emit SCTRL 4

    SendClientMessage(playerid, color, str);

    #emit RETN
  }
  return 1;
}




//forward UpdateServer(playerid);
public UpdateServer(playerid)
{
      new vehicleid = GetPVarInt(playerid,"BlinkVehID"), panels, doors, lights, tires;
      if(g_vehicle_params[vehicleid][V_BLINK] == true)
      {
            GetVehicleDamageStatus(vehicleid, panels, doors, lights, tires);
            
            if(g_vehicle_params[vehicleid][V_BLINKING] == 1)
            {
              UpdateVehicleDamageStatus(vehicleid, 0, doors, 1, tires);
              g_vehicle_params[vehicleid][V_BLINKING] = 69;
            }
            else if(g_vehicle_params[vehicleid][V_BLINKING] == 69)
            {
              UpdateVehicleDamageStatus(vehicleid, 0, doors, 69, tires);
              g_vehicle_params[vehicleid][V_BLINKING] = 0;
            }
            else if(g_vehicle_params[vehicleid][V_BLINKING] == 0)
            {
              UpdateVehicleDamageStatus(vehicleid, 0, doors, 1, tires);
              g_vehicle_params[vehicleid][V_BLINKING] = 4;
            }
            else
            {
              UpdateVehicleDamageStatus(vehicleid, 0, doors, 4, tires);
              g_vehicle_params[vehicleid][V_BLINKING] = 1;
            }
        

      }

}


public OnPlayerConnect(playerid)
{ 
        RemoveOldAuctionMartBuilding(playerid); // mapping
        RemoveIdlewoodBuilding(playerid); //mapping
        if(IsPlayerNPC(playerid)) return 1; 

          pInfo[playerid][pSeconds] = 0;
                  pInfo[playerid][pMinutes] = 0;
                  pInfo[playerid][pHours] = 0;

        SetTimerEx("UpdateServer", 100, true, "i", playerid);
        SetTimerEx("ChangeServerEverySecond", 1000, true, "i", playerid);
        SetTimerEx("GantiWarna",  5000, true, "i", playerid);


}


CMD:blinklights(playerid, params[])
{
	new vehicleid =  GetClosestCar(playerid, INVALID_VEHICLE_ID);
	new string[128];
	SetPVarInt(playerid, "BlinkVehID", vehicleid);
	if(g_vehicle_params[vehicleid][V_BLINK] == true)
	{
		g_vehicle_params[vehicleid][V_BLINK]=false;
		format(string, sizeof(string), "* %s push to button and turn OFF vehicle lights in blinking mode.", GetRPName(playerid));
    	LocalMessage(ACTION_DISTANCE, playerid, ACTION_COLOR, string);
    	format(string, 50, "~w~Turn off...", AttachWorm[playerid]);
    	GameTextForPlayer(playerid, string, 800, 1);
	}
	else
	{
		g_vehicle_params[vehicleid][V_BLINK]=true;
		format(string, sizeof(string), "* %s push ON button in dasbord vehicle lights in blinking mode.", GetRPName(playerid));
    	LocalMessage(ACTION_DISTANCE, playerid, ACTION_COLOR, string);
		format(string, 50, "~w~Turn on...", AttachWorm[playerid]);
    	GameTextForPlayer(playerid, string, 800, 1);
	}

	return 1;

	

    
    
    
}

