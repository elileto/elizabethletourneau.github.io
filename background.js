

var rn = Math.floor((Math.random() * 1) + 60);
//var rs = Math.floor((Math.random() * 11) + 4);
	var t = new Trianglify({
 x_gradient: Trianglify.colorbrewer.PuBuGn[3],
    
    noiseIntensity: 0,
    cellsize: 200
});

var pattern = t.generate(window.innerWidth, window.innerWidth+200);
document.body.setAttribute('style', 'background-image: '+pattern.dataUrl);
