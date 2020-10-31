const sql = require("./db.js");
const News = function(news)
{
    this.id = news.id;
    this.product = news.product;
    this.sellerId = news.sellerId;
    this.address = news.address;
    this.price = news.price;
    this.date = news.date;
    this.image = image;
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

News.findById = (newsId, result) => {
    sql.query("SELECT * FROM tindang where id = newsId", (err, res) => {
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
  
      // not found News with the id
      result({ kind: "not_found" }, null);
    });
  };
  module.exports = News;
