script for setting spawn and updating the MySQL database:

scss
Copy code
CMD:spawn(playerid)
{
    new Float:x, Float:y, Float:z, Float:a;
    GetPlayerPos(playerid, x, y, z);
    a = GetPlayerFacingAngle(playerid);
    
    // Save spawn data to MySQL
    mysql_query(gMySQL, "UPDATE players SET spawn_x = %f, spawn_y = %f, spawn_z = %f, spawn_a = %f WHERE id = %d", x, y, z, a, GetPlayerAccountID(playerid));
    
    // Set spawn for the player
    SetPlayerPos(playerid, x, y, z);
    SetPlayerFacingAngle(playerid, a);
    SendClientMessage(playerid, -1, "Your spawn has been set.");
    return 1;
}
This script defines a spawn command that takes the player's current position and facing angle, saves it to the MySQL database for the player's account, and sets it as the player's spawn point. When the player logs in again, their saved spawn point will be loaded from the database and set automatically.
