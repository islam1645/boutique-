const {Vente}= require('../models')
exports.index = async (req,res)=>{
    const ventes = await Vente.findAll()
    return res.json(ventes)
}
exports.show = async (req,res)=>{
    const vente = await Vente.findOne({ where: { id: req.params.id } });
    return res.json(vente)
}
exports.create = async (req,res)=>{
    const vente = await Vente.create(req.body)
    return res.json(vente)
}
exports.update = async (req,res)=>{
    const vente = await Vente.update(req.body, { where: { id: res.body.id } })
    return res.json(vente)
}
exports.delete = async (req,res)=>{
    const vente = await Vente.destroy({ where: { id: req.params.id } })
    return res.json(vente)
}