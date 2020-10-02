$(document).on("mouseenter",".list",function(){
  $('.list').hover(function(){
    $(this).next('P').show();
  }, function(){
    $(this).next('p').hide();
  });
});