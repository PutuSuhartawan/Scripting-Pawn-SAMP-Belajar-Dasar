#include <timestamptodate>

enum wInfo
{
	wID, wReasonWarn[32], wAdminWarn[32], wWarnDate, wUnWarnDate
};
new WarnInfo[MAX_PLAYERS][3][wInfo];

/*
-               Timestamp To Date converter                 -
-                    Made by Jochemd                    -
-          http://forum.sa-mp.com/member.php?u=580      -
 
native TimestampToDate(Timestamp, &year, &month, &day, &hour, &minute, &second, HourGMT, MinuteGMT = 0);
native DateToTimestamp(str[11]);
*/
 
 
#include <a_samp>
#include <sscanf2>
 
#define SPLITTER .
 
new MonthTimes[12][4] =
{
        { 31, 31, 2678400, 2678400 },
        { 28, 29, 2419200, 2505600 },
        { 31, 31, 2678400, 2678400 },
        { 30, 30, 2592000, 2592000 },
        { 31, 31, 2678400, 2678400 },
        { 30, 30, 2592000, 2592000 },
        { 31, 31, 2678400, 2678400 },
        { 31, 31, 2678400, 2678400 },
        { 30, 30, 2592000, 2592000 },
        { 31, 31, 2678400, 2678400 },
        { 30, 30, 2592000, 2592000 },
        { 31, 31, 2678400, 2678400 }
};
 
stock IsLeapYear(years)
{
        if(years % 4 == 0) return 1;
        else return 0;
}
 
stock TimestampToDate(Timestamp, &years, &months, &days, &hour, &minute, &second, HourGMT, MinuteGMT = 0)
{
        new tmp = 2;
        years = 1970;
        months = 1;
        Timestamp -= 172800; // Delete two days from the current timestamp. This is necessary, because the timestamp retrieved using gettime() includes two too many days.
        for(;;)
        {
                if(Timestamp >= 31536000)
                {
                        years ++;
                        Timestamp -= 31536000;
                        tmp ++;
                        if(tmp == 4)
                        {
                                if(Timestamp >= 31622400)
                                {
                                        tmp = 0;
                                        years ++;
                                        Timestamp -= 31622400;
                                }
                                else break;
                        }
                }
                else break;
        }              
        for(new i = 0; i < 12; i ++)
        {
                if(Timestamp >= MonthTimes[i][2 + IsLeapYear(years)])
                {
                        months ++;
                        Timestamp -= MonthTimes[i][2 + IsLeapYear(years)];
                }
                else break;
        }
        days = 1 + (Timestamp / 86400);
        Timestamp %= 86400;
        hour = HourGMT + (Timestamp / 3600);
        Timestamp %= 3600;
        minute = MinuteGMT + (Timestamp / 60);
        second = (Timestamp % 60);
        if(minute > 59)
        {
                minute = 0;
                hour ++;
        }
        if(hour > 23)
        {
                hour -= 24;
                days ++;
        }      
        if(days > MonthTimes[months-1][IsLeapYear(years)])
        {
                days = 1;
                months ++;
        }
        if(months > 12)
        {
                months = 1;
                years ++;
        }
        return 1;
}
 
