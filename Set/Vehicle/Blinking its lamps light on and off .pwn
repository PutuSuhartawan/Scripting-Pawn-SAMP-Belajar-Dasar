script to make a vehicle blink its lamps on and off: 

PAWN
Copy code
// Define the time interval between lamp blinks in milliseconds
#define BLINK_INTERVAL 500

// Function to toggle the state of the lamps
ToggleLamps(vehicleid)
{
    if(IsVehicleInteriorLightOn(vehicleid)) {
        // If the interior light is on, turn it off and turn the headlights on
        SetVehicleInteriorLight(vehicleid, 0);
        SetVehicleLights(vehicleid, 1);
    } else {
        // If the interior light is off, turn it on and turn the headlights off
        SetVehicleInteriorLight(vehicleid, 1);
        SetVehicleLights(vehicleid, 0);
    }
}

// Function to start the lamp blinking process
StartBlinking(vehicleid)
{
    // Set a timer to call the ToggleLamps function every BLINK_INTERVAL milliseconds
    SetTimerEx("ToggleLamps", BLINK_INTERVAL, true, "i", vehicleid);
}

// Function to stop the lamp blinking process
StopBlinking(vehicleid)
{
    // Remove the timer that calls the ToggleLamps function
    KillTimer("ToggleLamps", "i", vehicleid);
}

// Command to start the lamp blinking process on the player's vehicle
CMD:blink(vehicleid)
{
    // Check if the player is in a vehicle
    if(!IsPlayerInAnyVehicle(playerid)) {
        SendClientMessage(playerid, COLOR_RED, "You must be in a vehicle to use this command.");
        return 0;
    }
    
    // Get the ID of the player's vehicle
    vehicleid = GetPlayerVehicleID(playerid);
    
    // Start the lamp blinking process on the player's vehicle
    StartBlinking(vehicleid);
    
    return 1;
}

// Command to stop the lamp blinking process on the player's vehicle
CMD:stopblink(vehicleid)
{
    // Check if the player is in a vehicle
    if(!IsPlayerInAnyVehicle(playerid)) {
        SendClientMessage(playerid, COLOR_RED, "You must be in a vehicle to use this command.");
        return 0;
    }
    
    // Get the ID of the player's vehicle
    vehicleid = GetPlayerVehicleID(playerid);
    
    // Stop the lamp blinking process on the player's vehicle
    StopBlinking(vehicleid);
    
    return 1;
}
This script defines two commands: /blink and /stopblink. When the player uses the /blink command, the lamps on their vehicle will start blinking on and off with an interval of 500 milliseconds. When the player uses the /stopblink command, the lamp blinking process will be stopped.

The ToggleLamps function is called every BLINK_INTERVAL milliseconds and checks if the interior light of the vehicle is on or off. If the interior light is on, the function turns it off and turns the headlights on. If the interior light is off, the function turns it on and turns the headlights off. This creates the blinking effect.

The StartBlinking function sets a timer to call the ToggleLamps function every BLINK_INTERVAL milliseconds. The StopBlinking function removes the timer that calls the ToggleLamps function.
