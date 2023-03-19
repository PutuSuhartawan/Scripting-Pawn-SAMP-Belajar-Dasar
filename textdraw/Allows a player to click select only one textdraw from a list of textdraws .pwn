script that allows a player to select only one textdraw from a list of textdraws:

pawn
Copy code
// Define an array of textdraw IDs
new TextDraw:tdList[] = { 1, 2, 3, 4, 5 };

// Define a variable to hold the player's selected textdraw ID
new playerSelection[MAX_PLAYERS];

// Define a function to show the textdraw list
ShowTextDrawList(playerid)
{
    for(new i = 0; i < sizeof(tdList); i++)
    {
        // Show each textdraw in the list
        ShowTextDrawDialog(playerid, tdList[i], DIALOG_STYLE_LIST, "Select a TextDraw", "OK", "Cancel", "");

        // Set the player's selection to -1 (nothing selected) initially
        playerSelection[playerid] = -1;
    }
}

// Define a callback function to handle the player's selection
forward OnTextDrawResponse(playerid, TextDrawID, listitem, response);

public OnTextDrawResponse(playerid, TextDrawID, listitem, response)
{
    // Check if the player clicked "OK"
    if(response)
    {
        // Set the player's selection to the clicked textdraw ID
        playerSelection[playerid] = TextDrawID;
        
        // Hide all the other textdraws in the list
        for(new i = 0; i < sizeof(tdList); i++)
        {
            if(tdList[i] != TextDrawID)
            {
                HideTextDraw(playerid, tdList[i]);
            }
        }
    }
    else
    {
        // If the player clicked "Cancel", set their selection to -1 (nothing selected)
        playerSelection[playerid] = -1;
    }
    return 1;
}
This script defines an array of textdraw IDs, and shows each textdraw in the list to the player using the ShowTextDrawDialog function. When the player selects a textdraw, the OnTextDrawResponse function is called, which sets the player's selection to the clicked textdraw ID and hides all the other textdraws in the list. If the player cancels the dialog,
