 using the ColAndreas plugin that implements the functionality you described:

scss
Copy code
#include <a_samp>
#include <colandreas>

// Define the coordinates of the insurance office
new Float:INSURANCE_OFFICE_X = 100.0;
new Float:INSURANCE_OFFICE_Y = 200.0;
new Float:INSURANCE_OFFICE_Z = 300.0;

public OnVehicleDeath(vehicleid, killerid)
{
    // Check if the vehicle was destroyed underwater
    if(IsVehicleInWater(vehicleid)) {
        // Get the player ID who owns the destroyed vehicle
        new playerid = GetPlayerVehicleID(GetPlayerIDFromVehicle(vehicleid));
        
        // Notify the player that their vehicle is being managed by the insurance office
        SendClientMessage(playerid, -1, "Your vehicle is being managed by the insurance office.");
        
        // Teleport the destroyed vehicle to the insurance office
        SetVehiclePos(vehicleid, INSURANCE_OFFICE_X, INSURANCE_OFFICE_Y, INSURANCE_OFFICE_Z);
        
        // Contact the refund service and credit the player's account with the refund amount
        new refund_amount = GetVehicleModelPrice(GetVehicleModel(vehicleid)) * 0.5; // refund half the vehicle's value
        CallRemoteFunction("RefundService_RefundPlayer", "if", playerid, refund_amount);
    }
}
This script listens for the OnVehicleDeath event, which is triggered when a vehicle is destroyed. It checks if the destroyed vehicle is underwater using the IsVehicleInWater function. If it is, it gets the ID of the player who owns the vehicle using GetPlayerIDFromVehicle and GetPlayerVehicleID.

It then sends a message to the player notifying them that their vehicle is being managed by the insurance office, teleports the destroyed vehicle to the insurance office using SetVehiclePos, calculates the refund amount as half of the vehicle's value using GetVehicleModelPrice, and calls a remote function called RefundService_RefundPlayer with the player ID and refund amount as arguments using CallRemoteFunction.

Note that you'll need to create the RefundService_RefundPlayer function on the server-side and implement the refund functionality there.
