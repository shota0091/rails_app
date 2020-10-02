$(document).on("mouseenter",".Like",function(){
  $('.Like').hover(function(){
    $(this).next('P').show();
  }, function(){
    $(this).next('p').hide();
  });
});

$(document).on("mouseenter",".list",function(){
  $('.list').hover(function(){
    $(this).next('P').show();
  }, function(){
    $(this).next('p').hide();
  });
});

$(function(){
  $('.DeleteBtn').hover(function(){
    $(this).next('P').show();
  }, function(){
    $(this).next('p').hide();
  });
});

$(function(){
  $('.UserLink').hover(function(){
    $(this).next('P').show();
  }, function(){
    $(this).next('p').hide();
  });
});