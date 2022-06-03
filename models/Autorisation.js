module.exports = (sequelize, DataTypes) => {
  const Autorisation = sequelize.define("Autorisation", {
    nom: {
      type: DataTypes.STRING,
      unique: true,
      allowNull: false,
    },
    description: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    categorie: {
      type: DataTypes.STRING,
      allowNull: false,
      unique:false,
    }
  });

  Autorisation.associate = (models) => {
    Autorisation.belongsToMany(models.Profile, {
      through: models.autorisations_fonctions,
    });
  };

  return Autorisation;
};
