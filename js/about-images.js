
// fade in images already loaded:
$('.about-menu img').fadeIn(1000);
// and tell pending images to do the same, once they've finished loading:
$('.about-menu img').load(function () {
    $(this).fadeIn(1000);
});