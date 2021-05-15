/*
        Vehicle speed cap filterscript.
        -----------
        This makes it possible to limit the maxspeed of vehicles; there are, however, a few things to consider.
        * This will not work well on people with high pings.
        * This works best with lower server rates.
        * Driving at the speed limit will cause the handling to be different; however, if
          used for roleplay, driving real-life like shouldn't be an issue with this at all!
       
        How do I get started with this?
       
        First off,
        Try it on to see if it works. Load the filterscript, go ingame, and log in with /rcon login.
        Now, use the testing command /myspeedcap to see if it works. An example of a value that feels like 50 km/h is 0.3.
       
        So, simply:
                /myspeedcap 0.3
       
        Put the macros below in your other scripts and do this for example:
                SetPlayerSpeedCap( playerid, 0.3 );
       
        Another example that disables speed cap only for the NRG:
                public OnPlayerEnterVehicle( playerid, vehicleid, ispassenger )
                {
                        new modelid = GetVehicleModel( vehicleid );
                       
                        if ( modelid == 522 ) // 522 - NRG-500
                                SetPlayerSpeedCap( playerid, 0.4 );
                        else
                                DisablePlayerSpeedCap( playerid );
                }
       
        Put this in other scripts so they can change the speed cap easily.
       
        #define SetPlayerSpeedCap(%0,%1) CallRemoteFunction( "SetPlayerSpeedCap", "if", %0, %1 )
        #define DisablePlayerSpeedCap(%0) CallRemoteFunction( "DisablePlayerSpeedCap", "i", %0 )
       
        Author: Slice
*/
 
#include <YSI\y_hooks>
 
forward SetPlayerSpeedCap( playerid, Float:value );
forward DisablePlayerSpeedCap( playerid );
 
new
        Float:g_fSpeedCap[ MAX_PLAYERS ] = { 0.0, ... }
;
 
hook OnPlayerUpdate( playerid )
{
        static
                s_iVehicle
        ;
       
        if ( g_fSpeedCap[ playerid ] != 0.0 && GetPlayerState( playerid ) == PLAYER_STATE_DRIVER )
        {
                s_iVehicle = GetPlayerVehicleID( playerid );
               
                if ( s_iVehicle )
                {
                        static
                                Float:s_fX,
                                Float:s_fY,
                                Float:s_fZ,
                                Float:s_fVX,
                                Float:s_fVY,
                                Float:s_fVZ
                        ;
                       
                        GetVehiclePos( s_iVehicle, s_fX, s_fY, s_fZ );
                        GetVehicleVelocity( s_iVehicle, s_fVX, s_fVY, s_fVZ );
                       
                        if ( !IsPlayerInRangeOfPoint( playerid, g_fSpeedCap[ playerid ] + 0.05, s_fX + s_fVX, s_fY + s_fVY, s_fZ + s_fVZ ) )
                        {
                                static
                                        Float:s_fLength
                                ;
                               
                                s_fLength = floatsqroot( ( s_fVX * s_fVX ) + ( s_fVY * s_fVY ) + ( s_fVZ * s_fVZ ) );
                               
                                s_fVX = ( s_fVX / s_fLength ) * g_fSpeedCap[ playerid ];
                                s_fVY = ( s_fVY / s_fLength ) * g_fSpeedCap[ playerid ];
                                s_fVZ = ( s_fVZ / s_fLength ) * g_fSpeedCap[ playerid ];
                               
                                if ( s_iVehicle )
                                        SetVehicleVelocity( s_iVehicle, s_fVX, s_fVY, s_fVZ );
                                else
                                        SetPlayerVelocity( playerid, s_fVX, s_fVY, s_fVZ );
                        }
                }
        }
       
        return 1;
}
 
hook OnPlayerCommandText( playerid, cmdtext[ ] )
{
        if ( !strcmp( "/myspeedcap", cmdtext, true, 11 ) )
        {
                new
                        szMessage[ 24 ]
                ;
               
                if ( !( cmdtext[ 11 ] && cmdtext[ 12 ] ) )
                {
                        SendClientMessage( playerid, -1, "USAGE: /myspeedcap [max speed]" );
                        SendClientMessage( playerid, -1, "USAGE: 0 will disable the speed cap." );
                       
                        return 1;
                }
               
                g_fSpeedCap[ playerid ] = floatstr( cmdtext[ 12 ] );
               
                format( szMessage, sizeof( szMessage ), "* Speed cap: %0.4f", g_fSpeedCap[ playerid ] );
               
                SendClientMessage( playerid, 0xFFFF00FF, szMessage );
               
                return 1;
        }
       
        return 0;
}
 
public SetPlayerSpeedCap( playerid, Float:value )
{
        if ( 0 <= playerid < sizeof( g_fSpeedCap ) )
                g_fSpeedCap[ playerid ] = value;
}
 
public DisablePlayerSpeedCap( playerid )
{
        if ( 0 <= playerid < sizeof( g_fSpeedCap ) )
                g_fSpeedCap[ playerid ] = 0.0;
}
