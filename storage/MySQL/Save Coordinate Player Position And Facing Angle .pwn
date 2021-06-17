	
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
