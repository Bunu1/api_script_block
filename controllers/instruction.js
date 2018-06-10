const ModelIndex = require('../models');
const Instruction = ModelIndex.Instruction;
const Op = ModelIndex.Sequelize.Op;

const InstructionController = function() { };

InstructionController.add = function(subject, content, id_user) {
  return Instruction.create({
    subject: subject,
    content: content,
    id_user: id_user
  });
}

InstructionController.findAll = function(id, subject, content, available, date_add, id_user, limit, offset) {
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
  
  return Instruction.findAll(options);
}

InstructionController.remove = function(id) {
  return Instruction.destroy({ where: { id: id } });
}

InstructionController.update = function(id, subject, content, available) {
  return Instruction.find({where: {id: id}})
  .then((Instruction) => {
    if(Instruction) {
      if(subject === undefined) subject = Instruction.subject;
      if(content === undefined) content = Instruction.content;
      if(available === undefined) available = Instruction.available;
      return Instruction.updateAttributes({
        subject: subject,
        content: content,
        available: available
      });
    }
  })
}

module.exports = InstructionController
