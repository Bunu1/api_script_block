const express = require('express');
const bodyParser = require('body-parser');
const controllers = require('../controllers');
const jwt = require('../utils/jwt.utils');

const ArgumentController = controllers.ArgumentController;

const argumentRouter = express.Router();
argumentRouter.use(bodyParser.json());

argumentRouter.post('/addToBlock', jwt.checkTokenAdmin, function(req, res) {
  const name = req.body.name;
  const keyValue = req.body.keyValue;
  const description = req.body.description;
  const id_block = req.body.id_block;
  
  if(name === undefined) {
    res.status(400).end();
    return;
  }
  if(description === undefined) {
    description = "";
  }
  if(keyValue === undefined) {
    res.status(400).end();
    return;
  }
   if(id_block === undefined) {
    res.status(400).end();
    return;
  }
  
  ArgumentController.addToBlock(name, keyValue, description, id_block)
  .then((p) => {
    res.status(201).json(p);
  })
  .catch((err) => {
    console.error(err);
    res.status(500).end({ 'error': 'Error adding argument to block' });
  });
});

argumentRouter.post('/add', jwt.checkTokenAdmin, function(req, res) {
  const name = req.body.name;
  const keyValue = req.body.keyValue;
  const description = req.body.description;
  
  if(name === undefined) {
    res.status(400).end();
    return;
  }
  if(description === undefined) {
    description = "";
  }
  if(keyValue === undefined) {
    res.status(400).end();
    return;
  }
  
  ArgumentController.add(name, keyValue, description)
  .then((p) => {
    res.status(201).json(p);
  })
  .catch((err) => {
    console.error(err);
    res.status(500).end({ 'error': 'Error adding argument' });
  });
});


argumentRouter.get('/', function(req, res) {
  const limit = req.query.limit ? parseInt(req.query.limit) : undefined;
  const offset = req.query.offset ? parseInt(req.query.offset) : undefined;
  ArgumentController.findAll(req.query.id, req.query.subject, req.query.content, req.query.available, req.query.date_add, req.query.id_user, limit, offset)
  .then((arguments) => {
    res.json(arguments);
  })
  .catch((err) => {
    console.error(err);
    res.status(500).end();
  });
});

argumentRouter.delete('/remove/:id', jwt.checkTokenAdmin, function(req, res) {
  const id = parseInt(req.params.id);
  
  if(id === undefined) {
    req.status(400).end();
  }
  
  ArgumentController.remove(id)
  .then((p) => {
    res.status(201).json(p);
  })
  .catch((err) => {
    console.error(err);
    res.status(500).end();
  });
})

argumentRouter.post('/update', jwt.checkTokenAdmin, function(req, res) {
  const id = req.body.id;
  const subject = req.body.subject;
  const content = req.body.content;
  const available = req.body.available;
  
  if(id === undefined) {
    res.status(400).end();
    return;
  }
  
  ArgumentController.update(id, subject, content, available)
  .then((p) => {
    res.status(201).json(p);
  })
  .catch((err) => {
    console.error(err);
    res.status(500).end();
  });
});


module.exports = argumentRouter;
