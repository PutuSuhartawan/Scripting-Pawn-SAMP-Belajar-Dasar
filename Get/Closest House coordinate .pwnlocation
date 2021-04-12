stock GetClosestHouse(playerid)
{
new
    cl_ID = -1,
Float:cl_DIST = 9999.0;

for(new i=1, l=MAX_HOUSES; i != l; i++)
{
    if(House[i][locked] != 1) continue;
if( GetPlayerDistanceToPointEx(playerid, House[i][House_x],  House[i][House_y], House[i][House_z]) < cl_DIST )
{
    cl_ID = i;
    cl_DIST = GetPlayerDistanceToPointEx(playerid, House[i][House_x],House[i][House_y],House[i][House_z]);
}
}
return cl_ID;
} 
