#!/bin/env node

//- ./node_modules/bower/bin/bower install

var fs = require('fs'),
exec = require('child_process').exec;

var Bowerrc = fs.readFileSync('.bowerrc', {encoding:'utf8'}),
BowerDir = JSON.parse(Bowerrc).directory;
exec('node_modules/bower/bin/bower install', function(error, stdout, stderr){

	exec('rsync -avz '+BowerDir+'/* assets/js/00-components/' , function(error, stdout, stderr){

		exec('rm -Rf '+BowerDir , function(error, stdout, stderr){
			console.log('Complete cgi');
		});

	});

});

