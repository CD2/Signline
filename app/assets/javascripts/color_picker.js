var ready;
ready = function() {
    var color = $(".color_picker_reciever").val() || "#e7e7e7";

    $('<ul class="colorpicker"></ul>').insertAfter(".colorpicker").append(Array(21).join("<li>")).children().each(function(c) {
        $(this).mouseup(function() {
            $(this).parent().prev(".colorpicker").trigger("colorpicker-change", $(this).css("background-color")).end().hide()
        }).css({
            background: "#" + ["1abc9c", "2ecc71", "3498db", "9b59b6", "34495e", "16a085", "27ae60", "2980b9", "8e44ad", "2c3e50", "f1c40f", "e67e22", "e74c3c", "ecf0f1", "95a5a6", "f39c12", "d35400", "c0392b", "bdc3c7", "7f8c8d"][c % 20],
            width: "40px",
            height: "30px",
            "float": "left",
            "list-style": "none"
        })
    }).end().css({
        padding: 0,
        margin: 0,
        width: "200px",
        position: 'absolute',
    }).hide().prev(".colorpicker").css("background", color).on("colorpicker-change", function(e, c) {
        $('.color_picker_reciever').val(c);
        $(this).css("background", c)
    }).on("click", function() {
        $(this).next("ul.colorpicker").css({
            left: $(this).offset().left
        }).show()
    }).on("clk", function(c, e) {
        e.target != this && $(this).next("ul.colorpicker").hide()
    });
    $(document).click(function(c) {
        $(".colorpicker").trigger("clk", c)
    });
};

$(document).ready(ready);
$(document).on('page:load', ready);