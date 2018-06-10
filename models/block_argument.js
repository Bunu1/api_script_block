module.exports = function (sequelize, DataTypes) {
	const Block_Argument = sequelize.define('Block_Argument', {
		id_block: {
			type: DataTypes.BIGINT,
			allowNull: false
		},
		id_argument: {
			type: DataTypes.FLOAT,
			allowNull: false
		},
		pre_option: {
			type: DataTypes.STRING,
      		allowNull: false
		}
	}, {
		paranoid: false,
		underscored: true,
		freezeTableName: true,
		timestamps: false
	});
	Block_Argument.associate = _associate;
	return Block_Argument;
}

// INTERNAL
function _associate(models) {
	models.Block.belongsToMany(models.Argument, { through: models.Block_Argument, foreignKey: 'id_block', targetKey: 'id'});
	models.Argument.belongsToMany(models.Block, { through: models.Block_Argument, foreignKey: 'id_argument', targetKey: 'id'});
}