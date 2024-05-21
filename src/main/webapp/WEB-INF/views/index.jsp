<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>따뜻한 가구, 우리집에 어서오세요</title>
<!-- css 적용 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<link href="${pageContext.request.contextPath}/resources/css/index.css" rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- jquery -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<!-- user script-->
</head>
<body class="pt-5">
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<!-- Carousel -->
  <div id="wrapper">
	<div id="demo" class="carousel slide" data-bs-ride="carousel">

		<!-- Indicators/dots -->
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#demo" data-bs-slide-to="0"
				class="active"></button>
			<button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
			<button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
		</div>

		<!-- The slideshow/carousel -->
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img
					src="https://ssueim.com/web/upload/appfiles/ZaReJam3QiELznoZeGGkMG/ca6af8fe16e014721f63106078f85c68.jpg"
					alt="Los Angeles" class="d-block" style="width: 100%">
				<div class="carousel-caption"></div>
			</div>
			<div class="carousel-item">
				<img
					src="https://ssueim.com/web/upload/appfiles/ZaReJam3QiELznoZeGGkMG/6c4915ebe0c28c9e5ce52758cb6da2c5.jpg"
					alt="Chicago" class="d-block" style="width: 100%">
				<div class="carousel-caption"></div>
			</div>
			<div class="carousel-item">
				<img
					src="https://ssueim.com/web/upload/appfiles/ZaReJam3QiELznoZeGGkMG/ca6af8fe16e014721f63106078f85c68.jpg"
					alt="New York" class="d-block" style="width: 100%">
				<div class="carousel-caption"></div>
			</div>
		</div>

		<!-- Left and right controls/icons -->
		<button class="carousel-control-prev" type="button"
			data-bs-target="#demo" data-bs-slide="prev">
			<span class="carousel-control-prev-icon"></span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#demo" data-bs-slide="next">
			<span class="carousel-control-next-icon"></span>
		</button>
	</div>



	<div class="d-flex justify-content-center mt-5 mb-5" >	
		<div class="box-1">
			<img src="resources/image/tableware1.jpg"  alt="이미지1" style="border-radius:30px;"/>
		</div>

		<div class="photo-big"  >
			<div id="boxtop" style="border-radius:30%; margin-left:30px; margin-bottom:20px;">
				<img src="resources/image/tableware2.jpg" alt="이미지2" style="border-radius:30px;"/>
			</div>
			<div id="box-down">
				<img src="resources/image/tableware3.jpg" alt="이미지3" style="border-radius:30px; margin-left:30px;"/>
			</div>
		</div>
	</div>

	<!-- best carousel -->
	<h2 class="mb-3" style="text-align: center; margin-top:80px" >B E S T</h2>
	<!-- css icon -->
	<div id="carouselExampleControls" class="carousel carousel-dark slide"
		data-bs-ride="carousel" data-interval="5000">
				<div class="carousel-inner">
				<c:forEach var="best" items="${bestList}" varStatus="status">
					<c:if test="${status.first|| status.index%4==0}">
						<div name="best" class="carousel-item ${status.index==0?'active':''}">
							<div class="d-flex ms-auto me-auto">
					</c:if>
							<div class="card-wrapper container-md justify-content-center">
								<div class="card border-0 p-3">
									<a href="product/product_detail?pid=${best.pid}">
									<img name="bestseller"
										src="product/productImageDownload?pid=${best.pid}&index=1&pthumbBodyType=thumb"
										class="card-img-top" alt="..."
										style="width: 290px; border-radius: 10px; margin-bottom: 10px;">
									</a>
								</div>
							</div>
				<c:if test="${(status.index+1)%4==0 || status.last}">
						</div>
					</div>
				</c:if>
			</c:forEach>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExampleControls" data-bs-slide="prev">
				<span class="carousel-control-prev-icon " aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExampleControls" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
	</div>
	<!-- best carousel -->
	
	<!-- famous keyword -->
	<div class="d-flex mt-5" style="margin-left:100px;">
		<div class="d-flex" style="flex-direction: column;">
			<div>
				<div id="text-box" style="text-align: center;">
					<h2 id="title" style="margin-right: 100px">인기 키워드</h2>
				</div>
			</div>

			<!-- 카테고리 -->
			<div class="category">
				<ul class="nav flex-column">
					<!-- 쇼핑 관련 -->
					<li class="nav-item nav-item-category"><a class="nav-link"
						href="javascript:void(0);"
						onclick="categoryFunction('그릇'); return false;">#잔</a></li>
					<li class="nav-item nav-item-category"><a class="nav-link"
						href='${pageContext.request.contextPath}/product/product_list'>#선물</a>
					</li>
					<li class="nav-item nav-item-category"><a class="nav-link"
						href='${pageContext.request.contextPath}/product/product_list'>#마리벨</a>
					</li>
					<li class="nav-item nav-item-category"><a class="nav-link"
						href='${pageContext.request.contextPath}/product/product_list'>#블랑</a>
					</li>
				</ul>
			</div>
		</div>
		<!-- 카테고리 -->

		<div class="image-box" style="margin-right: auto;">
			<div id="recommendItem">
				<c:forEach var="product" items="${famousList}">
					<a href="product/product_detail?pid=${product.pid}">
						<div id="box">
							<img id="content-img"
								src="product/productImageDownload?pid=${product.pid}&index=1&pthumbBodyType=thumb">
							<!-- 장바구니 버튼 -->
							<div class="btn" id="famous-cart">
								<i class="bi bi-handbag-fill" style="color: white;"></i>
							</div>
							<div id="name">${product.pname}</div>
							<div id="price">${product.pprice}원</div>
						</div>
					</a>
				</c:forEach>

			</div>
			<div style="text-align: center;">
				<button id="more-btn"
					onclick="location.href='${pageContext.request.contextPath}/product/product_list'">더보기
					+</button>
			</div>

		</div>
	</div>
	</div>
	<!-- famous keyword -->

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>