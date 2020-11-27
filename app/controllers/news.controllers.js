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