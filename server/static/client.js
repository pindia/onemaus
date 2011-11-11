function reloadScreen(){
	d = new Date();
	$("#screen").attr("src", "/screen?"+d.getTime());
}

$(document).ready(function(){
	//reloadScreen();
	setInterval(reloadScreen, 500);
	$("#screen").click(function(event){
		var off = $("#screen").offset()
		$.get("/click/" + Math.floor(event.pageX - off.left) + "/" + Math.floor(event.pageY - off.top) +  "/1");
	});
		
})
