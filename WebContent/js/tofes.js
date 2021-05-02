function change() {
    var decider = document.getElementById('switch');
    if(decider.checked){
    	for( item of document.getElementsByClassName("register") )
        	item.style.visibility = "visible";
    } else {
    	for( item of document.getElementsByClassName("register") )
        	item.style.visibility = "hidden";
	}

}