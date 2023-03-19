experiencing an issue with the maximum player limit being exceeded on your server. To fix this issue, you could try the following script:


scss
Copy code
// OnPlayerConnect callback function
public OnPlayerConnect(playerid)
{
    // Get the number of currently connected players
    new current_players = GetPlayerPoolSize();

    // Check if the maximum player limit has been reached
    if (current_players >= MAX_PLAYERS)
    {
        // If the maximum player limit has been reached, kick the player and show a message
        Kick(playerid);
        SendClientMessage(playerid, COLOR_RED, "The server is currently full. Please try again later.");
    }
    else
    {
        // If the maximum player limit has not been reached, continue with the connection process
        // ...
    }
}
This script checks the number of currently connected players and kicks the player if the maximum player limit has been reached. You can adjust the MAX_PLAYERS constant to set the maximum number of players allowed on your server.

Additionally, you may want to investigate why your server is detecting 27 players online when there are fewer players actually connected. This could be a bug in your gamemode or a problem with your server configuration.
