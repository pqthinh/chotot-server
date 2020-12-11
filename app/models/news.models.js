const sql = require("./db.js");
const News = function(news)
{
    this.id_tindang = news.id_tindang;
    this.ten = news.ten;
    this.idnguoiban = news.idnguoiban;
    this.diadiem = news.diadiem;
    this.giaban = news.giaban;
    this.ngaydangtin = news.ngaydangtin;
    this.tendanhmuc = news.tendanhmuc;
    this.trangthai = news.trangthai;
    this.anh = news.anh;
    this.loaitin = news.loaitin;
}
News.getAll = result => {
    sql.query("SELECT * FROM tindang order by id_tindang desc", (err, res) => {
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
  
      console.log("created news: ", { id_tindang: res.insertId, ...newNews });
      result(null, { message: "Them tin dang thanh cong!" });
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

  News.updateById = (id, news, result) => {
    sql.query(
      "UPDATE tindang SET ten = ?, diadiem = ?, giaban = ?, ngaydangtin = ?, tendanhmuc = ?, trangthai = ?, loaitin = ?, anh = ?  WHERE id_tindang = ?",
      [news.ten, news.diadiem,news.giaban,news.ngaydangtin,news.tendanhmuc,news.trangthai, news.loaitin,news.anh, id],
      (err, res) => {
        if (err) {
          console.log("error: ", err);
          result(null, err);
          return;
        }
  
        if (res.affectedRows == 0) {
          // not found news with the id
          result({ kind: "not_found" }, null);
          return;
        }
  
        console.log("updated news: ", { id_tindang: id, ...news });
        result(null, { id_tindang: id});
      }
    );
  };
  
News.search = (req, result) => {
  var min_price = req.query.min_price;
  var max_price = req.query.max_price;
  var type = req.query.type;
  var address = req.query.address;
  var state = req.query.state;
  var qr = "SELECT * FROM tindang WHERE 1";
  if (min_price !== undefined)
  {
    qr = qr.concat(" AND giaban > ",min_price);
  }

  if (max_price !== undefined)
  {
    qr = qr.concat(" AND giaban < ",max_price);
  }
  if (type !== undefined)
  {
    qr = qr.concat(" AND tendanhmuc LIKE ",type);
  }
  if (address !== undefined)
  {
    qr = qr.concat(" AND diadiem LIKE ",address);
  }
  if (state !== undefined)
  {
    qr = qr.concat(" AND trangthai = ",state);
  }
  sql.query(qr,(err, res) => {
    if (err) {
      console.log("error: ", err);
      result(null, err);
      return;
    }
    console.log(qr, res);
    result(null, res);
  });
};


  module.exports = News;
