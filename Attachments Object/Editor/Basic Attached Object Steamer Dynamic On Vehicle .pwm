
public OnPlayerSelectObject(playerid, type, objectid, modelid, Float:fX, Float:fY, Float:fZ)
{
    new message[526+1];




    if(type == SELECT_OBJECT_GLOBAL_OBJECT) {
        //if(!IsValidObject(objectid)) return 0;
        format(message,sizeof(message),"[Global Object] Sir you have select line in server: %d, modelobjectID : %d, Pos: %.4f,%.4f,%.4f", objectid, modelid, fX, fY, fZ);
        SendClientMessage(playerid, 0xFFFFFFFF, message);
        EditObject(playerid, objectid);
        return 1;
  }

  if(type == SELECT_OBJECT_PLAYER_OBJECT) {
     OnPlayerSelectDynamicObject(playerid, objectid, modelid, Float:fX, Float:fY, Float:fZ);
       // if(!IsValidPlayerObject(playerid, objectid)) return 0;
        format(message,sizeof(message),"[Player Select player Object] Anda memilih baris proggram : %d modelID nya adalah: %dPos: %.4f,%.4f,%.4f", objectid, modelid, fX, fY, fZ);
        SendClientMessage(playerid, 0xFFFFFFFF, message);
        EditPlayerObject(playerid, objectid);
        //EditDynamicObject(playerid, objectid);
        SEM(playerid, "Dynamic edit after select non dynamic");
        return 1;
  }

    if(type == STREAMER_OBJECT_TYPE_GLOBAL)
    {
      SEM(playerid, "Dynamic object type global");
      Streamer_Update(playerid, -1);
      EditDynamicObject(playerid, objectid);
      return 1;
    }
  


  // bagian select object
  //EditObject(playerid, objectid);
  EditDynamicObject(playerid, objectid);

  return 1;
}


//-------------------------------------------
  
public OnPlayerEditDynamicObject(playerid, STREAMER_TAG_OBJECT:objectid, response, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz)
//public OnPlayerEditDynamicObject(playerid, STREAMER_TAG_OBJECT:objectid, response, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz);
{
          new Float:ofx, Float:ofy, Float:ofz;
          new Float:ofaz, Float:finalx, Float:finaly;
          new Float:px, Float:py, Float:pz, Float:roz;
          new closestcar = GetClosestCar(playerid, INVALID_VEHICLE_ID);
          //SendClientMessage(playerid, COLOR_RED, "Anda Sedang Mengedit DynamicObject.");
          if(response == EDIT_RESPONSE_UPDATE && inEditingMode[playerid] == 1)
          {

                  /*
                  GetVehiclePos(closestcar, px, py, pz);
                  GetVehicleZAngle(closestcar, roz);
                  ofx = x-px;
                  ofy = y-py;
                  ofz = z-pz;
                  ofaz = rz-roz;
                  finalx = ofx*floatcos(roz, degrees)+ofy*floatsin(roz, degrees);
                  finaly = -ofx*floatsin(roz, degrees)+ofy*floatcos(roz, degrees);
                  */
                  //SetDynamicObjectPos(objectid, finalx, finaly, ofz);
                  //SetDynamicObjectRot(objectid, rx, ry, ofaz);
                  //SendClientMessage(playerid, COLOR_RED, "ATTACHED OBJECT: Sir you have try to edit attached dynamic object Position or Rotation now response updated.");
                  //Streamer_Update(playerid);
                  return 1;
            
          }
          if(response == EDIT_RESPONSE_UPDATE && inEditingMode[playerid] == 0)
          {

                  
                  SendClientMessage(playerid, COLOR_RED, "NON ATTACHED: Sir you have try to edit but not on editing attached  dynamic object Position or Rotation now response updated.");
                  return 1;
            
          }
          else if(response == EDIT_RESPONSE_CANCEL)
          {
              SendClientMessage(playerid, COLOR_RED, "Sir you have Cancel editing the DynamicObject.");
          }

          else if(response == EDIT_RESPONSE_FINAL && inEditingMode[playerid] == 1)
          {
                inEditingMode[playerid] = 0;
                if (!IsPlayerInAnyVehicle(playerid))
                        return SendClientMessage(playerid, COLOR_RED, "Sir you need get in vehicle to edit the attached object");

                    
                    GetVehiclePos(GetPlayerVehicleID(playerid), px, py, pz);
                    GetVehicleZAngle(GetPlayerVehicleID(playerid), roz);
                    ofx = x-px;
                    ofy = y-py;
                    ofz = z-pz;
                    ofaz = rz-roz;
                    finalx = ofx*floatcos(roz, degrees)+ofy*floatsin(roz, degrees);
                    finaly = -ofx*floatsin(roz, degrees)+ofy*floatcos(roz, degrees);
                  
                    SendClientMessage(playerid, COLOR_RED, "Sir you succes edited DynamicObject on attached.");
                    GameTextForPlayer(playerid, "Sir you succes edited DynamicObject on attached.", 2000, 5);
                    AttachDynamicObjectToVehicle(objectid, closestcar, finalx, finaly, ofz, rx, ry, ofaz);


            
                new DynamicObjectInformation[500];
                format(DynamicObjectInformation, sizeof(DynamicObjectInformation), 
                "ID Dynamic Object in gamemode %i, Object ModelID:[%i] Coordinat: %f, %f, %f, Rotating in: %f, %f, %f)",
                objectid, modelid, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz);
                SendClientMessage(playerid, COLOR_RED, DynamicObjectInformation);

                SelectObjectEx(playerid);
                return 1;
                //SelectObject(playerid);
          }
          else if(response == EDIT_RESPONSE_FINAL && inEditingMode[playerid] == 0)
          {


                SetDynamicObjectPos(objectid, x, y, z);
                SetDynamicObjectRot(objectid, rx, ry, rz);
                SendClientMessage(playerid, COLOR_RED, "Sir you succes edited Non Attached DynamicObject.");
                new DynamicObjectInformation[500];
                
                format(DynamicObjectInformation, sizeof(DynamicObjectInformation), 
                "ID Dynamic Object in gamemode %i, Coordinat: %f, %f, %f, Rotating in: %f, %f, %f)",
                objectid, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz);
                SendClientMessage(playerid, COLOR_RED, DynamicObjectInformation);
                inEditingMode[playerid] = 1;
                SelectObjectEx(playerid);
                return 1;
          }

  return 1;
}






