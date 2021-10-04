
stock LevelUpdate(playerid) return SetPlayerScore(playerid, PlayerInfo[playerid][pLevel]);
epublic: HealUnFr(playerid) return RemovePlayerAttachedObject(playerid,1);
epublic: ClearAnim(playerid) return ApplyAnimation(playerid, "CARRY", "crry_prtial",4.0,0,0,0,0,0,1);


stock ProxDetector(Float: radi, playerid, string[], col1, col2, col3, col4, col5)
{
    new Float: ProxX, Float: ProxY, Float: ProxZ;
    GetPlayerPos(playerid, ProxX, ProxY, ProxZ);

	new world = GetPlayerVirtualWorld(playerid);

	foreach(new i : Player)
    {
        if(GetPlayerVirtualWorld(i) != world) continue;

        new Float: r = GetPlayerDistanceFromPoint(i, ProxX, ProxY, ProxZ);
        if(r < radi/16) SendClientMessage(i, col1, string);
        else if(r < radi / 8) SendClientMessage(i, col2, string);
        else if(r < radi / 4) SendClientMessage(i, col3, string);
        else if(r < radi / 2) SendClientMessage(i, col4, string);
        else if(r < radi) SendClientMessage(i, col5, string);

		if(admin_global_chat[i] != 0) Send(i, col1, string);
    }
    return 1;
}
stock ProxDetectorS(Float:radi, playerid, targetid)
{
	if(IsPlayerConnected(playerid)&&IsPlayerConnected(targetid))
	{
		new Float:posx, Float:posy, Float:posz, Float:oldposx, Float:oldposy, Float:oldposz, Float:tempposx, Float:tempposy, Float:tempposz;

		GetPlayerPos(playerid, oldposx, oldposy, oldposz);
		GetPlayerPos(targetid, posx, posy, posz);
		tempposx = (oldposx -posx);
		tempposy = (oldposy -posy);
		tempposz = (oldposz -posz);
		if (((tempposx < radi) && (tempposx > -radi)) && ((tempposy < radi) && (tempposy > -radi)) && ((tempposz < radi) && (tempposz > -radi))) return true;
	}
	return false;
}
stock ProxDetectorBot(Float:radi, actorid, string[],col1,col2,col3,col4,col5)
{
	if(actorid == 0) return 1;
	if(ActorInfo[actorid][aAntiFlood] > 0) return 1;

    new Float: Pos[3], Float: Radius;
    GetActorPos(ActorInfo[actorid][aID], Pos[0], Pos[1], Pos[2]);
    foreach(new i : Player)
    {
        if(GetActorVirtualWorld(ActorInfo[actorid][aID]) != GetPlayerVirtualWorld(i)) continue;

	    ApplyActorAnimation(ActorInfo[actorid][aID], "PED", "IDLE_CHAT",4.1,0,1,1,1,1);
        Radius = GetPlayerDistanceFromPoint(i, Pos[0], Pos[1], Pos[2]);

        if (Radius < radi / 16) SCMF(i, col1, "%s: %s", ActorInfo[actorid][aName], string);
        else if(Radius < radi / 8) SCMF(i, col2, "%s: %s", ActorInfo[actorid][aName], string);
        else if(Radius < radi / 4) SCMF(i, col3, "%s: %s", ActorInfo[actorid][aName], string);
        else if(Radius < radi / 2) SCMF(i, col4, "%s: %s", ActorInfo[actorid][aName], string);
        else if(Radius < radi) SCMF(i, col5, "%s: %s", ActorInfo[actorid][aName], string);
        ActorInfo[actorid][aAntiFlood] = 5;
    }
    return 1;
}



public OnPlayerText(playerid, text[])
{
	// fillter anti sedih IC
	/*
	if(strcmp(text, "bagi duit", true) == 0 || strcmp(text, " dewa ", true) == 0 || strcmp(text, " lvl ", true) == 0 || strcmp(text, "duit", true) == 0 )
	{
	    PlayerInfo[playerid][pSatiety] -= 40;
    	OnPlayerUpdateAccountsPer(playerid, "pSatiety", PlayerInfo[playerid][pSatiety]);
	}
	*/
    if(PlayerInfo[playerid][pLogin] == 0) return 0;
    if(GetPVarInt(playerid,"AntiSbiv") > gettime()) return false;
    if(Injured[playerid] == 1) {
	// system injured tidak bicara lagi
		SendClientMessage(playerid, COLOR_GREY, "Karakter anda dalam kondisi terluka, mohon sabar hingga roleplay sembuh kembali.");
		return 0;
	}
    if(player_gag[playerid]) return SCM(playerid, COLOR_GREY, "Anda telah di mute admin, Anda tidak bisa bicara.") & 0;

    CheckPlayerFlood(playerid, true, MAX_FLOOD_RATE, FLOOD_RATE_INC, FLOOD_RATE_KICK);
    if(GetPlayerAntiFloodData(playerid, AF_RATE) >= MAX_FLOOD_RATE)
	{
		SendClientMessage(playerid, 0x6B6B6BFF, "Jangan sampai banjir spam, anda saya peringatkan untuk stabilkan diri dan koneksi internet.");

		if(GetPlayerAntiFloodData(playerid, AF_RATE) >= MAX_FLOOD_RATE + 500)
			SendClientMessage(playerid, 0x6B6B6BFF, "Harap tunggu beberapa detik...");

		return 0;
	}
	if(strlen(text) > 90) return 0;
    if(PlayerInfo[playerid][pMuted] > 0)
	{
	    SetPlayerChatBubble(playerid,"Terdeteksi Flood",COLOR_PURPLE,15.0,10000);
 		PlayerMuted(playerid), SetPVarInt(playerid,"AntiFlood",gettime() + 1);
 		return 0;
 	}

	/*
	if(strcmp(text, ")", true) == 0 || strcmp(text, ")0", true) == 0 || strcmp(text, " lvl ", true) == 0 || strcmp(text, " ic ", true) == 0 || strcmp(text, " ooc ", true) == 0 || strcmp(text, " dewa ", true) == 0 || strcmp(text, " mix ", true) == 0 || strcmp(text, " level ", true) == 0){ format(String, 48, "%s tersenyum", Name(playerid)), ProxDetector(15.0, playerid, String, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE), SetPlayerChatBubble(playerid, "tersenyum",COLOR_PURPLE,15.0,10000); return 0; }
	else if(strcmp(text, "))", true) == 0 || strcmp(text, ")))", true) == 0){ format(String, 48, "%s tertawa", Name(playerid)), ProxDetector(15.0, playerid, String, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE), SetPlayerChatBubble(playerid, "tertawa",COLOR_PURPLE,15.0,10000); return 0; }
 	else if(strcmp(text, "(", true) == 0 || strcmp(text, "(9", true) == 0){ format(String, 48, "%s kesal", Name(playerid)), ProxDetector(15.0, playerid, String, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE), SetPlayerChatBubble(playerid, "kesal",COLOR_PURPLE,15.0,10000); return 0; }
 	else if(strcmp(text, "((", true) == 0 || strcmp(text, "(((", true) == 0 || strcmp(text, "lvl", true) == 0 || strcmp(text, "duit", true) == 0){ format(String, 48, "%s sangat kesal", Name(playerid)), ProxDetector(15.0, playerid, String, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE), SetPlayerChatBubble(playerid, "sangat kesal",COLOR_PURPLE,15.0,10000); return 0; }
	else if(strcmp(text, "gay", true) == 0 || strcmp(text, "bodoh", true) == 0 || strcmp(text, "perempuan jalang", true) == 0 || strcmp(text, "homo", true) == 0 || strcmp(text, "bawah", true) == 0 || strcmp(text, "mda", true) == 0){ ApplyAnimation(playerid, "MISC", "plyr_shkhead",4.0,0,0,0,0,0,1); return 0; }
	*/
	
    if(IsAGang(playerid))
	{
	    if(strcmp(text, "rob ", true) == 0 || strcmp(text, "ngerob", true) == 0  )
	    {
	        // dialog gangstar mulai chat jahat
	        PlayerInfo[playerid][pDrugs] += 100;
            SPD(playerid,0,DIALOG_STYLE_MSGBOX,"{E5D81E}Info Black Market","Jual narkoboy juga mainan ke black market sekitar segera! \n ini bakal untung besar boy!((/help))", "Tutup", "");

			OnPlayerUpdateAccountsPer(playerid, "pDrugs", PlayerInfo[playerid][pDrugs]);
	    }
		        
    }


 	if(CheckIP(text))
	{
		PlayerInfo[playerid][pMuted] = 600;
		Send(playerid, COLOR_LIGHTRED, "Anda menerima larangan ngobrol tentang iklan yang dicurigai.");
		format(format_string, sizeof(format_string), "[A] %s[%d] || Iklan yang Dicurigai: [ %s ]", Name(playerid), playerid, text);
		return SendAdminMessage(COLOR_LIGHTRED, format_string) & 0;
	}

	if(player_news_live[playerid])
	{
		if(PlayerInfo[playerid][pMember] == FRACTION_NEWS) format(format_string, 188, "< San News > %s[%i]: %s", GetPlayerNameEx(playerid),playerid, text);
		else format(format_string, 188, "< San News > Tamu %s[%i]: %s", GN(playerid), playerid, text);
		return SendClientMessageToAll(0x0073b7AA, format_string) & 0;
	}

    if(Mobile[playerid] != -1)
	{
		if(IsPlayerConnected(Mobile[playerid]) && Mobile[Mobile[playerid]] == playerid)
			SCMF(Mobile[playerid], COLOR_YELLOW, "[Nomor telepon] %s[%d]: %s", Name(playerid), playerid, text);

        ProxDetector(10.0,playerid,text,COLOR_FADE1,COLOR_FADE2,COLOR_FADE3,COLOR_FADE4,COLOR_FADE5);

		return false;
	}
    if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT && GetPVarInt(playerid, "fTazzer") == 0)
	{
 		new animation = random(4);
		switch(animation)
		{
			case 0: ApplyAnimation(playerid, "GHANDS", "GSIGN5",4.1,0,1,1,1,1,1);
			case 1: ApplyAnimation(playerid, "GHANDS", "GSIGN4",4.1,0,1,1,1,1,1);
			case 2: ApplyAnimation(playerid, "GHANDS", "GSIGN1",4.1,0,1,1,1,1,1);
			case 3: ApplyAnimation(playerid, "PED", "IDLE_CHAT",4.1,0,1,1,1,1,1);
		}
		SetTimerEx("ClearAnim", 100*strlen(text), false, "d", playerid);
	}
	
	

	SetPlayerChatBubble(playerid, text, 0xAAFFFFFF, 18.0, 5000);

	format(format_string, 188, "%s(%d) says: %s.", Name(playerid), playerid,text) ;
    ProxDetector(20.0, playerid, format_string, COLOR_RAZGOVOR1,COLOR_RAZGOVOR2,COLOR_RAZGOVOR3,COLOR_RAZGOVOR4,COLOR_RAZGOVOR5);

    // autor rp saat chatting
	new merp[125], dorp[125], playername[MAX_PLAYER_NAME +1];
	GetPlayerName(playerid, playername, sizeof(playername));

	/*
	switch(random(5))
	{
	   		case 0: format(dorp, sizeof(dorp), "Nampak percakapan di mulai dengan tenang.(%s))", playername);
			case 1: format(merp, sizeof(merp), "%s mengambil masker di sakunya lalu melihat sekitar.", playername); //format(dorp, sizeof(dorp), "Terdengar suara bersin dari kejauhan((%s))", playername);
			case 2: format(merp, sizeof(merp), "%s mengusap rambutnya dan mulai berfikir.", playername);
			case 3: format(merp, sizeof(merp), "%s tertarik dengan pembicaraan saat ini.", playername);
			case 4: format(merp, sizeof(merp), "%s batuk berdahak dan menutupnya dengan tangan dengan sedikit malu di wajah.", playername); //format(dorp, sizeof(dorp), "Terdengar batuk kering((%s))", playername);
	}
    // rp saat ngobrol..
   	ProxDetector(30.0, playerid, merp, COLOR_PURPLE);
 	ProxDetector(30.0, playerid, dorp, COLOR_PURPLE);
	//
	*/
	return 0;
}


