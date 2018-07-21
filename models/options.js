module.exports = function (sequelize, DataTypes) {
	const Options = sequelize.define('Options', {
		id: {
			type: DataTypes.BIGINT,
			primaryKey: true,
			autoIncrement: true,
			allowNull: false
		},
		id_block: {
			type: DataTypes.BIGINT,
			allowNull: false,
      		foreignKey: true
		},
		id_argument: {
			type: DataTypes.BIGINT,
			allowNull: false,
      		foreignKey: true
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
	Options.associate = _associate;
	return Options;
}

// INTERNAL
function _associate(models) {
	models.Options.belongsTo(models.Block, { foreignKey: 'id_block', targetKey: 'id'});
	models.Options.belongsTo(models.Argument, { foreignKey: 'id_argument', targetKey: 'id'});
}