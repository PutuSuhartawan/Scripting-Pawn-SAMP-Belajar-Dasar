

stock SendPlayerOffer(playerid, to_player, type, value_1 = 0, value_2 = 0)
{
	if(GetPlayerOfferInfo(playerid, O_OUTCOMIG_PLAYER) == INVALID_PLAYER_ID)
	{
		new fmt_str[144];
		switch(type)
		{
			case OFFER_TYPE_HANDSHAKE:
			{
				format(fmt_str, sizeof fmt_str, "{56A4E4}�{DB881A}| {FFFFFF}Pemain %s menawarkan untuk menjabat tangan Anda", GetPlayerNameEx(playerid));
				Dialog(to_player, DIALOG_OFFER_TOPLAYER, DIALOG_STYLE_MSGBOX, "Tawarkan", fmt_str, "Menyetujui", "Tolak");

				format(fmt_str, sizeof fmt_str, "Anda menyarankan kepada pemain {ffff00}%s {1E90FF}berjabat tangan", GetPlayerNameEx(to_player));
				SendClientMessage(playerid, 0x1E90FFFF, fmt_str);
			}
			case OFFER_TYPE_SELL_FUEL_ST:
			{
				format(fmt_str, sizeof fmt_str, "{56A4E4}�{DB881A}| {FFFFFF}%s mengundang Anda untuk membeli pompa bensin �%d \"%s\" untuk harga $%d", GetPlayerNameEx(playerid), value_1, GetFuelStationData(value_1, FS_NAME), value_2);
				Dialog(to_player, DIALOG_OFFER_TOPLAYER, DIALOG_STYLE_MSGBOX, "Tawarkan", fmt_str, "Menyetujui", "Tolak");

				format(fmt_str, sizeof fmt_str, "Anda menyarankan kepada pemain {ffff00}%s {1E90FF}beli pompa bensin Anda \"%s\" untuk $%d", GetPlayerNameEx(to_player), GetFuelStationData(value_1, FS_NAME), value_2);
				SendClientMessage(playerid, 0x1E90FFFF, fmt_str);
			}
			case OFFER_TYPE_FILL_CAR:
			{
				format(fmt_str, sizeof fmt_str, "{56A4E4}�{DB881A}| {FFFFFF}%s menawarkan untuk mengisi bahan bakar transportasi Anda %d aku untuk $%d", GetPlayerNameEx(playerid), value_1, value_2);
				Dialog(to_player, DIALOG_OFFER_TOPLAYER, DIALOG_STYLE_MSGBOX, "Tawarkan", fmt_str, "Menyetujui", "Tolak");

				format(fmt_str, sizeof fmt_str, "Anda menyarankan kepada pemain {ffff00}%s {1E90FF}pengisian bahan bakar kendaraan %d aku untuk $%d", GetPlayerNameEx(to_player), value_1, value_2);
				SendClientMessage(playerid, 0x1E90FFFF, fmt_str);
			}
			case OFFER_TYPE_REPAIR_CAR:
			{
				format(fmt_str, sizeof fmt_str, "{56A4E4}�{DB881A}| {FFFFFF}%s menawarkan untuk memperbaiki transportasi Anda $%d", GetPlayerNameEx(playerid), value_1);
				Dialog(to_player, DIALOG_OFFER_TOPLAYER, DIALOG_STYLE_MSGBOX, "Tawarkan", fmt_str, "Menyetujui", "Tolak");

				format(fmt_str, sizeof fmt_str, "Anda menyarankan kepada pemain {ffff00}%s {1E90FF}melakukan perbaikan kendaraan $%d", GetPlayerNameEx(to_player), value_1);
				SendClientMessage(playerid, 0x1E90FFFF, fmt_str);
			}
			case OFFER_TYPE_REPAINT_CAR:
			{
				format(fmt_str, sizeof fmt_str, "{56A4E4}�{DB881A}| {FFFFFF}%s menawarkan untuk mewarnai transportasi Anda $%d", GetPlayerNameEx(playerid), value_1);
				Dialog(to_player, DIALOG_OFFER_TOPLAYER, DIALOG_STYLE_MSGBOX, "Tawarkan", fmt_str, "Menyetujui", "Tolak");

				format(fmt_str, sizeof fmt_str, "Anda menyarankan kepada pemain {ffff00}%s {1E90FF}melakukan perbaikan kendaraan $%d", GetPlayerNameEx(to_player), value_1);
				SendClientMessage(playerid, 0x1E90FFFF, fmt_str);
			}
			case OFFER_TYPE_NITRO_CAR:
			{
				format(fmt_str, sizeof fmt_str, "{56A4E4}�{DB881A}| {FFFFFF}%s menawarkan untuk menambah transportasi Anda $%d", GetPlayerNameEx(playerid), value_1);
				Dialog(to_player, DIALOG_OFFER_TOPLAYER, DIALOG_STYLE_MSGBOX, "Tawarkan", fmt_str, "Menyetujui", "Tolak");

				format(fmt_str, sizeof fmt_str, "Anda menyarankan kepada pemain {ffff00}%s {1E90FF}melakukan perbaikan kendaraan $%d", GetPlayerNameEx(to_player), value_1);
				SendClientMessage(playerid, 0x1E90FFFF, fmt_str);
			}
			case OFFER_TYPE_SELL_BUSINESS:
			{
				format(fmt_str, sizeof fmt_str, "{56A4E4}�{DB881A}| {FFFFFF}%s mengundang Anda untuk membeli bisnis �%d \"%s\" untuk harga $%d", GetPlayerNameEx(playerid), value_1, GetBusinessData(value_1, B_NAME), value_2);
				Dialog(to_player, DIALOG_OFFER_TOPLAYER, DIALOG_STYLE_MSGBOX, "Tawarkan", fmt_str, "Menyetujui", "Tolak");

				format(fmt_str, sizeof fmt_str, "Anda menyarankan kepada pemain {ffff00}%s {1E90FF}beli bisnis Anda \"%s\" �� $%d", GetPlayerNameEx(to_player), GetBusinessData(value_1, B_NAME), value_2);
				SendClientMessage(playerid, 0x1E90FFFF, fmt_str);
			}
			case OFFER_TYPE_BUSINESS_MANAGER:
			{
				format(fmt_str, sizeof fmt_str, "{56A4E4}�{DB881A}| {FFFFFF}%s mengundang Anda untuk menjadi karyawan perusahaannya (%s)", GetPlayerNameEx(playerid), GetBusinessData(value_1, B_NAME));
				Dialog(to_player, DIALOG_OFFER_TOPLAYER, DIALOG_STYLE_MSGBOX, "Tawarkan", fmt_str, "Menyetujui", "Tolak");

				format(fmt_str, sizeof fmt_str, "%s menerima tawaran untuk menjadi karyawan Anda", GetPlayerNameEx(to_player));
				SendClientMessage(playerid, 0x1E90FFFF, fmt_str);
			}
			case OFFER_TYPE_SELL_HOME:
			{
				format(fmt_str, sizeof fmt_str, "{56A4E4}�{DB881A}| {FFFFFF}%s mengundang Anda untuk membeli rumah �%d untuk harga $%d", GetPlayerNameEx(playerid), value_1, value_2);
				Dialog(to_player, DIALOG_OFFER_TOPLAYER, DIALOG_STYLE_MSGBOX, "Tawarkan", fmt_str, "Menyetujui", "Tolak");

				format(fmt_str, sizeof fmt_str, "Anda menyarankan kepada pemain {ffff00}%s {1E90FF}beli rumah Anda untuk harganya $%d", GetPlayerNameEx(to_player), value_2);
				SendClientMessage(playerid, 0x1E90FFFF, fmt_str);
			}
			case OFFER_TYPE_HOME_RENT_ROOM:
			{
				format(fmt_str, sizeof fmt_str, "{56A4E4}�{DB881A}| {FFFFFF}%s mengundang Anda untuk menetap di rumah Anda �%d", GetPlayerNameEx(playerid), value_1);
				Dialog(to_player, DIALOG_OFFER_TOPLAYER, DIALOG_STYLE_MSGBOX, "Tawarkan", fmt_str, "Menyetujui", "Tolak");

				format(fmt_str, sizeof fmt_str, "Anda menyarankan kepada pemain {ffff00}%s {1E90FF}menetap di rumah Anda �%d", GetPlayerNameEx(to_player), value_1);
				SendClientMessage(playerid, 0x1E90FFFF, fmt_str);
			}
			case OFFER_TYPE_SELL_OWNABLE_CAR:
			{
				new model_id = GetVehicleData(value_2, V_MODELID);

				format(fmt_str, sizeof fmt_str, "{56A4E4}�{DB881A}| {FFFFFF}%s menawarkan Anda untuk membeli transportasi {33FF66}\"%s\" {1E90FF}untuk harga $%d", GetPlayerNameEx(playerid), GetVehicleInfo(model_id-400, VI_NAME), value_1);
				Dialog(to_player, DIALOG_OFFER_TOPLAYER, DIALOG_STYLE_MSGBOX, "Tawarkan", fmt_str, "Menyetujui", "Tolak");

				format(fmt_str, sizeof fmt_str, "Anda menyarankan kepada pemain {ffff00}%s {1E90FF}beli transportasi anda \"%s\" untuk $%d", GetPlayerNameEx(to_player), GetVehicleInfo(model_id-400, VI_NAME), value_1);
				SendClientMessage(playerid, 0x1E90FFFF, fmt_str);
			}
			case OFFER_TYPE_INVITE:
			{
				format(fmt_str, sizeof fmt_str, "{56A4E4}�{DB881A}| {FFFFFF}%s mengundang Anda untuk bergabung dengan organisasi \"%s\"", GetPlayerNameEx(playerid), GetPlayerTeamName(playerid));

				Dialog(to_player, DIALOG_OFFER_TOPLAYER, DIALOG_STYLE_MSGBOX, "Tawarkan", fmt_str, "Menyetujui", "Tolak");

				format(fmt_str, sizeof fmt_str, "Anda menyarankan kepada pemain {ffff00}%s {1E90FF}bergabung dengan suatu organisasi \"%s\"", GetPlayerNameEx(to_player), GetPlayerTeamName(playerid));
				SendClientMessage(playerid, 0x1E90FFFF, fmt_str);
			}
			case OFFER_TYPE_FINVITE:
			{
				format(fmt_str, sizeof fmt_str, "{56A4E4}�{DB881A}| {FFFFFF}%s mengundang Anda untuk bergabung dengan keluarga \"%s\"", GetPlayerNameEx(playerid), GetFamilyData(GetPlayerData(playerid, P_FAMILY), F_NAME));

				Dialog(to_player, DIALOG_OFFER_TOPLAYER, DIALOG_STYLE_MSGBOX, "Tawarkan", fmt_str, "Menyetujui", "Tolak");

				format(fmt_str, sizeof fmt_str, "Anda menyarankan kepada pemain {ffff00}%s {1E90FF}bergabung dengan keluarga \"%s\"", GetPlayerNameEx(to_player), GetFamilyData(GetPlayerData(playerid, P_FAMILY), F_NAME));
				SendClientMessage(playerid, 0x1E90FFFF, fmt_str);
			}
			case OFFER_TYPE_MEDHELP:
			{
				format(fmt_str, sizeof fmt_str, "{56A4E4}�{DB881A}| {FFFFFF}%s mengundang Anda untuk mengikuti kursus perawatan berbayar $%d", GetPlayerNameEx(playerid), value_1);
				Dialog(to_player, DIALOG_OFFER_TOPLAYER, DIALOG_STYLE_MSGBOX, "Tawarkan", fmt_str, "Menyetujui", "Tolak");

				format(fmt_str, sizeof fmt_str, "Anda menyarankan kepada pemain {ffff00}%s {1E90FF}ikuti kursus perawatan berbayar untuk Anda $%d", GetPlayerNameEx(to_player), value_1);
				SendClientMessage(playerid, 0x1E90FFFF, fmt_str);
			}
			case OFFER_TYPE_DRAG:
			{
				format(fmt_str, sizeof fmt_str, "{56A4E4}�{DB881A}| {FFFFFF}Pemain %s menawarkan untuk menggenong Anda", GetPlayerNameEx(playerid));
				Dialog(to_player, DIALOG_OFFER_TOPLAYER, DIALOG_STYLE_MSGBOX, "Tawarkan", fmt_str, "Menyetujui", "Tolak");

				format(fmt_str, sizeof fmt_str, "Anda menyarankan kepada pemain {ffff00}%s {1E90FF}Mengendong", GetPlayerNameEx(to_player));
				SendClientMessage(playerid, 0x1E90FFFF, fmt_str);
			}
			case OFFER_TYPE_HEAL:
			{
				format(fmt_str, sizeof fmt_str, "{56A4E4}�{DB881A}| {FFFFFF}%s mengundang Anda untuk menjalani perawatan $%d", GetPlayerNameEx(playerid), value_1);
				Dialog(to_player, DIALOG_OFFER_TOPLAYER, DIALOG_STYLE_MSGBOX, "Tawarkan", fmt_str, "Menyetujui", "Tolak");

				format(fmt_str, sizeof fmt_str, "Anda menyarankan kepada pemain {ffff00}%s {1E90FF}dapatkan perawatan Anda untuk $%d", GetPlayerNameEx(to_player), value_1);
				SendClientMessage(playerid, 0x1E90FFFF, fmt_str);
			}
			case OFFER_TYPE_CHANGE_SEX:
			{
				format(fmt_str, sizeof fmt_str, "{56A4E4}�{DB881A}| {FFFFFF}%s menawarkan untuk melakukan operasi ganti kelamin untuk Anda $%d", GetPlayerNameEx(playerid), value_1);
				Dialog(to_player, DIALOG_OFFER_TOPLAYER, DIALOG_STYLE_MSGBOX, "Tawarkan", fmt_str, "Menyetujui", "Tolak");

				format(fmt_str, sizeof fmt_str, "Anda menyarankan kepada pemain {ffff00}%s {1E90FF}operasi penggantian kelamin untuk $%d", GetPlayerNameEx(to_player), value_1);
				SendClientMessage(playerid, 0x1E90FFFF, fmt_str);
			}
			case OFFER_TYPE_SHOW_SKILL:
			{
				format(fmt_str, sizeof fmt_str, "{56A4E4}�{DB881A}| {FFFFFF}%s ingin menunjukkan keterampilan senjatanya", GetPlayerNameEx(playerid));
				Dialog(to_player, DIALOG_OFFER_TOPLAYER, DIALOG_STYLE_MSGBOX, "Tawarkan", fmt_str, "Menyetujui", "Tolak");

				format(fmt_str, sizeof fmt_str, "Anda menyarankan kepada pemain {ffff00}%s {1E90FF}lihat kemampuan senjatamu", GetPlayerNameEx(to_player));
				SendClientMessage(playerid, 0x1E90FFFF, fmt_str);
			}
			case OFFER_TYPE_CASINO_DICE:
			{
				format(fmt_str, sizeof fmt_str, "{56A4E4}�{DB881A}| {FFFFFF}%s ingin bermain dadu dengan Anda. Beri peringkat: $%d", GetPlayerNameEx(playerid), value_1);
				Dialog(to_player, DIALOG_OFFER_TOPLAYER, DIALOG_STYLE_MSGBOX, "Tawarkan", fmt_str, "Menyetujui", "Tolak");

				format(fmt_str, sizeof fmt_str, "Anda menyarankan kepada pemain {ffff00}%s {1E90FF}mainkan dadu Beri peringkat: $%d", GetPlayerNameEx(to_player), value_1);
				SendClientMessage(playerid, 0x1E90FFFF, fmt_str);
			}
			case OFFER_TYPE_GETHERE:
			{
				format(fmt_str, sizeof fmt_str, "{56A4E4}�{DB881A}| {FFFFFF}%s ingin teleport kamu ke dirinya sendiri", GetPlayerNameEx(playerid));
				Dialog(to_player, DIALOG_OFFER_TOPLAYER, DIALOG_STYLE_MSGBOX, "Tawarkan", fmt_str, "Menyetujui", "Tolak");

				format(fmt_str, sizeof fmt_str, "Anda meminta dari %s izin untuk mengirimnya kepada Anda", GetPlayerNameEx(to_player));
				SendClientMessage(playerid, 0x1E90FFFF, fmt_str);
			}
			case OFFER_TYPE_GIVE_CAR_KEY:
			{
				format(fmt_str, sizeof fmt_str, "{56A4E4}�{DB881A}| {FFFFFF}%s ingin memberi Anda kunci transpotra-nya", GetPlayerNameEx(playerid));
				Dialog(to_player, DIALOG_OFFER_TOPLAYER, DIALOG_STYLE_MSGBOX, "Tawarkan", fmt_str, "Menyetujui", "Tolak");

				format(fmt_str, sizeof fmt_str, "Anda menyarankan kepada pemain {ffff00}%s {1E90FF}ambil kunci transportasi Anda", GetPlayerNameEx(to_player));
				SendClientMessage(playerid, 0x1E90FFFF, fmt_str);
			}
			case OFFER_TYPE_GIVE_MIC:
			{
				format(fmt_str, sizeof fmt_str, "{56A4E4}�{DB881A}| {FFFFFF}%s mengundang Anda untuk terhubung ke radio", GetPlayerNameEx(playerid));
				Dialog(to_player, DIALOG_OFFER_TOPLAYER, DIALOG_STYLE_MSGBOX, "Tawarkan", fmt_str, "Menyetujui", "Tolak");

				format(fmt_str, sizeof fmt_str, "Anda menyarankan kepada pemain {ffff00}%s {1E90FF}terhubung ke radio", GetPlayerNameEx(to_player));
				SendClientMessage(playerid, 0x1E90FFFF, fmt_str);
			}
  			case OFFER_TYPE_GIVE_LIC:
			{
				new lic_names[3][34] = {"Air", "Senjata", "Penerbangan"};

				format(fmt_str, sizeof fmt_str, "{56A4E4}�{DB881A}| {FFFFFF}%s menawarkan Anda untuk membeli lisensi %s untuk $%d",
				GetPlayerNameEx(playerid), lic_names[value_1 - 1], value_2);

				Dialog(to_player, DIALOG_OFFER_TOPLAYER, DIALOG_STYLE_MSGBOX, "Tawarkan", fmt_str, "Menyetujui", "Tolak");

				format(fmt_str, sizeof fmt_str, "Anda menyarankan kepada pemain {ffff00}%s {1E90FF}membeli dari Anda lisensi untuk %s untuk $%d",
				GetPlayerNameEx(to_player), lic_names[value_1 - 1], value_2);

				SendClientMessage(playerid, 0x1E90FFFF, fmt_str);
			}
			case OFFER_TYPE_JAIL_FREE:
			{
				format(fmt_str, sizeof fmt_str, "{56A4E4}�{DB881A}| {FFFFFF}%s mengundang Anda untuk meninjau kasus Anda $%d", GetPlayerNameEx(playerid), value_1);
				Dialog(to_player, DIALOG_OFFER_TOPLAYER, DIALOG_STYLE_MSGBOX, "Tawarkan", fmt_str, "Menyetujui", "Tolak");

				format(fmt_str, sizeof fmt_str, "Anda menyarankan kepada pemain {ffff00}%s {1E90FF}������������ ��� ���� �� $%d", GetPlayerNameEx(to_player), value_1);
				SendClientMessage(playerid, 0x1E90FFFF, fmt_str);
			}
			case OFFER_TYPE_SELL_SKIN:
			{
				format(fmt_str, sizeof fmt_str, "{56A4E4}�{DB881A}| {FFFFFF}%s mengundang Anda untuk membeli pakaiannya(ID %d) untuk harga $%d", GetPlayerNameEx(playerid), value_1, value_2);
				Dialog(to_player, DIALOG_OFFER_TOPLAYER, DIALOG_STYLE_MSGBOX, "Tawarkan", fmt_str, "Menyetujui", "Tolak");

				format(fmt_str, sizeof fmt_str, "Anda menyarankan kepada pemain {ffff00}%s {1E90FF}beli pakaian Anda dengan harga $%d", GetPlayerNameEx(to_player), value_2);
				SendClientMessage(playerid, 0x1E90FFFF, fmt_str);
			}
			case OFFER_TYPE_SELL_DRUGS:
			{
			    format(fmt_str, sizeof fmt_str, "{56A4E4}�{DB881A}| {FFFFFF}%s mengundang Anda untuk membeli %d gram obat untuk harganya $%d", GetPlayerNameEx(playerid), value_1, value_2);
				Dialog(to_player, DIALOG_OFFER_TOPLAYER, DIALOG_STYLE_MSGBOX, "Tawarkan", fmt_str, "Menyetujui", "Tolak");

				format(fmt_str, sizeof fmt_str, "Anda menyarankan kepada pemain {ffff00}%s {1E90FF}untuk membeli %d obat untuk   $%d", GetPlayerNameEx(to_player),value_1, value_2);
				SendClientMessage(playerid, 0x1E90FFFF, fmt_str);
			}
			/*
			case PROPOSITION_TYPE_SELL_GOODS:
			{
				new marketid = player_use_market[playerid];

				format(fmt_str, sizeof fmt_str, "%s mengundang Anda untuk membeli %s untuk harga $%d", GetPlayerNameEx(playerid), market[marketid][m_name], value_1);
				SendClientMessage(to_player, 0x1E90FFFF, fmt_str);

				SendClientMessage(to_player, -1, "Klik {32a44b}Y {FFFFFF}untuk melakukan pembelian atau {CECECE}N {FFFFFF}untuk penolakan");

				format(fmt_str, sizeof fmt_str, "Anda menyarankan kepada pemain {ffff00}%s {1E90FF}untuk membeli %s untuk harga $%d", GetPlayerNameEx(to_player), market[marketid][m_name], value_1);
				SendClientMessage(playerid, 0x1E90FFFF, fmt_str);
			}
			*/
			default: return 1;
		}

		SetPlayerOfferInfo(playerid, O_OUTCOMIG_PLAYER, to_player);

		SetPlayerOfferInfo(to_player, O_INCOMING_PLAYER, playerid);
		SetPlayerOfferInfo(to_player, O_INCOMING_TYPE, type);

		SetPlayerOfferValue(to_player, 0, value_1);
		SetPlayerOfferValue(to_player, 1, value_2);
	}
	else SendClientMessage(playerid, 0xFFFFFFFF, "Gunakan {FF9900}/cancel {FFFFFF}untuk menarik kalimat sebelumnya");

	return 1;
}


