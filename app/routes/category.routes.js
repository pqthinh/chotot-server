module.exports = app => {
    const category = require("../controllers/category.controllers.js");
    app.get("/category", category.findAll);
  };