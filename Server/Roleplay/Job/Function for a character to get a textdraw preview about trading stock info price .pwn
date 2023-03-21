function for a character to get a textdraw preview about trading stock info price:

scss
Copy code
// Function to show a textdraw preview of trading stock info price to a player
ShowTradingStockInfo(playerid, stockName[], stockPrice)
{
    // Define the textdraw preview dimensions and position
    new Float:previewWidth = 200.0, Float:previewHeight = 80.0;
    new Float:previewX = 10.0, Float:previewY = 10.0;
    
    // Create the textdraw preview
    new previewid = TextDrawCreate(previewX, previewY, "");
    TextDrawBackgroundColor(previewid, 0x000000FF);
    TextDrawFont(previewid, 0);
    TextDrawLetterSize(previewid, 0.3, 1.0);
    TextDrawSetProportional(previewid, true);
    TextDrawSetShadow(previewid, 0);
    TextDrawSetOutline(previewid, 1);
    TextDrawAlignment(previewid, 0);
    TextDrawColor(previewid, -1);
    TextDrawSetString(previewid, "Trading Stock Info:\n\n" + stockName + ": $" + stockPrice);
    TextDrawShowForPlayer(playerid, previewid);
    
    // Set a timer to remove the textdraw preview after a few seconds
    SetTimerEx("RemoveTextDrawPreview", 5000, false, "i", previewid);
}

// Function to remove the textdraw preview
RemoveTextDrawPreview(previewid)
{
    TextDrawHideForAll(previewid);
    TextDrawDestroy(previewid);
}

// Example usage
ShowTradingStockInfo(playerid, "ABC Inc.", 100.50);
In this example, the function creates a textdraw preview with the dimensions and position defined, and sets the background color, font, letter size, alignment, color, and text string. The function then shows the textdraw preview to the player, and sets a timer to remove it after a few seconds. You can call this function in your script whenever you want to show a player a preview of trading stock info price, passing the player ID, stock name, and stock price as parameters.
