const ModelIndex = require('../models');
const Article = ModelIndex.Article;
const Op = ModelIndex.Sequelize.Op;

const ArticleController = function() { };

ArticleController.add = function(subject, content, id_user) {
  return Article.create({
    subject: subject,
    content: content,
    id_user: id_user
  });
}

ArticleController.findAll = function(id, subject, content, available, date_add, id_user, limit, offset) {
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
  
  return Article.findAll(options);
}

ArticleController.remove = function(id) {
  return Article.destroy({ where: { id: id } });
}

ArticleController.update = function(id, subject, content, available) {
  return Article.find({where: {id: id}})
  .then((article) => {
    if(article) {
      if(subject === undefined) subject = article.subject;
      if(content === undefined) content = article.content;
      if(available === undefined) available = article.available;
      return article.updateAttributes({
        subject: subject,
        content: content,
        available: available
      });
    }
  })
}

module.exports = ArticleController
