# Called each time the slide changes
angular.module("MobileApp.controllers", []).controller("IntroCtrl", ($scope, $state, $ionicSlideBoxDelegate, ENV) ->
  $scope.startApp = ->
    console.log ENV
    $state.go "main"
    return

  $scope.next = ->
    $ionicSlideBoxDelegate.next()
    return

  $scope.previous = ->
    $ionicSlideBoxDelegate.previous()
    return

  $scope.slideChanged = (index) ->
    $scope.slideIndex = index
    return

  return
).controller "MainCtrl", ($scope, $state) ->
  console.log "MainCtrl"
  $scope.name = 'Lee -- '

  $scope.toChat = ->
    $state.go "chat"

  $scope.toIntro = ->
    $state.go "test"
    return

  return
