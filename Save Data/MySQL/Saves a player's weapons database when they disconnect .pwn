 script in PAWN that saves a player's weapons to a MySQL database when they disconnect from the server:

First, you will need to create a MySQL connection using a plugin like mysql-async. You can do this by calling the mysql_connect function with the database credentials:

arduino
Copy code
#include <mysql>
#include <mysql_async>

// MySQL connection handle
new MySQL:mySQL;

public OnGameModeInit()
{
    // Connect to the MySQL database
    mySQL = mysql_connect("localhost", "username", "password", "database");
    if(!mysql_ping(mySQL))
    {
        printf("MySQL connected successfully.");
    }
    return 1;
}
Next, you can create a function that will be called when a player disconnects from the server. In this function, you can use the mysql_query function to execute a SQL query that updates the player's weapons in the database:

scss
Copy code
public OnPlayerDisconnect(playerid, reason)
{
    // Get the player's weapon data
    new weapons[13];
    GetPlayerWeapons(playerid, weapons);

    // Construct the SQL query
    new query[256];
    format(query, sizeof(query), "UPDATE player_data SET weapons='%s' WHERE id=%d",
           mysql_escape_string(mysql_format(mySQL, weapons)), playerid);

    // Execute the query
    mysql_query(mySQL, query, "");
    return 1;
}
In this function, we first use the GetPlayerWeapons function to get an array of the player's current weapons. We then construct an SQL query that updates the player's weapon data in the player_data table (you'll need to create this table in your database with an id column and a weapons column).

The mysql_escape_string function is used to escape any special characters in the weapons array before it's included in the query. We then call mysql_query with the constructed query to execute the update.

Note that this is just a simple example to demonstrate the concept of saving player weapon data to a MySQL database. You may want to modify this script to include error handling, or to save additional player data like health or armor. Additionally, you'll need to make sure that the MySQL database is set up correctly with the appropriate permissions and table structure.
