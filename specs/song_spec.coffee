describe "Song", =>

  beforeEach =>
    @song = new window.Gallery.Song('Dan Mangan', 'Robots')

  describe '.like', =>
    it 'should set the current song', =>
      @song.like()

      expect(@song.likes).toBe(1)

  describe '.newFeature', =>
    it 'should throw not implemented error', =>
      expect(=> @song.newFeature()).toThrow(new Error("not yet implemented"))