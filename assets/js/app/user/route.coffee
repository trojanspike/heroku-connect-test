do ->
  angular.module 'appName'
  .config [
    "$stateProvider"
    ($stateProvider)->
      $stateProvider
      .state 'user',
        url : '/user'
        templateUrl : '/js/app/user/index.html'
        controller : 'chatbox as vm'
  ]