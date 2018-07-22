const ModelIndex = require('../models');
const Block = ModelIndex.Block;
const Op = ModelIndex.Sequelize.Op;

const BlockController = function() { };

BlockController.add = function(name, description, type) {
  return Block.create({
    name: name,
    description: description,
    type: type
  });
}

BlockController.getFullBlocks = function(instr) {
	
  if(instr === 0) {
    return Block.findAll({
      include: [{
        model: ModelIndex.Argument,
      }/*, {
        model: ModelIndex.Instruction
      }*/]
    })
  } else {
    return Block.findAll({
      include: [{
        model: ModelIndex.Argument,
      }, {
        model: ModelIndex.Instruction
      }]
    })
  }
	
}

BlockController.getBlockInfos = function(id) {
	return Block.find({
		include: [{
			model: ModelIndex.Argument
		},{
			model: ModelIndex.Instruction
		},{
			model: ModelIndex.Options
		}],
		where: { id: id }
	})
}

BlockController.getAll = function(id, name, description, limit, offset) {
  const where = {};
	const options = {};
  
	if(id !== undefined){
		where.id = {
			[Op.like]: id
		}
	}
	if(name !== undefined){
		where.name = {
			[Op.like]: `${name}%`
		}
	}
	if(description !== undefined){
		where.description = {
			[Op.like]: `${description}%`
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

BlockController.removeFull = function(id_block) {
  return Promise.resolve(id_block)
  .then((var1) => {
    return ModelIndex.Block_Argument.findAll({ where: { id_block: id_block }})
    .then((args) => {
      args.forEach((el) => {
        console.log("el arg = " + el.id_instruction)
        ModelIndex.Block_Argument.destroy({ where: { id_block: id_block, id_argument: el.id_argument }});
        ModelIndex.Argument.destroy({ where: { id: el.id_argument }});
      });
    })
  })
  .then((var2) => {
    return ModelIndex.Block_Instruction.findAll({ where: { id_block: id_block }})
    .then((inst) => {
      inst.forEach((el) => {
        ModelIndex.Block_Instruction.destroy({ where: { id_block: id_block, id_instruction: el.id_instruction }});
        ModelIndex.Instruction.destroy({ where: { id: el.id_instruction }});
      });
    })
  })
  .then((var3) => {
    return Block.destroy({ where: { id: id_block }})
  })
}

BlockController.update = function(id, name, description, available) {
	const options = {};
	if(name !== undefined)
		options.name = name;
	if(description !== undefined)
		options.description = description;
	if(available !== undefined)
		options.available = available;
	
	return Block.update(options, { returning: true, where: {id: id} });
}

module.exports = BlockController
