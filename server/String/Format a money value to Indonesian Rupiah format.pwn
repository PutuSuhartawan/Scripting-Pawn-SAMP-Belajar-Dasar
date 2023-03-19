script in Pawn language to format a money value to Indonesian Rupiah format:

scss
Copy code
// Function to format money value to Indonesian Rupiah format
stock formatMoney(value[])
{
    new formatted[20], num[20];
    format(num, sizeof(num), "%d", value);
    for(new i = strlen(num)-1, j = 0, k = 1; i >= 0; i--, j++)
    {
        formatted[j] = num[i];
        if(k % 3 == 0 && i != 0)
        {
            j++;
            formatted[j] = '.';
        }
        k++;
    }
    new result[30];
    format(result, sizeof(result), "Rp %s", strdel(formatted, 0, true));
    return result;
}
This function takes in a value parameter which is the money value as an integer. It then formats the value to a string in Indonesian Rupiah format and returns the formatted string.

You can call this function with a money value like this:

scss
Copy code
new money = 5000000;
new formattedMoney[30];
formattedMoney = formatMoney(money);
printf("Formatted Money: %s", formattedMoney);
This will output Formatted Money: Rp 5.000.000.
