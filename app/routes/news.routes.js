module.exports = app => {
    const news = require("../controllers/news.controllers.js");
    app.get("/news", news.findAll);
    app.get("/news/:newsId", news.findOne);
  };