function for getting real-time stock price data from MySQL, which could be used for player roleplay as investors:

scss
Copy code
// Function to get real-time stock price data from MySQL
GetStockPrice(stockSymbol[])
{
    // Connect to the MySQL database
    new mysql = mysql_connect("localhost", "username", "password", "dbname");
    if(mysql_errno() != 0)
    {
        printf("MySQL Error: %s", mysql_error());
        return 0.0;
    }
    
    // Prepare the SQL query to select the stock price data for the given stock symbol
    new query[128];
    format(query, sizeof(query), "SELECT price FROM stock_prices WHERE symbol = '%s' ORDER BY timestamp DESC LIMIT 1", stockSymbol);
    
    // Execute the SQL query and retrieve the stock price data
    new Float:stockPrice = 0.0;
    new result = mysql_query(mysql, query);
    if(result)
    {
        printf("MySQL Error: %s", mysql_error());
    }
    else
    {
        new rows = mysql_num_rows(result);
        if(rows > 0)
        {
            new row = mysql_fetch_row(result);
            stockPrice = Float:fromstr(row[0]);
        }
    }
    
    // Close the MySQL connection and return the stock price data
    mysql_close(mysql);
    return stockPrice;
}

// Example usage
new Float:price = GetStockPrice("ABC");
SendClientMessage(playerid, COLOR_GREEN, "The current stock price for ABC is $" + price + ".");
In this example, the function connects to a MySQL database using the provided username, password, and database name. It then prepares an SQL query to select the most recent stock price data for the given stock symbol from a table called stock_prices. The function executes the SQL query and retrieves the stock price data, returning it as a float value. You can call this function in your script whenever you want to get real-time stock price data for a specific stock symbol, passing the stock symbol as a parameter. The example usage shows how to use the function and send a message to the player with the current stock price for a stock symbol called "ABC".
