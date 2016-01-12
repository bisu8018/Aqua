<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link href="${pageContext.request.contextPath}/content/joinus/css/login.css" style="text/css" rel="stylesheet">
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
				<form action="<c:url value="/j_spring_security_check"/>" method="post">
				<div id="two"><input name="j_username"  type="email" placeholder="       E-MAIL ADDRESS" id="t" ></div>
				<div id="three"><input name="j_password" type="password" placeholder="       PASSWARD" id="t"></div>
				<div id="four">
				
				<input type="submit" value="LOGIN" id="button" >
			
				</div>		
				
				</form>

				<div id="five"><a href="logindetail" id="account">Create an account</a>
				<br><br>
				</div>
				<div id="six"><a href="password" id="forget">Forgotten your password?</a>
				</div>
				
			</div>
			<div id="right"></div>
			<div id="ws"></div>
				
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