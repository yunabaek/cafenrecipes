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
			</nav>
		</div>
	</div>
	<div class="main table">
		<h2>레시피 작성하기</h2>
		<form action="write" method="post" enctype="multipart/form-data">
			<table>
				<tr>
					<th>제목</th>
					<td><input type="text" name="subject" id="smallContextBox" /></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><input type="text" name="name" id="smallContextBox" /></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea name="content" id="bicContextBox"></textarea></td>
				</tr>
				<tr>
					<th>사진</th>
					<td><input type="file" name="photos" multiple="multiple"
						accept=".png, .jpg, .jpeg ,.jfif" /></td>
				</tr>
				<tr>
					<th colspan="2"><input type="button"
						onclick="location.href='./listForm'" value="리스트" /> <input
						type="submit" value="저장" /></th>
				</tr>
			</table>
		</form>
	</div>
	<jsp:include page="footer.jsp" />
</body>
<script></script>
</html>
