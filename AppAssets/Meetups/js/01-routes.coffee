socket = io.connect App.APIpoint

angular.module "MobileApp"
.config ($stateProvider, $urlRouterProvider) ->

	$stateProvider
	.state "intro",
		url : "/intro"
		templateUrl : App.ASSETS + "/templates/intro"
		controller : "IntroCtrl"

	.state "main",
		url: "/main"
		templateUrl: App.ASSETS + "/templates/main"
		controller: "MainCtrl"

	.state "chat",
		url : "/chat"
		templateUrl : App.ASSETS + "/templates/chat"
		controller: "ChatCtrl"

	.state "test",
		url: "/test"
		templateUrl: "#tpl.html"
		controller: "MainCtrl"

	$urlRouterProvider.otherwise "/intro"
	return

.controller "ChatCtrl", ($scope)->
	$scope.data = 'hello world'
	$scope.chats = []

	socket.get '/chat', (obj)->
		$scope.chats = obj
		$scope.$apply()

	socket.on 'chat', (obj)->
		$scope.chats.push obj.data
		$scope.$apply()