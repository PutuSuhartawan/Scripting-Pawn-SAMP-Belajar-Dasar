randomly spawns players at two different locations:

scss
Copy code
new Float:spawn1_x = 1000.0, Float:spawn1_y = 2000.0, Float:spawn1_z = 10.0;
new Float:spawn2_x = 5000.0, Float:spawn2_y = 6000.0, Float:spawn2_z = 10.0;

public OnPlayerConnect(playerid)
{
    // Generate a random number between 1 and 2 to determine which spawn point to use
    new rand = random(1, 2);
    if (rand == 1)
    {
        SetPlayerPos(playerid, spawn1_x, spawn1_y, spawn1_z);
    }
    else
    {
        SetPlayerPos(playerid, spawn2_x, spawn2_y, spawn2_z);
    }
    return 1;
}
In this script, we define two sets of coordinates for the spawn points (spawn1_x, spawn1_y, spawn1_z and spawn2_x, spawn2_y, spawn2_z). Then, in the OnPlayerConnect function (which is called when a player connects to the server), we generate a random number between 1 and 2 using the random function. If the random number is 1, we spawn the player at the first spawn point, and if it's 2, we spawn them at the second spawn point. We use the SetPlayerPos function to set the player's position to the chosen spawn point.

Note that this is just a simple example to demonstrate the concept of random spawning. You could modify this script to add more spawn points, change the coordinates of the existing spawn points, or add additional features like spawn protection or team-specific spawning.
