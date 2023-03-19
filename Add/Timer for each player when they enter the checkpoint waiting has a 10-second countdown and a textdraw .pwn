 script for your requirement:

pawn
Copy code
new BusMissionCheckpoint;

// Callback function to trigger the next checkpoint after a 10 second wait
forward OnBusMissionCheckpointTimer();

// Function to create and show the bus mission checkpoint
ShowBusMissionCheckpoint(playerid)
{
    // Check if the player is already in a checkpoint
    if(BusMissionCheckpoint != 0)
    {
        SendClientMessage(playerid, COLOR_RED, "You are already in a checkpoint.");
        return;
    }

    // Create a new checkpoint at the desired location
    BusMissionCheckpoint = CreateCheckpoint(CHECKPOINT_CYLINDER, 123.45, 67.89, 10.0, 5.0, 255, 0, 0, 255, playerid);

   
   
   script that uses a timer and textdraw to display a countdown before allowing the player to proceed to the next checkpoint:

pawn
Copy code
new Timer:busTimer[MAX_PLAYERS];

public OnPlayerEnterCheckpoint(playerid)
{
    // If the player is in the correct checkpoint
    if(IsPlayerInCheckpoint(playerid))
    {
        // If the timer for this player is not running
        if(!IsTimerRunning(busTimer[playerid]))
        {
            // Create a timer for this player with a 10 second countdown
            busTimer[playerid] = SetTimerEx("OnTimerBus", 10000, false, "i", playerid);

            // Display the countdown using a textdraw
            ShowTimerTextdraw(playerid, 10);
        }
        else
        {
            // If the timer is already running, display a message to the player
            SendClientMessage(playerid, COLOR_YELLOW, "Please wait for the countdown to finish.");
        }
    }
}

public OnTimerBus(timerid, playerid)
{
    // If the player is still in the correct checkpoint
    if(IsPlayerInCheckpoint(playerid))
    {
        // Teleport the player to the next checkpoint
        SetPlayerPos(playerid, nextCheckpointX, nextCheckpointY, nextCheckpointZ);

        // Stop the timer for this player
        KillTimer(busTimer[playerid]);

        // Hide the textdraw
        HideTimerTextdraw(playerid);
    }
}

public ShowTimerTextdraw(playerid, timeLeft)
{
    new string[32];
    format(string, sizeof(string), "Please wait %d seconds...", timeLeft);
    TextDrawShowForPlayer(playerid, textdrawTimerId, 0);
    TextDrawSetString(playerid, textdrawTimerId, string);
    if(timeLeft > 0)
    {
        SetTimerEx("ShowTimerTextdraw", 1000, false, "ii", playerid, timeLeft-1);
    }
}

public HideTimerTextdraw(playerid)
{
    TextDrawHideForPlayer(playerid, textdrawTimerId);
}
This script creates a timer for each player when they enter the checkpoint. The timer has a 10-second countdown, and a textdraw is used to display the remaining time to the player. Once the timer expires, the player is teleported to the next checkpoint and the timer and textdraw are hidden. If the player enters the checkpoint again before the timer expires, they will be notified that they need to wait for the countdown to finish.
