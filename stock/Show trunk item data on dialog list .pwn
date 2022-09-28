
#define MAX_AFK_TIME 			(30) // waktu afk maksimum (dalam hitungan menit)
#define MAX_BANK_ACCOUNTS 		(8)	 // jumlah maksimum rekening bank
#define MAX_PHONE_BOOK_CONTACTS (20) // maks jumlah kontak untuk buku telepon
#define MAX_AUTHORIZATION_TIME	(90) // waktu otorisasi (dalam detik)
#define MAX_FUEL_STATIONS		(18) // jumlah maksimum pompa bensin
#define MAX_BUSINESS			(200)// jumlah maksimum perusahaan
#define MAX_BUSINESS_GPS		(50) // jumlah maksimum perusahaan dalam GPS
#define MAX_HOUSES				(900)// jumlah rumah maksimum
#define MAX_HOUSE_ROOMS			(5)	 // jumlah kamar maksimum di rumah
#define MAX_GATES				(4)	 // jumlah maksimum dari hambatan / gerbang
#define MAX_HOTELS 				(3)	 // jumlah maksimum hotel
#define MAX_HOTEL_FLOORS 		(7)  // jumlah lantai hotel maksimum
#define MAX_HOTEL_ROOMS 		(MAX_HOTEL_FLOORS * 12) // jumlah kamar maksimum di sebuah hotel
#define MAX_OWNABLE_CARS		(2000)// jumlah maksimum kendaraan pribadi
#define MAX_VEHICLE_TRUNK_SLOTS	(8)	 // jumlah slot trunk maksimum
#define MAX_GANG_REPOSITORIES	(3)  // jumlah maksimum gudang untuk geng
#define MAX_GZ					(60)// jumlah maksimum zona geng
#define MAX_RADARS				(100)// jumlah maksimum radar
#define MAX_WEAPON_TINTS		(13) // jumlah maksimum pewarnaan senjata
#define MAX_ADVERTS				(100)// jumlah maksimum iklan
#define MAX_GREEN_ZONES			(10)	 // jumlah maksimum area hijau
#define MAX_FAMILY              (200) // jumlah keluarga maksimum
#define MAX_GIFT                (100) // jumlah maksimum sepatu kuda
#define MAX_BOARD               (100) // jumlah perisai maksimum
#define MAX_ATM                 (11) // jumlah maksimum ATM


// ------------------------------------------
#define GetItemInfo(%0,%1) 		g_item_type[%0][%1]

// ------------------------------------------
#define GetTrunkData(%0,%1,%2) 			g_vehicle_trunk[%0][%1][%2]
#define SetTrunkData(%0,%1,%2,%3) 		g_vehicle_trunk[%0][%1][%2] = %3
#define AddTrunkData(%0,%1,%2,%3,%4) 	g_vehicle_trunk[%0][%1][%2] %3= %4

#define IsTrunkFreeSlot(%0,%1)			!GetTrunkData(%0, %1, VT_SQL_ID)

// ------------------------------------------
#define GetOwnableCarData(%0,%1) 		g_ownable_car[%0][%1]
#define SetOwnableCarData(%0,%1,%2)		g_ownable_car[%0][%1] = %2
#define AddOwnableCarData(%0,%1,%2,%3)	g_ownable_car[%0][%1] %2= %3

#define IsOwnableCarOwned(%0)			(GetOwnableCarData(%0, OC_OWNER_ID) > 0)

// ------------------------------------------
enum E_VEHICLE_TRUNK_STRUCT
{
	VT_SQL_ID,
	VT_ITEM_TYPE, 		// jenis barang
	VT_ITEM_AMOUNT,		// jumlah
	VT_ITEM_VALUE
};

// ------------------------------------------
enum // dialog
{
	INVALID_DIALOG_ID,
	
