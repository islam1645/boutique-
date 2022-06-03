const { request } = require("express");
const { Produit, TypeProduit, cathegorie } = require("../models");
exports.index = async (req, res) => {

	const produits = await Produit.findAll({
		attributes: {
			exclude: ["cathegorieId"],
		},
		include: [cathegorie],

	});
	return res.json(produits)
};
exports.show = async (req, res) => {
	if (2 == req.user.ProfileId) {
		const produit = await Produit.findOne({
			where: {
				id: req.params.id
			}
		});
	}
	else if (1 == req.user.ProfileId) {
		const produit = await Produit.findOne({
			where: {
				id: req.params.id
			}
		});
	}
	else {
		return (res.status(403).send("not allowed"))
	}
	return res.json(produit)
};

exports.count = async (req, res) => {
	const productcount = await Produit.count();
	return res.status(200).send({ productcount })
};
exports.countsavon = async (req, res) => {
	const savoncount = await Produit.count({ where: { cathegorieId: 1 } });
	return res.status(200).send({ savoncount })
};
exports.countLV = async (req, res) => {
	const LVcount = await Produit.count({ where: { cathegorieId: 2 } });
	return res.status(200).send({ LVcount })
};
exports.countLM = async (req, res) => {
	const LMcount = await Produit.count({ where: { cathegorieId: 3 } });
	return res.status(200).send({ LMcount })
};
exports.countLS = async (req, res) => {
	const LScount = await Produit.count({ where: { cathegorieId: 4 } });
	return res.status(200).send({ LScount })
};
exports.create = async (req, res) => {
	console.log(req.user.ProfileId)
	if (2 == req.user.ProfileId) {
		const produit = await Produit.create({ ...req.body, UserId: req.user.id })
		console.log(req.produit)
		return res.json(produit)
	}
	else {
		return res.status(403).send("not allowed")
	}
};
exports.update = async (req, res) => {
	if (2 == req.user.ProfileId) {
		const produit = await Produit.update(req.body, { where: { id: req.params.id } })
		return res.json(produit)
	}
	else {
		return res.status(403).send("not allowed")
	}
};

exports.delete = async (req, res) => {
	console.log(req.user.ProfileId)
	if (2 == req.user.ProfileId) {
		const produit = await Produit.destroy({ where: { id: req.params.id } })
		return res.json(produit)
	}
	else { res.status(403).send("not allowed") }
};
