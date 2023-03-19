To set the leader of an organization and sync it with MySQL, you can use the following script:

pawn
Copy code
// This function sets the leader of the specified organization in the database
SetOrganizationLeader(playerid, org_id, new_leader_id)
{
    // Connect to the MySQL database
    mysql_connect("localhost", "username", "password", "database");

    // Prepare the SQL query to update the leader of the organization
    new query[128];
    format(query, sizeof(query), "UPDATE organizations SET leader_id = %d WHERE id = %d", new_leader_id, org_id);

    // Execute the query
    mysql_query(query);

    // Check if the query was successful
    if(mysql_errno() == 0)
    {
        // Set the new leader of the organization in the server memory
        g_Organizations[org_id][ORG_LEADER] = new_leader_id;

        // Send a message to the new leader notifying them of their new role
        SendClientMessage(new_leader_id, COLOR_ORANGE, "You have been promoted to the leader of the organization!");

        // Send a message to the old leader notifying them of their demotion
        SendClientMessage(playerid, COLOR_ORANGE, "You have been demoted from the leader of the organization.");
    }
    else
    {
        // Display an error message if the query failed
        printf("MySQL error: %s", mysql_error());
    }

    // Disconnect from the MySQL database
    mysql_close();
}

// This function is called when a player is promoted to the leader of an organization
OnOrganizationPromoteLeader(playerid, org_id, new_leader_id)
{
    // Set the leader of the organization in the database
    SetOrganizationLeader(playerid, org_id, new_leader_id);
}
This script connects to a MySQL database, prepares a query to update the leader of the specified organization, and executes the query. If the query is successful, the script updates the leader of the organization in the server memory and sends a message to both the new and old leader. If the query fails, the script displays an error message.

You can call the OnOrganizationPromoteLeader function whenever a player is promoted to the leader of an organization, passing in the player ID, organization ID, and new leader ID as parameters.
