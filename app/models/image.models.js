const sql = require( './db')

const image = {
    addImageFile: async (req, res, next) =>{
        if (req.files === null) {
            return res.status(400).json({ msg: 'No file uploaded' });
        }
        function base64Encode(file) {
            var body = fs.readFileSync(file);
            return body.getTime('base64');
        }
        const file = req.files.file;
        var arr = []
        if(file.length>1)
            file.map(x=> {
                x.mv(`${__dirname}/../../data/uploads/image/${new Date().getTime() +"_"+ x.name}`, err => {
                    if (err) {
                        console.error(err);
                        return res.status(500).send(err);
                    }
                    // console.log(base64Encode(`${__dirname}/../../data/uploads/image/${file.name}`))
                    
                });
                arr.push(`http://localhost:4000/data/uploads/image/${new Date().getTime() +"_"+ x.name }`)
            })
        else {
            file.mv(`${__dirname}/../../data/uploads/image/${new Date().getTime() +"_"+ file.name }`, err => {
                if (err) {
                    console.error(err);
                    return res.status(500).send(err);
                }
                // console.log(base64Encode(`${__dirname}/../../data/uploads/image/${file.name}`))
                
            });
            arr.push( `http://localhost:4000/data/uploads/image/${new Date().getTime()+ file.name }`)
        }
        console.log(arr)
        res.json({status: "200 Ok", path: arr});

        // Them link tai mang arr vao bang trong csdl
        // truyen vao id tin trong body request

        //Chen anh vao bang * dang fix loi
    //     const id_tin = req.body.idtin
    //     var value = `( '${id_tin}' , '${arr[i]}' ) `
    //     for(let i=1; i<arr.length;i++) {
    //         value+= ` , ( '${id_tin}' , '${arr[i]}' ) `
    //     }
    //     sqlquery = `insert into hinhanh (id_tindang, link) values  ${value}`
    //     // sql.query(sqlquery, (err, result) => {
    //     //     if(err) {
    //     //         console.log(err)
    //     //         throw(err)
    //     //     }
    //     //     res.json({msg: "success",filePath: arr})
    //     // })
    //    console.log(sqlquery)
    },
    addImageBase64: async (req, res, next)=>{
        const data = req.body
        if(!data) res.json({msg:"No images"})
        function base64_decode(base64str, file) {
            var bitmap = new Buffer(base64str, 'base64');
            fs.writeFileSync(file, bitmap);
        }
        var arr = []
        for(const key in data ) {
            var imagebase64 = data[key].split(',')[1]
            base64_decode( imagebase64, `${__dirname}/../../data/uploads/image/${new Date().getTime() +"_"+ key}.jpg`);
            arr.push(`http://localhost:4000/data/uploads/image/${new Date().getTime() +"_"+ key}.jpg`)
        }

        // Chen anh vao csdl
        
        const id_tin = req.body.idtin
        var value = `( '${id_tin}' , '${arr[0]}' ) `
        for(let i=1; i<arr.length;i++) {
            value+= ` , ( '${id_tin}' , '${arr[i]}' ) `
        }
        sqlquery = `insert into hinhanh (id_tindang, link) values  ${value}`
        // sql.query(sqlquery, (err, result) => {
        //     if(err) {
        //         console.log(err)
        //         throw(err)
        //     }
        //     res.json({msg: "success",filePath: arr})
        // })
       console.log(sqlquery)

       // ok
    }
}
module.exports = image