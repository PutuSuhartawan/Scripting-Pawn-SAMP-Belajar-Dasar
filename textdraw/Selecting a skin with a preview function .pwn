 selecting a skin with a textdraw preview function in Pawn:

scss
Copy code
#include <a_samp>

#define MAX_SKINS 300 // Maximum number of skins
#define SKIN_PREVIEW_X 320.0 // X position of the skin preview textdraw
#define SKIN_PREVIEW_Y 80.0 // Y position of the skin preview textdraw

// Skin data structure
struct SkinData
{
    new skinid;
    new previewid;
    new string[32];
};

new SkinData g_Skins[MAX_SKINS]; // Array to store skin data
new skinid = 0; // Current selected skin ID

// Create skin preview textdraw
new g_SkinPreviewTextdraw = INVALID_TEXT_DRAW;
CreateSkinPreviewTextdraw()
{
    g_SkinPreviewTextdraw = TextDrawCreate(SKIN_PREVIEW_X, SKIN_PREVIEW_Y, "");
    TextDrawColor(g_SkinPreviewTextdraw, -1);
    TextDrawBoxColor(g_SkinPreviewTextdraw, 0x000000AA);
    TextDrawSetShadow(g_SkinPreviewTextdraw, 2);
    TextDrawLetterSize(g_SkinPreviewTextdraw, 0.2, 1.2);
    TextDrawAlignment(g_SkinPreviewTextdraw, 1);
    TextDrawFont(g_SkinPreviewTextdraw, 3);
}

// Update skin preview textdraw with the current selected skin
UpdateSkinPreviewTextdraw()
{
    if(g_SkinPreviewTextdraw != INVALID_TEXT_DRAW)
    {
        TextDrawSetString(g_SkinPreviewTextdraw, g_Skins[skinid].string);
    }
}

// Initialize the script
main()
{
    CreateSkinPreviewTextdraw(); // Create skin preview textdraw

    // Load skin data from file
    new file = fopen("skins.txt", "r");
    if(file != INVALID_HANDLE)
    {
        new line[256], previewid;
        while(fgets(line, sizeof(line), file) != EOF)
        {
            sscanf(line, "%d %d %s", genderSkinData[i].skinid, genderSkinData[i].previewid, genderSkinData[i].name);
// Update preview textdraw with new skin data
previewid = genderSkinData[i].previewid;
UpdateSkinPreviewTextdraw(previewid, genderSkinData[i].name);
}
fclose(file);
}

scss
Copy code
// Display skin preview textdraw
ShowSkinPreviewTextdraw();
}

// Function to create skin preview textdraw
CreateSkinPreviewTextdraw()
{
SkinPreviewTextdraw = CreateDynamicTextdraw(SCREEN_WIDTH - 180, SCREEN_HEIGHT - 120, "");
TextDrawSetFont(SkinPreviewTextdraw, 2);
TextDrawSetOutline(SkinPreviewTextdraw, 1);
TextDrawSetShadow(SkinPreviewTextdraw, 0);
TextDrawSetProportional(SkinPreviewTextdraw, 1);
TextDrawSetSelectable(SkinPreviewTextdraw, 0);
TextDrawSetAlignment(SkinPreviewTextdraw, 2);
TextDrawBackgroundColor(SkinPreviewTextdraw, 0x000000FF);
TextDrawBoxColor(SkinPreviewTextdraw, 0x000000FF);
}

// Function to update skin preview textdraw with new skin data
UpdateSkinPreviewTextdraw(previewid, skinname[])
{
new text[64];
format(text, sizeof(text), "Skin Preview\n%s", skinname);
TextDrawSetString(previewid, text);
}

// Function to show skin preview textdraw
ShowSkinPreviewTextdraw()
{
TextDrawShowForAll(SkinPreviewTextdraw);
}

// Function to hide skin preview textdraw
HideSkinPreviewTextdraw()
{
TextDrawHideForAll(SkinPreviewTextdraw);
}

// Callback function when a player selects a skin from the skin preview textdraw
SkinPreviewTextdrawCallback(playerid, skinid)
{
// Set player's skin
SetPlayerSkin(playerid, skinid);
// Hide skin preview textdraw
HideSkinPreviewTextdraw();
}

