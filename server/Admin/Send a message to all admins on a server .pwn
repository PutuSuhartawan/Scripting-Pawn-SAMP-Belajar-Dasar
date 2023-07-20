
The GetPlayerInfo function in Pawn script is used to get information about a player. The function takes one parameter: the player ID of the player to get information about.

The GetPlayerInfo function returns a table of information about the player. The table contains the following information:

The player's name
The player's IP address
The player's ping
The player's admin level
The admin level of a player is a number that indicates the player's level of access to administrative commands. The higher the player's admin level, the more access the player has to administrative commands.

The admin level of a player is stored in the pAdminLevel variable in the PlayerInfo table. The pAdminLevel variable is an integer that can have the following values:

0: The player is not an admin.
1: The player has a low level of access to administrative commands.
2: The player has a medium level of access to administrative commands.
3: The player has a high level of access to administrative commands.
4: The player has root access to the server.
Here is an example of how to use the GetPlayerInfo function to get the admin level of a player:

Code snippet
int playerid = GetPlayerID("player_name");
int adminLevel = GetPlayerInfo(playerid, "pAdminLevel");

switch (adminLevel)
{
    case 0:
        // The player is not an admin.
        break;
    case 1:
        // The player has a low level of access to administrative commands.
        break;
    case 2:
        // The player has a medium level of access to administrative commands.
        break;
    case 3:
        // The player has a high level of access to administrative commands.
        break;
    case 4:
        // The player has root access to the server.
        break;
}






GetPlayerAdminLevel enum in Pawn script is used to get the admin level of a player. The enum has the following values:

ADMIN_NONE: The player is not an admin.
ADMIN_LOW: The player has a low level of access to administrative commands.
ADMIN_MEDIUM: The player has a medium level of access to administrative commands.
ADMIN_HIGH: The player has a high level of access to administrative commands.
ADMIN_ROOT: The player has root access to the server.
The GetPlayerAdminLevel enum is defined as follows:

Code snippet
enum AdminLevel
{
    ADMIN_NONE = 0,
    ADMIN_LOW = 1,
    ADMIN_MEDIUM = 2,
    ADMIN_HIGH = 3,
    ADMIN_ROOT = 4
};
Use code with caution. Learn more
The GetPlayerAdminLevel function takes one parameter: the player ID of the player to check. The function returns the admin level of the player.

Here is an example of how to use the GetPlayerAdminLevel enum:

Code snippet
AdminLevel adminLevel = GetPlayerAdminLevel(playerid);

switch (adminLevel)
{
    case AdminLevel.ADMIN_NONE:
        // The player is not an admin.
        break;
    case AdminLevel.ADMIN_LOW:
        // The player has a low level of access to administrative commands.
        break;
    case AdminLevel.ADMIN_MEDIUM:
        // The player has a medium level of access to administrative commands.
        break;
    case AdminLevel.ADMIN_HIGH:
        // The player has a high level of access to administrative commands.
        break;
    case AdminLevel.ADMIN_ROOT:
        // The player has root access to the server.
        break;
}





The IsPlayerAdmin function in Pawn script is used to check if a player is an admin on a server. The function takes one parameter: the player ID of the player to check.

The IsPlayerAdmin function is defined as follows:

Code snippet
public IsPlayerAdmin(int playerid)
{
    return (GetPlayerAdminLevel(playerid) >= 1);
}
Use code with caution. Learn more
The IsPlayerAdmin function first gets the player's admin level. The player's admin level is a number that indicates the player's level of access to administrative commands. The higher the player's admin level, the more access the player has to administrative commands.

If the player's admin level is greater than or equal to 1, the IsPlayerAdmin function returns 1. This means that the player is an admin. If the player's admin level is less than 1, the IsPlayerAdmin function returns 0. This means that the player is not an admin.

Here is an example of how to use the IsPlayerAdmin function:

Code snippet
if (IsPlayerAdmin(playerid))
{
    // The player is an admin.
}
else
{
    // The player is not an admin.







The SAM function in Pawn script is used to send a message to all admins on a server. The function takes two parameters: the first parameter is the color of the message, and the second parameter is the text of the message.

The SAM function is defined as follows:

Code snippet
public SAM(color color, const string text)
{
    for (int i = 0; i < MaxPlayers; i++)
    {
        if (IsPlayerAdmin(i))
        {
            SendClientMessage(i, color, text);
        }
    }
}
Use code with caution. Learn more
The SAM function first loops through all the players on the server. For each player, the function checks if the player is an admin. If the player is an admin, the function then sends the message to the player.

The color parameter of the SAM function can be one of the following values:

COLOR_RED
COLOR_GREEN
COLOR_YELLOW
COLOR_BLUE
COLOR_WHITE
The text parameter of the SAM function can be any string.

Here is an example of how to use the SAM function:

Code snippet
SAM(COLOR_YELLOW, "Warning: Player %s has been banned.", GetRPName(playerid));
Use code with caution. Learn more
This code would send a yellow warning message to all admins on the server, informing them that the player with the name playerid has been banned.








The code you provided is a Pawn script that is used to check if a player is whitelisted on a server. If the player is not whitelisted, the script will send a warning message to the admin and kick the player from the server.

The first line of code, if(PlayerInfo[playerid][pWhitelistLocked]== 1), checks if the value of the pWhitelistLocked variable for the player is equal to 1. This variable is set to 1 if the player is not whitelisted on the server.

If the value of the pWhitelistLocked variable is equal to 1, the script will then send two messages. The first message, SAM(COLOR_YELLOW, "Warning: %s has been autokicked for trying to login without whitelist).", GetRPName(playerid), is sent to the admin of the server. This message warns the admin that the player has been automatically kicked from the server because they are not whitelisted.

The second message, SCM(playerid, COLOR_WHITE, "Im sorry, we are from "SVRCLR""SERVER_NAME""WHITE". We are try kick you for your name need to be whitelisted first.), is sent to the player who is being kicked. This message apologizes to the player and explains that they are being kicked because their name is not whitelisted on the server.

The final line of code, //KickPlayer(playerid);, kicks the player from the server. This line of code is commented out, so it will only be executed if the pWhitelistLocked variable is equal to 1 and the admin has notwhitelisted the player's name.






  if(PlayerInfo[playerid][pWhitelistLocked]== 1)
    {
        SAM(COLOR_YELLOW, "Warning: %s has been autokicked for trying to login without whitelist).", GetRPName(playerid));
       	SCM(playerid, COLOR_WHITE, "Im sorry, we are from "SVRCLR""SERVER_NAME""WHITE". We are try kick you for your name need to be whitelisted first.");
 		//KickPlayer(playerid); kick player whan the name player are not whitelisted
    }
