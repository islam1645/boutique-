module.exports = (sequelize, DataTypes) => {
	const cathegorie = sequelize.define(
		"cathegorie",
		{
			nom: {
				type: DataTypes.STRING,
				allowNull: false,
			},
			
		},
		{
			paranoid: true,
		}
	);
	cathegorie.associate = (models) => {
		// Couleur.hasMany(models.Produit)
	};
	return cathegorie;
};