SetPlayerInHouse(playerid,Houseid){
PIH1[playerid] = Houseid;
SetPlayerPos(playerid,HIX1[Houseid],HIY1[Houseid],HIZ1[Houseid]);
SetPlayerInterior(playerid,HII1[Houseid]);
ShowMenuForPlayer(Hexit1,playerid);
}
SetHouseInfo(Houseid,info[],value[]){
new str[100];
format(str,100,"house%d",Houseid);
Savepropertt(str,info,value);
}

GetHouseInfo(Houseid,info[],value[]){
new str[100];
new ret;
format(str,100,"house%d",Houseid);
ret = Loadpropertt(str,info,value);
return ret;
}
SetPlayerOutHouse(playerid,Houseid){
PIH1[playerid] = 0;
SetPlayerPos(playerid,HOX1[Houseid],HOY1[Houseid],HOZ1[Houseid]);
SetPlayerInterior(playerid,0);

}

IsPlayerAllowedInHouse(playerid,Houseid){
new str1[256],str2[256];
GetPlayerName(playerid,str2,256);
GetHouseInfo(Houseid,"Owner",str1);
if (strcmp(str1,str2)==0){
return 1;
}
GetHouseInfo(Houseid,"Tenent1",str1);
if (strcmp(str1,str2)==0){
return 1;
}
GetHouseInfo(Houseid,"Tenent2",str1);
if (strcmp(str1,str2)==0){
return 1;
}
GetHouseInfo(Houseid,"Tenent3",str1);
if (strcmp(str1,str2)==0){
return 1;
}
GetHouseInfo(Houseid,"Tenent4",str1);
if (strcmp(str1,str2)==0){
return 1;
}
GetHouseInfo(Houseid,"Tenent5",str1);
if (strcmp(str1,str2)==0){
return 1;
}
else{
return 0;
}}

