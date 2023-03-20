script in Pawn for filling fuel at gas stations in GTA San Andreas Multiplayer (SAMP):



scss
Copy code
new Float:gasPrice = 1.0; // the price of gas per liter
new Float:gasLimit = 60.0; // the maximum amount of gas a player can fill
new Float:gasAmount; // the amount of gas the player is filling

// function to check if the player is at a gas station
stock bool:IsPlayerAtGasStation(playerid)
{
    new Float:playerX, Float:playerY, Float:playerZ;
    GetPlayerPos(playerid, playerX, playerY, playerZ);
    for (new i = 0; i < MAX_GAS_STATIONS; i++)
    {
        if (IsPointInCircle(playerX, playerY, GasStation[i][0], GasStation[i][1], GasStationRadius))
        {
            return true;
        }
    }
    return false;
}

// function to fill the player's vehicle with gas
stock FillVehicleFuel(playerid, Float:gasPrice, Float:gasLimit)
{
    new vehicleid = GetPlayerVehicleID(playerid);
    new Float:vehicleX, Float:vehicleY, Float:vehicleZ;
    new Float:playerX, Float:playerY, Float:playerZ;
    new Float:distance;
    new Float:totalCost;
    GetVehiclePos(vehicleid, vehicleX, vehicleY, vehicleZ);
    GetPlayerPos(playerid, playerX, playerY, playerZ);
    distance = GetDistanceBetweenPoints3D(vehicleX, vehicleY, vehicleZ, playerX, playerY, playerZ);
    gasAmount = min(distance / 10.0, gasLimit); // calculate the amount of gas based on distance and gas limit
    totalCost = gasAmount * gasPrice;
    if (totalCost > GetPlayerMoney(playerid)) // check if the player has enough money
    {
        SendClientMessage(playerid, COLOR_RED, "You don't have enough money to fill up your vehicle.");
        return 0;
    }
    SetVehicleFuel(vehicleid, GetVehicleFuel(vehicleid) + gasAmount); // fill the vehicle with gas
    GivePlayerMoney(playerid, -totalCost); // subtract the total cost from the player's money
    SendClientMessage(playerid, COLOR_GREEN, "You have filled up your vehicle with %.2f liters of gas for $%.2f.", gasAmount, totalCost);
    return 1;
}

// main function to handle player commands
public OnPlayerCommandText(playerid, cmdtext[])
{
    if (!strcmp(cmdtext, "/fillgas", true)) // check if the player typed the /fillgas command
    {
        if (IsPlayerAtGasStation(playerid)) // check if the player is at a gas station
        {
            FillVehicleFuel(playerid, gasPrice, gasLimit); // fill the player's vehicle with gas
        }
        else
        {
            SendClientMessage(playerid, COLOR_RED, "You must be at a gas station to fill up your vehicle.");
        }
        return 1;
    }
    return 0;
}
This script defines a gas price and limit, and checks if the player is at a gas station before filling their vehicle with gas. The IsPlayerAtGasStation() function checks if the player's coordinates are within a certain distance of a gas station location defined in a separate array. The FillVehicleFuel() function calculates the amount of gas to fill based on the distance between the player and their vehicle, and subtracts the total cost from the player's money. Finally,
