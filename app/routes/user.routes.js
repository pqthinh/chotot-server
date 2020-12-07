const routes = (app) => {
    const user =  require("../models/user.models")
    app.post("/user/login", user.login)
    app.get("/user/all", user.getAll)
}

module.exports = routes