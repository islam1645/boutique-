const { TypeProduit } = require("../models");
const { Op } = require("sequelize");
exports.index = async (req, res) => {
	const types = await TypeProduit.findAll({
		where: {
			nom: {
				[Op.like]: "%" + (req.query.nom||"") + "%",
			},
		},
    });
    res.json(types)
};
exports.show = async (req, res) => {
    const type = await TypeProduit.findOne({ where: { id: req.params.id } })
    res.json(type)
};
exports.create = async (req, res) => {
    const type = await TypeProduit.create(req.body)
    return res.json(type)
};
exports.update = async (req, res) => {
    const type = await TypeProduit.update(req.body, { where: { id: req.params.id } })
    return res.json(type)
};
exports.delete = async (req, res) => {
    const type = await TypeProduit.destroy({ where: { id: req.params.id } })
    return res.json(type)
};
