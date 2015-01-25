#!/bin/env node

var fs = require('fs'),
exec = require('child_process').exec;

var Bowerrc = fs.readFileSync('./.bowerrc', {encoding:'utf8'}),
BowerDir = JSON.parse(Bowerrc).directory;

exec(' rsync -avz '+BowerDir+'/* ./PUT/ && rm -Rf '+BowerDir)
