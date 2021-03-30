<%@page import="miniprojectservlet.PhoneBookVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PhoneBook Main Date</title>
</head>
<body>
	<h1>주소록 Servlet</h1>
	<c:forEach items="${ list }" var="vo">

				<!-- 정보 테이블 / 삭제 -->
<table border=1>
	<tr>
		<th>이름</th><th>휴대전화</th><th>전화번호</th><th>도구</th>
		<c:choose>
			<c:when test="${ status.이름 == 이름 }">
				<tr style="background:lightgray">
			</c:when>
			
			<c:otherwise>
				<tr>
			</c:otherwise>
		</c:choose>
	</tr>
	<tbody>
		<tr>
			<td>${ vo.name }</td>
			<td>${ vo.hp }</td>
			<td>${ vo.tel }</td>
			<td colspan="2">
				<form action="<c:url value="/el"/>">
					<input type="hidden" name="a" value="delete" />
					<input type="hidden" name="no" value="${ vo.id }"/>
					<input type="submit" value="삭제" />
				</form>	
			</td>
		</tr>
	</tbody>
</table>	

	</c:forEach>

	<p>
		<a href="<c:url value="/el?a=form"/>">새 주소 추가</a>
	</p>

	
</body>
</html>