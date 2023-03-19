script for setting sound on a player boombox in GTA SAMP:

pawn
Copy code
#define MAX_BOOMBOXES 100 // Maximum number of boomboxes allowed in the server

new boomboxes[MAX_BOOMBOXES][3]; // Array to store the boomboxes' information: x, y, and z positions
new boomboxObjects[MAX_BOOMBOXES]; // Array to store the boombox objects' IDs

const BOOMBOX_MODEL = 2101; // Model ID for the boombox object
const BOOMBOX_SOUND_VOLUME = 1.0; // Volume of the sound played by the boombox

// Function to spawn a new boombox object at the specified position and store its information
stock SpawnBoombox(Float:x, Float:y, Float:z)
{
    new boomboxID = CreateObject(BOOMBOX_MODEL, x, y, z, 0.0, 0.0, 0.0, BOOMBOX_SOUND_VOLUME);
    if(boomboxID != INVALID_OBJECT_ID)
    {
        new boomboxIndex = -1;
        for(new i = 0; i < MAX_BOOMBOXES; i++)
        {
            if(boomboxes[i][0] == 0.0 && boomboxes[i][1] == 0.0 && boomboxes[i][2] == 0.0)
            {
                boomboxIndex = i;
                break;
            }
        }
        if(boomboxIndex != -1)
        {
            boomboxes[boomboxIndex][0] = x;
            boomboxes[boomboxIndex][1] = y;
            boomboxes[boomboxIndex][2] = z;
            boomboxObjects[boomboxIndex] = boomboxID;
            return boomboxIndex;
        }
        else
        {
            DestroyObject(boomboxID);
        }
    }
    return -1;
}

// Function to destroy a boombox object and remove its information from the arrays
stock DestroyBoombox(new boomboxIndex)
{
    if(boomboxIndex >= 0 && boomboxIndex < MAX_BOOMBOXES)
    {
        DestroyObject(boomboxObjects[boomboxIndex]);
        boomboxes[boomboxIndex][0] = 0.0;
        boomboxes[boomboxIndex][1] = 0.0;
        boomboxes[boomboxIndex][2] = 0.0;
        boomboxObjects[boomboxIndex] = INVALID_OBJECT_ID;
        return 1;
    }
    return 0;
}

// Function to set the sound of a boombox object at the specified index
stock SetBoomboxSound(new boomboxIndex, new soundURL[])
{
    if(boomboxIndex >= 0 && boomboxIndex < MAX_BOOMBOXES)
    {
        SetObjectMaterialText(boomboxObjects[boomboxIndex], soundURL, 0, OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 0, 0, 0, 0xFFFFFFFF, 0xFFFFFFFF, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
        return 1;
    }
    return 0;
}

// Callback function to handle player commands
public OnPlayerCommandText(playerid, cmdtext[])
{
    if(!strcmp(cmdtext, "/boombox"))
    {
        new boomboxIndex = SpawnBoombox(GetPlayerPos(playerid));
        if(boomboxIndex != -1)
        {
            SendClientMessage(playerid, -1, "You have spawned a boombox.");
        }
        else
        {
            SendClientMessage(playerid, -1, "The server has reached the maximum number of boomboxes.");
        }
       
pawn
Copy code
    }
    else if(sscanf(cmdtext, "/setboomboxsound %d %s", boomboxIndex, soundURL) == 2)
    {
        if(SetBoomboxSound(boomboxIndex, soundURL))
        {
            SendClientMessage(playerid, -1, "The sound of the boombox has been set.");
        }
        else
        {
            SendClientMessage(playerid, -1, "The specified boombox does not exist.");
        }
    }
    else if(!strcmp(cmdtext, "/removeboombox"))
    {
        new boomboxIndex = -1;
        new boomboxDist = 100000.0; // Set an initial distance that is high enough to ensure that any boombox will be closer
        for(new i = 0; i < MAX_BOOMBOXES; i++)
        {
            if(boomboxes[i][0] != 0.0 && boomboxes[i][1] != 0.0 && boomboxes[i][2] != 0.0)
            {
                new dist = GetDistance3D(GetPlayerPos(playerid), boomboxes[i][0], boomboxes[i][1], boomboxes[i][2]);
                if(dist < boomboxDist)
                {
                    boomboxIndex = i;
                    boomboxDist = dist;
                }
            }
        }
        if(boomboxIndex != -1)
        {
            DestroyBoombox(boomboxIndex);
            SendClientMessage(playerid, -1, "The nearest boombox has been removed.");
        }
        else
        {
            SendClientMessage(playerid, -1, "There are no boomboxes in the server.");
        }
    }
    return 1;
}
This script allows players to use the "/boombox" command to spawn a new boombox object at their current position. The script also limits the number of boomboxes that can exist in the server to a maximum of 100.

Players can then use the "/setboomboxsound" command to set the sound of a boombox object at a specific index to a URL that points to a sound file. The sound file must be in MP3 format and accessible over the internet. The script uses the SetObjectMaterialText function to set the texture of the boombox object to the specified URL.

Finally, players can use the "/removeboombox" command to remove the nearest boombox object to their current position. The script uses the GetDistance3D function to calculate the distance between the player and each boombox object, and removes the one that is closest to the player.

Note that this script does not handle the playback of the sound files, as that would require additional code that depends on the specific sound library used in your server.
