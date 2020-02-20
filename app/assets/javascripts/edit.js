if(document.URL.match(/edit/)){
  $(document).on('turbolinks:load', ()=> { 
    function setLabel() {
      var prevContent = $('.label-content').prev();
      labelWidth = (620 - $(prevContent).css('width').replace(/[^0-9]/g, ''));
      $('.label-content').css('width', labelWidth);
    }
    setLabel();
    var count = $('.preview-box').length;
          if (count == 5) { 
            $('.label-content').hide();
          }
          setLabel();
          if(count < 5){
            $('.label-content').append(buildEDIT(count));
          }
    function buildEDIT(count) {
      var html = `<div class="label-item">
                  <label class="label-box" for="item_images_attributes_${count}_image" id="label-box--0">
                  <pre class="label-box__text">クリックしてファイルをアップロード</pre>
                  <input id="item_images_attributes_${count}_image" name="item[images_attributes][${count}][src]" style="display:none;" class="hidden-field" type="file"></input>
                  </label>
                  </div>`
      return html;
    }

    $('.preview-box').on('click', '.delete-box', function() {
      const targetIndex = $(this).parent().parent().attr('id');
      // 該当indexを振られているチェックボックスを取得する
      const hiddenCheck = $(`.hidden-destroy[data-index="${targetIndex}"]`);
      // もしチェックボックスが存在すればチェックを入れる
      if (hiddenCheck) hiddenCheck.prop('checked', true);

      $(this).parent().remove();
      $(`img[data-index="${targetIndex}"]`).remove();
    });

    // var count = $('.hidden-field').length;
    // // console.log(count);
    // // $('label[for="item_images_attributes_0_image"]').attr('for',`item_images_attributes_${count}_image`);
    // if (count < 4){
    //   $('.label-content').append(buildEDIT(count));
    //   count ++;
    // }

      function buildHTML(count) {
        var html = `<div class="preview-box" id="${count}">
                    <div class="upper-box">
                    <img src="" alt="preview">
                    </div>
                    <div class="lower-box">
                    <div class="update-box">
                    <label class="edit_btn" id="edit_btn_${count}">編集</label>
                    </div>
                    <div class="delete-box" id="delete_btn_${count}">
                    <span>削除</span>
                    </div>
                    </div>
                    </div>`
        return html;
      }

      $(document).on('change', '.hidden-field', function() {
        setLabel();
        var id = $(this).attr('id').replace(/[^0-9]/g, '');
        $('.label-box').attr({id: `label-box--${id}`,for: `item_images_attributes_${id}_image`});
        var file = this.files[0];
        var reader = new FileReader();
        reader.readAsDataURL(file);
        reader.onload = function() {
          var image = this.result;
          if ($(`#${id}`).length == 0) {
            var count = $('.preview-box').length;
            var html = buildHTML(id);
            var prevContent = $('.label-content').prev();
            $(prevContent).append(html);
          }
          $(`#${id} img`).attr('src', `${image}`);
          var count = $('.preview-box').length;
          if (count == 5) { 
            $('.label-content').hide();
          }
          setLabel();
          if(count < 5){
            $('.label-content').append(buildEDIT(count));
          }
        }
      });

      $(document).on('click', '.edit_btn', function() {
        var count = $('.preview-box').length;
        // console.log(c);
        setLabel(count);
        var id = $(this).attr('id').replace(/[^0-9]/g, '');
        $('.label-box').attr({id: `label-box--${id}`,for: `item_images_attributes_${id}_image`});
        $(`input[id='item_images_attributes_${id}_image']`).trigger('click');
        // var file = this.files[0];
        var reader = new FileReader();
        // reader.readAsDataURL(file);
        reader.onload = function() {
          var image = this.result;
          if ($(`#preview-box__${id}`).length == 0) {
            var count = $('.preview-box').length;
            var html = buildHTML(id);
            var prevContent = $('.label-content').prev();
            $(prevContent).append(html);
          }
          $(`#${id} img`).attr('src', `${image}`);
          var count = $('.preview-box').length;
          if (count == 5) { 
            $('.label-content').hide();
          }
          setLabel();
          if(count < 5){
            $('.label-content').append(buildEDIT(count));
          }
        }
      });

      $(document).on('click', '.delete-box', function() {
        var count = $('.preview-box').length;
        setLabel(count);
        var id = $(this).attr('id').replace(/[^0-9]/g, '');
        $(`#preview-box__${id}`).remove();
        $(`#${id}`).remove();
        $(`#item_images_attributes_${id}_image`).val("");
        var count = $('.preview-box').length;
        if (count == 4) {
          $('.label-content').show();
        }
        setLabel(count);
        if(id < 5){
          $('.label-content').append(buildEDIT(count));
        }
      });
  })
};