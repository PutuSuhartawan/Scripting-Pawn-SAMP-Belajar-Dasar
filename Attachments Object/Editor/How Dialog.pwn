#include <a_samp>
#include <core>
#include <float>

new glob0;

new glob4 [183];

new glob2E0 [2448];

new glob2920;

new glob2924 [1000];

new glob38C4 [1000];

new Text: glob4864 [15];

new Float: glob48A0 [1000] [10] [12];

new glob86690;


public OnFilterScriptInit ()
{
glob0 = funcidx (8)! = -1;
glob4 = funcidx (104)! = -1;
return CallLocalFunction (204, 300);
}

public OnPlayerCommandText (playerid, cmdtext)
{
if (glob0 &&! CallLocalFunction (304, 400, playerid, cmdtext))
{
return 1;
}
new var0 = 0, var1 [32];
while (cmdtext [++ var0]> 32)
{
var1 [var0 - 1] = tolower (cmdtext [var0]);
}
format (var1, 32, "cmd_% s", var1);
while (cmdtext [var0] == 32)
{
var0 ++;
}
if (! cmdtext [var0])
{
if (glob4)
{
return CallLocalFunction (440, 540, playerid, cmdtext);
}
return CallLocalFunction (var1, 576, playerid, 588);
}
if (glob4)
{
return CallLocalFunction (596, 696, playerid, cmdtext);
}
return CallLocalFunction (var1, 724, playerid, cmdtext);
}

public zcmd_OnFilterScriptInit ()
{
SSCANF_Init (GetMaxPlayers (), 65535, 24);
glob2E0 = 1;
SSCANF_OnFilterScriptInit ();
return 1;
}

public OnGameModeInit ()
{
if (! glob2E0)
{
SSCANF_Init (GetMaxPlayers (), 65535, 24);
glob2E0 = 1;
}
return 1;
}

public OnPlayerConnect (playerid)
{
new var0 [24];
GetPlayerName (playerid, var0, 24);
SSCANF_Join (playerid, var0, IsPlayerNPC (playerid));
SSCANF_OnPlayerConnect (playerid);
return 1;
}

public OnPlayerDisconnect (playerid, reason)
{
SSCANF_Leave (playerid);
return 1;
}

public sscanf_weapon (arg0)
{
if ((57> = arg0) & (48 <= arg0))
{
new var0 = strval (arg0);
if ((var0 <= 18) & (0 <= var0) || (var0 <= 46) & (22 <= var0))
{
return var0;
}
}
else
{
if (! strcmp (arg0, "Unarmed"))
{
return 0;
}
if (! strcmp (arg0, "Brass Knuckles"))
{
return 1;
}
if (! strcmp (arg0, "Golf Club"))
{
return 2;
}
if (! strcmp (arg0, "Night Stick"))
{
return 3;
}
if (! strcmp (arg0, "Knife"))
{
return 4;
}
if (! strcmp (arg0, "Baseball Bat"))
{
return 5;
}
if (! strcmp (arg0, "Shovel"))
{
return 6;
}
if (! strcmp (arg0, "Pool cue"))
{
return 7;
}
if (! strcmp (arg0, "Katana"))
{
return 8;
}
if (! strcmp (arg0, "Chainsaw"))
{
return 9;
}
if (! strcmp (arg0, "Purple Dildo"))
{
return 10;
}
if (! strcmp (arg0, "White Dildo"))
{
return 11;
}
if (! strcmp (arg0, "Long White Dildo"))
{
return 12;
}
if (! strcmp (arg0, "White Dildo 2"))
{
return 13;
}
if (! strcmp (arg0, "Flowers"))
{
return 14;
}
if (! strcmp (arg0, "Cane"))
{
return 15;
}
if (! strcmp (arg0, "Grenades"))
{
return 16;
}
if (! strcmp (arg0, "Tear Gas"))
{
return 17;
}
if (! strcmp (arg0, "Molotovs"))
{
return 18;
}
if (! strcmp (arg0, "Pistol"))
{
return 22;
}
if (! strcmp (arg0, "Silenced Pistol"))
{
return 23;
}
if (! strcmp (arg0, "Desert Eagle"))
{
return 24;
}
if (! strcmp (arg0, "Shotgun"))
{
return 25;
}
if (! strcmp (arg0, "Sawn Off Shotgun"))
{
return 26;
}
if (! strcmp (arg0, "Combat Shotgun"))
{
return 27;
}
if (! strcmp (arg0, "Micro Uzi"))
{
return 28;
}
if (! strcmp (arg0, "Mac 10"))
{
return 28;
}
if (! strcmp (arg0, "MP5"))
{
return 29;
}
if (! strcmp (arg0, "AK47"))
{
return 30;
}
if (! strcmp (arg0, "M4"))
{
return 31;
}
if (! strcmp (arg0, "Tec9"))
{
return 32;
}
if (! strcmp (arg0, "Rifle"))
{
return 33;
}
if (! strcmp (arg0, "Sniper Rifle"))
{
return 34;
}
if (! strcmp (arg0, "RPG"))
{
return 35;
}
if (! strcmp (arg0, "Missile Launcher"))
{
return 36;
}
if (! strcmp (arg0, "Flame Thrower"))
{
return 37;
}
if (! strcmp (arg0, "Minigun"))
{
return 38;
}
if (! strcmp (arg0, "Sachel Charges"))
{
return 39;
}
if (! strcmp (arg0, "Detonator"))
{
return 40;
}
if (! strcmp (arg0, "Spray Paint"))
{
return 41;
}
if (! strcmp (arg0, "Fire Extinguisher"))
{
return 42;
}
if (! strcmp (arg0, "Camera"))
{
return 43;
}
if (! strcmp (arg0, "Nightvision Goggles"))
{
return 44;
}
if (! strcmp (arg0, "Thermal Goggles"))
{
return 45;
}
if (! strcmp (arg0, "Parachute"))
{
return 46;
}
}
return -1;
}

