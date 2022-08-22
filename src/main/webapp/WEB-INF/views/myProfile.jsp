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
						<li class="nav-item active"></li>
						</li>
					</ul>
				</div>
			</nav>
		</div>
	</div>
	<div>${loginBox}</div>
	<jsp:include page="loginBox.jsp" />
	<div class="main table">
		<table>
			<tr>
				<th>회원정보수정</th>
			</tr>
			<tr>
				<th>ID</th>
				<td>${myProfile.id}</td>
			</tr>
			<tr>
				<th>PW</th>
				<td><input type="password" name="pw" value="${myProfile.pw}" /></td>
			</tr>
			<tr>
				<th>NAME</th>
				<td>${myProfile.name}</td>
			</tr>
			<tr>
				<th>BIRTH DAY</th>
				<td><input type="text" name="birth" value="${myProfile.birth}" /></td>
			</tr>
			<tr>
				<th>GENDER</th>
				<td>${myProfile.gender}</td>
			</tr>
			<tr>
				<th>EMAIL</th>
				<td><input type="text" name="email" value="${myProfile.email}" />
				</td>
			</tr>
			<tr>
				<th colspan="2"><input type="button" id="submit" value="수정완료" />
				</th>
			</tr>
		</table>
	</div>
	<jsp:include page="footer.jsp" />
</body>
<script>
	$('#submit').click(function() {
		var $id = $('input[name="id"]');
		var $pw = $('input[name="pw"]');
		var $name = $('input[name="name"]');
		var $birth = $('input[name="birth"]');
		var $gender = $('input[name="gender"]');
		var $email = $('input[name="email"]');

		if ($pw.val() == '') {
			alert('비밀번호를 일력 해주세요');
			$pw.focus();
		} else if ($birth.val() == '') {
			alert('생년월일을 일력 해주세요');
			$birth.focus();
		} else if ($email.val() == '') {
			alert('이메일을 일력 해주세요');
			$email.focus();
		} else {
			var userupdate = {};
			userupdate.id = $id.val();
			userupdate.pw = $pw.val();
			userupdate.name = $name.val();
			userupdate.birth = $birth.val();
			userupdate.gender = $gender.val();
			userupdate.email = $email.val();
			console.log(userupdate);

			$.ajax({
				type : 'get',
				url : 'profileupdate',
				data : userupdate,
				dataType : 'json',
				success : function(data) {
					console.log(data);
					if (data.success > 0) {
						alert('정보 수정이 완료되었습니다.');
					}
				},
				error : function(e) {
				}
			});

		}
	});
</script>
</html>