const { request } = require("express");
const { Commande, produits_commande } = require('../models')
exports.index = async (req, res) => {
	const commandes = await Commande.findAll({

		attributes: {
			exclude: ["User"],
		},
		include: ["User", "Produits"],


	})
	console.log(commandes)
	return res.json(commandes)
}
exports.showclient = async (req, res) => {
	if (2 == req.user.ProfileId) {
		const commande = await Commande.findOne({
			where: {
				id: req.params.id,

			},
		});
	}
	else if (1 == req.user.ProfileId) {
		const commande = await Commande.findOne({
			where: {
				id: req.params.id,
				UserId: req.user.id

			},
		});
	}
	else {
		return (res.status(403).send("not allowed"))
	}
	return res.json(commande);
};

exports.show = async (req, res) => {
	if (2 == req.user.ProfileId) {
		const commande = await Commande.findOne({
			where: {
				id: req.params.id,
			},
		});
	}
	else if (1 == req.user.ProfileId) {
		const commande = await Commande.findOne({
			where: {
				id: req.params.id,
				UserId: req.user.id

			},
		});
	}
	else {
		return (res.status(403).send("not allowed"))
	}
	return res.json(commande);
};
exports.create = async (req, res) => {
	console.log(req.body)

	console.log({ UserId: req.user.id })
	const commande = await Commande.create({ date: new Date(), vendu: false, UserId: req.user.id });
	if (req.body.length == 0) return res.json(commande);
	await Promise.all(req.body.map((el) => produits_commande.create({ quantite: el.produits_commande.quantite, prix: el.prix, ProduitId: el.id, CommandeId: commande.id })))
	// for (p in req.body) {
	// 	console.log(req.body[p])
	// 	const { quantite, prix, id } = req.body[p]
	// 	const produitcommande = await produits_commande.create({ quantite, prix, ProduitId: id, CommandeId: commande.id })
	// }

	return res.json(await Commande.findByPk(commande.id))



};

exports.update = async (req, res) => {
	const commande = await Commande.update(req.body, {
		where: { id: req.params.id },
	});
	return res.json(commande);
};
exports.delete = async (req, res) => {
	if (2 == req.user.ProfileId) {
		const commande = await Commande.destroy({
			where: { id: req.params.id },
		});
		return res.json(commande);
	}
	else {
		return res.status(403).send("not allowed")
	}
};
exports.countCT = async (req, res) => {
	const CTcount = await Commande.count();
	return res.status(200).send({ CTcount })
};
exports.countCV = async (req, res) => {
	const CVcount = await Commande.count({ where: { vendu: true } });
	return res.status(200).send({ CVcount })
};
exports.validate = async (req, res) => {
	if (2 == req.user.ProfileId) {
		var commande = await Commande.update({ vendu: true }, { where: { id: req.params.id } });
		commande = await Commande.findOne({
			where: { id: req.params.id },
			include: ["Produits"
			]
		})
		if (!commande) return res.status(404).send({ message: 'not found' })
		// console.log(commande.__proto__)
		console.log(commande.Produits)
		for (let produit in commande.Produits) {
			console.log(1)
			commande.Produits[produit].update({
				quantite: commande.Produits[produit].quantite - commande.Produits[produit].produits_commande.quantite
			})

		}

		return res.json(commande)
	}
	else { return (res.status(403).send("not allowed")) }
}