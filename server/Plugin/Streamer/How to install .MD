To install the streamer plugin for your SA-MP server, follow these steps:

Download the latest version of the streamer plugin from the official website: https://github.com/samp-incognito/samp-streamer-plugin/releases

Extract the downloaded archive to a temporary directory.

Copy the streamer.dll file from the extracted directory to your SA-MP server's plugins directory.

Copy the streamer.inc file from the extracted directory to your server's pawno/include directory.

In your server's script, add the following include statement at the top of the script:

arduino
Copy code
#include <streamer.inc>
Compile your script with the new include statement using a PAWN compiler.

Start your SA-MP server and test the streamer plugin by using the Streamer_GetDistanceToPoint function or any other functions provided by the plugin.

Note: Some hosting providers may not allow you to install plugins on your SA-MP server, so make sure to check with your provider first.
