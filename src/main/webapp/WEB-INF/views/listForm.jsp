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
<!-- paging -->
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
	<div>${loginBox}</div>
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
			<thead>
				<tr>
					<th>Share My Recipe</th>
				</tr>
				<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>조회수</th>
				</tr>
			</thead>
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
			content += '<td>' + item.subject + '</td>';
			content += '<td>' + item.name + '</td>';
			content += '<td>' + item.bHit + '</td>';
			content += '</tr>';
		});
		console.log(content);
		$('#list').empty();
		$('#list').append(content);
	}
</script>
<jsp:include page="footer.jsp" />
</html>
