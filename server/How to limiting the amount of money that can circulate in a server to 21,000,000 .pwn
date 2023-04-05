Pawn script for limiting the amount of money that can circulate in a server to 21,000,000:


pawn
Copy code
// Define the maximum amount of money that can circulate
#define MAX_MONEY 21000000

new gMoney = 0;

public OnPlayerConnect(playerid)
{
    // Set the player's money to 0 when they connect
    SetPlayerMoney(playerid, 0);
    return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
    if(strcmp(cmdtext, "/givemoney", true) == 0)
    {
        // Parse the command parameters to get the amount of money to give
        new amount;
        if(sscanf(cmdtext, "s[d]", amount))
        {
            // Check if the amount of money to give is valid
            if(amount < 1)
            {
                SendClientMessage(playerid, -1, "Invalid amount of money.");
                return 1;
            }

            // Check if there is enough money left to give
            if(gMoney + amount > MAX_MONEY)
            {
                SendClientMessage(playerid, -1, "The maximum amount of money has been reached.");
                return 1;
            }

            // Give the player the specified amount of money
            GivePlayerMoney(playerid, amount);

            // Update the amount of money in circulation
            gMoney += amount;

            // Notify all players about the new amount of money in circulation
            new message[128];
            format(message, sizeof(message), "The amount of money in circulation is now %d.", gMoney);
            SendClientMessageToAll(-1, message);
        }
        else
        {
            SendClientMessage(playerid, -1, "Usage: /givemoney [amount]");
        }
        return 1;
    }
    return 0;
}

public OnPlayerDisconnect(playerid, reason)
{
    // Subtract the player's money from the amount of money in circulation when they disconnect
    gMoney -= GetPlayerMoney(playerid);
    return 1;
}
This script keeps track of the amount of money that is in circulation on the server using a global variable gMoney. When a player connects to the server, their money is set to 0 to ensure that the total amount of money in circulation does not exceed the maximum limit.

The script includes a command /givemoney [amount] that allows players to give themselves money. The command checks if the amount of money to give is valid (i.e. greater than or equal to 1), and if there is enough money left to give (i.e. the total amount of money in circulation plus the amount of money to give does not exceed the maximum limit). If the amount of money to give is valid and there is enough money left to give, the player is given the specified amount of money, the amount of money in circulation is updated, and all players are notified about the new amount of money in circulation.

When a player disconnects from the server, their money is subtracted from the amount of money in circulation to ensure that the total amount of money in circulation is always accurate.

Note that this script only limits the amount of money that can circulate on the server, but it does not prevent players from giving themselves money through other means (such as using cheats or modifying their game files). To ensure the integrity of the game, it is important to use a secure and reliable anti-cheat system.
