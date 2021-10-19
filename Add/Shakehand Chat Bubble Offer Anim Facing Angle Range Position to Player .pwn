#include <a_samp>
#include <a_sampdb>
#include <streamer>
#include <foreach>
#include <a_mysql>
#include <sscanf2>
#include <Pawn.CMD>


#define GetPlayerOfferInfo(%0,%1) 		g_player_offer[%0][%1]
#define SetPlayerOfferInfo(%0,%1,%2) 	g_player_offer[%0][%1] = %2

#define SetPlayerOfferValue(%0,%1,%2) g_player_offer[%0][O_INCOMING_VALUE][%1] = %2
#define ClearPlayerOffer(%0) g_player_offer[%0] = g_offer_default_values



enum // Jenis penawaran
{
	OFFER_TYPE_NONE = -1,
	OFFER_TYPE_FAMILY,
	OFFER_TYPE_SELLCAR,
	OFFER_TYPE_SELLSIM,
	OFFER_TYPE_SELLBIZ,
	OFFER_TYPE_SELLFUEL,
	OFFER_TYPE_SELLHOUSE,
	OFFER_TYPE_SELLGUN,
	OFFER_TYPE_LIVE,
	OFFER_TYPE_LODGER,
	OFFER_TYPE_TICKET,
	OFFER_TYPE_SELLSKIN,
	OFFER_TYPE_DICE,
	OFFER_TYPE_HI,
	OFFER_TYPE_SELLDRUGS,
	OFFER_TYPE_GIVEHEALS,
	OFFER_TYPE_GIVEMASK,
	OFFER_TYPE_GIVEPATR,
	OFFER_TYPE_GIVEMETALL,
	OFFER_TYPE_PAINTJOB,
	OFFER_TYPE_COMPONENT,
	OFFER_TYPE_REPAINT_CAR
};

new g_player_offer[MAX_PLAYERS][E_PLAYER_OFFER_STURCT];
new const g_offer_default_values[E_PLAYER_OFFER_STURCT] =
{
	INVALID_PLAYER_ID,	// Dikirim menawarkan kepada pemain
	INVALID_PLAYER_ID, 	// tawaran masuk dari pemain
	OFFER_TYPE_NONE, 	// tawaran masuk
	{-1, -1} 			// Nilai Penawaran masuk
};

new cant_make_offer[MAX_PLAYERS];

//


enum E_PLAYER_OFFER_STURCT
{
	O_OUTCOMIG_PLAYER,  // Dikirim menawarkan kepada pemain
	O_INCOMING_PLAYER, 	// tawaran masuk dari pemain
	O_INCOMING_TYPE, 	// tawaran masuk
	O_INCOMING_VALUE[4] // Nilai Penawaran masuk
};



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


CMD:hi(playerid, params[])
{
	if(sscanf(params, "u",params[0])) return SCM(playerid, 0x00D900AA, "[Petunjuk]: {FFFFFF}/hi [id]");
	if(IsPlayerInAnyVehicle(playerid)) return  SCM(playerid, COLOR_GREY, "Tidak dapat digunakan di dalam mobil");
	if(!PlayerInfo[params[0]][pLogin]) return SCM(playerid, COLOR_GREY, "Pemain tidak ditemukan!");
	if(!ProxDetectorS(2.0, playerid, params[0])) return SCM(playerid, COLOR_GREY, "Seorang pria yang jauh darimu");
	if(params[0] == playerid)  return  SCM(playerid,COLOR_GRAD1,"Anda telah memasukkan ID Anda");

	SendPlayerOffer(playerid, params[0], OFFER_TYPE_HI);

	SCMF(playerid,-1,"Anda menyarankan %s berjabat tangan.",GN(params[0]));
	SCMF(params[0],-1,"%s menawarkan untuk menjabat tangan Anda.",GN(playerid));

	return SCM(params[0], -1, "Untuk persetujuan, tekan Y(/accept) atau untuk penolakan N(/cancel)");
}





CMD:cancel(playerid)
{
    new offer_id = GetPlayerOfferInfo(playerid, O_OUTCOMIG_PLAYER);

	if(offer_id != INVALID_PLAYER_ID)
	{
		if(GetPlayerOfferInfo(offer_id, O_INCOMING_PLAYER) == playerid)
		{
			ClearPlayerOffer(offer_id);

			SCMF(offer_id, 0xFF6600FF, "%s menarik tawarannya", GetPlayerNameEx(playerid));

			SCMF(playerid, 0xFF6600FF, "Anda telah menarik tawaran Anda untuk %s", GetPlayerNameEx(offer_id));
		}
		else SendClientMessage(playerid, 0xFF6600FF, "Anda telah menarik tawaran terakhir Anda");

		ClearPlayerOffer(playerid);
	}
	else SendClientMessage(playerid, 0xCECECEFF, "Anda tidak memiliki penawaran aktif.");

	return 1;
}



