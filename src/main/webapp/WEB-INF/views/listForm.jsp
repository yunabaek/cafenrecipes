<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<!-- 페이징 -->
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
						<li class="nav-item active"><a class="nav-link"
							href="myProfile">myProfile</a></li>
					</ul>
				</div>
			</nav>
		</div>
	</div>
	<jsp:include page="loginBox.jsp" />
	<div class="main table">
		<input type="button" onclick="location.href='./writeForm'"
			value="레시피 공유하기" />
		<form action="search" method="get">
			<fieldset>
				<select name="opt">
					<option value="subject">제목</option>
					<option value="name">작성자</option>
				</select> </br> <input type="text" name="keyword" placeholder="검색어를 입력 하세요"
					style="font-size: 10pt" /> <input type="submit" value="검색"
					style="font-size: 10pt; color: #000000; font-weight: bold" />
			</fieldset>
		</form>
		<table>
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
			</tr>
			<!-- 
			<c:if test="${list eq null || size == 0}">
				<tr>
					<td colspan="5">등록된 글이 없습니다.</td>
				</tr>
			</c:if>
			<c:forEach items="${list}" var="bbs">
				<tr>
					<td>${bbs.idx}</td>
					<td><a href="detail?idx=${bbs.idx}">${bbs.subject}</a></td>
					<td>${bbs.name}</td>
					<td>${bbs.bHit}</td>
				</tr>
			</c:forEach>
			 -->
			<!-- 페이징  -->
			<tbody id="list"></tbody>
			<tr>
				<td colspan="3" id="paging ">
					<div class="container">
						<nav aria-label="Page navigation"
							style="text-align: center; height: 150px">
							<ul class="pagination" id="pagination"></ul>
						</nav>
					</div>
				</td>
			</tr>
		</table>
	</div>
	<jsp:include page="footer.jsp" />
</body>
<script>
	var currPage = 1;
	var totalPage = 2;

	listCall(currPage, 10);

	function more() {
		currPage++;
		console.log('currPage', currPage);
		if (currPage > totalPage) {
			$('button').attr('disabled', true);
		} else {
			listCall(currPage, 10);
		}
	}

	function listCall(page, cnt) {

		$.ajax({
			type : 'GET',
			url : 'list',
			data : {
				'page' : page,
				'cnt' : cnt
			},
			dataTyps : 'JSON',
			success : function(data) {
				console.log(data);
				totalPage = data.pages;
				listDraw(data.list);

				$('#pagination').twbsPagination({
					startPage : currPage,
					totalPages : totalPage,
					visiblePages : 100,
					onPageClick : function(evt, page) {
						console.log(evt);
						console.log(page);
						listCall(page, 10);
					}
				});

			},
			error : function(e) {
				console.log(e);
			}
		});
	}

	function listDraw(list) {
		var content = '';
		list.forEach(function(item, idx) {
			console.log(idx, item);
			content += '<tr>';
			content += '<td>' + item.idx + '</td>';
			content += '<td><a href="detail?idx=' + item.idx + '">'
					+ item.subject + '</a></td>';
			content += '<td>' + item.name + '</td>';
			content += '<td>' + item.bHit + '</td>';
			content += '</tr>';
		});
		console.log(content);
		$('#list').empty();
		$('#list').append(content);
	}
</script>
</html>
