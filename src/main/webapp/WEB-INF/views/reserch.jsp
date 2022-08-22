<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<!-- basic -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- mobile metas -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<!-- site metas -->
<title>Cafe recipes</title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="author" content="">
<!-- bootstrap css -->
<link rel="stylesheet" type="text/css"
	href="resources/css/bootstrap.min.css">
<!-- style css -->
<link rel="stylesheet" type="text/css" href="resources/css/style.css">
<!-- Responsive-->
<link rel="stylesheet" href="resources/css/responsive.css">
<!-- fevicon -->
<link rel="icon" href="resources/images/fevicon.png" type="image/gif" />
<!-- Scrollbar Custom CSS -->
<link rel="stylesheet"
	href="resources/css/jquery.mCustomScrollbar.min.css">
<!-- Tweaks for older IEs-->
<link rel="stylesheet"
	href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
<!-- owl stylesheets -->
<link rel="stylesheet" href="resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="resources/css/owl.theme.default.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css"
	media="screen">
<!-- paging -->
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script src="resources/js/jquery.twbsPagination.js"></script>
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
</body>
<script>
	
</script>
<jsp:include page="footer.jsp" />
</html>
