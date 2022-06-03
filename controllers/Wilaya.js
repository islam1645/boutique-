const { Op } = require("sequelize");
const { Wilaya } = require("../models");
exports.index = async (req, res) => {
  try {
    let wilayas = [];
    if (req.query.name) {
      wilayas = await Wilaya.findAll({
        where: { wilaya: { [Op.like]: "%" + req.query.name + "%" } },
      });
    } else {
      wilayas = await Wilaya.findAll();
    }
    return res.json({
      length: wilayas.length,
      data: wilayas,
    });
  } catch (e) {
    return res.status(400).send(e);
  }
};
exports.show = async (req, res) => {
  try {
    const wilaya = await Wilaya.findOne({ where: { id: req.params.id } });
    res.send(wilaya);
  } catch (e) {
    return res.status(400).send(e);
  }
};
exports.create = async (req, res) => {
  try {
    const wilaya = await Wilaya.create(req.body);
    res.status(200).send(wilaya);
  } catch (e) {
    return res.status(400).send(e);
  }
};
exports.update = async (req, res) => {
  try {
    const wilaya = await Wilaya.update(req.body, {
      where: { id: req.params.id },
    });
    return res.send(wilaya);
  } catch (e) {
    return res.status(400).send(e);
  }
};
exports.delete = async (req, res) => {
  try {
    const wilaya = await Wilaya.destroy({ where: { id: req.params.id } });
    console.log(wilaya)
    return res.json(wilaya);
  } catch (e) {
    console.log(e)
    return res.status(400).send(e);
  }
};
