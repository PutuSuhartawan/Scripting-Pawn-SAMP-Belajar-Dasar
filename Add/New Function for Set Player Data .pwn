
// ------------------------------------------
enum E_PLAYER_STRUCT // struktur pemain
{
	P_ACCOUNT_ID, 	// id akun
	float:P_BTC, // jumlah asset BTC
	P_REFER,		// referensi
	P_SEX,			// jenis kelamin pemain
	P_PASSWORD[64], // kata sandi pemain
	P_EMAIL[60 + 1],// email pemain
	bool: P_CONFIRM_EMAIL,// apakah email diverifikasi
	P_SKIN,			// kulit pemain
	P_PASS,         // Paspor
	P_MONEY,		// uang pemain
	P_BANK,			// uang di bank
	P_ADMIN,		// tingkat admin
	P_DRIVING_A,	// lisensi moto
	P_DRIVING_B,	// lisensi manajemen mobil
	P_DRIVING_C,	// surat izin mengemudi truk
	P_DRIVING_D,	// lisensi manajemen bus
	P_LIC_FLY,		// lisensi senjata
  
 }

new g_player[MAX_PLAYERS][E_PLAYER_STRUCT];


// ------------------------------------------
#define GetPlayerImprovementInfo(%0,%1) g_player_improvements[%0][%1]

// ------------------------------------------
#define GetPlayerPinCodeState(%0) 		pin_code_state[%0]
#define SetPlayerPinCodeState(%0,%1) 	pin_code_state[%0] = %1

// ------------------------------------------
#define GetPlayerSettingData(%0,%1)		g_player_setting[%0][%1]
#define SetPlayerSettingData(%0,%1,%2)	g_player_setting[%0][%1] = %2
#define AddPlayerSettingData(%0,%1,%2)	g_player_setting[%0][%1] += %2

// ------------------------------------------
#define GetPlayerData(%0,%1) 	g_player[%0][%1]
#define SetPlayerData(%0,%1,%2)	g_player[%0][%1] = %2 // this is was the idea
#define AddPlayerData(%0,%1,%2,%3) g_player[%0][%1] %2= %3

#define GetPlayerAccountID(%0)	GetPlayerData(%0, P_ACCOUNT_ID) 	// id akun
#define GetPlayerIpEx(%0)		GetPlayerData(%0, P_IP) 			// pemain ip
#define GetPlayerNameEx(%0)		GetPlayerData(%0, P_NAME) 			// nama pemain
#define GetPlayerColorEx(%0)	GetPlayerData(%0, P_COLOR)			// warna pemain
#define GetPlayerSelectSkin(%0)	GetPlayerData(%0, P_SELECT_SKIN) 	// kulit yang dipilih
#define GetPlayerLevel(%0)		GetPlayerData(%0, P_LEVEL)			// tingkat pemain
#define GetPlayerExp(%0)		GetPlayerData(%0, P_EXP)			// poin pengalaman pemain
#define GetPlayerSuspect(%0)	GetPlayerData(%0, P_SUSPECT)		// level yang diinginkan pemain
#define GetExpToNextLevel(%0)	((GetPlayerData(%0, P_LEVEL))*6) 	// poin pengalaman ke tingkat berikutnya
#define GetPlayerPhone(%0)		GetPlayerData(%0, P_PHONE)			// nomor telepon pemain
#define GetPlayerSex(%0)		GetPlayerData(%0, P_SEX)			// jenis kelamin pemain
#define GetPlayerSexName(%0)	GetPlayerData(%0, P_SEX) ? ("Perempuan") : ("Laki-laki") // nama gender
#define GetPlayerChatType(%0)	GetPlayerData(%0, P_CHAT_TYPE) 		// jenis obrolan
#define	GetPlayerAdminEx(%0)	GetPlayerData(%0, P_ADMIN) 			// tingkat admin
#define GetPlayerMoneyEx(%0)	GetPlayerData(%0, P_MONEY) 			// uang pemain
#define GetPlayerBankMoney(%0)	GetPlayerData(%0, P_BANK) 			// uang pemain
#define GetPlayerAFKTime(%0)	GetPlayerData(%0, P_AFK_TIME) 		// waktu afk


stock ClearFish(playerid, fish)
{
	if(GetPlayerData(playerid, P_USED_FISH) != -1)
	{
		SetPlayerData(playerid, P_USED_FISH, -1);
	}

	g_fish_pos_used[fish] = false;
	UpdateFish(fish);

	return 1;
}
