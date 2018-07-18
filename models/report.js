module.exports = function(sequelize, DataTypes){
	const Report = sequelize.define("Report",{
		id: {
			type: DataTypes.INTEGER,
			primaryKey: true,
			autoIncrement: true
		},
		id_script: {
			type: DataTypes.INTEGER,
			allowNull: false
		},
		id_user: {
			type: DataTypes.INTEGER,
			allowNull: false
		},
		comment: {
			type: DataTypes.TEXT,
			allowNull: true,
			defaultValue: null,
		}
	}, {
		underscored: true,
		timestamps: false,
		freezeTableName: true
	});
	
	Report.associate = _associate;
	return Report;
}

function _associate(models) {
	models.Report.belongsTo(models.Script, { foreignKey: 'id_script', targetKey: 'id' });
	models.Report.belongsTo(models.User, { foreignKey: 'id_user', targetKey: 'id' });
}