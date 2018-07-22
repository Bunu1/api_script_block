module.exports = function(sequelize, DataTypes){
	const Block = sequelize.define("Block",{
		id: {
			type: DataTypes.INTEGER,
			primaryKey: true,
			autoIncrement: true
		},
		name: {
			type: DataTypes.STRING,
            allowNull: false
		},
		description: {
			type: DataTypes.TEXT,
            allowNull: false
		},
		type: {
			type: DataTypes.TEXT,
            allowNull: false
		}
	}, {
		underscored: true,
		timestamps: false,
		freezeTableName: true
	});
	return Block;
}