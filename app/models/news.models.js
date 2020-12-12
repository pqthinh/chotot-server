const sql = require("./db.js");
const News = function(news)
{
    this.id_tindang = news.id_tindang;
    this.ten = news.ten;
    this.idnguoiban = news.idnguoiban;
    this.diadiem = news.diadiem;
    this.giaban = news.giaban;
    this.describe = news.describe;
    this.ngaydangtin = news.ngaydangtin;
    this.tendanhmuc = news.tendanhmuc;
    this.trangthai = news.trangthai;
    this.anh = news.anh;
    this.loaitin = news.loaitin;
}
News.getAll = result => {
    sql.query("SELECT * FROM tindang t join user u on t.idnguoiban = u.id  order by id_tindang desc", (err, res) => {
      if (err) {
        console.log("error: ", err);
        result(null, err);
        return;
      }
      console.log("Tin dang: ", res.length);
      result(null, res);
    });
  };

  News.create = (newNews, result) => {
    delete newNews.id_tindang;
    delete newNews.ngaydangtin;
    delete newNews.trangthai;
    console.log(newNews)
    sql.query("INSERT INTO tindang SET ?", newNews, (err, res) => {
      if (err) {
        console.log("error: ", err);
        result(err, null);
        return;
      }
  
      console.log("created news: ", { id_tindang: res.insertId, ...newNews });
      result(null, { id_tindang: res.insertId });
    });
  };

News.findById = (newsId, result) => {
    sql.query(`SELECT * FROM tindang t join user u on t.idnguoiban = u.id where id_tindang = ${newsId}`, (err, res) => {
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

  News.updateImageById = (id, image, result) => {
    sql.query(
      "UPDATE tindang SET anh = ?  WHERE id_tindang = ?",
      [image, id],
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
  
        console.log("updated news: ", { id_tindang: id});
        result(null, { id_tindang: id});
      }
    );
  };



News.search = (req, result) => {
  var tensp = req.query.tensp;
  var min_price = req.query.min_price;
  var max_price = req.query.max_price;
  var type = req.query.type;
  var address = req.query.address;
  var state = req.query.state;
  var owner = req.query.owner;
  var sort = req.query.sort;
  var loaitin = req.query.loaitin
  console.log(req.query)
  var qr = "SELECT * FROM tindang t join user u on t.idnguoiban = u.id WHERE 1";
  if (min_price &&  min_price !== "undefined" && loaitin !== "Cần mua")
  {
    qr += ` AND giaban between ${min_price} and ${max_price}`
  }

  if (type &&  type !== "undefined")
  {
    qr += ` AND tendanhmuc LIKE  '%${type}%'`;
  }
  if (address &&  address !== "undefined" && address !== "null")
  {
    qr += ` AND diadiem LIKE  '%${address}%'`;
  }
  if (state &&  state!== "undefined")
  {
    qr = qr.concat(" AND trangthai = ",state);
  }
  if (owner &&  owner!== "undefined")
  {
    qr = qr.concat(" AND idnguoiban = ",owner);
  }
  if (tensp &&  tensp !== "undefined")
  {
    qr += ` AND ten LIKE  '%${tensp}%'`;
  }

  if (sort)
  {
    if(sort==="cost")
      qr += ` order by giaban `;
    else if(sort === "time")
      qr += ` order by ngaycapnhat desc`;
  }

  if(loaitin && loaitin !== "null") {
    if(loaitin==="Cần bán" || loaitin === "Cần mua")
      qr += ` and loaitin = '${loaitin}' `;
  }
  sql.query(qr,(err, res) => {
    if (err) {
      console.log("error: ", err);
      result(null, err);
      return;
    }
    console.log(qr);
    result(null, res);
  });
};


  module.exports = News;
