$(function() {

  //PRODUCT IMAGE CLICK
  $(".alternate_image img").on("mouseover click touchstart", function() {
    $("#main_image img").attr("src", $(this).data("large"))
  });


  $("form#new_order_item").on("submit", function(e){
    // return false
  })


});