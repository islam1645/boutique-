module.exports = (sequelize, DataTypes) => {
  const Commande = sequelize.define(
    "Commande",
    {
      date: {
        type: DataTypes.DATE,
        allowNull: false,
      },
      vendu: {
        type: DataTypes.BOOLEAN,
        allowNull: false,
        defaultValue: false,
      },
    },
    {
      paranoid: true,
    }
  );
  Commande.associate = (models) => {
    Commande.belongsTo(models.Client, {
      foreignKey: {
        allowNull: true,
      },
      onDelete: "CASCADE",
      onUpdate: "CASCADE",
    });
    Commande.belongsTo(models.User, {
      foreignKey: {
        allowNull: false,
      },
      onDelete: "CASCADE",
      onUpdate: "CASCADE",
    });


    Commande.belongsToMany(models.Produit, {
      through: models.produits_commande,
      onDelete: "CASCADE",
      onUpdate: "CASCADE",
    });
  };
  return Commande;
};
