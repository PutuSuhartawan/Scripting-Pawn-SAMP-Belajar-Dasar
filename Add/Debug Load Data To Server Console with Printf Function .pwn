
forward LoadxVehicles();
public LoadxVehicles()
{
	
	new rows = cache_num_rows();
	printf("[xVehicle] Kendaraan di table yang di temukan adalah sejumlah (%d kendaraan)", rows);
	new id=0; new loaded=1;
 	if(rows > 1)
  	{
		printf("[xVehicle] Mengambil data kendaraan di bari ke (%d)", loaded);
		while(loaded < rows)
		{
  			cache_get_value_name_int(loaded, "ID", id);
	    	cache_get_value_name(loaded, "Sahip", xVehicle[id][xv_Sahip], 30);
		    cache_get_value_name_int(loaded, "Fiyat", xVehicle[id][xv_Fiyat]);
		    cache_get_value_name_float(loaded, "X", xVehicle[id][xv_Pos][0]);
		    cache_get_value_name_float(loaded, "Y", xVehicle[id][xv_Pos][1]);
		    cache_get_value_name_float(loaded, "Z", xVehicle[id][xv_Pos][2]);
		    cache_get_value_name_float(loaded, "A", xVehicle[id][xv_Pos][3]);
		    cache_get_value_name_float(loaded, "darahbyricho", xVehicle[id][xv_darahbyricho]);
		    cache_get_value_name_int(loaded, "bensin", xVehicle[id][xv_bensin]);
		    cache_get_value_name_int(loaded, "taneman", xVehicle[id][xv_taneman]);
		    cache_get_value_name_int(loaded, "kayu", xVehicle[id][xv_kayu]);
		    cache_get_value_name_int(loaded, "boxtrucker", xVehicle[id][xv_boxtrucker]);
		    cache_get_value_name_int(loaded, "tirelock", xVehicle[id][xv_tirelock]);
		    cache_get_value_name_int(loaded, "lockstats", xVehicle[id][xv_lockstats]);
		    cache_get_value_name_int(loaded, "object1", xVehicle[id][xv_object][0]);
		    cache_get_value_name_int(loaded, "object2", xVehicle[id][xv_object][1]);
		    cache_get_value_name_float(loaded, "op1", xVehicle[id][xv_objectpos][0]);
		    cache_get_value_name_float(loaded, "op2", xVehicle[id][xv_objectpos][1]);
		    cache_get_value_name_float(loaded, "op3", xVehicle[id][xv_objectpos][2]);
		    cache_get_value_name_float(loaded, "op4", xVehicle[id][xv_objectpos][3]);
		    cache_get_value_name_float(loaded, "op5", xVehicle[id][xv_objectpos][4]);
		    cache_get_value_name_float(loaded, "op6", xVehicle[id][xv_objectpos][5]);
		    cache_get_value_name_float(loaded, "op7", xVehicle[id][xv_objectpos][6]);
		    cache_get_value_name_float(loaded, "op8", xVehicle[id][xv_objectpos][7]);
		    cache_get_value_name_float(loaded, "op9", xVehicle[id][xv_objectpos][8]);
		    cache_get_value_name_float(loaded, "op10", xVehicle[id][xv_objectpos][9]);
		    cache_get_value_name_float(loaded, "op11", xVehicle[id][xv_objectpos][10]);
		    cache_get_value_name_float(loaded, "op12", xVehicle[id][xv_objectpos][11]);
		    cache_get_value_name_int(loaded, "HizliPark", xVehicle[id][xv_HizliPark]);
		    cache_get_value_name_int(loaded, "Model", xVehicle[id][xv_ModelID]);
		    cache_get_value_name_int(loaded, "Renk1", xVehicle[id][xv_Renk][0]);
		    cache_get_value_name_int(loaded, "Renk2", xVehicle[id][xv_Renk][1]);
			cache_get_value_name(loaded, "Plaka", xVehicle[id][xv_Plaka], 8);
			cache_get_value_name_int(loaded, "Garajda", xVehicle[id][xv_Garajda]);
		    cache_get_value_name_int(loaded, "PJ", xVehicle[id][xv_Paintjob]);
		    cache_get_value_name_int(loaded, "Parca1", xVehicle[id][xv_Parca][0]);
		    cache_get_value_name_int(loaded, "Parca2", xVehicle[id][xv_Parca][1]);
		    cache_get_value_name_int(loaded, "Parca3", xVehicle[id][xv_Parca][2]);
		    cache_get_value_name_int(loaded, "Parca4", xVehicle[id][xv_Parca][3]);
		    cache_get_value_name_int(loaded, "Parca5", xVehicle[id][xv_Parca][4]);
		    cache_get_value_name_int(loaded, "Parca6", xVehicle[id][xv_Parca][5]);
		    cache_get_value_name_int(loaded, "Parca7", xVehicle[id][xv_Parca][6]);
		    cache_get_value_name_int(loaded, "Parca8", xVehicle[id][xv_Parca][7]);
		    cache_get_value_name_int(loaded, "Parca9", xVehicle[id][xv_Parca][8]);
		    cache_get_value_name_int(loaded, "Parca10", xVehicle[id][xv_Parca][9]);
		    cache_get_value_name_int(loaded, "Parca11", xVehicle[id][xv_Parca][10]);
		    cache_get_value_name_int(loaded, "Parca12", xVehicle[id][xv_Parca][11]);
		    cache_get_value_name_int(loaded, "Parca13", xVehicle[id][xv_Parca][12]);
		    cache_get_value_name_int(loaded, "Parca14", xVehicle[id][xv_Parca][13]);

			if(!xVehicle[id][xv_Garajda])
			{
				xVehicle[id][xv_Veh] = CreateVehicle(xVehicle[id][xv_ModelID], xVehicle[id][xv_Pos][0], xVehicle[id][xv_Pos][1], xVehicle[id][xv_Pos][2], xVehicle[id][xv_Pos][3], xVehicle[id][xv_Renk][0], xVehicle[id][xv_Renk][1], -1);
				//xVehicle][id][xv_Veh] = id; xVeh[id] = id;
				SetVehicleNumberPlate(xVehicle[id][xv_Veh], xVehicle[id][xv_Plaka]);
				printf("[xVehicle] Kendaraan berplate %s telah spawn", xVehicle[id][xv_Plaka]);
				SetVehicleToRespawn(xVehicle[id][xv_Veh]);
			}
			else
			{
				printf("[xVehicle] Kendaraan model %d dengan plate %s gagal spawn", xVehicle[id][xv_ModelID], xVehicle[id][xv_Plaka]);
			}
			Iter_Add(xVehicles, id);
			loaded++;

			if(!strlen(xVehicle[id][xv_Sahip]))
			{
				//new str[150];
				format(str, sizeof(str), "{00FF00}Kendaraan Ini Dijual!\n{FFA500}Nama Kendaraan : {FFFFFF}%s\n{FFA500}Plate Number: {FFFFFF}%s\n{FFA500}Price: {00FF00}$%d", GetVehicleNameFromModel(xVehicle[id][xv_ModelID]), xVehicle[id][xv_Plaka], xVehicle[id][xv_Fiyat]);
				xVehicle[id][xv_Text] = Create3DTextLabel(str, 0x008080FF, 0.0, 0.0, 0.0, 12.0, 0);
				Attach3DTextLabelToVehicle(xVehicle[id][xv_Text], xVehicle[id][xv_Veh], 0.0, 0.0, 1.0); 
			}
	    }
	}
	printf("[xVehicle] %d vehicle pribadi loaded.", loaded);
	
	return 1;
}
