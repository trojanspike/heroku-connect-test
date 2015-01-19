/*
/app/a-meetups/assets/d732cd0a6a1de1ac/en-UK/
/app/a-meetups/assets/:UUID/:lang/
*/
var fs = require('fs'),
coffee = require('coffee-script');

module.exports = {
	style : function(req, res){
		res.setHeader('content-type', 'text/css');
		var file = __dirname+'/../../AppAssets/cache/'+req.param('UUID')+'-'+req.param('lang')+'-style.css';
		if( fs.existsSync(file) ){
			fs.readFile(file, 'utf8' , function(err, content){
				res.send( content );
			});
		} else {
			res.send('No Avail ');
		}
		},

	script : function(req, res){
		res.setHeader('content-type', 'application/javascript');
		var file = __dirname+'/../../AppAssets/cache/'+req.param('UUID')+'-'+req.param('lang')+'-script.js';
		if( fs.existsSync(file) ){
			fs.readFile(file, 'utf8' , function(err, content){
				res.send( content );
			});
		} else {
			res.send('No Avail ');
		}
	},

	template : function(req, res){
		res.setHeader('content-type', 'text/html');
		var file = __dirname+'/../../AppAssets/cache/'+req.param('UUID')+'-'+req.param('lang')+'-template#'+req.param('template')+'.html';
		res.send( fs.readFileSync( file , {encoding:'utf8'}) );
	}

}
