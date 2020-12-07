const sql = require( './db')

const user = {
    getAll : (req, res, next) =>{ 
        let cm = `select * from user `
        sql.query(cm, (err, result) =>{
            if (err) {
                console.log("error: ", err);
                next(null, err);
                return;
            }
            console.log("User: ", result);
            res.json({user: result})
            next(null, result);
        })
    },
    login :  (req, res, next) =>{
        const email = req.body.email, password = req.body.password
        if(!email || !password) {
            res.status(400).send({ 
                message:
                err.message || "Email hoac mat khau la bat buoc nhap"
            });
        }
        let cm = `select * from user where email = ? and password = ?`
        // cm = `select * from user where email = ${email} and password = ${password}`
        sql.query(cm, [email, password], (err, result) => {
            if (err) {
                console.log("error: ", err);
                next(null, err);
                return;
            }
            else {
                // const result = sql.query(query)
                console.log(result.length == 0)

                if(result.length == 0) {
                    res.json({ 
                        message: "Email hoac mat khau khong dung"
                    });
                    next(null, result);
                }
                else if(result.length > 1) {
                    res.json({ message: "Loi he thong" });
                    next(null, result);
                } else if (result.length ==1 ){
                    res.json(
                        {
                            message: "Dang nhap thanh cong",
                            user: result
                        }
                    )
                    next(null, result);
                }
                
            }
        })
        
    },
    
}
module.exports = user