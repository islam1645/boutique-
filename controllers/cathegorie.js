const { cathegorie } = require("../models");
const { Op } = require("sequelize");
exports.index = async (req, res) => {
	try {
		let cathegorie = await cathegorie.findAll({
			where: {
				nom: {
					[Op.like]: "%" + (req.query.nom || "") + "%",
				},
				code: {
					[Op.like]: "%" + (req.query.code || "") + "%",
				},
			},
		});
		res.json(cathegorie);
	} catch (e) {
		res.status(500).send(e);
	}
};
exports.show = async (req, res) => {
	try {
		let cathegorie = await cathegorie.findOne({ where: { id: req.params.id } });
		res.json(cathegorie);
	} catch (e) {
		res.status(500).send(e);
	}
};
exports.create = async (req, res) => {
	try {
		const cathegorie = await cathegorie.create(req.body);
		return res.send(cathegorie);
	} catch (e) {
		return res.status(400).send(e);
	}
};
exports.update = async (req, res) => {
	try {
		const cathegorie = await cathegorie.update(req.body, {
			where: { id: req.params.id },
		});
		return res.send(cathegorie);
	} catch (e) {
		return res.status(400).send(e);
	}
};
exports.delete = async (req, res) => {
	try {
		const cathegorie = await cathegorie.destroy({ where: { id: req.params.id } });
		return res.send(cathegorie);
	} catch (e) {
		return res.status(400).send(e);
	}
};
