module.exports = (sequelize, DataTypes) => {
	const ProduitVente = sequelize.define("produits_vente", {
		quantite: {
			type: DataTypes.INTEGER.UNSIGNED,
			allowNull: false,
		},
		prix: {
			type: DataTypes.FLOAT,
			allowNull: false,
		},
	});
	return ProduitVente;
};
