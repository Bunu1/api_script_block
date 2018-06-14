const express = require('express');
const bodyParser = require('body-parser');
const controllers = require('../controllers');

const ScriptController = controllers.ScriptController;

const scriptRouter = express.Router();
scriptRouter.use(bodyParser.json());

scriptRouter.post('/add', function(req, res) {
  const name = req.body.name;
  const description = req.body.description;
  const size = req.body.size;
  const id_user = req.body.id_user;
  
  if(name === undefined) {
    res.status(400).end();
    return;
  }
  if(description === undefined) {
    description = "";
  }
  if(size === undefined) {
    res.status(400).end();
    return;
  }
  if(id_user === undefined) {
    res.status(400).end();
    return;
  }
  
  ScriptController.add(name, description, size, id_user)
  .then((p) => {
    res.status(201).json(p);
  })
  .catch((err) => {
    console.error(err);
    res.status(500).end();
  });
});


scriptRouter.get('/', function(req, res) {
  const limit = req.query.limit ? parseInt(req.query.limit) : undefined;
  const offset = req.query.offset ? parseInt(req.query.offset) : undefined;
  ScriptController.findAll(req.query.id, req.query.name, req.query.description, req.query.category, req.query.size, req.query.downloads_count, req.query.date_crea, req.query.id_user, req.query.report, limit, offset)
  .then((scripts) => {
    res.json(scripts);
  })
  .catch((err) => {
    console.error(err);
    res.status(500).end();
  });
});

scriptRouter.delete('/remove/:id', function(req, res) {
  const id = parseInt(req.params.id);
  
  if(id === undefined) {
    req.status(400).end();
  }
  
  ScriptController.remove(id)
  .then((p) => {
    res.status(200).json(p);
  })
  .catch((err) => {
    console.error(err);
    res.status(500).end();
  });
})

scriptRouter.post('/update', function(req, res) {
  const id = req.body.id;
  const description = req.body.description;
  const category = req.body.category;
  const dl_count = req.body.downloads_count;
  const report = req.body.report;
  
  if(id === undefined) {
    res.status(400).end();
    return;
  }
  
  ScriptController.update(id, description, category, dl_count, report)
  .then((p) => {
    res.status(200).json(p);
  })
  .catch((err) => {
    console.error(err);
    res.status(500).end();
  });
});


module.exports = scriptRouter;
