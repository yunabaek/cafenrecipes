<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
</head>
<body>
	<jsp:include page="header.jsp" />
	<!--header section start -->
	<div class="header_section">
		<div class="container-fluid">
			<nav class="navbar navbar-expand-lg navbar-light bg-light">
				<div class="">
					<a href="main"><img src="resources/images/logo.png"></a>
				</div>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarNav" aria-controls="navbarNav"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarNav">
					<ul class="navbar-nav ml-auto">
					</ul>
				</div>
			</nav>
		</div>
	</div>
	<h2>레시피 수정하기</h2>
	<form action="update" method="post">
		<table>
			<tr>
				<th>제목</th>
				<td id="smallContextBox"><input type="hidden" name="idx"
					value="${dto.idx}" /> <input type="hidden" name="subject"
					id="smallContextBox">${dto.subject}</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td id="smallContextBox"><input type="hidden" name="name"
					id="smallContextBox">${dto.name}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td id="bicContextBox"><textarea name="content"
						id="bicContextBox">${dto.content}</textarea></td>
			</tr>
			<tr>
				<th>사진</th>
				<td><input type="file" name="photos" multiple="multiple" /> <c:forEach
						items="${photos}" var="photo">
						<img src="/photo/${photo.newFileName}" width="500px" />
						<br />
						<br />
					</c:forEach></td>
			</tr>
		</table>
		<br /> <input type="button" onclick="location.href='./list'"
			value="리스트" /> <input type="submit" value="저장" />
	</form>
	<jsp:include page="footer.jsp" />
</body>
<script>
	
</script>
</html>