<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	window.onload = function() {
		var member = document.getElementById("member");
		var rowcopy = document.querySelector("input[value='삭제']");
		rowcopy.onclick = function() {
			alert("행 복제");
		}
		var rowadd = document.querySelector("input[value='등록']");
		rowadd.onclick = function() {

			var tr = document.querySelector("#member-row");
			var clone = document.importNode(tr.content, true);

			member.querySelector("tbody").appendChild(clone);
		}
		

		//=====<<Ajax GET Method>>=====================================================
		var numClick = function(event) {

			var page = event.target.innerText;

			//-------------------------------------------------------------

			var request = new XMLHttpRequest();

			request.onreadystatechange = function() {
				if (request.readyState == 4) {
					//alert(request.responseText);
					var tbody = document.querySelector("#notices tbody");
					tbody.innerHTML = request.responseText;
				}
			};
			//page++;
			request.open("GET", "membersPartial?p=" + page+"&f="+param.f+"&q="+param.q, true);
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
	href="${pageContext.request.contextPath}/content/manager/css/Members.css"
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
	<Strong>Member</Strong>
	<div id="search">
		<input type="text"><input type="button" value="SEARCH">
	</div>
	<div id="table">

		<table id="member">

			<thead>
				<tr>
					<th><input type="checkbox" name="checkboxAll" value="1">
					</th>
					<th></th>
					<th>E-mail</th>
					<th>password</th>
					<th><select>
							<option>Sex</option>
							<option>남</option>
							<option>여</option>
					</select></th>
					<th>Age</th>
					<th><select>
							<option>nation</option>
							<option>Korea</option>
							<option>USA</option>
							<option>Japan</option>
							<option>China</option>
							<option>Russia</option>
							<option>Canada</option>
							<option>England</option>
					</select></th>
					<th><select>
							<option>가입일자</option>
							<option>최신 순</option>
							<option>오래된 순</option>
					</select></th>
					<th><select>
							<option>최근 접속</option>
							<option>최신 순</option>
							<option>오래된 순</option>
					</select></th>
					<th>EDIT</th>
			</thead>

			<tbody>

				<c:forEach var="m" items="${list}">


					<form action="edit" method="post">
					<tr>
						<td><input type="checkbox" name="checkbox1" value="1">
						</td>
						<td>1</td>
						<td><input type="text" name="email" value="${m.email}"></td>
						<td><input type="text" name="bpwd" value="${m.bpwd}"></td>
						<td><input type="text" name="sex" value="${m.sex}"></td>
						<td><input type="text" name="age" value="${m.age}"></td>
						<td><input type="text" name="nation" value="${m.nation}"></td>
						<td>${m.reg}</td>
						<td>${m.loginreg}</td>
						<td><input type="submit" value="Edit"></td>
					</tr>

					</form>
				</c:forEach>
				<tr id="member-row">
					<form action="insert" method="post">
					<td><input type="checkbox" name="checkbox1" value="1">
					</td>
					<td>1</td>
					<td><input type="text" name="email"></td>
					<td><input type="text" name="bpwd"></td>
					<td><input type="text" name="sex"></td>
					<td><input type="text" name="age"></td>
					<td><input type="text" name="nation"></td>
					<td><input type="submit" value="Insert"></td>

					</form>
				</tr>
			</tbody>
		</table>
	</div>
	<div id="Alter">
		<input type="button" value="삭제"> 

	</div>
	<footer id="footer"> <section> <a href=""> <input
		type="button" value="<"></a> <a href="membersmanager?p=1&f=${param.f}&q=${param.q}"> <input
		type="button" value="1"></a> <a href="membersmanager?p=2&f=${param.f}&q=${param.q}"><input type="button"
		value="2"></a> <a href="membersmanager?p=3&f=${param.f}&q=${param.q}"><input type="button" value="3"></a>

	<a href="membersmanager?p=4&f=${param.f}&q=${param.q}"><input type="button" value="4"></a> <a href="membersmanager?p=5&f=${param.f}&q=${param.q}"><input
		type="button" value="5"></a> <a href="membersmanager?p=6&f=${param.f}&q=${param.q}"><input type="button"
		value="6"></a> <a href="membersmanager?p=7&f=${param.f}&q=${param.q}"><input type="button" value="7"></a>

	<a href="membersmanager?p=8&f=${param.f}&q=${param.q}"><input type="button" value="8"></a> <a href="membersmanager?p=9&f=${param.f}&q=${param.q}"><input
		type="button" value="9"></a> <a href="membersmanager?p=10&f=${param.f}&q=${param.q}"><input type="button"
		value="10"></a> <a href=""><input type="button" value=">"></a>

	</section> </footer>

</body>
</html>