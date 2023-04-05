script in PAWN that hides the nametag of players who have a certain admin status:



arduino
Copy code
// Define the admin level that should have hidden nametags
#define ADMIN_LEVEL_HIDDEN_NAMETAGS 3

public OnPlayerConnect(playerid)
{
    // Check if the player is an admin with the required level
    if (GetPlayerAdminLevel(playerid) >= ADMIN_LEVEL_HIDDEN_NAMETAGS)
    {
        // Hide the player's nametag
        SetPlayerNametagVisible(playerid, false);
    }
    return 1;
}

public OnPlayerSpawn(playerid)
{
    // Check if the player is an admin with the required level
    if (GetPlayerAdminLevel(playerid) >= ADMIN_LEVEL_HIDDEN_NAMETAGS)
    {
        // Hide the player's nametag
        SetPlayerNametagVisible(playerid, false);
    }
    return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
    // Show the player's nametag when they disconnect
    SetPlayerNametagVisible(playerid, true);
    return 1;
}
In this script, we define a constant ADMIN_LEVEL_HIDDEN_NAMETAGS which represents the admin level that should have hidden nametags. In this case, we've set it to 3, but you can adjust this value to suit your needs.

In the OnPlayerConnect and OnPlayerSpawn functions, we check if the player is an admin with the required level using GetPlayerAdminLevel. If the player is an admin with the required level, we call SetPlayerNametagVisible with a value of false to hide their nametag.

In the OnPlayerDisconnect function, we show the player's nametag by calling SetPlayerNametagVisible with a value of true.

Note that this is just a simple example to demonstrate the concept of hiding nametags for certain admin levels. You may want to modify this script to include additional admin levels, or to hide nametags for non-admin players in certain situations.
