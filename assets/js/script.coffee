do ->

	angular.module 'appName', []
	.controller 'MainCtrl', [
			'$scope'
			($scope)->
				$scope.name = 'UserName'
		]
