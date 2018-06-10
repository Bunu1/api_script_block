module.exports = function(sequelize, DataTypes){
	const Instruction = sequelize.define("Instruction",{
		id: {
			type: DataTypes.INTEGER,
			primaryKey: true,
			autoIncrement: true
		},
		name: {
			type: DataTypes.STRING,
            allowNull: false
		},
		syntax: {
			type: DataTypes.STRING,
            allowNull: false
		},
		type: {
			type: DataTypes.STRING,
            allowNull: false
		},
		platform: {
			type: DataTypes.STRING,
            allowNull: false
		}
	}, {
		underscored: true,
		timestamps: false,
		freezeTableName: true
	});
	return Instruction;
}
