
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--jstl를 사용하기 위해 사용해야하는 부분 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--jstl 함수를 사용하기 위해 사용해야하는 부분  -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>우리집, 회원가입</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link
	href="${pageContext.request.contextPath}/resources/css/order/orderForm.css"
	rel="stylesheet">

<!-- jquery -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<!-- kakao address api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- user script-->
<script
	src="${pageContext.request.contextPath}/resources/js/order/orderForm.js"></script>
</head>

<body class="pt-5">
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div class="mt-3 mb-3 container py-4">
		<div class="mt-5 mb-5" id="orderFormTag">
			<h2>주문서 작성</h2>
		</div>
		<div class="d-flex">
			<div id="orderFormDiv">
				<form action="order" id="orderForm"
					name="orderForm" onsubmit="orderFormCheckData()" method="post"
					class="validation-form" novalidate>
					<div>
						<div>
							<h5>주문 정보</h5>
						</div>
						<div class="form-group mt-4">
							<label class="form-label">주문자</label> <input type="text"
								class="form-control" onchange="isRightName('oname')" id="oname" name="oname" value="${member.mname}">
							<span class="form-text" id="onameSpan">&nbsp;</span>
						</div>
						<div class="form-group mt-2">
							<label class="form-label">이메일</label> <input type="email"
								class="form-control" onchange="isRightEmail()" id="oemail"
								name="oemail" value="${member.memail}"> <span class="form-text" id="emailSpan">&nbsp;</span>
						</div>
						<div class="mt-2">
							<label class="form-label align-middle">휴대전화</label>
							<div class="d-flex">
								<div>
									<span> <select class="form-select" id="ophone1"
										name="ophone1">
											<option <c:if test="${mphone[0] == 010}">selected</c:if>>010</option>
											<option <c:if test="${mphone[0] == 011}">selected</c:if>>011</option>
									</select>
									</span>
								</div>

								<div>
									<span><input type="text" class="form-control"
										onchange="isRightCellPhone('ophone1')" id="ophone2"
										name="ophone2" value="${mphone[1]}"></span>
								</div>
								<div>
									<span><input type="text" class="form-control"
										onchange="isRightCellPhone('ophone1')" id="ophone3"
										name="ophone3" value="${mphone[2]}"></span>
								</div>
							</div>
							<span class="form-text" id="ophoneSpan">&nbsp;</span>
						</div>
						<div class="mt-2">
							<label class="form-label">주소</label>
							<div class="d-flex">
								<span><input type="text" class="form-control mb-2"
									id="ozip" name="ozip" placeholder="우편번호" readonly value="${member.mzip}"></span>
								<span><input type="button" id="addressBtn" onclick="daumPostcode('o')"
									name="addressBtn" value="우편번호"
									class="btn btn-outline-secondary btn-sm ms-1 mt-1"></span>
							</div>
							<div>
								<span><input type="text" class="form-control mb-2"
									id="oaddress" name="oaddress" placeholder="기본 주소" readonly value="${member.maddress}"></span>
							</div>
							<div>
								<span><input type="text" class="form-control"
									id="odetailAddress" name="odetailAddress" placeholder="나머지 주소" value="${member.mdetailAddress}"></span>
							</div>
						</div>
					</div>
					<div class="mt-4">
						
						<div>
							<h5>배송지</h5>
						</div>
						 <!-- 배송지 정보 버튼 그룹 -->
						<div class="mt-3 d-flex">
						    <!-- 주문자 정보와 동일 라디오 버튼 -->
						    <div class="me-3">
						        <label class="btn">
						            <input type="radio" name="deliveryOption" onclick="fillDeliveryInfo()"> 주문자와 정보 동일
						        </label>
						    </div>
						    <!-- 배송지 정보 초기화 라디오 버튼 -->
						    <div>
						        <label class="btn">
						            <input type="radio" name="deliveryOption" onclick="clearDeliveryInfo()"> 배송지 정보 초기화
						        </label>
						    </div>
						</div>
						<div class="form-group mt-4">
							<label class="form-label">받는사람</label> <input type="text"
								class="form-control" onchange="isRightName('rname')" id="rname" name="rname">
							<span class="form-text" id="rnameSpan">&nbsp;</span>
						</div>
						<div class="mt-2">
							<label class="form-label align-middle">휴대전화</label>
							<div class="d-flex">
								<div>
									<span> <select class="form-select" id="rphone1"
										name="rphone1">
											<option>010</option>
											<option>011</option>
									</select>
									</span>
								</div>
								<div>
									<span><input type="text" class="form-control"
										onchange="isRightCellPhone('rphone2')" id="rphone2"
										name="rphone2"></span>
								</div>
								<div>
									<span><input type="text" class="form-control"
										onchange="isRightCellPhone('rphone2')" id="rphone3"
										name="rphone3"></span>
								</div>
							</div>
							<span class="form-text" id="rphoneSpan">&nbsp;</span>
						</div>
						<div class="mt-2">
							<label class="form-label">주소</label>
							<div class="d-flex">
								<span><input type="text" class="form-control mb-2"
									id="rzip" name="rzip" placeholder="우편번호" readonly></span>
								<span><input type="button" id="addressBtn" onclick="daumPostcode('r')"
									name="addressBtn" value="우편번호"
									class="btn btn-outline-secondary btn-sm ms-1 mt-1"></span>
							</div>
							<div>
								<span><input type="text" class="form-control mb-2"
									id="raddress" name="raddress" placeholder="기본 주소" readonly></span>
							</div>
							<div>
								<span><input type="text" class="form-control"
									id="rdetailAddress" name="rdetailAddress" placeholder="나머지 주소"></span>
							</div>
						</div>
					</div>
					<div class="mt-4">
						<div>
							<h5>결제 수단</h5>
						</div>
						<div>
							<label class="mt-2 me-auto">결제 수단 선택</label>
							<div class="mt-2" >
								<button type="button" id="bank" name="paymentBtn" onclick="changeBtn('bank')">
									<img class="grayscale"
										src="${pageContext.request.contextPath}/resources/image/order/ico_bank.gif">
								</button>
								<button type="button" id="card" name="paymentBtn" onclick="changeBtn('card')">
									<img class="grayscale"
										src="${pageContext.request.contextPath}/resources/image/order/ico_card.gif">
								</button>
								<button type="button" id="kakaopay" name="paymentBtn" onclick="changeBtn('kakaopay')">
									<img class="grayscale"
										src="${pageContext.request.contextPath}/resources/image/order/ico_kakaopay.gif">
								</button>
								<button type="button" id="mobile" name="paymentBtn" onclick="changeBtn('mobile')">
									<img class="grayscale"
										src="${pageContext.request.contextPath}/resources/image/order/ico_mobile.gif">
								</button>
								<button type="button" id="realtime" name="paymentBtn" onclick="changeBtn('realtime')">
									<img class="grayscale"
										src="${pageContext.request.contextPath}/resources/image/order/ico_realtime.gif">
								</button>
							</div>
						</div>
					</div>
					<div class="mt-4">
						<div class="form-check mb-2">
							<input class="form-check-input" type="checkbox" value=""
								id="checkAll" name="checkAll">
							<label class="form-check-label" for="checkAll"> 모든 약관 동의
							</label>
						</div>
						<div class="form-check mb-2">
							<input class="form-check-input" type="checkbox" value=""
								id="check1" name="check"> <label
								class="form-check-label" for="check1"> 쇼핑몰 이용약관 동의(필수) </label>
						</div>
						<div class="form-check mb-2">
							<input class="form-check-input" type="checkbox" value=""
								id="check2" name="check"> <label
								class="form-check-label" for="check2"> 개인정보 수집 및 이용
								동의(필수) </label>
						</div>
						<span class="form-text" id="checkSpan">&nbsp;</span>
					</div>
					<div class="mb-2" style="text-align: center;">
						<h5>주문 내용을 확인하였으며 약관에 동의합니다.</h5>
					</div>
					<div class="mt-2 d-grid">
						<button id="pay" type="button" class="btn btn-primary">결제하기</button>
					</div>
				</form>
			</div>
			<div class="flex-column ms-4" id="orderProductDiv">
				<div style="width: 500px;">
					<div>
						<h5>주문상품</h5>
					</div>
					<div id="products" class="container">
						 <c:forEach items="${orderItemList}" var="orderItem">
						 	<input type="hidden" value="${orderItem.pid}"/>
               			 <!-- 각 카트 아이템에 대한 정보를 출력합니다 -->	                		
								<div class="d-flex mb-4">							
									<div class="me-1">
										<a href="">
									<img src="../product/productImageDownload?pid=${orderItem.pid}&index=1&pthumbBodyType=thumb"
											width="90px" height="90px" class="rounded-3"></a>
									</div>
									<div class="description" style="text-align:left;">
										<strong>
											<c:set var="pname" value="${orderItem.pname}"/>
											<c:choose>
									            <c:when test="${fn:length(pname) > 10}">
									                ${fn:substring(pname, 0, 10)}...
									            </c:when>
									            <c:otherwise>
									                ${orderItem.pname}
									            </c:otherwise>
									        </c:choose>
								        </strong>
								        <div class="d-flex">
											<p>수량: </p><p class="pbuyAmount">${orderItem.pbuyAmount}</p><p>개</p>
										</div>
										<div class="d-flex">
											<p class="ptotalPrice">${orderItem.pbuyAmount*orderItem.pprice}</p><p>원</p>
										</div>
									</div>
								</div>							
            			</c:forEach>
					</div>
				</div>
				<div class="mb-3">
					<div>
						<h5>결제 정보</h5>
					</div>
					<div class="d-flex">
						<span class="me-auto">주문 상품</span> <strong id="totalprice"></strong>
					</div>
					<div class="d-flex">
						<span class="me-auto">배송비</span> <strong id="deliveryFee"></strong>
					</div>
				</div>
				<div>
					<div class="d-flex text-bg-light" id="totalPrice">
						<h5 class="me-auto">최종 결제 금액</h5>
						<strong id="totalPayment"></strong>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	
<script>
    // 주문 상품 가격의 합계를 저장할 변수
    var totalPrice = 0;

    // 주문 상품 목록을 순회하면서 각 상품 가격을 totalPrice에 더함
    <c:forEach items="${orderItemList}" var="orderItem">
        // 각 주문 상품의 가격과 수량을 JavaScript 변수에 저장
        var quantity = ${orderItem.pbuyAmount};
        var price = ${orderItem.pprice};

        // 각 상품 가격을 totalPrice에 더함
        totalPrice += quantity * price;
    </c:forEach>
    $('#totalprice').html(totalPrice+'원');
    
 	// 배송비 계산
    var deliveryFee = totalPrice < 50000 ? 3000 : 0;

    // 총 결제 금액 계산
    var totalPayment = totalPrice + deliveryFee;

    // HTML 요소에 총 결제 금액 값을 할당하여 화면에 표시
    $('#deliveryFee').html(deliveryFee + '원');
    $('#totalPayment').html(totalPayment + '원');
</script>
</body>
</html>