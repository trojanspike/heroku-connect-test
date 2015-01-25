module.exports.policies = {

  	'*': true,

    BaseController : {
      '*' : true,
      'user' : 'sessionAuth'
    }

};