	DIALOG_TYPE_ELECTRIC_JOIN,
	DIALOG_TYPE_ELECTRIC_EXIT,
	DIALOG_TYPE_MASUK_AYAM,
	DIALOG_TYPE_KELUAR_AYAM,
	DIALOG_TYPE_ADD_PIN,
	DIALOG_TYPE_CHECK_PIN,
	DIALOG_SENJATA_ILEGAL,
	DIALOG_CURI_MOBIL,
	DIALOG_MBAKING,
	DIALOG_MBAKING_POM,
	DIALOG_MBAKING_BIZ,
	DIALOG_MBAKING_RUMAH,
	DIALOG_MBAKING_SALDO,
	DIALOG_MBAKING_LIST,
	DIALOG_PLAYSTORE,
	DIALOG_HACK_ATM,
	DIALOG_TYPE_ROB_CAR,            //ROB CAR
	DIALOG_TYPE_ROB_MOTOR,            //ROB CAR
	DIALOG_CREATE_JAY,              //BLACJ MARKET
	DIALOG_SELECT_CREATE_JAY,              //BLACJ MARKET
	// ---------------
	DIALOG_REPORT,					// laporan
	// ---------------
	DIALOG_PLAYER_IMPROVEMENTS, 	// perbaikan
	// ---------------
	DIALOG_CHANGE_NAME, 			// perubahan nama panggilan
	// ---------------
	DIALOG_GPS, 					// gps
	DIALOG_GPS_PUBLIC_PLACES, 		// tempat umum
	DIALOG_GPS_TRANSPORT, 			// hub transportasi
	DIALOG_GPS_STATE_ORGANIZATIONS, // organisasi pemerintah
	DIALOG_GPS_GANGS,				// basis geng dan mafia
	DIALOG_GPS_JOBS,				// untuk bekerja
	DIALOG_GPS_ENTERTAINMENT,		// hiburan
	DIALOG_GPS_BUSINESS,			// iklan bisnis
	// ---------------
	DIALOG_HELP,					// bantuan game
	DIALOG_HELP_SECTION,			// bagian
	// ---------------
	DIALOG_SERVER_RADIO, 			// radio (/play)
	// ---------------
	DIALOG_ANIM_LIST, 				// lembar anim (/anim)
	// ---------------
	DIALOG_OPEN_HOOD_OR_TRUNK,		// kontrol kap/bagasi
	// ---------------
	DIALOG_DRIVING_TUTORIAL_START,	// teori di sekolah mengemudi
	DIALOG_DRIVING_TUTORIAL,	 	// teori di sekolah mengemudi
	DIALOG_DRIVING_TUTORIAL_END, 	// teori di sekolah mengemudi
	DIALOG_DRIVING_EXAM_INFO, 		// tes mengemudi
	DIALOG_DRIVING_EXAM_START,		// tes mengemudi
	DIALOG_DRIVING_EXAM, 			// tes mengemudi
	DIALOG_DRIVING_EXAM_RESULT, 	// tes mengemudi
	// ---------------
	DIALOG_ATM, 					// ATM
	DIALOG_ATM_TAKE_MONEY, 			// tarik uang
	DIALOG_ATM_TAKE_OTHER_MONEY,	// tarik uang (tas lain)
	DIALOG_ATM_PUT_MONEY, 			// menaruh uang
	DIALOG_ATM_PUT_OTHER_MONEY, 	// menaruh uang (tas lain)
	DIALOG_ATM_BALANCE, 			// saldo bank
	DIALOG_ATM_PHONE_BALANCE,		// menambah saldo ponsel Anda


	// ---------------
	DIALOG_VEHICLE_TRUNK,			// bagasi
	DIALOG_VEHICLE_TRUNK_PUT,		// letakkan item
	DIALOG_VEHICLE_TRUNK_PUT_ITEM,	// jumlah barang
	DIALOG_VEHICLE_TRUNK_TAKE,		// dapatkan item
	// ---------------
}
new following_timer[MAX_PLAYERS] = {-1, ...};
new bool: vehicle_nitro[MAX_VEHICLES] = {false, ...};

// ------------------------------------------
new g_ownable_car[MAX_OWNABLE_CARS][E_OWNABLE_CAR_STRUCT];
new g_ownable_car_loaded;

// ------------------------------------------
new g_vehicle_trunk[MAX_VEHICLES][MAX_VEHICLE_TRUNK_SLOTS][E_VEHICLE_TRUNK_STRUCT];

// ----


#define GetPlayerOwnableCar(%0)			GetPlayerData(%0, P_OWNABLE_CAR)	// id kendaraan pribadi
#define GetPlayerRentCar(%0)			GetPlayerData(%0, P_RENT_CAR)		// id kendaraan sewaan
#define GetPlayerAllowedCar(%0)			GetPlayerData(%0, P_ALLOWED_CAR)	// id kendaraan tepercaya
#define GetPlayerUseTrunk(%0)			GetPlayerData(%0, P_USE_TRUNK)		// id bagasi mobil bekas



