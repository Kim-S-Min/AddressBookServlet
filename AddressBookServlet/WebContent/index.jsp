<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>

	<c:forEach items="${ list }" var="vo">

				<!-- 정보 테이블 / 삭제 -->
<table border=1>
	<tr>
		<th>이름</th><th>휴대전화</th><th>전화번호</th><th>도구</th>

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
<%@ include file="/WEB-INF/views/includes/footer.jsp" %>