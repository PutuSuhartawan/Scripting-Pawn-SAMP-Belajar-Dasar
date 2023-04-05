Pawn script that detects if a player is using Cleo airbreak and bans them if they are:

scss
Copy code
#include <a_samp>

public OnPlayerUpdate(playerid) {
    new Float:vx, Float:vy, Float:vz;
    GetPlayerVelocity(playerid, &vx, &vy, &vz);
    if (vz > 0.1 && !IsPlayerAdmin(playerid)) {
        // Player is using airbreak
        new szIP[16];
        GetPlayerIp(playerid, szIP, sizeof(szIP));
        BanEx(playerid, "Cheating detected (airbreak).", "Cleo", 86400); // ban for 1 day
        SendClientMessageToAll(-1, "{FF0000}[Cheater] {FFFFFF}%s ({%06X}%s{FFFFFF}) has been banned for using airbreak.", GetPlayerName(playerid), GetPlayerColor(playerid), szIP);
    }
    return 1;
}
This script checks if the player's vertical velocity is greater than 0.1 (indicating they are moving upwards), and if they are not an admin. If both conditions are true, the script assumes the player is using airbreak and bans them for cheating.

To use this script, add it to your gamemode's script file and recompile your gamemode. Once the gamemode is running, the script will automatically detect any players using Cleo airbreak and ban them.
