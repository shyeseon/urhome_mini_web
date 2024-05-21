<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link href="${pageContext.request.contextPath }/resources/css/cart.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- jquery 외부라이브러리 설정 -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/cart.js"></script>


<script>
	
</script>


</head>


<body class="pt-5">
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
		<div class="modal" id="selectOrder" >
		  <div class="modal-dialog modal-dialog-centered" style="width:280px; height:250px;">
		    <div class="modal-content">
		      <div class="modal-header border-0">
		        <div class="modal-title d-flex" style="text-align: center; display: none;"></div>
		      </div>
		      <div class="modal-body  border-0 p-0" style="text-align: center;">
		      	<i class="fas fa-solid fa-cart-plus text-black" style=" font-size: 3rem; margin-bottom: 20px;"></i>
		        <p style="text-align:center ;font-size: 15px">선택된 상품이 없습니다.</p>
		      </div>
		      <div class="modal-footer  border-0 " style="justify-content: center;">
		        <button type="button" class="btn btn-dark btn-sm" data-bs-dismiss="modal" aria-label="Close">확인</button>
		      </div>
		    </div>
		  </div>
		</div>
	<!-- bootstrap의 grid를 이용해 전체 가로비율을 2:8:2로 지정  -->
	<div class="row">
		<div class="col-2"></div>

		<div class="col-8 ms-0">
			<h2 class="cart-title " style="text-align:center">장바구니</h2>


			<div class="totalCheck ms-3">
				<div class="pt-5 mb-2" style="font-size: 15px">장바구니에 담긴 상품은
					30일 동안 보관됩니다.</div>
			</div>
			<div class="border-bottom">
				<div class="d-flex mb-2">
					<input class="col-2 form-check-input" style="margin-right: 30px"
						type="checkbox" value="" id="checkAll">
					<div class="col-4" style="margin-left: 160px">상품정보</div>
					<div class="col-2 " style="margin-left: 30px">배송정보</div>
					<div class="col-2 " style="margin-left: 5px">상품금액</div>
					<div class="col-2 " style="margin-left: 20px">선택</div>
				</div>
			</div>
			<div class="shopping-cart-layout">
				<!-- 장바구니  목록을 보여준다 -->
				<ul class="list-unstyled">
					<c:forEach var="cartItem" items="${cartItem}" varStatus="index">
						<li class="cart-items" id="${cartItem.pid}">
							<div class="d-flex">
								<div class=" col-2">
									<input class="form-check-input" type="checkbox"
										name="order-checkbox" value="">
									<img
										src="../product/productImageDownload?pid=${cartItem.pid}&index=1&pthumbBodyType=thumb"
										width="100px">
								</div>

								<div class="cart-item-info col-4">
									
									<p class=cart-item-name id="pname"><strong>${cartItem.pname}</strong></p>
									<c:forEach var="poptions" items="${productOption}">
										<div id="option"
											style="margin-top: 20px; margin-bottom: 20px;">
											<label class="form-label">${poptions.key}</label>
											<select name="color" class="form-control">
												<option selected value="select">- [필수] 옵션을 선택해 주세요.
													-</option>
												<option value="vertical">------------------</option>
												<c:forEach var="poption" items="${poptions.value}">
													<option value="${poption}">${poption}</option>
												</c:forEach>
											</select>
										</div>
									</c:forEach>
									<div class="d-flex">
									<p class="mt-2 mb-1">상품 가격: </p>
									<p class="cartItemPrice mt-2 mb-1 ms-2" id="pprice${cartItem.pid}"> ${cartItem.pprice}</p>
									<p class="mt-2 mb-1" >원</p>
									</div>
									<div class="d-flex">
										<input name="pstock" type="hidden" value="${cartItem.pstock}">
										<input name="pid" type="hidden" value="${cartItem.pid}">
										<button class="minus btn btn-dark btn-sm" >-</button>
										<input class="cart-number" name="pbuyAmount" type="number"
											id="pbuyAmount${cartItem.pid}" value="${cartItem.pbuyAmount}">
										<button class="plus btn btn-dark btn-sm" >+</button>
									</div>

								</div>

								<div class="arrive-info col-2 d-flex"
									style="align-items: center">
									<div>3,000원 조건 /기본배송</div>
								</div>
								<div class="price-info col-2 d-flex" style="align-items: center">
									<div id="ptPrice${cartItem.pid}" class="ptPrice" style="margin-left: 60px;text-align:right;">${cartItem.pbuyAmount*cartItem.pprice}</div>
								</div>
								<div class="row option-info col-2">
									<button type="button" class="btn btn-dark btn-sm m-1"
										style="height: 35px;">관심상품</button>

									<button id="deleteBtn" onclick="removeCart('${cartItem.pid}')"
										class="btn btn-dark btn-sm m-1" style="height: 35px;">삭제</button>

								</div>
							</div>
							<hr>
						</li>
					</c:forEach>

				</ul>
			</div>

			<div class="cartTprice d-flex " style="align-items: center">
				<div class="d-flex" style=" align-items: center; margin:auto auto;" >
				<P class="ms-2 me-2" id="totalPrice"><strong style="font-size: 19px">0</strong></P> 
				<P class="ms-2 me-2" style="font-size: 17px">+</P>  	
				<P class="ms-2" style="font-size: 17px"> (배송비)</P>
				<P class="ms-2" id="deliveryFee" ><strong style="font-size: 19px">0</strong></P> 
				<P class="ms-2" style="font-size: 17px">=</P> 
				<P class="ms-2" id="totalCartPrice"><strong style="font-size: 19px">0</strong></P> 
				<P class="ms-2" style="font-size: 17px">원</P> 
				</div>
			</div>
			<div class="final-order">
				<a href="javascript:void(0);" onclick="getSelectCartOrder()" class="btn btn-secondary btn-md ">선택상품
					주문</a>
				<a class="AllProdcut_order btn btn-dark btn-md ">전체상품 주문</a>
			</div>
		</div>
		<div class="col-2"></div>
	</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
<script>
</script>
</html>