script in Pawn for displaying the player's score in a textdraw after they finish a mission:

scss
Copy code
new Text:scoreText; // textdraw for displaying the player's score

// function to create the score textdraw
stock CreateScoreTextdraw(playerid)
{
    if (!IsPlayerConnected(playerid)) return 0;
    scoreText = TextDrawCreate(320.0, 240.0, "");
    TextDrawFont(scoreText, FONT_SANS_SERIF);
    TextDrawLetterSize(scoreText, 0.3, 1.0);
    TextDrawTextSize(scoreText, 320.0, 0.0);
    TextDrawAlignment(scoreText, 2);
    TextDrawColor(scoreText, 0xFFFFFFFF);
    TextDrawUseBox(scoreText, true);
    TextDrawBoxColor(scoreText, 0x80000000);
    TextDrawSetShadow(scoreText, 1);
    TextDrawSetOutline(scoreText, 1);
    return 1;
}

// function to update the score textdraw
stock UpdateScoreTextdraw(playerid, score)
{
    if (!IsPlayerConnected(playerid) || !TextDrawIsValid(scoreText)) return 0;
    new string[32];
    format(string, sizeof(string), "Score: %d", score);
    TextDrawSetString(scoreText, string);
    TextDrawShowForPlayer(playerid, scoreText);
    return 1;
}

// main function to handle player mission completion
public OnPlayerFinishMission(playerid)
{
    new score = GetPlayerScore(playerid);
    CreateScoreTextdraw(playerid);
    UpdateScoreTextdraw(playerid, score);
    return 1;
}
This script creates a textdraw using the TextDrawCreate() function with the position and initial text set. It then sets the font, size, color, box properties, and other settings for the textdraw. The UpdateScoreTextdraw() function updates the text of the textdraw with the player's current score and shows it for the player using TextDrawShowForPlayer(). Finally, the OnPlayerFinishMission() function gets the player's score and calls the CreateScoreTextdraw() and UpdateScoreTextdraw() functions to display it for the player.

Note that you will need to add this script to your SAMP gamemode or filterscript and include it in the appropriate callbacks for it to work.
