module.exports.policies = {

  	'*': true,

    ChatController : {
        '*' : ['isSocket']
    },

    BaseController : {
      '*' : true,
      'user' : 'sessionAuth'
    }

};
