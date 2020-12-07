module.exports = app => {
    const user =  require("../controllers/user.controller.js");
    app.get("/user/all", user.findAll);
    app.post("/user/create", user.create);
    app.post("/user/login", user.login);
};
