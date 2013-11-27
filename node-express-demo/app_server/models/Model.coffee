mongo = require('mongoskin')
config = require('../config')

class Model
  constructor: (@colName, @dburl) ->
    if _.isEmpty(@dburl)
      @dburl = config.dbUrl
    @db = mongo.db(@dburl)
    @collection = db.collection(@colName)

  save : (doc, options, callback) ->
    return @collection.save(doc, options, callback)

  findOne : () ->
    return @collection.findone()