AddStaticHouse(Float:x,Float:y,Float:z,Float:ix,Float:iy,Float:iz,ii){
//print("addstaticHouse");
hidd++;
HP1[CreatePickup(1273,2,x,y,z)] = hidd;
HIX1[hidd] = ix;
HIY1[hidd] = iy;
HIZ1[hidd] = iz;
HII1[hidd] = ii;
HOX1[hidd] = x;
HOY1[hidd] = y;
HOZ1[hidd] = z;
new str[256];
format(str,256,"house%d.zip",hidd);
if (!fexist(str)){
new File:House = fopen(str,io_write);
fclose(House);
SetHouseInfo(hidd,"Owner","none");
SetHouseInfo(hidd,"Rent","0");
SetHouseInfo(hidd,"Cost","50000");
SetHouseInfo(hidd,"Tenent1","none");
SetHouseInfo(hidd,"Tenent2","none");
SetHouseInfo(hidd,"Tenent3","none");
SetHouseInfo(hidd,"Tenent4","none");
SetHouseInfo(hidd,"Tenent5","none");
}
return hidd;
}

enum
{
	LOG_TYPE_ADMIN_CHAT = 1,
	LOG_TYPE_ADMIN_ANSWER,
	LOG_TYPE_ADMIN_ACTION,
	LOG_TYPE_SET_ADMIN,
	LOG_TYPE_SET_LEADER,
	LOG_TYPE_SMS_CHAT,
	LOG_TYPE_OOC_CHAT,
	LOG_TYPE_REPORT,
	LOG_TYPE_FRACTION,
	LOG_TYPE_SUPERADMIN_ACTION,
	LOG_TYPE_CLEAR_BOARD
}



