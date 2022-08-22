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
						<li class="nav-item active"><a class="nav-link"
							href="loginForm">login</a></li>
						</li>
					</ul>
				</div>
			</nav>
		</div>
	</div>
	<div>${loginBox}</div>
	<jsp:include page="loginBox.jsp" />
	<div class="main table">
		<form action="join" method="post">
			<table>
				<tr>
					<th>회원가입</th>
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
					<th>NAME</th>
					<td><input type="text" name="name" /></td>
				</tr>
				<tr>
					<th>BIRTH DAY</th>
					<td><input type="text" name="birth" /></td>
					<th>예)19900206</th>
				</tr>
				<tr>
					<th>GENDER</th>
					<td><input type="radio" name="gender" value="남" /> 남자
						&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="gender"
						value="여" /> 여자</td>
				</tr>
				<tr>
					<th>EMAIL</th>
					<td><input type="email" name="email" /></td>
				</tr>
				<tr>
					<th colspan="2"><input type="submit" value="회원가입" /></th>
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