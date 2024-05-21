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
	href="${pageContext.request.contextPath}/resources/css/admin/adminNotice.css"
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
			<div class="content-header mb-5 ms-0" style="height: 65px;">
				<h4 class="text-light text-uppercase mb-0">공지사항 관리</h4>
				<a href="${pageContext.request.contextPath}/logout"><i
					class="fas fa-sign-out-alt text-danger fa-lg me-0"></i></a>
			</div>
			<div class="card" style="width: 95%; margin: 0 auto;">
				<div class="card-body">
					<table class="table table-bordered table-hover">
						<thead class="table-secondary">
							<tr>
								<th width="5%">번호</th>
								<th width="35%">제목</th>
								<th width="20%">날짜</th>
								<th width="10%">분류</th>
								<th width="10%">조회수</th>
								<th width="10%"></th>
								<th width="10%"></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="board" items="${notice}">
								<tr>
									<td width="5%" >${board.bnumber}</td>
									<td width="35%" ><a id="btitle" style="color:black"
										href="adminNoticeView?bnumber=${board.bnumber}">${board.btitle}</a></td>
									<td width="20%" >
									<fmt:formatDate
											value="${board.bdate}" pattern="yyyy-MM-dd" /></td>
									<td width="10%" >${board.btype}</td>
									<td width="10%" >${board.bhitcount}</td>
									<td width="10%" style="text-align: center;">
									<a href="boardUpdateForm?bnumber=${board.bnumber}"
										id="boardUpdateForm" class="btn btn-dark btn-sm">수정</a></td>
									<td width="10%" style="text-align: center;">
									<a href="deleteBoard?bnumber=${board.bnumber}" id="deleteBoard"
										class="btn btn-danger btn-sm">삭제</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div aria-label="page-trans">
						<ol class=" d-flex align-items-center pagination"
							style="margin-bottom: 150px; justify-content: center">

							<c:if test="${pager.groupNo>1}">
								<li class="page-icon"><a
									style="border-style: none; font-size: 16px; color: black"
									class="first-previous-icon" href="notice?pageNo=1"
									aria-label="beginning"> <i class="bi bi-caret-left"></i>
								</a></li>
								<li class="page-icon"><a
									style="border-style: none; font-size: 16px; color: black"
									class="previous-icon"
									href="adminNotice?pageNo=${pager.startPageNo-1}"
									aria-label="Previous"> <i class="bi bi-caret-left"></i>
								</a></li>
							</c:if>
							<c:forEach var="i" begin="${pager.startPageNo}"
								end="${pager.endPageNo}">
								<li class="page-num"><a
									style="border-style: none; font-size: 16px; color: black"
									class="page-link ${pager.pageNo==i ? 'active':''}"
									href="adminNotice?pageNo=${i}">${i}</a></li>
							</c:forEach>
							<c:if test="${pager.groupNo<pager.totalGroupNo}">
								<li class="page-icon"><a
									style="border-style: none; font-size: 16px; color: black"
									class="next-icon"
									href="adminNotice?pageNo=${pager.endPageNo+1}"
									aria-label="Next"> <i class="bi bi-caret-right"></i>
								</a></li>
							</c:if>
							<li class="page-icon"><a
								style="border-style: none; font-size: 16px; color: black"
								class="next-icon" href="adminNotice?pageNo=${pager.totalPageNo}"
								aria-label="last"><i class="bi bi-caret-right"></i> </a></li>

						</ol>
					</div>
					<a href="boardWriteForm" class="btn btn-dark" id="addNotice">추가</a>

				</div>
			</div>
		</div>
	</div>
</body>
</html>
