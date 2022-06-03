const fs = require('fs')
var exec = require("child_process").exec;
const { UserController } = require('../controllers')
const { isAuth } = require('../middlewares/Auth')
const passport = require("passport");
module.exports = (app) => {
    app.post('/register', UserController.register)
    app.post('/login', passport.authenticate("local", { session: false }), UserController.login)
    app.get('/checklogin', isAuth(), UserController.checklogin)
    console.log('Registring Routes ...')
    fs.readdirSync(__dirname).filter(file => file !== "index.js" && file.endsWith('.js')).forEach((router) => {
        app.use(`/${router.replace('.js', '')}`, require('./' + router))
        console.log(`registred route ${router.replace('.js', '')}`)
    })
    app.get("/dump", async (req, res) => {
        const fn = Date.now();
        exec(
            `C:\\xampp\\mysql\\bin\\mysqldump.exe --databases --host=${process.env.DB_URL} --user=${process.env.DB_USERNAME} --password="${process.env.DB_PASSWORD}" ${process.env.DB_NAME} > ./backups/${fn}.sql`,
            (err, stdout, stderr) => {
                if (err) {
                    console.log(err);
                    res.status(500).send(err);
                    return;
                }
                res.download(`./backups/${fn}.sql`);
            }
        );
    });
    app.get('/lastdump', async (req, res) => {
        const files = fs.readdirSync('./backups/');
        const last = files.sort().reverse()[0];
        console.log(last);
        res.download(`./backups/${last}`);
    })
}