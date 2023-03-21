 script for a dice game that shows the winner in a textdraw:
 
scss
Copy code
new TextDraw:gDice;

// Create the dice textdraw
public OnGameModeInit()
{
    gDice = TextDrawCreate(10.0, 230.0, " ");
    TextDrawLetterSize(gDice, 0.5, 1.0);
    TextDrawAlignment(gDice, 1);
    TextDrawColor(gDice, 0xFFFF00FF);
}

// Roll the dice and display the winner
public RollDice(playerid)
{
    new winner = random(1, 6);
    TextDrawSetString(gDice, "The winner is: Player " + winner);
    TextDrawShowForPlayer(playerid, gDice);
    return winner;
}
In this script, the OnGameModeInit function creates the textdraw for displaying the winner. The textdraw is positioned at (10.0, 230.0) and uses a yellow color with a letter size of 0.5 x 1.0.

The RollDice function generates a random number between 1 and 6 to simulate rolling a dice. The winner is stored in the winner variable, and the winner's ID is displayed in the textdraw using the TextDrawSetString function. Finally, the textdraw is shown to the player using the TextDrawShowForPlayer function.

You can call the RollDice function whenever you want to simulate a dice roll and display the winner in the textdraw. Note that you may want to add additional logic to handle ties or other game rules, depending on the specifics of your dice game.
