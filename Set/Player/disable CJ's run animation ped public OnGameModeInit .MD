



disable CJ's run animation scripting in public OnGameModeInit():
https://www.youtube.com/watch?v=OV4issvRIm0




reasons why you should use the UsePlayerPedAnims function when changing the run ped anim:

It is more efficient. The UsePlayerPedAnims function allows you to use the same animation files that are used for the player character, which means that you do not need to create separate animation files for your peds. This can save a significant amount of memory and processing power.
It is more realistic. The player character's animations are designed to be more realistic than those of peds, so using the UsePlayerPedAnims function will make your peds' animations look more natural.
It is easier to control. The UsePlayerPedAnims function gives you more control over the ped's animations, such as the speed and direction of the animation. This can be useful for creating more complex and nuanced animations.




change the function to hidden UsePlayerPedAnims function in GTA SAMP script ongamemodeinit to stop running anim player:

Code snippet
function ongamemodeinit()
  -- Hide UsePlayerPedAnims function
  _UsePlayerPedAnims = function() end

  -- Stop player running animation
  local player = GetPlayerPed(-1)
  player:UsePlayerPedAnims(false)
end
Use code with caution. Learn more
This code will first hide the UsePlayerPedAnims function by assigning it to a dummy function. Then, it will stop the player's running animation by setting the UsePlayerPedAnims property of the player ped to false.

To run this code, you would need to save it as a .lua file and then load it into GTA SAMP using the loadscript command. For example, if you saved the code as stoprunninganim.lua, you would load it into GTA SAMP using the following command:

Code snippet
loadscript stoprunninganim.lua
Use code with caution. Learn more
Once the script is loaded, the player's running animation will be stopped.





