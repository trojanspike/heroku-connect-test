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
		url "/chat"
		templateUrl : App.ASSETS + "/templates/chat"
		controller : "chatCtrl"

	.state "test",
		url: "/test"
		templateUrl: "#tpl.html"
		controller: "MainCtrl"

	$urlRouterProvider.otherwise "/intro"
	return

.controller "chatCtrl",
	["$scope"
	($scope)->
	]
