const sql = require("./db.js");
const Banner = function(banner)
{
    this.id = banner.id;
    this.name = banner.id;
    this.description = banner.description;
    this.image = banner.image;
}
Banner.getAll = result => {
    sql.query("SELECT * FROM danhmuctin", (err, res) => {
      if (err) {
        console.log("error: ", err);
        result(null, err);
        return;
      }
      console.log("Danh muc tin: ", res);
      result(null, res);
    });
  };

  module.exports = Banner;