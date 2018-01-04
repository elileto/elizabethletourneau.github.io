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


// play on load for gallery view