stock DateToTimestamp(str[11])
{
        new date[3]; // date[0] = day           date[1] = month                 date[2] = year
        if(!sscanf(str,"p<"#SPLITTER">ddd",date[0],date[1],date[2]))
        {
                new total = 0, tmp = 0;
                total += date[0] * 86400;
                if(date[1] == 2 && date[0] < 29) tmp = ((date[2] - 1968) / 4 - 2);
                else tmp = ((date[2] - 1968) / 4 - 1);
                total += tmp * 31622400;
                total += (date[2] - 1970 - tmp) * 31536000;
                for(new i = 1; i < date[1]; i ++) total += MonthTimes[i][0 + IsLeapYear(date[2])] * 86400;
                return total;
        }
        else return -1;
}


publics: OnPlayerCheckBanAcc(playerid)
{
 	new rows;
 	cache_get_row_count(rows);
    if(rows)
    {
   		new lockstate;
        cache_get_value_name_int(0, "lockstate", lockstate);

        if(lockstate == 1)
        {
            new nameplayer[MAX_PLAYER_NAME], nameadmin[MAX_PLAYER_NAME], reason[64];

            new data, unbandate;

            cache_get_value_name(0, "nameplayer", nameplayer,MAX_PLAYER_NAME);
	        cache_get_value_name(0, "nameadmin", nameadmin,MAX_PLAYER_NAME);
	        cache_get_value_name(0, "reason", reason,64);

	        cache_get_value_name_int(0, "date", data);
	        cache_get_value_name_int(0, "unbandate", unbandate);

	        if(gettime() >= unbandate)
	        {
	            format(MySQLStr, 144, "DELETE FROM `banlog` WHERE `nameplayer` = '%s'", nameplayer);
				mysql_tquery(mMysql, MySQLStr);
			}
			else
			{
			    SCMF(playerid,COLOR_RED,"Perhatian! Akun anda: [%s] diblokir!", Name(playerid));

				new dateban[6];
				TimestampToDate(data,dateban[0],dateban[1],dateban[2],dateban[3],dateban[4],dateban[5], 3);

				new dateunban[6];
				TimestampToDate(unbandate,dateunban[0],dateunban[1],dateunban[2],dateunban[3],dateunban[4],dateunban[5], 3);

				format(String,sizeof(String),
					"{FFFFFF}Alasan: %s.\nAdministrator Diblokir: %s.\n\
					Tanggal Blok: %02d/%02d/%02d %02d:%02d:%02d.\n\
					Buka Kunci Tanggal: %02d/%02d/%02d %02d:%02d:%02d.",
					reason, nameadmin,
					dateban[0],dateban[1],dateban[2],dateban[3],dateban[4],dateban[5],
					dateunban[0],dateunban[1],dateunban[2],dateunban[3],dateunban[4],dateunban[5]
				);

				SPD(playerid, 0000, DIALOG_STYLE_MSGBOX, "{E5D81E}Pilihan Anda selesai!",String, "Keluar", "");
				return KickD(playerid, "");
			}
		}
	}

	format(MySQLStr, 128, "SELECT * FROM `accounts` WHERE `pID` = %d LIMIT 1", PlayerInfo[playerid][pID]);
	mysql_tquery(mMysql, MySQLStr, "OnPlayerLoadAccounts", "d", playerid);

	return 1;
}


CMD:unwarn(playerid, params[])
{
    if(admin_level[playerid] < 3 || !admin_logged[playerid]) return 1;
    if(sscanf(params, "u", params[0])) return Send(playerid, -1,"Masuk: /unwarn [id pemain]");
    if(!IsPlayerConnected(params[0])) return Send(playerid, -1,"Pemain sedang offline!");
	if(PlayerInfo[params[0]][pLogin] == 0) return Send(playerid, -1,"Pemain belum login!");//+;
	if(PlayerInfo[params[0]][pWarn] == 0) return Send(playerid, COLOR_GREY, "Pemain ini tidak memiliki peringatan.!");
    new str[124], dateban[3][6], count = 0;

    String = "Tanggal dan waktu\t\tDikeluarkan oleh\t\tAlasan\n";
    for(new i; i < PlayerInfo[params[0]][pWarn]; i++)
	{
 		TimestampToDate(WarnInfo[params[0]][i][wWarnDate],dateban[i][0],dateban[i][1],dateban[i][2],dateban[i][3],dateban[i][4],dateban[i][5], 3);

		format(str, 124, "%02d-%02d-%02d %02d:%02d\t%s\t%s\n", dateban[i][0], dateban[i][1], dateban[i][2], dateban[i][3], dateban[i][4], WarnInfo[params[0]][i][wAdminWarn], WarnInfo[params[0]][i][wReasonWarn]);
		strcat(String, str);

		SetPlayerListitemValue(playerid, count++, WarnInfo[playerid][i][wID]);
 	}
    SPD(playerid, 193, DIALOG_STYLE_LIST, "Informasi Peringatan", String, "Pilih", "Keluar");
	SetPVarInt(playerid, "SavePlayer", params[0]);
    return 1;
}



CMD:warninfo(playerid, params[])
{
	if(!PlayerInfo[playerid][pWarn]) return Send(playerid, COLOR_GREY, "Anda tidak memiliki lansiran yang valid.!");

	String = "";
	strcat(String, "{ffff00}Tanggal dan waktu\t\tDikeluarkan oleh\t\tAlasan\n\n");
	new str[164];

	new dateban[3][6];
    for(new i; i < PlayerInfo[playerid][pWarn]; i++)
	{
 		TimestampToDate(WarnInfo[playerid][i][wWarnDate],dateban[i][0],dateban[i][1],dateban[i][2],dateban[i][3],dateban[i][4],dateban[i][5], 3);

		format(str, 164, ""W"%02d-%02d-%02d %02d:%02d:%02d\t%s\t%s\n", dateban[i][0], dateban[i][1], dateban[i][2], dateban[i][3], dateban[i][4], dateban[i][5], WarnInfo[playerid][i][wAdminWarn], WarnInfo[playerid][i][wReasonWarn]);
		strcat(String, str);
	}
	if(!GetPVarInt(playerid, "Inform")) Send(playerid, 0x98FB98FF, "Lansiran dihapus secara otomatis setelah 7 hari sejak tanggal penerbitan.");
	SetPVarInt(playerid, "Inform", 1);
	SPD(playerid, 0, DIALOG_STYLE_MSGBOX, "Informasi Peringatan", String, "Tutup", "");
	return 1;
}


CMD:warn(playerid, params[])
{
    if(admin_level[playerid] < 3 || !admin_logged[playerid]) return 1;
    if(sscanf(params, "ds[128]",params[0],params[1])) return Send(playerid, -1, "Masuk: /warn [id] [alasan]");
    if(!PlayerInfo[params[0]][pLogin]) return Send(playerid,-1,"Pemain tidak diotorisasi!");
    //if(admin_level[params[0]] >= admin_level[playerid]) return Send(playerid, -1, "Anda tidak dapat mengeluarkan varn ke administrator level tertinggi/sederajat.");

    if(PlayerInfo[playerid][pWarn] >= 2)
    {
        PlayerInfo[playerid][pAdmBan]++;
        OnPlayerUpdateAdminPer(playerid, "pAdmBan", PlayerInfo[playerid][pAdmBan]);

    	format(format_string, sizeof(format_string), "Administrator %s melarang pemain %s selama 7 hari [3/3] peringatan. Alasan: %s",Name(playerid), Name(params[0]), params[1]);
		SendClientMessageToAll(COLOR_LIGHTRED, format_string);
        AddAdminLog(playerid, format_string);

		mysql_format(mMysql, MySQLStr, 144, "DELETE FROM `warninfo` WHERE `plID` = %d", PlayerInfo[params[0]][pID]);
		mysql_tquery(mMysql, MySQLStr, "", "");

		BlockAccounts(Name(params[0]), params[1], Name(playerid), gettime() + (86400 * 7));

		return 1;
    }

	PlayerInfo[playerid][pAdmWarn]++;
	OnPlayerUpdateAdminPer(playerid, "pAdmWarn", PlayerInfo[playerid][pAdmWarn]);

	format(format_string, sizeof(format_string), "Administrator %s mengeluarkan peringatan kepada pemain %s [%i/3]. Alasan: %s", Name(playerid), Name(params[0]), PlayerInfo[playerid][pWarn]+1, params[1]);
	SendClientMessageToAll(COLOR_LIGHTRED, format_string);
	AddAdminLog(playerid, format_string);

    format(format_string, 144, "UPDATE `accounts` SET `pLeader` = 0, `pMember` = 0 WHERE `pID` = %i", GetPlayerAccountID(params[0]));
	mysql_tquery(mMysql, format_string);

	mysql_format(mMysql, MySQLStr, 344, "INSERT INTO `warninfo` (`plID`, `wReasonWarn`, `wAdminWarn`, `wWarnDate`, `wUnWarnDate`) VALUES (%d, '%e', '%e', %d, %d)", PlayerInfo[params[0]][pID], params[1], Name(playerid), gettime(), gettime() + (86400 * 7));
	mysql_tquery(mMysql, MySQLStr);

	KickD(params[0], "");

	return 1;
}


epublic: LoadMyWarns(playerid)
{
    new rows;
	cache_get_row_count(rows);

	if(!rows) return PlayerInfo[playerid][pWarn] = 0; // no warns

	PlayerInfo[playerid][pWarn] = rows;

	for(new i; i < rows; i++)
	{
	    cache_get_value_name_int(i, "wID", WarnInfo[playerid][i][wID]);
 		cache_get_value_name(i, "wReasonWarn", WarnInfo[playerid][i][wReasonWarn], 32);
 		cache_get_value_name(i, "wAdminWarn", WarnInfo[playerid][i][wAdminWarn], 32);
 		cache_get_value_name_int(i, "wWarnDate", WarnInfo[playerid][i][wWarnDate]);
 		cache_get_value_name_int(i, "wUnWarnDate", WarnInfo[playerid][i][wUnWarnDate]);

 		if(gettime() >= WarnInfo[playerid][i][wUnWarnDate])
		{
 			PlayerInfo[playerid][pWarn]--;
  			format(MySQLStr, 96, "DELETE FROM `warninfo` WHERE `plID` = %d AND `wID` = %d", PlayerInfo[playerid][pID], WarnInfo[playerid][i][wID]), mysql_tquery(mMysql, MySQLStr, "", "");
			mysql_tquery(mMysql, MySQLStr, "", "");
			SCMF(playerid, -1, "Peringatan ?%d telah ditarik dari akun Anda!", i+1);
		}
	}
	return 1;
}


epublic:OnPlayerCheckBanIP(playerid, ipadress[])
{
	new rows;
 	cache_get_row_count(rows);
    if(rows)
    {
   		new lockstate_ip;
        cache_get_value_name_int(0, "lockstate", lockstate_ip);

        if(lockstate_ip == 1)
        {
	  		new banipadress[MAX_IP_ADRESS], banipreason[64], banipadmin[MAX_PLAYER_NAME];

	        cache_get_value_name(0, "ipadress", banipadress,MAX_IP_ADRESS);
	        cache_get_value_name(0, "reason", banipreason,64);
	        cache_get_value_name(0, "admin", banipadmin,MAX_PLAYER_NAME);

	        new banipdate, banipunbandate;
			cache_get_value_name_int(0, "date", banipdate);
	        cache_get_value_name_int(0, "unbandate", banipunbandate);

	        if(gettime() >= banipunbandate)
	        {
	            mysql_format(mMysql, MySQLStr, 144, "DELETE FROM `banips` WHERE `ipadress` = '%e' AND `lockstate` = '1'", ipadress), mysql_tquery(mMysql, MySQLStr, "", "");

				CheckPlayerAccount(playerid);

				//if(mysql_errno()) return MysqlErrorMessage(playerid);
	        }
	        else
	        {

		        SCMF(playerid,COLOR_RED,"Perhatian! Alamat IP Anda: [%s] diblokir!", banipadress);

				new dateban[6];
				TimestampToDate(banipdate,dateban[0],dateban[1],dateban[2],dateban[3],dateban[4],dateban[5], 3);

				new dateunban[6];
				TimestampToDate(banipunbandate,dateunban[0],dateunban[1],dateunban[2],dateunban[3],dateunban[4],dateunban[5], 3);

				format(String,sizeof(String), "{FFFFFF}Alasan: %s.\nAdministrator Diblokir: %s.\nTanggal Blok: %02d/%02d/%02d %02d:%02d:%02d.\nTanggal Pemblokiran: %02d/%02d/%02d %02d:%02d:%02d.", banipreason, banipadmin, dateban[0],dateban[1],dateban[2],dateban[3],dateban[4],dateban[5], dateunban[0],dateunban[1],dateunban[2],dateunban[3],dateunban[4],dateunban[5]);
				SPD(playerid,0,DIALOG_STYLE_MSGBOX, "{E5D81E}Alamat IP Anda diblokir!",String, "Keluar", "");
				KickD(playerid, "");
			}
		}
		else
		{
			CheckPlayerAccount(playerid);

			//if(mysql_errno()) return MysqlErrorMessage(playerid);
		}
    }
    else
    {
   		CheckPlayerAccount(playerid);

		//if(mysql_errno()) return MysqlErrorMessage(playerid);
    }
	return true;
}


/*
-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 22, 2021 at 06:51 AM
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
-- Database: `szrp2021`
--

-- --------------------------------------------------------

--
-- Table structure for table `warninfo`
--

CREATE TABLE `warninfo` (
  `wID` int(11) NOT NULL,
  `plID` int(11) NOT NULL,
  `wReasonWarn` varchar(64) CHARACTER SET cp1251 NOT NULL,
  `wAdminWarn` varchar(32) CHARACTER SET cp1257 COLLATE cp1257_bin NOT NULL,
  `wWarnDate` varchar(64) CHARACTER SET cp1251 NOT NULL,
  `wUnWarnDate` varchar(64) CHARACTER SET cp1251 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `warninfo`
--

INSERT INTO `warninfo` (`wID`, `plID`, `wReasonWarn`, `wAdminWarn`, `wWarnDate`, `wUnWarnDate`) VALUES
(1, 10307, 'Not here for RP', 'Putu_Suhartawan', '1630393657', '1630998457'),
(4, 10395, 'MEKA MODIF GA PAKE RP ', 'Boku_Santiago', '1631470277', '1632075077');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `warninfo`
--
ALTER TABLE `warninfo`
  ADD PRIMARY KEY (`wID`),
  ADD KEY `plID` (`plID`),
  ADD KEY `wAdminWarn` (`wAdminWarn`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `warninfo`
--
ALTER TABLE `warninfo`
  MODIFY `wID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `warninfo`
--
ALTER TABLE `warninfo`
  ADD CONSTRAINT `warninfo_ibfk_1` FOREIGN KEY (`plID`) REFERENCES `accounts` (`pID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


*/

/*

-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 22, 2021 at 06:56 AM
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
-- Database: `szrp2021`
--

-- --------------------------------------------------------

--
-- Table structure for table `banips`
--

CREATE TABLE `banips` (
  `id` int(11) NOT NULL,
  `ipadress` varchar(40) CHARACTER SET utf8 NOT NULL,
  `reason` varchar(128) CHARACTER SET utf8 NOT NULL,
  `admin` varchar(24) CHARACTER SET utf8 NOT NULL,
  `date` int(11) NOT NULL,
  `unbandate` int(11) NOT NULL,
  `lockstate` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

--
-- Dumping data for table `banips`
--

INSERT INTO `banips` (`id`, `ipadress`, `reason`, `admin`, `date`, `unbandate`, `lockstate`) VALUES
(1, '125.165.173.87', 'biadap', 'Rico_Pasanea', 1630588001, 1633180001, 1),
(2, '34.87.96.154', 'sampah', 'Ezra_Keisuke', 1631399159, 1633991159, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banips`
--
ALTER TABLE `banips`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banips`
--
ALTER TABLE `banips`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


*/
