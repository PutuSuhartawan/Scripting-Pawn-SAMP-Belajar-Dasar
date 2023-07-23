/*




Q&A about sscanf:

Q: What is sscanf?

A: sscanf is a function in the C programming language that is used to scan formatted input from a string.

Q: How does sscanf work?

A: sscanf takes a string as input and a format string as a second argument. The format string specifies the type of data that is expected in the input string. sscanf then scans the input string and attempts to match the data to the format string. If the data matches the format string, sscanf stores the data in the variables that are specified in the format string.

Q: What are the benefits of using sscanf?

A: sscanf is a simple and efficient way to scan formatted input from a string. It is also a versatile function, as it can be used to scan a wide variety of data types.

Q: What are the limitations of using sscanf?

A: sscanf is not as secure as some other methods of scanning input. This is because sscanf does not perform any bounds checking, so it is possible for an attacker to inject malicious data into the input string.

Q: How do I use sscanf?

A: To use sscanf, you will need to first create a format string. The format string specifies the type of data that is expected in the input string. For example, the following format string specifies that the input string should contain an integer:

"%d"
Once you have created a format string, you can use sscanf to scan the input string. For example, the following code scans the input string and stores the integer value in the variable i:

int i;

sscanf(input_string, "%d", &i);





script for saving and loading player positions in a MySQL database:


pawn
Copy code

*/
#include <mysql>
#include <sscanf2>

new mysql:db;

// Connect to the MySQL database
public OnGameModeInit()
{
    db = mysql_connect("localhost", "username", "password", "database");
    if(!mysql_ping(db)) printf("Connected to MySQL database.");
    else printf("Failed to connect to MySQL database.");
    return 1;
}

// Save the player's position to the database
public OnPlayerDisconnect(playerid, reason)
{
    new Float:pos[3];
    GetPlayerPos(playerid, pos[0], pos[1], pos[2]);
    mysql_query(db, "UPDATE player_data SET pos_x=%f, pos_y=%f, pos_z=%f WHERE playerid=%d", pos[0], pos[1], pos[2], playerid);
    return 1;
}

// Load the player's position from the database
public OnPlayerSpawn(playerid)
{
    new Float:pos[3];
    mysql_query(db, "SELECT pos_x, pos_y, pos_z FROM player_data WHERE playerid=%d", playerid);
    mysql_store_result(db);
    mysql_fetch_row(db);
    sscanf(mysql_fetch_field_row(db, 0), "f", &pos[0]);
    sscanf(mysql_fetch_field_row(db, 1), "f", &pos[1]);
    sscanf(mysql_fetch_field_row(db, 2), "f", &pos[2]);
    SetPlayerPos(playerid, pos[0], pos[1], pos[2]);
    return 1;
}

//This script connects to a MySQL database using the mysql plugin and saves the player's position when they disconnect from the server, and loads their position when they spawn. The position data is stored in a table named player_data with columns playerid, pos_x, pos_y, and pos_z.

//Note that this is just a basic example and may need to be modified to suit your specific needs. You'll also need to have the mysql plugin installed and configured correctly in your SA-MP server.




CMD:whitelist(playerid, params[])
{


	new username[MAX_PLAYER_NAME];

	if(PlayerInfo[playerid][pAdmin] < 4)
	{
	    return SCM(playerid, COLOR_SYNTAX, "[SYSTEM]: "RED" Anda Tidak Diizinkan Menggunakan Perintah.");
	}
	if(sscanf(params, "s[24]", params))
	{
	    return SCM(playerid, COLOR_SYNTAX, "[USAGE]: /whitelist [username]");
	}

  	mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "INSERT INTO `whitelist` SET `username` ='%s", params);
   	mysql_tquery(connectionID, queryBuffer);
    PlayerInfo[playerid][pWhitelisted]=0;
    SAM(COLOR_YELLOW, "[SYSTEM]: "WHITE"  %s has whitelist %s's account.", GetRPName(playerid), params);
    Log_Write("log_admin", "%s (uid: %i) whitelist %s's account.", GetPlayerNameEx(playerid), PlayerInfo[playerid][pID], username);
    printf("[cmd] %s: [%s]", GetRPName(playerid), queryBuffer);





	/*
	// at the unlocked whitelist
	new username[MAX_PLAYER_NAME];

	if(PlayerInfo[playerid][pAdmin] < 4)
	{
	    return SCM(playerid, COLOR_SYNTAX, "[SYSTEM]: "RED" Anda Tidak Diizinkan Menggunakan Perintah.");
	}
	if(sscanf(params, "s[24]", username))
	{
	    return SCM(playerid, COLOR_SYNTAX, "[USAGE]: /whitelist [username]");
	}

	mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "SELECT locked FROM users WHERE username = '%e'", username);
	printf("[cmd] %s: [%s]", GetRPName(playerid), connectionID);
	mysql_tquery(connectionID, queryBuffer, "OnAdminUnlockAccount", "is", playerid, username);
	PlayerInfo[playerid][pLocked]=0;
	*/
	// end the unlocked whitelist
	return 1;
}
