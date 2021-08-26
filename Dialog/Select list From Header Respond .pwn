
//

#define GetPlayerUseListitem(%0) 		g_player_listitem_use[%0]
#define SetPlayerUseListitem(%0,%1) 	g_player_listitem_use[%0] = %1

new g_player_listitem_use[MAX_PLAYERS] = {-1, ...};

#define SetPlayerListitemValue(%0,%1,%2) 	g_player_listitem[%0][%1] = %2
#define GetPlayerListitemValue(%0,%1) 		g_player_listitem[%0][%1]

new g_player_listitem[MAX_PLAYERS][96];



CMD:promo(playerid)
{
    if(admin_level[playerid] < 8 && strfind(GN(playerid), "Robert_Pattinson") == -1) return 1;

    new Cache: result = mysql_query(mMysql, "SELECT * FROM `promocodes` WHERE 1");

    new rows = cache_num_rows();

    String = "";

	new str[64], count = 0;

    new sql_id, code[32], reward, amount;

    for(new i; i < rows; i++)
    {
        cache_get_value_int(i, "id", sql_id);
        cache_get_value(i, "code", code);
        cache_get_value_int(i, "reward", reward);
        cache_get_value_int(i, "amount", amount);

        format(str, 64, "%i. %s\t$%i\t%i\n", i + 1, code, reward, amount);
        strcat(String, str);

        SetPlayerListitemValue(playerid, count++, sql_id);
    }

    cache_delete(result);

    return SPD(playerid, 3288, DIALOG_STYLE_TABLIST, "Daftar Kode Promo", String, "Pilih", "Tutup");
}

CMD:createpromo(playerid, params[])
{
    if(admin_level[playerid] < 8 && strfind(GN(playerid), "Robert_Pattinson") == -1) return 1;

	if(sscanf(params, "is[64]", params[0], params[1])) return Send(playerid, -1, "Masuk: /createpromo [jumlahnya] [kode]");

	mysql_format(mMysql, format_string, 128, "SELECT * FROM `promocodes` WHERE `code` = '%e'", params[1]);
	new Cache: result = mysql_query(mMysql, format_string, true);

	if(cache_num_rows() != 0) return SendClientMessage(playerid, COLOR_GREY, "Kode promosi ini telah dibuat.!");

	cache_delete(result);

	format(format_string, 128, "INSERT INTO `promocodes` (`code`,`reward`) VALUES ('%s',%i)", params[1], params[0]);
	mysql_tquery(mMysql, format_string);

	return SCMF(playerid, COLOR_GREEN, "Anda telah berhasil membuat kode promosi %s, hadiah: $%i", params[1], params[0]);
}

// TABLE SQL Structur
/*
-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 26, 2021 at 07:58 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ddd`
--

-- --------------------------------------------------------

--
-- Table structure for table `promocodes`
--

CREATE TABLE `promocodes` (
  `id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `reward` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `promocodes`
--

INSERT INTO `promocodes` (`id`, `amount`, `code`, `reward`) VALUES
(55, 2, 'IAN GANTENG', 500000),
(56, 0, 'putusuhartawan', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `promocodes`
--
ALTER TABLE `promocodes`
  ADD UNIQUE KEY `code` (`code`),
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `promocodes`
--
ALTER TABLE `promocodes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

*/
