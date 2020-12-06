$(document).on('turbolinks:load',function(){
  function buildHTML(url){
    let html = `<div class="prev-content">
                  <video src="${url}", class="prev-image"></video>
                    <div class="image-edit">
                      動画を変更する
                    </div>
                </div>`
      return html
  }

  $(document).on('click','.preview',function(){
    const file_field = $('input[type="file"]');
    file_field.trigger('click');
    $('#VideoForm').change(function(e){
    var file = e.target.files[0];
    var reader = new FileReader();
    reader.readAsDataURL(file);
    reader.onload = function () {
      var image = this.result;
      if ($('.prev-content').length == 0) {
        var html = buildHTML(image)
        $('#previews').prepend(html);
        $('.preview').hide();
        $('.prev-image').css({
          "height": "200px",
          "border-radius":"1em",
        })
        $('.image-edit').css({
          "padding":"10px",
          "margin":"20px 100px",
          "color":"white",
          "background-color":"skyblue",
          "text-align": "center",
          "border":"1px solid skyblue",
          "border-radius": "15px",
          "cursor":"pointer"
        })
      } else {
        $('.prev-content .prev-image').attr({ src: image });
        }
      }
    });
  });
  $(document).on('click','.image-edit',function(){
    const file_field = $('input[type="file"]');
    file_field.trigger('click');
    $
  })
})

