const express = require('express');
const bodyParser = require('body-parser');
var request = require('request')
const controllers = require('../controllers');
const fs = require('fs');
const xmlbuilder = require('xmlbuilder');

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

// --------------
function write_infos(infos, xw) {
	
}

function write_blocks(el, xmlobj) {
  xmlobj[el['title']] = {};
  for(var p in el) {
    if(el.hasOwnProperty(p)) {
      if(p.localeCompare('title') !== 0) {
        if(el[p].constructor === Object) {
          for(var o in el[p]) {
            if(el[p].hasOwnProperty(o)) {
              xmlobj[el['title']]['@'+o] = el[p][o];
            }
          }
        } else if(el[p].constructor === Array) {
          el[p].forEach((element) => {
            write_blocks(element, xmlobj[el['title']]);
          });
        } else {
           xmlobj[el['title']]['@'+p] = el[p];
        }
      }
    }
  }
}

blockRouter.post('/createSM', function(req, res) {
  var xmlobj = {};
  xmlobj.SMFile = {};
  const name = req.body.name;
  const blocks = req.body.blocks; 
  
  if(name === undefined) name = "undefined";
  if(blocks === undefined) {
    res.status(400).end();
    return;
  }
  xmlobj.SMFile.FileName = { '@name': name } ;
  
  blocks.forEach((element) => {
    write_blocks(element, xmlobj.SMFile);
  })
  
    console.log(xmlobj)
  var ee = xmlbuilder.create(xmlobj).end({ pretty: true});
  console.log("xml = " + ee);
  fs.writeFile('file.xml', ee, function(err) {
    if(err)
      return console.log(err);
    console.log("File saved");
  })
  res.status(200).end();
});

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

  var blockinfo = new Array();

  var finalstring= "";
  	blocks.forEach(function(block) {
	setTimeout(function(){
	request({
	  method: 'GET',
	  uri: "http://localhost:8080/block/infos/"+block['id'],
	  headers: {
	  	'Access-Control-Allow-Origin': '*',
	  	'Content-type': 'application/json'
	  },
	  json: true
	}, function (error, response, body) {
	  var bd = JSON.parse(JSON.stringify(body));
	  blockinfo.push(bd[0]);

	  blockinfo[blockinfo.length-1]['Instructions'].forEach(function(instruction) {
	  	if(type == instruction['platform']){
	  		if(instruction['type'].indexOf('arguments') != -1 && instruction['type'].indexOf('loop') == -1){
		  		var base = instruction['syntax'];
		  		for (var k in block['arguments']){
		  			base = base.replace("`"+k+"`", block['arguments'][k]);

				}
				finalstring += base;
		  		finalstring += '\n';
		  	}

		  	if(instruction['type'].indexOf('text-only') != -1 && instruction['type'].indexOf('loop') == -1){
		  		var base = instruction['syntax'];
				finalstring += base;
		  		finalstring += '\n';
		  	}

		  	if(instruction['type'].indexOf('blocs') != -1 && instruction['type'].indexOf('loop') == -1){

		  	}

	  	}
	  	
	  });

	  console.log(finalstring);
	  //console.log(bd[0]);
	  console.log("----------------------------------");
	})

  //console.log(blockinfo);
	/*request('GET', "http://localhost:8080/block/infos/"+block['id']).done((res) => {
	  console.log(res.body);
	});*/
	  }, 100);
  });
  setTimeout(function(){
  //console.log(blockinfo);
  res.status(201).json(blockinfo);

  }, 2000);
  });


module.exports = blockRouter;
