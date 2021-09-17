#include <a_samp>
#include <Dini>
#include <sampvoice>

#define IsPlayerAndroid(%0) GetPVarInt(%0, "NotAndroid") == 0
#define function%0(%1) forward %0(%1); public %0(%1)

native SendClientCheck(playerid, type, arg, offset, size);

new SV_LSTREAM:lstream[MAX_PLAYERS] = { SV_NULL, ... };

function OnClientCheckResponse(playerid, type, arg, response)
{
    switch(type)
    {       
        case 0x48:
        {
            SetPVarInt(playerid, "NotAndroid", 1);  
        }
    }
    return 1;
}

function SV_VOID:OnPlayerActivationKeyPress(SV_UINT:playerid, SV_UINT:keyid)
{
    if (keyid == 0x42 && lstream[playerid]) SvAttachSpeakerToStream(lstream[playerid], playerid);
}

function SV_VOID:OnPlayerActivationKeyRelease(SV_UINT:playerid, SV_UINT:keyid)
{
    if (keyid == 0x42 && lstream[playerid]) SvDetachSpeakerFromStream(lstream[playerid], playerid);
}

function FixedKick(playerid)
{
    if (!IsPlayerConnected(playerid)) return 1;
    Kick(playerid);
    return 1;
}

function CheckPermission(playerid)
{
    new name [MAX_PLAYER_NAME], player[200], string[128];
    GetPlayerName(playerid, name, sizeof(name));

    format(player,sizeof(player),"pc/%s.txt", name);
    if (SvGetVersion(playerid) == SV_NULL) 
    {
        if(!dini_Exists(player)) //saat nickname player tidak ada di 'scriptfiles/pc/' maka akan ke kick - aktifkan saja 'FixedKick' nya
        {
            GetPlayerName(playerid, name, sizeof(name));
            format(string, sizeof(string), "[WARNING] %s not used server client.", name);
            SendClientMessageToAll(0xC6E2FFFF, string);
            //SetTimerEx("FixedKick", 1000, false, "i", playerid);
        }
        else
        {
            //pengecekan sebaliknya dapat di set saat player register.
        }
    }
    return 1;
}

public OnPlayerConnect(playerid)
{
    SendClientCheck(playerid, 0x48, 0, 0, 2);
    CheckPermission(playerid); //pengecekan terjadi saat player conect - bisa di ubah saat player register
}

public OnPlayerDisconnect(playerid, reason)
{
    if (lstream[playerid])
    {
        lstream[playerid] = SV_NULL;
    }
}
