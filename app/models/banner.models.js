const sql = require("./db.js");
const Banner = function(banner)
{
    this.id_banner = banner.id_banne;
    this.link = banner.link;
}

Banner.getAll = result => {
    sql.query("SELECT link FROM `banner_images` where chucnang=1", (err, res) => {
      if (err) {
        console.log("error: ", err);
        result(null, err);
        return;
      }
      console.log("Banner slider: ", res);
      result(null, res);
    });
  };

module.exports = Banner;