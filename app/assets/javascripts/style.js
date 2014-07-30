$(document).ready(function() {

  // Search Bar
  $(".search").on("click", function(){
    $('#fade, #search-feeds').fadeIn('normal', function() { $('#fade, #search-feeds').css('display','block')})
    $( "#search-bar" ).select();
  });

  // Search Submit
  $("#search-bar").bind("keypress", function(){
    if(event.which == 13) {
      $('.button-subscribe').css('display','block');
      $('.suggestions').css('display','block');
    }
  });

  // My Feeds
  $("#link-manage-feeds").on("click", function(){
    $('#fade, #my-feeds').fadeIn('normal', function() { $('#fade, #my-feeds').css('display','block')});
  });

  // Add Feeds
  $("#link-add-feeds").on("click", function(){
    $('#fade, #search-feeds').fadeIn('normal', function() { $('#fade, #search-feeds').css('display','block')})
    $( "#search-bar" ).select();
  });

  // My Settings
  $(".box-middle").on("click", function(){
    $('#fade, #my-settings').fadeIn('normal', function() { $('#fade, #my-settings').css('display','block')});
  });

  // Full Article
  $("#link-full-article").on("click", function(){
    $('#fade, #full-article').fadeIn('normal', function() { $('#fade, #full-article').css('display','block')});
  });

  // Welcome
  $("#link-welcome").on("click", function(){
    $('#fade, #welcome-helper').fadeIn('normal', function() { $('#fade, #welcome-helper').css('display','block')});
  });

  // Loader
  $("#link-loader").on("click", function(){
    $('#loader').css('display','block');
  });

  // Dark Overlay
  $("#fade").on("click", function(){
    $('#fade, .popup:visible').fadeOut('normal', function() { $('#fade, .popup:visible').css('display','none')});
  });

  // Bind Escape to Close Popups
  $(document).keyup(function(e){
    if(e.keyCode === 27) {
      $('#fade, .popup:visible').fadeOut('normal', function() { $('#fade, .popup:visible').css('display','none')});
    }
  });

});