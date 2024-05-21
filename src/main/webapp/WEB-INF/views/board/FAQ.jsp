<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/board/FAQ.css"
	rel="stylesheet">


<!-- 사용자 정의 자바스크립트 -->
<script>
	
</script>
</head>
<body class="pt-5">
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<h3 class="qTitle">자주 묻는 질문</h3>
	<div style="background-color: #f6f6f6">
		<div class="qna-hour pt-5">
			<p style="font-size: 18px">평일 : 10:00 - 16:00</p>
			<p style="font-size: 18px">점심 : 11:50 ~ 13:00</p>
		</div>
		<div class="customer_header m-5 pb-5">
			<div class="me-5" style="font-size: 15px">
				<i class="bi bi-telephone" style="font-size: 60px"></i>
				<h5 style="font-weight: bold;">전화 상담</h5>
				<p>1668-2513</p>
			</div>

			<div class="ms-5" style="font-size: 15px">
				<i class="bi bi-phone" style="font-size: 60px"></i>
				<h5 style="font-weight: bold;">카카오톡 상담</h5>
				<p>pf.kakao.com/_WLdGK</p>
			</div>
		</div>
	</div>

	<form action="#" style="margin-top:100px; margin-bottom: 100px">
		<div class="search mb-5 d-flex">
			<select id="searchKey" name="seachKey">
				<option id="keySubject" value="subject">제목</option>
				<option id="keyContent" value="content">내용</option>
				<option id="keywirter" value="writer">글쓴이</option>
			</select> 
			<input style="width:300px" id="inputSearch" type="text" placeholder="궁금하신 부분을  검색해 보세요"
				value="" />
			<button type="submit" class="btn btn-light btn-sm">검색</button>
		</div>
	</form>
	<div class="accordion " style="margin-bottom:100px" id="accordionQNA">
		<div class="accordion-item">
			<h2 class="accordion-header" id="flush-headingOne">
				<button class="accordion-button collapsed" type="button"
					data-bs-toggle="collapse" data-bs-target="#collapseOne"
					aria-expanded="false" aria-controls="collapseOne">[회원
					혜택]쓰임 쇼핑몰은 회원만 주문할 수 있나요?</button>
			</h2>
			<div id="collapseOne" class="accordion-collapse collapse "  aria-labelledby="flush-headingOne"
				data-bs-parent="#accordionExample">
				<div class="accordion-body">
					<pre>
					
아닙니다. 비회원으로도 주문하실수 있습니다. 
하지만 여러모로 회원가입 후 주문을 하신다면 많은 할인해택과 편리한 주문시스템을 더욱 원활히 이용하실수 있습니다. 
또한 현재 신규회원 가입 이벤트로 즉시 사용가능한 적립금을 드리고 구매후에는 할인쿠폰 등 다양한 혜택을 드리오니
회원가입후 구매하시면 좋습니다.
               </pre>
				</div>

			</div>
		</div>
		<div class="accordion-item">
			<div class="accordion-header" id="flush-headingTwo">
				<button class="accordion-button collapsed" type="button"
					data-bs-toggle="collapse" data-bs-target="#collapseTwo"
					aria-expanded="false" aria-controls="collapseTwo">
					[쿠폰/포인트]쓰임 포인트는 어떻게 사용하나요?</button>
			</div>
			<div id="collapseTwo" class="accordion-collapse collapse"  aria-labelledby="flush-headingTwo"
				data-bs-parent="#accordionExample">
				<div class="accordion-body">
					<pre>
					
- 적립금은 상품배송완료후 즉시 받으실 수 있습니다. 
- 적립금은 10원 단위로 현금처럼 사용하실 수 있습니다. 
- 적립금으로 타 결제수단과 할인쿠폰 등의 복합결제가 가능합니다.
				</pre>

				</div>
			</div>
		</div>
		<div class="accordion-item">
			<div class="accordion-header" id="flush-headingThree">
				<button class="accordion-button collapsed" type="button"
					data-bs-toggle="collapse" data-bs-target="#collapseThree" 
					aria-expanded="false" aria-controls="collapseThree">
					[배송/취소]배송비는 얼마인가요?</button>
			</div>
			<div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingThree"
				data-bs-parent="#accordionExample">
				<div class="accordion-body">
					<pre>
					
주문상품의 총액이 5만원미만 결제시 3,000원의 배송비가별도로 부과됩니다. 
주문상품의 총액이 5만원이상 결제시에는 무료입니다.
** 프로모션에 따라 상품 별 상이 할 수 있으므로, 상품상세 배송비 안내 혹은 주문서 작성 시 확인 부탁드립니다 ^^!
					</pre>
				</div>
			</div>
		</div>
		<div class="accordion-item">
			<div class="accordion-header" id="flush-headingFour">
				<button class="accordion-button collapsed" type="button"
					data-bs-toggle="collapse" data-bs-target="#collapseFour"  
					aria-expanded="false" aria-controls="collapseFour">
					[결제/주문]카드 결제시 할부가 가능한가요?</button>
			</div>
			<div id="collapseFour" class="accordion-collapse collapse"  aria-labelledby="flush-headingFour"
				data-bs-parent="#accordionExample">
				<div class="accordion-body">
					<pre>
