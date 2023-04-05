 Pawn script that allows only the server owner and a whitelisted user to use RCON commands, and bans anyone else who attempts to use them:

scss
Copy code
#include <a_samp>
#include <sscanf2>

new const g_szRconPassword[] = "myrconpassword"; // replace with your RCON password
new const g_szWhitelistedUser[] = "whitelisteduser"; // replace with the username of the whitelisted user

public OnRconCommandPerformed(cmd[]) {
    new szPassword[MAX_PLAYER_NAME], szUser[MAX_PLAYER_NAME];
    GetRconPassword(szPassword, sizeof(szPassword));
    GetPlayerName(GetPlayerUserId(GetRconUserId()), szUser, sizeof(szUser));

    // Check if the user is the server owner or the whitelisted user
    if (!strcmp(szUser, "myserverowner") || !strcmp(szUser, g_szWhitelistedUser)) {
        // User is authorized to use RCON commands
        if (!strcmp(cmd, "myrconcommand1")) {
            // Handle RCON command 1
        } else if (!strcmp(cmd, "myrconcommand2")) {
            // Handle RCON command 2
        } else {
            SendRconCommandResult("Unknown command.");
        }
    } else {
        // User is not authorized to use RCON commands, ban them
        new szIP[16];
        GetPlayerIp(GetRconUserId(), szIP, sizeof(szIP));
        BanEx(GetRconUserId(), "Unauthorized RCON command usage.", "RCON", 86400); // ban for 1 day
        SendClientMessageToAll(-1, "{FF0000}[RCON] {FFFFFF}%s ({%06X}%s{FFFFFF}) has been banned for unauthorized RCON command usage.", szUser, GetPlayerColor(GetRconUserId()), szIP);
    }
    return 1;
}
To use this script, replace "myrconpassword" with your RCON password and "whitelisteduser" with the username of the user who should be allowed to use RCON commands. Add additional RCON commands as needed, and update the command handling code in the script accordingly.
