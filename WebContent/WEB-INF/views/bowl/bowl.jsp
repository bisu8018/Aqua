<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>bowl</title>
</head>
<link href="${pageContext.request.contextPath}/content/bowl/css/reset.css" type="text/css" rel="stylesheet"/>
<link href="${pageContext.request.contextPath}/content/bowl/css/bowlStyle.css" type="text/css" rel="stylesheet"/>
<script>
	window.onload = function() {
		//=====<<Ajax POST Methos>>====================================================

		var tab = document.querySelector("#tab");		
		
		tab.onclick = function() {

			var dlg = document.createElement("div");
			dlg.style.width = "400px";
			dlg.style.height = "400px";
			dlg.style.position = "fixed";
			dlg.style.background = "white";
			dlg.style.bottom = "180px";
			dlg.style.right = "90px";		
			document.body.appendChild(dlg);
			var request = new XMLHttpRequest();
			request.onreadystatechange = function() {
				if (request.readyState == 4) {					
					dlg.innerHTML = request.responseText;				
				}
			};			
			request.open("GET", "menuPartial", true);
			request.send(null);
			
			var body = document.querySelector("#abody");
			body.onclick = function(){				
				closeDialog(dlg);
			}
			
			event.stopPropagation();
			return false;			
		};	
		var closeDialog = function(dlg){
			document.body.removeChild(dlg);
		};
	};
</script>
<body id="abody">
	<div id="beta"></div>
		<header></header>
		<div id="body">
			<div id="left-body"></div>
			<div id="center-body">
			<div id="ws">
			</div>
			</div>
			<div id="right-body"><div id="tab"></div></div>
		</div>
		<footer>
		
			<a href="Menu"><div id="left-footer"></div></a>
			<div id="center-footer"><small>Copyright © 2015 AQUA ESU ALL Rights Reserved</small></div>
			<div id="right-footer"></div>
		</footer>
</body>
</html>