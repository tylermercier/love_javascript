window.Store ?= {}

class window.Store.App
  constructor: (options) ->
    @el = options.el
    @template = options.template
    @catalog = options.catalog
    @searchBox = options.searchBox

    @searchBox.bind 'keyup', =>
      @filterCatalog(@searchBox.val())

  load: ->
    data = @catalog.get()
    @render(data)

  render: (data) ->
    @el.html(@template(data))

  filterCatalog: (textToSearch)->
    products = @catalog.get()
    matchedProducts = _.select products, (product) => product.isMatch(textToSearch)

    @render(matchedProducts)

class window.Store.Product
  constructor: (info)->
    @image = info.image
    @title = info.title
    @description = info.description
    @price = info.price

  containsText: (string, textToSearch)->
    string && string.toLocaleLowerCase().indexOf(textToSearch) >= 0

  isMatch: (textToSearch)->
    lowerCasedTextToSearch = textToSearch.toLocaleLowerCase()
    @containsText(@title, lowerCasedTextToSearch) ||
    @containsText(@description, lowerCasedTextToSearch)


window.Store.catalog =
  get: ->
    [ new window.Store.Product
        image: 'LoveJS.png'
        title: 'LoveJS'
        description: 'For programmers that love Javascript!'
        price: 25
      new window.Store.Product
        image: 'LoveJS.png'
        title: 'Geek'
        description: 'Geeks rule the world like it or not :)'
        price: 25
      new window.Store.Product
        image: 'LoveJS.png'
        title: 'LoveJS'
        description: 'For programmers that love Javascript!'
        price: 25
      new window.Store.Product
        image: 'LoveJS.png'
        title: 'Geek'
        description: 'Geeks rule the world like it or not :)'
        price: 25
      new window.Store.Product
        image: 'LoveJS.png'
        title: 'LoveJS'
        description: 'For programmers that love Javascript!'
        price: 25
      new window.Store.Product
        image: 'LoveJS.png'
        title: 'Geek'
        description: 'Geeks rule the world like it or not :)'
        price: 25
    ]