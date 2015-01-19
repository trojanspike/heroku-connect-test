// Ionic Starter App
console.log( window.device );

setTimeout( function(){
navigator.notification.activityStart('Titlr', 'mgs');
} , 1500);

setTimeout( function(){
navigator.notification.activityStop();
} , 5500);

setTimeout( function(){
 // navigator.app.exitApp()
	navigator.notification.alert('Alert --', 'Complete');
} , 8500);


// angular.module is a global place for creating, registering and retrieving Angular modules
angular.module('MobileApp', ['ionic', 'config', 'MobileApp.controllers'])

.run(function($ionicPlatform) {
  $ionicPlatform.ready(function() {
    // Hide the accessory bar by default (remove this to show the accessory bar above the keyboard
    // for form inputs)
    if(window.cordova && window.cordova.plugins.Keyboard) {
      cordova.plugins.Keyboard.hideKeyboardAccessoryBar(true);
    }
    if(window.StatusBar) {
      // org.apache.cordova.statusbar required
      StatusBar.styleDefault();
    }
  });
})

.config(function($stateProvider, $urlRouterProvider) {

  $stateProvider
  .state('intro', {
    url: '/',
    templateUrl: App.ASSETS+'/templates/intro',
    controller: 'IntroCtrl'
  })
  .state('main', {
    url: '/main',
    templateUrl: App.ASSETS+'/templates/main',
    controller: 'MainCtrl'
  });

  $urlRouterProvider.otherwise('/');

});
/****************************/
angular.module("config", [])

.constant("ENV", App);
/****************************/
angular.module('MobileApp.controllers', [])

.controller('IntroCtrl', function($scope, $state, $ionicSlideBoxDelegate, ENV) {
 
  // Called to navigate to the main app
  $scope.startApp = function() {
	console.log( ENV );
    $state.go('main');
  };
  $scope.next = function() {
    $ionicSlideBoxDelegate.next();
  };
  $scope.previous = function() {
    $ionicSlideBoxDelegate.previous();
  };

  // Called each time the slide changes
  $scope.slideChanged = function(index) {
    $scope.slideIndex = index;
  };
})

.controller('MainCtrl', function($scope, $state) {
  console.log('MainCtrl');
  
  $scope.toIntro = function(){
    $state.go('intro');
  }
});

/******/

angular.element(document).ready(function() {
  angular.bootstrap(document, ['MobileApp']);
});
