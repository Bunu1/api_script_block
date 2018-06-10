const ModelIndex = require('../models');
const Argument = ModelIndex.Argument;
const Op = ModelIndex.Sequelize.Op;

const ArgumentController = function() { };

ArgumentController.add = function(subject, content, id_user) {
  return Argument.create({
    subject: subject,
    content: content,
    id_user: id_user
  });
}

ArgumentController.findAll = function(id, subject, content, available, date_add, id_user, limit, offset) {
  const where = {};
	const options = {};
  
	if(id !== undefined){
		where.id = {
			[Op.like]: `${id}%`
		}
	}
	if(subject !== undefined){
		where.subject = {
			[Op.like]: `${subject}%`
		}
	}
	if(content !== undefined){
		where.content = {
			[Op.like]: `${content}%`
		}
	}
	if(available !== undefined){
		where.available = {
			[Op.like]: `${available}%`
		}
	}
	if(date_add !== undefined){
		where.date_add = {
			[Op.like]: `${date_add}%`
		}
	}
  if(id_user !== undefined){
    where.id_user = {
      [Op.like]: `${id_user}%`
    }
  }
	options.where = where;
	if(limit !== undefined){
		options.limit = limit;
	}
	if(offset !== undefined){
		options.offset = offset;
	}
  
  return Argument.findAll(options);
}

ArgumentController.remove = function(id) {
  return Argument.destroy({ where: { id: id } });
}

ArgumentController.update = function(id, subject, content, available) {
  return Argument.find({where: {id: id}})
  .then((Argument) => {
    if(Argument) {
      if(subject === undefined) subject = Argument.subject;
      if(content === undefined) content = Argument.content;
      if(available === undefined) available = Argument.available;
      return Argument.updateAttributes({
        subject: subject,
        content: content,
        available: available
      });
    }
  })
}

module.exports = ArgumentController
