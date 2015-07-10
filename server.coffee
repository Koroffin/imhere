express = require('express')
socket_io = require('socket.io')

app = express()

# configure app
app.set 'port', (process.env.PORT || 5000)
app.use express.static __dirname + '/public'

# routes
app.get '/api/model', (req, res) ->
  res.send('Here will be some model')

# Run server
server = app.listen app.get('port'), () ->
  host = server.address().address
  port = server.address().port
  console.log('Example app listening at http://%s:%s', host, port)

# Socket.io
io = socket_io(server)
getClientById = (id) ->
  return io.sockets.socket(id)
io.on 'connection', (client) ->
  console.log 'New user '+client.id+' connected!'
  client.broadcast.emit 'message', 'New user '+client.id+' connected!'
  client.on 'disconnect', () ->
    clearTimeout timer
    console.log 'User '+client.id+' disconnected!'
    client.broadcast.emit 'message', 'User '+client.id+' disconnected!'
  timer = setTimeout () ->
    client.emit 'message', 'This is test message of Socket IO for client '+client.id
  , 2000
