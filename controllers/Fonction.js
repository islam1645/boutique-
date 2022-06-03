const { Profile, Autorisation, autorisations_fonctions } = require("../models");
exports.index = async (req, res) => {
	try {
		const fonctions = await Profile.findAll({
			where: req.where,
			include: [{ model: Autorisation }],
		});
		// console.log(fonctions.map(el=>({...el.toJSON(),...{Autorisations:(await el.getAutorisations())}})));
		return res.json(fonctions);
	} catch (err) {
		console.log("err", err);
	}
};
exports.show = async (req, res) => {
	const fonction = await Profile.create(req.body);
	return res.json(fonction);
};
exports.create = async (req, res) => {
	try {
		const fonction = await Profile.create(req.body);
		return res.send(fonction.toJSON());
	} catch (e) {
		return res.send(e);
	}
};
exports.update = async (req, res) => {
	try {
		const { Autorisations } = req.body;
		let fonction = await Profile.update(req.body, {
			where: { id: req.params.id },
			include: { model: Autorisation, include: { model: autorisations_fonctions } },
		}).then(() => {
			return Profile.findOne({
				where: { id: req.params.id },
			});
		});
		if (!fonction) return res.status(404).send('not found')
		// update autorisations
		let oldAut = await fonction.getAutorisations();
		for (let autorisation of Autorisations) {
			let f = oldAut.find(el => el.id == autorisation.id)
			if (!f) {
				try {

					await autorisations_fonctions.create({ ProfileId: fonction.id, AutorisationId: autorisation.id, type: autorisation.autorisations_fonctions.type })
				} catch (err) {
					return res.status(500).send({ error: true, message: 'todo://' })
				}
			} else if (f.autorisations_fonctions.type != autorisation.autorisations_fonctions.type) {
				console.log(autorisation.autorisations_fonctions);
				f.autorisations_fonctions.type = autorisation.autorisations_fonctions.type
				try {
					f.autorisations_fonctions.save()
				} catch (err) {
					console.log(err)
				}
			}
		}
		// delete autorisations
		for (let autorisation of oldAut) {
			let b = Autorisations.find(el => {
				return el.id == autorisation.id;
			})
			if (!b) {
				await autorisation.autorisations_fonctions.destroy();
			}
		}
		res.json(fonction);
	} catch (err) {
		console.log(err);
	}
};
exports.delete = async (req, res) => {
	const fonction = await Profile.destroy({ where: { id: req.params.id } });
	return res.json(fonction);
};
