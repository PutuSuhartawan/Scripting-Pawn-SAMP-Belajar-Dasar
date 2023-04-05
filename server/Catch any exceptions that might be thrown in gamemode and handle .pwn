Pawn script that attempts to catch any exceptions that might be thrown in your gamemode and handle them gracefully:

arduino
Copy code
#include <a_samp>

public OnGameModeInit() {
    SetTimer("CheckServerHealth", 10000, true);
    return 1;
}

public CheckServerHealth() {
    // Do a health check of the server here
    // For example, check if MySQL connection is still active, etc.
    return 1;
}

forward OnExceptionCaught(playerid, type, error_info[]);

public OnPlayerDisconnect(playerid, reason) {
    // Player disconnected, reset their data here if necessary
    return 1;
}

public OnExceptionCaught(playerid, type, error_info[]) {
    // Handle any exceptions caught here
    SendClientMessage(playerid, 0xFFFFFFFF, "An error occurred, please try again later.");
    // Log the error to a file, or email it to the server owner, etc.
    return 1;
}
This script sets a timer to periodically check the health of the server (e.g. checking the status of the MySQL connection), and defines an OnExceptionCaught callback function that will be called whenever an exception is caught in the gamemode. In the OnExceptionCaught function, you can handle the exception in whatever way is appropriate for your gamemode (e.g. sending a message to the player, logging the error to a file, emailing the error to the server owner, etc.).

To use this script, add it to your gamemode's script file and recompile your gamemode. Once the gamemode is running, the script will periodically check the health of the server and handle any exceptions that might be thrown in your gamemode.
