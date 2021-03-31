<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert</title>
</head>
<body>
	<h1>주소록 Servlet</h1>
	<h3>새 주소 등록</h3>
	<table border="1">
		<tr>
			<th>
			<form action="<c:url value="/el"/>"
				method="POST">
				<input type="hidden" name="action" value="insert">	
				<lable for="name">이름</lable><br/>
				<input type="text" name="name" id="name" />
				<br/>
				<lable for="hp">휴대전화</lable><br/>
				<input type="text" name="hp" id="hp" />
				<br/>
				<lable for="tel">집전화</lable><br/>
				<input type="text" name="tel" id="tel" />
				<br/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="submit" value="주소 등록" />
			</form>
			</th>
		</tr>
	</table>
	<p>
		<a href="<c:url value="/"/>">목록보기</a>
	</p>

</body>
</html>