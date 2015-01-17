var express = require('express'),
app = express();

app.set('view engine', 'ejs');
app.set('views', '/views');
app.use(express.static(process.cwd() + '/public'));

app.get('/' , function(req, res){
  res.render('index', { title : 'Heroku github connect' });
});

app.listen( process.env.PORT )
