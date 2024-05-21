<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<!--qnxmtmxmfoq 5 외부 라이브러리 설정-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- jquery 외부라이브러리 설정 -->
<link href="${pageContext.request.contextPath}/resources/css/board/board.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/board.js"></script>


<script>
	
</script>
</head>
<body class="pt-5">
	<%@ include file="/WEB-INF/views/common/header.jsp"%>

	<h3 class="boardTitle">공지사항</h3>
	<table class="table border-left:0 border-right:0"
		style="width: 80%; margin-left: 150px; margin-bottom: 100px">
		<thead class="table-danger">
			<tr>
				<th width="10%">번호</th>
				<th width="35%">제목</th>
				<th width="25%">날짜</th>
				<th width="20%">작성자</th>
				<th width="10%">조회</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="board" items="${notice}">
				<tr height="60px">
					<td width="10%" class="align-middle">${board.bnumber}</td>
					<td width="35%" class="align-middle">
					<a id="btitle" style="color:black" href="detailBoard?bnumber=${board.bnumber}">${board.btitle}</a></td>
					<td width="25%" class="align-middle">
					<fmt:formatDate
							value="${board.bdate}" pattern="yyyy-MM-dd" /></td>
					<td width="20%" class="align-middle">관리자</td>
					<td width="10%" class="align-middle">${board.bhitcount}</td>

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
					class="previous-icon" href="notice?pageNo=${pager.startPageNo-1}"
					aria-label="Previous"> <i class="bi bi-caret-left"></i>
				</a></li>
			</c:if>
			<c:forEach var="i" begin="${pager.startPageNo}"
				end="${pager.endPageNo}">
				<li class="page-num"><a
					style="border-style: none; font-size: 16px; color: black"
					class="page-link 
				${pager.pageNo==i ? 'active':''}"
					href="notice?pageNo=${i}">${i}</a></li>
			</c:forEach>
			<c:if test="${pager.groupNo<pager.totalGroupNo}">
				<li class="page-icon"><a
					style="border-style: none; font-size: 16px; color: black"
					class="next-icon" href="notice?pageNo=${pager.endPageNo+1}"
					aria-label="Next"> <i class="bi bi-caret-right"></i>
				</a></li>
			</c:if>
			<li class="page-icon"><a
				style="border-style: none; font-size: 16px; color: black"
				class="next-icon" href="notice?pageNo=${pager.totalPageNo}"
				aria-label="last"><i class="bi bi-caret-right"></i> </a></li>

		</ol>
	</div>

	<div class="searchType d-flex" id="searchType">
		<select class="search-select" name="search-select" style="height: 35px">
			<option selected value="stitle">제목</option>
			<option value="scontent">내용</option>
		</select>
		<input 
		type="text" id="inputSearch" name="inputSearch" placeholder="검색어를 입력해 주세요">
		<button type="submit" class="btn_submit btn btn-dark btn-sm">검색</button>
	</div>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>

</body>
</html>
