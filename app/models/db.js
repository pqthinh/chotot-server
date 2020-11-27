const mysql = require("mysql");
const dbConfig = require("../config/db.config.js");


var connection 

function handleDisconnect() {
  // Create a connection to the database
  connection = mysql.createConnection({
    host: dbConfig.HOST,
    user: dbConfig.USER,
    password: dbConfig.PASSWORD,
    database: dbConfig.DB,
  });

  // open the MySQL connection
  connection.connect(error => {
    if (error) {
      console.log('error when connecting to db:', err);
      setTimeout(handleDisconnect, 2000);
    }
    console.log("Successfully connected to the database.");

  });                                 
                                          
  connection.on('error', function(err) {
      console.log('db error', err);
      if(err.code === 'PROTOCOL_CONNECTION_LOST') { 
          handleDisconnect();                         
      } else {                                      
          throw err;                                  
      }
  });
}

handleDisconnect();

module.exports = connection;