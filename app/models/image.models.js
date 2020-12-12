const sql = require( './db')
// const baseUrl = "http://localhost:4000"
const baseUrl = "http://192.168.101.109:3000"
const image = {
    addImageFile: async (req, res, next) =>{
        console.log(req.files)
        // console.log(req.body.file.length)
        if (req.files === null) {
            console.log("nullllllllllll")
            return res.status(404).json({ msg: 'No file uploaded' });
        }
        const file = req.files.file;
        var arr = []
        if(file.length>1)
            file.map(x=> {
                var link = `data/uploads/image/${new Date().getTime() +"_"+ x.name}`
                x.mv(`${__dirname}/../../${link}`, err => {
                    if (err) {
                        console.error(err);
                        return res.status(500).send(err);
                    }
                });
                arr.push(`${baseUrl}/${link}`)
            })
        else {
            var link = `data/uploads/image/${new Date().getTime() +"_"+ file.name}`
            file.mv(`${__dirname}/../../${link}`, err => {
                if (err) {
                    console.error(err);
                    return res.status(500).send(err);
                }
            });
            arr.push( `${baseUrl}/${link}`)
        }
        console.log(arr)
        res.json({status: "200 Ok", path: arr});

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
            arr.push(`${baseUrl}/data/uploads/image/${new Date().getTime() +"_"+ key}.jpg`)
        }

        const id_tin = req.body.idtin
        var value = `( '${id_tin}' , '${arr[0]}' ) `
        for(let i=1; i<arr.length;i++) {
            value+= ` , ( '${id_tin}' , '${arr[i]}' ) `
        }
        sqlquery = `insert into hinhanh (id_tindang, link) values  ${value}`
        
       console.log(sqlquery)

    }
}
module.exports = image