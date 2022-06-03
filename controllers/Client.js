const {Client} = require('../models')


exports.index = async (req, res) => {
    const clients = await Client.findAll()
    return res.json(clients)

}
exports.show = async (req, res) => {
	const client = await Client.findOne({
		where: {
			id: req.params.id,
		},
	});
	return res.json(client);
};
exports.create = async (req, res) => {
	const client = await Client.create(req.body);
	return res.json(client);
};
exports.update = async (req, res) => {
	const client = await Client.update(req.body, {
		where: { id: req.params.id },
	});
	return res.json(client);
};
exports.delete = async (req, res) => {
	const client = await Client.destroy({
		where: { id: req.params.id },
	});
	return res.json(client);
};