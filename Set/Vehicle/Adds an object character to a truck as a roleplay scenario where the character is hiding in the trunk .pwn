function that adds an object character to a truck as a roleplay scenario where the character is hiding in the trunk of the vehicle:



scss
Copy code
// Function to add an object character to a truck's trunk for roleplay
public OnTrunkHide(playerid, vehicleid, hide)
{
    // Check if the player is in the driver's seat of the truck
    if(GetPlayerVehicleSeat(playerid) != 0)
    {
        SendClientMessage(playerid, COLOR_RED, "You must be in the driver's seat of the truck to open the trunk!");
        return 0;
    }
    
    // Check if the vehicle is a truck and has a trunk object attached
    if(GetVehicleModel(vehicleid) != 455 || !DoesVehicleHaveTrunkObject(vehicleid))
    {
        SendClientMessage(playerid, COLOR_RED, "This vehicle does not have a trunk or is not a truck!");
        return 0;
    }
    
    // Get the current trunk state of the vehicle
    new trunk_state = GetVehicleTrunkState(vehicleid);
    
    // If the player is hiding in the trunk, add a character object to the trunk
    if(hide && trunk_state == 0)
    {
        new Float:pos[3];
        GetVehicleTrunkPosition(vehicleid, pos[0], pos[1], pos[2]);
        CreateObject(OBJ_CHAR, 2842, pos[0], pos[1], pos[2] + 0.5, 0, 0, 0);
        SendClientMessage(playerid, COLOR_GREEN, "You are now hiding in the trunk of the truck!");
    }
    // If the player is exiting the trunk, remove the character object
    else if(!hide && trunk_state == 1)
    {
        for(new i = 0; i < MAX_OBJECTS; i++)
        {
            if(GetObjectType(i) == OBJ_CHAR)
            {
                GetObjectPos(i, pos[0], pos[1], pos[2]);
                if(IsPlayerInRangeOfPoint(playerid, 5.0, pos[0], pos[1], pos[2]))
                {
                    DestroyObject(i);
                    SendClientMessage(playerid, COLOR_GREEN, "You have exited the trunk of the truck!");
                    break;
                }
            }
        }
    }
    // If the trunk is already open or the player is trying to enter while hiding, send an error message
    else
    {
        SendClientMessage(playerid, COLOR_RED, "The trunk is already open or you cannot enter while hiding in the trunk!");
        return 0;
    }
    
    // Update the trunk state of the vehicle
    SetVehicleTrunkState(vehicleid, hide);
return 1;
}

vbnet
Copy code

This function checks if the player is in the driver's seat of a truck with a trunk object attached, and allows them to add a character object to the trunk for roleplay purposes. When the player exits the trunk, the character object is removed. The function also updates the trunk state of the vehicle. This can be called with a command or in a script when needed.


