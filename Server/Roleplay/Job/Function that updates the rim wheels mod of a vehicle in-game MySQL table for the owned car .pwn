 function that updates the rim mod of a vehicle in-game and also updates the corresponding MySQL table for the owned car:

scss
Copy code
// Function to update rim mod of a vehicle and update MySQL table for owned car
public OnRimModChanged(vehicleid, playerid, rim_mod)
{
    // Update the rim mod of the vehicle in-game
    SetVehicleMod(vehicleid, 13, rim_mod);
    
    // Update the rim mod of the vehicle in the MySQL database
    mysql_query("UPDATE owned_cars SET rim_mod=%d WHERE vehicle_id=%d AND owner_id=%d", rim_mod, vehicleid, playerid);
    
    return 1;
}
This function takes three parameters: vehicleid, which is the ID of the vehicle whose rim mod has changed; playerid, which is the ID of the player who owns the vehicle; and rim_mod, which is the new rim mod value to set for the vehicle.

The function first updates the rim mod of the vehicle in-game using the SetVehicleMod function, passing in the vehicle ID, the mod type for the rim (13), and the new rim mod value.

It then updates the owned_cars table in the MySQL database to set the rim_mod column to the new rim mod value for the row with the matching vehicle_id and owner_id values. This assumes that you have defined the necessary MySQL functions for connecting to the database and executing queries.

Note that this example function only updates the rim mod and assumes that the vehicle's wheels have already been changed in-game. If you also need to update the wheels themselves in-game, you could modify the function to call SetVehicleMod for the relevant wheel mods as well.
