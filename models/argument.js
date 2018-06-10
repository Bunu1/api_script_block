module.exports = function(sequelize, DataTypes){
	const Argument = sequelize.define("Argument",{
		id: {
			type: DataTypes.INTEGER,
			primaryKey: true,
			autoIncrement: true
		},
		name: {
			type: DataTypes.STRING,
            allowNull: false
		},
		value: {
			type: DataTypes.STRING,
            allowNull: false
		},
		type: {
			type: DataTypes.STRING,
            allowNull: false
		},
		description: {
			type: DataTypes.TEXT,
            allowNull: false
		}
	}, {
		underscored: true,
		timestamps: false,
		freezeTableName: true
	});
	return Argument;
}
