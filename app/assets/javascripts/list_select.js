$(function(){
  $('li').hover(function(){
    $(this).css({
      color:'red',
      background:'SkyBlue',
    });
  },function(){
    $(this).css({
      'background':'',
      'color':''
    });
  });
  $('.ListBtn').hover(function(){
    $(this).css({
      color:'red',
    });
  },function(){
    $(this).css({
      'color':''
    });
  });
});
