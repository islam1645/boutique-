const {Op} = require('sequelize')
module.exports = function (req, res, next) {
    let or = null
    req.where = {};
    Object.keys(req.query).forEach(key => {
        if (Array.isArray(req.query[key])){
            req.where[key] = req.query[key];
        } else {
            if(!or) or = {}
            or[key] = {
                [Op.like]: "%"+req.query[key]+"%"
            }
        }
    })
    if(or) req.where[Op.or] = or
    console.log(req.where)
    next()
}