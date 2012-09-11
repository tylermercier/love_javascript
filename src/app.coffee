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
    matchedProducts = _.select products, (product) => @isMatch(product, textToSearch)

    @render(matchedProducts)

  isMatch: (product, textToSearch)->
    lowerCasedTextToSearch = textToSearch.toLocaleLowerCase()

    product.title.toLocaleLowerCase().indexOf(lowerCasedTextToSearch) >= 0 ||
    product.description.toLocaleLowerCase().indexOf(lowerCasedTextToSearch) >= 0


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