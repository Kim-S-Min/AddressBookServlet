<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가입</title>
</head>
<body>
	<h1>메일링 리스트 가입(Model 2)</h1>
	<p>새 주소 등록</p>
	
	
		<form action="<c:url value="/el"/>">
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
			&nbsp;
			<input type="submit" value="주소 등록" />
		</form>
	
	
	<p>
		<a href="<c:url value="/"/>">목록보기</a>
	</p>

</body>
</html>