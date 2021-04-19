#include <progress2>

#include <foreach>// color with string

#include <3DTryg>

#include <colandreas>



// the variabel meaning of water object



#define        FISH_THRESHOLD            3.0

#define        WATER_CHECK_RADIUS        15.0





IsPlayerNearWater(playerid)



{



    new



Float:x,



Float:y,



Float:z,



Float:cx,



Float:cy,



Float:cz,



Float:angle;







    GetPlayerPos(playerid, x, y, z);







    // Will not work near the dam



    if(z > 0.0 && z < FISH_THRESHOLD)



    {



        for(new i = 0; i < 4; i++)



        {



            cx = x + (WATER_CHECK_RADIUS * floatsin(-angle, degrees));



            cy = y + (WATER_CHECK_RADIUS * floatcos(-angle, degrees));



            angle += 90.0;







            CA_FindZ_For2DCoord(cx, cy, cz);







            // Doesn't work under bridges



            if(cz == 0.0) return 1;



        }



    }



    return 0;

}





CMD:fish(playerid, params[])



{



if (IsPlayerNearWater(playerid))



//if(IsPlayerInRangeOfPoint(playerid, 100.0, 1062.4270,-2567.9729,-0.5079)) // lokasi mancing



{



        if(WormAttached[playerid] < 1) return SendClientMessage(playerid, COLOR_LIGHTRED, ""COL_LIGHTBLUE"FISH: "COL_WHITE"Sir sorry you need to have a bait worm attached to the fishing rod to fish with"COL_YELLOW"'/attachworm'");



        if(FishingEquipped[playerid] == 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "You need to have your fishing rod equipped.");



        if(Fishing[playerid] == true) return SendClientMessage(playerid, COLOR_LIGHTRED, "You are already fishing.");



        if(pInfo[playerid][pFishes] > 5)



    {



    SendClientMessage(playerid, COLOR_LGREEN, ""COL_LIGHTBLUE"FISH: "COL_WHITE"Please the fish the on sale first with "COL_YELLOW"'/sellfish'");



    cmd_fishingrod(playerid);



    ApplyAnimation(playerid, "PED", "idle_taxi", 4.0, 0, 1, 1, 1, -1, 1);



    return 1;



    }



  new string[140];



format(string, sizeof(string), "* %s begins to fish with his fishing rod.", GetRPName(playerid));



LocalMessage(ACTION_DISTANCE, playerid, ACTION_COLOR, string);



  fish[playerid] = 2; //change it with the timer time











  new Float:BBCoord[4];



    GetPlayerPos(playerid, BBCoord[0], BBCoord[1], BBCoord[2]);



    GetPlayerFacingAngle(playerid, BBCoord[3]);











EfekPancingan[playerid] = SpawnObject_InfrontOfPlayer(playerid, 18717+2);



//CreateDynamicObject(18717+2, BBCoord[0]+3, BBCoord[1], BBCoord[2]-2.4, 0.0, 0.0, 0.0, 0,  0);











    TimerFish[playerid] = SetTimerEx("timerFish", 1000, 1, "i", playerid);



    TogglePlayerControllable(playerid, 0);



    WormAttached[playerid] = 0;



    ApplyAnimation(playerid, "ped", "ARRESTgun", 4.0, 0, 1, 1, 1, -1, 1);



    Fishing[playerid] = true;



 



 



}



else return SendClientMessage(playerid, COLOR_RED, "You can't sir fishing here with out river .");



  return 1;

}
