Pawn script that can filter bad words and ban users if they exceed a certain number of offenses:

arduino
Copy code
#define MAX_OFFENSES 3
#define APOLOGY_LIMIT 2

new Offenses[MAX_PLAYERS];
new Apologies[MAX_PLAYERS];

forward CheckOffenses(playerid, const message[]);
forward CheckApologies(playerid);

public OnPlayerText(playerid, text[])
{
    if(!IsPlayerAdmin(playerid))
    {
        // Check for bad words
        if(CheckOffenses(playerid, text))
        {
            SendClientMessage(playerid, -1, "You have used a banned word. Please apologize or you will be banned.");
            return 0;
        }
        // Check apology limit
        else if(CheckApologies(playerid))
        {
            SendClientMessage(playerid, -1, "You have apologized too many times. You will be banned if you continue to use bad language.");
            return 0;
        }
    }
    return 1;
}

public CheckOffenses(playerid, const message[])
{
    new badwords[] = {"badword1", "badword2", "badword3"};

    for(new i = 0; i < sizeof(badwords); i++)
    {
        if(strfind(message, badwords[i], false, true) != -1)
        {
            Offenses[playerid]++;
            if(Offenses[playerid] >= MAX_OFFENSES)
            {
                Ban(playerid);
            }
            return true;
        }
    }
    return false;
}

public CheckApologies(playerid)
{
    Apologies[playerid]++;
    if(Apologies[playerid] >= APOLOGY_LIMIT)
    {
        Ban(playerid);
        return true;
    }
    return false;
}
This script works by checking every message that a non-admin player sends for bad words. If a bad word is found, the player's offense count is incremented and they are warned to apologize. If they reach the maximum number of offenses, they are banned from the server. Similarly, if a player apologizes too many times without changing their behavior, they will be banned. Admin players are not subject to this filter.

Note that this is just a basic example and you may want to customize it further to suit your specific needs. Additionally, keep in mind that filtering bad words is a sensitive issue and it's important to be transparent with your players about what words are banned and how the filter works.
