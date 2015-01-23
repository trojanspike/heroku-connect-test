module.exports.find = (req, res)->
	Messages.find().exec (err, data)->
		if err then res.json {err : true} else res.json data
		Messages.publishCreate
			id : 456
		return
		# sails.sockets.blast 'test', 'From Messages/find'


module.exports.testSocket = (req, res)->
	name = req.param 'name'
	if name and req.isSocket
		Messages.publichUpdate 12, {name:'Lee'}