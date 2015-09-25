var ready;
ready = function() {

  $('.hide').on('click', function(){
    if ($('body').hasClass('admin_box_active')){
      $('body').removeClass('admin_box_active') }
    else {
      $('body').addClass('admin_box_active')
    }
    $.post("/activate_admin")
  });

};

$(document).ready(ready);
$(document).on('page:load', ready);