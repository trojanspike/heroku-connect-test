var express = require('express'),
app = express();


app.get('/' , function(req, res){
  res.send(' @ heroku connect : UPDATE -'+ (new Date().getTime()) );
});

app.listen( process.env.PORT )
