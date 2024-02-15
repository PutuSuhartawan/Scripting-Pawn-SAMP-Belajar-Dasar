



/*

While having timers to update player data in Pawn SAMP can be useful, blindly updating data every second may not be the optimal approach. Here are some reasons why you might need timers, but also reasons to carefully consider their usage:

Reasons for using timers:

Continuous Updates:

Some data, like position or velocity, might need constant updates for smooth gameplay or accurate calculations.
This is especially true for physics simulations or real-time interactions.
Event Triggers:

If actions need to occur at specific intervals (e.g., health regeneration every 5 seconds), a timer can trigger them reliably.
This simplifies logic and ensures consistency in timing-based events.
Background Processes:

Timers can handle tasks that shouldn't block the main thread, like saving data or performing heavy calculations periodically.
This avoids performance drops or unresponsive gameplay from long-running operations.
However, overuse of timers can have downsides:

Performance Overhead:

Creating and running timers consume resources, especially with many players or frequent updates.
This can impact server performance, leading to lag or slower response times.
Unnecessary Updates:

Updating data unnecessarily, like updating position when a player is idle, wastes resources and adds redundant information.
Be mindful of what changes truly require immediate updates.
Debugging Difficulty:

Numerous timers can make debugging and pinpointing issues more complex.
Simplify logic where possible to track down problems more easily.
In the provided code:

The UpdateServer timer checks if a player is using a vehicle parachute and updates its position and velocity every 100 milliseconds.
This might be necessary for simulating the parachute movement accurately.
The ChangeServerEverySecond timer's purpose is unclear without knowing its content.
The GantiWarna timer seems to change player color every 5 seconds, which might be purely aesthetic and could potentially be optimized based on the desired effect.
Recommendations:

Evaluate necessity: Analyze if each timer is truly required for smooth gameplay or accurate calculations. Consider alternative approaches like event-based updates or conditional checks.
Optimize intervals: Adjust timer intervals based on actual needs. Updating data every second might not be necessary for all cases.
Consolidate tasks: Combine similar functionality into single timers or functions to reduce overhead.
Profile performance: Monitor server performance and resource usage to identify potential bottlenecks caused by timers.
Remember, responsible use of timers can enhance gameplay, but careful consideration is crucial to avoid performance issues and unnecessary complexity.
*/





public UpdateServer(playerid)
{
      if(IsPlayerUsingVehPara(playerid)){
        if(IsCollisionFlag(Item::GetCollisionFlags(GetPlayerVehicleID(playerid),item_vehicle),POSITION_FLAG_GROUND)){
          StopVehicleParachuteAction(playerid);
          CallLocalFunction("OnVehicleParachuteThrown","dd",playerid,GetPlayerVehicleID(playerid));
        } else {
          static T3D:vid, Float:T3D:rx, Float:T3D:ry, Float:T3D:rz, Float:T3D:tx, Float:T3D:ty, Float:T3D:tz;
          T3D:vid = GetPlayerVehicleID(playerid);
          T3D:tx = T3D:ty = 0.0;
          Tryg3D::GetVehicleRotation(T3D:vid,T3D:rx,T3D:ry,T3D:rz);
          ShiftVectorRotation((Tryg3D::DeCompressRotation(T3D:ry)/180.0),(Tryg3D::DeCompressRotation(-T3D:rx)/180.0),0.0,0.0,0.0,T3D:rz,T3D:tx,T3D:ty,T3D:tz);
          SetVehicleVelocity(T3D:vid,(T3D:tx/10.0),(T3D:ty/10.0), -0.2); // change parachute speed here
        }
      }
      #if defined VP_OnPlayerUpdate
        VP_OnPlayerUpdate(playerid);
      #endif
}







