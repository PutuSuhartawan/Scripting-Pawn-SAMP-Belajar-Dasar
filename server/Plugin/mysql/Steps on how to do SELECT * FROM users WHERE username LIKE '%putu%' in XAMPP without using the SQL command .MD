




 the steps on how to do SELECT * FROM users WHERE username LIKE '%putu%' in XAMPP without using the SQL command:

Open the phpMyAdmin application.
Click on the "Databases" tab.
Select the database that contains the users table.
Click on the "Tables" tab.
Select the users table.
Click on the "Browse" tab.
In the "WHERE" field, enter the following query:
Code snippet
username LIKE '%putu%'
Use code with caution. Learn more
Click on the "Go" button.
This will filter the results to only show rows where the username column contains the string "putu".

Here is an explanation of the steps above:

Opening the phpMyAdmin application. phpMyAdmin is a web-based application that allows you to manage MySQL databases.
Clicking on the "Databases" tab. This will show a list of all the databases that are available on your XAMPP server.
Selecting the database that contains the users table. This will show a list of all the tables that are contained in the selected database.
Clicking on the "Tables" tab. This will show a list of all the tables that are contained in the selected database.
Selecting the users table. This will show the contents of the users table.
Clicking on the "Browse" tab. This will allow you to filter the results of the users table.
Entering the query in the "WHERE" field. The query in the "WHERE" field will filter the results to only show rows where the username column contains the string "putu".
Clicking on the "Go" button. This will execute the query and show the filtered results.








the steps on how to use the % character to match any character in Apache:

Create a regular expression that uses the % character. For example, the following regular expression will match any string that contains the word "hello":
Code snippet
/hello%/
Use code with caution. Learn more
Add the regular expression to your Apache configuration file. For example, you could add the following line to your .htaccess file:
Code snippet
RewriteRule ^hello$ index.php?q=%hello% [NC,L]
Use code with caution. Learn more
Save your Apache configuration file.
Restart your Apache web server.
Now, when you visit the URL /hello, Apache will use the regular expression to match any string that contains the word "hello". If a match is found, Apache will redirect the user to the index.php page with the q parameter set to the matched string.

For example, if you visit the URL /helloworld, Apache will match the string "helloworld" to the regular expression /hello%/ and redirect the user to the index.php page with the q parameter set to "helloworld".

Here is an explanation of the steps above:

Creating a regular expression that uses the % character. The % character is a wildcard that can match any character, including zero characters. So, the regular expression /hello%/ will match any string that contains the word "hello", even if the word is not followed by any other characters.
Adding the regular expression to your Apache configuration file. The Apache configuration file is a file that tells Apache how to handle requests for different URLs. You can add regular expressions to your Apache configuration file to tell Apache how to match certain strings and redirect users to different pages based on the matches.
Saving your Apache configuration file. Once you have added the regular expression to your Apache configuration file, you need to save the file. This will tell Apache to read the new regular expression and start using it to match strings.
Restarting your Apache web server. Once you have saved your Apache configuration file, you need to restart your Apache web server. This will tell Apache to reload the configuration file and start using the new regular expression.




MySQL uses the % character as a wildcard when searching for data. This means that the % character can be used to match any number of characters, including zero characters. For example, the following query will match all rows in the products table where the product_name column contains the word "hello":

SQL
SELECT * FROM products WHERE product_name LIKE '%hello%';
Use code with caution. Learn more
The % character can also be used to match any character at a specific position in a string. For example, the following query will match all rows in the products table where the product_name column starts with the word "hello" and ends with the word "world":

SQL
SELECT * FROM products WHERE product_name LIKE 'hello%world';
Use code with caution. Learn more
Using the % character as a wildcard can be very useful when searching for data in MySQL. However, it is important to note that using the % character can also make your queries less efficient. This is because MySQL has to scan more rows in the database when it is using a wildcard.

In the case of a unique keyword, using the % character as a wildcard can be useful for finding all rows where the keyword appears anywhere in the column. However, it is important to make sure that the keyword is actually unique in the column. If the keyword is not unique, then using the % character as a wildcard can return a lot of irrelevant rows.

In general, it is a good idea to use the % character as a wildcard sparingly. Only use it when you are sure that it will not make your queries less efficient.
