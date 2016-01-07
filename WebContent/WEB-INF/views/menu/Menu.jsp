<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Menu</title>
<link
	href="${pageContext.request.contextPath}/content/menu/css/reset.css"
	type="text/css" rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/content/menu/css/menu.css"
	type="text/css" rel="stylesheet" />
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
			dlg.style.right = "220px";		
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
			<a href="home"><div id="home"></div></a>
			<c:if test="${pageContext.request.userPrincipal == null}">
				<a href="login"><div id="login"></div></a>
			</c:if>
			<c:if test="${pageContext.request.userPrincipal != null}">
				<c:url var="logout" value="/j_spring_security_logout" />
				<a href="${logout}">
					<div id="logout"></div>
				</a>
			</c:if>
			<security:authorize ifAnyGranted="ROLE_ADMIN">
				<a href="membersmanager"><div id="my"></div></a>
			</security:authorize>
			<security:authorize ifAnyGranted="ROLE_USER">
				<a href="mypage"><div id="my"></div></a>
			</security:authorize>
		</div>
		<div id="center-body">
			<div id="ws"></div>
			<div id="up">
				<a href="bowl"><div id="up-left"></div></a> <a href="board"><div
						id="up-right"></div></a>
			</div>
			<div id="down">
				<a href="site">
					<div id="down-left"></div>
				</a> <a href="wiki"><div id="down-right"></div></a>
			</div>
		</div>
		<div id="right-body">
			<div id="tab"></div>
		</div>
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