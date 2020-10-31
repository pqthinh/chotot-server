const Banner = require("../models/banner.models.js");

exports.findAll = (req, res) => {
    Banner.getAll((err, data) => {
      if (err)
        res.status(500).send({
          message:
            err.message || "Some error occurred while retrieving banner."
        });
      else res.send(data);
    });
};
