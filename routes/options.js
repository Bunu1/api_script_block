const express = require('express');
const bodyParser = require('body-parser');
const controllers = require('../controllers');
const jwt = require('../utils/jwt.utils');

const OptionsController = controllers.OptionsController;

const optionsRouter = express.Router();
optionsRouter.use(bodyParser.json());

optionsRouter.get('/', function(req, res) {
	const limit = req.query.limit ? parseInt(req.query.limit) : undefined;
	const offset = req.query.offset ? parseInt(req.query.offset) : undefined;
	OptionsController.findAll(req.query.id, req.query.id_block, req.query.name, req.query.unix, req.query.windows, req.query.input, limit, offset)
	.then((instructions) => {
		res.status(200).json(instructions);
	})
	.catch((err) => {
		console.error(err);
		res.status(500).end();
	});
});

optionsRouter.get('/:id_block', function(req, res) {
	const id_block = req.params.id_block;
	
	if(id_block === undefined) {
		res.status(400).end();
	}
	
	OptionsController.findByBlock(id_block)
	.then((opt) => {
		res.status(200).json(opt);
	})
	.catch((err) => {
		res.status(500).json({ 'error': "Can't find options" });
	});
})

optionsRouter.post('/add', jwt.checkTokenAdmin, function(req, res) {
  const id_block = req.body.id_block;
  const id_argument = req.body.id_argument;
  const name = req.body.name;

  if(id_block === undefined) {
    res.status(400).end();
  }
  if(id_argument === undefined) {
    res.status(400).end();
    return;
  }
  if(name === undefined) {
    res.status(400).end();
    return;
  }
  
  OptionsController.add(id_argument, id_block, name, req.body.unix, req.body.windows, req.body.input)
  .then((p) => {
    res.status(201).json(p);
  })
  .catch((err) => {
    console.error(err);
    res.status(500).end();
  });
});

optionsRouter.delete('/remove/:id', jwt.checkTokenAdmin, function(req, res) {
  const id = parseInt(req.params.id);
  
  if(id === undefined) {
    req.status(400).end();
  }
  
  OptionsController.remove(id)
  .then((p) => {
    res.status(201).json(p);
  })
  .catch((err) => {
    console.error(err);
    res.status(500).end();
  });
})

optionsRouter.post('/update', jwt.checkTokenAdmin, function(req, res) {
  const id = req.body.id;
  const id_block = req.body.id_block;
  const id_argument = req.body.id_argument;
  const name = req.body.name;

  if(id === undefined) {
    res.status(400).end();
    return;
  }
  if(id_block === undefined) {
    res.status(400).end();
  }
  if(id_argument === undefined) {
    res.status(400).end();
    return;
  }
  if(name === undefined) {
    res.status(400).end();
    return;
  }
  
  OptionsController.update(id, id_argument, id_block, name, req.body.unix, req.body.windows, req.body.input)
  .then((p) => {
    res.status(201).json(p);
  })
  .catch((err) => {
    console.error(err);
    res.status(500).end();
  });
});

module.exports = optionsRouter;

