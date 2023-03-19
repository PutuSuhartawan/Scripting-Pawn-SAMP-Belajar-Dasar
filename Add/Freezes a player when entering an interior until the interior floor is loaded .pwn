Command that freezes a player when entering an interior until the interior floor is loaded:

scss
Copy code
CMD:enterinterior(playerid, interiorid)
{
    // Freeze the player
    FreezePlayer(playerid, 1);

    // Get the interior position
    Float:x, Float:y, Float:z;
    GetInteriorPos(interiorid, x, y, z);

    // Load the interior and wait for the floor to load
    LoadInterior(interiorid);
    while (!IsInteriorReady(interiorid, true))
    {
        // Display a message to the player
        SendClientMessage(playerid, -1, "Loading interior floor...");

        // Wait 100 milliseconds before checking again
        Sleep(100);
    }

    // Teleport the player to the interior position
    SetPlayerPos(playerid, x, y, z);

    // Unfreeze the player
    FreezePlayer(playerid, 0);

    // Display a message to the player
    SendClientMessage(playerid, -1, "You have entered the interior.");
    return 1;
}
To use this command, players can type "/enterinterior [interiorid]" in the chat, where [interiorid] is the ID of the interior they want to enter. The command will freeze the player, load the interior and wait for the floor to load, teleport the player to the interior position, and unfreeze the player.