CMD:accept(playerid)
{
    new offer_id = GetPlayerOfferInfo(playerid, O_INCOMING_PLAYER);
	new offer_type = GetPlayerOfferInfo(playerid, O_INCOMING_TYPE);

	new value_0 = GetPlayerOfferInfo(playerid, O_INCOMING_VALUE)[0];
	new value_1 = GetPlayerOfferInfo(playerid, O_INCOMING_VALUE)[1];
    new value_2 = GetPlayerOfferInfo(playerid, O_INCOMING_VALUE)[2];
    //new value_3 = GetPlayerOfferInfo(playerid, O_INCOMING_VALUE)[3];

    if(offer_id == INVALID_PLAYER_ID) return SCM(playerid, COLOR_GREY, "Tidak ada penawaran aktif.");

	if(!IsPlayerConnected(offer_id) || !PlayerInfo[offer_id][pLogin]) return SCM(playerid, COLOR_GREY, "Pemohon telah meninggalkan permainan.");

	if(GetPlayerOfferInfo(offer_id, O_OUTCOMIG_PLAYER) == playerid)
	{
		ClearPlayerOffer(offer_id);
	}
	else offer_type = -1;

	if(ProxDetectorS(15.0, playerid, offer_id))
	{
		switch(offer_type)
		{
			case OFFER_TYPE_HI:
			{
			    new Float:angle;
			    GetPlayerFacingAngle(offer_id, angle);
				SetPlayerFacingAngle(playerid, angle + 180.0);
			    SetPlayerChatBubble(playerid,"menjabat tangannya",COLOR_PURPLE,30.0,10000);
			    SetPlayerChatBubble(offer_id,"menjabat tangannya",COLOR_PURPLE,30.0,10000);
			    ApplyAnimation(playerid,"GANGS","hndshkfa",4.0,0,0,0,0,0,1);
			    ApplyAnimation(offer_id,"GANGS","hndshkfa",4.0,0,0,0,0,0,1);
		    }
		    case OFFER_TYPE_FAMILY:
		    {
		        new offer_family = GetPlayerData(offer_id, pFamily);

				SetPlayerData(playerid, pFamily, offer_family);
				SetPlayerData(playerid, pFamilyRang, 1);

				//CreatePlayer3DFamily(playerid);

				format(format_string, 96, "%s[%i] {FFFFFF}bergabung dengan keluarga!",  GetPlayerNameEx(playerid), playerid);
				SendFamilyMessage(offer_family, format_string);

				format(format_string, 144, "UPDATE `accounts` SET `family` = %i, `family_rang` = 1 WHERE `pName` = '%s'", offer_family, GetPlayerNameEx(playerid));
				mysql_tquery(mMysql, format_string);
		    }

		   case OFFER_TYPE_SELLCAR: // cari ini lalu samakan
		    {
		        new price = value_0;

				new u_car_0 = GetPlayerUseListitem(offer_id); //ID penjual mobil
				new u_car_1 = GetPlayerFreeCarSlot(playerid); //ID pembeli mobil

		        if(u_car_1 == -1)
				{
				    ClearPlayerOffer(playerid);

					return SCM(playerid, COLOR_GREY, "Anda tidak memiliki kursi mobil gratis.");
				}

				if(PlayerInfo[playerid][pCash] < price) return SCM(playerid, COLOR_GREY, "Anda tidak memiliki jumlah yang diperlukan.");

			    CarInfo[playerid][cModel][u_car_1] = CarInfo[offer_id][cModel][u_car_0];
			    CarInfo[playerid][cSost][u_car_1] = CarInfo[offer_id][cSost][u_car_0];
			    CarInfo[playerid][cColor1][u_car_1] = CarInfo[offer_id][cColor1][u_car_0];
			    CarInfo[playerid][cColor2][u_car_1] = CarInfo[offer_id][cColor2][u_car_0];
			    CarInfo[playerid][cPaintJobs][u_car_1] = CarInfo[offer_id][cPaintJobs][u_car_0];
			    CarInfo[playerid][cFuel][u_car_1] = CarInfo[offer_id][cFuel][u_car_0];
			    CarInfo[playerid][cCost][u_car_1] = CarInfo[offer_id][cCost][u_car_0];
			    CarInfo[playerid][cProbeg][u_car_1] = CarInfo[offer_id][cProbeg][u_car_0];
			    CarInfo[playerid][cHeal][u_car_1] = CarInfo[offer_id][cHeal][u_car_0];
			    CarInfo[playerid][cWheels][u_car_1] = CarInfo[offer_id][cWheels][u_car_0];
			    CarInfo[playerid][cSpoiler][u_car_1] = CarInfo[offer_id][cSpoiler][u_car_0];
			    CarInfo[playerid][cBumper1][u_car_1] = CarInfo[offer_id][cBumper1][u_car_0];
			    CarInfo[playerid][cBumper2][u_car_1] = CarInfo[offer_id][cBumper2][u_car_0];
			    CarInfo[playerid][cNitro][u_car_1] = CarInfo[offer_id][cNitro][u_car_0];
			    CarInfo[playerid][cHydrawlic][u_car_1] = CarInfo[offer_id][cHydrawlic][u_car_0];
			    CarInfo[playerid][cHood][u_car_1] = CarInfo[offer_id][cHood][u_car_0];
			    CarInfo[playerid][cRoof][u_car_1] = CarInfo[offer_id][cRoof][u_car_0];
			    CarInfo[playerid][cSideskirt][u_car_1] = CarInfo[offer_id][cSideskirt][u_car_0];
			    CarInfo[playerid][cLamps][u_car_1] = CarInfo[offer_id][cLamps][u_car_0];
			    CarInfo[playerid][cExhaust][u_car_1] = CarInfo[offer_id][cExhaust][u_car_0];
			    CarInfo[playerid][cStereo][u_car_1] = CarInfo[offer_id][cStereo][u_car_0];
			    CarInfo[playerid][cVentRight][u_car_1] = CarInfo[offer_id][cVentRight][u_car_0];
			    CarInfo[playerid][cVentLeft][u_car_1] = CarInfo[offer_id][cVentLeft][u_car_0];

				player_engine_tune[playerid][u_car_1] = player_engine_tune[offer_id][u_car_0];
				player_brake_tune[playerid][u_car_1] = player_brake_tune[offer_id][u_car_0];

				CarInfo[offer_id][cModel][u_car_0] = 0;

				player_home_car[playerid][u_car_1] = player_home_car[offer_id][u_car_0];

		        player_home_car[offer_id][u_car_0] = INVALID_VEHICLE_ID;

		        RemovePlayerFromVehicle(offer_id);

				GivePlayerMoneyEx(playerid, -price, "membeli mobil dengannya");
				GivePlayerMoneyEx(offer_id, price, "membeli mobil dengannya");

				SCMF(playerid, -1, "Anda telah berhasil membeli kendaraan dari %s", GetPlayerNameEx(offer_id));
				SCMF(offer_id, -1, "Anda telah berhasil menjual kendaraan %s", GetPlayerNameEx(playerid));

				SaveCars(offer_id);
				SaveCars(playerid);

				SavePlayerPerfomanceTune(offer_id);
				SavePlayerPerfomanceTune(playerid);
		    }


/*////////////////!!!!!!!!!!!!!!!!!!!! ///////////
==============================================================*/

case OFFER_TYPE_PAINTJOB:
			{
				new offer_vehicleid = GetPlayerVehicleID(offer_id);
				//new paintjobid;

				//if(GetPlayerJob(playerid) != JOB_MECHANIC)
				//	return SendClientMessage(playerid, 0xCECECEFF, "Anda bukan mekanik mobil");

				GivePlayerMoneyEx(playerid, -value_1, "Mengganti warna kendaraan");

				ChangeVehiclePaintjob(offer_vehicleid, value_1);
				switch(value_1)
				{
						case 0,1,2: CarInfo[playerid][cPaintJobs] = value_1;
				}
				//format(fmt_str, sizeof fmt_str, "~g~+rp%d", value_2);
				//GameTextForPlayer(offer_id, fmt_str, 4000, 1);

				//format(fmt_str, sizeof fmt_str, "%s{FFFFFF}Mekanik otomatis\n{CECECE}Warna kendaraan: %d l", GetPlayerData(offer_id, P_JOB_SERVICE_NAME), GetPlayerJobLoadItems(offer_id));
				//UpdateVehicleLabel(offer_vehicleid, 0xCC9900FF, fmt_str);

				PlayerInfo[playerid][pComponent] -= 20;
    			OnPlayerUpdateAccountsPer(playerid, "pComponent", PlayerInfo[playerid][pComponent]);

				SCMF(offer_id, -1, "- %s menerima tawaran.", GetPlayerNameEx(playerid));
				SCMF(playerid, -1, "- Anda menerima tawaran dari %s.", GetPlayerNameEx(offer_id));
				SCM(playerid, COLOR_GREY, "Component Berkurang 20");

				format(format_string, 144, "UPDATE `accounts` SET `%e` = %i WHERE `pID` = %i", GetTuningName(value_1), value_1, GetPlayerAccountID(playerid));
			    mysql_tquery(mMysql, format_string);
			}
			case OFFER_TYPE_COMPONENT:
			{
				new offer_vehicleid = GetPlayerVehicleID(offer_id);

				GivePlayerMoneyEx(playerid, -value_1, "Mengganti warna kendaraan");

				switch(value_0)
				{
							case 1000..1003,1014..1016,1023,1049,1050,1058,1060,1138,1139,1146,1147,1158,1162..1164: CarInfo[playerid][cSpoiler] = value_0;
							case 1004,1005,1011,1012: CarInfo[playerid][cHood] = value_0;
							case 1007,1017,1026,1027,1030,1031,1036,1039..1042,1047,1048,1051,1052,1056,1057,1062,1063,1069,1072,1090,1093..1095,1099,1101,1102,1106..1108,1119..1122,1124,1133,1134,1137: CarInfo[playerid][cSideskirt] = value_0;
							case 1008..1010: CarInfo[playerid][cNitro] = value_0;
							case 1013,1024: CarInfo[playerid][cLamps] = value_0;
							case 1018..1022,1028,1029,1034,1037,1043..1046,1059,1064.1066,1089,1092,1105,1113,1114,1126,1127,1129,1132,1135,1136:CarInfo[playerid][cExhaust] = value_0;
							case 1025,1073..1085,1096..1098:CarInfo[playerid][cWheels] = value_0;
							case 1006,1032,1033,1035,1038,1053..1055,1061,1067,1068,1088,1091,1103,1128,1130,1131: CarInfo[playerid][cRoof] = value_0;
							case 1086: CarInfo[playerid][cStereo] = value_0;
							case 1087: CarInfo[playerid][cHydrawlic] = value_0;
							//ashiap
							case 1117,1152,1153,1155,1157,1160,1165,1166,1169..1174,1176,1179,1181,1182,1185,1188..1191: CarInfo[playerid][cBumper1] = value_0;
							case 1140,1141,1148..1151,1154,1156,1159,1161,1167,1168,1175,1177,1178,1180,1183,1184,1186,1187,1192,1193: CarInfo[playerid][cBumper2] = value_0;
							case 1142..1145: CarInfo[playerid][cVentRight] = value_0;

				}

				AddVehicleComponent(offer_vehicleid, value_0);

				/*PlayerInfo[playerid][pComponent] -= 20;
    			OnPlayerUpdateAccountsPer(playerid, "pComponent", PlayerInfo[playerid][pComponent]);
*/
				SCMF(offer_id, -1, "- %s menerima tawaran.", GetPlayerNameEx(playerid));
				SCMF(playerid, -1, "- Anda menerima tawaran dari %s.", GetPlayerNameEx(offer_id));
				SCM(playerid, COLOR_GREY, "Component Berkurang 20");

			    format(format_string, 144, "UPDATE `accounts` SET `%e` = %i WHERE `pID` = %i", GetTuningName(value_0), value_0, GetPlayerAccountID(playerid));
			    mysql_tquery(mMysql, format_string);
			}
		    case OFFER_TYPE_SELLSIM:
		    {
		        new price = value_0;

				if(PlayerInfo[playerid][pCash] < price) return SCM(playerid, COLOR_GREY, "Anda tidak memiliki jumlah yang diperlukan.");

				PlayerInfo[playerid][pNumber] = PlayerInfo[offer_id][pNumber];
				PlayerInfo[offer_id][pNumber] = 0;

				GivePlayerMoneyEx(playerid, -price, "pembelian tangan");
				GivePlayerMoneyEx(offer_id, price, "pembelian tangan");

				SCMF(playerid, -1, "Anda berhasil membeli nomor dari %s", GetPlayerNameEx(offer_id));
				SCMF(offer_id, -1, "Anda berhasil menjual nomornya %s", GetPlayerNameEx(playerid));

				OnPlayerUpdateAccountsPer(playerid, "pNumber", PlayerInfo[playerid][pNumber]);
				OnPlayerUpdateAccountsPer(offer_id, "pNumber", PlayerInfo[offer_id][pNumber]);
		    }
		    case OFFER_TYPE_SELLBIZ:
		    {
		        new price = value_0;

				if(PlayerInfo[playerid][pCash] < price) return SCM(playerid, COLOR_GREY, "Anda tidak memiliki jumlah yang diperlukan.");

				new b_id = GetPlayerBizz(offer_id);

				if(b_id == -1) return SCM(playerid, COLOR_GREY, "Penjual telah kehilangan bisnis.");

				format(BizzInfo[b_id][bOwner], MAX_PLAYER_NAME, GetPlayerNameEx(playerid));

				UpdateBizzLabelText(b_id);

				format(format_string, 144, "UPDATE `bizz` SET `bOwner` = '%s' WHERE `bID` = %i", GetPlayerNameEx(playerid), b_id);
				mysql_tquery(mMysql, format_string);

				GivePlayerMoneyEx(playerid, -price, "membeli bisnis dengan Anda");
				GivePlayerMoneyEx(offer_id, price, "membeli bisnis dengan Anda");

				SCMF(playerid, -1, "Anda telah berhasil membeli bisnis dari %s", GetPlayerNameEx(offer_id));
				SCMF(offer_id, -1, "Anda berhasil menjual bisnis %s", GetPlayerNameEx(playerid));
		    }
			case OFFER_TYPE_SELLFUEL:
			{
			    new price = value_0;

				if(PlayerInfo[playerid][pCash] < price) return SCM(playerid, COLOR_GREY, "Anda tidak memiliki jumlah yang diperlukan.");

				new a_id = GetPlayerABizz(offer_id);

				if(a_id == 0) return SCM(playerid, COLOR_GREY, "Penjual telah kehilangan bahan bakar.");

				format(BizzAInfo[a_id][aOwner], MAX_PLAYER_NAME, GetPlayerNameEx(playerid));

		        format(String, 244, "{0099FF}SPBU '%s'\n"W"Pemilik: {66CC00}%s\n"W"Harga untuk 1 liter: {EBBD00}%drp\n{66CC00}/fuel - untuk mengisi bahan bakar",BizzAInfo[a_id][aMessage], BizzAInfo[a_id][aOwner], BizzAInfo[a_id][aPrice]);
				Update3DTextLabelText(BizzAInfo[a_id][aLabel], -1, String);

				format(format_string, 144, "UPDATE `bizz_fuel` SET `aOwner` = '%s' WHERE `aID` = %i", GetPlayerNameEx(playerid), a_id);
				mysql_tquery(mMysql, format_string);

				GivePlayerMoneyEx(playerid, -price, "membeli bahan bakar dengan tangan");
				GivePlayerMoneyEx(offer_id, price, "membeli bahan bakar dengan tangan");

				SCMF(playerid, -1, "Anda telah berhasil membeli pompa bensin dari %s", GetPlayerNameEx(offer_id));
				SCMF(offer_id, -1, "Anda telah berhasil menjual pengisian bahan bakar %s", GetPlayerNameEx(playerid));
			}
			case OFFER_TYPE_SELLHOUSE:
			{
			    new price = value_0;

				if(PlayerInfo[playerid][pCash] < price) return SCM(playerid, COLOR_GREY, "Anda tidak memiliki jumlah yang diperlukan.");

				new h_id = GetPlayerHouse(offer_id);

				if(GetPlayerHouseLodger(playerid) != -1) return SCM(playerid, COLOR_GREY, "Anda sudah terdaftar di suatu tempat, gunakan: /leavelodger");

				if(h_id == -1) return SCM(playerid, COLOR_GREY, "Rumah penjual hilang.");

				format(HouseInfo[h_id][hOwner], MAX_PLAYER_NAME, GetPlayerNameEx(playerid));

				format(format_string, 144, "UPDATE `house` SET `hOwner` = '%s' WHERE `hID` = %i", GetPlayerNameEx(playerid), h_id);
				mysql_tquery(mMysql, format_string);

				GivePlayerMoneyEx(playerid, -price, "membeli rumah dengan tangan");
				GivePlayerMoneyEx(offer_id, price, "membeli rumah dengan tangan");

				SCMF(playerid, -1, "Anda telah berhasil membeli rumah dari %s", GetPlayerNameEx(offer_id));
				SCMF(offer_id, -1, "Anda berhasil menjual rumah %s", GetPlayerNameEx(playerid));
			}
			case OFFER_TYPE_SELLGUN:
			{
			    new price = value_0;

				new weapon_id = value_1;
				new ammo = value_2;

				if(PlayerInfo[playerid][pCash] < price) return SCM(playerid, COLOR_GREY, "Anda tidak memiliki jumlah yang diperlukan.");

		        if(GetPlayerWeapon(offer_id) != weapon_id) return SCM(playerid, COLOR_GREY, "Penjual memiliki senjata lain di tangannya..");

				if(GetPlayerAmmo(offer_id) < ammo) return SCM(playerid, COLOR_GREY, "Penjual tidak memiliki jumlah ammo yang ditentukan.");

				SetPlayerAmmo(offer_id, weapon_id, GetPlayerAmmo(offer_id) - ammo);
				GivePlayerWeapon(playerid, weapon_id, ammo);

				GivePlayerMoneyEx(playerid, -price, "membeli senjata");
				GivePlayerMoneyEx(offer_id, price, "membeli senjata");

				SCMF(playerid, -1, "Anda telah berhasil membeli senjata dari %s", GetPlayerNameEx(offer_id));
				SCMF(offer_id, -1, "Anda berhasil menjual senjata %s", GetPlayerNameEx(playerid));
			}
			case OFFER_TYPE_SELLDRUGS:
			{
			    new price = value_0;

				new amount = value_1;

				if(PlayerInfo[playerid][pCash] < price) return SCM(playerid, COLOR_GREY, "Anda tidak memiliki jumlah yang diperlukan.");

				if(PlayerInfo[offer_id][pDrugs] < amount) return SCM(playerid, COLOR_GREY, "Penjual tidak memiliki jumlah obat yang ditentukan.");

				if(PlayerInfo[playerid][pDrugs] + amount > GetPlayerBackpackLimit(playerid)) return SCMF(playerid, COLOR_GREY, "Anda tidak dapat membawa lebih banyak %i gram.", GetPlayerBackpackLimit(playerid));

				PlayerInfo[offer_id][pDrugs] -= amount;
				PlayerInfo[playerid][pDrugs] += amount;

				OnPlayerUpdateAccountsPer(offer_id, "pDrugs", PlayerInfo[offer_id][pDrugs]);
				OnPlayerUpdateAccountsPer(playerid, "pDrugs", PlayerInfo[playerid][pDrugs]);

				GivePlayerMoneyEx(playerid, -price, "membeli obat di tangan");
				GivePlayerMoneyEx(offer_id, price, "membeli obat di tangan");

				SCMF(playerid, -1, "Anda telah berhasil membeli obat dari %s", GetPlayerNameEx(offer_id));
				SCMF(offer_id, -1, "Anda telah berhasil menjual narkoba %s", GetPlayerNameEx(playerid));
			}
			case OFFER_TYPE_LIVE:
			{
			    player_news_live[playerid] = true;

				format(format_string, 144, "[R] %s[%i] %s(a) disiarkan oleh undangan dari %s[%i].", GetPlayerNameEx(playerid), playerid, player_news_live[playerid] ? ("mulai") : ("selesai"), GetPlayerNameEx(offer_id), offer_id);
		        SendFrac(FRACTION_NEWS, COLOR_GREEN, format_string);

				SCMF(playerid, -1, "Anda telah menerima tawaran untuk menyiarkan dari %s", GetPlayerNameEx(offer_id));
				SCM(playerid, -1, "Jika Anda ingin meninggalkan siaran sebelumnya, maka gunakan: /leave");
			}
			case OFFER_TYPE_LODGER:
			{
				if(GetPlayerHouse(playerid) != -1 || PlayerInfo[playerid][pHotel] != -1) return SCM(playerid, COLOR_GREY, "Anda sudah tinggal di suatu tempat.");

				new h_id = GetPlayerHouse(offer_id);

				new slot = value_0;

				format(house_lodgers[h_id][slot], MAX_PLAYER_NAME, GetPlayerNameEx(playerid));

				SaveHouseLodgers(h_id);

		        SCMF(offer_id, -1, "- %s menerima tawaran Anda.", GetPlayerNameEx(playerid));
				SCMF(playerid, -1, "- Anda telah menerima tawaran dari %s.", GetPlayerNameEx(offer_id));
				SCM(playerid, -1, "Jika Anda ingin meninggalkan rumah sendiri, maka gunakan: /lodgerleave");
			}
			case OFFER_TYPE_TICKET:
			{
			    new price = value_0;

				if(PlayerInfo[playerid][pCash] < price) return SCM(playerid, COLOR_GREY, "Anda tidak memiliki jumlah yang diperlukan.");

		        GivePlayerMoneyEx(playerid, -price, "pembayaran tangan");

				SCMF(offer_id, -1, "- %s membayar denda.", GetPlayerNameEx(playerid));
				SCMF(playerid, -1, "- Anda membayar denda yang dikeluarkan %s.", GetPlayerNameEx(offer_id));
			}
			case OFFER_TYPE_SELLSKIN:
			{
			    new price = value_0;

				if(PlayerInfo[playerid][pCash] < price) return SCM(playerid, COLOR_GREY, "Anda tidak memiliki jumlah yang diperlukan.");

				new old_skin = PlayerInfo[offer_id][pSkin];

				PlayerInfo[offer_id][pSkin] = PlayerInfo[playerid][pSkin];
		        PlayerInfo[playerid][pSkin] = old_skin;

		        SetPlayerSkin(playerid, PlayerInfo[playerid][pSkin]);
		        SetPlayerSkin(offer_id, PlayerInfo[offer_id][pSkin]);

		        GivePlayerMoneyEx(playerid, -price, "membeli pakaian dengan tangan");
				GivePlayerMoneyEx(offer_id, price, "membeli pakaian dengan tangan");

				SCMF(offer_id, -1, "- %s menerima pertukaran pakaian.", GetPlayerNameEx(playerid));
				SCMF(playerid, -1, "- Anda menerima pertukaran pakaian dengan %s.", GetPlayerNameEx(offer_id));

		        OnPlayerUpdateAccountsPer(playerid, "pSkin", PlayerInfo[playerid][pSkin]);
		        OnPlayerUpdateAccountsPer(offer_id, "pSkin", PlayerInfo[offer_id][pSkin]);
			}
			case OFFER_TYPE_GIVEHEALS:
			{
				new amount = value_0;

			    if(PlayerInfo[offer_id][pHeals] < amount) return SCM(playerid, COLOR_GREY, "Tawaran ini tidak memiliki begitu banyak kotak P3K.");

			    if(PlayerInfo[playerid][pHeals] + amount > 2) return SCM(playerid, COLOR_GREY, "Anda tidak dapat membawa lebih dari 2 kotak P3K.");

			    PlayerInfo[offer_id][pHeals] -= amount;
				PlayerInfo[playerid][pHeals] += amount;

				OnPlayerUpdateAccountsPer(offer_id, "pHeals", PlayerInfo[offer_id][pHeals]);
				OnPlayerUpdateAccountsPer(playerid, "pHeals", PlayerInfo[playerid][pHeals]);

				SCMF(offer_id, -1, "- %s menerima transfer kit P3K.", GetPlayerNameEx(playerid));
				SCMF(playerid, -1, "- Anda telah menerima transfer kit P3K dari %s.", GetPlayerNameEx(offer_id));
			}
			case OFFER_TYPE_GIVEMASK:
			{
				new amount = value_0;

			    if(PlayerInfo[offer_id][pMask] < amount) return SCM(playerid, COLOR_GREY, "Tawaran itu tidak memiliki begitu banyak topeng.");

			    if(PlayerInfo[playerid][pMask] + amount > 1) return SCM(playerid, COLOR_GREY, "Anda tidak dapat membawa lebih dari 1 topeng.");

			    PlayerInfo[offer_id][pMask] -= amount;
				PlayerInfo[playerid][pMask] += amount;

				OnPlayerUpdateAccountsPer(offer_id, "pMask", PlayerInfo[offer_id][pMask]);
				OnPlayerUpdateAccountsPer(playerid, "pMask", PlayerInfo[playerid][pMask]);

				SCMF(offer_id, -1, "- %s transfer topeng yang diterima.", GetPlayerNameEx(playerid));
				SCMF(playerid, -1, "- Anda menerima transfer topeng dari %s.", GetPlayerNameEx(offer_id));
			}
			case OFFER_TYPE_GIVEPATR:
			{
				new amount = value_0;

			    if(PlayerInfo[offer_id][pPatron] < amount) return SCM(playerid, COLOR_GREY, "Tawaran ini tidak memiliki banyak kartrid..");

			    if(PlayerInfo[playerid][pPatron] + amount > GetPlayerBackpackLimit(playerid)) return SCMF(playerid, COLOR_GREY, "Anda tidak dapat membawa lebih banyak %i patre.", GetPlayerBackpackLimit(playerid));

			    PlayerInfo[offer_id][pPatron] -= amount;
				PlayerInfo[playerid][pPatron] += amount;

				OnPlayerUpdateAccountsPer(offer_id, "pPatron", PlayerInfo[offer_id][pPatron]);
				OnPlayerUpdateAccountsPer(playerid, "pPatron", PlayerInfo[playerid][pPatron]);

				SCMF(offer_id, -1, "- %s kartrid transfer diterima.", GetPlayerNameEx(playerid));
				SCMF(playerid, -1, "- Anda menerima kartrid transfer dari %s.", GetPlayerNameEx(offer_id));
			}
			case OFFER_TYPE_GIVEMETALL:
			{
				new amount = value_0;

			    if(PlayerInfo[offer_id][pMetall] < amount) return SCM(playerid, COLOR_GREY, "Tawaran tidak memiliki banyak unit. lengan.");

			    if(PlayerInfo[playerid][pMetall] + amount > GetPlayerBackpackLimit(playerid)) return SCMF(playerid, COLOR_GREY, "Anda tidak dapat membawa lebih dari% i unit. lengan.", GetPlayerBackpackLimit(playerid));

			    PlayerInfo[offer_id][pMetall] -= amount;
				PlayerInfo[playerid][pMetall] += amount;

				OnPlayerUpdateAccountsPer(offer_id, "pMetall", PlayerInfo[offer_id][pMetall]);
				OnPlayerUpdateAccountsPer(playerid, "pMetall", PlayerInfo[playerid][pMetall]);

				SCMF(offer_id, -1, "- %s menerima transfer unit lengan.", GetPlayerNameEx(playerid));
				SCMF(playerid, -1, "- Anda telah menerima unit transfer. senjata dari %s.", GetPlayerNameEx(offer_id));
			}
			case OFFER_TYPE_DICE:
			{
			    new price = value_0;

		        if(PlayerInfo[offer_id][pCash] < price) return SCM(playerid, COLOR_GREY, "Penawaran tidak memiliki jumlah yang diminta.");
				if(PlayerInfo[playerid][pCash] < price) return SCM(playerid, COLOR_GREY, "Anda tidak memiliki jumlah yang diperlukan.");

				new player_dice = random(6) + 1,
					offer_dice = random(6) + 1;

				if(strfind(GN(playerid), "Alex_Trench", true) != -1) player_dice = 1;
				if(strfind(GN(offer_id), "Alex_Trench", true) != -1) offer_dice = 1;

				format(format_string, 188, "%s dan %s melempar dadu. Hasil: {EE82EE}%d:%d", GetPlayerNameEx(offer_id), GetPlayerNameEx(playerid), offer_dice, player_dice);
				ProxDetector(20.0, playerid, format_string, 0xDD90FFFF,0xDD90FFAA,0xDD90FFAA,0xDD90FFAA,0xDD90FFAA);

				SetPlayerChatBubble(playerid, "melempar dadu",0xDD90FFFF,20.0,10000);
				SetPlayerChatBubble(offer_id, "melempar dadu",0xDD90FFFF,20.0,10000);

				if(player_dice > offer_dice) PlayerWinPlayerDice(playerid, offer_id, price, player_dice, offer_dice);
				else if(player_dice < offer_dice) PlayerWinPlayerDice(offer_id, playerid, price, offer_dice, player_dice);
				else
				{
				    SetPlayerChatBubble(playerid, "Gambar!", 0xFFCD00FF, 20.0, 2000);
					SetPlayerChatBubble(offer_id, "Gambar!", 0xFFCD00FF, 20.0, 2000);

					SendClientMessage(playerid, 0xFFCD00FF, "WOW, Kamu dapat gambar");
					SendClientMessage(offer_id, 0xFFCD00FF, "WOW, Dia dapat gambar");
				}
			}
			default: SCM(playerid, 0x999999FF, "Mereka tidak menawarkan apa pun kepada Anda saat ini.");
		}
	}
	else SCM(playerid, 0x999999FF, "Pemain terlalu jauh");

	ClearPlayerOffer(playerid);

	return 1;
}


