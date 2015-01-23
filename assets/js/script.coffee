do ->

	angular.module 'appName', []
	.controller 'MainCtrl', [
			'$scope'
			($scope)->
				$scope.name = 'UserName'
		]
	.controller 'chatbox', ['$scope',
		($scope)->
			self = this
			this.param = 'hello world'
			this.chats = []
			this.send = ->
				io.socket.post '/chat',
					message : self.input , ->
					self.chats.push
						message : self.input
					self.input = ''

			io.socket.get '/chat', (obj)->
				self.chats = obj
				$scope.$apply()

			io.socket.on 'chat', (obj)->
				self.chats.push obj.data
				$scope.$apply()

	]

