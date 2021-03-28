#include <a_samp>
#include <a_mysql> // MySQL plugin R41-4


SavePlayer(playerid) // ini adalah fungsi callback saveplayer untuk simpan data ke mysql
{
        // simpan posisi mobil.
        GetVehiclePos(mobilplayer1[playerid], Float:pInfo[playerid][pMx], Float:pInfo[playerid][pMy], Float:pInfo[playerid][pMz]);

	    new kordinatmobil[500];
	   	format(kordinatmobil, 500, "UPDATE `playerdata` SET `pmx` = '%f',`pmy` = '%f',`pmz` = '%f' WHERE `id` = '%i' LIMIT 1", Float:pInfo[playerid][pMx], Float:pInfo[playerid][pMy], Float:pInfo[playerid][pMz], pInfo[playerid][ID]);
	    mysql_query(MySQL:g_Sql, kordinatmobil[499], bool:true);
	    SendClientMessage(playerid, -1, kordinatmobil);
	    
	    printf("Mobil pindah posisi ke %f, %f, %f ke pemilik ID %i", Float:pInfo[playerid][pMx], Float:pInfo[playerid][pMy], Float:pInfo[playerid][pMz], pInfo[playerid][ID]);
    
		//this basically gets the variables and stores it to the players special identifier called "ID".
      // ini untuk kasi tau kalau sudah selesai penyembutan posisinya.
    new Float:healthmp1;
    GetVehicleHealth(mobilplayer1[playerid], Float:healthmp1);
    
    return 1;
}
