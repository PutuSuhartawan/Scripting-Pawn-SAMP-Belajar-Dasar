
forward LoadBTC(playerid);
public LoadBTC(playerid)
{
					new
						Cache: result,
						query[100];

					mysql_format(mysql, query, sizeof query, "SELECT BTC FROM accounts WHERE id='%d'", GetPlayerAccountID(playerid));
					result = mysql_query(mysql, query, true);

					if(cache_num_rows())
					{
						g_player[playerid][P_BTC] = cache_get_row_float(0, 0);

					}

					cache_delete(result);
}



if(response)
				{
					new idx = GetPVarInt(playerid, "ownablecar_id"),
						Float: x,
						Float: y,
						Float: z,
						Cache: result,
						query[100];

					mysql_format(mysql, query, sizeof query, "SELECT pos_x, pos_y, pos_z FROM ownable_cars WHERE id='%d'", idx);
					result = mysql_query(mysql, query, true);

					if(cache_num_rows())
					{
						x = cache_get_row_float(0, 0);
						y = cache_get_row_float(0, 1);
						z = cache_get_row_float(0, 2);
					}

					cache_delete(result);

					switch(list_id)
					{
