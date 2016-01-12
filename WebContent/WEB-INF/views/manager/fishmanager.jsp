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
<title>Insert title here</title>
<script>
   var param = {f:'${param.f}', q:'${param.q}'};
   
  
</script>
<script type="text/javascript">
	window.onload = function() {
		var fish = document.getElementById("fish");
		var rowcopy = document.querySelector("input[value='삭제']");
		rowcopy.onclick = function() {
			alert("행 복제");
		}
		var rowadd = document.querySelector("input[value='등록']");
		rowadd.onclick = function() {

			var tr = document.querySelector("#fish-row");
			var clone = document.importNode(tr.content, true);

			fish.querySelector("tbody").appendChild(clone);
		}
		

		//=====<<Ajax GET Method>>=====================================================
		var numClick = function(event) {

			var page = event.target.innerText;

			//-------------------------------------------------------------

			var request = new XMLHttpRequest();

			request.onreadystatechange = function() {
				if (request.readyState == 4) {
					//alert(request.responseText);
					var tbody = document.querySelector("#fish tbody");
					tbody.innerHTML = request.responseText;
				}
			};
			//page++;
			request.open("GET", "fishPartial?p=" + page+"&f="+param.f+"&q="+param.q, true);
			request.send(null);

			//-------------------------------------------------------------

			return false;

		};
		var nums = document.querySelectorAll("#pager-wrapper ul a");
		for (var i = 0; i < nums.length; i++)
			nums[i].onclick = numClick; 

		
	}
</script>
<link
	href="${pageContext.request.contextPath}/content/manager/css/Fish.css"
	type="text/css" rel="stylesheet" />

</head>
<body>
	<header id="header">

	<div id="logo">
		<a href="Menu"><img
			src="${pageContext.request.contextPath}/content/manager/images/Slogo.jpg"></a>
	</div>

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
	<Strong>Fish</Strong>
      <form action="fishmanager" method="get">
   <div id="search">
       <input type="text" name="q" value="${param.q}" />
        <input type="submit" value="Search" />     </div> </form>
	<div id="table">

		<table id="fish">

			<thead>
				<tr>
					<th><input type="checkbox" name="checkboxAll" value="1">
					</th>
					<th></th>
					<th>Name</th>
					
					<th><select name = "Lev">
							<option>Lev</option>
							<option>1</option>
							<option>2</option>
							<option>3</option>
					</select></th>					
					<th><select name ="Type">
					<option>Type</option>
							<option>열대어</option>
							<option>해수어</option>
							<option>냉수어</option>
							
					</select></th>
					
					<th>Fpic</th>
					</tr>
			</thead>

			<tbody>

				<c:forEach var="f" items="${list}">


					<form action="edit2" method="post">
					<tr>
						<td><input type="checkbox" name="checkbox1" value="1">
						</td>
						<td>1</td>
						<td><input type="text" name="name" value="${f.name}"></td>
						<td><input type="text" name="lev" value="${f.lev}"></td>
						<td><input type="text" name="type" value="${f.type}"></td>
						<td><input type="text" name="fpic" value="${f.fpic}"></td>
						<td><input type="submit" value="Edit"></td>
					</tr>

					</form>
				</c:forEach>
				<tr id="fish-row">
					<form action="insert2" method="post">
					<td><input type="checkbox" name="checkbox1" value="1">
						</td>
						<td>1</td>
						<td><input type="text" name="name" ></td>
						<td><input type="text" name="lev" ></td>
						<td><input type="text" name="type" ></td>
						<td><input type="text" name="fpic" ></td>
						<td><input type="submit" value="Insert"></td>

					</form>
				</tr>
			</tbody>
		</table>
	</div>
	<div id="Alter">
		<input type="button" value="삭제"> 

	</div>
	
	
	<c:set var="lastNum" value="${fn:substringBefore((recordCount/10==0? recordCount/10 : recordCount/10+1),'.')}"/>
	<p id="cur-page">

	<span class="strong">${param.p}</span>
	 / ${lastNum} page
</p>
	<footer id="footer"> 
<my:pager/>
	</footer>

</body>
</html>