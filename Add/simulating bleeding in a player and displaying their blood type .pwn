simulating bleeding in a player and displaying their blood type:

pawn
Copy code
new BloodType[MAX_PLAYERS];

public OnPlayerUpdate(playerid)
{
    if(IsPlayerConnected(playerid) && GetPlayerHealth(playerid) > 0 && !IsPlayerInAnyVehicle(playerid))
    {
        new Float:health = GetPlayerHealth(playerid);
        if(health > 30.0 && health < 75.0 && !BloodType[playerid])
        {
            BloodType[playerid] = random(1, 8);
            SendClientMessage(playerid, -1, "You are bleeding. Your blood type is " + BloodType[playerid] + ".");
        }
        else if(health > 75.0 && BloodType[playerid])
        {
            BloodType[playerid] = 0;
            SendClientMessage(playerid, -1, "Your bleeding has stopped.");
        }
        SetPlayerHealth(playerid, health - 0.1);
    }
    return 1;
}
This script handles the OnPlayerUpdate event, which is triggered every frame for each connected player. The script checks if the player is connected, has health greater than 0, and is not in a vehicle. If the player's health is between 30 and 75, and they haven't already been assigned a blood type, the script generates a random blood type between 1 and 8 using the random function, assigns it to the player in the BloodType array, and sends a message to the player indicating that they are bleeding and their blood type. If the player's health is greater than 75 and they have a blood type assigned, the script removes the blood type from the BloodType array and sends a message to the player indicating that their bleeding has stopped. Finally, the script decreases the player's health by 0.1 to simulate bleeding. Note that this script is just an example and you may want to adjust the bleeding rate and blood type assignment based on your specific needs.
