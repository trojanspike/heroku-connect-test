do ->
  angular.module 'appName'
  .controller 'ChatMainCtrl', [
    "$scope"
    ($scope)->

      $scope.$on '$destroy', ->
        alert '$scope destroyed'

      $scope.data = {}
      $scope.input = {}

      $scope.data.hi = 'Hello World'
      $scope.data.chats =[]

      io.socket.get '/chat', (obj)->
        $scope.$apply ->
          $scope.data.chats = obj
          window.Arr = obj

      $scope.input.send = ->
        io.socket.post '/chat', $scope.input , (obj)->
          console.log '@_POST'
          console.log obj
          $scope.$apply ->
            $scope.data.chats.push obj
            $scope.input.message = ''

      $scope.input.delete = (index, event)->
        event.preventDefault()
        io.socket.delete '/chat/'+$scope.data.chats[index]["id"], (obj)->
          console.log '@_DELETE'
          console.log obj
          $scope.$apply ->
            $scope.data.chats.splice index, 1


      io.socket.on 'chat', (obj)->
        console.log '@_RECIEVED'
        console.log obj
        switch obj.verb
          when 'destroyed'
            $scope.data.chats.forEach (val, index)->
              if obj.id is val.id
                $scope.$apply ->
                  $scope.data.chats.splice index, 1

          when 'created'
            $scope.$apply ->
              $scope.data.chats.push obj.data

  ]
