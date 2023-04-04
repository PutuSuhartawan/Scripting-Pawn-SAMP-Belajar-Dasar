script in PAWN that uses checkpoints to prevent player data from being rolled back in case of a server crash:

scss
Copy code
// Global variable to store the current checkpoint ID
new g_CurrentCheckpoint = -1;

public OnGameModeInit()
{
    // Load the last saved checkpoint ID from the database
    g_CurrentCheckpoint = LoadCheckpointIDFromDatabase();

    // Set the server's default checkpoint interval (30 minutes)
    SetTimer("SaveCheckpoint", 1800000, true);
    return 1;
}

public OnPlayerConnect(playerid)
{
    // If the player is joining for the first time, teleport them to the current checkpoint
    if (GetPlayerUniqueID(playerid) == INVALID_UNIQUE_ID)
    {
        SetPlayerPos(playerid, GetCheckpointX(g_CurrentCheckpoint),
                     GetCheckpointY(g_CurrentCheckpoint), GetCheckpointZ(g_CurrentCheckpoint));
        SetPlayerUniqueID(playerid, GenerateUniqueID());
    }
    return 1;
}

public SaveCheckpoint()
{
    // Increase the checkpoint ID and save it to the database
    g_CurrentCheckpoint++;
    SaveCheckpointIDToDatabase(g_CurrentCheckpoint);

    // Save player data to the database for all connected players
    for (new i = 0; i < MAX_PLAYERS; i++)
    {
        if (IsPlayerConnected(i))
        {
            SavePlayerDataToDatabase(i, g_CurrentCheckpoint);
        }
    }
    return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
    // Save the player's data to the database when they disconnect
    SavePlayerDataToDatabase(playerid, g_CurrentCheckpoint);
    return 1;
}
In this script, we use checkpoints to periodically save the player data to the database, which will prevent data rollback in case of a server crash. We first load the last saved checkpoint ID from the database and set it as the current checkpoint ID.

When a player connects to the server, we check if they have a unique ID stored (generated with GenerateUniqueID function), if not, they are teleported to the current checkpoint position and their unique ID is generated and stored. This unique ID is used to identify the player data in the database.

We set a timer to periodically save the checkpoint and player data to the database using the SaveCheckpoint function. This function increases the checkpoint ID and saves it to the database, then iterates through all connected players and saves their data to the database for the current checkpoint.

When a player disconnects from the server, we call the SavePlayerDataToDatabase function to save their data to the database for the current checkpoint.

Note that this is just a simple example to demonstrate the concept of using checkpoints to prevent data rollback. You may want to modify this script to include additional player data like inventory or money, or to handle errors like database connection failures.
