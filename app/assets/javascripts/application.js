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
//= require froala_editor.min.js
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


  $('.editable').editable({
    inlineMode: false,
    plainPaste: true,
    // Set the image upload parameter.
    imageUploadParams: {
      authenticity_token: 'form_authenticity_token',
    },
    // Set the image upload URL.
    imageUploadURL: '/uploads',

    // CORS. Only if needed.
    crossDomain: false,

    // Set the image error callback.
    imageErrorCallback: function (data) {
        // Bad link.
        if (data.errorCode == 1) {
          console.log ('bad link')
        }

        // No link in upload response.
        else if (data.errorCode == 2) {
          console.log ('bad response')
        }

        // Error during file upload.
        else if (data.errorCode == 3) {
          console.log ('upload error')
        }
    },
    blockStyles: {
      'p': {
        'class1': 'Class 1',
        'class2': 'Class 2'
      },
      'h3': {
        'class3': 'Class 3',
        'class4': 'Class 4'
      }
    }
  })

});