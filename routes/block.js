const express = require('express');
const bodyParser = require('body-parser');
const controllers = require('../controllers');

const BlockController = controllers.BlockController;

const blockRouter = express.Router();
blockRouter.use(bodyParser.json());

blockRouter.post('/add', function(req, res) {
  const name = req.body.name;
  const description = req.body.description;
  
  if(name === undefined) {
    res.status(400).end();
    return;
  }
  if(content === undefined) {
    description = "";
  }
  
  BlockController.add(name, description)
  .then((p) => {
    res.status(201).json(p);
  })
  .catch((err) => {
    console.error(err);
    res.status(500).end();
  });
});

blockRouter.get('/full', function(req, res) {	
	BlockController.getFullBlocks(req.query.id)
	.then((blocks) => {
		res.status(200).json(blocks);
	})
	.catch((err) => {
		res.status(500).end();
	})
});

blockRouter.get('/infos/:id', function(req, res) {
	const id = req.params.id;
	
	if(id === undefined) {
		req.status(400).end();
		return;
	}
	
	BlockController.getBlockInfos(id)
	.then((p) => {
		res.status(200).json(p);
	})
	.catch((err) => {
		console.log(err);
		res.status(500).end();
	})
});

blockRouter.get('/', function(req, res) {
  const limit = req.query.limit ? parseInt(req.query.limit) : undefined;
  const offset = req.query.offset ? parseInt(req.query.offset) : undefined;
  BlockController.getAll(req.query.id, req.query.name, req.query.description, limit, offset)
  .then((blocks) => {
    res.status(200).json(blocks);
  })
  .catch((err) => {
    console.error(err);
    res.status(500).end();
  });
});

blockRouter.put('/disable/:id', function(req, res) {
	const id =  req.params.id;
	if(isNan(parseInt(id, 10))) {
		res.status(404).end();
		return;
	}
	
	BlockController.update(id, undefined, undefined, 0)
	.then((p) => {
		res.status(200).json(p);
	})
	.catch((err) => {
		console.log(err);
		res.status(500).end();
	});
});

blockRouter.put('/enable/:id', function(req, res) {
	const id =  req.params.id;
	BlockController.update(id, undefined, undefined, 1)
	.then((p) => {
		res.status(200).json(p);
	})
	.catch((err) => {
		console.log(err);
		res.status(500).end();
	});
});

blockRouter.put('/update', function(req, res) {
  const id = req.body.id;
  const name = req.body.name;
  const description = req.body.description;
  const available = req.body.available;
  
	console.log(name);
	console.log(description);
	console.log(available);
	
  if(id === undefined) {
    res.status(404).end();
    return;
  }
  
  BlockController.update(id, name, description, available)
  .then((p) => {
    res.status(201).json(p);
  })
  .catch((err) => {
    console.error(err);
    res.status(500).end();
  });
});


module.exports = blockRouter;
