Pawn script that demonstrates how to loop through a function to hide a textdraw inventory:

#define MAX_SALON_SLOT 3
#define MAX_SALON 10

// Function to check if the player is in a dealer vehicle
stock IsPlayerInDealerVehicle(playerid)
{	
    new s, salonDealID, sVehSlotDeal, st[160], invehicleid = GetPlayerVehicleID(playerid);

    // Loop through each salon slot
    for (s = 1; s < MAX_SALON_SLOT; s++) 
    {	
        // Loop through each salon
        for (new salon = 1; salon < MAX_SALON; salon++) 
        {
            if (SalonCarIdSlot[salon][s] == invehicleid) 
            {
                SetPVarInt(playerid, "UseIdSalon", salon);
                SetPVarInt(playerid, "UseSlotSalon", s);
                sVehSlotDeal = s;
                salonDealID = salon;
                format(st, sizeof(st), "Anda yakin ingin membeli nomor transport %i?\n\nModel: %s\nBiaya: $%i", sVehSlotDeal, NameCars(SalonModelSlot[salonDealID][sVehSlotDeal]), SalonPriseSlot[salonDealID][sVehSlotDeal]);
                ShowPlayerDialog(playerid, 64, DIALOG_STYLE_MSGBOX, "Pasar mobil", st, "Beli", "Keluar");
                return true;
            }    
        }
    }           
    return 0;
}

// Function to hide textdraw inventory
HideInventory(playerid)
{
    // Loop through each inventory slot
    for (new i = 0; i < MAX_INVENTORY_SLOT; i++) 
    {
        HidePlayerTextDraw(playerid, i);
    }
}

You can call the HideInventory function whenever you want to hide the textdraw inventory, and it will loop through each inventory slot and hide it. Similarly, you can call the IsPlayerInDealerVehicle function to check if the player is in a dealer vehicle, and it will loop through each salon slot and salon to check if the player's vehicle ID matches any of them.
