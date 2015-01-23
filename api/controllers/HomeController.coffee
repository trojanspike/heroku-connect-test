module.exports.index = (req, res)->
	# sails.sockets.blast 'test', 'Title From Socket @home/index: '+process.env.NODE_ENV
	res.view()