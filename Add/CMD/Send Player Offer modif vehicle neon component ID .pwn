
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
if(last_dialog == dialogid)
	{
		switch(dialogid)
		{
	case DIALOG_OFFER_TOPLAYER:
			{
			    if(!response) return cmd::no(playerid, "");
			    else if(response) return cmd::yes(playerid, "");
			}
      
      }
     }


stock SendPlayerOffer(playerid, to_player, type, value_1 = 0, value_2 = 0)
{
	if(GetPlayerOfferInfo(playerid, O_OUTCOMIG_PLAYER) == INVALID_PLAYER_ID)
	{
		new fmt_str[144];
		switch(type)
		{
	case OFFER_TYPE_NITRO_CAR:
			{
				format(fmt_str, sizeof fmt_str, "{FFFFFF}%s menawarkan untuk menambah transportasi Anda $%d", GetPlayerNameEx(playerid), value_1);
				Dialog(to_player, DIALOG_OFFER_TOPLAYER, DIALOG_STYLE_MSGBOX, "Tawarkan", fmt_str, "Menyetujui", "Tolak");

				format(fmt_str, sizeof fmt_str, "Anda menyarankan kepada pemain {ffff00}%s {1E90FF}melakukan perbaikan kendaraan $%d", GetPlayerNameEx(to_player), value_1);
				SendClientMessage(playerid, 0x1E90FFFF, fmt_str);
			}
      
  }
enum // jenis penawaran
{
	OFFER_TYPE_NONE = -1,
	OFFER_TYPE_HANDSHAKE, 		// salam
	OFFER_TYPE_SELL_FUEL_ST, 	// penjualan pompa bensin
	OFFER_TYPE_FILL_CAR,		// mobil pengisian bahan bakar (montir)
	OFFER_TYPE_REPAIR_CAR,		// perbaikan mobil (montir)
	OFFER_TYPE_REPAINT_CAR,
	OFFER_TYPE_NITRO_CAR,
	OFFER_TYPE_REMOVE_CAR,
	OFFER_TYPE_SELL_BUSINESS,	// penjualan bisnis
	OFFER_TYPE_BUSINESS_MANAGER,// undang seorang karyawan ke perusahaan Anda
	OFFER_TYPE_SELL_HOME,		// menjual rumah ke pemain
	OFFER_TYPE_HOME_RENT_ROOM,	// tawarkan untuk menetap di kamar rumah Anda
	OFFER_TYPE_SELL_OWNABLE_CAR,// jual kendaraan pribadi
	OFFER_TYPE_INVITE,			// menawarkan untuk bergabung dengan organisasi
	OFFER_TYPE_FINVITE,         // proposal untuk bergabung dengan keluarga
	OFFER_TYPE_MEDHELP,			// perawatan
	OFFER_TYPE_HEAL,			// perawatan ambulans
	OFFER_TYPE_CHANGE_SEX,		// perubahan gender
	OFFER_TYPE_SHOW_SKILL,		// lihat keterampilan senjata
	OFFER_TYPE_GIVE_CAR_KEY,	// berikan kunci transportasi pribadi
	OFFER_TYPE_CASINO_DICE,		// melempar dadu di kasino
	OFFER_TYPE_GETHERE,			// teleport ke dirimu admin peringkat yang lebih tinggi
	OFFER_TYPE_GIVE_MIC,		// akses radio
	OFFER_TYPE_GIVE_LIC,		// penjualan lisensi
	OFFER_TYPE_JAIL_FREE,		// dibebaskan dari penjara (untuk pengacara)
	OFFER_TYPE_SELL_SKIN,       // Jual skin ke pemain
	OFFER_TYPE_SELL_DRUGS,      //Jual ke pemain
};


CMD:modif(playerid, params[])
{
	new fmt_str[150];
    //if(GetPlayerAdminEx(playerid) < 3) return 1;
    SendClientMessage(playerid, 0xCECECEFF, "Gunakan: /modif [id pemain] [nomor component] [biaya]");
	if(GetPlayerTeamEx(playerid) != TEAM_MECHANIC)
		return SendClientMessage(playerid, 0xCECECEFF, "Anda bukan mekanik mobil");
	if(!IsPlayerInRangeOfPoint(playerid, 100.0, 1644.0008,-1028.5606,24.0855)) return SendClientMessage(playerid, 0xCECECEFF, "Anda harus di bengke meka");
	if(GetPlayerData(playerid, P_KUNCI_INGGRIS) == 0) return SendClientMessage(playerid,-1,"Kamu belum Mengambil Kunci Inggris");

	if(!strlen(params))
		return SendClientMessage(playerid, 0xCECECEFF, "Gunakan: /modif [id pemain] [nomor component] [biaya]");

	extract params -> new to_player ,componentnumber , nitro_price;
	if(!(1000 <= componentnumber <= 1193)) return SendClientMessage(playerid, 0xCECECEFF, "ID Component 1000 - 1193");
    

	AddVehicleComponent(GetNearestVehicleID(playerid, 7.0), componentnumber);

	AddPlayerData(to_player, P_MECHANIC_FILL_PAY, +, nitro_price);

	format(fmt_str, sizeof fmt_str, "Mekanik otomatis %s menambahkan nitro kendaraan transportasi Anda pada %d l", GetPlayerNameEx(to_player), componentnumber);
	SendClientMessage(playerid, 0x32a44bFF, fmt_str);

	format(fmt_str, sizeof fmt_str, "Anda menambah Nitro transportasi %s pada %d l", GetPlayerNameEx(playerid), componentnumber);
	SendClientMessage(to_player, 0x32a44bFF, fmt_str);
	if(!IsPlayerConnected(to_player))
		return SendClientMessage(playerid, 0xCECECEFF, "Tidak ada pemain seperti itu");

	if(!IsPlayerInRangeOfPlayer(playerid, to_player, 15.0))
		return SendClientMessage(playerid, 0xCECECEFF, "Pemainnya terlalu jauh");

	if(!IsPlayerDriver(to_player))
		return SendClientMessage(playerid, 0xCECECEFF, "Pelanggan harus mengemudi");


	if(!(1 <= nitro_price <= 25000))
		return SendClientMessage(playerid, 0xCECECEFF, "Biaya harus mencapai $ 25000");

	if(GetPlayerMoneyEx(to_player) < nitro_price)
		return SendClientMessage(playerid, 0xCECECEFF, "Klien tidak punya banyak uang");

	SendPlayerOffer(playerid, to_player, OFFER_TYPE_NITRO_CAR, componentnumber, nitro_price);
	return 1;
}
