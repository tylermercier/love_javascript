describe "App", =>
  beforeEach =>
    @app = new window.Store.App
      el: $('<div/>')
      template: (data) -> data # stub
      catalog:
        get: -> # stub
      searchBox: $('<input/>')


  describe '.load', =>
    it 'should load the catalog', =>
      spyOn(@app.catalog, 'get')

      @app.load()

      expect(@app.catalog.get).toHaveBeenCalled()

  describe '.render', =>
    it 'should display the results in the view', =>
      @app.render('hello world')

      expect(@app.el.html()).toBe('hello world')

  describe 'isMatch', =>
    it 'should return true when title contains the text', =>
      match = @app.isMatch({title: 'Google'}, 'Google')
      expect(match).toBe(true)

    it 'should return true when title contains the text in a different case', =>
      match = @app.isMatch({title: 'Google'}, 'gooGLe')
      expect(match).toBe(true)

    xit 'should return true when description contains the text', =>
    xit 'should return true when description contains the text in a different case', =>
    xit 'should return false when neither title nor description contains the text', =>
