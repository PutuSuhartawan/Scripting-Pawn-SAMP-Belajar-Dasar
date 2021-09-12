
stock GetWeekDayName(UTC)
{
    new weekday_str[15];
    switch(((gettime()+UTC*3600)/86400)%7)
    {
        case 0: weekday_str = "Thursday";
		case 1: weekday_str = "Friday";
		case 2: weekday_str = "Saturday";
		case 3: weekday_str = "Sunday";
		case 4: weekday_str = "Monday";
		case 5: weekday_str = "Tuesday";
		case 6: weekday_str = "Wednesday";
    }
    return weekday_str;
}
