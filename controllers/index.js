const fs = require("fs");
console.log('Registring Controllers ...')
fs.readdirSync(__dirname)
  .filter((file) => file !== "index.js"&&file.endsWith('.js'))
  .forEach((controller) => {
    exports[`${controller.replace(".js", "Controller")}`] =  require("./" + controller);
    // console.log(`registred Controller ${controller.replace(".js", "Controller")}`);
  });
