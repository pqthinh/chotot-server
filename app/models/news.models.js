const sql = require("./db.js");
const News = function(news)
{
    this.id_tindang = news.id_tindang;
    this.ten = news.ten;
    this.idnguoiban = news.idnguoiban;
    this.diadiem = news.diadiem;
    this.giaban = news.giaban;
    this.ngaydangtin = news.ngaydangtin;
    this.anh = news.anh;
    this.tendanhmuc = news.tendanhmuc;
    this.trangthai = news.trangthai;
    this.loaitin = news.loaitin;
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

  News.create = (newNews, result) => {
    sql.query("INSERT INTO tindang SET ?", newNews, (err, res) => {
      if (err) {
        console.log("error: ", err);
        result(err, null);
        return;
      }
  
      console.log("created news: ", { id: res.insertId, ...newNews });
      result(null, { id: res.insertId, ...newNews });
    });
  };

News.findById = (newsId, result) => {
    sql.query(`SELECT * FROM tindang where id_tindang = ${newsId}`, (err, res) => {
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
