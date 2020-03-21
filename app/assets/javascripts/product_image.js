$(function(){
  var dataBox = new DataTransfer();
  var file_field = document.querySelector('input[type=file]')
  $('#img-file').change(function(){
    var files = $('input[type="file"]').prop('files')[0];
    $.each(this.files, function(i, file){
      var fileReader = new FileReader();
      dataBox.items.add(file)
      file_field.files = dataBox.files
      var num = $('.item-image').length + 1 + i
      fileReader.readAsDataURL(file);
      if (num == 10){
        $('#image-box__container').css('display', 'none')   
      }
      fileReader.onloadend = function() {
        var src = fileReader.result
        var html= `<div class='item-image' data-image="${file.name}">
                    <div class=' item-image__content'>
                      <div class='item-image__content--icon'>
                        <img src=${src} width="114" height="80" data={index: index}>
                      </div>
                    </div>
                    <div class='item-image__operetion'>
                      <div class='item-image__operetion--delete'>削除</div>
                    </div>
                  </div>`
        $('#image-box__container').before(html);
      };
      $('#image-box__container').attr('class', `item-num-${num}`)
    });
  });
  $(document).on("click", '.item-image__operetion--delete', function(){
    var target_image = $(this).parent().parent()
    var target_name = $(target_image).data('image')
    if(file_field.files.length==1){
      $('input[type=file]').val(null)
      dataBox.clearData();
      console.log(dataBox)
    }else{
      $.each(file_field.files, function(i,input){
        if(input.name==target_name){
          dataBox.items.remove(i) 
        }
      })
      file_field.files = dataBox.files
    }
    target_image.remove()
    var num = $('.item-image').length
    $('#image-box__container').show()
    $('#image-box__container').attr('class', `item-num-${num}`)
  });


  // $(document).on("click", '.item-image__operetion--delete', function(){
  //   let productID = $(this).data('index');
  //   let imageID = $(this).data('id');
  //   $.ajax({
  //     url: '/products/' + productID + '/image_destroy',
  //     type: 'POST',
  //     data: {'image_id': imageID,
  //           '_method': 'DELETE'},
  //     dataType: 'json'
  //   })
  // });
  $(document).on('click', '.item-image__operetion--delete', function() {
    const targetIndex = $(this).parent().data('index')
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    console.log(hiddenCheck);
    if (hiddenCheck) hiddenCheck.prop('checked', true);
    $(this).parent().remove();
    $(`img[data-index="${targetIndex}"]`).remove();
  })
});