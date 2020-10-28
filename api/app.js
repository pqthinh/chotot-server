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

app.get('/', (req,res)=>{
    res.json({send:"Hello world"})
})

app.get('/test', (req, res)=>{
    res.json({ message:'Test api tindang'})
})

app.get('/tindang', (req, res)=>{
    let sql =  "select * from tindang order by 1"
    conn.query(sql,(err, result)=>{
        if (err ) throw err
        res.json({result})
        console.log(result)
    })
})

app.post('/tindang', (req, res)=>{
    let name = req.body.name? req.body.name: ''
    let email = req.body.email? req.body.email: ''
    let phone = req.body.phone? req.body.phone: ''
    let address = req.body.address? req.body.address: ''
    let status = req.body.status? req.body.status: ''
    let sql = `select * from tindang where name like '%${name}%' and email like '%${email}%' and phone like '%${phone}%' and address like '%${address}%' and status = '${status}'`
    conn.query(sql, (err, result)=>{
        if(err) throw err
        res.json({customer: result})
    })
    console.log(req.body)
    console.log(sql)
})

app.post('/tindang/add', (req, res)=>{
    let name = req.body.name? req.body.name: ''
    let email = req.body.email? req.body.email: ''
    let phone = req.body.phone? req.body.phone: ''
    let address = req.body.address? req.body.address: ''
    let status = req.body.status? req.body.status: ''
    let sql = `insert into customer(name, email, phone, address, status) values('${name}','${email}','${phone}','${address}','${status}')`
    conn.query(sql, (err, result)=>{
        if(err) throw err
        res.json('success insert data')
    })
    console.log(req.body)
    console.log(sql)
})

app.post('/tindang/edit', (req, res)=>{
    let name = req.body.name? req.body.name: ''
    let email = req.body.email? req.body.email: ''
    let phone = req.body.phone? req.body.phone: ''
    let address = req.body.address? req.body.address: ''
    let status = req.body.status? req.body.status: ''
    let id= req.body.id
    let sql = `update customer set name='${name}', email='${email}',phone='${phone}',address='${address}',status='${status}' where id=${id}`
    conn.query(sql, (err, result)=>{
        if(err) throw err
        res.json('success update data')
    })
    console.log(req.body)
    console.log(sql)
})

app.delete('/tindang/delete', (req, res) =>{
    console.log(req.body)
    let id = req.body.id
    let sql =`delete from customer where id =${id}`
    conn.query(sql, (err, result)=>{
        if(err) throw err
        res.json('success delete data')
    })
    console.log(req.body)
    console.log(sql)
})

app.get('/tindang/:id', (req,res)=>{
    let id= req.params.id
    if(typeof id == 'number') {
        let sql = `select * from customer where id=${id+1}`
        console.log(sql)
        conn.query(sql, (err, result)=>{
            if(err) console.log(err)
            res.json({customer: result})
        })
    } else return;
})
app.post('/tindang/add', (req, res)=>{
    
    let name = req.body.name
    let phone = req.body.phone
    let email = req.body.email
    let address = req.body.address
    let sta = req.body.status
    
    let sql =`insert into customer(name,phone, email, address, status) values ('${name}', '${phone}','${email}','${address}','${sta}')`
    
    conn.query(sql, (err)=>{
        if(err) throw err
    })

    conn.query('select * from customer', (err, result)=>{
        if(err) console.log(err)
        let idc = result[result.length-1].id
        console.log(result[result.length-1])
        console.log(idc)
        let username = req.body.username
        let pass = req.body.pass
        let sql2 = `insert into login(id, username, pass, timeup) values(${idc}, '${username}', '${pass}', CURRENT_TIME())`

        conn.query(sql2, (err, result)=>{
            if(err) throw err
            res.json({message: 'Success'})
        })
    })

    
})

app.post('/login', (req, res)=>{
    let username= req.body.username
    let pass = req.body.pass
    let sql = `select * from login where username= '${username}' and pass = '${pass}'`
    conn.query(sql, (err, result)=>{
        if(err) console.log(err)
        else {
            //res.json(result)
            (result.length>0? res.json({status: "Success"}): res.json({status: "Error"}))
        }
    })
})

// app.listen(4000, ()=>{
//     console.log("App running at port 4000")
// })



const PORT = process.env.PORT || 4000;

app.listen(PORT);


module.exports = app