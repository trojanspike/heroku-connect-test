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
        $scope.data.chats = obj
        $scope.$apply()

      $scope.input.send = ->
        io.socket.post '/chat', $scope.input, (obj)->
          $scope.$apply ->
            $scope.data.chats.push obj
            $scope.input.message = ''

  ]