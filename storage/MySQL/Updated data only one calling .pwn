


forward OnAdminLockAccount(playerid, username[]);
public OnAdminLockAccount(playerid, username[])
{
	/*
    if(!cache_get_row_count(connectionID))
	{
	    SCM(playerid, COLOR_SYNTAX, "The player specified doesn't exist.");
	}
	else
	*/
	{
	    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET locked = 1 WHERE username = '%e'", username);
	    mysql_tquery(connectionID, queryBuffer);

	    SAM(COLOR_YELLOW, "[SYSTEM]: "WHITE"  %s has unwhitelist %s's account.", GetRPName(playerid), username);
	    Log_Write("log_admin", "%s (uid: %i) whitelist %s's account.", GetPlayerNameEx(playerid), PlayerInfo[playerid][pID], username);
	}
}



The code you provided is a forward function that is called when an admin locks an account. The code first checks to see if the player specified exists. If the player does not exist, the code sends a message to the player. Otherwise, the code updates the users table in the MySQL database to set the locked field to 1. The code then sends a message to the admin and writes a log message to the server log.

Here are some things you can learn from this code:

How to use the forward keyword to define a forward function.
How to check if a player exists using the cache_get_row_count() function.
How to update a MySQL table using the mysql_format() and mysql_tquery() functions.
How to send a message to a player using the SCM() function.
How to write a log message to the server log using the Log_Write() stock.
