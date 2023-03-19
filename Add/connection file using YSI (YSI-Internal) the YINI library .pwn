To load a connection file using YSI (YSI-Internal), you can use the YINI library. Here is an example code snippet that demonstrates how to do this:

pawn
Copy code
#include <YSI\y_ini>

// Define the file name and path of your connection file
#define CONNECTION_FILE "mysql.ini"

// Define variables to store your connection parameters
new g_dbHost[32], g_dbUser[32], g_dbPassword[32], g_dbDatabase[32], g_dbPort;

// Load the connection file using YINI
public OnGameModeInit()
{
    new YSIFile:y_ini = YSI_OpenFile(CONNECTION_FILE, YSI_OPEN_READ);
    if(y_ini != NULL)
    {
        YSI_GetValueString(y_ini, "mysql", "host", g_dbHost, sizeof(g_dbHost));
        YSI_GetValueString(y_ini, "mysql", "user", g_dbUser, sizeof(g_dbUser));
        YSI_GetValueString(y_ini, "mysql", "password", g_dbPassword, sizeof(g_dbPassword));
        YSI_GetValueString(y_ini, "mysql", "database", g_dbDatabase, sizeof(g_dbDatabase));
        g_dbPort = YSI_GetValueInt(y_ini, "mysql", "port", 3306);
        YSI_CloseFile(y_ini);
    }
    else
    {
        print("ERROR: Failed to load connection file.");
    }
}
In this example, we first define the file name and path of our connection file using a #define directive. Then, we define variables to store our connection parameters (g_dbHost, g_dbUser, g_dbPassword, g_dbDatabase, and g_dbPort).

In the OnGameModeInit function, we open the connection file using YSI_OpenFile, and then retrieve the values of our connection parameters using YSI_GetValueString and YSI_GetValueInt. We close the file using YSI_CloseFile.

Note that in this example, we assume that the connection file has a [mysql] section and contains the following keys: host, user, password, database, and port. You may need to modify the script to suit your specific connection file format and parameter names.
