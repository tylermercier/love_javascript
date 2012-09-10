// Generated by CoffeeScript 1.3.3
(function() {
  var _ref, _ref1;

  if ((_ref = window.Gallery) == null) {
    window.Gallery = {};
  }

  window.Gallery.Player = (function() {

    function Player() {}

    Player.prototype.play = function(song) {
      this.currentSong = song;
      return this.playing = true;
    };

    Player.prototype.pause = function() {
      return this.playing = false;
    };

    Player.prototype.resume = function() {
      if (this.playing) {
        throw new Error("song is already playing");
      }
      return this.playing = true;
    };

    Player.prototype.favorite = function() {
      return this.currentSong.like();
    };

    return Player;

  })();

  if ((_ref1 = window.Gallery) == null) {
    window.Gallery = {};
  }

  window.Gallery.Song = (function() {

    function Song(artist, title) {
      this.artist = artist;
      this.title = title;
      this.likes = 0;
    }

    Song.prototype.like = function() {
      return this.likes++;
    };

    Song.prototype.newFeature = function() {
      throw new Error("not yet implemented");
    };

    return Song;

  })();

}).call(this);
