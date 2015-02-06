module.exports = (req, res, next)->
  # if req.isSocket then next() else res.forbidden()
  if req.isSocket then next() else res.json { error : true, message : 'No http Access' }