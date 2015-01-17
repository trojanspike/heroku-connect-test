do ->
	socket = io.connect()

	socket.on 'test', (data)->
		document.getElementById 'main-title'
		.innerHTML = data;
