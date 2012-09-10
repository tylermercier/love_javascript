describe "App", =>
  beforeEach =>
    @app = new window.Store.App
      el: $('<div/>')
      template: (data) -> data # stub
      catalog:
        get: -> # stub

  describe '.load', =>
    it 'should load the catalog', =>
      spyOn(@app.catalog, 'get')

      @app.load()

      expect(@app.catalog.get).toHaveBeenCalled()

  describe '.render', =>
    it 'should display the results in the view', =>
      @app.render('hello world')

      expect(@app.el.html()).toBe('hello world')
