module.exports = app => {
    const news = require("../controllers/news.controllers.js");
    app.get("/tindang", news.findAll);
    app.get("/tindang/:newsId", news.findOne);
    app.get("/search", news.search);
  };