alias:megaphone("m");
CMD:megaphone(playerid,params[])
{
    if(!IsACop(playerid) && !IsAArmy(playerid)) return SCM(playerid, COLOR_GREY, "Anda tidak dapat menggunakan perintah ini.");
    if(PlayerInfo[playerid][pMuted] > 0) return PlayerMuted(playerid);
    if(sscanf(params, "s[128]",params[0])) return Send(playerid, -1, "Masuk: (/m)egaphone [teks]");
    if(player_gos_time[playerid] > 0) return Send(playerid, COLOR_GREY, "Anda tidak dapat menulis ke megafon lebih dari sekali setiap 5 detik!");

    new vehicleid = GetPlayerVehicleID(playerid);

	if(VehInfo[vehicleid][vFr] != PlayerInfo[playerid][pMember]) return Send(playerid,COLOR_GREY,"Anda harus berada di dalam mobil patroli!");
	format(String, 188, "[Megafon] %s %s[%d]: %s", FracRank[PlayerInfo[playerid][pMember]][PlayerInfo[playerid][pRank]], Name(playerid), playerid, params[0]);
	ProxDetector(80.0, playerid, String,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);

	player_gos_time[playerid] = 5;

	return 1;
}
CMD:r(playerid,params[])
{
	if(PlayerInfo[playerid][pMuted] > 0) return PlayerMuted(playerid);

	if(player_gag[playerid]) return SCM(playerid, COLOR_GREY, "Anda mendapat lelucon, Anda tidak bisa bicara.") & 0;

	if(!form_fraction[playerid] || IsAGang(playerid) || IsAMafia(playerid)) return Send(playerid,COLOR_GREY,"Anda bukan anggota organisasi atau Anda belum mengenakan seragam");
	if(sscanf(params, "s[128]", params[0])) return Send(playerid, -1,"Masuk: /r [teks]");

    if(CheckIP(params[0]))
	{
		PlayerInfo[playerid][pMuted] = 600;
		Send(playerid, COLOR_LIGHTRED, "Anda menerima larangan ngobrol tentang iklan yang dicurigai.");
		format(format_string, 188, "[A] %s[%d] || Iklan yang Dicurigai: [ %s ]", Name(playerid),playerid,params[0]);
		SendAdminMessage(COLOR_GREY, format_string);
		return 1;
	}
	if(form_fraction[playerid] >= 1 && !IsAGang(playerid) && !IsAMafia(playerid))
	{
	    format(format_string, 188, "[R] %s %s[%d]: %s", FracRank[PlayerInfo[playerid][pMember]][PlayerInfo[playerid][pRank]], Name(playerid), playerid, params);
	    SendFrac(PlayerInfo[playerid][pMember], 0x42B66FFF, format_string);
		return 1;
	}
	else return Send(playerid,COLOR_GREY,"Perintah ini tidak tersedia untuk Anda");
}

CMD:rn(playerid,params[])
{
	if(PlayerInfo[playerid][pMuted] > 0) return PlayerMuted(playerid);

	if(player_gag[playerid]) return SCM(playerid, COLOR_GREY, "Anda mendapat lelucon, Anda tidak bisa bicara.") & 0;

	if(!form_fraction[playerid] || IsAGang(playerid) || IsAMafia(playerid)) return Send(playerid,COLOR_GREY,"Anda bukan anggota organisasi atau Anda belum mengenakan seragam");
	if(sscanf(params, "s[128]", params[0])) return Send(playerid, -1,"Masuk: /r [teks]");

    if(CheckIP(params[0]))
	{
		PlayerInfo[playerid][pMuted] = 600;
		Send(playerid, COLOR_LIGHTRED, "Anda menerima larangan ngobrol tentang iklan yang dicurigai.");
		format(format_string, 188, "[A] %s[%d] || Iklan yang Dicurigai: [ %s ]", Name(playerid),playerid,params[0]);
		SendAdminMessage(COLOR_GREY, format_string);
		return 1;
	}
	if(form_fraction[playerid] >= 1 && !IsAGang(playerid) && !IsAMafia(playerid))
	{
	    format(format_string, 188, "[R] %s %s[%d]: (( %s ))", FracRank[PlayerInfo[playerid][pMember]][PlayerInfo[playerid][pRank]], Name(playerid), playerid, params);
	    SendFrac(PlayerInfo[playerid][pMember], 0x42B66FFF, format_string);
		return 1;
	}
	else return Send(playerid,COLOR_GREY,"Perintah ini tidak tersedia untuk Anda");
}

