socket = io.connect App.APIpoint

# Called each time the slide changes
angular.module("MobileApp.controllers", [])
.controller "IntroCtrl", ($scope, $state, $ionicSlideBoxDelegate, ENV) ->
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
.controller "MainCtrl", ($scope, $state) ->
  console.log "MainCtrl"
  $scope.name = 'Lee -- '

  $scope.toChat = ->
    $state.go "chat"

  $scope.toIntro = ->
    $state.go "test"
    return
.controller "ChatCtrl", ($scope)->
  $scope.input = {}
  $scope.data = {}
  $scope.data.hi = 'hello world'
  $scope.data.chats = []

  $scope.send = ->
    socket.post '/chat',
      message : $scope.input.message

    $scope.data.chats.push
      message : $scope.input.message
    $scope.input.message = ''

  socket.get '/chat', (obj)->
    $scope.data.chats = obj
    $scope.$apply()

  socket.on 'chat', (obj)->
    $scope.data.chats.push obj.data

  return
