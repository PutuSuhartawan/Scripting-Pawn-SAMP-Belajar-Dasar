Here is an example of how you can create a progress bar until 100% with text notification in Pawn:

```pawn
new Float:progress = 0.0;

public OnPlayerConnect(playerid)
{
    ProgressTextDrawShow(playerid, "Loading...", 0.5, 0.9, 0.5, 0x000000FF, 0xFFFFFFFF, 100);
    UpdateProgressBar(playerid);
}

public UpdateProgressBar(playerid)
{
    if (progress >= 100.0)
    {
        ProgressTextDrawHide(playerid);
        return;
    }
    
    format(progressText, sizeof(progressText), "Loading... %.2f%%", progress);
    ProgressTextDrawSetString(playerid, progressText);
    
    // Increase the progress value here
    progress += 1.0;
    
    // Set a delay for updating the progress bar (in milliseconds)
    SetTimerEx("UpdateProgressBar", 100, false, "i", playerid);
}
```

In this example, we first create a `progress` variable to keep track of the progress of the bar. When a player connects to the server, we show a progress text draw with the text "Loading..." and set the initial progress value to 0. We then call the `UpdateProgressBar` function, which will update the progress bar until it reaches 100%. 

In the `UpdateProgressBar` function, we first check if the progress value is greater than or equal to 100. If it is, we hide the progress bar and return. If not, we update the progress text draw with the new progress value (in this case, we're increasing it by 1.0 with each iteration) and set a delay of 100 milliseconds before calling the function again with the updated progress value. This will update the progress bar until it reaches 100%.
