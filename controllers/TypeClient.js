const {TypeClient} = require('../models')
exports.index = async (req,res)=>{
    const types = await TypeClient.findAll()
    return res.json(types)
}
exports.show = async (req,res)=>{
    const type = await TypeClient.findOne({ where: { id: req.params.id } })
    return res.json(type)
}
exports.create = async (req,res)=>{
    const type = await TypeClient.create(req.body)
    return res.json(type)
}
exports.update = async (req, res) => {
    const type = await TypeClient.update(req.body, { where: { id: req.params.id } })
    return res.json(type)
}
exports.delete = async (req,res)=>{
    const type = await TypeClient.destroy({ where: { id: req.params.id } })
    return res.json(type)
}