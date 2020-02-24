$('.header-item').hover(function(event) {
    $(this).children('ul').slideDown(400, function() {

    }).css('display', 'block');
}, function() {
    $(this).children('ul').slideUp(400);
});