#### Routes
# We are setting up theese routes:
#
# GET, POST, PUT, DELETE methods are going to the same controller methods - we dont care.
# We are using method names to determine controller actions for clearness.
routes = require('./controller')
user = require('./controller/user')

module.exports = (app) ->

  # simple session authorization
  checkAuth = (req, res, next) ->
    unless req.session.authorized
      res.statusCode = 401
      res.render '401', 401
    else
      next()

  app.get('/', routes.index)
  app.get('/users', checkAuth, user.list)
  app.all '/private', checkAuth, (req, res, next) ->
    routeMvc('private', 'index', req, res, next)
