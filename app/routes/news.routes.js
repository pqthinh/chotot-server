module.exports = app => {
    const news = require("../controllers/news.controllers.js");
    app.get("/tindang", news.findAll);
    app.get("/tindang/:newsId", news.findOne);
    app.get("/search", news.search);
    app.post("/tindang", news.create);
    app.put("/tindang/:id", news.update);
    app.put("/updatetindang/:id", news.updateState);
    app.put("/updateimage/:id", news.updateimage);
    
};
