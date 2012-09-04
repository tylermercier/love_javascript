window.Gallery ?= {}

class window.Gallery.Player
  play: (song) ->
    @currentSong = song
    @playing = true

  pause: ->
    @playing = false

  resume: ->
    throw new Error "song is already playing" if @playing
    @playing = true

  favorite: ->
    @currentSong.like()