const ModelIndex = require('../models');
const Option = ModelIndex.Option;
const Op = ModelIndex.Sequelize.Op;

const OptionController = function() { };

OptionController.findAll = function(id, id_block, name, unix, windows, input, limit, offset) {
	const where = {};
	const options = {};

	if(id !== undefined){
		where.id = {
			[Op.like]: `${id}%`
		}
	}
	if(id_block !== undefined){
		where.id_block = {
			[Op.like]: `${id_block}%`
		}
	}
	if(name !== undefined){
		where.name = {
			[Op.like]: `${name}%`
		}
	}
	if(unix !== undefined){
		where.unix = {
			[Op.like]: `${unix}%`
		}
	}
	if(windows !== undefined){
		where.windows = {
			[Op.like]: `${windows}%`
		}
	}
	if(input !== undefined){
		where.input = {
			[Op.like]: `${input}%`
		}
	}
	options.where = where;
	if(limit !== undefined){
		options.limit = limit;
	}
	if(offset !== undefined){
		options.offset = offset;
	}

	return Option.findAll(options);
}

OptionController.findByBlock = function(id_block) {
	var where = {};
	var options = {};
	
	if(id_block !== undefined) {
		where.id_block = {
			[Op.eq]: id_block
		}
	}
	
	options.where = where;
	return Option.findAll(options);
	
}

module.exports = OptionController
