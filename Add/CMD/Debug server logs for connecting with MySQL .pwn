command script that can be used to debug server logs for connecting with MySQL:

scss
Copy code
CMD:debugmysql(playerid, params[])
{
    new query[128];
    mysql_format(connection, query, sizeof(query), "SHOW ERRORS");
    mysql_tquery(connection, query, "debug_mysql_callback");
    SendClientMessage(playerid, COLOR_WHITE, "Debugging MySQL connection... Please wait.");
    return 1;
}

public debug_mysql_callback()
{
    new
        query[256],
        result[1200];

    while(mysql_fetch_row())
    {
        mysql_format(connection, query, sizeof(query), "ERROR %d (%s): %s",
            mysql_errno(),
            mysql_sqlstate(),
            mysql_error());

        strcat(result, query);
        strcat(result, "\n");
    }

    if(!strlen(result))
    {
        SendClientMessage(playerid, COLOR_WHITE, "No errors found.");
    }
    else
    {
        ShowPlayerDialog(playerid, DIALOG_DEBUG_MYSQL, DIALOG_STYLE_LIST, "MySQL Debugging", result, "Close", "");
    }

    return 1;
}
This script creates a command called debugmysql that when executed by a player, sends a query to the MySQL database asking for any errors that have occurred. The response is then processed by the debug_mysql_callback function, which displays the errors in a dialog box if any are found. The dialog box allows the player to view the errors and close the box.
