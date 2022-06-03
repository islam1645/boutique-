module.exports = (sequelize, DataTypes) => {
  const Profile = sequelize.define(
		"Profile",
    {
      nom: {
        type: DataTypes.STRING,
        allowNull: false,
        notEmpty: true,
      },
      description: {
        type: DataTypes.STRING,
        allowNull: false,
        notEmpty: true,
      },
      couleur: {
        type: DataTypes.STRING,
        allowNull: false,
        notEmpty: true,
      },
      icon: {
        type: DataTypes.STRING,
        allowNull: false,
        notEmpty: true,
      }
    },
		{
			paranoid: true,
		}
	);
  Profile.associate = (models) => {
    Profile.hasMany(models.User,{
        foreignKey:{
            allowNull:false,
        },
        onDelete: 'CASCADE',
        onUpdate: 'CASCADE'
    });
    Profile.belongsToMany(models.Autorisation, {
			through: models.autorisations_fonctions,
		});
    
  };

  return Profile;
};
