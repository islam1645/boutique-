module.exports = (sequelize,DataTypes)=>{
    const Vente = sequelize.define('Vente',{
        date:{
            type:DataTypes.DATE,
            allowNull:false,
            defaultValue:DataTypes.NOW
        },
        valide:{
            type:DataTypes.BOOLEAN,
            allowNull:false,
            defaultValue:false
        },
    }, {
        paranoid:true
    })
    Vente.associate = (models)=>{
        Vente.belongsTo(models.Client)
        Vente.belongsTo(models.User)

    }
    return Vente
}