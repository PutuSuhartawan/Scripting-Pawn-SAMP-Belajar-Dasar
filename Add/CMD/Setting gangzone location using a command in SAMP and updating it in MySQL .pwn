

 script for setting gangzone location using a command in SAMP and updating it in MySQL:

PAWN
Copy code
new GangZone[MAX_GANGZONES][5], gangZoneID[MAX_GANGZONES];
stock CreateGangZone(Float:minx, Float:miny, Float:maxx, Float:maxy, color)
{
    for (new i = 0; i < MAX_GANGZONES; i++)
    {
        if (!gangZoneID[i])
        {
            gangZoneID[i] = i;
            GangZone[i][0] = minx;
            GangZone[i][1] = miny;
            GangZone[i][2] = maxx;
            GangZone[i][3] = maxy;
            GangZone[i][4] = color;
            return i;
        }
    }
    return -1;
}

stock DestroyGangZone(zone)
{
    if (gangZoneID[zone])
    {
        gangZoneID[zone] = 0;
        GangZone[zone][0] = 0.0;
        GangZone[zone][1] = 0.0;
        GangZone[zone][2] = 0.0;
        GangZone[zone][3] = 0.0;
        GangZone[zone][4] = 0;
        return 1;
    }
    return 0;
}

CMD:gz(playerid, params[])
{
    if(!IsPlayerAdmin(playerid)) return SendClientMessage(playerid, COLOR_RED, "You do not have permission to use this command.");
    if(sscanf(params, "ffffi", Float:gx1, Float:gy1, Float:gx2, Float:gy2, gzcolor))
    {
        new gz = CreateGangZone(gx1, gy1, gx2, gy2, gzcolor);
        if(gz != -1)
        {
            mysql_query(Handle, "INSERT INTO gangzone VALUES ({%d}, {%f}, {%f}, {%f}, {%f}, {%d})", gz, gx1, gy1, gx2, gy2, gzcolor);
            SendClientMessage(playerid, COLOR_LIGHTBLUE, "Gangzone created successfully.");
            GangZoneShowForPlayer(playerid, gz, 0);
        }
        else SendClientMessage(playerid, COLOR_RED, "The server reached the maximum number of gang zones.");
    }
    else SendClientMessage(playerid, COLOR_RED, "Invalid arguments. Use /gz [minx] [miny] [maxx] [maxy] [color]");
    return 1;
}
This script creates a command /gz for administrators to set the location of gangzones in the game. The location is stored in a multi-dimensional array GangZone and the ID of the gangzone is stored in gangZoneID.

When a gangzone is created using the /gz command, the coordinates and color of the gangzone are saved in MySQL using the mysql_query function.

You can customize this script to your needs and integrate it into your gamemode.
