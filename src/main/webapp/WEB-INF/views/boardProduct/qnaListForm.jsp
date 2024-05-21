<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script src="${pageContext.request.contextPath}/resources/js/boardProduct/qnaListForm.js"></script>

<div id="tab04">
	<div class="d-flex" id="review-top" style="justify-content: space-between;">
		<h5><strong>Q&A (${qnaCount})</strong></h5>
		<div>
		<button type="button" class="btn btn-sm" style="border: solid 0.5px;"
		onclick="location.href = '${pageContext.request.contextPath}/boardProduct/writeQnaForm?pid=${pid}'">질문등록</button>
	 	</div>
	</div>
	<hr/>
	<div id="reviews" style="color: gray;">
		<!-- 게시물 목록 -->
		<c:forEach var="boardProduct" items="${qnaList}">
			<div class="review">
		  		<div class="review-title me-1"><strong>${boardProduct.bptitle}</strong></div>
		  		<div class="review-content">
		  			<c:if test="${boardProduct.bpattachoname != null}">
		  				<img src="../boardProduct/boardProductImageDownload?bpnumber=${boardProduct.bpnumber}" width="80px" height="80px">
		  			</c:if>
		  			${boardProduct.bpcontent}
		  		</div>
		  		<div class="d-flex justify-content-between review-writer" style="color: gray;">
		  		 	<p class="mb-0">${boardProduct.mid} | <fmt:formatDate value="${boardProduct.bpdate}" pattern="yyyy.MM.dd"/></p>
	  		 	  <sec:authorize access="isAuthenticated()">
		  		 	  <sec:authentication var="mid" property="principal.username"/>
			  			<c:if test="${mid == boardProduct.mid or mid == 'admin'}">
				  			<div>
				  				<c:if test="${mid == boardProduct.mid}">
					  				<button onclick="location.href='../boardProduct/updateQnaForm?bpnumber=${boardProduct.bpnumber}'" class="btn btn-sm" style="border: solid 0.5px;">수정</button>
					  			</c:if>
					  			<button onclick="removeQna(${boardProduct.bpnumber}, '${pid}')" class="btn btn-sm" style="border: solid 0.5px;">삭제</button>
				  			</div>
			  			</c:if>
		  			</sec:authorize>
		  		</div>
		  	</div>
		  	<hr/>
	  	</c:forEach>
	  	
		<c:if test="${qnaCount == 0}">
		 등록된 게시물이 없습니다.
		 <hr>
		</c:if>
	</div>
	<!-- pagenation -->
	<c:if test="${qnaCount != 0 }">
		<div class="d-flex justify-content-between">
			<nav class="ms-auto me-auto" aria-label="">
				<ul class="pagination pagination-sm">
					<c:if test="${pager.groupNo>1}">
						<li class="page-item"><a class="page-link"  href="javascript:void(0);" onclick="getQnaPage('${pid}', 1); return false;"><<</a></li>
						<li class="page-item"><a class="page-link"  href="javascript:void(0);" onclick="getQnaPage('${pid}', ${pager.startPageNo-1}); return false;"><</a></li>
					</c:if>
					<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
						<li class="page-item">
						<a class="page-link ${pager.pageNo==i ?'active':''}" href="javascript:void(0);" onclick="getQnaPage('${pid}', ${i}); return false;">${i}</a></li>
					</c:forEach>
					<c:if test="${pager.groupNo<pager.totalGroupNo}">
						<li class="page-item"><a class="page-link" href="javascript:void(0);" onclick="getQnaPage('${pid}', ${pager.endPageNo+1}); return false;">></a></li>
						<li class="page-item"><a class="page-link" href="javascript:void(0);" onclick="getQnaPage('${pid}', ${pager.totalPageNo}); return false;">>></a></li>
					</c:if>
				</ul>
			</nav>
		</div>
	</c:if>
</div>