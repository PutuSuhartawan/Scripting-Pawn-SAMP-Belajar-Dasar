
CMD:giveweap(playerid, params[])
{
	new targetid, weaponid, ammo;
    if(SCMAdmin(playerid,1)==1)return true;
    if(sscanf(params, "iii",targetid, weaponid, ammo)) return SCM(playerid, CG1, "Gunakan: /giveweap [targetid] [weaponid] [ammo]");

	
    
    GivePlayerWeapon(targetid, weaponid, ammo);
    SCM(playerid, CG1, "Have new weapon sir.");
    return 1;
}
