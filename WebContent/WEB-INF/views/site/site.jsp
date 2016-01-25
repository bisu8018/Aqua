<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>site</title>
</head>
<link
	href="${pageContext.request.contextPath}/content/bowl/css/reset.css"
	type="text/css" rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/content/site/css/site.css"
	type="text/css" rel="stylesheet" />
<script type="text/javascript" src="/Aqua/content/home/js/menu-icon.js">
	
</script>
<script>
	var status = ('${pageContext.request.userPrincipal.name}');
</script>

<script>
	window.onload = function() {
		var tab = document.querySelector("#tab");

		tab.onclick = function() {

			var dlg = document.createElement("div");
			dlg.style.width = "400px";
			dlg.style.height = "400px";
			dlg.style.position = "fixed";
			dlg.style.background = "white";
			dlg.style.bottom = "180px";
			dlg.style.right = "90px";
			dlg.style.zIndex = 999;
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
			body.onclick = function() {
				closeDialog(dlg);
			}

			event.stopPropagation();
			return false;
		};
		var closeDialog = function(dlg) {
			document.body.removeChild(dlg);
		};
	};
</script>
<script>
	window.addEventListener("load", function() {
		var lis = document.querySelectorAll(".aaa");
		var request = new XMLHttpRequest();

		function liClick(event){
			event.target.style.background = "blue";
			event.target.style.opacity = 0.5;
			
			request.open("GET","site", true);
			request.send();
			
			request.onreadystatechange = function() {				
				if (request.readyState == 4) {
					var top = document.querySelector("#top");
					top.innerHTML = request.responseText;
				}
			}			
		}
		for (var i = 0; i < lis.length; i++) {
			lis[i].onclick = liClick;
		}
	});
</script>
</head>
<body id="abody">
	<div id="beta"></div>
	<header></header>
	<div id="body">
		<div id="left-body">
			<div id="menu"></div>
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
			<div id="container">
				<div id="left">
					<div id="top"></div>
					<div id="middle"></div>
					<div id="bottom">
						<div class="content"></div>
					</div>
				</div>
				<div id="scroll">
					<div id="right">
						<c:forEach var="s" items="${list}">
							<ul>
								<li class="aaa" value="${s.ssubject}">${s.spic1}</li>
							</ul>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
		<div id="right-body">
			<div id="tab"></div>
		</div>
	</div>
	<footer> <a href="Menu"><div id="left-footer"></div></a>
	<div id="center-footer">
		<small>Copyright © 2015 AQUA ESU ALL Rights Reserved</small>
	</div>
	<div id="right-footer"></div>
	</footer>
</body>
</html>