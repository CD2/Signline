// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function() {
  $('.add_product_feature').on('click', function(){
    $('.additional_features').append('<input id="features_" name="features[]" type="text">')
  });

  $('.remove_image_link').on('click', function(){
    id = $(this).attr("data-product-image-id")
    $.post("/admin/remove_image?product_image="+id)
    $(this).closest('tr').remove()
  })
  
  image = $('.home_banner_image').find('img').attr('src');
  $("#home_banner").css("background-image", "url("+image+")")




});

function add_fields(link, association, content) {
    var new_id = new Date().getTime();
    var regexp = new RegExp("new_" + association, "g");
    $("#more_order_items").append(content.replace(regexp, new_id));
}