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
</head>
<body>
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
</body>
<script></script>
<jsp:include page="footer.jsp" />
</html>
