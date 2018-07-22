const express = require('express');
const bodyParser = require('body-parser');
var request = require('request')
var fs = require("fs");
var path = require('path');
const controllers = require('../controllers');
const xmlbuilder = require('xmlbuilder');
const xml2js = require('xml2js');
const jwt = require('../utils/jwt.utils');

const BlockController = controllers.BlockController;

const blockRouter = express.Router();
blockRouter.use(bodyParser.json());

blockRouter.post('/add', jwt.checkTokenAdmin, function(req, res) {
  const name = req.body.name;
  const description = req.body.description;
  const type = req.body.type;
  
  if(name === undefined) {
    res.status(400).end();
    return;
  }
  if(description === undefined) {
    description = "";
  }
  if(type === undefined) {
    res.status(400).end();
    return;
  }
  
  BlockController.add(name, description, type)
  .then((p) => {
    res.status(201).json(p);
  })
  .catch((err) => {
    console.error(err);
    res.status(500).end({ 'error': 'Error creating the block' });
  });
});

blockRouter.get('/full', function(req, res) {
  const instr = parseInt(req.query.instructions)
	BlockController.getFullBlocks(instr)
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

blockRouter.put('/disable/:id', jwt.checkTokenAdmin, function(req, res) {
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

blockRouter.put('/enable/:id', jwt.checkTokenAdmin, function(req, res) {
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

blockRouter.put('/update', jwt.checkTokenAdmin, function(req, res) {
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

blockRouter.delete('/removeFull/:id_block', jwt.checkTokenAdmin, function(req, res) {
  const id_block = req.params.id_block
	
  if(id_block === undefined) {
    res.status(404).end();
    return;
  }
  
  BlockController.removeFull(id_block)
  .then((p) => {
    res.status(201).json(p);
  })
  .catch((err) => {
    console.error(err);
    res.status(500).end({ "error": "Error destroying full" });
  });
});

//blockRouter.post('/SMtoJSON', function(req, res) {
//  var sm = req.body.sm;
////  console.log(typeof sm);
//  
////  var p = xml2js.parseString(sm);
//  var parser = xml2js.Parser({ mergeAttrs: true });
//  parser.parseString(sm, function(err, result) {
//    if(result !== undefined) {
//      res.status(201).json(result);
//		} else {
//      res.status(500).json({ "error": "error during parsing" });
//		}
//  });  
//});
//
//function write_blocks(el, xmlobj) {
//  xmlobj[el['title']] = {};
//  for(var p in el) {
//    if(el.hasOwnProperty(p)) {
//      if(p.localeCompare('title') !== 0) {
//        if(el[p].constructor === Object) {
//          for(var o in el[p]) {
//            if(el[p].hasOwnProperty(o)) {
//              xmlobj[el['title']]['@' + o] = el[p][o];
//            }
//          }
//        } else if(el[p].constructor === Array) {
//          el[p].forEach((element) => {
//            write_blocks(element, xmlobj[el['title']]);
//          });
//        } else {
//           xmlobj[el['title']]['@'+p] = el[p];
//        }
//      }
//    }
//  }
//}
//
//blockRouter.post('/JSONtoSM', function(req, res) {
//  var xmlobj = {};
//  xmlobj.SMFile = {};
//  const name = req.body.name;
//  const blocks = req.body.blocks; 
//  
//  if(name === undefined) name = "untitled";
//  if(blocks === undefined) {
//    res.status(400).end();
//    return;
//  }
//  xmlobj.SMFile.FileName = { '@name': name } ;
//  
//  blocks.forEach((element) => {
//    write_blocks(element, xmlobj.SMFile);
//  });
//  
////  console.log(xmlobj)
//  var sm = xmlbuilder.create(xmlobj).end(/*{ pretty: true }*/);
////  fs.writeFile('file.sm', sm, function(err) {
////    if(err)
////      return console.log(err);
////    console.log("File saved");
////  })
////  res.sendFile(path.join(__dirname, "..", "file.sm"));
////  res.writeHead(200, {'Content-Type': 'application/force-download','Content-disposition':'attachment; filename='+name+'.sm'})
//	res.status(200).end(sm);
//});


var finalstring= "";

function loop_script(blocks, type, blockinfo){
	blocks.forEach(function(block) {

	var nb_instruction = 0;
	var nb_blocks = 0;
	var nb_blocks_enc = 0;
	var index = 0;
	var good_inst = 0;
	var check_inst;

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
		check_inst = 0;

		if(blockinfo[index]['Instructions'][good_inst]['Block_Instruction']['pos'] == i+1){
			var instruction = blockinfo[index]['Instructions'][good_inst];

			if(type == instruction['platform']){
				check_inst = 1;
		  		if(instruction['type'].indexOf('arguments') != -1){

			  		var base = instruction['syntax'];
			  		for (var k in block['arguments']){
			  			base = base.replace("`"+k+"`", block['arguments'][k]);
					}
					finalstring += base;
					if(instruction['chariot'] == 1)finalstring += '\n';
					if(instruction['chariot'] == 0)finalstring += ' ';
			  	}

			  	if(instruction['type'].indexOf('text-only') != -1){
			  		var base = instruction['syntax'];
					finalstring += base;
					if(instruction['chariot'] == 1)finalstring += '\n';
					if(instruction['chariot'] == 0)finalstring += ' ';
			  	}

			  	if(instruction['type'].indexOf('blocs') != -1){
			  		var keys = Object.keys(block['arguments']);
			  		for (var g = 0 ; g < keys.length; g++) {
			  			if(keys[g].indexOf('#blocks'+(nb_blocks_enc)) != -1 ){
			  				if(block['arguments'][keys[g]][0]['null'] != "" )
			  				loop_script(block['arguments'][keys[g]], type, blockinfo);	
							nb_blocks_enc++;
							break;						  
			  			}
			  		}
			  	}
	  		}//fin plateforme
		}
		if(check_inst == 0)i--;
		good_inst++;
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
  	finalstring+= "@echo off\n\n"
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
		if(type == "windows"){
			finalstring+= "\n\npause >nul"
		}

	})
  
  setTimeout(function(){
  /*console.log(finalstring);
	fs.writeFile('file'+extension, finalstring, function(err) {
	if(err)
		return console.log(err);
	console.log("File saved");
	})
	res.sendFile(path.join(__dirname, "..", "file"+extension));
	
	*/
	finalstring = finalstring.replace(/  +/g, ' ');
 	res.status(201).end(finalstring);
 	finalstring = "";
  }, 5000);

  });


module.exports = blockRouter;
