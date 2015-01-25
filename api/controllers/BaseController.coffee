module.exports.front = (req, res)->
  res.locals.layout = 'layouts/front'
  res.view 'index'

module.exports.user = (req, res)->
  res.locals.layout = 'layouts/back'
  res.view 'index'
