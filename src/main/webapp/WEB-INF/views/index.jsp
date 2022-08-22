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
						<li class="nav-item active"><a class="nav-link"
							href="loginForm">login</a></li>
						<li class="nav-item"><a class="nav-link" href="joinForm">Sign
								up</a> <!-- <a class="nav-link" href="about.jsp">Sign up</a> --></li>
						<li class="nav-item"><a class="nav-link" href="listForm">Share
								my recipe</a></li>
						<li class="nav-item">
							<!-- <a class="nav-link" href="#"><i class="fa fa-search" aria-hidden="true"></i></a> 돋보기 -->
						</li>
					</ul>
				</div>
			</nav>
		</div>
	</div>
	<div class="header section_1">
		<img src="resources/images/advertisement-1.png" alt="이미지" class="">
	</div>
	<div class="header section_2">
		<img src="resources/images/advertisement-2.png" alt="이미지" class="">
	</div>
	<div class="header section_3">
		<img src="resources/images/advertisement-3.png" alt="이미지" class="">
		<p class="gallery_text_2">※상기 이미지는 광고성 이미지로 실제와 다를수 있습니다.</p>
	</div>
	<!--header section end -->
	<!-- gallery section start -->
	<div class="gallery_section layout_padding">
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<h1 class="gallery_taital">이번주 추천 Recipe!</h1>
					<p class="gallery_text">아래 추천 레시피를 클릭하시면 상세 레시피 확인이 가능합니다.</p>
				</div>
			</div>
			<div class="">
				<div class="gallery_section_2">
					<div class="row">
						<div class="col-md-4">
							<div class="container_main">
								<img src="resources/images/img-1.png" alt="Avatar" class="image">
								<div class="overlay">
									<div class="text">
										<a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="container_main">
								<img src="resources/images/img-2.png" alt="Avatar" class="image">
								<div class="overlay">
									<div class="text">
										<a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="container_main">
								<img src="resources/images/img-3.png" alt="Avatar" class="image">
								<div class="overlay">
									<div class="text">
										<a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="gallery_section_2">
					<div class="row">
						<div class="col-md-4">
							<div class="container_main">
								<img src="resources/images/img-4.png" alt="Avatar" class="image">
								<div class="overlay">
									<div class="text">
										<a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="container_main">
								<img src="resources/images/img-5.png" alt="Avatar" class="image">
								<div class="overlay">
									<div class="overlay">
										<div class="text">
											<a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="container_main">
								<img src="resources/images/img-6.png" alt="Avatar" class="image">
								<div class="overlay">
									<div class="overlay">
										<div class="text">
											<a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="gallery_section_2">
					<div class="row">
						<div class="col-md-4">
							<div class="container_main">
								<img src="resources/images/img-7.png" alt="Avatar" class="image">
								<div class="overlay">
									<div class="text">
										<a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="container_main">
								<img src="resources/images/img-8.png" alt="Avatar" class="image">
								<div class="overlay">
									<div class="text">
										<a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="container_main">
								<img src="resources/images/img-9.png" alt="Avatar" class="image">
								<div class="overlay">
									<div class="text">
										<a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="seemore_bt">
				<a href="listForm">More Recipe</a>
			</div>
		</div>
	</div>
	<!-- gallery section end -->
	<!-- testimonial section start -->
	<div class="carousel-item">
		<div class="client_section_2">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="testimonial_section_2">
							<h4 class="client_name_text">
								Monila <span class="quick_icon"><img
									src="resources/images/quick-icon.png"></span>
							</h4>
							<p class="customer_text">many variations of passages of Lorem
								Ipsum available, but the majority have suffered alteration in
								some form, by injected humour, or randomised words which don't
								look even slightly believable. If you are going to use a passage
								of Lorem Ipsum, you need to be sure there isn't anything
								embarrassing hidden in the middle of text. All themany
								variations of passages of Lorem Ipsum available, but the
								majority have suffered alteration in some embarrassing hidden in
								the middle of text. All the</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="carousel-item">
		<div class="client_section_2">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="testimonial_section_2">
							<h4 class="client_name_text">
								Monila <span class="quick_icon"><img
									src="resources/images/quick-icon.png"></span>
							</h4>
							<p class="customer_text">many variations of passages of Lorem
								Ipsum available, but the majority have suffered alteration in
								some form, by injected humour, or randomised words which don't
								look even slightly believable. If you are going to use a passage
								of Lorem Ipsum, you need to be sure there isn't anything
								embarrassing hidden in the middle of text. All themany
								variations of passages of Lorem Ipsum available, but the
								majority have suffered alteration in some embarrassing hidden in
								the middle of text. All the</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- testimonial section end -->
	<jsp:include page="footer.jsp" />
</body>
</html>