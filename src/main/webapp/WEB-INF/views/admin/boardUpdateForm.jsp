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
	href="${pageContext.request.contextPath}/resources/css/board/updateBoardForm.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- jquery -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<!-- user script-->
<script>
	
</script>
<style>
</style>
</head>
<body id="wrap" style="overflow-x: hidden">
	<div class="row">
		<div class="col-xl-2 col-lg-3">
			<%@ include file="/WEB-INF/views/admin/adminHeader.jsp"%>
		</div>
		<!--  -->
		<div class="col-xl-10 col-lg-9">
			<div class="content-header ms-0 mb-3" style="height: 65px;">
				<h4 class="text-light text-uppercase mb-0">게시판관리</h4>
				<a href="${pageContext.request.contextPath}/logout"><i
					class="fas fa-sign-out-alt text-danger fa-lg me-0"></i></a>
			</div>
		
			<div class="card mt-5"
				style="width: 95%; margin: 0 auto; border-style: none;">
				<div class="card-body">
					<form id="boardUpdateForm" method="post" action="updateBoard"
						enctype="multipart/form-data">
							<span class="inputBnumber">bno. ${board.bnumber}</span> <input
				type="hidden" name="bnumber" value="${board.bnumber}">
						<div style="text-align: right;">
							<button type="submit" class="btn_submit btn btn-dark btn-sm">수정</button>
							<a href="adminNotice" class="btn_submit btn btn-sm ms-2 ">목록보기</a>
						</div>
						<div class="writeBoard-right">
							<div class="admin_img mt-3 d-flex" style="margin-bottom: 20px">
								<i class="bi bi-person-circle"
									style='font-size: 35px; margin-right: 20px'></i>
								<p style="align-content: center; padding-top: 15px">관리자</p>
							</div>
							<div style="margin-right: 20px; text-align: right;">
							<select class="btype-select mb-5" name="btype" style="height: 35px">
								<option selected>분류</option>
								<option value="notice">공지사항</option>
								<option value="FAQ">FAQ</option>
								<option value="questionBoard">1:1 문의사항</option>
							</select>
							</div>
							 <input
								style="border-style: none; width: 100%; margin-left: 30px"
								type="text" id="btitle" name="btitle" value="${board.btitle}">
							<hr />
							<textarea
								style="border-style: none; width: 100%; height: 300px; margin-left: 30px"
								id="bcontent" name="bcontent">${board.bcontent}
							</textarea>
							<div class="d-flex " style="margin: 20px 0px 20px 0px">
								<div style="margin: 20px 0px 30px 0px">
									<span style="margin-left: 30px">첨부파일</span> <label
										for="battach" class="imgUpload">
										<div style="font-size: 13px">이미지 업로드</div>
									</label>
								</div>
								<input id="battach" type="file" name="battach" class="me-5">
								<c:if test="${board.battachoname!=null}">
									<div class="notice_img" style="margin-left: 30px">
										<img src="attachDownload?bnumber=${board.bnumber}"
											width="80px" height="80px">
									</div>
								</c:if>
							</div>
						</div>

					</form>
				</div>
			</div>

		</div>
	</div>
</body>
</html>
