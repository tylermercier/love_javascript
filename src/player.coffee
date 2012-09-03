#=require models/song

window.Gallery ?= {}

class Player
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

window.Gallery.Player = Player