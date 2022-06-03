const { request } = require("express");
const { Payement, Commande, User } = require('../models')

exports.index = async (req, res) => {
    const payements = await Payement.findAll({
        attributes: {
            exclude: [""],
        },
        include: [User],



    })
    return res.json(payements)

}
exports.show = async (req, res) => {
    const payement = await Payement.findOne({ where: { id: req.params.id } })
    return res.json(payement)
}
exports.create = async (req, res) => {

    console.log(req.body)

    const payement = await Payement.create(req.body);
    console.log(Payement.findByPk(payement.id))
    await payement.addCommande(req.body.CommandeId, { PayementId: payement.id })
    console.log(req.body.CommandeId)
    //await payements_commande.create({ PayementId: payement.id, CommandeId: req.body.CommandeId })
    // for (p in req.body) {

    return res.json(payement)


}
exports.update = async (req, res) => {
    const payement = await Payement.update(req.body, { where: { id: req.params.id } })
    return res.json(payement)
}
exports.delete = async (req, res) => {
    const payement = await Payement.destroy({ where: { id: req.params.id } })
    return res.json(payement)
}