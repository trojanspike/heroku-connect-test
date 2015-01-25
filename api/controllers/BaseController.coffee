module.exports.front = (req, res)->
  res.locals.layout = 'layouts/front'
  res.view 'home/index'

module.exports.user = (req, res)->
  res.locals.layout = 'layouts/back'
  res.view 'home/index'