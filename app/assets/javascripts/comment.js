$(function(){
  function buildHTML(comment){
    if ( comment.user_image_url ) {
    let html = `
    <div class="player__main__comments__contents__image">
    <img class="image-icon" alt="/assets/default.jpg" src="${comment.user_image_url}">
    <div class="CommentBody">
    <div class="player__main__comments__contents__comments">
    コメント：
    ${comment.text}
    </div>
    <div class="player__main__comments__contents__user">
    投稿者：
    <a class="LinkUser" href="${comment.user_id}">${comment.user_name}</a>
    </div>
    <div class="player__main__comments__contents__time">
    投稿日：
    ${comment.created_at}
    </div>
    </div>
    </div>`
    return html;
    }else{
      let html = `
    <div class="player__main__comments__contents__image">
    <img class="image-icon" alt="/assets/default.jpg" src="/assets/default.jpg">
    <div class="CommentBody">
    <div class="player__main__comments__contents__comments">
    コメント：
    ${comment.text}
    </div>
    <div class="player__main__comments__contents__user">
    投稿者：
    <a class="LinkUser" href="${comment.user_id}">${comment.user_name}</a>
    </div>
    <div class="player__main__comments__contents__time">
    投稿日：
    ${comment.created_at}
    </div>
    </div>
    </div>`
    return html;
    }
  };


  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    let formData = new FormData(this);
    let url = $(this).attr('action');
    var countUpValue = 0;

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