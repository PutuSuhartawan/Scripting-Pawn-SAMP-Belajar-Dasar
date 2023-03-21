function that shows data on an investor's skills, similar to the code you provided:

scss
Copy code
void ShowInvestorSkills(playerid, params[])
{
    // Check if the command is valid
    if(strcmp(params,"inspect",true) != 0)
    {
        return Error(playerid, "Invalid command.");
    }

    // Check if the investor is inspectable
    if(pData[playerid][pInspectOffer] == INVALID_PLAYER_ID || !IsPlayerConnected(pData[playerid][pInspectOffer]))
    {
        return Error(playerid, "That player is not connected.");
    }

    // Check if the player is within range of the investor
    if(!IsPlayerInRangeOfPlayer(playerid, pData[playerid][pInspectOffer], 5.0))
    {
        return Error(playerid, "You must be near this player.");
    }

    // Determine the investor's body condition
    char body[80];
    if(PlayerInfo[playerid][pCondition] > 61)
    {
        strcpy(body, "Normal");
    }
    else if(PlayerInfo[playerid][pCondition] < 60)
    {
        strcpy(body, "Sick");
    }

    // Create the dialog message
    char str[1500];
    sprintf(str
    
     possible implementation of a function to show an investor's skill:

pawn
Copy code
stock ShowInvestorSkill(playerid, investorid)
{
    // Check if the player and investor are connected and in range
    if(!IsPlayerConnected(playerid) || !IsPlayerConnected(investorid))
        return Error(playerid, "One of the players is not connected.");
    if(!IsPlayerInRangeOfPlayer(playerid, investorid, 5.0))
        return Error(playerid, "You must be near this player.");

    // Get the investor's skill level and format the message
    new skill = GetPlayerSkillLevel(investorid, SKILL_INVESTOR);
    new str[128];
    format(str, sizeof(str), "{56A4E4}Investor skill level: {C2A2DA}%d", skill);

    // Show the message to the player
    Dialog(playerid, INVALID_DIALOG_ID, DIALOG_STYLE_MSGBOX, "Investor Skill", str, "Close", "");
    return 1;
}
This function takes two parameters: the playerid of the player who wants to see the investor's skill, and the investorid of the investor whose skill level the player wants to see.

The function first checks if both players are connected and in range using the IsPlayerConnected and IsPlayerInRangeOfPlayer functions. If either check fails, it returns an error message.

Next, the function calls the GetPlayerSkillLevel function to retrieve the investor's skill level, passing the investorid and the SKILL_INVESTOR constant as arguments. The skill level is stored in the skill variable.

Finally, the function formats a message string using the format function, including the investor's skill level, and shows it to the player using the Dialog function. The function returns 1 to indicate success.

You can call this function in your main script code like this:

pawn
Copy code
else if(strcmp(params, "showinvestorskill", true) == 0)
{
    if(pData[playerid][pInvestor] == INVALID_PLAYER_ID || !IsPlayerConnected(pData[playerid][pInvestor]))
        return Error(playerid, "You are not associated with an investor.");
        
    ShowInvestorSkill(playerid, pData[playerid][pInvestor]);
    new fmt_str[128];
    format(fmt_str, sizeof(fmt_str), "You have viewed your investor's skill level.");
    Info(playerid, fmt_str);
}
This code first checks if the player is associated with an investor by checking the pData[playerid][pInvestor] variable. If the variable is invalid or the associated player is not connected, an error message is returned.

Otherwise, the ShowInvestorSkill function is called with the playerid and the associated investor's investorid as arguments. After the function call, a success message is shown to the player.
