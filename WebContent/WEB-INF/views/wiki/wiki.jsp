<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="wiki">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>wiki</title>
<link
	href="${pageContext.request.contextPath}/content/wiki/css/reset.css"
	type="text/css" rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/content/wiki/css/wikiStyle.css"
	type="text/css" rel="stylesheet" />

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />


<style>
.content.on {
	height: 400px;
}

.content.off {
	height: 0px;
}

.list.on {
	height: 530px;
}

.list.off {
	height: 130px;
}
</style>

<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.9/angular.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.9/angular-animate.min.js"></script>
<script type="text/javascript" src="/Aqua/content/home/js/menu-icon.js"></script>
<script>
	window.onload = function() {
		var tab = document.querySelector("#tab");
		tab.onclick = function() {
			var dlg = document.createElement("div");
			dlg.style.width = "400px";
			dlg.style.height = "400px";
			dlg.style.position = "fixed";
			dlg.style.zIndex = "9999";
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
	/* window
			.addEventListener(
					"load",
					function() {
						var request = new XMLHttpRequest();
						var b = document.querySelectorAll("#b");
						var lists = document.querySelectorAll("#list");
						function liClick(event) {							
							event.target.parentNode
									.querySelector("div:last-child").style.height = "400px";
							event.target.parentNode.style.height = "530px";
							function liClick(event) {
								event.target.parentNode
								.querySelector("div:last-child").style.height = "130px";
						event.target.parentNode.style.height = "0px";								
							}
						}
						for (var i = 0; i < b.length; i++) {
							b[i].onclick = liClick;
						}
					}) ;*/
	var wikiModule = angular.module("wiki", [ "ngAnimate" ]);
	wikiModule.controller('wiki-controller', function($scope, $http) {
		//$scope.test = "blue";
		$http({
			method : 'GET',
			url : '/Aqua/fake/wikiJSON'
		}).then(function successCallback(response) {
			$scope.list = response.data;
		}, function errorCallback(response) {
			alert("실패");
		});
		
		
		
		
	});
</script>
</head>
<body id="abody" ng-controller="wiki-controller">
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
				<div id="up">
					<input type="text" id="text" /> <input type="submit" id="search" />
					<input type="button" id="write" />
				</div>
				<div id="fake"></div>
				<div id="down">
					<div class="list" ng-repeat="w in list"
						ng-class="{on:a[$index], off:!a[$index]}" 
						ng-style="w.wcategory == 'feed.png' && {'background-color': '#FF00DD'} ||
                 				 w.wcategory == 'bowl.png' && {'background-color': '#0054FF'} ||
                  				w.wcategory == 'fish.png' && {'background-color': '#ABF200'}">
						<div class="a" data-cate="w.wcategory">
							<img
								src="${pageContext.request.contextPath}/content/wiki/images/{{w.wcategory}}"
								style="position: relative; left: 10px; top: 15px; text-align: center; width: 100px; height: 100px;" />
						</div>
						<div class="b" ng-click="a[$index]=!a[$index]"
							ng-bind="w.wsubject"></div>
						<div class="c"></div>
						<div class="d"></div>
						<div class="content" ng-show="a[$index]" ng-bind="w.wcontent"
							ng-class="{on:a[$index], off:!a[$index]}"></div>
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