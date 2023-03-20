To create a script that shows a textdraw when a player presses a certain button, you can use the OnPlayerKeyStateChange callback function. Here's an example code snippet:

scss
Copy code
public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    if(newkeys == KEY_Y || newkeys == KEY_H)
    {
        ShowPlayerTextDraw(playerid, TEXTDRAW_ID);
        // Replace TEXTDRAW_ID with the ID of the textdraw you want to show
    }
    else
    {
        HidePlayerTextDraw(playerid, TEXTDRAW_ID);
        // Replace TEXTDRAW_ID with the ID of the textdraw you want to hide
    }
    return 1;
}
In this script, we check if the player pressed the Y or H key using the newkeys parameter. If they did, we show the textdraw using the ShowPlayerTextDraw function. If they released the key or pressed a different key, we hide the textdraw using the HidePlayerTextDraw function. Make sure to replace TEXTDRAW_ID with the ID of the textdraw you want to show/hide.
