$(document).on('turbolinks:load', ()=> { 
  $(function(){
    function buildHTML(count) {
      var html = `<input id="item_images_attributes_${count}_image" name="item[images_attributes][${count}][src]" class="hidden-field" type="file"></input>
                  <input name="item[images_attributes][${count}][_destroy]" type="hidden" value="${count}"></input>
                  <input data-index="${count}" class="hidden-destroy" type="checkbox" value="1" name="item[images_attributes][${count}][_destroy]" id="item_images_attributes_${count}__destroy"></input>`
      return html;
    }

    $('.preview-box').on('click', '.delete-box', function() {
      const targetIndex = $(this).parent().parent().attr('id');
      // 該当indexを振られているチェックボックスを取得する
      const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
      console.log(hiddenCheck);
      // もしチェックボックスが存在すればチェックを入れる
      if (hiddenCheck) hiddenCheck.prop('checked', true);

      $(this).parent().remove();
      $(`img[data-index="${targetIndex}"]`).remove();
    });
 

    var count = $('input[type = "file"]').length;
    console.log(count);
    $('label[for="item_images_attributes_0_image"]').attr('for',`item_images_attributes_${count}_image`);
    if (count < 4){
      while(count <= 4){
        $('.hidden-content').append(buildHTML(count));
        count ++;
      }
    };
    function setLabel() {
      var prevContent = $('.label-content').prev();
      labelWidth = (620 - $(prevContent).css('width').replace(/[^0-9]/g, ''));
      $('.label-content').css('width', labelWidth);
    }
    setLabel();

    $(document).on('click', '.delete-box', function() {
      var count = $('.preview-box').length;
      setLabel(count);
      var id = $(this).attr('id').replace(/[^0-9]/g, '');
      $(`#preview-box__${id}`).remove();
      $(`#item_images_attributes_${id}_image`).val("");
      var count = $('.preview-box').length;
      if (count == 4) {
        $('.label-content').show();
      }
      setLabel(count);
      if(id < 5){
        $('.label-box').attr({id: `label-box--${id}`,for: `item_images_attributes_${id}_image`});
      }
    });
    
    // var count = $('.preview-box').length;
    // var reader = new FileReader();
    // reader.onload = function() {
    //   if (count == 5) { 
    //     $('.label-subcontent').hide();
    //   }
    //   if (count < 5) {
    //     $('.label-box').attr({id: `label-box--${count}`,for: `item_images_attributes_${count}_image`});
    //   }
    // }
  });
});