const RouteManager = function() { };

RouteManager.attach = function(app) {
  app.use('/script', require('./script')),
  app.use('/article', require('./article'))
};

module.exports = RouteManager;