CMD:rj(playerid,params[])
{
	if(PlayerInfo[playerid][pMuted] > 0) return PlayerMuted(playerid);
	if(rent_job_vehicle[playerid] == INVALID_VEHICLE_ID) return Send(playerid,COLOR_GREY,"Anda tidak menyewa mobil yang berfungsi.");
	if(sscanf(params, "s[128]", params[0])) return Send(playerid, -1,"Masuk: /rj [teks]");

    if(CheckIP(params[0]))
	{
		PlayerInfo[playerid][pMuted] = 600;
		Send(playerid, COLOR_LIGHTRED, "Anda menerima larangan ngobrol tentang iklan yang dicurigai.");
		format(format_string, 188, "[A] %s[%d] || Iklan yang Dicurigai: [ %s ]", Name(playerid),playerid,params[0]);
		SendAdminMessage(COLOR_GREY, format_string);
		return 1;
	}

    format(format_string, 188, "[RJ] %s[%d]: %s", Name(playerid), playerid, params);
    return SendFrac(PlayerInfo[playerid][pJob], 0x42B66FFF, format_string);
}
CMD:d(playerid, params[])
{
	if(!IsACop(playerid) && !IsAArmy(playerid) && !IsAMedic(playerid) && PlayerInfo[playerid][pMember] != FRACTION_MAYOR) return SCM(playerid, COLOR_GREY, "Anda tidak dapat menggunakannya.");
    if(Injured[playerid] == 1) return SendClientMessage(playerid, COLOR_GREY, "Karakter anda dalam kondisi terluka, mohon sabar hingga roleplay sembuh kembali.");

	if(PlayerInfo[playerid][pMuted] > 0) return PlayerMuted(playerid);
	if(player_gag[playerid]) return SCM(playerid, COLOR_GREY, "Anda mendapat lelucon, Anda tidak bisa bicara.") & 0;
	if(!form_fraction[playerid]) return Send(playerid,COLOR_GREY,"Anda tidak mengenakan seragam");
	if(sscanf(params, "s[128]", params[0])) return Send(playerid, -1,"Masuk: /d [teks]");
	if(player_gos_time[playerid] > 0) return Send(playerid, COLOR_GREY, "Saluran sibuk... Mohon tunggu!");

	if(CheckIP(params[0]))
	{
		PlayerInfo[playerid][pMuted] = 600;
		Send(playerid, COLOR_LIGHTRED, "Anda menerima larangan ngobrol tentang iklan yang dicurigai.");
		format(format_string, sizeof(format_string), "[A] %s[%d] || Iklan yang Dicurigai: [ %s ]", Name(playerid),playerid,params[0]);
		SendAdminMessage(COLOR_GREY, format_string);
		return 1;
	}
	player_gos_time[playerid] = 5;
	format(format_string, sizeof(format_string), "[%s] %s %s[%d]: %s", FracInfo[PlayerInfo[playerid][pMember]][fTag], FracRank[PlayerInfo[playerid][pMember]][PlayerInfo[playerid][pRank]], Name(playerid), playerid ,params);
	SendTeamMessage(COLOR_ALLDEPT, format_string);
	return 1;
}

CMD:dn(playerid, params[])
{
    if(!IsACop(playerid) && !IsAArmy(playerid) && !IsAMedic(playerid) && PlayerInfo[playerid][pMember] != FRACTION_MAYOR) return SCM(playerid, COLOR_GREY, "Anda tidak dapat menggunakannya.");

	if(PlayerInfo[playerid][pMuted] > 0) return PlayerMuted(playerid);
	if(player_gag[playerid]) return SCM(playerid, COLOR_GREY, "Kamu muntah, kamu tidak bisa bicara.") & 0;
	if(!form_fraction[playerid]) return Send(playerid,COLOR_GREY,"Anda tidak mengenakan seragam");
	if(sscanf(params, "s[128]", params[0])) return Send(playerid, -1,"Masuk: /d [teks]");

	if(CheckIP(params[0]))
	{
		PlayerInfo[playerid][pMuted] = 600;
		Send(playerid, COLOR_LIGHTRED, "Anda menerima larangan ngobrol tentang iklan yang dicurigai.");
		format(format_string, sizeof(format_string), "[A] %s[%d] || Iklan yang Dicurigai: [ %s ]", Name(playerid),playerid,params[0]);
		SendAdminMessage(COLOR_GREY, format_string);
		return 1;
	}

	format(format_string, sizeof(format_string), "[%s] %s %s[%d]: (( %s ))", FracInfo[PlayerInfo[playerid][pMember]][fTag], FracRank[PlayerInfo[playerid][pMember]][PlayerInfo[playerid][pRank]], Name(playerid), playerid ,params);
	SendTeamMessage(COLOR_ALLDEPT, format_string);
	return 1;
}


CMD:achat(playerid, params[])
{
    if(admin_level[playerid] < 2 || !admin_logged[playerid]) return 1;
    if(!admin_global_chat[playerid]) admin_global_chat[playerid] = 1, Send(playerid, COLOR_GREY, "Anda telah mengaktifkan penyadapan obrolan global!");
	else admin_global_chat[playerid] = 0, Send(playerid, COLOR_GREY, "Anda mematikan mendengarkan obrolan global!");
	return 1;
}

CMD:arep(playerid)
{
	if(admin_level[playerid] == 0 && PlayerInfo[playerid][pSupport] == 0) return 1;

	String = "";

	new str[64], to_player = -1;

	new count = 0;

	for(new i; i < MAX_REPORTS; i++)
	{
	    to_player = report_info[i][r_id];

	    if(to_player == INVALID_PLAYER_ID) continue;

		if(report_info[i][r_type] == 0 && admin_level[playerid] == 0) continue;

	    format(str, 64, "%s\t%s[%i]\t%i\n", report_info[i][r_type] ? ("Pertanyaan") : ("Keluhan"), GetPlayerNameEx(to_player), to_player, report_info[i][r_time] / 60);
	    strcat(String, str);

	    SetPlayerListitemValue(playerid, count++, i);
	}

	if(count == 0) return SCM(playerid, COLOR_GREY, "Tidak ada pertanyaan.");

	return SPD(playerid, 9947, DIALOG_STYLE_TABLIST, "Daftar pertanyaan", String, "Pilih", "Tutup");
}

alias:report("rep");
CMD:report(playerid, params[])
{
    if(PlayerInfo[playerid][pMuted] > 0) return PlayerMuted(playerid);

    if(sscanf(params, "s[144]", params[0])) return Send(playerid,-1,"Masuk: /report(/rep) [keluhan]");

    PlayerSendMessageToReport(playerid, 0, params);

    return 1;
}

CMD:ask(playerid, params[])
{
    if(PlayerInfo[playerid][pMuted] > 0) return PlayerMuted(playerid);

    if(sscanf(params, "s[144]", params[0])) return Send(playerid,-1,"Masuk: /ask [pertanyaannya]");

    PlayerSendMessageToReport(playerid, 1, params);

    return 1;
}

CMD:todo(playerid, params[])
{
    if(PlayerInfo[playerid][pMuted] > 0) return PlayerMuted(playerid);
    if(sscanf(params, "s[128]", params[0])) return Send(playerid,-1,"Masuk: /todo [teks] * [tindakan]");
	if(strfind(params, "*", true) == -1) return SendClientMessage(playerid,-1,"Masuk: /todo [teks] * [tindakan]");

 	new arrCoords[2][128];
  	sscanf(params[0],"p<*>s[128]s[128]",arrCoords[0],arrCoords[1]);

   	if(PlayerInfo[playerid][pSex] == 1) format(String, 244, "- %s {DD90FF}- ceritanya %s, %s",arrCoords[0], Name(playerid), arrCoords[1]);
    else format(String, 244, "- %s {DD90FF}kata %s, %s",arrCoords[0], Name(playerid), arrCoords[1]);
    ProxDetector(20.0, playerid, String, COLOR_RAZGOVOR1,COLOR_RAZGOVOR2,COLOR_RAZGOVOR3,COLOR_RAZGOVOR4,COLOR_RAZGOVOR5);
	return 1;
}
CMD:try(playerid, params[])
{
    if(PlayerInfo[playerid][pMuted] > 0) return PlayerMuted(playerid);
	if(sscanf(params, "s[128]", params[0])) return Send(playerid, -1, "Masuk: /try [tindakan]");
	if(CheckIP(params[0]))
	{
		PlayerInfo[playerid][pMuted] = 600;
		Send(playerid, COLOR_LIGHTRED, "Anda menerima larangan ngobrol tentang iklan yang dicurigai.");
		format(format_string, sizeof(format_string), "[A] %s[%d] || Iklan yang Dicurigai: [ %s ]", Name(playerid),playerid,params[0]);
		SendAdminMessage(COLOR_LIGHTRED, format_string);
		return 1;
	}
	new randomchik = RandomEx(0,2);
	format(String, 188, "{DD90FF}%s %s %s", Name(playerid), params[0], (!randomchik)?("{63C600}| Semoga beruntung") : ("{FF6600}| Gagal"));
	ProxDetector(20.0, playerid, String, 0xDD90FFAA,0xDD90FFAA,0xDD90FFAA,0xDD90FFAA,0xDD90FFA);
	return 1;
}
new LimitSpamMe[MAX_PLAYERS], MeTexted[MAX_PLAYERS], CountME[MAX_PLAYERS]=0, OldMeParams[MAX_PLAYERS];