// -----------------------------------------------------------------


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
			case DIALOG_VEHICLE_TRUNK:
			{
				new vehicleid = GetPlayerUseTrunk(playerid);

				if(response && vehicleid != INVALID_VEHICLE_ID)
				{
					if(GetPlayerListitemValue(playerid, list_id-1) == -1) // Untuk dimasukkan
					{
						Dialog
						(
							playerid, DIALOG_VEHICLE_TRUNK_PUT, DIALOG_STYLE_LIST,
							"Isi bagasi",
							"\
							1. Masukkan uang\n\
							2. Taruh tabung itu\n\
							3. Masukkan kit P3K\n\
							4. Taruh logam\n\
							5. Masukan amunisi\n\
							6. Taruh obat-obatan\
							",
							"Untuk dimasukkan", "Kembali"
						);
					}
					else
					{
						if(0 <= list_id-1 <= MAX_VEHICLE_TRUNK_SLOTS)
						{
							new desc[64] = "",
								type = GetTrunkData(vehicleid, list_id-1, VT_ITEM_TYPE);

							if(type == ITEM_TYPE_JERRICAN)
							{
								if(TakeTrunkItem(vehicleid, type, 15))
								{
									if(!GetPVarInt(playerid, "have_jerrican"))
									{
										SetPVarInt(playerid, "have_jerrican", 1);
										SetPlayerAttachedObject(playerid, A_OBJECT_SLOT_HAND, 1650, A_OBJECT_BONE_LEFT_HAND, 0.15, 0.0, 0.0, 0.0, -90.0, 180.0, 1.0, 1.0, 1.0, 0);

										SendClientMessage(playerid, 0x1E90FFFF, "Anda keluar dari bagasi \"Tabung\" dalam kuantitas: 15 l");
									}
									else
									{
										SendClientMessage(playerid, 0xCECECEFF, "Anda sudah memiliki tabung");
										AddTrunkItem(vehicleid, type, 15);
									}
								}
								else
								{
									SendClientMessage(playerid, 0xCECECEFF, "Tidak ada tabung di bagasi");
								}
							}
							else
							{
								if(type == ITEM_TYPE_NONE) type++;

								strcat(desc, GetItemInfo(type, I_NAME));

								SetPVarInt(playerid, "trunk_slot", type);

								Dialog
								(
									playerid, DIALOG_VEHICLE_TRUNK_TAKE, DIALOG_STYLE_INPUT,
									desc,
									"{FFFFFF}Masukkan jumlah yang Anda inginkan {ffff00}untuk mendapatkan:",
									"Untuk mendapatkan", "Kembali"
								);
							}
						}
					}
				}
			}
      
     }
   }

public: ShowTrunkDialog(playerid, vehicleid, view)
{
	new count, type;

	new fmt_str[36];
	new string[(sizeof fmt_str) * MAX_VEHICLE_TRUNK_SLOTS + 1];

	ClearPlayerListitemValues(playerid);
	for(new idx; idx < MAX_VEHICLE_TRUNK_SLOTS; idx ++)
	{
		if(IsTrunkFreeSlot(vehicleid, idx)) continue;

		type = GetTrunkData(vehicleid, idx, VT_ITEM_TYPE);

		format(fmt_str, sizeof fmt_str, "{FFFFFF}%d. %s:\t{32a44b}%d %s\n", count + 1, GetItemInfo(type, I_NAME), GetTrunkData(vehicleid, idx, VT_ITEM_AMOUNT), GetItemInfo(type, I_NAME_COUNT));
		strcat(string, fmt_str);

		SetPlayerListitemValue(playerid, count ++, idx);
	}

	if(!view)
	{
		SetPlayerListitemValue(playerid, count, -1);
		SetPlayerUseTrunk(playerid, vehicleid);

		format(fmt_str, sizeof fmt_str, "{FFFFFF}%d. Untuk dimasukkan", count + 1);
		strcat(string, fmt_str);

		Dialog(playerid, DIALOG_VEHICLE_TRUNK, DIALOG_STYLE_LIST, "Isi bagasi", string, "Pilih", "Tutup");
	}
	else
	{
		if(!count)
			strcat(string, "{FFFFFF}Kosong");

		SetPlayerUseTrunk(playerid, INVALID_VEHICLE_ID);
		Dialog(playerid, DIALOG_VEHICLE_TRUNK, DIALOG_STYLE_LIST, "Isi bagasi", string, "Tutup", "");
	}
	return 1;
}

