module.exports = (sequelize, DataTypes) => {
  const Client = sequelize.define(
    "Client",
    {
      entreprise: {
        type: DataTypes.STRING,
        allowNull: false,
        unique: true,
      },
      numero: {
        type: DataTypes.STRING,
        allowNull: false,
        unique: true,
      },
      numeroSecondaire: {
        type: DataTypes.STRING,
        allowNull: true,
        unique: true,
      },
    },
    {
      validate: {
        num() {
          var all = Client.findAll();
          if (
            all.some(
              (e) =>
                e.numero == this.numero ||
                e.numero == this.numeroSecondaire ||
                e.numeroSecondaire == this.numero ||
                e.numeroSecondaire == this.numeroSecondaire
            )
          )
            throw new Error(
              "le numero introduit appartient a un client existant"
            );
        },
      },
      paranoid: true,
    }
  );
  Client.associate = (models) => {
    Client.belongsTo(models.User, {
      foreignKey: {
        allowNull: false,
      },
      onDelete: "CASCADE",
      onUpdate: "CASCADE",
    });
    Client.belongsTo(models.TypeClient, {
      foreignKey: {
        allowNull: false,
      },
      onDelete: "CASCADE",
      onUpdate: "CASCADE",
    });
    Client.hasMany(models.Adresse)
  };
  return Client;
};
