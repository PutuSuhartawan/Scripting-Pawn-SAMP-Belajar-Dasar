 First Install the All Autocomplete - Packages - Package Control
 
 Anyway, now the correct way to create custom function (snippet) list: You'll need a .code-snippets file in your .vscode directory for that. Syntax is as follows:
Code:
{
    "FunctionName": { //Displayed on the right of the popup
        "prefix": "FunctionName", //Displayed on the left of the popup
        "description": "Little description about the function", //Not displayed, as far as I know
        "body": "FunctionName()$0" //Text to insert to your file when the function is selected. See code below for an example of two of your functions
    }
}
For example: ./.vscode/my-functions.code-snippets
Code:
{
    "SEM": {
        "prefix": "SEM",
        "description": "Send an error message to a player",
        "body": "SEM(${1:playerid}, ${2:yourstring[]})$0"
    },
    "AddOwnableCarData": {
        "prefix": "AddOwnableCarData",
        "description": "Add ownable car data",
        "body": "AddOwnableCarData(${1:vehicleid}, ${2:OC_SQL_ID}, ${3:plus}, ${4:new_value})$0"
    }
}
