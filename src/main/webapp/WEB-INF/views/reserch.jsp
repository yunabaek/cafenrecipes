<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>

</head>
<body>
	<jsp:include page="header.jsp" />
	<div>${loginBox}</div>
	<jsp:include page="loginBox.jsp" />
	<div class="main table">
		<input type="button" onclick="location.href='./writeForm'"
			value="레시피 공유하기" />
		<table>
			<thead>
				<tr>
					<th>Share My Recipe</th>
				</tr>
				<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>조회수</th>
				</tr>
				<c:if test="${lists eq null || size == 0}">
					<tr>
						<td colspan="7">등록된 글이 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach items="${lists}" var="dto">
					<tr>
						<td>${dto.idx}</td>
						<td>${dto.subject}</td>
						<td>${dto.name}</td>
						<td>${dto.bHit}</td>
					</tr>
				</c:forEach>
		</table>
		<input type="button" onclick="location.href='./listForm'"
			value="재 검색하기" />
	</div>
	<jsp:include page="footer.jsp" />
</body>
<script>
	
</script>
</html>
