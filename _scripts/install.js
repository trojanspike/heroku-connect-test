#!/bin/env node

var exec = require('child_process').exec;
exec('touch "file.txt"', function(err, out){
	console.log(out);
})
