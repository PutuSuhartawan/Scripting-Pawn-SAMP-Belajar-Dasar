example script for a dialog-based group score system that retrieves data from a MySQL database:

pawn
Copy code
new mysql;
new host[] = "localhost", user[] = "root", password[] = "password", database[] = "sampdb";

public OnGameModeInit()
{
    mysql = mysql_init();
    if (!mysql_real_connect(mysql, host, user, password, database, 0, NULL, 0))
    {
        printf("Error connecting to database: %s", mysql_error(mysql));
        return 0;
    }
    printf("Connected to database.");
    return 1;
}

public OnPlayerConnect(playerid)
{
    new query[128], result;
    format(query, sizeof(query), "SELECT groupname, groupscore FROM player_groups WHERE playerid = %d", playerid);
    mysql_query(mysql, query);
    mysql_store_result(mysql);
    if (mysql_num_rows(result) == 0)
    {
        SendClientMessage(playerid, -1, "You are not in a group.");
        return 1;
    }
    new rows = mysql_num_rows(result), i, groupname[32], groupscore;
    for (i = 0; i < rows; i++)
    {
        mysql_fetch_row(result);
        mysql_fetch_field(result, "groupname", groupname);
        mysql_fetch_field(result, "groupscore", groupscore);
        ShowPlayerDialog(playerid, 1, DIALOG_STYLE_LIST, "Group Score", "Select a group:", groupname, "Close", NULL);
    }
    return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if (dialogid == 1 && response)
    {
        new query[128], result;
        format(query, sizeof(query), "SELECT groupscore FROM player_groups WHERE playerid = %d AND groupname = '%s'", playerid, listitem);
        mysql_query(mysql, query);
        mysql_store_result(mysql);
        new rows = mysql_num_rows(result), groupscore;
        if (rows == 0)
        {
            SendClientMessage(playerid, -1, "Error retrieving group score.");
            return 0;
        }
        mysql_fetch_field(result, "groupscore", groupscore);
        format(query, sizeof(query), "The group %s has a score of %d.", listitem, groupscore);
        SendClientMessage(playerid, -1, query);
        return 1;
    }
    return 0;
}
This script assumes that there is a MySQL table named player_groups with the columns playerid, groupname, and groupscore. When a player connects to the server, the OnPlayerConnect function retrieves the player's group name and score from the database, and shows a dialog box listing all the groups the player is in. When the player selects a group from the dialog box, the OnDialogResponse function retrieves the group's score from the database and sends a message to the player displaying the group name and score.
