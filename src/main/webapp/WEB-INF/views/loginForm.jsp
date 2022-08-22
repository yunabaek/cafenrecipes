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
						<li class="nav-item">
					</ul>
				</div>
			</nav>
		</div>
	</div>
	<div class="main table">
		<form action="login" method="post">
			<table>
				<tr>
					<th>로그인</th>
				</tr>
				<tr>
					<th>ID</th>
					<td><input type="text" name="id" /></td>
				</tr>
				<tr>
					<th>PW</th>
					<td><input type="password" name="pw" /></td>
				</tr>
				<tr>
					<th colspan="2"><input type="submit" value="로그인" /> <!-- spring 에서는 .jsp 이동도 컨트롤러를 타야한다.(보안상 이유) -->
						<input type="button" value="회원가입"
						onclick="location.href='joinForm'" /> <input type="button"
						onclick="location.href='./idfind'" value="ID찾기" /> <input
						type="button" onclick="location.href='./pwfind'" value="PW찾기" /></th>
				</tr>
			</table>
		</form>
	</div>
	<jsp:include page="footer.jsp" />
</body>
<script>
	var msg = "${msg}";

	if (msg != "") {
		alert(msg);
	}
</script>
</html>