const express = require('express')
const app =express()
// const mysql =  require('mysql')
const bodyParser = require('body-parser')

app.use(bodyParser.json())
app.use(bodyParser.urlencoded({
    extended: true
}))

const [func, conn ] = require('../connect')
// router

app.get('/', (req,res)=>{
    res.json({send:"This page is only for test purpose"})
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