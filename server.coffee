express = require('express')

app = express()

app.set 'port', (process.env.PORT || 5000)
app.use express.static __dirname + '/public'

app.get '/', (req, res) ->
  res.send('Hello World!!! I am heroku app with grunt!')

server = app.listen app.get('port'), () ->

  host = server.address().address
  port = server.address().port

  console.log('Example app listening at http://%s:%s', host, port)