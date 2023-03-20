script for a modshop in a workshop that allows a character with the job of mechanic to perform paintjobs using a dialog tab style:

pawn
Copy code
// Global constants
#define MAX_PLAYERS 500
#define MAX_VEHICLES 2000
#define MAX_PAINTJOBS 10

// Global variables
new paintjobCost[MAX_PAINTJOBS] = { 500, 750, 1000, 1250, 1500, 1750, 2000, 2250, 2500, 2750 };

// Dialog IDs
enum {
    DIALOG_MAIN,
    DIALOG_PAINTJOB,
};

// Main dialog
new
    Dialog_Main[MAX_PLAYERS],
    Dialog_Paintjob[MAX_PLAYERS][MAX_VEHICLES];

// Function to show main dialog
ShowMainDialog(playerid)
{
    // Create the dialog
    Dialog_Main[playerid] = CreateDialog(DIALOG_MAIN, DIALOG_STYLE_TABLIST, "Modshop", "Select an option:");

    // Add the paintjob option to the dialog
    AddTabToDialog(Dialog_Main[playerid], 0, "Paintjob");
    
    // Show the dialog to the player
    ShowDialog(playerid, Dialog_Main[playerid], DIALOG_MAIN);
}

// Function to show paintjob dialog
ShowPaintjobDialog(playerid, vehicleid)
{
    // Create the dialog
    Dialog_Paintjob[playerid][vehicleid] = CreateDialog(DIALOG_PAINTJOB, DIALOG_STYLE_TABLIST, "Paintjob", "Select a paintjob:");

    // Add the paintjob options to the dialog
    for (new i = 0; i < MAX_PAINTJOBS; i++)
    {
        new tabText[64];
        format(tabText, sizeof(tabText), "Paintjob %d ($%d)", i + 1, paintjobCost[i]);
        AddTabToDialog(Dialog_Paintjob[playerid][vehicleid], i, tabText);
    }

    // Show the dialog to the player
    ShowDialog(playerid, Dialog_Paintjob[playerid][vehicleid], DIALOG_PAINTJOB);
}

// Function to handle dialog response
DialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if (dialogid == DIALOG_MAIN)
    {
        if (response)
        {
            switch (listitem)
            {
                case 0: // Paintjob option
                {
                    // Get the player's vehicle ID
                    new vehicleid = GetPlayerVehicleID(playerid);

                    // Check if the player is in a vehicle
                    if (vehicleid == INVALID_VEHICLE_ID)
                    {
                        SendClientMessage(playerid, COLOR_RED, "You need to be in a vehicle to use this option.");
                        return 1;
                    }

                    // Check if the player has the mechanic job
                    if (GetPlayerJob(playerid) != JOB_MECHANIC)
                    {
                        SendClientMessage(playerid, COLOR_RED, "You need to be a mechanic to use this option.");
                        return 1;
                    }

                    // Show the paintjob dialog
                    ShowPaintjobDialog(playerid, vehicleid);

                    return 1;
                }
            }
        }
    }
    else if (dialogid == DIALOG_PAINTJOB)
    {
        if (response)
        {
            // Get the player's vehicle ID
            new vehicleid = GetPlayerVehicleID(playerid);

            // Check if the player is in a vehicle
            if (vehicleid == INVALID_VEHICLE_ID)
            {
                SendClientMessage(playerid, COLOR_RED, "You need to be in a vehicle to use this option.");
               the paintjob process after the player has selected their desired paintjob from the dialog:

scss
Copy code
forward ApplyPaintjob(playerid, paintjobid);

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if(dialogid == DIALOG_PAINTJOB)
    {
        if(response)
        {
            new paintjobid = listitem;
            ApplyPaintjob(playerid, paintjobid);
        }
        else
        {
            SendClientMessage(playerid, COLOR_RED, "You have canceled the paintjob.");
        }
    }
    return 1;
}

public ApplyPaintjob(playerid, paintjobid)
{
    new vehicleid = GetPlayerVehicleID(playerid);
    if(vehicleid != INVALID_VEHICLE_ID)
    {
        new Float:color1, Float:color2;
        GetVehiclePaintjobColor(paintjobid, color1, color2);
        SetVehiclePaintjob(vehicleid, paintjobid);
        SetVehiclePaintjobColor(vehicleid, color1, color2);
        SendClientMessage(playerid, COLOR_GREEN, "You have successfully applied the paintjob!");
        
        // Save the paintjob to the database
        new query[200];
        format(query, sizeof(query), "UPDATE vehicles SET paintjob = %d WHERE id = %d", paintjobid, vehicleid);
        mysql_query(g_Connect, query);
    }
    else
    {
        SendClientMessage(playerid, COLOR_RED, "You must be in a vehicle to apply a paintjob.");
    }
}
This code adds a new function ApplyPaintjob() which takes the selected paintjobid as a parameter and applies it to the player's vehicle. It also retrieves the colors for the selected paintjob using GetVehiclePaintjobColor() and sets them using SetVehiclePaintjobColor().

After applying the paintjob, the function sends a success message to the player and updates the paintjob field in the vehicles table of the MySQL database.

In the OnDialogResponse() function, the paintjobid is retrieved from the listitem parameter and passed to ApplyPaintjob() if the player clicked the "OK" button. If the player clicked the "Cancel" button, a message is sent indicating that the paintjob was canceled.
