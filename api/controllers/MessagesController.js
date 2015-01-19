/**
 * MessagesController
 *
 * @description :: Server-side logic for managing messages
 * @help        :: See http://links.sailsjs.org/docs/controllers
 */

module.exports = {
	find : function(req, res){
		if( res.isSocket ){
			Messages.subscribe( req.socket );
			sails.sockets.blast('test', 'From Messages/find');
		} else {		
		Messages.find().exec(function(err, data){
			res.json(data);
		});
		}
	}
};

