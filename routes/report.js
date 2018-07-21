const express = require('express');
const bodyParser = require('body-parser');
const controllers = require('../controllers');
const jwt = require('../utils/jwt.utils');

const ReportController = controllers.ReportController;

const reportRouter = express.Router();
reportRouter.use(bodyParser.json());

reportRouter.get('/getComments/:id_script', function(req, res) {
	const id_script = req.params.id_script;
	if(id_script === undefined) {
		res.status(404).json({ "error": "Script not found" });
	}
	
	ReportController.getComments(id_script)
	.then((comments) => {
		res.status(200).json(comments);
	})
	.catch((err) => {
		console.log(err);
		res.status(500).end();
	})
});

reportRouter.get('/reports_infos', jwt.checkTokenAdmin, function(req, res) {
	ReportController.countInfos()
	.then((infos) => {
		res.status(200).json(infos);
	})
	.catch((err) => {
		console.log(err)
		res.status(500).end();
	})
});

reportRouter.post('/add', jwt.checkToken, function(req, res) {
	const id_script = req.body.id_script;
	const id_user = req.id_user;
	const comment = req.body.comment;

	if(id_script === undefined) {
		res.status(401).end();
		return;
	}
	if(id_user === undefined) {
		res.status(402).end();
		return;
	}

	ReportController.add(id_script, id_user, comment)
		.then((p) => {
		res.status(201).json(p);
	})
		.catch((err) => {
		console.error(err);
		res.status(500).json(err);
	});
});

reportRouter.get('/', jwt.checkTokenAdmin, function(req, res) {
	const limit = req.query.limit ? parseInt(req.query.limit) : undefined;
	const offset = req.query.offset ? parseInt(req.query.offset) : undefined;
	ReportController.findAll(req.query.id, req.query.id_script, req.query.id_user, req.query.comment, limit, offset)
		.then((reports) => {
		res.json(reports);
	})
	.catch((err) => {
		console.error(err);
		res.status(500).end();
	});
});

reportRouter.delete('/remove/:id', jwt.checkTokenAdmin, function(req, res) {
	const id = parseInt(req.params.id);

	if(id === undefined) {
		req.status(400).end();
	}

	ReportController.remove(id)
		.then((report) => {
		res.status(201).json(report);
	})
		.catch((err) => {
		console.error(err);
		res.status(500).end();
	});
})

reportRouter.put('/update', jwt.checkTokenAdmin, function(req, res) {
	const id = req.body.id;
	const id_script = req.body.id_script;
	const id_user = req.id_user;
	const comment = req.body.comment;

	if(id === undefined) {
		res.status(400).end();
		return;
	}

	ReportController.update(id, id_script, id_user, comment)
		.then((p) => {
		res.status(201).json(p);
	})
		.catch((err) => {
		console.error(err);
		res.status(500).end();
	});
});


module.exports = reportRouter;
