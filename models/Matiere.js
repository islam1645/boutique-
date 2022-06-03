module.exports = (sequelize, DataTypes) => {
	const Matiere = sequelize.define(
		"Matiere",
        {
            designation: {
                type: DataTypes.STRING,
                allowNull: false,
                allowEmpty: false,
            },
			quantite: {
				type: DataTypes.INTEGER.UNSIGNED,
				allowNull: false,
			},
		},
		{
			paranoid: true,
		}
	);
	Matiere.associate = (models) => {
		Matiere.belongsToMany(models.Produit, {
			through: models.Formule,
			foreignKey: {
				allowNull: false,
			},
			onDelete: "CASCADE",
			onUpdate: "CASCADE",
		});
	};
	return Matiere;
};
