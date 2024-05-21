<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/admin/addProductInfoView.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- jquery -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<!-- user script-->
<script src="${pageContext.request.contextPath}/resources/js/admin/addProductInfoView.js">
</script>
</head>
<body id="wrap" style="overflow-x: hidden">
	<div class="row">
		<div class="col-xl-2 col-lg-3">
			<%@ include file="/WEB-INF/views/admin/adminHeader.jsp"%>
		</div>
		<div class="col-xl-10 col-lg-9">
			<div class="content-header mb-5 ms-0" style="height: 65px;">
				<h4 class="text-light text-uppercase mb-0">상품관리</h4>
				<a href="${pageContext.request.contextPath}/logout"><i
					class="fas fa-sign-out-alt text-danger fa-lg me-0"></i></a>
			</div>
			<form method="post" enctype="multipart/form-data">
				<div style="text-align: right; width:98%;">
					<a href="productManageView" class="btn me-1 border border-dark">취소</a>
					<button type="button" id="submit"
						class="btn btn-dark me-2">추가</button>
				</div>
				<div class="row ms-auto me-auto" style="width:95%;">
					<div class="col-sm-5 p-2">
						<div class="card">
							<div class="card-body">
								<div class="d-flex justify-content-between border-bottom">
									<div class="mt-auto mb-auto">
										상품 썸네일
									</div>
									<label for="pthumbnailImage">
										<div class="btn-upload">썸네일 이미지 추가</div>
									</label>
									<input type="file" multiple="multiple" class="form-control-file"
										name="pthumbnailImage" id="pthumbnailImage">
								</div>
								<div class="d-flex" id="thumbnailPreview">
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm-4 p-2">
						<div class="card">
							<div class="card-body">
								<div class="row">
									<div class="form-group mt-0">
										<label class="form-label">상품 아이디</label>
										<input class="form-control" type="text" id="pid" name="pid">
									</div>
									<div class="form-group mt-2">
										<label class="form-label">상품명</label>
										<input class="form-control" type="text" id="pname" name="pname" />
									</div>
									<div class="form-group mt-2">
										<label class="form-label col-4">가격</label>
										<input class="form-control" type="number" id="pprice" name="pprice" />
									</div>
									<div class="form-group mt-2">
										<label class="form-label">재고</label>
										<input class="form-control" type="number" id="pstock" name="pstock" />
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm-3 p-2">
						<div class="card">
							<div class="card-body">
								<div class="form-group">
									<label class="form-label">카테고리</label>
									<select name="category" class="form-select">
										<option selected>카테고리 선택</option>
										<option value="1">그릇</option>
										<option value="2">접시</option>
										<option value="3">수저세트</option>
										<option value="4">컵</option>
									</select>
								</div>
								<div class="form-group mt-2">
									<label class="form-label">배너 위치</label>
									<div class="form-check">
									  <input class="form-check-input" type="radio" value="none" name="banner" id="banner1" checked>
									  <label class="form-check-label" for="banner1">
									    없음
									  </label>
									</div>
									<div class="form-check">
									  <input class="form-check-input" type="radio" value="best" name="banner" id="banner2">
									  <label class="form-check-label" for="banner2">
									    Best
									  </label>
									</div>
									<div class="form-check">
									  <input class="form-check-input" type="radio" value="famous" name="banner" id="banner3">
									  <label class="form-check-label" for="banner3">
									    인기 키워드
									  </label>
									</div>
									<div class="form-check">
									  <input class="form-check-input" type="radio" value="famous" name="banner" id="banner3">
									  <label class="form-check-label" for="banner3">
									   신상품
									  </label>
									</div>
								</div>
								<div class="form-group mt-2">
									<label class="form-label">상품 판매 상태</label>
									<div class="form-check">
									  <input class="form-check-input" type="radio" value="Y" name="pstatus" id="pstatus1">
									  <label class="form-check-label" for="pstatus1">
									    활성화
									  </label>
									</div>
									<div class="form-check">
									  <input class="form-check-input" type="radio" value="N" name="pstatus" id="pstatus2">
									  <label class="form-check-label" for="pstatus2">
									    비활성화
									  </label>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="p-2">
						<div class="card" style="width:98%;margin:0 auto;">
							<div class="card-body">
								<div class="d-flex justify-content-between border-bottom">
									<div class="mt-auto mb-auto">
										옵션
									</div>
									<div>
										<button id="option" class="btn" type="button">옵션 추가</button>
									</div>
								</div>
								<div class="option">
								</div>
							</div>
						</div>
					</div>
					<div class="p-2">
						<div class="card" style="width:98%;margin:0 auto;">
							<div class="card-body scroll">
								<div class="d-flex justify-content-between border-bottom">
									<div class="mt-auto mb-auto">
										상품 소개 이미지
									</div>
									<div>
										<label for="pbodyImage">
											<div class="btn-upload">소개 이미지 추가</div>
										</label>
										<input type="file" multiple="multiple"
											class="form-control-file" name="pbodyImage" id="pbodyImage">
									</div>
								</div>
								<div id="bodyPreview" style="text-align:center;">
								</div>
							</div>
						</div>
					</div>

				</div>
			</form>
		</div>
	</div>
</body>
</html>