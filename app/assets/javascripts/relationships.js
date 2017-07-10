$(document).ready(function(){
  $('body').on('click', '.follow-button', function(event){
    event.preventDefault();
    var followed_id = $(this).attr('id');
    $.ajax({
      url: '/relationships',
      type: 'post',
      dateType: 'json',
      data: {followed_id: followed_id},
      success: function(data){
        $('.follow-form').html(data.button_html);
        $('#followers').text(parseInt($('#followers').text()) + 1);
      },
      error: function(){
        alert('Fail!');
      }
    });
  });

  $('body').on('click', '.unfollow-button', function(event){
    event.preventDefault();
    var relationship_id = $(this).attr('id');
    $.ajax({
      url: '/relationships/'+ relationship_id,
      type: 'delete',
      dateType: 'json',
      data: {id: relationship_id},
      success: function(data){
        $('.follow-form').html(data.button_html);
        $('#followers').text(parseInt($('#followers').text()) - 1);
      },
      error: function(){
        alert('Fail!');
      }
    });
  });
});
