module.exports = (sequelize, DataTypes) => {
    const TypeProduit = sequelize.define('TypeProduit', {
        nom: {
            type: DataTypes.STRING,
            allowNull: false,
            unique: true
        }
    })
    TypeProduit.associate = (models) => {

    }
    return TypeProduit
}