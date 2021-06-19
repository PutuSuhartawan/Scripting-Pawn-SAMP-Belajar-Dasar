
public PayLog(string[])
{
	new entry[256];
	format(entry, sizeof(entry), "%s\n",string);
	new File:hFile;
	hFile = fopen("pay.log", io_append);
	fwrite(hFile, entry);
	fclose(hFile);
}
