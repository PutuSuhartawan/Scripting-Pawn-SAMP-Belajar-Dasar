To prevent player spawn bug after teleporting, you can try adding a delay before allowing the player to move again by modifying the `UnFreezeMe()` function like this:

```
public UnFreezeMe(playerid)
{
    SetCameraBehindPlayer(playerid);
    TogglePlayerControllable(playerid, 1);
    SendClientMessage(playerid, -1, "You can move now.");

    return 1;
}

CMD:teleport(playerid, params[])
{
    new Float:gotoPos[3];

    if(sscanf(params, "fffdd", gotoPos[0], gotoPos[1], gotoPos[2], params[4], params[5])) 
        return SendClientMessage(playerid, -1, "Usage: /teleport <X> <Y> <Z> <World ID> <Interior ID>");

    GameTextForPlayer(playerid, "~r~Type /save to get the coordinate.", 10000, 5);
    SetPlayerPos(playerid, gotoPos[0], gotoPos[1], gotoPos[2]);
    SetPlayerVirtualWorld(playerid, params[4]);
    SetPlayerInterior(playerid, params[5]);

    TogglePlayerControllable(playerid, 0);
    SetTimerEx("UnFreezeMe", 3000, false, "i", playerid); // add delay of 3 seconds

    return 1;
}

CMD:stats(playerid)
{
    new Float:x, Float:y, Float:z;
    new Float:facing, pekerjaan[50];
    new skinid = GetPlayerSkin(playerid);

    if(pInfo[playerid][pJobMechanic] == 1)
    {
        pekerjaan = ""COL_LIGHTBLUE"Mechanic";
    }
    else
    {
        pekerjaan = ""COL_GREEN"Tamu Kota";
    }

    GetPlayerPos(playerid, x, y, z);
    GetPlayerFacingAngle(playerid, facing);

    new infokarakter[1000];
    format(infokarakter, 1000, "Primary Job : [ %s ],"COL_RWHITE" Player Virtuarl : [ %d ], Player Interior : [ %d ] \n PlayerNameID: %s, DatabaseID: %i, \nPassword: "COL_RED"[ %s ], Skin ID: [ %d ],\n "COL_YELLOW" Coordinat location: %0.1f, %0.1f, %0.1f, Player Angeling: %0.1f. \nLogin Status (%i), "COL_WHITE"Time Played : [ "COL_BLUE"%d hours, %d minutes, %d seconds "COL_WHITE"], Money: "COL_LGREEN" [$%s],",
        pekerjaan, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid), pInfo[playerid][Nick], pInfo[playerid][ID], pInfo[playerid][PasswordAccount], skinid, x, y, z, facing, pInfo[playerid][Logged], pInfo[playerid][pHours], pInfo[playerid][pMinutes], pInfo[playerid][pSeconds], FormatMoney(pInfo[playerid][pMoney]));

    ShowPlayerDialog(playerid, RESPONDDIALOGKOSONG, DIALOG_STYLE_MSGBOX, "Player Statistic", infokarakter, "Understand", "");
}
```

In the `CMD:teleport()` function, we added a 3-second delay using `SetTimerEx()` and passed the `playerid` to the `UnFreezeMe()` function using the `i` format specifier. The `UnFreezeMe()` function will then set the player to controllable and show a
