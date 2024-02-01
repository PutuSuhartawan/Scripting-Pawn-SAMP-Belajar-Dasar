

Function Definition:

CMD:teleport(playerid, params[]): This defines a command named "teleport" that can be used within a game or application. It takes two arguments:
playerid: The ID of the player who initiated the command.
params[]: An array of parameters provided with the command (e.g., coordinates).
Variable Declaration:

new Float:gotoPos[3];: Declares an array of three floating-point numbers named "gotoPos", likely to store the X, Y, and Z coordinates for teleportation.
Parameter Parsing:

if(sscanf(params, "fffdd", gotoPos[0], gotoPos[1], gotoPos[2], params[4], params[5])): This line attempts to parse the params array using the format "fffdd":
fff: Extracts three floating-point values (X, Y, Z coordinates) and stores them in the gotoPos array.
dd: Extracts two integers (world ID and interior ID) and stores them in params[4] and params[5].
Error Handling and Reminder:

return SendClientMessage(playerid, -1, "Caranya: /teleport (X) (Y) (Z) (world ID) (Interior ID) ");: If the parameter parsing fails, it sends a message to the player explaining the correct usage of the command.
GameTextForPlayer(playerid, "~r~Type /save to get the coordinate.", 10000, 5);: If parsing succeeds, it displays a message to the player suggesting using "/save" to get coordinates.
Teleportation and Player Control:

SetPlayerPos(playerid, gotoPos[0], gotoPos[1], gotoPos[2]);: Sets the player's position to the extracted coordinates.
SetPlayerVirtualWorld( playerid, params[4] );: Sets the player's virtual world to the specified world ID.
SetPlayerInterior(playerid, params[5]);: Sets the player's interior to the specified interior ID.
TogglePlayerControllable(playerid, 0);: Temporarily disables the player's control (likely to prevent unintended movement after teleportation).
Temporary Freeze and Unfreeze:

unfreezeplayer = playerid;: Assigns the player's ID to a variable named "unfreezeplayer" for later use.
SetTimer("UnFreezeMe",3000,0);: Sets a timer to call a function named "UnFreezeMe" after 3000 milliseconds (3 seconds), presumably to unfreeze the player.
Return Value:

return 1;: Indicates successful execution of the command.
Note: The code assumes the existence of a function named "UnFreezeMe" to restore player control after the timer expires, but its implementation is not provided.





CMD:teleport(playerid, params[])
{
	new Float:gotoPos[3];
	//sscanf(const data[], const format[], ...)

    if(sscanf(params, "fffdd", gotoPos[0], gotoPos[1], gotoPos[2], params[4], params[5])) return SendClientMessage(playerid, -1, "Caranya: /teleport (X) (Y) (Z) (world ID) (Interior ID) ");
    GameTextForPlayer(playerid, "~r~Type /save to get the coordinate.", 10000, 5);
	SetPlayerPos(playerid, gotoPos[0], gotoPos[1], gotoPos[2]);
    SetPlayerVirtualWorld( playerid, params[4] );
    SetPlayerInterior(playerid, params[5]);

    TogglePlayerControllable(playerid, 0); // supaya karakter yang spawn itu diam tidak bergerak
 	unfreezeplayer = playerid; // variabel playerid itu sama dengan variabel unfreeplayer
 	SetTimer("UnFreezeMe",3000,0);
    
    return 1;
}

/*

Function Definition:

CMD:teleport(playerid, params[]): This defines a command named "teleport" that can be used within a game or application. It takes two arguments:
playerid: The ID of the player who initiated the command.
params[]: An array of parameters provided with the command (e.g., coordinates).
Variable Declaration:

new Float:gotoPos[3];: Declares an array of three floating-point numbers named "gotoPos", likely to store the X, Y, and Z coordinates for teleportation.
Parameter Parsing:

if(sscanf(params, "fffdd", gotoPos[0], gotoPos[1], gotoPos[2], params[4], params[5])): This line attempts to parse the params array using the format "fffdd":
fff: Extracts three floating-point values (X, Y, Z coordinates) and stores them in the gotoPos array.
dd: Extracts two integers (world ID and interior ID) and stores them in params[4] and params[5].
Error Handling and Reminder:

return SendClientMessage(playerid, -1, "Caranya: /teleport (X) (Y) (Z) (world ID) (Interior ID) ");: If the parameter parsing fails, it sends a message to the player explaining the correct usage of the command.
GameTextForPlayer(playerid, "~r~Type /save to get the coordinate.", 10000, 5);: If parsing succeeds, it displays a message to the player suggesting using "/save" to get coordinates.
Teleportation and Player Control:

SetPlayerPos(playerid, gotoPos[0], gotoPos[1], gotoPos[2]);: Sets the player's position to the extracted coordinates.
SetPlayerVirtualWorld( playerid, params[4] );: Sets the player's virtual world to the specified world ID.
SetPlayerInterior(playerid, params[5]);: Sets the player's interior to the specified interior ID.
TogglePlayerControllable(playerid, 0);: Temporarily disables the player's control (likely to prevent unintended movement after teleportation).
Temporary Freeze and Unfreeze:

unfreezeplayer = playerid;: Assigns the player's ID to a variable named "unfreezeplayer" for later use.
SetTimer("UnFreezeMe",3000,0);: Sets a timer to call a function named "UnFreezeMe" after 3000 milliseconds (3 seconds), presumably to unfreeze the player.
Return Value:

return 1;: Indicates successful execution of the command.
Note: The code assumes the existence of a function named "UnFreezeMe" to restore player control after the timer expires, but its implementation is not provided. */
