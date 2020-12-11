const Mark = require("../models/mark.models.js");
exports.findAll = (req, res) => {
    Mark.getAll((err, data) => {
      if (err)
        res.status(500).send({
          message:
            err.message || "Some error occurred while retrieving mark."
        });
      else res.send(data);
    });
};

exports.create = (req, res) => {
  if (!req.body) {
    res.status(400).send({
      message: "Content can not be empty!"
    });
  }
  const mark = new Mark({
    id_tindang: req.body.id_tindang,
    id_nguoiluutin: req.body.id_nguoiluutin
  });
  Mark.create(mark, (err, data) => {
    if (err)
      res.status(500).send({
        message:
          err.message || "Some error occurred while creating the Mark."
      });
    else res.send(data);
  });                        
};


exports.search = (req, res) => {
  Mark.search(req ,(err, data) => {
    if (err)
      res.status(500).send({ 
        message:
          err.message || "Some error occurred while retrieving mark."
      });
    else res.send(data);
  });
};

exports.delete = (req, res) => {
  const mark = new Mark({
    id_tindang: req.body.id_tindang,
    id_nguoiluutin: req.body.id_nguoiluutin
  });
  Mark.remove(mark ,  (err, data) => {
    if (err) {
      if (err.kind === "not_found") {
        res.status(404).send({
          message: `Not found Tindang or User.`
        });
      } else {
        res.status(500).send({
          message: "Could not delete tindaluu with id "
        });
      }
    } else res.send({ message: `Tindaluu was deleted successfully!` });
  });
};