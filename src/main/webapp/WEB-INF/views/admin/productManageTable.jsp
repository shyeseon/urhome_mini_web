<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script
	src="${pageContext.request.contextPath}/resources/js/admin/productManageView.js"></script>

<table class="table table-bordered table-hover"
						id="productInfoTable">
	<button class="btn btn-sm mb-2 me-2 border" id="sortByCategory">카테고리 정렬</button>
	<button class="btn btn-sm mb-2 me-2 border" id="sortByPrice">가격 정렬</button>
	<button class="btn btn-sm mb-2 border" id="sortBySellAmount">판매량 정렬</button>						
	<thead class="table-secondary">
	<thead class="table-secondary">
		<tr>
			<th scope="col">상품 번호</th>
			<th scope="col">상품 이미지</th>
			<th scope="col">상품명</th>
			<th scope="col">카테고리</th>
			<th scope="col">배너</th>
			<th scope="col">가격</th>
			<th scope="col">재고</th>
			<th scope="col">판매량</th>
			<th scope="col">판매 금액</th>
			<th scope="col">추가 날짜</th>
			<th></th>
			<th></th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="product" items="${productList}">
				<tr>
					<td>${product.pid}</td>
					<td><img
						src="productImageDownload?pid=${product.pid}&index=1&pthumbBodyType=thumb"
						width="90px" height="90px"></td>
					<td>
						${product.pname}
					</td>
					<td>${product.pcategoryName}</td>
					<td>${product.pbanner}</td>
					<td>${product.pprice}</td>
					<td>${product.pstock}</td>
					<td>${product.psellAmount}</td>
					<td>${product.psales}</td>
					<td><fmt:formatDate value="${product.pdate}" pattern="yyyy-MM-dd" /></td>
					<td><a href="productUpdateView?pid=${product.pid}"
						id="updateProductInfo" class="btn btn-dark btn-sm">수정</a>
					</td>
					<td>
						<c:if test="${product.pstatus=='Y'}">
							<button id="${product.pid}" class="btn btn-danger btn-sm disableProduct" value="N">비활성화</button>
						</c:if>
						<c:if test="${product.pstatus=='N'}">
							<button id="${product.pid}" class="btn btn-primary btn-sm disableProduct" value="Y">활성화</button>
						</c:if>
					</td>
				</tr>
		</c:forEach>
	</tbody>
</table>
<div class="d-flex justify-content-between">
	<nav class="ms-auto me-auto" aria-label="">
		<ul class="pagination pagination-sm">
			<c:if test="${pager.groupNo>1}">
				<li class="page-item"><a class="page-link"  href="javascript:void(0);" onclick="ajaxTable(1); return false;"><<</a></li>
				<li class="page-item"><a class="page-link"  href="javascript:void(0);" onclick="ajaxTable(${pager.startPageNo-1}); return false;"><</a></li>
			</c:if>
			<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
				<li class="page-item">
				<a class="page-link ${pager.pageNo==i ?'active':''}" href="javascript:void(0);" onclick="ajaxTable(${i}); return false;">${i}</a></li>
			</c:forEach>
			<c:if test="${pager.groupNo<pager.totalGroupNo}">
				<li class="page-item"><a class="page-link" href="javascript:void(0);" onclick="ajaxTable(${pager.endPageNo+1}); return false;">></a></li>
				<li class="page-item"><a class="page-link" href="javascript:void(0);" onclick="ajaxTable(${pager.totalPageNo}); return false;">>></a></li>
			</c:if>
		</ul>
	</nav>
	<a href="addProductInfoView" class="btn btn-info"
		id="addProductInfoView">추가</a>
</div>
