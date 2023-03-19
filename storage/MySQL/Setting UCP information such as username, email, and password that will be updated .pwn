script for setting UCP information such as username, email, and password that will be updated in a MySQL database:



PAWN
Copy code
new mysql_host[] = "localhost";
new mysql_user[] = "root";
new mysql_pass[] = "";
new mysql_db[] = "my_database";

stock SetUCPInfo(playerid, const username[], const email[], const password[])
{
    new query[512];
    mysql_format(query, sizeof(query), "UPDATE players SET username='%s', email='%s', password='%s' WHERE id=%d",
                 username, email, password, playerid);
    mysql_tquery(mysql_host, mysql_user, mysql_pass, mysql_db, query, "");
    return 1;
}
In this script, the SetUCPInfo function takes the player ID, username, email, and password as parameters. It then creates a MySQL query to update the players table with the new information for the player with the specified ID. The mysql_tquery function is used to execute the query asynchronously.
