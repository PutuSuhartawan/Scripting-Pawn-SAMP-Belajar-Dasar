Pawn script that demonstrates how to hide a textdraw inventory:

new Text:InventoryText;

// Function to show the inventory textdraw
ShowInventory(playerid)
{
    // Set the textdraw properties
    TextDrawTextSize(InventoryText, 300.0, 0.0);
    TextDrawAlignment(InventoryText, 2);
    TextDrawColor(InventoryText, 0xFFFFFFFF);
    TextDrawSetShadow(InventoryText, 1);
    TextDrawSetOutline(InventoryText, 0);

    // Add items to the inventory textdraw
    TextDrawAddText(InventoryText, "Item 1", 150.0, 20.0);
    TextDrawAddText(InventoryText, "Item 2", 150.0, 40.0);
    TextDrawAddText(InventoryText, "Item 3", 150.0, 60.0);
    TextDrawAddText(InventoryText, "Item 4", 150.0, 80.0);

    // Show the inventory textdraw to the player
    TextDrawShowForPlayer(playerid, InventoryText);
}

// Function to hide the inventory textdraw
HideInventory(playerid)
{
    // Hide the inventory textdraw from the player
    TextDrawHideForPlayer(playerid, InventoryText);
}

// Callback function when the player clicks on the inventory textdraw
public OnPlayerClickTextDraw(playerid, Text:clickedid)
{
    if (clickedid == InventoryText)
    {
        // Handle inventory item clicks here
        // ...
        return 1;
    }
    return 0;
}

To hide the inventory textdraw, you can call the HideInventory function. This will hide the textdraw from the player and prevent them from clicking on it.
