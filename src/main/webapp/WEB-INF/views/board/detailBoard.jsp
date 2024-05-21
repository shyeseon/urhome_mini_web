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
	href="${pageContext.request.contextPath}/resources/css/board/detailBoard.css"
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
<body class="pt-5">
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div class="d-flex" style="font-size: 25px; margin-top: 100px">
		<a
			style="color: black; margin: 0px 30px 0px 150px; text-decoration: none;"
			href="${pageContext.request.contextPath}/board/notice"><</a>
		<div class="boardTitle" style="text-align: left; font-weight: bold;">공지사항</div>
	</div>

	<div class="detailBoard-body">
		<div class="inputBnumber"
			style="text-align: right; margin-right: 20px">no.
			${board.bnumber}</div>

		<p style="font-size: 27px; font-weight: bold; margin-top: 120px">${board.btitle}</p>
		<div class="d-flex" style="font-size: 12px">
			작성일:
			<fmt:formatDate value="${board.bdate}" pattern="yyyy-MM-dd" />
			<p style="margin-left: 10px">조회수: ${board.bhitcount}</p>
		</div>
		<hr />
		<c:if test="${board.battachoname!=null}">
			<div class="mt-5 d-flex" style="justify-content: center;">
				<img src="attachDownload?bnumber=${board.bnumber}" width="500"
					height="550">
			</div>
		</c:if>
		<textarea id="bcontent" readonly>${board.bcontent}</textarea>
		<ul class="altPage">
		<li class="next_display">
		<span style="font-weight: bold;">< next</span>
			<a class="nextTitle" 
				href="${pageContext.request.contextPath}/board/detailBoard?bnumber=${npage.bnumber}">
					${npage.btitle}</a>
			<li class="prev_display">
			<a class="prevTitle" 
				href="${pageContext.request.contextPath}/board/detailBoard?bnumber=${ppage.bnumber}">
					${ppage.btitle}</a>
			<span style="font-weight: bold;">prev ></span>
			
		</ul>
		<div style="text-align: center;">
			<a style="margin:50px 0px 50px 0px;" href="notice" class="btn_detailBoard btn btn-lg">목록 </a>
		</div>
	</div>
</body>
</html>