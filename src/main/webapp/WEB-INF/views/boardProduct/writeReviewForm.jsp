<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- jquery -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<!-- css -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css" 
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/boardProduct/writeReviewForm.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/resources/js/boardProduct/writeReviewForm.js"></script>
<!-- user script-->
<script type="text/javascript">
</script>
</head>
<body>
	<div class="flex-grow-1 m-5 p-5">
		<div class="d-flex row">
		 <!-- form에 작성한 데이터를 어디로 보낼지 지정 -->
		 <form id="writeReviewForm" method="post" action="writeReview" enctype="multipart/form-data">
		 	<!-- 상품후기 -->
		 	<div class="board-title d-flex">
		 		<button type="button" id="back-btn" onclick="location.href='${pageContext.request.contextPath}/product/product_detail?pid=${pid}'">
			      	<i class="bi bi-chevron-left"></i>
			     </button>
		 		<h4 style="margin-top: 7px;"><strong>상품후기</strong></h4>
		 	</div>
		 	<hr style="border: solid black;">
		 	
		 	<div class="attach-file mt-4 mb-4">
		 		<img alt="" src="https://ssueim.com/web/upload/_awesome_skin/common/img_noimage.png">
		 		<button class="btn btn-outline-secondary" style="width: 150px; height: 40px; margin: 60px 30px;">주문상품선택</button>
		 	</div>
		 	<hr>
	 		<input id="pid" type="hidden" name="pid" class="form-control"
	 		 style="border:none; border-bottom: 1px solid #ddd;" value="${pid}">		 
		 	<div class="input-group mt-4">
		 		<p style="margin-right: 30px; margin-top: 20px">제목</p>
		 		<input id="bptitle" type="text" name="bptitle" class="form-control" placeholder="제목을 입력해주세요. (최대 125자)"
		 		 style="border:none; border-bottom: 1px solid #ddd;" >
		 	</div>
		 			 	
		 	<div class="input-group mt-4">
		 		<textarea id="bpcontent" name="bpcontent" class="form-control"
		 			style="width: 100%; height: 300px;"></textarea>
		 	</div>
		 	
		 	<div class="input-group mt-4 row">
		 		<div class="col-4">
		 			<input id="bpattach" type="file" name="bpattach" class="form-control">
		 		</div>
		 		<div class="col-8" id="bpattachPreview" style="width:120px;height:120px;">
		 		</div>
		 	</div>
		 	
		 	<div class="mt-3 d-flex">
		 		<button type="submit" class="btn btn-dark me-2" style="margin-left: auto;">등록</button>
		 		<a class="btn btn-outline-secondary" href="${pageContext.request.contextPath}/product/product_detail?pid=${pid}">목록</a>
		 	</div>
		 </form>
		</div>
	</div>
</body>
</html>