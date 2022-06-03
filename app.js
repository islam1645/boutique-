require("dotenv").config();
const express = require("express");
const bodyParser = require("body-parser");
const cors = require("cors");
const morgan = require("morgan");
const { sequelize } = require("./models");
const passport = require("passport");
require("./utils/passport")(passport);
const app = express();
app.use(bodyParser.json({ extended: true }));
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.text({ extended: true }));
app.use(morgan("dev"));
var cron = require("node-cron");
app.use(cors());
app.use(passport.initialize());
require("./routes")(app);


app.get("/", passport.authenticate('jwt', {}), (req, res) => {
	res.json({
		message: "Hello world!!",
	});
});

cron.schedule("0 0 0 * * *", () => {
	const fn = Date.now();
	exec(
		`C:\\xampp\\mysql\\bin\\mysqldump.exe --somdae --host=${process.env.DB_URL} --user=${process.env.DB_USERNAME} --password="${process.env.DB_PASSWORD}" ${process.env.DB_NAME} > ./backups/${fn}.sql`,
		(err, stdout, stderr) => {
			if (err) {
				console.log("automatique backup failed: ");
				console.log(err);
				return;
			}
			console.log("automatique backup success");
		}
	);
});
sequelize
	.sync({
		force: false
		, logging: false
	})
	.then(() => {
		return app.listen(process.env.PORT || 2931, (p) => {
			console.log(
				"app started at http://localhost:" + (process.env.PORT || 8081)
			);
			return app;
		});
	})
	.catch((err) => {
		throw err;
	});
