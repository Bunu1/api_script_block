const express = require('express');
const bodyParser = require('body-parser');
const controllers = require('../controllers');

const ArgumentController = controllers.ArgumentController;

const argumentRouter = express.Router();
argumentRouter.use(bodyParser.json());

argumentRouter.post('/add', function(req, res) {
  const subject = req.body.subject;
  const content = req.body.content;
  const id_user = req.body.id_user;
  
  if(subject === undefined) {
    res.status(400).end();
    return;
  }
  if(content === undefined) {
    description = "";
  }
  if(id_user === undefined) {
    res.status(400).end();
    return;
  }
  
  ArgumentController.add(subject, content, id_user)
  .then((p) => {
    res.status(201).json(p);
  })
  .catch((err) => {
    console.error(err);
    res.status(500).end();
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

argumentRouter.delete('/remove/:id', function(req, res) {
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

argumentRouter.post('/update', function(req, res) {
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
