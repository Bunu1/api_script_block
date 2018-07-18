const express = require('express');
const bodyParser = require('body-parser');
const controllers = require('../controllers');
const jwt = require('../utils/jwt.utils');
const ModelIndex = require('../models');
const ScriptController = controllers.ScriptController;

const scriptRouter = express.Router();
scriptRouter.use(bodyParser.json());

scriptRouter.post('/add', jwt.checkToken, function(req, res) {
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
  ScriptController.findAll(req.query.id, req.query.name, req.query.description, req.query.category, req.query.size, req.query.downloads_count, req.query.date_crea, req.query.id_user, req.query.available, limit, offset)
  .then((scripts) => {
    res.json(scripts);
  })
  .catch((err) => {
    console.error(err);
    res.status(500).end();
  });
});

scriptRouter.delete('/remove/:id', jwt.checkTokenAdmin, function(req, res) {
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

scriptRouter.put('/updateDLC/:id', function(req, res) {
  const id = req.params.id;
  if(id === undefined) {
    return res.status(400).end();
  }
  
  ModelIndex.Script.findOne({where:{id:id}})
  .then((script) => {
    ScriptController.updateDLC(script, id, script.downloads_count)
    .then((sc) => {
      res.status(200).json({ 'download_count': sc.downloads_count })
    })
    .catch((err) => {
      res.status(500).json({ 'error': "can't update download count" })
    });
  })
  .catch((err) => {
    console.log(err)
    res.status(404).json({ 'error': 'script not found' });
  })
});

scriptRouter.post('/update', jwt.checkToken, function(req, res) {
  const id = req.body.id;
  const description = req.body.description;
  const category = req.body.category;
  const dl_count = req.body.downloads_count;
  const available = req.body.available;
  
  if(id === undefined) {
    res.status(400).json({ "error": "ubyiuhoij" });
    return;
  }
  
  ScriptController.update(id, description, category, dl_count, available)
  .then((p) => {
    res.status(200).json(p);
  })
  .catch((err) => {
    console.error(err);
    res.status(500).end();
  });
});


module.exports = scriptRouter;