CMD:me(playerid, params[])
{
    //CountME[playerid]++;
    //MeTexted[playerid]=params;
    //strunpack(MeTexted[playerid], params, 90);
    if(PlayerInfo[playerid][pMuted] > 0) return PlayerMuted(playerid);
    //if(CountME[playerid] > 3)
	//{
        //CountME[playerid]=0;
        //strunpack(OldMeParams[playerid], MeTexted[playerid], 90);
        //if(strcmp(params,MeTexted[playerid],true)==0)
	//}
	/*
    if(strcmp(params,OldMeParams[playerid],true)==0)
	{
    		KickD(playerid, "spam untuk abuse /me");
			
			Send(playerid, COLOR_LIGHTRED, "Anda mohon jangan spam untuk abuse /me. mohon lebih kreatif lagi dalam menulis flow role karakter anda.");
			format(format_string, sizeof(format_string), "System menempatkan koruptor %s[%d] untuk karantina mandiri. Alasan: Tidak niat roleplay /me", Name(playerid), playerid);
			SendClientMessageToAll(COLOR_LIGHTRED, format_string);
			AddAdminLog(playerid, format_string);
	}
	*/
	if(sscanf(params, "s[144]", params[0])) return Send(playerid, -1,"Masuk: /me [tindakan]");
	// bonus uang menggunakan perintah me
	//PlayerInfo[playerid][pCash]=PlayerInfo[playerid][pCash]+10000;
	GivePlayerMoneyEx(playerid, 100, "(( Semangat, gunakan roleplay /do juga ya tuan.))");
	
	//OnPlayerUpdateAccountsPer(playerid, "pCash", PlayerInfo[playerid][pCash]);
	
	if(CheckIP(params[0]))
	{
		PlayerInfo[playerid][pMuted] = 600;
		Send(playerid, COLOR_LIGHTRED, "Anda menerima larangan ngobrol tentang iklan yang dicurigai.");
		format(format_string, sizeof(format_string), "[A] %s[%d] || Iklan yang Dicurigai: [ %s ]", Name(playerid),playerid,params[0]);
		SendAdminMessage(COLOR_LIGHTRED, format_string);
		return 1;
	}
	format(String, 188, "%s %s",Name(playerid), params[0]);
	ProxDetector(20.0, playerid, String, 0xDD90FFFF,0xDD90FFAA,0xDD90FFAA,0xDD90FFAA,0xDD90FFAA);
	SetPlayerChatBubble(playerid,params[0],0xDD90FFFF,20.0,10000);
	print( params[0]);
	// autor rp saat chatting
	new merp[125], dorp[125], playername[MAX_PLAYER_NAME +1];
	GetPlayerName(playerid, playername, sizeof(playername));

	return 1;
}
CMD:do(playerid, params[])
{
    if(PlayerInfo[playerid][pMuted] > 0) return PlayerMuted(playerid);
	if(sscanf(params, "s[144]", params[0])) return Send(playerid, -1,"Masuk: /do [tindakan]");
	if(CheckIP(params[0]))
	{
		PlayerInfo[playerid][pMuted] = 600;
		Send(playerid, COLOR_LIGHTRED, "Anda menerima larangan ngobrol tentang iklan yang dicurigai.");
		format(format_string, sizeof(format_string), "[A] %s[%d] || Iklan yang Dicurigai: [ %s ]", Name(playerid),playerid,params[0]);
		SendAdminMessage(COLOR_LIGHTRED, format_string);
		return 1;
	}
	format(String, 188, "%s (%s)", params[0], Name(playerid));
  	ProxDetector(20.0, playerid, String, 0xDD90FFFF,0xDD90FFFF,0xDD90FFFF,0xDD90FFFF,0xDD90FFFF);
  	SetPlayerChatBubble(playerid,params[0],0xDD90FFFF,20.0,10000);
	return 1;
}





alias:n("b");
CMD:n(playerid, params[])
{
	//KickBadOOC(playerid, params);
 	
    OnPlayerUpdateAccountsPer(playerid,"pInjured",Injured[playerid]);
    if(Injured[playerid] == 1) return SendClientMessage(playerid, COLOR_GREY, "Karakter anda dalam kondisi terluka, mohon sabar hingga roleplay sembuh kembali.");
    if(PlayerInfo[playerid][pMuted] > 0) return PlayerMuted(playerid);
	if(sscanf(params, "s[144]", params[0])) return Send(playerid, -1,"Masuk: /n(/b) [teks]");
	if(CheckIP(params[0]))
	{
		PlayerInfo[playerid][pMuted] = 600;
		Send(playerid, COLOR_LIGHTRED, "Anda menerima larangan ngobrol tentang iklan yang dicurigai.");
		format(format_string, sizeof(format_string), "[A] %s[%d] || Iklan yang Dicurigai: [ %s ]", Name(playerid),playerid,params[0]);
		SendAdminMessage(COLOR_LIGHTRED, format_string);
		return 1;
	}
	format(String, 188, "(( %s[%d]: %s ))",Name(playerid),playerid,params[0]);
 	ProxDetector(20.0, playerid, String,0xCCCC99FF,0xCCCC99FF,0xCCCC99FF,0xCCCC99FF,0xCCCC99FF);
 	SetPlayerChatBubble(playerid, params[0], 0x999999FF, 20.0, 10000);
 	new str[125];
 	/*
    if(GetPlayerVirtualWorld(playerid) == 0)
    {


        if(LimitSpamOOC[playerid] == 4 || LimitSpamOOC[playerid] == 1 || LimitSpamOOC[playerid] == 6 || LimitSpamOOC[playerid] == 7 )
		{
		    format(str, 48, "Nah %s[%i] Anda sudah melakukan OOC public di tempat roleplay umum.\n bila penting sebaiknya /pm beliau segera.",GetPlayerNameEx(playerid), playerid);
	    	GameTextForPlayer(playerid, str, 5000, 4);
        	Send(playerid, COLOR_LIGHTRED, str);
        }
        if(LimitSpamOOC[playerid] > 8)
		{
			//SetPlayerPrison(playerid, 1, 1 * 60);
		 	//t_SetPlayerPos(playerid, 264.4681,77.5466,1001.0391);
			//SetPlayerInterior(playerid, 6), SetPlayerVirtualWorld(pAdmPrison, 1);

    		//PlayerInfo[playerid][pAdmPrison]++;
    		//OnPlayerUpdateAdminPer(playerid, "pAdmPrison", PlayerInfo[playerid][pAdmPrison]);

			LimitSpamOOC[playerid]=0;
			Send(playerid, COLOR_LIGHTRED, "Anda mohon jangan spam OOC di tempat orang bisa roleplay. Ini hanya penjara OOC sebentar mohon sabar.");
			format(format_string, sizeof(format_string), "System menempatkan pendatang baru %s[%d] masuk penjara. Alasan: Tidak mengerti situasi roleplay", Name(playerid), playerid);
			//SendClientMessageToAll(COLOR_LIGHTRED, format_string);
			AddAdminLog(playerid, format_string);

        	SetPlayerInterior(playerid,0);
			TogglePlayerControllable(playerid, 0);
			InterpolateCameraPos(playerid, 1294.263549, -1337.225830, 278.767089, 1337.283325, -1430.924926, 68.419837, 10000);
			InterpolateCameraLookAt(playerid, 1291.685546, -1333.435791, 276.769744, 1339.189086, -1435.458740, 67.518539, 10000);
			KickD(playerid, "Tidak ada /b atau /n kalau ada roleplay tuan.");

		}

		 new i=0;
        foreach(Player, i)
		{
	    	if(i == playerid) continue;

	    	if(!ProxDetectorS(15.0, playerid, i)) continue;

	    	if(IsPlayerConnected(i))
	    	{
	    	    LimitSpamOOC[playerid]++;
	    	    Send(i, COLOR_LIGHTRED, "Permisi tuan maaf, ingatkan dia untuk tidak /b dan /n saat ada yang lagi /me di tempat roleplay");
	    	}

		}

    }
    //PlayerInfo[playerid][pSatiety] -= 13;
    //OnPlayerUpdateAccountsPer(playerid, "pSatiety", PlayerInfo[playerid][pSatiety]);
	*/
  

	return 1;
}

CMD:w(playerid,params[])
{
	if(PlayerInfo[playerid][pMuted] > 0) return PlayerMuted(playerid);
	if(sscanf(params,"s[144]",params[0])) return Send(playerid,-1,"Masuk: /w [pesan]");

    format(String, 188, "%s[%d] berbisik: %s", Name(playerid), playerid, params[0]);
	ProxDetector(5.0, playerid, String, 0xACCE90FF,0xACCE90FF,0xACCE90FF,0xACCE90FF,0xACCE90FF);
 	SetPlayerChatBubble(playerid, params[0], 0xACCE90FF, 5.0, 10000);
	return 1;
}

