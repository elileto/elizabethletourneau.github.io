//sprite swap function
function swapImages(){
  let $active = $('#spriteOne .active');
  let $next = ($('#spriteOne .active').next().length > 0) ? $('#spriteOne .active').next() : $('#spriteOne img:first');
  $active.fadeOut(100, function(){
    $active.removeClass('active');
    $next.fadeIn(100).addClass('active');
  });
}

function swapImagesTwo(){
  let $active = $('#spriteTwo .active');
  let $next = ($('#spriteTwo .active').next().length > 0) ? $('#spriteTwo .active').next() : $('#spriteTwo img:first');
  $active.fadeOut(100, function(){
    $active.removeClass('active');
    $next.fadeIn(100).addClass('active');
  });
}

function swapImagesThree(){
  let $active = $('#spriteThree .active');
  let $next = ($('#spriteThree .active').next().length > 0) ? $('#spriteThree .active').next() : $('#spriteThree img:first');
  $active.fadeOut(100, function(){
    $active.removeClass('active');
    $next.fadeIn(100).addClass('active');
  });
}

$(document).ready(function(){


//sprite swap	
	setInterval('swapImages()', 500);
	setInterval('swapImagesTwo()', 500);
	setInterval('swapImagesThree()', 500);


});

