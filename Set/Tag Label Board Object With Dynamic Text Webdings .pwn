
CMD:taglabel(playerid, params[])
{
	if(!IsValidDynamicObject(TagLabel[playerid]))
	{
		new Float:pos[3];
		GetPlayerPos(playerid, pos[0], pos[1], pos[2]);

		new Float: angle;
		GetPlayerFacingAngle(playerid, angle);

		//object = CreateObject(model,pos[0], pos[1], pos[2], 0, 0, angle);
		// id cadangan lain adalah spray tag 18659
		// modelid label transparan 2659 tapi cadangan sedang 19366 
		TagLabel[playerid] = CreateDynamicObject(18659, pos[0], pos[1]+4.0, pos[2], 0.000000, 0.000000, angle); 
		SetDynamicObjectMaterialText(TagLabel[playerid], 0, params, 130, "Webdings", 80, 1, 0xFFFFFFFF, 0x00000000, 1);
		EditDynamicObject(playerid, TagLabel[playerid]);
		SendClientMessage(playerid,0xFF0000FF,"[TAG_LABEL]: Sir please use and hold "COL_YELLOW"'SPACE'"COL_WHITE" to move the camera angle.");
		return 1;
	}
	else return cmd_tagremove(playerid);

}


CMD:tagremove(playerid)
{
	if(IsValidDynamicObject(TagLabel[playerid]))
	{
		DestroyDynamicObject(TagLabel[playerid]);
		SendClientMessage(playerid,0xFF0000FF,"[TAG_LABEL]: Sir congratulation the old label have removed.");
		return 1;
	}
	
}

