$(document).ready(function() {
    $("#payment-button").prop('disabled', false)
  })

  var handler = StripeCheckout.configure("customButtonA", {
    key: '<<%= Rails.configuration.stripe[:publishable_key] %>'',
    token: function(token, args){
      var $input = $('<input type=hidden name=stripeToken />').val(token.id);
      $('form').append($input).submit();
    }
  });
  
  ('#payment-button').on('click', function(e){
    $('#payment-button').prop('disabled', true);
    setTimeout(function() {
      $('#payment-button').prop('disabled', false);
    }, 3000); // Sets a short timeout
    handler.open({
      amount: "<%= @product.price * 100 %>",
      image: "<%= @product.image_url %>",
      name: "<%= @product.name %>",
      description: "<%= @product.description %>",
      currency: "usd",
    });
    e.preventDefault();
});