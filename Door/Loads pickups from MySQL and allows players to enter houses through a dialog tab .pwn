script that loads door pickups from MySQL and allows players to enter houses through a dialog tab:

scss
Copy code
new doorPickups[MAX_PICKUPS];
new doorPickupCount = 0;

public OnGameModeInit()
{
    // Connect to MySQL database
    mysql_connect("localhost", "username", "password", "database");

    // Load door pickups from database
    LoadDoorPickupsFromDB();
}

public LoadDoorPickupsFromDB()
{
    new query[128], result, rows;
    format(query, sizeof(query), "SELECT * FROM door_pickups");

    mysql_query(mysql, query);

    // Loop through door pickups in the database and create pickups
    while (mysql_fetch_row(result))
    {
        new Float:x, Float:y, Float:z, interior, world, vW, Float:vX, Float:vY, Float:vZ;
        mysql_fetch_field(result, 0, doorsPickups[doorPickupCount]);
        mysql_fetch_field(result, 1, x);
        mysql_fetch_field(result, 2, y);
        mysql_fetch_field(result, 3, z);
        mysql_fetch_field(result, 4, interior);
        mysql_fetch_field(result, 5, world);
        mysql_fetch_field(result, 6, vW);
        mysql_fetch_field(result, 7, vX);
        mysql_fetch_field(result, 8, vY);
        mysql_fetch_field(result, 9, vZ);

        doorPickups[doorPickupCount] = CreatePickup(1337, 23, x, y, z);
        SetPickupVirtualWorld(doorPickups[doorPickupCount], vW);
        SetPickupInterior(doorPickups[doorPickupCount], interior);

        doorPickupCount++;
    }

    print("[DOOR PICKUPS] Loaded ", doorPickupCount, " door pickups.");
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
    // Check if the pickup is a door pickup
    for (new i = 0; i < doorPickupCount; i++)
    {
        if (pickupid == doorPickups[i])
        {
            // Display dialog tab to allow player to enter the house
            ShowDialogTab(playerid, DIALOG_HOUSE_ENTER, DIALOG_STYLE_TABLIST, "Enter House", "Cancel", "Select");

            // Save the pickup id in the player's data
            SetPlayerData(playerid, PLAYER_HOUSE_PICKUP, pickupid);

            return 1;
        }
    }

    return 0;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    // Check if the dialog response is for the house enter dialog
    if (dialogid == DIALOG_HOUSE_ENTER)
    {
        // Check if the player selected a house
        if (response)
        {
            new pickupid = GetPlayerData(playerid, PLAYER_HOUSE_PICKUP);
            new houseid = listitem;

            // Get the house information from the database
            new query[128], result, rows;
            format(query, sizeof(query), "SELECT * FROM houses WHERE id='%d'", houseid);

            mysql_query(mysql, query);
            mysql_fetch_row(result);

            new Float:x, Float:y, Float:z;
            mysql_fetch_field(result, 1, x);
            mysql_fetch_field(result, 2, y);
            mysql_fetch_field(result, 3, z);

            // Teleport the player to the house
            SetPlayerPos(playerid, x, y, z);
            SetPlayerInterior(playerid, GetPickupInterior(pickupid));
            SetPlayerVirtualWorld(player
