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
	Block.associate = _associate;
	return Block;
}

function _associate(models) {
	models.Block.hasOne(models.Options, { foreignKey: 'id_block', targetKey: 'id'});
}