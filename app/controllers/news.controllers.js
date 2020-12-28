const News = require("../models/news.models.js");
exports.findAll = (req, res) => {
    News.getAll((err, data) => {
      if (err)
        res.status(500).send({
          message:
            err.message || "Some error occurred while retrieving news."
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
  const news = new News({
    ten: req.body.ten,
    idnguoiban: req.body.idnguoiban,
    diadiem: req.body.diadiem,
    giaban: req.body.giaban,
    describe: req.body.mieuta,
    ngaydangtin: req.body.ngaydangtin,
    tendanhmuc: req.body.tendanhmuc,
    loaitin: req.body.loaitin,
    trangthai: req.body.trangthai,
    anh: req.body.anh
  });
  News.create(news, (err, data) => {
    if (err)
      res.status(500).send({
        message:
          err.message || "Some error occurred while creating the News."
      });
    else res.send(data);
  });                        
};




exports.search = (req, res) => {
  News.search(req ,(err, data) => {
    if (err)
      res.status(500).send({ 
        message:
          err.message || "Some error occurred while retrieving news."
      });
    else res.send(data);
  });
};


exports.findOne = (req, res) => {
    News.findById(req.params.newsId, (err, data) => {
      if (err) {
        if (err.kind === "not_found") {
          res.status(404).send({
            message: `Not found News with id ${req.params.newsId}.`
          });
        } else {
          res.status(500).send({
            message: "Error retrieving news with id " + req.params.newsId
          });
        }
      } else res.send(data);
    });
  };

  exports.updateState = (req, res) => {
    News.updateStateById(req.params.id, (err, data) => {
      if (err) {
        if (err.kind === "not_found") {
          res.status(404).send({
            message: `Not found News with id ${req.params.id}.`
          });
        } else {
          res.status(500).send({
            message: "Error retrieving news with id " + req.params.id
          });
        }
      } else res.send(data);
    });
  };
  exports.update = (req, res) => {
    // Validate Request
    if (!req.body) {
      res.status(400).send({
        message: "Content can not be empty!"
      });
    }
  
    News.updateById(req.params.id, new News(req.body),
      (err, data) => {
        if (err) {
          if (err.kind === "not_found") {
            res.status(404).send({
              message: `Not found news with id ${req.params.id}.`
            });
          } else {
            res.status(500).send({
              message: "Error updating Customer with id " + req.params.id
            });
          }
        } else res.send(data);
      }
    );
  };

  exports.updateimage = (req, res) => {
    // Validate Request
    if (!req.body.image) {
      res.status(400).send({
        message: "Content can not be empty!"
      });
    }
  
    News.updateImageById(req.params.id, req.body.image,
      (err, data) => {
        if (err) {
          if (err.kind === "not_found") {
            res.status(404).send({
              message: `Not found news with id ${req.params.id}.`
            });
          } else {
            res.status(500).send({
              message: "Error updating News with id " + req.params.id
            });
          }
        } else res.send(data);
      }
    );
  };