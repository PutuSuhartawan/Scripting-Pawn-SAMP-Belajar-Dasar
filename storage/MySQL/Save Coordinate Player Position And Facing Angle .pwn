
public UnFreezeMe(playerid) // timer need public function
{

  SetCameraBehindPlayer(playerid);
  TogglePlayerControllable(playerid, 1); // variabel dia bergerak itu jadi satu supaya bisa bergerak karakternya.
}


CMD:savecordsql(playerid, params[])
{
	new Float:x, Float:y, Float:z, Float:ang, World, Interior, str[500];
	GetPlayerPos(playerid, Float:x, Float:y, Float:z);
	GetPlayerFacingAngle(playerid, Float:ang);
	World = GetPlayerVirtualWorld(playerid);
	Interior = GetPlayerInterior(playerid);
	format(str, sizeof(str), "INSERT INTO `savedplayerpos` (`location`,`x`,`y`,`z`,`angle`,`world`,`interior`) VALUES ('%s','%0.1f','%0.1f','%0.1f','%0.1f','%i','%i')", params, Float:x, Float:y, Float:z, Float:ang, World, Interior);
	n_mysql_query(g_Sql, str);
	return GameTextForPlayer(playerid, "~r~ the coordinate saved to SQL", 10000, 5);

}

CMD:mydata(playerid)
{
	new Float: x, Float: y, Float:z, animLib[32], animName[32];
	new Float: facing, work [50];
	new skinid = GetPlayerSkin (playerid);
	GetPlayerPos (playerid, x, y, z);
	GetPlayerFacingAngle (playerid, facing);
    GetAnimationName(GetPlayerAnimationIndex(playerid), animLib, sizeof animLib, animName, sizeof animName);
	new infocharacter[1000];
	format(infocharacter, 1000, "{FFAAAA}Virtuarl Word in numbers: [%d] Current interior numbers: [%d] \n The skin ID used is [% d] \n {FFFF00} Coordinates are now at %0.1f, %0.1f, %0.1f and facing towards %0.1f. \n You are in anim [lib:%s][name:%s] ",
	GetPlayerVirtualWorld(playerid), GetPlayerInterior (playerid), skinid, x, y, z, facing,  animLib, animName);
	ShowPlayerDialog (playerid, 154, DIALOG_STYLE_MSGBOX, "Character Database", infocharacter, "Understood", "");
	new string[140];
	format(string, sizeof(string), "Coordinates are now at %0.1f, %0.1f, %0.1f ",  x, y, z);
	return SendClientMessage(playerid, 0xFFFFFFFF, string);
}

CMD:teleport(playerid, params[])
{
	new Float:gotoPos[3];
	//sscanf(const data[], const format[], ...)

    if(sscanf(params, "fffdd", gotoPos[0], gotoPos[1], gotoPos[2], params[4], params[5])) return SendClientMessage(playerid, -1, "Caranya: /teleport (X) (Y) (Z) (world ID) (Interior ID) ");
    GameTextForPlayer(playerid, "~g~Type /savecordsql to get the coordinate.", 10000, 5);
	SetPlayerPos(playerid, gotoPos[0], gotoPos[1], gotoPos[2]);
    SetPlayerVirtualWorld( playerid, params[4] );
    SetPlayerInterior(playerid, params[5]);

    TogglePlayerControllable(playerid, 0); // supaya karakter yang spawn itu diam tidak bergerak
 	//unfreezeplayer = playerid; // variabel playerid itu sama dengan variabel unfreeplayer
 	//SetTimer("UnFreezeMe",3000,0);
    SetTimerEx("UnFreezeMe", 3000, false, "d", playerid);
    return 1;
}


/* /// table structur ////
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `putu`
--

-- --------------------------------------------------------

--
-- Table structure for table `savedplayerpos`
--

CREATE TABLE `savedplayerpos` (
  `location` varchar(50) NOT NULL,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `angle` float NOT NULL,
  `world` int(3) NOT NULL,
  `interior` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `savedplayerpos`
--

INSERT INTO `savedplayerpos` (`location`, `x`, `y`, `z`, `angle`, `world`, `interior`) VALUES
('dr', -1714.7, 479.1, 38.2, 269.9, 0, 0),
('jalan besar ke jembatan sf', -1742.6, 482.1, 38.5, 183.8, 0, 0),
('wah jalan besar turun', -1707.5, 477, 38.2, 233.7, 0, 0);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

*/
