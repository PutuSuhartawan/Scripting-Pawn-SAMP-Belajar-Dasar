


You can use the OnVehicleDamageStatusUpdate event to detect when a vehicle's health is under 350 and set the engine status accordingly. Here's an example script:

```
public OnVehicleDamageStatusUpdate(vehicleid, playerid)
{
    new Float:fEngineStatus;
    GetVehicleParamsEx(vehicleid, -1, -1, -1, -1, -1, -1, fEngineStatus, -1, -1, -1);
    
    if(fEngineStatus > 0.0 && GetVehicleHealth(vehicleid) < 350.0)
    {
        SendClientMessage(playerid, -1, "Your vehicle is too damaged to start the engine.");
        SetVehicleParamsEx(vehicleid, -1, -1, -1, -1, -1, -1, 0.0, -1, -1, -1);
    }
    else if(fEngineStatus == 0.0 && GetVehicleHealth(vehicleid) < 100.0)
    {
        SendClientMessage(playerid, -1, "Your vehicle is too damaged to keep the engine running.");
        SetVehicleParamsEx(vehicleid, -1, -1, -1, -1, -1, -1, 350.0, -1, -1, -1);
    }
}
```

This script will check the engine status of the vehicle and the health of the vehicle. If the health is under 350 and the engine is running, the engine will be turned off and the player will receive a notification. If the health is under 100 and the engine is off, the engine will be set to 350 to prevent the vehicle from being destroyed.
