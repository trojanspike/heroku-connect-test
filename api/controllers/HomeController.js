/**
 * HomeController
 *
 * @description :: Server-side logic for managing homes
 * @help        :: See http://links.sailsjs.org/docs/controllers
 */

module.exports = {
	index : function(req, res){
		setTimeout( function(){
			sails.sockets.blast('test', 'Title From Socket : '+process.env.NODE_ENV );
		} , 10000);
		res.view();
	},

	user : function(req, res){
		setTimeout( function(){
			sails.sockets.blast('test', 'Title From Socket : '+process.env.NODE_ENV );
		} , 10000);
		res.json( process.env );
	}
};

