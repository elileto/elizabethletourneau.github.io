	var imWrapper = document.querySelector('.image-selector');
	var imWrapperMain = imWrapper.querySelector('.main');
	imWrapperMain.src = imWrapper.querySelector('.sec').src;

	imWrapper.addEventListener('click', function(e) {
  	if (e.target.className === 'sec') {
   	 imWrapperMain.src = e.target.src;
 	 }

});


$(document).ready(function(){



	$(".show-one").click(function(){
        $(".hidden1").show();
        $(".hidden2").hide();
        $(".hidden3").hide();
    });
    $(".show-two").click(function(){
        $(".hidden1").hide();
        $(".hidden2").show();
        $(".hidden3").hide();
    });
        $(".show-three").click(function(){
        $(".hidden1").hide();
        $(".hidden2").hide();
        $(".hidden3").show();
    });

});
