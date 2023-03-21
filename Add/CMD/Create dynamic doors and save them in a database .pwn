 script that uses MySQL to create dynamic doors and save them in a database:

scss
Copy code
#include <mysql>

new const:MAX_DOORS = 10;
new door[MAX_DOORS][3]; // x, y, z
new mysql:host, mysql:user[], mysql:pass[], mysql:db[], mysql:port, mysql:timeout;

forward LoadDoors();
forward SaveDoor(doorid);
forward CreateDoor(playerid, Float:x, Float:y, Float:z);

public OnGameModeInit()
{
    // Initialize MySQL connection details
    host = "localhost";
    user[] = "root";
    pass[] = "";
    db[] = "mydatabase";
    port = 3306;
    timeout = 100;

    // Connect to MySQL database
    if(mysql_connect(host, user, pass, db, port, timeout))
    {
        printf("Connected to MySQL database.");
    }
    else
    {
        printf("Failed to connect to MySQL database: %s", mysql_errno());
    }

    // Load doors from database
    LoadDoors();
}

public OnPlayerConnect(playerid)
{
    // Create command to create door
    new cmdCreateDoor[] = "/createdoor [x] [y] [z]";
    SendClientMessage(playerid, 0xFFFFFFAA, cmdCreateDoor);
}

public OnPlayerCommandText(playerid, cmdtext[])
{
    new cmd[32], args[256];
    sscanf(cmdtext, "%s %s", cmd, args);

    if(!strcmp(cmd, "/createdoor"))
    {
        new Float:x, Float:y, Float:z;
        sscanf(args, "%f %f %f", x, y, z);
        CreateDoor(playerid, x, y, z);
    }
}

LoadDoors()
{
    // Load doors from database
    new query[256];
    format(query, sizeof(query), "SELECT * FROM doors");
    mysql_query(query);
    new result = mysql_store_result();
    if(mysql_num_rows(result) > 0)
    {
        new row
        
        
scss
Copy code
LoadDoors()
{
    // Load doors from database
    new query[256];
    format(query, sizeof(query), "SELECT * FROM doors");
    mysql_query(query);
    new result = mysql_store_result();
    if(mysql_num_rows(result) > 0)
    {
        new row[128];
        new doorid = 0;
        while(mysql_fetch_row(result, row))
        {
            if(doorid >= MAX_DOORS) break;
            door[doorid][0] = strval(row[1]); // x
            door[doorid][1] = strval(row[2]); // y
            door[doorid][2] = strval(row[3]); // z
            doorid++;
        }
    }
    mysql_free_result(result);
}
This function constructs a MySQL query to select all rows from the doors table and stores the result in a variable result. It then loops through the rows using mysql_fetch_row and populates the door array with the x, y, and z coordinates of each door. If there are more doors than the maximum allowed (MAX_DOORS), the loop is terminated.

Once the doors have been loaded from the database, they can be used to create dynamic doors in the game world. The CreateDoor function creates a new door at a given location and saves its coordinates in the door array, which can then be saved back to the database using the SaveDoor function.

Note that this is just a sample script and should be modified to suit your specific needs. You should also ensure that you have the MySQL plugin installed and configured correctly before using this script.


public OnPlayerCommandText(playerid, cmdtext[])
{
    new cmd[32], args[256];
    sscanf(cmdtext, "%s %s", cmd, args);

    if(!strcmp(cmd, "/createdoor"))
    {
        new Float:x, Float:y, Float:z;
        sscanf(args, "%f %f %f", x, y, z);
        CreateDoor(playerid, x, y, z);
    }
}

LoadDoors()
{
    // Load doors from database
    new query[256];
    format(query, sizeof(query), "SELECT * FROM doors");
    mysql_query(query);
    new result = mysql_store_result();
    if(mysql_num_rows(result) > 0)
    {
        new row[128];
        new doorid = 0;
        while(mysql_fetch_row(result, row))
        {
            if(doorid >= MAX_DOORS) break;
            door[doorid][0] = strval(row[1]); // x
            door[doorid][1] = strval(row[2]); // y
            door[doorid][2] = strval(row[3]); // z
            doorid++;
        }
    }
    mysql_free_result(result);
}

CreateDoor(playerid, Float:x, Float:y, Float:z)
{
    // Find first available door slot
    new doorid = -1;
    for(new i = 0; i < MAX_DOORS; i++)
    {
        if(door[i][0] == 0.0 && door[i][1] == 0.0 && door[i][2] == 0.0)
        {
            doorid = i;
            break;
        }
    }
    if(doorid == -1)
    {
        SendClientMessage(playerid, 0xFFFFFFAA, "All door slots are taken.");
        return;
    }

    // Create door
    new Float:posX = x, Float:posY = y, Float:posZ = z;
    new Float:rotX = 0.0, Float:rotY = 0.0, Float:rotZ = 0.0;
    new modelid = 1337; // Replace with door model ID
    door[doorid][0] = x;
    door[doorid][1] = y;
    
    SaveDoor(doorid)
{
// Save door to database
new query[256];
format(query, sizeof(query), "UPDATE doors SET x='%f', y='%f', z='%f' WHERE id='%d'", door[doorid][0], door[doorid][1], door[doorid][2], doorid+1);
mysql_query(query);
}

CreateDoor(playerid, Float:x, Float:y, Float:z)
{
// Find first available door slot
new doorid = -1;
for(new i = 0; i < MAX_DOORS; i++)
{
if(door[i][0] == 0.0 && door[i][1] == 0.0 && door[i][2] == 0.0)
{
doorid = i;
break;
}
}
if(doorid == -1)
{
SendClientMessage(playerid, 0xFFFFFFAA, "All door slots are taken.");
return;
}

scss
Copy code
// Create door
new Float:posX = x, Float:posY = y, Float:posZ = z;
new Float:rotX = 0.0, Float:rotY = 0.0, Float:rotZ = 0.0;
new modelid = 1337; // Replace with door model ID
door[doorid][0] = x;
door[doorid][1] = y;
door[doorid][2] = z;
SetDynamicObjectPos(CreateDynamicObject(modelid, posX, posY, posZ, rotX, rotY, rotZ), posX, posY, posZ);
SaveDoor(doorid);
SendClientMessage(playerid, 0xFFFFFFAA, "Door created.");
}
