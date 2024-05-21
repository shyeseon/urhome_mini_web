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
<link
	href="${pageContext.request.contextPath}/resources/css/board/writeBoardForm.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- jquery -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link rel="stylesheet">
<!-- user script-->

</head>
<body style="margin-top: 60px">
	<div class="logo d-flex m-3" style="justify-content: flex-end;">
		<img style="margin-right: 60px"
			src="${pageContext.request.contextPath}/resources/image/common/LOGO.png"
			width="90" height="50">
	</div>

	<div class="row writeBoard-body">
		<form id="writeBoardForm" method="post" action="writeBoard"
			enctype="multipart/form-data">
			<div class="d-flex justify-content-between"
				style="margin: 40px 50px 20px 50px">
				<div class="selectType d-flex" id="btype">
					<select class="btype-select" name="btype" style="height: 35px">
						<option  selected>분류</option>
						<option  value="notice">공지사항</option>
						<option  value="FAQ">FAQ</option>
						<option  value="questionBoard">1:1 문의사항</option>
					</select>
				</div>
				<div style="text-align: right;">
					<button type="submit" class="btn_submit btn btn-dark btn-sm">작성</button>
					<a href="notice" class="btn_submit btn btn-sm ms-2 ">취소</a>
				</div>
			</div>
			<div class="board-input row">
				<div class="writeBoard-left col-2 bg-light"></div>
				<div class="col-10">
					<div class="admin_img mt-3 d-flex" style="margin-bottom: 20px">
						<i class="bi bi-person-circle"
							style='font-size: 35px; margin-right: 20px'></i>
						<p style="align-content: center; padding-top: 15px">관리자</p>
					</div>

					<input style="border-style: none; width: 100%; margin-left:30px" 
						type="text" id="btitle" name="btitle" placeholder="제목">
					<hr />

					<textarea style="border-style: none; width: 100%; height: 300px;  margin-left:30px" 
						id="bcontent" name="bcontent" placeholder="내용을 입력해 주세요"></textarea>

					<div class="battach-form d-flex mt-5" style=" margin-left:30px">
						<div class="input-group-attach me-5">첨부파일</div>
						<input id="battach" type="file" name="battach">
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
</html>