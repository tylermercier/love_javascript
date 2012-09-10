window.Store ?= {}

class window.Store.App
  constructor: (options) ->
    @el = options.el
    @template = options.template
    @catalog = options.catalog

  load: ->
    data = @catalog.get()
    @render(data)

  render: (data) ->
    @el.html(@template(data))

window.Store.catalog =
  get: ->
    [
        image: 'LoveJS.png'
        title: 'LoveJS'
        description: 'For programmers that love Javascript!'
        price: 25
      ,
        image: 'LoveJS.png'
        title: 'Geek'
        description: 'Geeks rule the world like it or not :)'
        price: 25
      ,
        image: 'LoveJS.png'
        title: 'LoveJS'
        description: 'For programmers that love Javascript!'
        price: 25
      ,
        image: 'LoveJS.png'
        title: 'Geek'
        description: 'Geeks rule the world like it or not :)'
        price: 25
      ,
        image: 'LoveJS.png'
        title: 'LoveJS'
        description: 'For programmers that love Javascript!'
        price: 25
      ,
        image: 'LoveJS.png'
        title: 'Geek'
        description: 'Geeks rule the world like it or not :)'
        price: 25
    ]