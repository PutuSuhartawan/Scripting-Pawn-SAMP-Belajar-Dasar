new BlackRadar;
#define PindahinOrangnya    SetPlayerPos
#define BuatZonaGang        GangZoneCreate

public OnGameModeInit()
{
BlackRadar= GangZoneCreate(-3334.758544, -3039.903808, 3049.241455, 3184.096191);
}

public OnPlayerSpawn(playerid)
{
//GangZoneHideForPlayer(playerid, BlackRadar);
GangZoneShowForPlayer(playerid, BlackRadar, 0x000000FF);
}
