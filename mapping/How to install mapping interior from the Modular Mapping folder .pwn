To install mapping interior from the Modular Mapping folder, you can follow these steps:

Download the Modular Mapping folder from the SA-MP forums or from a mapping website that provides it.
Extract the contents of the folder to your SA-MP server's "scriptfiles" directory.
Open the "scriptfiles" directory and locate the "modular_mapping" folder.
Open the "maps" subdirectory within the "modular_mapping" folder.
Locate the map file for the interior you want to install. The map files are usually named according to the interior ID, such as "interior_1.pwn" for the Jefferson Motel interior.
Copy the map file to your server's "filterscripts" directory.
Open your server's "server.cfg" file and add the name of the map file to the "filterscripts" line. For example:
Copy code
filterscripts mod_map, interior_1
This will load the Modular Mapping script and the interior mapping script when your SA-MP server starts up, allowing players to enter the interior and interact with it.

Note: Make sure to read and follow any instructions or usage notes that may be provided with the Modular Mapping folder or with the specific interior map files you want to install. Some interiors may require additional files or setup steps to work properly.
