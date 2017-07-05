$(document).ready(function(){
  $('body').on('submit', '.new_comment', function(event) {
    event.preventDefault();
    var self = $(this);
    var params = self.serialize();
    if ($('#submit-btn').attr('data_edit') == 'false'){
      $.ajax({
        url: self.attr('action'),
        type: 'post',
        dataType: 'json',
        data: params
      })
        .done(function(response) {
          self.closest('body').find('.list-comment').append(response.html);
          self.closest('body').find('.comment-input').val('');
          $('time.timeago').timeago();
        });
    }
    else{
      var id = $('#submit-btn').attr('id_cmt');
      var post_id = $('#submit-btn').attr('post_id');
      $.ajax({
        url: '/posts/' + post_id + '/comments/' + id,
        type: 'put',
        dataType: 'json',
        data: params
      })
        .done(function(response) {
          self.closest('body').find('.comment-input').val('');
          $('.list-comment').html(response.html);
          $('time.timeago').timeago();
          $('#submit-btn').attr('data_edit', 'false');
        });
    }
    return false;
  });

  $('body').on('click','.delete', function(event) {
    event.preventDefault();
    var del = $(this);
    $.ajax({
      type: del.attr('data-method'),
      url: del.attr('href'),
      data: {},
      dataType: 'json',
      success: function (response) {
        if (response.status == 'success') {
          del.closest('.show-comment').fadeOut('normal');
        }
      }
    });
    return false;
  });

  $('body').on('click', '.edit', function(event) {
    event.preventDefault();
    var id = $(this).closest('.show-comment').attr('id');
    $('.comment-input').val($(this).closest('body').find('.comment-content-'+id).text());
    $('#submit-btn').attr({'data_edit': 'true', 'id_cmt': id});
  });
});
