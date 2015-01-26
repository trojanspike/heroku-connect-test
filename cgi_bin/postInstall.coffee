fs = require 'fs'
exec = require('child_process').exec;

Bowerrc = fs.readFileSync __dirname+'/../.bowerrc', {encoding:'utf8'}
BowerDir = __dirname+'/../'+JSON.parse(Bowerrc).directory;

exec __dirname+'/../node_modules/bower/bin/bower install', (err, stdout, stderr)->
	
	exec 'rsync -avz '+BowerDir+'/* assets/js/00-components/', (err, stdout, stderr)->

		exec 'rm -Rf '+BowerDir , (err, stdout, stderr)->
			console.log 'complete'
			process.exit();
			return
		return
	return
