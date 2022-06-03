module.exports = (sequelize, DataTypes) => {
    const Feedback = sequelize.define("Feedback", {
        nom: {
            type: DataTypes.STRING,
            allowNull: false,
        },
        adresse: {
            type: DataTypes.STRING,
            isEmail: true,
            allowNull:false
        },
        message: {
            type: DataTypes.TEXT,
            allowNull: false,
            notEmpty:true
        },
        lu: {
            type: DataTypes.BOOLEAN,
            allowNull: false,
            defaultValue:false
        }
    }, {
    paranoid: true,
  })
    return Feedback
}