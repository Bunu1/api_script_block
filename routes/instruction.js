const express = require('express');
const bodyParser = require('body-parser');
const controllers = require('../controllers');
const jwt = require('../utils/jwt.utils');

const InstructionController = controllers.InstructionController;

const instructionRouter = express.Router();
instructionRouter.use(bodyParser.json());

instructionRouter.post('/addToBlock', jwt.checkTokenAdmin, function(req, res) {
  const name = req.body.name;
  const syntax = req.body.syntax;
  const type = req.body.type;
  const platform = req.body.platform;
  const chariot = req.body.chariot;
  const id_block = req.body.id_block;
  const pos = req.body.pos;
  
  if(name === undefined || syntax === undefined || type === undefined || platform === undefined || chariot === undefined || id_block === undefined || pos === undefined) {
    res.status(400).end();
    return;
  }
  
  InstructionController.addToBlock(name, syntax, type, platform, chariot, id_block, pos)
  .then((p) => {
    res.status(201).json(p);
  })
  .catch((err) => {
    console.error(err);
    res.status(500).end({ 'error': 'Error adding options to block' });
  });
});

instructionRouter.post('/add', jwt.checkTokenAdmin, function(req, res) {
  const name = req.body.name;
  const syntax = req.body.syntax;
  const type = req.body.type;
  const platform = req.body.platform;
  const chariot = req.body.chariot;
  
  if(name === undefined || syntax === undefined || type === undefined || platform === undefined || chariot === undefined) {
    res.status(400).end();
    return;
  }
  
  InstructionController.add(name, syntax, type, platform, chariot)
  .then((p) => {
    res.status(201).json(p);
  })
  .catch((err) => {
    console.error(err);
    res.status(500).end();
  });
});

instructionRouter.get('/', function(req, res) {
  const limit = req.query.limit ? parseInt(req.query.limit) : undefined;
  const offset = req.query.offset ? parseInt(req.query.offset) : undefined;
  InstructionController.findAll(req.query.id, req.query.subject, req.query.content, req.query.available, req.query.date_add, req.query.id_user, limit, offset)
  .then((instructions) => {
    res.json(instructions);
  })
  .catch((err) => {
    console.error(err);
    res.status(500).end();
  });
});

instructionRouter.delete('/remove/:id', jwt.checkTokenAdmin, function(req, res) {
  const id = parseInt(req.params.id);
  
  if(id === undefined) {
    req.status(400).end();
  }
  
  InstructionController.remove(id)
  .then((p) => {
    res.status(201).json(p);
  })
  .catch((err) => {
    console.error(err);
    res.status(500).end();
  });
})

instructionRouter.post('/update', jwt.checkTokenAdmin, function(req, res) {
  const id = req.body.id;
  const subject = req.body.subject;
  const content = req.body.content;
  const available = req.body.available;
  
  if(id === undefined) {
    res.status(400).end();
    return;
  }
  
  InstructionController.update(id, subject, content, available)
  .then((p) => {
    res.status(201).json(p);
  })
  .catch((err) => {
    console.error(err);
    res.status(500).end();
  });
});


module.exports = instructionRouter;

