const express = require('express');
const cors = require('cors');
const ModelIndex = require('./models');
const RouteManager = require('./routes');
const expressJWT = require('express-jwt');

ModelIndex
.openDatabase()
.then(_startServer)
.catch((err) => {
  console.error(err);
});

// INTERNAL

function _startServer() {

  const app = express();

//  app.use(expressJWT({ secret: 'drgfsrgh45r6th465t4h65r4thr65th4r65trth4trh564rth565aziu6h8n' }).unless({ path: [ '/user/login', '/user/register', '/article', '/script' ] }));

	app.use(cors());
	app.options('*', cors());
  RouteManager.attach(app);
  
  
  app.listen(8080, function() {
    console.log('Server started on 8080...');
  });
}