public sscanf_vehicle (arg0)
{
if ((57> = arg0) & (48 <= arg0))
{
new var0 = strval (arg0);
if ((611> = var0) & (400 <= var0))
{
return var0;
}
}
else
{
if (! strcmp (arg0, "Landstalker"))
{
return 400;
}
if (! strcmp (arg0, "Bravura"))
{
return 401;
}
if (! strcmp (arg0, "Buffalo"))
{
return 402;
}
if (! strcmp (arg0, "Linerunner"))
{
return 403;
}
if (! strcmp (arg0, "Perenniel"))
{
return 404;
}
if (! strcmp (arg0, "Sentinel"))
{
return 405;
}
if (! strcmp (arg0, "Dumper"))
{
return 406;
}
if (! strcmp (arg0, "Firetruck"))
{
return 407;
}
if (! strcmp (arg0, "Trashmaster"))
{
return 408;
}
if (! strcmp (arg0, "Stretch"))
{
return 409;
}
if (! strcmp (arg0, "Manana"))
{
return 410;
}
if (! strcmp (arg0, "Infernus"))
{
return 411;
}
if (! strcmp (arg0, "Voodoo"))
{
return 412;
}
if (! strcmp (arg0, "Pony"))
{
return 413;
}
if (! strcmp (arg0, "Mule"))
{
return 414;
}
if (! strcmp (arg0, "Cheetah"))
{
return 415;
}
if (! strcmp (arg0, "Ambulance"))
{
return 416;
}
if (! strcmp (arg0, "Leviathan"))
{
return 417;
}
if (! strcmp (arg0, "Moonbeam"))
{
return 418;
}
if (! strcmp (arg0, "Esperanto"))
{
return 419;
}
if (! strcmp (arg0, "Taxi"))
{
return 420;
}
if (! strcmp (arg0, "Washington"))
{
return 421;
}
if (! strcmp (arg0, "Bobcat"))
{
return 422;
}
if (! strcmp (arg0, "Mr Whoopee"))
{
return 423;
}
if (! strcmp (arg0, "BF Injection"))
{
return 424;
}
if (! strcmp (arg0, "Hunter"))
{
return 425;
}
if (! strcmp (arg0, "Premier"))
{
return 426;
}
if (! strcmp (arg0, "Enforcer"))
{
return 427;
}
if (! strcmp (arg0, "Securicar"))
{
return 428;
}
if (! strcmp (arg0, "Banshee"))
{
return 429;
}
if (! strcmp (arg0, "Predator"))
{
return 430;
}
if (! strcmp (arg0, "Bus"))
{
return 431;
}
if (! strcmp (arg0, "Rhino"))
{
return 432;
}
if (! strcmp (arg0, "Barracks"))
{
return 433;
}
if (! strcmp (arg0, "Hotknife"))
{
return 434;
}
if (! strcmp (arg0, "Article Trailer"))
{
return 435;
}
if (! strcmp (arg0, "Previon"))
{
return 436;
}
if (! strcmp (arg0, "Coach"))
{
return 437;
}
if (! strcmp (arg0, "Cabbie"))
{
return 438;
}
if (! strcmp (arg0, "Stallion"))
{
return 439;
}
if (! strcmp (arg0, "Rumpo"))
{
return 440;
}
if (! strcmp (arg0, "RC Bandit"))
{
return 441;
}
if (! strcmp (arg0, "Romero"))
{
return 442;
}
if (! strcmp (arg0, "Packer"))
{
return 443;
}
if (! strcmp (arg0, "Monster"))
{
return 444;
}
if (! strcmp (arg0, "Admiral"))
{
return 445;
}
if (! strcmp (arg0, "Squallo"))
{
return 446;
}
if (! strcmp (arg0, "Seasparrow"))
{
return 447;
}
if (! strcmp (arg0, "Pizzaboy"))
{
return 448;
}
if (! strcmp (arg0, "Tram"))
{
return 449;
}
if (! strcmp (arg0, "Article Trailer 2"))
{
return 450;
}
if (! strcmp (arg0, "Turismo"))
{
return 451;
}
if (! strcmp (arg0, "Speeder"))
{
return 452;
}
if (! strcmp (arg0, "Reefer"))
{
return 453;
}
if (! strcmp (arg0, "Tropic"))
{
return 454;
}
if (! strcmp (arg0, "Flatbed"))
{
return 455;
}
if (! strcmp (arg0, "Yankee"))
{
return 456;
}
if (! strcmp (arg0, "Caddy"))
{
return 457;
}
if (! strcmp (arg0, "Solair"))
{
return 458;
}
if (! strcmp (arg0, "Berkley's RC Van"))
{
return 459;
}
if (! strcmp (arg0, "Skimmer"))
{
return 460;
}
if (! strcmp (arg0, "PCJ-600"))
{
return 461;
}
if (! strcmp (arg0, "Faggio"))
{
return 462;
}
if (! strcmp (arg0, "Freeway"))
{
return 463;
}
if (! strcmp (arg0, "RC Baron"))
{
return 464;
}
if (! strcmp (arg0, "RC Raider"))
{
return 465;
}
if (! strcmp (arg0, "Glendale"))
{
return 466;
}
if (! strcmp (arg0, "Oceanic"))
{
return 467;
}
if (! strcmp (arg0, "Sanchez"))
{
return 468;
}
if (! strcmp (arg0, "Sparrow"))
{
return 469;
}
if (! strcmp (arg0, "Patriot"))
{
return 470;
}
if (! strcmp (arg0, "Quad"))
{
return 471;
}
if (! strcmp (arg0, "Coastguard"))
{
return 472;
}
if (! strcmp (arg0, "Dinghy"))
{
return 473;
}
if (! strcmp (arg0, "Hermes"))
{
return 474;
}
if (! strcmp (arg0, "Saber"))
{
return 475;
}
if (! strcmp (arg0, "Rustler"))
{
return 476;
}
if (! strcmp (arg0, "ZR-350"))
{
return 477;
}
if (! strcmp (arg0, "Walton"))
{
return 478;
}
if (! strcmp (arg0, "Regina"))
{
return 479;
}
if (! strcmp (arg0, "Comet"))
{
return 480;
}
if (! strcmp (arg0, "BMX"))
{
return 481;
}
if (! strcmp (arg0, "Burrito"))
{
return 482;
}
if (! strcmp (arg0, "Camper"))
{
return 483;
}
if (! strcmp (arg0, "Marquis"))
{
return 484;
}
if (! strcmp (arg0, "Baggage"))
{
return 485;
}
if (! strcmp (arg0, "Dozer"))
{
return 486;
}
if (! strcmp (arg0, "Maverick"))
{
return 487;
}
if (! strcmp (arg0, "SAN News Maverick"))
{
return 488;
}
if (! strcmp (arg0, "Rancher"))
{
return 489;
}
if (! strcmp (arg0, "FBI Rancher"))
{
return 490;
}
if (! strcmp (arg0, "Virgo"))
{
return 491;
}
if (! strcmp (arg0, "Greenwood"))
{
return 492;
}
if (! strcmp (arg0, "Jetmax"))
{
return 493;
}
if (! strcmp (arg0, "Hotring Racer"))
{
return 494;
}
if (! strcmp (arg0, "Sandking"))
{
return 495;
}
if (! strcmp (arg0, "Blista Compact"))
{
return 496;
}
if (! strcmp (arg0, "Police Maverick"))
{
return 497;
}
if (! strcmp (arg0, "Boxville"))
{
return 498;
}
if (! strcmp (arg0, "Benson"))
{
return 499;
}
if (! strcmp (arg0, "Mesa"))
{
return 500;
}
if (! strcmp (arg0, "RC Goblin"))
{
return 501;
}
if (! strcmp (arg0, "Hotring Racer"))
{
return 502;
}
if (! strcmp (arg0, "Hotring Racer "))
{
return 503;
}
if (! strcmp (arg0, "Bloodring Banger"))
{
return 504;
}
if (! strcmp (arg0, "Rancher"))
{
return 505;
}
if (! strcmp (arg0, "Super GT"))
{
return 506;
}
if (! strcmp (arg0, "Elegant"))
{
return 507;
}
if (! strcmp (arg0, "Journey"))
{
return 508;
}
if (! strcmp (arg0, "Bike"))
{
return 509;
}
if (! strcmp (arg0, "Mountain Bike"))
{
return 510;
}
if (! strcmp (arg0, "Beagle"))
{
return 511;
}
if (! strcmp (arg0, "Cropduster"))
{
return 512;
}
if (! strcmp (arg0, "Stuntplane"))
{
return 513;
}
if (! strcmp (arg0, "Tanker"))
{
return 514;
}
if (! strcmp (arg0, "Roadtrain"))
{
return 515;
}
if (! strcmp (arg0, "Nebula"))
{
return 516;
}
if (! strcmp (arg0, "Majestic"))
{
return 517;
}
if (! strcmp (arg0, "Buccaneer"))
{
return 518;
}
if (! strcmp (arg0, "Shamal"))
{
return 519;
}
if (! strcmp (arg0, "Hydra"))
{
return 520;
}
if (! strcmp (arg0, "FCR-900"))
{
return 521;
}
if (! strcmp (arg0, "NRG-500"))
{
return 522;
}
if (! strcmp (arg0, "HPV1000"))
{
return 523;
}
if (! strcmp (arg0, "Cement Truck"))
{
return 524;
}
if (! strcmp (arg0, "Towtruck"))
{
return 525;
}
if (! strcmp (arg0, "Fortune"))
{
return 526;
}
if (! strcmp (arg0, "Cadrona"))
{
return 527;
}
if (! strcmp (arg0, "FBI Truck"))
{
return 528;
}
if (! strcmp (arg0, "Willard"))
{
return 529;
}
if (! strcmp (arg0, "Forklift"))
{
return 530;
}
if (! strcmp (arg0, "Tractor"))
{
return 531;
}
if (! strcmp (arg0, "Combine Harvester"))
{
return 532;
}
if (! strcmp (arg0, "Feltzer"))
{
return 533;
}
if (! strcmp (arg0, "Remington"))
{
return 534;
}
if (! strcmp (arg0, "Slamvan"))
{
return 535;
}
if (! strcmp (arg0, "Blade"))
{
return 536;
}
if (! strcmp (arg0, "Freight (Train)"))
{
return 537;
}
if (! strcmp (arg0, "Brownstreak (Train)"))
{
return 538;
}
if (! strcmp (arg0, "Vortex"))
{
return 539;
}
if (! strcmp (arg0, "Vincent"))
{
return 540;
}
if (! strcmp (arg0, "Bullet"))
{
return 541;
}
if (! strcmp (arg0, "Clover"))
{
return 542;
}
if (! strcmp (arg0, "Sadler"))
{
return 543;
}
if (! strcmp (arg0, "Firetruck LA"))
{
return 544;
}
if (! strcmp (arg0, "Hustler"))
{
return 545;
}
if (! strcmp (arg0, "Intruder"))
{
return 546;
}
if (! strcmp (arg0, "Primo"))
{
return 547;
}
if (! strcmp (arg0, "Cargobob"))
{
return 548;
}
if (! strcmp (arg0, "Tampa"))
{
return 549;
}
if (! strcmp (arg0, "Sunrise"))
{
return 550;
}
if (! strcmp (arg0, "Merit"))
{
return 551;
}
if (! strcmp (arg0, "Utility Van"))
{
return 552;
}
if (! strcmp (arg0, "Nevada"))
{
return 553;
}
if (! strcmp (arg0, "Yosemite"))
{
return 554;
}
if (! strcmp (arg0, "Windsor"))
{
return 555;
}
if (! strcmp (arg0, "Monster \" A \ ""))
{
return 556;
}
if (! strcmp (arg0, "Monster \" B \ ""))
{
return 557;
}
if (! strcmp (arg0, "Uranus"))
{
return 558;
}
if (! strcmp (arg0, "Jester"))
{
return 559;
}
if (! strcmp (arg0, "Sultan"))
{
return 560;
}
if (! strcmp (arg0, "Stratum"))
{
return 561;
}
if (! strcmp (arg0, "Elegy"))
{
return 562;
}
if (! strcmp (arg0, "Raindance"))
{
return 563;
}
if (! strcmp (arg0, "RC Tiger"))
{
return 564;
}
if (! strcmp (arg0, "Flash"))
{
return 565;
}
if (! strcmp (arg0, "Tahoma"))
{
return 566;
}
if (! strcmp (arg0, "Savanna"))
{
return 567;
}
if (! strcmp (arg0, "Bandito"))
{
return 568;
}
if (! strcmp (arg0, "Freight Flat Trailer (Train)"))
{
return 569;
}
if (! strcmp (arg0, "Streak Trailer (Train)"))
{
return 570;
}
if (! strcmp (arg0, "Kart"))
{
return 571;
}
if (! strcmp (arg0, "Mower"))
{
return 572;
}
if (! strcmp (arg0, "Dune"))
{
return 573;
}
if (! strcmp (arg0, "Sweeper"))
{
return 574;
}
if (! strcmp (arg0, "Broadway"))
{
return 575;
}
if (! strcmp (arg0, "Tornado"))
{
return 576;
}
if (! strcmp (arg0, "AT400"))
{
return 577;
}
if (! strcmp (arg0, "DFT-30"))
{
return 578;
}
if (! strcmp (arg0, "Huntley"))
{
return 579;
}
if (! strcmp (arg0, "Stafford"))
{
return 580;
}
if (! strcmp (arg0, "BF-400"))
{
return 581;
}
if (! strcmp (arg0, "Newsvan"))
{
return 582;
}
if (! strcmp (arg0, "Tug"))
{
return 583;
}
if (! strcmp (arg0, "Petrol Trailer"))
{
return 584;
}
if (! strcmp (arg0, "Emperor"))
{
return 585;
}
if (! strcmp (arg0, "Wayfarer"))
{
return 586;
}
if (! strcmp (arg0, "Euros"))
{
return 587;
}
if (! strcmp (arg0, "Hotdog"))
{
return 588;
}
if (! strcmp (arg0, "Club"))
{
return 589;
}
if (! strcmp (arg0, "Freight Box Trailer (Train)"))
{
return 590;
}
if (! strcmp (arg0, "Article Trailer 3"))
{
return 591;
}
if (! strcmp (arg0, "Andromada"))
{
return 592;
}
if (! strcmp (arg0, "Dodo"))
{return 593;
}
if (! strcmp (arg0, "RC Cam"))
{
return 594;
}
if (! strcmp (arg0, "Launch"))
{
return 595;
}
if (! strcmp (arg0, "Police Car (LSPD)"))
{
return 596;
}
if (! strcmp (arg0, "Police Car (SFPD)"))
{
return 597;
}
if (! strcmp (arg0, "Police Car (LVPD)"))
{
return 598;
}
if (! strcmp (arg0, "Police Ranger"))
{
return 599;
}
if (! strcmp (arg0, "Picador"))
{
return 600;
}
if (! strcmp (arg0, "S.W.A.T."))
{
return 601;
}
if (! strcmp (arg0, "Alpha"))
{
return 602;
}
if (! strcmp (arg0, "Phoenix"))
{
return 603;
}
if (! strcmp (arg0, "Glendale Shit"))
{
return 604;
}
if (! strcmp (arg0, "Sadler Shit"))
{
return 605;
}
if (! strcmp (arg0, "Baggage Trailer \" A \ ""))
{
return 606;
}
if (! strcmp (arg0, "Baggage Trailer \" B \ ""))
{
return 607;
}
if (! strcmp (arg0, "Tug Stairs Trailer"))
{
return 608;
}
if (! strcmp (arg0, "Boxville"))
{
return 609;
}
if (! strcmp (arg0, "Farm Trailer"))
{
return 610;
}
if (! strcmp (arg0, "Utility Trailer"))
{
return 611;
}
}
return -1;
}

public SSCANF_OnFilterScriptInit ()
{
print ("\ n ----------------- Attached Object Creator V1 ------------------------ ---------- \ n ");
print ("=========================== CMDS =================== ========================== \ n ");
print ("----------------------- For Players ---------------------- -------------------- \ n \ n ");
print ("/ attach -> To attach objects to one of the 9 slots");
print ("/ editattach -> To edit an attached object");
print ("/ clearattach -> To delete objects into one of the 9 slots");
print ("/ saveattach -> To save your work [scriptfiles / Attach Object.pwn]");
print ("/ clearfile -> to delete contents in Attach Object.pwn \ n");
print ("----------------------------------------------- -------------------------------- ");
print ("By: Lukman Nul Hakim (ShiroNeko NetWork) \ n \ n");
function16180 ();
return 1;
}

public OnFilterScriptExit ()
{
print ("Thank you for using 'ATTACHMENTS OBJECT CREATOR V1'!");
return 1;
}

public SSCANF_OnPlayerConnect (arg0)
{
SendClientCheck (arg0, 72, 0, 0, 2);
return 1;
}

public OnClientCheckResponse (arg0, arg1)
{
switch (arg1) {
case 72:
SetPVarInt (arg0,545600,1);
}
return 1;
}

public cmd_attach (arg0)
{
new var0 [256];
format (var0, 256, "Slot 0 [objectid:% d] \ nSlot 1 [objectid:% d] \ nSlot 2 [objectid:% d] \ nSlot 3 [objectid:% d] \ nSlot 4 [objectid:% d ] \ nSlot 5 [objectid:% d] \ nSlot 6 [objectid:% d] \ nSlot 7 [objectid:% d] \ nSlot 8 [objectid:% d] \ nSlot 9 [objectid:% d] ", glob48A0 [ arg0] [0] [0], glob48A0 [arg0] [1] [0], glob48A0 [arg0] [2] [0], glob48A0 [arg0] [3] [0], glob48A0 [arg0] [4] [ 0], glob48A0 [arg0] [5] [0], glob48A0 [arg0] [6] [0], glob48A0 [arg0] [7] [0], glob48A0 [arg0] [8] [0], glob48A0 [arg0 ] [9] [0]);
ShowPlayerDialog (arg0, 2023, 2, 546484, var0, 546544, 546564);
return 1;
}

public cmd_saveattach (playerid, arg1)
{
new File: var0 = 0, var1 [512], var2 = 0;
if (! fexist ("Attach Object.pwn"))
{
var0 = fopen ("Attach Object.pwn", 1);
fclose (var0);
}
var0 = fopen ("Attach Object.pwn", 3);
if (! arg1 || (arg1 == 1 &&! (arg1 + 4)))
{
return SendClientMessage (playerid, 0x33AA33AA, "/ saveattach <project name>");
}
for (new var3 = 0; var3 <10; var3 ++)
{
if (glob48A0 [playerid] [var3] [0])
{
format (var1, 512, "\ nATTACHED OBJECT CREATOR \ n \ n // Slot% d | Project Name:% s \ nSetPlayerAttachedObject (playerid,% d,% d,% d,% f,% f,% f,% f,% f,% f,% f,% f,% f); \ r \ n ", glob48A0 [playerid] [var3] [1], arg1, glob48A0 [playerid] [var3] [1], glob48A0 [ playerid] [var3] [0], glob48A0 [playerid] [var3] [2], glob48A0 [playerid] [var3] [3], glob48A0 [playerid] [var3] [4], glob48A0 [playerid] [var3] [ 5], glob48A0 [playerid] [var3] [6], glob48A0 [playerid] [var3] [7], glob48A0 [playerid] [var3] [8], glob48A0 [playerid] [var3] [9], glob48A0 [playerid ] [var3] [10], glob48A0 [playerid] [var3] [11]);
fwrite (var0, var1);
var2 ++;
}
}
if (! var2)
{
return SendClientMessage (playerid, 0xFF0000FF, "Nothing to export.");
}
fclose (var0);
SendClientMessage (playerid, 0x33AA33AA, "File 'Attach Object' can be opened scriptfiles -> Attach Object.pwn.");
return 1;
}

public cmd_clearattach (arg0)
{
new var0 [256];
format (var0, 256, "Clear Slots \ nSlot 0 [objectid:% d] \ nSlot 1 [objectid:% d] \ nSlot 2 [objectid:% d] \ nSlot 3 [objectid:% d] \ nSlot 4 [objectid :% d] \ nSlot 5 [objectid:% d] \ nSlot 6 [objectid:% d] \ nSlot 7 [objectid:% d] \ nSlot 8 [objectid:% d] \ nSlot 9 [objectid:% d] " , glob48A0 [arg0] [0] [0], glob48A0 [arg0] [1] [0], glob48A0 [arg0] [2] [0], glob48A0 [arg0] [3] [0], glob48A0 [arg0] [ 4] [0], glob48A0 [arg0] [5] [0], glob48A0 [arg0] [6] [0], glob48A0 [arg0] [7] [0], glob48A0 [arg0] [8] [0], glob48A0 [arg0] [9] [0]);
ShowPlayerDialog (arg0, 2021, 2, 549352, var0, 549404, 549428);
return 1;
}

public cmd_editattach (arg0)
{
new var0 [256];
format (var0, 256, "Slot 0 [objectid:% d] \ nSlot 1 [objectid:% d] \ nSlot 2 [objectid:% d] \ nSlot 3 [objectid:% d] \ nSlot 4 [objectid:% d ] \ nSlot 5 [objectid:% d] \ nSlot 6 [objectid:% d] \ nSlot 7 [objectid:% d] \ nSlot 8[objectid:% d] \ nSlot 9 [objectid:% d] ", glob48A0 [arg0] [0] [0], glob48A0 [arg0] [1] [0], glob48A0 [arg0] [2] [0], glob48A0 [arg0] [3] [0], glob48A0 [arg0] [4] [0], glob48A0 [arg0] [5] [0], glob48A0 [arg0] [6] [0], glob48A0 [arg0] [7 ] [0], glob48A0 [arg0] [8] [0], glob48A0 [arg0] [9] [0]);
ShowPlayerDialog (arg0, 2020, 2, 550300, var0, 550348, 550368);
return 1;
}

public cmd_clearfile (playerid)
{
new File: var0 = 0;
if (fexist ("Attach Object.pwn"))
{
var0 = fopen ("Attach Object.pwn", 1);
fwrite (var0, glob86690);
fclose (var0);
SendClientMessage (playerid, 0x33AA33AA, "Attach Object.pwn cleared successfully.");
}
else
{
SendClientMessage (playerid, 0xFF0000FF, "Attach Object.pwn file could not be found in the scriptfiles folder.");
}
return 1;
}

public cmd_help (arg0)
{
new var0 [373];
var0 [0] = 0;
strcat (var0, "{FFFFFF} Attachments Object Editor \ n \ n", 373);
strcat (var0, "{FFFFFF} / attach -> To attach an object to one of the 9 slots. \ n", 373);
strcat (var0, "{FFFFFF} / editattach -> To edit an attached object. \ n", 373);
strcat (var0, "{FFFFFF} / clearattach -> To delete an object to one of the 9 slots. \ n", 373);
strcat (var0, "{FFFFFF} / saveattach -> To save your work [scriptfiles / Attach Object.pwn]. \ n", 373);
strcat (var0, "{FFFFFF} / clearfile -> to delete contents in Attach Object.pwn", 373);
ShowPlayerDialog (arg0, 69, 0, 552616, var0, 552692, 552720);
return 1;
}

public cmd_tatas (playerid)
{
if (! glob38C4 [playerid])
{
return SendClientMessage (playerid, 0xFF0000FF, "ERROR: You must be in Edit mode!");
}
GetPlayerFacingAngle (playerid, 0.0);
SetPlayerFacingAngle (playerid, glob2920 - 5);
return 1;
}

public cmd_tbawah (playerid)
{
if (! glob38C4 [playerid])
{
return SendClientMessage (playerid, 0xFF0000FF, "ERROR: You must be in Edit mode!");
}
GetPlayerFacingAngle (playerid, 0.0);
SetPlayerFacingAngle (playerid, glob2920 + 5);
return 1;
}

public cmd_tkiri (playerid)
{
if (! glob38C4 [playerid])
{
return SendClientMessage (playerid, 0xFF0000FF, "ERROR: You must be in Edit mode!");
}
new var0 = GetPVarInt (playerid, 553192);
if (glob2924 [playerid] == 1)
{
SetPlayerAttachedObject (playerid, glob48A0 [playerid] [var0] [1], glob48A0 [playerid] [var0] [0], glob48A0 [playerid] [var0] [2], glob48A0 [playerid] [var0] [3], glob48A0 [ playerid] [var0] [4], glob48A0 [playerid] [var0] [5], glob48A0 [playerid] [var0] [6], glob48A0 [playerid] [var0] [7], glob48A0 [playerid] [var0] [ 8], glob48A0 [playerid] [var0] [9], glob48A0 [playerid] [var0] [10], glob48A0 [playerid] [var0] [11], 0, 0);
glob48A0 [playerid] [var0] [3] = 0.0049 + glob48A0 [playerid] [var0] [3];
}
if (glob2924 [playerid] == 2)
{
glob48A0 [playerid] [var0] [4] = 0.0049 + glob48A0 [playerid] [var0] [4];
SetPlayerAttachedObject (playerid, glob48A0 [playerid] [var0] [1], glob48A0 [playerid] [var0] [0], glob48A0 [playerid] [var0] [2], glob48A0 [playerid] [var0] [3], glob48A0 [ playerid] [var0] [4], glob48A0 [playerid] [var0] [5], glob48A0 [playerid] [var0] [6], glob48A0 [playerid] [var0] [7], glob48A0 [playerid] [var0] [ 8], glob48A0 [playerid] [var0] [9], glob48A0 [playerid] [var0] [10], glob48A0 [playerid] [var0] [11], 0, 0);
}
if (glob2924 [playerid] == 3)
{
glob48A0 [playerid] [var0] [5] = 0.0049 + glob48A0 [playerid] [var0] [5];
SetPlayerAttachedObject (playerid, glob48A0 [playerid] [var0] [1], glob48A0 [playerid] [var0] [0], glob48A0 [playerid] [var0] [2], glob48A0 [playerid] [var0] [3], glob48A0 [ playerid] [var0] [4], glob48A0 [playerid] [var0] [5], glob48A0 [playerid] [var0] [6], glob48A0 [playerid] [var0] [7], glob48A0 [playerid] [var0] [ 8], glob48A0 [playerid] [var0] [9], glob48A0 [playerid] [var0] [10], glob48A0 [playerid] [var0] [11], 0, 0);
}
if (glob2924 [playerid] == 4)
{
glob48A0 [playerid] [var0] [6] = glob48A0 [playerid] [var0] [6] + (0.0049 * 100);
SetPlayerAttachedObject (playerid, glob48A0 [playerid] [var0] [1], glob48A0 [playerid] [var0] [0], glob48A0 [playerid] [var0] [2], glob48A0 [playerid] [var0] [3], glob48A0 [ playerid] [var0] [4], glob48A0 [playerid] [var0] [5], glob48A0 [playerid] [var0] [6], glob48A0 [playerid] [var0] [7], glob48A0 [playerid] [var0] [ 8], glob48A0 [playerid] [var0] [9], glob48A0 [playerid] [var0] [10], glob48A0 [playerid] [var0] [11], 0, 0);
}
if (glob2924 [playerid] == 5)
{
glob48A0 [playerid] [var0] [7] = glob48A0 [playerid] [var0] [7] + (0.0049 * 100);
SetPlayerAttachedObject (playerid, glob48A0 [playerid] [var0] [1], glob48A0 [playerid] [var0] [0], glob48A0 [playerid] [var0] [2], glob48A0 [playerid] [var0] [3], glob48A0 [ playerid] [var0] [4], glob48A0 [playerid] [var0] [5], glob48A0 [playerid] [var0] [6], glob48A0 [playerid] [var0] [7], glob48A0 [playerid] [var0] [ 8], glob48A0 [playerid] [var0] [9], glob48A0 [playerid] [var0] [10], glob48A0 [playerid] [var0] [11], 0, 0);
}
if (glob2924 [playerid] == 6)
{
glob48A0 [playerid] [var0] [8] = glob48A0 [playerid] [var0] [8] + (0.0049 * 100);
SetPlayerAttachedObject (playerid, glob48A0 [playerid] [var0] [1], glob48A0 [playerid] [var0] [0], glob48A0 [playerid] [var0] [2], glob48A0 [playerid] [var0] [3], glob48A0 [ playerid] [var0] [4], glob48A0 [playerid] [var0] [5], glob48A0 [playerid] [var0] [6], glob48A0 [playerid] [var0] [7], glob48A0 [playerid] [var0] [8], glob48A0 [playerid] [var0] [9], glob48A0 [playerid] [var0] [10], glob48A0 [playerid] [var0] [11], 0, 0) ;
}
if (glob2924 [playerid] == 7)
{
glob48A0 [playerid] [var0] [9] = 0.0049 + glob48A0 [playerid] [var0] [9];
SetPlayerAttachedObject (playerid, glob48A0 [playerid] [var0] [1], glob48A0 [playerid] [var0] [0], glob48A0 [playerid] [var0] [2], glob48A0 [playerid] [var0] [3], glob48A0 [ playerid] [var0] [4], glob48A0 [playerid] [var0] [5], glob48A0 [playerid] [var0] [6], glob48A0 [playerid] [var0] [7], glob48A0 [playerid] [var0] [ 8], glob48A0 [playerid] [var0] [9], glob48A0 [playerid] [var0] [10], glob48A0 [playerid] [var0] [11], 0, 0);
}
if (glob2924 [playerid] == 8)
{
glob48A0 [playerid] [var0] [10] = 0.0049 + glob48A0 [playerid] [var0] [10];
SetPlayerAttachedObject (playerid, glob48A0 [playerid] [var0] [1], glob48A0 [playerid] [var0] [0], glob48A0 [playerid] [var0] [2], glob48A0 [playerid] [var0] [3], glob48A0 [ playerid] [var0] [4], glob48A0 [playerid] [var0] [5], glob48A0 [playerid] [var0] [6], glob48A0 [playerid] [var0] [7], glob48A0 [playerid] [var0] [ 8], glob48A0 [playerid] [var0] [9], glob48A0 [playerid] [var0] [10], glob48A0 [playerid] [var0] [11], 0, 0);
}
if (glob2924 [playerid] == 9)
{
glob48A0 [playerid] [var0] [11] = 0.0049 + glob48A0 [playerid] [var0] [11];
SetPlayerAttachedObject (playerid, glob48A0 [playerid] [var0] [1], glob48A0 [playerid] [var0] [0], glob48A0 [playerid] [var0] [2], glob48A0 [playerid] [var0] [3], glob48A0 [ playerid] [var0] [4], glob48A0 [playerid] [var0] [5], glob48A0 [playerid] [var0] [6], glob48A0 [playerid] [var0] [7], glob48A0 [playerid] [var0] [ 8], glob48A0 [playerid] [var0] [9], glob48A0 [playerid] [var0] [10], glob48A0 [playerid] [var0] [11], 0, 0);
}
if (! glob2924 [playerid])
{
function15B0C (playerid);
}
return 1;
}

public cmd_tkanan (playerid)
{
if (! glob38C4 [playerid])
{
return SendClientMessage (playerid, 0xFF0000FF, "ERROR: You must be in Edit mode!");
}
new var0 = GetPVarInt (playerid, 553400);
if (glob2924 [playerid] == 1)
{
glob48A0 [playerid] [var0] [3] = glob48A0 [playerid] [var0] [3] - 0.0049;
SetPlayerAttachedObject (playerid, glob48A0 [playerid] [var0] [1], glob48A0 [playerid] [var0] [0], glob48A0 [playerid] [var0] [2], glob48A0 [playerid] [var0] [3], glob48A0 [ playerid] [var0] [4], glob48A0 [playerid] [var0] [5], glob48A0 [playerid] [var0] [6], glob48A0 [playerid] [var0] [7], glob48A0 [playerid] [var0] [ 8], glob48A0 [playerid] [var0] [9], glob48A0 [playerid] [var0] [10], glob48A0 [playerid] [var0] [11], 0, 0);
}
if (glob2924 [playerid] == 2)
{
glob48A0 [playerid] [var0] [4] = glob48A0 [playerid] [var0] [4] - 0.0049;
SetPlayerAttachedObject (playerid, glob48A0 [playerid] [var0] [1], glob48A0 [playerid] [var0] [0], glob48A0 [playerid] [var0] [2], glob48A0 [playerid] [var0] [3], glob48A0 [ playerid] [var0] [4], glob48A0 [playerid] [var0] [5], glob48A0 [playerid] [var0] [6], glob48A0 [playerid] [var0] [7], glob48A0 [playerid] [var0] [ 8], glob48A0 [playerid] [var0] [9], glob48A0 [playerid] [var0] [10], glob48A0 [playerid] [var0] [11], 0, 0);
}
if (glob2924 [playerid] == 3)
{
glob48A0 [playerid] [var0] [5] = glob48A0 [playerid] [var0] [5] - 0.0049;
SetPlayerAttachedObject (playerid, glob48A0 [playerid] [var0] [1], glob48A0 [playerid] [var0] [0], glob48A0 [playerid] [var0] [2], glob48A0 [playerid] [var0] [3], glob48A0 [ playerid] [var0] [4], glob48A0 [playerid] [var0] [5], glob48A0 [playerid] [var0] [6], glob48A0 [playerid] [var0] [7], glob48A0 [playerid] [var0] [ 8], glob48A0 [playerid] [var0] [9], glob48A0 [playerid] [var0] [10], glob48A0 [playerid] [var0] [11], 0, 0);
}
if (glob2924 [playerid] == 4)
{
glob48A0 [playerid] [var0] [6] = glob48A0 [playerid] [var0] [6] - (0.0049 * 100);
SetPlayerAttachedObject (playerid, glob48A0 [playerid] [var0] [1], glob48A0 [playerid] [var0] [0], glob48A0 [playerid] [var0] [2], glob48A0 [playerid] [var0] [3], glob48A0 [ playerid] [var0] [4], glob48A0 [playerid] [var0] [5], glob48A0 [playerid] [var0] [6], glob48A0 [playerid] [var0] [7], glob48A0 [playerid] [var0] [ 8], glob48A0 [playerid] [var0] [9], glob48A0 [playerid] [var0] [10], glob48A0 [playerid] [var0] [11], 0, 0);
}
if (glob2924 [playerid] == 5)
{
glob48A0 [playerid] [var0] [7] = glob48A0 [playerid] [var0] [7] - (0.0049 * 100);
SetPlayerAttachedObject (playerid, glob48A0 [playerid] [var0] [1], glob48A0 [playerid] [var0] [0], glob48A0 [playerid] [var0] [2], glob48A0 [playerid] [var0] [3], glob48A0 [ playerid] [var0] [4], glob48A0 [playerid] [var0] [5], glob48A0 [playerid] [var0] [6], glob48A0 [playerid] [var0] [7], glob48A0 [playerid] [var0] [ 8], glob48A0 [playerid] [var0] [9], glob48A0 [playerid] [var0] [10], glob48A0 [playerid] [var0] [11], 0, 0);
}
if (glob2924 [playerid] == 6)
{
glob48A0 [playerid] [var0] [8] = glob48A0 [playerid] [var0] [8] - (0.0049 * 100);
SetPlayerAttachedObject (playerid, glob48A0 [playerid] [var0] [1], glob48A0 [playerid] [var0] [0], glob48A0 [playerid] [var0] [2], glob48A0 [playerid] [var0] [3], glob48A0 [ playerid] [var0] [4], glob48A0 [playerid] [var0] [5], glob48A0 [playerid] [var0] [6], glob48A0 [playerid] [var0] [7], glob48A0 [playerid] [var0] [ 8], glob48A0 [playerid] [var0] [9], glob48A0 [playerid] [var0] [10], glob48A0 [playerid] [var0] [11], 0, 0);
}
if (glob2924 [playerid] == 7)
{
glob48A0 [playerid] [var0] [9] = glob48A0 [playerid] [var0] [9]- 0.0049;
SetPlayerAttachedObject (playerid, glob48A0 [playerid] [var0] [1], glob48A0 [playerid] [var0] [0], glob48A0 [playerid] [var0] [2], glob48A0 [playerid] [var0] [3], glob48A0 [ playerid] [var0] [4], glob48A0 [playerid] [var0] [5], glob48A0 [playerid] [var0] [6], glob48A0 [playerid] [var0] [7], glob48A0 [playerid] [var0] [ 8], glob48A0 [playerid] [var0] [9], glob48A0 [playerid] [var0] [10], glob48A0 [playerid] [var0] [11], 0, 0);
}
if (glob2924 [playerid] == 8)
{
glob48A0 [playerid] [var0] [10] = glob48A0 [playerid] [var0] [10] - 0.0049;
SetPlayerAttachedObject (playerid, glob48A0 [playerid] [var0] [1], glob48A0 [playerid] [var0] [0], glob48A0 [playerid] [var0] [2], glob48A0 [playerid] [var0] [3], glob48A0 [ playerid] [var0] [4], glob48A0 [playerid] [var0] [5], glob48A0 [playerid] [var0] [6], glob48A0 [playerid] [var0] [7], glob48A0 [playerid] [var0] [ 8], glob48A0 [playerid] [var0] [9], glob48A0 [playerid] [var0] [10], glob48A0 [playerid] [var0] [11], 0, 0);
}
if (glob2924 [playerid] == 9)
{
glob48A0 [playerid] [var0] [11] = glob48A0 [playerid] [var0] [11] - 0.0049;
SetPlayerAttachedObject (playerid, glob48A0 [playerid] [var0] [1], glob48A0 [playerid] [var0] [0], glob48A0 [playerid] [var0] [2], glob48A0 [playerid] [var0] [3], glob48A0 [ playerid] [var0] [4], glob48A0 [playerid] [var0] [5], glob48A0 [playerid] [var0] [6], glob48A0 [playerid] [var0] [7], glob48A0 [playerid] [var0] [ 8], glob48A0 [playerid] [var0] [9], glob48A0 [playerid] [var0] [10], glob48A0 [playerid] [var0] [11], 0, 0);
}
if (! glob2924 [playerid])
{
function15B0C (playerid);
}
return 1;
}

public OnDialogResponse (playerid, arg1, arg2, arg3, arg4)
{
if (arg1 == 2020)
{
if (! arg2)
{
return 1;
}
switch (arg3) {
case 0:
case 5:
case 6:
case 7:
case 8:
case 4:
case 2:
case 3:
case 1:
case 9:
SetPVarInt (playerid, 553452, arg3);
new var0 = GetPVarInt (playerid, 553504);
new var1 = GetPVarInt (playerid, 553556);
if (! glob48A0 [playerid] [var0] [0])
{
return SendClientMessage (playerid, 0xFF0000FF, "You don't have an object attached to this slot.");
}
if (! var1)
{
TogglePlayerControllable (playerid, false);
glob38C4 [playerid] = 1;
for (new var2 = 0; var2 <15; var2 ++)
{
TextDrawShowForPlayer (playerid, glob4864 [var2]);
SelectTextDraw (playerid, 2746533375);
}
}
else
{
SetPlayerAttachedObject (playerid, glob48A0 [playerid] [var0] [1], glob48A0 [playerid] [var0] [0], glob48A0 [playerid] [var0] [2], glob48A0 [playerid] [var0] [3], glob48A0 [ playerid] [var0] [4], glob48A0 [playerid] [var0] [5], glob48A0 [playerid] [var0] [6], glob48A0 [playerid] [var0] [7], glob48A0 [playerid] [var0] [ 8], glob48A0 [playerid] [var0] [9], glob48A0 [playerid] [var0] [10], glob48A0 [playerid] [var0] [11], 0, 0);
EditAttachedObject (playerid, glob48A0 [playerid] [var0] [1]);
}
EditAttachedObject (playerid, arg3);
new var2 [64];
format (var2, 64, "You are now editing the object in slot% d.", arg3);
SendClientMessage (playerid, 0x33AA33AA, var2);
}
return 1;
}
if (arg1 == 2021)
{
if (! arg2)
{
return 1;
}
switch (arg3) {
case 0:
for (new var0 = 0; var0 <10; var0 ++)
{
if (glob48A0 [playerid] [var0] [0])
{
RemovePlayerAttachedObject (playerid, var0);
}
glob48A0 [playerid] [var0] [0] = 0;
}
SendClientMessage (playerid, 0x33AA33AA, "All object deleted.");
case 6:
case 7:
case 8:
case 9:
case 5:
case 3:
case 4:
case 1:
case 2:
case 10:
if (! glob48A0 [playerid] [arg3 - 1] [0])
{
return SendClientMessage (playerid, 0xFF0000FF, "You don't have an object attached to this slot.");
}
glob48A0 [playerid] [arg3 - 1] [0] = 0;
if (IsPlayerAttachedObjectSlotUsed (playerid, arg3 - 1))
{
RemovePlayerAttachedObject (playerid, arg3 - 1);
}
new var0 [64];
format (var0, 64, "You deleted the object in slot% d.", arg3 - 1);
SendClientMessage (playerid, 0xFF0000FF, var0);
}
return 1;
}
if (arg1 == 2022)
{
if (! arg2)
{
return 1;
}
new var0 = 0;
new var1 = GetPVarInt (playerid, 554440);
if (! glob2924 [playerid])
{
return SendClientMessage (playerid, 0xFFFFFFFF, "make sure you choose the position first");
}
if (! strlen (arg4))
{
return SendClientMessage (playerid, 0xFFFFFFFF, "make sure you enter the correct coordinates first");
}
if (sscanf (arg4, 554880, var0))
{
return SendClientMessage (playerid, 0xFFFFFFFF, "make sure you enter the correct coordinates first");
}
if (glob2924 [playerid] == 1)
{
glob48A0 [playerid] [var1] [3] = var0;
SetPlayerAttachedObject (playerid, glob48A0 [playerid] [var1] [1], glob48A0 [playerid] [var1] [0], glob48A0 [playerid] [var1] [2], glob48A0 [playerid] [var1] [3], glob48A0 [ playerid] [var1] [4], glob48A0 [playerid] [var1] [5], glob48A0 [playerid] [var1] [6], glob48A0 [playerid] [var1] [7], glob48A0 [playerid] [var1] [ 8], glob48A0 [playerid] [var1] [9], glob48A0 [playerid] [var1] [10], glob48A0 [playerid] [var1] [11], 0, 0);
}
if (glob2924 [playerid] == 2)
{
glob48A0 [playerid] [var1] [4] = var0;
SetPlayerAttachedObject (playerid,glob48A0 [playerid] [var1] [1], glob48A0 [playerid] [var1] [0], glob48A0 [playerid] [var1] [2], glob48A0 [playerid] [var1] [3], glob48A0 [playerid] [var1 ] [4], glob48A0 [playerid] [var1] [5], glob48A0 [playerid] [var1] [6], glob48A0 [playerid] [var1] [7], glob48A0 [playerid] [var1] [8], glob48A0 [playerid] [var1] [9], glob48A0 [playerid] [var1] [10], glob48A0 [playerid] [var1] [11], 0, 0);
}
if (glob2924 [playerid] == 3)
{
glob48A0 [playerid] [var1] [5] = var0;
SetPlayerAttachedObject (playerid, glob48A0 [playerid] [var1] [1], glob48A0 [playerid] [var1] [0], glob48A0 [playerid] [var1] [2], glob48A0 [playerid] [var1] [3], glob48A0 [ playerid] [var1] [4], glob48A0 [playerid] [var1] [5], glob48A0 [playerid] [var1] [6], glob48A0 [playerid] [var1] [7], glob48A0 [playerid] [var1] [ 8], glob48A0 [playerid] [var1] [9], glob48A0 [playerid] [var1] [10], glob48A0 [playerid] [var1] [11], 0, 0);
}
if (glob2924 [playerid] == 4)
{
glob48A0 [playerid] [var1] [6] = var0;
SetPlayerAttachedObject (playerid, glob48A0 [playerid] [var1] [1], glob48A0 [playerid] [var1] [0], glob48A0 [playerid] [var1] [2], glob48A0 [playerid] [var1] [3], glob48A0 [ playerid] [var1] [4], glob48A0 [playerid] [var1] [5], glob48A0 [playerid] [var1] [6], glob48A0 [playerid] [var1] [7], glob48A0 [playerid] [var1] [ 8], glob48A0 [playerid] [var1] [9], glob48A0 [playerid] [var1] [10], glob48A0 [playerid] [var1] [11], 0, 0);
}
if (glob2924 [playerid] == 5)
{
glob48A0 [playerid] [var1] [7] = var0;
SetPlayerAttachedObject (playerid, glob48A0 [playerid] [var1] [1], glob48A0 [playerid] [var1] [0], glob48A0 [playerid] [var1] [2], glob48A0 [playerid] [var1] [3], glob48A0 [ playerid] [var1] [4], glob48A0 [playerid] [var1] [5], glob48A0 [playerid] [var1] [6], glob48A0 [playerid] [var1] [7], glob48A0 [playerid] [var1] [ 8], glob48A0 [playerid] [var1] [9], glob48A0 [playerid] [var1] [10], glob48A0 [playerid] [var1] [11], 0, 0);
}
if (glob2924 [playerid] == 6)
{
glob48A0 [playerid] [var1] [8] = var0;
SetPlayerAttachedObject (playerid, glob48A0 [playerid] [var1] [1], glob48A0 [playerid] [var1] [0], glob48A0 [playerid] [var1] [2], glob48A0 [playerid] [var1] [3], glob48A0 [ playerid] [var1] [4], glob48A0 [playerid] [var1] [5], glob48A0 [playerid] [var1] [6], glob48A0 [playerid] [var1] [7], glob48A0 [playerid] [var1] [ 8], glob48A0 [playerid] [var1] [9], glob48A0 [playerid] [var1] [10], glob48A0 [playerid] [var1] [11], 0, 0);
}
if (glob2924 [playerid] == 7)
{
glob48A0 [playerid] [var1] [9] = var0;
SetPlayerAttachedObject (playerid, glob48A0 [playerid] [var1] [1], glob48A0 [playerid] [var1] [0], glob48A0 [playerid] [var1] [2], glob48A0 [playerid] [var1] [3], glob48A0 [ playerid] [var1] [4], glob48A0 [playerid] [var1] [5], glob48A0 [playerid] [var1] [6], glob48A0 [playerid] [var1] [7], glob48A0 [playerid] [var1] [ 8], glob48A0 [playerid] [var1] [9], glob48A0 [playerid] [var1] [10], glob48A0 [playerid] [var1] [11], 0, 0);
}
if (glob2924 [playerid] == 8)
{
glob48A0 [playerid] [var1] [10] = var0;
SetPlayerAttachedObject (playerid, glob48A0 [playerid] [var1] [1], glob48A0 [playerid] [var1] [0], glob48A0 [playerid] [var1] [2], glob48A0 [playerid] [var1] [3], glob48A0 [ playerid] [var1] [4], glob48A0 [playerid] [var1] [5], glob48A0 [playerid] [var1] [6], glob48A0 [playerid] [var1] [7], glob48A0 [playerid] [var1] [ 8], glob48A0 [playerid] [var1] [9], glob48A0 [playerid] [var1] [10], glob48A0 [playerid] [var1] [11], 0, 0);
}
if (glob2924 [playerid] == 9)
{
glob48A0 [playerid] [var1] [11] = var0;
SetPlayerAttachedObject (playerid, glob48A0 [playerid] [var1] [1], glob48A0 [playerid] [var1] [0], glob48A0 [playerid] [var1] [2], glob48A0 [playerid] [var1] [3], glob48A0 [ playerid] [var1] [4], glob48A0 [playerid] [var1] [5], glob48A0 [playerid] [var1] [6], glob48A0 [playerid] [var1] [7], glob48A0 [playerid] [var1] [ 8], glob48A0 [playerid] [var1] [9], glob48A0 [playerid] [var1] [10], glob48A0 [playerid] [var1] [11], 0, 0);
}
new var2 [250];
format (var2, 250, "px:% f, py:% f, pz:% f rx:% f, ry:% f, rz:% f ux:% f, uy:% f, uz:% f" , glob48A0 [playerid] [var1] [3], glob48A0 [playerid] [var1] [4], glob48A0 [playerid] [var1] [5], glob48A0 [playerid] [var1] [6], glob48A0 [playerid] [ var1] [7], glob48A0 [playerid] [var1] [8], glob48A0 [playerid] [var1] [9], glob48A0 [playerid] [var1] [10], glob48A0 [playerid] [var1] [11]) ;
TextDrawSetString (glob4864 [14], var2);
return 1;
}
if (arg1 == 2023)
{
if (! arg2)
{
return 1;
}
switch (arg3) {
case 0:
case 5:
case 6:
case 7:
case 8:
case 4:
case 2:
case 3:
case 1:
case 9:
if (glob48A0 [playerid] [arg3] [0])
{
return SendClientMessage (playerid, 0xFFFFFFFF, "You already have an object attached to this slot. Use [/ clearattach].");
}
new var0 [20], var1 [64];
SetPVarInt (playerid, 555624, arg3);
format (var0, 20, "Slot Editing:% d", GetPVarInt (playerid, 555744));
format (var1, 64, "Type the ID of the object you want to edit for slot% d", GetPVarInt (playerid, 555996));
ShowPlayerDialog (playerid, 2024, 1, var0, var1, 556048, 556076);
SetPVarInt (playerid, 556108, 0);
}
return 1;
}
if (arg1 == 2024)
{
if (! arg2)
{
return DeletePVar (playerid, 556196);
}
switch (GetPVarInt (playerid, 556240)) {
case 0:
GetPVarInt (playerid, 556240);
if ((! arg4 || (arg4 ==1 &&! (Arg4 + 4))) || strval (arg4) <0)
{
return SendClientMessage (playerid, 0xFF0000FF, "Invalid Objectid");
}
SetPVarInt (playerid, 556376, strval (arg4));
SetPVarInt (playerid, 556412, 1);
ShowPlayerDialog (playerid, 2024, 2, 556464, 556516, 557304, 557328);
case 1:
switch (arg3) {
case 0:
case 11:
case 10:
case 9:
case 12:
case 14:
case 13:
case 15:
case 16:
case 8:
case 6:
case 2:
case 1:
case 7:
case 3:
case 5:
case 4:
case 17:
SetPVarInt (playerid, 557352, arg3 + 1);
SetPVarInt (playerid, 557396, 2);
ShowPlayerDialog (playerid, 2024, 0, 557448, 557520, 557716, 557728);
}
case 2:
new var0 = GetPVarInt (playerid, 557752);
new var1 = GetPVarInt (playerid, 557804);
glob48A0 [playerid] [var0] [0] = GetPVarInt (playerid, 557848);
glob48A0 [playerid] [var0] [1] = GetPVarInt (playerid, 557884);
glob48A0 [playerid] [var0] [2] = GetPVarInt (playerid, 557936);
glob48A0 [playerid] [var0] [3] = 0;
glob48A0 [playerid] [var0] [4] = 0;
glob48A0 [playerid] [var0] [5] = 0;
glob48A0 [playerid] [var0] [6] = 0;
glob48A0 [playerid] [var0] [7] = 0;
glob48A0 [playerid] [var0] [8] = 0;
glob48A0 [playerid] [var0] [9] = 1065353216;
glob48A0 [playerid] [var0] [10] = 1065353216;
glob48A0 [playerid] [var0] [11] = 1065353216;
if (! var1)
{
TogglePlayerControllable (playerid, false);
glob38C4 [playerid] = 1;
for (new var2 = 0; var2 <15; var2 ++)
{
TextDrawShowForPlayer (playerid, glob4864 [var2]);
SelectTextDraw (playerid, 2746533375);
}
}
else
{
SetPlayerAttachedObject (playerid, glob48A0 [playerid] [var0] [1], glob48A0 [playerid] [var0] [0], glob48A0 [playerid] [var0] [2], glob48A0 [playerid] [var0] [3], glob48A0 [ playerid] [var0] [4], glob48A0 [playerid] [var0] [5], glob48A0 [playerid] [var0] [6], glob48A0 [playerid] [var0] [7], glob48A0 [playerid] [var0] [ 8], glob48A0 [playerid] [var0] [9], glob48A0 [playerid] [var0] [10], glob48A0 [playerid] [var0] [11], 0, 0);
EditAttachedObject (playerid, glob48A0 [playerid] [var0] [1]);
}
}
return 1;
}
return 1;
}

public OnPlayerEditAttachedObject (playerid, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13)
{
switch (arg1) {
case 0:
glob48A0 [playerid] [arg2] [0] = 0;
glob48A0 [playerid] [arg2] [2] = 0;
glob48A0 [playerid] [arg2] [1] = 0;
if (IsPlayerAttachedObjectSlotUsed (playerid, arg2))
{
RemovePlayerAttachedObject (playerid, arg2);
}
SendClientMessage (playerid, 0x33AA33AA, "Object not saved.");
case 1:
glob48A0 [playerid] [arg2] [3] = arg5;
glob48A0 [playerid] [arg2] [4] = arg6;
glob48A0 [playerid] [arg2] [5] = arg7;
glob48A0 [playerid] [arg2] [6] = arg8;
glob48A0 [playerid] [arg2] [7] = arg9;
glob48A0 [playerid] [arg2] [8] = arg10;
glob48A0 [playerid] [arg2] [9] = arg11;
glob48A0 [playerid] [arg2] [10] = arg12;
glob48A0 [playerid] [arg2] [11] = arg13;
if (IsPlayerAttachedObjectSlotUsed (playerid, arg2))
{
RemovePlayerAttachedObject (playerid, arg2);
}
SetPlayerAttachedObject (playerid, glob48A0 [playerid] [arg2] [1], glob48A0 [playerid] [arg2] [0], glob48A0 [playerid] [arg2] [2], glob48A0 [playerid] [arg2] [3], glob48A0 [ playerid] [arg2] [4], glob48A0 [playerid] [arg2] [5], glob48A0 [playerid] [arg2] [6], glob48A0 [playerid] [arg2] [7], glob48A0 [playerid] [arg2] [ 8], glob48A0 [playerid] [arg2] [9], glob48A0 [playerid] [arg2] [10], glob48A0 [playerid] [arg2] [11], 0, 0);
SendClientMessage (playerid, 0x33AA33AA, "Object saved.");
}
return 1;
}

public OnPlayerClickTextDraw (playerid, arg1)
{
if (65535! = arg1)
{
new var0 [600];
new var1 = GetPVarInt (playerid, 558132);
SetPlayerAttachedObject (playerid, glob48A0 [playerid] [var1] [1], glob48A0 [playerid] [var1] [0], glob48A0 [playerid] [var1] [2], glob48A0 [playerid] [var1] [3], glob48A0 [ playerid] [var1] [4], glob48A0 [playerid] [var1] [5], glob48A0 [playerid] [var1] [6], glob48A0 [playerid] [var1] [7], glob48A0 [playerid] [var1] [ 8], glob48A0 [playerid] [var1] [9], glob48A0 [playerid] [var1] [10], glob48A0 [playerid] [var1] [11], 0, 0);
format (var0, 600, "px:% f, py:% f, pz:% f rx:% f, ry:% f, rz:% f ux:% f, uy:% f, uz:% f" , glob48A0 [playerid] [var1] [3], glob48A0 [playerid] [var1] [4], glob48A0 [playerid] [var1] [5], glob48A0 [playerid] [var1] [6], glob48A0 [playerid] [ var1] [7], glob48A0 [playerid] [var1] [8], glob48A0 [playerid] [var1] [9], glob48A0 [playerid] [var1] [10], glob48A0 [playerid] [var1] [11]) ;
TextDrawSetString (glob4864 [14], var0);
if (arg1 == glob4864 [4])
{
if (! glob2924 [playerid])
{
return SendClientMessage (playerid, 0xFFFFFFFF, "make sure you choose the position first");
}
ShowPlayerDialog (playerid, 2022, 1, 558576, 558648, 558828, 558856);
}
if (arg1 == glob4864 [5])
{
TogglePlayerControllable (playerid, true);
SetCameraBehindPlayer (playerid);
for (new var2 = 0; var2 <15; var2 ++)
{
TextDrawHideForPlayer (playerid, glob4864 [var2]);
}
CancelSelectTextDraw (playerid);
glob38C4 [playerid] = 0;
}
if (arg1 == glob4864 [6]){
if (! glob2924 [playerid])
{
return function15B0C (playerid);
}
if (glob2924 [playerid] == 1)
{
return function15B0C (playerid);
}
if (glob2924 [playerid] == 2)
{
return function15B0C (playerid);
}
if (glob2924 [playerid] == 3)
{
return function15B0C (playerid);
}
if (glob2924 [playerid] == 4)
{
return function15B0C (playerid);
}
if (glob2924 [playerid] == 5)
{
return function15B0C (playerid);
}
if (glob2924 [playerid] == 6)
{
return function15B0C (playerid);
}
if (glob2924 [playerid] == 7)
{
return function15B0C (playerid);
}
if (glob2924 [playerid] == 8)
{
return function15B0C (playerid);
}
if (glob2924 [playerid] == 9)
{
return function15B0C (playerid);
}
}
if (arg1 == glob4864 [7])
{
if (! glob2924 [playerid])
{
return function15B0C (playerid);
}
if (glob2924 [playerid] == 1)
{
return function15B0C (playerid);
}
if (glob2924 [playerid] == 2)
{
return function15B0C (playerid);
}
if (glob2924 [playerid] == 3)
{
return function15B0C (playerid);
}
if (glob2924 [playerid] == 4)
{
return function15B0C (playerid);
}
if (glob2924 [playerid] == 5)
{
return function15B0C (playerid);
}
if (glob2924 [playerid] == 6)
{
return function15B0C (playerid);
}
if (glob2924 [playerid] == 7)
{
return function15B0C (playerid);
}
if (glob2924 [playerid] == 8)
{
return function15B0C (playerid);
}
if (glob2924 [playerid] == 9)
{
return function15B0C (playerid);
}
}
if (arg1 == glob4864 [10])
{
cmd_tkiri (playerid, 558860);
}
if (arg1 == glob4864 [11])
{
cmd_tkanan (playerid, 558864);
}
if (arg1 == glob4864 [12])
{
cmd_tatas (playerid, 558868);
}
if (arg1 == glob4864 [13])
{
cmd_tbawah (playerid, 558872);
}
}
return 1;
}

function15B0C (arg0)
{
new var0 = glob2924 [arg0];
new var1 [15];
switch (var0) {
case 0:
format (var1, 15, "P");
case 1:
format (var1, 15, "PX");
case 2:
format (var1, 15, "PY");
case 3:
format (var1, 15, "PZ");
case 4:
format (var1, 15, "RX");
case 5:
format (var1, 15, "RY");
case 6:
format (var1, 15, "RZ");
case 7:
format (var1, 15, "SX");
case 8:
format (var1, 15, "SY");
case 9:
format (var1, 15, "SZ");
}
TextDrawSetString (glob4864 [3], var1);
switch (var0) {
case 0:
format (var1, 15, "POSITION");
case 1:
format (var1, 15, "X POSITION");
case 2:
format (var1, 15, "Y POSITION");
case 3:
format (var1, 15, "Z POSITION");
case 4:
format (var1, 15, "X ROTATION");
case 5:
format (var1, 15, "Y ROTATION");
case 6:
format (var1, 15, "Z ROTATION");
case 7:
format (var1, 15, "SCALE X");
case 8:
format (var1, 15, "ONLY Y");
case 9:
format (var1, 15, "SCALE Z");
}
TextDrawSetString (glob4864 [4], var1);
return 1;
}

function16180 ()
{
glob4864 [0] = TextDrawCreate (40.0, 205.0, "box");
TextDrawLetterSize (glob4864 [0], 0.0, 18.3999);
TextDrawTextSize (glob4864 [0], 216.0, 0.0);
TextDrawAlignment (glob4864 [0], 1);
TextDrawColor (glob4864 [0], 0x808080FF);
TextDrawUseBox (glob4864 [0], true);
TextDrawBoxColor (glob4864 [0], 0x0000005F);
TextDrawSetShadow (glob4864 [0], 0);
TextDrawSetOutline (glob4864 [0], 0);
TextDrawBackgroundColor (glob4864 [0], 0xC0C0C0FF);
TextDrawFont (glob4864 [0], 1);
TextDrawSetProportional (glob4864 [0], true);
TextDrawSetShadow (glob4864 [0], 0);
glob4864 [1] = TextDrawCreate (60.3999, 337.0936, "box");
TextDrawLetterSize (glob4864 [1], 0.0, 1.76);
TextDrawTextSize (glob4864 [1], 198.0, 0.0);
TextDrawAlignment (glob4864 [1], 1);
TextDrawColor (glob4864 [1], 0x0000005F);
TextDrawUseBox (glob4864 [1], true);
TextDrawBoxColor (glob4864 [1], 0x0000005F);
TextDrawSetShadow (glob4864 [1], 0);
TextDrawSetOutline (glob4864 [1], 0);
TextDrawBackgroundColor (glob4864 [1], 0x0000005F);
TextDrawFont (glob4864 [1], 2);
TextDrawSetProportional (glob4864 [1], true);
TextDrawSetShadow (glob4864 [1], 0);
glob4864 [2] = TextDrawCreate (127.4999, 199.2066, "Set Coordinates");
TextDrawLetterSize (glob4864 [2], 0.4, 1.6);
TextDrawTextSize (glob4864 [2], 0.0, 140.0);
TextDrawAlignment (glob4864 [2], 2);
TextDrawColor (glob4864 [2], 0xFFFFFFFF);
TextDrawUseBox (glob4864 [2], true);
TextDrawBoxColor (glob4864 [2], 0x000000FF);
TextDrawSetShadow (glob4864 [2], 0);
TextDrawSetOutline (glob4864 [2], 0);
TextDrawBackgroundColor (glob4864 [2], 0x000000FF);
TextDrawFont (glob4864 [2], 2);
TextDrawSetProportional (glob4864 [2], true);
TextDrawSetShadow (glob4864 [2], 0);
glob4864 [3] = TextDrawCreate (126.8, 239.6, "?");
TextDrawLetterSize (glob4864 [3], 0.8111, 2.481);
TextDrawTextSize (glob4864 [3], 0.0, 36.0);
TextDrawAlignment (glob4864 [3], 2);
TextDrawColor (glob4864 [3], 0xFFFFFFFF);
TextDrawUseBox (glob4864 [3], true);
TextDrawBoxColor (glob4864 [3], 0x0000005A);
TextDrawSetShadow (glob4864 [3], 0);
TextDrawSetOutline (glob4864 [3], 0);
TextDrawBackgroundColor (glob4864 [3], 0x00005A5A);
TextDrawFont (glob4864 [3], 1);
TextDrawSetProportional (glob4864 [3], true);
TextDrawSetShadow (glob4864 [3], 0);
glob4864 [4] = TextDrawCreate (130.4, 295.5267, "Change_Coordinate");
TextDrawLetterSize (glob4864 [4], 0.4, 1.6);
TextDrawTextSize (glob4864 [4], 15.0, 140.0);
TextDrawAlignment (glob4864 [4], 2);
TextDrawColor (glob4864 [4], 0xFFFFFFFF);
TextDrawUseBox (glob4864 [4], true);
TextDrawBoxColor (glob4864 [4], 0x0000005F);
TextDrawSetShadow (glob4864 [4], 0);
TextDrawSetOutline (glob4864 [4], 0);
TextDrawBackgroundColor (glob4864 [4], 0x0000005F);
TextDrawFont (glob4864 [4], 2);
TextDrawSetProportional (glob4864 [4], true);
TextDrawSetShadow (glob4864 [4], 0);
TextDrawSetSelectable (glob4864 [4], 1);
glob4864 [5] = TextDrawCreate (130.4, 336.5292, "Save");
TextDrawLetterSize (glob4864 [5], 0.4, 1.6);
TextDrawTextSize (glob4864 [5], 30.0, 35.0);
TextDrawAlignment (glob4864 [5], 2);
TextDrawColor (glob4864 [5], 0xFFFFFFFF);
TextDrawSetShadow (glob4864 [5], 0);
TextDrawSetOutline (glob4864 [5], 0);
TextDrawBackgroundColor (glob4864 [5], 0x0000005F);
TextDrawFont (glob4864 [5], 2);
TextDrawSetProportional (glob4864 [5], true);
TextDrawSetShadow (glob4864 [5], 0);
TextDrawSetSelectable (glob4864 [5], 1);
glob4864 [6] = TextDrawCreate (173.3999, 233.5266, "LD_BEAT: right");
TextDrawLetterSize (glob4864 [6], 0.0, 0.0);
TextDrawTextSize (glob4864 [6], 39.0, 42.0);
TextDrawAlignment (glob4864 [6], 1);
TextDrawColor (glob4864 [6], 0xFFFFFFFF);
TextDrawSetShadow (glob4864 [6], 0);
TextDrawSetOutline (glob4864 [6], 0);
TextDrawBackgroundColor (glob4864 [6], 0x000000FF);
TextDrawFont (glob4864 [6], 4);
TextDrawSetProportional (glob4864 [6], false);
TextDrawSetShadow (glob4864 [6], 0);
TextDrawSetSelectable (glob4864 [6], 1);
glob4864 [7] = TextDrawCreate (42.9687, 232.8465, "LD_BEAT: left");
TextDrawLetterSize (glob4864 [7], 0.0, 0.0);
TextDrawTextSize (glob4864 [7], 39.0, 42.0);
TextDrawAlignment (glob4864 [7], 1);
TextDrawColor (glob4864 [7], 0xFFFFFFFF);
TextDrawSetShadow (glob4864 [7], 0);
TextDrawSetOutline (glob4864 [7], 0);
TextDrawBackgroundColor (glob4864 [7], 0x000000FF);
TextDrawFont (glob4864 [7], 4);
TextDrawSetProportional (glob4864 [7], false);
TextDrawSetShadow (glob4864 [7], 0);
TextDrawSetSelectable (glob4864 [7], 1);
glob4864 [8] = TextDrawCreate (444.4001, 204.1866, "box");
TextDrawLetterSize (glob4864 [8], 0.0, 18.3199);
TextDrawTextSize (glob4864 [8], 574.0, 0.0);
TextDrawAlignment (glob4864 [8], 1);
TextDrawColor (glob4864 [8], 0xFFFFFFFF);
TextDrawUseBox (glob4864 [8], true);
TextDrawBoxColor (glob4864 [8], 0x0000005A);
TextDrawSetShadow (glob4864 [8], 0);
TextDrawSetOutline (glob4864 [8], 0);
TextDrawBackgroundColor (glob4864 [8], 0x000000FF);
TextDrawFont (glob4864 [8], 1);
TextDrawSetProportional (glob4864 [8], true);
TextDrawSetShadow (glob4864 [8], 0);
glob4864 [9] = TextDrawCreate (509.5998, 192.2398, "Set position");
TextDrawLetterSize (glob4864 [9], 0.4, 1.6);
TextDrawTextSize (glob4864 [9], 0.0, 106.0);
TextDrawAlignment (glob4864 [9], 2);
TextDrawColor (glob4864 [9], 0xFFFFFFFF);
TextDrawUseBox (glob4864 [9], true);
TextDrawBoxColor (glob4864 [9], 0x000000FF);
TextDrawSetShadow (glob4864 [9], 0);
TextDrawSetOutline (glob4864 [9], 0);
TextDrawBackgroundColor (glob4864 [9], 0x000000FF);
TextDrawFont (glob4864 [9], 2);
TextDrawSetProportional (glob4864 [9], true);
TextDrawSetShadow (glob4864 [9], 0);
glob4864 [10] = TextDrawCreate (448.5687, 270.1799, "LD_BEAT: left");
TextDrawLetterSize (glob4864 [10], 0.0, 0.0);
TextDrawTextSize (glob4864 [10], 39.0, 42.0);
TextDrawAlignment (glob4864 [10], 1);
TextDrawColor (glob4864 [10], 0xFFFFFFFF);
TextDrawSetShadow (glob4864 [10], 0);
TextDrawSetOutline (glob4864 [10], 0);
TextDrawBackgroundColor (glob4864 [10], 0x000000FF);
TextDrawFont (glob4864 [10], 4);
TextDrawSetProportional (glob4864 [10], false);
TextDrawSetShadow (glob4864 [10], 0);
TextDrawSetSelectable (glob4864 [10], 1);
glob4864 [11] = TextDrawCreate (533.2682, 271.48, "LD_BEAT: right");
TextDrawLetterSize (glob4864 [11], 0.0, 0.0);
TextDrawTextSize (glob4864 [11], 39.0, 42.0);
TextDrawAlignment (glob4864 [11], 1);
TextDrawColor (glob4864 [11], 0xFFFFFFFF);
TextDrawSetShadow (glob4864 [11], 0);
TextDrawSetOutline (glob4864 [11], 0);
TextDrawBackgroundColor (glob4864 [11], 0x000000FF);
TextDrawFont (glob4864 [11], 4);
TextDrawSetProportional (glob4864 [11], false);
TextDrawSetShadow (glob4864 [11], 0);
TextDrawSetSelectable (glob4864 [11], 1);
glob4864 [12] = TextDrawCreate (491.6001, 309.7796, "LD_BEAT: down");
TextDrawLetterSize (glob4864 [12], 0.0, 0.0);
TextDrawTextSize (glob4864 [12], 39.0, 42.0);
TextDrawAlignment (glob4864 [12], 1);
TextDrawColor (glob4864 [12], 0xFFFFFFFF);
TextDrawSetShadow (glob4864 [12], 0);
TextDrawSetOutline (glob4864 [12], 0);
TextDrawBackgroundColor (glob4864 [12], 0x000000FF);
TextDrawFont (glob4864 [12], 4);
TextDrawSetProportional (glob4864 [12], false);
TextDrawSetShadow (glob4864 [12], 0);
TextDrawSetSelectable (glob4864 [12], 1);
glob4864 [13] = TextDrawCreate (490.0685, 226.6799, "LD_BEAT: up");
TextDrawLetterSize (glob4864 [13], 0.0, 0.0);
TextDrawTextSize (glob4864 [13], 39.0, 42.0);
TextDrawAlignment (glob4864 [13], 1);
TextDrawColor (glob4864 [13], 0xFFFFFFFF);
TextDrawSetShadow (glob4864 [13], 0);
TextDrawSetOutline (glob4864 [13], 0);
TextDrawBackgroundColor (glob4864 [13], 0x000000FF);
TextDrawFont (glob4864 [13], 4);
TextDrawSetProportional (glob4864 [13], false);
TextDrawSetShadow (glob4864 [13], 0);
TextDrawSetSelectable (glob4864 [13], 1);
glob4864 [14] = TextDrawCreate (325.1998, 396.0799, "px = 0.000000, py = 0.000000, pz = 0.000000 rx = 0.000000, ry = 0.000000, rz = 0.000000 ux = 0.000000, uy = 0.000000, uz = 0.000000");
TextDrawLetterSize (glob4864 [14], 0.4, 1.6);
TextDrawTextSize (glob4864 [14], 0.0, 296.0);
TextDrawAlignment (glob4864 [14], 2);
TextDrawColor (glob4864 [14], 0xADD8E6FF);
TextDrawUseBox (glob4864 [14], true);
TextDrawBoxColor (glob4864 [14], 0x0000005F);
TextDrawSetShadow (glob4864 [14], 0);
TextDrawSetOutline (glob4864 [14], 0);
TextDrawBackgroundColor (glob4864 [14], 0x0000005F);
TextDrawFont (glob4864 [14], 3);
TextDrawSetProportional (glob4864 [14], true);
TextDrawSetShadow (glob4864 [14], 0);
return 1;
}
