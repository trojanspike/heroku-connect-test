// Generated by CoffeeScript 1.8.0
var BowerDir, Bowerrc, exec, fs;

fs = require('fs');

exec = require('child_process').exec;

Bowerrc = fs.readFileSync(__dirname + '/../.bowerrc', {
  encoding: 'utf8'
});

BowerDir = __dirname + '/../' + JSON.parse(Bowerrc).directory;

exec(__dirname + '/../node_modules/bower/bin/bower install', function(err, stdout, stderr) {
  exec('rsync -avz ' + BowerDir + '/* assets/js/00-components/', function(err, stdout, stderr) {
    exec('rm -Rf ' + BowerDir, function(err, stdout, stderr) {
      console.log('complete');
      process.exit();
    });
  });
});
