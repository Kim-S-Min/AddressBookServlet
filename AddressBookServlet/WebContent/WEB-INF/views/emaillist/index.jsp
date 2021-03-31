<%@page import="servlet.dao.PhoneBookVo"%>
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
	
	<h3>목록 <c:if test="${ keyword != null }">(검색어: ${keyword})</c:if></h3>
	

	<!-- Search -->
	<form action="<c:url value='/servlet'/>">
		<input type="hidden" name="action" value="search"/>
		검색어
		<input type="text" name="keyword" id=:keyword/>
		&nbsp;
		<input type="submit"value="검색"/>
		<br/><br/>
	</form>
<input type="hidden" name="action" value="delete">
<table border=1>
	<thead>
		<tr>
			<!-- Table Header -->
			<td>이름</td>
			<td>휴대전화</td>
			<td>전화번호</td>
			<td>도구</td>	
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${ list }" var="vo">
			<tr>
				<!-- Table Date -->
				<td>${ vo.name }</td>
				<td>${ vo.hp }</td>
				<td>${ vo.tel }</td>
				<!-- Delete -->
				<td colspan="2">
					<form action="<c:url value="/el"/>">
						<input type="hidden" name="a" value="delete" />
						<input type="hidden" name="no" value="${ vo.id }"/>
						<input type="submit" value=" 삭제 " />
					</form>	
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>	



<p>
	<a href="<c:url value="/el?a=form"/>">새 주소 추가</a>
</p>

	
</body>
</html>