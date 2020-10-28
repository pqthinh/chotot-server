// Get the mysql service
var mysql = require('mysql');

// Add the credentials to access your database
var connection = mysql.createConnection({
    host: 'remotemysql.com',
    user: 'p4rP7RYQew',
    password: 'mBgU0wDM99',
    database: 'p4rP7RYQew',
});

// connect to mysql
connection.connect(function(err) {
    // in case of error
    if(err){
        console.log(err.code);
        console.log(err.fatal);
        console.log(err)
    }
});

// Perform a query
$query = 'SELECT * from tindang LIMIT 10';

connection.query($query, function(err, rows, fields) {
    if(err){
        console.log("An error ocurred performing the query.");
        return;
    }

    console.log("Query succesfully executed: ", rows);
});

// Close the connection
connection.end(function(){
    // The connection has been closed
});
