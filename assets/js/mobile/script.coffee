do ->

	socket = io.connect 'http://192.168.1.2:1337'

	socket.on 'test', (data)->
		navigator.notification.alert data
