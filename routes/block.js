const express = require('express');
const bodyParser = require('body-parser');
var request = require('request')
var fs = require("fs");
var path = require('path');
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

var finalstring= "";

function loop_script(blocks, type, blockinfo){

	blocks.forEach(function(block) {

	var nb_instruction = 0;
	var nb_blocks = 0;
	var nb_blocks_enc = 0;
	var index = 0;


	for (var i = 0; i < blockinfo.length; i++) {
		if(block['id'] == blockinfo[i]['id']){
			index = i;
		}
	}
	for (var i = 0; i < blockinfo[index]['Instructions'].length; i++) {
		if(blockinfo[index]['Instructions'][i]['platform'] == type)nb_instruction++;
	}

	for (var i = 0; i < blockinfo[index]['Instructions'].length; i++) {
		if(blockinfo[index]['Instructions'][i]['type'].indexOf('blocs') != -1)nb_blocks++;
	}

	for (var i = 0; i < nb_instruction; i++) {
		if(blockinfo[index]['Instructions'][i]['Block_Instruction']['pos'] == i+1){
			var instruction = blockinfo[index]['Instructions'][i];
			//console.log(instruction);
			if(type == instruction['platform']){
	  		if(instruction['type'].indexOf('arguments') != -1){
		  		var base = instruction['syntax'];
		  		for (var k in block['arguments']){
		  			base = base.replace("`"+k+"`", block['arguments'][k]);
				}
				finalstring += base;
		  		finalstring += '\n';
		  	}

		  	if(instruction['type'].indexOf('text-only') != -1){
		  		var base = instruction['syntax'];
				finalstring += base;
		  		finalstring += '\n';
		  	}

		  	if(instruction['type'].indexOf('blocs') != -1){
		  		var keys = Object.keys(block['arguments']);
		  		for (var g = 0 ; g < keys.length; g++) {
		  			while(g < nb_blocks_enc)g++;
		  			if(keys[g].indexOf('#blocks'+(g+1)) != -1 ){
						loop_script(block['arguments'][keys[g]], type, blockinfo);	
						nb_blocks_enc++;
						break;						  
		  			}
		  		}
		  	}
	  	}
		}
	}
  });

}


blockRouter.post('/finalscript', function(req, res) {

  const type = req.body.type;
  const blocks = req.body.blocks;

  if(type === undefined || (type != "unix" && type != "windows")) {
    res.status(400).end();
    return;
  }
  if(blocks === undefined) {
    res.status(400).end();
    return;
  }  
  if(type == "unix") {
  	var extension = ".sh";
  	finalstring+= "#!/bin/bash\n\n"
  }
  if(type == "windows") {
  	var extension = ".bat";
  }

  	var blockinfo = new Array();
	request({
	  method: 'GET',
	  uri: "http://localhost:8080/block/full",
	  headers: {
	  	'Access-Control-Allow-Origin': '*',
	  	'Content-type': 'application/json'
	  },
	  json: true
	}, function (error, response, body) {
	  var bd = JSON.parse(JSON.stringify(body));
	  blockinfo.push(bd);
		loop_script(blocks, type, blockinfo[0]);
	})
  
  setTimeout(function(){
  console.log(finalstring);
	fs.writeFile('file'+extension, finalstring, function(err) {
	if(err)
		return console.log(err);
	console.log("File saved");
	})
	res.sendFile(path.join(__dirname, "..", "file"+extension));
	finalstring = "";
  }, 5000);
  });


module.exports = blockRouter;
