module.exports = (req, res, next)->
  # if req.isSocket then next() else res.forbidden()
  next()