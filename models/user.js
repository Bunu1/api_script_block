module.exports = function (sequelize, DataTypes) {
	const User = sequelize.define('User', {
		id: {
			type: DataTypes.BIGINT,
			primaryKey: true,
			autoIncrement: true
		},
    name: {
      type: DataTypes.STRING,
      allowNull: false
    },
		email: {
      type: DataTypes.STRING,
      allowNull: false
    },
		password: {
      type: DataTypes.STRING,
      allowNull: false,
    },
		date_insc: {
      type: DataTypes.DATE,
      allowNull: false,
      defaultValue: DataTypes.NOW
    },
		rank: {
      type: DataTypes.BIGINT,
      allowNull: false,
      defaultValue: 0
    },
		active: {
      type: DataTypes.BIGINT,
      allowNull: false,
      defaultValue: 0
    },
		enabled: {
      type: DataTypes.BIGINT,
      allowNull: false,
      defaultValue: 0
    }
	}, {
		paranoid: false,
		underscored: true,
		freezeTableName: true,
		timestamps: false
	});
	User.associate = _associate;
	return User;
}

// INTERNAL
function _associate(models) {
	models.User.hasMany(models.Script, { foreignKey: 'id_user', sourceKey: 'id' });
  models.User.hasMany(models.Article, { foreignKey: 'id_user', sourceKey: 'id' });
}