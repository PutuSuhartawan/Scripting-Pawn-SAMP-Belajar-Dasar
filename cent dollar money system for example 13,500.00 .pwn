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

// credit https://www.facebook.com/ardiansyah.ii.1004/
// putu suhartawan samp scripting .pwn money format
