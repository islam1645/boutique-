module.exports = (sequelize,DataTypes)=>{
    const Wilaya = sequelize.define('Wilaya',{
        wilaya:{
            type:DataTypes.STRING,
            unique:true,
            allowNull:false
        },
        latitude:{
            type: DataTypes.DECIMAL(12,10),
            allowNull:false,
        },
        longitude:{
            type: DataTypes.DECIMAL(12,10),
            allowNull:false
        }
    },{
        validate:{
            latlon(){
                if((this.latitude === null)!== (this.longitude === null)){
                    throw new Error('erreur lors de la validation de la logitude et de la latitude')
                }
            }
        }
    })
    Wilaya.associate = (models)=>{
        Wilaya.hasMany(models.Adresse)
    }
    return Wilaya
}