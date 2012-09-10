class Checkout
  constructor: (@checkoutForm) ->
    @checkoutForm.on 'submit', () => @checkoutProducts()

  checkoutProducts: ->
    price = 0
    for product in products
      price += product.price * product.quantity
    price