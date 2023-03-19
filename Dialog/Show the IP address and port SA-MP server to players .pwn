

To show the IP address and port of your SA-MP server to players using a dialog, you can use the ShowPlayerDialog function in your gamemode script. Here is some sample code to get you started:

cpp
Copy code
public OnPlayerCommandText(playerid, cmdtext[])
{
    if (strcmp(cmdtext, "/serverinfo", true) == 0)
    {
        // Get the IP address and port of the server
        new ip[16], port;
        GetServerIP(ip, sizeof(ip));
        port = GetServerPort();

        // Show a dialog to the player with the server info
        ShowPlayerDialog(playerid, 1, DIALOG_STYLE_MSGBOX, "Server Info",
            "Server IP: %s\nServer Port: %d", "OK", "");
        
        return 1;
    }
    return 0;
}
This code listens for the /serverinfo command from the player and then gets the IP address and port of the server using the GetServerIP and GetServerPort functions. It then shows a dialog to the player using the ShowPlayerDialog function, which displays the server info with a "OK" button to close the dialog.

You can adjust the dialog text and style to fit your needs, and you can also add additional functionality to the command if desired.
