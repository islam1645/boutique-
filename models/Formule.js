module.exports = (sequelize, DataTypes) => {
	const Formule = sequelize.define(
		"Formule",
		{
            quantite: {
                type: DataTypes.INTEGER.UNSIGNED,
                allowNull: false,
            }
		},
		{
			paranoid: true,
		}
	);
	return Formule;
};