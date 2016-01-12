<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/content/manager/css/Board.css" type="text/css" rel="stylesheet" />

</head>
<body>
<header id="header">
		
	<div id="logo"><a href="Menu"><img src="${pageContext.request.contextPath}/content/manager/images/Slogo.jpg"></a></div>
		
	<div id="list">
	<table>
	<ul>
		<th><a href="fishmanager">fish</a></th>
		<th><a href="membersmanager">member</a></th>
		<th><a href="boardmanager">board</a></th>
		<th><a href="sitemanager">site</a></th>
	</ul>
	</table>
	</div>
	
	</header>
			
			<Strong>Board</Strong>
			
			<div id="a">
			<select>
               <option>Day</option>
				<option>Month</option>
				<option>Year</option>
				<option>Season</option>
				</select><input type="button"value="적용"><input type="button"value="RESET">
			</div>	
</body>
</html>