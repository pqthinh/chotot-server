const routes = (app) => {
    const image =  require("../models/image.models")
    app.post("/image/", image.addImageFile)
    // image la file truyen vao formdata : {file : [files images] }
    // id tin : body request
    // anh khi upload nam trong folder data/uploads/images
    app.post("/image/base64", image.addImageBase64)
    // truyen data image qua body request
}

module.exports = routes