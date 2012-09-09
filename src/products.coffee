$(document).ready ->
  template = Handlebars.compile($('#product-template').html())
  $('.selected-products').html(template(productList))