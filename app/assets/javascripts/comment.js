$(function(){
  function buildHTML(comment){
    let html = `<div class="Content">
                  <div class="Content__box">
                    <div class="UserNmae">
                      <a class="LinkUser" href="${comment.user_id}">${comment.user_name}:</a>
                    </div>
                    <div class="comments">
                    ${comment.text}
                    </div>
                    <div class="time">
                    ${comment.created_at}
                    </div>
                  </div>
                </div>`
    return html;
  };


  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    let formData = new FormData(this);
    let url = $(this).attr('action');

    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      let html = buildHTML(data);
      $('.CommentSide').prepend(html)
      $('.input-text').val('');
      $('.form__submit').prop('disabled', false);
      var count = $(".CommentSide").children().length;
      $('#comment-count').text("コメント数:"+count);
    })
    .fail(function(){
      alert("メッセージ送信失敗しました");
      $('.form__submit').prop('disabled', false);
    })
  });
});