<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link href="../content/css/reset.css" style="text/css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/content/joinus/css/password.css" style="text/css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/content/joinus/css/reset.css" style="text/css" rel="stylesheet">
<script type="text/javascript" src="/Aqua/content/home/js/menu-icon.js">
</script>
	
<script>

var status = ('${pageContext.request.userPrincipal.name}');
 
</script>
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
</head>
<body id="abody">
	<div id="beta"></div>
	<header></header>
	
	<div id="body">
		<div id="left-body">
		<div id="menu"></div>
			<a href="home"><div id="home"></div></a>	
			
		</div>
		<div id="center-body">
			<div id="box">
				<div id="left"></div>
				<div id="center">
				<a href="Menu"><div id="one"></div></a>
				<div id="two"><input type="email" placeholder="       E-MAIL ADDRESS"  id="t" name="email"></div>
				<div id="three"><a href="login.html"><input type="button" 
				value="Send your password to your email" id="button" ></a>
				</div>
			
				</div>
				<div id="right"></div>
				<div id="ws"></div>
			</div>
		</div>
		<div id="right-body"><div id="tab"></div></div>
	</div>
	<footer>

		<div id="left-footer"></div>
		<div id="center-footer">
		<small>Copyright © 2015 AQUA ESU ALL Rights Reserved</small>
		</div>
		<div id="right-footer"></div>
	</footer>
</body>
</html>