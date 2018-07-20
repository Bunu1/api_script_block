const express = require('express');
const bodyParser = require('body-parser');
const controllers = require('../controllers');
const jwt = require('../utils/jwt.utils');

const OptionController = controllers.OptionController;

const optionRouter = express.Router();
optionRouter.use(bodyParser.json());

optionRouter.get('/', function(req, res) {
	const limit = req.query.limit ? parseInt(req.query.limit) : undefined;
	const offset = req.query.offset ? parseInt(req.query.offset) : undefined;
	OptionController.findAll(req.query.id, req.query.id_block, req.query.name, req.query.unix, req.query.windows, req.query.input, limit, offset)
	.then((instructions) => {
		res.status(200).json(instructions);
	})
	.catch((err) => {
		console.error(err);
		res.status(500).end();
	});
});

optionRouter.get('/:id_block', function(req, res) {
	const id_block = req.params.id_block;
	
	if(id_block === undefined) {
		res.status(400).end();
	}
	
	OptionController.findByBlock(id_block)
	.then((opt) => {
		res.status(200).json(opt);
	})
	.catch((err) => {
		res.status(500).json({ 'error': "Can't find options" });
	});
})

module.exports = optionRouter;

