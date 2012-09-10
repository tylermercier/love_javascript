$(document).ready ->
  template = Handlebars.compile($('#product-template').html())
  $('.selected-products').html(template(productList))

class Catalog
  constructor: (@products, @catalogView)->

  search: (query)->
    # result = filter
    # render(result)

class CatalogView
  constructor: (@display, @template)->

  render: (catalog)->
    @display.html(@template(catalog))


class StoreFront
  constructor: (@catalog, @searchBox)->
    @searchBox.on 'change' =>
      @renderMatchedProducts(@searchBox.val())

  renderMatchedProducts: (text)->
    @catalog.search(text)

#1 logical example of search
#2 DI of views
#3 handling events


class ShoppingCart
  constructor: (@shoppingCartView)->

  add: (product, quanity)->
    @lineItems.push({product: product, quantity: quantity})
    @shoppingCartView.render(@lineItems)

  remove: ()->

class ShoppingCartView

  render: (lineItems)->
