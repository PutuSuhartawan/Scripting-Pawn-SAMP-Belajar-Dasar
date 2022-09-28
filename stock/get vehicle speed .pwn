stock Float: GetVehicleSpeed(vehicleid)
{
	new Float: speed = -1;

	if(vehicleid != INVALID_VEHICLE_ID)
	{
		new Float: x,
			Float: y,
			Float: z,
			Float: angle;

		GetVehicleVelocity(vehicleid, x, y, z);
		GetVehicleZAngle(vehicleid, angle);

		speed = x / floatsin(-angle, degrees);

		speed *= 125.0;
	}

	return speed;
}
