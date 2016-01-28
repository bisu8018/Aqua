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
<link
	href="${pageContext.request.contextPath}/content/site/css/reset.css"
	type="text/css" rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/content/site/css/site.css"
	type="text/css" rel="stylesheet" />
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">

<style>
#scroll .ui-selecting {
	background: #FECA40;
}

#scroll .ui-selected {
	background: #F39814;
	color: white;
}
</style>

<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script type="text/javascript" src="/Aqua/content/home/js/menu-icon.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.0.min.js"></script>
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
	function Info(title, category, link, content, spic) {
		var div = document.querySelector("#sub");
		div.innerText = title;
		var div2 = document.querySelector("#middle1");
		div2.innerText = category;
		var div3 = document.querySelector("#middle2 a");
		div3.innerText = link;
		var a = document.querySelector("a");
		a.href = link;
		var div4 = document.querySelector("#middle3");
		div4.innerText = content;
		var div5 = document.querySelector("#bottom");
		var old = document.querySelector("iframe");
		var iframe = document.createElement("iframe");
		iframe.style.width = "760px";
		iframe.style.height = "268px";
		iframe.style.border = "none";
		iframe.src = spic;

		if (old != null)
			div5.replaceChild(iframe, old);
		else
			div5.appendChild(iframe);
	}

	$(function() {

		$("#scroll").selectable();

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
					<div id="sub"></div>

					<div id="middle">
						<div id="middle1"></div>
						<div id="middle2">
							<a href></a>
						</div>
						<div id="middle3"></div>
					</div>
					<div id="scroll2">
						<div id="bottom"></div>
					</div>

				</div>
				<div id="scroll">
					<div id="fake"></div>
					<div id="right">
						<c:forEach var="s" items="${list}">
							<ul id="bbb">
								<li class="aaa"
									onclick="Info('${s.ssubject}','${s.scategory}', '${s.link}', '${s.scontent}','${s.spic2}')"><img
									src="${pageContext.request.contextPath}/content/site/images/${s.spic1}" style="cursor: pointer;"/></li>
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