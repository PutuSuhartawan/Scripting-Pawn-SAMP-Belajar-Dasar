
public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	while(strfind(inputtext, "%", true) != -1)
		strdel(inputtext, strfind(inputtext,"%",true), strfind(inputtext,"%",true) + 1);

	while(strfind(inputtext, "%s", true) != -1)
		strdel(inputtext, strfind(inputtext,"%s",true), strfind(inputtext,"%s",true) + 2);

	CheckPlayerFlood(playerid, true, MAX_FLOOD_RATE, 500, FLOOD_RATE_KICK);

	new last_dialog = GetPlayerData(playerid, P_LAST_DIALOG);
	SetPlayerData(playerid, P_LAST_DIALOG, INVALID_DIALOG_ID);

	new list_id;
	if(dialogid == DIALOG_MP3)
if(last_dialog == dialogid)
	{
		switch(dialogid)
		{

// -----------------------------------------------------------------
			case DIALOG_TELEPORT_LIST:
			{
				if(response)
				{
					if(0 <= list_id-1 <= sizeof g_teleport_list - 1)
					{
						SetPlayerPosEx
						(
							playerid,
							GetTeleportListData(list_id-1, TL_POS_X),
							GetTeleportListData(list_id-1, TL_POS_Y),
							GetTeleportListData(list_id-1, TL_POS_Z),
							0.0, 0, 0
						);
					}
				}
			}
  }    

stock ShowTeleportList(playerid)
{
	new list_text[34 * (sizeof g_teleport_list)];
	new dest[36];

	for(new i; i < sizeof g_teleport_list; i ++)
	{
		format(dest, sizeof dest, "%s\n", GetTeleportListData(i, TL_NAME));
		strcat(list_text, dest);
	}

	Dialog(playerid, DIALOG_TELEPORT_LIST, DIALOG_STYLE_LIST, "Teleportasi", list_text, "Pilih", "Keluar");
	return 1;
}
