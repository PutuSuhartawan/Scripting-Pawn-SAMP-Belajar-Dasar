
// ============= $ ENUMERATORS =============
enum pInfo
{
	Name[32],
	Password,
	Level,
	adminaskbyricho,
	adminreportbyricho,
	maxhpbyricho,
	maxarmourbyricho,
	rumah1byricho,
	rumah2byricho,
	rumah3byricho,
	Playerexpbyricho,
	statuspenjara,
	statusrakyatshelter,
	statusanggotapolisi,
	statusanggotadokter,
	statusanggotapemadam,
	jailtimeplayer,
	delaysmuggler,
	pPhone,
	pNumber,
	pPulsa,
	StatusHandphone,
	rupiahindo,
	medkit,
	toolskit,
	gymmembertime,
	smugglerjob,
	packetsmuggler,
	taxijob,
	truckerjob,
	dutytimetaxi,
	pBiz,
	pBizPegawai,
	gpsplayer,
	SAMD,
	armsdealerjob,
	matsarmsdealer,
	hasilpegawaires,
	hasilminerjob,
	lumberjackjob,
	dutytimepd,
	dutytimesamd,
	snack,
	water,
	Bank,
	kesehatan,
	energy,
	maxenergy,
	salaryquitjob,
	burgerjob, //diubah jadi buruh semenjak ada sistem bisnis
	burgerjobhasil,
	minerjob,
	minerjobhasil,
	bibit,
	hasilpanen,
	farmerjob,
	mechanicjob,
	componentmc,
	dutytimemc,
	salary,
	factionsalary,
	salarytime,
	playerlicense,
	pVw,
	pInt,
	PD,
	MD,
	CR,
  	FG,
	pFam,
	pFamRank,
	DonatorServerByricho,
	licmobil,
	licmotor,
	licpesawat,
	licperahu,
	licsenjata,
	Registered,
 	Money,
 	Float:Health,
	Float:Armor,
  	AdminLevel,
  	Age,
  	Gender,
  	Skin,
  	InJail,
  	Goldvipbyricho,
  	Float:Bodybyricho,
  	Bodyupbyricho,
  	RegDate,
  	RegMonth,
  	RegYear,
  	TimesKicked,
  	Banned,
  	BannedBy[32],
  	BanReason[128],
	autoban,
  	TimesWarned,
  	badgefaction,
	Float:pX,
	Float:pY,
	Float:pZ,
	Weapon1,
	Weapon1a,
    Weapon2,
	Weapon2a,
    Weapon3,
	Weapon3a,
    Weapon4,
	Weapon4a,
    Weapon5,
	Weapon5a,
    Weapon6,
	Weapon6a,
    Weapon7,
	Weapon7a,
    Weapon8,
	Weapon8a,
    Weapon9,
	Weapon9a,
    Weapon10,
	Weapon10a,
    Weapon11,
	Weapon11a,
	Weapon12,
	Weapon12a,
	Materialsbyricho,
  	Schematicsilencerbyricho,
  	Schematicdeaglebyricho,
  	Schematicshotgunbyricho,
  	Schematicakbyricho,
	Schematicmpbyricho,
	ClaimStarterpack,
	pJob2,
	pJob,
    pTruckingSkill,
    pHaulingTime,
    HAULING_MISSION
}

new PlayerInfo[MAX_PLAYERS][pInfo];


CMD:asetinsu(playerid, params[])
{
	if(PlayerInfo[playerid][AdminLevel] >= 8)
	{
		
		new vehicleid, value, str[200];
		//if(SCMAdmin(playerid,1)==1)return true;
		if(sscanf(params, "ii", vehicleid, value)) return SendClientMessage(playerid, -1, "Gunakan: /asetinsu [vehicleid in server] [value years of insurace]");
		new VID=xVeh[vehicleid]; // VID is meaning id vehicle of database player cars ID primary key.
		


		xVehicle[VID][xv_asuransi] = value;
		format(str,sizeof(str),"UPDATE `xVehicle` SET `Insu`='%i' WHERE `ID`='%i'", xVehicle[VID][xv_asuransi], xVehicle[VID][xv_Veh]);
		mysql_query(mysqlB, str, false); // this is quey to update amount of year insurance of vehicle id in DB SQL
		SendClientMessage(playerid, -1, str);
		printf("[debug Asuransi] Tujuan %s telah di berhasil di kirim tuan.", str);
		format(str, sizeof(str), "INSURANCE: Berhasil mengatur jumlah insurance sebesar: %i di kendaraan IDserver: %d", xVehicle[VID][xv_asuransi], vehicleid);
		SendClientMessage(playerid, -1, str);
		format(str, sizeof(str), "INSURANCE: Admin berhasil mengatur jumlah insurance sebesar: %i di kendaraan anda yang ber IDserver: %d", xVehicle[VID][xv_asuransi], vehicleid);
		SendClientMessage(xVehicle[VID][xv_OwnerIDinSvr], -1, str);

		//SaveCars(vehicleid, VID, 1);
		return 1;

	}
	else
	{
		SendClientMessage(playerid, TRANSPARENT_RED, "ERROR: You don't have the privilege to use this command!");
	}
	return 1;
}
