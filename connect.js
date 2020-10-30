const mysql =  require('mysql')

var db_config = {
    host: 'remotemysql.com',
    user: 'ZduVtEX3Nd',
    password: 'bleVGxRMN2',
    database: 'ZduVtEX3Nd',
    port: 3306
};

var connection;

function handleDisconnect() {
    connection = mysql.createConnection(db_config); 

    connection.connect(function(err) {              
        if(err) {                                    
            console.log('error when connecting to db:', err);
            setTimeout(handleDisconnect, 2000); 
        }                                     
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

module.exports = [handleDisconnect(), connection];


// var conn = mysql.createConnection({
//     host: 'remotemysql.com',
//     user: 'ZduVtEX3Nd',
//     password: 'bleVGxRMN2',
//     database: 'ZduVtEX3Nd',
//     port: 3306
// });

// // connect to mysql
// conn.connect(function(err) {
//     if(err) console.log(err)
//     else console.log("Connected")
// });
