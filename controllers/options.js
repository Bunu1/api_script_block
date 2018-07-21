const ModelIndex = require('../models');
const Options = ModelIndex.Options;
const Op = ModelIndex.Sequelize.Op;

const OptionsController = function() { };

OptionsController.findAll = function(id, id_block, name, unix, windows, input, limit, offset) {
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

	return Options.findAll(options);
}

OptionsController.findByBlock = function(id_block) {
	var where = {};
	var options = {};
	
	if(id_block !== undefined) {
		where.id_block = {
			[Op.eq]: id_block
		}
	}
	
	options.where = where;
	return Options.findAll(options);
	
}

OptionsController.add = function(id_argument, id_block, name, unix, windows, input) {
  return Options.create({
    id_block: id_block,
    id_argument: id_argument,
    name: name,
    unix: unix,
    windows: windows,
    input: input
  });
}

OptionsController.remove = function(id) {
  return Options.destroy({ where: { id: id } });
}

OptionsController.update = function(id, id_argument, id_block, name, unix, windows, input) {
  return Options.find({where: {id: id}})
  .then((Options) => {
    if(Options) {
      if(id_argument === undefined) id_argument = Options.id_argument;
      if(id_block === undefined) id_block = Options.id_block;
      if(name === undefined) name = Options.name;
      if(unix === undefined) unix = Options.unix;
      if(windows === undefined) windows = Options.windows;
      if(input === undefined) input = Options.input;
      return Options.updateAttributes({
        id_argument: id_argument,
        id_block: id_block,
        name: name,
        unix: unix,
        windows: windows,
        input: input
      });
    }
  })
}

module.exports = OptionsController
