 update and load rcon server data to a MySQL database using Pawn:



First, we need to create a MySQL connection. We will use the YSI library to simplify the process of creating a connection:

cpp
Copy code
#include <YSI_Coding\ysi_mysql>
new mysql:db;

public OnGameModeInit()
{
    db = mysql_connect("localhost", "username", "password", "databasename");
    if(db)
    {
        printf("MySQL connected successfully.");
    }
    else
    {
        printf("MySQL connection failed: %s", mysql_error());
    }
}
This will create a new MySQL connection to the specified database. Replace the localhost, username, password, and databasename with your own values.

Now, we can create a function to update the rcon data to the database:

scss
Copy code
public UpdateRconData()
{
    new rcon_password[MAX_PASSWORD];
    GetServerVarAsString("rcon_password", rcon_password, sizeof(rcon_password));
    
    new query[128];
    mysql_format(db, query, sizeof(query), "UPDATE settings SET rcon_password = '%s'", rcon_password);
    
    mysql_tquery(db, query, "OnRconUpdate");
}

public OnRconUpdate()
{
    if(mysql_errno(db))
    {
        printf("Error updating rcon data: %s", mysql_error(db));
    }
    else
    {
        printf("Rcon data updated successfully.");
    }
}
This function will get the rcon password from the server variables, create a MySQL query to update the rcon_password field in the settings table, and execute the query using mysql_tquery. The OnRconUpdate callback function will be called once the query has been executed.

To load the rcon data from the database, we can create another function:

scss
Copy code
public LoadRconData()
{
    new query[64];
    mysql_format(db, query, sizeof(query), "SELECT rcon_password FROM settings LIMIT 1");
    
    mysql_tquery(db, query, "OnRconLoad");
}

public OnRconLoad()
{
    new result = mysql_store_result(db);
    if(result)
    {
        new row = mysql_fetch_row(result);
        if(row)
        {
            SetServerVar("rcon_password", row[0]);
            printf("Rcon data loaded successfully.");
        }
        mysql_free_result(result);
    }
    else
    {
        printf("Error loading rcon data: %s", mysql_error(db));
    }
}
This function will create a MySQL query to select the rcon_password field from the settings table, execute the query using mysql_tquery, and retrieve the result using mysql_store_result and mysql_fetch_row. The rcon password will be set using SetServerVar, and the OnRconLoad callback function will be called once the query has been executed.

You can call these functions using a command, for example:

javascript
Copy code
CMD:updatercon(playerid)
{
    UpdateRconData();
    return 1;
}

CMD:loadrcon(playerid)
{
    LoadRconData();
    return 1;
}
These commands will call the UpdateRconData and LoadRconData functions when executed.

Remember to include the necessary YSI headers at the top of your script:

c
Copy code
#include <YSI_Coding\ysi_mysql>
#include <YSI_Coding\ysi_main>
