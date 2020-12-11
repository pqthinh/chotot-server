module.exports = app => {
    const mark = require("../controllers/mark.controllers.js");
    app.get("/mark", mark.search);
    app.post("/mark", mark.create);
    app.delete("/mark", mark.delete)
};