public ChangeServerEverySecond(playerid, closestcar)
{
        



      if(IsPlayerInRangeOfPoint(playerid, Float:15.0, 2152.647216, -1735.895996, 17.400230)) // coordinat near door mechanic
      { 
                MoveDynamicObject(MechanicGarageDoor, 2152.647216, -1735.895996, 17.400230, Float:2.0,  0.000000, 85.000000, 90.000000);
                // ketika pintu garasi di buka
                if(IsPlayerInAnyVehicle(playerid))
                {
                  ToggleHood(GetPlayerVehicleID(playerid), VEHICLE_PARAMS_ON);
                }
                MoveDynamicObject(DongkratMobilMechanic, 2151.989501, -1729.435058, 11.610030+1, Float:0.01, 0.000000, 0.000000, 0.000000);
                // ini dongkrak di naikkan
                MoveDynamicObject(PeneranganMobilMechanic, 2152.0371,-1726.3260,12.9692, Float:0.01, 0.0000,0.0000,4.8428);
                
                //cmd_makan(playerid);
      }
      else

      {
          MoveDynamicObject(MechanicGarageDoor, 2152.632812, -1733.791625, 14.466965, Float:2.0,  0.599999, 0.899998, 89.599990);
          
          // ini kalau pintu sudah di tutup.
          
          MoveDynamicObject(DongkratMobilMechanic, 2151.9052,-1729.4147,10.7400, Float:0.1,  0.0000,0.9000,0.7433);
          // ini dongkrak di turunkan

          MoveDynamicObject(PeneranganMobilMechanic, 2156.474121, -1734.285278, 12.558380, Float:1.0, 0.000000, 0.000000, 0.000000);
          
      }

          UpdatePlayerTimePlayed(playerid);
          //SendClientMessage(playerid, COLOR_WHITE, "INFO: PlayerTimePlayed has running");

          if(AuctionRunning == true)
          {
            if(CountDownAuction <= 0)
            {
              AuctionWasEnded(playerid);
            }
    

    
    if(pInfo[playerid][JoinedAuction] == 1)
    {
      SendClientMessage(playerid, COLOR_WHITE, "INFO: Auction has running");
      new string[300];
      SendClientMessage(playerid, COLOR_WHITE, "INFO: you are was joinned the auction");
      CountDownAuction--;
      //CountDownAuction = CountDownAuction - 1;
      if(!strcmp(WinnerOfAuction, "NO BODY", true, 7))
      {
        format(string, sizeof(string), ""COL_RED"WARNING IN: %d\n"COL_LRED2" ***%s***\n"COL_WHITE"Have a Chart #1 of\nauction item is:\na "COL_LGREEN"$%i "COL_BLUE"%s's\n%d Participants", CountDownAuction, WinnerOfAuction, BidPrice, Itemofferings, CountOfParticipants);
      
      }
      else
      {
        format(string, sizeof(string), "Countdown"COL_RED": %d\n"COL_BLUE" ***%s***\n"COL_WHITE"On Top Chart #1 of\nthe auction item:\na "COL_LGREEN"$%i of "COL_BLUE"%s's\n%d Participants", CountDownAuction, WinnerOfAuction, BidPrice, Itemofferings, CountOfParticipants);
      }
      

      UpdateDynamic3DTextLabelText(TempatDisplayIklan, COLOR_AQUAGREEN, string);
      //SetDynamicObjectMaterialText(layariklanbadara, 0, string, OBJECT_MATERIAL_SIZE_512x512, "Tahoma", 30, 1, COLOR_GREEN, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_RIGHT);
      SetDynamicObjectMaterialText(layariklanbadara, 0, string, OBJECT_MATERIAL_SIZE_512x512, "Tahoma", 45, 1, -1250582, 0, OBJECT_MATERIAL_TEXT_ALIGN_LEFT);
      
      SetDynamicObjectMaterialText(AuctionMartChartBoard, 0, string, 130, "Arial", 40, 1, -1250582, 0, 1);
      //GameTextForPlayer(playerid, "Auction has available now", 500, 5);
      SendClientMessage(playerid, -1, "AUCTION: "COL_YELLOW"'/auction bid' "COL_WHITE" will cost for "COL_LGREEN"$200 per your bid sir, "COL_WHITE"Just try your price"COL_RED" is fast");
      
    }
    else
    {
      SendClientMessage(playerid, COLOR_WHITE, "INFO: you are not joinned the auction");
    }
    

  }

  //SendClientMessage(playerid, COLOR_WHITE, "Function waktu server works");

  // membuat fungsi progress bar jadi berjalan menuju 100 persen
  if(pInfo[playerid][pStatusLoadingBar] == 1) // artinya sedang ada loading
  {
    if(GetPlayerProgressBarValue(playerid, PlayerBar:pInfo[playerid][pLoadingBar]) <= Float:100.0)
    {
      SetPlayerProgressBarValue(playerid, PlayerBar:pInfo[playerid][pLoadingBar], GetPlayerProgressBarValue(playerid, PlayerBar:pInfo[playerid][pLoadingBar]) + Float:5.0);
      if(GetPlayerProgressBarValue(playerid, PlayerBar:pInfo[playerid][pLoadingBar]) >= Float:50.0)
      {
        SetPlayerProgressBarColour(playerid, PlayerBar:pInfo[playerid][pLoadingBar], COLOR_AQUAGREEN);
      }
      if(GetPlayerProgressBarValue(playerid, PlayerBar:pInfo[playerid][pLoadingBar]) >= Float:80.0)
      {
        SetPlayerProgressBarColour(playerid, PlayerBar:pInfo[playerid][pLoadingBar], COLOR_AQUA);
      }
    }

    /*
    if(GetPlayerProgressBarValue(playerid, PlayerBar:pInfo[playerid][pLoadingBar]) == Float:20.0)
    {
      SetPlayerProgressBarValue(playerid, PlayerBar:pInfo[playerid][pLoadingBar], Float:30.0);
    }

    if(GetPlayerProgressBarValue(playerid, PlayerBar:pInfo[playerid][pLoadingBar]) == Float:30.0)
    {
      SetPlayerProgressBarValue(playerid, PlayerBar:pInfo[playerid][pLoadingBar], Float:50.0);
    }

    if(GetPlayerProgressBarValue(playerid, PlayerBar:pInfo[playerid][pLoadingBar]) == Float:50.0)
    {
      SetPlayerProgressBarValue(playerid, PlayerBar:pInfo[playerid][pLoadingBar], Float:60.0);
    }

    if(GetPlayerProgressBarValue(playerid, PlayerBar:pInfo[playerid][pLoadingBar]) == Float:60.0)
    {
      SetPlayerProgressBarValue(playerid, PlayerBar:pInfo[playerid][pLoadingBar], Float:80.0);
    }

    if(GetPlayerProgressBarValue(playerid, PlayerBar:pInfo[playerid][pLoadingBar]) == Float:80.0)
    {
      SetPlayerProgressBarValue(playerid, PlayerBar:pInfo[playerid][pLoadingBar], Float:90.0);
    }

    if(GetPlayerProgressBarValue(playerid, PlayerBar:pInfo[playerid][pLoadingBar]) == Float:90.0)
    {
      SetPlayerProgressBarValue(playerid, PlayerBar:pInfo[playerid][pLoadingBar], Float:100.0);
    }
    
    */

    if(GetPlayerProgressBarValue(playerid, PlayerBar:pInfo[playerid][pLoadingBar]) >= Float:100.0)
    {
      pInfo[playerid][pStatusLoadingBar] = 0;
      
      HidePlayerProgressBar(playerid, PlayerBar:pInfo[playerid][pLoadingBar]);
      SetPlayerProgressBarValue(playerid, PlayerBar:pInfo[playerid][pLoadingBar], Float:0.0);
      SendClientMessage(playerid,COLOR_AQUAGREEN,"You have already passed the loading process. Congratulations sir!");
      // saat proses loading selesai
    }
  }


  if(StatusCrateTerangkat == true)
    {
      
        PlayerPlaySound(playerid, 1155, 0.0, 0.0, 10.0);
        //ApplyAnimation(playerid, "MISC", "Idle_Chat_02", 4.1, 0, 0, 0, 0, 0, 0);
        //ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.1, 0, 0, 0, 0, 1, 1);
      
    }



  if(IsPlayerInAnyVehicle(playerid))
  {
    new Float:health;
    new vehicleid = GetPlayerVehicleID(playerid);
    GetVehicleHealth(vehicleid, Float:health);
    if(health < 350 )
    {
      if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
      {
        ToggleEngine(vehicleid, VEHICLE_PARAMS_OFF);
        GameTextForPlayer(playerid, "Car Engine Seriously Damaged. \n Contact Mechanic Immediately", 200, 5);
        PlayerPlaySound(playerid, 1100, 0.0, 0.0, 0.0);
        ToggleHood(vehicleid, VEHICLE_PARAMS_ON);
        cmd_makan(playerid);
        // The machine breaks at 350 health
      }
      
    }
  }


  if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 416)
    {
      // pemulihan saat di dalam ambulance
      if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER)
      {
        new Float:HP;
        GetPlayerHealth(playerid, Float:HP);
      SetPlayerHealth(playerid, Float:HP+2);
      GameTextForPlayer(playerid, "Your master is being treated in the ambulance.", 500, 5);
      ApplyAnimation(playerid, "CRACK", "crckdeth2",4.0,0,0,0,0,0);
      //SendClientMessage(playerid, COLOR_AQUAGREEN, "* Your master is being treated in the ambulance.");
        
        if(HP > 99)
        {
          RemovePlayerFromVehicle(playerid);
          SendClientMessage(playerid, COLOR_AQUAGREEN, "* Sir anda sembuh dan perawatan berhasil di akhiri.");
          GameTextForPlayer(playerid, "~r~-500", 2000, 6);
        }
      }
    }


  /*
  static warna = 0;
    new str[32];
    if(warna == 5) format(str, sizeof(str), "~p~DuniaPutu Corp."), warna = 0;
    if(warna == 4) format(str, sizeof(str), "~y~DuniaPutu Corp."), warna = 5;
    if(warna == 3) format(str, sizeof(str), "~g~DuniaPutu Corp."), warna = 4;
    if(warna == 2) format(str, sizeof(str), "~w~DuniaPutu Corp."), warna = 0; // warna jadi biru saja
    if(warna == 1) format(str, sizeof(str), "~r~DuniaPutu Corp."), warna = 2;
    if(warna == 0) format(str, sizeof(str), "~b~DuniaPutu Corp."), warna = 1;
    TextDrawSetString(UI[0], str);


    new
        string[800],
        month[12],
        date[6];
 
    getdate(date[2], date[1], date[0]);
    gettime(date[3], date[4], date[5]);
 
    switch (date[1]) {
        case 1: month = "Jan";
        case 2: month = "Feb";
        case 3: month = "Mar";
        case 4: month = "Apr";
        case 5: month = "Mei";
        case 6: month = "Jun";
        case 7: month = "Jul";
        case 8: month = "Agt";
        case 9: month = "Sep";
        case 10: month = "Oktober";
        case 11: month = "Nov";
        case 12: month = "Des";
    }
    format(string, sizeof string, "%02d:%02d:%02d", date[3], date[4], date[5]);//jam
    TextDrawSetString(UI[1], string);

    // mengatur jam seperti di realtime ooc
    SetPlayerTime(playerid, date[3], date[4]);

    format(string, sizeof string, "%02d, %s, %d", date[0],month,date[2]);//TGL
    TextDrawSetString(UI[2], string);

  */

    // update data panel kecepatan kendaraan
    new vehicleid = GetPlayerVehicleID(playerid);
    new tekskecepatan[100];
  
  format(tekskecepatan, sizeof(tekskecepatan), "ID Kendaraan %i\nKecepatan : %i KM/h",vehicleid, GetPlayerSpeed(playerid, true));
  TextDrawSetString(Text:panelkecepatankendaraan, tekskecepatan);

    //tambahan sering berkurang energynya
    new Float:NilaiLapar = Float:GetPlayerProgressBarValue(playerid, PlayerBar:pInfo[playerid][pLaparBar]) - Float:0.01;
    SetPlayerProgressBarValue(playerid, PlayerBar:pInfo[playerid][pLaparBar], Float:NilaiLapar);
    //untuk set warna bar dari setiap nilai bar
    if(Float:NilaiLapar > 70.00)
    {
      return SetPlayerProgressBarColour(playerid, PlayerBar:pInfo[playerid][pLaparBar], COLOR_GREEN);
    }
  else if(Float:NilaiLapar > 25.00)
  {
    return SetPlayerProgressBarColour(playerid, PlayerBar:pInfo[playerid][pLaparBar], COLOR_YELLOW);
  }
  if(Float:NilaiLapar < 25.00)
  {
    return SetPlayerProgressBarColour(playerid, PlayerBar:pInfo[playerid][pLaparBar], COLOR_RED);
    TextDrawShowForPlayer(playerid, Text:LayarJadiMerah);
    SetPlayerDrunkLevel(playerid, 99999);
    SetTimer("HilangkanLayarWarnaMerah", 2000, 0);
  }

  // usir pencuri sepeda sewaan
  if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 510)
    {
      if(GetPlayerVehicleID(playerid) != sepedasewaan[playerid])
      {
        RemovePlayerFromVehicle(playerid);
        
        SendClientMessage(playerid, COLOR_AQUAGREEN, "* Manager rental : Anda tidak berhak menggunakan sewaan orang lain");
    
      }
    }

    // usir pencuri sepeda sewaan
  if(IsPlayerInRangeOfPoint(playerid, Float:130.0, Float:-1712.7421,Float:969.1401,Float:26.0941))
    {
      // player masuk ke sebuah green zone rumah sakit
      printf("Green zone warning has been succes show on the textdraw");
      TextDrawShowForPlayer(playerid, Text:TeksInfoGreenZone);
    }
    else
    {

      TextDrawHideForPlayer(playerid, Text:TeksInfoGreenZone);
    }

    return 1;
}








public OnPlayerConnect(playerid)
{ 

   SetTimerEx("UpdateServer", 100, true, "i", playerid);
  SetTimerEx("ChangeServerEverySecond", 1000, true, "i", playerid);
  SetTimerEx("GantiWarna",  5000, true, "i", playerid);

}
