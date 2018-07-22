const ModelIndex = require('../models');
const Report = ModelIndex.Report;
const Op = ModelIndex.Sequelize.Op;

const ReportController = function() { };

ReportController.getComments = function(id_script) {
	const where = {};
	const attributes = {};
	const options = {};
	
	if(id_script !== undefined) {
		where.id_script = {
			[Op.eq]: id_script
		}
	}
	
	where.comment = {
		[Op.ne]: null
	}
	
	options.where = where;
	options.attributes = ['id_user', 'comment'];
	options.include = [
		{
			model: ModelIndex.User,
			attributes: ['id', 'name']
		}
	]
	return Report.findAll(options);
}

ReportController.countReports = function(id_script) {
	return Report.count({ where: {'id_script': { [Op.eq]: id_script}} });
}

ReportController.countInfos = function() {
	return Report.findAll({
		attributes: [
			'id_script',
			[ModelIndex.Sequelize.fn('COUNT', ModelIndex.Sequelize.col('id_script')), 'count_scripts'],
			[ModelIndex.Sequelize.fn('COUNT', ModelIndex.Sequelize.col('comment')), 'count_comments']
		],
		group: 'id_script',
		include: [ 
			{
				model: ModelIndex.Script,
				attributes: ['name', 'available'],
				include: [
					{
						model: ModelIndex.User,
						attributes: ['name']
					}
				]
			}
		]
	});
}

ReportController.add = function(id_script, id_user, comment) {
	return Report.create({
		id_script: id_script,
		id_user: id_user,
		comment: comment
	});
}

ReportController.findByUser = function(id_user) {
  return Report.findAll({ where: { id_user: id_user }})
}
ReportController.findAll = function(id, id_script, id_user, comment, id_user, limit, offset) {
	const where = {};
	const options = {};

	if(id !== undefined){
		where.id = {
			[Op.eq]: id
		}
	}
	if(id_script !== undefined){
		where.id_script = {
			[Op.eq]: id_script
		}
	}
	if(id_user !== undefined){
		where.id_user = {
			[Op.eq]: id_user
		}
	}
	if(comment !== undefined){
		where.comment = {
			[Op.like]: `${comment}%`
		}
	}
	options.where = where;
	if(limit !== undefined){
		options.limit = limit;
	}
	if(offset !== undefined){
		options.offset = offset;
	}

	return Report.findAll(options);
}

ReportController.remove = function(id) {
	return Report.destroy({ where: { id: id } });
}

ReportController.update = function(id, id_script, id_user, comment) {
	return Report.find({where: {id: id}})
		.then((report) => {
		if(report) {
			if(id_script === undefined) subject = report.id_script;
			if(id_user === undefined) content = report.id_user;
			if(comment === undefined) available = report.comment;
			return Report.updateAttributes({
				id_script: id_script,
				id_user: id_user,
				comment: comment
			});
		}
	})
}

module.exports = ReportController
