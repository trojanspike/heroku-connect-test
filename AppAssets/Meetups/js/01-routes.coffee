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

	.state "test",
		url: "/test"
		templateUrl: "#tpl.html"
		controller: "MainCtrl"

	$urlRouterProvider.otherwise "/intro"
	return