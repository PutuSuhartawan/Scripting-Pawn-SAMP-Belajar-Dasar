make the Log_Write stock:

Code snippet
stock Log_Write(string logType, string message)
{
  // Connect to the MySQL database.
  mysql_connect("localhost", "root", "", "my_database");

  // Prepare the SQL query.
  string query = "INSERT INTO logs (message, logType) VALUES ('%s', '%s')";

  // Format the message and replace the placeholder with the actual message.
  query = format(query, message, logType);

  // Execute the SQL query.
  mysql_query(query);

  // Close the connection to the MySQL database.
  mysql_close();
}
Use code with caution. Learn more
This code will create a stock function called Log_Write() that takes two strings as parameters: the log type and the message. The function will connect to the MySQL database, prepare the SQL query, format the message, execute the SQL query, and close the connection to the MySQL database.

Here is an explanation of how the code works:

The Log_Write() function connects to the MySQL database.
The function prepares the SQL query.
The message is formatted and the placeholder is replaced with the actual message.
The SQL query is executed.
The connection to the MySQL database is closed.
I hope this explanation is helpful. Let me know if you have any other questions.

Here is an example of how to use the Log_Write() stock:

Code snippet
Log_Write("log_admin", "%s (uid: %i) has locked the account of %s.", GetPlayerNameEx(playerid), PlayerInfo[playerid][pID], username);
Use code with caution. Learn more
This code will write a log message to the MySQL database with the log type log_admin and the message "Player %s (uid: %i) has locked the account of %s.".





// MYSQL PROMT


 prompt that you can use to create a MySQL table for log write data:

mysql> CREATE TABLE logs (
  id INT NOT NULL AUTO_INCREMENT,
  message TEXT NOT NULL,
  logType VARCHAR(255) NOT NULL,
  created_at DATETIME NOT NULL,
  PRIMARY KEY (id)
);
This code will create a table called logs in the MySQL database. The table will have the following columns:

id: The ID of the log entry.
message: The message of the log entry.
logType: The type of the log entry.
created_at: The date and time the log entry was created.
The CREATE TABLE statement is used to create a new table in the MySQL database. The id column is an auto-incrementing column, which means that the value of the id column will automatically be incremented by 1 for each new row that is inserted into the table. The message column is a text column, which means that the value of the message column can be any string of text. The logType column is a varchar column, which means that the value of the logType column can be a string of text up to 255 characters long. The created_at column is a datetime column, which means that the value of the created_at column is a date and time value.

The PRIMARY KEY constraint is used to ensure that the id column is unique. This means that no two rows in the logs table can have the same value in the id column.

To run this code, you will need to have a MySQL database installed. You can then connect to the MySQL database using a MySQL client, such as MySQL Workbench. Once you are connected to the MySQL database, you can run the CREATE TABLE statement to create the logs table.
