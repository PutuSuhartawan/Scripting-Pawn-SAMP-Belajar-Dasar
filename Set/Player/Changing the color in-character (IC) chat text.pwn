changing the color of a player's in-character (IC) chat text:



scss
Copy code
public OnPlayerText(playerid, text[])
{
    // Check if the player is connected
    if(!IsPlayerConnected(playerid))
        return 0;
    
    // Check if the text is an IC chat message
    if(text[0] != '/')
        return 0;
    
    // Set the color of the IC chat text
    SetPlayerChatBubbleColor(playerid, 0xFF99CCFF);
    
    // Send the IC chat message
    SendClientMessageToAll(0xFF99CCFF, "[IC] %s: %s", GetPlayerName(playerid), text);
    
    return 1;
}
This script checks if the player's chat message starts with a slash ("/"), which is often used to indicate an IC chat message. If it is an IC chat message, the script sets the player's chat bubble color to a light purple color (0xFF99CCFF) using the SetPlayerChatBubbleColor function, and sends the message to all clients with the "[IC]" prefix using the SendClientMessageToAll function.

You can modify the color code to your desired color by changing the hex value (0xFF99CCFF).
