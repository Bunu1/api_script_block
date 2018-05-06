module.exports = function (sequelize, DataTypes) {
	const Article = sequelize.define('Article', {
		id: {
			type: DataTypes.BIGINT,
			primaryKey: true,
			autoIncrement: true
		},
    subject: {
      type: DataTypes.STRING,
      allowNull: false
    },
		content: {
      type: DataTypes.BLOB,
      allowNull: false
    },
		available: {
      type: DataTypes.BIGINT,
      allowNull: false,
      defaultValue: 1
    },
		date_add: {
      type: DataTypes.DATE,
      allowNull: false,
      defaultValue: DataTypes.NOW
    },
		id_user: {
      type: DataTypes.BIGINT,
      allowNull: false,
      foreignKey: true
    }
	}, {
		paranoid: false,
		underscored: true,
		freezeTableName: true,
		timestamps: false
	});
	Article.associate = _associate;
	return Article;
}

// INTERNAL
function _associate(models) {
	models.Article.belongsTo(models.User, { foreignKey: 'id_user', targetKey: 'id' });
}