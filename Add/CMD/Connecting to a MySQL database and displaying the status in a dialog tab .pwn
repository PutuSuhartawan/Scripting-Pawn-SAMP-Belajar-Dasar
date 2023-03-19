 script for connecting to a MySQL database and displaying the status in a dialog tab:

cpp
Copy code
#include <mysql>

new gMySQL;

// Connect to MySQL database
public OnGameModeInit()
{
    gMySQL = mysql_init(NULL);
    mysql_real_connect(gMySQL, "localhost", "root", "password", "database", 0, NULL, 0);
    if (mysql_ping(gMySQL) == 0)
    {
        printf("MySQL connected successfully.");
    }
    else
    {
        printf("MySQL connection failed: %s", mysql_error(gMySQL));
    }
    return 1;
}

// Display MySQL status in dialog
CMD:status(playerid)
{
    new dialogid = CreateDialog(1, DIALOG_STYLE_TABLIST, "MySQL Status", "OK", "Close", "", "");
    if (dialogid)
    {
        if (mysql_ping(gMySQL) == 0)
        {
            AddTabColumn(dialogid, "Status", 100);
            AddTabRow(dialogid, 1, "Connected");
        }
        else
        {
            AddTabColumn(dialogid, "Status", 100);
            AddTabRow(dialogid, 1, "Disconnected");
        }
        ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_TABLIST, "Select", "");
    }
    return 1;
}
This script initializes a global MySQL connection variable gMySQL in the OnGameModeInit callback, and displays the status of the MySQL connection in a dialog tab when the status command is executed. The mysql_ping function is used to check the status of the connection, and the CreateDialog, AddTabColumn, and AddTabRow functions are used to display the status in the dialog.
