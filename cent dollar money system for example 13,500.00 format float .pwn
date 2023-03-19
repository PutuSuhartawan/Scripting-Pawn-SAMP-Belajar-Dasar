//-------------------------------------------
// return PVar entry as 'name'='value' string
stock FormatMoney(amount, delimiter[2]=".", comma[2]=",") // first type data on stock variable amount just has a integer.
// make stock for head new fungsition formating how money cent read with coma and dot
{
  #define MAX_MONEY_String 16
  new MoneyAtString[MAX_MONEY_String];
  format(MoneyAtString, MAX_MONEY_String, "%d", amount);
  new l = strlen(MoneyAtString);
  if (amount < 0) // - value (minus)
  {
    if (l > 2) strins(MoneyAtString,delimiter,l-2); // cent
    if (l > 5) strins(MoneyAtString,comma,l-5); // tousand
    if (l > 8) strins(MoneyAtString,comma,l-8); // million
  }
  else
  {//1000000 , so strins is adding new chacter like (,) or (.)
    if (l > 2) strins(MoneyAtString,delimiter,l-2);
    if (l > 5) strins(MoneyAtString,comma,l-5);
    if (l > 9) strins(MoneyAtString,comma,l-8);
  }
  if (l <= 2) format(MoneyAtString,sizeof( MoneyAtString),"00,%s",MoneyAtString);
  return MoneyAtString; // this value integer has been changed to string.
}


CMD:stats(playerid)
{
	new Float:x,Float:y,Float:z;
	new Float:facing, pekerjaan[50];
	new skinid = GetPlayerSkin(playerid);
	// ini untuk cmd /stats

	//pInfo[playerid][pJobMechanic] = 1; //percobaan ganti string

	if(pInfo[playerid][pJobMechanic] == 1)
	{
		pekerjaan = ""COL_LIGHTBLUE"Mechanic";
	}
	else
	{
		pekerjaan = ""COL_GREEN"Tamu Kota";
	}

    GetPlayerPos(playerid, x, y, z);
    GetPlayerFacingAngle(playerid, facing);

	new infokarakter[1000];
	format(infokarakter, 1000, "Primary Job : [ %s ],"COL_RWHITE" Player Virtuarl : [ %d ], Player Interior : [ %d ] \n PlayerNameID: %s, DatabaseID: %i, \nPassword: "COL_RED"[ %s ], Skin ID: [ %d ],\n "COL_YELLOW" Coordinat location: %f, %f, %f, Player Angeling: %f. \nLogin Status (%i), "COL_WHITE"Time Played : [ "COL_BLUE"%d hours, %d minutes, %d seconds "COL_WHITE"], Money: "COL_LGREEN" [$%s],",
	pekerjaan, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid), pInfo[playerid][Nick], pInfo[playerid][ID], pInfo[playerid][PasswordAccount], skinid, x, y, z, facing, pInfo[playerid][Logged], pInfo[playerid][pHours], pInfo[playerid][pMinutes], pInfo[playerid][pSeconds], FormatMoney( pInfo[playerid][pMoney] ) );
	ShowPlayerDialog(playerid, RESPONDDIALOGKOSONG, DIALOG_STYLE_MSGBOX, "Player Statistic", infokarakter, "Understand", "");

}



/* ORIGINAL STOCK
stock FormatMoney(Float:amount, delimiter[2]=".", comma[2]=",")
// make stock for head new fungsition formating how money cent read with coma and dot
{
	#define MAX_MONEY_String 16
	new txt[MAX_MONEY_String];
	format(txt, MAX_MONEY_String, "%d", floatround(amount));
	new l = strlen(txt);
	if (amount < 0) // -
	{
		if (l > 2) strins(txt,delimiter,l-2); // cent
		if (l > 5) strins(txt,comma,l-5); // tousand
		if (l > 8) strins(txt,comma,l-8); // million
	}
	else
	{//1000000 , so strins is adding new chacter like (,) or (.)
		if (l > 2) strins(txt,delimiter,l-2);
		if (l > 5) strins(txt,comma,l-5);
		if (l > 9) strins(txt,comma,l-8);
	}
//	if (l <= 2) format(txt,sizeof( szStr ),"00,%s",txt);
	return txt;
}
*/
// credit https://www.facebook.com/ardiansyah.ii.1004/
// putu suhartawan samp scripting .pwn money format
