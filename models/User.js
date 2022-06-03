'use strict';

const Promise = require("bluebird");
const bcrypt = require("bcrypt-nodejs");

const hashPwd = (user, options) => {
  if (!user.changed("password")) return;
  const salt = bcrypt.genSaltSync(process.env.HASHING_FACTOR)
  const hash = bcrypt.hashSync(user.password, salt, null)
  user.setDataValue("password", hash);
};

module.exports = (sequelize, DataTypes) => {
  const User = sequelize.define(
    "User",
    {
      nom: {
        type: DataTypes.STRING,
        allowNull: false,
        notEmpty: true,
      },
      prenom: {
        type: DataTypes.STRING,
        allowNull: false,
        notEmpty: true,
      },
      username: {
        type: DataTypes.STRING,
        allowNull: false,
        unique: true,
        notEmpty: true,
        isEmail: true,
      },
      password: {
        type: DataTypes.STRING,
        allowNull: false,
        notEmpty: true,
      },
      numero: {
        type: DataTypes.STRING,
        allowNull: false,
        notEmpty: true,
        min: 10,
        max: 10,
      },
    },
    {
      hooks: {
        // beforeCreate: hashPwd,
        // beforeUpdate: hashPwd,
        beforeSave: hashPwd,
      },
      paranoid: true,
    }
  );

  User.prototype.verifyHash = async function (password) {
    console.log(password, this.password)
    return bcrypt.compareSync(password, this.password);

  }
  User.associate = (models) => {
    console.log(models);
    User.belongsTo(models.Profile);
    User.hasMany(models.Client);
    User.hasMany(models.Adresse);
    User.hasMany(models.Commande);
    User.hasMany(models.cathegorie);
    User.hasMany(models.Payement);
    User.hasMany(models.Produit);
    User.hasMany(models.Vente);

  };
  return User;
};
