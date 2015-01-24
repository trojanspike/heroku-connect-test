do ->
  angular.module 'appName'
  .config [
    "$stateProvider"
    ($stateProvider)->
      $stateProvider
      .state 'strap',
        url : '/strap'
        templateUrl : '/js/app/strap/index.html'
        controller : 'strapCtrl as vm'
  ]
