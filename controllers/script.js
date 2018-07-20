const ModelIndex = require('../models');
const Script = ModelIndex.Script;
const Op = ModelIndex.Sequelize.Op;

const ScriptController = function() { };

ScriptController.getComments = function(id_script) {
	var options = {};
	var where = {};
	
	where.id_script = {
		[Op.eq]: id_script
	}
	
	options.where = where;
	options.include = [
		{
			model: ModelIndex.User,
			attributes: ['id', 'name']
		}
	]
	return ModelIndex.Comment.findAll(options);
}

ScriptController.addComment = function(id_user, id_script, comment) {
	console.log(id_user)
	console.log(id_script)
	console.log(comment)
	
	return ModelIndex.Comment.create({
		id_user: id_user,
		id_script: id_script,
		comment: comment
	});
}

ScriptController.updateDLC = function(script, id, count) {
  return script.updateAttributes({
    downloads_count: count+1
  })
}

ScriptController.add = function(name, description, size, id_user) {
  return Script.create({
    name: name,
    description: description,
    size: size,
    id_user: id_user
  });
}

ScriptController.findAll = function(id, name, description, category, size, dl_counts, date_crea, id_user, limit, offset) {
  const where = {};
	const options = {};
  
	if(id !== undefined){
		where.id = {
			[Op.like]: `${id}%`
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
	if(category !== undefined){
		where.category = {
			[Op.like]: `${category}%`
		}
	}
	if(size !== undefined){
		where.size = {
			[Op.like]: `${size}%`
		}
	}
	if(dl_counts !== undefined){
		where.dl_counts = {
			[Op.like]: `${dl_counts}%`
		}
	}
  if(date_crea !== undefined){
		where.date_crea = {
			[Op.like]: `${date_crea}%`
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
  
  return Script.findAll(options);
};

ScriptController.remove = function(id) {
  return Script.destroy({ where: { id: id } });
}

ScriptController.update = function(id, description, category, dl_count, available) {
  return Script.find({where: {id: id}})
  .then((script) => {
    if(script) {
      if(description === undefined) description = script.description;
      if(category === undefined) category = script.category;
      if(dl_count === undefined) dl_count = script.downloads_count;
      if(available === undefined) available = script.available;
      return script.updateAttributes({
        description: description,
        category: category,
        downloads_count: dl_count,
        available: available
      });
    }
  })
}

module.exports = ScriptController
