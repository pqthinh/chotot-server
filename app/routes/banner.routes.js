module.exports = app => {
  const banner = require("../controllers/banner.controllers.js");
  app.get("/banner", banner.findAll);
};