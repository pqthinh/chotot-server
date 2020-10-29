const express = require('express')
const app =express()
const mysql =  require('mysql')
const bodyParser = require('body-parser')

app.use(bodyParser.json())
app.use(bodyParser.urlencoded({
    extended: true
}))

var conn = mysql.createConnection({
    host: 'remotemysql.com',
    user: 'ZduVtEX3Nd',
    password: 'bleVGxRMN2',
    database: 'ZduVtEX3Nd',
    port: 3306
});

// connect to mysql
conn.connect(function(err) {
    if(err) console.log(err)
    else console.log("Connected")
});

// router

app.get('/', (req,res)=>{
    res.json({send:"Hello world"})
})

app.get('/tindang', (req, res)=>{
    let sql =  "select * from tindang order by 1"
    conn.query(sql,(err, result)=>{
        if (err ) throw err
        res.json({result})
        console.log(result)
    })
})

// set port

const PORT = process.env.PORT || 4000;
app.listen(PORT)

// module.exports = app