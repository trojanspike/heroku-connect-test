do ->
  angular.module 'appName'
  .controller 'ChatMainCtrl', [
    "$scope"
    ($scope)->
      $scope.data = {}
      $scope.input = {}

      $scope.data.hi = 'Hello World'
      $scope.data.chats =[]

      io.socket.get '/chat', (obj)->
        $scope.$apply ->
          $scope.data.chats = obj

      io.socket.on 'chat', (obj)->
        $scope.$apply ->
          $scope.data.chats.push obj.data

      $scope.input.send = ->
        io.socket.post '/chat', $scope.input, (obj)->
          $scope.$apply ->
            $scope.data.chats.push obj
            $scope.input.message = ''

  ]