GetRPName(playerid)
{
    new RPName[MAX_PLAYER_NAME], i_pos;
    GetPlayerName(playerid, RPName, MAX_PLAYER_NAME);
    while ((i_pos = strfind(RPName, "_", false, i_pos)) != -1) RPName[i_pos] = ' ';
    return RPName;
}
