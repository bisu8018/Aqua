<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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

		<table>

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
					<form action="" method="post">
					<tr>
						<td><input type="checkbox" name="checkbox1" value="1">
						</td>
						<td>1</td>
						<td><input type="text" name="email" value="${m.email}"></td>
						<td><input type="text" name="bpwd" value="${m.bpwd}"></td>
						<td><input type="text" name="sex" value="${m.sex}"></td>
						<td><input type="text" name="age" value="${m.age}"></td>
						<td><input type="text" name="nation" value="${m.nation}"></td>
						<td>2015/09/11</td>
						<td><input type="text"></td>
						<td><input type="submit" value="Edit"></td>
					</tr>
					</form>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div id="Alter">
		<input type="button" value="DELETE"> <a href="membersEdit"><input
			type="button" value="REGIST"></a>
	</div>


	<footer id="footer"> <section> <input type="button"
		value="<"> <input type="button" value="1"> <input
		type="button" value="2"> <input type="button" value="3">
	<input type="button" value="4"> <input type="button" value="5">
	<input type="button" value="6"> <input type="button" value="7">
	<input type="button" value="8"> <input type="button" value="9">
	<input type="button" value="10"> <input type="button" value=">">
	</section> </footer>


</body>
</html>