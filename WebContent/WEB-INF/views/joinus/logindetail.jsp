<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script>
	function checking(){
		if(document.writeForm.email.value=="") alert("아이디를 입력하세요");
		else if(document.writeForm.bpwd.value=="") alert("패스워드를 입력하세요");
		else if(document.writeForm.bpwd.value!=document.writeForm.rebpwd.value) alert("패스워드가 일치하지 않습니다.");
		else if(document.writeForm.age.value=="")alert("성별을 입력하세요");
		else if(document.writeForm.nation.value=="nation") alert("나라를 등록하세요");
		
		else document.writeForm.submit();
	}
	
	
</script>
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
				<form action="login" method="post" name="writeForm">
				
				<div id="one"><input type="email" placeholder="E-MAIL ADDRESS"  id="t" name="email"></div>
				<div id="two"><input type="password"  placeholder="PASSWORD" id="t" name="bpwd"></div>
				<div id="three"><input type="password" placeholder="PASSWORD" name="rebpwd" id="t"></div>
				<div id="four"><input type="radio" checked="checked" name="sex" value="m">Male
				<input type="radio"  name="sex"  value="f" >Female</div>
				<div id="five"><input type="text" placeholder="AGE" name="age" id="t"></div>
				<div id="six"><select id="nation" name="nation">
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
				<input onclick="checking()" value="CREATE ACCOUNT" id="button" t></a>
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
			<small>Copyright ⓒ 2015 AQUA ESU ALL Rights Reserved</small>
		</div>
		<div id="right-footer"></div>
	</footer>
</body>
</html>