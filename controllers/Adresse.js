const { Op } = require("sequelize");
const {
  Adresse,
  Client,
  Wilaya,
  User,
  Fonction,
  TypeClient,
} = require("../models");
exports.index = async (req, res) => {
  try {
    let adresses;
    if (req.query.adresse) {
      adresses = await Adresse.findAll({
        where: {
          adresse: {
            [Op.like]: "%" + req.query.adresse + "%",
          },
        },
        attributes: {
          exclude: ["ClientId", "WilayaId"],
        },
        include: [
          Client,
          Wilaya,
        ],
      });
    } else {
      adresses = await Adresse.findAll({
        attributes: {
          exclude: ["ClientId", "WilayaId"],
        },
        include: [
          {
            model: Client,
            attributes: {
              exclude: ["UserId", "TypeClientId"],
            },
            include: [
              {
                model: User,
                attributes: { exclude: ["password", "FonctionId"] },
                include: Fonction,
              },
              TypeClient,
            ],
          },
          Wilaya,
        ],
      });
    }
    return res.send({ length: adresses.length, data: adresses });
  } catch (e) {
    console.log(e);
    return res.status(400).send(e);
  }
};
exports.show = async (req, res) => {
  try {
    const adresse = await Adresse.findOne({
      where: { id: req.params.id },
      attributes: {
        exclude: ["ClientId", "WilayaId"],
      },
      include: [
        {
          model: Client,
          attributes: {
            exclude: ["UserId", "TypeClientId"],
          },
          include: [
            {
              model: User,
              attributes: { exclude: ["password", "FonctionId"] },
              include: Fonction,
            },
            TypeClient,
          ],
        },
        Wilaya,
      ],
    });
    return res.send(adresse);
  } catch (e) {
    return res.status(400).send(e);
  }
};
exports.create = async (req, res) => {
  try {
    const adresse = await Adresse.create(req.body);
    return res.send(adresse);
  } catch (e) {
    return res.status(400).send(e);
  }
};
exports.update = async (req, res) => {
  try {
    const adresse = await Adresse.update(req.body, {
      where: { id: req.params.id },
    });
    return res.send(adresse);
  } catch (e) {
    return res.status(400).send(e);
  }
};
exports.delete = async (req, res) => {
  try {
    const adresse = await Adresse.destroy({ where: { id: req.params.id } });
    return res.send(adresse);
  } catch (e) {
    return res.status(400).send(e);
  }
};
