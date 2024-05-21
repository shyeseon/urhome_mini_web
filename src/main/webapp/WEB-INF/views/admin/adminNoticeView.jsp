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
	href="${pageContext.request.contextPath}/resources/css/admin/adminNoticeView.css"
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
				<div class="card-body" style="margin:0 auto;">
					<div class=" d-flex">
						<div class="me-5">
						<c:if test="${board.battachoname!=null}">
						<img src="attachDownload?bnumber=${board.bnumber}" width="150px"
								height="150px">
						</c:if>
						</div>
						<div>
							<div class="form-group mb-2 ">
								<p>게시물 번호: ${board.bnumber}</p> 
							</div>
							<div class="form-group mb-2 ">
								<p>타입: ${board.btype}</p> 
							</div>
							<div class="form-group mb-2" >
								<p>게시글 제목</p> 
								<input class="form-text mb-3" 
								style="border-style: none none solid none; width:300px;"
									type="text" id="btitle" name="btitle" value="${board.btitle}" readonly/>
							</div>
							<div class="form-group mb-2">
								<p>게시글 내용</p> 
								<textarea class="form-text" style="width:800px; height:300px; font-size: 16px"
									 id="bcontent" name="bcontent" readonly>${board.bcontent}</textarea>
							</div>
							<div style="text-align: right;">
								<a href="boardUpdateForm?bnumber=${board.bnumber}"
									class="btn btn-danger btn-sm me-2">수정</a> <a
									href="adminNotice" class="btn btn-primary btn-sm me-2">목록</a>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
</body>
</html>
