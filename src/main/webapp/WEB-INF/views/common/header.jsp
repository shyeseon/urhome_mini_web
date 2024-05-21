<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css" type="text/css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<script src="${pageContext.request.contextPath}/resources/js/header.js" rel="stylesheet"></script>

<div id="header" class="header">
	<nav class="navbar navbar-expand-lg fixed-top bg-light">
		<div class="logo">
			<a class="navbar-brand" href="${pageContext.request.contextPath}/">
			<img src="${pageContext.request.contextPath}/resources/image/common/LOGO.png" width="90" height="50"></a>
		</div>
		<button class="navbar-toggler ms-auto" type="button"
			data-bs-toggle="collapse"
			data-bs-target="#navbarDropdownCenter,#navbarDropdownEnd">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse justify-content-center bg-light"
			id="navbarDropdownCenter">
			<ul class="navbar-nav">
				<li class="nav-item dropdown ms-3 me-3">
					<button class="btn" aria-expanded="false" 
					onclick="location.href = '${pageContext.request.contextPath}/product/product_list'">전체</button>
					
				</li>
				<li class="nav-item ms-3 me-3">
					<button class="btn" aria-expanded="false">신상품</button>
				</li>
				<li class="nav-item ms-3 me-3">
					<button class="btn" aria-expanded="false">BEST</button>
				</li>
				<li class="nav-item ms-3 me-3">
					<a class="btn" id="categoryHeaderBtn" aria-expanded="false"
						href="${pageContext.request.contextPath}/product/product_list?pcategoryName=그릇">그릇</a>
				</li>
				<li class="nav-item ms-3 me-3">
					<a class="btn" aria-expanded="false"
						href="${pageContext.request.contextPath}/product/product_list?pcategoryName=접시">접시</a>
				</li>
				<li class="nav-item ms-3 me-3">
					<a class="btn" aria-expanded="false"
						href="${pageContext.request.contextPath}/product/product_list?pcategoryName=컵">컵</a>
				</li>
				<li class="nav-item ms-3 me-3">
					<a class="btn" aria-expanded="false"
"
						href="${pageContext.request.contextPath}/product/product_list?pcategoryName=수저세트">수저세트</a>
				</li>
				<li class="nav-item dropdown ms-3 me-3">
					<button class="btn" aria-expanded="false">커뮤니티</button>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="${pageContext.request.contextPath}/board/notice">공지사항</a></li>
						<li><a class="dropdown-item" href="${pageContext.request.contextPath}/board/FAQ">자주 묻는 질문</a></li>
						<li><a class="dropdown-item" href="${pageContext.request.contextPath}/board/questionBoard">1대1 문의</a></li>
					</ul>
				</li>
			</ul>
		</div>
		<div class="d-flex">
			<div class="collapse navbar-collapse justify-content-end bg-light"
				id="navbarDropdownEnd">

				<ul class="navbar-nav">
					<li class="nav-item dropdown">
						<sec:authorize access="hasRole('ROLE_ADMIN')">
							<a href="${pageContext.request.contextPath}/admin/dashBoard" class="me-2" style="text-decoration:none;color:black;"><b>관리자</b></a>
						</sec:authorize>
						<button class="btn" aria-expanded="false">
							<i class="bi bi-person-circle fs-5"></i>
						</button>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/member/myPageOrderList">주문조회</a></li>
							<li><a class="dropdown-item" href="#">관심상품</a></li>
							<li><a class="dropdown-item" href="#">최근 본 상품</a></li>
							<li><a class="dropdown-item" href="#">적립금</a></li>
							<li><a class="dropdown-item" href="#">쿠폰</a></li>
							<li><a class="dropdown-item" href="#">쓰임포인트</a></li>
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/member/mypage">나의정보</a></li>
							<sec:authorize access="isAnonymous()">
								<li class="text-center d-grid m-2"><a href="${pageContext.request.contextPath}/member/login" class="btn btn-dark btn-sm" aria-expanded="false">로그인</a></li>
								<li class="text-center d-grid m-2"><a href="${pageContext.request.contextPath}/member/joinForm"
									class="btn btn-sm" aria-expanded="false">회원가입</a></li>
							</sec:authorize>
							<sec:authorize access="isAuthenticated()">
								<!-- 사이트간 요청 위조 방지 설정이 비활성화되어 있을 경우 GET 방식으로 요청 가능 -->
								<!-- <b class="text-white me-2">
									<sec:authentication property="principal.username"/>
								</b> -->
								<li class="text-center d-grid m-2"><a href="${pageContext.request.contextPath}/logout"
									class="btn btn-sm btn-danger">로그아웃</a></li>
							</sec:authorize>
						</ul>
					</li>
					<li class="nav-item">
						<button onclick="location.href = '${pageContext.request.contextPath}/cart/cartView'" class="btn" aria-expanded="false">
							<i class="bi bi-bag fs-5"></i>
						</button>
					</li>
					<li class="nav-item dropdown">
						<button class="btn" aria-expanded="false">
							<i class="bi bi-search fs-5"></i>
						</button>
						<ul class="dropdown-menu">
							<li>
								<form class="form-inline">
									<input class="form-control" type="search" placeholder="Search">
								</form>
							</li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</nav>
</div>
