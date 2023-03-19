 script for banning a player's IP address and storing it in a MySQL database:

pawn
Copy code
// Define a function for banning an IP address
public BanIP(playerid, reason[])
{
    new ip[16];
    GetPlayerIp(playerid, ip, sizeof(ip));

    // Connect to the MySQL database
    mysql_pConnect("localhost", "username", "password", "database");

    // Prepare the SQL statement for inserting the ban into the database
    new query[256];
    format(query, sizeof(query), "INSERT INTO bans (ip, reason) VALUES ('%s', '%s')", ip, reason);
    mysql_pQuery(query);

    // Kick the player and display the reason for the ban
    Kick(playerid);
    SendClientMessage(playerid, -1, "You have been banned from the server. Reason: %s", reason);
}

// Use a command to call the BanIP function
CMD:ban(playerid, params[])
{
    new reason[128];
    if(sscanf(params, "s[128]", reason))
    {
        BanIP(playerid, reason);
    }
    else
    {
        SendClientMessage(playerid, -1, "Usage: /ban [reason]");
    }
    return 1;
}
This script first retrieves the player's IP address and then uses MySQL to insert it into a bans table along with a reason for the ban. It then kicks the player and displays the reason for the ban. The ban command can be used in-game to call the BanIP function and pass a reason for the ban.