public OnPlayerSelectDynamicObject(playerid, objectid, modelid, Float:x, Float:y, Float:z)
{

        Streamer_Update(playerid); 
        GameTextForPlayer(playerid, "Sir plese select type of the attached dynamic object ?", 2000, 5);
        if(inEditingMode[playerid] == 1)
        {
                Streamer_Update(playerid);
                inEditingMode[playerid] = 1;
                SendClientMessage(playerid, COLOR_WHITE, "Sir you have been select the Dynamic type attached Object.");
                EditDynamicObject(playerid, objectid);
                return 1;
        }
        else 
        {
                Streamer_Update(playerid);
                SendClientMessage(playerid, COLOR_WHITE, "Sir you have been select the Dynamic non attached Object.");
                DynamicObjectID[playerid] = objectid;
                ShowPlayerDialog( playerid, DIALOG_OPTION_ATTACHED_DYNAMIC_OBJECT, DIALOG_STYLE_MSGBOX, "Select and Change Your Dynamic Object Sytem",""COL_RED"Sir we have two option to use this dynamic object:\n\n"COL_WHITE"( Please Select one )"," Attached Object "," Non Attached ");
                return 1;
        }
  
  
  
}





public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
  if(dialogid == DIALOG_OPTION_ATTACHED_DYNAMIC_OBJECT)
  {

              new x, y, z, rx, ry, rz;
              new vid = GetClosestCar(playerid, INVALID_VEHICLE_ID);
  
              
              new Float:VehPos[3];
              GetVehiclePos( vid, VehPos[0], VehPos[1], VehPos[2]);
               if(response)
              {

                    // dialog edit attached object to vehicle

                    inEditingMode[playerid]=1;
                    SEM(playerid, "Sir now you are in Editing Attached dynamic object mode.");
                    if(IsValidDynamicObject( DynamicObjectID[playerid]) )
                    {

                        GetDynamicObjectPos(  DynamicObjectID[playerid], x, y, z);
                        GetDynamicObjectRot( DynamicObjectID[playerid], rx, ry, rz);
                        DestroyDynamicObject( DynamicObjectID[playerid] );
                        SEM(playerid, "Sir Old object ExampleAttachedDynamic has been destroyed");

                        //SetDynamicObjectPos(objectid, x, y, z);
                        //SetDynamicObjectRot(objectid, rx, ry, rz);
                        
                        ExampleAttachedDynamic = CreateDynamicObject(GetPVarInt(playerid, "ObjectIDinVehicle"), VehPos[0], VehPos[1], VehPos[2] +1, rx, ry, rz);
                        Streamer_Update(playerid);

   
                      
                    }
                    
                    //SelectObject(playerid);
                    EditDynamicObject(playerid, ExampleAttachedDynamic);
                    
                    return 1;
              }

              if(!response)
              { 
                    inEditingMode[playerid] = 0;
                    SEM(playerid, "Sir now your in Editing non Attached dynamic object mode.");
                    EditDynamicObject(playerid, DynamicObjectID[playerid]);

                    return 1;

              }


             
  }
}


CMD:addattachedobject(playerid, params[])
{
	new objectid;
	if(sscanf(params, "i", objectid)) return SendClientMessage(playerid, COLOR_ERROR, ""COL_RED"USAGE: "COL_YELLOW"'/addattachedobject [objectid]'");
   	
	//extract params -> new objectid;
   new vid = GetClosestCar(playerid, INVALID_VEHICLE_ID);
   if (inEditingMode[playerid] == 0 && !IsPlayerInAnyVehicle(playerid) ) return SEM(playerid, "Need on editing mode and get in to vehicle sir.");
        
    
    new Float:VehPos[3];
    GetVehiclePos( vid, VehPos[0], VehPos[1], VehPos[2]);
    //objectid = CreateDynamicObject(11701, VehPos[0], VehPos[1], VehPos[2], 0, 0, 0);
    if( IsValidDynamicObject(ExampleAttachedDynamic) )
    {
      DestroyDynamicObject(ExampleAttachedDynamic);
      SEM(playerid, "Sir Old object ExampleAttachedDynamic has been destroyed");
      cmd_addattachedobject(playerid);
    }
    else
    {
		SetPVarInt(playerid, "ObjectIDinVehicle", objectid);
		ExampleAttachedDynamic = CreateDynamicObject(objectid, VehPos[0], VehPos[1], VehPos[2] +1, 0, 0, 0);
		Streamer_Update(playerid);
		inEditingMode[playerid] = 1;
		EditDynamicObject(playerid, ExampleAttachedDynamic);
		
		return SEM(playerid, "Sir you are now in editing Dynamic Object mode.");
    }
    
  

  return 1;
}




