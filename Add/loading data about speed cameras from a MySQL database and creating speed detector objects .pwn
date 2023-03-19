script for loading data about speed cameras from a MySQL database and creating speed detector objects in-game for police roleplay:

pawn
Copy code
#include <mysql>

#define MAX_CAMERAS 100
#define CAMERA_MODEL 1234 // Object model ID for the speed camera

// MySQL connection information
#define MYSQL_HOST "localhost"
#define MYSQL_USER "root"
#define MYSQL_PASSWORD ""
#define MYSQL_DATABASE "mydatabase"

// Speed camera data structure
new Float:cameras[MAX_CAMERAS][4];
// 4-element array for each speed camera containing the camera position (x,y,z) and the camera speed limit

// MySQL connection handle
new mysql:sql;

// Function to load speed camera data from MySQL
LoadSpeedCameras()
{
    mysql_connect(sql, MYSQL_HOST, MYSQL_USER, MYSQL_PASSWORD, MYSQL_DATABASE, 0, "");

    new query[128];
    format(query, sizeof(query), "SELECT x, y, z, speed_limit FROM speed_cameras");
    mysql_query(sql, query);

    new rows = mysql_num_rows(sql);
    for(new i = 0; i < rows && i < MAX_CAMERAS; i++)
    {
        new Float:x, Float:y, Float:z, Float:speed;
        mysql_fetch_field_row(sql, 0, x, y, z, speed);

        cameras[i][0] = x;
        cameras[i][1] = y;
        cameras[i][2] = z;
        cameras[i][3] = speed;
    }

    mysql_close(sql);
}

// Function to create speed detector objects for each speed camera
CreateSpeedCameras()
{
    for(new i = 0; i < MAX_CAMERAS && cameras[i][0] != 0.0; i++)
    {
        new objectid = CreateObject(CAMERA_MODEL, cameras[i][0], cameras[i][1], cameras[i][2], 0.0, 0.0, 0.0, 0.0, 0, 0, 0);
        if(objectid != INVALID_OBJECT_ID)
        {
            SetObjectMaterial(objectid, 0, 187, "speedcam.txd", "speedcam", 0xFFFFFFFF);
            SetObjectMaterialText(objectid, "Speed Limit: " + FloatToString(cameras[i][3], 1) + " MPH", 0, "Arial", 12, true, 0xFFFFFFFF, 0xFFFFFFFF, 1.0, 1.0, 0);
        }
    }
}

// OnGameModeInit callback
public OnGameModeInit()
{
    LoadSpeedCameras();
    CreateSpeedCameras();
    return 1;
}

// OnGameModeExit callback
public OnGameModeExit()
{
    for(new i = 0; i < MAX_CAMERAS && cameras[i][0] != 0.0; i++)
    {
        DestroyObject(GetClosestObject(cameras[i][0], cameras[i][1], cameras[i][2], 1.0));
    }
    return 1;
}
This script uses the MySQL plugin to connect to a database containing data about speed cameras, and loads the camera positions and speed limits into an array. The script then uses the CreateObject function to create a speed camera object at each camera position, and sets the object's material and material text to display the speed limit.

The script also includes OnGameModeInit and OnGameModeExit callbacks to load and unload the speed cameras when the gamemode is started and stopped, respectively. Note that this script assumes that the speed camera model ID is 1234 and that the texture for the speed camera is "speedcam.txd"
