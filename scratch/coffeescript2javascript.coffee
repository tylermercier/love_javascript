class Cart
  constructor: (@form) ->
    @form.on 'submit', => @checkout()

  checkout: ->
    price = 0
    for product in products
      price += product.price * product.quantity
    price