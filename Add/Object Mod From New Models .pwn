public OnGameModeInit()
{

AddSimpleModel( -1, 5409, -20002, "mosque.dff", "mosque.txd");
// https://open.mp/docs/scripting/functions/AddSimpleModel
}
//================== CMD LINE =============================

CMD:addmosque(playerid, params[])
{
  new Float:pos[6];
  GetPlayerPos(playerid, pos[0], pos[1], pos[2]);

  new Float:angle;
  GetPlayerFacingAngle(playerid, angle);
 

  

  new object;// = CreateObject(model, pos[0] + (20.0 * floatsin(-angle, degrees)), pos[1] + (20.0 * floatcos(-angle, degrees)), pos[2] + 5, 0, 0, angle);
  object = CreateObject( -20002, pos[0], pos[1], pos[2]+3, 0, 0, angle); // new ID models
  //object = CreateDynamicObject(20002,pos[0], pos[1], pos[2]+3, Float:0, Float:0, Float:0, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid) );
  PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);

  new string[144];
  format(string, sizeof(string), "You have created a new object original : 5409, idobject in server : %i, position: %f, %f, %f, 0.0, 0.0, %f].", object, pos[0], pos[1], pos[2], angle);
  SendClientMessage(playerid, COLOR_RED, string);
  EditObject(playerid, object);
  //Streamer_Update(playerid, -1);
  //EditDynamicObject(playerid, labelajah[playerid]);
  SendClientMessage(playerid, 0xFFFFFFFF, "MOVE OBJECT: Hold the button of {FFFF00}~k~~PED_SPRINT~{FFFFFF} for free looking at.");

  return 1;
}
