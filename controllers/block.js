const ModelIndex = require('../models');
const Block = ModelIndex.Block;
const Op = ModelIndex.Sequelize.Op;

const BlockController = function() { };

BlockController.add = function(name, description) {
  return Block.create({
    name: name,
    description: description,
  });
}

BlockController.getFullBlocks = function(id) {
	const where = {};
	if(id !== undefined) {
		where.id = {
			[Op.like] :  id
		}
	}
	
	return Block.findAll({
		include: [{
			model: ModelIndex.Argument,
		}, {
			model: ModelIndex.Instruction
		}],
		where: where
	})
}

BlockController.getBlockInfos = function(id) {
	return Block.findAll({
		include: [{
			model: ModelIndex.Argument,
//			include: [{
//				model: ModelIndex.Promotion
//			}],
//			required: true
		}, {
			model: ModelIndex.Instruction
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
