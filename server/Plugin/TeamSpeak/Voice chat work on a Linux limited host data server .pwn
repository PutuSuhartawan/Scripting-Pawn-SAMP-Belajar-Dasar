To make voice chat work on a Linux server with a plugin, you can follow these steps:

First, make sure you have the necessary plugins installed for voice chat to work. You can use plugins like Teamspeak, Mumble or Discord to enable voice chat on your server.

Once you have installed the necessary plugins, you will need to configure them to work with your server. This will typically involve creating a server instance and setting up the necessary channels and permissions.

In your server script, you will need to add a command to enable voice chat for players. This command can be used to toggle voice chat on and off for individual players or for the entire server.

You will also need to add a function to your script that will handle incoming voice chat data. This function will typically be called when a player speaks into their microphone and will need to process the audio data and send it to the appropriate channel or player.

Finally, you will need to add a function to your script that will handle outgoing voice chat data. This function will typically be called when a player starts speaking into their microphone and will need to capture the audio data and send it to the appropriate channel or player.

Here's an example script that uses the Teamspeak plugin to enable voice chat on a Linux server:

scss
Copy code
// Load the Teamspeak plugin
loadplugin("teamspeak");

// Enable voice chat for players
CMD:voicechat(playerid, params[])
{
    Teamspeak_EnableVoiceChat(playerid);
    return 1;
}

// Handle incoming voice chat data
public OnPlayerVoiceData(playerid, data[], length)
{
    Teamspeak_HandleIncomingVoiceData(playerid, data, length);
}

// Handle outgoing voice chat data
public OnPlayerVoiceStart(playerid)
{
    Teamspeak_HandleOutgoingVoiceData(playerid);
}

Note that this is just an example script and you will need to modify it to work with your specific plugin and server configuration.
