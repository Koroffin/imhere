express = require('express')

app = express()

app.set 'port', (process.env.PORT || 5000)
app.use express.static __dirname + '/public'

app.get '/api/model', (req, res) ->
  res.send('Here will be some model')

server = app.listen app.get('port'), () ->

  host = server.address().address
  port = server.address().port

  console.log('Example app listening at http://%s:%s', host, port)