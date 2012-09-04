describe "Player", =>

  beforeEach =>
    @player = new window.Gallery.Player()
    @song = new window.Gallery.Song('Dan Mangan', 'Robots')

  describe '.play', =>
    beforeEach =>
      @player.play(@song)

    it 'should set the current song', =>
      expect(@player.currentSong).toBe(@song)

    it 'should set playing to true', =>
      expect(@player.playing).toBe(true)

  describe '.pause', =>
    beforeEach =>
      @player.play(@song)

    it 'should set playing to false', =>
      @player.pause()

      expect(@player.playing).toBe(false);

  describe '.resume', =>
    beforeEach =>
      @player.play(@song)

    it 'should be set playing to be true', =>
      @player.pause()
      @player.resume()

      expect(@player.playing).toBe(true)

    it 'should throw song is already playing error when song already playing', =>
      expect(=> @player.resume()).toThrow(new Error("song is already playing"))

  describe '.favorite', =>
    it 'should add a like to the song', =>
      spyOn(@song, 'like')

      @player.play(@song)
      @player.favorite()

      expect(@song.like).toHaveBeenCalled()