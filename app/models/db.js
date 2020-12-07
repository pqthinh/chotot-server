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
      console.log('error when connecting to db:', error);
      setTimeout(handleDisconnect, 2000)
    }
    console.log("Successfully connected to the database.")

  });                                 
                                          
  connection.on('error', function(err) {
      console.log('db error', err);
      // err.code === 'PROTOCOL_CONNECTION_LOST' || err.code === 'PROTOCOL_ENQUEUE_AFTER_FATAL_ERROR'
      if(err) { 
          connection.end(function(err) {
            if (err) {
              return console.log('error:' + err.message);
            }
            console.log('Close the database connection.');
          });
          handleDisconnect();                         
      } else {           
          console.log(err)                           
          throw err                               
      }
  });
}

handleDisconnect();

module.exports = connection;