CMD:s(playerid, params[])
{
	if(PlayerInfo[playerid][pMuted] > 0) return PlayerMuted(playerid);
	if(sscanf(params, "s[144]", params[0])) return Send(playerid, -1,"Masuk: /s [teks]");
	if(CheckIP(params[0]))
	{
		PlayerInfo[playerid][pMuted] = 600;
		Send(playerid, COLOR_LIGHTRED, "Anda menerima larangan ngobrol tentang iklan yang dicurigai.");
		format(format_string, sizeof(format_string), "[A] %s[%d] || Iklan yang Dicurigai: [ %s ]", Name(playerid),playerid,params[0]);
		SendAdminMessage(COLOR_LIGHTRED, format_string);
		return 1;
	}
	format(String, 188, "%s[%d] Teriak: %s", Name(playerid), playerid, params[0]);
	ProxDetector(40.0,playerid, String,-1,-1,-1,-1,-1);
	if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT) ApplyAnimation(playerid, "ON_LOOKERS", "shout_01",1000.0,0,0,0,0,0,1);
	SetPlayerChatBubble(playerid, params[0],-1,40.0,10000);
	return 1;
}
CMD:voff(playerid,params[])
{
	if(!PlayerInfo[playerid][pVip] || admin_level[playerid] < 1) return Send(playerid,0xafafafff,"Fungsi ini hanya tersedia untuk pemain VIP.");
	if(GetPVarInt(playerid,"vroff"))
	{
		DeletePVar(playerid,"vroff");
		Send(playerid,-1,"Anda telah mengaktifkan obrolan VIP");
	}
	else
	{
		SetPVarInt(playerid,"vroff",true);
		Send(playerid,-1,"Anda telah menonaktifkan obrolan VIP");
	}
	return 1;
}
stock SendVipMessage(color, str[])
{
	foreach(new i : Player)
	{
		if(!PlayerInfo[i][pVip]) continue;
		if(GetPVarInt(i,"vroff")) continue;
		SendClientMessage(i, color, str);
	}
	return 1;
}
CMD:v(playerid,params[])
{
	if(!PlayerInfo[playerid][pVip]) return Send(playerid,0xafafafff,"Fungsi ini hanya tersedia untuk pemain VIP.");
	if(PlayerInfo[playerid][pMuted] > 0) return Send(playerid,0xafafafff,"Anda memiliki larangan obrolan");
	if(isnull(params) || strlen(params) > 144) return Send(playerid,0xafafafff,"/v [teks]");
	if(admin_level[playerid] == 0) format(format_string, 128, "[VIP] %s[%d]: {ffffff}%s",Name(playerid),playerid,params);
	else if(admin_level[playerid] >= 1) format(format_string, 128, "[VIP] Administrator %s[%d]: {ffffff}%s",Name(playerid),playerid,params);
	SendVipMessage(0x1E90FFff, format_string);
	return 1;
}
CMD:unfwarn(playerid, params[])
{
	if(!PlayerInfo[playerid][pMember]) return 1;
	if(sscanf(params, "u",params[0])) return Send(playerid, -1,"Masuk: /unfwarn [playerid]");
    if(!IsPlayerConnected(params[0])) return Send(playerid, -1,"Pemain sedang offline");//+
 	if(PlayerInfo[params[0]][pLogin] == 0) return Send(playerid, -1,"Pemain belum login");//+;
	if(PlayerInfo[playerid][pRank] < FracInfo[PlayerInfo[playerid][pMember]][fRankMax]) return Send(playerid,COLOR_GREY,"Hanya pemimpin organisasi yang dapat menarik teguran.");
	if(PlayerInfo[playerid][pMember] != PlayerInfo[params[0]][pMember]) return Send(playerid,COLOR_GREY,"Pemain tidak ada di organisasi Anda.!");
	if(PlayerInfo[params[0]][pfWarn] <= 0) return Send(playerid, COLOR_GREY,"Pemain ini tidak memiliki teguran!");
	PlayerInfo[params[0]][pfWarn] -= 1;

	SCMF(params[0], 0x56FB4EFF, "Pemimpin %s(%i) memecatmu (%d/3)", Name(playerid), playerid, PlayerInfo[params[0]][pfWarn]);
	SCMF(playerid, 0x56FB4EFF, "Anda berangkat %s(%i) teguran (%d/3)", Name(params[0]), params[0], PlayerInfo[params[0]][pfWarn]);
	return 1;
}
CMD:gov(playerid, params[])
{
    if(!IsACop(playerid) && !IsAArmy(playerid) && !IsAMedic(playerid) && PlayerInfo[playerid][pMember] != FRACTION_MAYOR) return SCM(playerid, COLOR_GREY, "Anda tidak dapat menggunakannya.");

	if(player_gag[playerid]) return SCM(playerid, COLOR_GREY, "Anda mendapat lelucon, Anda tidak bisa bicara.") & 0;
	if(PlayerInfo[playerid][pMuted] > 0) return PlayerMuted(playerid);
	if(PlayerInfo[playerid][pRank] < FracInfo[PlayerInfo[playerid][pMember]][fRankMax]-1) return Send(playerid,COLOR_GREY,"Anda bukan pemimpin/wakil organisasi!");

	if(sscanf(params, "s[128]",params[0])) return Send(playerid, -1,"Masuk: /gov [teks]");
    if(CheckIP(params[0]))
	{
	    format(format_string, sizeof(format_string), "[A] Pemimpin fraksi %s (%s) dihapus dari jabatannya karena dicurigai beriklan.",Name(playerid), FracInfo[PlayerInfo[playerid][pMember]][fName]);
		SendAdminMessage(COLOR_GREY, format_string);
		PlayerInfo[playerid][pSetSpawn] = 1, PlayerInfo[playerid][pMember] = 0;
    	PlayerInfo[playerid][pRank] = 0, PlayerInfo[playerid][pfWarn] = 0;
		form_fraction[playerid] = 0, SetPlayerToTeamColor(playerid);
		SetPlayerSkinEx(playerid, PlayerInfo[playerid][pSkin]);

		SavePlayerFraction(playerid);

		format(String, 322, ""W"Anda telah dihapus dari jabatan administrator untuk mengiklankan proyek pihak ketiga.\nJika terjadi kesalahan - ambil tangkapan layar kotak dialog ini\ndan kirimkan ke administrasi.\n\nTeks dikirim ke /gov: %s", params[0]);
		SPD(playerid, 0, DIALOG_STYLE_MSGBOX, "Kecurigaan dalam iklan", String, "Tutup", "");
		return 1;
	}
    format(format_string, sizeof(format_string), "Gov. berita: %s[%d]: [%s] %s", Name(playerid), playerid, FracInfo[PlayerInfo[playerid][pMember]][fTag], params[0]);
	SendClientMessageToAll(0x3A5FCDFF, format_string);
	return 1;
}

//------------------------------------------------
stock GetRPName(playerid)
{
    new RPName[MAX_PLAYER_NAME], i_pos;
    GetPlayerName(playerid, RPName, MAX_PLAYER_NAME);
    while ((i_pos = strfind(RPName, "_", false, i_pos)) != -1) RPName[i_pos] = ' ';
    return RPName;

}

