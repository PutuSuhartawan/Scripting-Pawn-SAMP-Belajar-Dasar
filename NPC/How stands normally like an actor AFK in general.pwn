/*
On top of OnPlayerConnect, OnPlayerRequestSpawn, and OnPlayerSpawn callbacks. Check the player is a NPC, then return 1.
PHP Code:
if(IsPlayerNPC(playerid)) return 1; 
By doing this you are passing the NPC through the login or register.

Issues
at first I managed to make the PLAYER_RECORDING_TYPE_ONFOOT NPC pawn on the server and it matches the .amx and .rec files in the NPC models. But why doesn't the NPC move like it's supposed to be exactly in the .rec file? But this spawned NPC just stands normally like an actor in general, even though if every teleportation to the NPC only changes its position and has become, sometimes the position is like at the beginning of .rec or in the final position .rec so strangely it looks like there is no animation of the path on the NPC. the.
*/
