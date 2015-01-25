#!/bin/env node

//- ./node_modules/bower/bin/bower install

var fs = require('fs'),
exec = require('child_process').exec;

var Bowerrc = fs.readFileSync(__dirname+'/../.bowerrc', {encoding:'utf8'}),
BowerDir = __dirname+'/../'+JSON.parse(Bowerrc).directory;
exec(__dirname+'/../node_modules/bower/bin/bower install', function(error, stdout, stderr){

	exec('rsync -avz '+BowerDir+'/* assets/js/00-components/' , function(error, stdout, stderr){

		exec('rm -Rf '+BowerDir , function(error, stdout, stderr){
			console.log('Complete cgi');
		});

	});

});