stock GetDistanceToCar(playerid, veh, Float: posX = 0.0, Float: posY = 0.0, Float: posZ = 0.0) {

  new
      Float: Floats[2][3];

  if(posX == 0.0 && posY == 0.0 && posZ == 0.0) {
    if(!IsPlayerInAnyVehicle(playerid)) GetPlayerPos(playerid, Floats[0][0], Floats[0][1], Floats[0][2]);
    else GetVehiclePos(GetPlayerVehicleID(playerid), Floats[0][0], Floats[0][1], Floats[0][2]);
  }
  else {
    Floats[0][0] = posX;  
    Floats[0][1] = posY;
    Floats[0][2] = posZ;
  }
  GetVehiclePos(veh, Floats[1][0], Floats[1][1], Floats[1][2]);
  return floatround(floatsqroot((Floats[1][0] - Floats[0][0]) * (Floats[1][0] - Floats[0][0]) + (Floats[1][1] - Floats[0][1]) * (Floats[1][1] - Floats[0][1]) + (Floats[1][2] - Floats[0][2]) * (Floats[1][2] - Floats[0][2])));
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



stock SelectObjectEx(playerid)
{
    SelectObject(playerid);
    GameTextForPlayer(playerid, "Sir please press ~y~'Escape'~w~ if have ending in this selecting system", 1000, 5);
}




stock EnablePlayerGPS(playerid, Float: x, Float: y, Float: z, message[] = "Sir, You have changed your GPS location.")
{
      SetPlayerGPSInfo(playerid, G_POS_X, x);
      SetPlayerGPSInfo(playerid, G_POS_Y, y);
      SetPlayerGPSInfo(playerid, G_POS_Z, z);

      GPSCP = SetPlayerCheckpoint(playerid, x, y, z, 3.0);

    //  SetPlayerMapIcon(playerid, 98, x, y, z, markertype, 0, MAPICON_GLOBAL);

      if(strlen(message))
        SendClientMessage(playerid, 0xFFFF00FF, message);

      SetPlayerGPSInfo(playerid, G_ENABLED, GPS_STATUS_ON);

  return 1;
}


CheckMaxPlayerCars(playerid)// Âûäàñò ìàêñèìàëüíîå äîñòóïíîå çíà÷åíèå ñëîòîâ ïîä òðàíñïîðò
{
  new car=10; //setting for max player basic slot of veh.
  switch(pInfo[playerid][VIP])
  {
      
      case 1:car+1;// âñåãî 2 ìàøèíû
      case 2:car+2;// âñåãî 3 ìàøèíû
      case 3:car+2;// âñåãî 3 ìàøèíû
      case 4:car+3;// âñåãî 4 ìàøèíû
  }
  return car;
}
CheckMaxCarPlayer(playerid)// Âûäàñò êîë-âî ëè÷íûõ ìàøèí ó èãðîêà
{
  new car;
  for(new v;v<MAX_OWNABLE_CARS;v++)
  {
      if(get_ownable_car[v][OC_OWNER_ID]==0)continue;
      if(get_ownable_car[v][OC_OWNER_ID]!=pInfo[playerid][ID])continue;
      PlayerCarKey[playerid][car]=v;
      car++;
  }
  return car;
}
CheckVIDPlayerKeyCar(playerid,vid)// Ñêàæåò, åñëè åñòü êëþ÷è îò äàííîãî ëè÷íîãî òðàíñïîðòà
{
    for(new c;c<MAX_PL_KEY;c++)
    {
        if(PlayerCarKey[playerid][c]<=0)continue;
    if(PlayerCarKey[playerid][c]==vid)
    {
        return true;
    }
    }
    return false;
}



GetRealIdCar(vid)
{
  new car;
  for(new v;v<MAX_VEHICLES;v++)
  {
      if(CarN[v][2]==0)continue;
      if(CarN[v][2]!=vid)continue;
      car=v;break;
      if(v == 0)
      printf("[GetRealIdCar] Error sir, Please repair stock function from check VID to Real ID Vehicle system.");
  }
  return car;
}


stock DisablePlayerGPS(playerid)
{
  if(GetPlayerGPSInfo(playerid, G_ENABLED) == GPS_STATUS_ON)
  {
    DisablePlayerCheckpoint(playerid);

    SetPlayerGPSInfo(playerid, G_ENABLED, GPS_STATUS_OFF);
    SendClientMessage(playerid, 0xFFFF00FF, ""COL_RED"GPS:"COL_WHITE" You turn off the GPS device. Good luck sir!");
  }
  return 1;
}



stock SaveOwnableCar(vehicleid)
{
  if(IsAOwnableCar(vehicleid))
  {
      new query[600];
      new index = CarN[vehicleid][2];
      new str[200];
      format(str, sizeof(str), "{FFBBBB}DEBUG:{FFFFFF} Vehicle Database save OC ID: [{AAAAFF}%i{FFFFFF}]", index); SCM(get_ownable_car[index][OwnerIDinSvr], 0xFFCCCCFF, str);
      new Float:health;
      printf("[OWNABLECARS]: Debug SaveOwnableCar on VID:[%d]", index);
      GetVehicleHealth(vehicleid, health);

      format( query, 1000, "UPDATE `oc.` SET `pos_x` = '%0.1f', `pos_y` = '%0.1f', `pos_z` = '%0.1f', `angle` = '%0.1f', `world` = '%i', `inter` = '%i', `status` = '%d', `key_in`='%d',`mileage`='%0.1f',`health`='%0.1f',`model_id` = '%d',`fuel` = '%0.1f' WHERE `oc.`.`id` ='%d'",
      GetOwnableCarData(index, OC_POS_X),
      GetOwnableCarData(index, OC_POS_Y),
      GetOwnableCarData(index, OC_POS_Z),
      GetOwnableCarData(index, OC_ANGLE),
      GetOwnableCarData(index, OC_World),
      GetOwnableCarData(index, OC_Int),
      GetVehicleParam(vehicleid, V_LOCK),
      GetOwnableCarData(index, OC_KEY_IN),
      GetVehicleData(vehicleid, V_MILEAGE),
      health,
      get_ownable_car[index][OC_MODEL_ID],
      GetOwnableCarData(index, OC_FUEL),
      GetOwnableCarData(index, OC_SQL_ID)
    );
    n_mysql_query(g_Sql, query, false);

    SCM(get_ownable_car[index][OwnerIDinSvr], -1, query);
    

    

    return mysql_errno();
  }
  //return 1;
}

GetFreeTrunkID(v, s) 
{
  new NewID;
  for(new v=1; v <= MAX_VEHICLES; v++)
  {
    
    for(new s=1; s<=MAX_TRUNK_SLOTS; s++)
    {
      if(get_vehicle_trunk[v][s][TRUNK_SQL_ID] == 0)
      {
        NewID = v;
        if( get_vehicle_trunk[v][s][TRUNK_SQL_ID] == NewID)
        {
          NewID=v+s;
          if( NewID == get_vehicle_trunk[v][s][TRUNK_SQL_ID])
          {
            NewID++;
            if( NewID == get_vehicle_trunk[v][s][TRUNK_SQL_ID])
            {
              NewID=NewID+GetSVarInt("SlotTrunkUsed");
            }
          }

        }
      }
    }
  }
  
  printf("[TRUNK_ID]: Debug new ID SQL:[%d]", v);
  return NewID;
}






SpawnVehicle_InfrontOfPlayer(playerid, vehiclemodel, color1, color2)
{
  new Float:x,Float:y,Float:z;
  new Float:facing;
  new Float:distance;

    GetPlayerPos(playerid, x, y, z);
    GetPlayerFacingAngle(playerid, facing);

    new Float:size_x,Float:size_y,Float:size_z;
  GetVehicleModelInfo(vehiclemodel, VEHICLE_MODEL_INFO_SIZE, size_x, size_y, size_z);

  distance = size_x + 0.5;

    x += (distance * floatsin(-facing, degrees));
    y += (distance * floatcos(-facing, degrees));

  facing += 90.0;
  if(facing > 360.0) facing -= 360.0;

  return CreateVehicle(vehiclemodel, x, y, z + (size_z * 0.25), facing, color1, color2, -1);
}

//------------------------------------------------






SpawnObject_InfrontOfPlayer(playerid, model)
{
  new Float:x,Float:y,Float:z;
  new Float:facing;
  new Float:distance;

    GetPlayerPos(playerid, x, y, z);
    GetPlayerFacingAngle(playerid, facing);

    distance = 5.0;

    x += (distance * floatsin(-facing, degrees));
    y += (distance * floatcos(-facing, degrees));

  facing += 90.0;
  if(facing > 360.0) facing -= 360.0;

  return CreateObject(model, x, y, z, 0.0, 0.0, 0.0, 300.0);
}
//-------------------------------------------------
stock CloseMessage(playerid, color, string[])
{
  for(new i = 0; i < MAX_PLAYERS; i++)
  {
    new Float:x, Float:y, Float:z;
    GetPlayerPos(playerid, x, y, z);
    if(IsPlayerInRangeOfPoint(i, 10.0, x, y, z))
    {
        if(GetPlayerVirtualWorld(playerid) == GetPlayerVirtualWorld(i))
        {
            if(GetPlayerInterior(playerid) == GetPlayerInterior(i))
            {
            SendClientMessage(i, color, string);
        }
      }
    }
  }
}
//-------------------------------------------------

stock ProcessChatText(playerid, text[])
{
  new useindex=1;
   SEM(playerid, ""COL_RED"DEBUG: "COL_WHITE"ProcessChatText");
    // Handle shouting prefix (!)
  if(text[0] == '!' && strlen(text) > 1) {
      if(text[1] == ' ') useindex++;
      TalkMessage(SHOUT_DISTANCE, playerid, "shouts:", text[useindex]);
      return;
  }

  // Handle quiet prefix (#)
  if(text[0] == '#' && strlen(text) > 1) {
      if(text[1] == ' ') useindex++;
      TalkMessage(LOW_DISTANCE, playerid, "[LOW]", text[useindex]);
      return;
  }

  // Send to other players in range and fade

  TalkMessage(TALK_DISTANCE, playerid, "", text);
}

//---------------------------------------------
stock InCarMessage(Float:dist, playerid, prefix[], message[])
{
    //new PlayerName[MAX_PLAYER_NAME+1];
  new Msg[256+1];
  new MsgWithName[256+1];
  
  if(!strlen(message)) return;

  if(IsPlayerConnected(playerid))
  {
    new Float:fPlayerX, Float:fPlayerY, Float:fPlayerZ;
    new Float:fPlayerToPlayerDist;
    new Float:fNormDistance;
    new ColorScale;
    new ColorValue;
   
    
    if(strlen(prefix)) {
      format(Msg, sizeof(Msg), "%s %s", prefix, message);
    } else {
        format(Msg, sizeof(Msg), "%s", message);
    }
    
    format(MsgWithName, sizeof(MsgWithName), "%s says [CAR]: %s ...", GetRPName(playerid), Msg);

        SetPlayerChatBubble(playerid, Msg, SPEECH_BUBBLE_COLOR, dist, CHAT_BUBBLE_TIME);
    
    // Send to originating player
    PlayerMessage(playerid, COLOR_YELLOW, MsgWithName);

    GetPlayerPos(playerid, fPlayerX, fPlayerY, fPlayerZ);

    for(new i = 0; i < MAX_PLAYERS; i++) { // for every player
        if(IsPlayerConnected(i) && (i != playerid) && IsPlayerStreamedIn(playerid,i)) {
            fPlayerToPlayerDist = GetPlayerDistanceFromPoint(i, fPlayerX, fPlayerY, fPlayerZ);
        if(fPlayerToPlayerDist < dist) { // receiving player is within the specified distance
          // get normalized distance to create a fade.
          fNormDistance = 1.0 - (fPlayerToPlayerDist / dist);
            if(fNormDistance > 0.75) ColorScale = 220;
          else ColorScale = floatround(96.0 + (128.0 * fNormDistance));
          ColorValue = 0x000000FF | ColorScale << 24 | ColorScale << 16 | ColorScale << 8;
          PlayerMessage(i, COLOR_YELLOW, MsgWithName);
        }
      }
    }
  }
}
//---------------------------------------------
stock ShoutsMessage(Float:dist, playerid, prefix[], message[])
{
    //new PlayerName[MAX_PLAYER_NAME+1];
  new Msg[256+1];
  new MsgWithName[256+1];
  
  if(!strlen(message)) return;

  if(IsPlayerConnected(playerid))
  {
    new Float:fPlayerX, Float:fPlayerY, Float:fPlayerZ;
    new Float:fPlayerToPlayerDist;
    new Float:fNormDistance;
    new ColorScale;
    new ColorValue;
   
    
    if(strlen(prefix)) {
      format(Msg, sizeof(Msg), "%s %s", prefix, message);
    } else {
        format(Msg, sizeof(Msg), "%s", message);
    }
    
    format(MsgWithName, sizeof(MsgWithName), "%s shout: %s!", GetRPName(playerid), Msg);

        SetPlayerChatBubble(playerid, Msg, COLOR_WHITE, dist, CHAT_BUBBLE_TIME);
    
    // Send to originating player
    PlayerMessage(playerid, COLOR_WHITE, MsgWithName);

    GetPlayerPos(playerid, fPlayerX, fPlayerY, fPlayerZ);

    for(new i = 0; i < MAX_PLAYERS; i++) { // for every player
        if(IsPlayerConnected(i) && (i != playerid) && IsPlayerStreamedIn(playerid,i)) {
            fPlayerToPlayerDist = GetPlayerDistanceFromPoint(i, fPlayerX, fPlayerY, fPlayerZ);
        if(fPlayerToPlayerDist < dist) { // receiving player is within the specified distance
          // get normalized distance to create a fade.
          fNormDistance = 1.0 - (fPlayerToPlayerDist / dist);
            if(fNormDistance > 0.75) ColorScale = 220;
          else ColorScale = floatround(96.0 + (128.0 * fNormDistance));
          ColorValue = COLOR_WHITE | ColorScale << 24 | ColorScale << 16 | ColorScale << 8;
          PlayerMessage(i, COLOR_WHITE, MsgWithName);
        }
      }
    }
  }
}

stock WhisperMessage(Float:dist, playerid, prefix[], message[])
{
    //new PlayerName[MAX_PLAYER_NAME+1];
  new Msg[256+1];
  new MsgWithName[256+1];
  
  if(!strlen(message)) return;

  if(IsPlayerConnected(playerid))
  {
    new Float:fPlayerX, Float:fPlayerY, Float:fPlayerZ;
    new Float:fPlayerToPlayerDist;
    new Float:fNormDistance;
    new ColorScale;
    new ColorValue;
   
    
    if(strlen(prefix)) {
      format(Msg, sizeof(Msg), "%s %s", prefix, message);
    } else {
        format(Msg, sizeof(Msg), "%s", message);
    }
    
    format(MsgWithName, sizeof(MsgWithName), "%s says [LOW]: %s..", GetRPName(playerid), Msg);

        SetPlayerChatBubble(playerid, Msg, SPEECH_BUBBLE_COLOR, dist, CHAT_BUBBLE_TIME);
    
    // Send to originating player
    PlayerMessage(playerid, COLOR_ERROR, MsgWithName);

    GetPlayerPos(playerid, fPlayerX, fPlayerY, fPlayerZ);

    for(new i = 0; i < MAX_PLAYERS; i++) { // for every player
        if(IsPlayerConnected(i) && (i != playerid) && IsPlayerStreamedIn(playerid,i)) {
            fPlayerToPlayerDist = GetPlayerDistanceFromPoint(i, fPlayerX, fPlayerY, fPlayerZ);
        if(fPlayerToPlayerDist < dist) { // receiving player is within the specified distance
          // get normalized distance to create a fade.
          fNormDistance = 1.0 - (fPlayerToPlayerDist / dist);
            if(fNormDistance > 0.75) ColorScale = 220;
          else ColorScale = floatround(96.0 + (128.0 * fNormDistance));
          ColorValue = COLOR_ERROR | ColorScale << 24 | ColorScale << 16 | ColorScale << 8;
          PlayerMessage(i, ColorValue, MsgWithName);
        }
      }
    }
  }
}
//---------------------------------------------
stock TalkMessage(Float:dist, playerid, prefix[], message[])
{
    //new PlayerName[MAX_PLAYER_NAME+1];
  new Msg[256+1];
  new MsgWithName[256+1];
  
  if(!strlen(message)) return;

  if(IsPlayerConnected(playerid))
  {
    new Float:fPlayerX, Float:fPlayerY, Float:fPlayerZ;
    new Float:fPlayerToPlayerDist;
    new Float:fNormDistance;
    new ColorScale;
    new ColorValue;
   
    
    if(strlen(prefix)) {
      format(Msg, sizeof(Msg), "%s %s", prefix, message);
    } else {
        format(Msg, sizeof(Msg), "%s", message);
    }
    
    format(MsgWithName, sizeof(MsgWithName), "%s says: %s", GetRPName(playerid), Msg);

        SetPlayerChatBubble(playerid, Msg, SPEECH_BUBBLE_COLOR, dist, CHAT_BUBBLE_TIME);
    
    // Send to originating player
    PlayerMessage(playerid, LOCAL_TALK_COLOR, MsgWithName);

    GetPlayerPos(playerid, fPlayerX, fPlayerY, fPlayerZ);

    for(new i = 0; i < MAX_PLAYERS; i++) { // for every player
        if(IsPlayerConnected(i) && (i != playerid) && IsPlayerStreamedIn(playerid,i)) {
            fPlayerToPlayerDist = GetPlayerDistanceFromPoint(i, fPlayerX, fPlayerY, fPlayerZ);
        if(fPlayerToPlayerDist < dist) { // receiving player is within the specified distance
          // get normalized distance to create a fade.
          fNormDistance = 1.0 - (fPlayerToPlayerDist / dist);
            if(fNormDistance > 0.75) ColorScale = 220;
          else ColorScale = floatround(96.0 + (128.0 * fNormDistance));
          ColorValue = COLOR_WHITE | ColorScale << 24 | ColorScale << 16 | ColorScale << 8;
          PlayerMessage(i, ColorValue, MsgWithName);
        }
      }
    }
  }
}

//---------------------------------------------

stock ProcessActionText(playerid, message[], actiontype)
{
    new ActionText[256+1];
    new ActionBubble[MAX_CHATBUBBLE_LENGTH+1];
    new PlayerName[MAX_PLAYER_NAME+1];

    

  if(actiontype == ACTION_DO) {
    format(ActionText, 256, "* %s ((%s))", message, GetRPName(playerid) );
    format(ActionBubble, MAX_CHATBUBBLE_LENGTH, "* (( %s ))", GetRPName(playerid) );
  } else {
      format(ActionText, 256, "* %s %s", GetRPName(playerid), message);
      format(ActionBubble, MAX_CHATBUBBLE_LENGTH, "* %s", message);
  }

    LocalMessage(ACTION_DISTANCE, playerid, COLOR_ME, ActionText);
    SetPlayerChatBubble(playerid, ActionBubble, COLOR_ME, ACTION_DISTANCE, CHAT_BUBBLE_TIME);
    return 1;
}

//---------------------------------------------

stock PlayerMessage(playerid, color, message[])
{
     SendClientMessage(playerid, color, message);
}
//---------------------------------------------
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

//---------------------------------------------

stock LoadStaticVehiclesFromFile(const filename[])
{
  new File:file_ptr;
  new line[256];
  new var_from_line[64];
  new vehicletype;
  new Float:SpawnX;
  new Float:SpawnY;
  new Float:SpawnZ;
  new Float:SpawnRot;
    new Color1, Color2;
  new index;
  new vehicles_loaded;

  file_ptr = fopen(filename,filemode:io_read);
  if(!file_ptr) return 0;

  vehicles_loaded = 0;

  while(fread(file_ptr,line,256) > 0)
  {
      index = 0;

      // Read type
      index = token_by_delim(line,var_from_line,',',index);
      if(index == (-1)) continue;
      vehicletype = strval(var_from_line);
      if(vehicletype < 400 || vehicletype > 611) continue;

      // Read X, Y, Z, Rotation
      index = token_by_delim(line,var_from_line,',',index+1);
      if(index == (-1)) continue;
      SpawnX = floatstr(var_from_line);

      index = token_by_delim(line,var_from_line,',',index+1);
      if(index == (-1)) continue;
      SpawnY = floatstr(var_from_line);

      index = token_by_delim(line,var_from_line,',',index+1);
      if(index == (-1)) continue;
      SpawnZ = floatstr(var_from_line);

      index = token_by_delim(line,var_from_line,',',index+1);
      if(index == (-1)) continue;
      SpawnRot = floatstr(var_from_line);

      // Read Color1, Color2
      index = token_by_delim(line,var_from_line,',',index+1);
      if(index == (-1)) continue;
      Color1 = strval(var_from_line);

      index = token_by_delim(line,var_from_line,';',index+1);
      Color2 = strval(var_from_line);
      
      //printf("%d,%.2f,%.2f,%.2f,%.4f,%d,%d",vehicletype,SpawnX,SpawnY,SpawnZ,SpawnRot,Color1,Color2);
      
      AddStaticVehicleEx(vehicletype,SpawnX,SpawnY,SpawnZ,SpawnRot,Color1,Color2,(30*60)); // respawn 30 minutes
    
    /*new numplate_test[32+1];
    format(numplate_test,32,"GRLC{44AA33}%d",vid);
    SetVehicleNumberPlate(vid, numplate_test);*/
    
    vehicles_loaded++;
  }

  fclose(file_ptr);
  printf("Loaded %d vehicles from: %s",vehicles_loaded,filename);
  return vehicles_loaded;
}

//---------------------------------------------

stock token_by_delim(const string[], return_str[], delim, start_index)
{
  new x=0;
  while(string[start_index] != EOS && string[start_index] != delim) {
      return_str[x] = string[start_index];
      x++;
      start_index++;
  }
  return_str[x] = EOS;
  if(string[start_index] == EOS) start_index = (-1);
  return start_index;
}
//---------------------------------------------
new gOOCDisabled = false;

stock GlobalOOCMessage(playerid, message[])
{
  new msg[256+1];
  new PlayerName[MAX_PLAYER_NAME+1];

  if(gOOCDisabled) {
    CmdErrorMessage(playerid, "The OOC channel is not enabled right now");
    return;
  }

  GetPlayerName(playerid, PlayerName, sizeof(PlayerName));
  format(msg, 256, "(( %s: %s ))", PlayerName, message);

  for(new i = 0; i < MAX_PLAYERS; i++) { // for every player
    if(IsPlayerConnected(i)) { // Todo: check if player accepts occ
        PlayerMessage(i, OOC_COLOR, msg);
    }
  }
}

//---------------------------------------------

stock ToggleOOC(playerid)
{
  if(IsPlayerAdmin(playerid)) {
      // toggle it
      if(gOOCDisabled) gOOCDisabled = false;
    else gOOCDisabled = true;

      if(!gOOCDisabled) {
          GlobalMessage(GENERAL_COLOR, "{D0D0D0}[ooc] channel is {80CC80}enabled");
    } else {
        GlobalMessage(GENERAL_COLOR, "{D0D0D0}[ooc] channel is {CC8080}disabled");
    }
  } else {
      CmdErrorMessage(playerid, "Your admin level isn't high enough to change this");
  }
}

//---------------------------------------------

stock ProcessLocalOOC(playerid, message[])
{
  new new_message[256+1];
  new PlayerName[MAX_PLAYER_NAME+1];
  GetPlayerName(playerid, PlayerName, sizeof(PlayerName));
  format(new_message, 256, "%s (( %s ))", PlayerName, message);
  LocalMessage(TALK_DISTANCE, playerid, LOCAL_TALK_COLOR, new_message);
}

//---------------------------------------------

stock ProcessMegaphone(playerid, message[])
{
  // Todo: add permissions on megaphone usage
    new new_message[256+1];
  //new PlayerName[MAX_PLAYER_NAME+1];
  //GetPlayerName(playerid, PlayerName, sizeof(PlayerName));
  format(new_message, 256, "%s [MEGAPHONE] %s", GetRPName(playerid), message);
  LocalMessage(MEGAPHONE_DISTANCE, playerid, MEGAPHONE_COLOR, new_message, 1);
}

//---------------------------------------------

stock ProcessWhisper(playerid, toplayerid, message[])
{
  new PlayerName[MAX_PLAYER_NAME+1];
  new ToPlayerName[MAX_PLAYER_NAME+1];
  new PmMessage[256+1];
  GetPlayerName(playerid,PlayerName,sizeof(PlayerName));
  GetPlayerName(toplayerid,ToPlayerName,sizeof(ToPlayerName));
  format(PmMessage, sizeof(PmMessage), ">> Anda Mengirim PM %s(%d): %s", ToPlayerName, toplayerid, message);
  PlayerMessage(playerid, WHISPER_COLOR, PmMessage);
  format(PmMessage, sizeof(PmMessage), "** Anda di PM %s(%d): %s", PlayerName, playerid, message);
  PlayerMessage(toplayerid, WHISPER_COLOR, PmMessage);
  PlayerPlaySound(toplayerid, 1085, 0.0, 0.0, 0.0);
}


public HilangkanPreviewBoombox(playerid)
{
  TextDrawHideForPlayer(playerid, Text:PerlihatkanBoombox);
}


public KembalikanMobilPedagangMakanan()
{
  SetVehiclePos(MobilPedagangMakanan,1550.1057,-2361.8955,13.5808);
  SetVehiclePos(MobilEmergencyAmbulance, -1707.3444,897.0047,24.7422);
  SetActorPos(susterdiresepsionis, -26.2559,153.6491,999.0569);
  DestroyDynamic3DTextLabel(ChatPedagangMenjualKeliling);
}
//---------------------------------------------


stock GivePlayerMoneyEx(playerid, money, description[]="None", bool:save=true, bool:game_text=true)
{
  if(money < 0 && GetPlayerMoneyEx(playerid) < money) return -1;

  new fmt_str[185];

  AddPlayerData(playerid, pMoney, +, money);
  GivePlayerMoney(playerid, money);

  /*
  format(fmt_str, sizeof fmt_str, "INSERT INTO money_log (uid,uip,time,money,description) VALUES (%d,'%s',%d,%d,'%s')", GetPlayerAccountID(playerid), GetPlayerIpEx(playerid), gettime(), money, description);
  mysql_query(MySQL:g_Sql, fmt_str, false);

  if(save) save = false;

  format(fmt_str, sizeof fmt_str, "UPDATE accounts SET money=%d WHERE id=%d LIMIT 1", GetPlayerMoneyEx(playerid), GetPlayerAccountID(playerid));
  mysql_query(MySQL:g_Sql, fmt_str, false);
  */

  if(game_text)
  {
    format(fmt_str, sizeof fmt_str, "%s$%d", money < 0 ? ("~r~") : ("~g~+"), money);
    GameTextForPlayer(playerid, fmt_str, 4000, 1);
  }

  return 1;
}



//-------------------------------------------------
stock CreateExplosionEx(Float:X, Float:Y, Float:Z, type, Float:Radius, virtualworld)
{
  new x;
  while(x != MAX_PLAYERS) {
    if(IsPlayerConnected(x)) {
        if(virtualworld == -1 || virtualworld == GetPlayerVirtualWorld(x)) {
        CreateExplosionForPlayer(x, X, Y, Z, type, Radius);
      }
    }
    x++;
  }
}



CMD:s(playerid, params[])
{
		
				SEM(playerid, ""COL_RED"DEBUG: "COL_WHITE"Sir you are succes chat shouts");
				ShoutsMessage(SHOUT_DISTANCE, playerid, "", params);

				return 1;

			
			


  
}

CMD:l(playerid, params[])
{
		
				SEM(playerid, ""COL_RED"DEBUG: "COL_WHITE"Sir you are succes chat shouts");
				WhisperMessage(SHOUT_DISTANCE, playerid, "", params);

				return 1;

			
			


  
}

CMD:low(playerid, params[])
{
		
				SEM(playerid, ""COL_RED"DEBUG: "COL_WHITE"Sir you are succes chat shouts");
				WhisperMessage(SHOUT_DISTANCE, playerid, "", params);

				return 1;

			
			


  
}




CMD:c(playerid, params[])
{
			if(IsPlayerInAnyVehicle(playerid))
			{
				SEM(playerid, ""COL_LIGHTBLUE"DEBUG: "COL_WHITE"Sir you are succes talking in vehicle");
				InCarMessage(LOW_DISTANCE, playerid, "", params);

				return 1;

			}
			


  
}

public OnPlayerText(playerid, text[])
{
  //new AdaSays[90];
 // format(AdaSays, sizeof(AdaSays), ""COL_WHITE"Says: %s", text);
 // ProcessChatText(playerid, AdaSays);
  TalkMessage(ACTION_DISTANCE, playerid, "", text);
 //SEM(playerid, ""COL_RED"DEBUG: "COL_WHITE"message text example");
 //new string[228];
  //format(string, sizeof(string), "%s says: %s", GetRPName(playerid), text);
  //CloseMessage(playerid, COLOR_WHITE, string);
  //format(string, sizeof(string), "%s says: %s", GetRPName(playerid), text);
 //Log("logs/chatlogplayer.log", string);
  //format(string,sizeof(string),"%s", text);
  //SetPlayerChatBubble( playerid, string, 0xFFFFFFFF,20.0,5500);

  return 0;
  
}
