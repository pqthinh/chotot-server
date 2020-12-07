const express = require("express");
const bodyParser = require("body-parser");
const fileUpload = require("express-fileupload");
const path = require('path');
const app = express();

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static(path.join(__dirname, 'public')));
app.use(fileUpload());
app.get("/", (req, res) => {
  res.json({ message: "Welcome to my app" });
});
 
require("./app/routes/news.routes.js")(app);
require("./app/routes/banner.routes.js")(app);
require("./app/routes/category.routes")(app);
require("./app/routes/user.routes")(app)

const PORT = process.env.PORT || 4000;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}.`);
});