stock SendLog(playerid = INVALID_PLAYER_ID, type, desc[])
{
	new fmt_log[512];

	mysql_format(mysql, fmt_log, sizeof fmt_log, "INSERT INTO action_log (acc_id, uip, type, description, time) VALUES (%d, '%s', %d, '%s', %d)",
	GetPlayerAccountID(playerid), GetPlayerIpEx(playerid), type, desc, gettime());

	mysql_query(mysql, fmt_log, false);

	return 1;
}


// ------------------------------------------
DCMD:o(user, channel, playerid, params[])
{
 	new String[10000];
	if(isnull(params)) return DCC_SendChannelMessage(channel, "KEGUNAAN: (/o)oc [ooc chat]");
	DCC_SendChannelMessage(channel, params);
	if(GetPlayerLevel(playerid))
	{
		format(String, sizeof(String), "(( {00FFFF}%s %s: {FFFFFF}%s ))", ORANK(playerid), GetPlayerNameEx(playerid), params);
	}
	OOCOff(COLOR_WHITE, String);
	return 1;
}

ALT:gethere:getp;
ALT:gethere:getplayer;

CMD:gethere(playerid, params[])
{
	if(GetPlayerAdminEx(playerid) < 1) return 1;

	extract params -> new to_player; else return SendClientMessage(playerid, 0xCECECEFF, "Gunakan: /gethere [id pemain]");

	if(!IsPlayerConnected(to_player) || !IsPlayerLogged(to_player))
		return SendClientMessage(playerid, 0xCECECEFF, "Tidak ada pemain seperti itu");

	if(GetPlayerAdminEx(to_player) > GetPlayerAdminEx(playerid))
	{
		SendClientMessage(playerid, 0x66CC33FF, "Anda mencoba untuk mengirim teleport ke diri Anda sendiri seorang administrator dari peringkat yang lebih tinggi, ia harus mengkonfirmasi tindakan Anda");
		SendPlayerOffer(playerid, to_player, OFFER_TYPE_GETHERE);
	}
	else
	{
		new Float: x, Float: y, Float: z;
		GetPlayerPos(playerid, x, y, z);
		SetPlayerPosEx(to_player, x + 1, y + 1, z, 0.0, GetPlayerInterior(playerid), GetPlayerVirtualWorld(playerid), false);

		SetPlayerInHouse(to_player, GetPlayerInHouse(playerid));
		SetPlayerInBiz(to_player, GetPlayerInBiz(playerid));

		new fmt_msg[105];
		format(fmt_msg, sizeof fmt_msg, "%s %s teleport kamu ke dirimu sendiri", admins_rank_name[GetPlayerAdminEx(playerid)], GetPlayerNameEx(playerid));
		SendClientMessage(to_player, -1, fmt_msg);

		format(fmt_msg, sizeof fmt_msg, "Anda berteleportasi %s untuk diriku sendiri", GetPlayerNameEx(to_player));
		SendClientMessage(playerid, -1, fmt_msg);

		if(GetPlayerAdminEx(playerid) <= 5)
		{
			format(fmt_msg, sizeof fmt_msg, "[A] %s %s[%d] teleport ke dirinya sendiri %s[%d]", admins_rank_name[GetPlayerAdminEx(playerid)], GetPlayerNameEx(playerid), playerid, GetPlayerNameEx(to_player), to_player);
			SendMessageToAdmins(fmt_msg, 0xCECECEFF);
		}

		format(fmt_msg, sizeof fmt_msg, "Teleport ke diriku sendiri %s[acc:%d]", GetPlayerNameEx(to_player), GetPlayerAccountID(to_player));
		SendLog(playerid, LOG_TYPE_ADMIN_ACTION, fmt_msg);
	}

	return 1;
}
