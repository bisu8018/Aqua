<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script type="text/javascript" src="/Aqua/content/home/js/menu-icon.js">
</script>
	
<script>

var status = ('${pageContext.request.userPrincipal.name}');
 
</script>
<script>
	function checking(){
		if(document.writeForm.email.value=="") alert("Please enter your E-MAIL");
		else if(document.writeForm.bpwd.value=="") alert("Please enter your PASSWORD");
		else if(document.writeForm.bpwd.value!=document.writeForm.rebpwd.value) alert("Wrong PASSWORD");
		else if(document.writeForm.age.value=="")alert("Please check your SEX");
		else if(document.writeForm.nation.value=="nation") alert("Please choose your NATION");
		
		else document.writeForm.submit();
	}
	
	
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
<link href="${pageContext.request.contextPath}/content/joinus/css/reset.css" style="text/css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/content/joinus/css/logindetail.css" style="text/css" rel="stylesheet">
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
				<form action="login" method="post" name="writeForm">
				
				<div id="one"><input type="email" placeholder="       E-MAIL ADDRESS"  id="t" name="email"></div>
				<div id="two"><input type="password"  placeholder="       PASSWORD" id="t" name="bpwd"></div>
				<div id="three"><input type="password" placeholder="       PASSWORD" name="rebpwd" id="t"></div>
				<div id="four">&nbsp; &nbsp; &nbsp;<input type="radio" checked="checked" name="sex" value="m">MALE
				&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<input type="radio"  name="sex"  value="f" >FEMALE</div>
				<div id="five"><input type="text" placeholder="       AGE" name="age" id="t"></div>
				<div id="six"><select id="nation" name="nation">
				<option>&nbsp; &nbsp; &nbsp;&nbsp;NATION</option>
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