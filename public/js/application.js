$(document).ready(function() {

  // event handler on sign in button to hide welcome screen and display restaurant screen
  $('.welcome_screen_sign_in button').on('click', function(e){
    e.preventDefault();
    $('.welcome_screen').hide();
    $('.restaurant_screen').show();

})

  // ajax call to accept show special button and
  // hide show special button, display special and
  // send text button
  $('.show_special').on('submit', function(e){
    e.preventDefault();
    var that = $(this);
    var data = $(this).prev().prev().html();
    var data_obj = {restaurant_name: data};
    $.ajax({
      type: 'GET',
      url: '/getspecial',
      data: data_obj
    })
    .done(function(server_data){
      that.hide();
      var special_string = "Special is: " + server_data;
      that.next().html(special_string);
      // show special in h4
      that.next().show();
      // show send text button
      that.next().next().show();
    })
    .fail(function(server_data){
      console.log("fail");
    })
    

})

  // ajax call for send_text input submit
  $('.send_text').on('submit', function(e){
    e.preventDefault();
    var that = $(this);
    var data = $(this).prev().html();
    var data_obj = {restaurant_special: data};
    $.ajax({
      type: 'GET',
      url: '/sendtext',
      data: data_obj
    })
    .done(function(server_data){
      that.hide();
    })
    .fail(function(server_data){
      console.log(fail);
    })

  })

  // ajax call for text user click
  $('.textuser').on('click', function(e) {
    e.preventDefault();
//    $(this).fadeOut(1200);
    var that = $(this);
    var route = this.href
    $.ajax({
      type: 'GET',
      url: route 
    })
    .done(function(server_data){
    that.hide();
    $('.textsent').html("Text Sent!");
    $('.backtorestaurants').html("Back to Restaurants");
 })

})
});