// Initialize the script
main()
{
CreateSkinPreviewTextdraw(); // Create skin preview textdraw

scss
Copy code
// Load skin data from file
new file = fopen("skins.txt", "r");
if(file != INVALID_HANDLE)
{
    new line[256], previewid;
    while(fgets(line, sizeof(line), file) != EOF)
    {
        sscanf(line, "%d %d %s", genderSkinData[i].skinid, genderSkinData[i].previewid, genderSkinData[i].name);
        // Update preview textdraw with new skin data
        previewid = genderSkinData[i].previewid;
        UpdateSkinPreviewTextdraw(previewid, genderSkinData[i].name);
    }
    fclose(file);
}

// Display skin preview textdraw
ShowSkinPreviewTextdraw();

// Set skin preview textdraw callback function
SetTextDrawCallback(SkinPreviewTextdraw, SkinPreviewTextdrawCallback);
}

// Clean up the script
main()
{
// Hide skin preview textdraw
HideSkinPreviewTextdraw();

scss
Copy code
// Remove skin preview textdraw callback function
SetTextDrawCallback(SkinPreviewTextdraw, NULL);
}

// Additional functions
// Function to save skin data to file
SaveSkinDataToFile()
{
new file = fopen("skins.txt", "w");
if(file != INVALID_HANDLE)
{
for(new i = 0; i < MAX_SKINS; i++)
{
fprintf(file, "%d %d %s\n", genderSkinData[i].skinid, genderSkinData[i].previewid, genderSkinData[i].name);
}
fclose(file);
}
}

// Function to add a new skin to the skin preview textdraw
AddSkinToPreview(skinid, skinname[])
{
new previewid = CreateDynamicTextdraw(SCREEN_WIDTH - 180, SCREEN_HEIGHT - 90, "");
TextDrawSetFont(previewid, 1);
TextDrawSetOutline(previewid, 1);
TextDrawSetShadow(previewid, 0);
TextDrawSetProportional(previewid, 1);
TextDrawSetSelectable(previewid, 1);
TextDrawSetAlignment(previewid, 2);
TextDrawSetString(previewid, skinname);
TextDrawBackgroundColor(previewid, 0x000000FF);
TextDrawBoxColor(previewid, 0x000000FF);
genderSkinData[MAX_SKINS].skinid = skinid;
genderSkinData[MAX_SKINS].previewid = previewid;
genderSkinData[MAX_SKINS].name = skinname;
MAX_SKINS++;
}

// Function to remove a skin from the skin preview textdraw
RemoveSkinFromPreview(skinid)
{
for(new i = 0; i < MAX_SKINS; i++)
{
if(genderSkinData[i].skinid == skinid)
{
TextDrawDestroy(genderSkinData[i].previewid);
genderSkinData[i].skinid = 0;
genderSkinData[i].previewid = 0;
genderSkinData[i].name = "";
MAX_SKINS--;
break;
}
}

// Function to update the skin name in the skin preview textdraw
UpdateSkinNameInPreview(skinid, skinname[])
{
for(new i = 0; i < MAX_SKINS; i++)
{
if(genderSkinData[i].skinid == skinid)
{
genderSkinData[i].name = skinname;
UpdateSkinPreviewTextdraw(genderSkinData[i].previewid, skinname);
break;
}
}
}

// Command handler for adding a new skin to the skin preview textdraw
CMD:addskin(playerid, params[])
{
new skinid, skinname[32];
sscanf(params, "is", skinid, skinname);
AddSkinToPreview(skinid, skinname);
SaveSkinDataToFile();
SendClientMessage(playerid, COLOR_YELLOW, "New skin added to the preview!");
return 1;
}

// Command handler for removing a skin from the skin preview textdraw
CMD:removeskin(playerid, params[])
{
new skinid;
sscanf(params, "i", skinid);
RemoveSkinFromPreview(skinid);
SaveSkinDataToFile();
SendClientMessage(playerid, COLOR_YELLOW, "Skin removed from the preview!");
return 1;
}

// Command handler for updating the name of a skin in the skin preview textdraw
CMD:updateskinname(playerid, params[])
{
new skinid;
new skinname[32];
sscanf(params, "is", skinid, skinname);
UpdateSkinNameInPreview(skinid, skinname);
SaveSkinDataToFile();
SendClientMessage(playerid, COLOR_YELLOW, "Skin name updated!");
return 1;
}
