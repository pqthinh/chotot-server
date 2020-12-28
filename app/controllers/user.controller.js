const User = require("../models/user.models.js");
exports.findAll = (req, res) => {
    User.getAll((err, data) => {
      if (err)
        res.status(500).send({
          message:
            err.message || "Some error occurred while retrieving user."
        });
      else res.send(data);
    });
  };

  exports.login = (req, res) => {
    const email = req.body.email;
    const password = req.body.password;
    if (!email || ! password) {
      res.status(400).send({
        message: "Email or password cannot empty"
      });
    }
    User.login_(email, password, (err, data) => {
      if (err)
        res.status(500).send({
          message:
            err.message || "Wrong password or email"
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
    const user = new User({
      email : req.body.email,
      name : req.body.name,
      mobile : req.body.mobile,
      password : req.body.password,
      role : req.body.role,
      status : "pendding",
      avatar : "https://cdn.icon-icons.com/icons2/1378/PNG/512/avatardefault_92824.png"
    });
    User.create(user, (err, data) => {
      if (err)
        res.status(500).send({
          message:
            err.message || "Some error occurred while creating user."
        });
      else res.send(data);
    });                        
  };
  exports.updatePassword = (req, res) => {
    // Validate Request
    if (!req.body) {
      res.status(400).send({
        message: "Content can not be empty!"
      });
    }
  
    User.updateById(req.params.id, req.body.password,(err, data) => {
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
  