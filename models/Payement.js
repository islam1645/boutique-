module.exports = (sequelize, DataTypes) => {
  const Payement = sequelize.define("Payement", {
    montant: {
      type: DataTypes.DECIMAL,
      allowNull: false,
    },
    date: {
      type: DataTypes.DATE,
      defaultValue: DataTypes.NOW,
      allowNull: false,
    },
  }, {
    paranoid: true,
  });
  Payement.associate = (models) => {

    Payement.belongsTo(models.User, {
      foreignKey: {
        allowNull: false,
      },
      onDelete: "CASCADE",
      onUpdate: "CASCADE",
    });
    Payement.belongsToMany(models.Vente, {
      through: "payements_vente",
    });
  };
  return Payement;
};
