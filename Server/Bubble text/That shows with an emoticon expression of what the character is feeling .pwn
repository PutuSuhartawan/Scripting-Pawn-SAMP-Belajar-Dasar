script that shows a bubble text with an emoticon expression of what the character is feeling:

scss
Copy code
// Function to display a bubble text with an emoticon expression
ShowEmoticonBubble(playerid, message[], emoticon[])
{
    new Float:pos[3];
    GetPlayerPos(playerid, pos[0], pos[1], pos[2]);
    pos[2] += 1.0;
    
    // Create the bubble text with the message and emoticon expression
    new bubbleid = CreateDynamicTextBubble(message, COLOR_WHITE, pos[0], pos[1], pos[2], 10.0, 0.0, playerid, 5000, -1);
    SetDynamicTextBubbleFont(bubbleid, 1);
    SetDynamicTextBubbleColor(bubbleid, 255, 255, 255,255);

java
Copy code
// Set the emoticon expression based on the parameter
switch(emoticon)
{
    case "happy":
        SetDynamicTextBubbleIcon(bubbleid, 1);
        break;
    
    case "sad":
        SetDynamicTextBubbleIcon(bubbleid, 2);
        break;
    
    case "angry":
        SetDynamicTextBubbleIcon(bubbleid, 3);
        break;
    
    default:
        SetDynamicTextBubbleIcon(bubbleid, 0);
        break;
}

// Set a timer to remove the bubble text after a few seconds
SetTimerEx("RemoveBubbleText", 5000, false, "i", bubbleid);
}

// Function to remove the bubble text
RemoveBubbleText(bubbleid)
{
DestroyDynamicTextBubble(bubbleid);
}

// Example usage
ShowEmoticonBubble(playerid, "Hello, how are you?", "happy");

vbnet
Copy code

This function creates a dynamic text bubble above the player's head, with a message and an emoticon expression based on the parameter. The function also sets a timer to remove the bubble text after a few seconds. 

You can call this function in your script whenever a character chats IC and you want to show their emotional expression. Simply pass the player ID, message, and emoticon expression as parameters to the function.


