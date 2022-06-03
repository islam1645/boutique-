const fs = require("fs");
const path = require("path");
const Sequelize = require("sequelize");

const db = {};
const sequelize = new Sequelize(
	process.env.DB_NAME,
	process.env.DB_USERNAME,
	process.env.DB_PASSWORD,
	{
		dialect: "mysql",
		dialectModule: require("mysql2"),
		host: process.env.DB_URL,
	}
);
console.log("Registring Models ...");
fs.readdirSync(__dirname)
	.filter((file) => file !== "index.js")
	.forEach((file) => {
		const model = require(path.join(__dirname, file))(
			sequelize,
			Sequelize.DataTypes
		);
		model.__proto__.updateOrCreate = async function (data) {
			console.log(data)
			const mm = await this.findOne(data);
			if (mm) {
				const  where = {}
				let schema = await this.describe()
				Object.keys(schema).forEach(key => {
					console.log(key, schema[key].primaryKey);
					if (schema[key].primaryKey) where[key] = data[key];
				})
				console.log(where)
				return this.update(data, {where});
			} else {
				return this.create(data);
			}
		};
		model.__proto__.bulkUpdateOrCreate = async function (datas) {
			for (data in datas) {
				await this.updateOrCreate(datas[data]);
			}
		}
		db[model.name] = model;
	});
// console.log(db)
Object.keys(db).forEach(function (modelName) {
	if ("associate" in db[modelName]) {
		// console.log(modelName)
		db[modelName].associate(db);
	}
});
db.sequelize = sequelize;
db.Sequelize = Sequelize;

module.exports = db;
