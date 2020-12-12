const sql = require("./db.js");
const Mark = function(mark)
{
    this.id_tindang = mark.id_tindang;
    this.id_nguoiluutin = mark.id_nguoiluutin;
}
Mark.getAll = result => {
    sql.query("SELECT * FROM tindaluu t LEFT JOIN user u on t.id_nguoiluutin = u.id LEFT JOIN tindang td on t.id_tindang = td.id_tindang", (err, res) => {
      if (err) {
        console.log("error: ", err);
        result(null, err);
        return;
      }
      console.log("Tin da luu: ", res);
      result(null, res);
    });
  };
Mark.remove = (mark,result) => {
    sql.query("DELETE FROM tindaluu WHERE id_tindang = ? AND id_nguoiluutin = ? ", [mark.id_tindang, mark.id_nguoiluutin], (err, res) => {
      if (err) {
        console.log("error: ", err);
        result(null, err);
        return;
      }
  
      if (res.affectedRows == 0) {
        // not found Customer with the id
        result({ kind: "not_found" }, null);
        return;
      }
  
      console.log("deleted tindaluu");
      result(null, res);
    });
  };
  Mark.create = (newMark, result) => {
    sql.query("INSERT INTO tindaluu SET ?", newMark, (err, res) => {
      if (err) {
        console.log("error: ", err);
        result(err, null);
        return;
      }

      sql.query("SELECT * FROM tindaluu t LEFT JOIN user u on t.id_nguoiluutin = u.id LEFT JOIN tindang td on t.id_tindang = td.id_tindang ORDER BY t.id DESC LIMIT 1", (err, res) => {
        if (err) {
          console.log("error: ", err);
          result(null, err);
          return;
        }
        console.log("Tin da luu: ", res);
        result(null, {message: "Luu tin thanh cong"});
      });
    });
  };
  Mark.search = (req, result) => {
    var id_nguoiluutin = req.query.id_nguoiluutin;

    var qr = "SELECT * FROM tindaluu t JOIN tindang td ON t.id_tindang = td.id_tindang join user u on u.id  = t.id_nguoiluutin WHERE 1 ";
    if (id_nguoiluutin !== undefined)
    {
      qr = qr.concat(" AND id_nguoiluutin = ",id_nguoiluutin);
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
  Mark.getArrTindaluu = (req, result) => {
    var id_nguoiluutin = req.query.id_nguoiluutin;

    var qr = `SELECT id_tindang FROM tindaluu  WHERE id_nguoiluutin  = ${id_nguoiluutin}`;

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
  module.exports = Mark;
