
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


public OnPlayerConnect(playerid)
{
        //ConnectMySQL();
    GetPlayerName(playerid, pInfo[playerid][Nick], 24);
    //gets the player's name and stores it to to your enum pInfo[playerid][Nick]
    GetPlayerIp(playerid, pInfo[playerid][IP], 16); //Gets the IP of the player and stores it to pInfo[playerid][IP]
    // mysql_log( ERROR | WARNING ); // we query the statement above
    // mysql_escape_string(pInfo[playerid][Nick], pInfo[playerid][Nick]); 
    //fopen("logs/pay.log", io_write);


    //mysql_connect_file("mysql.ini");// now we have to escape the name inorder to escape any mysql injections. ([url]http://en.wikipedia.org/wiki/SQL_injection[/url])
    //format(Query, 500, "SELECT `nick` FROM `playerdata` WHERE `nick` COLLATE latin1_general_cs = '%s' LIMIT 1", pInfo[playerid][Nick]); // here we are selecting the name of the player who logged in from the database.
    //mysql_query(g_Sql, Query, true);


    new GetDataFromPlayerConnect[500];
    format(GetDataFromPlayerConnect, 500, "SELECT * FROM `playerdata` WHERE `nick` COLLATE latin1_general_cs = '%s' LIMIT 1", pInfo[playerid][Nick]); // now here check the database if the player has given the proper password.HTTP
    //mysql_query(MySQL:handle, const query[], bool:use_cache = true)
    mysql_query(MySQL:g_Sql, GetDataFromPlayerConnect, bool:true);

    //new datapw[250];
    //format(datapw, sizeof(datapw), "SELECT * FROM `playerdata` WHERE `nick` COLLATE latin1_general_cs = '%s' LIMIT 1", pInfo[playerid][Nick]);
    //mysql_query(g_Sql, datapw);


    cache_get_value_int(0, "id", pInfo[playerid][ID]); 
    cache_get_value_name(0, "password", pInfo[playerid][PasswordAccount], 50);
    cache_get_value_name(0, "UCP", pInfo[playerid][UCP], 20);
    cache_get_value_int(0, "JobMechanic", pInfo[playerid][pJobMechanic]);
    cache_get_value_int(0, "skin", pInfo[playerid][pSkin]);
    cache_get_value_int(0, "component", pInfo[playerid][pComponent]);
    cache_get_value_name_float(0, "ppx", Float:pInfo[playerid][pPx]); 
    cache_get_value_name_float(0, "ppy", Float:pInfo[playerid][pPy]);
    cache_get_value_name_float(0, "ppz", Float:pInfo[playerid][pPz]);
    cache_get_value_name_float(0, "pmx", Float:pInfo[playerid][pMx]); 
    cache_get_value_name_float(0, "pmy", Float:pInfo[playerid][pMy]);
    cache_get_value_name_float(0, "pmz", Float:pInfo[playerid][pMz]);
    cache_get_value_name_float(0, "healthm1", Float:pInfo[playerid][pHealtM1]);
    cache_get_value_int(0, "tipemobil", pInfo[playerid][pTipeMobil]);


    printf("Vehicle ID %d has loaded while user %s connected", pInfo[playerid][pTipeMobil], pInfo[playerid][Nick]);

    new inputtext[600];
    new yangdiinput[600];
     format(yangdiinput, 600, "Anda %s selaku kode %i mengetik password "COL_RED" %s padahal password anda %s ", pInfo[playerid][Nick], pInfo[playerid][ID], inputtext, pInfo[playerid][PasswordAccount]);
    SendClientMessage(playerid, COLOR_SPRINGGREEN, yangdiinput); 
    //cache_get_result_count(); // next we store the result inorder for it to be used further ahead.

    ///*

    TextDrawShowForPlayer(playerid, Text:TeksSaatLogin);
    // bagian dimana player diminta login passsowrd


    new  country[MAX_PLAYERS], city[MAX_PLAYERS];
    GetPlayerCountry(playerid, country, MAX_PLAYER_NAME);
    GetPlayerCity(playerid, city, MAX_PLAYER_NAME);

      foreach(new ii : Player)
            {
                    if(pInfo[ii][Logged] == 0)
                    {
                      //if(pInfo[ii][TogLoginNotif] == true)
                      SendClientMessageEx(ii, COLOR_RED, "[SERVER]"COL_YELLOW" %s(%d) has joined to the server.(%s, %s)", pInfo[playerid][Nick], playerid, city, country);
                      
                      //return 1;
                    }
            }

}


public OnPlayerDisconnect(playerid, reason)
{
  
     pInfo[playerid][Logged] = 0;
      
      new Float:x, Float:y, Float:z;
      GetPlayerPos(playerid, x, y, z);
      
      foreach(new ii : Player)
      {
        if(IsPlayerInRangeOfPoint(ii, 40.0, x, y, z))
        {
          //if(pInfo[ii][TogLoginNotif] == true)
          {
                        switch(reason)
                       {
                        case 0:
                        {

                          SendClientMessageEx(ii, COLOR_RED, "[SERVER]"COL_YELLOW" %s(%d) has leave from the server.(timeout/crash)", pInfo[playerid][Nick], playerid);
                        }
                        case 1:
                        {
                          SendClientMessageEx(ii, COLOR_RED, "[SERVER]"COL_YELLOW" %s(%d) has leave from the server.(leaving)", pInfo[playerid][Nick], playerid);
                        }
                        case 2:
                        {
                          SendClientMessageEx(ii, COLOR_RED, "[SERVER]"COL_YELLOW" %s(%d) has leave from the server.(kicked/banned)", pInfo[playerid][Nick], playerid);
                        }
                      }

          }
         
        }
      }

}
