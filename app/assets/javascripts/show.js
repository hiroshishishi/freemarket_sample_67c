$(function() {
  $('img.image01').click(function(){
    var ImgSrc = $(this).attr("src");
    $("#mainphoto").attr("src",ImgSrc);
    $("#mainphoto").hide();
    $("#mainphoto").fadeIn();
      return false;
  });
});
