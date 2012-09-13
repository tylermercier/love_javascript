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
    products = @catalog.getProducts()
    @render(products)

  render: (products) ->
    @el.html(@template(products))

  filterCatalog: (textToSearch)->
    products = @catalog.getProducts()
    matchedProducts = _.select products, (product) => product.isMatch(textToSearch)

    @render(matchedProducts)

class window.Store.Product

  constructor: (info) ->
    @image = info.image
    @title = info.title
    @description = info.description
    @price = info.price

  containsText: (string, textToSearch) ->
    string && string.toLocaleLowerCase().indexOf(textToSearch) >= 0

  isMatch: (textToSearch) ->
    lowerCasedTextToSearch = textToSearch.toLocaleLowerCase()
    @containsText(@title, lowerCasedTextToSearch) ||
    @containsText(@description, lowerCasedTextToSearch)

window.Store.catalog =
  getProducts: ->
    [ new window.Store.Product
        image: 'LoveJS.png'
        title: 'LoveJS'
        description: 'For programmers that love Javascript!'
        price: 25
      new window.Store.Product
        image: 'Geek.png'
        title: 'Geek'
        description: 'Geeks rule the world like it or not :)'
        price: 25
      new window.Store.Product
        image: 'Friday.png'
        title: 'Friday'
        description: 'Everyone loves fridays all year round'
        price: 25
      new window.Store.Product
        image: 'Huh.png'
        title: 'Huh!'
        description: 'Why so serious? Its not the end of the world.'
        price: 25
      new window.Store.Product
        image: 'Mario.png'
        title: 'Mario'
        description: 'Are you a Mario? Forget Mario, who are you?'
        price: 25
      new window.Store.Product
        image: 'Pink.png'
        title: 'Pink'
        description: 'Love Pink? Join the millions out there!'
        price: 25
    ]