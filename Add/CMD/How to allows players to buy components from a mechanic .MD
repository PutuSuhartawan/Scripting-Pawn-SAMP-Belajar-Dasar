




The script you provided is a command script that allows players to buy components from a mechanic. The script first checks if the player is within range of the mechanic's shop. If the player is within range, the script then extracts the number of components the player wants to buy from the parameters passed to the command. The script then adds the number of components to the player's inventory and subtracts the cost of the components from the player's money. Finally, the script sends a message to the player confirming the purchase.

Here is a breakdown of the script:

CMD:buycomponent(playerid, params[])
{
// cmd beli component
if(IsPlayerInRangeOfPoint(playerid, Float:4.0, 2141.9475,-1728.9771,13.5592))
{
if(isnull(params)) return SendClientMessage(playerid, COLOR_GREEN, "[Usage:] /buycomponent (Jumlah bahan component yang akan di beli)");

Code snippet
    // fungsi untuk beli component
    extract params -> new Jumlah;
    pInfo[playerid][pComponent] = pInfo[playerid][pComponent] + Jumlah;

    ApplyAnimation(playerid, "INT_SHOP","shop_shelf", 4.1, 0, 0, 0, 0, 0, 0);
  
    new hargacomponent = random(3)*Jumlah;
    pInfo[playerid][pMoney] = pInfo[playerid][pMoney]-hargacomponent;
    ResetPlayerMoney(playerid);
    GivePlayerMoney(playerid, pInfo[playerid][pMoney]);
    SavePlayer(playerid);

    new infopembelian[200];
    format(infopembelian, sizeof(infopembelian), ""COL_LIGHTBLUE"Component"COL_GREEN": Anda telah beli Component Sebanyak %i dengan harga %i$.", Jumlah, hargacomponent);
    SendClientMessage(playerid,0xFF0000FF, infopembelian);

}
else
{
    ApplyAnimation(playerid, "MISC", "SEAT_LR", 4.0,0,0,0,0,0,0);
    GameTextForPlayer(playerid, "Anda perlu ke penjual component mekanik untuk membelinya", 800, 1);
}
Use code with caution. Learn more
}

The first line of the script defines the function CMD:buycomponent. This function takes two parameters: the player ID and the parameters passed to the command.

The second line of the script checks if the player is within range of the mechanic's shop. If the player is not within range, the script sends a message to the player telling them that they need to be closer to the shop to buy components.

The third line of the script extracts the number of components the player wants to buy from the parameters passed to the command. If the parameters are null, the script sends a message to the player telling them how to use the command.

The fourth line of the script adds the number of components to the player's inventory.

The fifth line of the script subtracts the cost of the components from the player's money.

The sixth line of the script saves the player's information.

The seventh line of the script formats a message that confirms the purchase and sends the message to the player.

The eighth line of the script checks if the player is not within range of the mechanic's shop. If the player is not within range, the script sends a message to the player telling them that they need to be closer to the shop to buy components.

I hope this explanation is helpful! Let me know if you have any other questions.
