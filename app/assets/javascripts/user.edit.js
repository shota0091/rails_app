$(document).on("mouseenter",'.EditBtn',function(){
  $(this).after('<div id="hover">ユーザー情報の変更</div>')
  $("#hover").css({
    color:'white',
    background:'#0066FF',
    fontSize: '13px',
    padding: '10px',
    margin: '10px 0 0 0',
  });
  $('.EditBtn').on("mouseenter",function(){
    $('#hover').remove()
  })
});
