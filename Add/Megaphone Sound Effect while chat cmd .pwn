#define DIALOG_MEGAPHONE_MENU           (10201)
//megaphone
new MegaphoneSounds[][] =
{
        // SPLIT COMMA
        // SOUND ID , DESCRIPTION
        {"9605,Give up. You're surrounded!"},
        {"9612,We know you're in there!"},
        {"10200,Hey you! Police. Stop!"},
        {"15800,This is the Los Santos Police Department; Stay where you are!"},
        {"15801,Freeze! Or we will open fire"},
        {"15802,Go! Go! Go!"},
        {"34402,Police! Don't move!"},
        {"34403,Get outta the car with your hands in the air!"},
        {"15825,LSPD. Stop right... are you insane? You'll kill us all!"}
};
//====================================//


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
	if(dialogid == DIALOG_MEGAPHONE_MENU)
        {
                if(!response) return SCM(playerid, COLOR_WHITE, "Cancel");
                new soundid, tw1 = 0;
        for(new w1 = 0; w1 < sizeof(MegaphoneSounds); w1++)
        {
            if(tw1 != listitem)
            {
                tw1++;
                continue;
            }
            new tmp1[2][128];
            split(MegaphoneSounds[w1], tmp1, ',');
            soundid = strval(tmp1[0]);
            break;
        }
        new Float:pos[4];
        GetPlayerPos(playerid, pos[0], pos[1], pos[2]);
        PlaySoundEx(soundid, pos[0], pos[1], pos[2], 15);
        return 1;
        }

}


CMD:megaphone(playerid, params[])
{
        if(GetPlayerTeamEx(playerid) != TEAM_LSPD && GetPlayerTeamEx(playerid) != TEAM_LVPD && GetPlayerTeamEx(playerid) != TEAM_ARMY && GetPlayerTeamEx(playerid) != TEAM_FBI) return SendClientMessage(playerid, 0xCECECEFF, "Anda bukan petugas penegak hukum");

        if(!sscanf(params, "s[250]", params))
        {
                format(Message, sizeof(Message), "*MEGAPHONE* %s", params);
                ProxDetectors(15.0, playerid, Message, COLOR_RED);
                return 1;
        }

        new str1[2500], c1 = 0;
    for(new w1 = 0; w1 < sizeof(MegaphoneSounds); w1++)
    {
        new tmp1[2][128];
        split(MegaphoneSounds[w1], tmp1, ',');
        if(c1 == 0) format(str1, sizeof(str1), "{FFFFFF}%s\n", tmp1[1]);
        if(c1 > 0) format(str1, sizeof(str1), "%s{FFFFFF}%s\n", str1, tmp1[1]);
        c1++;
    }
        ShowPlayerDialog(playerid, DIALOG_MEGAPHONE_MENU, DIALOG_STYLE_LIST, "Megaphone Menu", str1, "Play", "Cancel");
        return 1;
}
