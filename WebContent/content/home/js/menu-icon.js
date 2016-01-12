
window.addEventListener("load", function() {
	var menu = document.querySelector("#menu");
	var home = document.querySelector("#home");
	var login = document.querySelector("#login");
	var logout = document.querySelector("#logout");
	var my = document.querySelector("#my");
	menu.onclick = function() {

		home.style.top = "90px";
		home.style.opacity = 1;

		if(status==null || status==undefined || status=="") {
			login.style.top = "130px";
			login.style.opacity = 1;
		} 		
		else 
		{
			logout.style.top = "130px";
			logout.style.opacity = 1;
			my.style.top = "162px";
			my.style.opacity = 1;
		};		
	};
});

