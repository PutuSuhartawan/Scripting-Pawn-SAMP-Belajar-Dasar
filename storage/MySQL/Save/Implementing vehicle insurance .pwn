 script for implementing vehicle insurance and saving it to a MySQL database:

scss
Copy code
#define MAX_VEHICLES 50

new vehicle_owners[MAX_VEHICLES];
new vehicle_insured[MAX_VEHICLES];

// Load vehicle insurance data from database
public LoadVehicleInsurance()
{
    new query[128], rows;
    mysql_format(connection, query, sizeof(query), "SELECT id, insured FROM vehicles");
    mysql_query(connection, query);
    cache_get_data(rows);
    if(rows)
    {
        new row[128], idx;
        for(new i = 0; i < rows; i++)
        {
            cache_get_field_content(row, "id", idx);
            vehicle_insured[idx] = cache_get_field_content_int(row, "insured");
        }
    }
}

// Save vehicle insurance data to database
public SaveVehicleInsurance(vehicleid)
{
    new query[256];
    format(query, sizeof(query), "UPDATE vehicles SET insured='%d' WHERE id='%d'", vehicle_insured[vehicleid], vehicleid);
    mysql_query(query);
}

// Check if a vehicle is insured
public IsVehicleInsured(vehicleid)
{
    if(vehicle_insured[vehicleid])
        return 1;
    return 0;
}

// Buy insurance for a vehicle
public BuyVehicleInsurance(playerid, vehicleid)
{
    if(!IsValidVehicle(vehicleid))
    {
        SendClientMessage(playerid, 0xFFFFFFAA, "Invalid vehicle ID.");
        return 0;
    }
    if(vehicle_owners[vehicleid] != playerid)
    {
        SendClientMessage(playerid, 0xFFFFFFAA, "You do not own this vehicle.");
        return 0;
    }
    if(vehicle_insured[vehicleid])
    {
        SendClientMessage(playerid, 0xFFFFFFAA, "This vehicle is already insured.");
        return 0;
    }
    // Check player's money balance
    new Float:balance = GetPlayerMoney(playerid);
    if(balance < 1000.0)
    {
        SendClientMessage(playerid, 0xFFFFFFAA, "You do not have enough money to buy insurance.");
        return 0;
    }
    // Deduct money from player's balance
    GivePlayerMoney(playerid, -1000.0);
    vehicle_insured[vehicleid] = 1;
    SaveVehicleInsurance(vehicleid);
    SendClientMessage(playerid, 0xFFFFFFAA, "Vehicle insurance purchased.");
    return 1;
}

// Callback function for when a player enters a vehicle
public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
    if(IsVehicleInsured(vehicleid))
        return 1; // Allow player to enter insured vehicle
    SendClientMessage(playerid, 0xFFFFFFAA, "This vehicle is not insured.");
    RemovePlayerFromVehicle(playerid);
    return 0;
}
The script uses two arrays, vehicle_owners and vehicle_insured, to store information about the ownership and insurance status of each vehicle. The LoadVehicleInsurance function loads the insurance data from the MySQL database when the script starts, and the SaveVehicleInsurance function saves any changes to the database.

The BuyVehicleInsurance function allows a player to purchase insurance for a vehicle they own. The function checks that the vehicle is valid and owned by the player, and deducts $1000 from the player's money balance before setting the vehicle_insured flag to 1.

The OnPlayerEnterVehicle callback function checks if the vehicle is insured before allowing the player to enter. If the vehicle is not insured, the player is removed from the vehicle and an error message is displayed.
