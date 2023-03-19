To fix the issue of player health always decreasing while in a vehicle in GTA SAMP, you can try the following script:

scss
Copy code
forward OnPlayerEnterVehicle(playerid, vehicleid, ispassenger);
public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
    SetPlayerHealth(playerid, 100.0);
    return 1;
}
This script uses the OnPlayerEnterVehicle callback to set the player's health to 100 when they enter a vehicle. This should prevent the health from continuously decreasing while they are in the vehicle. You can add this code to your SAMP server's gamemode script or to a separate script file that is included in the gamemode.
