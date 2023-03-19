To create NPCs in SA-MP, you can use the CreateNPC function, which takes in the following parameters:

pawn
Copy code
CreateNPC(Float:x, Float:y, Float:z, Float:angle)
where x, y, z represent the coordinates of the NPC, and angle represents the angle at which the NPC should be facing.

To assign a unique ID to an NPC, you can create a global variable to keep track of the last NPC ID that was created. Then, you can increment this variable each time you create a new NPC and use it as the NPC ID. Here's an example:

pawn
Copy code
new g_NpcId = 0; // global variable to keep track of last NPC ID

public OnPlayerConnect(playerid)
{
    for (new i = 0; i < MAX_PLAYERS; i++)
    {
        if (!IsPlayerConnected(i)) continue;
        
        // create NPC with unique ID and position
        CreateNPC(100.0, 200.0, 10.0, 180.0);
        g_NpcId++;
        SetNPCName(g_NpcId, "NPC_" + g_NpcId);
        SetNPCWeapon(g_NpcId, 31);
    }
    return 1;
}
In this example, we're creating NPCs for each player that connects to the server. We're also setting the NPC name and weapon using the SetNPCName and SetNPCWeapon functions, respectively. You can customize this code to suit your specific needs.
