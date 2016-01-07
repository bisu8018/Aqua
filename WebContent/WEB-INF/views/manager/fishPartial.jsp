<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:forEach var="f" items="${list}">


					<form action="edit" method="post">
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
					<form action="insert" method="post">
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