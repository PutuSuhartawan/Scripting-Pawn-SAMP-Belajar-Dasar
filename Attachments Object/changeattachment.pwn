CMD:changeattachment(playerid, params [])
{
	// extract params ->

	new index;
	sscanf (params, "i", index);
	EditAttachedObject (playerid, index);
	return 1;
}