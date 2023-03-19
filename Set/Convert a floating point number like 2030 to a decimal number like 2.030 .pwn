To convert a floating point number like 2030 to a decimal number like 2.030, you can use the following script:

scss
Copy code
FloatToDecimal(Float)
{
    new String[16];
    format(String, sizeof(String), "%.3f", Float / 1000.0);
    return String;
}

// Usage example
new Float = 2030.0;
new Decimal[16];
format(Decimal, sizeof(Decimal), FloatToDecimal(Float));
printf("Float: %.3f, Decimal: %s", Float, Decimal);
In this script, the FloatToDecimal function takes a floating point number as an argument and converts it to a string representation of the decimal number. It does this by dividing the floating point number by 1000.0, which moves the decimal point three places to the left. Then, it formats the resulting number as a string with three decimal places using the format function. Finally, it returns the resulting string.

To use this script, you can assign your floating point number (e.g. 2030.0) to a variable, and then call the FloatToDecimal function with that variable as an argument. The resulting decimal number will be returned as a string, which you can then use as needed.
