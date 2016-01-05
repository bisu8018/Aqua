<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
