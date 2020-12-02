$(document).one("mouseenter",'#new_comment',function(){
    $(this).after('<div id="hover">※誹謗中傷、公序良俗に反する書き込みはやめましょう！</div>')
    $("#hover").css({
      color:'white',
      background:'#0066FF',
      fontSize: '16px',
      padding: '10px',
      margin: '10px 0 0 0',
    });
  });