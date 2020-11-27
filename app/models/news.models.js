const sql = require("./db.js");
const News = function(news)
{
    this.id = news.id;
    this.product = news.product;
    this.sellerId = news.sellerId;
    this.address = news.address;
    this.price = news.price;
    this.date = news.date;
    this.image = news.image;
}
News.getAll = result => {
    sql.query("SELECT * FROM tindang", (err, res) => {
      if (err) {
        console.log("error: ", err);
        result(null, err);
        return;
      }
      console.log("Tin dang: ", res);
      result(null, res);
    });
  };


 News.findById = (newsid, result) => {
    sql.query(`SELECT * FROM tindang WHERE id_tindang = ${newsid}`, (err, res) => {
      if (err) {
        console.log("error: ", err);
        result(err, null);
        return;
      }
  
      if (res.length) {
        console.log("found news: ", res[0]);
        result(null, res[0]);
        return;
      }
  
      // not found Customer with the id
      result({ kind: "not_found" }, null);
    });
  };

  News.search = (req, result) => {
    var price = req.query.price;
    var type = req.query.type;
    var qr = "SELECT * FROM tindang WHERE 1";
    if (price !== undefined)
    {
      qr = qr.concat(" AND giaban = ",price);
    }
    if (type !== undefined)
    {
      qr = qr.concat(" AND id_danhmuc = ",type);
    }
    sql.query(qr,(err, res) => {
      if (err) {
        console.log("error: ", err);
        result(null, err);
        return;
      }
      console.log("Tin dang: ", res);
      result(null, res);
    });
  };

  module.exports = News;
