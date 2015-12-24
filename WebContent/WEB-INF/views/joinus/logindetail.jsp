<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link href="${pageContext.request.contextPath}/content/joinus/css/reset.css" style="text/css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/content/joinus/css/logindetail.css" style="text/css" rel="stylesheet">
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
				<form action="login" method="post">
				<div id="one"><input type="email" placeholder="E-MAIL ADDRESS"  id="t" name="email"></div>
				<div id="two"><input type="password" placeholder="PASSWORD" id="t" name="bpwd"></div>
				<div id="three"><input type="password" placeholder="PASSWORD" id="t"></div>
				<div id="four"><input type="checkbox" value="male"  >Male
				<input type="checkbox"  >Female</div>
				<div id="five"><input type="text" placeholder="AGE" name="age" id="t"></div>
				<div id="six"><select id="nation" >
				<option>nation</option>
				<option>Korea</option>
				<option>USA</option>
				<option>China</option>
				<option>Japan</option>
				</select></div>
				<div id="seven"><input type="text" id="t" placeholder="qu1" name="q1"></div>
				<div id="eight"><input type="text" id="t" placeholder="qu2" name="q2"></div>
				<div id="nine"><input type="text" id="t" placeholder="qu3" name="q3"></div>
				<div id="ten">
				<input type="submit" value="CREATE ACCOUNT" id="button" ></a>
				</div>
				</form>
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