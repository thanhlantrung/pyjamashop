// Action Cable provides the framework to deal with WebSockets in Rails.
// You can generate new channels where WebSocket features live using the rails generate channel command.
//
//= require action_cable
//= require_self
<<<<<<< HEAD


=======
/*
//= require_tree ./channels
*/
>>>>>>> e6ee7a7b7c6daca022c4dcecbb7026e33260213f

(function() {
  this.App || (this.App = {});

  App.cable = ActionCable.createConsumer();

}).call(this);