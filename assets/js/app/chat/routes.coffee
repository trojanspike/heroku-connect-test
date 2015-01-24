do ->
  angular.module 'appName'
  .config [
    "$stateProvider"
    ($stateProvider)->
      $stateProvider
      .state 'chat',
        url : '/chat'
        abstract : true
        templateUrl : '/js/app/chat/abstract.html'

      .state 'chat.start',
        url : '/start'
        templateUrl : '/js/app/chat/start.html'
        controller : 'ChatMainCtrl'
  ]