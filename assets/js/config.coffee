do ->
	angular.module 'appName'
	.config [
		"$urlRouterProvider"
		($urlRouterProvider)->
			$urlRouterProvider.otherwise 'chat/start'
	]