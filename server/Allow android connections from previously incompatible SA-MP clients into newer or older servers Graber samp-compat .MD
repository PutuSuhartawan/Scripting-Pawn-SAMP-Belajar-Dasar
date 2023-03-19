https://github.com/AGraber/samp-compat

samp-compat
Allow connections from previously incompatible SA-MP clients into newer or older servers allowing you to have players from 2 versions playing together without additional software

How is it done?
Reverse engineering of the SA-MP server executable was done to get the addresses from functions that process relevant packets, which are then hooked with subhook during the plugin's initialization, and packets from older clients are modified to match the structure of the target server version.

Supported versions:
0.3.7-R2 (both R2-1 and R2-2): Supports clients from 0.3.DL
0.3.DL: Supports clients from 0.3.7 (R1, R2, R3 and R4)
Installation
Simply install to your project:

sampctl package install AGraber/samp-compat
Optionally, include in your code:

#include <compat>
Building
This repo took Southclaws' SA-MP plugin boilerplate, very detailed instructions of building can be found there.

Thanks to
SA-MP server structures provided by contributors of the YSF plugin: files containing this are governed by its MPL 1.1 license
Southclaws for his neat boilerplate
SA-MP Team for making versions incompatible for some reason, allowing me to release this plugin

  o allow players using Android devices to join your SAMP server, you need to install a SAMP client for Android, such as SA-MP Mobile, which is available on the Google Play Store.

Once you have installed the SAMP client on your Android device, you can join your SAMP server using the same IP address and port number that you use to connect from your PC. Note that some servers may have restrictions or limitations on the types of devices that can join, so be sure to check your server's rules and requirements before attempting to join from an Android device.

In terms of scripting, you do not need to make any specific modifications to your gamemode in order to allow Android players to join. The SAMP client for Android is designed to be compatible with standard SAMP servers, and should work with your existing gamemode code without any issues.

However, if you want to provide additional functionality or features specifically for Android players, you can write additional code to detect when a player is using an Android device and adjust the behavior of your gamemode accordingly. For example, you could create a command that is only available to Android players, or modify the display of certain UI elements to be more mobile-friendly.
