public OnPlayerSelectObject(playerid, type, objectid, modelid, Float:fX, Float:fY, Float:fZ)
{
    new message[526+1];

    if(type == SELECT_OBJECT_GLOBAL_OBJECT) {
        if(!IsValidObject(objectid)) return 0;
        format(message,sizeof(message),"[Global Object] Sir you have select line in server: %d, modelobjectID : %d, Pos: %.4f,%.4f,%.4f", objectid, modelid, fX, fY, fZ);
        SendClientMessage(playerid, 0xFFFFFFFF, message);
        EditObject(playerid, objectid);
        return 1;
}

if(type == SELECT_OBJECT_PLAYER_OBJECT) {
    OnPlayerSelectDynamicObject(playerid, objectid, modelid, Float:fX, Float:fY, Float:fZ);
      // if(!IsValidPlayerObject(playerid, objectid)) return 0;
        format(message,sizeof(message),"[Player Select player Object] Anda memilih baris proggram : %d modelID nya adalah: %dPos: %.4f,%.4f,%.4f", objectid, modelid, fX, fY, fZ);
        SendClientMessage(playerid, 0xFFFFFFFF, message);
        EditPlayerObject(playerid, objectid);
        //EditDynamicObject(playerid, objectid);
        SEM(playerid, "Dynamic edit after select non dynamic");
        return 1;
  }

    if(type == STREAMER_OBJECT_TYPE_GLOBAL)
    {
      SEM(playerid, "Dynamic object type global");
      Streamer_Update(playerid, -1);
      EditDynamicObject(playerid, objectid);
      return 1;
    }
}
