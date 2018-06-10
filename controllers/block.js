const ModelIndex = require('../models');
const Block = ModelIndex.Block;
const Op = ModelIndex.Sequelize.Op;

const BlockController = function() { };

BlockController.add = function(subject, content, id_user) {
  return Block.create({
    subject: subject,
    content: content,
    id_user: id_user
  });
}

BlockController.findAll = function(id, subject, content, available, date_add, id_user, limit, offset) {
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
  
  return Block.findAll(options);
}

BlockController.remove = function(id) {
  return Block.destroy({ where: { id: id } });
}

BlockController.update = function(id, subject, content, available) {
  return Block.find({where: {id: id}})
  .then((Block) => {
    if(Block) {
      if(subject === undefined) subject = Block.subject;
      if(content === undefined) content = Block.content;
      if(available === undefined) available = Block.available;
      return Block.updateAttributes({
        subject: subject,
        content: content,
        available: available
      });
    }
  })
}

module.exports = BlockController
