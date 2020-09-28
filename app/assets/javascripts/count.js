$(function(){

  $('#new_comment').on('submit', function(e){
    var count = $(".CommentSide").children().length;
    $('#comment-count').text(count+1);
  });
});
