forward UpdatePlayerTimePlayed(playerid);
public UpdatePlayerTimePlayed(playerid)
// dont do ptask UpdatePlayerTimePlayed[1000](playerid) array cant be on the functiong name
{


          
          pInfo[playerid][pSeconds]++;
          if(pInfo[playerid][pSeconds] > 60)
          {
            pInfo[playerid][pSeconds] = 0;
            return pInfo[playerid][pMinutes]++;
            SendClientMessage(playerid, 0xFFFF00FF, "debug minute");
          }
          if(pInfo[playerid][pMinutes] > 60)
          {
            pInfo[playerid][pMinutes] = 0;
            return pInfo[playerid][pHours]++;
           
          }
            
      
}
