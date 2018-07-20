const RouteManager = function() { };

RouteManager.attach = function(app) {
  app.use('/script', require('./script')),
  app.use('/article', require('./article')),
  app.use('/block', require('./block')),
  app.use('/argument', require('./argument')),
  app.use('/instruction', require('./instruction')),
  app.use('/user', require('./user')),
	app.use('/report', require('./report')),
	app.use('/option', require('./option'))
};

module.exports = RouteManager;
