$(document).ready(function(){
  setTimeout(function(){
    $('#card-alert').slideUp();
  }, 2000);
});

$(document).on('turbolinks:load', function(){
  $('time.timeago').timeago();
});
