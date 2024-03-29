
//#if defined DISCORD
#include <discord-connector>
#include <discord-command>
#define GUILDSVR  "1194953235702747166" // SERVER 
#define VCLOBBY   "897377320590016542" // VOICECHATS
#define VCDELUXESHOT   "1202945933143310356" // VOICECHATS
#define VCFACTION "897377936057974796"
#define VCGANG 	  "897377995478667306"
#define VCHELPER  "897377801525661739"
#define VCADMIN   "897374971033186304"
//#endif


/*

Here's why the code snippet uses defines in that manner:

1. Conditional Compilation:

The #if defined DISCORD directive controls which parts of the code are compiled based on whether a specific compiler flag is set. This allows for code customization for different environments or platforms.
2. Discord-Specific Code:

The code within the #if defined DISCORD block is intended for use with Discord-related functionality. This includes:
Including header files for Discord interaction (<discord-connector> and <discord-command>).
Defining constants related to Discord server and voice channels.
3. Separating Discord-Specific Logic:

By using #if preprocessor directives, the code ensures that:
Discord-specific code is only included when necessary, avoiding potential issues if the code is compiled for a non-Discord environment.
The code is more organized and maintainable, as Discord-related sections are clearly marked.
4. Constant Definitions:

The #define directives create constants for:
GUILDSVR: The Discord server ID.
VCLOBBY, VCDELUXESHOT, VCFACTION, VCGANG, VCHELPER, VCADMIN: IDs of specific voice channels within the server.
Reasons for using constants:
Readability: Using meaningful names enhances code clarity.
Maintainability: Updating a constant's value requires changes in only one place.
Flexibility: Constants can be easily adjusted for different servers or channels.
In summary:

The code snippet conditionally includes Discord-related code and defines constants for server and channel IDs to:
Organize and manage Discord-specific logic effectively.
Improve code readability and maintainability.
Provide flexibility for adapting to different Discord environments.

*/



CMD:fa(playerid, params[])

{
	SCM(playerid, COLOR_WHITE, "You are just make annoucement");
    if(GetFactionType(playerid) == FACTION_BURGER)
    {
        SCM(playerid, COLOR_WHITE, "You are from Resto Deluxeshot");
        SCMA(COLOR_WHITE, "---------- * Resto Deluxeshot Announcement * ----------");
        SMA(COLOR_ORANGE, "** %s %s: %s", FactionRanks[PlayerInfo[playerid][pFaction]][PlayerInfo[playerid][pFactionRank]], GetRPName(playerid), params);
        Dyuze(playerid, "Resto Deluxeshot Announcement", "Trimakasi telah berkabar");
        DCC_SendChannelMessage(DCC_FindChannelById(VCDELUXESHOT), params);
		//return SCM(playerid,COLOR_ORANGE, "Resto Deluxeshot annoucement by %s"WHITE": %s", GetRPName(playerid), params);
	}
	return 1;
}


/*

Here's my explanation of how the bot finds the channel based on the code snippet you provided:

1. Triggering the Command:

The code defines a command named fa. When a player executes this command, the function CMD:fa is invoked.
2. Checking Player Faction:

The function first confirms if the player belongs to the "BURGER" faction using GetFactionType(playerid).
3. Targeting Specific Faction:

If the player is indeed part of the "BURGER" faction, the code proceeds to handle announcements for that faction.
4. Finding the Channel:

The crucial part for channel identification happens here:
DCC_FindChannelById(VCDELUXESHOT): This line calls a function named DCC_FindChannelById.
VCDELUXESHOT: This constant presumably holds a unique channel identifier, likely a numerical ID or a specific string representing the channel's name.
Purpose: The function's role is to retrieve a channel object based on the provided ID. It likely:
Accesses a database or internal structure where channel information is stored.
Searches for a match based on the VCDELUXESHOT identifier.
If successful, it returns a channel object representing the desired channel.
5. Sending the Message:

DCC_SendChannelMessage(DCC_FindChannelById(VCDELUXESHOT), params): This line sends the announcement message to the retrieved channel.
It calls a function named DCC_SendChannelMessage, passing:
The channel object returned by DCC_FindChannelById.
The params array, likely containing the message content.
Key Points:

The bot relies on a function named DCC_FindChannelById to locate channels based on their unique identifiers.
The specific implementation of this function, as well as the mechanism for storing and managing channel information, would depend on the bot's underlying framework or platform.
*/
