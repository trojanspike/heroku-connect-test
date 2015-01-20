
module.exports.index = (req, res)->
	res.view '', 
		name : MeetupService.test('Hello World')
