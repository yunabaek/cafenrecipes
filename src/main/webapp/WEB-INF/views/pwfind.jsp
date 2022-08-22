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
		<table>
			<tr>
				<th>비밀번호 찾기</th>
			</tr>
			<tr>
				<th>ID</th>
				<td><input type="text" name="id" /></td>
			</tr>
			<tr>
				<th>BIRTH DAY</th>
				<td><input type="text" name="birth" /></td>
			</tr>
			<tr>
				<th>EMAIL</th>
				<td><input type="text" name="email" /></td>
			</tr>
			<tr>
				<th colspan="2"><input type="button" id="pwfind" value="비밀번호찾기" />
					<input type="button" id="" value="취소"
					onclick="location.href='loginForm'" /></th>
			</tr>
		</table>
	</div>
</body>
</body>
<script>
	$('#pwfind').click(function() {

		var id = $('input[name="id"]').val();
		var birth = $('input[name="birth"]').val();
		var email = $('input[name="email"]').val();
		console.log(name + '/' + birth + '/' + email);

		$.ajax({
			type : 'POST',
			url : 'findpw',
			data : {
				'id' : id,
				'birth' : birth,
				'email' : email
			},
			dataType : 'JSON',
			success : function(data) {
				if (data.success != '일치하는 정보가 없습니다.') {
					alert('고객님의 아이디는 ' + data.success + '입니다.');
					location.href = './loginForm';
				} else {
					alert('입력하신 정보가 일치 하지 않습니다. 다시 확인 후 입력바랍니다.');
				}
			},
			error : function(e) {
				console.log(e);
			}
		});
	});
</script>
<jsp:include page="footer.jsp" />
</html>