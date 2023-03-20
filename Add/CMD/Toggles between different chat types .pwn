 script for a pawn language that toggles between different chat types when specific commands are entered into the game's command console (CMD):

cpp
Copy code
new bool:gICEnabled = true;
new bool:gOOCEnabled = true;
new bool:gAdminEnabled = false;
new bool:gNotifEnabled = true;

forward ToggleIC();
forward ToggleOOC();
forward ToggleAdmin();
forward ToggleNotif();

public OnPlayerCommandText(playerid, cmdtext[])
{
    if(!strcmp(cmdtext, "/ic", true))
    {
        ToggleIC();
        return 1;
    }
    else if(!strcmp(cmdtext, "/ooc", true))
    {
        ToggleOOC();
        return 1;
    }
    else if(!strcmp(cmdtext, "/admin", true))
    {
        ToggleAdmin();
        return 1;
    }
    else if(!strcmp(cmdtext, "/notif", true))
    {
        ToggleNotif();
        return 1;
    }
    return 0;
}

ToggleIC()
{
    gICEnabled = !gICEnabled;
    SendClientMessageToAll(-1, gICEnabled ? 0xFFFFFFAA : 0xFFAA0000, "IC chat has been toggled %s.", gICEnabled ? "on" : "off");
}

ToggleOOC()
{
    gOOCEnabled = !gOOCEnabled;
    SendClientMessageToAll(-1, gOOCEnabled ? 0xFFFFFFAA : 0xFFAA0000, "OOC chat has been toggled %s.", gOOCEnabled ? "on" : "off");
}

ToggleAdmin()
{
    gAdminEnabled = !gAdminEnabled;
    SendClientMessageToAll(-1, gAdminEnabled ? 0xFFFFFFAA : 0xFFAA0000, "Admin chat has been toggled %s.", gAdminEnabled ? "on" : "off");
}

ToggleNotif()
{
    gNotifEnabled = !gNotifEnabled;
    SendClientMessageToAll(-1, gNotifEnabled ? 0xFFFFFFAA : 0xFFAA0000, "Notification chat has been toggled %s.", gNotifEnabled ? "on" : "off");
}
To use this script, save it as a .pwn file in the "filterscripts" folder of your SAMP server directory. Then, start or restart your server, and type "/ic" in the in-game command console (CMD) to toggle the IC chat type on or off. Similarly, type "/ooc" to toggle OOC chat, "/admin" to toggle admin chat, and "/notif" to toggle notifications. The script will display a message to all players indicating whether the chat type has been enabled or disabled.



public OnPlayerText(playerid, text[])
{
    if(gICEnabled && text[0] == '/')
    {
        SendClientMessage(playerid, -1, "IC chat is currently disabled.");
        return 0;
    }
    else if(gOOCEnabled && text[0] == '[')
    {
        SendClientMessage(playerid, -1, "OOC chat is currently disabled.");
        return 0;
    }
    else if(gAdminEnabled && text[0] == '@')
    {
        SendClientMessage(playerid, -1, "Admin chat is currently disabled.");
        return 0;
    }
    else if(gNotifEnabled && text[0] == '*')
    {
        SendClientMessage(playerid, -1, "Notification chat is currently disabled.");
        return 0;
    }
    return 1;
}
This modified script includes a filter in the OnPlayerText callback function that checks the first character of the message text to determine the chat type. If the chat type is currently disabled, the filter will send a message to the player indicating that the chat type is disabled and prevent the message from being sent to other players. If the chat type is enabled, the message will be sent normally.

To use this script, follow the same steps as before and enter one of the toggle commands ("/ic", "/ooc", "/admin", or "/notif") in the in-game command console (CMD) to toggle the chat
