
forward Delay_Kick(playerid);
public Delay_Kick(playerid)
{
    Kick(playerid);
    return 1;
}


public OnPlayerConnect(playerid)
{
  GetPlayerName(playerid, pInfo[playerid][Nick], 24);
    new player[200];
    //format(player,sizeof(player),"Whitelist/%s.txt",pInfo[playerid][Nick]);
    //if(!dini_Exists(player))
    new GetDataFromPlayerConnect[500];
	  format(GetDataFromPlayerConnect, 500, "SELECT * FROM `whitelist` WHERE `username` = '%s' LIMIT 1", pInfo[playerid][Nick]); // now here check the database if the player has given the proper password.HTTP
		n_mysql_query(MySQL:g_Sql, GetDataFromPlayerConnect, bool:true);
    //if(!strcmp(pInfo[playerid][Nick], "off", true) == 0)
    new rows = cache_num_rows();
    if (!rows)
    {
	    ShowPlayerDialog(playerid, DIALOG_WHITELIST, DIALOG_STYLE_MSGBOX, "Whitelist Panel Warning", "Sir, This name not in list for the Whitelist system\nPlease contact the hight administrator first.\nOr try to request whitelist with another system", "SUMBIT", "");
      //SetTimerEx("Delay_Kick", 50, false, "i", playerid);
    }
    else
    {
        SendClientMessage(playerid,COLOR_RED,"[INFO] : {FFFFFF}Sir thank you, this name just in whitelist.");
    }
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
  new message[526+1];
  new string[140];
  new Float:pos[2];
  
  if(dialogid == DIALOG_WHITELIST)
  {
    new player[200], string[128];
    //format(player,sizeof(player),"Whitelist/%s.txt",inputtext);
    new GetDataFromPlayerConnect[500];
	  format(GetDataFromPlayerConnect, 500, "SELECT * FROM `whitelist` WHERE `username` = '%s' LIMIT 1", inputtext); // now here check the database if the player has given the proper name in whitelist
		n_mysql_query(MySQL:g_Sql, GetDataFromPlayerConnect, bool:true);

      if(response == 1)
      {
                  new rows = cache_num_rows();
                  if (!rows)
                  {
                      format(string,sizeof(string),"{00FFFF}%s{FFFFFF} succes to full request join whitelist.", inputtext);
                      SendClientMessage(playerid,COLOR_WHITE,string);
                      //dini_Create(player);

                      new str[600];

                      //if(_:WhitelistInfo == 0)
                      //WhitelistInfo = DCC_FindChannelById("111111111);//masukkan ic channel discord kalian

                      format(str,sizeof str,":unlock:***Nickname: ``%s`` has succesfull joining to whitelist!***",inputtext);
                      //DCC_SendChannelMessage(WhitelistInfo,str);
              
                      ShowPlayerDialog(playerid,DIALOG_WHITELIST,DIALOG_STYLE_INPUT,"{00FFFF}Whitelist","{FF0000}Please input name on the character to get Whitelist.","Continue","Cancel");
                  }
                  else
                  {
                      format(string,sizeof(string),"{00FFFF}%s{FFFFFF} name just has exist at whitelist! Please use different name again sir.", inputtext);
                      SendClientMessage(playerid,COLOR_WHITE,string);
                      ShowPlayerDialog(playerid,DIALOG_WHITELIST,DIALOG_STYLE_INPUT,"{00FFFF}Whitelist","{FF0000}Please input new name to Whitelist sir.\n* Unknown player!","Continue","Cancel");
                  }
      }
  }


}

// sample

CMD:whitelistdialog(playerid)
{
		ShowPlayerDialog(playerid, DIALOG_WHITELIST, DIALOG_STYLE_MSGBOX, "Whitelist Panel Warning", "Sir, This name not in list for the Whitelist system\nPlease contact the hight administrator first.\nOr try to request whitelist with another system", "SUMBIT", "");
      
		return 1;
}

