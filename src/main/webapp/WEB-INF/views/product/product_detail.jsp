<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstrap 5를 위한 외부 라이브러리 설정 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- jQuery 외부 라이브러리 설정 -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/product/product_detail.js"></script>
<!-- Font Awesome CSS CDN -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
<script
	src="${pageContext.request.contextPath}/resources/js/boardProduct/reviewListForm.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/boardProduct/qnaListForm.js"></script>

<script>
	
</script>

</head>

<!-- css 적용 -->
<link
	href="${pageContext.request.contextPath}/resources/css/product/product_detail.css"
	rel="stylesheet">

<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div class="modal" id="addCartModal">
		<div class="modal-dialog modal-dialog-centered"
			style="width: 320px; height: 250px;">
			<div class="modal-content">
				<div class="modal-header border-0">
					<div class="modal-title d-flex"
						style="text-align: center; display: none;"></div>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body  border-0 p-0" style="text-align: center;">
					<i class="fas fa-solid fa-cart-plus text-black"
						style="font-size: 3rem; margin-bottom: 20px;"></i>
					<p style="text-align: center; font-size: 16px">상품이 장바구니에
						추가되었습니다.</p>
				</div>
				<div class="modal-footer  border-0 "
					style="justify-content: center;">
					<button
						onclick="location.href='${pageContext.request.contextPath}/cart/cartView'"
						type="button" class="btn btn-outline-dark btn-sm"
						data-bs-dismiss="modal">장바구니 이동</button>
					<button type="button" class="shopping btn btn-outline-dark btn-sm"
						data-bs-dismiss="modal">쇼핑 계속하기</button>
				</div>
			</div>
		</div>
	</div>
	<div class="product-detail-div" style="margin-top: 40px;">
		<!-- 상품 상세 페이지 상단 -->
		<div class="product-detail-top d-flex">
			<!-- 이미지 -->
			<div class="image-box" style="flex: 1; text-align: center;">
				<div id="carouselExampleControlsNoTouching" class="carousel slide"
					data-bs-touch="false">
					<div class="carousel-inner">
						<c:forEach var="i" begin="1" end="${thumbImageCount}">
							<div class="carousel-item ${i==1?'active':''}">
								<img id="key-product"
									src="productImageDownload?pid=${product.pid}&index=${i}&pthumbBodyType=thumb">
							</div>
						</c:forEach>
					</div>
				</div>
				<button class="carousel-control-btn-prev" type="button"
					data-bs-target="#carouselExampleControlsNoTouching"
					data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"
						style="margin-top: 3px; margin-right: 3px;"></span> <span
						class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-btn-next" type="button"
					data-bs-target="#carouselExampleControlsNoTouching"
					data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"
						style="margin-top: 3px; margin-left: 3px;"></span> <span
						class="visually-hidden">Next</span>
				</button>
			</div>



			<!-- 상품 정보 -->
			<div style="flex: 1;">
				<div class="text-box">
					<div id="info" style="margin-top: 80px;">
						<div id="pname">${product.pname}</div>
						<div id="pprice">${product.pprice}</div>
					</div>

					<div id="detail">
						<div class="d-flex" style="margin-top: 30px;">
							<p style="margin-right: 30px;">상품코드</p>
							<p id="pid">${product.pid}</p>
						</div>
						<div class="d-flex">
							<p style="margin-right: 45px;">배송비</p>
							<p>3000원(50,000원 이상 구매 시 무료)</p>
						</div>
						<div class="d-flex">
							<p style="margin-right: 45px;">브랜드</p>
							<p>우리집</p>
						</div>
					</div>
					<hr />

					<!-- 옵션 선택 -->
					<c:forEach var="poptions" items="${productOption}">
						<div id="option" style="margin-top: 20px; margin-bottom: 20px;">
							<label class="form-label">${poptions.key}</label> <select
								name="color" class="form-control">
								<option selected value="select">- [필수] 옵션을 선택해 주세요. -</option>
								<option value="vertical">------------------</option>
								<c:forEach var="poption" items="${poptions.value}">
									<option value="${poption}">${poption}</option>
								</c:forEach>
							</select>
						</div>
					</c:forEach>
					<div>
						<button class="minus btn btn-dark btn-sm">-</button>
						<input class=" cart-number" name="item2" value="1" id="pbuyAmount"
							style="width: 80px; text-align: center;">
						<button class="plus btn btn-dark btn-sm">+</button>
					</div>

					<hr />

					<!-- 총 상품금액 -->
					<div id="total">
						<div id="total-price" class="d-flex"
							style="justify-content: space-between; margin-bottom: 50px; font-size: 18px;">
							<p>
								<strong>총 상품금액</strong>
							</p>
							<div class="d-flex" style="font-size: 13px">
								<div id="totalPrice">${product.pprice}</div>
								<div>원</div>
							</div>
						</div>

						<!-- 버튼 -->
						<div class="d-flex">
							<button type="button" class="btn btn-lg product_btn me-1"
								style="border: solid 0.5px; flex: 1;">
								<img
									src="${pageContext.request.contextPath}/resources/image/star.png"
									width="27px;">
							</button>
							<c:if test="${product.pstock != 0 and product.pstatus == 'Y'}">
								<button type="button" class="btn btn-lg product_btn me-1"
									id="addCart" style="border: solid 0.5px; flex: 3;">
									장바구니</button>
								<button id="buyNow" type="button"
									class="btn btn-lg product_btn btn-dark me-1"
									style="border: solid 0.5px; flex: 3;">구매하기</button>
							</c:if>
							<c:if test="${product.pstock == 0 and product.pstatus == 'Y'}">
								<button type="button"
									class="btn btn-lg product_btn btn-dark me-1"
									style="border: solid 0.5px; flex: 3;" disabled>일시 품절된
									상품입니다.</button>
							</c:if>
							<c:if test="${product.pstatus == 'N'}">
								<button type="button"
									class="btn btn-lg product_btn btn-dark me-1"
									style="border: solid 0.5px; flex: 3;" disabled>현재 판매
									중지된 상품입니다.</button>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- tap 메뉴  -->
		<div id="tab-menu" style="margin-top: 150px;">
			<div class="tab">
				<ul class="tabnav">
					<li><a href="#tab01">상세정보</a></li>
					<li><a href="#tab02">구매안내</a></li>
					<li><a id="review" href="#tab03">구매후기</a></li>
					<li><a id="qna" href="#tab04">Q&A</a></li>
					<li><a href="#tab05">관련상품</a></li>
				</ul>
			</div>
		</div>
		<!-- 상세정보 -->
		<div class="tabcontent" style="height: 100%; margin-top: 100px;">
			<div id="tab01" style="text-align: center;">
				<c:forEach var="i" begin="1" end="${bodyImageCount}">
					<div style="position: relative;">
						<img alt="info"
							src="productImageDownload?pid=${product.pid}&index=${i}&pthumbBodyType=body"
							width="800px">
					</div>
				</c:forEach>
			</div>
		</div>
		<!-- 상세정보 -->

		<!-- 구매안내 -->
		<div class="tabcontent">
			<div id="tab02">
				<!-- 아코디언 -->
				<div class="accordion-item">
					<h2 class="accordion-header" style="margin-bottom: 20px;">
						<button class="accordion-button" type="button"
							data-bs-toggle="collapse" data-bs-target="#collapseOne"
							aria-expanded="true" aria-controls="collapseOne">결제</button>
					</h2>
					<div id="collapseOne" class="accordion-collapse collapse"
						data-bs-parent="#accordionExample">
						<div class="accordion-body" style="margin-bottom: 20px;">
							<div id="accordion-text" class="d-flex flex-column">
								<span>고액결제의 경우 안전을 위해 카드사에서 확인전화를 드릴 수도 있습니다. 확인과정에서 도난
									카드의 사용이나 타인 명의의 주문등 정상적인 주문이 아니라고 판단될 경우 임의로 주문을 보류 또는 취소할 수
									있습니다.</span> <span>무통장 입금은 상품 구매 대금은 PC뱅킹, 인터넷뱅킹, 텔레뱅킹 혹은 가까운
									은행에서 직접 입금하시면 됩니다.</span> <span>주문시 입력한 입금자명과 실제입금자의 성명이 반드시
									일치하여야 하며, 7일 이내로 입금을 하셔야 하며 입금되지 않은 주문은 자동취소 됩니다.</span>
							</div>
						</div>
					</div>
				</div>

				<hr />

				<div class="accordion-item">
					<h2 class="accordion-header" style="margin-bottom: 20px;">
						<button class="accordion-button collapsed" type="button"
							data-bs-toggle="collapse" data-bs-target="#collapseTwo"
							aria-expanded="false" aria-controls="collapseTwo">배송</button>
					</h2>
					<div id="collapseTwo" class="accordion-collapse collapse"
						data-bs-parent="#accordionExample">
						<div class="accordion-body d-flex flex-column" id="accordion-text">
							<span>배송 방법 : 택배</span> <span>배송 지역 : 전국지역</span> <span>배송
								비용 : 3,000원</span> <span>배송 기간 : 1일 ~ 3일</span> <span>배송 안내 : -
								산간벽지나 도서지방은 별도의 추가금액을 지불하셔야 하는 경우가 있습니다.</span> <span>고객님께서 주문하신
								상품은 입금 확인후 배송해 드립니다. 다만, 상품종류에 따라서 상품의 배송이 다소 지연될 수 있습니다.</span>
						</div>
					</div>
				</div>

				<hr />

				<div class="accordion-item">
					<h2 class="accordion-header" style="margin-bottom: 20px;">
						<button class="accordion-button collapsed" type="button"
							data-bs-toggle="collapse" data-bs-target="#collapseThree"
							aria-expanded="false" aria-controls="collapseThree">
							교환/반품</button>
					</h2>
					<div id="collapseThree" class="accordion-collapse collapse"
						data-bs-parent="#accordionExample">
						<div class="accordion-body d-flex flex-column" id="accordion-text">
							<strong>교환 및 반품이 가능한 경우</strong> <span>- 상품을 공급 받으신 날로부터
								7일이내 단, 가전제품의 경우 포장을 개봉하였거나 포장이 훼손되어 상품가치가 상실된 경우에는 교환/반품이
								불가능합니다.</span> <span>- 공급받으신 상품 및 용역의 내용이 표시.광고 내용과 다르거나 다르게 이행된
								경우에는 공급받은 날로부터 3월이내, 그사실을 알게 된 날로부터 30일이내</span> <strong>교환 및
								반품이 불가능한 경우</strong> <span>- 고객님의 책임 있는 사유로 상품등이 멸실 또는 훼손된 경우. 단,
								상품의 내용을 확인하기 위하여 포장 등을 훼손한 경우는 제외</span> <span>- 포장을 개봉하였거나 포장이
								훼손되어 상품가치가 상실된 경우 (예 : 가전제품, 식품, 음반 등, 단 액정화면이 부착된 노트북, LCD모니터,
								디지털 카메라 등의 불량화소에 따른 반품/교환은 제조사 기준에 따릅니다.</span> <span>- 고객님의 사용
								또는 일부 소비에 의하여 상품의 가치가 현저히 감소한 경우 단, 화장품등의 경우 시용제품을 제공한 경우에 한
								합니다.</span> <span>- 시간의 경과에 의하여 재판매가 곤란할 정도로 상품등의 가치가 현저히 감소한 경우</span>
							<span>- 복제가 가능한 상품등의 포장을 훼손한 경우 (자세한 내용은 고객만족센터 1:1
								E-MAIL상담을 이용해 주시기 바랍니다.)</span> ※ 고객님의 마음이 바뀌어 교환, 반품을 하실 경우 상품반송 비용은
							고객님께서 부담하셔야 합니다. (색상 교환, 사이즈 교환 등 포함)
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 구매 안내 -->

		<!-- REVIEW -->
		<div id="tabcontent03" class="tabcontent"
			style="margin-top: 100px; margin-bottom: 100px;"></div>
		<!-- Review -->

		<!-- QnA -->
		<div id="tabcontent04" class="tabcontent"
			style="margin-bottom: 100px;"></div>
		<!-- QnA -->
		<div class="tabcontent">
			<div id="tab05">
				<div id="relatedproduct">
					<div id="relatedproduct-title" style="margin-bottom: 10px;">관련상품</div>
					<div class="d-flex" id="relatedproduct-detail"
						style="margin-bottom: 50px;">
						<div id="relatedproduct-detail1" style="margin-right: 20px;">
							<img alt=""
								src="https://ssueim.com/web/product/medium/202304/95d9ef876f63d90403281c44a7f51b9a.jpg"
								width="200px;" style="border-radius: 10px; margin-bottom: 20px;">
							<div id="name" style="font-size: 14px;">데일리 빅머그 2p
								(5colors)</div>
							<div id="price">16,500원</div>
						</div>

						<div id="relatedproduct-detail2" style="margin-right: 20px;">
							<img alt=""
								src="https://ssueim.com/web/product/medium/201705/3889_shop1_482721.jpg"
								width="200px"
								; style="border-radius: 10px; margin-bottom: 20px;">
							<div id="name" style="font-size: 14px;">루이즈 에디션 머그 (핑크)</div>
							<div id="price">8,500원</div>
						</div>

						<div id="relatedproduct-detail3" style="margin-right: 20px;">
							<img alt=""
								src="https://ssueim.com/web/product/big/202207/fff205f05c28f519a6a765833eec68f7.jpg"
								width="200px"
								 style="border-radius: 10px; margin-bottom: 20px;">
							<div id="name" style="font-size: 14px;">어라운드 머그 (3color)</div>
							<div id="price">10,900원</div>
						</div>

					</div>
				</div>
			</div>
		</div>

	</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
<script>
	
</script>
</html>