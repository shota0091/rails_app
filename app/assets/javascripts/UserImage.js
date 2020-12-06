$(document).on('turbolinks:load',function(){
  function buildHTML(url){
    let html = `<div class="prev-content">
                  <img src="${url}", class="prev-image"></img>
                    <div class="image-edit">
                      動画を変更する
                    </div>
                </div>`
      return html
  }

  $(document).on('click','.ImgePreview',function(){
    const file_field = $('input[type="file"]');
    file_field.trigger('click');
    $('#user_image').change(function(e){
    var file = e.target.files[0];
    var reader = new FileReader();
    reader.readAsDataURL(file);
    reader.onload = function () {
      var image = this.result;
      if ($('.prev-content').length == 0) {
        var html = buildHTML(image)
        $('#previews').prepend(html);
        $('.ImgePreview').hide();
        $('.prev-image').css({
          "height": "300px",
          "width": "300px",
          "border-radius": "50%"
        })
        $('.image-edit').css({
          "padding":"10px",
          "margin":"20px 100px",
          "color":"white",
          "background-color":"skyblue",
          "text-align": "center",
          "border":"1px solid skyblue",
          "border-radius": "15px",
          "cursor":"pointer",
        })
        $('.prev-content').css({
          "text-align":"center",
        })
      } else {
        $('.prev-content .prev-image').attr({ src: image });
        }
      }
    });
  });
});