stock ProxDetector(Float:radi, playerid, string[], color)
{
	new Float:x, Float:y, Float:z;
	GetPlayerPos(playerid, x,y,z);
	foreach(Player, i)
	{
	    if(IsPlayerInRangeOfPoint(i,radi,x,y,z))
	    {
	        SendClientMessage(i,color,string);
	        SetPlayerChatBubble(i, "**Mendengar keluhan anda**", 0xFF5533FF, 10.5, 2000);
	    }
	}
}


public OnPlayerSpawn(playerid)
{
    SetPlayerChatBubble(playerid, "**Datang mengunjungi anda**", 0xFF5533FF, 10.5, 5000);
    SetCameraBehindPlayer(playerid);
}


public OnPlayerDeath(playerid, killerid, reason)
{
    SetPlayerChatBubble(playerid, "**Pingsan**", 0xFF5533FF, 10.5, 2000);
    SetPlayerChatBubble(killerid, "**Ngebunuh orang di depannya**", 0xFF5533FF, 10.5, 2000);
    DisablePlayerCheckpoint(playerid);
	kerja[playerid] = 0;

}

