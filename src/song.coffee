window.Gallery ?= {}

class window.Gallery.Song
  constructor: (@artist, @title) ->
    @likes = 0

  like: ->
    @likes++

  newFeature: ->
    throw new Error "not yet implemented"