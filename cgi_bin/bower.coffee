fs = require 'fs'
path = require 'path'
exec = require('child_process').exec;

Bowerrc = fs.readFileSync __dirname+'/../.bowerrc', {encoding:'utf8'}
BowerDir = __dirname+'/../'+JSON.parse(Bowerrc).directory;
Assetsdir = __dirname+'/../assets/'

_error = ->
	console.error err
	process.exit()


allowedType = [
	"js"
	"css"
	"eot"
	"svg"
	"ttf"
	"woff"
]
toDir =
	"js" : "js/dependencies/", "css" : "styles/"
	"eot" : "fonts/", "svg" : "fonts/" , "ttf" : "fonts/", "woff" : "fonts/"

### bower Install ###
exec __dirname+'/../node_modules/bower/bin/bower install', (err, stdout, stderr)->

	if err then _error()

	# Cycle through bower components
	fs.readdir BowerDir , (err, dirs)->
		if err then _error()
		dirs.forEach (dir)->
			fs.readFile BowerDir+'/'+dir+'/bower.json', 'utf8' , (err, file)->
				Sort = (file)->
					ext = file.toString().replace /.*\.([a-z]+)$/, '$1'
					fileName = file.toString().replace /.*\/(.*\.[a-z]+)$/, '$1'
					if allowedType.indexOf(ext) >= 0
						fs.renameSync file, Assetsdir+toDir[ext]+'/'+fileName


				if err then _error()
				do (file, Sort)->
					bowerMain = JSON.parse(file).main
					# object | string
					if typeof bowerMain is 'string'
						Sort path.normalize(BowerDir+'/'+dir+'/'+bowerMain)
					if typeof bowerMain is 'object'
						bowerMain.forEach (bm)->
							Sort path.normalize(BowerDir+'/'+dir+'/'+bm)

				return
		exec 'rm -Rf "'+BowerDir+'"', ->
			console.log '@complete'
			# process.exit()