script that hides a player's nametag and creates a text label with a random ID to make it difficult for other players to identify who is using the mask:

pawn
Copy code
new const MASK_ITEM_ID = 1234; // The item ID of the mask item
new const MASK_LABEL_COLOR = 0xFFFFFF; // The color of the mask text label
new const MASK_LABEL_RANGE = 20.0; // The range at which the mask text label is visible

// This function is called when a player picks up an item
public OnPlayerPickUpPickup(playerid, pickupid)
{
    if(GetPickupType(pickupid) == PICKUP_TYPE_ITEM && GetPickupModel(pickupid) == MASK_ITEM_ID)
    {
        // Hide the player's nametag
        HidePlayerNameTag(playerid);

        // Generate a random ID for the mask text label
        new labelid = random(100000, 999999);

        // Create the mask text label
        CreatePlayerTextDraw(playerid, labelid, "~w~Masked", MASK_LABEL_COLOR, 0.0, 0.0, 0.0);
        PlayerTextDrawSetSelectable(playerid, labelid, false);
        PlayerTextDrawSetPreviewModel(playerid, labelid, MASK_ITEM_ID);
        PlayerTextDrawSetPreviewRot(playerid, labelid, 180.0, 0.0, 0.0, 0.0);
        PlayerTextDrawSetPreviewVehCol(playerid, labelid, -1, -1);
        PlayerTextDrawSetPreviewMove(playerid, labelid, true);
        PlayerTextDrawShowForPlayer(playerid, labelid, MASK_LABEL_RANGE);

        SendClientMessage(playerid, COLOR_GREEN, "You are now wearing a mask.");
    }
}

// This function is called when a player drops an item
public OnPlayerDropItem(playerid, itemid)
{
    if(itemid == MASK_ITEM_ID)
    {
        // Show the player's nametag
        ShowPlayerNameTag(playerid);

        // Remove the mask text label
        DeletePlayerTextDraw(playerid, MASK_ITEM_ID);

        SendClientMessage(playerid, COLOR_GREEN, "You have removed your mask.");
    }
}
This script hides a player's nametag when they pick up the mask item and creates a text label that displays "Masked" with a random ID that other players cannot easily identify. The text label also previews the mask item's model and moves with the player. When the player drops the mask item, their nametag is shown again and the text label is removed.

Note that this script does not prevent other players from identifying who is wearing the mask by looking at their clothing, voice, or other identifying characteristics. Additionally, this script assumes that players can only wear one mask at a time and that the mask item has a fixed ID. You may need to modify the script to suit your specific server setup and game mode.
