<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link href="${pageContext.request.contextPath}/content/joinus/css/login.css" style="text/css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/content/joinus/css/reset.css" style="text/css" rel="stylesheet">
</head>
<body>
	<div id="beta"></div>
	<header></header>	
	<div id="body">
		<div id="left-body"></div>
		<div id="center-body">
			<div id="box">
				<div id="left"></div>
				<div id="center">
				<div id="one"></div>
				<div id="two"><input type="text" id="t"></div>
				<div id="three"><input type="text" id="t"></div>
				<div id="four"><input type="button" value="LOGIN" id="button" ></div>
				<div style="color:red"><c:if test = ${error != null}">${error}</c:if></div>
				<div id="five"><a href="logindetail.html" id="account">Create an account</a>
				<br><br><a href="password.html" id="forget">Forgotten your password?</a>
				</div>
				</div>
				<div id="right"></div>
				<div id="ws"></div>
			</div>
		</div>
		<div id="right-body"><div id="logo"></div></div>
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