
public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    new NPCID = GetPlayerIDFromName("NPC");
    new wid = GetPlayerWeapon(playerid);
    new Float:x,Float:y,Float:z;
    GetPlayerPos(NPCID,x,y,z);
    if(IsPlayerInRangeOfPoint(playerid,15,x,y,z))
    {
        if(PRESSED(KEY_FIRE))
        {
            if(wid > 10)
            {
                if(IsPlayerFacingPlayer(playerid,NPCID,10) == 1) //Self explanitory
                {
                }
                else if(IsPlayerFacingPlayer(playerid,NPCID,10) == 0)//Self explanitory
                {
                }
            }
        }
        if(PRESSED(KEY_HANDBRAKE))
        {
            if(wid > 10)
            {
                if(IsPlayerFacingPlayer(playerid,NPCID,10) == 1)//Self explanitory
                {
                }
                else if(IsPlayerFacingPlayer(playerid,NPCID,10) == 0)//Self explanitory
                {
                }
            }
        }
    }
    return 1;
}

Now we're going to add the reactions to the aiming and shooting:
Code:
public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    new NPCID = GetPlayerIDFromName("NPC");
    new wid = GetPlayerWeapon(playerid);
    new Float:x,Float:y,Float:z;
    GetPlayerPos(NPCID,x,y,z);
	if(IsPlayerInRangeOfPoint(playerid,15,x,y,z))
	{
		if(PRESSED(KEY_FIRE))
		{
			if(wid > 10)
			{
				if(IsPlayerFacingPlayer(playerid,NPCID,10) == 1)
				{
				 	ApplyAnimation(NPCID,"CRACK","crckdeth4",3.0,0,0,0,1,0);
					SetPlayerChatBubble(NPCID,"Ouch!",0xFFFFFFAA,50,5000);
				}
				else if(IsPlayerFacingPlayer(playerid,NPCID,10) == 0)
				{
				 	SetPlayerChatBubble(NPCID,"Don't Shoot near me!",0xFFFFFFAA,50,5000);
				}
			}
		}
		if(PRESSED(KEY_HANDBRAKE))
		{
			if(wid > 10)
			{
				if(IsPlayerFacingPlayer(playerid,NPCID,10) == 1)
				{
				 	ApplyAnimation(NPCID,"ped","handsup",3.0,0,0,0,1,0);
					SetPlayerChatBubble(NPCID,"Please Don't Shoot me!",0xFFFFFFAA,50,5000);
				}
				else if(IsPlayerFacingPlayer(playerid,NPCID,10) == 0)
				{
				 	SetPlayerChatBubble(NPCID,"Watch where you are aiming that gun!",0xFFFFFFAA,50,5000);
				}
			}
		}
	}
	return 1;
}
