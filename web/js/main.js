$(document).ready(function() {
    $(".preview").click(function(){
        var img = $(this);
        var src = img.attr('src');
        $("body").append("<div class='popup'>" + "<div class='popup_bg'></div>" + "<img src='" + src + "' class='popup_img' />" + "</div>");
        $(".popup").fadeIn(400);
        $(".popup_bg").click(function(){
            $(".popup").fadeOut(400);
            setTimeout(function() {
                $(".popup").remove();
            }, 400);
        });
    });
    $(function() {
        $('.popupModal').click(function(e) {
            e.preventDefault();
            $('#modal').modal('show').find('.modal-content')
                .load($(this).attr('href'));
        });
    });
});