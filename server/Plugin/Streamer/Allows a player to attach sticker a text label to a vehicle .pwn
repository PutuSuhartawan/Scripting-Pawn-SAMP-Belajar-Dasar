script that allows a player to attach a text label to a vehicle, and save the label's text and position to a MySQL database:

scss
Copy code
#include <a_samp>
#include <streamer>

#define INVALID_ID -1

new Text:vehicle_labels[MAX_VEHICLES];
new Label:vehicle_label[MAX_VEHICLES];

const Float:LABEL_OFFSET = 0.5;



public OnPlayerCommandText(playerid, cmdtext[])
{
    if(!strcmp(cmdtext, "/attachlabel", true))
    {
        new vehicleid = GetPlayerVehicleID(playerid);
        if(vehicleid == INVALID_VEHICLE_ID)
        {
            SendClientMessage(playerid, COLOR_WHITE, "You are not in a vehicle.");
            return 1;
        }
        new Float:x, Float:y, Float:z;
        GetVehiclePos(vehicleid, x, y, z);
        x += LABEL_OFFSET;
        y += LABEL_OFFSET;
        new text[MAX_PLAYER_NAME];
        format(text, sizeof(text), "%s's vehicle", GetPlayerName(playerid));
        vehicle_labels[vehicleid] = CreateDynamic3DTextLabel(text, COLOR_WHITE, x, y, z, 0.0, 0, true, -1);
        Label_SetAttachedData(vehicle_labels[vehicleid], vehicleid, INVALID_PLAYER_ID);
        vehicle_label[vehicleid] = CreateDynamicTextLabel("", COLOR_WHITE, x, y, z, 0, true, INVALID_PLAYER_ID);
        Label_SetAttachedData(vehicle_label[vehicleid], vehicleid, INVALID_PLAYER_ID);
        SendClientMessage(playerid, COLOR_WHITE, "Label attached to vehicle.");
        return 1;
    }
    return 0;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    if((newkeys & KEY_Y || newkeys & KEY_H) && (oldkeys & KEY_Y || oldkeys & KEY_H) == 0)
    {
        new vehicleid = GetPlayerVehicleID(playerid);
        if(vehicleid == INVALID_VEHICLE_ID || vehicle_labels[vehicleid] == INVALID_TEXT_LABEL)
        {
            return 0;
        }
        new player_label = GetPlayerAttachedObject(playerid, 0);
        if(player_label == INVALID_OBJECT || Object_GetType(player_label) != OBJECT_TYPE_LABEL)
        {
            AttachDynamicTextLabelToVehicle(vehicle_label[vehicleid], vehicleid, 0.0, 0.0, LABEL_OFFSET);
            SetPlayerAttachedObject(playerid, 0, vehicle_label[vehicleid], 0.0, 0.0, LABEL_OFFSET, 0.0, 0.0, 0.0, 0, 0);
            SendClientMessage(playerid, COLOR_WHITE, "Label attached to player.");
        }
        else
        {
            DetachObject(playerid, player_label);
            DestroyObject(player_label);
            SendClientMessage(playerid, COLOR_WHITE, "Label detached from player.");
        }
        return 1;
    }
    return 0;
}

public OnPlayerDisconnect(playerid, reason)
{
    new vehicleid = GetPlayerVehicleID(playerid);
    if(vehicleid != INVALID_VEHICLE_ID && vehicle_labels[vehicleid] != INVALID_TEXT_LABEL)
    {
        new text[128], Float:x, Float:y, Float:z;
        GetDynamic3DTextLabelText(vehicle_labels[vehicleid], text, sizeof(text));
        GetDynamic3DTextLabelPos(vehicle_labels[vehicleid], x, y, z);
        mysql_query(g_Connect, "INSERT INTO vehicle_labels (vehicle_id, label_text, label_x, label_y, label_z) VALUES ('%d', '%s', '%f', '%
        rom the vehicle_labels table and store it in variables:

scss
Copy code
new insertID = mysql_insert_id(g_Connect); // retrieve the ID of the newly inserted record
new Float:labelX, Float:labelY, Float:labelZ;
new query[128];

format(query, sizeof(query), "SELECT label_text, label_x, label_y, label_z FROM vehicle_labels WHERE id = %d", insertID);
mysql_query(g_Connect, query);

// get the results of the query
new result = mysql_store_result(g_Connect);
new rows = mysql_num_rows(result);

if(rows == 1) // make sure there's only one row
{
    // get the values from the first row of the result
    new row = mysql_fetch_row(result);
    sscanf(row[1], "%f", labelX);
    sscanf(row[2], "%f", labelY);
    sscanf(row[3], "%f", labelZ);

    // do something with the retrieved values, e.g. create a textdraw
    CreateDynamic3DTextLabel(row[0], COLOR_WHITE, labelX, labelY, labelZ, 0.0, 0, true);
}

mysql_free_result(result); // free the memory used by the result set
This script retrieves the ID of the newly inserted record using the mysql_insert_id() function, then uses it to construct a SELECT query that retrieves the label_text, label_x, label_y, and label_z values of the record. It then executes the query using mysql_query() and retrieves the result set using mysql_store_result(). If there's only one row in the result set, it retrieves the values of the row using mysql_fetch_row() and sscanf(), and uses them to create a 3D text label using CreateDynamic3DTextLabel(). Finally, it frees the memory used by the result set using mysql_free_result().