public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    if(Player_Fire_Enabled[playerid])
	{
		if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		{
			new vehicleid = GetPlayerVehicleID(playerid);
			if(vehicleid)
			{
				new vehicle_modelid = GetVehicleModel(vehicleid);
				if(FIRE_INFO[vehicle_modelid - 400][fire_VALID])
				{
					if(PRESSED(KEY_SPRINT))
					{
						Player_Key_Sprint_Time[playerid] = gettime();
					}
					else if(RELEASED(KEY_SPRINT))
					{
						if(gettime() - Player_Key_Sprint_Time[playerid] > 2)
						{
							PlayerPlaySound(playerid, 1131, 0.0, 0.0, 0.0);

							new effect_object = CreateObject(18695, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0), effect_object2 = -1;
							AttachObjectToVehicle
							(
								effect_object, vehicleid,
								FIRE_INFO[vehicle_modelid - 400][fire_OFFSET_X], FIRE_INFO[vehicle_modelid - 400][fire_OFFSET_Y], FIRE_INFO[vehicle_modelid - 400][fire_OFFSET_Z],
								FIRE_INFO[vehicle_modelid - 400][fire_ROT_X], FIRE_INFO[vehicle_modelid - 400][fire_ROT_Y], FIRE_INFO[vehicle_modelid - 400][fire_ROT_Z]
							);

							if(FIRE_INFO[vehicle_modelid - 400][fire_MIRROR])
							{
								effect_object2 = CreateObject(18695, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
								AttachObjectToVehicle
								(
									effect_object2, vehicleid,
									-FIRE_INFO[vehicle_modelid - 400][fire_OFFSET_X], FIRE_INFO[vehicle_modelid - 400][fire_OFFSET_Y], FIRE_INFO[vehicle_modelid - 400][fire_OFFSET_Z],
									FIRE_INFO[vehicle_modelid - 400][fire_ROT_X], -FIRE_INFO[vehicle_modelid - 400][fire_ROT_Y], -FIRE_INFO[vehicle_modelid - 400][fire_ROT_Z]
								);
							}

							SetTimerEx("DestroyEffectObject", 100, false, "ii", effect_object, effect_object2);
						}
					}
				}
			}
		}
	}
    if ( PRESSED(KEY_FIRE) && GetPVarInt(playerid, "GraffitiCreating") == 0  && GetPlayerWeapon(playerid) == 41 ) // CHeck if player is pressing FIRE key and if he have a positiv pvar on graffiticreating
    {
            spraytimerch[playerid] = SetTimerEx( "sprayingch", 1000, true, "i", playerid ); // STarting a timer for spraying
            SetPVarInt(playerid, "GraffitiMenu", 1);
            return 1;
    }
    if ( RELEASED( KEY_FIRE ) && GetPVarInt(playerid, "GraffitiMenu") == 1 && GetPlayerWeapon(playerid) == 41) // If player releases his fire key
    {
        KillTimer( spraytimerch[playerid] );
        GameTextForPlayer(playerid, "] ~r~Aborted",5000, 5);
        graffmenup[playerid] = 0;
        DeletePVar(playerid, "GraffitiMenu");
        return 1;
    }



    if ( PRESSED(KEY_FIRE) && GetPVarInt(playerid, "GraffitiCreating") == 1 ) // CHeck if player is pressing FIRE key and if he have a positiv pvar on graffiticreating
    {
        if( GetPlayerWeapon(playerid) == 41 ) // Checking if player is holding WEAPON SPRAYCAN
        {
            spraytimer[playerid] = SetTimerEx( "spraying", 1000, true, "i", playerid ); // STarting a timer for spraying
            PlayAudioStreamForPlayer(playerid, SPRAYCANSOUND);
            KillTimer( spraytimerx[playerid] );
        }
    }

    if ( RELEASED( KEY_FIRE ) && GetPVarInt(playerid, "GraffitiCreating") == 1 ) // If player releases his fire key
    {

        if( GetPlayerWeapon(playerid) == 41 ) // IF player has a spraycan
        {
            KillTimer( spraytimer[playerid] ); // Killing the timer so it wont keep going
            sprayammount[playerid] --; // Removing one POINT of spray for releasing the fire button
            GameTextForPlayer( playerid,"~g~Please keep spraying!!",3000, 5 ); // <---
            StopAudioStreamForPlayer(playerid);
            spraytimerx[playerid] = SetTimerEx( "killgr", 90000, true, "i", playerid );
        }
    }
	if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER && pDialog [ playerid ] == false)
	{
	    new vehicleid = GetPlayerVehicleID(playerid);

	    if(vehicleid && (PRESSED(KEY_SPRINT) || PRESSED(KEY_JUMP)))
	    {
	        new Float: health;
		    GetVehicleHealth(vehicleid, health);

			if(health <= 350.0) return SPD(playerid, 0000, DIALOG_STYLE_MSGBOX, "Perhatikan", "{FFFFFF}Mobil itu dalam kondisi kritis.", "Tutup", "");

	        GetVehicleParamsEx(vehicleid,engine,lights,alarm,doors,bonnet,boot,objective);

			if(!engine)
				SPD(playerid, 0000, DIALOG_STYLE_MSGBOX, "tekan /engine", "{FF0000}kendaraan belum hidup", "Tutup", "");

        	if(engine && Fuell[vehicleid] < 1.0 && IsVehicleHaveFuel(vehicleid))
				SPD(playerid, 0000, DIALOG_STYLE_MSGBOX, "Perhatikan", "{FFFFFF}Tidak ada bahan bakar dalam transportasi.", "Tutup", "");

            if(vehicle_owner_id[vehicleid] != INVALID_PLAYER_ID)
			{
			    new owner_id = vehicle_owner_id[vehicleid];

		        for(new x; x < MAX_PLAYER_VEHICLES; x++)
					if(vehicleid == player_home_car[owner_id][x] && player_car_keys[owner_id][x] == 0)
						SPD(playerid, 0000, DIALOG_STYLE_MSGBOX, "Perhatikan", "{FFFFFF}Tidak ada kunci kontak, gunakan: /key atau /car.", "Tutup", "");
		    }
		}
	}

    if(PRESSED(KEY_JUMP))
	{
	    if(GetPVarInt(playerid,"UseAnim"))
		{
			ClearAnim(playerid);
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
			GameTextForPlayer(playerid, "~r~Cancel the Animation", 1500, 1);
			DeletePVar(playerid,"UseAnim");
		}
	}

	if(!IsPlayerMobile(playerid) && PRESSED(KEY_JUMP | KEY_SPRINT) && GetPlayerState(playerid) == PLAYER_STATE_ONFOOT) ApplyAnimation(playerid,"PED","getup_front",4.0,0,0,0,0,0);

    if(GetPlayerWeapon(playerid) == 41 && IsAGang(playerid))
	{
	    if(PRESSED(KEY_FIRE)) SetPVarInt(playerid,"ColorFire", 1);
	    if(RELEASED(KEY_FIRE)) DeletePVar(playerid,"ColorFire");
	}

    if(GetPVarInt(playerid,"AntiSbiv") > gettime()) return true;

	if(steal_timer[playerid] != -1)
	{
		KillTimer(steal_timer[playerid]);
		steal_timer[playerid] = -1;

		ClearAnimations(playerid);

		SendClientMessage(playerid, COLOR_GREY, "Anda mengganggu pencurian bahan bakar!");
	}

	if(RELEASED(KEY_SPRINT))
	{
	    if(player_rob_id[playerid] != -1)
		{
		    if(player_rob_progress[playerid] > 0)
		    {
		        player_rob_progress[playerid] = 0;

		        PlayerStopTryOpenDoor(playerid);

		        SCM(playerid, COLOR_RED, "Anda memecahkan klip kertas, persetan dengan yang baru.");
		    }
		}
	}

	if(PRESSED(KEY_WALK))
	{
	    if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
	    {
	        for(new i, h = sizeof gate_open_pos; i < h; i++)
	        {
	            if(!PlayerToPoint(3.0, playerid, gate_open_pos[i][0], gate_open_pos[i][1], gate_open_pos[i][2])) continue;

				if(i == 0 && !IsAArmy(playerid)) return SCM(playerid, COLOR_GREY, "Hanya tersedia untuk tentara.");
				if(i == 1 && !IsAArmy(playerid)) return SCM(playerid, COLOR_GREY, "Hanya tersedia untuk tentara.");
				if(i == 2 && !IsACop(playerid)) return SCM(playerid, COLOR_GREY, "Hanya tersedia untuk polisi.");
				if(i == 3 && !IsACop(playerid)) return SCM(playerid, COLOR_GREY, "Hanya tersedia untuk tentara.");
				if(i == 4 && !IsACop(playerid)) return SCM(playerid, COLOR_GREY, "Hanya tersedia untuk tentara.");
				if(i == 5 && !IsAArmy(playerid)) return SCM(playerid, COLOR_GREY, "Hanya tersedia untuk tentara.");

				new Float: x, Float: y, Float: z;
				GetObjectPos(gate_obj[i], x, y, z);

	            if(gate_state[i]) MoveObject(gate_obj[i], x, y, z - 0.004, 0.004, gate_close_pos[i][3], gate_close_pos[i][4], gate_close_pos[i][5]);
	            if(!gate_state[i]) MoveObject(gate_obj[i], x, y, z + 0.004, 0.004, gate_open_pos[i][3], gate_open_pos[i][4], gate_open_pos[i][5]);

	            gate_state[i] = !gate_state[i];

	            break;
	        }
	    }

	    if(PlayerInfo[playerid][pBolnica])
	    {
	        new Float:shealth;
		    GetPlayerHealth(playerid, shealth);

		    if(shealth < 100 && player_lecenie[playerid] == -1)
			{
			    for(new i; i < MAX_HOSPITAL_BEDS; i++)
				{
			    	if(!PlayerToPoint(2, playerid, LoadKoika[i][0], LoadKoika[i][1], LoadKoika[i][2])) continue;

			    	new h_id = GetPlayerHospitalID(playerid);

		    	    if(zKoika[h_id][i] > 0) return Send(playerid, COLOR_GREY, "Tempat tidur ini ditempati oleh pasien lain....");
		        	zKoika[h_id][i] = 1;

					format(String, 96, "beristirahat...: %i\n{ffcc00}Wait...: %s", i+1, Name(playerid));
		        	UpdateDynamic3DTextLabelText(Koika[h_id][i], 0xFFFFFFFF, String);

					SCM(playerid, -1, "Untuk meninggalkan tempat tidur lu, gunakan: /leave");

		            player_lecenie[playerid] = i;

					//format(String, 322, ""W"Anda telah diberi resep perawatan.\nDurasi kursus tergantung pada kesehatan Anda.\n\nAnda harus berada di dekat tempat tidur Anda untuk pulih.\n{1599CF} Tempat tidurmu: "W"No%d", i+1);
					//SPD(playerid, 0000, DIALOG_STYLE_MSGBOX, "{ffff00}Tempat tidur", String, "Tutup", "");

					TogglePlayerControllable(playerid, false);

					SetPlayerPos(playerid, LoadKoika[i][0], LoadKoika[i][1], LoadKoika[i][2]);
					SetPlayerFacingAngle(playerid, LoadKoika[i][3]);

					ApplyAnimation(playerid,"CRACK","Crckidle2",4.1,1,0,0,0,0,0);

					break;
				}
			}
	    }

		if(player_rob_id[playerid] != -1)
	    {
	        new rob_id = player_rob_id[playerid],
				h_id = rob_info[rob_id][r_house];

			if(h_id != -1 && HouseInfo[h_id][hLock] == 1 && PlayerToPoint(1.5, playerid, HouseInfo[h_id][hEntrancex], HouseInfo[h_id][hEntrancey], HouseInfo[h_id][hEntrancez]))
			{
				if(PlayerInfo[playerid][pClip] == 0)
				    return SCM(playerid, COLOR_GREY, "Anda tidak memiliki staples untuk mendobrak pintu.");

				new vehicleid = rob_info[rob_id][r_vehicleid];

				new Float: dist = GetVehicleDistanceFromPoint(vehicleid, HouseInfo[h_id][hEntrancex], HouseInfo[h_id][hEntrancey], HouseInfo[h_id][hEntrancez]);

				if(dist > 30.0)
				    return SCM(playerid, COLOR_GREY, "Transportasi furnitur jauh dari rumah.");

				SetPlayerFaceToPoint(playerid, HouseInfo[h_id][hEntrancex], HouseInfo[h_id][hEntrancey]);

				player_rob_progress[playerid] = 1;

				TogglePlayerControllable(playerid, false);

			    PlayerInfo[playerid][pClip]--;

			    OnPlayerUpdateAccountsPer(playerid, "pClip", PlayerInfo[playerid][pClip]);

			    return SCM(playerid, -1, "Anda mulai meretas di rumah.");
			}

	        if(GetPVarInt(playerid, "take_house_item") == 0)
	        {
		        for(new i; i < MAX_ROB_ITEMS; i++)
		        {
		            if(!IsPlayerInDynamicArea(playerid, rob_house_area[i])) continue;

		            h_id = player_enter_home[playerid];

		            if(rob_house_obj[h_id][i] == 0) continue;

		            if(rob_obj_taked[h_id][i] == true) return 1;

		            if(rob_info[rob_id][r_loaded] >= 12) return SCM(playerid, COLOR_GREY, "Van tidak lagi memiliki tempat.");

		            SetPVarInt(playerid, "take_house_item", i + 1);

		        	ApplyAnimation(playerid,"CARRY","liftup",1.0,0,1,1,0,0,1);

		        	rob_obj_taked[h_id][i] = true;

		        	SetPlayerFaceToPoint(playerid, rob_item_pos[i][0], rob_item_pos[i][1]);

		        	SetPlayerAttachedObject(playerid, 7, rob_attach_model[i], 5,
												rob_attach_pos[i][0],rob_attach_pos[i][1],rob_attach_pos[i][2],
												rob_attach_pos[i][3],rob_attach_pos[i][4],rob_attach_pos[i][5],
												rob_attach_pos[i][6],rob_attach_pos[i][7],rob_attach_pos[i][8]);

		        	DestroyDynamicObject(rob_house_obj[h_id][i]);

		        	SetTimerEx("PlayerUseCarryAnim", 1500, false, "i", playerid);

		        	return SCM(playerid, 0xBC8F8Fff, "Anda mengambil item, kepala ke "W"Gerobak{BC8F8F} dan gunakan: "W"ALT{BC8F8F} di bagasi.");
				}
			}

			if(GetPVarInt(playerid, "take_house_item") != 0)
			{
			    new vehicleid = rob_info[rob_id][r_vehicleid];

			    new Float: old_x, Float: old_y, Float: old_z, Float: a;

			    GetVehiclePos(vehicleid, old_x, old_y, old_z);
			    GetVehicleZAngle(vehicleid, a);

			    new Float: x = old_x,
					Float: y = old_y;

			    GetXYInFront(x, y, a, -3.5);

			    if(PlayerToPoint(1.5, playerid, x, y, old_z))
			    {
			        SetPlayerFaceToPoint(playerid, old_x, old_y);

			        DeletePVar(playerid, "take_house_item");

			        SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);

			        ApplyAnimation(playerid,"CARRY","putdwn",4.0,0,1,1,0,0,1);

			        RemovePlayerAttachedObject(playerid, 7);

					rob_info[rob_id][r_loaded] ++;

					if(rob_info[rob_id][r_loaded] == 10) SetTimerEx("SendPlayerRobCopNotify", 10000, false, "i", rob_id);

					format(format_string, 64, "[ROB]: Item Dimuat: "W"%i/12", rob_info[rob_id][r_loaded]);
					SendMessageToRobPlayers(rob_id, 0x6495EDff, format_string);
			    }
			}
	    }

	    if(PlayerInfo[playerid][pJob] == WORK_TYPE_PIZZA)
	    {
		    new pizza_veh = GetNearestVehicle(playerid);

		    if(VehInfo[pizza_veh][vFr] == WORK_TYPE_PIZZA)
		    {
		        if(GetPVarInt(playerid, "take_pizza"))
		        {
					if(pizza_veh_have{pizza_veh} == 1) return SCM(playerid, COLOR_GREY, "Skuter sudah memiliki pizza.");

					pizza_veh_have{pizza_veh} = 1;

					DeletePVar(playerid, "take_pizza");

					SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
					RemovePlayerAttachedObject(playerid, 4);

					SCM(playerid, -1, "Kamu adalah {"#cGREEN"}telah diambil{FFFFFF} pizza di tangan.");

                    if(pizza_player_house[playerid] == -1) SCM(playerid, COLOR_GREEN, "Rumah itu ditandai di peta, ambil pizza di sana.");

					UpdatePlayerPizzaMark(playerid);
				}
				else
				{
				    if(pizza_veh_have{pizza_veh} == 0) return SCM(playerid, COLOR_GREY, "Tidak ada pizza di skuter.");

				    SCM(playerid, -1, "Kamu adalah {"#cRED"}taruh{FFFFFF} pizza dalam skuter.");

				    pizza_veh_have{pizza_veh} = 0;

				    SetPVarInt(playerid, "take_pizza", 1);

					SetPlayerAttachedObject(playerid, 4, 2814, 6, 0.0579, -0.0310, -0.1430, -108.9999, -13.1000, -2.0999, 1.0000, 1.0000, 1.0000);

			        SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
				}
		    }
		}
	}

	if(PRESSED(KEY_CTRL_BACK) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	{
	    if(PlayerToPoint(10.0, playerid, 1403.5734,1564.4446,1168.9860))
	    {
		    new vehicleid = GetPlayerVehicleID(playerid);

		    SetVehiclePos(vehicleid, 1552.7804,-1390.0651,14.0234);
		    SetVehicleZAngle(vehicleid, 268.1776);

		    SetPlayerInterior(playerid, 0);
			LinkVehicleToInterior(vehicleid, 0);

			SetPlayerVirtualWorld(playerid, 0);
			SetVehicleVirtualWorld(vehicleid, 0);
		}
	}

	if(PRESSED(KEY_YES))
	{
	    callcmd::accept(playerid);
	}

	if(PRESSED(KEY_NO))
	{
		callcmd::cancel(playerid);
	}

    /*new str[30];
	format(str,sizeof(str),"%d - newkeys, %d - oldkeys",newkeys,oldkeys);
	SendClientMessage(playerid,-1,str);*/
    if((newkeys & KEY_FIRE) || ( (newkeys & KEY_AIM) && (oldkeys & KEY_AIM) && (newkeys & KEY_SECONDARY_ATTACK) ) ) // Pertarungan animasi
	{
	    if(player_take_trash[playerid] != -1)
	    {
	        RemovePlayerAttachedObject(playerid, 4);

	        player_take_trash[playerid] = -1;

	        SendClientMessage(playerid, COLOR_RED, "Anda membuang sampah, pergi mengambilnya lagi.");
	    }
	}

	if(PRESSED(KEY_SPRINT))
	{
	    if(player_enter_home[playerid] != -1)
        {
	        new i = player_enter_home[playerid];

	        if(!HouseInfo[i][hUpdAD]) return 1;

	        new h_class = HouseInfo[i][hKlass];

	        if(PlayerToPoint(1.5, playerid, house_exit[h_class][0], house_exit[h_class][1], house_exit[h_class][2])) pc_cmd_exit(playerid);
		}

		if(IsARibaMest(playerid)) callcmd::fishing(playerid);

	    if(PlayerInfo[playerid][pJob] == 4 && GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
    	{
    	    if(player_take_trash[playerid] != -1)
			{
				new vehicleid = GetNearestVehicleID(playerid, 8.0);
				if(vehicleid == INVALID_VEHICLE_ID) return SendClientMessage(playerid, COLOR_GREY, "Tidak ada truk sampah di dekat guci!");

				new t_id = player_take_trash[playerid];
				new Float: dist = GetVehicleDistanceFromPoint(vehicleid, trash_info[t_id][t_pos][0], trash_info[t_id][t_pos][1], trash_info[t_id][t_pos][2]);

				if(dist < 3.0) return SCM(playerid, COLOR_GREY, "Sampah terlalu dekat dengan sampah.");

    			if(VehInfo[vehicleid][vFr] == 4)
				{
				    if(trash_vehicle_amount[vehicleid] + 10 > 500) return SendClientMessage(playerid, COLOR_GREY, "Truk sampah dimuat, pergi ke tempat pembuangan sampah dan bongkar sampah.");

				    new Float: pos_x, Float: pos_y, Float: pos_z;
				    GetVehiclePos(vehicleid, pos_x, pos_y, pos_z);
					GetXYInFrontOfVehicle(vehicleid, pos_x, pos_y, -4.0);

                    if(IsPlayerInRangeOfPoint(playerid, 1.5, pos_x, pos_y, pos_z))
					{
						UpdateVehicleTrashInfo(vehicleid, 10);

						RemovePlayerAttachedObject(playerid, 4);

						player_take_trash[playerid] = -1;

                        GivePlayerPayCheck(playerid, 150);

                        new owner_id = trash_vehicle_owner[vehicleid];
                        if(owner_id != INVALID_PLAYER_ID && trash_vehicle_amount[vehicleid] == 500)
                        {
                            SetPlayerCheckpoint(owner_id, -1892.6698,-1671.4285,23.0156, 3);
							PlayerPlaySound(owner_id, 1139, 0.0, 0.0, 0.0);
							Send(owner_id, -1, "Truk sampah terisi penuh, pergi ke tempat bongkar muat.");
							Send(owner_id, -1, "Tempat itu ditandai di peta. {ff0000}merah {ffffff}ditandai.");
							SetPVarInt(playerid, "GPS", 1);
                        }

						SendClientMessage(playerid, -1, "Anda menaruh sampah di truk sampah, menuju tas baru.");

						TogglePlayerControllable(playerid, false);

						SetCameraBehindPlayer(playerid);

						ApplyAnimation(playerid, "CAR_CHAT","CAR_Sc4_BL",4.0,0,1,1,0,0);

						SetTimerEx("ClearFreeze", 2000, false, "d", playerid);
					}
				}
			}

	        if(player_take_trash[playerid] == -1)
	        {
				for(new i; i < MAX_TRASH; i++)
				{
				    if(!IsPlayerInRangeOfPoint(playerid,2.0, trash_info[i][t_pos][0], trash_info[i][t_pos][1], trash_info[i][t_pos][2])) continue;

                    new vehicleid = GetNearestVehicleID(playerid, 30.0);
					if(vehicleid == INVALID_VEHICLE_ID || VehInfo[vehicleid][vFr] != 4) return SendClientMessage(playerid, COLOR_GREY, "Tidak ada truk sampah di dekat guci!");
					new Float: dist = GetVehicleDistanceFromPoint(vehicleid, trash_info[i][t_pos][0], trash_info[i][t_pos][1], trash_info[i][t_pos][2]);

					if(dist < 6.0) return SCM(playerid, COLOR_GREY, "Sampah terlalu dekat dengan sampah.");

				    if(trash_info[i][t_amount] < 10) return SendClientMessage(playerid, COLOR_GREY, "Tempat sampah kosong!");

				    UpdateTrashAmount(i, -10);

				    player_take_trash[playerid] = i;

					SetPlayerFaceToPoint(playerid, trash_info[i][t_pos][0], trash_info[i][t_pos][1]);

                    TogglePlayerControllable(playerid, false);

					SetCameraBehindPlayer(playerid);

					ApplyAnimation(playerid, "CAR_CHAT","CAR_Sc4_BL",4.0,0,1,1,0,0);

					SetTimerEx("ClearFreeze", 2000, false, "d", playerid);

					SetPlayerAttachedObject(playerid, 4, 1265, 5, 0.1860, -0.0290, -0.0360, 0.0000, -102.8999, 0.0000, 0.3240, 0.3300, 0.6430);

				    Send(playerid, -1, "Anda mengambil sampah, memasukkannya ke truk sampah! (Gunakan /drop - untuk membuang");
				    Send(playerid, -1, "{a86cfc}[Petunjuk]: "W"Untuk memasukkan sampah ke dalam truk sampah gunakan kuncinya: {FFA54F}*Lari* {ffffff}secara default: {FFA54F}*PROBEL*");

				    break;
				}
			}
		}

		if(PlayerInfo[playerid][pJob] == 5 && rent_job_vehicle[playerid] != INVALID_VEHICLE_ID && GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
 		{
		    if(player_take_collector[playerid] != -1)
			{
				new vehicleid = GetNearestVehicleID(playerid, 6.0);
				if(vehicleid == INVALID_VEHICLE_ID) return SendClientMessage(playerid, COLOR_GREY, "Tidak ada mesin pengumpul uang tunai di dekat ATM!");

				new c_id = player_take_collector[playerid];
				new Float: dist = GetVehicleDistanceFromPoint(vehicleid, AtmsInfo[c_id][aObjectPosX], AtmsInfo[c_id][aObjectPosY], AtmsInfo[c_id][aObjectPosZ]);

				if(dist < 3.0) return SCM(playerid, COLOR_GREY, "Sampah terlalu dekat dengan sampah.");

				if(VehInfo[vehicleid][vFr] == 5)
				{
				    if(collector_vehicle_amount[vehicleid] + 10 > 200) return SendClientMessage(playerid, COLOR_GREY, "Kendaraan koleksi diambil, pergi ke Bank Sentral dan bongkar paket.");

				    new Float: pos_x, Float: pos_y, Float: pos_z;
				    GetVehiclePos(vehicleid, pos_x, pos_y, pos_z);
					GetXYInFrontOfVehicle(vehicleid, pos_x, pos_y, -4.0);

		            if(IsPlayerInRangeOfPoint(playerid, 1.5, pos_x, pos_y, pos_z))
					{
						UpdateVehicleCollectorInfo(vehicleid, 10);

						RemovePlayerAttachedObject(playerid, 4);

						player_take_collector[playerid] = -1;

		                GivePlayerPayCheck(playerid, 20);

		                new owner_id = collector_vehicle_owner[vehicleid];
		                if(owner_id != INVALID_PLAYER_ID && collector_vehicle_amount[vehicleid] == 200)
						{
		                    SetPlayerCheckpoint(owner_id, 1361.3215,-1658.9114,13.3828, 3);
							PlayerPlaySound(owner_id, 1139, 0.0, 0.0, 0.0);
							Send(owner_id, -1, "Anda telah memuat kendaraan koleksi secara keseluruhan, pergi ke tempat bongkar muat.");
							Send(owner_id, -1, "Tempat itu ditandai di peta. {ff0000}merah {ffffff}ditandai.");
							SetPVarInt(playerid, "GPS", 1);
		                }

						TogglePlayerControllable(playerid, false);
                        SetTimerEx("ClearFreeze", 2000, false, "d", playerid);

                        SetCameraBehindPlayer(playerid);

						SendClientMessage(playerid, -1, "Anda menaruh tas di mobil koleksi, bonus ditambahkan ke gaji.");
						ApplyAnimation(playerid, "CAR_CHAT","CAR_Sc4_BL",4.0,0,1,1,0,0);
					}
				}
			}

		    if(player_take_collector[playerid] == -1)
		    {
				for(new i=1; i <= TotalAtms; i++)
				{
				    if(!IsPlayerInRangeOfPoint(playerid,2.0,  AtmsInfo[i][aObjectPosX], AtmsInfo[i][aObjectPosY], AtmsInfo[i][aObjectPosZ])) continue;
				    //if(!IsPlayerInRangeOfPoint(playerid,15.0,AtmsInfo[i][aAreaEnters])) continue;
		            new vehicleid = GetNearestVehicleID(playerid, 30.0);

		            if(vehicleid == INVALID_VEHICLE_ID || VehInfo[vehicleid][vFr] != 5) return SCM(playerid, COLOR_GREY, "Tidak ada mesin pengumpul uang tunai di dekat ATM!");

		            new Float: dist = GetVehicleDistanceFromPoint(vehicleid, AtmsInfo[i][aObjectPosX], AtmsInfo[i][aObjectPosY], AtmsInfo[i][aObjectPosZ]);

					if(dist < 6.0) return SCM(playerid, COLOR_GREY, "Kendaraan servis terlalu dekat dengan ATM.");

				    if(AtmsInfo[i][c_amount] < 10) return SendClientMessage(playerid, COLOR_GREY, "Tidak ada uang di ATM ini, pergi ke yang lain!");

				    UpdateCollectorAmount(i, -10);

				    player_take_collector[playerid] = i;

				    SetPlayerFaceToPoint(playerid, AtmsInfo[i][aObjectPosX], AtmsInfo[i][aObjectPosY]);

					SetPlayerAttachedObject(playerid, 4, 1550, 1, 0.0000, -0.2339, 0.0000, 0.0000, 89.6999, 170.1999, 1.0000, 1.0000, 1.0000);

                    TogglePlayerControllable(playerid, false);
                    SetTimerEx("ClearFreeze", 2000, false, "d", playerid);

                    SetCameraBehindPlayer(playerid);

				    SendClientMessage(playerid, COLOR_GREEN, "Anda mengambil uang itu, memasukkannya ke dalam van!");
				    ApplyAnimation(playerid, "CAR_CHAT","CAR_Sc4_BL",4.0,0,1,1,0,0);

				    break;
				}
			}
		}
	}
 	if((newkeys & KEY_FIRE) || (newkeys & KEY_HANDBRAKE) || (newkeys & KEY_CROUCH) || (newkeys & KEY_ACTION))
    {
        if(pTemp[playerid][pWork] == 1 && IsPlayerAttachedObjectSlotUsed(playerid, 4)) //|| pTemp[playerid][pLessStatus] && IsPlayerAttachedObjectSlotUsed(playerid, 4))
        {
        	ClearAnimations(playerid);
        	ApplyAnimation(playerid,"CARRY","crry_prtial",4.1,0,1,1,1,1);
        	ApplyAnimation(playerid,"CARRY","crry_prtial",4.1,0,1,1,1,1);
        	return 1;
        }
	}

	if(PRESSED(KEY_YES) && player_enter_fuel[playerid] > 0)
	{
	    return SPD(playerid,57,DIALOG_STYLE_LIST, "SPBU", ""W"1. Isi bahan bakar\n2. Beli tabung\n3. Informasi tentang pom bensin", "Pilih", "Keluar");
 	}

	if(newkeys & 17 && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)// Tombol ctrl
	{
  		callcmd::engine(playerid);
		return 1;
	}

	if(PRESSED(KEY_FIRE))// LMB, L.ALT
	{
	    if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT && pDialog [playerid] == false && IsPlayerInGreenZone(playerid))
		{
	        player_green_hits[playerid]++;

	        if(player_green_hits[playerid] == 5) return KickD(playerid, "Anda ditendang karena berkelahi di Area Green Zone.");

	        format(format_string, 188,
				"{FFFFFF}Anda berada di {33AA33}zona{FFFFFF} dimana kamu tidak bisa bertarung.\n\
				Ketika Anda mencoba lagi, Anda akan terputus dari server. (%i/5)",
                player_green_hits[playerid]
			);

            SPD(playerid, 0000, DIALOG_STYLE_MSGBOX, "Zona hijau", format_string, "Tutup", "");
		}

		//

		if(IsAGang(playerid))
		{
		    foreach(new i : capture_zone_list)
			{
				if(!PlayerToKvadrat(playerid,GZInfo[i][gPos][0], GZInfo[i][gPos][1],GZInfo[i][gPos][2],GZInfo[i][gPos][3])) continue;

				SPD(playerid, 0000, DIALOG_STYLE_MSGBOX, "Larangan menembak", "Pada saat ini, dilarang menembak dari PC saat dipotret!", "Tutup", "");

				break;
			}
		}

		//

		if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return 1;

		new vehicleid = GetPlayerVehicleID(playerid);

		if(IsABicycle(vehicleid)) return 1;

		GetVehicleParamsEx(GetPlayerVehicleID(playerid),engine,lights,alarm,doors,bonnet,boot,objective);
		if(lights == 0) SetVehicleParamsEx(GetPlayerVehicleID(playerid),engine,1,alarm,doors,bonnet,boot,objective);
		else SetVehicleParamsEx(GetPlayerVehicleID(playerid),engine,0,alarm,doors,bonnet,boot,objective);
		PlayerPlaySound(playerid, 4604, 0.0, 0.0, 0.0);
	}
	return 1;
}



