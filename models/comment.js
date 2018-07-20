module.exports = function (sequelize, DataTypes) {
	const Comment = sequelize.define('Comment', {
		id: {
			type: DataTypes.BIGINT,
			primaryKey: true,
			autoIncrement: true,
			allowNull: false
		},
		id_user: {
			type: DataTypes.FLOAT,
			allowNull: false
		},
		id_script: {
			type: DataTypes.BIGINT,
			allowNull: false
		},
		comment: {
			type: DataTypes.TEXT,
			allowNull: false
		}
	}, {	
		underscored: true,
		timestamps: false,
		freezeTableName: true
	});
	Comment.associate = _associate;
	return Comment;
}

// INTERNAL
function _associate(models) {
	models.Comment.belongsTo(models.User, { foreignKey: 'id_user', targetKey: 'id'});
	models.Comment.belongsTo(models.Script, { foreignKey: 'id_script', targetKey: 'id'});
}