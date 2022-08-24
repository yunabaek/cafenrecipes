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
	<div class="main table">
		<h2>레시피 상세보기</h2>
		<table>
			<tr>
				<th>글번호</th>
				<td id="smallContextBox">${dto.idx}</td>
			</tr>
			<tr>
				<th>제목</th>
				<td id="smallContextBox">${dto.subject}</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td id="smallContextBox">${dto.name}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td id="bicContextBox">${dto.content}</td>
			</tr>
			<tr>
				<c:if test="${photos.size()>0}">
					<tr>
						<th>사진</th>
						<td><c:forEach items="${photos}" var="photo">
								<img src="/photo/${photo.newFileName}" width="500px" />
								<br />
								<br />
							</c:forEach></td>
					</tr>
				</c:if>
		</table>
		<br /> <input type="button" onclick="location.href='./listForm'"
			value="리스트" /> <input type="button"
			onclick="location.href='./updateForm?idx=${dto.idx}'" value="수정" />
		<input type="button" onclick="del()" value="삭제" /> <br />
	</div>
	<jsp:include page="footer.jsp" />
</body>
<script>
	function del() {
		var yn = confirm("정말 이 글을 삭제 하시겠습니까?");

		if (yn) {
			location.href = './delete?idx=${dto.idx}';
		}

	}
</script>
</html>