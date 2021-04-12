public OnPlayerConnect(playerid)
{
    new version[11],
        string[32];
    GetPlayerVersion(playerid, version, sizeof(version));
    format(string, sizeof(string), "Your version of SA-MP: %s", version);
    SendClientMessage(playerid, 0xFFFFFFFF, string);
    // possible text: "Your version of SA-MP: 0.3.7"
   
    if (strcmp(version, "0.3.7")) {
        Kick(playerid);
        return 1;
    }
    return 1;
}
