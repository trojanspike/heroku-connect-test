/**
 * HomeController
 *
 * @description :: Server-side logic for managing homes
 * @help        :: See http://links.sailsjs.org/docs/controllers
 */

module.exports = {
	index : function(req, res){
		setTimeout( function(){
			sails.sockets.blast('test', 'Title From Socket' );
		} , 10000);
		res.view();
	}
};

