To set the time on your SAMP server using RDP and format it in WIB Indonesia time, you can use the following script:

pawn
Copy code
#include <time>

main()
{
    // Set the time zone to WIB Indonesia
    SetTimeZone("WIB-7");

    // Get the current time
    new time_t:now = time(NULL);
    new tm:local = localtime(now);

    // Set the server time to the current local time
    SetServerTime(local.tm_hour, local.tm_min);

    // Output the current time in WIB Indonesia format
    printf("The current time in WIB Indonesia is: %02d:%02d\n", local.tm_hour, local.tm_min);
}
This script uses the built-in time library to get the current time, and the SetTimeZone function to set the time zone to WIB Indonesia. The script then uses the localtime function to convert the current time to local time, and the SetServerTime function to set the server time to the current local time. Finally, the script outputs the current time in WIB Indonesia format using the printf function.
