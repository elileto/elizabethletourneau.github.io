



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

//menu animation line from menuItem to xCircle
});



