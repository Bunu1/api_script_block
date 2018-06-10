module.exports = function (sequelize, DataTypes) {
	const Block_Instruction = sequelize.define('Block_Instruction', {
		id_block: {
			type: DataTypes.BIGINT,
			allowNull: false
		},
		id_instruction: {
			type: DataTypes.FLOAT,
			allowNull: false
		},
		pos: {
			type: DataTypes.BIGINT,
			allowNull: false
		}
	}, {
		paranoid: false,
		underscored: true,
		freezeTableName: true,
		timestamps: false
	});
	Block_Instruction.associate = _associate;
	return Block_Instruction;
}

// INTERNAL
function _associate(models) {
	models.Block.belongsToMany(models.Instruction, { through: models.Block_Instruction, foreignKey: 'id_block', targetKey: 'id'});
	models.Instruction.belongsToMany(models.Block, { through: models.Block_Instruction, foreignKey: 'id_instruction', targetKey: 'id'});
}