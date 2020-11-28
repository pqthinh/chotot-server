const sql = require("./db.js");
const Category = function(category)
{
    this.id = category.id;
    this.name = category.id;
    this.description = category.description;
    this.image = category.image;
}
Category.getAll = result => {
    sql.query("SELECT * FROM `danhmuctin` ", (err, res) => {
      if (err) {
        console.log("error: ", err);
        result(null, err);
        return;
      }
      console.log("Danh muc tin: ", res);
      result(null, res);
    });
  };

  module.exports = Category;