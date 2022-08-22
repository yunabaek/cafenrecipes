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
		<table>
			<tr>
				<th>아이디 찾기</th>
			</tr>
			<tr>
				<th>NAME</th>
				<td><input type="text" name="name" /></td>
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
				<th colspan="2"><input type="button" id="idfind" value="아이디찾기" />
					<input type="button" id="" value="취소"
					onclick="location.href='loginForm'" /></th>
			</tr>
		</table>
	</div>
	<jsp:include page="footer.jsp" />
</body>
<script>
	$('#idfind').click(function() {

		var name = $('input[name="name"]').val();
		var birth = $('input[name="birth"]').val();
		var email = $('input[name="email"]').val();
		console.log(name + '/' + birth + '/' + email);

		$.ajax({
			type : 'POST',
			url : 'findid',
			data : {
				'name' : name,
				'birth' : birth,
				'email' : email
			},
			dataType : 'JSON',
			success : function(data) {
				if (data.success != '입력하신 정보와 일치하는 아이디가 없습니다.') {
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
</html>