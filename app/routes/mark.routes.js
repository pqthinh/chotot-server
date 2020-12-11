module.exports = app => {
    const mark = require("../controllers/mark.controllers.js");
    app.get("/mark", mark.findAll);
    app.post("/mark", mark.create);
    app.delete("/mark", mark.delete)
};