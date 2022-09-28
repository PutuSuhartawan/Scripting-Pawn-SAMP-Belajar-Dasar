stock Float:GetDistanceToPoint(playerid,Float:x1,Float:y1,Float:z1) //By Gabriel "Larcius" Cordes
{
    if (IsPlayerConnected(playerid))
    {
        new Float:x2,Float:y2,Float:z2;
        GetPlayerPos(playerid,x2,y2,z2);
        return GetDistanceBetweenPoints(x1,y1,z1,x2,y2,z2);
    }
    return INF_FLOAT;
}
