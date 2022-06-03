const { Feedback } = require('../models')


exports.index = async (req, res) => {
    
    
}
exports.show = async (req, res) => {
    
}
exports.create = async (req, res) => {
    const feedback = await Feedback.create(req.body)
    return res.json(feedback)
}
exports.update = async (req, res) => {
    
}
exports.delete = async (req, res) => {
    
}