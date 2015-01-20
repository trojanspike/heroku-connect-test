angular.module 'myApp', []
.controller 'MainCtrl', [
		'$scope'
		($scope)->
			$scope.name = 'Lee'
	]



angular.element(document).ready ->
	angular.bootstrap document, ['myApp']