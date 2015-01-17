var express = require('express'),
app = express();


app.get('/' , function(req, res){
  res.send(' @ heroku connect ' );
});

app.listen( process.env.PORT )