5만원 이상 구매하신 고객님들에 한하여 할부결제가 가능합니다.
특정 기간 동안의 무이자 행사를 제외한 할부수수료는 해당 카드회사의 규정에 의해 고객님께서 지불하셔야 합니다.
					</pre>
				</div>
			</div>
		</div>
				<div class="accordion-item">
			<div class="accordion-header" id="flush-headingFive">
				<button class="accordion-button collapsed" type="button"
					data-bs-toggle="collapse" data-bs-target="#collapseFive"  
					aria-expanded="false" aria-controls="collapseFive">
					[결제/주문]세금 계산서를 받고 싶어요</button>
			</div>
			<div id="collapseFive" class="accordion-collapse collapse"  aria-labelledby="flush-headingFive"
				data-bs-parent="#accordionExample">
				<div class="accordion-body">
					<pre>
세금계산서 교부 의무의 면제 등 부가가치세법 시행령 제32조의 2 제 1항 규정에 의거
상품 구매 후 신용카드로 결제하셨거나 현금 결제 후 지출증빙용 현금영수증을 신청하신 경우 세금계산서 발급이 제한됩니다.

사업자이신 고객님께서 부가가치세 매입공제를 적용받으시려는 경우,
신용카드전표 또는 지출증빙용 현금영수증으로 세금계산서를 대신할 수 있으며, 영수증과 세금계산서의 중복 발행은 불가합니다.
현금결제(실시간계좌이체, 무통장결제)로 주문하실 때 현금영수증을 신청하지 않으셨다면,
'My쓰임>증빙서류발급' 조회에서 현금영수증(지출증빙용)을 신청하시기 바랍니다.

 

대량구매에 따른 세금계산서 발행은 별도로 서비스센터로 전화주시면 발급해드리도록 하겠습니다.

(070-7795-8303, 사업자등록증 보내실 FAX 02-711-7524)

지출증비용 현금영수증을 신청하신 후 국세청 현금영수증 홈페이지에서 (http://www.taxsave.go.kr)
사업자번호로 회원 가입 하신 후 확인하실 수 있으며 상세한 내용은 현금영수증 홈페이지를 참조해주시기 바랍니다
					</pre>
				</div>
			</div>
		</div>
				<div class="accordion-item">
			<div class="accordion-header" id="flush-headingSix">
				<button class="accordion-button collapsed" type="button"
					data-bs-toggle="collapse" data-bs-target="#collapseSix"  
					aria-expanded="false" aria-controls="collapseSix">
					[배송/취소]주문 후 배송 상태를 어떻게 알 수 있나요?</button>
			</div>
			<div id="collapseSix" class="accordion-collapse collapse"  aria-labelledby="flush-headingSix"
				data-bs-parent="#accordionExample">
				<div class="accordion-body">
					<pre>

고객께서 주문하신 상품의 배송상태는 화면 상단의 [MYPAGE]에서 확인하실 수 있습니다.
주문상태별 주문의 진행현황은 다음과 같습니다.

-입금대기 : 무통장입금 입금확인 전
-상품준비 : 결재확인 후 주문접수 진행 중
-배송준비중 :  재고확인 후 상품포장 준비 및 택배 출고이전 단계
-배송중 : 택배로 상품이 인계되어 배송진행 중인 단계 (실시간 배송조회가 가능합니다)

-배송완료 : 고객님께 배송완료 후 완료
					</pre>
				</div>
			</div>
		</div>
				<div class="accordion-item">
			<div class="accordion-header" id="flush-headingSeven">
				<button class="accordion-button collapsed" type="button"
					data-bs-toggle="collapse" data-bs-target="#collapseSeven"  
					aria-expanded="false" aria-controls="collapseSeven">
					[배송/취소] 주문 후 배송지주소를 바꾸려면 어떻게 해야하나요?</button>
			</div>
			<div id="collapseSeven" class="accordion-collapse collapse"  aria-labelledby="flush-headingSeven"
				data-bs-parent="#accordionExample">
				<div class="accordion-body">
					<pre>
이미 주문을 완료하신 후 배송지 주소를 변경하실 경우 주문 진행 상태에 따라 처리가 달라질 수 있습니다. 

MYPAGE>주문/배송조회 내역의 주문상태 중 [주문접수], [결제완료], [상품준비중] 단계에서는 
전화문의(1668-2513)를 통해 변경하실 수 있습니다. 

단, [배송]일 경우에는 이미 포장이 완료되어 택배사로 전달된 후 이기때문에 배송지 변경이 불가합니다. 
					</pre>
				</div>
			</div>
		</div>
	</div>
	<div aria-label="page-trans">
		<ol class=" d-flex align-items-center pagination"
			style="margin-bottom: 150px; justify-content: center">
			<li class="page-icon">
			<a
				style="border-style: none; font-size: 16px; color:black" class="previous-icon"
				href="#" aria-label="Previous"><i class="bi bi-caret-left" ></i>
			</a></li> 
			<li class="page-num"><a
				style="border-style: none; font-size: 16px; color:black" class="page-link"
				href="#">1</a></li>
			<li class="page-num"><a
				style="border-style: none; font-size: 16px; color:black" class="page-link"
				href="#">2</a></li>
			<li class="page-icon"><a
				style="border-style: none; font-size: 16px; color:black" class="page-link"
				href="#">3</a></li>
			<li class="page-item"><a
				style="border-style: none; font-size: 16px; color:black" class="next-icon"
				href="#" aria-label="Next"><i class="bi bi-caret-right"></i>
			</a></li>

		</ol>
	</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>