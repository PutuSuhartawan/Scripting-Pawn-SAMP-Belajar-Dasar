




SaveVehicleModifications(vehicleid)
{
	for(new i = 0; i < 14; i ++)
	{
	    VehicleInfo[vehicleid][vMods][i] = GetVehicleComponentInSlot(vehicleid, i);

	    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE vehicles SET mod_%i = %i WHERE id = %i", i + 1, VehicleInfo[vehicleid][vMods][i], VehicleInfo[vehicleid][vID]);
	    mysql_tquery(connectionID, queryBuffer);
	}
}






public OnVehicleMod(playerid, vehicleid, componentid)
{
	if(!GetPlayerInterior(playerid) && PlayerInfo[playerid][pAdmin] < 1 && !PlayerInfo[playerid][pKicked])
	{
	    SMA(COLOR_YELLOW, "[SYSTEM]: "WHITE"  %s was auto-kicked by %s, reason: Illegal Modding", GetRPName(playerid), SERVER_BOT);
	    //BanPlayer(playerid, SERVER_BOT, "Illegal modding");
	    Kick(playerid);
	    return 0;
	}

	if(VehicleInfo[vehicleid][vOwnerID] > 0 || VehicleInfo[vehicleid][vGang] >= 0)
	{
	    new slotid = GetVehicleComponentType(componentid);

	    VehicleInfo[vehicleid][vMods][slotid] = componentid;

	    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE vehicles SET mod_%i = %i WHERE id = %i", slotid + 1, componentid, VehicleInfo[vehicleid][vID]);
	    mysql_tquery(connectionID, queryBuffer);
	}

	return 1;
}






/*


The code you provided is a function called OnVehicleMod() that is called when a player mods a vehicle. The function takes three parameters: playerid, vehicleid, and componentid.

The function first checks if the player is an admin. If the player is not an admin, and the player is not in an interior, the function kicks the player from the server.

Next, the function checks if the vehicle is owned by a player or a gang. If the vehicle is owned by a player or a gang, the function updates the vehicle's modification array and the database.

Finally, the function returns 1.

Here is a breakdown of the code:

Python
public OnVehicleMod(playerid, vehicleid, componentid)
{
    if(!GetPlayerInterior(playerid) && PlayerInfo[playerid][pAdmin] < 1 && !PlayerInfo[playerid][pKicked])
    {
        SMA(COLOR_YELLOW, "[SYSTEM]: "WHITE"  %s was auto-kicked by %s, reason: Illegal Modding", GetRPName(playerid), SERVER_BOT);
        //BanPlayer(playerid, SERVER_BOT, "Illegal modding");
        Kick(playerid);
        return 0;
    }

    if(VehicleInfo[vehicleid][vOwnerID] > 0 || VehicleInfo[vehicleid][vGang] >= 0)
    {
        new slotid = GetVehicleComponentType(componentid);

        VehicleInfo[vehicleid][vMods][slotid] = componentid;

        mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE vehicles SET mod_%i = %i WHERE id = %i", slotid + 1, componentid, VehicleInfo[vehicleid][vID]);
        mysql_tquery(connectionID, queryBuffer);
    }

    return 1;
}
Use code with caution. Learn more
The first line of code declares the OnVehicleMod() function. The function takes three parameters: playerid, vehicleid, and componentid.
The second line of code checks if the player is an admin. If the player is not an admin, and the player is not in an interior, the function kicks the player from the server.
The third line of code checks if the vehicle is owned by a player or a gang. If the vehicle is owned by a player or a gang, the function updates the vehicle's modification array and the database.
The fourth line of code returns 1.
I hope this explanation is helpful. Let me know if you have any other questions.



*/
