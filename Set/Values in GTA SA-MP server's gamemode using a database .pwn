To set values in your GTA SA-MP server's gamemode using a database, you can use a combination of SQL queries and Pawn scripting. Here is an example of how to set player data, admin data, password, vehicle, and house data from a MySQL database:

pawn
Copy code
new mysql = SQL_Init();
SQL_Connect(mysql, "localhost", "username", "password", "database", 0);

// Set player data
public SetPlayerData(playerid, data_key[], data_value[])
{
    new query[128];
    format(query, sizeof(query), "UPDATE players SET %s = '%s' WHERE id = %d", data_key, data_value, playerid);
    SQL_Query(mysql, query);
}

// Set admin data
public SetAdminData(playerid, data_key[], data_value[])
{
    new query[128];
    format(query, sizeof(query), "UPDATE admins SET %s = '%s' WHERE id = %d", data_key, data_value, playerid);
    SQL_Query(mysql, query);
}

// Set password
public SetPassword(playerid, password[])
{
    new query[128];
    format(query, sizeof(query), "UPDATE players SET password = '%s' WHERE id = %d", password, playerid);
    SQL_Query(mysql, query);
}

// Set vehicle data
public SetVehicleData(vehicleid, data_key[], data_value[])
{
    new query[128];
    format(query, sizeof(query), "UPDATE vehicles SET %s = '%s' WHERE id = %d", data_key, data_value, vehicleid);
    SQL_Query(mysql, query);
}

// Set house data
public SetHouseData(houseid, data_key[], data_value[])
{
    new query[128];
    format(query, sizeof(query), "UPDATE houses SET %s = '%s' WHERE id = %d", data_key, data_value, houseid);
    SQL_Query(mysql, query);
}

// Example usage
public OnPlayerConnect(playerid)
{
    // Set player data
    SetPlayerData(playerid, "name", "John Doe");
    SetPlayerData(playerid, "money", "10000");
    
    // Set admin data
    SetAdminData(playerid, "access_level", "3");
    
    // Set password
    SetPassword(playerid, "mypassword");
    
    // Set vehicle data
    SetVehicleData(1, "owner_id", "1");
    
    // Set house data
    SetHouseData(1, "owner_id", "1");
}
In this example, we first initialize and connect to a MySQL database using the SQL_Init and SQL_Connect functions.

Then, we define several functions for setting data in the database, including SetPlayerData, SetAdminData, SetPassword, SetVehicleData, and SetHouseData. These functions take a data_key parameter to specify the name of the column in the database, and a data_value parameter to specify the value to set in the column.

Finally, in the OnPlayerConnect event handler, we call these functions to set some initial data for the player, admin, password, vehicle, and house.

Note that this is just an example, and you may need to modify the queries and table/column names to match your own database schema. Additionally, be sure to properly sanitize any user input to prevent SQL injection attacks.
