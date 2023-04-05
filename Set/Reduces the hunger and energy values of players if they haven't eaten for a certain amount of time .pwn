 script in PAWN that reduces the hunger and energy values of players if they haven't eaten for a certain amount of time:


scss
Copy code
// Define the amount of time (in seconds) that must elapse before reducing hunger and energy
#define HUNGER_REDUCTION_INTERVAL 600 // 10 minutes
#define ENERGY_REDUCTION_INTERVAL 120 // 2 minutes

new g_PlayerHunger[MAX_PLAYERS], g_PlayerEnergy[MAX_PLAYERS];
new g_LastHungerReductionTime[MAX_PLAYERS], g_LastEnergyReductionTime[MAX_PLAYERS];

public OnPlayerConnect(playerid)
{
    // Initialize hunger and energy values for the player
    g_PlayerHunger[playerid] = 100;
    g_PlayerEnergy[playerid] = 100;

    // Set the last hunger and energy reduction times to the current time
    g_LastHungerReductionTime[playerid] = gettime();
    g_LastEnergyReductionTime[playerid] = gettime();

    return 1;
}

public OnPlayerUpdate(playerid)
{
    new current_time = gettime();

    // Check if enough time has passed to reduce hunger
    if (current_time - g_LastHungerReductionTime[playerid] >= HUNGER_REDUCTION_INTERVAL)
    {
        // Reduce the player's hunger by 10%
        g_PlayerHunger[playerid] -= 10;
        if (g_PlayerHunger[playerid] < 0) g_PlayerHunger[playerid] = 0;

        // Update the last hunger reduction time
        g_LastHungerReductionTime[playerid] = current_time;
    }

    // Check if enough time has passed to reduce energy
    if (current_time - g_LastEnergyReductionTime[playerid] >= ENERGY_REDUCTION_INTERVAL)
    {
        // Reduce the player's energy by 10%
        g_PlayerEnergy[playerid] -= 10;
        if (g_PlayerEnergy[playerid] < 0) g_PlayerEnergy[playerid] = 0;

        // Update the last energy reduction time
        g_LastEnergyReductionTime[playerid] = current_time;
    }

    return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
    if (strcmp(cmdtext, "/eat", true) == 0)
    {
        // Reset the player's hunger and energy values to 100%
        g_PlayerHunger[playerid] = 100;
        g_PlayerEnergy[playerid] = 100;

        // Update the last hunger and energy reduction times to the current time
        g_LastHungerReductionTime[playerid] = gettime();
        g_LastEnergyReductionTime[playerid] = gettime();

        SendClientMessage(playerid, 0xFFFFFFFF, "You have eaten and your hunger and energy have been restored.");
        return 1;
    }

    return 0;
}
In this script, we define the constants HUNGER_REDUCTION_INTERVAL and ENERGY_REDUCTION_INTERVAL which represent the amount of time (in seconds) that must elapse before reducing the hunger and energy values, respectively. In this case, we've set them to 600 seconds (10 minutes) and 120 seconds (2 minutes), respectively, but you can adjust these values to suit your needs.

We use two arrays, g_PlayerHunger and g_PlayerEnergy, to store the hunger and energy values for each player, respectively. We also use two arrays, g_LastHungerReductionTime and g_LastEnergyReductionTime, to store the last hunger and energy reduction times for each player, respectively.

In the OnPlayerConnect function, we initialize the hunger and energy values for the player and set the last hunger and energy reduction times to the current time.

In the OnPlayerUpdate function, we check if enough time has passed to reduce the hunger and energy values for each player. If enough time has passed, we reduce the player's hunger and energy values by 10% (you can adjust this value if you want to make the reduction more or less severe). We also check if the hunger or energy value has fallen below 0 and set it to 0 if it has.

In the OnPlayerCommandText function, we provide a command /eat that allows the player to reset their hunger and energy values to 100%. This also updates the last hunger and energy reduction times to the current time.

To add this script to your server, you'll need to compile it using a PAWN compiler and add it to your server's script directory. You'll also need to add an include statement for the streamer library, which provides the gettime function used in the script. Finally, you'll need to add a callback function to your server script that calls the OnPlayerUpdate function every few seconds to check for hunger and energy reductions.
