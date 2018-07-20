module.exports = function (sequelize, DataTypes) {
	const Option = sequelize.define('Option', {
		id: {
			type: DataTypes.BIGINT,
			primaryKey: true,
			autoIncrement: true,
			allowNull: false
		},
		id_block: {
			type: DataTypes.BIGINT,
			allowNull: false
		},
		name: {
			type: DataTypes.TEXT,
			allowNull: false
		},
		unix: {
			type: DataTypes.TEXT,
			allowNull: false
		},
		windows: {
			type: DataTypes.TEXT,
			allowNull: false
		},
		input: {
			type: DataTypes.BIGINT,
			allowNull: false
		},
	}, {	
		underscored: true,
		timestamps: false,
		freezeTableName: true
	});
	Option.associate = _associate;
	return Option;
}

// INTERNAL
function _associate(models) {
	models.Option.belongsTo(models.Block, { foreignKey: 'id_block', targetKey: 'id'});
}