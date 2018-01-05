//sprite swap function
function swapImages(){
  var $active = $('#spriteOne .active');
  var $next = ($('#spriteOne .active').next().length > 0) ? $('#spriteOne .active').next() : $('#spriteOne img:first');
  $active.fadeOut(100, function(){
    $active.removeClass('active');
    $next.fadeIn(100).addClass('active');
  });
}

function swapImagesTwo(){
  var $active = $('#spriteTwo .active');
  var $next = ($('#spriteTwo .active').next().length > 0) ? $('#spriteTwo .active').next() : $('#spriteTwo img:first');
  $active.fadeOut(100, function(){
    $active.removeClass('active');
    $next.fadeIn(100).addClass('active');
  });
}
function swapImagesThree(){
  var $active = $('#spriteThree .active');
  var $next = ($('#spriteThree .active').next().length > 0) ? $('#spriteThree .active').next() : $('#spriteThree img:first');
  $active.fadeOut(100, function(){
    $active.removeClass('active');
    $next.fadeIn(100).addClass('active');
  });
}



$(document).ready(function(){

	$(".menu-toggle").on('click', function() {
 	 $(this).toggleClass("on");	
 	 $('.menu-section').toggleClass("on");			
 	 $("nav ul").toggleClass('hidden');
	});

	$(".page-toggle").on('click', function() {
 	 $(this).toggleClass("onn");	
 	 $('.page-section').toggleClass("onn");	
	$(".title").toggleClass('padding');

 	 $(".page").toggleClass('hidden');
	});


	
      $(".menuItem").click(function(){
        var div = $(".circuit");
        div.animate({height: '2.5px', opacity: '0.4'}, "slow");
        div.animate({width: '200%', opacity: '0.8'}, "slow");        
	div.animate({width: '0px', opacity: '0.4'}, "slow");
    });

//sprite swap	
	setInterval('swapImages()', 500);
	setInterval('swapImagesTwo()', 500);
	setInterval('swapImagesThree()', 500);


//menu animation line from menuItem to xCircle
});

	var imWrapper = document.querySelector('.image-selector');
	var imWrapperMain = imWrapper.querySelector('.main');
	imWrapperMain.src = imWrapper.querySelector('.sec').src;

	imWrapper.addEventListener('click', function(e) {
  	if (e.target.className === 'sec') {
   	 imWrapperMain.src = e.target.src;
 	 }

});


var phpURL = "YOUR PHP URL GOES HERE";

$(".contact-icon").on("click", toggleContactForm);
$(".cross").on("click", closeForm);

//Show/Hide
function toggleContactForm(){
	var form = $(".contact-form");
	var bottom = $(form).css("bottom");
	
	if(bottom == "0px"){
		$(form).css("bottom", "-400px");
	}
	else{
		$(form).css("bottom", "0px");
	}
}

function closeForm(){
		$(".contact-form").css("bottom", "-400px");
}

//Resize
$(window).on('resize', onResize);
onResize();

function onResize(){
	var buttonPos = $(".submit")[0].getBoundingClientRect();					
	console.log("POS:", buttonPos);
	
	var width = ($(window).width() - buttonPos.right) - 26;
	
	$(".horline").css("left", buttonPos.right);
	$(".horline").css("width", width);

	$(".vertline").css("left", buttonPos.right + width);
}
	

//Focus
$("input[type=text]").focus(onFocus);
$("input[type=email]").focus(onFocus);
$("textarea").focus(onFocus);

$("input[type=text]").focusout(onFocusOut);
$("input[type=email]").focusout(onFocusOut);
$("textarea").focusout(onFocusOut);

function onFocus(){
		$(this).parent().find("label").addClass("active");
}

function onFocusOut(){
	if($(this).val() === "")
		$(this).parent().find("label").removeClass("active");
}

function validateEmail(email) {
    var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(email);
}

function validateForm(){

		var email = $("input[type=email]").val();
		var validEmail = validateEmail(email);
		var validName = $("input[type=text]").val() ? true : false;
		var validMsg = $("textarea").val() ? true : false;
				
		var nameError = $("input[type=text]").parent().find(".error-mark");
		var emailError = $("input[type=email]").parent().find(".error-mark");
		var msgError = $("textarea").parent().find(".error-mark");
		
		TweenLite.to(nameError, 0.5, {opacity: validName ? 0 : 1});
		TweenLite.to(emailError, 0.5, {opacity: validEmail ? 0 : 1});
		TweenLite.to(msgError, 0.5, {opacity: validMsg ? 0 : 1});
	
	return (validEmail && validName && validMsg);
}

function sentAnimation(message, color) {
		
		flashButton(color);
		var sentElement = $(".result-message");
		$(sentElement).text(message);
		var sentTween = new TimelineLite();
		sentTween.fromTo(sentElement, 0.6, {x:0},{ x:100});
		sentTween.to(sentElement, 0.6, {x:200, delay:1});
		
		var envelopeElement = $(".submit-icon");
		var envelopeTween = new TimelineLite();
		envelopeTween.fromTo(envelopeElement, 0.6, {x:0}, {x:100});
		envelopeTween.fromTo(envelopeElement, 0.6, {x:-100}, {x:0, delay:1});
	
}

function flashButton(color){
	var originalColor = $(".submit").css("background-color");
	
	setTimeout(function(){
		$(".submit").css("background-color", color);
	},300);
	
	setTimeout(function(){
		$(".submit").css("background-color", originalColor);
	},1000);
	
} 

function clearForm(){
	$("input[type=email]").val("");
	$("input[type=text]").val("");
	$("textarea").val("");
	
	$("input[type=text]").focusout();
	$("input[type=email]").focusout();
	$("textarea").focusout();
}

$(function() {
  $('#contact').submit(function(event) {
    event.preventDefault();
		
		if(validateForm()){
			sentAnimation("Sent", "green");
			
			//post form
			var formEl = $(this);
			console.log(formEl.serialize());
			var submitButton = $('input[type=submit]', formEl);

			$.ajax({
				type: 'POST',
				url: phpURL,
				accept: {
					javascript: 'application/javascript'
				},
				data: formEl.serialize(),
				beforeSend: function() {
					submitButton.prop('disabled', 'disabled');
				}
			}).done(function(data) {
				submitButton.prop('disabled', false);
			});
			
			clearForm();
			
		}
		else{
			sentAnimation("Error", "red");
		}
  });
});


