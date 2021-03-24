WeaponInfoFile(playerid)
{
	new name[MAX_PLAYER_NAME], file[40];

	GetPlayerName(playerid, name, sizeof(name));
	format(file, sizeof(file), "Weapons/%s.ini", name);

	return file;
}
