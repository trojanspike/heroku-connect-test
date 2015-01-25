module.exports = (req, res, next)->
  if req.session.authenticated then next()

  res.forbidden 'You are not permitted to perform this action.'

