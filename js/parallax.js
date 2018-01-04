

var ypos,video,contact;
function parallax(){
	ypos = window.pageYOffset;
	video = document.getElementById('home');
	video.style.top = ypos * .2 +'px';
	contact = document.getElementById('resume-para');
	contact.style.top = ypos * .4 +'px';
}
window.addEventListener('scroll', parallax);

$(window).scroll(function(){
	var wScroll = $(this).scrollTop();
	console.log(wScroll)
});