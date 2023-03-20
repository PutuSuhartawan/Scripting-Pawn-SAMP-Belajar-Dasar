Script in PAWN for adding a text logo to a vehicle in GTA San Andreas Multiplayer (SA:MP) with a custom font:

cpp
Copy code
#include <a_samp>

// Define the font ID for the custom font
#define FONT_CUSTOM 7

// Define the text color and size
#define TEXT_COLOR 0xFFFFFFFF // white
#define TEXT_SIZE 1.0

// Function to attach a text label to a vehicle
AttachTextLabelToVehicle(vehicleid, text[], font = FONT_CUSTOM, offset_x = 0.0, offset_y = 0.0, offset_z = 0.0)
{
    new labelid = CreateTextLabel(text, TEXT_COLOR, offset_x, offset_y, offset_z, font, TEXT_SIZE);
    if (labelid)
    {
        AttachDynamicTextLabelToVehicle(labelid, vehicleid, 0.0, 0.0, 0.0);
        return labelid;
    }
    else
    {
        return INVALID_TEXT_LABEL;
    }
}

// Callback function for when the player enters a vehicle
public OnPlayerStateChange(playerid, newstate, oldstate)
{
    if (newstate == PLAYER_STATE_DRIVER)
    {
        new vehicleid = GetPlayerVehicleID(playerid);
        if (IsValidVehicle(vehicleid))
        {
            AttachTextLabelToVehicle(vehicleid, "My Text Logo", FONT_CUSTOM, 0.0, 2.0, 1.0);
        }
    }
    return 1;
}

// Main script function
main()
{
    // Load the custom font file
    if (!LoadFontFile("myfont.ttf"))
    {
        printf("Error loading font file!");
        return 0;
    }
    // Set the custom font as the default font for the game
    SetDefaultFont(FONT_CUSTOM);

    // Add the player state change callback
    AddPlayerState(playerid, PLAYER_STATE_DRIVER, OnPlayerStateChange);
    
    return 1;
}
Explanation:

The script defines a custom font ID FONT_CUSTOM which is set to 7. This font ID is used in the AttachTextLabelToVehicle function to specify the custom font for the text label.

The AttachTextLabelToVehicle function takes as input the vehicle ID, the text to display, the font ID, and the X, Y, Z offsets from the vehicle's position to place the label. The function creates a dynamic text label with the specified text and font, and attaches it to the vehicle at the specified offsets. The label ID is returned if successful, or INVALID_TEXT_LABEL if there was an error creating the label.

The OnPlayerStateChange function is a callback function that is called when the player enters a vehicle. If the player is in a valid vehicle (not on foot or on a passenger seat), the function attaches the text label to the vehicle using the AttachTextLabelToVehicle function.

The main function is the main script function that loads the custom font file using the LoadFontFile function, sets the custom font as the default font for the game using SetDefaultFont, and adds the OnPlayerStateChange callback using AddPlayerState.
