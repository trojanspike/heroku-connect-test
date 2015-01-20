do ->

	APP_NAME = 'App'+new Date().getTime()

	angular.module APP_NAME, []
	.controller 'MainCtrl', [
			'$scope'
			($scope)->
				$scope.name = 'UserName'
		]



	angular.element(document).ready ->
		angular.bootstrap document, [APP_NAME]
