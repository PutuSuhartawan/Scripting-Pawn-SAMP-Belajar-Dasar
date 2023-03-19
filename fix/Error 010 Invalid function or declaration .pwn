forward UpdatePlayerTimePlayed(playerid);
public UpdatePlayerTimePlayed(playerid)
// dont do ptask UpdatePlayerTimePlayed[1000](playerid) array cant be on the functiong name
{


          
          pInfo[playerid][pSeconds]++;
          if(pInfo[playerid][pSeconds] > 60)
          {
            pInfo[playerid][pSeconds] = 0;
            return pInfo[playerid][pMinutes]++;
            SendClientMessage(playerid, 0xFFFF00FF, "debug minute");
          }
          if(pInfo[playerid][pMinutes] > 60)
          {
            pInfo[playerid][pMinutes] = 0;
            return pInfo[playerid][pHours]++;
           
          }
            
      
}


"Invalid function or declaration" errors in SA-MP can occur when you have syntax errors in your code, such as a missing semicolon, incorrect function parameters, or an incorrect function name. To fix these errors, you need to carefully review your code and ensure that it follows the correct syntax and structure.

Here are some general tips to help you fix invalid function or declaration errors in your SA-MP scripts:

Check your function names and parameters: Make sure that you have spelled your function names correctly and that you have provided the correct parameters in the correct order. For example, if you are calling the function SetPlayerPos, you need to provide the player ID and the X, Y, and Z coordinates in the correct order.

Check your variable declarations: Ensure that you have declared your variables correctly and that they are of the correct type. For example, if you are declaring an integer variable, make sure that you have used the new keyword followed by the variable name.

Check your syntax: Look out for common syntax errors such as missing semicolons, missing brackets, and incorrect indentation.

Use a text editor with syntax highlighting: Using a text editor with syntax highlighting can help you identify errors more easily by highlighting different parts of your code in different colors.

If you are still experiencing issues with invalid function or declaration errors, you can try posting your code on a SA-MP forum or community and ask for help from more experienced scripters.
